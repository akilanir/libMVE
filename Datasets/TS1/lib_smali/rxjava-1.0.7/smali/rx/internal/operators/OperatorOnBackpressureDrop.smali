.class public Lrx/internal/operators/OperatorOnBackpressureDrop;
.super Ljava/lang/Object;
.source "OperatorOnBackpressureDrop.java"

# interfaces
.implements Lrx/Observable$Operator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorOnBackpressureDrop$Holder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/Observable$Operator",
        "<TT;TT;>;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 37
    .local p0, "this":Lrx/internal/operators/OperatorOnBackpressureDrop;, "Lrx/internal/operators/OperatorOnBackpressureDrop<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lrx/internal/operators/OperatorOnBackpressureDrop$1;)V
    .registers 2
    .param p1, "x0"    # Lrx/internal/operators/OperatorOnBackpressureDrop$1;

    .prologue
    .line 24
    .local p0, "this":Lrx/internal/operators/OperatorOnBackpressureDrop;, "Lrx/internal/operators/OperatorOnBackpressureDrop<TT;>;"
    invoke-direct {p0}, Lrx/internal/operators/OperatorOnBackpressureDrop;-><init>()V

    return-void
.end method

.method public static instance()Lrx/internal/operators/OperatorOnBackpressureDrop;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lrx/internal/operators/OperatorOnBackpressureDrop",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 35
    sget-object v0, Lrx/internal/operators/OperatorOnBackpressureDrop$Holder;->INSTANCE:Lrx/internal/operators/OperatorOnBackpressureDrop;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 24
    .local p0, "this":Lrx/internal/operators/OperatorOnBackpressureDrop;, "Lrx/internal/operators/OperatorOnBackpressureDrop<TT;>;"
    check-cast p1, Lrx/Subscriber;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorOnBackpressureDrop;->call(Lrx/Subscriber;)Lrx/Subscriber;

    move-result-object v0

    return-object v0
.end method

.method public call(Lrx/Subscriber;)Lrx/Subscriber;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;)",
            "Lrx/Subscriber",
            "<-TT;>;"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lrx/internal/operators/OperatorOnBackpressureDrop;, "Lrx/internal/operators/OperatorOnBackpressureDrop<TT;>;"
    .local p1, "child":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 42
    .local v0, "requested":Ljava/util/concurrent/atomic/AtomicLong;
    new-instance v1, Lrx/internal/operators/OperatorOnBackpressureDrop$1;

    invoke-direct {v1, p0, v0}, Lrx/internal/operators/OperatorOnBackpressureDrop$1;-><init>(Lrx/internal/operators/OperatorOnBackpressureDrop;Ljava/util/concurrent/atomic/AtomicLong;)V

    invoke-virtual {p1, v1}, Lrx/Subscriber;->setProducer(Lrx/Producer;)V

    .line 50
    new-instance v1, Lrx/internal/operators/OperatorOnBackpressureDrop$2;

    invoke-direct {v1, p0, p1, p1, v0}, Lrx/internal/operators/OperatorOnBackpressureDrop$2;-><init>(Lrx/internal/operators/OperatorOnBackpressureDrop;Lrx/Subscriber;Lrx/Subscriber;Ljava/util/concurrent/atomic/AtomicLong;)V

    return-object v1
.end method
