package org.mozilla.javascript.tools.shell;

import java.io.OutputStream;
import javax.swing.SwingUtilities;

/* compiled from: ConsoleTextArea.java */
/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/ConsoleWriter.class */
class ConsoleWriter extends OutputStream {
    private ConsoleTextArea textArea;
    private StringBuffer buffer = new StringBuffer();

    public ConsoleWriter(ConsoleTextArea textArea) {
        this.textArea = textArea;
    }

    @Override // java.io.OutputStream
    public synchronized void write(int ch) {
        this.buffer.append((char) ch);
        if (ch == 10) {
            flushBuffer();
        }
    }

    public synchronized void write(char[] data, int off, int len) {
        for (int i = off; i < len; i++) {
            this.buffer.append(data[i]);
            if (data[i] == '\n') {
                flushBuffer();
            }
        }
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public synchronized void flush() {
        if (this.buffer.length() > 0) {
            flushBuffer();
        }
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        flush();
    }

    private void flushBuffer() {
        String str = this.buffer.toString();
        this.buffer.setLength(0);
        SwingUtilities.invokeLater(new ConsoleWrite(this.textArea, str));
    }
}
