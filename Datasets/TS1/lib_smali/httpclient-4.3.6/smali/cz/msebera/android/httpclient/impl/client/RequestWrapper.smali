.class public Lcz/msebera/android/httpclient/impl/client/RequestWrapper;
.super Lcz/msebera/android/httpclient/message/AbstractHttpMessage;
.source "RequestWrapper.java"

# interfaces
.implements Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private execCount:I

.field private method:Ljava/lang/String;

.field private final original:Lcz/msebera/android/httpclient/HttpRequest;

.field private uri:Ljava/net/URI;

.field private version:Lcz/msebera/android/httpclient/ProtocolVersion;


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/HttpRequest;)V
    .registers 7
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/ProtocolException;
        }
    .end annotation

    .prologue
    .line 68
    invoke-direct {p0}, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;-><init>()V

    .line 69
    const-string v2, "HTTP request"

    invoke-static {p1, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 70
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->original:Lcz/msebera/android/httpclient/HttpRequest;

    .line 71
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getParams()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->setParams(Lcz/msebera/android/httpclient/params/HttpParams;)V

    .line 72
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getAllHeaders()[Lcz/msebera/android/httpclient/Header;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->setHeaders([Lcz/msebera/android/httpclient/Header;)V

    .line 74
    instance-of v2, p1, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;

    if-eqz v2, :cond_34

    move-object v2, p1

    .line 75
    check-cast v2, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;

    invoke-interface {v2}, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v2

    iput-object v2, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->uri:Ljava/net/URI;

    .line 76
    check-cast p1, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;

    .end local p1    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    invoke-interface {p1}, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;->getMethod()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->method:Ljava/lang/String;

    .line 77
    const/4 v2, 0x0

    iput-object v2, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->version:Lcz/msebera/android/httpclient/ProtocolVersion;

    .line 89
    :goto_30
    const/4 v2, 0x0

    iput v2, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->execCount:I

    .line 90
    return-void

    .line 79
    .restart local p1    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    :cond_34
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v1

    .line 81
    .local v1, "requestLine":Lcz/msebera/android/httpclient/RequestLine;
    :try_start_38
    new-instance v2, Ljava/net/URI;

    invoke-interface {v1}, Lcz/msebera/android/httpclient/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->uri:Ljava/net/URI;
    :try_end_43
    .catch Ljava/net/URISyntaxException; {:try_start_38 .. :try_end_43} :catch_50

    .line 86
    invoke-interface {v1}, Lcz/msebera/android/httpclient/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->method:Ljava/lang/String;

    .line 87
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v2

    iput-object v2, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->version:Lcz/msebera/android/httpclient/ProtocolVersion;

    goto :goto_30

    .line 82
    :catch_50
    move-exception v0

    .line 83
    .local v0, "ex":Ljava/net/URISyntaxException;
    new-instance v2, Lcz/msebera/android/httpclient/ProtocolException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid request URI: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 84
    invoke-interface {v1}, Lcz/msebera/android/httpclient/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lcz/msebera/android/httpclient/ProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method


# virtual methods
.method public abort()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .prologue
    .line 141
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getExecCount()I
    .registers 2

    .prologue
    .line 157
    iget v0, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->execCount:I

    return v0
.end method

.method public getMethod()Ljava/lang/String;
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->method:Ljava/lang/String;

    return-object v0
.end method

.method public getOriginal()Lcz/msebera/android/httpclient/HttpRequest;
    .registers 2

    .prologue
    .line 149
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->original:Lcz/msebera/android/httpclient/HttpRequest;

    return-object v0
.end method

.method public getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->version:Lcz/msebera/android/httpclient/ProtocolVersion;

    if-nez v0, :cond_e

    .line 109
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->getParams()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v0

    invoke-static {v0}, Lcz/msebera/android/httpclient/params/HttpProtocolParams;->getVersion(Lcz/msebera/android/httpclient/params/HttpParams;)Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->version:Lcz/msebera/android/httpclient/ProtocolVersion;

    .line 111
    :cond_e
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->version:Lcz/msebera/android/httpclient/ProtocolVersion;

    return-object v0
.end method

.method public getRequestLine()Lcz/msebera/android/httpclient/RequestLine;
    .registers 5

    .prologue
    .line 128
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->getMethod()Ljava/lang/String;

    move-result-object v0

    .line 129
    .local v0, "method":Ljava/lang/String;
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v2

    .line 130
    .local v2, "ver":Lcz/msebera/android/httpclient/ProtocolVersion;
    const/4 v1, 0x0

    .line 131
    .local v1, "uritext":Ljava/lang/String;
    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->uri:Ljava/net/URI;

    if-eqz v3, :cond_13

    .line 132
    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->uri:Ljava/net/URI;

    invoke-virtual {v3}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    move-result-object v1

    .line 134
    :cond_13
    if-eqz v1, :cond_1b

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_1d

    .line 135
    :cond_1b
    const-string v1, "/"

    .line 137
    :cond_1d
    new-instance v3, Lcz/msebera/android/httpclient/message/BasicRequestLine;

    invoke-direct {v3, v0, v1, v2}, Lcz/msebera/android/httpclient/message/BasicRequestLine;-><init>(Ljava/lang/String;Ljava/lang/String;Lcz/msebera/android/httpclient/ProtocolVersion;)V

    return-object v3
.end method

.method public getURI()Ljava/net/URI;
    .registers 2

    .prologue
    .line 120
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->uri:Ljava/net/URI;

    return-object v0
.end method

.method public incrementExecCount()V
    .registers 2

    .prologue
    .line 161
    iget v0, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->execCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->execCount:I

    .line 162
    return-void
.end method

.method public isAborted()Z
    .registers 2

    .prologue
    .line 145
    const/4 v0, 0x0

    return v0
.end method

.method public isRepeatable()Z
    .registers 2

    .prologue
    .line 153
    const/4 v0, 0x1

    return v0
.end method

.method public resetHeaders()V
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/message/HeaderGroup;->clear()V

    .line 95
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->original:Lcz/msebera/android/httpclient/HttpRequest;

    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpRequest;->getAllHeaders()[Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->setHeaders([Lcz/msebera/android/httpclient/Header;)V

    .line 96
    return-void
.end method

.method public setMethod(Ljava/lang/String;)V
    .registers 3
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 103
    const-string v0, "Method name"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 104
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->method:Ljava/lang/String;

    .line 105
    return-void
.end method

.method public setProtocolVersion(Lcz/msebera/android/httpclient/ProtocolVersion;)V
    .registers 2
    .param p1, "version"    # Lcz/msebera/android/httpclient/ProtocolVersion;

    .prologue
    .line 115
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->version:Lcz/msebera/android/httpclient/ProtocolVersion;

    .line 116
    return-void
.end method

.method public setURI(Ljava/net/URI;)V
    .registers 2
    .param p1, "uri"    # Ljava/net/URI;

    .prologue
    .line 124
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->uri:Ljava/net/URI;

    .line 125
    return-void
.end method
