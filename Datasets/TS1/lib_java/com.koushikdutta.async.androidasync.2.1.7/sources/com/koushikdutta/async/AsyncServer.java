package com.koushikdutta.async;

import android.os.Build;
import android.os.Handler;
import android.util.Log;
import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.callback.ConnectCallback;
import com.koushikdutta.async.callback.ListenCallback;
import com.koushikdutta.async.future.Cancellable;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.async.future.FutureCallback;
import com.koushikdutta.async.future.SimpleFuture;
import com.koushikdutta.async.future.TransformFuture;
import com.koushikdutta.async.util.StreamUtility;
import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.nio.channels.CancelledKeyException;
import java.nio.channels.ClosedChannelException;
import java.nio.channels.DatagramChannel;
import java.nio.channels.SelectionKey;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.nio.channels.spi.SelectorProvider;
import java.util.Comparator;
import java.util.PriorityQueue;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.Semaphore;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/AsyncServer.class */
public class AsyncServer {
    public static final String LOGTAG = "NIO";
    static AsyncServer mInstance;
    private SelectorWrapper mSelector;
    String mName;
    PriorityQueue<Scheduled> mQueue;
    private static ExecutorService synchronousWorkers;
    static final WeakHashMap<Thread, AsyncServer> mServers;
    Thread mAffinity;
    private static final long QUEUE_EMPTY = Long.MAX_VALUE;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !AsyncServer.class.desiredAssertionStatus();
        try {
            if (Build.VERSION.SDK_INT <= 8) {
                System.setProperty("java.net.preferIPv4Stack", "true");
                System.setProperty("java.net.preferIPv6Addresses", "false");
            }
        } catch (Throwable th) {
        }
        mInstance = new AsyncServer();
        synchronousWorkers = newSynchronousWorkers();
        mServers = new WeakHashMap<>();
    }

    /* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/AsyncServer$RunnableWrapper.class */
    private static class RunnableWrapper implements Runnable {
        boolean hasRun;
        Runnable runnable;
        ThreadQueue threadQueue;
        Handler handler;

        private RunnableWrapper() {
        }

        @Override // java.lang.Runnable
        public void run() {
            synchronized (this) {
                if (this.hasRun) {
                    return;
                }
                this.hasRun = true;
                try {
                    this.runnable.run();
                    this.threadQueue.remove(this);
                    this.handler.removeCallbacks(this);
                    this.threadQueue = null;
                    this.handler = null;
                    this.runnable = null;
                } catch (Throwable th) {
                    this.threadQueue.remove(this);
                    this.handler.removeCallbacks(this);
                    this.threadQueue = null;
                    this.handler = null;
                    this.runnable = null;
                    throw th;
                }
            }
        }
    }

    public static void post(Handler handler, Runnable runnable) {
        RunnableWrapper wrapper = new RunnableWrapper();
        ThreadQueue threadQueue = ThreadQueue.getOrCreateThreadQueue(handler.getLooper().getThread());
        wrapper.threadQueue = threadQueue;
        wrapper.handler = handler;
        wrapper.runnable = runnable;
        threadQueue.add((Runnable) wrapper);
        handler.post(wrapper);
        threadQueue.queueSemaphore.release();
    }

    public static AsyncServer getDefault() {
        return mInstance;
    }

    public boolean isRunning() {
        return this.mSelector != null;
    }

    public AsyncServer() {
        this(null);
    }

    public AsyncServer(String name) {
        this.mQueue = new PriorityQueue<>(1, Scheduler.INSTANCE);
        this.mName = name == null ? "AsyncServer" : name;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleSocket(AsyncNetworkSocket handler) throws ClosedChannelException {
        ChannelWrapper sc = handler.getChannel();
        SelectionKey ckey = sc.register(this.mSelector.getSelector());
        ckey.attach(handler);
        handler.setup(this, ckey);
    }

    public void removeAllCallbacks(Object scheduled) {
        synchronized (this) {
            this.mQueue.remove(scheduled);
        }
    }

    private static void wakeup(final SelectorWrapper selector) {
        synchronousWorkers.execute(new Runnable() { // from class: com.koushikdutta.async.AsyncServer.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    selector.wakeupOnce();
                } catch (Exception e) {
                    Log.i(AsyncServer.LOGTAG, "Selector Exception? L Preview?");
                }
            }
        });
    }

    public Object postDelayed(Runnable runnable, long delay) {
        long time;
        Scheduled s;
        synchronized (this) {
            if (delay != 0) {
                time = System.currentTimeMillis() + delay;
            } else {
                time = this.mQueue.size();
            }
            PriorityQueue<Scheduled> priorityQueue = this.mQueue;
            s = new Scheduled(runnable, time);
            priorityQueue.add(s);
            if (this.mSelector == null) {
                run(true);
            }
            if (!isAffinityThread()) {
                wakeup(this.mSelector);
            }
        }
        return s;
    }

    public Object post(Runnable runnable) {
        return postDelayed(runnable, 0L);
    }

    public Object post(final CompletedCallback callback, final Exception e) {
        return post(new Runnable() { // from class: com.koushikdutta.async.AsyncServer.2
            @Override // java.lang.Runnable
            public void run() {
                callback.onCompleted(e);
            }
        });
    }

    public void run(final Runnable runnable) {
        if (Thread.currentThread() == this.mAffinity) {
            post(runnable);
            lockAndRunQueue(this, this.mQueue);
            return;
        }
        final Semaphore semaphore = new Semaphore(0);
        post(new Runnable() { // from class: com.koushikdutta.async.AsyncServer.3
            @Override // java.lang.Runnable
            public void run() {
                runnable.run();
                semaphore.release();
            }
        });
        try {
            semaphore.acquire();
        } catch (InterruptedException e) {
            Log.e(LOGTAG, "run", e);
        }
    }

    /* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/AsyncServer$Scheduled.class */
    private static class Scheduled {
        public Runnable runnable;
        public long time;

        public Scheduled(Runnable runnable, long time) {
            this.runnable = runnable;
            this.time = time;
        }
    }

    /* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/AsyncServer$Scheduler.class */
    static class Scheduler implements Comparator<Scheduled> {
        public static Scheduler INSTANCE = new Scheduler();

        private Scheduler() {
        }

        @Override // java.util.Comparator
        public int compare(Scheduled s1, Scheduled s2) {
            if (s1.time == s2.time) {
                return 0;
            }
            if (s1.time > s2.time) {
                return 1;
            }
            return -1;
        }
    }

    public void stop() {
        synchronized (this) {
            boolean isAffinityThread = isAffinityThread();
            final SelectorWrapper currentSelector = this.mSelector;
            if (currentSelector == null) {
                return;
            }
            synchronized (mServers) {
                mServers.remove(this.mAffinity);
            }
            final Semaphore semaphore = new Semaphore(0);
            this.mQueue.add(new Scheduled(new Runnable() { // from class: com.koushikdutta.async.AsyncServer.4
                @Override // java.lang.Runnable
                public void run() {
                    AsyncServer.shutdownEverything(currentSelector);
                    semaphore.release();
                }
            }, 0L));
            currentSelector.wakeupOnce();
            shutdownKeys(currentSelector);
            this.mQueue = new PriorityQueue<>(1, Scheduler.INSTANCE);
            this.mSelector = null;
            this.mAffinity = null;
            if (!isAffinityThread) {
                try {
                    semaphore.acquire();
                } catch (Exception e) {
                }
            }
        }
    }

    protected void onDataReceived(int transmitted) {
    }

    protected void onDataSent(int transmitted) {
    }

    /* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/AsyncServer$ObjectHolder.class */
    private static class ObjectHolder<T> {
        T held;

        private ObjectHolder() {
        }
    }

    public AsyncServerSocket listen(final InetAddress host, final int port, final ListenCallback handler) {
        final ObjectHolder<AsyncServerSocket> holder = new ObjectHolder<>();
        run(new Runnable() { // from class: com.koushikdutta.async.AsyncServer.5
            /* JADX WARN: Multi-variable type inference failed */
            /* JADX WARN: Type inference failed for: r2v6, types: [T, com.koushikdutta.async.AsyncServer$5$1, com.koushikdutta.async.AsyncServerSocket] */
            @Override // java.lang.Runnable
            public void run() {
                InetSocketAddress isa;
                final ServerSocketChannel closeableServer = null;
                final ServerSocketChannelWrapper closeableWrapper = null;
                try {
                    closeableServer = ServerSocketChannel.open();
                    closeableWrapper = new ServerSocketChannelWrapper(closeableServer);
                    if (host == null) {
                        isa = new InetSocketAddress(port);
                    } else {
                        isa = new InetSocketAddress(host, port);
                    }
                    closeableServer.socket().bind(isa);
                    final SelectionKey key = closeableWrapper.register(AsyncServer.this.mSelector.getSelector());
                    key.attach(handler);
                    ListenCallback listenCallback = handler;
                    ObjectHolder objectHolder = holder;
                    ?? r2 = new AsyncServerSocket() { // from class: com.koushikdutta.async.AsyncServer.5.1
                        @Override // com.koushikdutta.async.AsyncServerSocket
                        public int getLocalPort() {
                            return closeableServer.socket().getLocalPort();
                        }

                        @Override // com.koushikdutta.async.AsyncServerSocket
                        public void stop() {
                            StreamUtility.closeQuietly(closeableWrapper);
                            try {
                                key.cancel();
                            } catch (Exception e) {
                            }
                        }
                    };
                    objectHolder.held = r2;
                    listenCallback.onListening(r2);
                } catch (IOException e) {
                    Log.e(AsyncServer.LOGTAG, "wtf", e);
                    StreamUtility.closeQuietly(closeableWrapper, closeableServer);
                    handler.onCompleted(e);
                }
            }
        });
        return holder.held;
    }

    /* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/AsyncServer$ConnectFuture.class */
    private class ConnectFuture extends SimpleFuture<AsyncNetworkSocket> {
        SocketChannel socket;
        ConnectCallback callback;

        private ConnectFuture() {
        }

        @Override // com.koushikdutta.async.future.SimpleCancellable
        protected void cancelCleanup() {
            super.cancelCleanup();
            try {
                if (this.socket != null) {
                    this.socket.close();
                }
            } catch (IOException e) {
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ConnectFuture connectResolvedInetSocketAddress(final InetSocketAddress address, final ConnectCallback callback) {
        final ConnectFuture cancel = new ConnectFuture();
        if (!$assertionsDisabled && address.isUnresolved()) {
            throw new AssertionError();
        }
        post(new Runnable() { // from class: com.koushikdutta.async.AsyncServer.6
            @Override // java.lang.Runnable
            public void run() {
                if (cancel.isCancelled()) {
                    return;
                }
                cancel.callback = callback;
                SelectionKey ckey = null;
                SocketChannel socket = null;
                try {
                    ConnectFuture connectFuture = cancel;
                    SocketChannel open = SocketChannel.open();
                    connectFuture.socket = open;
                    socket = open;
                    socket.configureBlocking(false);
                    ckey = socket.register(AsyncServer.this.mSelector.getSelector(), 8);
                    ckey.attach(cancel);
                    socket.connect(address);
                } catch (Throwable e) {
                    if (ckey != null) {
                        ckey.cancel();
                    }
                    StreamUtility.closeQuietly(socket);
                    cancel.setComplete((Exception) new RuntimeException(e));
                }
            }
        });
        return cancel;
    }

    public Cancellable connectSocket(final InetSocketAddress remote, final ConnectCallback callback) {
        if (!remote.isUnresolved()) {
            return connectResolvedInetSocketAddress(remote, callback);
        }
        final SimpleFuture<AsyncNetworkSocket> ret = new SimpleFuture<>();
        Future<InetAddress> lookup = getByName(remote.getHostName());
        ret.setParent((Cancellable) lookup);
        lookup.setCallback(new FutureCallback<InetAddress>() { // from class: com.koushikdutta.async.AsyncServer.7
            @Override // com.koushikdutta.async.future.FutureCallback
            public void onCompleted(Exception e, InetAddress result) {
                if (e == null) {
                    ret.setComplete((Future) AsyncServer.this.connectResolvedInetSocketAddress(new InetSocketAddress(result, remote.getPort()), callback));
                } else {
                    callback.onConnectCompleted(e, null);
                    ret.setComplete(e);
                }
            }
        });
        return ret;
    }

    public Cancellable connectSocket(String host, int port, ConnectCallback callback) {
        return connectSocket(InetSocketAddress.createUnresolved(host, port), callback);
    }

    private static ExecutorService newSynchronousWorkers() {
        ThreadFactory tf = new NamedThreadFactory("AsyncServer-worker-");
        ThreadPoolExecutor tpe = new ThreadPoolExecutor(1, 4, 10L, TimeUnit.SECONDS, new LinkedBlockingQueue(), tf);
        return tpe;
    }

    public Future<InetAddress[]> getAllByName(final String host) {
        final SimpleFuture<InetAddress[]> ret = new SimpleFuture<>();
        synchronousWorkers.execute(new Runnable() { // from class: com.koushikdutta.async.AsyncServer.8
            @Override // java.lang.Runnable
            public void run() {
                try {
                    final InetAddress[] result = InetAddress.getAllByName(host);
                    if (result == null || result.length == 0) {
                        throw new HostnameResolutionException("no addresses for host");
                    }
                    AsyncServer.this.post(new Runnable() { // from class: com.koushikdutta.async.AsyncServer.8.1
                        @Override // java.lang.Runnable
                        public void run() {
                            ret.setComplete(null, result);
                        }
                    });
                } catch (Exception e) {
                    AsyncServer.this.post(new Runnable() { // from class: com.koushikdutta.async.AsyncServer.8.2
                        @Override // java.lang.Runnable
                        public void run() {
                            ret.setComplete(e, null);
                        }
                    });
                }
            }
        });
        return ret;
    }

    public Future<InetAddress> getByName(String host) {
        return (Future) getAllByName(host).then(new TransformFuture<InetAddress, InetAddress[]>() { // from class: com.koushikdutta.async.AsyncServer.9
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.koushikdutta.async.future.TransformFuture
            public void transform(InetAddress[] result) throws Exception {
                setComplete((AnonymousClass9) result[0]);
            }
        });
    }

    public AsyncDatagramSocket connectDatagram(final String host, final int port) throws IOException {
        final DatagramChannel socket = DatagramChannel.open();
        final AsyncDatagramSocket handler = new AsyncDatagramSocket();
        handler.attach(socket);
        run(new Runnable() { // from class: com.koushikdutta.async.AsyncServer.10
            @Override // java.lang.Runnable
            public void run() {
                try {
                    SocketAddress remote = new InetSocketAddress(host, port);
                    AsyncServer.this.handleSocket(handler);
                    socket.connect(remote);
                } catch (IOException e) {
                    Log.e(AsyncServer.LOGTAG, "Datagram error", e);
                    StreamUtility.closeQuietly(socket);
                }
            }
        });
        return handler;
    }

    public AsyncDatagramSocket openDatagram() throws IOException {
        return openDatagram(null, false);
    }

    public AsyncDatagramSocket openDatagram(final SocketAddress address, final boolean reuseAddress) throws IOException {
        final DatagramChannel socket = DatagramChannel.open();
        final AsyncDatagramSocket handler = new AsyncDatagramSocket();
        handler.attach(socket);
        run(new Runnable() { // from class: com.koushikdutta.async.AsyncServer.11
            @Override // java.lang.Runnable
            public void run() {
                try {
                    if (reuseAddress) {
                        socket.socket().setReuseAddress(reuseAddress);
                    }
                    socket.socket().bind(address);
                    AsyncServer.this.handleSocket(handler);
                } catch (IOException e) {
                    Log.e(AsyncServer.LOGTAG, "Datagram error", e);
                    StreamUtility.closeQuietly(socket);
                }
            }
        });
        return handler;
    }

    public AsyncDatagramSocket connectDatagram(final SocketAddress remote) throws IOException {
        final DatagramChannel socket = DatagramChannel.open();
        final AsyncDatagramSocket handler = new AsyncDatagramSocket();
        handler.attach(socket);
        run(new Runnable() { // from class: com.koushikdutta.async.AsyncServer.12
            @Override // java.lang.Runnable
            public void run() {
                try {
                    AsyncServer.this.handleSocket(handler);
                    socket.connect(remote);
                } catch (IOException e) {
                    StreamUtility.closeQuietly(socket);
                }
            }
        });
        return handler;
    }

    private boolean addMe() {
        synchronized (mServers) {
            AsyncServer current = mServers.get(this.mAffinity);
            if (current != null) {
                return false;
            }
            mServers.put(this.mAffinity, this);
            return true;
        }
    }

    public static AsyncServer getCurrentThreadServer() {
        return mServers.get(Thread.currentThread());
    }

    private void run(boolean newThread) {
        final SelectorWrapper selector;
        final PriorityQueue<Scheduled> queue;
        boolean reentrant = false;
        synchronized (this) {
            if (this.mSelector != null) {
                Log.i(LOGTAG, "Reentrant call");
                if (!$assertionsDisabled && Thread.currentThread() != this.mAffinity) {
                    throw new AssertionError();
                }
                reentrant = true;
                selector = this.mSelector;
                queue = this.mQueue;
            } else {
                try {
                    SelectorWrapper selectorWrapper = new SelectorWrapper(SelectorProvider.provider().openSelector());
                    this.mSelector = selectorWrapper;
                    selector = selectorWrapper;
                    queue = this.mQueue;
                    if (newThread) {
                        this.mAffinity = new Thread(this.mName) { // from class: com.koushikdutta.async.AsyncServer.13
                            @Override // java.lang.Thread, java.lang.Runnable
                            public void run() {
                                AsyncServer.run(AsyncServer.this, selector, queue);
                            }
                        };
                    } else {
                        this.mAffinity = Thread.currentThread();
                    }
                    if (!addMe()) {
                        try {
                            this.mSelector.close();
                        } catch (Exception e) {
                        }
                        this.mSelector = null;
                        this.mAffinity = null;
                        return;
                    } else if (newThread) {
                        this.mAffinity.start();
                        return;
                    }
                } catch (IOException e2) {
                    return;
                }
            }
            if (reentrant) {
                try {
                    runLoop(this, selector, queue);
                    return;
                } catch (AsyncSelectorException e3) {
                    Log.i(LOGTAG, "Selector closed", e3);
                    try {
                        selector.getSelector().close();
                        return;
                    } catch (Exception e4) {
                        return;
                    }
                }
            }
            run(this, selector, queue);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void run(AsyncServer server, SelectorWrapper selector, PriorityQueue<Scheduled> queue) {
        while (true) {
            try {
                runLoop(server, selector, queue);
            } catch (AsyncSelectorException e) {
                Log.i(LOGTAG, "Selector exception, shutting down", e);
                try {
                    selector.getSelector().close();
                } catch (Exception e2) {
                }
            }
            synchronized (server) {
                if (!selector.isOpen() || (selector.keys().size() <= 0 && queue.size() <= 0)) {
                    break;
                }
            }
        }
        shutdownEverything(selector);
        if (server.mSelector == selector) {
            server.mQueue = new PriorityQueue<>(1, Scheduler.INSTANCE);
            server.mSelector = null;
            server.mAffinity = null;
        }
        synchronized (mServers) {
            mServers.remove(Thread.currentThread());
        }
    }

    private static void shutdownKeys(SelectorWrapper selector) {
        try {
            for (SelectionKey key : selector.keys()) {
                StreamUtility.closeQuietly(key.channel());
                try {
                    key.cancel();
                } catch (Exception e) {
                }
            }
        } catch (Exception e2) {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void shutdownEverything(SelectorWrapper selector) {
        shutdownKeys(selector);
        try {
            selector.close();
        } catch (Exception e) {
        }
    }

    private static long lockAndRunQueue(AsyncServer server, PriorityQueue<Scheduled> queue) {
        long wait = Long.MAX_VALUE;
        while (true) {
            Scheduled run = null;
            synchronized (server) {
                long now = System.currentTimeMillis();
                if (queue.size() > 0) {
                    Scheduled s = queue.remove();
                    if (s.time <= now) {
                        run = s;
                    } else {
                        wait = s.time - now;
                        queue.add(s);
                    }
                }
            }
            if (run != null) {
                run.runnable.run();
            } else {
                return wait;
            }
        }
    }

    /* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/AsyncServer$AsyncSelectorException.class */
    private static class AsyncSelectorException extends IOException {
        public AsyncSelectorException(Exception e) {
            super(e);
        }
    }

    private static void runLoop(AsyncServer server, SelectorWrapper selector, PriorityQueue<Scheduled> queue) throws AsyncSelectorException {
        boolean needsSelect = true;
        long wait = lockAndRunQueue(server, queue);
        try {
            synchronized (server) {
                int readyNow = selector.selectNow();
                if (readyNow == 0) {
                    if (selector.keys().size() == 0 && wait == QUEUE_EMPTY) {
                        return;
                    }
                } else {
                    needsSelect = false;
                }
                if (needsSelect) {
                    if (wait == QUEUE_EMPTY) {
                        selector.select();
                    } else {
                        selector.select(wait);
                    }
                }
                Set<SelectionKey> readyKeys = selector.selectedKeys();
                for (SelectionKey selectionKey : readyKeys) {
                    try {
                        if (selectionKey.isAcceptable()) {
                            ServerSocketChannel nextReady = (ServerSocketChannel) selectionKey.channel();
                            SocketChannel sc = null;
                            SelectionKey ckey = null;
                            try {
                                sc = nextReady.accept();
                            } catch (IOException e) {
                                StreamUtility.closeQuietly(sc);
                                if (0 != 0) {
                                    ckey.cancel();
                                }
                            }
                            if (sc != null) {
                                sc.configureBlocking(false);
                                SelectionKey register = sc.register(selector.getSelector(), 1);
                                ListenCallback listenCallback = (ListenCallback) selectionKey.attachment();
                                AsyncNetworkSocket asyncNetworkSocket = new AsyncNetworkSocket();
                                asyncNetworkSocket.attach(sc, (InetSocketAddress) sc.socket().getRemoteSocketAddress());
                                asyncNetworkSocket.setup(server, register);
                                register.attach(asyncNetworkSocket);
                                listenCallback.onAccepted(asyncNetworkSocket);
                            }
                        } else if (selectionKey.isReadable()) {
                            AsyncNetworkSocket handler = (AsyncNetworkSocket) selectionKey.attachment();
                            int transmitted = handler.onReadable();
                            server.onDataReceived(transmitted);
                        } else if (selectionKey.isWritable()) {
                            AsyncNetworkSocket handler2 = (AsyncNetworkSocket) selectionKey.attachment();
                            handler2.onDataWritable();
                        } else if (selectionKey.isConnectable()) {
                            ConnectFuture cancel = (ConnectFuture) selectionKey.attachment();
                            SocketChannel sc2 = (SocketChannel) selectionKey.channel();
                            selectionKey.interestOps(1);
                            try {
                                sc2.finishConnect();
                                AsyncNetworkSocket asyncNetworkSocket2 = new AsyncNetworkSocket();
                                asyncNetworkSocket2.setup(server, selectionKey);
                                asyncNetworkSocket2.attach(sc2, (InetSocketAddress) sc2.socket().getRemoteSocketAddress());
                                selectionKey.attach(asyncNetworkSocket2);
                                try {
                                    if (cancel.setComplete((ConnectFuture) asyncNetworkSocket2)) {
                                        cancel.callback.onConnectCompleted(null, asyncNetworkSocket2);
                                    }
                                } catch (Exception e2) {
                                    throw new RuntimeException(e2);
                                }
                            } catch (IOException ex) {
                                selectionKey.cancel();
                                StreamUtility.closeQuietly(sc2);
                                if (cancel.setComplete((Exception) ex)) {
                                    cancel.callback.onConnectCompleted(ex, null);
                                }
                            }
                        } else {
                            Log.i(LOGTAG, "wtf");
                            throw new RuntimeException("Unknown key state.");
                        }
                    } catch (CancelledKeyException e3) {
                    }
                }
                readyKeys.clear();
            }
        } catch (Exception e4) {
            throw new AsyncSelectorException(e4);
        }
    }

    public void dump() {
        post(new Runnable() { // from class: com.koushikdutta.async.AsyncServer.14
            @Override // java.lang.Runnable
            public void run() {
                if (AsyncServer.this.mSelector == null) {
                    Log.i(AsyncServer.LOGTAG, "Server dump not possible. No selector?");
                    return;
                }
                Log.i(AsyncServer.LOGTAG, "Key Count: " + AsyncServer.this.mSelector.keys().size());
                for (SelectionKey key : AsyncServer.this.mSelector.keys()) {
                    Log.i(AsyncServer.LOGTAG, "Key: " + key);
                }
            }
        });
    }

    public Thread getAffinity() {
        return this.mAffinity;
    }

    public boolean isAffinityThread() {
        return this.mAffinity == Thread.currentThread();
    }

    public boolean isAffinityThreadOrStopped() {
        Thread affinity = this.mAffinity;
        return affinity == null || affinity == Thread.currentThread();
    }

    /* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/AsyncServer$NamedThreadFactory.class */
    private static class NamedThreadFactory implements ThreadFactory {
        private final ThreadGroup group;
        private final AtomicInteger threadNumber = new AtomicInteger(1);
        private final String namePrefix;

        NamedThreadFactory(String namePrefix) {
            SecurityManager s = System.getSecurityManager();
            this.group = s != null ? s.getThreadGroup() : Thread.currentThread().getThreadGroup();
            this.namePrefix = namePrefix;
        }

        @Override // java.util.concurrent.ThreadFactory
        public Thread newThread(Runnable r) {
            Thread t = new Thread(this.group, r, this.namePrefix + this.threadNumber.getAndIncrement(), 0L);
            if (t.isDaemon()) {
                t.setDaemon(false);
            }
            if (t.getPriority() != 5) {
                t.setPriority(5);
            }
            return t;
        }
    }
}
