package org.springframework.web.client;

import android.util.Log;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpRequest;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.http.client.support.InterceptingHttpAccessor;
import org.springframework.http.converter.ByteArrayHttpMessageConverter;
import org.springframework.http.converter.FormHttpMessageConverter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.ResourceHttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.feed.SyndFeedHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.http.converter.json.MappingJacksonHttpMessageConverter;
import org.springframework.http.converter.xml.SimpleXmlHttpMessageConverter;
import org.springframework.http.converter.xml.SourceHttpMessageConverter;
import org.springframework.http.converter.xml.XmlAwareFormHttpMessageConverter;
import org.springframework.util.Assert;
import org.springframework.util.ClassUtils;
import org.springframework.util.MultiValueMap;
import org.springframework.web.util.UriTemplate;
import org.springframework.web.util.UriUtils;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/client/RestTemplate.class */
public class RestTemplate extends InterceptingHttpAccessor implements RestOperations {
    private static final String TAG = "RestTemplate";
    private final ResponseExtractor<HttpHeaders> headersExtractor;
    private List<HttpMessageConverter<?>> messageConverters;
    private ResponseErrorHandler errorHandler;

    public RestTemplate() {
        this(false);
    }

    public RestTemplate(boolean includeDefaultConverters) {
        this.headersExtractor = new HeadersExtractor();
        this.messageConverters = new ArrayList();
        this.errorHandler = new DefaultResponseErrorHandler();
        if (includeDefaultConverters) {
            DefaultMessageConverters.init(this.messageConverters);
        }
    }

    public RestTemplate(ClientHttpRequestFactory requestFactory) {
        this(false, requestFactory);
    }

    public RestTemplate(boolean includeDefaultConverters, ClientHttpRequestFactory requestFactory) {
        this(includeDefaultConverters);
        setRequestFactory(requestFactory);
    }

    public void setMessageConverters(List<HttpMessageConverter<?>> messageConverters) {
        Assert.notEmpty(messageConverters, "'messageConverters' must not be empty");
        this.messageConverters = messageConverters;
    }

    public List<HttpMessageConverter<?>> getMessageConverters() {
        return this.messageConverters;
    }

    public void setErrorHandler(ResponseErrorHandler errorHandler) {
        Assert.notNull(errorHandler, "'errorHandler' must not be null");
        this.errorHandler = errorHandler;
    }

    public ResponseErrorHandler getErrorHandler() {
        return this.errorHandler;
    }

    @Override // org.springframework.web.client.RestOperations
    public <T> T getForObject(String str, Class<T> cls, Object... objArr) throws RestClientException {
        return (T) execute(str, HttpMethod.GET, new AcceptHeaderRequestCallback(cls), new HttpMessageConverterExtractor(cls, getMessageConverters()), objArr);
    }

    @Override // org.springframework.web.client.RestOperations
    public <T> T getForObject(String str, Class<T> cls, Map<String, ?> map) throws RestClientException {
        return (T) execute(str, HttpMethod.GET, new AcceptHeaderRequestCallback(cls), new HttpMessageConverterExtractor(cls, getMessageConverters()), map);
    }

    @Override // org.springframework.web.client.RestOperations
    public <T> T getForObject(URI uri, Class<T> cls) throws RestClientException {
        return (T) execute(uri, HttpMethod.GET, new AcceptHeaderRequestCallback(cls), new HttpMessageConverterExtractor(cls, getMessageConverters()));
    }

    @Override // org.springframework.web.client.RestOperations
    public <T> ResponseEntity<T> getForEntity(String url, Class<T> responseType, Object... urlVariables) throws RestClientException {
        AcceptHeaderRequestCallback requestCallback = new AcceptHeaderRequestCallback(responseType);
        ResponseEntityResponseExtractor<T> responseExtractor = new ResponseEntityResponseExtractor<>(responseType);
        return (ResponseEntity) execute(url, HttpMethod.GET, requestCallback, responseExtractor, urlVariables);
    }

    @Override // org.springframework.web.client.RestOperations
    public <T> ResponseEntity<T> getForEntity(String url, Class<T> responseType, Map<String, ?> urlVariables) throws RestClientException {
        AcceptHeaderRequestCallback requestCallback = new AcceptHeaderRequestCallback(responseType);
        ResponseEntityResponseExtractor<T> responseExtractor = new ResponseEntityResponseExtractor<>(responseType);
        return (ResponseEntity) execute(url, HttpMethod.GET, requestCallback, responseExtractor, urlVariables);
    }

