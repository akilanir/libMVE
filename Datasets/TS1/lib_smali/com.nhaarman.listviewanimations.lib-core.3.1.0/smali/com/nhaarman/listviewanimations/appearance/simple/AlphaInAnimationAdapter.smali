.class public Lcom/nhaarman/listviewanimations/appearance/simple/AlphaInAnimationAdapter;
.super Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;
.source "AlphaInAnimationAdapter.java"


# direct methods
.method public constructor <init>(Landroid/widget/BaseAdapter;)V
    .registers 2
    .param p1, "baseAdapter"    # Landroid/widget/BaseAdapter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;-><init>(Landroid/widget/BaseAdapter;)V

    .line 30
    return-void
.end method


# virtual methods
.method public getAnimators(Landroid/view/ViewGroup;Landroid/view/View;)[Lcom/nineoldandroids/animation/Animator;
    .registers 4
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
    .line 35
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/nineoldandroids/animation/Animator;

    return-object v0
.end method
