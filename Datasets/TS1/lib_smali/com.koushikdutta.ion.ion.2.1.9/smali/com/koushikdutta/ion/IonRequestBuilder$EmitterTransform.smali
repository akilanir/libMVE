.class Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;
.super Lcom/koushikdutta/async/future/TransformFuture;
.source "IonRequestBuilder.java"

# interfaces
.implements Lcom/koushikdutta/ion/future/ResponseFuture;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/ion/IonRequestBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "EmitterTransform"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/koushikdutta/async/future/TransformFuture",
        "<TT;",
        "Lcom/koushikdutta/ion/Loader$LoaderEmitter;",
        ">;",
        "Lcom/koushikdutta/ion/future/ResponseFuture",
        "<TT;>;"
    }
.end annotation


# instance fields
.field cancelCallback:Ljava/lang/Runnable;

.field emitter:Lcom/koushikdutta/async/DataEmitter;

.field finalRequest:Lcom/koushikdutta/async/http/AsyncHttpRequest;

.field headers:Lcom/koushikdutta/ion/HeadersResponse;

.field initialRequest:Lcom/koushikdutta/async/http/AsyncHttpRequest;

.field servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;

.field final synthetic this$0:Lcom/koushikdutta/ion/IonRequestBuilder;


# direct methods
.method public constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder;Ljava/lang/Runnable;)V
    .registers 8
    .param p1, "this$0"    # Lcom/koushikdutta/ion/IonRequestBuilder;
    .param p2, "cancelCallback"    # Ljava/lang/Runnable;

    .prologue
    .line 466
    .local p0, "this":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform<TT;>;"
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    invoke-direct {p0}, Lcom/koushikdutta/async/future/TransformFuture;-><init>()V

    .line 467
    iput-object p2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->cancelCallback:Ljava/lang/Runnable;

    .line 468
    iget-object v3, p1, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v4, p1, Lcom/koushikdutta/ion/IonRequestBuilder;->contextReference:Lcom/koushikdutta/ion/ContextReference;

    invoke-virtual {v4}, Lcom/koushikdutta/ion/ContextReference;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, p0, v4}, Lcom/koushikdutta/ion/Ion;->addFutureInFlight(Lcom/koushikdutta/async/future/Future;Ljava/lang/Object;)V

    .line 469
    iget-object v3, p1, Lcom/koushikdutta/ion/IonRequestBuilder;->groups:Ljava/util/ArrayList;

    if-nez v3, :cond_17

    .line 476
    :cond_16
    return-void

    .line 471
    :cond_17
    iget-object v3, p1, Lcom/koushikdutta/ion/IonRequestBuilder;->groups:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1d
    :goto_1d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_16

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 472
    .local v2, "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Ljava/lang/Object;>;"
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 473
    .local v0, "group":Ljava/lang/Object;
    if-eqz v0, :cond_1d

    .line 474
    iget-object v3, p1, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v3, p0, v0}, Lcom/koushikdutta/ion/Ion;->addFutureInFlight(Lcom/koushikdutta/async/future/Future;Ljava/lang/Object;)V

    goto :goto_1d
.end method


# virtual methods
.method protected cancelCleanup()V
    .registers 2

    .prologue
    .line 480
    .local p0, "this":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform<TT;>;"
    invoke-super {p0}, Lcom/koushikdutta/async/future/TransformFuture;->cancelCleanup()V

    .line 481
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->emitter:Lcom/koushikdutta/async/DataEmitter;

    if-eqz v0, :cond_c

    .line 482
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->emitter:Lcom/koushikdutta/async/DataEmitter;

    invoke-interface {v0}, Lcom/koushikdutta/async/DataEmitter;->close()V

    .line 483
    :cond_c
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->cancelCallback:Ljava/lang/Runnable;

    if-eqz v0, :cond_15

    .line 484
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->cancelCallback:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 485
    :cond_15
    return-void
.end method

.method protected error(Ljava/lang/Exception;)V
    .registers 4
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 490
    .local p0, "this":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform<TT;>;"
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    const/4 v1, 0x0

    # invokes: Lcom/koushikdutta/ion/IonRequestBuilder;->postExecute(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;Ljava/lang/Exception;Ljava/lang/Object;)V
    invoke-static {v0, p0, p1, v1}, Lcom/koushikdutta/ion/IonRequestBuilder;->access$000(Lcom/koushikdutta/ion/IonRequestBuilder;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;Ljava/lang/Exception;Ljava/lang/Object;)V

    .line 491
    return-void
.end method

.method public getResponse(Ljava/lang/Exception;Ljava/lang/Object;)Lcom/koushikdutta/ion/Response;
    .registers 9
    .param p1, "e"    # Ljava/lang/Exception;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Exception;",
            "TT;)",
            "Lcom/koushikdutta/ion/Response",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 446
    .local p0, "this":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform<TT;>;"
    .local p2, "result":Ljava/lang/Object;, "TT;"
    new-instance v0, Lcom/koushikdutta/ion/Response;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->finalRequest:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;

    iget-object v3, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->headers:Lcom/koushikdutta/ion/HeadersResponse;

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/koushikdutta/ion/Response;-><init>(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/ion/ResponseServedFrom;Lcom/koushikdutta/ion/HeadersResponse;Ljava/lang/Exception;Ljava/lang/Object;)V

    return-object v0
.end method

