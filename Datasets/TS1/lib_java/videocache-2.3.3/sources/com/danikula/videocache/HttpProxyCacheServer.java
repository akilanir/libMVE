package com.danikula.videocache;

import android.content.Context;
import android.os.SystemClock;
import android.util.Log;
import com.danikula.videocache.file.DiskUsage;
import com.danikula.videocache.file.FileNameGenerator;
import com.danikula.videocache.file.Md5FileNameGenerator;
import com.danikula.videocache.file.TotalCountLruDiskUsage;
import com.danikula.videocache.file.TotalSizeLruDiskUsage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;
import java.util.Arrays;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/* loaded from: videocache-2.3.3.jar:com/danikula/videocache/HttpProxyCacheServer.class */
public class HttpProxyCacheServer {
    private static final String PROXY_HOST = "127.0.0.1";
    private static final String PING_REQUEST = "ping";
    private static final String PING_RESPONSE = "ping ok";
    private final Object clientsLock;
    private final ExecutorService socketProcessor;
    private final Map<String, HttpProxyCacheServerClients> clientsMap;
    private final ServerSocket serverSocket;
    private final int port;
    private final Thread waitConnectionThread;
    private final Config config;
    private boolean pinged;

    public HttpProxyCacheServer(Context context) {
        this(new Builder(context).buildConfig());
    }

    private HttpProxyCacheServer(Config config) {
        this.clientsLock = new Object();
        this.socketProcessor = Executors.newFixedThreadPool(8);
        this.clientsMap = new ConcurrentHashMap();
        this.config = (Config) Preconditions.checkNotNull(config);
        try {
            InetAddress inetAddress = InetAddress.getByName(PROXY_HOST);
            this.serverSocket = new ServerSocket(0, 8, inetAddress);
            this.port = this.serverSocket.getLocalPort();
            CountDownLatch startSignal = new CountDownLatch(1);
            this.waitConnectionThread = new Thread(new WaitRequestsRunnable(startSignal));
            this.waitConnectionThread.start();
            startSignal.await();
            Log.i("ProxyCache", "Proxy cache server started. Ping it...");
            makeSureServerWorks();
        } catch (IOException | InterruptedException e) {
            this.socketProcessor.shutdown();
            throw new IllegalStateException("Error starting local proxy server", e);
        }
    }

