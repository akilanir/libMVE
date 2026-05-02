package com.alibaba.fastjson.support.spring;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializeFilter;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.util.IOUtils;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Type;
import java.nio.charset.Charset;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.http.converter.AbstractHttpMessageConverter;
import org.springframework.http.converter.GenericHttpMessageConverter;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/support/spring/FastJsonHttpMessageConverter.class */
public class FastJsonHttpMessageConverter extends AbstractHttpMessageConverter<Object> implements GenericHttpMessageConverter<Object> {

    @Deprecated
    protected Charset charset;

    @Deprecated
    protected SerializerFeature[] features;

    @Deprecated
    protected SerializeFilter[] filters;

    @Deprecated
    protected String dateFormat;
    private FastJsonConfig fastJsonConfig;

    public FastJsonConfig getFastJsonConfig() {
        return this.fastJsonConfig;
    }

    public void setFastJsonConfig(FastJsonConfig fastJsonConfig) {
        this.fastJsonConfig = fastJsonConfig;
    }

    public FastJsonHttpMessageConverter() {
        super(MediaType.ALL);
        this.charset = IOUtils.UTF8;
        this.features = new SerializerFeature[0];
        this.filters = new SerializeFilter[0];
        this.fastJsonConfig = new FastJsonConfig();
    }

    @Deprecated
    public Charset getCharset() {
        return this.fastJsonConfig.getCharset();
    }

    @Deprecated
    public void setCharset(Charset charset) {
        this.fastJsonConfig.setCharset(charset);
    }

    @Deprecated
    public String getDateFormat() {
        return this.fastJsonConfig.getDateFormat();
    }

    @Deprecated
    public void setDateFormat(String dateFormat) {
        this.fastJsonConfig.setDateFormat(dateFormat);
    }

    @Deprecated
    public SerializerFeature[] getFeatures() {
        return this.fastJsonConfig.getSerializerFeatures();
    }

    @Deprecated
    public void setFeatures(SerializerFeature... features) {
        this.fastJsonConfig.setSerializerFeatures(features);
    }

    @Deprecated
    public SerializeFilter[] getFilters() {
        return this.fastJsonConfig.getSerializeFilters();
    }

    @Deprecated
    public void setFilters(SerializeFilter... filters) {
        this.fastJsonConfig.setSerializeFilters(filters);
    }

    @Deprecated
    public void addSerializeFilter(SerializeFilter filter) {
        if (filter == null) {
            return;
        }
        int length = this.fastJsonConfig.getSerializeFilters().length;
        SerializeFilter[] filters = new SerializeFilter[length + 1];
        System.arraycopy(this.fastJsonConfig.getSerializeFilters(), 0, filters, 0, length);
        filters[filters.length - 1] = filter;
        this.fastJsonConfig.setSerializeFilters(filters);
    }

    protected boolean supports(Class<?> clazz) {
        return true;
    }

    protected Object readInternal(Class<? extends Object> clazz, HttpInputMessage inputMessage) throws IOException, HttpMessageNotReadableException {
        InputStream in = inputMessage.getBody();
        return JSON.parseObject(in, this.fastJsonConfig.getCharset(), clazz, this.fastJsonConfig.getFeatures());
    }

    protected void writeInternal(Object obj, HttpOutputMessage outputMessage) throws IOException, HttpMessageNotWritableException {
        HttpHeaders headers = outputMessage.getHeaders();
        OutputStream out = outputMessage.getBody();
        int len = JSON.writeJSONString(out, this.fastJsonConfig.getCharset(), obj, this.fastJsonConfig.getSerializeConfig(), this.fastJsonConfig.getSerializeFilters(), this.fastJsonConfig.getDateFormat(), JSON.DEFAULT_GENERATE_FEATURE, this.fastJsonConfig.getSerializerFeatures());
        headers.setContentLength(len);
    }

    public boolean canRead(Type type, Class<?> contextClass, MediaType mediaType) {
        return super.canRead(contextClass, mediaType);
    }

    public boolean canWrite(Type type, Class<?> contextClass, MediaType mediaType) {
        return super.canWrite(contextClass, mediaType);
    }

    public Object read(Type type, Class<?> contextClass, HttpInputMessage inputMessage) throws IOException, HttpMessageNotReadableException {
        InputStream in = inputMessage.getBody();
        return JSON.parseObject(in, this.fastJsonConfig.getCharset(), type, this.fastJsonConfig.getFeatures());
    }

    public void write(Object t, Type type, MediaType contentType, HttpOutputMessage outputMessage) throws IOException, HttpMessageNotWritableException {
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
}
