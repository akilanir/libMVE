.class Lrx/internal/operators/OperatorPublish$State;
.super Ljava/lang/Object;
.source "OperatorPublish.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorPublish;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private origin:Lrx/internal/operators/OperatorPublish$OriginSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorPublish$OriginSubscriber",
            "<TT;>;"
        }
    .end annotation
.end field

.field private outstandingRequests:J

.field private final ss:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lrx/Subscriber",
            "<-TT;>;",
            "Ljava/util/concurrent/atomic/AtomicLong;",
            ">;"
        }
    .end annotation
.end field

.field private subscribers:[Lrx/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lrx/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 3

    .prologue
    .line 191
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 192
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lrx/internal/operators/OperatorPublish$State;->outstandingRequests:J

    .line 196
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lrx/internal/operators/OperatorPublish$State;->ss:Ljava/util/Map;

    .line 197
    const/4 v0, 0x0

    new-array v0, v0, [Lrx/Subscriber;

    iput-object v0, p0, Lrx/internal/operators/OperatorPublish$State;->subscribers:[Lrx/Subscriber;

    return-void
.end method

.method synthetic constructor <init>(Lrx/internal/operators/OperatorPublish$1;)V
    .registers 2
    .param p1, "x0"    # Lrx/internal/operators/OperatorPublish$1;

    .prologue
    .line 191
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    invoke-direct {p0}, Lrx/internal/operators/OperatorPublish$State;-><init>()V

    return-void
.end method

.method static synthetic access$1000(Lrx/internal/operators/OperatorPublish$State;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lrx/internal/operators/OperatorPublish$State;

    .prologue
    .line 191
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$State;->ss:Ljava/util/Map;

    return-object v0
.end method

.method private resetAfterSubscriberUpdate(Ljava/util/Map;)J
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Lrx/Subscriber",
            "<-TT;>;",
            "Ljava/util/concurrent/atomic/AtomicLong;",
            ">;)J"
        }
    .end annotation

    .prologue
    .line 259
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    .local p1, "subs":Ljava/util/Map;, "Ljava/util/Map<Lrx/Subscriber<-TT;>;Ljava/util/concurrent/atomic/AtomicLong;>;"
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v10

    new-array v9, v10, [Lrx/Subscriber;

    .line 260
    .local v9, "subscriberArray":[Lrx/Subscriber;, "[Lrx/Subscriber<-TT;>;"
    const/4 v3, 0x0

    .line 261
    .local v3, "i":I
    const-wide/16 v7, -0x1

    .line 262
    .local v7, "lowest":J
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3e

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 263
    .local v2, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lrx/Subscriber<-TT;>;Ljava/util/concurrent/atomic/AtomicLong;>;"
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "i":I
    .local v4, "i":I
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lrx/Subscriber;

    aput-object v10, v9, v3

    .line 264
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/concurrent/atomic/AtomicLong;

    .line 265
    .local v6, "l":Ljava/util/concurrent/atomic/AtomicLong;
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    .line 266
    .local v0, "c":J
    const-wide/16 v10, -0x1

    cmp-long v10, v7, v10

    if-eqz v10, :cond_3b

    cmp-long v10, v0, v7

    if-gez v10, :cond_3c

    .line 267
    :cond_3b
    move-wide v7, v0

    :cond_3c
    move v3, v4

    .line 269
    .end local v4    # "i":I
    .restart local v3    # "i":I
    goto :goto_11

    .line 270
    .end local v0    # "c":J
    .end local v2    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lrx/Subscriber<-TT;>;Ljava/util/concurrent/atomic/AtomicLong;>;"
    .end local v6    # "l":Ljava/util/concurrent/atomic/AtomicLong;
    :cond_3e
    iput-object v9, p0, Lrx/internal/operators/OperatorPublish$State;->subscribers:[Lrx/Subscriber;

    .line 274
    iput-wide v7, p0, Lrx/internal/operators/OperatorPublish$State;->outstandingRequests:J

    .line 275
    return-wide v7
.end method


# virtual methods
.method public declared-synchronized canEmitWithDecrement()Z
    .registers 5

    .prologue
    .line 209
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lrx/internal/operators/OperatorPublish$State;->outstandingRequests:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_13

    .line 210
    iget-wide v0, p0, Lrx/internal/operators/OperatorPublish$State;->outstandingRequests:J

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lrx/internal/operators/OperatorPublish$State;->outstandingRequests:J
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_15

    .line 211
    const/4 v0, 0x1

    .line 213
    :goto_11
    monitor-exit p0

    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_11

    .line 209
    :catchall_15
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getOrigin()Lrx/internal/operators/OperatorPublish$OriginSubscriber;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/internal/operators/OperatorPublish$OriginSubscriber",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 201
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$State;->origin:Lrx/internal/operators/OperatorPublish$OriginSubscriber;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getSubscribers()[Lrx/Subscriber;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Lrx/Subscriber",
            "<-TT;>;"
        }
    .end annotation

    .prologue
    .line 221
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$State;->subscribers:[Lrx/Subscriber;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized incrementOutstandingAfterFailedEmit()V
    .registers 5

    .prologue
    .line 217
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lrx/internal/operators/OperatorPublish$State;->outstandingRequests:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lrx/internal/operators/OperatorPublish$State;->outstandingRequests:J
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .line 218
    monitor-exit p0

    return-void

    .line 217
    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeSubscriber(Lrx/Subscriber;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 252
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$State;->ss:Ljava/util/Map;

    .line 253
    .local v0, "subs":Ljava/util/Map;, "Ljava/util/Map<Lrx/Subscriber<-TT;>;Ljava/util/concurrent/atomic/AtomicLong;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    invoke-direct {p0, v0}, Lrx/internal/operators/OperatorPublish$State;->resetAfterSubscriberUpdate(Ljava/util/Map;)J
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    .line 255
    monitor-exit p0

    return-void

    .line 252
    .end local v0    # "subs":Ljava/util/Map;, "Ljava/util/Map<Lrx/Subscriber<-TT;>;Ljava/util/concurrent/atomic/AtomicLong;>;"
    :catchall_b
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized requestFromSubscriber(Lrx/Subscriber;J)J
    .registers 12
    .param p2, "request"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;J)J"
        }
    .end annotation

    .prologue
    .line 228
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    monitor-enter p0

    :try_start_1
    iget-object v3, p0, Lrx/internal/operators/OperatorPublish$State;->ss:Ljava/util/Map;

    .line 229
    .local v3, "subs":Ljava/util/Map;, "Ljava/util/Map<Lrx/Subscriber<-TT;>;Ljava/util/concurrent/atomic/AtomicLong;>;"
    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/concurrent/atomic/AtomicLong;

    .line 230
    .local v2, "r":Ljava/util/concurrent/atomic/AtomicLong;
    if-nez v2, :cond_19

    .line 231
    new-instance v6, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v6, p2, p3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    invoke-interface {v3, p1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    :cond_13
    :goto_13
    invoke-direct {p0, v3}, Lrx/internal/operators/OperatorPublish$State;->resetAfterSubscriberUpdate(Ljava/util/Map;)J
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_3a

    move-result-wide v6

    monitor-exit p0

    return-wide v6

    .line 234
    :cond_19
    :try_start_19
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    .line 235
    .local v0, "current":J
    const-wide v6, 0x7fffffffffffffffL

    cmp-long v6, v0, v6

    if-eqz v6, :cond_13

    .line 238
    add-long v4, v0, p2

    .line 239
    .local v4, "u":J
    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-gez v6, :cond_33

    .line 240
    const-wide v4, 0x7fffffffffffffffL

    .line 242
    :cond_33
    invoke-virtual {v2, v0, v1, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z
    :try_end_36
    .catchall {:try_start_19 .. :try_end_36} :catchall_3a

    move-result v6

    if-eqz v6, :cond_19

    goto :goto_13

    .line 228
    .end local v0    # "current":J
    .end local v2    # "r":Ljava/util/concurrent/atomic/AtomicLong;
    .end local v3    # "subs":Ljava/util/Map;, "Ljava/util/Map<Lrx/Subscriber<-TT;>;Ljava/util/concurrent/atomic/AtomicLong;>;"
    .end local v4    # "u":J
    :catchall_3a
    move-exception v6

    monitor-exit p0

    throw v6
.end method

.method public declared-synchronized setOrigin(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorPublish$OriginSubscriber",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 205
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    .local p1, "o":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lrx/internal/operators/OperatorPublish$State;->origin:Lrx/internal/operators/OperatorPublish$OriginSubscriber;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 206
    monitor-exit p0

    return-void

    .line 205
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method
