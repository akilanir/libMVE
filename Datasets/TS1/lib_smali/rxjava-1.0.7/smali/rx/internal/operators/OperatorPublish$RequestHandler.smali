.class Lrx/internal/operators/OperatorPublish$RequestHandler;
.super Ljava/lang/Object;
.source "OperatorPublish.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorPublish;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RequestHandler"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field static final WIP:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicLongFieldUpdater",
            "<",
            "Lrx/internal/operators/OperatorPublish$RequestHandler;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final notifier:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final state:Lrx/internal/operators/OperatorPublish$State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorPublish$State",
            "<TT;>;"
        }
    .end annotation
.end field

.field volatile wip:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 286
    const-class v0, Lrx/internal/operators/OperatorPublish$RequestHandler;

    const-string v1, "wip"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-result-object v0

    sput-object v0, Lrx/internal/operators/OperatorPublish$RequestHandler;->WIP:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    return-void
.end method

.method private constructor <init>()V
    .registers 3

    .prologue
    .line 279
    .local p0, "this":Lrx/internal/operators/OperatorPublish$RequestHandler;, "Lrx/internal/operators/OperatorPublish$RequestHandler<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 280
    invoke-static {}, Lrx/internal/operators/NotificationLite;->instance()Lrx/internal/operators/NotificationLite;

    move-result-object v0

    iput-object v0, p0, Lrx/internal/operators/OperatorPublish$RequestHandler;->notifier:Lrx/internal/operators/NotificationLite;

    .line 282
    new-instance v0, Lrx/internal/operators/OperatorPublish$State;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lrx/internal/operators/OperatorPublish$State;-><init>(Lrx/internal/operators/OperatorPublish$1;)V

    iput-object v0, p0, Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;

    return-void
.end method

.method synthetic constructor <init>(Lrx/internal/operators/OperatorPublish$1;)V
    .registers 2
    .param p1, "x0"    # Lrx/internal/operators/OperatorPublish$1;

    .prologue
    .line 279
    .local p0, "this":Lrx/internal/operators/OperatorPublish$RequestHandler;, "Lrx/internal/operators/OperatorPublish$RequestHandler<TT;>;"
    invoke-direct {p0}, Lrx/internal/operators/OperatorPublish$RequestHandler;-><init>()V

    return-void
.end method

.method static synthetic access$200(Lrx/internal/operators/OperatorPublish$RequestHandler;)Lrx/internal/operators/OperatorPublish$State;
    .registers 2
    .param p0, "x0"    # Lrx/internal/operators/OperatorPublish$RequestHandler;

    .prologue
    .line 279
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;

    return-object v0
.end method

.method static synthetic access$400(Lrx/internal/operators/OperatorPublish$RequestHandler;)Lrx/internal/operators/NotificationLite;
    .registers 2
    .param p0, "x0"    # Lrx/internal/operators/OperatorPublish$RequestHandler;

    .prologue
    .line 279
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$RequestHandler;->notifier:Lrx/internal/operators/NotificationLite;

    return-object v0
.end method