    private void makeSureServerWorks() {
        int delay = 200;
        int pingAttempts = 0;
        while (pingAttempts < 3) {
            try {
                Future<Boolean> pingFuture = this.socketProcessor.submit(new PingCallable());
                this.pinged = pingFuture.get(delay, TimeUnit.MILLISECONDS).booleanValue();
            } catch (InterruptedException | ExecutionException | TimeoutException e) {
                Log.e("ProxyCache", "Error pinging server [attempt: " + pingAttempts + ", timeout: " + delay + "]. ", e);
            }
            if (this.pinged) {
                return;
            }
            SystemClock.sleep(delay);
            pingAttempts++;
            delay *= 2;
        }
        Log.e("ProxyCache", "Shutdown server… Error pinging server [attempt: " + pingAttempts + ", timeout: " + delay + "]. If you see this message, please, email me danikula@gmail.com");
        shutdown();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean pingServer() throws ProxyCacheException {
        String pingUrl = appendToProxyUrl(PING_REQUEST);
        HttpUrlSource source = new HttpUrlSource(pingUrl);
        try {
            try {
                byte[] expectedResponse = PING_RESPONSE.getBytes();
                source.open(0);
                byte[] response = new byte[expectedResponse.length];
                source.read(response);
                boolean pingOk = Arrays.equals(expectedResponse, response);
                Log.d("ProxyCache", "Ping response: `" + new String(response) + "`, pinged? " + pingOk);
                source.close();
                return pingOk;
            } catch (ProxyCacheException e) {
                Log.e("ProxyCache", "Error reading ping response", e);
                source.close();
                return false;
            }
        } catch (Throwable th) {
            source.close();
            throw th;
        }
    }

    public String getProxyUrl(String url) {
        if (!this.pinged) {
            Log.e("ProxyCache", "Proxy server isn't pinged. Caching doesn't work. If you see this message, please, email me danikula@gmail.com");
        }
        return this.pinged ? appendToProxyUrl(url) : url;
    }

    private String appendToProxyUrl(String url) {
        return String.format("http://%s:%d/%s", PROXY_HOST, Integer.valueOf(this.port), ProxyCacheUtils.encode(url));
    }

    public void registerCacheListener(CacheListener cacheListener, String url) {
        Preconditions.checkAllNotNull(cacheListener, url);
        synchronized (this.clientsLock) {
            try {
                getClients(url).registerCacheListener(cacheListener);
            } catch (ProxyCacheException e) {
                Log.d("ProxyCache", "Error registering cache listener", e);
            }
        }
    }

    public void unregisterCacheListener(CacheListener cacheListener, String url) {
        Preconditions.checkAllNotNull(cacheListener, url);
        synchronized (this.clientsLock) {
            try {
                getClients(url).unregisterCacheListener(cacheListener);
            } catch (ProxyCacheException e) {
                Log.d("ProxyCache", "Error registering cache listener", e);
            }
        }
    }

    public void unregisterCacheListener(CacheListener cacheListener) {
        Preconditions.checkNotNull(cacheListener);
        synchronized (this.clientsLock) {
            for (HttpProxyCacheServerClients clients : this.clientsMap.values()) {
                clients.unregisterCacheListener(cacheListener);
            }
        }
    }

    public void shutdown() {
        Log.i("ProxyCache", "Shutdown proxy server");
        shutdownClients();
        this.waitConnectionThread.interrupt();
        try {
            if (!this.serverSocket.isClosed()) {
                this.serverSocket.close();
            }
        } catch (IOException e) {
            onError(new ProxyCacheException("Error shutting down proxy server", e));
        }
    }

    private void shutdownClients() {
        synchronized (this.clientsLock) {
            for (HttpProxyCacheServerClients clients : this.clientsMap.values()) {
                clients.shutdown();
            }
            this.clientsMap.clear();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void waitForRequest() {
        while (!Thread.currentThread().isInterrupted()) {
            try {
                Socket socket = this.serverSocket.accept();
                Log.d("ProxyCache", "Accept new socket " + socket);
                this.socketProcessor.submit(new SocketProcessorRunnable(socket));
            } catch (IOException e) {
                onError(new ProxyCacheException("Error during waiting connection", e));
                return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void processSocket(Socket socket) {
        try {
            try {
                GetRequest request = GetRequest.read(socket.getInputStream());
                Log.i("ProxyCache", "Request to cache proxy:" + request);
                String url = ProxyCacheUtils.decode(request.uri);
                if (PING_REQUEST.equals(url)) {
                    responseToPing(socket);
                } else {
                    HttpProxyCacheServerClients clients = getClients(url);
                    clients.processRequest(request, socket);
                }
                releaseSocket(socket);
                Log.d("ProxyCache", "Opened connections: " + getClientsCount());
            } catch (ProxyCacheException | IOException e) {
                onError(new ProxyCacheException("Error processing request", e));
                releaseSocket(socket);
                Log.d("ProxyCache", "Opened connections: " + getClientsCount());
            } catch (SocketException e2) {
                Log.d("ProxyCache", "Closing socket… Socket is closed by client.");
                releaseSocket(socket);
                Log.d("ProxyCache", "Opened connections: " + getClientsCount());
            }
        } catch (Throwable th) {
            releaseSocket(socket);
            Log.d("ProxyCache", "Opened connections: " + getClientsCount());
            throw th;
        }
    }

    private void responseToPing(Socket socket) throws IOException {
        OutputStream out = socket.getOutputStream();
        out.write("HTTP/1.1 200 OK\n\n".getBytes());
        out.write(PING_RESPONSE.getBytes());
    }

    private HttpProxyCacheServerClients getClients(String url) throws ProxyCacheException {
        HttpProxyCacheServerClients httpProxyCacheServerClients;
        synchronized (this.clientsLock) {
            HttpProxyCacheServerClients clients = this.clientsMap.get(url);
            if (clients == null) {
                clients = new HttpProxyCacheServerClients(url, this.config);
                this.clientsMap.put(url, clients);
            }
            httpProxyCacheServerClients = clients;
        }
        return httpProxyCacheServerClients;
    }

    private int getClientsCount() {
        int i;
        synchronized (this.clientsLock) {
            int count = 0;
            for (HttpProxyCacheServerClients clients : this.clientsMap.values()) {
                count += clients.getClientsCount();
            }
            i = count;
        }
        return i;
    }

    private void releaseSocket(Socket socket) {
        closeSocketInput(socket);
        closeSocketOutput(socket);
        closeSocket(socket);
    }

    private void closeSocketInput(Socket socket) {
        try {
            if (!socket.isInputShutdown()) {
                socket.shutdownInput();
            }
        } catch (SocketException e) {
            Log.d("ProxyCache", "Releasing input stream… Socket is closed by client.");
        } catch (IOException e2) {
            onError(new ProxyCacheException("Error closing socket input stream", e2));
        }
    }

    private void closeSocketOutput(Socket socket) {
        try {
            if (socket.isOutputShutdown()) {
                socket.shutdownOutput();
            }
        } catch (IOException e) {
            onError(new ProxyCacheException("Error closing socket output stream", e));
        }
    }

    private void closeSocket(Socket socket) {
        try {
            if (!socket.isClosed()) {
                socket.close();
            }
        } catch (IOException e) {
            onError(new ProxyCacheException("Error closing socket", e));
        }
    }

    private void onError(Throwable e) {
        Log.e("ProxyCache", "HttpProxyCacheServer error", e);
    }

    /* loaded from: videocache-2.3.3.jar:com/danikula/videocache/HttpProxyCacheServer$WaitRequestsRunnable.class */
    private final class WaitRequestsRunnable implements Runnable {
        private final CountDownLatch startSignal;

        public WaitRequestsRunnable(CountDownLatch startSignal) {
            this.startSignal = startSignal;
        }

        @Override // java.lang.Runnable
        public void run() {
            this.startSignal.countDown();
            HttpProxyCacheServer.this.waitForRequest();
        }
    }

    /* loaded from: videocache-2.3.3.jar:com/danikula/videocache/HttpProxyCacheServer$SocketProcessorRunnable.class */
    private final class SocketProcessorRunnable implements Runnable {
        private final Socket socket;

        public SocketProcessorRunnable(Socket socket) {
            this.socket = socket;
        }

        @Override // java.lang.Runnable
        public void run() {
            HttpProxyCacheServer.this.processSocket(this.socket);
        }
    }

    /* loaded from: videocache-2.3.3.jar:com/danikula/videocache/HttpProxyCacheServer$PingCallable.class */
    private class PingCallable implements Callable<Boolean> {
        private PingCallable() {
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.concurrent.Callable
        public Boolean call() throws Exception {
            return Boolean.valueOf(HttpProxyCacheServer.this.pingServer());
        }
    }

    /* loaded from: videocache-2.3.3.jar:com/danikula/videocache/HttpProxyCacheServer$Builder.class */
    public static final class Builder {
        private static final long DEFAULT_MAX_SIZE = 54525952;
        private File cacheRoot;
        private DiskUsage diskUsage = new TotalSizeLruDiskUsage(DEFAULT_MAX_SIZE);
        private FileNameGenerator fileNameGenerator = new Md5FileNameGenerator();

        public Builder(Context context) {
            this.cacheRoot = StorageUtils.getIndividualCacheDirectory(context);
        }

        public Builder cacheDirectory(File file) {
            this.cacheRoot = (File) Preconditions.checkNotNull(file);
            return this;
        }

        public Builder fileNameGenerator(FileNameGenerator fileNameGenerator) {
            this.fileNameGenerator = (FileNameGenerator) Preconditions.checkNotNull(fileNameGenerator);
            return this;
        }

        public Builder maxCacheSize(long maxSize) {
            this.diskUsage = new TotalSizeLruDiskUsage(maxSize);
            return this;
        }

        public Builder maxCacheFilesCount(int count) {
            this.diskUsage = new TotalCountLruDiskUsage(count);
            return this;
        }

        public HttpProxyCacheServer build() {
            Config config = buildConfig();
            return new HttpProxyCacheServer(config);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public Config buildConfig() {
            return new Config(this.cacheRoot, this.fileNameGenerator, this.diskUsage);
        }
    }
}
