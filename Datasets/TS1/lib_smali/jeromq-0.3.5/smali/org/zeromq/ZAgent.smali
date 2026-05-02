.class public interface abstract Lorg/zeromq/ZAgent;
.super Ljava/lang/Object;
.source "ZAgent.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/zeromq/ZAgent$VerySimpleSelectorCreator;,
        Lorg/zeromq/ZAgent$SelectorCreator;,
        Lorg/zeromq/ZAgent$SimpleAgent;,
        Lorg/zeromq/ZAgent$Creator;
    }
.end annotation


# virtual methods
.method public abstract nova()V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract pipe()Lorg/zeromq/ZMQ$Socket;
.end method

.method public abstract recv()Lorg/zeromq/ZMsg;
.end method

.method public abstract recv(Z)Lorg/zeromq/ZMsg;
.end method

.method public abstract send(Ljava/lang/String;)Z
.end method

.method public abstract send(Ljava/lang/String;Z)Z
.end method

.method public abstract send(Lorg/zeromq/ZMsg;)Z
.end method

.method public abstract send(Lorg/zeromq/ZMsg;Z)Z
.end method

.method public abstract sign()Z
.end method
