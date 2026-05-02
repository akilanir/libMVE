.class public abstract Lcom/squareup/okhttp/ResponseBody;
.super Ljava/lang/Object;
.source "ResponseBody.java"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field private reader:Ljava/io/Reader;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private charset()Ljava/nio/charset/Charset;
    .registers 3

    .prologue
    .line 87
    invoke-virtual {p0}, Lcom/squareup/okhttp/ResponseBody;->contentType()Lcom/squareup/okhttp/MediaType;

    move-result-object v0

    .line 88
    .local v0, "contentType":Lcom/squareup/okhttp/MediaType;
    if-eqz v0, :cond_d

    sget-object v1, Lcom/squareup/okhttp/internal/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/MediaType;->charset(Ljava/nio/charset/Charset;)Ljava/nio/charset/Charset;

    move-result-object v1

    :goto_c
    return-object v1

    :cond_d
    sget-object v1, Lcom/squareup/okhttp/internal/Util;->UTF_8:Ljava/nio/charset/Charset;

    goto :goto_c
.end method

.method public static create(Lcom/squareup/okhttp/MediaType;JLokio/BufferedSource;)Lcom/squareup/okhttp/ResponseBody;
    .registers 6
    .param p0, "contentType"    # Lcom/squareup/okhttp/MediaType;
    .param p1, "contentLength"    # J
    .param p3, "content"    # Lokio/BufferedSource;

    .prologue
    .line 121
    if-nez p3, :cond_a

    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "source == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 122
    :cond_a
    new-instance v0, Lcom/squareup/okhttp/ResponseBody$1;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/squareup/okhttp/ResponseBody$1;-><init>(Lcom/squareup/okhttp/MediaType;JLokio/BufferedSource;)V

    return-object v0
.end method

.method public static create(Lcom/squareup/okhttp/MediaType;Ljava/lang/String;)Lcom/squareup/okhttp/ResponseBody;
    .registers 6
    .param p0, "contentType"    # Lcom/squareup/okhttp/MediaType;
    .param p1, "content"    # Ljava/lang/String;

    .prologue
    .line 100
    sget-object v1, Lcom/squareup/okhttp/internal/Util;->UTF_8:Ljava/nio/charset/Charset;

    .line 101
    .local v1, "charset":Ljava/nio/charset/Charset;
    if-eqz p0, :cond_23

    .line 102
    invoke-virtual {p0}, Lcom/squareup/okhttp/MediaType;->charset()Ljava/nio/charset/Charset;

    move-result-object v1

    .line 103
    if-nez v1, :cond_23

    .line 104
    sget-object v1, Lcom/squareup/okhttp/internal/Util;->UTF_8:Ljava/nio/charset/Charset;

    .line 105
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; charset=utf-8"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/squareup/okhttp/MediaType;->parse(Ljava/lang/String;)Lcom/squareup/okhttp/MediaType;

    move-result-object p0

    .line 108
    :cond_23
    new-instance v2, Lokio/Buffer;

    invoke-direct {v2}, Lokio/Buffer;-><init>()V

    invoke-virtual {v2, p1, v1}, Lokio/Buffer;->writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lokio/Buffer;

    move-result-object v0

    .line 109
    .local v0, "buffer":Lokio/Buffer;
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v2

    invoke-static {p0, v2, v3, v0}, Lcom/squareup/okhttp/ResponseBody;->create(Lcom/squareup/okhttp/MediaType;JLokio/BufferedSource;)Lcom/squareup/okhttp/ResponseBody;

    move-result-object v2

    return-object v2
.end method

