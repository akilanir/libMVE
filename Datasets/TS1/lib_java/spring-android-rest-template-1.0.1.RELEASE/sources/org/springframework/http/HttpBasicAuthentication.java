package org.springframework.http;

import org.springframework.util.Base64Utils;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/HttpBasicAuthentication.class */
public class HttpBasicAuthentication extends HttpAuthentication {
    private final String username;
    private final String password;

    public HttpBasicAuthentication(String username, String password) {
        this.username = username;
        this.password = password;
    }

    @Override // org.springframework.http.HttpAuthentication
    public String getHeaderValue() {
        byte[] bytes = String.format("%s:%s", this.username, this.password).getBytes();
        return String.format("Basic %s", Base64Utils.encodeToString(bytes));
    }

    public String toString() {
        try {
            String s = String.format("Authorization: %s", getHeaderValue());
            return s;
        } catch (RuntimeException e) {
            return null;
        }
    }
}
