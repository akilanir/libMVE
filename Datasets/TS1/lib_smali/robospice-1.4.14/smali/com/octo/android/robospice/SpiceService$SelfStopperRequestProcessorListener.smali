.class public final Lcom/octo/android/robospice/SpiceService$SelfStopperRequestProcessorListener;
.super Ljava/lang/Object;
.source "SpiceService.java"

# interfaces
.implements Lcom/octo/android/robospice/request/RequestProcessorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/octo/android/robospice/SpiceService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x14
    name = "SelfStopperRequestProcessorListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/octo/android/robospice/SpiceService;


# direct methods
.method protected constructor <init>(Lcom/octo/android/robospice/SpiceService;)V
    .registers 2

    .prologue
    .line 458
    iput-object p1, p0, Lcom/octo/android/robospice/SpiceService$SelfStopperRequestProcessorListener;->this$0:Lcom/octo/android/robospice/SpiceService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public allRequestComplete()V
    .registers 3

    .prologue
    .line 465
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService$SelfStopperRequestProcessorListener;->this$0:Lcom/octo/android/robospice/SpiceService;

    const/4 v1, 0x0

    # setter for: Lcom/octo/android/robospice/SpiceService;->currentPendingRequestCount:I
    invoke-static {v0, v1}, Lcom/octo/android/robospice/SpiceService;->access$002(Lcom/octo/android/robospice/SpiceService;I)I

    .line 466
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService$SelfStopperRequestProcessorListener;->this$0:Lcom/octo/android/robospice/SpiceService;

    # invokes: Lcom/octo/android/robospice/SpiceService;->stopIfNotBoundAndHasNoPendingRequests()V
    invoke-static {v0}, Lcom/octo/android/robospice/SpiceService;->access$100(Lcom/octo/android/robospice/SpiceService;)V

    .line 467
    return-void
.end method

.method public requestsInProgress()V
    .registers 1

    .prologue
    .line 461
    return-void
.end method
