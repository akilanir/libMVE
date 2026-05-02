.class Lrx/internal/operators/OperatorMerge$MergeSubscriber$1;
.super Ljava/lang/Object;
.source "OperatorMerge.java"

# interfaces
.implements Lrx/functions/Func1;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorMerge$MergeSubscriber;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/functions/Func1",
        "<",
        "Lrx/internal/operators/OperatorMerge$InnerSubscriber",
        "<TT;>;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lrx/internal/operators/OperatorMerge$MergeSubscriber;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)V
    .registers 2

    .prologue
    .line 408
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber$1;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber.1;"
    iput-object p1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber$1;->this$0:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Lrx/internal/operators/OperatorMerge$InnerSubscriber;)Ljava/lang/Boolean;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorMerge$InnerSubscriber",
            "<TT;>;)",
            "Ljava/lang/Boolean;"
        }
    .end annotation

    .prologue
    .line 412
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber$1;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber.1;"
    .local p1, "s":Lrx/internal/operators/OperatorMerge$InnerSubscriber;, "Lrx/internal/operators/OperatorMerge$InnerSubscriber<TT;>;"
    # getter for: Lrx/internal/operators/OperatorMerge$InnerSubscriber;->q:Lrx/internal/util/RxRingBuffer;
    invoke-static {p1}, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->access$200(Lrx/internal/operators/OperatorMerge$InnerSubscriber;)Lrx/internal/util/RxRingBuffer;

    move-result-object v3

    if-eqz v3, :cond_22

    .line 413
    iget-object v3, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber$1;->this$0:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    # getter for: Lrx/internal/operators/OperatorMerge$MergeSubscriber;->mergeProducer:Lrx/internal/operators/OperatorMerge$MergeProducer;
    invoke-static {v3}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->access$300(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)Lrx/internal/operators/OperatorMerge$MergeProducer;

    move-result-object v3

    # getter for: Lrx/internal/operators/OperatorMerge$MergeProducer;->requested:J
    invoke-static {v3}, Lrx/internal/operators/OperatorMerge$MergeProducer;->access$100(Lrx/internal/operators/OperatorMerge$MergeProducer;)J

    move-result-wide v1

    .line 414
    .local v1, "r":J
    # invokes: Lrx/internal/operators/OperatorMerge$InnerSubscriber;->drainQueue()I
    invoke-static {p1}, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->access$400(Lrx/internal/operators/OperatorMerge$InnerSubscriber;)I

    move-result v0

    .line 415
    .local v0, "emitted":I
    if-lez v0, :cond_1a

    .line 416
    int-to-long v3, v0

    invoke-virtual {p1, v3, v4}, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->requestMore(J)V

    .line 418
    :cond_1a
    int-to-long v3, v0

    cmp-long v3, v3, v1

    if-nez v3, :cond_22

    .line 420
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 423
    .end local v0    # "emitted":I
    .end local v1    # "r":J
    :goto_21
    return-object v3

    :cond_22
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_21
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 408
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber$1;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber.1;"
    check-cast p1, Lrx/internal/operators/OperatorMerge$InnerSubscriber;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorMerge$MergeSubscriber$1;->call(Lrx/internal/operators/OperatorMerge$InnerSubscriber;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
