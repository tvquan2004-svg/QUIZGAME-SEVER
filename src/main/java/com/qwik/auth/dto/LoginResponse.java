package com.qwik.auth.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@AllArgsConstructor
@Builder
public class LoginResponse {
    private String token;
    private Long userId;
    private String username;
    private String avatarUrl;
    private String mindProfile;
    @JsonProperty("isNewUser")
    private boolean isNewUser;
}
