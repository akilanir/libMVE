.class Lcom/koushikdutta/ion/IonRequestBuilder$2;
.super Ljava/lang/Object;
.source "IonRequestBuilder.java"

# interfaces
.implements Lcom/koushikdutta/ion/ProgressCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/IonRequestBuilder;->getLoaderEmitter(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

.field final synthetic val$ret:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 315
    const-class v0, Lcom/koushikdutta/ion/IonRequestBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/koushikdutta/ion/IonRequestBuilder$2;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;)V
    .registers 3

    .prologue
    .line 315
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$2;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iput-object p2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$2;->val$ret:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgress(JJ)V
    .registers 13
    .param p1, "downloaded"    # J
    .param p3, "total"    # J

    .prologue
    .line 318
    sget-boolean v0, Lcom/koushikdutta/ion/IonRequestBuilder$2;->$assertionsDisabled:Z

    if-nez v0, :cond_18

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v1

    if-ne v0, v1, :cond_18

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 320
    :cond_18
    long-to-float v0, p1

    long-to-float v1, p3

    div-float/2addr v0, v1

    const/high16 v1, 0x42c80000    # 100.0f

    mul-float/2addr v0, v1

    float-to-int v6, v0

    .line 322
    .local v6, "percent":I
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$2;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder;->uploadProgressBar:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_2c

    .line 323
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$2;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder;->uploadProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v6}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 325
    :cond_2c
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$2;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder;->uploadProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_39

    .line 326
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$2;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder;->uploadProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v6}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 328
    :cond_39
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$2;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder;->uploadProgress:Lcom/koushikdutta/ion/ProgressCallback;

    if-eqz v0, :cond_46

    .line 329
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$2;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder;->uploadProgress:Lcom/koushikdutta/ion/ProgressCallback;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/koushikdutta/ion/ProgressCallback;->onProgress(JJ)V

    .line 331
    :cond_46
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$2;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder;->uploadProgressHandler:Lcom/koushikdutta/ion/ProgressCallback;

    if-eqz v0, :cond_59

    .line 332
    sget-object v7, Lcom/koushikdutta/ion/Ion;->mainHandler:Landroid/os/Handler;

    new-instance v0, Lcom/koushikdutta/ion/IonRequestBuilder$2$1;

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/koushikdutta/ion/IonRequestBuilder$2$1;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder$2;JJ)V

    invoke-static {v7, v0}, Lcom/koushikdutta/async/AsyncServer;->post(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 341
    :cond_59
    return-void
.end method
