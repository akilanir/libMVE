.class Lrx/internal/operators/OperatorAny$1;
.super Lrx/Subscriber;
.source "OperatorAny.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorAny;->call(Lrx/Subscriber;)Lrx/Subscriber;
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
.field done:Z

.field hasElements:Z

.field final synthetic this$0:Lrx/internal/operators/OperatorAny;

.field final synthetic val$child:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorAny;Lrx/Subscriber;)V
    .registers 3

    .prologue
    .line 39
    .local p0, "this":Lrx/internal/operators/OperatorAny$1;, "Lrx/internal/operators/OperatorAny.1;"
    iput-object p1, p0, Lrx/internal/operators/OperatorAny$1;->this$0:Lrx/internal/operators/OperatorAny;

    iput-object p2, p0, Lrx/internal/operators/OperatorAny$1;->val$child:Lrx/Subscriber;

    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted()V
    .registers 3

    .prologue
    .line 65
    .local p0, "this":Lrx/internal/operators/OperatorAny$1;, "Lrx/internal/operators/OperatorAny.1;"
    iget-boolean v0, p0, Lrx/internal/operators/OperatorAny$1;->done:Z

    if-nez v0, :cond_1a

    .line 66
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrx/internal/operators/OperatorAny$1;->done:Z

    .line 67
    iget-boolean v0, p0, Lrx/internal/operators/OperatorAny$1;->hasElements:Z

    if-eqz v0, :cond_1b

    .line 68
    iget-object v0, p0, Lrx/internal/operators/OperatorAny$1;->val$child:Lrx/Subscriber;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 72
    :goto_15
    iget-object v0, p0, Lrx/internal/operators/OperatorAny$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    .line 74
    :cond_1a
    return-void

    .line 70
    :cond_1b
    iget-object v0, p0, Lrx/internal/operators/OperatorAny$1;->val$child:Lrx/Subscriber;

    iget-object v1, p0, Lrx/internal/operators/OperatorAny$1;->this$0:Lrx/internal/operators/OperatorAny;

    # getter for: Lrx/internal/operators/OperatorAny;->returnOnEmpty:Z
    invoke-static {v1}, Lrx/internal/operators/OperatorAny;->access$100(Lrx/internal/operators/OperatorAny;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    goto :goto_15
.end method

.method public onError(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 60
    .local p0, "this":Lrx/internal/operators/OperatorAny$1;, "Lrx/internal/operators/OperatorAny.1;"
    iget-object v0, p0, Lrx/internal/operators/OperatorAny$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 61
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorAny$1;, "Lrx/internal/operators/OperatorAny.1;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v2, 0x1

    .line 45
    iput-boolean v2, p0, Lrx/internal/operators/OperatorAny$1;->hasElements:Z

    .line 46
    iget-object v1, p0, Lrx/internal/operators/OperatorAny$1;->this$0:Lrx/internal/operators/OperatorAny;

    # getter for: Lrx/internal/operators/OperatorAny;->predicate:Lrx/functions/Func1;
    invoke-static {v1}, Lrx/internal/operators/OperatorAny;->access$000(Lrx/internal/operators/OperatorAny;)Lrx/functions/Func1;

    move-result-object v1

    invoke-interface {v1, p1}, Lrx/functions/Func1;->call(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 47
    .local v0, "result":Z
    if-eqz v0, :cond_38

    iget-boolean v1, p0, Lrx/internal/operators/OperatorAny$1;->done:Z

    if-nez v1, :cond_38

    .line 48
    iput-boolean v2, p0, Lrx/internal/operators/OperatorAny$1;->done:Z

    .line 49
    iget-object v3, p0, Lrx/internal/operators/OperatorAny$1;->val$child:Lrx/Subscriber;

    iget-object v1, p0, Lrx/internal/operators/OperatorAny$1;->this$0:Lrx/internal/operators/OperatorAny;

    # getter for: Lrx/internal/operators/OperatorAny;->returnOnEmpty:Z
    invoke-static {v1}, Lrx/internal/operators/OperatorAny;->access$100(Lrx/internal/operators/OperatorAny;)Z

    move-result v1

    if-nez v1, :cond_36

    move v1, v2

    :goto_26
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v3, v1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 50
    iget-object v1, p0, Lrx/internal/operators/OperatorAny$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v1}, Lrx/Subscriber;->onCompleted()V

    .line 51
    invoke-virtual {p0}, Lrx/internal/operators/OperatorAny$1;->unsubscribe()V

    .line 56
    :goto_35
    return-void

    .line 49
    :cond_36
    const/4 v1, 0x0

    goto :goto_26

    .line 54
    :cond_38
    const-wide/16 v1, 0x1

    invoke-virtual {p0, v1, v2}, Lrx/internal/operators/OperatorAny$1;->request(J)V

    goto :goto_35
.end method