.method public static create(Lcom/squareup/okhttp/MediaType;[B)Lcom/squareup/okhttp/ResponseBody;
    .registers 5
    .param p0, "contentType"    # Lcom/squareup/okhttp/MediaType;
    .param p1, "content"    # [B

    .prologue
    .line 114
    new-instance v1, Lokio/Buffer;

    invoke-direct {v1}, Lokio/Buffer;-><init>()V

    invoke-virtual {v1, p1}, Lokio/Buffer;->write([B)Lokio/Buffer;

    move-result-object v0

    .line 115
    .local v0, "buffer":Lokio/Buffer;
    array-length v1, p1

    int-to-long v1, v1

    invoke-static {p0, v1, v2, v0}, Lcom/squareup/okhttp/ResponseBody;->create(Lcom/squareup/okhttp/MediaType;JLokio/BufferedSource;)Lcom/squareup/okhttp/ResponseBody;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public final byteStream()Ljava/io/InputStream;
    .registers 2

    .prologue
    .line 43
    invoke-virtual {p0}, Lcom/squareup/okhttp/ResponseBody;->source()Lokio/BufferedSource;

    move-result-object v0

    invoke-interface {v0}, Lokio/BufferedSource;->inputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public final bytes()[B
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
    invoke-virtual {p0}, Lcom/squareup/okhttp/ResponseBody;->contentLength()J

    move-result-wide v1

    .line 50
    .local v1, "contentLength":J
    const-wide/32 v4, 0x7fffffff

    cmp-long v4, v1, v4

    if-lez v4, :cond_24

    .line 51
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Cannot buffer entire body for content length: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 54
    :cond_24
    invoke-virtual {p0}, Lcom/squareup/okhttp/ResponseBody;->source()Lokio/BufferedSource;

    move-result-object v3

    .line 57
    .local v3, "source":Lokio/BufferedSource;
    :try_start_28
    invoke-interface {v3}, Lokio/BufferedSource;->readByteArray()[B
    :try_end_2b
    .catchall {:try_start_28 .. :try_end_2b} :catchall_43

    move-result-object v0

    .line 59
    .local v0, "bytes":[B
    invoke-static {v3}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 61
    const-wide/16 v4, -0x1

    cmp-long v4, v1, v4

    if-eqz v4, :cond_48

    array-length v4, v0

    int-to-long v4, v4

    cmp-long v4, v1, v4

    if-eqz v4, :cond_48

    .line 62
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Content-Length and stream length disagree"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 59
    .end local v0    # "bytes":[B
    :catchall_43
    move-exception v4

    invoke-static {v3}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    throw v4

    .line 64
    .restart local v0    # "bytes":[B
    :cond_48
    return-object v0
.end method

.method public final charStream()Ljava/io/Reader;
    .registers 4

    .prologue
    .line 73
    iget-object v0, p0, Lcom/squareup/okhttp/ResponseBody;->reader:Ljava/io/Reader;

    .line 74
    .local v0, "r":Ljava/io/Reader;
    if-eqz v0, :cond_5

    .end local v0    # "r":Ljava/io/Reader;
    :goto_4
    return-object v0

    .restart local v0    # "r":Ljava/io/Reader;
    :cond_5
    new-instance v0, Ljava/io/InputStreamReader;

    .end local v0    # "r":Ljava/io/Reader;
    invoke-virtual {p0}, Lcom/squareup/okhttp/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {p0}, Lcom/squareup/okhttp/ResponseBody;->charset()Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    iput-object v0, p0, Lcom/squareup/okhttp/ResponseBody;->reader:Ljava/io/Reader;

    goto :goto_4
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    invoke-virtual {p0}, Lcom/squareup/okhttp/ResponseBody;->source()Lokio/BufferedSource;

    move-result-object v0

    invoke-interface {v0}, Lokio/BufferedSource;->close()V

    .line 93
    return-void
.end method

.method public abstract contentLength()J
.end method

.method public abstract contentType()Lcom/squareup/okhttp/MediaType;
.end method

.method public abstract source()Lokio/BufferedSource;
.end method

.method public final string()Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 83
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Lcom/squareup/okhttp/ResponseBody;->bytes()[B

    move-result-object v1

    invoke-direct {p0}, Lcom/squareup/okhttp/ResponseBody;->charset()Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v0
.end method
