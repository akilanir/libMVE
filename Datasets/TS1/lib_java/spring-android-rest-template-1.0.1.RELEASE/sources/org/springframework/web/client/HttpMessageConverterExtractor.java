package org.springframework.web.client;

import android.util.Log;
import java.io.IOException;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.util.Assert;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/client/HttpMessageConverterExtractor.class */
public class HttpMessageConverterExtractor<T> implements ResponseExtractor<T> {
    private static final String TAG = "RestTemplate";
    private final Class<T> responseType;
    private final List<HttpMessageConverter<?>> messageConverters;

    public HttpMessageConverterExtractor(Class<T> responseType, List<HttpMessageConverter<?>> messageConverters) {
        Assert.notNull(responseType, "'responseType' must not be null");
        Assert.notEmpty(messageConverters, "'messageConverters' must not be empty");
        this.responseType = responseType;
        this.messageConverters = messageConverters;
    }

    @Override // org.springframework.web.client.ResponseExtractor
    public T extractData(ClientHttpResponse clientHttpResponse) throws IOException {
        if (!hasMessageBody(clientHttpResponse)) {
            return null;
        }
        MediaType contentType = clientHttpResponse.getHeaders().getContentType();
        if (contentType == null) {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "No Content-Type header found, defaulting to application/octet-stream");
            }
            contentType = MediaType.APPLICATION_OCTET_STREAM;
        }
        for (HttpMessageConverter<?> httpMessageConverter : this.messageConverters) {
            if (httpMessageConverter.canRead(this.responseType, contentType)) {
                if (Log.isLoggable(TAG, 3)) {
                    Log.d(TAG, "Reading [" + this.responseType.getName() + "] as \"" + contentType + "\" using [" + httpMessageConverter + "]");
                }
                return (T) httpMessageConverter.read(this.responseType, clientHttpResponse);
            }
        }
        throw new RestClientException("Could not extract response: no suitable HttpMessageConverter found for response type [" + this.responseType.getName() + "] and content type [" + contentType + "]");
    }

    protected boolean hasMessageBody(ClientHttpResponse response) throws IOException {
        HttpStatus responseStatus = response.getStatusCode();
        if (responseStatus == HttpStatus.NO_CONTENT || responseStatus == HttpStatus.NOT_MODIFIED) {
            return false;
        }
        long contentLength = response.getHeaders().getContentLength();
        return contentLength != 0;
    }
}
