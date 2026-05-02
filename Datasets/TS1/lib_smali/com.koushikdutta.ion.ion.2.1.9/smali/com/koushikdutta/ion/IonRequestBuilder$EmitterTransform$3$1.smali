.class Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$1;
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

.field final synthetic val$percent:I


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;I)V
    .registers 3
    .param p1, "this$2"    # Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;

    .prologue
    .line 538
    .local p0, "this":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$1;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3.1;"
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$1;->this$2:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;

    iput p2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$1;->val$percent:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 541
    .local p0, "this":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$1;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3.1;"
    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$1;->this$2:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder;->progressBar:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_1f

    .line 542
    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$1;->this$2:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder;->progressBar:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    .line 543
    .local v0, "bar":Landroid/widget/ProgressBar;
    if-eqz v0, :cond_1f

    .line 544
    iget v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$1;->val$percent:I

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 546
    .end local v0    # "bar":Landroid/widget/ProgressBar;
    :cond_1f
    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$1;->this$2:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder;->progressDialog:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_3e

    .line 547
    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$1;->this$2:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder;->progressDialog:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ProgressDialog;

    .line 548
    .local v1, "dlg":Landroid/app/ProgressDialog;
    if-eqz v1, :cond_3e

    .line 549
    iget v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$3$1;->val$percent:I

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 551
    .end local v1    # "dlg":Landroid/app/ProgressDialog;
    :cond_3e
    return-void
.end method
