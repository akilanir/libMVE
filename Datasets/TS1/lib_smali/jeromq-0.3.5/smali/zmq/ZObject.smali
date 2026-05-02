.class public abstract Lzmq/ZObject;
.super Ljava/lang/Object;
.source "ZObject.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/ZObject$1;
    }
.end annotation


# instance fields
.field private final ctx:Lzmq/Ctx;

.field private final tid:I


# direct methods
.method protected constructor <init>(Lzmq/Ctx;I)V
    .registers 3
    .param p1, "ctx"    # Lzmq/Ctx;
    .param p2, "tid"    # I

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lzmq/ZObject;->ctx:Lzmq/Ctx;

    .line 35
    iput p2, p0, Lzmq/ZObject;->tid:I

    .line 36
    return-void
.end method

.method protected constructor <init>(Lzmq/ZObject;)V
    .registers 4
    .param p1, "parent"    # Lzmq/ZObject;

    .prologue
    .line 40
    iget-object v0, p1, Lzmq/ZObject;->ctx:Lzmq/Ctx;

    iget v1, p1, Lzmq/ZObject;->tid:I

    invoke-direct {p0, v0, v1}, Lzmq/ZObject;-><init>(Lzmq/Ctx;I)V

    .line 41
    return-void
.end method

.method private sendCommand(Lzmq/Command;)V
    .registers 4
    .param p1, "cmd"    # Lzmq/Command;

    .prologue
    .line 362
    iget-object v0, p0, Lzmq/ZObject;->ctx:Lzmq/Ctx;

    invoke-virtual {p1}, Lzmq/Command;->destination()Lzmq/ZObject;

    move-result-object v1

    invoke-virtual {v1}, Lzmq/ZObject;->getTid()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Lzmq/Ctx;->sendCommand(ILzmq/Command;)V

    .line 363
    return-void
.end method


# virtual methods
.method protected chooseIoThread(J)Lzmq/IOThread;
    .registers 4
    .param p1, "affinity"    # J

    .prologue
    .line 148
    iget-object v0, p0, Lzmq/ZObject;->ctx:Lzmq/Ctx;

    invoke-virtual {v0, p1, p2}, Lzmq/Ctx;->chooseIoThread(J)Lzmq/IOThread;

    move-result-object v0

    return-object v0
.end method

.method protected destroySocket(Lzmq/SocketBase;)V
    .registers 3
    .param p1, "socket"    # Lzmq/SocketBase;

    .prologue
    .line 142
    iget-object v0, p0, Lzmq/ZObject;->ctx:Lzmq/Ctx;

    invoke-virtual {v0, p1}, Lzmq/Ctx;->destroySocket(Lzmq/SocketBase;)V

    .line 143
    return-void
.end method

.method protected findEndpoint(Ljava/lang/String;)Lzmq/Ctx$Endpoint;
    .registers 3
    .param p1, "addr"    # Ljava/lang/String;

    .prologue
    .line 137
    iget-object v0, p0, Lzmq/ZObject;->ctx:Lzmq/Ctx;

    invoke-virtual {v0, p1}, Lzmq/Ctx;->findEndpoint(Ljava/lang/String;)Lzmq/Ctx$Endpoint;

    move-result-object v0

    return-object v0
.end method

.method protected getCtx()Lzmq/Ctx;
    .registers 2

    .prologue
    .line 50
    iget-object v0, p0, Lzmq/ZObject;->ctx:Lzmq/Ctx;

    return-object v0
.end method

.method protected getTid()I
    .registers 2

    .prologue
    .line 45
    iget v0, p0, Lzmq/ZObject;->tid:I

    return v0
.end method

