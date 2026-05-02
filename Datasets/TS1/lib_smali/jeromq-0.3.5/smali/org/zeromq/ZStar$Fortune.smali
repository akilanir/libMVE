.class public interface abstract Lorg/zeromq/ZStar$Fortune;
.super Ljava/lang/Object;
.source "ZStar.java"

# interfaces
.implements Lorg/zeromq/ZStar$TimeTaker;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZStar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Fortune"
.end annotation


# virtual methods
.method public abstract create(Lorg/zeromq/ZContext;Lorg/zeromq/ZMQ$Socket;Ljava/nio/channels/Selector;ILorg/zeromq/ZStar$Star;[Ljava/lang/Object;)Lorg/zeromq/ZStar$Star;
.end method

.method public abstract interview(Lorg/zeromq/ZMQ$Socket;)Z
.end method

.method public abstract premiere(Lorg/zeromq/ZMQ$Socket;[Ljava/lang/Object;)Ljava/lang/String;
.end method
