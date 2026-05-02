.class public Lcz/msebera/android/httpclient/protocol/RequestContent;
.super Ljava/lang/Object;
.source "RequestContent.java"

# interfaces
.implements Lcz/msebera/android/httpclient/HttpRequestInterceptor;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# instance fields
.field private final overwrite:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 64
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcz/msebera/android/httpclient/protocol/RequestContent;-><init>(Z)V

    .line 65
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 2
    .param p1, "overwrite"    # Z

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput-boolean p1, p0, Lcz/msebera/android/httpclient/protocol/RequestContent;->overwrite:Z

    .line 81
    return-void
.end method


# virtual methods
.method public process(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 9
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    const-string v2, "HTTP request"

    invoke-static {p1, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 86
    instance-of v2, p1, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    if-eqz v2, :cond_2f

    .line 87
    iget-boolean v2, p0, Lcz/msebera/android/httpclient/protocol/RequestContent;->overwrite:Z

    if-eqz v2, :cond_30

    .line 88
    const-string v2, "Transfer-Encoding"

    invoke-interface {p1, v2}, Lcz/msebera/android/httpclient/HttpRequest;->removeHeaders(Ljava/lang/String;)V

    .line 89
    const-string v2, "Content-Length"

    invoke-interface {p1, v2}, Lcz/msebera/android/httpclient/HttpRequest;->removeHeaders(Ljava/lang/String;)V

    .line 98
    :cond_17
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v2

    invoke-interface {v2}, Lcz/msebera/android/httpclient/RequestLine;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v1

    .local v1, "ver":Lcz/msebera/android/httpclient/ProtocolVersion;
    move-object v2, p1

    .line 99
    check-cast v2, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    invoke-interface {v2}, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v0

    .line 100
    .local v0, "entity":Lcz/msebera/android/httpclient/HttpEntity;
    if-nez v0, :cond_50

    .line 101
    const-string v2, "Content-Length"

    const-string v3, "0"

    invoke-interface {p1, v2, v3}, Lcz/msebera/android/httpclient/HttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .end local v0    # "entity":Lcz/msebera/android/httpclient/HttpEntity;
    .end local v1    # "ver":Lcz/msebera/android/httpclient/ProtocolVersion;
    :cond_2f
    :goto_2f
    return-void

    .line 91
    :cond_30
    const-string v2, "Transfer-Encoding"

    invoke-interface {p1, v2}, Lcz/msebera/android/httpclient/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_40

    .line 92
    new-instance v2, Lcz/msebera/android/httpclient/ProtocolException;

    const-string v3, "Transfer-encoding header already present"

    invoke-direct {v2, v3}, Lcz/msebera/android/httpclient/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 94
    :cond_40
    const-string v2, "Content-Length"

    invoke-interface {p1, v2}, Lcz/msebera/android/httpclient/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_17

    .line 95
    new-instance v2, Lcz/msebera/android/httpclient/ProtocolException;

    const-string v3, "Content-Length header already present"

    invoke-direct {v2, v3}, Lcz/msebera/android/httpclient/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 105
    .restart local v0    # "entity":Lcz/msebera/android/httpclient/HttpEntity;
    .restart local v1    # "ver":Lcz/msebera/android/httpclient/ProtocolVersion;
    :cond_50
    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpEntity;->isChunked()Z

    move-result v2

    if-nez v2, :cond_60

    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpEntity;->getContentLength()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gez v2, :cond_b4

    .line 106
    :cond_60
    sget-object v2, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_0:Lcz/msebera/android/httpclient/HttpVersion;

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/ProtocolVersion;->lessEquals(Lcz/msebera/android/httpclient/ProtocolVersion;)Z

    move-result v2

    if-eqz v2, :cond_81

    .line 107
    new-instance v2, Lcz/msebera/android/httpclient/ProtocolException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Chunked transfer encoding not allowed for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcz/msebera/android/httpclient/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 110
    :cond_81
    const-string v2, "Transfer-Encoding"

    const-string v3, "chunked"

    invoke-interface {p1, v2, v3}, Lcz/msebera/android/httpclient/HttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    :goto_88
    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpEntity;->getContentType()Lcz/msebera/android/httpclient/Header;

    move-result-object v2

    if-eqz v2, :cond_9d

    const-string v2, "Content-Type"

    invoke-interface {p1, v2}, Lcz/msebera/android/httpclient/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_9d

    .line 117
    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpEntity;->getContentType()Lcz/msebera/android/httpclient/Header;

    move-result-object v2

    invoke-interface {p1, v2}, Lcz/msebera/android/httpclient/HttpRequest;->addHeader(Lcz/msebera/android/httpclient/Header;)V

    .line 120
    :cond_9d
    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpEntity;->getContentEncoding()Lcz/msebera/android/httpclient/Header;

    move-result-object v2

    if-eqz v2, :cond_2f

    const-string v2, "Content-Encoding"

    invoke-interface {p1, v2}, Lcz/msebera/android/httpclient/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2f

    .line 122
    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpEntity;->getContentEncoding()Lcz/msebera/android/httpclient/Header;

    move-result-object v2

    invoke-interface {p1, v2}, Lcz/msebera/android/httpclient/HttpRequest;->addHeader(Lcz/msebera/android/httpclient/Header;)V

    goto/16 :goto_2f

    .line 112
    :cond_b4
    const-string v2, "Content-Length"

    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpEntity;->getContentLength()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v2, v3}, Lcz/msebera/android/httpclient/HttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_88
.end method
