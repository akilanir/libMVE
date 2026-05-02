.class public abstract Lorg/zeromq/ZProxy$Proxy$SimpleProxy;
.super Ljava/lang/Object;
.source "ZProxy.java"

# interfaces
.implements Lorg/zeromq/ZProxy$Proxy;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZProxy$Proxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "SimpleProxy"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 218
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public configure(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMsg;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;[Ljava/lang/Object;)Z
    .registers 8
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "cfg"    # Lorg/zeromq/ZMsg;
    .param p3, "frontend"    # Lorg/zeromq/ZMQ$Socket;
    .param p4, "backend"    # Lorg/zeromq/ZMQ$Socket;
    .param p5, "capture"    # Lorg/zeromq/ZMQ$Socket;
    .param p6, "args"    # [Ljava/lang/Object;

    .prologue
    .line 231
    const/4 v0, 0x1

    return v0
.end method

.method public custom(Lorg/zeromq/ZMQ$Socket;Ljava/lang/String;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;[Ljava/lang/Object;)Z
    .registers 8
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "cmd"    # Ljava/lang/String;
    .param p3, "frontend"    # Lorg/zeromq/ZMQ$Socket;
    .param p4, "backend"    # Lorg/zeromq/ZMQ$Socket;
    .param p5, "capture"    # Lorg/zeromq/ZMQ$Socket;
    .param p6, "args"    # [Ljava/lang/Object;

    .prologue
    .line 237
    const/4 v0, 0x1

    return v0
.end method

.method public restart(Lorg/zeromq/ZMsg;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZProxy$Plug;[Ljava/lang/Object;)Z
    .registers 6
    .param p1, "cfg"    # Lorg/zeromq/ZMsg;
    .param p2, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p3, "place"    # Lorg/zeromq/ZProxy$Plug;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 224
    const/4 v0, 0x1

    return v0
.end method
