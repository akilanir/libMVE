package org.androidannotations.api;

import android.app.Activity;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Build;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewDebug;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.lang.reflect.Method;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/ViewServer.class */
public class ViewServer implements Runnable {
    private static final int VIEW_SERVER_DEFAULT_PORT = 4939;
    private static final int VIEW_SERVER_MAX_CONNECTIONS = 10;
    private static final String BUILD_TYPE_USER = "user";
    private static final String LOG_TAG = "ViewServer";
    private static final String VALUE_PROTOCOL_VERSION = "4";
    private static final String VALUE_SERVER_VERSION = "4";
    private static final String COMMAND_PROTOCOL_VERSION = "PROTOCOL";
    private static final String COMMAND_SERVER_VERSION = "SERVER";
    private static final String COMMAND_WINDOW_MANAGER_LIST = "LIST";
    private static final String COMMAND_WINDOW_MANAGER_AUTOLIST = "AUTOLIST";
    private static final String COMMAND_WINDOW_MANAGER_GET_FOCUS = "GET_FOCUS";
    private ServerSocket mServer;
    private final int mPort;
    private Thread mThread;
    private ExecutorService mThreadPool;
    private final List<WindowListener> mListeners;
    private final Map<View, String> mWindows;
    private final ReentrantReadWriteLock mWindowsLock;
    private View mFocusedWindow;
    private final ReentrantReadWriteLock mFocusLock;
    private static ViewServer sServer;

    /* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/ViewServer$WindowListener.class */
    private interface WindowListener {
        void windowsChanged();

        void focusChanged();
    }

    public static ViewServer get(Context context) {
        ApplicationInfo info = context.getApplicationInfo();
        if (BUILD_TYPE_USER.equals(Build.TYPE) && (info.flags & 2) != 0) {
            if (sServer == null) {
                sServer = new ViewServer(VIEW_SERVER_DEFAULT_PORT);
            }
            if (!sServer.isRunning()) {
                try {
                    sServer.start();
                } catch (IOException e) {
                    Log.d(LOG_TAG, "Error:", e);
                }
            }
        } else {
            sServer = new NoopViewServer();
        }
        return sServer;
    }

    private ViewServer() {
        this.mListeners = new CopyOnWriteArrayList();
        this.mWindows = new HashMap();
        this.mWindowsLock = new ReentrantReadWriteLock();
        this.mFocusLock = new ReentrantReadWriteLock();
        this.mPort = -1;
    }

    private ViewServer(int port) {
        this.mListeners = new CopyOnWriteArrayList();
        this.mWindows = new HashMap();
        this.mWindowsLock = new ReentrantReadWriteLock();
        this.mFocusLock = new ReentrantReadWriteLock();
        this.mPort = port;
    }

    public boolean start() throws IOException {
        if (this.mThread != null) {
            return false;
        }
        this.mThread = new Thread(this, "Local View Server [port=" + this.mPort + "]");
        this.mThreadPool = Executors.newFixedThreadPool(VIEW_SERVER_MAX_CONNECTIONS);
        this.mThread.start();
        return true;
    }

    public boolean stop() {
        if (this.mThread != null) {
            this.mThread.interrupt();
            if (this.mThreadPool != null) {
                try {
                    this.mThreadPool.shutdownNow();
                } catch (SecurityException e) {
                    Log.w(LOG_TAG, "Could not stop all view server threads");
                }
            }
            this.mThreadPool = null;
            this.mThread = null;
            try {
                this.mServer.close();
                this.mServer = null;
                return true;
            } catch (IOException e2) {
                Log.w(LOG_TAG, "Could not close the view server");
            }
        }
        this.mWindowsLock.writeLock().lock();
        try {
            this.mWindows.clear();
            this.mFocusLock.writeLock().lock();
            try {
                this.mFocusedWindow = null;
                return false;
            } finally {
                this.mFocusLock.writeLock().unlock();
            }
        } finally {
            this.mWindowsLock.writeLock().unlock();
        }
    }

