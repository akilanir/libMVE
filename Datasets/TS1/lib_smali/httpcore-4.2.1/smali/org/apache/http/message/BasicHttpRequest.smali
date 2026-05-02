.class public Lorg/apache/http/message/BasicHttpRequest;
.super Lorg/apache/http/message/AbstractHttpMessage;
.source "BasicHttpRequest.java"

# interfaces
.implements Lorg/apache/http/HttpRequest;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final method:Ljava/lang/String;

.field private requestline:Lorg/apache/http/RequestLine;

.field private final uri:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "uri"    # Ljava/lang/String;

    .prologue
    .line 66
    invoke-direct {p0}, Lorg/apache/http/message/AbstractHttpMessage;-><init>()V

    .line 67
    if-nez p1, :cond_d

    .line 68
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Method name may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 70
    :cond_d
    if-nez p2, :cond_17

    .line 71
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Request URI may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 73
    :cond_17
    iput-object p1, p0, Lorg/apache/http/message/BasicHttpRequest;->method:Ljava/lang/String;

    .line 74
    iput-object p2, p0, Lorg/apache/http/message/BasicHttpRequest;->uri:Ljava/lang/String;

    .line 75
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/message/BasicHttpRequest;->requestline:Lorg/apache/http/RequestLine;

    .line 76
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/ProtocolVersion;)V
    .registers 5
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "uri"    # Ljava/lang/String;
    .param p3, "ver"    # Lorg/apache/http/ProtocolVersion;

    .prologue
    .line 87
    new-instance v0, Lorg/apache/http/message/BasicRequestLine;

    invoke-direct {v0, p1, p2, p3}, Lorg/apache/http/message/BasicRequestLine;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/ProtocolVersion;)V

    invoke-direct {p0, v0}, Lorg/apache/http/message/BasicHttpRequest;-><init>(Lorg/apache/http/RequestLine;)V

    .line 88
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/RequestLine;)V
    .registers 4
    .param p1, "requestline"    # Lorg/apache/http/RequestLine;

    .prologue
    .line 96
    invoke-direct {p0}, Lorg/apache/http/message/AbstractHttpMessage;-><init>()V

    .line 97
    if-nez p1, :cond_d

    .line 98
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Request line may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 100
    :cond_d
    iput-object p1, p0, Lorg/apache/http/message/BasicHttpRequest;->requestline:Lorg/apache/http/RequestLine;

    .line 101
    invoke-interface {p1}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/message/BasicHttpRequest;->method:Ljava/lang/String;

    .line 102
    invoke-interface {p1}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/message/BasicHttpRequest;->uri:Ljava/lang/String;

    .line 103
    return-void
.end method


# virtual methods
.method public getProtocolVersion()Lorg/apache/http/ProtocolVersion;
    .registers 2

    .prologue
    .line 114
    invoke-virtual {p0}, Lorg/apache/http/message/BasicHttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/RequestLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v0

    return-object v0
.end method

.method public getRequestLine()Lorg/apache/http/RequestLine;
    .registers 5

    .prologue
    .line 125
    iget-object v1, p0, Lorg/apache/http/message/BasicHttpRequest;->requestline:Lorg/apache/http/RequestLine;

    if-nez v1, :cond_17

    .line 126
    invoke-virtual {p0}, Lorg/apache/http/message/BasicHttpRequest;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/http/params/HttpProtocolParams;->getVersion(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/ProtocolVersion;

    move-result-object v0

    .line 127
    .local v0, "ver":Lorg/apache/http/ProtocolVersion;
    new-instance v1, Lorg/apache/http/message/BasicRequestLine;

    iget-object v2, p0, Lorg/apache/http/message/BasicHttpRequest;->method:Ljava/lang/String;

    iget-object v3, p0, Lorg/apache/http/message/BasicHttpRequest;->uri:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v0}, Lorg/apache/http/message/BasicRequestLine;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/ProtocolVersion;)V

    iput-object v1, p0, Lorg/apache/http/message/BasicHttpRequest;->requestline:Lorg/apache/http/RequestLine;

    .line 129
    .end local v0    # "ver":Lorg/apache/http/ProtocolVersion;
    :cond_17
    iget-object v1, p0, Lorg/apache/http/message/BasicHttpRequest;->requestline:Lorg/apache/http/RequestLine;

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 134
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/apache/http/message/BasicHttpRequest;->method:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/http/message/BasicHttpRequest;->uri:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/http/message/BasicHttpRequest;->headergroup:Lorg/apache/http/message/HeaderGroup;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
