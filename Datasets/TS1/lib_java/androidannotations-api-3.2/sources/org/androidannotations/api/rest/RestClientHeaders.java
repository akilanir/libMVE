package org.androidannotations.api.rest;

import org.springframework.http.HttpAuthentication;

/* loaded from: androidannotations-api-3.2.jar:org/androidannotations/api/rest/RestClientHeaders.class */
public interface RestClientHeaders {
    String getCookie(String str);

    void setCookie(String str, String str2);

    String getHeader(String str);

    void setHeader(String str, String str2);

    void setAuthentication(HttpAuthentication httpAuthentication);

    void setHttpBasicAuth(String str, String str2);

    void setBearerAuth(String str);
}
