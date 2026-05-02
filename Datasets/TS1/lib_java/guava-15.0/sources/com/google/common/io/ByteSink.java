package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.Charset;

/* loaded from: guava-15.0.jar:com/google/common/io/ByteSink.class */
public abstract class ByteSink implements OutputSupplier<OutputStream> {
    public abstract OutputStream openStream() throws IOException;

    public CharSink asCharSink(Charset charset) {
        return new AsCharSink(charset);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.google.common.io.OutputSupplier
    @Deprecated
    public final OutputStream getOutput() throws IOException {
        return openStream();
    }

    public OutputStream openBufferedStream() throws IOException {
        OutputStream out = openStream();
        return out instanceof BufferedOutputStream ? (BufferedOutputStream) out : new BufferedOutputStream(out);
    }

    public void write(byte[] bytes) throws IOException {
        RuntimeException rethrow;
        Preconditions.checkNotNull(bytes);
        Closer closer = Closer.create();
        try {
            try {
                OutputStream out = (OutputStream) closer.register(openStream());
                out.write(bytes);
                out.flush();
                closer.close();
            } finally {
            }
        } catch (Throwable th) {
            closer.close();
            throw th;
        }
    }

    public long writeFrom(InputStream input) throws IOException {
        RuntimeException rethrow;
        Preconditions.checkNotNull(input);
        Closer closer = Closer.create();
        try {
            try {
                OutputStream out = (OutputStream) closer.register(openStream());
                long written = ByteStreams.copy(input, out);
                out.flush();
                closer.close();
                return written;
            } finally {
            }
        } catch (Throwable th) {
            closer.close();
            throw th;
        }
    }

    /* loaded from: guava-15.0.jar:com/google/common/io/ByteSink$AsCharSink.class */
    private final class AsCharSink extends CharSink {
        private final Charset charset;

        private AsCharSink(Charset charset) {
            this.charset = (Charset) Preconditions.checkNotNull(charset);
        }

        @Override // com.google.common.io.CharSink
        public Writer openStream() throws IOException {
            return new OutputStreamWriter(ByteSink.this.openStream(), this.charset);
        }

        public String toString() {
            return ByteSink.this.toString() + ".asCharSink(" + this.charset + ")";
        }
    }
}
