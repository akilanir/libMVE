package org.apache.http.entity;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.http.annotation.NotThreadSafe;

@NotThreadSafe
/* loaded from: httpcore-4.2.1.jar:org/apache/http/entity/FileEntity.class */
public class FileEntity extends AbstractHttpEntity implements Cloneable {
    protected final File file;

    @Deprecated
    public FileEntity(File file, String contentType) {
        if (file == null) {
            throw new IllegalArgumentException("File may not be null");
        }
        this.file = file;
        setContentType(contentType);
    }

    public FileEntity(File file, ContentType contentType) {
        if (file == null) {
            throw new IllegalArgumentException("File may not be null");
        }
        this.file = file;
        if (contentType != null) {
            setContentType(contentType.toString());
        }
    }

    public FileEntity(File file) {
        if (file == null) {
            throw new IllegalArgumentException("File may not be null");
        }
        this.file = file;
    }

    @Override // org.apache.http.HttpEntity
    public boolean isRepeatable() {
        return true;
    }

    @Override // org.apache.http.HttpEntity
    public long getContentLength() {
        return this.file.length();
    }

    @Override // org.apache.http.HttpEntity
    public InputStream getContent() throws IOException {
        return new FileInputStream(this.file);
    }

    @Override // org.apache.http.HttpEntity
    public void writeTo(OutputStream outstream) throws IOException {
        if (outstream == null) {
            throw new IllegalArgumentException("Output stream may not be null");
        }
        InputStream instream = new FileInputStream(this.file);
        try {
            byte[] tmp = new byte[4096];
            while (true) {
                int l = instream.read(tmp);
                if (l != -1) {
                    outstream.write(tmp, 0, l);
                } else {
                    outstream.flush();
                    instream.close();
                    return;
                }
            }
        } catch (Throwable th) {
            instream.close();
            throw th;
        }
    }

    @Override // org.apache.http.HttpEntity
    public boolean isStreaming() {
        return false;
    }

    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