    @Override // org.springframework.web.client.RestOperations
    public <T> ResponseEntity<T> getForEntity(URI url, Class<T> responseType) throws RestClientException {
        AcceptHeaderRequestCallback requestCallback = new AcceptHeaderRequestCallback(responseType);
        ResponseEntityResponseExtractor<T> responseExtractor = new ResponseEntityResponseExtractor<>(responseType);
        return (ResponseEntity) execute(url, HttpMethod.GET, requestCallback, responseExtractor);
    }

    @Override // org.springframework.web.client.RestOperations
    public HttpHeaders headForHeaders(String url, Object... urlVariables) throws RestClientException {
        return (HttpHeaders) execute(url, HttpMethod.HEAD, (RequestCallback) null, this.headersExtractor, urlVariables);
    }

    @Override // org.springframework.web.client.RestOperations
    public HttpHeaders headForHeaders(String url, Map<String, ?> urlVariables) throws RestClientException {
        return (HttpHeaders) execute(url, HttpMethod.HEAD, (RequestCallback) null, this.headersExtractor, urlVariables);
    }

    @Override // org.springframework.web.client.RestOperations
    public HttpHeaders headForHeaders(URI url) throws RestClientException {
        return (HttpHeaders) execute(url, HttpMethod.HEAD, null, this.headersExtractor);
    }

    @Override // org.springframework.web.client.RestOperations
    public URI postForLocation(String url, Object request, Object... urlVariables) throws RestClientException {
        HttpEntityRequestCallback requestCallback = new HttpEntityRequestCallback(request);
        HttpHeaders headers = (HttpHeaders) execute(url, HttpMethod.POST, requestCallback, this.headersExtractor, urlVariables);
        return headers.getLocation();
    }

    @Override // org.springframework.web.client.RestOperations
    public URI postForLocation(String url, Object request, Map<String, ?> urlVariables) throws RestClientException {
        HttpEntityRequestCallback requestCallback = new HttpEntityRequestCallback(request);
        HttpHeaders headers = (HttpHeaders) execute(url, HttpMethod.POST, requestCallback, this.headersExtractor, urlVariables);
        return headers.getLocation();
    }

    @Override // org.springframework.web.client.RestOperations
    public URI postForLocation(URI url, Object request) throws RestClientException {
        HttpEntityRequestCallback requestCallback = new HttpEntityRequestCallback(request);
        HttpHeaders headers = (HttpHeaders) execute(url, HttpMethod.POST, requestCallback, this.headersExtractor);
        return headers.getLocation();
    }

    @Override // org.springframework.web.client.RestOperations
    public <T> T postForObject(String str, Object obj, Class<T> cls, Object... objArr) throws RestClientException {
        return (T) execute(str, HttpMethod.POST, new HttpEntityRequestCallback(obj, cls), new HttpMessageConverterExtractor(cls, getMessageConverters()), objArr);
    }

    @Override // org.springframework.web.client.RestOperations
    public <T> T postForObject(String str, Object obj, Class<T> cls, Map<String, ?> map) throws RestClientException {
        return (T) execute(str, HttpMethod.POST, new HttpEntityRequestCallback(obj, cls), new HttpMessageConverterExtractor(cls, getMessageConverters()), map);
    }

    @Override // org.springframework.web.client.RestOperations
    public <T> T postForObject(URI uri, Object obj, Class<T> cls) throws RestClientException {
        return (T) execute(uri, HttpMethod.POST, new HttpEntityRequestCallback(obj, cls), new HttpMessageConverterExtractor(cls, getMessageConverters()));
    }

    @Override // org.springframework.web.client.RestOperations
    public <T> ResponseEntity<T> postForEntity(String url, Object request, Class<T> responseType, Object... uriVariables) throws RestClientException {
        HttpEntityRequestCallback requestCallback = new HttpEntityRequestCallback(request, responseType);
        ResponseEntityResponseExtractor<T> responseExtractor = new ResponseEntityResponseExtractor<>(responseType);
        return (ResponseEntity) execute(url, HttpMethod.POST, requestCallback, responseExtractor, uriVariables);
    }

