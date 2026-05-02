.class public final Lrx/internal/operators/OperatorMulticast;
.super Lrx/observables/ConnectableObservable;
.source "OperatorMulticast.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/observables/ConnectableObservable",
        "<TR;>;"
    }
.end annotation


# instance fields
.field private final connectedSubject:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lrx/subjects/Subject",
            "<-TT;+TR;>;>;"
        }
    .end annotation
.end field

.field final guard:Ljava/lang/Object;

.field final source:Lrx/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Observable",
            "<+TT;>;"
        }
    .end annotation
.end field

.field final subjectFactory:Lrx/functions/Func0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/functions/Func0",
            "<+",
            "Lrx/subjects/Subject",
            "<-TT;+TR;>;>;"
        }
    .end annotation
.end field

.field subscription:Lrx/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Subscriber",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final waitingForConnect:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lrx/Subscriber",
            "<-TR;>;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/List;Lrx/Observable;Lrx/functions/Func0;)V
    .registers 7
    .param p1, "guard"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lrx/subjects/Subject",
            "<-TT;+TR;>;>;",
            "Ljava/util/List",
            "<",
            "Lrx/Subscriber",
            "<-TR;>;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/functions/Func0",
            "<+",
            "Lrx/subjects/Subject",
            "<-TT;+TR;>;>;)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, "this":Lrx/internal/operators/OperatorMulticast;, "Lrx/internal/operators/OperatorMulticast<TT;TR;>;"
    .local p2, "connectedSubject":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lrx/subjects/Subject<-TT;+TR;>;>;"
    .local p3, "waitingForConnect":Ljava/util/List;, "Ljava/util/List<Lrx/Subscriber<-TR;>;>;"
    .local p4, "source":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p5, "subjectFactory":Lrx/functions/Func0;, "Lrx/functions/Func0<+Lrx/subjects/Subject<-TT;+TR;>;>;"
    new-instance v0, Lrx/internal/operators/OperatorMulticast$1;

    invoke-direct {v0, p1, p2, p3}, Lrx/internal/operators/OperatorMulticast$1;-><init>(Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/List;)V

    invoke-direct {p0, v0}, Lrx/observables/ConnectableObservable;-><init>(Lrx/Observable$OnSubscribe;)V

    .line 69
    iput-object p1, p0, Lrx/internal/operators/OperatorMulticast;->guard:Ljava/lang/Object;

    .line 70
    iput-object p2, p0, Lrx/internal/operators/OperatorMulticast;->connectedSubject:Ljava/util/concurrent/atomic/AtomicReference;

    .line 71
    iput-object p3, p0, Lrx/internal/operators/OperatorMulticast;->waitingForConnect:Ljava/util/List;

    .line 72
    iput-object p4, p0, Lrx/internal/operators/OperatorMulticast;->source:Lrx/Observable;

    .line 73
    iput-object p5, p0, Lrx/internal/operators/OperatorMulticast;->subjectFactory:Lrx/functions/Func0;

    .line 74
    return-void
.end method

