.class public Lorg/piwik/sdk/dispatcher/Dispatcher;
.super Ljava/lang/Object;
.source "Dispatcher.java"


# static fields
.field public static final DEFAULT_CONNECTION_TIMEOUT:I = 0x1388

.field public static final DEFAULT_DISPATCH_INTERVAL:J = 0x1d4c0L

.field private static final LOGGER_TAG:Ljava/lang/String; = "PIWIK:Dispatcher"


# instance fields
.field private final mApiUrl:Ljava/net/URL;

.field private final mAuthToken:Ljava/lang/String;

.field private volatile mDispatchInterval:J

.field private final mDispatchQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mDryRunOutput:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/piwik/sdk/dispatcher/Packet;",
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

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mDispatchQueue:Ljava/util/concurrent/BlockingQueue;

    .line 50
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mThreadControl:Ljava/lang/Object;

    .line 51
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mSleepToken:Ljava/util/concurrent/Semaphore;

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mDryRunOutput:Ljava/util/List;

    .line 58
    const/16 v0, 0x1388

    iput v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mTimeOut:I

    .line 59
    iput-boolean v1, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mRunning:Z

    .line 62
    const-wide/32 v0, 0x1d4c0

    iput-wide v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mDispatchInterval:J

    .line 133
    new-instance v0, Lorg/piwik/sdk/dispatcher/Dispatcher$1;

    invoke-direct {v0, p0}, Lorg/piwik/sdk/dispatcher/Dispatcher$1;-><init>(Lorg/piwik/sdk/dispatcher/Dispatcher;)V

    iput-object v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mLoop:Ljava/lang/Runnable;

    .line 65
    iput-object p1, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mPiwik:Lorg/piwik/sdk/Piwik;

    .line 66
    iput-object p2, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mApiUrl:Ljava/net/URL;

    .line 67
    iput-object p3, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mAuthToken:Ljava/lang/String;

    .line 68
    return-void
.end method

.method static synthetic access$000(Lorg/piwik/sdk/dispatcher/Dispatcher;)Z
    .registers 2
    .param p0, "x0"    # Lorg/piwik/sdk/dispatcher/Dispatcher;

    .line 47
    iget-boolean v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mRunning:Z

    return v0
.end method

.method static synthetic access$002(Lorg/piwik/sdk/dispatcher/Dispatcher;Z)Z
    .registers 2
    .param p0, "x0"    # Lorg/piwik/sdk/dispatcher/Dispatcher;
    .param p1, "x1"    # Z

    .line 47
    iput-boolean p1, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mRunning:Z

    return p1
.end method

.method static synthetic access$100(Lorg/piwik/sdk/dispatcher/Dispatcher;)J
    .registers 3
    .param p0, "x0"    # Lorg/piwik/sdk/dispatcher/Dispatcher;

    .line 47
    iget-wide v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mDispatchInterval:J

    return-wide v0
.end method

.method static synthetic access$200(Lorg/piwik/sdk/dispatcher/Dispatcher;)Ljava/util/concurrent/Semaphore;
    .registers 2
    .param p0, "x0"    # Lorg/piwik/sdk/dispatcher/Dispatcher;

    .line 47
    iget-object v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mSleepToken:Ljava/util/concurrent/Semaphore;

    return-object v0
.end method

.method static synthetic access$300(Lorg/piwik/sdk/dispatcher/Dispatcher;)Ljava/util/concurrent/BlockingQueue;
    .registers 2
    .param p0, "x0"    # Lorg/piwik/sdk/dispatcher/Dispatcher;

    .line 47
    iget-object v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mDispatchQueue:Ljava/util/concurrent/BlockingQueue;

    return-object v0
.end method

.method static synthetic access$400(Lorg/piwik/sdk/dispatcher/Dispatcher;)Ljava/net/URL;
    .registers 2
    .param p0, "x0"    # Lorg/piwik/sdk/dispatcher/Dispatcher;

    .line 47
    iget-object v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mApiUrl:Ljava/net/URL;

    return-object v0
.end method

