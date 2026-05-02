.class Lorg/zeromq/ZPoller$SimpleCreator;
.super Ljava/lang/Object;
.source "ZPoller.java"

# interfaces
.implements Lorg/zeromq/ZPoller$ItemCreator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZPoller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SimpleCreator"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 704
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/zeromq/ZPoller$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/zeromq/ZPoller$1;

    .prologue
    .line 704
    invoke-direct {p0}, Lorg/zeromq/ZPoller$SimpleCreator;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Ljava/nio/channels/SelectableChannel;Lorg/zeromq/ZPoller$EventsHandler;I)Lorg/zeromq/ZPoller$ItemHolder;
    .registers 5
    .param p1, "channel"    # Ljava/nio/channels/SelectableChannel;
    .param p2, "handler"    # Lorg/zeromq/ZPoller$EventsHandler;
    .param p3, "events"    # I

    .prologue
    .line 717
    new-instance v0, Lorg/zeromq/ZPoller$ZPollItem;

    invoke-direct {v0, p1, p2, p3}, Lorg/zeromq/ZPoller$ZPollItem;-><init>(Ljava/nio/channels/SelectableChannel;Lorg/zeromq/ZPoller$EventsHandler;I)V

    return-object v0
.end method

.method public create(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller$EventsHandler;I)Lorg/zeromq/ZPoller$ItemHolder;
    .registers 5
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "handler"    # Lorg/zeromq/ZPoller$EventsHandler;
    .param p3, "events"    # I

    .prologue
    .line 710
    new-instance v0, Lorg/zeromq/ZPoller$ZPollItem;

    invoke-direct {v0, p1, p2, p3}, Lorg/zeromq/ZPoller$ZPollItem;-><init>(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller$EventsHandler;I)V

    return-object v0
.end method
