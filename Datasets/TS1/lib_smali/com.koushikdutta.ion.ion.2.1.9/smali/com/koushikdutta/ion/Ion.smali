.class public Lcom/koushikdutta/ion/Ion;
.super Ljava/lang/Object;
.source "Ion.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/koushikdutta/ion/Ion$Config;,
        Lcom/koushikdutta/ion/Ion$FutureSet;
    }
.end annotation


# static fields
.field private static DEFERRED_COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/koushikdutta/ion/DeferredLoadBitmap;",
            ">;"
        }
    .end annotation
.end field

.field static availableProcessors:I

.field static bitmapExecutorService:Ljava/util/concurrent/ExecutorService;

.field static instances:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/koushikdutta/ion/Ion;",
            ">;"
        }
    .end annotation
.end field

.field static ioExecutorService:Ljava/util/concurrent/ExecutorService;

.field static final mainHandler:Landroid/os/Handler;


# instance fields
.field assetLoader:Lcom/koushikdutta/ion/loader/AssetLoader;

.field bitmapBuilder:Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

.field bitmapCache:Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

.field bitmapsPending:Lcom/koushikdutta/async/util/HashList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/koushikdutta/async/util/HashList",
            "<",
            "Lcom/koushikdutta/async/future/FutureCallback",
            "<",
            "Lcom/koushikdutta/ion/bitmap/BitmapInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field config:Lcom/koushikdutta/ion/Ion$Config;

.field conscryptMiddleware:Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;

.field contentLoader:Lcom/koushikdutta/ion/loader/ContentLoader;

.field context:Landroid/content/Context;

.field cookieMiddleware:Lcom/koushikdutta/ion/cookie/CookieMiddleware;

.field fileLoader:Lcom/koushikdutta/ion/loader/FileLoader;

.field gson:Lcom/google/gson/Gson;

.field httpClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

.field httpLoader:Lcom/koushikdutta/ion/loader/HttpLoader;

.field inFlight:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Ljava/lang/Object;",
            "Lcom/koushikdutta/ion/Ion$FutureSet;",
            ">;"
        }
    .end annotation
.end field

.field loaders:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/koushikdutta/ion/Loader;",
            ">;"
        }
    .end annotation
.end field

.field logLevel:I

.field logtag:Ljava/lang/String;

.field name:Ljava/lang/String;

.field packageIconLoader:Lcom/koushikdutta/ion/loader/PackageIconLoader;

.field private processDeferred:Ljava/lang/Runnable;

.field resourceLoader:Lcom/koushikdutta/ion/loader/ResourceLoader;

.field responseCache:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

.field storeCache:Lcom/koushikdutta/async/util/FileCache;

.field userAgent:Ljava/lang/String;

