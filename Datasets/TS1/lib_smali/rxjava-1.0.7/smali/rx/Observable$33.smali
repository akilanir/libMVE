.class Lrx/Observable$33;
.super Lrx/Subscriber;
.source "Observable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/Observable;->subscribe(Lrx/functions/Action1;Lrx/functions/Action1;)Lrx/Subscription;
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
.field final synthetic this$0:Lrx/Observable;

.field final synthetic val$onError:Lrx/functions/Action1;

.field final synthetic val$onNext:Lrx/functions/Action1;


# direct methods
.method constructor <init>(Lrx/Observable;Lrx/functions/Action1;Lrx/functions/Action1;)V
    .registers 4

    .prologue
    .line 7332
    .local p0, "this":Lrx/Observable$33;, "Lrx/Observable.33;"
    iput-object p1, p0, Lrx/Observable$33;->this$0:Lrx/Observable;

    iput-object p2, p0, Lrx/Observable$33;->val$onError:Lrx/functions/Action1;

    iput-object p3, p0, Lrx/Observable$33;->val$onNext:Lrx/functions/Action1;

    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCompleted()V
    .registers 1

    .prologue
    .line 7337
    .local p0, "this":Lrx/Observable$33;, "Lrx/Observable.33;"
    return-void
.end method

.method public final onError(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 7341
    .local p0, "this":Lrx/Observable$33;, "Lrx/Observable.33;"
    iget-object v0, p0, Lrx/Observable$33;->val$onError:Lrx/functions/Action1;

    invoke-interface {v0, p1}, Lrx/functions/Action1;->call(Ljava/lang/Object;)V

    .line 7342
    return-void
.end method

.method public final onNext(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 7346
    .local p0, "this":Lrx/Observable$33;, "Lrx/Observable.33;"
    .local p1, "args":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lrx/Observable$33;->val$onNext:Lrx/functions/Action1;

    invoke-interface {v0, p1}, Lrx/functions/Action1;->call(Ljava/lang/Object;)V

    .line 7347
    return-void
.end method
