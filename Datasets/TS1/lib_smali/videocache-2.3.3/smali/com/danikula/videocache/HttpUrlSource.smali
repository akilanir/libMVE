.class public Lcom/danikula/videocache/HttpUrlSource;
.super Ljava/lang/Object;
.source "HttpUrlSource.java"

# interfaces
.implements Lcom/danikula/videocache/Source;


# static fields
.field private static final MAX_REDIRECTS:I = 0x5


# instance fields
.field private connection:Ljava/net/HttpURLConnection;

.field private inputStream:Ljava/io/InputStream;

.field private volatile length:I

.field private volatile mime:Ljava/lang/String;

.field public final url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/danikula/videocache/HttpUrlSource;)V
    .registers 3
    .param p1, "source"    # Lcom/danikula/videocache/HttpUrlSource;

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/danikula/videocache/HttpUrlSource;->length:I

    .line 45
    iget-object v0, p1, Lcom/danikula/videocache/HttpUrlSource;->url:Ljava/lang/String;

    iput-object v0, p0, Lcom/danikula/videocache/HttpUrlSource;->url:Ljava/lang/String;

    .line 46
    iget-object v0, p1, Lcom/danikula/videocache/HttpUrlSource;->mime:Ljava/lang/String;

    iput-object v0, p0, Lcom/danikula/videocache/HttpUrlSource;->mime:Ljava/lang/String;

    .line 47
    iget v0, p1, Lcom/danikula/videocache/HttpUrlSource;->length:I

    iput v0, p0, Lcom/danikula/videocache/HttpUrlSource;->length:I

    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-static {p1}, Lcom/danikula/videocache/ProxyCacheUtils;->getSupposablyMime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/danikula/videocache/HttpUrlSource;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "mime"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/danikula/videocache/HttpUrlSource;->length:I

    .line 40
    invoke-static {p1}, Lcom/danikula/videocache/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/danikula/videocache/HttpUrlSource;->url:Ljava/lang/String;

    .line 41
    iput-object p2, p0, Lcom/danikula/videocache/HttpUrlSource;->mime:Ljava/lang/String;

    .line 42
    return-void
.end method

.method private fetchContentInfo()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 98
    const-string v3, "ProxyCache"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Read content info from "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/danikula/videocache/HttpUrlSource;->url:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    const/4 v2, 0x0

    .line 100
    .local v2, "urlConnection":Ljava/net/HttpURLConnection;
    const/4 v1, 0x0

    .line 102
    .local v1, "inputStream":Ljava/io/InputStream;
    const/4 v3, 0x0

    const/16 v4, 0x2710

    :try_start_1f
    invoke-direct {p0, v3, v4}, Lcom/danikula/videocache/HttpUrlSource;->openConnection(II)Ljava/net/HttpURLConnection;

    move-result-object v2

    .line 103
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v3

    iput v3, p0, Lcom/danikula/videocache/HttpUrlSource;->length:I

    .line 104
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/danikula/videocache/HttpUrlSource;->mime:Ljava/lang/String;

    .line 105
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 106
    const-string v3, "ProxyCache"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Content info for `"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/danikula/videocache/HttpUrlSource;->url:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "`: mime: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/danikula/videocache/HttpUrlSource;->mime:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", content-length: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/danikula/videocache/HttpUrlSource;->length:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_65
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_65} :catch_6e
    .catchall {:try_start_1f .. :try_end_65} :catchall_92

    .line 110
    invoke-static {v1}, Lcom/danikula/videocache/ProxyCacheUtils;->close(Ljava/io/Closeable;)V

    .line 111
    if-eqz v2, :cond_6d

    .line 112
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 115
    :cond_6d
    :goto_6d
    return-void

    .line 107
    :catch_6e
    move-exception v0

    .line 108
    .local v0, "e":Ljava/io/IOException;
    :try_start_6f
    const-string v3, "ProxyCache"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error fetching info from "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/danikula/videocache/HttpUrlSource;->url:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_89
    .catchall {:try_start_6f .. :try_end_89} :catchall_92

    .line 110
    invoke-static {v1}, Lcom/danikula/videocache/ProxyCacheUtils;->close(Ljava/io/Closeable;)V

    .line 111
    if-eqz v2, :cond_6d

    .line 112
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_6d

    .line 110
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_92
    move-exception v3

    invoke-static {v1}, Lcom/danikula/videocache/ProxyCacheUtils;->close(Ljava/io/Closeable;)V

    .line 111
    if-eqz v2, :cond_9b

    .line 112
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_9b
    throw v3
