package com.koushikdutta.ion;

import android.annotation.TargetApi;
import android.app.Fragment;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.Log;
import android.widget.ImageView;
import com.google.gson.Gson;
import com.koushikdutta.async.AsyncServer;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.async.future.FutureCallback;
import com.koushikdutta.async.http.AsyncHttpClient;
import com.koushikdutta.async.http.AsyncHttpRequest;
import com.koushikdutta.async.http.Headers;
import com.koushikdutta.async.http.cache.ResponseCacheMiddleware;
import com.koushikdutta.async.util.FileCache;
import com.koushikdutta.async.util.FileUtility;
import com.koushikdutta.async.util.HashList;
import com.koushikdutta.ion.ContextReference;
import com.koushikdutta.ion.bitmap.BitmapInfo;
import com.koushikdutta.ion.bitmap.IonBitmapCache;
import com.koushikdutta.ion.builder.Builders;
import com.koushikdutta.ion.builder.LoadBuilder;
import com.koushikdutta.ion.conscrypt.ConscryptMiddleware;
import com.koushikdutta.ion.cookie.CookieMiddleware;
import com.koushikdutta.ion.loader.AssetLoader;
import com.koushikdutta.ion.loader.AsyncHttpRequestFactory;
import com.koushikdutta.ion.loader.ContentLoader;
import com.koushikdutta.ion.loader.FileLoader;
import com.koushikdutta.ion.loader.HttpLoader;
import com.koushikdutta.ion.loader.MediaFile;
import com.koushikdutta.ion.loader.PackageIconLoader;
import com.koushikdutta.ion.loader.ResourceLoader;
import com.koushikdutta.ion.loader.VideoLoader;
import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import javax.net.ssl.SSLContext;
import org.apache.http.conn.ssl.BrowserCompatHostnameVerifier;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/Ion.class */
public class Ion {
    static final Handler mainHandler = new Handler(Looper.getMainLooper());
    static int availableProcessors = Runtime.getRuntime().availableProcessors();
    static ExecutorService ioExecutorService = Executors.newFixedThreadPool(4);
    static ExecutorService bitmapExecutorService;
    static HashMap<String, Ion> instances;
    AsyncHttpClient httpClient;
    ConscryptMiddleware conscryptMiddleware;
    CookieMiddleware cookieMiddleware;
    ResponseCacheMiddleware responseCache;
    FileCache storeCache;
    HttpLoader httpLoader;
    ContentLoader contentLoader;
    ResourceLoader resourceLoader;
    AssetLoader assetLoader;
    VideoLoader videoLoader;
    PackageIconLoader packageIconLoader;
    FileLoader fileLoader;
    String logtag;
    int logLevel;
    Gson gson;
    String userAgent;
    String name;
    IonBitmapCache bitmapCache;
    Context context;
    private static Comparator<DeferredLoadBitmap> DEFERRED_COMPARATOR;
    ArrayList<Loader> loaders = new ArrayList<>();
    HashList<FutureCallback<BitmapInfo>> bitmapsPending = new HashList<>();
    Config config = new Config();
    IonImageViewRequestBuilder bitmapBuilder = new IonImageViewRequestBuilder(this);
    private Runnable processDeferred = new Runnable() { // from class: com.koushikdutta.ion.Ion.2
        @Override // java.lang.Runnable
        public void run() {
            if (BitmapFetcher.shouldDeferImageView(Ion.this)) {
                return;
            }
            ArrayList<DeferredLoadBitmap> deferred = null;
            for (String key : Ion.this.bitmapsPending.keySet()) {
                Object owner = Ion.this.bitmapsPending.tag(key);
                if (owner instanceof DeferredLoadBitmap) {
                    DeferredLoadBitmap deferredLoadBitmap = (DeferredLoadBitmap) owner;
                    if (deferred == null) {
                        deferred = new ArrayList<>();
                    }
                    deferred.add(deferredLoadBitmap);
                }
            }
            if (deferred == null) {
                return;
            }
            int count = 0;
            Collections.sort(deferred, Ion.DEFERRED_COMPARATOR);
            Iterator i$ = deferred.iterator();
            while (i$.hasNext()) {
                DeferredLoadBitmap deferredLoadBitmap2 = i$.next();
                Ion.this.bitmapsPending.tag(deferredLoadBitmap2.key, (Object) null);
                Ion.this.bitmapsPending.tag(deferredLoadBitmap2.fetcher.bitmapKey, (Object) null);
                deferredLoadBitmap2.fetcher.execute();
                count++;
                if (count > 5) {
                    return;
                }
            }
        }
    };
    WeakHashMap<Object, FutureSet> inFlight = new WeakHashMap<>();