.method protected processActivateRead()V
    .registers 2

    .prologue
    .line 304
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected processActivateWrite(J)V
    .registers 4
    .param p1, "msgsRead"    # J

    .prologue
    .line 309
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected processAttach(Lzmq/IEngine;)V
    .registers 3
    .param p1, "engine"    # Lzmq/IEngine;

    .prologue
    .line 294
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected processBind(Lzmq/Pipe;)V
    .registers 3
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 299
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected processCommand(Lzmq/Command;)V
    .registers 4
    .param p1, "cmd"    # Lzmq/Command;

    .prologue
    .line 55
    sget-object v0, Lzmq/ZObject$1;->$SwitchMap$zmq$Command$Type:[I

    invoke-virtual {p1}, Lzmq/Command;->type()Lzmq/Command$Type;

    move-result-object v1

    invoke-virtual {v1}, Lzmq/Command$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_84

    .line 121
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 57
    :pswitch_15
    invoke-virtual {p0}, Lzmq/ZObject;->processActivateRead()V

    .line 123
    :goto_18
    return-void

    .line 61
    :pswitch_19
    iget-object v0, p1, Lzmq/Command;->arg:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lzmq/ZObject;->processActivateWrite(J)V

    goto :goto_18

    .line 65
    :pswitch_25
    invoke-virtual {p0}, Lzmq/ZObject;->processStop()V

    goto :goto_18

    .line 69
    :pswitch_29
    invoke-virtual {p0}, Lzmq/ZObject;->processPlug()V

    .line 70
    invoke-virtual {p0}, Lzmq/ZObject;->processSeqnum()V

    goto :goto_18

    .line 74
    :pswitch_30
    iget-object v0, p1, Lzmq/Command;->arg:Ljava/lang/Object;

    check-cast v0, Lzmq/Own;

    invoke-virtual {p0, v0}, Lzmq/ZObject;->processOwn(Lzmq/Own;)V

    .line 75
    invoke-virtual {p0}, Lzmq/ZObject;->processSeqnum()V

    goto :goto_18

    .line 79
    :pswitch_3b
    iget-object v0, p1, Lzmq/Command;->arg:Ljava/lang/Object;

    check-cast v0, Lzmq/IEngine;

    invoke-virtual {p0, v0}, Lzmq/ZObject;->processAttach(Lzmq/IEngine;)V

    .line 80
    invoke-virtual {p0}, Lzmq/ZObject;->processSeqnum()V

    goto :goto_18

    .line 84
    :pswitch_46
    iget-object v0, p1, Lzmq/Command;->arg:Ljava/lang/Object;

    check-cast v0, Lzmq/Pipe;

    invoke-virtual {p0, v0}, Lzmq/ZObject;->processBind(Lzmq/Pipe;)V

    .line 85
    invoke-virtual {p0}, Lzmq/ZObject;->processSeqnum()V

    goto :goto_18

    .line 89
    :pswitch_51
    iget-object v0, p1, Lzmq/Command;->arg:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lzmq/ZObject;->processHiccup(Ljava/lang/Object;)V

    goto :goto_18

    .line 93
    :pswitch_57
    invoke-virtual {p0}, Lzmq/ZObject;->processPipeTerm()V

    goto :goto_18

    .line 97
    :pswitch_5b
    invoke-virtual {p0}, Lzmq/ZObject;->processPipeTermAck()V

    goto :goto_18

    .line 101
    :pswitch_5f
    iget-object v0, p1, Lzmq/Command;->arg:Ljava/lang/Object;

    check-cast v0, Lzmq/Own;

    invoke-virtual {p0, v0}, Lzmq/ZObject;->processTermReq(Lzmq/Own;)V

    goto :goto_18

    .line 105
    :pswitch_67
    iget-object v0, p1, Lzmq/Command;->arg:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, v0}, Lzmq/ZObject;->processTerm(I)V

    goto :goto_18

    .line 109
    :pswitch_73
    invoke-virtual {p0}, Lzmq/ZObject;->processTermAck()V

    goto :goto_18

    .line 113
    :pswitch_77
    iget-object v0, p1, Lzmq/Command;->arg:Ljava/lang/Object;

    check-cast v0, Lzmq/SocketBase;

    invoke-virtual {p0, v0}, Lzmq/ZObject;->processReap(Lzmq/SocketBase;)V

    goto :goto_18

    .line 117
    :pswitch_7f
    invoke-virtual {p0}, Lzmq/ZObject;->processReaped()V

    goto :goto_18

    .line 55
    nop

    :pswitch_data_84
    .packed-switch 0x1
        :pswitch_15
        :pswitch_19
        :pswitch_25
        :pswitch_29
        :pswitch_30
        :pswitch_3b
        :pswitch_46
        :pswitch_51
        :pswitch_57
        :pswitch_5b
        :pswitch_5f
        :pswitch_67
        :pswitch_73
        :pswitch_77
        :pswitch_7f
    .end packed-switch