.end method

.method private openConnection(II)Ljava/net/HttpURLConnection;
    .registers 12
    .param p1, "offset"    # I
    .param p2, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 120
    const/4 v2, 0x0

    .line 121
    .local v2, "redirectCount":I
    iget-object v4, p0, Lcom/danikula/videocache/HttpUrlSource;->url:Ljava/lang/String;

    .line 123
    .local v4, "url":Ljava/lang/String;
    :cond_3
    const-string v6, "ProxyCache"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Open connection "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-lez p1, :cond_a7

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, " with offset "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_25
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " to "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 125
    .local v1, "connection":Ljava/net/HttpURLConnection;
    if-lez p1, :cond_65

    .line 126
    const-string v5, "Range"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "bytes="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "-"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    :cond_65
    if-lez p2, :cond_6d

    .line 129
    invoke-virtual {v1, p2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 130
    invoke-virtual {v1, p2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 132
    :cond_6d
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    .line 133
    .local v0, "code":I
    const/16 v5, 0x12d

    if-eq v0, v5, :cond_7d

    const/16 v5, 0x12e

    if-eq v0, v5, :cond_7d

    const/16 v5, 0x12f

    if-ne v0, v5, :cond_ab

    :cond_7d
    const/4 v3, 0x1

    .line 134
    .local v3, "redirected":Z
    :goto_7e
    if-eqz v3, :cond_8b

    .line 135
    const-string v5, "Location"

    invoke-virtual {v1, v5}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 136
    add-int/lit8 v2, v2, 0x1

    .line 137
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 139
    :cond_8b
    const/4 v5, 0x5

    if-le v2, v5, :cond_ad

    .line 140
    new-instance v5, Lcom/danikula/videocache/ProxyCacheException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Too many redirects: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 123
    .end local v0    # "code":I
    .end local v1    # "connection":Ljava/net/HttpURLConnection;
    .end local v3    # "redirected":Z
    :cond_a7
    const-string v5, ""

    goto/16 :goto_25

    .line 133
    .restart local v0    # "code":I
    .restart local v1    # "connection":Ljava/net/HttpURLConnection;
    :cond_ab
    const/4 v3, 0x0

    goto :goto_7e

    .line 142
    .restart local v3    # "redirected":Z
    :cond_ad
    if-nez v3, :cond_3

    .line 143
    return-object v1
.end method

.method private readSourceAvailableBytes(Ljava/net/HttpURLConnection;II)I
    .registers 6
    .param p1, "connection"    # Ljava/net/HttpURLConnection;
    .param p2, "offset"    # I
    .param p3, "responseCode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v0

    .line 72
    .local v0, "contentLength":I
    const/16 v1, 0xc8

    if-ne p3, v1, :cond_9

    .end local v0    # "contentLength":I
    :goto_8
    return v0

    .restart local v0    # "contentLength":I
    :cond_9
    const/16 v1, 0xce

    if-ne p3, v1, :cond_f

    add-int/2addr v0, p2

    goto :goto_8

    :cond_f
    iget v0, p0, Lcom/danikula/videocache/HttpUrlSource;->length:I

    goto :goto_8
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 78
    iget-object v0, p0, Lcom/danikula/videocache/HttpUrlSource;->connection:Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_9

    .line 79
    iget-object v0, p0, Lcom/danikula/videocache/HttpUrlSource;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 81
    :cond_9
    return-void
.end method

.method public declared-synchronized getMime()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 147
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/danikula/videocache/HttpUrlSource;->mime:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 148
    invoke-direct {p0}, Lcom/danikula/videocache/HttpUrlSource;->fetchContentInfo()V

    .line 150
    :cond_c
    iget-object v0, p0, Lcom/danikula/videocache/HttpUrlSource;->mime:Ljava/lang/String;
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    monitor-exit p0

    return-object v0

    .line 147
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 154
    iget-object v0, p0, Lcom/danikula/videocache/HttpUrlSource;->url:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized length()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 52
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/danikula/videocache/HttpUrlSource;->length:I

    const/high16 v1, -0x80000000

    if-ne v0, v1, :cond_a

    .line 53
    invoke-direct {p0}, Lcom/danikula/videocache/HttpUrlSource;->fetchContentInfo()V

    .line 55
    :cond_a
    iget v0, p0, Lcom/danikula/videocache/HttpUrlSource;->length:I
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_e

    monitor-exit p0

    return v0

    .line 52
    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public open(I)V
    .registers 6
    .param p1, "offset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 61
    const/4 v1, -0x1

    :try_start_1
    invoke-direct {p0, p1, v1}, Lcom/danikula/videocache/HttpUrlSource;->openConnection(II)Ljava/net/HttpURLConnection;

    move-result-object v1

    iput-object v1, p0, Lcom/danikula/videocache/HttpUrlSource;->connection:Ljava/net/HttpURLConnection;

    .line 62
    iget-object v1, p0, Lcom/danikula/videocache/HttpUrlSource;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/danikula/videocache/HttpUrlSource;->mime:Ljava/lang/String;

    .line 63
    new-instance v1, Ljava/io/BufferedInputStream;

    iget-object v2, p0, Lcom/danikula/videocache/HttpUrlSource;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    const/16 v3, 0x2000

    invoke-direct {v1, v2, v3}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    iput-object v1, p0, Lcom/danikula/videocache/HttpUrlSource;->inputStream:Ljava/io/InputStream;

    .line 64
    iget-object v1, p0, Lcom/danikula/videocache/HttpUrlSource;->connection:Ljava/net/HttpURLConnection;

    iget-object v2, p0, Lcom/danikula/videocache/HttpUrlSource;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    invoke-direct {p0, v1, p1, v2}, Lcom/danikula/videocache/HttpUrlSource;->readSourceAvailableBytes(Ljava/net/HttpURLConnection;II)I

    move-result v1

    iput v1, p0, Lcom/danikula/videocache/HttpUrlSource;->length:I
    :try_end_2c
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_2c} :catch_2d

    .line 68
    return-void

    .line 65
    :catch_2d
    move-exception v0

    .line 66
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/danikula/videocache/ProxyCacheException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error opening connection for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/danikula/videocache/HttpUrlSource;->url:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " with offset "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public read([B)I
    .registers 6
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 85
    iget-object v1, p0, Lcom/danikula/videocache/HttpUrlSource;->inputStream:Ljava/io/InputStream;

    if-nez v1, :cond_25

    .line 86
    new-instance v1, Lcom/danikula/videocache/ProxyCacheException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error reading data from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/danikula/videocache/HttpUrlSource;->url:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": connection is absent!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 89
    :cond_25
    :try_start_25
    iget-object v1, p0, Lcom/danikula/videocache/HttpUrlSource;->inputStream:Ljava/io/InputStream;

    const/4 v2, 0x0

    array-length v3, p1

    invoke-virtual {v1, p1, v2, v3}, Ljava/io/InputStream;->read([BII)I
    :try_end_2c
    .catch Ljava/io/InterruptedIOException; {:try_start_25 .. :try_end_2c} :catch_2e
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_2c} :catch_50

    move-result v1

    return v1

    .line 90
    :catch_2e
    move-exception v0

    .line 91
    .local v0, "e":Ljava/io/InterruptedIOException;
    new-instance v1, Lcom/danikula/videocache/InterruptedProxyCacheException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Reading source "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/danikula/videocache/HttpUrlSource;->url:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is interrupted"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/danikula/videocache/InterruptedProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 92
    .end local v0    # "e":Ljava/io/InterruptedIOException;
    :catch_50
    move-exception v0

    .line 93
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/danikula/videocache/ProxyCacheException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error reading data from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/danikula/videocache/HttpUrlSource;->url:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 159
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "HttpUrlSource{url=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/danikula/videocache/HttpUrlSource;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
