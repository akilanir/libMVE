.class public interface abstract Lorg/zeromq/ZProxy$Proxy;
.super Ljava/lang/Object;
.source "ZProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Proxy"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/zeromq/ZProxy$Proxy$SimpleProxy;
    }
.end annotation


# virtual methods
.method public abstract configure(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZProxy$Plug;[Ljava/lang/Object;)V
.end method

.method public abstract configure(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMsg;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;[Ljava/lang/Object;)Z
.end method

.method public abstract create(Lorg/zeromq/ZContext;Lorg/zeromq/ZProxy$Plug;[Ljava/lang/Object;)Lorg/zeromq/ZMQ$Socket;
.end method

.method public abstract custom(Lorg/zeromq/ZMQ$Socket;Ljava/lang/String;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;[Ljava/lang/Object;)Z
.end method

.method public abstract restart(Lorg/zeromq/ZMsg;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZProxy$Plug;[Ljava/lang/Object;)Z
.end method
