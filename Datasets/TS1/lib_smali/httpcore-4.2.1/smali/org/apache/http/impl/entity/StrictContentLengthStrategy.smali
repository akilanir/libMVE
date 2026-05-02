.class public Lorg/apache/http/impl/entity/StrictContentLengthStrategy;
.super Ljava/lang/Object;
.source "StrictContentLengthStrategy.java"

# interfaces
.implements Lorg/apache/http/entity/ContentLengthStrategy;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final implicitLen:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 72
    const/4 v0, -0x1

    invoke-direct {p0, v0}, Lorg/apache/http/impl/entity/StrictContentLengthStrategy;-><init>(I)V

    .line 73
    return-void
.end method

.method public constructor <init>(I)V
    .registers 2
    .param p1, "implicitLen"    # I

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput p1, p0, Lorg/apache/http/impl/entity/StrictContentLengthStrategy;->implicitLen:I

    .line 65
    return-void
.end method


# virtual methods
.method public determineLength(Lorg/apache/http/HttpMessage;)J
    .registers 11
    .param p1, "message"    # Lorg/apache/http/HttpMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 76
    if-nez p1, :cond_a

    .line 77
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "HTTP message may not be null"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 82
    :cond_a
    const-string v6, "Transfer-Encoding"

    invoke-interface {p1, v6}, Lorg/apache/http/HttpMessage;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v5

    .line 83
    .local v5, "transferEncodingHeader":Lorg/apache/http/Header;
    if-eqz v5, :cond_6e

    .line 84
    invoke-interface {v5}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 85
    .local v4, "s":Ljava/lang/String;
    const-string v6, "chunked"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4a

    .line 86
    invoke-interface {p1}, Lorg/apache/http/HttpMessage;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v6

    sget-object v7, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    invoke-virtual {v6, v7}, Lorg/apache/http/ProtocolVersion;->lessEquals(Lorg/apache/http/ProtocolVersion;)Z

    move-result v6

    if-eqz v6, :cond_47

    .line 87
    new-instance v6, Lorg/apache/http/ProtocolException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Chunked transfer encoding not allowed for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {p1}, Lorg/apache/http/HttpMessage;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 91
    :cond_47
    const-wide/16 v2, -0x2

    .line 112
    .end local v4    # "s":Ljava/lang/String;
    :cond_49
    :goto_49
    return-wide v2

    .line 92
    .restart local v4    # "s":Ljava/lang/String;
    :cond_4a
    const-string v6, "identity"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_55

    .line 93
    const-wide/16 v2, -0x1

    goto :goto_49

    .line 95
    :cond_55
    new-instance v6, Lorg/apache/http/ProtocolException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unsupported transfer encoding: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 99
    .end local v4    # "s":Ljava/lang/String;
    :cond_6e
    const-string v6, "Content-Length"

    invoke-interface {p1, v6}, Lorg/apache/http/HttpMessage;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 100
    .local v0, "contentLengthHeader":Lorg/apache/http/Header;
    if-eqz v0, :cond_b7

    .line 101
    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 103
    .restart local v4    # "s":Ljava/lang/String;
    :try_start_7a
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 104
    .local v2, "len":J
    const-wide/16 v6, 0x0

    cmp-long v6, v2, v6

    if-gez v6, :cond_49

    .line 105
    new-instance v6, Lorg/apache/http/ProtocolException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Negative content length: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_9d
    .catch Ljava/lang/NumberFormatException; {:try_start_7a .. :try_end_9d} :catch_9d

    .line 108
    .end local v2    # "len":J
    :catch_9d
    move-exception v1

    .line 109
    .local v1, "e":Ljava/lang/NumberFormatException;
    new-instance v6, Lorg/apache/http/ProtocolException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Invalid content length: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 112
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    .end local v4    # "s":Ljava/lang/String;
    :cond_b7
    iget v6, p0, Lorg/apache/http/impl/entity/StrictContentLengthStrategy;->implicitLen:I

    int-to-long v2, v6

    goto :goto_49
.end method