.method protected transform(Lcom/koushikdutta/ion/Loader$LoaderEmitter;)V
    .registers 8
    .param p1, "emitter"    # Lcom/koushikdutta/ion/Loader$LoaderEmitter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 495
    .local p0, "this":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform<TT;>;"
    invoke-virtual {p1}, Lcom/koushikdutta/ion/Loader$LoaderEmitter;->getDataEmitter()Lcom/koushikdutta/async/DataEmitter;

    move-result-object v4

    iput-object v4, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->emitter:Lcom/koushikdutta/async/DataEmitter;

    .line 496
    invoke-virtual {p1}, Lcom/koushikdutta/ion/Loader$LoaderEmitter;->getServedFrom()Lcom/koushikdutta/ion/ResponseServedFrom;

    move-result-object v4

    iput-object v4, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;

    .line 497
    invoke-virtual {p1}, Lcom/koushikdutta/ion/Loader$LoaderEmitter;->getHeaders()Lcom/koushikdutta/ion/HeadersResponse;

    move-result-object v4

    iput-object v4, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->headers:Lcom/koushikdutta/ion/HeadersResponse;

    .line 498
    invoke-virtual {p1}, Lcom/koushikdutta/ion/Loader$LoaderEmitter;->getRequest()Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-result-object v4

    iput-object v4, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->finalRequest:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .line 500
    iget-object v4, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v4, v4, Lcom/koushikdutta/ion/IonRequestBuilder;->headersCallback:Lcom/koushikdutta/ion/HeadersCallback;

    if-eqz v4, :cond_2e

    .line 501
    invoke-virtual {p1}, Lcom/koushikdutta/ion/Loader$LoaderEmitter;->getHeaders()Lcom/koushikdutta/ion/HeadersResponse;

    move-result-object v0

    .line 503
    .local v0, "headers":Lcom/koushikdutta/ion/HeadersResponse;
    iget-object v4, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v4, v4, Lcom/koushikdutta/ion/IonRequestBuilder;->handler:Landroid/os/Handler;

    new-instance v5, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$2;

    invoke-direct {v5, p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$2;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;Lcom/koushikdutta/ion/HeadersResponse;)V

    invoke-static {v4, v5}, Lcom/koushikdutta/async/AsyncServer;->post(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 512
    .end local v0    # "headers":Lcom/koushikdutta/ion/HeadersResponse;
    :cond_2e
    invoke-virtual {p1}, Lcom/koushikdutta/ion/Loader$LoaderEmitter;->length()J

    move-result-wide v1

    .line 514
    .local v1, "total":J
    iget-object v4, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->emitter:Lcom/koushikdutta/async/DataEmitter;

    instance-of v4, v4, Lcom/koushikdutta/async/DataTrackingEmitter;

    if-nez v4, :cond_4d

    .line 515
    new-instance v3, Lcom/koushikdutta/async/FilteredDataEmitter;

    invoke-direct {v3}, Lcom/koushikdutta/async/FilteredDataEmitter;-><init>()V

    .line 516
    .local v3, "tracker":Lcom/koushikdutta/async/DataTrackingEmitter;
    iget-object v4, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->emitter:Lcom/koushikdutta/async/DataEmitter;

    invoke-interface {v3, v4}, Lcom/koushikdutta/async/DataTrackingEmitter;->setDataEmitter(Lcom/koushikdutta/async/DataEmitter;)V

    .line 521
    :goto_42
    iput-object v3, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->emitter:Lcom/koushikdutta/async/DataEmitter;

    .line 522
    new-instance v4, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;

    invoke-direct {v4, p0, v1, v2}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;J)V

    invoke-interface {v3, v4}, Lcom/koushikdutta/async/DataTrackingEmitter;->setDataTracker(Lcom/koushikdutta/async/DataTrackingEmitter$DataTracker;)V

    .line 571
    return-void

    .line 519
    .end local v3    # "tracker":Lcom/koushikdutta/async/DataTrackingEmitter;
    :cond_4d
    iget-object v3, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->emitter:Lcom/koushikdutta/async/DataEmitter;

    check-cast v3, Lcom/koushikdutta/async/DataTrackingEmitter;

    .restart local v3    # "tracker":Lcom/koushikdutta/async/DataTrackingEmitter;
    goto :goto_42
.end method

.method protected bridge synthetic transform(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 437
    .local p0, "this":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform<TT;>;"
    check-cast p1, Lcom/koushikdutta/ion/Loader$LoaderEmitter;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->transform(Lcom/koushikdutta/ion/Loader$LoaderEmitter;)V

    return-void
.end method

.method public withResponse()Lcom/koushikdutta/async/future/Future;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lcom/koushikdutta/ion/Response",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 451
    .local p0, "this":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform<TT;>;"
    new-instance v0, Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {v0}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    .line 452
    .local v0, "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<Lcom/koushikdutta/ion/Response<TT;>;>;"
    new-instance v1, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$1;

    invoke-direct {v1, p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$1;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;Lcom/koushikdutta/async/future/SimpleFuture;)V

    invoke-virtual {p0, v1}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->setCallback(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/SimpleFuture;

    .line 462
    invoke-virtual {v0, p0}, Lcom/koushikdutta/async/future/SimpleFuture;->setParent(Lcom/koushikdutta/async/future/Cancellable;)Lcom/koushikdutta/async/future/SimpleFuture;

    .line 463
    return-object v0
.end method
