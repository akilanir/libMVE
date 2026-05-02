.class public final Lrx/android/operators/OperatorViewClick;
.super Ljava/lang/Object;
.source "OperatorViewClick.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/android/operators/OperatorViewClick$CachedListeners;,
        Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/Observable$OnSubscribe",
        "<",
        "Lrx/android/events/OnClickEvent;",
        ">;"
    }
.end annotation


# instance fields
.field private final emitInitialValue:Z

.field private final view:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;Z)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "emitInitialValue"    # Z

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-boolean p2, p0, Lrx/android/operators/OperatorViewClick;->emitInitialValue:Z

    .line 36
    iput-object p1, p0, Lrx/android/operators/OperatorViewClick;->view:Landroid/view/View;

    .line 37
    return-void
.end method

.method static synthetic access$000(Lrx/android/operators/OperatorViewClick;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lrx/android/operators/OperatorViewClick;

    .prologue
    .line 30
    iget-object v0, p0, Lrx/android/operators/OperatorViewClick;->view:Landroid/view/View;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 30
    check-cast p1, Lrx/Subscriber;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lrx/android/operators/OperatorViewClick;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Lrx/android/events/OnClickEvent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p1, "observer":Lrx/Subscriber;, "Lrx/Subscriber<-Lrx/android/events/OnClickEvent;>;"
    invoke-static {}, Lrx/android/observables/Assertions;->assertUiThread()V

    .line 42
    iget-object v3, p0, Lrx/android/operators/OperatorViewClick;->view:Landroid/view/View;

    invoke-static {v3}, Lrx/android/operators/OperatorViewClick$CachedListeners;->getFromViewOrCreate(Landroid/view/View;)Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;

    move-result-object v0

    .line 44
    .local v0, "composite":Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;
    new-instance v1, Lrx/android/operators/OperatorViewClick$1;

    invoke-direct {v1, p0, p1}, Lrx/android/operators/OperatorViewClick$1;-><init>(Lrx/android/operators/OperatorViewClick;Lrx/Subscriber;)V

    .line 51
    .local v1, "listener":Landroid/view/View$OnClickListener;
    new-instance v3, Lrx/android/operators/OperatorViewClick$2;

    invoke-direct {v3, p0, v0, v1}, Lrx/android/operators/OperatorViewClick$2;-><init>(Lrx/android/operators/OperatorViewClick;Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;Landroid/view/View$OnClickListener;)V

    invoke-static {v3}, Lrx/android/subscriptions/AndroidSubscriptions;->unsubscribeInUiThread(Lrx/functions/Action0;)Lrx/Subscription;

    move-result-object v2

    .line 58
    .local v2, "subscription":Lrx/Subscription;
    iget-boolean v3, p0, Lrx/android/operators/OperatorViewClick;->emitInitialValue:Z

    if-eqz v3, :cond_25

    .line 59
    new-instance v3, Lrx/android/events/OnClickEvent;

    iget-object v4, p0, Lrx/android/operators/OperatorViewClick;->view:Landroid/view/View;

    invoke-direct {v3, v4}, Lrx/android/events/OnClickEvent;-><init>(Landroid/view/View;)V

    invoke-virtual {p1, v3}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 62
    :cond_25
    invoke-virtual {v0, v1}, Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;->addOnClickListener(Landroid/view/View$OnClickListener;)Z

    .line 63
    invoke-virtual {p1, v2}, Lrx/Subscriber;->add(Lrx/Subscription;)V

    .line 64
    return-void
.end method
