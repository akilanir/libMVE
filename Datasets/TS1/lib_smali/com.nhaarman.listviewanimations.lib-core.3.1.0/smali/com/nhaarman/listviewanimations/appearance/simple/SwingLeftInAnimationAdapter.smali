.class public Lcom/nhaarman/listviewanimations/appearance/simple/SwingLeftInAnimationAdapter;
.super Lcom/nhaarman/listviewanimations/appearance/SingleAnimationAdapter;
.source "SwingLeftInAnimationAdapter.java"


# static fields
.field private static final TRANSLATION_X:Ljava/lang/String; = "translationX"


# direct methods
.method public constructor <init>(Landroid/widget/BaseAdapter;)V
    .registers 2
    .param p1, "baseAdapter"    # Landroid/widget/BaseAdapter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/nhaarman/listviewanimations/appearance/SingleAnimationAdapter;-><init>(Landroid/widget/BaseAdapter;)V

    .line 38
    return-void
.end method


# virtual methods
.method protected getAnimator(Landroid/view/ViewGroup;Landroid/view/View;)Lcom/nineoldandroids/animation/Animator;
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
    .line 43
    const-string v0, "translationX"

    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWidth()I

    move-result v3

    rsub-int/lit8 v3, v3, 0x0

    int-to-float v3, v3

    aput v3, v1, v2

    const/4 v2, 0x1

    const/4 v3, 0x0

    aput v3, v1, v2

    invoke-static {p2, v0, v1}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    return-object v0
.end method