.method static synthetic access$500(Lorg/piwik/sdk/dispatcher/Dispatcher;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lorg/piwik/sdk/dispatcher/Dispatcher;

    .line 47
    iget-object v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mAuthToken:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lorg/piwik/sdk/dispatcher/Dispatcher;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lorg/piwik/sdk/dispatcher/Dispatcher;

    .line 47
    iget-object v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mThreadControl:Ljava/lang/Object;

    return-object v0
.end method

.method private launch()Z
    .registers 5

    .line 105
    iget-object v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mThreadControl:Ljava/lang/Object;

    monitor-enter v0

    .line 106
    :try_start_3
    iget-boolean v1, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mRunning:Z

    if-nez v1, :cond_16

    .line 107
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mRunning:Z

    .line 108
    new-instance v2, Ljava/lang/Thread;

    iget-object v3, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mLoop:Ljava/lang/Runnable;

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 109
    monitor-exit v0

    return v1

    .line 111
    :cond_16
    monitor-exit v0

    .line 112
    const/4 v0, 0x0

    return v0

    .line 111
    :catchall_19
    move-exception v1

    monitor-exit v0
    :try_end_1b
    .catchall {:try_start_3 .. :try_end_1b} :catchall_19

    throw v1
.end method

.method public static urlEncodeUTF8(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "param"    # Ljava/lang/String;

    .line 237
    :try_start_0
    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\\+"

    const-string v2, "%20"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_e
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_e} :catch_13
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_e} :catch_f

    return-object v0

    .line 241
    :catch_f
    move-exception v0

    .line 242
    .local v0, "e":Ljava/lang/NullPointerException;
    const-string v1, ""

    return-object v1

    .line 238
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :catch_13
    move-exception v0

    .line 239
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

    .line 240
    const-string v1, ""

    return-object v1
.end method

