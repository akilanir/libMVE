package org.springframework.http.converter;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/converter/StringHttpMessageConverter.class */
public class StringHttpMessageConverter extends AbstractHttpMessageConverter<String> {
    private final Charset defaultCharset;
    private final List<Charset> availableCharsets;
    private boolean writeAcceptCharset;

    public StringHttpMessageConverter() {
        this(Charset.forName("ISO-8859-1"));
    }

    public StringHttpMessageConverter(Charset defaultCharset) {
        this(defaultCharset, new ArrayList(Charset.availableCharsets().values()));
    }

    public StringHttpMessageConverter(Charset defaultCharset, List<Charset> availableCharsets) {
        super(new MediaType("text", "plain", defaultCharset), MediaType.ALL);
        this.writeAcceptCharset = true;
        this.defaultCharset = defaultCharset;
        this.availableCharsets = availableCharsets;
    }

    public Charset getDefaultCharset() {
        return this.defaultCharset;
    }

    public void setWriteAcceptCharset(boolean writeAcceptCharset) {
        this.writeAcceptCharset = writeAcceptCharset;
    }

    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    public boolean supports(Class<?> clazz) {
        return String.class.equals(clazz);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    public String readInternal(Class<? extends String> clazz, HttpInputMessage inputMessage) throws IOException {
        Charset charset = getContentTypeCharset(inputMessage.getHeaders().getContentType());
        return FileCopyUtils.copyToString(new InputStreamReader(inputMessage.getBody(), charset));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    public Long getContentLength(String s, MediaType contentType) {
        Charset charset = getContentTypeCharset(contentType);
        try {
            return Long.valueOf(s.getBytes(charset.displayName()).length);
        } catch (UnsupportedEncodingException ex) {
            throw new InternalError(ex.getMessage());
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    public void writeInternal(String s, HttpOutputMessage outputMessage) throws IOException {
        if (this.writeAcceptCharset) {
            outputMessage.getHeaders().setAcceptCharset(getAcceptedCharsets());
        }
        Charset charset = getContentTypeCharset(outputMessage.getHeaders().getContentType());
        FileCopyUtils.copy(s, new OutputStreamWriter(outputMessage.getBody(), charset));
    }

    protected List<Charset> getAcceptedCharsets() {
        return this.availableCharsets;
    }

    private Charset getContentTypeCharset(MediaType contentType) {
        if (contentType != null && contentType.getCharSet() != null) {
            return contentType.getCharSet();
        }
        return getDefaultCharset();
    }
}
