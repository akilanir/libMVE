.class Lcz/msebera/android/httpclient/impl/client/cache/CacheEntity;
.super Ljava/lang/Object;
.source "CacheEntity.java"

# interfaces
.implements Lcz/msebera/android/httpclient/HttpEntity;
.implements Ljava/io/Serializable;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x301d8cf7d0140f29L


# instance fields
.field private final cacheEntry:Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)V
    .registers 2
    .param p1, "cacheEntry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheEntity;->cacheEntry:Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .line 51
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 96
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public consumeContent()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    return-void
.end method

.method public getContent()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheEntity;->cacheEntry:Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getResource()Lcz/msebera/android/httpclient/client/cache/Resource;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/client/cache/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getContentEncoding()Lcz/msebera/android/httpclient/Header;
    .registers 3

    .prologue
    .line 58
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheEntity;->cacheEntry:Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    const-string v1, "Content-Encoding"

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    return-object v0
.end method

.method public getContentLength()J
    .registers 3

    .prologue
    .line 70
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheEntity;->cacheEntry:Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getResource()Lcz/msebera/android/httpclient/client/cache/Resource;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/client/cache/Resource;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public getContentType()Lcz/msebera/android/httpclient/Header;
    .registers 3

    .prologue
    .line 54
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheEntity;->cacheEntry:Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    const-string v1, "Content-Type"

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    return-object v0
.end method

.method public isChunked()Z
    .registers 2

    .prologue
    .line 62
    const/4 v0, 0x0

    return v0
.end method

.method public isRepeatable()Z
    .registers 2

    .prologue
    .line 66
    const/4 v0, 0x1

    return v0
.end method

.method public isStreaming()Z
    .registers 2

    .prologue
    .line 88
    const/4 v0, 0x0

    return v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "outstream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    const-string v1, "Output stream"

    invoke-static {p1, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 79
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheEntity;->cacheEntry:Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getResource()Lcz/msebera/android/httpclient/client/cache/Resource;

    move-result-object v1

    invoke-interface {v1}, Lcz/msebera/android/httpclient/client/cache/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 81
    .local v0, "instream":Ljava/io/InputStream;
    :try_start_f
    invoke-static {v0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_12
    .catchall {:try_start_f .. :try_end_12} :catchall_16

    .line 83
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 85
    return-void

    .line 83
    :catchall_16
    move-exception v1

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v1
.end method
