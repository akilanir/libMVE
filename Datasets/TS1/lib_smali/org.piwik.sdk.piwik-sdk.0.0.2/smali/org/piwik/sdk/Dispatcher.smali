.class public Lorg/piwik/sdk/Dispatcher;
.super Ljava/lang/Object;
.source "Dispatcher.java"


# static fields
.field private static final LOGGER_TAG:Ljava/lang/String; = "PIWIK:Dispatcher"


# instance fields
.field private final mApiUrl:Ljava/net/URL;

.field private final mAuthToken:Ljava/lang/String;

.field private volatile mDispatchInterval:J

.field private final mDispatchQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mDryRunOutput:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/client/methods/HttpRequestBase;",
            ">;"
        }
    .end annotation
.end field

.field private mLoop:Ljava/lang/Runnable;

.field private final mPiwik:Lorg/piwik/sdk/Piwik;

.field private volatile mRunning:Z

.field private final mSleepToken:Ljava/util/concurrent/Semaphore;

.field private final mThreadControl:Ljava/lang/Object;

.field private volatile mTimeOut:I


# direct methods
.method public constructor <init>(Lorg/piwik/sdk/Piwik;Ljava/net/URL;Ljava/lang/String;)V
    .registers 6
    .param p1, "piwik"    # Lorg/piwik/sdk/Piwik;
    .param p2, "apiUrl"    # Ljava/net/URL;
    .param p3, "authToken"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lorg/piwik/sdk/Dispatcher;->mDispatchQueue:Ljava/util/concurrent/BlockingQueue;

    .line 55
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/piwik/sdk/Dispatcher;->mThreadControl:Ljava/lang/Object;

    .line 56
    new-instance v0, Ljava/util/concurrent/Semaphore;

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lorg/piwik/sdk/Dispatcher;->mSleepToken:Ljava/util/concurrent/Semaphore;

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/piwik/sdk/Dispatcher;->mDryRunOutput:Ljava/util/List;

    .line 63
    const/16 v0, 0x1388

    iput v0, p0, Lorg/piwik/sdk/Dispatcher;->mTimeOut:I

    .line 64
    iput-boolean v1, p0, Lorg/piwik/sdk/Dispatcher;->mRunning:Z

    .line 66
    const-wide/32 v0, 0x1d4c0

    iput-wide v0, p0, Lorg/piwik/sdk/Dispatcher;->mDispatchInterval:J

    .line 124
    new-instance v0, Lorg/piwik/sdk/Dispatcher$1;

    invoke-direct {v0, p0}, Lorg/piwik/sdk/Dispatcher$1;-><init>(Lorg/piwik/sdk/Dispatcher;)V

    iput-object v0, p0, Lorg/piwik/sdk/Dispatcher;->mLoop:Ljava/lang/Runnable;

    .line 69
    iput-object p1, p0, Lorg/piwik/sdk/Dispatcher;->mPiwik:Lorg/piwik/sdk/Piwik;

    .line 70
    iput-object p2, p0, Lorg/piwik/sdk/Dispatcher;->mApiUrl:Ljava/net/URL;

    .line 71
    iput-object p3, p0, Lorg/piwik/sdk/Dispatcher;->mAuthToken:Ljava/lang/String;

    .line 72
    return-void
.end method

.method static synthetic access$000(Lorg/piwik/sdk/Dispatcher;)Z
    .registers 2
    .param p0, "x0"    # Lorg/piwik/sdk/Dispatcher;

    .prologue
    .line 52
    iget-boolean v0, p0, Lorg/piwik/sdk/Dispatcher;->mRunning:Z

    return v0
.end method

.method static synthetic access$002(Lorg/piwik/sdk/Dispatcher;Z)Z
    .registers 2
    .param p0, "x0"    # Lorg/piwik/sdk/Dispatcher;
    .param p1, "x1"    # Z

    .prologue
    .line 52
    iput-boolean p1, p0, Lorg/piwik/sdk/Dispatcher;->mRunning:Z

    return p1
.end method

.method static synthetic access$100(Lorg/piwik/sdk/Dispatcher;)J
    .registers 3
    .param p0, "x0"    # Lorg/piwik/sdk/Dispatcher;

    .prologue
    .line 52
    iget-wide v0, p0, Lorg/piwik/sdk/Dispatcher;->mDispatchInterval:J

    return-wide v0
.end method

