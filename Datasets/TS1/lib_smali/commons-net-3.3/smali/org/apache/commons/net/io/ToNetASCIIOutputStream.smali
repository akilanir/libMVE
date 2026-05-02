.class public final Lorg/apache/commons/net/io/ToNetASCIIOutputStream;
.super Ljava/io/FilterOutputStream;
.source "ToNetASCIIOutputStream.java"


# instance fields
.field private __lastWasCR:Z


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "output"    # Ljava/io/OutputStream;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/net/io/ToNetASCIIOutputStream;->__lastWasCR:Z

    .line 49
    return-void
.end method


# virtual methods
.method public declared-synchronized write(I)V
    .registers 4
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    monitor-enter p0

    packed-switch p1, :pswitch_data_28

    .line 79
    :cond_4
    :goto_4
    :pswitch_4
    const/4 v0, 0x0

    :try_start_5
    iput-boolean v0, p0, Lorg/apache/commons/net/io/ToNetASCIIOutputStream;->__lastWasCR:Z

    .line 80
    iget-object v0, p0, Lorg/apache/commons/net/io/ToNetASCIIOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V
    :try_end_c
    .catchall {:try_start_5 .. :try_end_c} :catchall_19

    .line 81
    :goto_c
    monitor-exit p0

    return-void

    .line 70
    :pswitch_e
    const/4 v0, 0x1

    :try_start_f
    iput-boolean v0, p0, Lorg/apache/commons/net/io/ToNetASCIIOutputStream;->__lastWasCR:Z

    .line 71
    iget-object v0, p0, Lorg/apache/commons/net/io/ToNetASCIIOutputStream;->out:Ljava/io/OutputStream;

    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V
    :try_end_18
    .catchall {:try_start_f .. :try_end_18} :catchall_19

    goto :goto_c

    .line 67
    :catchall_19
    move-exception v0

    monitor-exit p0

    throw v0

    .line 74
    :pswitch_1c
    :try_start_1c
    iget-boolean v0, p0, Lorg/apache/commons/net/io/ToNetASCIIOutputStream;->__lastWasCR:Z

    if-nez v0, :cond_4

    .line 75
    iget-object v0, p0, Lorg/apache/commons/net/io/ToNetASCIIOutputStream;->out:Ljava/io/OutputStream;

    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V
    :try_end_27
    .catchall {:try_start_1c .. :try_end_27} :catchall_19

    goto :goto_4

    .line 67
    :pswitch_data_28
    .packed-switch 0xa
        :pswitch_1c
        :pswitch_4
        :pswitch_4
        :pswitch_e
    .end packed-switch
.end method

.method public declared-synchronized write([B)V
    .registers 4
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/net/io/ToNetASCIIOutputStream;->write([BII)V
    :try_end_6
    .catchall {:try_start_2 .. :try_end_6} :catchall_8

    .line 98
    monitor-exit p0

    return-void

    .line 97
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized write([BII)V
    .registers 7
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    monitor-enter p0

    move v0, p3

    .end local p3    # "length":I
    .local v0, "length":I
    move v1, p2

    .end local p2    # "offset":I
    .local v1, "offset":I
    :goto_3
    add-int/lit8 p3, v0, -0x1

    .end local v0    # "length":I
    .restart local p3    # "length":I
    if-lez v0, :cond_11

    .line 116
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "offset":I
    .restart local p2    # "offset":I
    :try_start_9
    aget-byte v2, p1, v1

    invoke-virtual {p0, v2}, Lorg/apache/commons/net/io/ToNetASCIIOutputStream;->write(I)V
    :try_end_e
    .catchall {:try_start_9 .. :try_end_e} :catchall_13

    move v0, p3

    .end local p3    # "length":I
    .restart local v0    # "length":I
    move v1, p2

    .end local p2    # "offset":I
    .restart local v1    # "offset":I
    goto :goto_3

    .line 118
    .end local v0    # "length":I
    .restart local p3    # "length":I
    :cond_11
    monitor-exit p0

    return-void

    .line 115
    .end local v1    # "offset":I
    .restart local p2    # "offset":I
    :catchall_13
    move-exception v2

    monitor-exit p0

    throw v2
.end method
