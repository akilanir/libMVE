package org.apache.commons.compress.compressors.deflate;

import java.io.IOException;
import java.io.OutputStream;
import java.util.zip.Deflater;
import java.util.zip.DeflaterOutputStream;
import org.apache.commons.compress.compressors.CompressorOutputStream;

/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/compressors/deflate/DeflateCompressorOutputStream.class */
public class DeflateCompressorOutputStream extends CompressorOutputStream {
    private final DeflaterOutputStream out;

    public DeflateCompressorOutputStream(OutputStream outputStream) throws IOException {
        this(outputStream, new DeflateParameters());
    }

    public DeflateCompressorOutputStream(OutputStream outputStream, DeflateParameters parameters) throws IOException {
        this.out = new DeflaterOutputStream(outputStream, new Deflater(parameters.getCompressionLevel(), !parameters.withZlibHeader()));
    }

    @Override // java.io.OutputStream
    public void write(int b) throws IOException {
        this.out.write(b);
    }

    @Override // java.io.OutputStream
    public void write(byte[] buf, int off, int len) throws IOException {
        this.out.write(buf, off, len);
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        this.out.flush();
    }

    public void finish() throws IOException {
        this.out.finish();
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.out.close();
    }
}
