package org.springframework.http.client.support;

import java.util.List;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.http.client.InterceptingClientHttpRequestFactory;
import org.springframework.util.CollectionUtils;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/support/InterceptingHttpAccessor.class */
public abstract class InterceptingHttpAccessor extends HttpAccessor {
    private List<ClientHttpRequestInterceptor> interceptors;

    public void setInterceptors(List<ClientHttpRequestInterceptor> interceptors) {
        this.interceptors = interceptors;
    }

    public List<ClientHttpRequestInterceptor> getInterceptors() {
        return this.interceptors;
    }

    @Override // org.springframework.http.client.support.HttpAccessor
    public ClientHttpRequestFactory getRequestFactory() {
        ClientHttpRequestFactory delegate = super.getRequestFactory();
        if (!CollectionUtils.isEmpty(getInterceptors())) {
            return new InterceptingClientHttpRequestFactory(delegate, getInterceptors());
        }
        return delegate;
    }
}
