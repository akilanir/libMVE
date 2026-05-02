package org.apache.http.entity.mime.content;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.http.entity.mime.MIME;

/* loaded from: httpmime-4.2.1.jar:org/apache/http/entity/mime/content/InputStreamBody.class */
public class InputStreamBody extends AbstractContentBody {
    private final InputStream in;
    private final String filename;

    public InputStreamBody(InputStream in, String mimeType, String filename) {
        super(mimeType);
        if (in == null) {
            throw new IllegalArgumentException("Input stream may not be null");
        }
        this.in = in;
        this.filename = filename;
    }

    public InputStreamBody(InputStream in, String filename) {
        this(in, "application/octet-stream", filename);
    }

    public InputStream getInputStream() {
        return this.in;
    }

    @Override // org.apache.http.entity.mime.content.ContentBody
    public void writeTo(OutputStream out) throws IOException {
        if (out == null) {
            throw new IllegalArgumentException("Output stream may not be null");
        }
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

    @Override // org.apache.http.entity.mime.content.ContentDescriptor
    public String getTransferEncoding() {
        return MIME.ENC_BINARY;
    }

    @Override // org.apache.http.entity.mime.content.ContentDescriptor
    public String getCharset() {
        return null;
    }

    @Override // org.apache.http.entity.mime.content.ContentDescriptor
    public long getContentLength() {
        return -1L;
    }

    @Override // org.apache.http.entity.mime.content.ContentBody
    public String getFilename() {
        return this.filename;
    }
}
