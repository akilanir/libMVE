.class Lcom/rey/material/app/ToolbarManager$SimpleAnimator;
.super Ljava/lang/Object;
.source "ToolbarManager.java"

# interfaces
.implements Lcom/rey/material/app/ToolbarManager$Animator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/ToolbarManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SimpleAnimator"
.end annotation


# instance fields
.field private mAnimationIn:I

.field private mAnimationOut:I


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "animIn"    # I
    .param p2, "animOut"    # I

    .prologue
    .line 341
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 342
    iput p1, p0, Lcom/rey/material/app/ToolbarManager$SimpleAnimator;->mAnimationIn:I

    .line 343
    iput p2, p0, Lcom/rey/material/app/ToolbarManager$SimpleAnimator;->mAnimationOut:I

    .line 344
    return-void
.end method


# virtual methods
.method public getInAnimation(Landroid/view/View;I)Landroid/view/animation/Animation;
    .registers 5
    .param p1, "v"    # Landroid/view/View;
    .param p2, "position"    # I

    .prologue
    .line 353
    iget v0, p0, Lcom/rey/material/app/ToolbarManager$SimpleAnimator;->mAnimationIn:I

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lcom/rey/material/app/ToolbarManager$SimpleAnimator;->mAnimationIn:I

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    goto :goto_5
.end method

.method public getOutAnimation(Landroid/view/View;I)Landroid/view/animation/Animation;
    .registers 5
    .param p1, "v"    # Landroid/view/View;
    .param p2, "position"    # I

    .prologue
    .line 348
    iget v0, p0, Lcom/rey/material/app/ToolbarManager$SimpleAnimator;->mAnimationOut:I

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lcom/rey/material/app/ToolbarManager$SimpleAnimator;->mAnimationOut:I

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    goto :goto_5
.end method