    @Override // org.springframework.web.client.RestOperations
    public <T> ResponseEntity<T> postForEntity(String url, Object request, Class<T> responseType, Map<String, ?> uriVariables) throws RestClientException {
        HttpEntityRequestCallback requestCallback = new HttpEntityRequestCallback(request, responseType);
        ResponseEntityResponseExtractor<T> responseExtractor = new ResponseEntityResponseExtractor<>(responseType);
        return (ResponseEntity) execute(url, HttpMethod.POST, requestCallback, responseExtractor, uriVariables);
    }

    @Override // org.springframework.web.client.RestOperations
    public <T> ResponseEntity<T> postForEntity(URI url, Object request, Class<T> responseType) throws RestClientException {
        HttpEntityRequestCallback requestCallback = new HttpEntityRequestCallback(request, responseType);
        ResponseEntityResponseExtractor<T> responseExtractor = new ResponseEntityResponseExtractor<>(responseType);
        return (ResponseEntity) execute(url, HttpMethod.POST, requestCallback, responseExtractor);
    }

    @Override // org.springframework.web.client.RestOperations
    public void put(String url, Object request, Object... urlVariables) throws RestClientException {
        HttpEntityRequestCallback requestCallback = new HttpEntityRequestCallback(request);
        execute(url, HttpMethod.PUT, requestCallback, (ResponseExtractor) null, urlVariables);
    }

    @Override // org.springframework.web.client.RestOperations
    public void put(String url, Object request, Map<String, ?> urlVariables) throws RestClientException {
        HttpEntityRequestCallback requestCallback = new HttpEntityRequestCallback(request);
        execute(url, HttpMethod.PUT, requestCallback, (ResponseExtractor) null, urlVariables);
    }

    @Override // org.springframework.web.client.RestOperations
    public void put(URI url, Object request) throws RestClientException {
        HttpEntityRequestCallback requestCallback = new HttpEntityRequestCallback(request);
        execute(url, HttpMethod.PUT, requestCallback, null);
    }

    @Override // org.springframework.web.client.RestOperations
    public void delete(String url, Object... urlVariables) throws RestClientException {
        execute(url, HttpMethod.DELETE, (RequestCallback) null, (ResponseExtractor) null, urlVariables);
    }

    @Override // org.springframework.web.client.RestOperations
    public void delete(String url, Map<String, ?> urlVariables) throws RestClientException {
        execute(url, HttpMethod.DELETE, (RequestCallback) null, (ResponseExtractor) null, urlVariables);
    }

    @Override // org.springframework.web.client.RestOperations
    public void delete(URI url) throws RestClientException {
        execute(url, HttpMethod.DELETE, null, null);
    }

    @Override // org.springframework.web.client.RestOperations
    public Set<HttpMethod> optionsForAllow(String url, Object... urlVariables) throws RestClientException {
        HttpHeaders headers = (HttpHeaders) execute(url, HttpMethod.OPTIONS, (RequestCallback) null, this.headersExtractor, urlVariables);
        return headers.getAllow();
    }

    @Override // org.springframework.web.client.RestOperations
    public Set<HttpMethod> optionsForAllow(String url, Map<String, ?> urlVariables) throws RestClientException {
        HttpHeaders headers = (HttpHeaders) execute(url, HttpMethod.OPTIONS, (RequestCallback) null, this.headersExtractor, urlVariables);
        return headers.getAllow();
    }

    @Override // org.springframework.web.client.RestOperations
    public Set<HttpMethod> optionsForAllow(URI url) throws RestClientException {
        HttpHeaders headers = (HttpHeaders) execute(url, HttpMethod.OPTIONS, null, this.headersExtractor);
        return headers.getAllow();
    }

    @Override // org.springframework.web.client.RestOperations
    public <T> ResponseEntity<T> exchange(String url, HttpMethod method, HttpEntity<?> requestEntity, Class<T> responseType, Object... uriVariables) throws RestClientException {
        HttpEntityRequestCallback requestCallback = new HttpEntityRequestCallback(requestEntity, responseType);
        ResponseEntityResponseExtractor<T> responseExtractor = new ResponseEntityResponseExtractor<>(responseType);
        return (ResponseEntity) execute(url, method, requestCallback, responseExtractor, uriVariables);
    }