    static {
        bitmapExecutorService = availableProcessors > 2 ? Executors.newFixedThreadPool(availableProcessors - 1) : Executors.newFixedThreadPool(1);
        instances = new HashMap<>();
        DEFERRED_COMPARATOR = new Comparator<DeferredLoadBitmap>() { // from class: com.koushikdutta.ion.Ion.1
            @Override // java.util.Comparator
            public int compare(DeferredLoadBitmap lhs, DeferredLoadBitmap rhs) {
                if (lhs.priority == rhs.priority) {
                    return 0;
                }
                if (lhs.priority < rhs.priority) {
                    return 1;
                }
                return -1;
            }
        };
    }

    public static LoadBuilder<Builders.Any.B> with(Context context) {
        return getDefault(context).build(context);
    }

    @TargetApi(MediaFile.FILE_TYPE_QCP)
    public static LoadBuilder<Builders.Any.B> with(Fragment fragment) {
        return getDefault(fragment.getActivity()).build(fragment);
    }

    public static LoadBuilder<Builders.Any.B> with(android.support.v4.app.Fragment fragment) {
        return getDefault(fragment.getActivity()).build(fragment);
    }

    public static Ion getDefault(Context context) {
        return getInstance(context, "ion");
    }

    public static Ion getInstance(Context context, String name) {
        if (context == null) {
            throw new NullPointerException("Can not pass null context in to retrieve ion instance");
        }
        Ion instance = instances.get(name);
        if (instance == null) {
            HashMap<String, Ion> hashMap = instances;
            Ion ion = new Ion(context, name);
            instance = ion;
            hashMap.put(name, ion);
        }
        return instance;
    }

    public static Builders.IV.F<? extends Builders.IV.F<?>> with(ImageView imageView) {
        return getDefault(imageView.getContext()).build(imageView);
    }

    private Ion(Context context, String name) {
        Context context2 = context.getApplicationContext();
        this.context = context2;
        this.name = name;
        this.httpClient = new AsyncHttpClient(new AsyncServer("ion-" + name));
        this.httpClient.getSSLSocketMiddleware().setHostnameVerifier(new BrowserCompatHostnameVerifier());
        this.httpClient.getSSLSocketMiddleware().setSpdyEnabled(true);
        AsyncHttpClient asyncHttpClient = this.httpClient;
        ConscryptMiddleware conscryptMiddleware = new ConscryptMiddleware(context2, this.httpClient.getSSLSocketMiddleware());
        this.conscryptMiddleware = conscryptMiddleware;
        asyncHttpClient.insertMiddleware(conscryptMiddleware);
        File ionCacheDir = new File(context2.getCacheDir(), name);
        try {
            this.responseCache = ResponseCacheMiddleware.addCache(this.httpClient, ionCacheDir, 10485760L);
        } catch (IOException e) {
            IonLog.w("unable to set up response cache, clearing", e);
            FileUtility.deleteDirectory(ionCacheDir);
            try {
                this.responseCache = ResponseCacheMiddleware.addCache(this.httpClient, ionCacheDir, 10485760L);
            } catch (IOException e2) {
                IonLog.w("unable to set up response cache, failing", e);
            }
        }
        this.storeCache = new FileCache(new File(context2.getFilesDir(), name), Long.MAX_VALUE, false);
        if (Build.VERSION.SDK_INT >= 9) {
            addCookieMiddleware();
        }
        this.httpClient.getSocketMiddleware().setConnectAllAddresses(true);
        this.httpClient.getSSLSocketMiddleware().setConnectAllAddresses(true);
        this.bitmapCache = new IonBitmapCache(this);
        Config configure = configure();
        VideoLoader videoLoader = new VideoLoader();
        this.videoLoader = videoLoader;
        Config addLoader = configure.addLoader(videoLoader);
        PackageIconLoader packageIconLoader = new PackageIconLoader();
        this.packageIconLoader = packageIconLoader;
        Config addLoader2 = addLoader.addLoader(packageIconLoader);
        HttpLoader httpLoader = new HttpLoader();
        this.httpLoader = httpLoader;
        Config addLoader3 = addLoader2.addLoader(httpLoader);
        ContentLoader contentLoader = new ContentLoader();
        this.contentLoader = contentLoader;
        Config addLoader4 = addLoader3.addLoader(contentLoader);
        ResourceLoader resourceLoader = new ResourceLoader();
        this.resourceLoader = resourceLoader;
        Config addLoader5 = addLoader4.addLoader(resourceLoader);
        AssetLoader assetLoader = new AssetLoader();
        this.assetLoader = assetLoader;
        Config addLoader6 = addLoader5.addLoader(assetLoader);
        FileLoader fileLoader = new FileLoader();
        this.fileLoader = fileLoader;
        addLoader6.addLoader(fileLoader);
    }

