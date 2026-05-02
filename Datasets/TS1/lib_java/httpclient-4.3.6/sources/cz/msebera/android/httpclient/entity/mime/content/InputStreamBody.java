package cz.msebera.android.httpclient.entity.mime.content;

import cz.msebera.android.httpclient.entity.ContentType;
import cz.msebera.android.httpclient.entity.mime.MIME;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/entity/mime/content/InputStreamBody.class */
public class InputStreamBody extends AbstractContentBody {
    private final InputStream in;
    private final String filename;

    @Deprecated
    public InputStreamBody(InputStream in, String mimeType, String filename) {
        this(in, ContentType.create(mimeType), filename);
    }

    public InputStreamBody(InputStream in, String filename) {
        this(in, ContentType.DEFAULT_BINARY, filename);
    }

    public InputStreamBody(InputStream in, ContentType contentType, String filename) {
        super(contentType);
        Args.notNull(in, "Input stream");
        this.in = in;
        this.filename = filename;
    }

    public InputStreamBody(InputStream in, ContentType contentType) {
        this(in, contentType, (String) null);
    }

    public InputStream getInputStream() {
        return this.in;
    }

    @Override // cz.msebera.android.httpclient.entity.mime.content.ContentBody
    public void writeTo(OutputStream out) throws IOException {
        Args.notNull(out, "Output stream");
        try {
            byte[] tmp = new byte[4096];
            while (true) {
                int l = this.in.read(tmp);
                if (l != -1) {
                    out.write(tmp, 0, l);
                } else {
                    out.flush();
                    this.in.close();
                    return;
                }
            }
        } catch (Throwable th) {
            this.in.close();
            throw th;
        }
    }

    @Override // cz.msebera.android.httpclient.entity.mime.content.ContentDescriptor
    public String getTransferEncoding() {
        return MIME.ENC_BINARY;
    }

    @Override // cz.msebera.android.httpclient.entity.mime.content.ContentDescriptor
    public long getContentLength() {
        return -1L;
    }

    @Override // cz.msebera.android.httpclient.entity.mime.content.ContentBody
    public String getFilename() {
        return this.filename;
    }
}