.field videoLoader:Lcom/koushikdutta/ion/loader/VideoLoader;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 60
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/koushikdutta/ion/Ion;->mainHandler:Landroid/os/Handler;

    .line 61
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    sput v0, Lcom/koushikdutta/ion/Ion;->availableProcessors:I

    .line 62
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/koushikdutta/ion/Ion;->ioExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 63
    sget v0, Lcom/koushikdutta/ion/Ion;->availableProcessors:I

    const/4 v1, 0x2

    if-le v0, v1, :cond_3a

    sget v0, Lcom/koushikdutta/ion/Ion;->availableProcessors:I

    add-int/lit8 v0, v0, -0x1

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    :goto_29
    sput-object v0, Lcom/koushikdutta/ion/Ion;->bitmapExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 64
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/koushikdutta/ion/Ion;->instances:Ljava/util/HashMap;

    .line 256
    new-instance v0, Lcom/koushikdutta/ion/Ion$1;

    invoke-direct {v0}, Lcom/koushikdutta/ion/Ion$1;-><init>()V

    sput-object v0, Lcom/koushikdutta/ion/Ion;->DEFERRED_COMPARATOR:Ljava/util/Comparator;

    return-void

    .line 63
    :cond_3a
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    goto :goto_29
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    .line 151
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 143
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/koushikdutta/ion/Ion;->loaders:Ljava/util/ArrayList;

    .line 145
    new-instance v3, Lcom/koushikdutta/async/util/HashList;

    invoke-direct {v3}, Lcom/koushikdutta/async/util/HashList;-><init>()V

    iput-object v3, p0, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    .line 146
    new-instance v3, Lcom/koushikdutta/ion/Ion$Config;

    invoke-direct {v3, p0}, Lcom/koushikdutta/ion/Ion$Config;-><init>(Lcom/koushikdutta/ion/Ion;)V

    iput-object v3, p0, Lcom/koushikdutta/ion/Ion;->config:Lcom/koushikdutta/ion/Ion$Config;

    .line 149
    new-instance v3, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    invoke-direct {v3, p0}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;-><init>(Lcom/koushikdutta/ion/Ion;)V

    iput-object v3, p0, Lcom/koushikdutta/ion/Ion;->bitmapBuilder:Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    .line 268
    new-instance v3, Lcom/koushikdutta/ion/Ion$2;

    invoke-direct {v3, p0}, Lcom/koushikdutta/ion/Ion$2;-><init>(Lcom/koushikdutta/ion/Ion;)V

    iput-object v3, p0, Lcom/koushikdutta/ion/Ion;->processDeferred:Ljava/lang/Runnable;

    .line 396
    new-instance v3, Ljava/util/WeakHashMap;

    invoke-direct {v3}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v3, p0, Lcom/koushikdutta/ion/Ion;->inFlight:Ljava/util/WeakHashMap;

    .line 152
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/koushikdutta/ion/Ion;->context:Landroid/content/Context;

    .line 153
    iput-object p2, p0, Lcom/koushikdutta/ion/Ion;->name:Ljava/lang/String;

    .line 155
    new-instance v3, Lcom/koushikdutta/async/http/AsyncHttpClient;

    new-instance v4, Lcom/koushikdutta/async/AsyncServer;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ion-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/koushikdutta/async/AsyncServer;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Lcom/koushikdutta/async/http/AsyncHttpClient;-><init>(Lcom/koushikdutta/async/AsyncServer;)V

    iput-object v3, p0, Lcom/koushikdutta/ion/Ion;->httpClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

    .line 156
    iget-object v3, p0, Lcom/koushikdutta/ion/Ion;->httpClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

    invoke-virtual {v3}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getSSLSocketMiddleware()Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    move-result-object v3

    new-instance v4, Lorg/apache/http/conn/ssl/BrowserCompatHostnameVerifier;

    invoke-direct {v4}, Lorg/apache/http/conn/ssl/BrowserCompatHostnameVerifier;-><init>()V

    invoke-virtual {v3, v4}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 157
    iget-object v3, p0, Lcom/koushikdutta/ion/Ion;->httpClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

    invoke-virtual {v3}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getSSLSocketMiddleware()Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    move-result-object v3

    invoke-virtual {v3, v8}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->setSpdyEnabled(Z)V

    .line 158
    iget-object v3, p0, Lcom/koushikdutta/ion/Ion;->httpClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

    new-instance v4, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;

    iget-object v5, p0, Lcom/koushikdutta/ion/Ion;->httpClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

    invoke-virtual {v5}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getSSLSocketMiddleware()Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    move-result-object v5

    invoke-direct {v4, p1, v5}, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;-><init>(Landroid/content/Context;Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;)V

    iput-object v4, p0, Lcom/koushikdutta/ion/Ion;->conscryptMiddleware:Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;

    invoke-virtual {v3, v4}, Lcom/koushikdutta/async/http/AsyncHttpClient;->insertMiddleware(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;)V

    .line 160
    new-instance v2, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v3

    invoke-direct {v2, v3, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 162
    .local v2, "ionCacheDir":Ljava/io/File;
    :try_start_87
    iget-object v3, p0, Lcom/koushikdutta/ion/Ion;->httpClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

    const-wide/32 v4, 0xa00000

    invoke-static {v3, v2, v4, v5}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->addCache(Lcom/koushikdutta/async/http/AsyncHttpClient;Ljava/io/File;J)Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    move-result-object v3

    iput-object v3, p0, Lcom/koushikdutta/ion/Ion;->responseCache:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;
    :try_end_92
    .catch Ljava/io/IOException; {:try_start_87 .. :try_end_92} :catch_11b

    .line 175
    :goto_92
    new-instance v3, Lcom/koushikdutta/async/util/FileCache;

    new-instance v4, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v5

    invoke-direct {v4, v5, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-wide v5, 0x7fffffffffffffffL

    const/4 v7, 0x0

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/koushikdutta/async/util/FileCache;-><init>(Ljava/io/File;JZ)V

    iput-object v3, p0, Lcom/koushikdutta/ion/Ion;->storeCache:Lcom/koushikdutta/async/util/FileCache;

    .line 178
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x9

    if-lt v3, v4, :cond_b1

    .line 179
    invoke-direct {p0}, Lcom/koushikdutta/ion/Ion;->addCookieMiddleware()V

    .line 181
    :cond_b1
    iget-object v3, p0, Lcom/koushikdutta/ion/Ion;->httpClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

    invoke-virtual {v3}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getSocketMiddleware()Lcom/koushikdutta/async/http/AsyncSocketMiddleware;

    move-result-object v3

    invoke-virtual {v3, v8}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->setConnectAllAddresses(Z)V

    .line 182
    iget-object v3, p0, Lcom/koushikdutta/ion/Ion;->httpClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

    invoke-virtual {v3}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getSSLSocketMiddleware()Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    move-result-object v3

    invoke-virtual {v3, v8}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->setConnectAllAddresses(Z)V

    .line 184
    new-instance v3, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    invoke-direct {v3, p0}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;-><init>(Lcom/koushikdutta/ion/Ion;)V

    iput-object v3, p0, Lcom/koushikdutta/ion/Ion;->bitmapCache:Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    .line 186
    invoke-virtual {p0}, Lcom/koushikdutta/ion/Ion;->configure()Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v3

    new-instance v4, Lcom/koushikdutta/ion/loader/VideoLoader;

    invoke-direct {v4}, Lcom/koushikdutta/ion/loader/VideoLoader;-><init>()V

    iput-object v4, p0, Lcom/koushikdutta/ion/Ion;->videoLoader:Lcom/koushikdutta/ion/loader/VideoLoader;

    .line 187
    invoke-virtual {v3, v4}, Lcom/koushikdutta/ion/Ion$Config;->addLoader(Lcom/koushikdutta/ion/Loader;)Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v3

    new-instance v4, Lcom/koushikdutta/ion/loader/PackageIconLoader;

    invoke-direct {v4}, Lcom/koushikdutta/ion/loader/PackageIconLoader;-><init>()V

    iput-object v4, p0, Lcom/koushikdutta/ion/Ion;->packageIconLoader:Lcom/koushikdutta/ion/loader/PackageIconLoader;

    .line 188
    invoke-virtual {v3, v4}, Lcom/koushikdutta/ion/Ion$Config;->addLoader(Lcom/koushikdutta/ion/Loader;)Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v3

    new-instance v4, Lcom/koushikdutta/ion/loader/HttpLoader;

    invoke-direct {v4}, Lcom/koushikdutta/ion/loader/HttpLoader;-><init>()V

    iput-object v4, p0, Lcom/koushikdutta/ion/Ion;->httpLoader:Lcom/koushikdutta/ion/loader/HttpLoader;

    .line 189
    invoke-virtual {v3, v4}, Lcom/koushikdutta/ion/Ion$Config;->addLoader(Lcom/koushikdutta/ion/Loader;)Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v3

    new-instance v4, Lcom/koushikdutta/ion/loader/ContentLoader;

    invoke-direct {v4}, Lcom/koushikdutta/ion/loader/ContentLoader;-><init>()V

    iput-object v4, p0, Lcom/koushikdutta/ion/Ion;->contentLoader:Lcom/koushikdutta/ion/loader/ContentLoader;

    .line 190
    invoke-virtual {v3, v4}, Lcom/koushikdutta/ion/Ion$Config;->addLoader(Lcom/koushikdutta/ion/Loader;)Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v3

    new-instance v4, Lcom/koushikdutta/ion/loader/ResourceLoader;

    invoke-direct {v4}, Lcom/koushikdutta/ion/loader/ResourceLoader;-><init>()V

    iput-object v4, p0, Lcom/koushikdutta/ion/Ion;->resourceLoader:Lcom/koushikdutta/ion/loader/ResourceLoader;

    .line 191
    invoke-virtual {v3, v4}, Lcom/koushikdutta/ion/Ion$Config;->addLoader(Lcom/koushikdutta/ion/Loader;)Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v3

    new-instance v4, Lcom/koushikdutta/ion/loader/AssetLoader;

    invoke-direct {v4}, Lcom/koushikdutta/ion/loader/AssetLoader;-><init>()V

    iput-object v4, p0, Lcom/koushikdutta/ion/Ion;->assetLoader:Lcom/koushikdutta/ion/loader/AssetLoader;

    .line 192
    invoke-virtual {v3, v4}, Lcom/koushikdutta/ion/Ion$Config;->addLoader(Lcom/koushikdutta/ion/Loader;)Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v3

    new-instance v4, Lcom/koushikdutta/ion/loader/FileLoader;

    invoke-direct {v4}, Lcom/koushikdutta/ion/loader/FileLoader;-><init>()V

    iput-object v4, p0, Lcom/koushikdutta/ion/Ion;->fileLoader:Lcom/koushikdutta/ion/loader/FileLoader;

    .line 193
    invoke-virtual {v3, v4}, Lcom/koushikdutta/ion/Ion$Config;->addLoader(Lcom/koushikdutta/ion/Loader;)Lcom/koushikdutta/ion/Ion$Config;

    .line 194
    return-void

    .line 164
    :catch_11b
    move-exception v0

    .line 165
    .local v0, "e":Ljava/io/IOException;
    const-string v3, "unable to set up response cache, clearing"

    invoke-static {v3, v0}, Lcom/koushikdutta/ion/IonLog;->w(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 166
    invoke-static {v2}, Lcom/koushikdutta/async/util/FileUtility;->deleteDirectory(Ljava/io/File;)Z

    .line 168
    :try_start_124
    iget-object v3, p0, Lcom/koushikdutta/ion/Ion;->httpClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

    const-wide/32 v4, 0xa00000

    invoke-static {v3, v2, v4, v5}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->addCache(Lcom/koushikdutta/async/http/AsyncHttpClient;Ljava/io/File;J)Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    move-result-object v3

    iput-object v3, p0, Lcom/koushikdutta/ion/Ion;->responseCache:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;
    :try_end_12f
    .catch Ljava/io/IOException; {:try_start_124 .. :try_end_12f} :catch_131

    goto/16 :goto_92

    .line 170
    :catch_131
    move-exception v1

    .line 171
    .local v1, "ex":Ljava/io/IOException;
    const-string v3, "unable to set up response cache, failing"

    invoke-static {v3, v0}, Lcom/koushikdutta/ion/IonLog;->w(Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_92
.end method

.method static synthetic access$000()Ljava/util/Comparator;
    .registers 1

    .prologue
    .line 59
    sget-object v0, Lcom/koushikdutta/ion/Ion;->DEFERRED_COMPARATOR:Ljava/util/Comparator;

    return-object v0
.end method

.method private addCookieMiddleware()V
    .registers 3

    .prologue
    .line 399
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion;->httpClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

    new-instance v1, Lcom/koushikdutta/ion/cookie/CookieMiddleware;

    invoke-direct {v1, p0}, Lcom/koushikdutta/ion/cookie/CookieMiddleware;-><init>(Lcom/koushikdutta/ion/Ion;)V

    iput-object v1, p0, Lcom/koushikdutta/ion/Ion;->cookieMiddleware:Lcom/koushikdutta/ion/cookie/CookieMiddleware;

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/AsyncHttpClient;->insertMiddleware(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;)V

    .line 400
    return-void
.end method

.method public static getBitmapLoadExecutorService()Ljava/util/concurrent/ExecutorService;
    .registers 1

    .prologue
    .line 197
    sget-object v0, Lcom/koushikdutta/ion/Ion;->bitmapExecutorService:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method public static getDefault(Landroid/content/Context;)Lcom/koushikdutta/ion/Ion;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 100
    const-string v0, "ion"

    invoke-static {p0, v0}, Lcom/koushikdutta/ion/Ion;->getInstance(Landroid/content/Context;Ljava/lang/String;)Lcom/koushikdutta/ion/Ion;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;Ljava/lang/String;)Lcom/koushikdutta/ion/Ion;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 110
    if-nez p0, :cond_a

    .line 111
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "Can not pass null context in to retrieve ion instance"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 112
    :cond_a
    sget-object v1, Lcom/koushikdutta/ion/Ion;->instances:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/ion/Ion;

    .line 113
    .local v0, "instance":Lcom/koushikdutta/ion/Ion;
    if-nez v0, :cond_1e

    .line 114
    sget-object v1, Lcom/koushikdutta/ion/Ion;->instances:Ljava/util/HashMap;

    new-instance v0, Lcom/koushikdutta/ion/Ion;

    .end local v0    # "instance":Lcom/koushikdutta/ion/Ion;
    invoke-direct {v0, p0, p1}, Lcom/koushikdutta/ion/Ion;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .restart local v0    # "instance":Lcom/koushikdutta/ion/Ion;
    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    :cond_1e
    return-object v0
.end method

.method public static getIoExecutorService()Ljava/util/concurrent/ExecutorService;
    .registers 1

    .prologue
    .line 201
    sget-object v0, Lcom/koushikdutta/ion/Ion;->ioExecutorService:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method public static with(Landroid/widget/ImageView;)Lcom/koushikdutta/ion/builder/Builders$IV$F;
    .registers 2
    .param p0, "imageView"    # Landroid/widget/ImageView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/ImageView;",
            ")",
            "Lcom/koushikdutta/ion/builder/Builders$IV$F",
            "<+",
            "Lcom/koushikdutta/ion/builder/Builders$IV$F",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 124
    invoke-virtual {p0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/koushikdutta/ion/Ion;->getDefault(Landroid/content/Context;)Lcom/koushikdutta/ion/Ion;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/koushikdutta/ion/Ion;->build(Landroid/widget/ImageView;)Lcom/koushikdutta/ion/builder/Builders$IV$F;

    move-result-object v0

    return-object v0
.end method

.method public static with(Landroid/app/Fragment;)Lcom/koushikdutta/ion/builder/LoadBuilder;
    .registers 2
    .param p0, "fragment"    # Landroid/app/Fragment;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xd
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Fragment;",
            ")",
            "Lcom/koushikdutta/ion/builder/LoadBuilder",
            "<",
            "Lcom/koushikdutta/ion/builder/Builders$Any$B;",
            ">;"
        }
    .end annotation

    .prologue
    .line 82
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/koushikdutta/ion/Ion;->getDefault(Landroid/content/Context;)Lcom/koushikdutta/ion/Ion;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/koushikdutta/ion/Ion;->build(Landroid/app/Fragment;)Lcom/koushikdutta/ion/builder/LoadBuilder;

    move-result-object v0

    return-object v0
.end method

.method public static with(Landroid/content/Context;)Lcom/koushikdutta/ion/builder/LoadBuilder;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/koushikdutta/ion/builder/LoadBuilder",
            "<",
            "Lcom/koushikdutta/ion/builder/Builders$Any$B;",
            ">;"
        }
    .end annotation

    .prologue
    .line 72
    invoke-static {p0}, Lcom/koushikdutta/ion/Ion;->getDefault(Landroid/content/Context;)Lcom/koushikdutta/ion/Ion;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/koushikdutta/ion/Ion;->build(Landroid/content/Context;)Lcom/koushikdutta/ion/builder/LoadBuilder;

    move-result-object v0

    return-object v0
.end method

.method public static with(Landroid/support/v4/app/Fragment;)Lcom/koushikdutta/ion/builder/LoadBuilder;
    .registers 2
    .param p0, "fragment"    # Landroid/support/v4/app/Fragment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/Fragment;",
            ")",
            "Lcom/koushikdutta/ion/builder/LoadBuilder",
            "<",
            "Lcom/koushikdutta/ion/builder/Builders$Any$B;",
            ">;"
        }
    .end annotation

    .prologue
    .line 91
    invoke-virtual {p0}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/koushikdutta/ion/Ion;->getDefault(Landroid/content/Context;)Lcom/koushikdutta/ion/Ion;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/koushikdutta/ion/Ion;->build(Landroid/support/v4/app/Fragment;)Lcom/koushikdutta/ion/builder/LoadBuilder;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method addFutureInFlight(Lcom/koushikdutta/async/future/Future;Ljava/lang/Object;)V
    .registers 5
    .param p1, "future"    # Lcom/koushikdutta/async/future/Future;
    .param p2, "group"    # Ljava/lang/Object;

    .prologue
    .line 325
    if-eqz p2, :cond_10

    if-eqz p1, :cond_10

    invoke-interface {p1}, Lcom/koushikdutta/async/future/Future;->isDone()Z

    move-result v1

    if-nez v1, :cond_10

    invoke-interface {p1}, Lcom/koushikdutta/async/future/Future;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 338
    :cond_10
    :goto_10
    return-void

    .line 329
    :cond_11
    monitor-enter p0

    .line 330
    :try_start_12
    iget-object v1, p0, Lcom/koushikdutta/ion/Ion;->inFlight:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p2}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/ion/Ion$FutureSet;

    .line 331
    .local v0, "members":Lcom/koushikdutta/ion/Ion$FutureSet;
    if-nez v0, :cond_26

    .line 332
    new-instance v0, Lcom/koushikdutta/ion/Ion$FutureSet;

    .end local v0    # "members":Lcom/koushikdutta/ion/Ion$FutureSet;
    invoke-direct {v0}, Lcom/koushikdutta/ion/Ion$FutureSet;-><init>()V

    .line 333
    .restart local v0    # "members":Lcom/koushikdutta/ion/Ion$FutureSet;
    iget-object v1, p0, Lcom/koushikdutta/ion/Ion;->inFlight:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p2, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 335
    :cond_26
    monitor-exit p0
    :try_end_27
    .catchall {:try_start_12 .. :try_end_27} :catchall_30

    .line 337
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/koushikdutta/ion/Ion$FutureSet;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_10

    .line 335
    .end local v0    # "members":Lcom/koushikdutta/ion/Ion$FutureSet;
    :catchall_30
    move-exception v1

    :try_start_31
    monitor-exit p0
    :try_end_32
    .catchall {:try_start_31 .. :try_end_32} :catchall_30

    throw v1