.end method

.method protected processHiccup(Ljava/lang/Object;)V
    .registers 3
    .param p1, "hiccupPipe"    # Ljava/lang/Object;

    .prologue
    .line 314
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected processOwn(Lzmq/Own;)V
    .registers 3
    .param p1, "object"    # Lzmq/Own;

    .prologue
    .line 289
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected processPipeTerm()V
    .registers 2

    .prologue
    .line 319
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected processPipeTermAck()V
    .registers 2

    .prologue
    .line 324
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected processPlug()V
    .registers 2

    .prologue
    .line 284
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected processReap(Lzmq/SocketBase;)V
    .registers 3
    .param p1, "socket"    # Lzmq/SocketBase;

    .prologue
    .line 344
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected processReaped()V
    .registers 2

    .prologue
    .line 349
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected processSeqnum()V
    .registers 2

    .prologue
    .line 357
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected processStop()V
    .registers 2

    .prologue
    .line 279
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected processTerm(I)V
    .registers 3
    .param p1, "linger"    # I

    .prologue
    .line 334
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected processTermAck()V
    .registers 2

    .prologue
    .line 339
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected processTermReq(Lzmq/Own;)V
    .registers 3
    .param p1, "object"    # Lzmq/Own;

    .prologue
    .line 329
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected registerEndpoint(Ljava/lang/String;Lzmq/Ctx$Endpoint;)Z
    .registers 4
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "endpoint"    # Lzmq/Ctx$Endpoint;

    .prologue
    .line 127
    iget-object v0, p0, Lzmq/ZObject;->ctx:Lzmq/Ctx;

    invoke-virtual {v0, p1, p2}, Lzmq/Ctx;->registerEndpoint(Ljava/lang/String;Lzmq/Ctx$Endpoint;)Z

    move-result v0

    return v0
.end method

.method protected sendActivateRead(Lzmq/Pipe;)V
    .registers 4
    .param p1, "destination"    # Lzmq/Pipe;

    .prologue
    .line 213
    new-instance v0, Lzmq/Command;

    sget-object v1, Lzmq/Command$Type;->ACTIVATE_READ:Lzmq/Command$Type;

    invoke-direct {v0, p1, v1}, Lzmq/Command;-><init>(Lzmq/ZObject;Lzmq/Command$Type;)V

    .line 214
    .local v0, "cmd":Lzmq/Command;
    invoke-direct {p0, v0}, Lzmq/ZObject;->sendCommand(Lzmq/Command;)V

    .line 215
    return-void
.end method

.method protected sendActivateWrite(Lzmq/Pipe;J)V
    .registers 7
    .param p1, "destination"    # Lzmq/Pipe;
    .param p2, "msgsRead"    # J

    .prologue
    .line 219
    new-instance v0, Lzmq/Command;

    sget-object v1, Lzmq/Command$Type;->ACTIVATE_WRITE:Lzmq/Command$Type;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {v0, p1, v1, v2}, Lzmq/Command;-><init>(Lzmq/ZObject;Lzmq/Command$Type;Ljava/lang/Object;)V

    .line 220
    .local v0, "cmd":Lzmq/Command;
    invoke-direct {p0, v0}, Lzmq/ZObject;->sendCommand(Lzmq/Command;)V

    .line 221
    return-void
.end method

.method protected sendAttach(Lzmq/SessionBase;Lzmq/IEngine;)V
    .registers 4
    .param p1, "destination"    # Lzmq/SessionBase;
    .param p2, "engine"    # Lzmq/IEngine;

    .prologue
    .line 183
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lzmq/ZObject;->sendAttach(Lzmq/SessionBase;Lzmq/IEngine;Z)V

    .line 184
    return-void
.end method

