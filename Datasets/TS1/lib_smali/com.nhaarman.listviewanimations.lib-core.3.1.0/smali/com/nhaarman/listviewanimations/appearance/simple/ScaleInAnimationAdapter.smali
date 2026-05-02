.class public Lcom/nhaarman/listviewanimations/appearance/simple/ScaleInAnimationAdapter;
.super Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;
.source "ScaleInAnimationAdapter.java"


# static fields
.field private static final DEFAULT_SCALE_FROM:F = 0.8f

.field private static final SCALE_X:Ljava/lang/String; = "scaleX"

.field private static final SCALE_Y:Ljava/lang/String; = "scaleY"


# instance fields
.field private final mScaleFrom:F


# direct methods
.method public constructor <init>(Landroid/widget/BaseAdapter;)V
    .registers 3
    .param p1, "baseAdapter"    # Landroid/widget/BaseAdapter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 37
    const v0, 0x3f4ccccd    # 0.8f

    invoke-direct {p0, p1, v0}, Lcom/nhaarman/listviewanimations/appearance/simple/ScaleInAnimationAdapter;-><init>(Landroid/widget/BaseAdapter;F)V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/widget/BaseAdapter;F)V
    .registers 3
    .param p1, "baseAdapter"    # Landroid/widget/BaseAdapter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "scaleFrom"    # F

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;-><init>(Landroid/widget/BaseAdapter;)V

    .line 42
    iput p2, p0, Lcom/nhaarman/listviewanimations/appearance/simple/ScaleInAnimationAdapter;->mScaleFrom:F

    .line 43
    return-void
.end method


# virtual methods
.method public getAnimators(Landroid/view/ViewGroup;Landroid/view/View;)[Lcom/nineoldandroids/animation/Animator;
    .registers 12
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
    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 48
    const-string v2, "scaleX"

    new-array v3, v7, [F

    iget v4, p0, Lcom/nhaarman/listviewanimations/appearance/simple/ScaleInAnimationAdapter;->mScaleFrom:F

    aput v4, v3, v5

    aput v8, v3, v6

    invoke-static {p2, v2, v3}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    .line 49
    .local v0, "scaleX":Lcom/nineoldandroids/animation/ObjectAnimator;
    const-string v2, "scaleY"

    new-array v3, v7, [F

    iget v4, p0, Lcom/nhaarman/listviewanimations/appearance/simple/ScaleInAnimationAdapter;->mScaleFrom:F

    aput v4, v3, v5

    aput v8, v3, v6

    invoke-static {p2, v2, v3}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v1

    .line 50
    .local v1, "scaleY":Lcom/nineoldandroids/animation/ObjectAnimator;
    new-array v2, v7, [Lcom/nineoldandroids/animation/ObjectAnimator;

    aput-object v0, v2, v5

    aput-object v1, v2, v6

    return-object v2
.end method
