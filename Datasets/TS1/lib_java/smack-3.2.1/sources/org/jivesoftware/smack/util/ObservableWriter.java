package org.jivesoftware.smack.util;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/ObservableWriter.class */
public class ObservableWriter extends Writer {
    Writer wrappedWriter;
    List listeners = new ArrayList();

    public ObservableWriter(Writer wrappedWriter) {
        this.wrappedWriter = null;
        this.wrappedWriter = wrappedWriter;
    }

    @Override // java.io.Writer
    public void write(char[] cbuf, int off, int len) throws IOException {
        this.wrappedWriter.write(cbuf, off, len);
        String str = new String(cbuf, off, len);
        notifyListeners(str);
    }

    @Override // java.io.Writer, java.io.Flushable
    public void flush() throws IOException {
        this.wrappedWriter.flush();
    }

    @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.wrappedWriter.close();
    }

    @Override // java.io.Writer
    public void write(int c) throws IOException {
        this.wrappedWriter.write(c);
    }

    @Override // java.io.Writer
    public void write(char[] cbuf) throws IOException {
        this.wrappedWriter.write(cbuf);
        String str = new String(cbuf);
        notifyListeners(str);
    }

    @Override // java.io.Writer
    public void write(String str) throws IOException {
        this.wrappedWriter.write(str);
        notifyListeners(str);
    }

    @Override // java.io.Writer
    public void write(String str, int off, int len) throws IOException {
        this.wrappedWriter.write(str, off, len);
        notifyListeners(str.substring(off, off + len));
    }

    private void notifyListeners(String str) {
        WriterListener[] writerListeners;
        synchronized (this.listeners) {
            writerListeners = new WriterListener[this.listeners.size()];
            this.listeners.toArray(writerListeners);
        }
        for (WriterListener writerListener : writerListeners) {
            writerListener.write(str);
        }
    }

    public void addWriterListener(WriterListener writerListener) {
        if (writerListener == null) {
            return;
        }
        synchronized (this.listeners) {
            if (!this.listeners.contains(writerListener)) {
                this.listeners.add(writerListener);
            }
        }
    }

    public void removeWriterListener(WriterListener writerListener) {
        synchronized (this.listeners) {
            this.listeners.remove(writerListener);
        }
    }
}
