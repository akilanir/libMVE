package org.springframework.http.converter.feed;

import android.os.Build;
import com.google.code.rome.android.repackaged.com.sun.syndication.feed.synd.SyndFeed;
import com.google.code.rome.android.repackaged.com.sun.syndication.io.FeedException;
import com.google.code.rome.android.repackaged.com.sun.syndication.io.SyndFeedInput;
import com.google.code.rome.android.repackaged.com.sun.syndication.io.SyndFeedOutput;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.Writer;
import java.nio.charset.Charset;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.http.converter.AbstractHttpMessageConverter;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.util.StringUtils;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/converter/feed/SyndFeedHttpMessageConverter.class */
public class SyndFeedHttpMessageConverter extends AbstractHttpMessageConverter<SyndFeed> {
    public static final Charset DEFAULT_CHARSET = Charset.forName("UTF-8");

    public SyndFeedHttpMessageConverter() {
        super(MediaType.APPLICATION_RSS_XML, MediaType.APPLICATION_ATOM_XML);
        if (Build.VERSION.SDK_INT < 8) {
            Thread.currentThread().setContextClassLoader(getClass().getClassLoader());
        }
    }

    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    protected boolean supports(Class<?> clazz) {
        return SyndFeed.class.isAssignableFrom(clazz);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    public SyndFeed readInternal(Class<? extends SyndFeed> clazz, HttpInputMessage inputMessage) throws IOException, HttpMessageNotReadableException {
        Charset charset;
        SyndFeedInput feedInput = new SyndFeedInput();
        MediaType contentType = inputMessage.getHeaders().getContentType();
        if (contentType != null && contentType.getCharSet() != null) {
            charset = contentType.getCharSet();
        } else {
            charset = DEFAULT_CHARSET;
        }
        try {
            Reader reader = new InputStreamReader(inputMessage.getBody(), charset);
            return feedInput.build(reader);
        } catch (FeedException ex) {
            throw new HttpMessageNotReadableException("Could not read SyndFeed: " + ex.getMessage(), ex);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    public void writeInternal(SyndFeed syndFeed, HttpOutputMessage outputMessage) throws IOException, HttpMessageNotWritableException {
        String syndFeedEncoding = syndFeed.getEncoding();
        if (!StringUtils.hasLength(syndFeedEncoding)) {
            syndFeedEncoding = DEFAULT_CHARSET.name();
        }
        MediaType contentType = outputMessage.getHeaders().getContentType();
        if (contentType != null) {
            Charset syndFeedCharset = Charset.forName(syndFeedEncoding);
            outputMessage.getHeaders().setContentType(new MediaType(contentType.getType(), contentType.getSubtype(), syndFeedCharset));
        }
        SyndFeedOutput feedOutput = new SyndFeedOutput();
        try {
            Writer writer = new OutputStreamWriter(outputMessage.getBody(), syndFeedEncoding);
            feedOutput.output(syndFeed, writer);
        } catch (FeedException ex) {
            throw new HttpMessageNotWritableException("Could not write SyndFeed: " + ex.getMessage(), ex);
        }
    }
}