.method protected sendAttach(Lzmq/SessionBase;Lzmq/IEngine;Z)V
    .registers 6
    .param p1, "destination"    # Lzmq/SessionBase;
    .param p2, "engine"    # Lzmq/IEngine;
    .param p3, "incSeqnum"    # Z

    .prologue
    .line 188
    if-eqz p3, :cond_5

    .line 189
    invoke-virtual {p1}, Lzmq/SessionBase;->incSeqnum()V

    .line 192
    :cond_5
    new-instance v0, Lzmq/Command;

    sget-object v1, Lzmq/Command$Type;->ATTACH:Lzmq/Command$Type;

    invoke-direct {v0, p1, v1, p2}, Lzmq/Command;-><init>(Lzmq/ZObject;Lzmq/Command$Type;Ljava/lang/Object;)V

    .line 193
    .local v0, "cmd":Lzmq/Command;
    invoke-direct {p0, v0}, Lzmq/ZObject;->sendCommand(Lzmq/Command;)V

    .line 194
    return-void
.end method

.method protected sendBind(Lzmq/Own;Lzmq/Pipe;)V
    .registers 4
    .param p1, "destination"    # Lzmq/Own;
    .param p2, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 198
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lzmq/ZObject;->sendBind(Lzmq/Own;Lzmq/Pipe;Z)V

    .line 199
    return-void
.end method

.method protected sendBind(Lzmq/Own;Lzmq/Pipe;Z)V
    .registers 6
    .param p1, "destination"    # Lzmq/Own;
    .param p2, "pipe"    # Lzmq/Pipe;
    .param p3, "incSeqnum"    # Z

    .prologue
    .line 203
    if-eqz p3, :cond_5

    .line 204
    invoke-virtual {p1}, Lzmq/Own;->incSeqnum()V

    .line 207
    :cond_5
    new-instance v0, Lzmq/Command;

    sget-object v1, Lzmq/Command$Type;->BIND:Lzmq/Command$Type;

    invoke-direct {v0, p1, v1, p2}, Lzmq/Command;-><init>(Lzmq/ZObject;Lzmq/Command$Type;Ljava/lang/Object;)V

    .line 208
    .local v0, "cmd":Lzmq/Command;
    invoke-direct {p0, v0}, Lzmq/ZObject;->sendCommand(Lzmq/Command;)V

    .line 209
    return-void
.end method

.method protected sendDone()V
    .registers 4

    .prologue
    .line 273
    new-instance v0, Lzmq/Command;

    const/4 v1, 0x0

    sget-object v2, Lzmq/Command$Type;->DONE:Lzmq/Command$Type;

    invoke-direct {v0, v1, v2}, Lzmq/Command;-><init>(Lzmq/ZObject;Lzmq/Command$Type;)V

    .line 274
    .local v0, "cmd":Lzmq/Command;
    iget-object v1, p0, Lzmq/ZObject;->ctx:Lzmq/Ctx;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Lzmq/Ctx;->sendCommand(ILzmq/Command;)V

    .line 275
    return-void
.end method

.method protected sendHiccup(Lzmq/Pipe;Ljava/lang/Object;)V
    .registers 5
    .param p1, "destination"    # Lzmq/Pipe;
    .param p2, "pipe"    # Ljava/lang/Object;

    .prologue
    .line 225
    new-instance v0, Lzmq/Command;

    sget-object v1, Lzmq/Command$Type;->HICCUP:Lzmq/Command$Type;

    invoke-direct {v0, p1, v1, p2}, Lzmq/Command;-><init>(Lzmq/ZObject;Lzmq/Command$Type;Ljava/lang/Object;)V

    .line 226
    .local v0, "cmd":Lzmq/Command;
    invoke-direct {p0, v0}, Lzmq/ZObject;->sendCommand(Lzmq/Command;)V

    .line 227
    return-void
.end method

