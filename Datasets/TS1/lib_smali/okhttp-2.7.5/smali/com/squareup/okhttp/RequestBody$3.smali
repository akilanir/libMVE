.class final Lcom/squareup/okhttp/RequestBody$3;
.super Lcom/squareup/okhttp/RequestBody;
.source "RequestBody.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/squareup/okhttp/RequestBody;->create(Lcom/squareup/okhttp/MediaType;Ljava/io/File;)Lcom/squareup/okhttp/RequestBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$contentType:Lcom/squareup/okhttp/MediaType;

.field final synthetic val$file:Ljava/io/File;


# direct methods
.method constructor <init>(Lcom/squareup/okhttp/MediaType;Ljava/io/File;)V
    .registers 3

    .prologue
    .line 105
    iput-object p1, p0, Lcom/squareup/okhttp/RequestBody$3;->val$contentType:Lcom/squareup/okhttp/MediaType;

    iput-object p2, p0, Lcom/squareup/okhttp/RequestBody$3;->val$file:Ljava/io/File;

    invoke-direct {p0}, Lcom/squareup/okhttp/RequestBody;-><init>()V

    return-void
.end method


# virtual methods
.method public contentLength()J
    .registers 3

    .prologue
    .line 111
    iget-object v0, p0, Lcom/squareup/okhttp/RequestBody$3;->val$file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public contentType()Lcom/squareup/okhttp/MediaType;
    .registers 2

    .prologue
    .line 107
    iget-object v0, p0, Lcom/squareup/okhttp/RequestBody$3;->val$contentType:Lcom/squareup/okhttp/MediaType;

    return-object v0
.end method

.method public writeTo(Lokio/BufferedSink;)V
    .registers 4
    .param p1, "sink"    # Lokio/BufferedSink;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    const/4 v0, 0x0

    .line 117
    .local v0, "source":Lokio/Source;
    :try_start_1
    iget-object v1, p0, Lcom/squareup/okhttp/RequestBody$3;->val$file:Ljava/io/File;

    invoke-static {v1}, Lokio/Okio;->source(Ljava/io/File;)Lokio/Source;

    move-result-object v0

    .line 118
    invoke-interface {p1, v0}, Lokio/BufferedSink;->writeAll(Lokio/Source;)J
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_e

    .line 120
    invoke-static {v0}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 122
    return-void

    .line 120
    :catchall_e
    move-exception v1

    invoke-static {v0}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    throw v1
.end method
