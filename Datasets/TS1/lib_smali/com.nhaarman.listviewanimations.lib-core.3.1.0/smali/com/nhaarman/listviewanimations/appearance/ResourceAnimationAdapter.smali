.class public abstract Lcom/nhaarman/listviewanimations/appearance/ResourceAnimationAdapter;
.super Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;
.source "ResourceAnimationAdapter.java"


# instance fields
.field private final mContext:Landroid/content/Context;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Landroid/widget/BaseAdapter;Landroid/content/Context;)V
    .registers 3
    .param p1, "baseAdapter"    # Landroid/widget/BaseAdapter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;-><init>(Landroid/widget/BaseAdapter;)V

    .line 40
    iput-object p2, p0, Lcom/nhaarman/listviewanimations/appearance/ResourceAnimationAdapter;->mContext:Landroid/content/Context;

    .line 41
    return-void
.end method


# virtual methods
.method protected abstract getAnimationResourceId()I
.end method

.method public getAnimators(Landroid/view/ViewGroup;Landroid/view/View;)[Lcom/nineoldandroids/animation/Animator;
    .registers 7
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
    .line 46
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/nineoldandroids/animation/Animator;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/nhaarman/listviewanimations/appearance/ResourceAnimationAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/nhaarman/listviewanimations/appearance/ResourceAnimationAdapter;->getAnimationResourceId()I

    move-result v3

    invoke-static {v2, v3}, Lcom/nineoldandroids/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Lcom/nineoldandroids/animation/Animator;

    move-result-object v2

    aput-object v2, v0, v1

    return-object v0
.end method