.method protected sendOwn(Lzmq/Own;Lzmq/Own;)V
    .registers 5
    .param p1, "destination"    # Lzmq/Own;
    .param p2, "object"    # Lzmq/Own;

    .prologue
    .line 176
    invoke-virtual {p1}, Lzmq/Own;->incSeqnum()V

    .line 177
    new-instance v0, Lzmq/Command;

    sget-object v1, Lzmq/Command$Type;->OWN:Lzmq/Command$Type;

    invoke-direct {v0, p1, v1, p2}, Lzmq/Command;-><init>(Lzmq/ZObject;Lzmq/Command$Type;Ljava/lang/Object;)V

    .line 178
    .local v0, "cmd":Lzmq/Command;
    invoke-direct {p0, v0}, Lzmq/ZObject;->sendCommand(Lzmq/Command;)V

    .line 179
    return-void
.end method

.method protected sendPipeTerm(Lzmq/Pipe;)V
    .registers 4
    .param p1, "destination"    # Lzmq/Pipe;

    .prologue
    .line 231
    new-instance v0, Lzmq/Command;

    sget-object v1, Lzmq/Command$Type;->PIPE_TERM:Lzmq/Command$Type;

    invoke-direct {v0, p1, v1}, Lzmq/Command;-><init>(Lzmq/ZObject;Lzmq/Command$Type;)V

    .line 232
    .local v0, "cmd":Lzmq/Command;
    invoke-direct {p0, v0}, Lzmq/ZObject;->sendCommand(Lzmq/Command;)V

    .line 233
    return-void
.end method

.method protected sendPipeTermAck(Lzmq/Pipe;)V
    .registers 4
    .param p1, "destination"    # Lzmq/Pipe;

    .prologue
    .line 237
    new-instance v0, Lzmq/Command;

    sget-object v1, Lzmq/Command$Type;->PIPE_TERM_ACK:Lzmq/Command$Type;

    invoke-direct {v0, p1, v1}, Lzmq/Command;-><init>(Lzmq/ZObject;Lzmq/Command$Type;)V

    .line 238
    .local v0, "cmd":Lzmq/Command;
    invoke-direct {p0, v0}, Lzmq/ZObject;->sendCommand(Lzmq/Command;)V

    .line 239
    return-void
.end method

.method protected sendPlug(Lzmq/Own;)V
    .registers 3
    .param p1, "destination"    # Lzmq/Own;

    .prologue
    .line 161
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lzmq/ZObject;->sendPlug(Lzmq/Own;Z)V

    .line 162
    return-void
.end method

.method protected sendPlug(Lzmq/Own;Z)V
    .registers 5
    .param p1, "destination"    # Lzmq/Own;
    .param p2, "incSeqnum"    # Z

    .prologue
    .line 166
    if-eqz p2, :cond_5

    .line 167
    invoke-virtual {p1}, Lzmq/Own;->incSeqnum()V

    .line 170
    :cond_5
    new-instance v0, Lzmq/Command;

    sget-object v1, Lzmq/Command$Type;->PLUG:Lzmq/Command$Type;

    invoke-direct {v0, p1, v1}, Lzmq/Command;-><init>(Lzmq/ZObject;Lzmq/Command$Type;)V

    .line 171
    .local v0, "cmd":Lzmq/Command;
    invoke-direct {p0, v0}, Lzmq/ZObject;->sendCommand(Lzmq/Command;)V

    .line 172
    return-void
.end method

.method protected sendReap(Lzmq/SocketBase;)V
    .registers 5
    .param p1, "socket"    # Lzmq/SocketBase;

    .prologue
    .line 261
    new-instance v0, Lzmq/Command;

    iget-object v1, p0, Lzmq/ZObject;->ctx:Lzmq/Ctx;

    invoke-virtual {v1}, Lzmq/Ctx;->getReaper()Lzmq/ZObject;

    move-result-object v1

    sget-object v2, Lzmq/Command$Type;->REAP:Lzmq/Command$Type;

    invoke-direct {v0, v1, v2, p1}, Lzmq/Command;-><init>(Lzmq/ZObject;Lzmq/Command$Type;Ljava/lang/Object;)V

    .line 262
    .local v0, "cmd":Lzmq/Command;
    invoke-direct {p0, v0}, Lzmq/ZObject;->sendCommand(Lzmq/Command;)V

    .line 263
    return-void
.end method