.method private requestMoreAfterEmission(I)V
    .registers 9
    .param p1, "emitted"    # I

    .prologue
    .line 311
    .local p0, "this":Lrx/internal/operators/OperatorPublish$RequestHandler;, "Lrx/internal/operators/OperatorPublish$RequestHandler<TT;>;"
    iget-object v3, p0, Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;

    invoke-virtual {v3}, Lrx/internal/operators/OperatorPublish$State;->getOrigin()Lrx/internal/operators/OperatorPublish$OriginSubscriber;

    move-result-object v0

    .line 312
    .local v0, "origin":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    if-lez p1, :cond_27

    if-eqz v0, :cond_27

    .line 313
    # getter for: Lrx/internal/operators/OperatorPublish$OriginSubscriber;->originOutstanding:Ljava/util/concurrent/atomic/AtomicLong;
    invoke-static {v0}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->access$700(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v3

    neg-int v4, p1

    int-to-long v4, v4

    invoke-virtual {v3, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    move-result-wide v1

    .line 314
    .local v1, "r":J
    # getter for: Lrx/internal/operators/OperatorPublish$OriginSubscriber;->THRESHOLD:J
    invoke-static {v0}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->access$800(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)J

    move-result-wide v3

    cmp-long v3, v1, v3

    if-gtz v3, :cond_27

    .line 315
    sget v3, Lrx/internal/util/RxRingBuffer;->SIZE:I

    int-to-long v3, v3

    # getter for: Lrx/internal/operators/OperatorPublish$OriginSubscriber;->THRESHOLD:J
    invoke-static {v0}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->access$800(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)J

    move-result-wide v5

    sub-long/2addr v3, v5

    # invokes: Lrx/internal/operators/OperatorPublish$OriginSubscriber;->requestMore(J)V
    invoke-static {v0, v3, v4}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->access$900(Lrx/internal/operators/OperatorPublish$OriginSubscriber;J)V

    .line 318
    .end local v1    # "r":J
    :cond_27
    return-void
.end method


# virtual methods
.method public drainQueue(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)V
    .registers 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorPublish$OriginSubscriber",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 321
    .local p0, "this":Lrx/internal/operators/OperatorPublish$RequestHandler;, "Lrx/internal/operators/OperatorPublish$RequestHandler<TT;>;"
    .local p1, "originSubscriber":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    sget-object v13, Lrx/internal/operators/OperatorPublish$RequestHandler;->WIP:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    move-result-wide v13

    const-wide/16 v15, 0x0

    cmp-long v13, v13, v15

    if-nez v13, :cond_41

    .line 322
    move-object/from16 v0, p0

    iget-object v7, v0, Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;

    .line 323
    .local v7, "localState":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    # getter for: Lrx/internal/operators/OperatorPublish$State;->ss:Ljava/util/Map;
    invoke-static {v7}, Lrx/internal/operators/OperatorPublish$State;->access$1000(Lrx/internal/operators/OperatorPublish$State;)Ljava/util/Map;

    move-result-object v6

    .line 324
    .local v6, "localMap":Ljava/util/Map;, "Ljava/util/Map<Lrx/Subscriber<-TT;>;Ljava/util/concurrent/atomic/AtomicLong;>;"
    # getter for: Lrx/internal/operators/OperatorPublish$OriginSubscriber;->buffer:Lrx/internal/util/RxRingBuffer;
    invoke-static/range {p1 .. p1}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->access$600(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)Lrx/internal/util/RxRingBuffer;

    move-result-object v5

    .line 325
    .local v5, "localBuffer":Lrx/internal/util/RxRingBuffer;
    move-object/from16 v0, p0

    iget-object v8, v0, Lrx/internal/operators/OperatorPublish$RequestHandler;->notifier:Lrx/internal/operators/NotificationLite;

    .line 327
    .local v8, "nl":Lrx/internal/operators/NotificationLite;, "Lrx/internal/operators/NotificationLite<TT;>;"
    const/4 v2, 0x0

    .line 333
    .local v2, "emitted":I
    :cond_1f
    sget-object v13, Lrx/internal/operators/OperatorPublish$RequestHandler;->WIP:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    const-wide/16 v14, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v13, v0, v14, v15}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->set(Ljava/lang/Object;J)V

    .line 341
    :goto_28
    invoke-virtual {v7}, Lrx/internal/operators/OperatorPublish$State;->canEmitWithDecrement()Z

    move-result v12

    .line 342
    .local v12, "shouldEmit":Z
    if-nez v12, :cond_42

    .line 361
    :goto_2e
    sget-object v13, Lrx/internal/operators/OperatorPublish$RequestHandler;->WIP:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->decrementAndGet(Ljava/lang/Object;)J

    move-result-wide v13

    const-wide/16 v15, 0x0

    cmp-long v13, v13, v15

    if-gtz v13, :cond_1f

    .line 362
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lrx/internal/operators/OperatorPublish$RequestHandler;->requestMoreAfterEmission(I)V

    .line 364
    .end local v2    # "emitted":I
    .end local v5    # "localBuffer":Lrx/internal/util/RxRingBuffer;
    .end local v6    # "localMap":Ljava/util/Map;, "Ljava/util/Map<Lrx/Subscriber<-TT;>;Ljava/util/concurrent/atomic/AtomicLong;>;"
    .end local v7    # "localState":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    .end local v8    # "nl":Lrx/internal/operators/NotificationLite;, "Lrx/internal/operators/NotificationLite<TT;>;"
    .end local v12    # "shouldEmit":Z
    :cond_41
    return-void

    .line 345
    .restart local v2    # "emitted":I
    .restart local v5    # "localBuffer":Lrx/internal/util/RxRingBuffer;
    .restart local v6    # "localMap":Ljava/util/Map;, "Ljava/util/Map<Lrx/Subscriber<-TT;>;Ljava/util/concurrent/atomic/AtomicLong;>;"
    .restart local v7    # "localState":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    .restart local v8    # "nl":Lrx/internal/operators/NotificationLite;, "Lrx/internal/operators/NotificationLite<TT;>;"
    .restart local v12    # "shouldEmit":Z
    :cond_42
    invoke-virtual {v5}, Lrx/internal/util/RxRingBuffer;->poll()Ljava/lang/Object;

    move-result-object v9

    .line 346
    .local v9, "o":Ljava/lang/Object;
    if-nez v9, :cond_4c

    .line 348
    invoke-virtual {v7}, Lrx/internal/operators/OperatorPublish$State;->incrementOutstandingAfterFailedEmit()V

    goto :goto_2e

    .line 352
    :cond_4c
    invoke-virtual {v7}, Lrx/internal/operators/OperatorPublish$State;->getSubscribers()[Lrx/Subscriber;

    move-result-object v1

    .local v1, "arr$":[Lrx/Subscriber;
    array-length v4, v1

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_52
    if-ge v3, v4, :cond_67

    aget-object v11, v1, v3

    .line 353
    .local v11, "s":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    invoke-interface {v6, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/concurrent/atomic/AtomicLong;

    .line 354
    .local v10, "req":Ljava/util/concurrent/atomic/AtomicLong;
    if-eqz v10, :cond_64

    .line 355
    invoke-virtual {v8, v11, v9}, Lrx/internal/operators/NotificationLite;->accept(Lrx/Observer;Ljava/lang/Object;)Z

    .line 356
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicLong;->decrementAndGet()J

    .line 352
    :cond_64
    add-int/lit8 v3, v3, 0x1

    goto :goto_52

    .line 359
    .end local v10    # "req":Ljava/util/concurrent/atomic/AtomicLong;
    .end local v11    # "s":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    :cond_67
    add-int/lit8 v2, v2, 0x1

    .line 360
    goto :goto_28
.end method

.method public emit(Ljava/lang/Object;)V
    .registers 5
    .param p1, "t"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lrx/exceptions/MissingBackpressureException;
        }
    .end annotation

    .prologue
    .line 297
    .local p0, "this":Lrx/internal/operators/OperatorPublish$RequestHandler;, "Lrx/internal/operators/OperatorPublish$RequestHandler<TT;>;"
    iget-object v1, p0, Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;

    invoke-virtual {v1}, Lrx/internal/operators/OperatorPublish$State;->getOrigin()Lrx/internal/operators/OperatorPublish$OriginSubscriber;

    move-result-object v0

    .line 298
    .local v0, "originSubscriber":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    if-nez v0, :cond_9

    .line 308
    :goto_8
    return-void

    .line 302
    :cond_9
    iget-object v1, p0, Lrx/internal/operators/OperatorPublish$RequestHandler;->notifier:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v1, p1}, Lrx/internal/operators/NotificationLite;->isCompleted(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 303
    # getter for: Lrx/internal/operators/OperatorPublish$OriginSubscriber;->buffer:Lrx/internal/util/RxRingBuffer;
    invoke-static {v0}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->access$600(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)Lrx/internal/util/RxRingBuffer;

    move-result-object v1

    invoke-virtual {v1}, Lrx/internal/util/RxRingBuffer;->onCompleted()V

    .line 307
    :goto_18
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorPublish$RequestHandler;->drainQueue(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)V

    goto :goto_8

    .line 305
    :cond_1c
    # getter for: Lrx/internal/operators/OperatorPublish$OriginSubscriber;->buffer:Lrx/internal/util/RxRingBuffer;
    invoke-static {v0}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->access$600(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)Lrx/internal/util/RxRingBuffer;

    move-result-object v1

    iget-object v2, p0, Lrx/internal/operators/OperatorPublish$RequestHandler;->notifier:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v2, p1}, Lrx/internal/operators/NotificationLite;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lrx/internal/util/RxRingBuffer;->onNext(Ljava/lang/Object;)V

    goto :goto_18
.end method

.method public requestFromChildSubscriber(Lrx/Subscriber;J)V
    .registers 6
    .param p2, "request"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;J)V"
        }
    .end annotation

    .prologue
    .line 289
    .local p0, "this":Lrx/internal/operators/OperatorPublish$RequestHandler;, "Lrx/internal/operators/OperatorPublish$RequestHandler<TT;>;"
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    iget-object v1, p0, Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;

    invoke-virtual {v1, p1, p2, p3}, Lrx/internal/operators/OperatorPublish$State;->requestFromSubscriber(Lrx/Subscriber;J)J

    .line 290
    iget-object v1, p0, Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;

    invoke-virtual {v1}, Lrx/internal/operators/OperatorPublish$State;->getOrigin()Lrx/internal/operators/OperatorPublish$OriginSubscriber;

    move-result-object v0

    .line 291
    .local v0, "originSubscriber":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    if-eqz v0, :cond_10

    .line 292
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorPublish$RequestHandler;->drainQueue(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)V

    .line 294
    :cond_10
    return-void
.end method
