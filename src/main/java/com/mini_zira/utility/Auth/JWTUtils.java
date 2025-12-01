package com.mini_zira.utility.Auth;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.mini_zira.constant.JWTConstraints;

import java.util.Date;

public class JWTUtils {
    private static final Algorithm algorithm = Algorithm.HMAC256(JWTConstraints.JWT_SECRET);
    public static String generateToken(Long userId, String email){
        return  JWT.create()
                .withIssuer(JWTConstraints.JWT_ISSUER)
                .withClaim("id", userId)
                .withClaim("email", email)
                .withIssuedAt(new Date())
                .withExpiresAt(new Date(System.currentTimeMillis() + 1000*60*60*10))
                .sign(algorithm);
    }

    public static DecodedJWT verifyToken(String token){
        JWTVerifier verifier = JWT.require(algorithm)
                .withIssuer(JWTConstraints.JWT_ISSUER)
                .build();

        return verifier.verify(token);
    }

    public static DecodedJWT verify(String token){
        return JWT.decode(token);
    }
}
