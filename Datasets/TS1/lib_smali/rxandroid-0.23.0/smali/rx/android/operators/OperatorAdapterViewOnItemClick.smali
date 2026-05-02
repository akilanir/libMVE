.class public Lrx/android/operators/OperatorAdapterViewOnItemClick;
.super Ljava/lang/Object;
.source "OperatorAdapterViewOnItemClick.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/android/operators/OperatorAdapterViewOnItemClick$CachedListeners;,
        Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/Observable$OnSubscribe",
        "<",
        "Lrx/android/events/OnItemClickEvent;",
        ">;"
    }
.end annotation


# instance fields
.field private final adapterView:Landroid/widget/AdapterView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/AdapterView",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/widget/AdapterView;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 37
    .local p1, "adapterView":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lrx/android/operators/OperatorAdapterViewOnItemClick;->adapterView:Landroid/widget/AdapterView;

    .line 39
    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 33
    check-cast p1, Lrx/Subscriber;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lrx/android/operators/OperatorAdapterViewOnItemClick;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Lrx/android/events/OnItemClickEvent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p1, "observer":Lrx/Subscriber;, "Lrx/Subscriber<-Lrx/android/events/OnItemClickEvent;>;"
    invoke-static {}, Lrx/android/observables/Assertions;->assertUiThread()V

    .line 44
    iget-object v3, p0, Lrx/android/operators/OperatorAdapterViewOnItemClick;->adapterView:Landroid/widget/AdapterView;

    invoke-static {v3}, Lrx/android/operators/OperatorAdapterViewOnItemClick$CachedListeners;->getFromViewOrCreate(Landroid/widget/AdapterView;)Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;

    move-result-object v0

    .line 46
    .local v0, "composite":Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;
    new-instance v1, Lrx/android/operators/OperatorAdapterViewOnItemClick$1;

    invoke-direct {v1, p0, p1}, Lrx/android/operators/OperatorAdapterViewOnItemClick$1;-><init>(Lrx/android/operators/OperatorAdapterViewOnItemClick;Lrx/Subscriber;)V

    .line 53
    .local v1, "listener":Landroid/widget/AdapterView$OnItemClickListener;
    new-instance v3, Lrx/android/operators/OperatorAdapterViewOnItemClick$2;

    invoke-direct {v3, p0, v0, v1}, Lrx/android/operators/OperatorAdapterViewOnItemClick$2;-><init>(Lrx/android/operators/OperatorAdapterViewOnItemClick;Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;Landroid/widget/AdapterView$OnItemClickListener;)V

    invoke-static {v3}, Lrx/android/subscriptions/AndroidSubscriptions;->unsubscribeInUiThread(Lrx/functions/Action0;)Lrx/Subscription;

    move-result-object v2

    .line 60
    .local v2, "subscription":Lrx/Subscription;
    invoke-virtual {v0, v1}, Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;->addOnClickListener(Landroid/widget/AdapterView$OnItemClickListener;)Z

    .line 61
    invoke-virtual {p1, v2}, Lrx/Subscriber;->add(Lrx/Subscription;)V

    .line 62
    return-void
.end method
