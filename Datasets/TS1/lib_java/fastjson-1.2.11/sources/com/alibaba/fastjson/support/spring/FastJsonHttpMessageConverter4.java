package com.alibaba.fastjson.support.spring;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Type;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.http.converter.AbstractGenericHttpMessageConverter;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/support/spring/FastJsonHttpMessageConverter4.class */
public class FastJsonHttpMessageConverter4 extends AbstractGenericHttpMessageConverter<Object> {
    private FastJsonConfig fastJsonConfig;

    public FastJsonConfig getFastJsonConfig() {
        return this.fastJsonConfig;
    }

    public void setFastJsonConfig(FastJsonConfig fastJsonConfig) {
        this.fastJsonConfig = fastJsonConfig;
    }

    public FastJsonHttpMessageConverter4() {
        super(MediaType.ALL);
        this.fastJsonConfig = new FastJsonConfig();
    }

    protected boolean supports(Class<?> paramClass) {
        return true;
    }

    public Object read(Type type, Class<?> contextClass, HttpInputMessage inputMessage) throws IOException, HttpMessageNotReadableException {
        InputStream in = inputMessage.getBody();
        return JSON.parseObject(in, this.fastJsonConfig.getCharset(), type, this.fastJsonConfig.getFeatures());
    }

    protected void writeInternal(Object obj, Type type, HttpOutputMessage outputMessage) throws IOException, HttpMessageNotWritableException {
        HttpHeaders headers = outputMessage.getHeaders();
        OutputStream out = outputMessage.getBody();
        int len = JSON.writeJSONString(out, this.fastJsonConfig.getCharset(), obj, this.fastJsonConfig.getSerializeConfig(), this.fastJsonConfig.getSerializeFilters(), this.fastJsonConfig.getDateFormat(), JSON.DEFAULT_GENERATE_FEATURE, this.fastJsonConfig.getSerializerFeatures());
        headers.setContentLength(len);
    }

    protected Object readInternal(Class<? extends Object> clazz, HttpInputMessage inputMessage) throws IOException, HttpMessageNotReadableException {
        InputStream in = inputMessage.getBody();
        return JSON.parseObject(in, this.fastJsonConfig.getCharset(), clazz, this.fastJsonConfig.getFeatures());
    }
}
