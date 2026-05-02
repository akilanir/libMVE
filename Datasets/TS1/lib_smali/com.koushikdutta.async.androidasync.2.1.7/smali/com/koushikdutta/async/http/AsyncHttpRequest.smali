.class public Lcom/koushikdutta/async/http/AsyncHttpRequest;
.super Ljava/lang/Object;
.source "AsyncHttpRequest.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final DEFAULT_TIMEOUT:I = 0x7530


# instance fields
.field LOGTAG:Ljava/lang/String;

.field executionTime:J

.field logLevel:I

.field private mBody:Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;

.field private mFollowRedirect:Z

.field private mMethod:Ljava/lang/String;

.field private mRawHeaders:Lcom/koushikdutta/async/http/Headers;

.field mTimeout:I

.field proxyHost:Ljava/lang/String;

.field proxyPort:I

.field uri:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 9
    const-class v0, Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Landroid/net/Uri;Ljava/lang/String;)V
    .registers 4
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "method"    # Ljava/lang/String;

    .prologue
    .line 61
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;-><init>(Landroid/net/Uri;Ljava/lang/String;Lcom/koushikdutta/async/http/Headers;)V

    .line 62
    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;Ljava/lang/String;Lcom/koushikdutta/async/http/Headers;)V
    .registers 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "method"    # Ljava/lang/String;
    .param p3, "headers"    # Lcom/koushikdutta/async/http/Headers;

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    new-instance v0, Lcom/koushikdutta/async/http/Headers;

    invoke-direct {v0}, Lcom/koushikdutta/async/http/Headers;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    .line 101
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->mFollowRedirect:Z

    .line 123
    const/16 v0, 0x7530

    iput v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->mTimeout:I

    .line 144
    const/4 v0, -0x1

    iput v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->proxyPort:I

    .line 79
    sget-boolean v0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->$assertionsDisabled:Z

    if-nez v0, :cond_20

    if-nez p1, :cond_20

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 80
    :cond_20
    iput-object p2, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->mMethod:Ljava/lang/String;

    .line 81
    iput-object p1, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->uri:Landroid/net/Uri;

    .line 82
    if-nez p3, :cond_35

    .line 83
    new-instance v0, Lcom/koushikdutta/async/http/Headers;

    invoke-direct {v0}, Lcom/koushikdutta/async/http/Headers;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    .line 86
    :goto_2d
    if-nez p3, :cond_34

    .line 87
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    invoke-static {v0, p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->setDefaultHeaders(Lcom/koushikdutta/async/http/Headers;Landroid/net/Uri;)V

    .line 88
    :cond_34
    return-void

    .line 85
    :cond_35
    iput-object p3, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    goto :goto_2d
.end method

.method static synthetic access$000(Lcom/koushikdutta/async/http/AsyncHttpRequest;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .prologue
    .line 9
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->mMethod:Ljava/lang/String;

    return-object v0
.end method

.method protected static getDefaultUserAgent()Ljava/lang/String;
    .registers 3

    .prologue
    .line 44
    const-string v1, "http.agent"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 45
    .local v0, "agent":Ljava/lang/String;
    if-eqz v0, :cond_9

    .end local v0    # "agent":Ljava/lang/String;
    :goto_8
    return-object v0

    .restart local v0    # "agent":Ljava/lang/String;
    :cond_9
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Java"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "java.version"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_8
.end method

.method private getLogMessage(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 186
    iget-wide v2, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->executionTime:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_2b

    .line 187
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->executionTime:J

    sub-long v0, v2, v4

    .line 190
    .local v0, "elapsed":J
    :goto_10
    const-string v2, "(%d ms) %s: %s"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-virtual {p0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 189
    .end local v0    # "elapsed":J
    :cond_2b
    const-wide/16 v0, 0x0

    .restart local v0    # "elapsed":J
    goto :goto_10
.end method

.method public static setDefaultHeaders(Lcom/koushikdutta/async/http/Headers;Landroid/net/Uri;)V
    .registers 5
    .param p0, "ret"    # Lcom/koushikdutta/async/http/Headers;
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 65
    if-eqz p1, :cond_2f

    .line 66
    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    .line 67
    .local v0, "host":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/net/Uri;->getPort()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_28

    .line 68
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/net/Uri;->getPort()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 69
    :cond_28
    if-eqz v0, :cond_2f

    .line 70
    const-string v1, "Host"

    invoke-virtual {p0, v1, v0}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 72
    .end local v0    # "host":Ljava/lang/String;
    :cond_2f
    const-string v1, "User-Agent"

    invoke-static {}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getDefaultUserAgent()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 73
    const-string v1, "Accept-Encoding"

    const-string v2, "gzip, deflate"

    invoke-virtual {p0, v1, v2}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 74
    const-string v1, "Connection"

    const-string v2, "keep-alive"

    invoke-virtual {p0, v1, v2}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 75
    const-string v1, "Accept"

    const-string v2, "*/*"

    invoke-virtual {p0, v1, v2}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 76
    return-void
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 139
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/koushikdutta/async/http/Headers;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 140
    return-object p0
.end method

.method public disableProxy()V
    .registers 2

    .prologue
    .line 151
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->proxyHost:Ljava/lang/String;

    .line 152
    const/4 v0, -0x1

    iput v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->proxyPort:I

    .line 153
    return-void
.end method

.method public enableProxy(Ljava/lang/String;I)V
    .registers 3
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    .line 146
    iput-object p1, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->proxyHost:Ljava/lang/String;

    .line 147
    iput p2, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->proxyPort:I

    .line 148
    return-void
.end method

.method public getBody()Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->mBody:Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;

    return-object v0
.end method

.method public getFollowRedirect()Z
    .registers 2

    .prologue
    .line 103
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->mFollowRedirect:Z

    return v0
.end method

.method public getHeaders()Lcom/koushikdutta/async/http/Headers;
    .registers 2

    .prologue
    .line 98
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    return-object v0
.end method

.method public getLogLevel()I
    .registers 2

    .prologue
    .line 178
    iget v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logLevel:I

    return v0
.end method

.method public getLogTag()Ljava/lang/String;
    .registers 2

    .prologue
    .line 181
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->LOGTAG:Ljava/lang/String;

    return-object v0
.end method

.method public getMethod()Ljava/lang/String;
    .registers 2

    .prologue
    .line 50
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->mMethod:Ljava/lang/String;

    return-object v0
.end method

.method public getProxyHost()Ljava/lang/String;
    .registers 2

    .prologue
    .line 156
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->proxyHost:Ljava/lang/String;

    return-object v0
.end method

.method public getProxyPort()I
    .registers 2

    .prologue
    .line 160
    iget v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->proxyPort:I

    return v0
.end method

.method public getRequestLine()Lcom/koushikdutta/async/http/RequestLine;
    .registers 2

    .prologue
    .line 11
    new-instance v0, Lcom/koushikdutta/async/http/AsyncHttpRequest$1;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/http/AsyncHttpRequest$1;-><init>(Lcom/koushikdutta/async/http/AsyncHttpRequest;)V

    return-object v0
.end method

.method public getTimeout()I
    .registers 2

    .prologue
    .line 125
    iget v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->mTimeout:I

    return v0
.end method

.method public getUri()Landroid/net/Uri;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->uri:Landroid/net/Uri;

    return-object v0
.end method

.method public logd(Ljava/lang/String;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 214
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->LOGTAG:Ljava/lang/String;

    if-nez v0, :cond_5

    .line 219
    :cond_4
    :goto_4
    return-void

    .line 216
    :cond_5
    iget v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logLevel:I

    const/4 v1, 0x3

    if-gt v0, v1, :cond_4

    .line 218
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->LOGTAG:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getLogMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4
.end method

.method public logd(Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 5
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 221
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->LOGTAG:Ljava/lang/String;

    if-nez v0, :cond_5

    .line 227
    :cond_4
    :goto_4
    return-void

    .line 223
    :cond_5
    iget v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logLevel:I

    const/4 v1, 0x3

    if-gt v0, v1, :cond_4

    .line 225
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->LOGTAG:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getLogMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->LOGTAG:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4
.end method

.method public loge(Ljava/lang/String;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 229
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->LOGTAG:Ljava/lang/String;

    if-nez v0, :cond_5

    .line 234
    :cond_4
    :goto_4
    return-void

    .line 231
    :cond_5
    iget v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logLevel:I

    const/4 v1, 0x6

    if-gt v0, v1, :cond_4

    .line 233
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->LOGTAG:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getLogMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4
.end method

.method public loge(Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 5
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 236
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->LOGTAG:Ljava/lang/String;

    if-nez v0, :cond_5

    .line 242
    :cond_4
    :goto_4
    return-void

    .line 238
    :cond_5
    iget v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logLevel:I

    const/4 v1, 0x6

    if-gt v0, v1, :cond_4

    .line 240
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->LOGTAG:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getLogMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->LOGTAG:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4
.end method

.method public logi(Ljava/lang/String;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 193
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->LOGTAG:Ljava/lang/String;

    if-nez v0, :cond_5

    .line 198
    :cond_4
    :goto_4
    return-void

    .line 195
    :cond_5
    iget v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logLevel:I

    const/4 v1, 0x4

    if-gt v0, v1, :cond_4

    .line 197
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->LOGTAG:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getLogMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4
.end method

.method public logv(Ljava/lang/String;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 200
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->LOGTAG:Ljava/lang/String;

    if-nez v0, :cond_5

    .line 205
    :cond_4
    :goto_4
    return-void

    .line 202
    :cond_5
    iget v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logLevel:I

    const/4 v1, 0x2

    if-gt v0, v1, :cond_4

    .line 204
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->LOGTAG:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getLogMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4
.end method

.method public logw(Ljava/lang/String;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 207
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->LOGTAG:Ljava/lang/String;

    if-nez v0, :cond_5

    .line 212
    :cond_4
    :goto_4
    return-void

    .line 209
    :cond_5
    iget v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logLevel:I

    const/4 v1, 0x5

    if-gt v0, v1, :cond_4

    .line 211
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->LOGTAG:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getLogMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4
.end method

.method public onHandshakeException(Lcom/koushikdutta/async/AsyncSSLException;)V
    .registers 2
    .param p1, "e"    # Lcom/koushikdutta/async/AsyncSSLException;

    .prologue
    .line 120
    return-void
.end method

.method public setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)V
    .registers 2
    .param p1, "body"    # Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;

    .prologue
    .line 112
    iput-object p1, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->mBody:Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;

    .line 113
    return-void
.end method

.method public setFollowRedirect(Z)Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .registers 2
    .param p1, "follow"    # Z

    .prologue
    .line 106
    iput-boolean p1, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->mFollowRedirect:Z

    .line 107
    return-object p0
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 134
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 135
    return-object p0
.end method

.method public setLogging(Ljava/lang/String;I)V
    .registers 3
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "level"    # I

    .prologue
    .line 171
    iput-object p1, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->LOGTAG:Ljava/lang/String;

    .line 172
    iput p2, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logLevel:I

    .line 173
    return-void
.end method

.method public setMethod(Ljava/lang/String;)Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .registers 4
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/koushikdutta/async/http/AsyncHttpRequest;

    if-eq v0, v1, :cond_10

    .line 55
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "can\'t change method on a subclass of AsyncHttpRequest"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 56
    :cond_10
    iput-object p1, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->mMethod:Ljava/lang/String;

    .line 57
    return-object p0
.end method

.method public setTimeout(I)Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .registers 2
    .param p1, "timeout"    # I

    .prologue
    .line 129
    iput p1, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->mTimeout:I

    .line 130
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 165
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    if-nez v0, :cond_9

    .line 166
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 167
    :goto_8
    return-object v0

    :cond_9
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    iget-object v1, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->uri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/Headers;->toPrefixString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_8
.end method
