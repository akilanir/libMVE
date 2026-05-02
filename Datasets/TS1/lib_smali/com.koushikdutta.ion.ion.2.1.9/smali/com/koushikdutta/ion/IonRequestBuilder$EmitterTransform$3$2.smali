.class Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$2;
.super Ljava/lang/Object;
.source "IonRequestBuilder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->onData(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;

.field final synthetic val$totalBytesRead:I


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;I)V
    .registers 3
    .param p1, "this$2"    # Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;

    .prologue
    .line 560
    .local p0, "this":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$2;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3.2;"
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$2;->this$2:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;

    iput p2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$2;->val$totalBytesRead:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 563
    .local p0, "this":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$2;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3.2;"
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$2;->this$2:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;

    iget-object v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    invoke-virtual {v0}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_14

    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$2;->this$2:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;

    iget-object v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    invoke-virtual {v0}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->isDone()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 566
    :cond_14
    :goto_14
    return-void

    .line 565
    :cond_15
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$2;->this$2:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;

    iget-object v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iget-object v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder;->progressHandler:Lcom/koushikdutta/ion/ProgressCallback;

    iget v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$2;->val$totalBytesRead:I

    int-to-long v1, v1

    iget-object v3, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$2;->this$2:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;

    iget-wide v3, v3, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->val$total:J

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/koushikdutta/ion/ProgressCallback;->onProgress(JJ)V

    goto :goto_14
.end method