    @Override // org.springframework.web.client.RestOperations
    public <T> ResponseEntity<T> exchange(String url, HttpMethod method, HttpEntity<?> requestEntity, Class<T> responseType, Map<String, ?> uriVariables) throws RestClientException {
        HttpEntityRequestCallback requestCallback = new HttpEntityRequestCallback(requestEntity, responseType);
        ResponseEntityResponseExtractor<T> responseExtractor = new ResponseEntityResponseExtractor<>(responseType);
        return (ResponseEntity) execute(url, method, requestCallback, responseExtractor, uriVariables);
    }

    @Override // org.springframework.web.client.RestOperations
    public <T> ResponseEntity<T> exchange(URI url, HttpMethod method, HttpEntity<?> requestEntity, Class<T> responseType) throws RestClientException {
        HttpEntityRequestCallback requestCallback = new HttpEntityRequestCallback(requestEntity, responseType);
        ResponseEntityResponseExtractor<T> responseExtractor = new ResponseEntityResponseExtractor<>(responseType);
        return (ResponseEntity) execute(url, method, requestCallback, responseExtractor);
    }

    @Override // org.springframework.web.client.RestOperations
    public <T> T execute(String str, HttpMethod httpMethod, RequestCallback requestCallback, ResponseExtractor<T> responseExtractor, Object... objArr) throws RestClientException {
        return (T) doExecute(new HttpUrlTemplate(str).expand(objArr), httpMethod, requestCallback, responseExtractor);
    }

    @Override // org.springframework.web.client.RestOperations
    public <T> T execute(String str, HttpMethod httpMethod, RequestCallback requestCallback, ResponseExtractor<T> responseExtractor, Map<String, ?> map) throws RestClientException {
        return (T) doExecute(new HttpUrlTemplate(str).expand(map), httpMethod, requestCallback, responseExtractor);
    }

    @Override // org.springframework.web.client.RestOperations
    public <T> T execute(URI uri, HttpMethod httpMethod, RequestCallback requestCallback, ResponseExtractor<T> responseExtractor) throws RestClientException {
        return (T) doExecute(uri, httpMethod, requestCallback, responseExtractor);
    }

    protected <T> T doExecute(URI url, HttpMethod method, RequestCallback requestCallback, ResponseExtractor<T> responseExtractor) throws RestClientException {
        Assert.notNull(url, "'url' must not be null");
        Assert.notNull(method, "'method' must not be null");
        ClientHttpResponse response = null;
        try {
            try {
                ClientHttpRequest request = createRequest(url, method);
                if (requestCallback != null) {
                    requestCallback.doWithRequest(request);
                }
                response = request.execute();
                if (!getErrorHandler().hasError(response)) {
                    logResponseStatus(method, url, response);
                } else {
                    handleResponseError(method, url, response);
                }
                if (responseExtractor != null) {
                    T extractData = responseExtractor.extractData(response);
                    if (response != null) {
                        response.close();
                    }
                    return extractData;
                }
                if (response != null) {
                    response.close();
                }
                return null;
            } catch (IOException ex) {
                throw new ResourceAccessException("I/O error: " + ex.getMessage(), ex);
            }
        } catch (Throwable th) {
            if (response != null) {
                response.close();
            }
            throw th;
        }
    }

    private void logResponseStatus(HttpMethod method, URI url, ClientHttpResponse response) {
        if (Log.isLoggable(TAG, 3)) {
            try {
                Log.d(TAG, method.name() + " request for \"" + url + "\" resulted in " + response.getStatusCode() + " (" + response.getStatusText() + ")");
            } catch (IOException e) {
            }
        }
    }