.method static synthetic access$200(Lorg/piwik/sdk/Dispatcher;)Ljava/util/concurrent/Semaphore;
    .registers 2
    .param p0, "x0"    # Lorg/piwik/sdk/Dispatcher;

    .prologue
    .line 52
    iget-object v0, p0, Lorg/piwik/sdk/Dispatcher;->mSleepToken:Ljava/util/concurrent/Semaphore;

    return-object v0
.end method

.method static synthetic access$300(Lorg/piwik/sdk/Dispatcher;)Ljava/util/concurrent/BlockingQueue;
    .registers 2
    .param p0, "x0"    # Lorg/piwik/sdk/Dispatcher;

    .prologue
    .line 52
    iget-object v0, p0, Lorg/piwik/sdk/Dispatcher;->mDispatchQueue:Ljava/util/concurrent/BlockingQueue;

    return-object v0
.end method

.method static synthetic access$400(Lorg/piwik/sdk/Dispatcher;)Ljava/net/URL;
    .registers 2
    .param p0, "x0"    # Lorg/piwik/sdk/Dispatcher;

    .prologue
    .line 52
    iget-object v0, p0, Lorg/piwik/sdk/Dispatcher;->mApiUrl:Ljava/net/URL;

    return-object v0
.end method

.method static synthetic access$500(Lorg/piwik/sdk/Dispatcher;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lorg/piwik/sdk/Dispatcher;

    .prologue
    .line 52
    iget-object v0, p0, Lorg/piwik/sdk/Dispatcher;->mAuthToken:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lorg/piwik/sdk/Dispatcher;Ljava/net/URL;Lorg/json/JSONObject;)Z
    .registers 4
    .param p0, "x0"    # Lorg/piwik/sdk/Dispatcher;
    .param p1, "x1"    # Ljava/net/URL;
    .param p2, "x2"    # Lorg/json/JSONObject;

    .prologue
    .line 52
    invoke-direct {p0, p1, p2}, Lorg/piwik/sdk/Dispatcher;->doPost(Ljava/net/URL;Lorg/json/JSONObject;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$700(Lorg/piwik/sdk/Dispatcher;Ljava/lang/String;)Z
    .registers 3
    .param p0, "x0"    # Lorg/piwik/sdk/Dispatcher;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lorg/piwik/sdk/Dispatcher;->doGet(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$800(Lorg/piwik/sdk/Dispatcher;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lorg/piwik/sdk/Dispatcher;

    .prologue
    .line 52
    iget-object v0, p0, Lorg/piwik/sdk/Dispatcher;->mThreadControl:Ljava/lang/Object;

    return-object v0
.end method

.method private doGet(Ljava/lang/String;)Z
    .registers 4
    .param p1, "trackingEndPointUrl"    # Ljava/lang/String;

    .prologue
    .line 167
    if-nez p1, :cond_4

    .line 168
    const/4 v1, 0x0

    .line 170
    :goto_3
    return v1

    .line 169
    :cond_4
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v0, p1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 170
    .local v0, "get":Lorg/apache/http/client/methods/HttpGet;
    invoke-direct {p0, v0}, Lorg/piwik/sdk/Dispatcher;->doRequest(Lorg/apache/http/client/methods/HttpRequestBase;)Z

    move-result v1

    goto :goto_3
.end method

.method private doPost(Ljava/net/URL;Lorg/json/JSONObject;)Z
    .registers 12
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "json"    # Lorg/json/JSONObject;

    .prologue
    const/4 v8, 0x1

    const/4 v4, 0x0

    .line 174
    if-eqz p1, :cond_6

    if-nez p2, :cond_7

    .line 190
    :cond_6
    :goto_6
    return v4

    .line 177
    :cond_7
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    .line 179
    .local v1, "jsonBody":Ljava/lang/String;
    :try_start_b
    new-instance v2, Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {p1}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v5

    invoke-direct {v2, v5}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/net/URI;)V

    .line 180
    .local v2, "post":Lorg/apache/http/client/methods/HttpPost;
    new-instance v3, Lorg/apache/http/entity/StringEntity;

    invoke-direct {v3, v1}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    .line 181
    .local v3, "se":Lorg/apache/http/entity/StringEntity;
    new-instance v5, Lorg/apache/http/message/BasicHeader;

    const-string v6, "Content-Type"

    const-string v7, "application/json"

    invoke-direct {v5, v6, v7}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Lorg/apache/http/entity/StringEntity;->setContentType(Lorg/apache/http/Header;)V

    .line 182
    invoke-virtual {v2, v3}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 184
    invoke-direct {p0, v2}, Lorg/piwik/sdk/Dispatcher;->doRequest(Lorg/apache/http/client/methods/HttpRequestBase;)Z
    :try_end_2b
    .catch Ljava/net/URISyntaxException; {:try_start_b .. :try_end_2b} :catch_2d
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_b .. :try_end_2b} :catch_42

    move-result v4

    goto :goto_6

    .line 185
    .end local v2    # "post":Lorg/apache/http/client/methods/HttpPost;
    .end local v3    # "se":Lorg/apache/http/entity/StringEntity;
    :catch_2d
    move-exception v0

    .line 186
    .local v0, "e":Ljava/net/URISyntaxException;
    const-string v5, "PIWIK:Dispatcher"

    const-string v6, "URI Syntax Error %s"

    new-array v7, v8, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v4

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v0}, Lorg/piwik/sdk/tools/Logy;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_6

    .line 187
    .end local v0    # "e":Ljava/net/URISyntaxException;
    :catch_42
    move-exception v0

    .line 188
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    const-string v5, "PIWIK:Dispatcher"

    const-string v6, "Unsupported Encoding %s"

    new-array v7, v8, [Ljava/lang/Object;

    aput-object v1, v7, v4

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v0}, Lorg/piwik/sdk/tools/Logy;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_6
.end method

