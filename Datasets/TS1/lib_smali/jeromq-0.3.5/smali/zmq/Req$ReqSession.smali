.class public Lzmq/Req$ReqSession;
.super Lzmq/Dealer$DealerSession;
.source "Req.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/Req;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ReqSession"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/Req$ReqSession$State;
    }
.end annotation


# instance fields
.field private state:Lzmq/Req$ReqSession$State;


# direct methods
.method public constructor <init>(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)V
    .registers 7
    .param p1, "ioThread"    # Lzmq/IOThread;
    .param p2, "connect"    # Z
    .param p3, "socket"    # Lzmq/SocketBase;
    .param p4, "options"    # Lzmq/Options;
    .param p5, "addr"    # Lzmq/Address;

    .prologue
    .line 152
    invoke-direct/range {p0 .. p5}, Lzmq/Dealer$DealerSession;-><init>(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)V

    .line 154
    sget-object v0, Lzmq/Req$ReqSession$State;->IDENTITY:Lzmq/Req$ReqSession$State;

    iput-object v0, p0, Lzmq/Req$ReqSession;->state:Lzmq/Req$ReqSession$State;

    .line 155
    return-void
.end method


# virtual methods
.method public pushMsg(Lzmq/Msg;)I
    .registers 4
    .param p1, "msg"    # Lzmq/Msg;

    .prologue
    .line 160
    sget-object v0, Lzmq/Req$1;->$SwitchMap$zmq$Req$ReqSession$State:[I

    iget-object v1, p0, Lzmq/Req$ReqSession;->state:Lzmq/Req$ReqSession$State;

    invoke-virtual {v1}, Lzmq/Req$ReqSession$State;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_5a

    .line 183
    :cond_d
    iget-object v0, p0, Lzmq/Req$ReqSession;->socket:Lzmq/SocketBase;

    iget-object v0, v0, Lzmq/SocketBase;->errno:Lzmq/ValueReference;

    const/16 v1, 0xe

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lzmq/ValueReference;->set(Ljava/lang/Object;)V

    .line 184
    const/4 v0, -0x1

    :goto_1b
    return v0

    .line 162
    :pswitch_1c
    invoke-virtual {p1}, Lzmq/Msg;->hasMore()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {p1}, Lzmq/Msg;->size()I

    move-result v0

    if-nez v0, :cond_d

    .line 163
    sget-object v0, Lzmq/Req$ReqSession$State;->BODY:Lzmq/Req$ReqSession$State;

    iput-object v0, p0, Lzmq/Req$ReqSession;->state:Lzmq/Req$ReqSession$State;

    .line 164
    invoke-super {p0, p1}, Lzmq/Dealer$DealerSession;->pushMsg(Lzmq/Msg;)I

    move-result v0

    goto :goto_1b

    .line 168
    :pswitch_31
    invoke-virtual {p1}, Lzmq/Msg;->hasMore()Z

    move-result v0

    if-eqz v0, :cond_3c

    .line 169
    invoke-super {p0, p1}, Lzmq/Dealer$DealerSession;->pushMsg(Lzmq/Msg;)I

    move-result v0

    goto :goto_1b

    .line 171
    :cond_3c
    invoke-virtual {p1}, Lzmq/Msg;->flags()I

    move-result v0

    if-nez v0, :cond_d

    .line 172
    sget-object v0, Lzmq/Req$ReqSession$State;->BOTTOM:Lzmq/Req$ReqSession$State;

    iput-object v0, p0, Lzmq/Req$ReqSession;->state:Lzmq/Req$ReqSession$State;

    .line 173
    invoke-super {p0, p1}, Lzmq/Dealer$DealerSession;->pushMsg(Lzmq/Msg;)I

    move-result v0

    goto :goto_1b

    .line 177
    :pswitch_4b
    invoke-virtual {p1}, Lzmq/Msg;->flags()I

    move-result v0

    if-nez v0, :cond_d

    .line 178
    sget-object v0, Lzmq/Req$ReqSession$State;->BOTTOM:Lzmq/Req$ReqSession$State;

    iput-object v0, p0, Lzmq/Req$ReqSession;->state:Lzmq/Req$ReqSession$State;

    .line 179
    invoke-super {p0, p1}, Lzmq/Dealer$DealerSession;->pushMsg(Lzmq/Msg;)I

    move-result v0

    goto :goto_1b

    .line 160
    :pswitch_data_5a
    .packed-switch 0x1
        :pswitch_1c
        :pswitch_31
        :pswitch_4b
    .end packed-switch
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 189
    invoke-super {p0}, Lzmq/Dealer$DealerSession;->reset()V

    .line 190
    sget-object v0, Lzmq/Req$ReqSession$State;->IDENTITY:Lzmq/Req$ReqSession$State;

    iput-object v0, p0, Lzmq/Req$ReqSession;->state:Lzmq/Req$ReqSession$State;

    .line 191
    return-void
.end method
