.class public final Lrx/internal/operators/OnSubscribeUsing;
.super Ljava/lang/Object;
.source "OnSubscribeUsing.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OnSubscribeUsing$1;,
        Lrx/internal/operators/OnSubscribeUsing$DisposeAction;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "Resource:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/Observable$OnSubscribe",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final dispose:Lrx/functions/Action1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/functions/Action1",
            "<-TResource;>;"
        }
    .end annotation
.end field

.field private final disposeEagerly:Z

.field private final observableFactory:Lrx/functions/Func1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/functions/Func1",
            "<-TResource;+",
            "Lrx/Observable",
            "<+TT;>;>;"
        }
    .end annotation
.end field

.field private final resourceFactory:Lrx/functions/Func0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/functions/Func0",
            "<TResource;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/functions/Func0;Lrx/functions/Func1;Lrx/functions/Action1;Z)V
    .registers 5
    .param p4, "disposeEagerly"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func0",
            "<TResource;>;",
            "Lrx/functions/Func1",
            "<-TResource;+",
            "Lrx/Observable",
            "<+TT;>;>;",
            "Lrx/functions/Action1",
            "<-TResource;>;Z)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lrx/internal/operators/OnSubscribeUsing;, "Lrx/internal/operators/OnSubscribeUsing<TT;TResource;>;"
    .local p1, "resourceFactory":Lrx/functions/Func0;, "Lrx/functions/Func0<TResource;>;"
    .local p2, "observableFactory":Lrx/functions/Func1;, "Lrx/functions/Func1<-TResource;+Lrx/Observable<+TT;>;>;"
    .local p3, "dispose":Lrx/functions/Action1;, "Lrx/functions/Action1<-TResource;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lrx/internal/operators/OnSubscribeUsing;->resourceFactory:Lrx/functions/Func0;

    .line 45
    iput-object p2, p0, Lrx/internal/operators/OnSubscribeUsing;->observableFactory:Lrx/functions/Func1;

    .line 46
    iput-object p3, p0, Lrx/internal/operators/OnSubscribeUsing;->dispose:Lrx/functions/Action1;

    .line 47
    iput-boolean p4, p0, Lrx/internal/operators/OnSubscribeUsing;->disposeEagerly:Z

    .line 48
    return-void
.end method

