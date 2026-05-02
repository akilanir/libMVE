.class public Lrx/android/operators/OperatorCompoundButtonInput;
.super Ljava/lang/Object;
.source "OperatorCompoundButtonInput.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/android/operators/OperatorCompoundButtonInput$CachedListeners;,
        Lrx/android/operators/OperatorCompoundButtonInput$CompositeOnCheckedChangeListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/Observable$OnSubscribe",
        "<",
        "Lrx/android/events/OnCheckedChangeEvent;",
        ">;"
    }
.end annotation


# instance fields
.field private final button:Landroid/widget/CompoundButton;

.field private final emitInitialValue:Z


# direct methods
.method public constructor <init>(Landroid/widget/CompoundButton;Z)V
    .registers 3
    .param p1, "button"    # Landroid/widget/CompoundButton;
    .param p2, "emitInitialValue"    # Z

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-boolean p2, p0, Lrx/android/operators/OperatorCompoundButtonInput;->emitInitialValue:Z

    .line 37
    iput-object p1, p0, Lrx/android/operators/OperatorCompoundButtonInput;->button:Landroid/widget/CompoundButton;

    .line 38
    return-void
.end method

.method static synthetic access$000(Lrx/android/operators/OperatorCompoundButtonInput;)Landroid/widget/CompoundButton;
    .registers 2
    .param p0, "x0"    # Lrx/android/operators/OperatorCompoundButtonInput;

    .prologue
    .line 31
    iget-object v0, p0, Lrx/android/operators/OperatorCompoundButtonInput;->button:Landroid/widget/CompoundButton;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 31
    check-cast p1, Lrx/Subscriber;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lrx/android/operators/OperatorCompoundButtonInput;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Lrx/android/events/OnCheckedChangeEvent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p1, "observer":Lrx/Subscriber;, "Lrx/Subscriber<-Lrx/android/events/OnCheckedChangeEvent;>;"
    invoke-static {}, Lrx/android/observables/Assertions;->assertUiThread()V

    .line 43
    iget-object v3, p0, Lrx/android/operators/OperatorCompoundButtonInput;->button:Landroid/widget/CompoundButton;

    invoke-static {v3}, Lrx/android/operators/OperatorCompoundButtonInput$CachedListeners;->getFromViewOrCreate(Landroid/widget/CompoundButton;)Lrx/android/operators/OperatorCompoundButtonInput$CompositeOnCheckedChangeListener;

    move-result-object v0

    .line 45
    .local v0, "composite":Lrx/android/operators/OperatorCompoundButtonInput$CompositeOnCheckedChangeListener;
    new-instance v1, Lrx/android/operators/OperatorCompoundButtonInput$1;

    invoke-direct {v1, p0, p1}, Lrx/android/operators/OperatorCompoundButtonInput$1;-><init>(Lrx/android/operators/OperatorCompoundButtonInput;Lrx/Subscriber;)V

    .line 52
    .local v1, "listener":Landroid/widget/CompoundButton$OnCheckedChangeListener;
    new-instance v3, Lrx/android/operators/OperatorCompoundButtonInput$2;

    invoke-direct {v3, p0, v0, v1}, Lrx/android/operators/OperatorCompoundButtonInput$2;-><init>(Lrx/android/operators/OperatorCompoundButtonInput;Lrx/android/operators/OperatorCompoundButtonInput$CompositeOnCheckedChangeListener;Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    invoke-static {v3}, Lrx/android/subscriptions/AndroidSubscriptions;->unsubscribeInUiThread(Lrx/functions/Action0;)Lrx/Subscription;

    move-result-object v2

    .line 59
    .local v2, "subscription":Lrx/Subscription;
    iget-boolean v3, p0, Lrx/android/operators/OperatorCompoundButtonInput;->emitInitialValue:Z

    if-eqz v3, :cond_25

    .line 60
    new-instance v3, Lrx/android/events/OnCheckedChangeEvent;

    iget-object v4, p0, Lrx/android/operators/OperatorCompoundButtonInput;->button:Landroid/widget/CompoundButton;

    invoke-direct {v3, v4}, Lrx/android/events/OnCheckedChangeEvent;-><init>(Landroid/widget/CompoundButton;)V

    invoke-virtual {p1, v3}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 63
    :cond_25
    invoke-virtual {v0, v1}, Lrx/android/operators/OperatorCompoundButtonInput$CompositeOnCheckedChangeListener;->addOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)Z

    .line 64
    invoke-virtual {p1, v2}, Lrx/Subscriber;->add(Lrx/Subscription;)V

    .line 65
    return-void
.end method
