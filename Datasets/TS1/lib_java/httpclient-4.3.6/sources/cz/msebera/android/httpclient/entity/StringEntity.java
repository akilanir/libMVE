package cz.msebera.android.httpclient.entity;

import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.protocol.HTTP;
import cz.msebera.android.httpclient.util.Args;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.charset.UnsupportedCharsetException;

@NotThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/entity/StringEntity.class */
public class StringEntity extends AbstractHttpEntity implements Cloneable {
    protected final byte[] content;

    public StringEntity(String string, ContentType contentType) throws UnsupportedCharsetException {
        Args.notNull(string, "Source string");
        Charset charset = contentType != null ? contentType.getCharset() : null;
        charset = charset == null ? HTTP.DEF_CONTENT_CHARSET : charset;
        try {
            this.content = string.getBytes(charset.name());
            if (contentType != null) {
                setContentType(contentType.toString());
            }
        } catch (UnsupportedEncodingException e) {
            throw new UnsupportedCharsetException(charset.name());
        }
    }

    @Deprecated
    public StringEntity(String string, String mimeType, String charset) throws UnsupportedEncodingException {
        Args.notNull(string, "Source string");
        String mt = mimeType != null ? mimeType : HTTP.PLAIN_TEXT_TYPE;
        String cs = charset != null ? charset : "ISO-8859-1";
        this.content = string.getBytes(cs);
        setContentType(mt + HTTP.CHARSET_PARAM + cs);
    }

    public StringEntity(String string, String charset) throws UnsupportedCharsetException {
        this(string, ContentType.create(ContentType.TEXT_PLAIN.getMimeType(), charset));
    }

    public StringEntity(String string, Charset charset) {
        this(string, ContentType.create(ContentType.TEXT_PLAIN.getMimeType(), charset));
    }

    public StringEntity(String string) throws UnsupportedEncodingException {
        this(string, ContentType.DEFAULT_TEXT);
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public boolean isRepeatable() {
        return true;
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public long getContentLength() {
        return this.content.length;
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public InputStream getContent() throws IOException {
        return new ByteArrayInputStream(this.content);
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public void writeTo(OutputStream outstream) throws IOException {
        Args.notNull(outstream, "Output stream");
        outstream.write(this.content);
        outstream.flush();
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public boolean isStreaming() {
        return false;
    }

    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