.method public static urlEncodeUTF8(Ljava/util/Map;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 253
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 254
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/16 v1, 0x3f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 255
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_14
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_45

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 256
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lorg/piwik/sdk/dispatcher/Dispatcher;->urlEncodeUTF8(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    const/16 v3, 0x3d

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 258
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lorg/piwik/sdk/dispatcher/Dispatcher;->urlEncodeUTF8(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    const/16 v3, 0x26

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 260
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_14

    .line 262
    :cond_45
    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public dispatch(Lorg/piwik/sdk/dispatcher/Packet;)Z
    .registers 10
    .param p1, "packet"    # Lorg/piwik/sdk/dispatcher/Packet;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 184
    invoke-virtual {p1}, Lorg/piwik/sdk/dispatcher/Packet;->getTargetURL()Ljava/net/URL;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    .line 185
    return v1

    .line 186
    :cond_8
    invoke-virtual {p1}, Lorg/piwik/sdk/dispatcher/Packet;->getJSONObject()Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_19

    invoke-virtual {p1}, Lorg/piwik/sdk/dispatcher/Packet;->getJSONObject()Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->length()I

    move-result v0

    if-nez v0, :cond_19

    .line 187
    return v1

    .line 189
    :cond_19
    iget-object v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mPiwik:Lorg/piwik/sdk/Piwik;

    invoke-virtual {v0}, Lorg/piwik/sdk/Piwik;->isDryRun()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_44

    .line 190
    const-string v0, "PIWIK:Dispatcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DryRun, stored HttpRequest, now "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mDryRunOutput:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/piwik/sdk/tools/Logy;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    iget-object v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mDryRunOutput:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    return v2

    .line 195
    :cond_44
    iget-object v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mDryRunOutput:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_51

    .line 196
    iget-object v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mDryRunOutput:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 199
    :cond_51
    :try_start_51
    invoke-virtual {p1}, Lorg/piwik/sdk/dispatcher/Packet;->getTargetURL()Ljava/net/URL;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 200
    .local v0, "urlConnection":Ljava/net/HttpURLConnection;
    iget v3, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mTimeOut:I

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 201
    iget v3, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mTimeOut:I

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 204
    invoke-virtual {p1}, Lorg/piwik/sdk/dispatcher/Packet;->getJSONObject()Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_9e

    .line 206
    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 207
    const-string v3, "Content-Type"

    const-string v4, "application/json"

    invoke-virtual {v0, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    const-string v3, "charset"

    const-string v4, "utf-8"

    invoke-virtual {v0, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    new-instance v3, Ljava/io/BufferedWriter;

    new-instance v4, Ljava/io/OutputStreamWriter;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-direct {v4, v5, v6}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 211
    .local v3, "writer":Ljava/io/BufferedWriter;
    invoke-virtual {p1}, Lorg/piwik/sdk/dispatcher/Packet;->getJSONObject()Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 212
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->flush()V

    .line 213
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V

    .line 214
    .end local v3    # "writer":Ljava/io/BufferedWriter;
    goto :goto_a1

    .line 216
    :cond_9e
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 219
    :goto_a1
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v3

    .line 220
    .local v3, "statusCode":I
    const-string v4, "PIWIK:Dispatcher"

    const-string v5, "status code %s"

    new-array v6, v2, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/piwik/sdk/tools/Logy;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_b8
    .catch Ljava/lang/Exception; {:try_start_51 .. :try_end_b8} :catch_c4

    .line 221
    const/16 v4, 0xcc

    if-eq v3, v4, :cond_c2

    const/16 v4, 0xc8

    if-ne v3, v4, :cond_c1

    goto :goto_c2

    :cond_c1
    goto :goto_c3

    :cond_c2
    :goto_c2
    const/4 v1, 0x1

    :goto_c3
    return v1

    .line 222
    .end local v0    # "urlConnection":Ljava/net/HttpURLConnection;
    .end local v3    # "statusCode":I
    :catch_c4
    move-exception v0

    .line 224
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "PIWIK:Dispatcher"

    const-string v3, "Cannot send request"

    invoke-static {v2, v3, v0}, Lorg/piwik/sdk/tools/Logy;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 226
    .end local v0    # "e":Ljava/lang/Exception;
    return v1
.end method

.method public forceDispatch()Z
    .registers 2

    .line 120
    invoke-direct {p0}, Lorg/piwik/sdk/dispatcher/Dispatcher;->launch()Z

    move-result v0

    if-nez v0, :cond_d

    .line 121
    iget-object v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mSleepToken:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 122
    const/4 v0, 0x0

    return v0

    .line 124
    :cond_d
    const/4 v0, 0x1

    return v0
.end method

.method public getConnectionTimeOut()I
    .registers 2

    .line 76
    iget v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mTimeOut:I

    return v0
.end method

.method public getDispatchInterval()J
    .registers 3

    .line 101
    iget-wide v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mDispatchInterval:J

    return-wide v0
.end method

.method public getDryRunOutput()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/piwik/sdk/dispatcher/Packet;",
            ">;"
        }
    .end annotation

    .line 266
    iget-object v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mDryRunOutput:Ljava/util/List;

    return-object v0
.end method

.method public setConnectionTimeOut(I)V
    .registers 2
    .param p1, "timeOut"    # I

    .line 86
    iput p1, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mTimeOut:I

    .line 87
    return-void
.end method

.method public setDispatchInterval(J)V
    .registers 8
    .param p1, "dispatchInterval"    # J

    .line 95
    iput-wide p1, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mDispatchInterval:J

    .line 96
    iget-wide v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mDispatchInterval:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-eqz v4, :cond_d

    .line 97
    invoke-direct {p0}, Lorg/piwik/sdk/dispatcher/Dispatcher;->launch()Z

    .line 98
    :cond_d
    return-void
.end method

.method public submit(Ljava/lang/String;)V
    .registers 7
    .param p1, "query"    # Ljava/lang/String;

    .line 128
    iget-object v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mDispatchQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0, p1}, Ljava/util/concurrent/BlockingQueue;->add(Ljava/lang/Object;)Z

    .line 129
    iget-wide v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher;->mDispatchInterval:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-eqz v4, :cond_10

    .line 130
    invoke-direct {p0}, Lorg/piwik/sdk/dispatcher/Dispatcher;->launch()Z

    .line 131
    :cond_10
    return-void
.end method
