.class Lcom/koushikdutta/ion/IonRequestBuilder$4;
.super Ljava/lang/Object;
.source "IonRequestBuilder.java"

# interfaces
.implements Lcom/koushikdutta/async/future/FutureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/IonRequestBuilder;->resolveAndLoadRequest(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;)V
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
.field final synthetic this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

.field final synthetic val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

.field final synthetic val$ret:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V
    .registers 4
    .param p1, "this$0"    # Lcom/koushikdutta/ion/IonRequestBuilder;

    .prologue
    .line 383
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$4;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iput-object p2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$4;->val$ret:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iput-object p3, p0, Lcom/koushikdutta/ion/IonRequestBuilder$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V
    .registers 6
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "result"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .prologue
    .line 386
    if-eqz p1, :cond_8

    .line 387
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$4;->val$ret:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    invoke-virtual {v0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->setComplete(Ljava/lang/Exception;)Z

    .line 402
    :goto_7
    return-void

    .line 390
    :cond_8
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$4;->val$ret:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iput-object p2, v0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->finalRequest:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .line 392
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    if-eq v0, v1, :cond_25

    .line 393
    sget-object v0, Lcom/koushikdutta/ion/Ion;->mainHandler:Landroid/os/Handler;

    new-instance v1, Lcom/koushikdutta/ion/IonRequestBuilder$4$1;

    invoke-direct {v1, p0}, Lcom/koushikdutta/ion/IonRequestBuilder$4$1;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder$4;)V

    invoke-static {v0, v1}, Lcom/koushikdutta/async/AsyncServer;->post(Landroid/os/Handler;Ljava/lang/Runnable;)V

    goto :goto_7

    .line 401
    :cond_25
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$4;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$4;->val$ret:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/ion/IonRequestBuilder;->invokeLoadRequest(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;)V

    goto :goto_7
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Exception;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 383
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/IonRequestBuilder$4;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V

    return-void
.end method
