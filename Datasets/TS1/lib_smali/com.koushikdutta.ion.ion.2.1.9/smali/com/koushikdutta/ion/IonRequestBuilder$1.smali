.class Lcom/koushikdutta/ion/IonRequestBuilder$1;
.super Ljava/lang/Object;
.source "IonRequestBuilder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/IonRequestBuilder;->postExecute(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;Ljava/lang/Exception;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

.field final synthetic val$ex:Ljava/lang/Exception;

.field final synthetic val$future:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

.field final synthetic val$value:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 5
    .param p1, "this$0"    # Lcom/koushikdutta/ion/IonRequestBuilder;

    .prologue
    .line 230
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$1;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iput-object p2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$1;->val$future:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iput-object p3, p0, Lcom/koushikdutta/ion/IonRequestBuilder$1;->val$ex:Ljava/lang/Exception;

    iput-object p4, p0, Lcom/koushikdutta/ion/IonRequestBuilder$1;->val$value:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 234
    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$1;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v1, v1, Lcom/koushikdutta/ion/IonRequestBuilder;->contextReference:Lcom/koushikdutta/ion/ContextReference;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/ContextReference;->isAlive()Ljava/lang/String;

    move-result-object v0

    .line 235
    .local v0, "deadReason":Ljava/lang/String;
    if-eqz v0, :cond_2a

    .line 236
    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$1;->val$future:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iget-object v1, v1, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->initialRequest:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "context has died: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logd(Ljava/lang/String;)V

    .line 237
    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$1;->val$future:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->cancelSilently()Z

    .line 247
    :goto_29
    return-void

    .line 243
    :cond_2a
    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$1;->val$ex:Ljava/lang/Exception;

    if-eqz v1, :cond_36

    .line 244
    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$1;->val$future:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$1;->val$ex:Ljava/lang/Exception;

    invoke-virtual {v1, v2}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->setComplete(Ljava/lang/Exception;)Z

    goto :goto_29

    .line 246
    :cond_36
    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$1;->val$future:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$1;->val$value:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->setComplete(Ljava/lang/Object;)Z

    goto :goto_29
.end method