    public boolean isRunning() {
        return this.mThread != null && this.mThread.isAlive();
    }

    public void addWindow(Activity activity) {
        String name;
        String name2 = activity.getTitle().toString();
        if (TextUtils.isEmpty(name2)) {
            name = activity.getClass().getCanonicalName() + "/0x" + System.identityHashCode(activity);
        } else {
            name = name2 + "(" + activity.getClass().getCanonicalName() + ")";
        }
        addWindow(activity.getWindow().getDecorView(), name);
    }

    public void removeWindow(Activity activity) {
        removeWindow(activity.getWindow().getDecorView());
    }

    public void addWindow(View view, String name) {
        this.mWindowsLock.writeLock().lock();
        try {
            this.mWindows.put(view.getRootView(), name);
            fireWindowsChangedEvent();
        } finally {
            this.mWindowsLock.writeLock().unlock();
        }
    }

    public void removeWindow(View view) {
        this.mWindowsLock.writeLock().lock();
        try {
            this.mWindows.remove(view.getRootView());
            fireWindowsChangedEvent();
        } finally {
            this.mWindowsLock.writeLock().unlock();
        }
    }

    public void setFocusedWindow(Activity activity) {
        setFocusedWindow(activity.getWindow().getDecorView());
    }

    public void setFocusedWindow(View view) {
        View rootView;
        this.mFocusLock.writeLock().lock();
        if (view == null) {
            rootView = null;
        } else {
            try {
                rootView = view.getRootView();
            } finally {
                this.mFocusLock.writeLock().unlock();
            }
        }
        this.mFocusedWindow = rootView;
        fireFocusChangedEvent();
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            this.mServer = new ServerSocket(this.mPort, VIEW_SERVER_MAX_CONNECTIONS, InetAddress.getLocalHost());
        } catch (Exception e) {
            Log.w(LOG_TAG, "Starting ServerSocket error: ", e);
        }
        while (this.mServer != null && Thread.currentThread() == this.mThread) {
            try {
                Socket client = this.mServer.accept();
                if (this.mThreadPool != null) {
                    this.mThreadPool.submit(new ViewServerWorker(client));
                } else {
                    try {
                        client.close();
                    } catch (IOException e2) {
                        e2.printStackTrace();
                    }
                }
            } catch (Exception e3) {
                Log.w(LOG_TAG, "Connection error: ", e3);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean writeValue(Socket client, String value) {
        boolean result;
        BufferedWriter out = null;
        try {
            OutputStream clientStream = client.getOutputStream();
            out = new BufferedWriter(new OutputStreamWriter(clientStream), 8192);
            out.write(value);
            out.write("\n");
            out.flush();
            result = true;
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    result = false;
                }
            }
        } catch (Exception e2) {
            result = false;
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e3) {
                    result = false;
                }
            }
        } catch (Throwable th) {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e4) {
                }
            }
            throw th;
        }
        return result;
    }

    private void fireWindowsChangedEvent() {
        for (WindowListener listener : this.mListeners) {
            listener.windowsChanged();
        }
    }

    private void fireFocusChangedEvent() {
        for (WindowListener listener : this.mListeners) {
            listener.focusChanged();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addWindowListener(WindowListener listener) {
        if (!this.mListeners.contains(listener)) {
            this.mListeners.add(listener);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void removeWindowListener(WindowListener listener) {
        this.mListeners.remove(listener);
    }

    /* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/ViewServer$UncloseableOuputStream.class */
    private static class UncloseableOuputStream extends OutputStream {
        private final OutputStream mStream;

        UncloseableOuputStream(OutputStream stream) {
            this.mStream = stream;
        }

        @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
        }

        public boolean equals(Object o) {
            return this.mStream.equals(o);
        }

        @Override // java.io.OutputStream, java.io.Flushable
        public void flush() throws IOException {
            this.mStream.flush();
        }

        public int hashCode() {
            return this.mStream.hashCode();
        }

        public String toString() {
            return this.mStream.toString();
        }

        @Override // java.io.OutputStream
        public void write(byte[] buffer, int offset, int count) throws IOException {
            this.mStream.write(buffer, offset, count);
        }

        @Override // java.io.OutputStream
        public void write(byte[] buffer) throws IOException {
            this.mStream.write(buffer);
        }

        @Override // java.io.OutputStream
        public void write(int oneByte) throws IOException {
            this.mStream.write(oneByte);
        }
    }

    /* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/ViewServer$NoopViewServer.class */
    private static class NoopViewServer extends ViewServer {
        private NoopViewServer() {
            super();
        }

        @Override // org.androidannotations.api.ViewServer
        public boolean start() throws IOException {
            return false;
        }

        @Override // org.androidannotations.api.ViewServer
        public boolean stop() {
            return false;
        }

        @Override // org.androidannotations.api.ViewServer
        public boolean isRunning() {
            return false;
        }

        @Override // org.androidannotations.api.ViewServer
        public void addWindow(Activity activity) {
        }

        @Override // org.androidannotations.api.ViewServer
        public void removeWindow(Activity activity) {
        }

        @Override // org.androidannotations.api.ViewServer
        public void addWindow(View view, String name) {
        }

        @Override // org.androidannotations.api.ViewServer
        public void removeWindow(View view) {
        }

        @Override // org.androidannotations.api.ViewServer
        public void setFocusedWindow(Activity activity) {
        }

        @Override // org.androidannotations.api.ViewServer
        public void setFocusedWindow(View view) {
        }

        @Override // org.androidannotations.api.ViewServer, java.lang.Runnable
        public void run() {
        }
    }

    /* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/ViewServer$ViewServerWorker.class */
    private class ViewServerWorker implements Runnable, WindowListener {
        private Socket mClient;
        private final Object[] mLock = new Object[0];
        private boolean mNeedWindowListUpdate = false;
        private boolean mNeedFocusedWindowUpdate = false;

        public ViewServerWorker(Socket client) {
            this.mClient = client;
        }

        @Override // java.lang.Runnable
        public void run() {
            String command;
            String parameters;
            BufferedReader in = null;
            try {
                try {
                    in = new BufferedReader(new InputStreamReader(this.mClient.getInputStream()), 1024);
                    String request = in.readLine();
                    int index = request.indexOf(32);
                    if (index == -1) {
                        command = request;
                        parameters = "";
                    } else {
                        command = request.substring(0, index);
                        parameters = request.substring(index + 1);
                    }
                    boolean result = (ViewServer.COMMAND_PROTOCOL_VERSION.equalsIgnoreCase(command) || ViewServer.COMMAND_SERVER_VERSION.equalsIgnoreCase(command)) ? ViewServer.writeValue(this.mClient, "4") : ViewServer.COMMAND_WINDOW_MANAGER_LIST.equalsIgnoreCase(command) ? listWindows(this.mClient) : ViewServer.COMMAND_WINDOW_MANAGER_GET_FOCUS.equalsIgnoreCase(command) ? getFocusedWindow(this.mClient) : ViewServer.COMMAND_WINDOW_MANAGER_AUTOLIST.equalsIgnoreCase(command) ? windowManagerAutolistLoop() : windowCommand(this.mClient, command, parameters);
                    if (!result) {
                        Log.w(ViewServer.LOG_TAG, "An error occurred with the command: " + command);
                    }
                    if (in != null) {
                        try {
                            in.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                    if (this.mClient != null) {
                        try {
                            this.mClient.close();
                        } catch (IOException e2) {
                            e2.printStackTrace();
                        }
                    }
                } catch (IOException e3) {
                    Log.w(ViewServer.LOG_TAG, "Connection error: ", e3);
                    if (in != null) {
                        try {
                            in.close();
                        } catch (IOException e4) {
                            e4.printStackTrace();
                        }
                    }
                    if (this.mClient != null) {
                        try {
                            this.mClient.close();
                        } catch (IOException e5) {
                            e5.printStackTrace();
                        }
                    }
                }
            } catch (Throwable th) {
                if (in != null) {
                    try {
                        in.close();
                    } catch (IOException e6) {
                        e6.printStackTrace();
                    }
                }
                if (this.mClient != null) {
                    try {
                        this.mClient.close();
                    } catch (IOException e7) {
                        e7.printStackTrace();
                    }
                }
                throw th;
            }
        }

        private boolean windowCommand(Socket client, String command, String parameters) {
            View window;
            boolean success = true;
            BufferedWriter out = null;
            try {
                try {
                    int index = parameters.indexOf(32);
                    if (index == -1) {
                        index = parameters.length();
                    }
                    String code = parameters.substring(0, index);
                    int hashCode = (int) Long.parseLong(code, 16);
                    parameters = index < parameters.length() ? parameters.substring(index + 1) : "";
                    window = findWindow(hashCode);
                } catch (Throwable th) {
                    if (out != null) {
                        try {
                            out.close();
                        } catch (IOException e) {
                        }
                    }
                    throw th;
                }
            } catch (Exception e2) {
                Log.w(ViewServer.LOG_TAG, "Could not send command " + command + " with parameters " + parameters, e2);
                success = false;
                if (out != null) {
                    try {
                        out.close();
                    } catch (IOException e3) {
                        success = false;
                    }
                }
            }
            if (window == null) {
                if (0 != 0) {
                    try {
                        out.close();
                    } catch (IOException e4) {
                    }
                }
                return false;
            }
            Method dispatch = ViewDebug.class.getDeclaredMethod("dispatchCommand", View.class, String.class, String.class, OutputStream.class);
            dispatch.setAccessible(true);
            dispatch.invoke(null, window, command, parameters, new UncloseableOuputStream(client.getOutputStream()));
            if (!client.isOutputShutdown()) {
                out = new BufferedWriter(new OutputStreamWriter(client.getOutputStream()));
                out.write("DONE\n");
                out.flush();
            }
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e5) {
                    success = false;
                }
            }
            return success;
        }

        private View findWindow(int hashCode) {
            if (hashCode == -1) {
                ViewServer.this.mWindowsLock.readLock().lock();
                try {
                    View window = ViewServer.this.mFocusedWindow;
                    return window;
                } finally {
                }
            }
            ViewServer.this.mWindowsLock.readLock().lock();
            try {
                for (Map.Entry<View, String> entry : ViewServer.this.mWindows.entrySet()) {
                    if (System.identityHashCode(entry.getKey()) == hashCode) {
                        return entry.getKey();
                    }
                }
                return null;
            } finally {
            }
        }

        private boolean listWindows(Socket client) {
            boolean result = true;
            BufferedWriter out = null;
            try {
                ViewServer.this.mWindowsLock.readLock().lock();
                OutputStream clientStream = client.getOutputStream();
                out = new BufferedWriter(new OutputStreamWriter(clientStream), 8192);
                for (Map.Entry<View, String> entry : ViewServer.this.mWindows.entrySet()) {
                    out.write(Integer.toHexString(System.identityHashCode(entry.getKey())));
                    out.write(32);
                    out.append((CharSequence) entry.getValue());
                    out.write(ViewServer.VIEW_SERVER_MAX_CONNECTIONS);
                }
                out.write("DONE.\n");
                out.flush();
                ViewServer.this.mWindowsLock.readLock().unlock();
                if (out != null) {
                    try {
                        out.close();
                    } catch (IOException e) {
                        result = false;
                    }
                }
            } catch (Exception e2) {
                result = false;
                ViewServer.this.mWindowsLock.readLock().unlock();
                if (out != null) {
                    try {
                        out.close();
                    } catch (IOException e3) {
                        result = false;
                    }
                }
            } catch (Throwable th) {
                ViewServer.this.mWindowsLock.readLock().unlock();
                if (out != null) {
                    try {
                        out.close();
                    } catch (IOException e4) {
                    }
                }
                throw th;
            }
            return result;
        }

        private boolean getFocusedWindow(Socket client) {
            boolean result = true;
            BufferedWriter out = null;
            try {
                OutputStream clientStream = client.getOutputStream();
                BufferedWriter out2 = new BufferedWriter(new OutputStreamWriter(clientStream), 8192);
                ViewServer.this.mFocusLock.readLock().lock();
                try {
                    View focusedWindow = ViewServer.this.mFocusedWindow;
                    ViewServer.this.mFocusLock.readLock().unlock();
                    if (focusedWindow != null) {
                        ViewServer.this.mWindowsLock.readLock().lock();
                        try {
                            String focusName = (String) ViewServer.this.mWindows.get(ViewServer.this.mFocusedWindow);
                            ViewServer.this.mWindowsLock.readLock().unlock();
                            out2.write(Integer.toHexString(System.identityHashCode(focusedWindow)));
                            out2.write(32);
                            out2.append((CharSequence) focusName);
                        } catch (Throwable th) {
                            ViewServer.this.mWindowsLock.readLock().unlock();
                            throw th;
                        }
                    }
                    out2.write(ViewServer.VIEW_SERVER_MAX_CONNECTIONS);
                    out2.flush();
                    if (out2 != null) {
                        try {
                            out2.close();
                        } catch (IOException e) {
                            result = false;
                        }
                    }
                } catch (Throwable th2) {
                    ViewServer.this.mFocusLock.readLock().unlock();
                    throw th2;
                }
            } catch (Exception e2) {
                result = false;
                if (0 != 0) {
                    try {
                        out.close();
                    } catch (IOException e3) {
                        result = false;
                    }
                }
            } catch (Throwable th3) {
                if (0 != 0) {
                    try {
                        out.close();
                    } catch (IOException e4) {
                    }
                }
                throw th3;
            }
            return result;
        }

        @Override // org.androidannotations.api.ViewServer.WindowListener
        public void windowsChanged() {
            synchronized (this.mLock) {
                this.mNeedWindowListUpdate = true;
                this.mLock.notifyAll();
            }
        }

        @Override // org.androidannotations.api.ViewServer.WindowListener
        public void focusChanged() {
            synchronized (this.mLock) {
                this.mNeedFocusedWindowUpdate = true;
                this.mLock.notifyAll();
            }
        }

        private boolean windowManagerAutolistLoop() {
            ViewServer.this.addWindowListener(this);
            BufferedWriter out = null;
            try {
                try {
                    out = new BufferedWriter(new OutputStreamWriter(this.mClient.getOutputStream()));
                    while (!Thread.interrupted()) {
                        boolean needWindowListUpdate = false;
                        boolean needFocusedWindowUpdate = false;
                        synchronized (this.mLock) {
                            while (!this.mNeedWindowListUpdate && !this.mNeedFocusedWindowUpdate) {
                                this.mLock.wait();
                            }
                            if (this.mNeedWindowListUpdate) {
                                this.mNeedWindowListUpdate = false;
                                needWindowListUpdate = true;
                            }
                            if (this.mNeedFocusedWindowUpdate) {
                                this.mNeedFocusedWindowUpdate = false;
                                needFocusedWindowUpdate = true;
                            }
                        }
                        if (needWindowListUpdate) {
                            out.write("LIST UPDATE\n");
                            out.flush();
                        }
                        if (needFocusedWindowUpdate) {
                            out.write("FOCUS UPDATE\n");
                            out.flush();
                        }
                    }
                    if (out != null) {
                        try {
                            out.close();
                        } catch (IOException e) {
                        }
                    }
                    ViewServer.this.removeWindowListener(this);
                    return true;
                } catch (Exception e2) {
                    Log.w(ViewServer.LOG_TAG, "Connection error: ", e2);
                    if (out != null) {
                        try {
                            out.close();
                        } catch (IOException e3) {
                        }
                    }
                    ViewServer.this.removeWindowListener(this);
                    return true;
                }
            } catch (Throwable th) {
                if (out != null) {
                    try {
                        out.close();
                    } catch (IOException e4) {
                    }
                }
                ViewServer.this.removeWindowListener(this);
                throw th;
            }
        }
    }
}
