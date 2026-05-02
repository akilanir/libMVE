.class Lrx/internal/operators/OnSubscribeAmb$2;
.super Ljava/lang/Object;
.source "OnSubscribeAmb.java"

# interfaces
.implements Lrx/Producer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OnSubscribeAmb;->call(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrx/internal/operators/OnSubscribeAmb;

.field final synthetic val$subscriber:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lrx/internal/operators/OnSubscribeAmb;Lrx/Subscriber;)V
    .registers 3

    .prologue
    .line 374
    .local p0, "this":Lrx/internal/operators/OnSubscribeAmb$2;, "Lrx/internal/operators/OnSubscribeAmb.2;"
    iput-object p1, p0, Lrx/internal/operators/OnSubscribeAmb$2;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    iput-object p2, p0, Lrx/internal/operators/OnSubscribeAmb$2;->val$subscriber:Lrx/Subscriber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public request(J)V
    .registers 11
    .param p1, "n"    # J

    .prologue
    .line 378
    .local p0, "this":Lrx/internal/operators/OnSubscribeAmb$2;, "Lrx/internal/operators/OnSubscribeAmb.2;"
    iget-object v1, p0, Lrx/internal/operators/OnSubscribeAmb$2;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->selection:Lrx/internal/operators/OnSubscribeAmb$Selection;
    invoke-static {v1}, Lrx/internal/operators/OnSubscribeAmb;->access$100(Lrx/internal/operators/OnSubscribeAmb;)Lrx/internal/operators/OnSubscribeAmb$Selection;

    move-result-object v1

    iget-object v1, v1, Lrx/internal/operators/OnSubscribeAmb$Selection;->choice:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_20

    .line 380
    iget-object v1, p0, Lrx/internal/operators/OnSubscribeAmb$2;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->selection:Lrx/internal/operators/OnSubscribeAmb$Selection;
    invoke-static {v1}, Lrx/internal/operators/OnSubscribeAmb;->access$100(Lrx/internal/operators/OnSubscribeAmb;)Lrx/internal/operators/OnSubscribeAmb$Selection;

    move-result-object v1

    iget-object v1, v1, Lrx/internal/operators/OnSubscribeAmb$Selection;->choice:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;

    # invokes: Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;->requestMore(J)V
    invoke-static {v1, p1, p2}, Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;->access$200(Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;J)V

    .line 397
    :cond_1f
    :goto_1f
    return-void

    .line 382
    :cond_20
    iget-object v1, p0, Lrx/internal/operators/OnSubscribeAmb$2;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->sources:Ljava/lang/Iterable;
    invoke-static {v1}, Lrx/internal/operators/OnSubscribeAmb;->access$300(Lrx/internal/operators/OnSubscribeAmb;)Ljava/lang/Iterable;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_2a
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1f

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lrx/Observable;

    .line 383
    .local v7, "source":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    iget-object v1, p0, Lrx/internal/operators/OnSubscribeAmb$2;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v1}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v1

    if-nez v1, :cond_1f

    .line 386
    new-instance v0, Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;

    iget-object v3, p0, Lrx/internal/operators/OnSubscribeAmb$2;->val$subscriber:Lrx/Subscriber;

    iget-object v1, p0, Lrx/internal/operators/OnSubscribeAmb$2;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->selection:Lrx/internal/operators/OnSubscribeAmb$Selection;
    invoke-static {v1}, Lrx/internal/operators/OnSubscribeAmb;->access$100(Lrx/internal/operators/OnSubscribeAmb;)Lrx/internal/operators/OnSubscribeAmb$Selection;

    move-result-object v4

    const/4 v5, 0x0

    move-wide v1, p1

    invoke-direct/range {v0 .. v5}, Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;-><init>(JLrx/Subscriber;Lrx/internal/operators/OnSubscribeAmb$Selection;Lrx/internal/operators/OnSubscribeAmb$1;)V

    .line 387
    .local v0, "ambSubscriber":Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;, "Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber<TT;>;"
    iget-object v1, p0, Lrx/internal/operators/OnSubscribeAmb$2;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->selection:Lrx/internal/operators/OnSubscribeAmb$Selection;
    invoke-static {v1}, Lrx/internal/operators/OnSubscribeAmb;->access$100(Lrx/internal/operators/OnSubscribeAmb;)Lrx/internal/operators/OnSubscribeAmb$Selection;

    move-result-object v1

    iget-object v1, v1, Lrx/internal/operators/OnSubscribeAmb$Selection;->ambSubscribers:Ljava/util/Collection;

    invoke-interface {v1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 389
    iget-object v1, p0, Lrx/internal/operators/OnSubscribeAmb$2;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->selection:Lrx/internal/operators/OnSubscribeAmb$Selection;
    invoke-static {v1}, Lrx/internal/operators/OnSubscribeAmb;->access$100(Lrx/internal/operators/OnSubscribeAmb;)Lrx/internal/operators/OnSubscribeAmb$Selection;

    move-result-object v1

    iget-object v1, v1, Lrx/internal/operators/OnSubscribeAmb$Selection;->choice:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_7e

    .line 391
    iget-object v1, p0, Lrx/internal/operators/OnSubscribeAmb$2;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->selection:Lrx/internal/operators/OnSubscribeAmb$Selection;
    invoke-static {v1}, Lrx/internal/operators/OnSubscribeAmb;->access$100(Lrx/internal/operators/OnSubscribeAmb;)Lrx/internal/operators/OnSubscribeAmb$Selection;

    move-result-object v2

    iget-object v1, p0, Lrx/internal/operators/OnSubscribeAmb$2;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->selection:Lrx/internal/operators/OnSubscribeAmb$Selection;
    invoke-static {v1}, Lrx/internal/operators/OnSubscribeAmb;->access$100(Lrx/internal/operators/OnSubscribeAmb;)Lrx/internal/operators/OnSubscribeAmb$Selection;

    move-result-object v1

    iget-object v1, v1, Lrx/internal/operators/OnSubscribeAmb$Selection;->choice:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;

    invoke-virtual {v2, v1}, Lrx/internal/operators/OnSubscribeAmb$Selection;->unsubscribeOthers(Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;)V

    goto :goto_1f

    .line 394
    :cond_7e
    invoke-virtual {v7, v0}, Lrx/Observable;->unsafeSubscribe(Lrx/Subscriber;)Lrx/Subscription;

    goto :goto_2a
.end method