    public static ExecutorService getBitmapLoadExecutorService() {
        return bitmapExecutorService;
    }

    public static ExecutorService getIoExecutorService() {
        return ioExecutorService;
    }

    public LoadBuilder<Builders.Any.B> build(Context context) {
        return new IonRequestBuilder(ContextReference.fromContext(context), this);
    }

    public LoadBuilder<Builders.Any.B> build(Fragment fragment) {
        return new IonRequestBuilder(new ContextReference.FragmentContextReference(fragment), this);
    }

    public LoadBuilder<Builders.Any.B> build(android.support.v4.app.Fragment fragment) {
        return new IonRequestBuilder(new ContextReference.SupportFragmentContextReference(fragment), this);
    }

    public Builders.IV.F<? extends Builders.IV.F<?>> build(ImageView imageView) {
        if (Thread.currentThread() != Looper.getMainLooper().getThread()) {
            throw new IllegalStateException("must be called from UI thread");
        }
        this.bitmapBuilder.reset();
        this.bitmapBuilder.ion = this;
        return this.bitmapBuilder.withImageView(imageView);
    }

    int groupCount(Object group) {
        FutureSet members;
        synchronized (this) {
            members = this.inFlight.get(group);
        }
        if (members == null) {
            return 0;
        }
        return members.size();
    }

    void processDeferred() {
        mainHandler.removeCallbacks(this.processDeferred);
        mainHandler.post(this.processDeferred);
    }

    public void cancelAll(Object group) {
        FutureSet members;
        synchronized (this) {
            members = this.inFlight.remove(group);
        }
        if (members == null) {
            return;
        }
        for (Future future : members.keySet()) {
            if (future != null) {
                future.cancel();
            }
        }
    }

    void addFutureInFlight(Future future, Object group) {
        FutureSet members;
        if (group == null || future == null || future.isDone() || future.isCancelled()) {
            return;
        }
        synchronized (this) {
            members = this.inFlight.get(group);
            if (members == null) {
                members = new FutureSet();
                this.inFlight.put(group, members);
            }
        }
        members.put(future, true);
    }

    public void cancelAll() {
        ArrayList<Object> groups;
        synchronized (this) {
            groups = new ArrayList<>(this.inFlight.keySet());
        }
        Iterator i$ = groups.iterator();
        while (i$.hasNext()) {
            Object group = i$.next();
            cancelAll(group);
        }
    }

    public void cancelAll(Context context) {
        cancelAll((Object) context);
    }

    public int getPendingRequestCount(Object group) {
        synchronized (this) {
            FutureSet members = this.inFlight.get(group);
            if (members == null) {
                return 0;
            }
            int ret = 0;
            for (Future future : members.keySet()) {
                if (!future.isCancelled() && !future.isDone()) {
                    ret++;
                }
            }
            return ret;
        }
    }

    public void dump() {
        this.bitmapCache.dump();
        Log.i(this.logtag, "Pending bitmaps: " + this.bitmapsPending.size());
        Log.i(this.logtag, "Groups: " + this.inFlight.size());
        for (FutureSet futures : this.inFlight.values()) {
            Log.i(this.logtag, "Group size: " + futures.size());
        }
    }

    public Context getContext() {
        return this.context;
    }

    /* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/Ion$FutureSet.class */
    static class FutureSet extends WeakHashMap<Future, Boolean> {
        FutureSet() {
        }
    }

    private void addCookieMiddleware() {
        AsyncHttpClient asyncHttpClient = this.httpClient;
        CookieMiddleware cookieMiddleware = new CookieMiddleware(this);
        this.cookieMiddleware = cookieMiddleware;
        asyncHttpClient.insertMiddleware(cookieMiddleware);
    }

