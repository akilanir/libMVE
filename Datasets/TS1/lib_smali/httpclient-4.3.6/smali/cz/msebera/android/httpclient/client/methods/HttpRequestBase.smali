.class public abstract Lcz/msebera/android/httpclient/client/methods/HttpRequestBase;
.super Lcz/msebera/android/httpclient/client/methods/AbstractExecutionAwareRequest;
.source "HttpRequestBase.java"

# interfaces
.implements Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;
.implements Lcz/msebera/android/httpclient/client/methods/Configurable;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private config:Lcz/msebera/android/httpclient/client/config/RequestConfig;

.field private uri:Ljava/net/URI;

.field private version:Lcz/msebera/android/httpclient/ProtocolVersion;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 46
    invoke-direct {p0}, Lcz/msebera/android/httpclient/client/methods/AbstractExecutionAwareRequest;-><init>()V

    return-void
.end method


# virtual methods
.method public getConfig()Lcz/msebera/android/httpclient/client/config/RequestConfig;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestBase;->config:Lcz/msebera/android/httpclient/client/config/RequestConfig;

    return-object v0
.end method

.method public abstract getMethod()Ljava/lang/String;
.end method

.method public getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;
    .registers 2

    .prologue
    .line 63
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestBase;->version:Lcz/msebera/android/httpclient/ProtocolVersion;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestBase;->version:Lcz/msebera/android/httpclient/ProtocolVersion;

    :goto_6
    return-object v0

    :cond_7
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/client/methods/HttpRequestBase;->getParams()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v0

    invoke-static {v0}, Lcz/msebera/android/httpclient/params/HttpProtocolParams;->getVersion(Lcz/msebera/android/httpclient/params/HttpParams;)Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v0

    goto :goto_6
.end method

.method public getRequestLine()Lcz/msebera/android/httpclient/RequestLine;
    .registers 6

    .prologue
    .line 77
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/client/methods/HttpRequestBase;->getMethod()Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "method":Ljava/lang/String;
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/client/methods/HttpRequestBase;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v3

    .line 79
    .local v3, "ver":Lcz/msebera/android/httpclient/ProtocolVersion;
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/client/methods/HttpRequestBase;->getURI()Ljava/net/URI;

    move-result-object v1

    .line 80
    .local v1, "uri":Ljava/net/URI;
    const/4 v2, 0x0

    .line 81
    .local v2, "uritext":Ljava/lang/String;
    if-eqz v1, :cond_13

    .line 82
    invoke-virtual {v1}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    move-result-object v2

    .line 84
    :cond_13
    if-eqz v2, :cond_1b

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_1d

    .line 85
    :cond_1b
    const-string v2, "/"

    .line 87
    :cond_1d
    new-instance v4, Lcz/msebera/android/httpclient/message/BasicRequestLine;

    invoke-direct {v4, v0, v2, v3}, Lcz/msebera/android/httpclient/message/BasicRequestLine;-><init>(Ljava/lang/String;Ljava/lang/String;Lcz/msebera/android/httpclient/ProtocolVersion;)V

    return-object v4
.end method

.method public getURI()Ljava/net/URI;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestBase;->uri:Ljava/net/URI;

    return-object v0
.end method

.method public releaseConnection()V
    .registers 1

    .prologue
    .line 116
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/client/methods/HttpRequestBase;->reset()V

    .line 117
    return-void
.end method

.method public setConfig(Lcz/msebera/android/httpclient/client/config/RequestConfig;)V
    .registers 2
    .param p1, "config"    # Lcz/msebera/android/httpclient/client/config/RequestConfig;

    .prologue
    .line 96
    iput-object p1, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestBase;->config:Lcz/msebera/android/httpclient/client/config/RequestConfig;

    .line 97
    return-void
.end method

.method public setProtocolVersion(Lcz/msebera/android/httpclient/ProtocolVersion;)V
    .registers 2
    .param p1, "version"    # Lcz/msebera/android/httpclient/ProtocolVersion;

    .prologue
    .line 59
    iput-object p1, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestBase;->version:Lcz/msebera/android/httpclient/ProtocolVersion;

    .line 60
    return-void
.end method

.method public setURI(Ljava/net/URI;)V
    .registers 2
    .param p1, "uri"    # Ljava/net/URI;

    .prologue
    .line 100
    iput-object p1, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestBase;->uri:Ljava/net/URI;

    .line 101
    return-void
.end method

.method public started()V
    .registers 1

    .prologue
    .line 107
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcz/msebera/android/httpclient/client/methods/HttpRequestBase;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcz/msebera/android/httpclient/client/methods/HttpRequestBase;->getURI()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcz/msebera/android/httpclient/client/methods/HttpRequestBase;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
