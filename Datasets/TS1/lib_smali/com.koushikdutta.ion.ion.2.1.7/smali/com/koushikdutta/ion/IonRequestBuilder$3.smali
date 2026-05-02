.class Lcom/koushikdutta/ion/IonRequestBuilder$3;
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

.field final synthetic val$ret:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;)V
    .registers 3

    .prologue
    .line 353
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$3;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iput-object p2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$3;->val$ret:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "result"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .prologue
    .line 356
    if-eqz p1, :cond_8

    .line 357
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$3;->val$ret:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    invoke-virtual {v0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->setComplete(Ljava/lang/Exception;)Z

    .line 362
    :goto_7
    return-void

    .line 360
    :cond_8
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$3;->val$ret:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iput-object p2, v0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->finalRequest:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .line 361
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$3;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$3;->val$ret:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    invoke-virtual {v0, p2, v1}, Lcom/koushikdutta/ion/IonRequestBuilder;->resolveAndLoadRequest(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;)V

    goto :goto_7
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Exception;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 353
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/IonRequestBuilder$3;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V

    return-void
.end method
