package org.springframework.http.converter.json;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.google.gson.JsonParseException;
import com.google.gson.JsonSyntaxException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.lang.reflect.Type;
import java.nio.charset.Charset;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.http.converter.AbstractHttpMessageConverter;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.util.Assert;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/converter/json/GsonHttpMessageConverter.class */
public class GsonHttpMessageConverter extends AbstractHttpMessageConverter<Object> {
    public static final Charset DEFAULT_CHARSET = Charset.forName("UTF-8");
    private Gson gson;
    private Type type;
    private boolean prefixJson;

    public GsonHttpMessageConverter() {
        this(new Gson());
    }

    public GsonHttpMessageConverter(boolean serializeNulls) {
        this(serializeNulls ? new GsonBuilder().serializeNulls().create() : new Gson());
    }

    public GsonHttpMessageConverter(Gson gson) {
        super(new MediaType("application", "json", DEFAULT_CHARSET));
        this.type = null;
        this.prefixJson = false;
        setGson(gson);
    }

    public void setGson(Gson gson) {
        Assert.notNull(gson, "'gson' must not be null");
        this.gson = gson;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public Type getType() {
        return this.type;
    }

    public void setPrefixJson(boolean prefixJson) {
        this.prefixJson = prefixJson;
    }

    @Override // org.springframework.http.converter.AbstractHttpMessageConverter, org.springframework.http.converter.HttpMessageConverter
    public boolean canRead(Class<?> clazz, MediaType mediaType) {
        return canRead(mediaType);
    }

    @Override // org.springframework.http.converter.AbstractHttpMessageConverter, org.springframework.http.converter.HttpMessageConverter
    public boolean canWrite(Class<?> clazz, MediaType mediaType) {
        return canWrite(mediaType);
    }

    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    protected boolean supports(Class<?> clazz) {
        throw new UnsupportedOperationException();
    }

    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    protected Object readInternal(Class<? extends Object> cls, HttpInputMessage inputMessage) throws IOException, HttpMessageNotReadableException {
        Reader json = new InputStreamReader(inputMessage.getBody(), getCharset(inputMessage.getHeaders()));
        try {
            Type typeOfT = getType();
            if (typeOfT != null) {
                return this.gson.fromJson(json, typeOfT);
            }
            return this.gson.fromJson(json, cls);
        } catch (JsonSyntaxException ex) {
            throw new HttpMessageNotReadableException("Could not read JSON: " + ex.getMessage(), ex);
        } catch (JsonIOException ex2) {
            throw new HttpMessageNotReadableException("Could not read JSON: " + ex2.getMessage(), ex2);
        } catch (JsonParseException ex3) {
            throw new HttpMessageNotReadableException("Could not read JSON: " + ex3.getMessage(), ex3);
        }
    }

    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    protected void writeInternal(Object o, HttpOutputMessage outputMessage) throws IOException, HttpMessageNotWritableException {
        OutputStreamWriter writer = new OutputStreamWriter(outputMessage.getBody(), getCharset(outputMessage.getHeaders()));
        try {
            if (this.prefixJson) {
                writer.append((CharSequence) "{} && ");
            }
            Type typeOfSrc = getType();
            if (typeOfSrc != null) {
                this.gson.toJson(o, typeOfSrc, writer);
            } else {
                this.gson.toJson(o, writer);
            }
            writer.close();
        } catch (JsonIOException ex) {
            throw new HttpMessageNotWritableException("Could not write JSON: " + ex.getMessage(), ex);
        }
    }

    private Charset getCharset(HttpHeaders headers) {
        if (headers != null && headers.getContentType() != null && headers.getContentType().getCharSet() != null) {
            return headers.getContentType().getCharSet();
        }
        return DEFAULT_CHARSET;
    }
}
