.class final Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;
.super Lrx/Subscriber;
.source "OperatorMergeMaxConcurrent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "MergeItemSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lrx/Subscriber",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final buffer:Lrx/internal/util/RxRingBuffer;

.field final index:I

.field volatile once:Z

.field final synthetic this$0:Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;I)V
    .registers 4
    .param p2, "index"    # I

    .prologue
    .line 306
    .local p0, "this":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    iput-object p1, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->this$0:Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;

    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    .line 302
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->once:Z

    .line 307
    invoke-static {}, Lrx/internal/util/RxRingBuffer;->getSpmcInstance()Lrx/internal/util/RxRingBuffer;

    move-result-object v0

    iput-object v0, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->buffer:Lrx/internal/util/RxRingBuffer;

    .line 308
    iput p2, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->index:I

    .line 309
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .registers 2

    .prologue
    .line 335
    .local p0, "this":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    iget-boolean v0, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->once:Z

    if-eqz v0, :cond_c

    .line 336
    const/4 v0, 0x0

    iput-boolean v0, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->once:Z

    .line 337
    iget-object v0, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->this$0:Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;

    invoke-virtual {v0}, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->drain()V

    .line 339
    :cond_c
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 330
    .local p0, "this":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    iget-object v0, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->this$0:Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;

    invoke-virtual {v0, p1}, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->onError(Ljava/lang/Throwable;)V

    .line 331
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 319
    .local p0, "this":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v1, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->buffer:Lrx/internal/util/RxRingBuffer;

    invoke-virtual {v1, p1}, Lrx/internal/util/RxRingBuffer;->onNext(Ljava/lang/Object;)V
    :try_end_5
    .catch Lrx/exceptions/MissingBackpressureException; {:try_start_0 .. :try_end_5} :catch_b

    .line 325
    iget-object v1, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->this$0:Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;

    invoke-virtual {v1}, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->drain()V

    .line 326
    :goto_a
    return-void

    .line 320
    :catch_b
    move-exception v0

    .line 321
    .local v0, "ex":Lrx/exceptions/MissingBackpressureException;
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_a
.end method

.method public onStart()V
    .registers 3

    .prologue
    .line 313
    .local p0, "this":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    sget v0, Lrx/internal/util/RxRingBuffer;->SIZE:I

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->request(J)V

    .line 314
    return-void
.end method

.method release()V
    .registers 2

    .prologue
    .line 346
    .local p0, "this":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    iget-object v0, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->buffer:Lrx/internal/util/RxRingBuffer;

    invoke-virtual {v0}, Lrx/internal/util/RxRingBuffer;->release()V

    .line 347
    return-void
.end method

.method requestMore(J)V
    .registers 3
    .param p1, "n"    # J

    .prologue
    .line 342
    .local p0, "this":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    invoke-virtual {p0, p1, p2}, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->request(J)V

    .line 343
    return-void
.end method
