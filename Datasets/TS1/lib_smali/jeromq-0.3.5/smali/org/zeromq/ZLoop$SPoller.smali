.class Lorg/zeromq/ZLoop$SPoller;
.super Ljava/lang/Object;
.source "ZLoop.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZLoop;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SPoller"
.end annotation


# instance fields
.field arg:Ljava/lang/Object;

.field errors:I

.field handler:Lorg/zeromq/ZLoop$IZLoopHandler;

.field item:Lorg/zeromq/ZMQ$PollItem;

.field final synthetic this$0:Lorg/zeromq/ZLoop;


# direct methods
.method protected constructor <init>(Lorg/zeromq/ZLoop;Lorg/zeromq/ZMQ$PollItem;Lorg/zeromq/ZLoop$IZLoopHandler;Ljava/lang/Object;)V
    .registers 6
    .param p2, "item"    # Lorg/zeromq/ZMQ$PollItem;
    .param p3, "handler"    # Lorg/zeromq/ZLoop$IZLoopHandler;
    .param p4, "arg"    # Ljava/lang/Object;

    .prologue
    .line 51
    iput-object p1, p0, Lorg/zeromq/ZLoop$SPoller;->this$0:Lorg/zeromq/ZLoop;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p2, p0, Lorg/zeromq/ZLoop$SPoller;->item:Lorg/zeromq/ZMQ$PollItem;

    .line 53
    iput-object p3, p0, Lorg/zeromq/ZLoop$SPoller;->handler:Lorg/zeromq/ZLoop$IZLoopHandler;

    .line 54
    iput-object p4, p0, Lorg/zeromq/ZLoop$SPoller;->arg:Ljava/lang/Object;

    .line 55
    const/4 v0, 0x0

    iput v0, p0, Lorg/zeromq/ZLoop$SPoller;->errors:I

    .line 56
    return-void
.end method
