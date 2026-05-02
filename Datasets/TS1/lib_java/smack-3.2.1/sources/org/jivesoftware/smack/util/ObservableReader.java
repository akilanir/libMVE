package org.jivesoftware.smack.util;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/ObservableReader.class */
public class ObservableReader extends Reader {
    Reader wrappedReader;
    List listeners = new ArrayList();

    public ObservableReader(Reader wrappedReader) {
        this.wrappedReader = null;
        this.wrappedReader = wrappedReader;
    }

    @Override // java.io.Reader
    public int read(char[] cbuf, int off, int len) throws IOException {
        ReaderListener[] readerListeners;
        int count = this.wrappedReader.read(cbuf, off, len);
        if (count > 0) {
            String str = new String(cbuf, off, count);
            synchronized (this.listeners) {
                readerListeners = new ReaderListener[this.listeners.size()];
                this.listeners.toArray(readerListeners);
            }
            for (ReaderListener readerListener : readerListeners) {
                readerListener.read(str);
            }
        }
        return count;
    }

    @Override // java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.wrappedReader.close();
    }

    @Override // java.io.Reader
    public int read() throws IOException {
        return this.wrappedReader.read();
    }

    @Override // java.io.Reader
    public int read(char[] cbuf) throws IOException {
        return this.wrappedReader.read(cbuf);
    }

    @Override // java.io.Reader
    public long skip(long n) throws IOException {
        return this.wrappedReader.skip(n);
    }

    @Override // java.io.Reader
    public boolean ready() throws IOException {
        return this.wrappedReader.ready();
    }

    @Override // java.io.Reader
    public boolean markSupported() {
        return this.wrappedReader.markSupported();
    }

    @Override // java.io.Reader
    public void mark(int readAheadLimit) throws IOException {
        this.wrappedReader.mark(readAheadLimit);
    }

    @Override // java.io.Reader
    public void reset() throws IOException {
        this.wrappedReader.reset();
    }

    public void addReaderListener(ReaderListener readerListener) {
        if (readerListener == null) {
            return;
        }
        synchronized (this.listeners) {
            if (!this.listeners.contains(readerListener)) {
                this.listeners.add(readerListener);
            }
        }
    }

    public void removeReaderListener(ReaderListener readerListener) {
        synchronized (this.listeners) {
            this.listeners.remove(readerListener);
        }
    }
}
