.class Lcom/yalantis/ucrop/UCropActivity$1;
.super Ljava/lang/Object;
.source "UCropActivity.java"

# interfaces
.implements Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yalantis/ucrop/UCropActivity;
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
    .line 337
    iput-object p1, p0, Lcom/yalantis/ucrop/UCropActivity$1;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadComplete()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 350
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity$1;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    # getter for: Lcom/yalantis/ucrop/UCropActivity;->mUCropView:Lcom/yalantis/ucrop/view/UCropView;
    invoke-static {v0}, Lcom/yalantis/ucrop/UCropActivity;->access$200(Lcom/yalantis/ucrop/UCropActivity;)Lcom/yalantis/ucrop/view/UCropView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yalantis/ucrop/view/UCropView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 351
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity$1;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    # getter for: Lcom/yalantis/ucrop/UCropActivity;->mBlockingView:Landroid/view/View;
    invoke-static {v0}, Lcom/yalantis/ucrop/UCropActivity;->access$300(Lcom/yalantis/ucrop/UCropActivity;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setClickable(Z)V

    .line 352
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity$1;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    # setter for: Lcom/yalantis/ucrop/UCropActivity;->mShowLoader:Z
    invoke-static {v0, v3}, Lcom/yalantis/ucrop/UCropActivity;->access$402(Lcom/yalantis/ucrop/UCropActivity;Z)Z

    .line 353
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity$1;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    invoke-virtual {v0}, Lcom/yalantis/ucrop/UCropActivity;->supportInvalidateOptionsMenu()V

    .line 354
    return-void
.end method

.method public onLoadFailure(Ljava/lang/Exception;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Exception;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 358
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity$1;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    invoke-virtual {v0, p1}, Lcom/yalantis/ucrop/UCropActivity;->setResultException(Ljava/lang/Throwable;)V

    .line 359
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity$1;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    invoke-virtual {v0}, Lcom/yalantis/ucrop/UCropActivity;->finish()V

    .line 360
    return-void
.end method

.method public onRotate(F)V
    .registers 3
    .param p1, "currentAngle"    # F

    .prologue
    .line 340
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity$1;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    # invokes: Lcom/yalantis/ucrop/UCropActivity;->setAngleText(F)V
    invoke-static {v0, p1}, Lcom/yalantis/ucrop/UCropActivity;->access$000(Lcom/yalantis/ucrop/UCropActivity;F)V

    .line 341
    return-void
.end method

.method public onScale(F)V
    .registers 3
    .param p1, "currentScale"    # F

    .prologue
    .line 345
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity$1;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    # invokes: Lcom/yalantis/ucrop/UCropActivity;->setScaleText(F)V
    invoke-static {v0, p1}, Lcom/yalantis/ucrop/UCropActivity;->access$100(Lcom/yalantis/ucrop/UCropActivity;F)V

    .line 346
    return-void
.end method
