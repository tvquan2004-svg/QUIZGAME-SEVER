package com.qwik.security.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nimbusds.jose.JWSVerifier;
import com.nimbusds.jose.crypto.RSASSAVerifier;
import com.nimbusds.jose.jwk.JWK;
import com.nimbusds.jose.jwk.RSAKey;
import com.nimbusds.jwt.SignedJWT;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class AppleAuthService {

    @Value("${app.apple.bundle-id}")
    private String bundleId;

    private final ObjectMapper objectMapper = new ObjectMapper();

    @SuppressWarnings("unchecked")
    public String verifyIdentityToken(String identityToken) {
        try {
            SignedJWT signedJWT = SignedJWT.parse(identityToken);

            Map<String, Object> appleKeys = fetchApplePublicKeys();
            List<Map<String, Object>> keys = (List<Map<String, Object>>) appleKeys.get("keys");

            String kid = signedJWT.getHeader().getKeyID();
            Map<String, Object> matchingKey = keys.stream()
                    .filter(k -> kid.equals(k.get("kid")))
                    .findFirst()
                    .orElseThrow(() -> new IllegalArgumentException("No matching Apple key found"));

            JWK jwk = JWK.parse(matchingKey);
            if (!(jwk instanceof RSAKey rsaKey)) {
                throw new IllegalArgumentException("Key is not RSA");
            }

            JWSVerifier verifier = new RSASSAVerifier(rsaKey);
            if (!signedJWT.verify(verifier)) {
                throw new IllegalArgumentException("Identity token signature verification failed");
            }

            String subject = signedJWT.getJWTClaimsSet().getSubject();
            String audience = signedJWT.getJWTClaimsSet().getAudience().stream().findFirst().orElse("");

            if (!bundleId.equals(audience)) {
                throw new IllegalArgumentException("Token audience mismatch: " + audience);
            }

            return subject;
        } catch (Exception e) {
            log.error("Apple identity token verification failed: {}", e.getMessage());
            throw new RuntimeException("Invalid Apple identity token", e);
        }
    }

    @SuppressWarnings("unchecked")
    private Map<String, Object> fetchApplePublicKeys() {
        try {
            HttpClient client = HttpClient.newHttpClient();
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create("https://appleid.apple.com/auth/keys"))
                    .GET()
                    .build();
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            return objectMapper.readValue(response.body(), Map.class);
        } catch (Exception e) {
            log.error("Failed to fetch Apple public keys: {}", e.getMessage());
            throw new RuntimeException("Failed to fetch Apple public keys", e);
        }
    }
}
