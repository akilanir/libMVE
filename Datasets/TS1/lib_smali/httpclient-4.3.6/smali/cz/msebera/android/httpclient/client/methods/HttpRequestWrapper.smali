.class public Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
.super Lcz/msebera/android/httpclient/message/AbstractHttpMessage;
.source "HttpRequestWrapper.java"

# interfaces
.implements Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper$HttpEntityEnclosingRequestWrapper;
    }
.end annotation


# instance fields
.field private final method:Ljava/lang/String;

.field private final original:Lcz/msebera/android/httpclient/HttpRequest;

.field private uri:Ljava/net/URI;

.field private version:Lcz/msebera/android/httpclient/ProtocolVersion;


# direct methods
.method private constructor <init>(Lcz/msebera/android/httpclient/HttpRequest;)V
    .registers 3
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;

    .prologue
    .line 60
    invoke-direct {p0}, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;-><init>()V

    .line 61
    iput-object p1, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->original:Lcz/msebera/android/httpclient/HttpRequest;

    .line 62
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->original:Lcz/msebera/android/httpclient/HttpRequest;

    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/RequestLine;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->version:Lcz/msebera/android/httpclient/ProtocolVersion;

    .line 63
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->original:Lcz/msebera/android/httpclient/HttpRequest;

    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->method:Ljava/lang/String;

    .line 64
    instance-of v0, p1, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;

    if-eqz v0, :cond_32

    move-object v0, p1

    .line 65
    check-cast v0, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;

    invoke-interface {v0}, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->uri:Ljava/net/URI;

    .line 69
    :goto_2a
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getAllHeaders()[Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->setHeaders([Lcz/msebera/android/httpclient/Header;)V

    .line 70
    return-void

    .line 67
    :cond_32
    const/4 v0, 0x0

    iput-object v0, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->uri:Ljava/net/URI;

    goto :goto_2a
.end method

.method synthetic constructor <init>(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper$1;)V
    .registers 3
    .param p1, "x0"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "x1"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper$1;

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;-><init>(Lcz/msebera/android/httpclient/HttpRequest;)V

    return-void
.end method

.method public static wrap(Lcz/msebera/android/httpclient/HttpRequest;)Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .registers 2
    .param p0, "request"    # Lcz/msebera/android/httpclient/HttpRequest;

    .prologue
    .line 148
    if-nez p0, :cond_4

    .line 149
    const/4 v0, 0x0

    .line 154
    :goto_3
    return-object v0

    .line 151
    :cond_4
    instance-of v0, p0, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    if-eqz v0, :cond_10

    .line 152
    new-instance v0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper$HttpEntityEnclosingRequestWrapper;

    check-cast p0, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    .end local p0    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    invoke-direct {v0, p0}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper$HttpEntityEnclosingRequestWrapper;-><init>(Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;)V

    goto :goto_3

    .line 154
    .restart local p0    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    :cond_10
    new-instance v0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;

    invoke-direct {v0, p0}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;-><init>(Lcz/msebera/android/httpclient/HttpRequest;)V

    goto :goto_3
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
    .line 93
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getMethod()Ljava/lang/String;
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->method:Ljava/lang/String;

    return-object v0
.end method

.method public getOriginal()Lcz/msebera/android/httpclient/HttpRequest;
    .registers 2

    .prologue
    .line 114
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->original:Lcz/msebera/android/httpclient/HttpRequest;

    return-object v0
.end method

.method public getParams()Lcz/msebera/android/httpclient/params/HttpParams;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 165
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->params:Lcz/msebera/android/httpclient/params/HttpParams;

    if-nez v0, :cond_10

    .line 166
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->original:Lcz/msebera/android/httpclient/HttpRequest;

    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpRequest;->getParams()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/params/HttpParams;->copy()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->params:Lcz/msebera/android/httpclient/params/HttpParams;

    .line 168
    :cond_10
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->params:Lcz/msebera/android/httpclient/params/HttpParams;

    return-object v0
.end method

.method public getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->version:Lcz/msebera/android/httpclient/ProtocolVersion;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->version:Lcz/msebera/android/httpclient/ProtocolVersion;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->original:Lcz/msebera/android/httpclient/HttpRequest;

    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpRequest;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v0

    goto :goto_6
.end method

.method public getRequestLine()Lcz/msebera/android/httpclient/RequestLine;
    .registers 5

    .prologue
    .line 101
    const/4 v0, 0x0

    .line 102
    .local v0, "requestUri":Ljava/lang/String;
    iget-object v1, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->uri:Ljava/net/URI;

    if-eqz v1, :cond_21

    .line 103
    iget-object v1, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->uri:Ljava/net/URI;

    invoke-virtual {v1}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    move-result-object v0

    .line 107
    :goto_b
    if-eqz v0, :cond_13

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_15

    .line 108
    :cond_13
    const-string v0, "/"

    .line 110
    :cond_15
    new-instance v1, Lcz/msebera/android/httpclient/message/BasicRequestLine;

    iget-object v2, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->method:Ljava/lang/String;

    invoke-virtual {p0}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v3

    invoke-direct {v1, v2, v0, v3}, Lcz/msebera/android/httpclient/message/BasicRequestLine;-><init>(Ljava/lang/String;Ljava/lang/String;Lcz/msebera/android/httpclient/ProtocolVersion;)V

    return-object v1

    .line 105
    :cond_21
    iget-object v1, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->original:Lcz/msebera/android/httpclient/HttpRequest;

    invoke-interface {v1}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v1

    invoke-interface {v1}, Lcz/msebera/android/httpclient/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v0

    goto :goto_b
.end method

.method public getURI()Ljava/net/URI;
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->uri:Ljava/net/URI;

    return-object v0
.end method

.method public isAborted()Z
    .registers 2

    .prologue
    .line 97
    const/4 v0, 0x0

    return v0
.end method

.method public setProtocolVersion(Lcz/msebera/android/httpclient/ProtocolVersion;)V
    .registers 2
    .param p1, "version"    # Lcz/msebera/android/httpclient/ProtocolVersion;

    .prologue
    .line 77
    iput-object p1, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->version:Lcz/msebera/android/httpclient/ProtocolVersion;

    .line 78
    return-void
.end method

.method public setURI(Ljava/net/URI;)V
    .registers 2
    .param p1, "uri"    # Ljava/net/URI;

    .prologue
    .line 85
    iput-object p1, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->uri:Ljava/net/URI;

    .line 86
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 119
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
