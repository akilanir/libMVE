.class public Lzmq/Options;
.super Ljava/lang/Object;
.source "Options.java"


# instance fields
.field affinity:J

.field backlog:I

.field decoder:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Lzmq/DecoderBase;",
            ">;"
        }
    .end annotation
.end field

.field delayAttachOnConnect:I

.field delayOnClose:Z

.field delayOnDisconnect:Z

.field encoder:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Lzmq/EncoderBase;",
            ">;"
        }
    .end annotation
.end field

.field filter:Z

.field identity:[B

.field identitySize:B

.field ipv4only:I

.field lastEndpoint:Ljava/lang/String;

.field linger:I

.field maxMsgSize:J

.field multicastHops:I

.field rate:I

.field rcvbuf:I

.field reconnectIvl:I

.field reconnectIvlMax:I

.field recoveryIvl:I

.field recvHwm:I

.field recvIdentity:Z

.field recvTimeout:I

.field sendHwm:I

.field sendTimeout:I

.field sndbuf:I

.field socketId:I

.field final tcpAcceptFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lzmq/TcpAddress$TcpAddressMask;",
            ">;"
        }
    .end annotation
.end field

.field tcpKeepAlive:I

.field tcpKeepAliveCnt:I

.field tcpKeepAliveIdle:I

.field tcpKeepAliveIntvl:I

.field type:I