.end method

.method public build(Landroid/widget/ImageView;)Lcom/koushikdutta/ion/builder/Builders$IV$F;
    .registers 4
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/ImageView;",
            ")",
            "Lcom/koushikdutta/ion/builder/Builders$IV$F",
            "<+",
            "Lcom/koushikdutta/ion/builder/Builders$IV$F",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 237
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v1

    if-eq v0, v1, :cond_16

    .line 238
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "must be called from UI thread"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 239
    :cond_16
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion;->bitmapBuilder:Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    invoke-virtual {v0}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->reset()V

    .line 240
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion;->bitmapBuilder:Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    iput-object p0, v0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    .line 241
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion;->bitmapBuilder:Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    invoke-virtual {v0, p1}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->withImageView(Landroid/widget/ImageView;)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public build(Landroid/app/Fragment;)Lcom/koushikdutta/ion/builder/LoadBuilder;
    .registers 4
    .param p1, "fragment"    # Landroid/app/Fragment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Fragment;",
            ")",
            "Lcom/koushikdutta/ion/builder/LoadBuilder",
            "<",
            "Lcom/koushikdutta/ion/builder/Builders$Any$B;",
            ">;"
        }
    .end annotation

    .prologue
    .line 219
    new-instance v0, Lcom/koushikdutta/ion/IonRequestBuilder;

    new-instance v1, Lcom/koushikdutta/ion/ContextReference$FragmentContextReference;

    invoke-direct {v1, p1}, Lcom/koushikdutta/ion/ContextReference$FragmentContextReference;-><init>(Landroid/app/Fragment;)V

    invoke-direct {v0, v1, p0}, Lcom/koushikdutta/ion/IonRequestBuilder;-><init>(Lcom/koushikdutta/ion/ContextReference;Lcom/koushikdutta/ion/Ion;)V

    return-object v0
