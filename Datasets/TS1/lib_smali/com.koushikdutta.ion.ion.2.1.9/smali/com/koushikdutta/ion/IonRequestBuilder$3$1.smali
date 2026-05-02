.class Lcom/koushikdutta/ion/IonRequestBuilder$3$1;
.super Ljava/lang/Object;
.source "IonRequestBuilder.java"

# interfaces
.implements Lcom/koushikdutta/async/future/FutureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/IonRequestBuilder$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/future/FutureCallback",
        "<",
        "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/koushikdutta/ion/IonRequestBuilder$3;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder$3;)V
    .registers 2
    .param p1, "this$1"    # Lcom/koushikdutta/ion/IonRequestBuilder$3;

    .prologue
    .line 364
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$3$1;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V
    .registers 4
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "result"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .prologue
    .line 367
    if-eqz p1, :cond_a

    .line 368
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$3$1;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$3;

    iget-object v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder$3;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-virtual {v0, p1}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Exception;)Z

    .line 373
    :goto_9
    return-void

    .line 371
    :cond_a
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$3$1;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$3;

    iput-object p2, v0, Lcom/koushikdutta/ion/IonRequestBuilder$3;->inRequest:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .line 372
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$3$1;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$3;

    iget-object v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder$3;->runner:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_9
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Exception;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 364
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/IonRequestBuilder$3$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V

    return-void
.end method
