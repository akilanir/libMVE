package com.sun.mail.util;

import java.io.IOException;
import java.io.OutputStream;
import java.util.concurrent.Callable;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

/* compiled from: WriteTimeoutSocket.java */
/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/TimeoutOutputStream.class */
class TimeoutOutputStream extends OutputStream {
    private final OutputStream os;
    private final ScheduledExecutorService ses;
    private final Callable<Object> timeoutTask = new Callable<Object>() { // from class: com.sun.mail.util.TimeoutOutputStream.1
        @Override // java.util.concurrent.Callable
        public Object call() throws Exception {
            TimeoutOutputStream.this.os.close();
            return null;
        }
    };
    private final int timeout;
    private byte[] b1;

    public TimeoutOutputStream(OutputStream os0, ScheduledExecutorService ses, int timeout) throws IOException {
        this.os = os0;
        this.ses = ses;
        this.timeout = timeout;
    }

    @Override // java.io.OutputStream
    public synchronized void write(int b) throws IOException {
        if (this.b1 == null) {
            this.b1 = new byte[1];
        }
        this.b1[0] = (byte) b;
        write(this.b1);
    }

    @Override // java.io.OutputStream
    public synchronized void write(byte[] bs, int off, int len) throws IOException {
        if (off < 0 || off > bs.length || len < 0 || off + len > bs.length || off + len < 0) {
            throw new IndexOutOfBoundsException();
        }
        if (len == 0) {
            return;
        }
        ScheduledFuture<Object> sf = null;
        try {
            try {
                if (this.timeout > 0) {
                    sf = this.ses.schedule(this.timeoutTask, this.timeout, TimeUnit.MILLISECONDS);
                }
            } catch (RejectedExecutionException e) {
            }
            this.os.write(bs, off, len);
            if (sf != null) {
                sf.cancel(true);
            }
        } catch (Throwable th) {
            if (sf != null) {
                sf.cancel(true);
            }
            throw th;
        }
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.os.close();
    }
}
