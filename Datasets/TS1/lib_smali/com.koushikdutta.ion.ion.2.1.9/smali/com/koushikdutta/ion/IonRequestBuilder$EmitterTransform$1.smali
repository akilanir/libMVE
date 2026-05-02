.class Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$1;
.super Ljava/lang/Object;
.source "IonRequestBuilder.java"

# interfaces
.implements Lcom/koushikdutta/async/future/FutureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->withResponse()Lcom/koushikdutta/async/future/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/future/FutureCallback",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

.field final synthetic val$ret:Lcom/koushikdutta/async/future/SimpleFuture;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;Lcom/koushikdutta/async/future/SimpleFuture;)V
    .registers 3
    .param p1, "this$1"    # Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    .prologue
    .line 452
    .local p0, "this":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$1;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform.1;"
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$1;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iput-object p2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Exception;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Exception;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 455
    .local p0, "this":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$1;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform.1;"
    .local p2, "result":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$1;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iget-object v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->emitter:Lcom/koushikdutta/async/DataEmitter;

    if-eqz v0, :cond_12

    .line 456
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$1;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    invoke-virtual {v1, p1, p2}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->getResponse(Ljava/lang/Exception;Ljava/lang/Object;)Lcom/koushikdutta/ion/Response;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Object;)Z

    .line 460
    :goto_11
    return-void

    .line 459
    :cond_12
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Exception;Ljava/lang/Object;)Z

    goto :goto_11
.end method
