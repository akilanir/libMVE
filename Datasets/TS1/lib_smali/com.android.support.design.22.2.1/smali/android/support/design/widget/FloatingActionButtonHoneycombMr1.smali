.class Landroid/support/design/widget/FloatingActionButtonHoneycombMr1;
.super Landroid/support/design/widget/FloatingActionButtonEclairMr1;
.source "FloatingActionButtonHoneycombMr1.java"


# instance fields
.field private mIsHiding:Z


# direct methods
.method constructor <init>(Landroid/view/View;Landroid/support/design/widget/ShadowViewDelegate;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "shadowViewDelegate"    # Landroid/support/design/widget/ShadowViewDelegate;

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Landroid/support/design/widget/FloatingActionButtonEclairMr1;-><init>(Landroid/view/View;Landroid/support/design/widget/ShadowViewDelegate;)V

    .line 29
    return-void
.end method

.method static synthetic access$002(Landroid/support/design/widget/FloatingActionButtonHoneycombMr1;Z)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/FloatingActionButtonHoneycombMr1;
    .param p1, "x1"    # Z

    .prologue
    .line 23
    iput-boolean p1, p0, Landroid/support/design/widget/FloatingActionButtonHoneycombMr1;->mIsHiding:Z

    return p1
.end method


# virtual methods
.method hide()V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 33
    iget-boolean v0, p0, Landroid/support/design/widget/FloatingActionButtonHoneycombMr1;->mIsHiding:Z

    if-eqz v0, :cond_6

    .line 61
    :goto_5
    return-void

    .line 38
    :cond_6
    iget-object v0, p0, Landroid/support/design/widget/FloatingActionButtonHoneycombMr1;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    sget-object v1, Landroid/support/design/widget/AnimationUtils;->FAST_OUT_SLOW_IN_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Landroid/support/design/widget/FloatingActionButtonHoneycombMr1$1;

    invoke-direct {v1, p0}, Landroid/support/design/widget/FloatingActionButtonHoneycombMr1$1;-><init>(Landroid/support/design/widget/FloatingActionButtonHoneycombMr1;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    goto :goto_5
.end method

.method show()V
    .registers 4

    .prologue
    const/high16 v1, 0x3f800000    # 1.0f

    .line 65
    iget-object v0, p0, Landroid/support/design/widget/FloatingActionButtonHoneycombMr1;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    sget-object v1, Landroid/support/design/widget/AnimationUtils;->FAST_OUT_SLOW_IN_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 72
    return-void
.end method
