package com.sun.mail.pop3;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import korex.mail.util.SharedFileInputStream;

/* compiled from: TempFile.java */
/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/pop3/WritableSharedFile.class */
class WritableSharedFile extends SharedFileInputStream {
    private RandomAccessFile raf;
    private AppendStream af;

    public WritableSharedFile(File file) throws IOException {
        super(file);
        try {
            this.raf = new RandomAccessFile(file, "rw");
        } catch (IOException e) {
            super.close();
        }
    }

    public RandomAccessFile getWritableFile() {
        return this.raf;
    }

    @Override // korex.mail.util.SharedFileInputStream, java.io.BufferedInputStream, java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        try {
            super.close();
        } finally {
            this.raf.close();
        }
    }

    synchronized long updateLength() throws IOException {
        this.datalen = this.in.length();
        this.af = null;
        return this.datalen;
    }

    public synchronized AppendStream getAppendStream() throws IOException {
        if (this.af != null) {
            throw new IOException("POP3 file cache only supports single threaded access");
        }
        this.af = new AppendStream(this);
        return this.af;
    }
}