.end method

.method public build(Landroid/content/Context;)Lcom/koushikdutta/ion/builder/LoadBuilder;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/koushikdutta/ion/builder/LoadBuilder",
            "<",
            "Lcom/koushikdutta/ion/builder/Builders$Any$B;",
            ">;"
        }
    .end annotation

    .prologue
    .line 210
    new-instance v0, Lcom/koushikdutta/ion/IonRequestBuilder;

    invoke-static {p1}, Lcom/koushikdutta/ion/ContextReference;->fromContext(Landroid/content/Context;)Lcom/koushikdutta/ion/ContextReference;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lcom/koushikdutta/ion/IonRequestBuilder;-><init>(Lcom/koushikdutta/ion/ContextReference;Lcom/koushikdutta/ion/Ion;)V

    return-object v0
.end method

.method public build(Landroid/support/v4/app/Fragment;)Lcom/koushikdutta/ion/builder/LoadBuilder;
    .registers 4
    .param p1, "fragment"    # Landroid/support/v4/app/Fragment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/Fragment;",
            ")",
            "Lcom/koushikdutta/ion/builder/LoadBuilder",
            "<",
            "Lcom/koushikdutta/ion/builder/Builders$Any$B;",
            ">;"
        }
    .end annotation

    .prologue
    .line 228
    new-instance v0, Lcom/koushikdutta/ion/IonRequestBuilder;

    new-instance v1, Lcom/koushikdutta/ion/ContextReference$SupportFragmentContextReference;

    invoke-direct {v1, p1}, Lcom/koushikdutta/ion/ContextReference$SupportFragmentContextReference;-><init>(Landroid/support/v4/app/Fragment;)V

    invoke-direct {v0, v1, p0}, Lcom/koushikdutta/ion/IonRequestBuilder;-><init>(Lcom/koushikdutta/ion/ContextReference;Lcom/koushikdutta/ion/Ion;)V

    return-object v0
