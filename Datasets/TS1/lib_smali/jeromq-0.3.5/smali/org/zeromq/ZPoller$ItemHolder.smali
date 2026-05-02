.class public interface abstract Lorg/zeromq/ZPoller$ItemHolder;
.super Ljava/lang/Object;
.source "ZPoller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZPoller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ItemHolder"
.end annotation


# virtual methods
.method public abstract handler()Lorg/zeromq/ZPoller$EventsHandler;
.end method

.method public abstract item()Lzmq/PollItem;
.end method

.method public abstract socket()Lorg/zeromq/ZMQ$Socket;
.end method
