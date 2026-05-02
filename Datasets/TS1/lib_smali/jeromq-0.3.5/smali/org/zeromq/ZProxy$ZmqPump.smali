.class final Lorg/zeromq/ZProxy$ZmqPump;
.super Ljava/lang/Object;
.source "ZProxy.java"

# interfaces
.implements Lorg/zeromq/ZProxy$Pump;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ZmqPump"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 1062
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/zeromq/ZProxy$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/zeromq/ZProxy$1;

    .prologue
    .line 1062
    invoke-direct {p0}, Lorg/zeromq/ZProxy$ZmqPump;-><init>()V

    return-void
.end method


# virtual methods
.method public flow(Lorg/zeromq/ZProxy$Plug;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZProxy$Plug;Lorg/zeromq/ZMQ$Socket;)Z
    .registers 16
    .param p1, "splug"    # Lorg/zeromq/ZProxy$Plug;
    .param p2, "source"    # Lorg/zeromq/ZMQ$Socket;
    .param p3, "capture"    # Lorg/zeromq/ZMQ$Socket;
    .param p4, "dplug"    # Lorg/zeromq/ZProxy$Plug;
    .param p5, "destination"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 1071
    invoke-virtual {p2}, Lorg/zeromq/ZMQ$Socket;->base()Lzmq/SocketBase;

    move-result-object v7

    .line 1072
    .local v7, "src":Lzmq/SocketBase;
    invoke-virtual {p5}, Lorg/zeromq/ZMQ$Socket;->base()Lzmq/SocketBase;

    move-result-object v2

    .line 1073
    .local v2, "dst":Lzmq/SocketBase;
    if-nez p3, :cond_14

    const/4 v0, 0x0

    .line 1078
    .local v0, "cpt":Lzmq/SocketBase;
    :cond_b
    :goto_b
    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Lzmq/SocketBase;->recv(I)Lzmq/Msg;

    move-result-object v5

    .line 1080
    .local v5, "msg":Lzmq/Msg;
    if-nez v5, :cond_19

    .line 1081
    const/4 v8, 0x0

    .line 1109
    :goto_13
    return v8

    .line 1073
    .end local v0    # "cpt":Lzmq/SocketBase;
    .end local v5    # "msg":Lzmq/Msg;
    :cond_14
    invoke-virtual {p3}, Lorg/zeromq/ZMQ$Socket;->base()Lzmq/SocketBase;

    move-result-object v0

    goto :goto_b

    .line 1084
    .restart local v0    # "cpt":Lzmq/SocketBase;
    .restart local v5    # "msg":Lzmq/Msg;
    :cond_19
    const/16 v8, 0xd

    invoke-virtual {v7, v8}, Lzmq/SocketBase;->getSocketOpt(I)I

    move-result v8

    int-to-long v3, v8

    .line 1086
    .local v3, "more":J
    const-wide/16 v8, 0x0

    cmp-long v8, v3, v8

    if-gez v8, :cond_28

    .line 1087
    const/4 v8, 0x0

    goto :goto_13

    .line 1091
    :cond_28
    if-eqz v0, :cond_3c

    .line 1092
    new-instance v1, Lzmq/Msg;

    invoke-direct {v1, v5}, Lzmq/Msg;-><init>(Lzmq/Msg;)V

    .line 1093
    .local v1, "ctrl":Lzmq/Msg;
    const-wide/16 v8, 0x0

    cmp-long v8, v3, v8

    if-lez v8, :cond_4b

    const/4 v8, 0x2

    :goto_36
    invoke-virtual {v0, v1, v8}, Lzmq/SocketBase;->send(Lzmq/Msg;I)Z

    move-result v6

    .line 1094
    .local v6, "rc":Z
    if-nez v6, :cond_3c

    .line 1100
    .end local v1    # "ctrl":Lzmq/Msg;
    .end local v6    # "rc":Z
    :cond_3c
    const-wide/16 v8, 0x0

    cmp-long v8, v3, v8

    if-lez v8, :cond_4d

    const/4 v8, 0x2

    :goto_43
    invoke-virtual {v2, v5, v8}, Lzmq/SocketBase;->send(Lzmq/Msg;I)Z

    move-result v6

    .line 1102
    .restart local v6    # "rc":Z
    if-nez v6, :cond_4f

    .line 1103
    const/4 v8, 0x0

    goto :goto_13

    .line 1093
    .end local v6    # "rc":Z
    .restart local v1    # "ctrl":Lzmq/Msg;
    :cond_4b
    const/4 v8, 0x0

    goto :goto_36

    .line 1100
    .end local v1    # "ctrl":Lzmq/Msg;
    :cond_4d
    const/4 v8, 0x0

    goto :goto_43

    .line 1105
    .restart local v6    # "rc":Z
    :cond_4f
    const-wide/16 v8, 0x0

    cmp-long v8, v3, v8

    if-nez v8, :cond_b

    .line 1109
    const/4 v8, 0x1

    goto :goto_13
.end method
