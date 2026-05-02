.class Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;
.super Ljava/lang/Object;
.source "SubsamplingScaleImageView.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;


# direct methods
.method constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)V
    .registers 2

    .prologue
    .line 266
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .registers 5
    .param p1, "message"    # Landroid/os/Message;

    .prologue
    const/4 v2, 0x1

    .line 268
    iget v0, p1, Landroid/os/Message;->what:I

    if-ne v0, v2, :cond_29

    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onLongClickListener:Landroid/view/View$OnLongClickListener;
    invoke-static {v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Landroid/view/View$OnLongClickListener;

    move-result-object v0

    if-eqz v0, :cond_29

    .line 269
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    const/4 v1, 0x0

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I
    invoke-static {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$102(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;I)I

    .line 270
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onLongClickListener:Landroid/view/View$OnLongClickListener;
    invoke-static {v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Landroid/view/View$OnLongClickListener;

    move-result-object v1

    # invokes: Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    invoke-static {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$201(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/view/View$OnLongClickListener;)V

    .line 271
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->performLongClick()Z

    .line 272
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    const/4 v1, 0x0

    # invokes: Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    invoke-static {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$301(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/view/View$OnLongClickListener;)V

    .line 274
    :cond_29
    return v2
.end method