.end method

.method public cache(Ljava/lang/String;)Lcom/koushikdutta/ion/FileCacheStore;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 407
    new-instance v0, Lcom/koushikdutta/ion/FileCacheStore;

    iget-object v1, p0, Lcom/koushikdutta/ion/Ion;->responseCache:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    invoke-virtual {v1}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->getFileCache()Lcom/koushikdutta/async/util/FileCache;

    move-result-object v1

    invoke-direct {v0, p0, v1, p1}, Lcom/koushikdutta/ion/FileCacheStore;-><init>(Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/async/util/FileCache;Ljava/lang/String;)V

    return-object v0
.end method

.method public cancelAll()V
    .registers 5

    .prologue
    .line 346
    monitor-enter p0

    .line 347
    :try_start_1
    new-instance v1, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/koushikdutta/ion/Ion;->inFlight:Ljava/util/WeakHashMap;

    invoke-virtual {v3}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 348
    .local v1, "groups":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_1f

    .line 350
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_22

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 351
    .local v0, "group":Ljava/lang/Object;
    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/Ion;->cancelAll(Ljava/lang/Object;)V

    goto :goto_11

    .line 348
    .end local v0    # "group":Ljava/lang/Object;
    .end local v1    # "groups":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    :catchall_1f
    move-exception v3

    :try_start_20
    monitor-exit p0
    :try_end_21
    .catchall {:try_start_20 .. :try_end_21} :catchall_1f

    throw v3

    .line 352
    .restart local v1    # "groups":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_22
    return-void
