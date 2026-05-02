package org.apache.commons.io.output;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import org.apache.commons.io.IOUtils;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/output/DeferredFileOutputStream.class */
public class DeferredFileOutputStream extends ThresholdingOutputStream {
    private ByteArrayOutputStream memoryOutputStream;
    private OutputStream currentOutputStream;
    private File outputFile;
    private boolean closed;

    public DeferredFileOutputStream(int threshold, File outputFile) {
        super(threshold);
        this.closed = false;
        this.outputFile = outputFile;
        this.memoryOutputStream = new ByteArrayOutputStream();
        this.currentOutputStream = this.memoryOutputStream;
    }

    @Override // org.apache.commons.io.output.ThresholdingOutputStream
    protected OutputStream getStream() throws IOException {
        return this.currentOutputStream;
    }

    @Override // org.apache.commons.io.output.ThresholdingOutputStream
    protected void thresholdReached() throws IOException {
        FileOutputStream fos = new FileOutputStream(this.outputFile);
        this.memoryOutputStream.writeTo(fos);
        this.currentOutputStream = fos;
        this.memoryOutputStream = null;
    }

    public boolean isInMemory() {
        return !isThresholdExceeded();
    }

    public byte[] getData() {
        if (this.memoryOutputStream != null) {
            return this.memoryOutputStream.toByteArray();
        }
        return null;
    }

    public File getFile() {
        return this.outputFile;
    }

    @Override // org.apache.commons.io.output.ThresholdingOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        super.close();
        this.closed = true;
    }

    public void writeTo(OutputStream out) throws IOException {
        if (!this.closed) {
            throw new IOException("Stream not closed");
        }
        if (isInMemory()) {
            this.memoryOutputStream.writeTo(out);
            return;
        }
        FileInputStream fis = new FileInputStream(this.outputFile);
        try {
            IOUtils.copy(fis, out);
            IOUtils.closeQuietly(fis);
        } catch (Throwable th) {
            IOUtils.closeQuietly(fis);
            throw th;
        }
    }
}
