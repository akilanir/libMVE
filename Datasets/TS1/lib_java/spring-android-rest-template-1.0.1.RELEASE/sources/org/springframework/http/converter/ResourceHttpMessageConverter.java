package org.springframework.http.converter;

import java.io.IOException;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/converter/ResourceHttpMessageConverter.class */
public class ResourceHttpMessageConverter extends AbstractHttpMessageConverter<Resource> {
    public ResourceHttpMessageConverter() {
        super(MediaType.ALL);
    }

    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    protected boolean supports(Class<?> clazz) {
        return Resource.class.isAssignableFrom(clazz);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    public Resource readInternal(Class<? extends Resource> clazz, HttpInputMessage inputMessage) throws IOException, HttpMessageNotReadableException {
        byte[] body = FileCopyUtils.copyToByteArray(inputMessage.getBody());
        return new ByteArrayResource(body);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    public MediaType getDefaultContentType(Resource resource) {
        return MediaType.APPLICATION_OCTET_STREAM;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    public Long getContentLength(Resource resource, MediaType contentType) throws IOException {
        return Long.valueOf(resource.contentLength());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    public void writeInternal(Resource resource, HttpOutputMessage outputMessage) throws IOException, HttpMessageNotWritableException {
        FileCopyUtils.copy(resource.getInputStream(), outputMessage.getBody());
        outputMessage.getBody().flush();
    }
}
