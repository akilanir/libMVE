package com.facebook.stetho.server;

import android.net.LocalServerSocket;
import android.net.LocalSocket;
import com.facebook.stetho.common.LogUtil;
import com.facebook.stetho.common.Util;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.BindException;
import java.net.SocketException;
import java.util.concurrent.atomic.AtomicInteger;
import javax.annotation.Nonnull;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/server/LocalSocketServer.class */
public class LocalSocketServer {
    private static final String WORKER_THREAD_NAME_PREFIX = "StethoWorker";
    private static final int MAX_BIND_RETRIES = 2;
    private static final int TIME_BETWEEN_BIND_RETRIES_MS = 1000;
    private final String mFriendlyName;
    private final String mAddress;
    private final SocketHandler mSocketHandler;
    private final AtomicInteger mThreadId = new AtomicInteger();
    private Thread mListenerThread;
    private boolean mStopped;
    private LocalServerSocket mServerSocket;

    public LocalSocketServer(String friendlyName, String address, SocketHandler socketHandler) {
        this.mFriendlyName = (String) Util.throwIfNull(friendlyName);
        this.mAddress = (String) Util.throwIfNull(address);
        this.mSocketHandler = socketHandler;
    }

    public String getName() {
        return this.mFriendlyName;
    }

    public void run() throws IOException {
        synchronized (this) {
            if (this.mStopped) {
                return;
            }
            this.mListenerThread = Thread.currentThread();
            listenOnAddress(this.mAddress);
        }
    }

    private void listenOnAddress(String address) throws IOException {
        this.mServerSocket = bindToSocket(address);
        LogUtil.i("Listening on @" + address);
        while (!Thread.interrupted()) {
            try {
                LocalSocket socket = this.mServerSocket.accept();
                Thread t = new WorkerThread(socket, this.mSocketHandler);
                t.setName("StethoWorker-" + this.mFriendlyName + "-" + this.mThreadId.incrementAndGet());
                t.setDaemon(true);
                t.start();
            } catch (InterruptedIOException e) {
            } catch (SocketException se) {
                if (Thread.interrupted()) {
                    break;
                } else {
                    LogUtil.w(se, "I/O error");
                }
            } catch (IOException e2) {
                LogUtil.w(e2, "I/O error initialising connection thread");
            }
        }
        LogUtil.i("Server shutdown on @" + address);
    }

    public void stop() {
        synchronized (this) {
            this.mStopped = true;
            if (this.mListenerThread == null) {
                return;
            }
            this.mListenerThread.interrupt();
            try {
                if (this.mServerSocket != null) {
                    this.mServerSocket.close();
                }
            } catch (IOException e) {
            }
        }
    }

    @Nonnull
    private static LocalServerSocket bindToSocket(String address) throws IOException {
        int i;
        int retries = 2;
        IOException firstException = null;
        do {
            try {
                if (LogUtil.isLoggable(3)) {
                    LogUtil.d("Trying to bind to @" + address);
                }
                return new LocalServerSocket(address);
            } catch (BindException be) {
                LogUtil.w(be, "Binding error, sleep 1000 ms...");
                if (firstException == null) {
                    firstException = be;
                }
                Util.sleepUninterruptibly(1000L);
                i = retries;
                retries--;
            }
        } while (i > 0);
        throw firstException;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/server/LocalSocketServer$WorkerThread.class */
    private static class WorkerThread extends Thread {
        private final LocalSocket mSocket;
        private final SocketHandler mSocketHandler;

        public WorkerThread(LocalSocket socket, SocketHandler socketHandler) {
            this.mSocket = socket;
            this.mSocketHandler = socketHandler;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            try {
                try {
                    this.mSocketHandler.onAccepted(this.mSocket);
                } finally {
                    try {
                        this.mSocket.close();
                    } catch (IOException e) {
                    }
                }
            } catch (IOException ex) {
                LogUtil.w("I/O error: %s", ex);
                try {
                    this.mSocket.close();
                } catch (IOException e2) {
                }
            }
        }
    }
}
