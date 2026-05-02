.class final Lzmq/PollerBase$TimerInfo;
.super Ljava/lang/Object;
.source "PollerBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/PollerBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "TimerInfo"
.end annotation


# instance fields
.field id:I

.field sink:Lzmq/IPollEvents;

.field final synthetic this$0:Lzmq/PollerBase;


# direct methods
.method public constructor <init>(Lzmq/PollerBase;Lzmq/IPollEvents;I)V
    .registers 4
    .param p2, "sink"    # Lzmq/IPollEvents;
    .param p3, "id"    # I

    .prologue
    .line 39
    iput-object p1, p0, Lzmq/PollerBase$TimerInfo;->this$0:Lzmq/PollerBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p2, p0, Lzmq/PollerBase$TimerInfo;->sink:Lzmq/IPollEvents;

    .line 41
    iput p3, p0, Lzmq/PollerBase$TimerInfo;->id:I

    .line 42
    return-void
.end method
