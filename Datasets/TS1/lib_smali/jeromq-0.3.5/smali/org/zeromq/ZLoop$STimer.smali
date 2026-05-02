.class Lorg/zeromq/ZLoop$STimer;
.super Ljava/lang/Object;
.source "ZLoop.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZLoop;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "STimer"
.end annotation


# instance fields
.field arg:Ljava/lang/Object;

.field delay:I

.field handler:Lorg/zeromq/ZLoop$IZLoopHandler;

.field final synthetic this$0:Lorg/zeromq/ZLoop;

.field times:I

.field when:J


# direct methods
.method public constructor <init>(Lorg/zeromq/ZLoop;IILorg/zeromq/ZLoop$IZLoopHandler;Ljava/lang/Object;)V
    .registers 8
    .param p2, "delay"    # I
    .param p3, "times"    # I
    .param p4, "handler"    # Lorg/zeromq/ZLoop$IZLoopHandler;
    .param p5, "arg"    # Ljava/lang/Object;

    .prologue
    .line 70
    iput-object p1, p0, Lorg/zeromq/ZLoop$STimer;->this$0:Lorg/zeromq/ZLoop;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput p2, p0, Lorg/zeromq/ZLoop$STimer;->delay:I

    .line 72
    iput p3, p0, Lorg/zeromq/ZLoop$STimer;->times:I

    .line 73
    iput-object p4, p0, Lorg/zeromq/ZLoop$STimer;->handler:Lorg/zeromq/ZLoop$IZLoopHandler;

    .line 74
    iput-object p5, p0, Lorg/zeromq/ZLoop$STimer;->arg:Ljava/lang/Object;

    .line 75
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/zeromq/ZLoop$STimer;->when:J

    .line 76
    return-void
.end method
