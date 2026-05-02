.class public abstract Lcom/koushikdutta/async/future/TransformFuture;
.super Lcom/koushikdutta/async/future/SimpleFuture;
.source "TransformFuture.java"

# interfaces
.implements Lcom/koushikdutta/async/future/FutureCallback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "F:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/koushikdutta/async/future/SimpleFuture",
        "<TT;>;",
        "Lcom/koushikdutta/async/future/FutureCallback",
        "<TF;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 3
    .local p0, "this":Lcom/koushikdutta/async/future/TransformFuture;, "Lcom/koushikdutta/async/future/TransformFuture<TT;TF;>;"
    invoke-direct {p0}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    return-void
.end method


# virtual methods
.method protected error(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 22
    .local p0, "this":Lcom/koushikdutta/async/future/TransformFuture;, "Lcom/koushikdutta/async/future/TransformFuture<TT;TF;>;"
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/future/TransformFuture;->setComplete(Ljava/lang/Exception;)Z

    .line 23
    return-void
.end method

.method public onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Exception;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Exception;",
            "TF;)V"
        }
    .end annotation

    .prologue
    .line 6
    .local p0, "this":Lcom/koushikdutta/async/future/TransformFuture;, "Lcom/koushikdutta/async/future/TransformFuture<TT;TF;>;"
    .local p2, "result":Ljava/lang/Object;, "TF;"
    invoke-virtual {p0}, Lcom/koushikdutta/async/future/TransformFuture;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 19
    :goto_6
    return-void

    .line 8
    :cond_7
    if-eqz p1, :cond_d

    .line 9
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/future/TransformFuture;->error(Ljava/lang/Exception;)V

    goto :goto_6

    .line 14
    :cond_d
    :try_start_d
    invoke-virtual {p0, p2}, Lcom/koushikdutta/async/future/TransformFuture;->transform(Ljava/lang/Object;)V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_10} :catch_11

    goto :goto_6

    .line 16
    :catch_11
    move-exception v0

    .line 17
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/future/TransformFuture;->error(Ljava/lang/Exception;)V

    goto :goto_6
.end method

.method protected abstract transform(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TF;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
