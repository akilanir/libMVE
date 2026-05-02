package org.androidannotations.api.rest;

import org.springframework.web.client.RestTemplate;

/* loaded from: androidannotations-api-3.2.jar:org/androidannotations/api/rest/RestClientSupport.class */
public interface RestClientSupport {
    RestTemplate getRestTemplate();

    void setRestTemplate(RestTemplate restTemplate);
}
