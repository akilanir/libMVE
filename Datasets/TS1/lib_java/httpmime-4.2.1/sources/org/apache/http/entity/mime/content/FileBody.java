package org.apache.http.entity.mime.content;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.http.entity.mime.MIME;

/* loaded from: httpmime-4.2.1.jar:org/apache/http/entity/mime/content/FileBody.class */
public class FileBody extends AbstractContentBody {
    private final File file;
    private final String filename;
    private final String charset;

    public FileBody(File file, String filename, String mimeType, String charset) {
        super(mimeType);
        if (file == null) {
            throw new IllegalArgumentException("File may not be null");
        }
        this.file = file;
        if (filename != null) {
            this.filename = filename;
        } else {
            this.filename = file.getName();
        }
        this.charset = charset;
    }

    public FileBody(File file, String mimeType, String charset) {
        this(file, null, mimeType, charset);
    }

    public FileBody(File file, String mimeType) {
        this(file, mimeType, null);
    }

    public FileBody(File file) {
        this(file, "application/octet-stream");
    }

    public InputStream getInputStream() throws IOException {
        return new FileInputStream(this.file);
    }

    @Override // org.apache.http.entity.mime.content.ContentBody
    public void writeTo(OutputStream out) throws IOException {
        if (out == null) {
            throw new IllegalArgumentException("Output stream may not be null");
        }
        InputStream in = new FileInputStream(this.file);
        try {
            byte[] tmp = new byte[4096];
            while (true) {
                int l = in.read(tmp);
                if (l != -1) {
                    out.write(tmp, 0, l);
                } else {
                    out.flush();
                    in.close();
                    return;
                }
            }
        } catch (Throwable th) {
            in.close();
            throw th;
        }
    }

    @Override // org.apache.http.entity.mime.content.ContentDescriptor
    public String getTransferEncoding() {
        return MIME.ENC_BINARY;
    }

    @Override // org.apache.http.entity.mime.content.ContentDescriptor
    public String getCharset() {
        return this.charset;
    }

    @Override // org.apache.http.entity.mime.content.ContentDescriptor
    public long getContentLength() {
        return this.file.length();
    }

    @Override // org.apache.http.entity.mime.content.ContentBody
    public String getFilename() {
        return this.filename;
    }

    public File getFile() {
        return this.file;
    }
}
