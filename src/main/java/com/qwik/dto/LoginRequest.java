package com.qwik.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class LoginRequest {

    @NotBlank(message = "Identity token is required")
    private String identityToken;

    private String username;

    private String avatarUrl;
}
