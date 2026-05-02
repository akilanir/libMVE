package cz.msebera.android.httpclient.client.entity;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpEntity;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/entity/DeflateDecompressingEntity.class */
public class DeflateDecompressingEntity extends DecompressingEntity {
    @Override // cz.msebera.android.httpclient.client.entity.DecompressingEntity, cz.msebera.android.httpclient.entity.HttpEntityWrapper, cz.msebera.android.httpclient.HttpEntity
    public /* bridge */ /* synthetic */ void writeTo(OutputStream outputStream) throws IOException {
        super.writeTo(outputStream);
    }

    @Override // cz.msebera.android.httpclient.client.entity.DecompressingEntity, cz.msebera.android.httpclient.entity.HttpEntityWrapper, cz.msebera.android.httpclient.HttpEntity
    public /* bridge */ /* synthetic */ InputStream getContent() throws IOException {
        return super.getContent();
    }

    public DeflateDecompressingEntity(HttpEntity entity) {
        super(entity);
    }

    @Override // cz.msebera.android.httpclient.client.entity.DecompressingEntity
    InputStream decorate(InputStream wrapped) throws IOException {
        return new DeflateInputStream(wrapped);
    }

    @Override // cz.msebera.android.httpclient.entity.HttpEntityWrapper, cz.msebera.android.httpclient.HttpEntity
    public Header getContentEncoding() {
        return null;
    }

    @Override // cz.msebera.android.httpclient.entity.HttpEntityWrapper, cz.msebera.android.httpclient.HttpEntity
    public long getContentLength() {
        return -1L;
    }
}
