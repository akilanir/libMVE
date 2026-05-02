package org.springframework.http.converter;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/converter/ByteArrayHttpMessageConverter.class */
public class ByteArrayHttpMessageConverter extends AbstractHttpMessageConverter<byte[]> {
    public ByteArrayHttpMessageConverter() {
        super(new MediaType("application", "octet-stream"), MediaType.ALL);
    }

    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    public boolean supports(Class<?> clazz) {
        return byte[].class.equals(clazz);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    public byte[] readInternal(Class<? extends byte[]> clazz, HttpInputMessage inputMessage) throws IOException {
        long contentLength = inputMessage.getHeaders().getContentLength();
        if (contentLength >= 0) {
            ByteArrayOutputStream bos = new ByteArrayOutputStream((int) contentLength);
            FileCopyUtils.copy(inputMessage.getBody(), bos);
            return bos.toByteArray();
        }
        return FileCopyUtils.copyToByteArray(inputMessage.getBody());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    public Long getContentLength(byte[] bytes, MediaType contentType) {
        return Long.valueOf(bytes.length);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    public void writeInternal(byte[] bytes, HttpOutputMessage outputMessage) throws IOException {
        FileCopyUtils.copy(bytes, outputMessage.getBody());
    }
}
