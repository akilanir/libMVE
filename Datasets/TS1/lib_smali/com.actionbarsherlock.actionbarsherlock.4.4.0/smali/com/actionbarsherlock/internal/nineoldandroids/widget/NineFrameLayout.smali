.class public Lcom/actionbarsherlock/internal/nineoldandroids/widget/NineFrameLayout;
.super Landroid/widget/FrameLayout;
.source "NineFrameLayout.java"


# instance fields
.field private final mProxy:Lcom/actionbarsherlock/internal/nineoldandroids/view/animation/AnimatorProxy;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 13
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 14
    sget-boolean v0, Lcom/actionbarsherlock/internal/nineoldandroids/view/animation/AnimatorProxy;->NEEDS_PROXY:Z

    if-eqz v0, :cond_e

    invoke-static {p0}, Lcom/actionbarsherlock/internal/nineoldandroids/view/animation/AnimatorProxy;->wrap(Landroid/view/View;)Lcom/actionbarsherlock/internal/nineoldandroids/view/animation/AnimatorProxy;

    move-result-object v0

    :goto_b
    iput-object v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/widget/NineFrameLayout;->mProxy:Lcom/actionbarsherlock/internal/nineoldandroids/view/animation/AnimatorProxy;

    .line 15
    return-void

    .line 14
    :cond_e
    const/4 v0, 0x0

    goto :goto_b
.end method


# virtual methods
.method public getAlpha()F
    .registers 2

    .prologue
    .line 30
    sget-boolean v0, Lcom/actionbarsherlock/internal/nineoldandroids/view/animation/AnimatorProxy;->NEEDS_PROXY:Z

    if-eqz v0, :cond_b

    .line 31
    iget-object v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/widget/NineFrameLayout;->mProxy:Lcom/actionbarsherlock/internal/nineoldandroids/view/animation/AnimatorProxy;

    invoke-virtual {v0}, Lcom/actionbarsherlock/internal/nineoldandroids/view/animation/AnimatorProxy;->getAlpha()F

    move-result v0

    .line 33
    :goto_a
    return v0

    :cond_b
    invoke-super {p0}, Landroid/widget/FrameLayout;->getAlpha()F

    move-result v0

    goto :goto_a
.end method

.method public getTranslationY()F
    .registers 2

    .prologue
    .line 44
    sget-boolean v0, Lcom/actionbarsherlock/internal/nineoldandroids/view/animation/AnimatorProxy;->NEEDS_PROXY:Z

    if-eqz v0, :cond_b

    .line 45
    iget-object v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/widget/NineFrameLayout;->mProxy:Lcom/actionbarsherlock/internal/nineoldandroids/view/animation/AnimatorProxy;

    invoke-virtual {v0}, Lcom/actionbarsherlock/internal/nineoldandroids/view/animation/AnimatorProxy;->getTranslationY()F

    move-result v0

    .line 47
    :goto_a
    return v0

    :cond_b
    invoke-super {p0}, Landroid/widget/FrameLayout;->getTranslationY()F

    move-result v0

    goto :goto_a
.end method

.method public setAlpha(F)V
    .registers 3
    .param p1, "alpha"    # F

    .prologue
    .line 37
    sget-boolean v0, Lcom/actionbarsherlock/internal/nineoldandroids/view/animation/AnimatorProxy;->NEEDS_PROXY:Z

    if-eqz v0, :cond_a

    .line 38
    iget-object v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/widget/NineFrameLayout;->mProxy:Lcom/actionbarsherlock/internal/nineoldandroids/view/animation/AnimatorProxy;

    invoke-virtual {v0, p1}, Lcom/actionbarsherlock/internal/nineoldandroids/view/animation/AnimatorProxy;->setAlpha(F)V

    .line 42
    :goto_9
    return-void

    .line 40
    :cond_a
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    goto :goto_9
.end method

.method public setTranslationY(F)V
    .registers 3
    .param p1, "translationY"    # F

    .prologue
    .line 51
    sget-boolean v0, Lcom/actionbarsherlock/internal/nineoldandroids/view/animation/AnimatorProxy;->NEEDS_PROXY:Z

    if-eqz v0, :cond_a

    .line 52
    iget-object v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/widget/NineFrameLayout;->mProxy:Lcom/actionbarsherlock/internal/nineoldandroids/view/animation/AnimatorProxy;

    invoke-virtual {v0, p1}, Lcom/actionbarsherlock/internal/nineoldandroids/view/animation/AnimatorProxy;->setTranslationY(F)V

    .line 56
    :goto_9
    return-void

    .line 54
    :cond_a
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    goto :goto_9
.end method

.method public setVisibility(I)V
    .registers 3
    .param p1, "visibility"    # I

    .prologue
    .line 19
    iget-object v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/widget/NineFrameLayout;->mProxy:Lcom/actionbarsherlock/internal/nineoldandroids/view/animation/AnimatorProxy;

    if-eqz v0, :cond_b

    .line 20
    const/16 v0, 0x8

    if-ne p1, v0, :cond_f

    .line 21
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/nineoldandroids/widget/NineFrameLayout;->clearAnimation()V

    .line 26
    :cond_b
    :goto_b
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 27
    return-void

    .line 22
    :cond_f
    if-nez p1, :cond_b

    .line 23
    iget-object v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/widget/NineFrameLayout;->mProxy:Lcom/actionbarsherlock/internal/nineoldandroids/view/animation/AnimatorProxy;

    invoke-virtual {p0, v0}, Lcom/actionbarsherlock/internal/nineoldandroids/widget/NineFrameLayout;->setAnimation(Landroid/view/animation/Animation;)V

    goto :goto_b
.end method
