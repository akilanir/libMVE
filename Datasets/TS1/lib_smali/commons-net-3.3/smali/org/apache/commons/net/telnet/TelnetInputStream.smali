.class final Lorg/apache/commons/net/telnet/TelnetInputStream;
.super Ljava/io/BufferedInputStream;
.source "TelnetInputStream.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final EOF:I = -0x1

.field private static final WOULD_BLOCK:I = -0x2

.field static final _STATE_CR:I = 0x8

.field static final _STATE_DATA:I = 0x0

.field static final _STATE_DO:I = 0x4

.field static final _STATE_DONT:I = 0x5

.field static final _STATE_IAC:I = 0x1

.field static final _STATE_IAC_SB:I = 0x9

.field static final _STATE_SB:I = 0x6

.field static final _STATE_SE:I = 0x7

.field static final _STATE_WILL:I = 0x2

.field static final _STATE_WONT:I = 0x3


# instance fields
.field private __bytesAvailable:I

.field private final __client:Lorg/apache/commons/net/telnet/TelnetClient;

.field private __hasReachedEOF:Z

.field private __ioException:Ljava/io/IOException;

.field private volatile __isClosed:Z

.field private final __queue:[I

.field private __queueHead:I

.field private __queueTail:I

.field private __readIsWaiting:Z

.field private __receiveState:I

.field private final __suboption:[I

.field private __suboption_count:I

.field private final __thread:Ljava/lang/Thread;

.field private volatile __threaded:Z


# direct methods
.method constructor <init>(Ljava/io/InputStream;Lorg/apache/commons/net/telnet/TelnetClient;)V
    .registers 4
    .param p1, "input"    # Ljava/io/InputStream;
    .param p2, "client"    # Lorg/apache/commons/net/telnet/TelnetClient;

    .prologue
    .line 89
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/net/telnet/TelnetInputStream;-><init>(Ljava/io/InputStream;Lorg/apache/commons/net/telnet/TelnetClient;Z)V

    .line 90
    return-void
.end method

.method constructor <init>(Ljava/io/InputStream;Lorg/apache/commons/net/telnet/TelnetClient;Z)V
    .registers 7
    .param p1, "input"    # Ljava/io/InputStream;
    .param p2, "client"    # Lorg/apache/commons/net/telnet/TelnetClient;
    .param p3, "readerThread"    # Z

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 67
    invoke-direct {p0, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 58
    const/16 v0, 0x200

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption:[I

    .line 59
    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption_count:I

    .line 68
    iput-object p2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    .line 69
    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    .line 70
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__isClosed:Z

    .line 71
    iput-boolean v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__hasReachedEOF:Z

    .line 74
    const/16 v0, 0x801

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    .line 75
    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queueHead:I

    .line 76
    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queueTail:I

    .line 77
    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    .line 78
    iput-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__ioException:Ljava/io/IOException;

    .line 79
    iput-boolean v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__readIsWaiting:Z

    .line 80
    iput-boolean v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__threaded:Z

    .line 81
    if-eqz p3, :cond_32

    .line 82
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__thread:Ljava/lang/Thread;

    .line 86
    :goto_31
    return-void

    .line 84
    :cond_32
    iput-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__thread:Ljava/lang/Thread;

    goto :goto_31
.end method

.method private __processChar(I)Z
    .registers 7
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 316
    iget-object v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    monitor-enter v3

    .line 318
    :try_start_4
    iget v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    if-nez v2, :cond_9

    const/4 v0, 0x1

    .line 319
    .local v0, "bufferWasEmpty":Z
    :cond_9
    :goto_9
    iget v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    iget-object v4, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    array-length v4, v4

    add-int/lit8 v4, v4, -0x1

    if-lt v2, v4, :cond_2e

    .line 323
    iget-boolean v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__threaded:Z

    if-eqz v2, :cond_26

    .line 325
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V
    :try_end_1b
    .catchall {:try_start_4 .. :try_end_1b} :catchall_23

    .line 328
    :try_start_1b
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    invoke-virtual {v2}, Ljava/lang/Object;->wait()V
    :try_end_20
    .catch Ljava/lang/InterruptedException; {:try_start_1b .. :try_end_20} :catch_21
    .catchall {:try_start_1b .. :try_end_20} :catchall_23

    goto :goto_9

    .line 330
    :catch_21
    move-exception v1

    .line 332
    .local v1, "e":Ljava/lang/InterruptedException;
    :try_start_22
    throw v1

    .line 355
    .end local v0    # "bufferWasEmpty":Z
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :catchall_23
    move-exception v2

    monitor-exit v3
    :try_end_25
    .catchall {:try_start_22 .. :try_end_25} :catchall_23

    throw v2

    .line 339
    .restart local v0    # "bufferWasEmpty":Z
    :cond_26
    :try_start_26
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v4, "Queue is full! Cannot process another character."

    invoke-direct {v2, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 344
    :cond_2e
    iget-boolean v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__readIsWaiting:Z

    if-eqz v2, :cond_3b

    iget-boolean v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__threaded:Z

    if-eqz v2, :cond_3b

    .line 346
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 349
    :cond_3b
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    iget v4, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queueTail:I

    aput p1, v2, v4

    .line 350
    iget v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    .line 352
    iget v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queueTail:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queueTail:I

    iget-object v4, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    array-length v4, v4

    if-lt v2, v4, :cond_55

    .line 353
    const/4 v2, 0x0

    iput v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queueTail:I

    .line 355
    :cond_55
    monitor-exit v3
    :try_end_56
    .catchall {:try_start_26 .. :try_end_56} :catchall_23

    .line 356
    return v0
.end method

.method private __read(Z)I
    .registers 9
    .param p1, "mayBlock"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x6

    const/4 v5, 0x0

    .line 136
    :goto_2
    if-nez p1, :cond_c

    invoke-super {p0}, Ljava/io/BufferedInputStream;->available()I

    move-result v1

    if-nez v1, :cond_c

    .line 137
    const/4 v0, -0x2

    .line 304
    :goto_b
    return v0

    .line 141
    :cond_c
    invoke-super {p0}, Ljava/io/BufferedInputStream;->read()I

    move-result v0

    .local v0, "ch":I
    if-gez v0, :cond_14

    .line 142
    const/4 v0, -0x1

    goto :goto_b

    .line 145
    :cond_14
    and-int/lit16 v0, v0, 0xff

    .line 148
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    monitor-enter v2

    .line 150
    :try_start_19
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetClient;->_processAYTResponse()V

    .line 151
    monitor-exit v2
    :try_end_1f
    .catchall {:try_start_19 .. :try_end_1f} :catchall_32

    .line 155
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1, v0}, Lorg/apache/commons/net/telnet/TelnetClient;->_spyRead(I)V

    .line 158
    iget v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    packed-switch v1, :pswitch_data_122

    :pswitch_29
    goto :goto_b

    .line 174
    :cond_2a
    :pswitch_2a
    const/16 v1, 0xff

    if-ne v0, v1, :cond_38

    .line 176
    const/4 v1, 0x1

    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto :goto_2

    .line 151
    :catchall_32
    move-exception v1

    :try_start_33
    monitor-exit v2
    :try_end_34
    .catchall {:try_start_33 .. :try_end_34} :catchall_32

    throw v1

    .line 162
    :pswitch_35
    if-nez v0, :cond_2a

    goto :goto_2

    .line 181
    :cond_38
    const/16 v1, 0xd

    if-ne v0, v1, :cond_55

    .line 183
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    monitor-enter v2

    .line 185
    :try_start_3f
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lorg/apache/commons/net/telnet/TelnetClient;->_requestedDont(I)Z

    move-result v1

    if-eqz v1, :cond_51

    .line 186
    const/16 v1, 0x8

    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    .line 190
    :goto_4c
    monitor-exit v2

    goto :goto_b

    :catchall_4e
    move-exception v1

    monitor-exit v2
    :try_end_50
    .catchall {:try_start_3f .. :try_end_50} :catchall_4e

    throw v1

    .line 188
    :cond_51
    const/4 v1, 0x0

    :try_start_52
    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I
    :try_end_54
    .catchall {:try_start_52 .. :try_end_54} :catchall_4e

    goto :goto_4c

    .line 192
    :cond_55
    iput v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto :goto_b

    .line 197
    :pswitch_58
    packed-switch v0, :pswitch_data_13a

    .line 224
    :pswitch_5b
    iput v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    .line 225
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1, v0}, Lorg/apache/commons/net/telnet/TelnetClient;->_processCommand(I)V

    goto :goto_2

    .line 200
    :pswitch_63
    const/4 v1, 0x2

    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto :goto_2

    .line 203
    :pswitch_67
    const/4 v1, 0x3

    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto :goto_2

    .line 206
    :pswitch_6b
    const/4 v1, 0x4

    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto :goto_2

    .line 209
    :pswitch_6f
    const/4 v1, 0x5

    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto :goto_2

    .line 213
    :pswitch_73
    iput v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption_count:I

    .line 214
    iput v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto :goto_2

    .line 218
    :pswitch_78
    iput v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto :goto_b

    .line 221
    :pswitch_7b
    iput v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto :goto_2

    .line 230
    :pswitch_7e
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    monitor-enter v2

    .line 232
    :try_start_81
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1, v0}, Lorg/apache/commons/net/telnet/TelnetClient;->_processWill(I)V

    .line 233
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetClient;->_flushOutputStream()V

    .line 234
    monitor-exit v2
    :try_end_8c
    .catchall {:try_start_81 .. :try_end_8c} :catchall_90

    .line 235
    iput v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto/16 :goto_2

    .line 234
    :catchall_90
    move-exception v1

    :try_start_91
    monitor-exit v2
    :try_end_92
    .catchall {:try_start_91 .. :try_end_92} :catchall_90

    throw v1

    .line 238
    :pswitch_93
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    monitor-enter v2

    .line 240
    :try_start_96
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1, v0}, Lorg/apache/commons/net/telnet/TelnetClient;->_processWont(I)V

    .line 241
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetClient;->_flushOutputStream()V

    .line 242
    monitor-exit v2
    :try_end_a1
    .catchall {:try_start_96 .. :try_end_a1} :catchall_a5

    .line 243
    iput v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto/16 :goto_2

    .line 242
    :catchall_a5
    move-exception v1

    :try_start_a6
    monitor-exit v2
    :try_end_a7
    .catchall {:try_start_a6 .. :try_end_a7} :catchall_a5

    throw v1

    .line 246
    :pswitch_a8
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    monitor-enter v2

    .line 248
    :try_start_ab
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1, v0}, Lorg/apache/commons/net/telnet/TelnetClient;->_processDo(I)V

    .line 249
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetClient;->_flushOutputStream()V

    .line 250
    monitor-exit v2
    :try_end_b6
    .catchall {:try_start_ab .. :try_end_b6} :catchall_ba

    .line 251
    iput v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto/16 :goto_2

    .line 250
    :catchall_ba
    move-exception v1

    :try_start_bb
    monitor-exit v2
    :try_end_bc
    .catchall {:try_start_bb .. :try_end_bc} :catchall_ba

    throw v1

    .line 254
    :pswitch_bd
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    monitor-enter v2

    .line 256
    :try_start_c0
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1, v0}, Lorg/apache/commons/net/telnet/TelnetClient;->_processDont(I)V

    .line 257
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetClient;->_flushOutputStream()V

    .line 258
    monitor-exit v2
    :try_end_cb
    .catchall {:try_start_c0 .. :try_end_cb} :catchall_cf

    .line 259
    iput v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto/16 :goto_2

    .line 258
    :catchall_cf
    move-exception v1

    :try_start_d0
    monitor-exit v2
    :try_end_d1
    .catchall {:try_start_d0 .. :try_end_d1} :catchall_cf

    throw v1

    .line 263
    :pswitch_d2
    packed-switch v0, :pswitch_data_15e

    .line 270
    iget v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption_count:I

    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption:[I

    array-length v2, v2

    if-ge v1, v2, :cond_e6

    .line 271
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption:[I

    iget v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption_count:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption_count:I

    aput v0, v1, v2

    .line 275
    :cond_e6
    iput v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto/16 :goto_2

    .line 266
    :pswitch_ea
    const/16 v1, 0x9

    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto/16 :goto_2

    .line 278
    :pswitch_f0
    sparse-switch v0, :sswitch_data_164

    .line 296
    :cond_f3
    :goto_f3
    iput v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto/16 :goto_2

    .line 281
    :sswitch_f7
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    monitor-enter v2

    .line 283
    :try_start_fa
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    iget-object v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption:[I

    iget v4, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption_count:I

    invoke-virtual {v1, v3, v4}, Lorg/apache/commons/net/telnet/TelnetClient;->_processSuboption([II)V

    .line 284
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetClient;->_flushOutputStream()V

    .line 285
    monitor-exit v2
    :try_end_109
    .catchall {:try_start_fa .. :try_end_109} :catchall_10d

    .line 286
    iput v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto/16 :goto_2

    .line 285
    :catchall_10d
    move-exception v1

    :try_start_10e
    monitor-exit v2
    :try_end_10f
    .catchall {:try_start_10e .. :try_end_10f} :catchall_10d

    throw v1

    .line 289
    :sswitch_110
    iget v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption_count:I

    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption:[I

    array-length v2, v2

    if-ge v1, v2, :cond_f3

    .line 290
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption:[I

    iget v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption_count:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption_count:I

    aput v0, v1, v2

    goto :goto_f3

    .line 158
    :pswitch_data_122
    .packed-switch 0x0
        :pswitch_2a
        :pswitch_58
        :pswitch_7e
        :pswitch_93
        :pswitch_a8
        :pswitch_bd
        :pswitch_d2
        :pswitch_29
        :pswitch_35
        :pswitch_f0
    .end packed-switch

    .line 197
    :pswitch_data_13a
    .packed-switch 0xf0
        :pswitch_7b
        :pswitch_5b
        :pswitch_5b
        :pswitch_5b
        :pswitch_5b
        :pswitch_5b
        :pswitch_5b
        :pswitch_5b
        :pswitch_5b
        :pswitch_5b
        :pswitch_73
        :pswitch_63
        :pswitch_67
        :pswitch_6b
        :pswitch_6f
        :pswitch_78
    .end packed-switch

    .line 263
    :pswitch_data_15e
    .packed-switch 0xff
        :pswitch_ea
    .end packed-switch

    .line 278
    :sswitch_data_164
    .sparse-switch
        0xf0 -> :sswitch_f7
        0xff -> :sswitch_110
    .end sparse-switch
.end method


# virtual methods
.method _start()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 94
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__thread:Ljava/lang/Thread;

    if-nez v1, :cond_6

    .line 112
    :goto_5
    return-void

    .line 99
    :cond_6
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__isClosed:Z

    .line 104
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getPriority()I

    move-result v1

    add-int/lit8 v0, v1, 0x1

    .line 105
    .local v0, "priority":I
    const/16 v1, 0xa

    if-le v0, v1, :cond_19

    .line 106
    const/16 v0, 0xa

    .line 108
    :cond_19
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__thread:Ljava/lang/Thread;

    invoke-virtual {v1, v0}, Ljava/lang/Thread;->setPriority(I)V

    .line 109
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__thread:Ljava/lang/Thread;

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 110
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__thread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 111
    iput-boolean v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__threaded:Z

    goto :goto_5
.end method

.method public available()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 562
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    monitor-enter v1

    .line 564
    :try_start_3
    iget-boolean v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__threaded:Z

    if-eqz v0, :cond_b

    .line 565
    iget v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    monitor-exit v1

    .line 567
    :goto_a
    return v0

    :cond_b
    iget v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    invoke-super {p0}, Ljava/io/BufferedInputStream;->available()I

    move-result v2

    add-int/2addr v0, v2

    monitor-exit v1

    goto :goto_a

    .line 569
    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw v0
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 582
    invoke-super {p0}, Ljava/io/BufferedInputStream;->close()V

    .line 584
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    monitor-enter v1

    .line 586
    const/4 v0, 0x1

    :try_start_7
    iput-boolean v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__hasReachedEOF:Z

    .line 587
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__isClosed:Z

    .line 589
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__thread:Ljava/lang/Thread;

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__thread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 591
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__thread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 594
    :cond_1d
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 595
    monitor-exit v1

    .line 597
    return-void

    .line 595
    :catchall_24
    move-exception v0

    monitor-exit v1
    :try_end_26
    .catchall {:try_start_7 .. :try_end_26} :catchall_24

    throw v0
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 555
    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, -0x2

    const/4 v3, -0x1

    .line 365
    iget-object v4, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    monitor-enter v4

    .line 370
    :goto_5
    :try_start_5
    iget-object v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__ioException:Ljava/io/IOException;

    if-eqz v5, :cond_12

    .line 373
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__ioException:Ljava/io/IOException;

    .line 374
    .local v1, "e":Ljava/io/IOException;
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__ioException:Ljava/io/IOException;

    .line 375
    throw v1

    .line 481
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_f
    move-exception v3

    monitor-exit v4
    :try_end_11
    .catchall {:try_start_5 .. :try_end_11} :catchall_f

    throw v3

    .line 378
    :cond_12
    :try_start_12
    iget v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    if-nez v5, :cond_83

    .line 381
    iget-boolean v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__hasReachedEOF:Z

    if-eqz v5, :cond_1d

    .line 382
    monitor-exit v4

    move v0, v3

    .line 478
    :goto_1c
    return v0

    .line 386
    :cond_1d
    iget-boolean v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__threaded:Z

    if-eqz v5, :cond_3b

    .line 388
    iget-object v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    invoke-virtual {v5}, Ljava/lang/Object;->notify()V
    :try_end_26
    .catchall {:try_start_12 .. :try_end_26} :catchall_f

    .line 391
    const/4 v5, 0x1

    :try_start_27
    iput-boolean v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__readIsWaiting:Z

    .line 392
    iget-object v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    invoke-virtual {v5}, Ljava/lang/Object;->wait()V

    .line 393
    const/4 v5, 0x0

    iput-boolean v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__readIsWaiting:Z
    :try_end_31
    .catch Ljava/lang/InterruptedException; {:try_start_27 .. :try_end_31} :catch_32
    .catchall {:try_start_27 .. :try_end_31} :catchall_f

    goto :goto_5

    .line 395
    :catch_32
    move-exception v1

    .line 397
    .local v1, "e":Ljava/lang/InterruptedException;
    :try_start_33
    new-instance v3, Ljava/io/InterruptedIOException;

    const-string v5, "Fatal thread interruption during read."

    invoke-direct {v3, v5}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 403
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :cond_3b
    const/4 v5, 0x1

    iput-boolean v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__readIsWaiting:Z
    :try_end_3e
    .catchall {:try_start_33 .. :try_end_3e} :catchall_f

    .line 405
    const/4 v2, 0x1

    .line 411
    .local v2, "mayBlock":Z
    :cond_3f
    :try_start_3f
    invoke-direct {p0, v2}, Lorg/apache/commons/net/telnet/TelnetInputStream;->__read(Z)I
    :try_end_42
    .catch Ljava/io/InterruptedIOException; {:try_start_3f .. :try_end_42} :catch_49
    .catchall {:try_start_3f .. :try_end_42} :catchall_f

    move-result v0

    .local v0, "ch":I
    if-gez v0, :cond_62

    .line 412
    if-eq v0, v7, :cond_62

    .line 413
    :try_start_47
    monitor-exit v4

    goto :goto_1c

    .line 417
    .end local v0    # "ch":I
    :catch_49
    move-exception v1

    .line 419
    .local v1, "e":Ljava/io/InterruptedIOException;
    iget-object v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    monitor-enter v5
    :try_end_4d
    .catchall {:try_start_47 .. :try_end_4d} :catchall_f

    .line 421
    :try_start_4d
    iput-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__ioException:Ljava/io/IOException;

    .line 422
    iget-object v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    invoke-virtual {v6}, Ljava/lang/Object;->notifyAll()V
    :try_end_54
    .catchall {:try_start_4d .. :try_end_54} :catchall_5f

    .line 425
    :try_start_54
    iget-object v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    const-wide/16 v7, 0x64

    invoke-virtual {v6, v7, v8}, Ljava/lang/Object;->wait(J)V
    :try_end_5b
    .catch Ljava/lang/InterruptedException; {:try_start_54 .. :try_end_5b} :catch_ad
    .catchall {:try_start_54 .. :try_end_5b} :catchall_5f

    .line 430
    :goto_5b
    :try_start_5b
    monitor-exit v5
    :try_end_5c
    .catchall {:try_start_5b .. :try_end_5c} :catchall_5f

    .line 431
    :try_start_5c
    monitor-exit v4
    :try_end_5d
    .catchall {:try_start_5c .. :try_end_5d} :catchall_f

    move v0, v3

    goto :goto_1c

    .line 430
    :catchall_5f
    move-exception v3

    :try_start_60
    monitor-exit v5
    :try_end_61
    .catchall {:try_start_60 .. :try_end_61} :catchall_5f

    :try_start_61
    throw v3
    :try_end_62
    .catchall {:try_start_61 .. :try_end_62} :catchall_f

    .line 437
    .end local v1    # "e":Ljava/io/InterruptedIOException;
    .restart local v0    # "ch":I
    :cond_62
    if-eq v0, v7, :cond_67

    .line 439
    :try_start_64
    invoke-direct {p0, v0}, Lorg/apache/commons/net/telnet/TelnetInputStream;->__processChar(I)Z
    :try_end_67
    .catch Ljava/lang/InterruptedException; {:try_start_64 .. :try_end_67} :catch_7b
    .catchall {:try_start_64 .. :try_end_67} :catchall_f

    .line 451
    :cond_67
    const/4 v2, 0x0

    .line 455
    :try_start_68
    invoke-super {p0}, Ljava/io/BufferedInputStream;->available()I

    move-result v5

    if-lez v5, :cond_77

    iget v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    iget-object v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    array-length v6, v6

    add-int/lit8 v6, v6, -0x1

    if-lt v5, v6, :cond_3f

    .line 457
    :cond_77
    const/4 v5, 0x0

    iput-boolean v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__readIsWaiting:Z

    goto :goto_5

    .line 442
    :catch_7b
    move-exception v1

    .line 444
    .local v1, "e":Ljava/lang/InterruptedException;
    iget-boolean v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__isClosed:Z

    if-eqz v5, :cond_67

    .line 445
    monitor-exit v4

    move v0, v3

    goto :goto_1c

    .line 465
    .end local v0    # "ch":I
    .end local v1    # "e":Ljava/lang/InterruptedException;
    .end local v2    # "mayBlock":Z
    :cond_83
    iget-object v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    iget v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queueHead:I

    aget v0, v3, v5

    .line 467
    .restart local v0    # "ch":I
    iget v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queueHead:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queueHead:I

    iget-object v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    array-length v5, v5

    if-lt v3, v5, :cond_97

    .line 468
    const/4 v3, 0x0

    iput v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queueHead:I

    .line 471
    :cond_97
    iget v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    .line 474
    iget v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    if-nez v3, :cond_aa

    iget-boolean v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__threaded:Z

    if-eqz v3, :cond_aa

    .line 475
    iget-object v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    invoke-virtual {v3}, Ljava/lang/Object;->notify()V

    .line 478
    :cond_aa
    monitor-exit v4
    :try_end_ab
    .catchall {:try_start_68 .. :try_end_ab} :catchall_f

    goto/16 :goto_1c

    .line 427
    .end local v0    # "ch":I
    .local v1, "e":Ljava/io/InterruptedIOException;
    .restart local v2    # "mayBlock":Z
    :catch_ad
    move-exception v6

    goto :goto_5b
.end method

.method public read([B)I
    .registers 4
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 499
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/net/telnet/TelnetInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .registers 10
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    .line 522
    const/4 v4, 0x1

    if-ge p3, v4, :cond_6

    .line 523
    const/4 v3, 0x0

    .line 547
    :cond_5
    :goto_5
    return v3

    .line 527
    :cond_6
    iget-object v4, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    monitor-enter v4

    .line 529
    :try_start_9
    iget v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    if-le p3, v5, :cond_f

    .line 530
    iget p3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    .line 532
    :cond_f
    monitor-exit v4
    :try_end_10
    .catchall {:try_start_9 .. :try_end_10} :catchall_2a

    .line 534
    invoke-virtual {p0}, Lorg/apache/commons/net/telnet/TelnetInputStream;->read()I

    move-result v0

    .local v0, "ch":I
    if-eq v0, v3, :cond_5

    .line 538
    move v1, p2

    .line 542
    .local v1, "off":I
    :goto_17
    add-int/lit8 v2, p2, 0x1

    .end local p2    # "offset":I
    .local v2, "offset":I
    int-to-byte v4, v0

    aput-byte v4, p1, p2

    .line 544
    add-int/lit8 p3, p3, -0x1

    if-lez p3, :cond_26

    invoke-virtual {p0}, Lorg/apache/commons/net/telnet/TelnetInputStream;->read()I

    move-result v0

    if-ne v0, v3, :cond_2d

    .line 547
    :cond_26
    sub-int v3, v2, v1

    move p2, v2

    .end local v2    # "offset":I
    .restart local p2    # "offset":I
    goto :goto_5

    .line 532
    .end local v0    # "ch":I
    .end local v1    # "off":I
    :catchall_2a
    move-exception v3

    :try_start_2b
    monitor-exit v4
    :try_end_2c
    .catchall {:try_start_2b .. :try_end_2c} :catchall_2a

    throw v3

    .end local p2    # "offset":I
    .restart local v0    # "ch":I
    .restart local v1    # "off":I
    .restart local v2    # "offset":I
    :cond_2d
    move p2, v2

    .end local v2    # "offset":I
    .restart local p2    # "offset":I
    goto :goto_17
.end method

.method public run()V
    .registers 11

    .prologue
    .line 607
    :cond_0
    :goto_0
    :try_start_0
    iget-boolean v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__isClosed:Z
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_2} :catch_35

    if-nez v6, :cond_b

    .line 611
    const/4 v6, 0x1

    :try_start_5
    invoke-direct {p0, v6}, Lorg/apache/commons/net/telnet/TelnetInputStream;->__read(Z)I
    :try_end_8
    .catch Ljava/io/InterruptedIOException; {:try_start_5 .. :try_end_8} :catch_1e
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_8} :catch_49
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_8} :catch_35

    move-result v0

    .local v0, "ch":I
    if-gez v0, :cond_4e

    .line 671
    .end local v0    # "ch":I
    :cond_b
    :goto_b
    iget-object v7, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    monitor-enter v7

    .line 673
    const/4 v6, 0x1

    :try_start_f
    iput-boolean v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__isClosed:Z

    .line 674
    const/4 v6, 0x1

    iput-boolean v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__hasReachedEOF:Z

    .line 675
    iget-object v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    invoke-virtual {v6}, Ljava/lang/Object;->notify()V

    .line 676
    monitor-exit v7
    :try_end_1a
    .catchall {:try_start_f .. :try_end_1a} :catchall_64

    .line 678
    const/4 v6, 0x0

    iput-boolean v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__threaded:Z

    .line 679
    return-void

    .line 615
    :catch_1e
    move-exception v1

    .line 617
    .local v1, "e":Ljava/io/InterruptedIOException;
    :try_start_1f
    iget-object v7, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    monitor-enter v7
    :try_end_22
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_22} :catch_35

    .line 619
    :try_start_22
    iput-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__ioException:Ljava/io/IOException;

    .line 620
    iget-object v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    invoke-virtual {v6}, Ljava/lang/Object;->notifyAll()V
    :try_end_29
    .catchall {:try_start_22 .. :try_end_29} :catchall_32

    .line 623
    :try_start_29
    iget-object v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    const-wide/16 v8, 0x64

    invoke-virtual {v6, v8, v9}, Ljava/lang/Object;->wait(J)V
    :try_end_30
    .catch Ljava/lang/InterruptedException; {:try_start_29 .. :try_end_30} :catch_42
    .catchall {:try_start_29 .. :try_end_30} :catchall_32

    .line 631
    :cond_30
    :try_start_30
    monitor-exit v7

    goto :goto_0

    .line 632
    :catchall_32
    move-exception v6

    monitor-exit v7
    :try_end_34
    .catchall {:try_start_30 .. :try_end_34} :catchall_32

    :try_start_34
    throw v6
    :try_end_35
    .catch Ljava/io/IOException; {:try_start_34 .. :try_end_35} :catch_35

    .line 662
    .end local v1    # "e":Ljava/io/InterruptedIOException;
    :catch_35
    move-exception v3

    .line 664
    .local v3, "ioe":Ljava/io/IOException;
    iget-object v7, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    monitor-enter v7

    .line 666
    :try_start_39
    iput-object v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__ioException:Ljava/io/IOException;

    .line 667
    monitor-exit v7
    :try_end_3c
    .catchall {:try_start_39 .. :try_end_3c} :catchall_61

    .line 668
    iget-object v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v6}, Lorg/apache/commons/net/telnet/TelnetClient;->notifyInputListener()V

    goto :goto_b

    .line 625
    .end local v3    # "ioe":Ljava/io/IOException;
    .restart local v1    # "e":Ljava/io/InterruptedIOException;
    :catch_42
    move-exception v2

    .line 627
    .local v2, "interrupted":Ljava/lang/InterruptedException;
    :try_start_43
    iget-boolean v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__isClosed:Z

    if-eqz v6, :cond_30

    .line 628
    monitor-exit v7
    :try_end_48
    .catchall {:try_start_43 .. :try_end_48} :catchall_32

    goto :goto_b

    .line 633
    .end local v1    # "e":Ljava/io/InterruptedIOException;
    .end local v2    # "interrupted":Ljava/lang/InterruptedException;
    :catch_49
    move-exception v5

    .line 637
    .local v5, "re":Ljava/lang/RuntimeException;
    :try_start_4a
    invoke-super {p0}, Ljava/io/BufferedInputStream;->close()V
    :try_end_4d
    .catch Ljava/io/IOException; {:try_start_4a .. :try_end_4d} :catch_35

    goto :goto_b

    .line 644
    .end local v5    # "re":Ljava/lang/RuntimeException;
    .restart local v0    # "ch":I
    :cond_4e
    const/4 v4, 0x0

    .line 647
    .local v4, "notify":Z
    :try_start_4f
    invoke-direct {p0, v0}, Lorg/apache/commons/net/telnet/TelnetInputStream;->__processChar(I)Z
    :try_end_52
    .catch Ljava/lang/InterruptedException; {:try_start_4f .. :try_end_52} :catch_5b
    .catch Ljava/io/IOException; {:try_start_4f .. :try_end_52} :catch_35

    move-result v4

    .line 657
    :cond_53
    if-eqz v4, :cond_0

    .line 658
    :try_start_55
    iget-object v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v6}, Lorg/apache/commons/net/telnet/TelnetClient;->notifyInputListener()V

    goto :goto_0

    .line 649
    :catch_5b
    move-exception v1

    .line 651
    .local v1, "e":Ljava/lang/InterruptedException;
    iget-boolean v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__isClosed:Z
    :try_end_5e
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_5e} :catch_35

    if-eqz v6, :cond_53

    goto :goto_b

    .line 667
    .end local v0    # "ch":I
    .end local v1    # "e":Ljava/lang/InterruptedException;
    .end local v4    # "notify":Z
    .restart local v3    # "ioe":Ljava/io/IOException;
    :catchall_61
    move-exception v6

    :try_start_62
    monitor-exit v7
    :try_end_63
    .catchall {:try_start_62 .. :try_end_63} :catchall_61

    throw v6

    .line 676
    .end local v3    # "ioe":Ljava/io/IOException;
    :catchall_64
    move-exception v6

    :try_start_65
    monitor-exit v7
    :try_end_66
    .catchall {:try_start_65 .. :try_end_66} :catchall_64

    throw v6
.end method
