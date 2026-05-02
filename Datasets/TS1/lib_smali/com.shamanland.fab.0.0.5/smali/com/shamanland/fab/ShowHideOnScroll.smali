.class public Lcom/shamanland/fab/ShowHideOnScroll;
.super Lcom/shamanland/fab/ScrollDetector;
.source "ShowHideOnScroll.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# instance fields
.field private final mHide:I

.field private final mShow:I

.field private final mView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 22
    sget v0, Lcom/shamanland/fab/R$anim;->floating_action_button_show:I

    sget v1, Lcom/shamanland/fab/R$anim;->floating_action_button_hide:I

    invoke-direct {p0, p1, v0, v1}, Lcom/shamanland/fab/ShowHideOnScroll;-><init>(Landroid/view/View;II)V

    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/view/View;II)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "animShow"    # I
    .param p3, "animHide"    # I

    .prologue
    .line 33
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/shamanland/fab/ScrollDetector;-><init>(Landroid/content/Context;)V

    .line 34
    iput-object p1, p0, Lcom/shamanland/fab/ShowHideOnScroll;->mView:Landroid/view/View;

    .line 35
    iput p2, p0, Lcom/shamanland/fab/ShowHideOnScroll;->mShow:I

    .line 36
    iput p3, p0, Lcom/shamanland/fab/ShowHideOnScroll;->mHide:I

    .line 37
    return-void
.end method

.method private animate(I)V
    .registers 4
    .param p1, "anim"    # I

    .prologue
    .line 56
    if-eqz p1, :cond_18

    .line 57
    iget-object v1, p0, Lcom/shamanland/fab/ShowHideOnScroll;->mView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 58
    .local v0, "a":Landroid/view/animation/Animation;
    invoke-virtual {v0, p0}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 60
    iget-object v1, p0, Lcom/shamanland/fab/ShowHideOnScroll;->mView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 61
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/shamanland/fab/ShowHideOnScroll;->setIgnore(Z)V

    .line 63
    .end local v0    # "a":Landroid/view/animation/Animation;
    :cond_18
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 3
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 72
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/shamanland/fab/ShowHideOnScroll;->setIgnore(Z)V

    .line 73
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 78
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 68
    return-void
.end method

.method public onScrollDown()V
    .registers 3

    .prologue
    .line 41
    iget-object v0, p0, Lcom/shamanland/fab/ShowHideOnScroll;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_13

    .line 42
    iget-object v0, p0, Lcom/shamanland/fab/ShowHideOnScroll;->mView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 43
    iget v0, p0, Lcom/shamanland/fab/ShowHideOnScroll;->mShow:I

    invoke-direct {p0, v0}, Lcom/shamanland/fab/ShowHideOnScroll;->animate(I)V

    .line 45
    :cond_13
    return-void
.end method

.method public onScrollUp()V
    .registers 3

    .prologue
    .line 49
    iget-object v0, p0, Lcom/shamanland/fab/ShowHideOnScroll;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_14

    .line 50
    iget-object v0, p0, Lcom/shamanland/fab/ShowHideOnScroll;->mView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 51
    iget v0, p0, Lcom/shamanland/fab/ShowHideOnScroll;->mHide:I

    invoke-direct {p0, v0}, Lcom/shamanland/fab/ShowHideOnScroll;->animate(I)V

    .line 53
    :cond_14
    return-void
.end method