# direct methods
.method public constructor <init>()V
    .registers 8

    .prologue
    const/4 v6, 0x0

    const/16 v5, 0x64

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 121
    const/16 v0, 0x3e8

    iput v0, p0, Lzmq/Options;->sendHwm:I

    .line 122
    const/16 v0, 0x3e8

    iput v0, p0, Lzmq/Options;->recvHwm:I

    .line 123
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lzmq/Options;->affinity:J

    .line 124
    iput-byte v3, p0, Lzmq/Options;->identitySize:B

    .line 125
    iput v5, p0, Lzmq/Options;->rate:I

    .line 126
    const/16 v0, 0x2710

    iput v0, p0, Lzmq/Options;->recoveryIvl:I

    .line 127
    iput v4, p0, Lzmq/Options;->multicastHops:I

    .line 128
    iput v3, p0, Lzmq/Options;->sndbuf:I

    .line 129
    iput v3, p0, Lzmq/Options;->rcvbuf:I

    .line 130
    iput v2, p0, Lzmq/Options;->type:I

    .line 131
    iput v2, p0, Lzmq/Options;->linger:I

    .line 132
    iput v5, p0, Lzmq/Options;->reconnectIvl:I

    .line 133
    iput v3, p0, Lzmq/Options;->reconnectIvlMax:I

    .line 134
    iput v5, p0, Lzmq/Options;->backlog:I

    .line 135
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lzmq/Options;->maxMsgSize:J

    .line 136
    iput v2, p0, Lzmq/Options;->recvTimeout:I

    .line 137
    iput v2, p0, Lzmq/Options;->sendTimeout:I

    .line 138
    iput v4, p0, Lzmq/Options;->ipv4only:I

    .line 139
    iput v3, p0, Lzmq/Options;->delayAttachOnConnect:I

    .line 140
    iput-boolean v4, p0, Lzmq/Options;->delayOnClose:Z

    .line 141
    iput-boolean v4, p0, Lzmq/Options;->delayOnDisconnect:Z

    .line 142
    iput-boolean v3, p0, Lzmq/Options;->filter:Z

    .line 143
    iput-boolean v3, p0, Lzmq/Options;->recvIdentity:Z

    .line 144
    iput v2, p0, Lzmq/Options;->tcpKeepAlive:I

    .line 145
    iput v2, p0, Lzmq/Options;->tcpKeepAliveCnt:I

    .line 146
    iput v2, p0, Lzmq/Options;->tcpKeepAliveIdle:I

    .line 147
    iput v2, p0, Lzmq/Options;->tcpKeepAliveIntvl:I

    .line 148
    iput v3, p0, Lzmq/Options;->socketId:I

    .line 150
    iput-object v6, p0, Lzmq/Options;->identity:[B

    .line 151
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lzmq/Options;->tcpAcceptFilters:Ljava/util/List;

    .line 152
    iput-object v6, p0, Lzmq/Options;->decoder:Ljava/lang/Class;

    .line 153
    iput-object v6, p0, Lzmq/Options;->encoder:Ljava/lang/Class;

    .line 154
    return-void
.end method


# virtual methods
.method public getsockopt(I)Ljava/lang/Object;
    .registers 5
    .param p1, "option"    # I

    .prologue
    .line 342
    packed-switch p1, :pswitch_data_b0

    .line 413
    :pswitch_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "option="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 344
    :pswitch_1c
    iget v0, p0, Lzmq/Options;->sendHwm:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 410
    :goto_22
    return-object v0

    .line 347
    :pswitch_23
    iget v0, p0, Lzmq/Options;->recvHwm:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_22

    .line 350
    :pswitch_2a
    iget-wide v0, p0, Lzmq/Options;->affinity:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto :goto_22

    .line 353
    :pswitch_31
    iget-object v0, p0, Lzmq/Options;->identity:[B

    goto :goto_22

    .line 356
    :pswitch_34
    iget v0, p0, Lzmq/Options;->rate:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_22

    .line 359
    :pswitch_3b
    iget v0, p0, Lzmq/Options;->recoveryIvl:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_22

    .line 362
    :pswitch_42
    iget v0, p0, Lzmq/Options;->sndbuf:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_22

    .line 365
    :pswitch_49
    iget v0, p0, Lzmq/Options;->rcvbuf:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_22

    .line 368
    :pswitch_50
    iget v0, p0, Lzmq/Options;->type:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_22

    .line 371
    :pswitch_57
    iget v0, p0, Lzmq/Options;->linger:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_22

    .line 374
    :pswitch_5e
    iget v0, p0, Lzmq/Options;->reconnectIvl:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_22

    .line 377
    :pswitch_65
    iget v0, p0, Lzmq/Options;->reconnectIvlMax:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_22

    .line 380
    :pswitch_6c
    iget v0, p0, Lzmq/Options;->backlog:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_22

    .line 383
    :pswitch_73
    iget-wide v0, p0, Lzmq/Options;->maxMsgSize:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto :goto_22

    .line 386
    :pswitch_7a
    iget v0, p0, Lzmq/Options;->multicastHops:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_22

    .line 389
    :pswitch_81
    iget v0, p0, Lzmq/Options;->recvTimeout:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_22

    .line 392
    :pswitch_88
    iget v0, p0, Lzmq/Options;->sendTimeout:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_22

    .line 395
    :pswitch_8f
    iget v0, p0, Lzmq/Options;->ipv4only:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_22

    .line 398
    :pswitch_96
    iget v0, p0, Lzmq/Options;->tcpKeepAlive:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_22

    .line 401
    :pswitch_9d
    iget v0, p0, Lzmq/Options;->delayAttachOnConnect:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_22

    .line 407
    :pswitch_a5
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_22

    .line 410
    :pswitch_ac
    iget-object v0, p0, Lzmq/Options;->lastEndpoint:Ljava/lang/String;

    goto/16 :goto_22

    .line 342
    :pswitch_data_b0
    .packed-switch 0x4
        :pswitch_2a
        :pswitch_31
        :pswitch_3
        :pswitch_3
        :pswitch_34
        :pswitch_3b
        :pswitch_3
        :pswitch_42
        :pswitch_49
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_50
        :pswitch_57
        :pswitch_5e
        :pswitch_6c
        :pswitch_3
        :pswitch_65
        :pswitch_73
        :pswitch_1c
        :pswitch_23
        :pswitch_7a
        :pswitch_3
        :pswitch_81
        :pswitch_88
        :pswitch_3
        :pswitch_3
        :pswitch_8f
        :pswitch_ac
        :pswitch_3
        :pswitch_96
        :pswitch_a5
        :pswitch_a5
        :pswitch_a5
        :pswitch_3
        :pswitch_9d
    .end packed-switch
.end method

.method public setSocketOpt(ILjava/lang/Object;)V
    .registers 11
    .param p1, "option"    # I
    .param p2, "optval"    # Ljava/lang/Object;

    .prologue
    const/16 v7, 0xff

    const/4 v6, -0x1

    const/4 v5, 0x1

    .line 159
    sparse-switch p1, :sswitch_data_2c4

    .line 336
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unknown Option "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    :sswitch_20
    move-object v4, p2

    .line 161
    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lzmq/Options;->sendHwm:I

    .line 162
    iget v4, p0, Lzmq/Options;->sendHwm:I

    if-gez v4, :cond_74

    .line 163
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "sendHwm "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    :sswitch_46
    move-object v4, p2

    .line 168
    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lzmq/Options;->recvHwm:I

    .line 169
    iget v4, p0, Lzmq/Options;->recvHwm:I

    if-gez v4, :cond_74

    .line 170
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "recvHwm "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 175
    :sswitch_6c
    check-cast p2, Ljava/lang/Long;

    .end local p2    # "optval":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iput-wide v4, p0, Lzmq/Options;->affinity:J

    .line 333
    :cond_74
    :goto_74
    :sswitch_74
    return-void

    .line 181
    .restart local p2    # "optval":Ljava/lang/Object;
    :sswitch_75
    instance-of v4, p2, Ljava/lang/String;

    if-eqz v4, :cond_a0

    move-object v4, p2

    .line 182
    check-cast v4, Ljava/lang/String;

    sget-object v5, Lzmq/ZMQ;->CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v3

    .line 191
    .local v3, "val":[B
    :goto_82
    if-eqz v3, :cond_87

    array-length v4, v3

    if-le v4, v7, :cond_c4

    .line 192
    :cond_87
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "identity must not be null or less than 255 "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 184
    .end local v3    # "val":[B
    :cond_a0
    instance-of v4, p2, [B

    if-eqz v4, :cond_ab

    move-object v4, p2

    .line 185
    check-cast v4, [B

    move-object v3, v4

    check-cast v3, [B

    .restart local v3    # "val":[B
    goto :goto_82

    .line 188
    .end local v3    # "val":[B
    :cond_ab
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "identity "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 194
    .restart local v3    # "val":[B
    :cond_c4
    array-length v4, v3

    invoke-static {v3, v4}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v4

    iput-object v4, p0, Lzmq/Options;->identity:[B

    .line 195
    iget-object v4, p0, Lzmq/Options;->identity:[B

    array-length v4, v4

    int-to-byte v4, v4

    iput-byte v4, p0, Lzmq/Options;->identitySize:B

    goto :goto_74

    .line 199
    .end local v3    # "val":[B
    :sswitch_d2
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "optval":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lzmq/Options;->rate:I

    goto :goto_74

    .line 203
    .restart local p2    # "optval":Ljava/lang/Object;
    :sswitch_db
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "optval":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lzmq/Options;->recoveryIvl:I

    goto :goto_74

    .line 207
    .restart local p2    # "optval":Ljava/lang/Object;
    :sswitch_e4
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "optval":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lzmq/Options;->sndbuf:I

    goto :goto_74

    .line 211
    .restart local p2    # "optval":Ljava/lang/Object;
    :sswitch_ed
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "optval":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lzmq/Options;->rcvbuf:I

    goto/16 :goto_74

    .line 215
    .restart local p2    # "optval":Ljava/lang/Object;
    :sswitch_f7
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "optval":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lzmq/Options;->linger:I

    goto/16 :goto_74

    .restart local p2    # "optval":Ljava/lang/Object;
    :sswitch_101
    move-object v4, p2

    .line 219
    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lzmq/Options;->reconnectIvl:I

    .line 221
    iget v4, p0, Lzmq/Options;->reconnectIvl:I

    if-ge v4, v6, :cond_74

    .line 222
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "reconnectIvl "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    :sswitch_127
    move-object v4, p2

    .line 228
    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lzmq/Options;->reconnectIvlMax:I

    .line 230
    iget v4, p0, Lzmq/Options;->reconnectIvlMax:I

    if-gez v4, :cond_74

    .line 231
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "reconnectIvlMax "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 237
    :sswitch_14d
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "optval":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lzmq/Options;->backlog:I

    goto/16 :goto_74

    .line 241
    .restart local p2    # "optval":Ljava/lang/Object;
    :sswitch_157
    check-cast p2, Ljava/lang/Long;

    .end local p2    # "optval":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iput-wide v4, p0, Lzmq/Options;->maxMsgSize:J

    goto/16 :goto_74

    .line 245
    .restart local p2    # "optval":Ljava/lang/Object;
    :sswitch_161
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "optval":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lzmq/Options;->multicastHops:I

    goto/16 :goto_74

    .line 249
    .restart local p2    # "optval":Ljava/lang/Object;
    :sswitch_16b
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "optval":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lzmq/Options;->recvTimeout:I

    goto/16 :goto_74

    .line 253
    .restart local p2    # "optval":Ljava/lang/Object;
    :sswitch_175
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "optval":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lzmq/Options;->sendTimeout:I

    goto/16 :goto_74

    .restart local p2    # "optval":Ljava/lang/Object;
    :sswitch_17f
    move-object v4, p2

    .line 258
    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lzmq/Options;->ipv4only:I

    .line 259
    iget v4, p0, Lzmq/Options;->ipv4only:I

    if-eqz v4, :cond_74

    iget v4, p0, Lzmq/Options;->ipv4only:I

    if-eq v4, v5, :cond_74

    .line 260
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ipv4only only accepts 0 or 1 "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    :sswitch_1a9
    move-object v4, p2

    .line 266
    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lzmq/Options;->tcpKeepAlive:I

    .line 267
    iget v4, p0, Lzmq/Options;->tcpKeepAlive:I

    if-eq v4, v6, :cond_74

    iget v4, p0, Lzmq/Options;->tcpKeepAlive:I

    if-eqz v4, :cond_74

    iget v4, p0, Lzmq/Options;->tcpKeepAlive:I

    if-eq v4, v5, :cond_74

    .line 268
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "tcpKeepAlive only accepts one of -1,0,1 "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    :sswitch_1d7
    move-object v4, p2

    .line 274
    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lzmq/Options;->delayAttachOnConnect:I

    .line 275
    iget v4, p0, Lzmq/Options;->delayAttachOnConnect:I

    if-eqz v4, :cond_74

    iget v4, p0, Lzmq/Options;->delayAttachOnConnect:I

    if-eq v4, v5, :cond_74

    .line 276
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "delayAttachOnConnect only accept 0 or 1 "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    :sswitch_201
    move-object v2, p2

    .line 287
    check-cast v2, Ljava/lang/String;

    .line 288
    .local v2, "filterStr":Ljava/lang/String;
    if-nez v2, :cond_20d

    .line 289
    iget-object v4, p0, Lzmq/Options;->tcpAcceptFilters:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    goto/16 :goto_74

    .line 291
    :cond_20d
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_219

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-le v4, v7, :cond_232

    .line 292
    :cond_219
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "tcp_accept_filter "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 295
    :cond_232
    new-instance v1, Lzmq/TcpAddress$TcpAddressMask;

    invoke-direct {v1}, Lzmq/TcpAddress$TcpAddressMask;-><init>()V

    .line 296
    .local v1, "filter":Lzmq/TcpAddress$TcpAddressMask;
    iget v4, p0, Lzmq/Options;->ipv4only:I

    if-ne v4, v5, :cond_246

    move v4, v5

    :goto_23c
    invoke-virtual {v1, v2, v4}, Lzmq/TcpAddress$TcpAddressMask;->resolve(Ljava/lang/String;Z)V

    .line 297
    iget-object v4, p0, Lzmq/Options;->tcpAcceptFilters:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_74

    .line 296
    :cond_246
    const/4 v4, 0x0

    goto :goto_23c

    .line 302
    .end local v1    # "filter":Lzmq/TcpAddress$TcpAddressMask;
    .end local v2    # "filterStr":Ljava/lang/String;
    :sswitch_248
    instance-of v4, p2, Ljava/lang/String;

    if-eqz v4, :cond_263

    .line 304
    :try_start_24c
    check-cast p2, Ljava/lang/String;

    .end local p2    # "optval":Ljava/lang/Object;
    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-class v5, Lzmq/EncoderBase;

    invoke-virtual {v4, v5}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v4

    iput-object v4, p0, Lzmq/Options;->encoder:Ljava/lang/Class;
    :try_end_25a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_24c .. :try_end_25a} :catch_25c

    goto/16 :goto_74

    .line 306
    :catch_25c
    move-exception v0

    .line 307
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 310
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    .restart local p2    # "optval":Ljava/lang/Object;
    :cond_263
    instance-of v4, p2, Ljava/lang/Class;

    if-eqz v4, :cond_26d

    .line 311
    check-cast p2, Ljava/lang/Class;

    .end local p2    # "optval":Ljava/lang/Object;
    iput-object p2, p0, Lzmq/Options;->encoder:Ljava/lang/Class;

    goto/16 :goto_74

    .line 314
    .restart local p2    # "optval":Ljava/lang/Object;
    :cond_26d
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "encoder "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 319
    :sswitch_286
    instance-of v4, p2, Ljava/lang/String;

    if-eqz v4, :cond_2a1

    .line 321
    :try_start_28a
    check-cast p2, Ljava/lang/String;

    .end local p2    # "optval":Ljava/lang/Object;
    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-class v5, Lzmq/DecoderBase;

    invoke-virtual {v4, v5}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v4

    iput-object v4, p0, Lzmq/Options;->decoder:Ljava/lang/Class;
    :try_end_298
    .catch Ljava/lang/ClassNotFoundException; {:try_start_28a .. :try_end_298} :catch_29a

    goto/16 :goto_74

    .line 323
    :catch_29a
    move-exception v0

    .line 324
    .restart local v0    # "e":Ljava/lang/ClassNotFoundException;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 327
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    .restart local p2    # "optval":Ljava/lang/Object;
    :cond_2a1
    instance-of v4, p2, Ljava/lang/Class;

    if-eqz v4, :cond_2ab

    .line 328
    check-cast p2, Ljava/lang/Class;

    .end local p2    # "optval":Ljava/lang/Object;
    iput-object p2, p0, Lzmq/Options;->decoder:Ljava/lang/Class;

    goto/16 :goto_74

    .line 331
    .restart local p2    # "optval":Ljava/lang/Object;
    :cond_2ab
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "decoder "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 159
    :sswitch_data_2c4
    .sparse-switch
        0x4 -> :sswitch_6c
        0x5 -> :sswitch_75
        0x8 -> :sswitch_d2
        0x9 -> :sswitch_db
        0xb -> :sswitch_e4
        0xc -> :sswitch_ed
        0x11 -> :sswitch_f7
        0x12 -> :sswitch_101
        0x13 -> :sswitch_14d
        0x15 -> :sswitch_127
        0x16 -> :sswitch_157
        0x17 -> :sswitch_20
        0x18 -> :sswitch_46
        0x19 -> :sswitch_161
        0x1b -> :sswitch_16b
        0x1c -> :sswitch_175
        0x1f -> :sswitch_17f
        0x22 -> :sswitch_1a9
        0x23 -> :sswitch_74
        0x24 -> :sswitch_74
        0x25 -> :sswitch_74
        0x26 -> :sswitch_201
        0x27 -> :sswitch_1d7
        0x3e9 -> :sswitch_248
        0x3ea -> :sswitch_286
    .end sparse-switch
.end method
