package org.apache.commons.compress.compressors.pack200;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;
import java.util.jar.JarInputStream;
import java.util.jar.Pack200;
import org.apache.commons.compress.compressors.CompressorOutputStream;
import org.apache.commons.compress.utils.IOUtils;

/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream.class */
public class Pack200CompressorOutputStream extends CompressorOutputStream {
    private boolean finished;
    private final OutputStream originalOutput;
    private final StreamBridge streamBridge;
    private final Map<String, String> properties;

    public Pack200CompressorOutputStream(OutputStream out) throws IOException {
        this(out, Pack200Strategy.IN_MEMORY);
    }

    public Pack200CompressorOutputStream(OutputStream out, Pack200Strategy mode) throws IOException {
        this(out, mode, null);
    }

    public Pack200CompressorOutputStream(OutputStream out, Map<String, String> props) throws IOException {
        this(out, Pack200Strategy.IN_MEMORY, props);
    }

    public Pack200CompressorOutputStream(OutputStream out, Pack200Strategy mode, Map<String, String> props) throws IOException {
        this.finished = false;
        this.originalOutput = out;
        this.streamBridge = mode.newStreamBridge();
        this.properties = props;
    }

    @Override // java.io.OutputStream
    public void write(int b) throws IOException {
        this.streamBridge.write(b);
    }

    @Override // java.io.OutputStream
    public void write(byte[] b) throws IOException {
        this.streamBridge.write(b);
    }

    @Override // java.io.OutputStream
    public void write(byte[] b, int from, int length) throws IOException {
        this.streamBridge.write(b, from, length);
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        finish();
        try {
            this.streamBridge.stop();
            this.originalOutput.close();
        } catch (Throwable th) {
            this.originalOutput.close();
            throw th;
        }
    }

    public void finish() throws IOException {
        if (!this.finished) {
            this.finished = true;
            Pack200.Packer p = Pack200.newPacker();
            if (this.properties != null) {
                p.properties().putAll(this.properties);
            }
            JarInputStream ji = null;
            boolean success = false;
            try {
                JarInputStream jarInputStream = new JarInputStream(this.streamBridge.getInput());
                ji = jarInputStream;
                p.pack(jarInputStream, this.originalOutput);
                success = true;
                if (1 == 0) {
                    IOUtils.closeQuietly(ji);
                }
            } catch (Throwable th) {
                if (!success) {
                    IOUtils.closeQuietly(ji);
                }
                throw th;
            }
        }
    }
}