.method private doRequest(Lorg/apache/http/client/methods/HttpRequestBase;)Z
    .registers 13
    .param p1, "requestBase"    # Lorg/apache/http/client/methods/HttpRequestBase;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 194
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 195
    .local v0, "client":Lorg/apache/http/client/HttpClient;
    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v6

    iget v7, p0, Lorg/piwik/sdk/Dispatcher;->mTimeOut:I

    invoke-static {v6, v7}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 198
    iget-object v6, p0, Lorg/piwik/sdk/Dispatcher;->mPiwik:Lorg/piwik/sdk/Piwik;

    invoke-virtual {v6}, Lorg/piwik/sdk/Piwik;->isDryRun()Z

    move-result v6

    if-eqz v6, :cond_3c

    .line 199
    const-string v5, "PIWIK:Dispatcher"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "DryRun, stored HttpRequest, now "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lorg/piwik/sdk/Dispatcher;->mDryRunOutput:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lorg/piwik/sdk/tools/Logy;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    iget-object v5, p0, Lorg/piwik/sdk/Dispatcher;->mDryRunOutput:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 213
    :cond_3b
    :goto_3b
    return v4

    .line 202
    :cond_3c
    iget-object v6, p0, Lorg/piwik/sdk/Dispatcher;->mDryRunOutput:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_49

    .line 203
    iget-object v6, p0, Lorg/piwik/sdk/Dispatcher;->mDryRunOutput:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->clear()V

    .line 205
    :cond_49
    :try_start_49
    invoke-interface {v0, p1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    .line 206
    .local v2, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v3

    .line 207
    .local v3, "statusCode":I
    const-string v6, "PIWIK:Dispatcher"

    const-string v7, "status code %s"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lorg/piwik/sdk/tools/Logy;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6a
    .catch Ljava/lang/Exception; {:try_start_49 .. :try_end_6a} :catch_74

    .line 208
    const/16 v6, 0xcc

    if-eq v3, v6, :cond_72

    const/16 v6, 0xc8

    if-ne v3, v6, :cond_3b

    :cond_72
    move v4, v5

    goto :goto_3b

    .line 209
    .end local v2    # "response":Lorg/apache/http/HttpResponse;
    .end local v3    # "statusCode":I
    :catch_74
    move-exception v1

    .line 210
    .local v1, "e":Ljava/lang/Exception;
    const-string v5, "PIWIK:Dispatcher"

    const-string v6, "Cannot send request"

    invoke-static {v5, v6, v1}, Lorg/piwik/sdk/tools/Logy;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3b
.end method

.method private launch()Z
    .registers 5

    .prologue
    const/4 v0, 0x1

    .line 98
    iget-object v1, p0, Lorg/piwik/sdk/Dispatcher;->mThreadControl:Ljava/lang/Object;

    monitor-enter v1

    .line 99
    :try_start_4
    iget-boolean v2, p0, Lorg/piwik/sdk/Dispatcher;->mRunning:Z

    if-nez v2, :cond_17

    .line 100
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/piwik/sdk/Dispatcher;->mRunning:Z

    .line 101
    new-instance v2, Ljava/lang/Thread;

    iget-object v3, p0, Lorg/piwik/sdk/Dispatcher;->mLoop:Ljava/lang/Runnable;

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 102
    monitor-exit v1

    .line 105
    :goto_16
    return v0

    .line 104
    :cond_17
    monitor-exit v1

    .line 105
    const/4 v0, 0x0

    goto :goto_16

    .line 104
    :catchall_1a
    move-exception v0

    monitor-exit v1
    :try_end_1c
    .catchall {:try_start_4 .. :try_end_1c} :catchall_1a

    throw v0
.end method

.method public static urlEncodeUTF8(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "param"    # Ljava/lang/String;

    .prologue
    .line 224
    :try_start_0
    const-string v1, "UTF-8"

    invoke-static {p0, v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\\+"

    const-string v3, "%20"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_d
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_d} :catch_f
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_d} :catch_24

    move-result-object v1

    .line 229
    :goto_e
    return-object v1

    .line 225
    :catch_f
    move-exception v0

    .line 226
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    const-string v1, "PIWIK:Dispatcher"

    const-string v2, "Cannot encode %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lorg/piwik/sdk/tools/Logy;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 227
    const-string v1, ""

    goto :goto_e

    .line 228
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_24
    move-exception v0

    .line 229
    .local v0, "e":Ljava/lang/NullPointerException;
    const-string v1, ""

    goto :goto_e
.end method

.method public static urlEncodeUTF8(Ljava/util/Map;)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 240
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v3, 0x64

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 241
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/16 v3, 0x3f

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 242
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_14
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_45

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 243
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lorg/piwik/sdk/Dispatcher;->urlEncodeUTF8(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    const/16 v3, 0x3d

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 245
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lorg/piwik/sdk/Dispatcher;->urlEncodeUTF8(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    const/16 v3, 0x26

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_14

    .line 249
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_45
    const/4 v3, 0x0

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method


# virtual methods
.method public forceDispatch()V
    .registers 2

    .prologue
    .line 113
    invoke-direct {p0}, Lorg/piwik/sdk/Dispatcher;->launch()Z

    move-result v0

    if-nez v0, :cond_b

    .line 114
    iget-object v0, p0, Lorg/piwik/sdk/Dispatcher;->mSleepToken:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 116
    :cond_b
    return-void
.end method

.method public getDispatchInterval()J
    .registers 3

    .prologue
    .line 94
    iget-wide v0, p0, Lorg/piwik/sdk/Dispatcher;->mDispatchInterval:J

    return-wide v0
.end method

.method public getDryRunOutput()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/client/methods/HttpRequestBase;",
            ">;"
        }
    .end annotation

    .prologue
    .line 253
    iget-object v0, p0, Lorg/piwik/sdk/Dispatcher;->mDryRunOutput:Ljava/util/List;

    return-object v0
.end method

.method public getTimeOut()I
    .registers 2

    .prologue
    .line 80
    iget v0, p0, Lorg/piwik/sdk/Dispatcher;->mTimeOut:I

    return v0
.end method

.method public setDispatchInterval(J)V
    .registers 7
    .param p1, "dispatchInterval"    # J

    .prologue
    .line 88
    iput-wide p1, p0, Lorg/piwik/sdk/Dispatcher;->mDispatchInterval:J

    .line 89
    iget-wide v0, p0, Lorg/piwik/sdk/Dispatcher;->mDispatchInterval:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_d

    .line 90
    invoke-direct {p0}, Lorg/piwik/sdk/Dispatcher;->launch()Z

    .line 91
    :cond_d
    return-void
.end method

.method public setTimeOut(I)V
    .registers 2
    .param p1, "timeOut"    # I

    .prologue
    .line 84
    iput p1, p0, Lorg/piwik/sdk/Dispatcher;->mTimeOut:I

    .line 85
    return-void
.end method

.method public submit(Ljava/lang/String;)V
    .registers 6
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 119
    iget-object v0, p0, Lorg/piwik/sdk/Dispatcher;->mDispatchQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0, p1}, Ljava/util/concurrent/BlockingQueue;->add(Ljava/lang/Object;)Z

    .line 120
    iget-wide v0, p0, Lorg/piwik/sdk/Dispatcher;->mDispatchInterval:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_10

    .line 121
    invoke-direct {p0}, Lorg/piwik/sdk/Dispatcher;->launch()Z

    .line 122
    :cond_10
    return-void
.end method
