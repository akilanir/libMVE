.class public Lorg/apache/commons/net/telnet/TelnetClient;
.super Lorg/apache/commons/net/telnet/Telnet;
.source "TelnetClient.java"


# instance fields
.field private __input:Ljava/io/InputStream;

.field private __output:Ljava/io/OutputStream;

.field private inputListener:Lorg/apache/commons/net/telnet/TelnetInputListener;

.field protected readerThread:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 60
    const-string v0, "VT100"

    invoke-direct {p0, v0}, Lorg/apache/commons/net/telnet/Telnet;-><init>(Ljava/lang/String;)V

    .line 51
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/net/telnet/TelnetClient;->readerThread:Z

    .line 62
    iput-object v1, p0, Lorg/apache/commons/net/telnet/TelnetClient;->__input:Ljava/io/InputStream;

    .line 63
    iput-object v1, p0, Lorg/apache/commons/net/telnet/TelnetClient;->__output:Ljava/io/OutputStream;

    .line 64
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "termtype"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 74
    invoke-direct {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;-><init>(Ljava/lang/String;)V

    .line 51
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/net/telnet/TelnetClient;->readerThread:Z

    .line 75
    iput-object v1, p0, Lorg/apache/commons/net/telnet/TelnetClient;->__input:Ljava/io/InputStream;

    .line 76
    iput-object v1, p0, Lorg/apache/commons/net/telnet/TelnetClient;->__output:Ljava/io/OutputStream;

    .line 77
    return-void
.end method


# virtual methods
.method _closeOutputStream()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetClient;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 87
    return-void
.end method

.method protected _connectAction_()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    invoke-super {p0}, Lorg/apache/commons/net/telnet/Telnet;->_connectAction_()V

    .line 98
    new-instance v0, Lorg/apache/commons/net/telnet/TelnetInputStream;

    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetClient;->_input_:Ljava/io/InputStream;

    iget-boolean v2, p0, Lorg/apache/commons/net/telnet/TelnetClient;->readerThread:Z

    invoke-direct {v0, v1, p0, v2}, Lorg/apache/commons/net/telnet/TelnetInputStream;-><init>(Ljava/io/InputStream;Lorg/apache/commons/net/telnet/TelnetClient;Z)V

    .line 99
    .local v0, "tmp":Lorg/apache/commons/net/telnet/TelnetInputStream;
    iget-boolean v1, p0, Lorg/apache/commons/net/telnet/TelnetClient;->readerThread:Z

    if-eqz v1, :cond_13

    .line 101
    invoke-virtual {v0}, Lorg/apache/commons/net/telnet/TelnetInputStream;->_start()V

    .line 109
    :cond_13
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v1, p0, Lorg/apache/commons/net/telnet/TelnetClient;->__input:Ljava/io/InputStream;

    .line 110
    new-instance v1, Lorg/apache/commons/net/telnet/TelnetOutputStream;

    invoke-direct {v1, p0}, Lorg/apache/commons/net/telnet/TelnetOutputStream;-><init>(Lorg/apache/commons/net/telnet/TelnetClient;)V

    iput-object v1, p0, Lorg/apache/commons/net/telnet/TelnetClient;->__output:Ljava/io/OutputStream;

    .line 111
    return-void
.end method

.method _flushOutputStream()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetClient;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 83
    return-void
.end method

.method public addOptionHandler(Lorg/apache/commons/net/telnet/TelnetOptionHandler;)V
    .registers 2
    .param p1, "opthand"    # Lorg/apache/commons/net/telnet/TelnetOptionHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 264
    invoke-super {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->addOptionHandler(Lorg/apache/commons/net/telnet/TelnetOptionHandler;)V

    .line 265
    return-void
.end method

.method public deleteOptionHandler(I)V
    .registers 2
    .param p1, "optcode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 280
    invoke-super {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->deleteOptionHandler(I)V

    .line 281
    return-void
.end method

.method public disconnect()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 123
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetClient;->__input:Ljava/io/InputStream;

    if-eqz v0, :cond_9

    .line 124
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetClient;->__input:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 126
    :cond_9
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetClient;->__output:Ljava/io/OutputStream;

    if-eqz v0, :cond_12

    .line 127
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetClient;->__output:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 129
    :cond_12
    invoke-super {p0}, Lorg/apache/commons/net/telnet/Telnet;->disconnect()V

    .line 130
    return-void
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 2

    .prologue
    .line 153
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetClient;->__input:Ljava/io/InputStream;

    return-object v0
.end method

.method public getLocalOptionState(I)Z
    .registers 3
    .param p1, "option"    # I

    .prologue
    .line 166
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/TelnetClient;->_stateIsWill(I)Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/TelnetClient;->_requestedWill(I)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .registers 2

    .prologue
    .line 141
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetClient;->__output:Ljava/io/OutputStream;

    return-object v0
.end method

.method public getReaderThread()Z
    .registers 2

    .prologue
    .line 366
    iget-boolean v0, p0, Lorg/apache/commons/net/telnet/TelnetClient;->readerThread:Z

    return v0
.end method

.method public getRemoteOptionState(I)Z
    .registers 3
    .param p1, "option"    # I

    .prologue
    .line 180
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/TelnetClient;->_stateIsDo(I)Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/TelnetClient;->_requestedDo(I)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method notifyInputListener()V
    .registers 3

    .prologue
    .line 409
    monitor-enter p0

    .line 410
    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetClient;->inputListener:Lorg/apache/commons/net/telnet/TelnetInputListener;

    .line 411
    .local v0, "listener":Lorg/apache/commons/net/telnet/TelnetInputListener;
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_a

    .line 412
    if-eqz v0, :cond_9

    .line 413
    invoke-interface {v0}, Lorg/apache/commons/net/telnet/TelnetInputListener;->telnetInputAvailable()V

    .line 415
    :cond_9
    return-void

    .line 411
    .end local v0    # "listener":Lorg/apache/commons/net/telnet/TelnetInputListener;
    :catchall_a
    move-exception v1

    :try_start_b
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_b .. :try_end_c} :catchall_a

    throw v1
.end method

.method public declared-synchronized registerInputListener(Lorg/apache/commons/net/telnet/TelnetInputListener;)V
    .registers 3
    .param p1, "listener"    # Lorg/apache/commons/net/telnet/TelnetInputListener;

    .prologue
    .line 393
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lorg/apache/commons/net/telnet/TelnetClient;->inputListener:Lorg/apache/commons/net/telnet/TelnetInputListener;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 394
    monitor-exit p0

    return-void

    .line 393
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public registerNotifHandler(Lorg/apache/commons/net/telnet/TelnetNotificationHandler;)V
    .registers 2
    .param p1, "notifhand"    # Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    .prologue
    .line 315
    invoke-super {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->registerNotifHandler(Lorg/apache/commons/net/telnet/TelnetNotificationHandler;)V

    .line 316
    return-void
.end method

.method public registerSpyStream(Ljava/io/OutputStream;)V
    .registers 2
    .param p1, "spystream"    # Ljava/io/OutputStream;

    .prologue
    .line 293
    invoke-super {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_registerSpyStream(Ljava/io/OutputStream;)V

    .line 294
    return-void
.end method

.method public sendAYT(J)Z
    .registers 4
    .param p1, "timeout"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 201
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/net/telnet/TelnetClient;->_sendAYT(J)Z

    move-result v0

    return v0
.end method

.method public sendCommand(B)V
    .registers 2
    .param p1, "command"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 247
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/TelnetClient;->_sendCommand(B)V

    .line 248
    return-void
.end method

.method public sendSubnegotiation([I)V
    .registers 4
    .param p1, "message"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 225
    array-length v0, p1

    const/4 v1, 0x1

    if-ge v0, v1, :cond_c

    .line 226
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "zero length message"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 228
    :cond_c
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/TelnetClient;->_sendSubnegotiation([I)V

    .line 229
    return-void
.end method

.method public setReaderThread(Z)V
    .registers 2
    .param p1, "flag"    # Z

    .prologue
    .line 356
    iput-boolean p1, p0, Lorg/apache/commons/net/telnet/TelnetClient;->readerThread:Z

    .line 357
    return-void
.end method

.method public stopSpyStream()V
    .registers 1

    .prologue
    .line 302
    invoke-super {p0}, Lorg/apache/commons/net/telnet/Telnet;->_stopSpyStream()V

    .line 303
    return-void
.end method

.method public declared-synchronized unregisterInputListener()V
    .registers 2

    .prologue
    .line 403
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    iput-object v0, p0, Lorg/apache/commons/net/telnet/TelnetClient;->inputListener:Lorg/apache/commons/net/telnet/TelnetInputListener;
    :try_end_4
    .catchall {:try_start_2 .. :try_end_4} :catchall_6

    .line 404
    monitor-exit p0

    return-void

    .line 403
    :catchall_6
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public unregisterNotifHandler()V
    .registers 1

    .prologue
    .line 325
    invoke-super {p0}, Lorg/apache/commons/net/telnet/Telnet;->unregisterNotifHandler()V

    .line 326
    return-void
.end method
