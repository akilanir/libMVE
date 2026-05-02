package org.apache.commons.compress.parallel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/parallel/FileBasedScatterGatherBackingStore.class */
public class FileBasedScatterGatherBackingStore implements ScatterGatherBackingStore {
    private final File target;
    private final FileOutputStream os;
    private boolean closed;

    public FileBasedScatterGatherBackingStore(File target) throws FileNotFoundException {
        this.target = target;
        this.os = new FileOutputStream(target);
    }

    @Override // org.apache.commons.compress.parallel.ScatterGatherBackingStore
    public InputStream getInputStream() throws IOException {
        return new FileInputStream(this.target);
    }

    @Override // org.apache.commons.compress.parallel.ScatterGatherBackingStore
    public void closeForWriting() throws IOException {
        if (!this.closed) {
            this.os.close();
            this.closed = true;
        }
    }

    @Override // org.apache.commons.compress.parallel.ScatterGatherBackingStore
    public void writeOut(byte[] data, int offset, int length) throws IOException {
        this.os.write(data, offset, length);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        closeForWriting();
        this.target.delete();
    }
}
