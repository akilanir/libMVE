.class public final Lorg/apache/commons/net/io/FromNetASCIIOutputStream;
.super Ljava/io/FilterOutputStream;
.source "FromNetASCIIOutputStream.java"


# instance fields
.field private __lastWasCR:Z


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "output"    # Ljava/io/OutputStream;

    .prologue
    .line 51
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 52
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/net/io/FromNetASCIIOutputStream;->__lastWasCR:Z

    .line 53
    return-void
.end method

.method private __write(I)V
    .registers 5
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 58
    packed-switch p1, :pswitch_data_34

    .line 75
    :pswitch_4
    iget-boolean v0, p0, Lorg/apache/commons/net/io/FromNetASCIIOutputStream;->__lastWasCR:Z

    if-eqz v0, :cond_11

    .line 77
    iget-object v0, p0, Lorg/apache/commons/net/io/FromNetASCIIOutputStream;->out:Ljava/io/OutputStream;

    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 78
    iput-boolean v2, p0, Lorg/apache/commons/net/io/FromNetASCIIOutputStream;->__lastWasCR:Z

    .line 80
    :cond_11
    iget-object v0, p0, Lorg/apache/commons/net/io/FromNetASCIIOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 83
    :goto_16
    return-void

    .line 61
    :pswitch_17
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/net/io/FromNetASCIIOutputStream;->__lastWasCR:Z

    goto :goto_16

    .line 65
    :pswitch_1b
    iget-boolean v0, p0, Lorg/apache/commons/net/io/FromNetASCIIOutputStream;->__lastWasCR:Z

    if-eqz v0, :cond_29

    .line 67
    iget-object v0, p0, Lorg/apache/commons/net/io/FromNetASCIIOutputStream;->out:Ljava/io/OutputStream;

    sget-object v1, Lorg/apache/commons/net/io/FromNetASCIIInputStream;->_lineSeparatorBytes:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 68
    iput-boolean v2, p0, Lorg/apache/commons/net/io/FromNetASCIIOutputStream;->__lastWasCR:Z

    goto :goto_16

    .line 71
    :cond_29
    iput-boolean v2, p0, Lorg/apache/commons/net/io/FromNetASCIIOutputStream;->__lastWasCR:Z

    .line 72
    iget-object v0, p0, Lorg/apache/commons/net/io/FromNetASCIIOutputStream;->out:Ljava/io/OutputStream;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    goto :goto_16

    .line 58
    nop

    :pswitch_data_34
    .packed-switch 0xa
        :pswitch_1b
        :pswitch_4
        :pswitch_4
        :pswitch_17
    .end packed-switch
.end method


# virtual methods
.method public declared-synchronized close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    monitor-enter p0

    :try_start_1
    sget-boolean v0, Lorg/apache/commons/net/io/FromNetASCIIInputStream;->_noConversionRequired:Z

    if-eqz v0, :cond_a

    .line 166
    invoke-super {p0}, Ljava/io/FilterOutputStream;->close()V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_19

    .line 174
    :goto_8
    monitor-exit p0

    return-void

    .line 170
    :cond_a
    :try_start_a
    iget-boolean v0, p0, Lorg/apache/commons/net/io/FromNetASCIIOutputStream;->__lastWasCR:Z

    if-eqz v0, :cond_15

    .line 171
    iget-object v0, p0, Lorg/apache/commons/net/io/FromNetASCIIOutputStream;->out:Ljava/io/OutputStream;

    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 173
    :cond_15
    invoke-super {p0}, Ljava/io/FilterOutputStream;->close()V
    :try_end_18
    .catchall {:try_start_a .. :try_end_18} :catchall_19

    goto :goto_8

    .line 164
    :catchall_19
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized write(I)V
    .registers 3
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    monitor-enter p0

    :try_start_1
    sget-boolean v0, Lorg/apache/commons/net/io/FromNetASCIIInputStream;->_noConversionRequired:Z

    if-eqz v0, :cond_c

    .line 104
    iget-object v0, p0, Lorg/apache/commons/net/io/FromNetASCIIOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_10

    .line 109
    :goto_a
    monitor-exit p0

    return-void

    .line 108
    :cond_c
    :try_start_c
    invoke-direct {p0, p1}, Lorg/apache/commons/net/io/FromNetASCIIOutputStream;->__write(I)V
    :try_end_f
    .catchall {:try_start_c .. :try_end_f} :catchall_10

    goto :goto_a

    .line 102
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
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
    .line 123
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/net/io/FromNetASCIIOutputStream;->write([BII)V
    :try_end_6
    .catchall {:try_start_2 .. :try_end_6} :catchall_8

    .line 124
    monitor-exit p0

    return-void

    .line 123
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
    .line 141
    monitor-enter p0

    :try_start_1
    sget-boolean v2, Lorg/apache/commons/net/io/FromNetASCIIInputStream;->_noConversionRequired:Z

    if-eqz v2, :cond_1f

    .line 145
    iget-object v2, p0, Lorg/apache/commons/net/io/FromNetASCIIOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v2, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_1c

    .line 152
    :goto_a
    monitor-exit p0

    return-void

    .line 149
    .end local p2    # "offset":I
    .end local p3    # "length":I
    .local v0, "length":I
    .local v1, "offset":I
    :goto_c
    add-int/lit8 p3, v0, -0x1

    .end local v0    # "length":I
    .restart local p3    # "length":I
    if-lez v0, :cond_1a

    .line 150
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "offset":I
    .restart local p2    # "offset":I
    :try_start_12
    aget-byte v2, p1, v1

    invoke-direct {p0, v2}, Lorg/apache/commons/net/io/FromNetASCIIOutputStream;->__write(I)V
    :try_end_17
    .catchall {:try_start_12 .. :try_end_17} :catchall_1c

    move v0, p3

    .end local p3    # "length":I
    .restart local v0    # "length":I
    move v1, p2

    .end local p2    # "offset":I
    .restart local v1    # "offset":I
    goto :goto_c

    .end local v0    # "length":I
    .restart local p3    # "length":I
    :cond_1a
    move p2, v1

    .line 152
    .end local v1    # "offset":I
    .restart local p2    # "offset":I
    goto :goto_a

    .line 141
    :catchall_1c
    move-exception v2

    monitor-exit p0

    throw v2

    :cond_1f
    move v0, p3

    .end local p3    # "length":I
    .restart local v0    # "length":I
    move v1, p2

    .end local p2    # "offset":I
    .restart local v1    # "offset":I
    goto :goto_c
.end method
