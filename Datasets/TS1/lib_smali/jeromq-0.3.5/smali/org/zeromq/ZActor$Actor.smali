.class public interface abstract Lorg/zeromq/ZActor$Actor;
.super Ljava/lang/Object;
.source "ZActor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZActor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Actor"
.end annotation


# virtual methods
.method public abstract backstage(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;I)Z
.end method

.method public abstract closed(Lorg/zeromq/ZMQ$Socket;)V
.end method

.method public abstract createSockets(Lorg/zeromq/ZContext;[Ljava/lang/Object;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/zeromq/ZContext;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/zeromq/ZMQ$Socket;",
            ">;"
        }
    .end annotation
.end method

.method public abstract destroyed(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)Z
.end method

.method public abstract finished(Lorg/zeromq/ZMQ$Socket;)Z
.end method

.method public abstract looped(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)Z
.end method

.method public abstract looping(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)J
.end method

.method public abstract premiere(Lorg/zeromq/ZMQ$Socket;)Ljava/lang/String;
.end method

.method public abstract stage(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;I)Z
.end method

.method public abstract start(Lorg/zeromq/ZMQ$Socket;Ljava/util/List;Lorg/zeromq/ZPoller;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/zeromq/ZMQ$Socket;",
            "Ljava/util/List",
            "<",
            "Lorg/zeromq/ZMQ$Socket;",
            ">;",
            "Lorg/zeromq/ZPoller;",
            ")V"
        }
    .end annotation
.end method
