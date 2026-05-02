package org.springframework.http.converter.feed;

import android.os.Build;
import com.google.code.rome.android.repackaged.com.sun.syndication.feed.WireFeed;
import com.google.code.rome.android.repackaged.com.sun.syndication.io.FeedException;
import com.google.code.rome.android.repackaged.com.sun.syndication.io.WireFeedInput;
import com.google.code.rome.android.repackaged.com.sun.syndication.io.WireFeedOutput;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.Charset;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.http.converter.AbstractHttpMessageConverter;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.util.StringUtils;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/converter/feed/AbstractWireFeedHttpMessageConverter.class */
public abstract class AbstractWireFeedHttpMessageConverter<T extends WireFeed> extends AbstractHttpMessageConverter<T> {
    public static final Charset DEFAULT_CHARSET = Charset.forName("UTF-8");

    protected AbstractWireFeedHttpMessageConverter(MediaType supportedMediaType) {
        super(supportedMediaType);
        if (Build.VERSION.SDK_INT < 8) {
            Thread.currentThread().setContextClassLoader(getClass().getClassLoader());
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    public T readInternal(Class<? extends T> cls, HttpInputMessage httpInputMessage) throws IOException, HttpMessageNotReadableException {
        Charset charset;
        WireFeedInput wireFeedInput = new WireFeedInput();
        MediaType contentType = httpInputMessage.getHeaders().getContentType();
        if (contentType != null && contentType.getCharSet() != null) {
            charset = contentType.getCharSet();
        } else {
            charset = DEFAULT_CHARSET;
        }
        try {
            return (T) wireFeedInput.build(new InputStreamReader(httpInputMessage.getBody(), charset));
        } catch (FeedException e) {
            throw new HttpMessageNotReadableException("Could not read WireFeed: " + e.getMessage(), e);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    public void writeInternal(T wireFeed, HttpOutputMessage outputMessage) throws IOException, HttpMessageNotWritableException {
        String wireFeedEncoding = wireFeed.getEncoding();
        if (!StringUtils.hasLength(wireFeedEncoding)) {
            wireFeedEncoding = DEFAULT_CHARSET.name();
        }
        MediaType contentType = outputMessage.getHeaders().getContentType();
        if (contentType != null) {
            Charset wireFeedCharset = Charset.forName(wireFeedEncoding);
            outputMessage.getHeaders().setContentType(new MediaType(contentType.getType(), contentType.getSubtype(), wireFeedCharset));
        }
        WireFeedOutput feedOutput = new WireFeedOutput();
        try {
            Writer writer = new OutputStreamWriter(outputMessage.getBody(), wireFeedEncoding);
            feedOutput.output(wireFeed, writer);
        } catch (FeedException ex) {
            throw new HttpMessageNotWritableException("Could not write WiredFeed: " + ex.getMessage(), ex);
        }
    }
}
