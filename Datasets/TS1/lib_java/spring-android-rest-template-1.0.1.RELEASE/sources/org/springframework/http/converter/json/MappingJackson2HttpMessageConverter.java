package org.springframework.http.converter.json;

import com.fasterxml.jackson.core.JsonEncoding;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.nio.charset.Charset;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.http.converter.AbstractHttpMessageConverter;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.util.Assert;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/converter/json/MappingJackson2HttpMessageConverter.class */
public class MappingJackson2HttpMessageConverter extends AbstractHttpMessageConverter<Object> {
    public static final Charset DEFAULT_CHARSET = Charset.forName("UTF-8");
    private ObjectMapper objectMapper;
    private boolean prefixJson;

    public MappingJackson2HttpMessageConverter() {
        super(new MediaType("application", "json", DEFAULT_CHARSET));
        this.objectMapper = new ObjectMapper();
        this.prefixJson = false;
    }

    public void setObjectMapper(ObjectMapper objectMapper) {
        Assert.notNull(objectMapper, "ObjectMapper must not be null");
        this.objectMapper = objectMapper;
    }

    public ObjectMapper getObjectMapper() {
        return this.objectMapper;
    }

    public void setPrefixJson(boolean prefixJson) {
        this.prefixJson = prefixJson;
    }

    @Override // org.springframework.http.converter.AbstractHttpMessageConverter, org.springframework.http.converter.HttpMessageConverter
    public boolean canRead(Class<?> clazz, MediaType mediaType) {
        JavaType javaType = getJavaType(clazz);
        return this.objectMapper.canDeserialize(javaType) && canRead(mediaType);
    }

    @Override // org.springframework.http.converter.AbstractHttpMessageConverter, org.springframework.http.converter.HttpMessageConverter
    public boolean canWrite(Class<?> clazz, MediaType mediaType) {
        return this.objectMapper.canSerialize(clazz) && canWrite(mediaType);
    }

    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    protected boolean supports(Class<?> clazz) {
        throw new UnsupportedOperationException();
    }

    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    protected Object readInternal(Class<? extends Object> cls, HttpInputMessage inputMessage) throws IOException, HttpMessageNotReadableException {
        JavaType javaType = getJavaType(cls);
        try {
            return this.objectMapper.readValue(inputMessage.getBody(), javaType);
        } catch (IOException ex) {
            throw new HttpMessageNotReadableException("Could not read JSON: " + ex.getMessage(), ex);
        }
    }

    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    protected void writeInternal(Object object, HttpOutputMessage outputMessage) throws IOException, HttpMessageNotWritableException {
        JsonEncoding encoding = getJsonEncoding(outputMessage.getHeaders().getContentType());
        JsonGenerator jsonGenerator = this.objectMapper.getFactory().createJsonGenerator(outputMessage.getBody(), encoding);
        try {
            if (this.prefixJson) {
                jsonGenerator.writeRaw("{} && ");
            }
            this.objectMapper.writeValue(jsonGenerator, object);
        } catch (IOException ex) {
            throw new HttpMessageNotWritableException("Could not write JSON: " + ex.getMessage(), ex);
        }
    }

    protected JavaType getJavaType(Class<?> clazz) {
        return this.objectMapper.constructType(clazz);
    }

    protected JsonEncoding getJsonEncoding(MediaType contentType) {
        if (contentType != null && contentType.getCharSet() != null) {
            Charset charset = contentType.getCharSet();
            JsonEncoding[] arr$ = JsonEncoding.values();
            for (JsonEncoding encoding : arr$) {
                if (charset.name().equals(encoding.getJavaName())) {
                    return encoding;
                }
            }
        }
        return JsonEncoding.UTF8;
    }
}
