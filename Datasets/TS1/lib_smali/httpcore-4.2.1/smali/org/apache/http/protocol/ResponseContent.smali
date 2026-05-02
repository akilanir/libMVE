.class public Lorg/apache/http/protocol/ResponseContent;
.super Ljava/lang/Object;
.source "ResponseContent.java"

# interfaces
.implements Lorg/apache/http/HttpResponseInterceptor;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final overwrite:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 63
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/http/protocol/ResponseContent;-><init>(Z)V

    .line 64
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 2
    .param p1, "overwrite"    # Z

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    iput-boolean p1, p0, Lorg/apache/http/protocol/ResponseContent;->overwrite:Z

    .line 80
    return-void
.end method


# virtual methods
.method public process(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V
    .registers 11
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    if-nez p1, :cond_a

    .line 92
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "HTTP response may not be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 94
    :cond_a
    iget-boolean v5, p0, Lorg/apache/http/protocol/ResponseContent;->overwrite:Z

    if-eqz v5, :cond_6a

    .line 95
    const-string v5, "Transfer-Encoding"

    invoke-interface {p1, v5}, Lorg/apache/http/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 96
    const-string v5, "Content-Length"

    invoke-interface {p1, v5}, Lorg/apache/http/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 105
    :cond_18
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v4

    .line 106
    .local v4, "ver":Lorg/apache/http/ProtocolVersion;
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 107
    .local v0, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v0, :cond_9e

    .line 108
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v1

    .line 109
    .local v1, "len":J
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->isChunked()Z

    move-result v5

    if-eqz v5, :cond_8a

    sget-object v5, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    invoke-virtual {v4, v5}, Lorg/apache/http/ProtocolVersion;->lessEquals(Lorg/apache/http/ProtocolVersion;)Z

    move-result v5

    if-nez v5, :cond_8a

    .line 110
    const-string v5, "Transfer-Encoding"

    const-string v6, "chunked"

    invoke-interface {p1, v5, v6}, Lorg/apache/http/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    :cond_3f
    :goto_3f
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v5

    if-eqz v5, :cond_54

    const-string v5, "Content-Type"

    invoke-interface {p1, v5}, Lorg/apache/http/HttpResponse;->containsHeader(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_54

    .line 117
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v5

    invoke-interface {p1, v5}, Lorg/apache/http/HttpResponse;->addHeader(Lorg/apache/http/Header;)V

    .line 120
    :cond_54
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContentEncoding()Lorg/apache/http/Header;

    move-result-object v5

    if-eqz v5, :cond_69

    const-string v5, "Content-Encoding"

    invoke-interface {p1, v5}, Lorg/apache/http/HttpResponse;->containsHeader(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_69

    .line 122
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContentEncoding()Lorg/apache/http/Header;

    move-result-object v5

    invoke-interface {p1, v5}, Lorg/apache/http/HttpResponse;->addHeader(Lorg/apache/http/Header;)V

    .line 132
    .end local v1    # "len":J
    :cond_69
    :goto_69
    return-void

    .line 98
    .end local v0    # "entity":Lorg/apache/http/HttpEntity;
    .end local v4    # "ver":Lorg/apache/http/ProtocolVersion;
    :cond_6a
    const-string v5, "Transfer-Encoding"

    invoke-interface {p1, v5}, Lorg/apache/http/HttpResponse;->containsHeader(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7a

    .line 99
    new-instance v5, Lorg/apache/http/ProtocolException;

    const-string v6, "Transfer-encoding header already present"

    invoke-direct {v5, v6}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 101
    :cond_7a
    const-string v5, "Content-Length"

    invoke-interface {p1, v5}, Lorg/apache/http/HttpResponse;->containsHeader(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_18

    .line 102
    new-instance v5, Lorg/apache/http/ProtocolException;

    const-string v6, "Content-Length header already present"

    invoke-direct {v5, v6}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 111
    .restart local v0    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v1    # "len":J
    .restart local v4    # "ver":Lorg/apache/http/ProtocolVersion;
    :cond_8a
    const-wide/16 v5, 0x0

    cmp-long v5, v1, v5

    if-ltz v5, :cond_3f

    .line 112
    const-string v5, "Content-Length"

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v5, v6}, Lorg/apache/http/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3f

    .line 125
    .end local v1    # "len":J
    :cond_9e
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v3

    .line 126
    .local v3, "status":I
    const/16 v5, 0xcc

    if-eq v3, v5, :cond_69

    const/16 v5, 0x130

    if-eq v3, v5, :cond_69

    const/16 v5, 0xcd

    if-eq v3, v5, :cond_69

    .line 129
    const-string v5, "Content-Length"

    const-string v6, "0"

    invoke-interface {p1, v5, v6}, Lorg/apache/http/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_69
.end method
