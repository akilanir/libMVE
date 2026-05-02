.class public interface abstract Lorg/zeromq/ZPoller$EventsHandler;
.super Ljava/lang/Object;
.source "ZPoller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZPoller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "EventsHandler"
.end annotation


# virtual methods
.method public abstract events(Ljava/nio/channels/SelectableChannel;I)Z
.end method

.method public abstract events(Lorg/zeromq/ZMQ$Socket;I)Z
.end method
