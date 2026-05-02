package org.apache.http.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.charset.Charset;
import org.apache.http.HeaderElement;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.entity.ContentType;
import org.apache.http.protocol.HTTP;

/* loaded from: httpcore-4.2.1.jar:org/apache/http/util/EntityUtils.class */
public final class EntityUtils {
    private EntityUtils() {
    }

    public static void consumeQuietly(HttpEntity entity) {
        try {
            consume(entity);
        } catch (IOException e) {
        }
    }

    public static void consume(HttpEntity entity) throws IOException {
        InputStream instream;
        if (entity != null && entity.isStreaming() && (instream = entity.getContent()) != null) {
            instream.close();
        }
    }

    public static byte[] toByteArray(HttpEntity entity) throws IOException {
        if (entity == null) {
            throw new IllegalArgumentException("HTTP entity may not be null");
        }
        InputStream instream = entity.getContent();
        if (instream == null) {
            return null;
        }
        try {
            if (entity.getContentLength() > 2147483647L) {
                throw new IllegalArgumentException("HTTP entity too large to be buffered in memory");
            }
            int i = (int) entity.getContentLength();
            if (i < 0) {
                i = 4096;
            }
            ByteArrayBuffer buffer = new ByteArrayBuffer(i);
            byte[] tmp = new byte[4096];
            while (true) {
                int l = instream.read(tmp);
                if (l != -1) {
                    buffer.append(tmp, 0, l);
                } else {
                    byte[] byteArray = buffer.toByteArray();
                    instream.close();
                    return byteArray;
                }
            }
        } catch (Throwable th) {
            instream.close();
            throw th;
        }
    }

    @Deprecated
    public static String getContentCharSet(HttpEntity entity) throws ParseException {
        NameValuePair param;
        if (entity == null) {
            throw new IllegalArgumentException("HTTP entity may not be null");
        }
        String charset = null;
        if (entity.getContentType() != null) {
            HeaderElement[] values = entity.getContentType().getElements();
            if (values.length > 0 && (param = values[0].getParameterByName("charset")) != null) {
                charset = param.getValue();
            }
        }
        return charset;
    }

    @Deprecated
    public static String getContentMimeType(HttpEntity entity) throws ParseException {
        if (entity == null) {
            throw new IllegalArgumentException("HTTP entity may not be null");
        }
        String mimeType = null;
        if (entity.getContentType() != null) {
            HeaderElement[] values = entity.getContentType().getElements();
            if (values.length > 0) {
                mimeType = values[0].getName();
            }
        }
        return mimeType;
    }

    public static String toString(HttpEntity entity, Charset defaultCharset) throws IOException, ParseException {
        if (entity == null) {
            throw new IllegalArgumentException("HTTP entity may not be null");
        }
        InputStream instream = entity.getContent();
        if (instream == null) {
            return null;
        }
        try {
            if (entity.getContentLength() > 2147483647L) {
                throw new IllegalArgumentException("HTTP entity too large to be buffered in memory");
            }
            int i = (int) entity.getContentLength();
            if (i < 0) {
                i = 4096;
            }
            ContentType contentType = ContentType.getOrDefault(entity);
            Charset charset = contentType.getCharset();
            if (charset == null) {
                charset = defaultCharset;
            }
            if (charset == null) {
                charset = HTTP.DEF_CONTENT_CHARSET;
            }
            Reader reader = new InputStreamReader(instream, charset);
            CharArrayBuffer buffer = new CharArrayBuffer(i);
            char[] tmp = new char[1024];
            while (true) {
                int l = reader.read(tmp);
                if (l != -1) {
                    buffer.append(tmp, 0, l);
                } else {
                    String charArrayBuffer = buffer.toString();
                    instream.close();
                    return charArrayBuffer;
                }
            }
        } catch (Throwable th) {
            instream.close();
            throw th;
        }
    }

    public static String toString(HttpEntity entity, String defaultCharset) throws IOException, ParseException {
        return toString(entity, Charset.forName(defaultCharset));
    }

    public static String toString(HttpEntity entity) throws IOException, ParseException {
        return toString(entity, (Charset) null);
    }
}