.method public constructor <init>(Lrx/Observable;Lrx/functions/Func0;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/functions/Func0",
            "<+",
            "Lrx/subjects/Subject",
            "<-TT;+TR;>;>;)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lrx/internal/operators/OperatorMulticast;, "Lrx/internal/operators/OperatorMulticast<TT;TR;>;"
    .local p1, "source":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "subjectFactory":Lrx/functions/Func0;, "Lrx/functions/Func0<+Lrx/subjects/Subject<-TT;+TR;>;>;"
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v2, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    move-object v0, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lrx/internal/operators/OperatorMulticast;-><init>(Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/List;Lrx/Observable;Lrx/functions/Func0;)V

    .line 52
    return-void
.end method

.method static synthetic access$000(Lrx/internal/operators/OperatorMulticast;)Ljava/util/concurrent/atomic/AtomicReference;
    .registers 2
    .param p0, "x0"    # Lrx/internal/operators/OperatorMulticast;

    .prologue
    .line 40
    iget-object v0, p0, Lrx/internal/operators/OperatorMulticast;->connectedSubject:Ljava/util/concurrent/atomic/AtomicReference;

    return-object v0
.end method


# virtual methods
.method public connect(Lrx/functions/Action1;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Action1",
            "<-",
            "Lrx/Subscription;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "this":Lrx/internal/operators/OperatorMulticast;, "Lrx/internal/operators/OperatorMulticast<TT;TR;>;"
    .local p1, "connection":Lrx/functions/Action1;, "Lrx/functions/Action1<-Lrx/Subscription;>;"
    const/4 v2, 0x0

    .line 83
    .local v2, "shouldSubscribe":Z
    iget-object v6, p0, Lrx/internal/operators/OperatorMulticast;->guard:Ljava/lang/Object;

    monitor-enter v6

    .line 84
    :try_start_4
    iget-object v5, p0, Lrx/internal/operators/OperatorMulticast;->subscription:Lrx/Subscriber;

    if-eqz v5, :cond_a

    .line 86
    monitor-exit v6

    .line 148
    :cond_9
    :goto_9
    return-void

    .line 88
    :cond_a
    const/4 v2, 0x1

    .line 90
    iget-object v5, p0, Lrx/internal/operators/OperatorMulticast;->subjectFactory:Lrx/functions/Func0;

    invoke-interface {v5}, Lrx/functions/Func0;->call()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lrx/subjects/Subject;

    .line 93
    .local v3, "subject":Lrx/subjects/Subject;, "Lrx/subjects/Subject<-TT;+TR;>;"
    new-instance v5, Lrx/internal/operators/OperatorMulticast$2;

    invoke-direct {v5, p0, v3}, Lrx/internal/operators/OperatorMulticast$2;-><init>(Lrx/internal/operators/OperatorMulticast;Lrx/subjects/Subject;)V

    iput-object v5, p0, Lrx/internal/operators/OperatorMulticast;->subscription:Lrx/Subscriber;

    .line 111
    iget-object v5, p0, Lrx/internal/operators/OperatorMulticast;->waitingForConnect:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_20
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_33

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrx/Subscriber;

    .line 112
    .local v1, "s":Lrx/Subscriber;, "Lrx/Subscriber<-TR;>;"
    invoke-virtual {v3, v1}, Lrx/subjects/Subject;->unsafeSubscribe(Lrx/Subscriber;)Lrx/Subscription;

    goto :goto_20

    .line 119
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "s":Lrx/Subscriber;, "Lrx/Subscriber<-TR;>;"
    .end local v3    # "subject":Lrx/subjects/Subject;, "Lrx/subjects/Subject<-TT;+TR;>;"
    :catchall_30
    move-exception v5

    monitor-exit v6
    :try_end_32
    .catchall {:try_start_4 .. :try_end_32} :catchall_30

    throw v5

    .line 115
    .restart local v0    # "i$":Ljava/util/Iterator;
    .restart local v3    # "subject":Lrx/subjects/Subject;, "Lrx/subjects/Subject<-TT;+TR;>;"
    :cond_33
    :try_start_33
    iget-object v5, p0, Lrx/internal/operators/OperatorMulticast;->waitingForConnect:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->clear()V

    .line 117
    iget-object v5, p0, Lrx/internal/operators/OperatorMulticast;->connectedSubject:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 119
    monitor-exit v6
    :try_end_3e
    .catchall {:try_start_33 .. :try_end_3e} :catchall_30

    .line 122
    if-eqz v2, :cond_9

    .line 124
    new-instance v5, Lrx/internal/operators/OperatorMulticast$3;

    invoke-direct {v5, p0}, Lrx/internal/operators/OperatorMulticast$3;-><init>(Lrx/internal/operators/OperatorMulticast;)V

    invoke-static {v5}, Lrx/subscriptions/Subscriptions;->create(Lrx/functions/Action0;)Lrx/Subscription;

    move-result-object v5

    invoke-interface {p1, v5}, Lrx/functions/Action1;->call(Ljava/lang/Object;)V

    .line 142
    iget-object v6, p0, Lrx/internal/operators/OperatorMulticast;->guard:Ljava/lang/Object;

    monitor-enter v6

    .line 143
    :try_start_4f
    iget-object v5, p0, Lrx/internal/operators/OperatorMulticast;->subscription:Lrx/Subscriber;

    if-nez v5, :cond_5f

    const/4 v4, 0x1

    .line 144
    .local v4, "subscriptionIsNull":Z
    :goto_54
    monitor-exit v6
    :try_end_55
    .catchall {:try_start_4f .. :try_end_55} :catchall_61

    .line 145
    if-nez v4, :cond_9

    .line 146
    iget-object v5, p0, Lrx/internal/operators/OperatorMulticast;->source:Lrx/Observable;

    iget-object v6, p0, Lrx/internal/operators/OperatorMulticast;->subscription:Lrx/Subscriber;

    invoke-virtual {v5, v6}, Lrx/Observable;->subscribe(Lrx/Subscriber;)Lrx/Subscription;

    goto :goto_9

    .line 143
    .end local v4    # "subscriptionIsNull":Z
    :cond_5f
    const/4 v4, 0x0

    goto :goto_54

    .line 144
    :catchall_61
    move-exception v5

    :try_start_62
    monitor-exit v6
    :try_end_63
    .catchall {:try_start_62 .. :try_end_63} :catchall_61

    throw v5
.end method
