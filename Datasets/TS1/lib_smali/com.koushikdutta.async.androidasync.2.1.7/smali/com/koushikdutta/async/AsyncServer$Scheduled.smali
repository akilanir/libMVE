.class Lcom/koushikdutta/async/AsyncServer$Scheduled;
.super Ljava/lang/Object;
.source "AsyncServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/async/AsyncServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Scheduled"
.end annotation


# instance fields
.field public runnable:Ljava/lang/Runnable;

.field public time:J


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;J)V
    .registers 4
    .param p1, "runnable"    # Ljava/lang/Runnable;
    .param p2, "time"    # J

    .prologue
    .line 207
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 208
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncServer$Scheduled;->runnable:Ljava/lang/Runnable;

    .line 209
    iput-wide p2, p0, Lcom/koushikdutta/async/AsyncServer$Scheduled;->time:J

    .line 210
    return-void
.end method