    private void handleResponseError(HttpMethod method, URI url, ClientHttpResponse response) throws IOException {
        if (Log.isLoggable(TAG, 5)) {
            try {
                Log.w(TAG, method.name() + " request for \"" + url + "\" resulted in " + response.getStatusCode() + " (" + response.getStatusText() + "); invoking error handler");
            } catch (IOException e) {
            }
        }
        getErrorHandler().handleError(response);
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/client/RestTemplate$AcceptHeaderRequestCallback.class */
    private class AcceptHeaderRequestCallback implements RequestCallback {
        private final Class<?> responseType;

        private AcceptHeaderRequestCallback(Class<?> responseType) {
            this.responseType = responseType;
        }

        @Override // org.springframework.web.client.RequestCallback
        public void doWithRequest(ClientHttpRequest request) throws IOException {
            if (this.responseType != null) {
                List<MediaType> allSupportedMediaTypes = new ArrayList<>();
                for (HttpMessageConverter<?> messageConverter : RestTemplate.this.getMessageConverters()) {
                    if (messageConverter.canRead(this.responseType, null)) {
                        List<MediaType> supportedMediaTypes = messageConverter.getSupportedMediaTypes();
                        for (MediaType supportedMediaType : supportedMediaTypes) {
                            if (supportedMediaType.getCharSet() != null) {
                                supportedMediaType = new MediaType(supportedMediaType.getType(), supportedMediaType.getSubtype());
                            }
                            allSupportedMediaTypes.add(supportedMediaType);
                        }
                    }
                }
                if (!allSupportedMediaTypes.isEmpty()) {
                    MediaType.sortBySpecificity(allSupportedMediaTypes);
                    if (Log.isLoggable(RestTemplate.TAG, 3)) {
                        Log.d(RestTemplate.TAG, "Setting request Accept header to " + allSupportedMediaTypes);
                    }
                    request.getHeaders().setAccept(allSupportedMediaTypes);
                }
            }
        }
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/client/RestTemplate$HttpEntityRequestCallback.class */
    private class HttpEntityRequestCallback extends AcceptHeaderRequestCallback {
        private final HttpEntity<Object> requestEntity;

        private HttpEntityRequestCallback(RestTemplate restTemplate, Object requestBody) {
            this(requestBody, (Class<?>) null);
        }

        private HttpEntityRequestCallback(Object requestBody, Class<?> responseType) {
            super(responseType);
            if (requestBody instanceof HttpEntity) {
                this.requestEntity = (HttpEntity) requestBody;
            } else if (requestBody != null) {
                this.requestEntity = new HttpEntity<>(requestBody);
            } else {
                this.requestEntity = HttpEntity.EMPTY;
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v11, types: [java.util.Map, org.springframework.http.HttpHeaders] */
        /* JADX WARN: Type inference failed for: r0v54, types: [java.util.Map, org.springframework.http.HttpHeaders] */
        @Override // org.springframework.web.client.RestTemplate.AcceptHeaderRequestCallback, org.springframework.web.client.RequestCallback
        public void doWithRequest(ClientHttpRequest httpRequest) throws IOException {
            super.doWithRequest(httpRequest);
            if (!this.requestEntity.hasBody()) {
                HttpHeaders headers = httpRequest.getHeaders();
                ?? headers2 = this.requestEntity.getHeaders();
                if (!headers2.isEmpty()) {
                    headers.putAll(headers2);
                }
                if (headers.getContentLength() == -1) {
                    headers.setContentLength(0L);
                    return;
                }
                return;
            }
            Object requestBody = this.requestEntity.getBody();
            Class<?> requestType = requestBody.getClass();
            ?? headers3 = this.requestEntity.getHeaders();
            MediaType requestContentType = headers3.getContentType();
            for (HttpMessageConverter<?> messageConverter : RestTemplate.this.getMessageConverters()) {
                if (messageConverter.canWrite(requestType, requestContentType)) {
                    if (!headers3.isEmpty()) {
                        httpRequest.getHeaders().putAll(headers3);
                    }
                    if (Log.isLoggable(RestTemplate.TAG, 3)) {
                        if (requestContentType != null) {
                            Log.d(RestTemplate.TAG, "Writing [" + requestBody + "] as \"" + requestContentType + "\" using [" + messageConverter + "]");
                        } else {
                            Log.d(RestTemplate.TAG, "Writing [" + requestBody + "] using [" + messageConverter + "]");
                        }
                    }
                    messageConverter.write(requestBody, requestContentType, httpRequest);
                    return;
                }
            }
            String message = "Could not write request: no suitable HttpMessageConverter found for request type [" + requestType.getName() + "]";
            if (requestContentType != null) {
                message = message + " and content type [" + requestContentType + "]";
            }
            throw new RestClientException(message);
        }
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/client/RestTemplate$ResponseEntityResponseExtractor.class */
    private class ResponseEntityResponseExtractor<T> implements ResponseExtractor<ResponseEntity<T>> {
        private final HttpMessageConverterExtractor<T> delegate;

        public ResponseEntityResponseExtractor(Class<T> responseType) {
            if (responseType != null && !Void.class.equals(responseType)) {
                this.delegate = new HttpMessageConverterExtractor<>(responseType, RestTemplate.this.getMessageConverters());
            } else {
                this.delegate = null;
            }
        }

        @Override // org.springframework.web.client.ResponseExtractor
        public ResponseEntity<T> extractData(ClientHttpResponse response) throws IOException {
            if (this.delegate != null) {
                T body = this.delegate.extractData(response);
                return new ResponseEntity<>(body, response.getHeaders(), response.getStatusCode());
            }
            return new ResponseEntity<>((MultiValueMap<String, String>) response.getHeaders(), response.getStatusCode());
        }
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/client/RestTemplate$DefaultMessageConverters.class */
    private static class DefaultMessageConverters {
        private static final boolean javaxXmlTransformPresent = ClassUtils.isPresent("javax.xml.transform.Source", RestTemplate.class.getClassLoader());
        private static final boolean simpleXmlPresent = ClassUtils.isPresent("org.simpleframework.xml.Serializer", RestTemplate.class.getClassLoader());
        private static final boolean jacksonPresent;
        private static final boolean jackson2Present;
        private static final boolean romePresent;

        private DefaultMessageConverters() {
        }

        static {
            jacksonPresent = ClassUtils.isPresent("org.codehaus.jackson.map.ObjectMapper", RestTemplate.class.getClassLoader()) && ClassUtils.isPresent("org.codehaus.jackson.JsonGenerator", RestTemplate.class.getClassLoader());
            jackson2Present = ClassUtils.isPresent("com.fasterxml.jackson.databind.ObjectMapper", RestTemplate.class.getClassLoader()) && ClassUtils.isPresent("com.fasterxml.jackson.core.JsonGenerator", RestTemplate.class.getClassLoader());
            romePresent = ClassUtils.isPresent("com.google.code.rome.android.repackaged.com.sun.syndication.feed.synd.SyndFeed", RestTemplate.class.getClassLoader());
        }

        public static void init(List<HttpMessageConverter<?>> messageConverters) {
            messageConverters.add(new ByteArrayHttpMessageConverter());
            messageConverters.add(new StringHttpMessageConverter());
            messageConverters.add(new ResourceHttpMessageConverter());
            if (javaxXmlTransformPresent) {
                messageConverters.add(new SourceHttpMessageConverter());
                messageConverters.add(new XmlAwareFormHttpMessageConverter());
            } else {
                messageConverters.add(new FormHttpMessageConverter());
            }
            if (simpleXmlPresent) {
                messageConverters.add(new SimpleXmlHttpMessageConverter());
            }
            if (jackson2Present) {
                messageConverters.add(new MappingJackson2HttpMessageConverter());
            } else if (jacksonPresent) {
                messageConverters.add(new MappingJacksonHttpMessageConverter());
            }
            if (romePresent) {
                messageConverters.add(new SyndFeedHttpMessageConverter());
            }
        }
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/client/RestTemplate$HeadersExtractor.class */
    private static class HeadersExtractor implements ResponseExtractor<HttpHeaders> {
        private HeadersExtractor() {
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // org.springframework.web.client.ResponseExtractor
        public HttpHeaders extractData(ClientHttpResponse response) throws IOException {
            return response.getHeaders();
        }
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/client/RestTemplate$HttpUrlTemplate.class */
    private static class HttpUrlTemplate extends UriTemplate {
        private static final long serialVersionUID = 1;

        public HttpUrlTemplate(String uriTemplate) {
            super(uriTemplate);
        }

        @Override // org.springframework.web.util.UriTemplate
        protected URI encodeUri(String uri) {
            try {
                String encoded = UriUtils.encodeHttpUrl(uri, "UTF-8");
                return new URI(encoded);
            } catch (UnsupportedEncodingException ex) {
                throw new IllegalStateException(ex);
            } catch (URISyntaxException ex2) {
                throw new IllegalArgumentException("Could not create HTTP URL from [" + uri + "]: " + ex2, ex2);
            }
        }
    }
}