.method protected sendReaped()V
    .registers 4

    .prologue
    .line 267
    new-instance v0, Lzmq/Command;

    iget-object v1, p0, Lzmq/ZObject;->ctx:Lzmq/Ctx;

    invoke-virtual {v1}, Lzmq/Ctx;->getReaper()Lzmq/ZObject;

    move-result-object v1

    sget-object v2, Lzmq/Command$Type;->REAPED:Lzmq/Command$Type;

    invoke-direct {v0, v1, v2}, Lzmq/Command;-><init>(Lzmq/ZObject;Lzmq/Command$Type;)V

    .line 268
    .local v0, "cmd":Lzmq/Command;
    invoke-direct {p0, v0}, Lzmq/ZObject;->sendCommand(Lzmq/Command;)V

    .line 269
    return-void
.end method

.method protected sendStop()V
    .registers 4

    .prologue
    .line 155
    new-instance v0, Lzmq/Command;

    sget-object v1, Lzmq/Command$Type;->STOP:Lzmq/Command$Type;

    invoke-direct {v0, p0, v1}, Lzmq/Command;-><init>(Lzmq/ZObject;Lzmq/Command$Type;)V

    .line 156
    .local v0, "cmd":Lzmq/Command;
    iget-object v1, p0, Lzmq/ZObject;->ctx:Lzmq/Ctx;

    iget v2, p0, Lzmq/ZObject;->tid:I

    invoke-virtual {v1, v2, v0}, Lzmq/Ctx;->sendCommand(ILzmq/Command;)V

    .line 157
    return-void
.end method

.method protected sendTerm(Lzmq/Own;I)V
    .registers 6
    .param p1, "destination"    # Lzmq/Own;
    .param p2, "linger"    # I

    .prologue
    .line 249
    new-instance v0, Lzmq/Command;

    sget-object v1, Lzmq/Command$Type;->TERM:Lzmq/Command$Type;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, p1, v1, v2}, Lzmq/Command;-><init>(Lzmq/ZObject;Lzmq/Command$Type;Ljava/lang/Object;)V

    .line 250
    .local v0, "cmd":Lzmq/Command;
    invoke-direct {p0, v0}, Lzmq/ZObject;->sendCommand(Lzmq/Command;)V

    .line 251
    return-void
.end method

.method protected sendTermAck(Lzmq/Own;)V
    .registers 4
    .param p1, "destination"    # Lzmq/Own;

    .prologue
    .line 255
    new-instance v0, Lzmq/Command;

    sget-object v1, Lzmq/Command$Type;->TERM_ACK:Lzmq/Command$Type;

    invoke-direct {v0, p1, v1}, Lzmq/Command;-><init>(Lzmq/ZObject;Lzmq/Command$Type;)V

    .line 256
    .local v0, "cmd":Lzmq/Command;
    invoke-direct {p0, v0}, Lzmq/ZObject;->sendCommand(Lzmq/Command;)V

    .line 257
    return-void
.end method

.method protected sendTermReq(Lzmq/Own;Lzmq/Own;)V
    .registers 5
    .param p1, "destination"    # Lzmq/Own;
    .param p2, "object"    # Lzmq/Own;

    .prologue
    .line 243
    new-instance v0, Lzmq/Command;

    sget-object v1, Lzmq/Command$Type;->TERM_REQ:Lzmq/Command$Type;

    invoke-direct {v0, p1, v1, p2}, Lzmq/Command;-><init>(Lzmq/ZObject;Lzmq/Command$Type;Ljava/lang/Object;)V

    .line 244
    .local v0, "cmd":Lzmq/Command;
    invoke-direct {p0, v0}, Lzmq/ZObject;->sendCommand(Lzmq/Command;)V

    .line 245
    return-void
.end method

.method protected unregisterEndpoints(Lzmq/SocketBase;)V
    .registers 3
    .param p1, "socket"    # Lzmq/SocketBase;

    .prologue
    .line 132
    iget-object v0, p0, Lzmq/ZObject;->ctx:Lzmq/Ctx;

    invoke-virtual {v0, p1}, Lzmq/Ctx;->unregisterEndpoints(Lzmq/SocketBase;)V

    .line 133
    return-void
.end method
