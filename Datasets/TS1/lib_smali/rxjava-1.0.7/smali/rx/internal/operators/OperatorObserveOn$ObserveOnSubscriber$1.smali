.class Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber$1;
.super Ljava/lang/Object;
.source "OperatorObserveOn.java"

# interfaces
.implements Lrx/Producer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;-><init>(Lrx/Scheduler;Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;)V
    .registers 2

    .prologue
    .line 92
    .local p0, "this":Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber$1;, "Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber.1;"
    iput-object p1, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber$1;->this$0:Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public request(J)V
    .registers 5
    .param p1, "n"    # J

    .prologue
    .line 96
    .local p0, "this":Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber$1;, "Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber.1;"
    sget-object v0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->REQUESTED:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    iget-object v1, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber$1;->this$0:Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;

    invoke-virtual {v0, v1, p1, p2}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndAdd(Ljava/lang/Object;J)J

    .line 97
    iget-object v0, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber$1;->this$0:Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;

    invoke-virtual {v0}, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->schedule()V

    .line 98
    return-void
.end method
