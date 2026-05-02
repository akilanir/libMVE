.class public abstract Lcom/nhaarman/listviewanimations/appearance/SingleAnimationAdapter;
.super Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;
.source "SingleAnimationAdapter.java"


# direct methods
.method protected constructor <init>(Landroid/widget/BaseAdapter;)V
    .registers 2
    .param p1, "baseAdapter"    # Landroid/widget/BaseAdapter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;-><init>(Landroid/widget/BaseAdapter;)V

    .line 34
    return-void
.end method


# virtual methods
.method protected abstract getAnimator(Landroid/view/ViewGroup;Landroid/view/View;)Lcom/nineoldandroids/animation/Animator;
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public getAnimators(Landroid/view/ViewGroup;Landroid/view/View;)[Lcom/nineoldandroids/animation/Animator;
    .registers 6
    .param p1, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 39
    invoke-virtual {p0, p1, p2}, Lcom/nhaarman/listviewanimations/appearance/SingleAnimationAdapter;->getAnimator(Landroid/view/ViewGroup;Landroid/view/View;)Lcom/nineoldandroids/animation/Animator;

    move-result-object v0

    .line 40
    .local v0, "animator":Lcom/nineoldandroids/animation/Animator;
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/nineoldandroids/animation/Animator;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    return-object v1
.end method