    public FileCacheStore cache(String key) {
        return new FileCacheStore(this, this.responseCache.getFileCache(), key);
    }

    public FileCache getCache() {
        return this.responseCache.getFileCache();
    }

    public FileCacheStore store(String key) {
        return new FileCacheStore(this, this.storeCache, key);
    }

    public FileCache getStore() {
        return this.storeCache;
    }

    public String getName() {
        return this.name;
    }

    public CookieMiddleware getCookieMiddleware() {
        return this.cookieMiddleware;
    }

    public ConscryptMiddleware getConscryptMiddleware() {
        return this.conscryptMiddleware;
    }

    public AsyncHttpClient getHttpClient() {
        return this.httpClient;
    }

    public AsyncServer getServer() {
        return this.httpClient.getServer();
    }

    /* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/Ion$Config.class */
    public class Config {
        AsyncHttpRequestFactory asyncHttpRequestFactory = new AsyncHttpRequestFactory() { // from class: com.koushikdutta.ion.Ion.Config.1
            @Override // com.koushikdutta.ion.loader.AsyncHttpRequestFactory
            public AsyncHttpRequest createAsyncHttpRequest(Uri uri, String method, Headers headers) {
                AsyncHttpRequest request = new AsyncHttpRequest(uri, method, headers);
                if (!TextUtils.isEmpty(Ion.this.userAgent)) {
                    request.getHeaders().set("User-Agent", Ion.this.userAgent);
                }
                return request;
            }
        };

        public Config() {
        }

        public HttpLoader getHttpLoader() {
            return Ion.this.httpLoader;
        }

        public VideoLoader getVideoLoader() {
            return Ion.this.videoLoader;
        }

        public PackageIconLoader getPackageIconLoader() {
            return Ion.this.packageIconLoader;
        }

        public ContentLoader getContentLoader() {
            return Ion.this.contentLoader;
        }

        public FileLoader getFileLoader() {
            return Ion.this.fileLoader;
        }

        public ResponseCacheMiddleware getResponseCache() {
            return Ion.this.responseCache;
        }

        public SSLContext createSSLContext(String algorithm) throws NoSuchAlgorithmException {
            Ion.this.conscryptMiddleware.initialize();
            return SSLContext.getInstance(algorithm);
        }

        public synchronized Gson getGson() {
            if (Ion.this.gson == null) {
                Ion.this.gson = new Gson();
            }
            return Ion.this.gson;
        }

        public Config setLogging(String logtag, int logLevel) {
            Ion.this.logtag = logtag;
            Ion.this.logLevel = logLevel;
            return this;
        }

        public void proxy(String host, int port) {
            Ion.this.httpClient.getSocketMiddleware().enableProxy(host, port);
        }

        public void proxySecure(String host, int port) {
            Ion.this.httpClient.getSSLSocketMiddleware().enableProxy(host, port);
        }

        public void disableProxy() {
            Ion.this.httpClient.getSocketMiddleware().disableProxy();
        }

        public void disableSecureProxy() {
            Ion.this.httpClient.getSSLSocketMiddleware().disableProxy();
        }

        public void setGson(Gson gson) {
            Ion.this.gson = gson;
        }

        public AsyncHttpRequestFactory getAsyncHttpRequestFactory() {
            return this.asyncHttpRequestFactory;
        }

        public Config setAsyncHttpRequestFactory(AsyncHttpRequestFactory asyncHttpRequestFactory) {
            this.asyncHttpRequestFactory = asyncHttpRequestFactory;
            return this;
        }

        public String userAgent() {
            return Ion.this.userAgent;
        }

        public Config userAgent(String userAgent) {
            Ion.this.userAgent = userAgent;
            return this;
        }

        public Config addLoader(int index, Loader loader) {
            Ion.this.loaders.add(index, loader);
            return this;
        }

        public Config insertLoader(Loader loader) {
            Ion.this.loaders.add(0, loader);
            return this;
        }

        public Config addLoader(Loader loader) {
            Ion.this.loaders.add(loader);
            return this;
        }

        public List<Loader> getLoaders() {
            return Ion.this.loaders;
        }
    }

    public Config configure() {
        return this.config;
    }

    public IonBitmapCache getBitmapCache() {
        return this.bitmapCache;
    }
}
