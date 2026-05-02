.class public Lrx/android/operators/OperatorTextViewInput;
.super Ljava/lang/Object;
.source "OperatorTextViewInput.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/android/operators/OperatorTextViewInput$SimpleTextWatcher;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/Observable$OnSubscribe",
        "<",
        "Lrx/android/events/OnTextChangeEvent;",
        ">;"
    }
.end annotation


# instance fields
.field private final emitInitialValue:Z

.field private final input:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/widget/TextView;Z)V
    .registers 3
    .param p1, "input"    # Landroid/widget/TextView;
    .param p2, "emitInitialValue"    # Z

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lrx/android/operators/OperatorTextViewInput;->input:Landroid/widget/TextView;

    .line 33
    iput-boolean p2, p0, Lrx/android/operators/OperatorTextViewInput;->emitInitialValue:Z

    .line 34
    return-void
.end method

.method static synthetic access$100(Lrx/android/operators/OperatorTextViewInput;)Landroid/widget/TextView;
    .registers 2
    .param p0, "x0"    # Lrx/android/operators/OperatorTextViewInput;

    .prologue
    .line 27
    iget-object v0, p0, Lrx/android/operators/OperatorTextViewInput;->input:Landroid/widget/TextView;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 27
    check-cast p1, Lrx/Subscriber;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lrx/android/operators/OperatorTextViewInput;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Lrx/android/events/OnTextChangeEvent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p1, "observer":Lrx/Subscriber;, "Lrx/Subscriber<-Lrx/android/events/OnTextChangeEvent;>;"
    invoke-static {}, Lrx/android/observables/Assertions;->assertUiThread()V

    .line 39
    new-instance v1, Lrx/android/operators/OperatorTextViewInput$1;

    invoke-direct {v1, p0, p1}, Lrx/android/operators/OperatorTextViewInput$1;-><init>(Lrx/android/operators/OperatorTextViewInput;Lrx/Subscriber;)V

    .line 46
    .local v1, "watcher":Landroid/text/TextWatcher;
    new-instance v2, Lrx/android/operators/OperatorTextViewInput$2;

    invoke-direct {v2, p0, v1}, Lrx/android/operators/OperatorTextViewInput$2;-><init>(Lrx/android/operators/OperatorTextViewInput;Landroid/text/TextWatcher;)V

    invoke-static {v2}, Lrx/android/subscriptions/AndroidSubscriptions;->unsubscribeInUiThread(Lrx/functions/Action0;)Lrx/Subscription;

    move-result-object v0

    .line 53
    .local v0, "subscription":Lrx/Subscription;
    iget-boolean v2, p0, Lrx/android/operators/OperatorTextViewInput;->emitInitialValue:Z

    if-eqz v2, :cond_1f

    .line 54
    new-instance v2, Lrx/android/events/OnTextChangeEvent;

    iget-object v3, p0, Lrx/android/operators/OperatorTextViewInput;->input:Landroid/widget/TextView;

    invoke-direct {v2, v3}, Lrx/android/events/OnTextChangeEvent;-><init>(Landroid/widget/TextView;)V

    invoke-virtual {p1, v2}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 57
    :cond_1f
    iget-object v2, p0, Lrx/android/operators/OperatorTextViewInput;->input:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 58
    invoke-virtual {p1, v0}, Lrx/Subscriber;->add(Lrx/Subscription;)V

    .line 59
    return-void
.end method
