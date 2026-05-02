.class Lcom/yalantis/ucrop/UCropActivity$6;
.super Ljava/lang/Object;
.source "UCropActivity.java"

# interfaces
.implements Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView$ScrollingListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yalantis/ucrop/UCropActivity;->setupScaleWidget()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yalantis/ucrop/UCropActivity;


# direct methods
.method constructor <init>(Lcom/yalantis/ucrop/UCropActivity;)V
    .registers 2

    .prologue
    .line 465
    iput-object p1, p0, Lcom/yalantis/ucrop/UCropActivity$6;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScroll(FF)V
    .registers 8
    .param p1, "delta"    # F
    .param p2, "totalDistance"    # F

    .prologue
    const v4, 0x466a6000    # 15000.0f

    .line 468
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_34

    .line 469
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity$6;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    # getter for: Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;
    invoke-static {v0}, Lcom/yalantis/ucrop/UCropActivity;->access$500(Lcom/yalantis/ucrop/UCropActivity;)Lcom/yalantis/ucrop/view/GestureCropImageView;

    move-result-object v0

    iget-object v1, p0, Lcom/yalantis/ucrop/UCropActivity$6;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    # getter for: Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;
    invoke-static {v1}, Lcom/yalantis/ucrop/UCropActivity;->access$500(Lcom/yalantis/ucrop/UCropActivity;)Lcom/yalantis/ucrop/view/GestureCropImageView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yalantis/ucrop/view/GestureCropImageView;->getCurrentScale()F

    move-result v1

    iget-object v2, p0, Lcom/yalantis/ucrop/UCropActivity$6;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    # getter for: Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;
    invoke-static {v2}, Lcom/yalantis/ucrop/UCropActivity;->access$500(Lcom/yalantis/ucrop/UCropActivity;)Lcom/yalantis/ucrop/view/GestureCropImageView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yalantis/ucrop/view/GestureCropImageView;->getMaxScale()F

    move-result v2

    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity$6;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    # getter for: Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;
    invoke-static {v3}, Lcom/yalantis/ucrop/UCropActivity;->access$500(Lcom/yalantis/ucrop/UCropActivity;)Lcom/yalantis/ucrop/view/GestureCropImageView;

    move-result-object v3

    invoke-virtual {v3}, Lcom/yalantis/ucrop/view/GestureCropImageView;->getMinScale()F

    move-result v3

    sub-float/2addr v2, v3

    div-float/2addr v2, v4

    mul-float/2addr v2, p1

    add-float/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/yalantis/ucrop/view/GestureCropImageView;->zoomInImage(F)V

    .line 475
    :goto_33
    return-void

    .line 472
    :cond_34
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity$6;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    # getter for: Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;
    invoke-static {v0}, Lcom/yalantis/ucrop/UCropActivity;->access$500(Lcom/yalantis/ucrop/UCropActivity;)Lcom/yalantis/ucrop/view/GestureCropImageView;

    move-result-object v0

    iget-object v1, p0, Lcom/yalantis/ucrop/UCropActivity$6;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    # getter for: Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;
    invoke-static {v1}, Lcom/yalantis/ucrop/UCropActivity;->access$500(Lcom/yalantis/ucrop/UCropActivity;)Lcom/yalantis/ucrop/view/GestureCropImageView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yalantis/ucrop/view/GestureCropImageView;->getCurrentScale()F

    move-result v1

    iget-object v2, p0, Lcom/yalantis/ucrop/UCropActivity$6;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    # getter for: Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;
    invoke-static {v2}, Lcom/yalantis/ucrop/UCropActivity;->access$500(Lcom/yalantis/ucrop/UCropActivity;)Lcom/yalantis/ucrop/view/GestureCropImageView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yalantis/ucrop/view/GestureCropImageView;->getMaxScale()F

    move-result v2

    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity$6;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    # getter for: Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;
    invoke-static {v3}, Lcom/yalantis/ucrop/UCropActivity;->access$500(Lcom/yalantis/ucrop/UCropActivity;)Lcom/yalantis/ucrop/view/GestureCropImageView;

    move-result-object v3

    invoke-virtual {v3}, Lcom/yalantis/ucrop/view/GestureCropImageView;->getMinScale()F

    move-result v3

    sub-float/2addr v2, v3

    div-float/2addr v2, v4

    mul-float/2addr v2, p1

    add-float/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/yalantis/ucrop/view/GestureCropImageView;->zoomOutImage(F)V

    goto :goto_33
.end method

.method public onScrollEnd()V
    .registers 2

    .prologue
    .line 479
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity$6;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    # getter for: Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;
    invoke-static {v0}, Lcom/yalantis/ucrop/UCropActivity;->access$500(Lcom/yalantis/ucrop/UCropActivity;)Lcom/yalantis/ucrop/view/GestureCropImageView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yalantis/ucrop/view/GestureCropImageView;->setImageToWrapCropBounds()V

    .line 480
    return-void
.end method

.method public onScrollStart()V
    .registers 2

    .prologue
    .line 484
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity$6;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    # getter for: Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;
    invoke-static {v0}, Lcom/yalantis/ucrop/UCropActivity;->access$500(Lcom/yalantis/ucrop/UCropActivity;)Lcom/yalantis/ucrop/view/GestureCropImageView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yalantis/ucrop/view/GestureCropImageView;->cancelAllAnimations()V

    .line 485
    return-void
.end method
