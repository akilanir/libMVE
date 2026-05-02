.class public Lcz/msebera/android/httpclient/impl/entity/EntityDeserializer;
.super Ljava/lang/Object;
.source "EntityDeserializer.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final lenStrategy:Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;)V
    .registers 3
    .param p1, "lenStrategy"    # Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    const-string v0, "Content length strategy"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/entity/EntityDeserializer;->lenStrategy:Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;

    .line 73
    return-void
.end method


# virtual methods
.method public deserialize(Lcz/msebera/android/httpclient/io/SessionInputBuffer;Lcz/msebera/android/httpclient/HttpMessage;)Lcz/msebera/android/httpclient/HttpEntity;
    .registers 4
    .param p1, "inbuffer"    # Lcz/msebera/android/httpclient/io/SessionInputBuffer;
    .param p2, "message"    # Lcz/msebera/android/httpclient/HttpMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    const-string v0, "Session input buffer"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 139
    const-string v0, "HTTP message"

    invoke-static {p2, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 140
    invoke-virtual {p0, p1, p2}, Lcz/msebera/android/httpclient/impl/entity/EntityDeserializer;->doDeserialize(Lcz/msebera/android/httpclient/io/SessionInputBuffer;Lcz/msebera/android/httpclient/HttpMessage;)Lcz/msebera/android/httpclient/entity/BasicHttpEntity;

    move-result-object v0

    return-object v0
.end method

.method protected doDeserialize(Lcz/msebera/android/httpclient/io/SessionInputBuffer;Lcz/msebera/android/httpclient/HttpMessage;)Lcz/msebera/android/httpclient/entity/BasicHttpEntity;
    .registers 13
    .param p1, "inbuffer"    # Lcz/msebera/android/httpclient/io/SessionInputBuffer;
    .param p2, "message"    # Lcz/msebera/android/httpclient/HttpMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const-wide/16 v7, -0x1

    .line 93
    new-instance v2, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;

    invoke-direct {v2}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;-><init>()V

    .line 95
    .local v2, "entity":Lcz/msebera/android/httpclient/entity/BasicHttpEntity;
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/entity/EntityDeserializer;->lenStrategy:Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;

    invoke-interface {v5, p2}, Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;->determineLength(Lcz/msebera/android/httpclient/HttpMessage;)J

    move-result-wide v3

    .line 96
    .local v3, "len":J
    const-wide/16 v5, -0x2

    cmp-long v5, v3, v5

    if-nez v5, :cond_3a

    .line 97
    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setChunked(Z)V

    .line 98
    invoke-virtual {v2, v7, v8}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setContentLength(J)V

    .line 99
    new-instance v5, Lcz/msebera/android/httpclient/impl/io/ChunkedInputStream;

    invoke-direct {v5, p1}, Lcz/msebera/android/httpclient/impl/io/ChunkedInputStream;-><init>(Lcz/msebera/android/httpclient/io/SessionInputBuffer;)V

    invoke-virtual {v2, v5}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setContent(Ljava/io/InputStream;)V

    .line 110
    :goto_23
    const-string v5, "Content-Type"

    invoke-interface {p2, v5}, Lcz/msebera/android/httpclient/HttpMessage;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v1

    .line 111
    .local v1, "contentTypeHeader":Lcz/msebera/android/httpclient/Header;
    if-eqz v1, :cond_2e

    .line 112
    invoke-virtual {v2, v1}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setContentType(Lcz/msebera/android/httpclient/Header;)V

    .line 114
    :cond_2e
    const-string v5, "Content-Encoding"

    invoke-interface {p2, v5}, Lcz/msebera/android/httpclient/HttpMessage;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 115
    .local v0, "contentEncodingHeader":Lcz/msebera/android/httpclient/Header;
    if-eqz v0, :cond_39

    .line 116
    invoke-virtual {v2, v0}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setContentEncoding(Lcz/msebera/android/httpclient/Header;)V

    .line 118
    :cond_39
    return-object v2

    .line 100
    .end local v0    # "contentEncodingHeader":Lcz/msebera/android/httpclient/Header;
    .end local v1    # "contentTypeHeader":Lcz/msebera/android/httpclient/Header;
    :cond_3a
    cmp-long v5, v3, v7

    if-nez v5, :cond_4d

    .line 101
    invoke-virtual {v2, v9}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setChunked(Z)V

    .line 102
    invoke-virtual {v2, v7, v8}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setContentLength(J)V

    .line 103
    new-instance v5, Lcz/msebera/android/httpclient/impl/io/IdentityInputStream;

    invoke-direct {v5, p1}, Lcz/msebera/android/httpclient/impl/io/IdentityInputStream;-><init>(Lcz/msebera/android/httpclient/io/SessionInputBuffer;)V

    invoke-virtual {v2, v5}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setContent(Ljava/io/InputStream;)V

    goto :goto_23

    .line 105
    :cond_4d
    invoke-virtual {v2, v9}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setChunked(Z)V

    .line 106
    invoke-virtual {v2, v3, v4}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setContentLength(J)V

    .line 107
    new-instance v5, Lcz/msebera/android/httpclient/impl/io/ContentLengthInputStream;

    invoke-direct {v5, p1, v3, v4}, Lcz/msebera/android/httpclient/impl/io/ContentLengthInputStream;-><init>(Lcz/msebera/android/httpclient/io/SessionInputBuffer;J)V

    invoke-virtual {v2, v5}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setContent(Ljava/io/InputStream;)V

    goto :goto_23
.end method
