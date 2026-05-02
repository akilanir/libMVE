.class Lcom/koushikdutta/ion/IonRequestBuilder$4$1;
.super Ljava/lang/Object;
.source "IonRequestBuilder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/IonRequestBuilder$4;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/koushikdutta/ion/IonRequestBuilder$4;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder$4;)V
    .registers 2
    .param p1, "this$1"    # Lcom/koushikdutta/ion/IonRequestBuilder$4;

    .prologue
    .line 393
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$4$1;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 396
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$4$1;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$4;

    iget-object v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder$4;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$4$1;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$4;

    iget-object v1, v1, Lcom/koushikdutta/ion/IonRequestBuilder$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$4$1;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$4;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder$4;->val$ret:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/ion/IonRequestBuilder;->invokeLoadRequest(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;)V

    .line 397
    return-void
.end method