.end method

.method public cancelAll(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 359
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/Ion;->cancelAll(Ljava/lang/Object;)V

    .line 360
    return-void
.end method

.method public cancelAll(Ljava/lang/Object;)V
    .registers 6
    .param p1, "group"    # Ljava/lang/Object;

    .prologue
    .line 311
    monitor-enter p0

    .line 312
    :try_start_1
    iget-object v3, p0, Lcom/koushikdutta/ion/Ion;->inFlight:Ljava/util/WeakHashMap;

    invoke-virtual {v3, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/koushikdutta/ion/Ion$FutureSet;

    .line 313
    .local v2, "members":Lcom/koushikdutta/ion/Ion$FutureSet;
    monitor-exit p0

    .line 315
    if-nez v2, :cond_10

    .line 322
    :cond_c
    return-void

    .line 313
    .end local v2    # "members":Lcom/koushikdutta/ion/Ion$FutureSet;
    :catchall_d
    move-exception v3

    monitor-exit p0
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_d

    throw v3

    .line 318
    .restart local v2    # "members":Lcom/koushikdutta/ion/Ion$FutureSet;
    :cond_10
    invoke-virtual {v2}, Lcom/koushikdutta/ion/Ion$FutureSet;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_18
    :goto_18
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/future/Future;

    .line 319
    .local v0, "future":Lcom/koushikdutta/async/future/Future;
    if-eqz v0, :cond_18

    .line 320
    invoke-interface {v0}, Lcom/koushikdutta/async/future/Future;->cancel()Z

    goto :goto_18
.end method

.method public configure()Lcom/koushikdutta/ion/Ion$Config;
    .registers 2

    .prologue
    .line 602
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion;->config:Lcom/koushikdutta/ion/Ion$Config;

    return-object v0
.end method

.method public dump()V
    .registers 6

    .prologue
    .line 377
    iget-object v2, p0, Lcom/koushikdutta/ion/Ion;->bitmapCache:Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    invoke-virtual {v2}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->dump()V

    .line 378
    iget-object v2, p0, Lcom/koushikdutta/ion/Ion;->logtag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Pending bitmaps: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    invoke-virtual {v4}, Lcom/koushikdutta/async/util/HashList;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    iget-object v2, p0, Lcom/koushikdutta/ion/Ion;->logtag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Groups: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/koushikdutta/ion/Ion;->inFlight:Ljava/util/WeakHashMap;

    invoke-virtual {v4}, Ljava/util/WeakHashMap;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 380
    iget-object v2, p0, Lcom/koushikdutta/ion/Ion;->inFlight:Ljava/util/WeakHashMap;

    invoke-virtual {v2}, Ljava/util/WeakHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_4b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_74

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/ion/Ion$FutureSet;

    .line 381
    .local v0, "futures":Lcom/koushikdutta/ion/Ion$FutureSet;
    iget-object v2, p0, Lcom/koushikdutta/ion/Ion;->logtag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Group size: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/koushikdutta/ion/Ion$FutureSet;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4b

    .line 383
    .end local v0    # "futures":Lcom/koushikdutta/ion/Ion$FutureSet;
    :cond_74
    return-void
.end method

.method public getBitmapCache()Lcom/koushikdutta/ion/bitmap/IonBitmapCache;
    .registers 2

    .prologue
    .line 610
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion;->bitmapCache:Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    return-object v0
.end method

.method public getCache()Lcom/koushikdutta/async/util/FileCache;
    .registers 2

    .prologue
    .line 411
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion;->responseCache:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->getFileCache()Lcom/koushikdutta/async/util/FileCache;

    move-result-object v0

    return-object v0
.end method

.method public getConscryptMiddleware()Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;
    .registers 2

    .prologue
    .line 439
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion;->conscryptMiddleware:Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;

    return-object v0
.end method

.method public getContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 390
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion;->context:Landroid/content/Context;

    return-object v0
.end method

.method public getCookieMiddleware()Lcom/koushikdutta/ion/cookie/CookieMiddleware;
    .registers 2

    .prologue
    .line 435
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion;->cookieMiddleware:Lcom/koushikdutta/ion/cookie/CookieMiddleware;

    return-object v0
.end method

.method public getHttpClient()Lcom/koushikdutta/async/http/AsyncHttpClient;
    .registers 2

    .prologue
    .line 447
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion;->httpClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 427
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPendingRequestCount(Ljava/lang/Object;)I
    .registers 7
    .param p1, "group"    # Ljava/lang/Object;

    .prologue
    .line 363
    monitor-enter p0

    .line 364
    :try_start_1
    iget-object v4, p0, Lcom/koushikdutta/ion/Ion;->inFlight:Ljava/util/WeakHashMap;

    invoke-virtual {v4, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/koushikdutta/ion/Ion$FutureSet;

    .line 365
    .local v2, "members":Lcom/koushikdutta/ion/Ion$FutureSet;
    if-nez v2, :cond_e

    .line 366
    const/4 v3, 0x0

    monitor-exit p0

    .line 372
    :goto_d
    return v3

    .line 367
    :cond_e
    const/4 v3, 0x0

    .line 368
    .local v3, "ret":I
    invoke-virtual {v2}, Lcom/koushikdutta/ion/Ion$FutureSet;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_17
    :goto_17
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_32

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/future/Future;

    .line 369
    .local v0, "future":Lcom/koushikdutta/async/future/Future;
    invoke-interface {v0}, Lcom/koushikdutta/async/future/Future;->isCancelled()Z

    move-result v4

    if-nez v4, :cond_17

    invoke-interface {v0}, Lcom/koushikdutta/async/future/Future;->isDone()Z

    move-result v4

    if-nez v4, :cond_17

    .line 370
    add-int/lit8 v3, v3, 0x1

    goto :goto_17

    .line 372
    .end local v0    # "future":Lcom/koushikdutta/async/future/Future;
    :cond_32
    monitor-exit p0

    goto :goto_d

    .line 373
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "members":Lcom/koushikdutta/ion/Ion$FutureSet;
    .end local v3    # "ret":I
    :catchall_34
    move-exception v4

    monitor-exit p0
    :try_end_36
    .catchall {:try_start_1 .. :try_end_36} :catchall_34

    throw v4
.end method

.method public getServer()Lcom/koushikdutta/async/AsyncServer;
    .registers 2

    .prologue
    .line 455
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion;->httpClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v0

    return-object v0
.end method

.method public getStore()Lcom/koushikdutta/async/util/FileCache;
    .registers 2

    .prologue
    .line 423
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion;->storeCache:Lcom/koushikdutta/async/util/FileCache;

    return-object v0
.end method

.method groupCount(Ljava/lang/Object;)I
    .registers 4
    .param p1, "group"    # Ljava/lang/Object;

    .prologue
    .line 246
    monitor-enter p0

    .line 247
    :try_start_1
    iget-object v1, p0, Lcom/koushikdutta/ion/Ion;->inFlight:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/ion/Ion$FutureSet;

    .line 248
    .local v0, "members":Lcom/koushikdutta/ion/Ion$FutureSet;
    monitor-exit p0

    .line 250
    if-nez v0, :cond_11

    .line 251
    const/4 v1, 0x0

    .line 253
    :goto_d
    return v1

    .line 248
    .end local v0    # "members":Lcom/koushikdutta/ion/Ion$FutureSet;
    :catchall_e
    move-exception v1

    monitor-exit p0
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_e

    throw v1

    .line 253
    .restart local v0    # "members":Lcom/koushikdutta/ion/Ion$FutureSet;
    :cond_11
    invoke-virtual {v0}, Lcom/koushikdutta/ion/Ion$FutureSet;->size()I

    move-result v1

    goto :goto_d
.end method

.method processDeferred()V
    .registers 3

    .prologue
    .line 301
    sget-object v0, Lcom/koushikdutta/ion/Ion;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/koushikdutta/ion/Ion;->processDeferred:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 302
    sget-object v0, Lcom/koushikdutta/ion/Ion;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/koushikdutta/ion/Ion;->processDeferred:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 303
    return-void
.end method

.method public store(Ljava/lang/String;)Lcom/koushikdutta/ion/FileCacheStore;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 419
    new-instance v0, Lcom/koushikdutta/ion/FileCacheStore;

    iget-object v1, p0, Lcom/koushikdutta/ion/Ion;->storeCache:Lcom/koushikdutta/async/util/FileCache;

    invoke-direct {v0, p0, v1, p1}, Lcom/koushikdutta/ion/FileCacheStore;-><init>(Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/async/util/FileCache;Ljava/lang/String;)V

    return-object v0
.end method
