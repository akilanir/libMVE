package cz.msebera.android.httpclient.client.entity;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.entity.HttpEntityWrapper;
import cz.msebera.android.httpclient.message.BasicHeader;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.zip.GZIPOutputStream;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/entity/GzipCompressingEntity.class */
public class GzipCompressingEntity extends HttpEntityWrapper {
    private static final String GZIP_CODEC = "gzip";

    public GzipCompressingEntity(HttpEntity entity) {
        super(entity);
    }

    @Override // cz.msebera.android.httpclient.entity.HttpEntityWrapper, cz.msebera.android.httpclient.HttpEntity
    public Header getContentEncoding() {
        return new BasicHeader("Content-Encoding", GZIP_CODEC);
    }

    @Override // cz.msebera.android.httpclient.entity.HttpEntityWrapper, cz.msebera.android.httpclient.HttpEntity
    public long getContentLength() {
        return -1L;
    }

    @Override // cz.msebera.android.httpclient.entity.HttpEntityWrapper, cz.msebera.android.httpclient.HttpEntity
    public boolean isChunked() {
        return true;
    }

    @Override // cz.msebera.android.httpclient.entity.HttpEntityWrapper, cz.msebera.android.httpclient.HttpEntity
    public InputStream getContent() throws IOException {
        throw new UnsupportedOperationException();
    }

    @Override // cz.msebera.android.httpclient.entity.HttpEntityWrapper, cz.msebera.android.httpclient.HttpEntity
    public void writeTo(OutputStream outstream) throws IOException {
        Args.notNull(outstream, "Output stream");
        GZIPOutputStream gzip = new GZIPOutputStream(outstream);
        this.wrappedEntity.writeTo(gzip);
        gzip.close();
    }
}
