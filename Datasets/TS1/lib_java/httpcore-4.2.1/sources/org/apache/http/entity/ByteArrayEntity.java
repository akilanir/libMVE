package org.apache.http.entity;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.http.annotation.NotThreadSafe;

@NotThreadSafe
/* loaded from: httpcore-4.2.1.jar:org/apache/http/entity/ByteArrayEntity.class */
public class ByteArrayEntity extends AbstractHttpEntity implements Cloneable {

    @Deprecated
    protected final byte[] content;
    private final byte[] b;
    private final int off;
    private final int len;

    public ByteArrayEntity(byte[] b, ContentType contentType) {
        if (b == null) {
            throw new IllegalArgumentException("Source byte array may not be null");
        }
        this.content = b;
        this.b = b;
        this.off = 0;
        this.len = this.b.length;
        if (contentType != null) {
            setContentType(contentType.toString());
        }
    }

    public ByteArrayEntity(byte[] b, int off, int len, ContentType contentType) {
        if (b == null) {
            throw new IllegalArgumentException("Source byte array may not be null");
        }
        if (off < 0 || off > b.length || len < 0 || off + len < 0 || off + len > b.length) {
            throw new IndexOutOfBoundsException("off: " + off + " len: " + len + " b.length: " + b.length);
        }
        this.content = b;
        this.b = b;
        this.off = off;
        this.len = len;
        if (contentType != null) {
            setContentType(contentType.toString());
        }
    }

    public ByteArrayEntity(byte[] b) {
        this(b, null);
    }

    public ByteArrayEntity(byte[] b, int off, int len) {
        this(b, off, len, null);
    }

    @Override // org.apache.http.HttpEntity
    public boolean isRepeatable() {
        return true;
    }

    @Override // org.apache.http.HttpEntity
    public long getContentLength() {
        return this.len;
    }

    @Override // org.apache.http.HttpEntity
    public InputStream getContent() {
        return new ByteArrayInputStream(this.b, this.off, this.len);
    }

    @Override // org.apache.http.HttpEntity
    public void writeTo(OutputStream outstream) throws IOException {
        if (outstream == null) {
            throw new IllegalArgumentException("Output stream may not be null");
        }
        outstream.write(this.b, this.off, this.len);
        outstream.flush();
    }

    @Override // org.apache.http.HttpEntity
    public boolean isStreaming() {
        return false;
    }

    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
