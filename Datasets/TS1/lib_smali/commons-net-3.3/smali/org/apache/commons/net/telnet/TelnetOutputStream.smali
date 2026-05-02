.class final Lorg/apache/commons/net/telnet/TelnetOutputStream;
.super Ljava/io/OutputStream;
.source "TelnetOutputStream.java"


# instance fields
.field private final __client:Lorg/apache/commons/net/telnet/TelnetClient;

.field private final __convertCRtoCRLF:Z

.field private __lastWasCR:Z


# direct methods
.method constructor <init>(Lorg/apache/commons/net/telnet/TelnetClient;)V
    .registers 3
    .param p1, "client"    # Lorg/apache/commons/net/telnet/TelnetClient;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 38
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->__convertCRtoCRLF:Z

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->__lastWasCR:Z

    .line 43
    iput-object p1, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    .line 44
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
    .line 155
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v0}, Lorg/apache/commons/net/telnet/TelnetClient;->_closeOutputStream()V

    .line 156
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
    .line 148
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v0}, Lorg/apache/commons/net/telnet/TelnetClient;->_flushOutputStream()V

    .line 149
    return-void
.end method

.method public write(I)V
    .registers 7
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0xa

    const/16 v3, 0xff

    .line 58
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    monitor-enter v1

    .line 60
    and-int/lit16 p1, p1, 0xff

    .line 62
    :try_start_9
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lorg/apache/commons/net/telnet/TelnetClient;->_requestedWont(I)Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 64
    iget-boolean v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->__lastWasCR:Z

    if-eqz v0, :cond_24

    .line 68
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Lorg/apache/commons/net/telnet/TelnetClient;->_sendByte(I)V

    .line 69
    if-ne p1, v4, :cond_24

    .line 71
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->__lastWasCR:Z

    .line 72
    monitor-exit v1

    .line 106
    :goto_23
    return-void

    .line 81
    :cond_24
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->__lastWasCR:Z

    .line 83
    sparse-switch p1, :sswitch_data_64

    .line 94
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v0, p1}, Lorg/apache/commons/net/telnet/TelnetClient;->_sendByte(I)V

    .line 105
    :goto_2f
    monitor-exit v1

    goto :goto_23

    :catchall_31
    move-exception v0

    monitor-exit v1
    :try_end_33
    .catchall {:try_start_9 .. :try_end_33} :catchall_31

    throw v0

    .line 86
    :sswitch_34
    :try_start_34
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    const/16 v2, 0xd

    invoke-virtual {v0, v2}, Lorg/apache/commons/net/telnet/TelnetClient;->_sendByte(I)V

    .line 87
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->__lastWasCR:Z

    goto :goto_2f

    .line 90
    :sswitch_3f
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    const/16 v2, 0xff

    invoke-virtual {v0, v2}, Lorg/apache/commons/net/telnet/TelnetClient;->_sendByte(I)V

    .line 91
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    const/16 v2, 0xff

    invoke-virtual {v0, v2}, Lorg/apache/commons/net/telnet/TelnetClient;->_sendByte(I)V

    goto :goto_2f

    .line 98
    :cond_4e
    if-ne p1, v3, :cond_5d

    .line 100
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v0, p1}, Lorg/apache/commons/net/telnet/TelnetClient;->_sendByte(I)V

    .line 101
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    const/16 v2, 0xff

    invoke-virtual {v0, v2}, Lorg/apache/commons/net/telnet/TelnetClient;->_sendByte(I)V

    goto :goto_2f

    .line 103
    :cond_5d
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v0, p1}, Lorg/apache/commons/net/telnet/TelnetClient;->_sendByte(I)V
    :try_end_62
    .catchall {:try_start_34 .. :try_end_62} :catchall_31

    goto :goto_2f

    .line 83
    nop

    :sswitch_data_64
    .sparse-switch
        0xd -> :sswitch_34
        0xff -> :sswitch_3f
    .end sparse-switch
.end method

.method public write([B)V
    .registers 4
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/net/telnet/TelnetOutputStream;->write([BII)V

    .line 120
    return-void
.end method

.method public write([BII)V
    .registers 8
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 136
    iget-object v3, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    monitor-enter v3

    move v0, p3

    .end local p3    # "length":I
    .local v0, "length":I
    move v1, p2

    .line 138
    .end local p2    # "offset":I
    .local v1, "offset":I
    :goto_5
    add-int/lit8 p3, v0, -0x1

    .end local v0    # "length":I
    .restart local p3    # "length":I
    if-lez v0, :cond_13

    .line 139
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "offset":I
    .restart local p2    # "offset":I
    :try_start_b
    aget-byte v2, p1, v1

    invoke-virtual {p0, v2}, Lorg/apache/commons/net/telnet/TelnetOutputStream;->write(I)V
    :try_end_10
    .catchall {:try_start_b .. :try_end_10} :catchall_15

    move v0, p3

    .end local p3    # "length":I
    .restart local v0    # "length":I
    move v1, p2

    .end local p2    # "offset":I
    .restart local v1    # "offset":I
    goto :goto_5

    .line 141
    .end local v0    # "length":I
    .restart local p3    # "length":I
    :cond_13
    :try_start_13
    monitor-exit v3
    :try_end_14
    .catchall {:try_start_13 .. :try_end_14} :catchall_18

    .line 142
    return-void

    .line 141
    .end local v1    # "offset":I
    .restart local p2    # "offset":I
    :catchall_15
    move-exception v2

    :goto_16
    :try_start_16
    monitor-exit v3
    :try_end_17
    .catchall {:try_start_16 .. :try_end_17} :catchall_15

    throw v2

    .end local p2    # "offset":I
    .restart local v1    # "offset":I
    :catchall_18
    move-exception v2

    move p2, v1

    .end local v1    # "offset":I
    .restart local p2    # "offset":I
    goto :goto_16
.end method
