.class public Lorg/apache/commons/io/output/TeeOutputStream;
.super Lorg/apache/commons/io/output/ProxyOutputStream;
.source "TeeOutputStream.java"


# instance fields
.field protected branch:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "branch"    # Ljava/io/OutputStream;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lorg/apache/commons/io/output/ProxyOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 41
    iput-object p2, p0, Lorg/apache/commons/io/output/TeeOutputStream;->branch:Ljava/io/OutputStream;

    .line 42
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    invoke-super {p0}, Lorg/apache/commons/io/output/ProxyOutputStream;->close()V

    .line 79
    iget-object v0, p0, Lorg/apache/commons/io/output/TeeOutputStream;->branch:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 80
    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    invoke-super {p0}, Lorg/apache/commons/io/output/ProxyOutputStream;->flush()V

    .line 69
    iget-object v0, p0, Lorg/apache/commons/io/output/TeeOutputStream;->branch:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 70
    return-void
.end method

.method public declared-synchronized write(I)V
    .registers 3
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 58
    monitor-enter p0

    :try_start_1
    invoke-super {p0, p1}, Lorg/apache/commons/io/output/ProxyOutputStream;->write(I)V

    .line 59
    iget-object v0, p0, Lorg/apache/commons/io/output/TeeOutputStream;->branch:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    .line 60
    monitor-exit p0

    return-void

    .line 58
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized write([B)V
    .registers 3
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 46
    monitor-enter p0

    :try_start_1
    invoke-super {p0, p1}, Lorg/apache/commons/io/output/ProxyOutputStream;->write([B)V

    .line 47
    iget-object v0, p0, Lorg/apache/commons/io/output/TeeOutputStream;->branch:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    .line 48
    monitor-exit p0

    return-void

    .line 46
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized write([BII)V
    .registers 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    monitor-enter p0

    :try_start_1
    invoke-super {p0, p1, p2, p3}, Lorg/apache/commons/io/output/ProxyOutputStream;->write([BII)V

    .line 53
    iget-object v0, p0, Lorg/apache/commons/io/output/TeeOutputStream;->branch:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    .line 54
    monitor-exit p0

    return-void

    .line 52
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method
