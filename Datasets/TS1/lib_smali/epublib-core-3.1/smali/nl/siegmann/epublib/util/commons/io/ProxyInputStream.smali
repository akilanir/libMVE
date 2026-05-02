.class public abstract Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;
.super Ljava/io/FilterInputStream;
.source "ProxyInputStream.java"


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 2
    .param p1, "proxy"    # Ljava/io/InputStream;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 49
    return-void
.end method


# virtual methods
.method protected afterRead(I)V
    .registers 2
    .param p1, "n"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 223
    return-void
.end method

.method public available()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    :try_start_0
    invoke-super {p0}, Ljava/io/FilterInputStream;->available()I
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_5

    move-result v1

    .line 136
    :goto_4
    return v1

    .line 134
    :catch_5
    move-exception v0

    .line 135
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p0, v0}, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->handleIOException(Ljava/io/IOException;)V

    .line 136
    const/4 v1, 0x0

    goto :goto_4
.end method

.method protected beforeRead(I)V
    .registers 2
    .param p1, "n"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 203
    return-void
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    :try_start_0
    iget-object v1, p0, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 151
    :goto_5
    return-void

    .line 148
    :catch_6
    move-exception v0

    .line 149
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p0, v0}, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->handleIOException(Ljava/io/IOException;)V

    goto :goto_5
.end method

.method protected handleIOException(Ljava/io/IOException;)V
    .registers 2
    .param p1, "e"    # Ljava/io/IOException;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 235
    throw p1
.end method

.method public declared-synchronized mark(I)V
    .registers 3
    .param p1, "readlimit"    # I

    .prologue
    .line 159
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0, p1}, Ljava/io/InputStream;->mark(I)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 160
    monitor-exit p0

    return-void

    .line 159
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 181
    iget-object v0, p0, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->markSupported()Z

    move-result v0

    return v0
.end method

.method public read()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, -0x1

    .line 59
    const/4 v4, 0x1

    :try_start_3
    invoke-virtual {p0, v4}, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->beforeRead(I)V

    .line 60
    iget-object v4, p0, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 61
    .local v0, "b":I
    if-eq v0, v2, :cond_12

    :goto_e
    invoke-virtual {p0, v3}, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->afterRead(I)V
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_11} :catch_14

    .line 65
    .end local v0    # "b":I
    :goto_11
    return v0

    .restart local v0    # "b":I
    :cond_12
    move v3, v2

    .line 61
    goto :goto_e

    .line 63
    .end local v0    # "b":I
    :catch_14
    move-exception v1

    .line 64
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {p0, v1}, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->handleIOException(Ljava/io/IOException;)V

    move v0, v2

    .line 65
    goto :goto_11
.end method

.method public read([B)I
    .registers 5
    .param p1, "bts"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    if-eqz p1, :cond_10

    :try_start_2
    array-length v2, p1

    :goto_3
    invoke-virtual {p0, v2}, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->beforeRead(I)V

    .line 79
    iget-object v2, p0, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2, p1}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .line 80
    .local v1, "n":I
    invoke-virtual {p0, v1}, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->afterRead(I)V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_f} :catch_12

    .line 84
    .end local v1    # "n":I
    :goto_f
    return v1

    .line 78
    :cond_10
    const/4 v2, 0x0

    goto :goto_3

    .line 82
    :catch_12
    move-exception v0

    .line 83
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p0, v0}, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->handleIOException(Ljava/io/IOException;)V

    .line 84
    const/4 v1, -0x1

    goto :goto_f
.end method

.method public read([BII)I
    .registers 7
    .param p1, "bts"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 99
    :try_start_0
    invoke-virtual {p0, p3}, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->beforeRead(I)V

    .line 100
    iget-object v2, p0, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 101
    .local v1, "n":I
    invoke-virtual {p0, v1}, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->afterRead(I)V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_c} :catch_d

    .line 105
    .end local v1    # "n":I
    :goto_c
    return v1

    .line 103
    :catch_d
    move-exception v0

    .line 104
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p0, v0}, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->handleIOException(Ljava/io/IOException;)V

    .line 105
    const/4 v1, -0x1

    goto :goto_c
.end method

.method public declared-synchronized reset()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 169
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->reset()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_6} :catch_8
    .catchall {:try_start_1 .. :try_end_6} :catchall_d

    .line 173
    :goto_6
    monitor-exit p0

    return-void

    .line 170
    :catch_8
    move-exception v0

    .line 171
    .local v0, "e":Ljava/io/IOException;
    :try_start_9
    invoke-virtual {p0, v0}, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->handleIOException(Ljava/io/IOException;)V
    :try_end_c
    .catchall {:try_start_9 .. :try_end_c} :catchall_d

    goto :goto_6

    .line 169
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_d
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public skip(J)J
    .registers 6
    .param p1, "ln"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    :try_start_0
    iget-object v1, p0, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2}, Ljava/io/InputStream;->skip(J)J
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-wide v1

    .line 121
    :goto_6
    return-wide v1

    .line 119
    :catch_7
    move-exception v0

    .line 120
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p0, v0}, Lnl/siegmann/epublib/util/commons/io/ProxyInputStream;->handleIOException(Ljava/io/IOException;)V

    .line 121
    const-wide/16 v1, 0x0

    goto :goto_6
.end method