.method private disposeEagerlyIfRequested(Lrx/functions/Action0;)Ljava/lang/Throwable;
    .registers 4
    .param p1, "disposeOnceOnly"    # Lrx/functions/Action0;

    .prologue
    .local p0, "this":Lrx/internal/operators/OnSubscribeUsing;, "Lrx/internal/operators/OnSubscribeUsing<TT;TResource;>;"
    const/4 v0, 0x0

    .line 92
    iget-boolean v1, p0, Lrx/internal/operators/OnSubscribeUsing;->disposeEagerly:Z

    if-eqz v1, :cond_8

    .line 94
    :try_start_5
    invoke-interface {p1}, Lrx/functions/Action0;->call()V
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_8} :catch_9

    .line 100
    :cond_8
    :goto_8
    return-object v0

    .line 96
    :catch_9
    move-exception v0

    .line 97
    .local v0, "e":Ljava/lang/Throwable;
    goto :goto_8
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 34
    .local p0, "this":Lrx/internal/operators/OnSubscribeUsing;, "Lrx/internal/operators/OnSubscribeUsing<TT;TResource;>;"
    check-cast p1, Lrx/Subscriber;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lrx/internal/operators/OnSubscribeUsing;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 56
    .local p0, "this":Lrx/internal/operators/OnSubscribeUsing;, "Lrx/internal/operators/OnSubscribeUsing<TT;TResource;>;"
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    :try_start_0
    iget-object v6, p0, Lrx/internal/operators/OnSubscribeUsing;->resourceFactory:Lrx/functions/Func0;

    invoke-interface {v6}, Lrx/functions/Func0;->call()Ljava/lang/Object;

    move-result-object v4

    .line 58
    .local v4, "resource":Ljava/lang/Object;, "TResource;"
    new-instance v1, Lrx/internal/operators/OnSubscribeUsing$DisposeAction;

    iget-object v6, p0, Lrx/internal/operators/OnSubscribeUsing;->dispose:Lrx/functions/Action1;

    const/4 v7, 0x0

    invoke-direct {v1, v6, v4, v7}, Lrx/internal/operators/OnSubscribeUsing$DisposeAction;-><init>(Lrx/functions/Action1;Ljava/lang/Object;Lrx/internal/operators/OnSubscribeUsing$1;)V

    .line 61
    .local v1, "disposeOnceOnly":Lrx/internal/operators/OnSubscribeUsing$DisposeAction;, "Lrx/internal/operators/OnSubscribeUsing$DisposeAction<TResource;>;"
    invoke-virtual {p1, v1}, Lrx/Subscriber;->add(Lrx/Subscription;)V

    .line 63
    iget-object v6, p0, Lrx/internal/operators/OnSubscribeUsing;->observableFactory:Lrx/functions/Func1;

    invoke-interface {v6, v4}, Lrx/functions/Func1;->call(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lrx/Observable;

    .line 68
    .local v5, "source":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    iget-boolean v6, p0, Lrx/internal/operators/OnSubscribeUsing;->disposeEagerly:Z

    if-eqz v6, :cond_25

    .line 69
    invoke-virtual {v5, v1}, Lrx/Observable;->doOnTerminate(Lrx/functions/Action0;)Lrx/Observable;
    :try_end_20
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_20} :catch_44

    move-result-object v3

    .line 76
    .local v3, "observable":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    :goto_21
    :try_start_21
    invoke-virtual {v3, p1}, Lrx/Observable;->unsafeSubscribe(Lrx/Subscriber;)Lrx/Subscription;
    :try_end_24
    .catch Ljava/lang/Throwable; {:try_start_21 .. :try_end_24} :catch_27

    .line 89
    .end local v1    # "disposeOnceOnly":Lrx/internal/operators/OnSubscribeUsing$DisposeAction;, "Lrx/internal/operators/OnSubscribeUsing$DisposeAction<TResource;>;"
    .end local v3    # "observable":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .end local v4    # "resource":Ljava/lang/Object;, "TResource;"
    .end local v5    # "source":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    :goto_24
    return-void

    .line 73
    .restart local v1    # "disposeOnceOnly":Lrx/internal/operators/OnSubscribeUsing$DisposeAction;, "Lrx/internal/operators/OnSubscribeUsing$DisposeAction<TResource;>;"
    .restart local v4    # "resource":Ljava/lang/Object;, "TResource;"
    .restart local v5    # "source":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    :cond_25
    move-object v3, v5

    .restart local v3    # "observable":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    goto :goto_21

    .line 77
    :catch_27
    move-exception v2

    .line 78
    .local v2, "e":Ljava/lang/Throwable;
    :try_start_28
    invoke-direct {p0, v1}, Lrx/internal/operators/OnSubscribeUsing;->disposeEagerlyIfRequested(Lrx/functions/Action0;)Ljava/lang/Throwable;

    move-result-object v0

    .line 79
    .local v0, "disposeError":Ljava/lang/Throwable;
    if-eqz v0, :cond_49

    .line 80
    new-instance v6, Lrx/exceptions/CompositeException;

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Throwable;

    const/4 v8, 0x0

    aput-object v2, v7, v8

    const/4 v8, 0x1

    aput-object v0, v7, v8

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-direct {v6, v7}, Lrx/exceptions/CompositeException;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p1, v6}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V
    :try_end_43
    .catch Ljava/lang/Throwable; {:try_start_28 .. :try_end_43} :catch_44

    goto :goto_24

    .line 85
    .end local v0    # "disposeError":Ljava/lang/Throwable;
    .end local v1    # "disposeOnceOnly":Lrx/internal/operators/OnSubscribeUsing$DisposeAction;, "Lrx/internal/operators/OnSubscribeUsing$DisposeAction<TResource;>;"
    .end local v2    # "e":Ljava/lang/Throwable;
    .end local v3    # "observable":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .end local v4    # "resource":Ljava/lang/Object;, "TResource;"
    .end local v5    # "source":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    :catch_44
    move-exception v2

    .line 87
    .restart local v2    # "e":Ljava/lang/Throwable;
    invoke-virtual {p1, v2}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_24

    .line 83
    .restart local v0    # "disposeError":Ljava/lang/Throwable;
    .restart local v1    # "disposeOnceOnly":Lrx/internal/operators/OnSubscribeUsing$DisposeAction;, "Lrx/internal/operators/OnSubscribeUsing$DisposeAction<TResource;>;"
    .restart local v3    # "observable":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .restart local v4    # "resource":Ljava/lang/Object;, "TResource;"
    .restart local v5    # "source":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    :cond_49
    :try_start_49
    invoke-virtual {p1, v2}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V
    :try_end_4c
    .catch Ljava/lang/Throwable; {:try_start_49 .. :try_end_4c} :catch_44

    goto :goto_24
.end method
