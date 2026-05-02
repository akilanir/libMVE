.class Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;
.super Ljava/lang/Object;
.source "IonRequestBuilder.java"

# interfaces
.implements Lcom/koushikdutta/async/DataTrackingEmitter$DataTracker;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->transform(Lcom/koushikdutta/ion/Loader$LoaderEmitter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field lastPercent:I

.field final synthetic this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

.field final synthetic val$total:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 494
    const-class v0, Lcom/koushikdutta/ion/IonRequestBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;J)V
    .registers 4

    .prologue
    .line 494
    .local p0, "this":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform.3;"
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iput-wide p2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->val$total:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onData(I)V
    .registers 9
    .param p1, "totalBytesRead"    # I

    .prologue
    .line 498
    .local p0, "this":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform.3;"
    sget-boolean v2, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->$assertionsDisabled:Z

    if-nez v2, :cond_18

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v3

    if-ne v2, v3, :cond_18

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 500
    :cond_18
    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder;->contextReference:Lcom/koushikdutta/ion/ContextReference;

    invoke-virtual {v2}, Lcom/koushikdutta/ion/ContextReference;->isAlive()Ljava/lang/String;

    move-result-object v0

    .line 501
    .local v0, "deadReason":Ljava/lang/String;
    if-eqz v0, :cond_33

    .line 502
    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->initialRequest:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v3, "context has died, cancelling"

    invoke-virtual {v2, v3}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logd(Ljava/lang/String;)V

    .line 503
    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    invoke-virtual {v2}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->cancelSilently()Z

    .line 541
    :cond_32
    :goto_32
    return-void

    .line 507
    :cond_33
    int-to-float v2, p1

    iget-wide v3, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->val$total:J

    long-to-float v3, v3

    div-float/2addr v2, v3

    const/high16 v3, 0x42c80000    # 100.0f

    mul-float/2addr v2, v3

    float-to-int v1, v2

    .line 509
    .local v1, "percent":I
    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder;->progressBar:Ljava/lang/ref/WeakReference;

    if-nez v2, :cond_4c

    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder;->progressDialog:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_5a

    :cond_4c
    iget v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->lastPercent:I

    if-eq v1, v2, :cond_5a

    .line 510
    sget-object v2, Lcom/koushikdutta/ion/Ion;->mainHandler:Landroid/os/Handler;

    new-instance v3, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$1;

    invoke-direct {v3, p0, v1}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$1;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;I)V

    invoke-static {v2, v3}, Lcom/koushikdutta/async/AsyncServer;->post(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 526
    :cond_5a
    iput v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->lastPercent:I

    .line 528
    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder;->progress:Lcom/koushikdutta/ion/ProgressCallback;

    if-eqz v2, :cond_70

    .line 529
    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder;->progress:Lcom/koushikdutta/ion/ProgressCallback;

    int-to-long v3, p1

    iget-wide v5, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->val$total:J

    invoke-interface {v2, v3, v4, v5, v6}, Lcom/koushikdutta/ion/ProgressCallback;->onProgress(JJ)V

    .line 531
    :cond_70
    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder;->progressHandler:Lcom/koushikdutta/ion/ProgressCallback;

    if-eqz v2, :cond_32

    .line 532
    sget-object v2, Lcom/koushikdutta/ion/Ion;->mainHandler:Landroid/os/Handler;

    new-instance v3, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$2;

    invoke-direct {v3, p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$2;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;I)V

    invoke-static {v2, v3}, Lcom/koushikdutta/async/AsyncServer;->post(Landroid/os/Handler;Ljava/lang/Runnable;)V

    goto :goto_32
.end method
