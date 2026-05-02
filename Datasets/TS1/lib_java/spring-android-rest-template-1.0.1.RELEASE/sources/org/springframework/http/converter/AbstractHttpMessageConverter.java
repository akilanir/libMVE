package org.springframework.http.converter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.util.Assert;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/converter/AbstractHttpMessageConverter.class */
public abstract class AbstractHttpMessageConverter<T> implements HttpMessageConverter<T> {
    private List<MediaType> supportedMediaTypes = Collections.emptyList();

    protected abstract boolean supports(Class<?> cls);

    protected abstract T readInternal(Class<? extends T> cls, HttpInputMessage httpInputMessage) throws IOException, HttpMessageNotReadableException;

    protected abstract void writeInternal(T t, HttpOutputMessage httpOutputMessage) throws IOException, HttpMessageNotWritableException;

    protected AbstractHttpMessageConverter() {
    }

    protected AbstractHttpMessageConverter(MediaType supportedMediaType) {
        setSupportedMediaTypes(Collections.singletonList(supportedMediaType));
    }

    protected AbstractHttpMessageConverter(MediaType... supportedMediaTypes) {
        setSupportedMediaTypes(Arrays.asList(supportedMediaTypes));
    }

    public void setSupportedMediaTypes(List<MediaType> supportedMediaTypes) {
        Assert.notEmpty(supportedMediaTypes, "'supportedMediaTypes' must not be empty");
        this.supportedMediaTypes = new ArrayList(supportedMediaTypes);
    }

    @Override // org.springframework.http.converter.HttpMessageConverter
    public List<MediaType> getSupportedMediaTypes() {
        return Collections.unmodifiableList(this.supportedMediaTypes);
    }

    @Override // org.springframework.http.converter.HttpMessageConverter
    public boolean canRead(Class<?> clazz, MediaType mediaType) {
        return supports(clazz) && canRead(mediaType);
    }

    protected boolean canRead(MediaType mediaType) {
        if (mediaType == null) {
            return true;
        }
        for (MediaType supportedMediaType : getSupportedMediaTypes()) {
            if (supportedMediaType.includes(mediaType)) {
                return true;
            }
        }
        return false;
    }

    @Override // org.springframework.http.converter.HttpMessageConverter
    public boolean canWrite(Class<?> clazz, MediaType mediaType) {
        return supports(clazz) && canWrite(mediaType);
    }

    protected boolean canWrite(MediaType mediaType) {
        if (mediaType == null || MediaType.ALL.equals(mediaType)) {
            return true;
        }
        for (MediaType supportedMediaType : getSupportedMediaTypes()) {
            if (supportedMediaType.isCompatibleWith(mediaType)) {
                return true;
            }
        }
        return false;
    }

    @Override // org.springframework.http.converter.HttpMessageConverter
    public final T read(Class<? extends T> clazz, HttpInputMessage inputMessage) throws IOException {
        return readInternal(clazz, inputMessage);
    }

    @Override // org.springframework.http.converter.HttpMessageConverter
    public final void write(T t, MediaType contentType, HttpOutputMessage outputMessage) throws IOException, HttpMessageNotWritableException {
        Long contentLength;
        HttpHeaders headers = outputMessage.getHeaders();
        if (headers.getContentType() == null) {
            if (contentType == null || contentType.isWildcardType() || contentType.isWildcardSubtype()) {
                contentType = getDefaultContentType(t);
            }
            if (contentType != null) {
                headers.setContentType(contentType);
            }
        }
        if (headers.getContentLength() == -1 && (contentLength = getContentLength(t, headers.getContentType())) != null) {
            headers.setContentLength(contentLength.longValue());
        }
        writeInternal(t, outputMessage);
        outputMessage.getBody().flush();
    }

    protected MediaType getDefaultContentType(T t) throws IOException {
        List<MediaType> mediaTypes = getSupportedMediaTypes();
        if (mediaTypes.isEmpty()) {
            return null;
        }
        return mediaTypes.get(0);
    }

    protected Long getContentLength(T t, MediaType contentType) throws IOException {
        return null;
    }
}
