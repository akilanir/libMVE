.class Lrx/android/operators/OperatorConditionalBinding$1;
.super Lrx/Subscriber;
.source "OperatorConditionalBinding.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/android/operators/OperatorConditionalBinding;->call(Lrx/Subscriber;)Lrx/Subscriber;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lrx/Subscriber",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lrx/android/operators/OperatorConditionalBinding;

.field final synthetic val$child:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lrx/android/operators/OperatorConditionalBinding;Lrx/Subscriber;Lrx/Subscriber;)V
    .registers 4

    .prologue
    .line 52
    .local p0, "this":Lrx/android/operators/OperatorConditionalBinding$1;, "Lrx/android/operators/OperatorConditionalBinding.1;"
    .local p2, "x0":Lrx/Subscriber;, "Lrx/Subscriber<*>;"
    iput-object p1, p0, Lrx/android/operators/OperatorConditionalBinding$1;->this$0:Lrx/android/operators/OperatorConditionalBinding;

    iput-object p3, p0, Lrx/android/operators/OperatorConditionalBinding$1;->val$child:Lrx/Subscriber;

    invoke-direct {p0, p2}, Lrx/Subscriber;-><init>(Lrx/Subscriber;)V

    return-void
.end method

.method private handleLostBinding(Ljava/lang/String;)V
    .registers 4
    .param p1, "context"    # Ljava/lang/String;

    .prologue
    .line 86
    .local p0, "this":Lrx/android/operators/OperatorConditionalBinding$1;, "Lrx/android/operators/OperatorConditionalBinding.1;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "bound object has become invalid; skipping "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lrx/android/operators/OperatorConditionalBinding$1;->log(Ljava/lang/String;)V

    .line 87
    const-string v0, "unsubscribing..."

    invoke-direct {p0, v0}, Lrx/android/operators/OperatorConditionalBinding$1;->log(Ljava/lang/String;)V

    .line 88
    iget-object v0, p0, Lrx/android/operators/OperatorConditionalBinding$1;->this$0:Lrx/android/operators/OperatorConditionalBinding;

    const/4 v1, 0x0

    # setter for: Lrx/android/operators/OperatorConditionalBinding;->boundRef:Ljava/lang/Object;
    invoke-static {v0, v1}, Lrx/android/operators/OperatorConditionalBinding;->access$002(Lrx/android/operators/OperatorConditionalBinding;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    invoke-virtual {p0}, Lrx/android/operators/OperatorConditionalBinding$1;->unsubscribe()V

    .line 90
    return-void
.end method

.method private log(Ljava/lang/String;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 93
    .local p0, "this":Lrx/android/operators/OperatorConditionalBinding$1;, "Lrx/android/operators/OperatorConditionalBinding.1;"
    const-string v0, "ConditionalBinding"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 94
    const-string v0, "ConditionalBinding"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    :cond_e
    return-void
.end method

.method private shouldForwardNotification()Z
    .registers 3

    .prologue
    .line 82
    .local p0, "this":Lrx/android/operators/OperatorConditionalBinding$1;, "Lrx/android/operators/OperatorConditionalBinding.1;"
    iget-object v0, p0, Lrx/android/operators/OperatorConditionalBinding$1;->this$0:Lrx/android/operators/OperatorConditionalBinding;

    # getter for: Lrx/android/operators/OperatorConditionalBinding;->boundRef:Ljava/lang/Object;
    invoke-static {v0}, Lrx/android/operators/OperatorConditionalBinding;->access$000(Lrx/android/operators/OperatorConditionalBinding;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_22

    iget-object v0, p0, Lrx/android/operators/OperatorConditionalBinding$1;->this$0:Lrx/android/operators/OperatorConditionalBinding;

    # getter for: Lrx/android/operators/OperatorConditionalBinding;->predicate:Lrx/functions/Func1;
    invoke-static {v0}, Lrx/android/operators/OperatorConditionalBinding;->access$100(Lrx/android/operators/OperatorConditionalBinding;)Lrx/functions/Func1;

    move-result-object v0

    iget-object v1, p0, Lrx/android/operators/OperatorConditionalBinding$1;->this$0:Lrx/android/operators/OperatorConditionalBinding;

    # getter for: Lrx/android/operators/OperatorConditionalBinding;->boundRef:Ljava/lang/Object;
    invoke-static {v1}, Lrx/android/operators/OperatorConditionalBinding;->access$000(Lrx/android/operators/OperatorConditionalBinding;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lrx/functions/Func1;->call(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_22

    const/4 v0, 0x1

    :goto_21
    return v0

    :cond_22
    const/4 v0, 0x0

    goto :goto_21
.end method


# virtual methods
.method public onCompleted()V
    .registers 2

    .prologue
    .line 56
    .local p0, "this":Lrx/android/operators/OperatorConditionalBinding$1;, "Lrx/android/operators/OperatorConditionalBinding.1;"
    invoke-direct {p0}, Lrx/android/operators/OperatorConditionalBinding$1;->shouldForwardNotification()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 57
    iget-object v0, p0, Lrx/android/operators/OperatorConditionalBinding$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    .line 61
    :goto_b
    return-void

    .line 59
    :cond_c
    const-string v0, "onCompleted"

    invoke-direct {p0, v0}, Lrx/android/operators/OperatorConditionalBinding$1;->handleLostBinding(Ljava/lang/String;)V

    goto :goto_b
.end method

.method public onError(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 65
    .local p0, "this":Lrx/android/operators/OperatorConditionalBinding$1;, "Lrx/android/operators/OperatorConditionalBinding.1;"
    invoke-direct {p0}, Lrx/android/operators/OperatorConditionalBinding$1;->shouldForwardNotification()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 66
    iget-object v0, p0, Lrx/android/operators/OperatorConditionalBinding$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 70
    :goto_b
    return-void

    .line 68
    :cond_c
    const-string v0, "onError"

    invoke-direct {p0, v0}, Lrx/android/operators/OperatorConditionalBinding$1;->handleLostBinding(Ljava/lang/String;)V

    goto :goto_b
.end method

.method public onNext(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "this":Lrx/android/operators/OperatorConditionalBinding$1;, "Lrx/android/operators/OperatorConditionalBinding.1;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Lrx/android/operators/OperatorConditionalBinding$1;->shouldForwardNotification()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 75
    iget-object v0, p0, Lrx/android/operators/OperatorConditionalBinding$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 79
    :goto_b
    return-void

    .line 77
    :cond_c
    const-string v0, "onNext"

    invoke-direct {p0, v0}, Lrx/android/operators/OperatorConditionalBinding$1;->handleLostBinding(Ljava/lang/String;)V

    goto :goto_b
.end method
