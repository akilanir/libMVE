package com.facebook.stetho.inspector.network;

import com.facebook.stetho.common.ExceptionUtil;
import com.facebook.stetho.common.Util;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PipedInputStream;
import java.io.PipedOutputStream;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.zip.GZIPInputStream;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/network/GunzippingOutputStream.class */
class GunzippingOutputStream extends FilterOutputStream {
    private final Future<Void> mCopyFuture;
    private static final ExecutorService sExecutor = Executors.newCachedThreadPool();

    public static GunzippingOutputStream create(OutputStream finalOut) throws IOException {
        PipedInputStream pipeIn = new PipedInputStream();
        PipedOutputStream pipeOut = new PipedOutputStream(pipeIn);
        Future<Void> copyFuture = sExecutor.submit(new GunzippingCallable(pipeIn, finalOut));
        return new GunzippingOutputStream(pipeOut, copyFuture);
    }

    private GunzippingOutputStream(OutputStream out, Future<Void> copyFuture) throws IOException {
        super(out);
        this.mCopyFuture = copyFuture;
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        boolean success = false;
        try {
            super.close();
            success = true;
            try {
                getAndRethrow(this.mCopyFuture);
            } catch (IOException e) {
                if (1 != 0) {
                    throw e;
                }
            }
        } catch (Throwable th) {
            try {
                getAndRethrow(this.mCopyFuture);
            } catch (IOException e2) {
                if (success) {
                    throw e2;
                }
            }
            throw th;
        }
    }

    private static <T> T getAndRethrow(Future<T> future) throws IOException {
        while (true) {
            try {
                return future.get();
            } catch (InterruptedException e) {
            } catch (ExecutionException e2) {
                Throwable cause = e2.getCause();
                ExceptionUtil.propagateIfInstanceOf(cause, IOException.class);
                ExceptionUtil.propagate(cause);
            }
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/network/GunzippingOutputStream$GunzippingCallable.class */
    private static class GunzippingCallable implements Callable<Void> {
        private final InputStream mIn;
        private final OutputStream mOut;

        public GunzippingCallable(InputStream in, OutputStream out) {
            this.mIn = in;
            this.mOut = out;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.concurrent.Callable
        public Void call() throws IOException {
            GZIPInputStream in = new GZIPInputStream(this.mIn);
            try {
                Util.copy(in, this.mOut, new byte[1024]);
                return null;
            } finally {
                in.close();
                this.mOut.close();
            }
        }
    }
}
