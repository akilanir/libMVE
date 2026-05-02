.class final Lrx/internal/operators/OnSubscribeRange$RangeProducer;
.super Ljava/lang/Object;
.source "OnSubscribeRange.java"

# interfaces
.implements Lrx/Producer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OnSubscribeRange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RangeProducer"
.end annotation


# static fields
.field private static final REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicLongFieldUpdater",
            "<",
            "Lrx/internal/operators/OnSubscribeRange$RangeProducer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final end:I

.field private index:J

.field private final o:Lrx/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Subscriber",
            "<-",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private volatile requested:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 46
    const-class v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;

    const-string v1, "requested"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-result-object v0

    sput-object v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    return-void
.end method

.method private constructor <init>(Lrx/Subscriber;II)V
    .registers 6
    .param p2, "start"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Ljava/lang/Integer;",
            ">;II)V"
        }
    .end annotation

    .prologue
    .line 50
    .local p1, "o":Lrx/Subscriber;, "Lrx/Subscriber<-Ljava/lang/Integer;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->o:Lrx/Subscriber;

    .line 52
    int-to-long v0, p2

    iput-wide v0, p0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->index:J

    .line 53
    iput p3, p0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->end:I

    .line 54
    return-void
.end method

.method synthetic constructor <init>(Lrx/Subscriber;IILrx/internal/operators/OnSubscribeRange$1;)V
    .registers 5
    .param p1, "x0"    # Lrx/Subscriber;
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # Lrx/internal/operators/OnSubscribeRange$1;

    .prologue
    .line 42
    invoke-direct {p0, p1, p2, p3}, Lrx/internal/operators/OnSubscribeRange$RangeProducer;-><init>(Lrx/Subscriber;II)V

    return-void
.end method


# virtual methods
.method public request(J)V
    .registers 26
    .param p1, "n"    # J

    .prologue
    .line 58
    sget-object v19, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v19

    const-wide v21, 0x7fffffffffffffffL

    cmp-long v19, v19, v21

    if-nez v19, :cond_14

    .line 108
    :cond_13
    :goto_13
    return-void

    .line 62
    :cond_14
    const-wide v19, 0x7fffffffffffffffL

    cmp-long v19, p1, v19

    if-nez v19, :cond_72

    .line 63
    sget-object v19, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    move-wide/from16 v2, p1

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->set(Ljava/lang/Object;J)V

    .line 65
    move-object/from16 v0, p0

    iget-wide v9, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->index:J

    .local v9, "i":J
    :goto_2c
    move-object/from16 v0, p0

    iget v0, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->end:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v19, v0

    cmp-long v19, v9, v19

    if-gtz v19, :cond_5c

    .line 66
    move-object/from16 v0, p0

    iget-object v0, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->o:Lrx/Subscriber;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v19

    if-nez v19, :cond_13

    .line 69
    move-object/from16 v0, p0

    iget-object v0, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->o:Lrx/Subscriber;

    move-object/from16 v19, v0

    long-to-int v0, v9

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 65
    const-wide/16 v19, 0x1

    add-long v9, v9, v19

    goto :goto_2c

    .line 71
    :cond_5c
    move-object/from16 v0, p0

    iget-object v0, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->o:Lrx/Subscriber;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v19

    if-nez v19, :cond_13

    .line 72
    move-object/from16 v0, p0

    iget-object v0, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->o:Lrx/Subscriber;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lrx/Subscriber;->onCompleted()V

    goto :goto_13

    .line 74
    .end local v9    # "i":J
    :cond_72
    const-wide/16 v19, 0x0

    cmp-long v19, p1, v19

    if-lez v19, :cond_13

    .line 76
    sget-object v19, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    move-wide/from16 v2, p1

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndAdd(Ljava/lang/Object;J)J

    move-result-wide v4

    .line 77
    .local v4, "_c":J
    const-wide/16 v19, 0x0

    cmp-long v19, v4, v19

    if-nez v19, :cond_13

    .line 83
    :cond_8a
    move-object/from16 v0, p0

    iget-wide v15, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->requested:J

    .line 84
    .local v15, "r":J
    move-object/from16 v0, p0

    iget-wide v11, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->index:J

    .line 85
    .local v11, "idx":J
    move-object/from16 v0, p0

    iget v0, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->end:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v19, v0

    sub-long v19, v19, v11

    const-wide/16 v21, 0x1

    add-long v13, v19, v21

    .line 86
    .local v13, "numLeft":J
    invoke-static/range {v13 .. v16}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v7

    .line 87
    .local v7, "e":J
    cmp-long v19, v13, v15

    if-gtz v19, :cond_d4

    const/4 v6, 0x1

    .line 88
    .local v6, "completeOnFinish":Z
    :goto_ac
    add-long v17, v7, v11

    .line 89
    .local v17, "stopAt":J
    move-wide v9, v11

    .restart local v9    # "i":J
    :goto_af
    cmp-long v19, v9, v17

    if-gez v19, :cond_d6

    .line 90
    move-object/from16 v0, p0

    iget-object v0, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->o:Lrx/Subscriber;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v19

    if-nez v19, :cond_13

    .line 93
    move-object/from16 v0, p0

    iget-object v0, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->o:Lrx/Subscriber;

    move-object/from16 v19, v0

    long-to-int v0, v9

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 89
    const-wide/16 v19, 0x1

    add-long v9, v9, v19

    goto :goto_af

    .line 87
    .end local v6    # "completeOnFinish":Z
    .end local v9    # "i":J
    .end local v17    # "stopAt":J
    :cond_d4
    const/4 v6, 0x0

    goto :goto_ac

    .line 95
    .restart local v6    # "completeOnFinish":Z
    .restart local v9    # "i":J
    .restart local v17    # "stopAt":J
    :cond_d6
    move-wide/from16 v0, v17

    move-object/from16 v2, p0

    iput-wide v0, v2, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->index:J

    .line 97
    if-eqz v6, :cond_e9

    .line 98
    move-object/from16 v0, p0

    iget-object v0, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->o:Lrx/Subscriber;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lrx/Subscriber;->onCompleted()V

    goto/16 :goto_13

    .line 101
    :cond_e9
    sget-object v19, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    neg-long v0, v7

    move-wide/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    move-wide/from16 v2, v20

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->addAndGet(Ljava/lang/Object;J)J

    move-result-wide v19

    const-wide/16 v21, 0x0

    cmp-long v19, v19, v21

    if-nez v19, :cond_8a

    goto/16 :goto_13
.end method
