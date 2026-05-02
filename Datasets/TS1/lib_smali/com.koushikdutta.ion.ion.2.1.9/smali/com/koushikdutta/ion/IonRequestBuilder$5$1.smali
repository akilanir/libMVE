.class Lcom/koushikdutta/ion/IonRequestBuilder$5$1;
.super Ljava/lang/Object;
.source "IonRequestBuilder.java"

# interfaces
.implements Lcom/koushikdutta/async/callback/CompletedCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/IonRequestBuilder$5;->transform(Lcom/koushikdutta/ion/Loader$LoaderEmitter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/koushikdutta/ion/IonRequestBuilder$5;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder$5;)V
    .registers 2
    .param p1, "this$1"    # Lcom/koushikdutta/ion/IonRequestBuilder$5;

    .prologue
    .line 621
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$5$1;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;)V
    .registers 5
    .param p1, "ex"    # Ljava/lang/Exception;

    .prologue
    .line 624
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$5$1;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$5;

    iget-object v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder$5;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$5$1;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$5;

    iget-object v1, v1, Lcom/koushikdutta/ion/IonRequestBuilder$5;->self:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$5$1;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$5;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder$5;->val$result:Ljava/lang/Object;

    # invokes: Lcom/koushikdutta/ion/IonRequestBuilder;->postExecute(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;Ljava/lang/Exception;Ljava/lang/Object;)V
    invoke-static {v0, v1, p1, v2}, Lcom/koushikdutta/ion/IonRequestBuilder;->access$000(Lcom/koushikdutta/ion/IonRequestBuilder;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;Ljava/lang/Exception;Ljava/lang/Object;)V

    .line 625
    return-void
.end method
