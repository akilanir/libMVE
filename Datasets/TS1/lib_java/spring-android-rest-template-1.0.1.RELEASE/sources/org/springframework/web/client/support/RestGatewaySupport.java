package org.springframework.web.client.support;

import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.util.Assert;
import org.springframework.web.client.RestTemplate;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/client/support/RestGatewaySupport.class */
public class RestGatewaySupport {
    private RestTemplate restTemplate;

    public RestGatewaySupport() {
        this.restTemplate = new RestTemplate();
    }

    public RestGatewaySupport(ClientHttpRequestFactory requestFactory) {
        Assert.notNull(requestFactory, "'requestFactory' must not be null");
        this.restTemplate = new RestTemplate(requestFactory);
    }

    public void setRestTemplate(RestTemplate restTemplate) {
        Assert.notNull(restTemplate, "'restTemplate' must not be null");
        this.restTemplate = restTemplate;
    }

    public RestTemplate getRestTemplate() {
        return this.restTemplate;
    }
}
