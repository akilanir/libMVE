.class public interface abstract Lorg/zeromq/ZPoller$ItemCreator;
.super Ljava/lang/Object;
.source "ZPoller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZPoller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ItemCreator"
.end annotation


# virtual methods
.method public abstract create(Ljava/nio/channels/SelectableChannel;Lorg/zeromq/ZPoller$EventsHandler;I)Lorg/zeromq/ZPoller$ItemHolder;
.end method

.method public abstract create(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller$EventsHandler;I)Lorg/zeromq/ZPoller$ItemHolder;
.end method
