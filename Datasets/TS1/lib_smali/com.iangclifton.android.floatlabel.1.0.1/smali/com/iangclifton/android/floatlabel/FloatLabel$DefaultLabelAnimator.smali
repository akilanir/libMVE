.class Lcom/iangclifton/android/floatlabel/FloatLabel$DefaultLabelAnimator;
.super Ljava/lang/Object;
.source "FloatLabel.java"

# interfaces
.implements Lcom/iangclifton/android/floatlabel/FloatLabel$LabelAnimator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/iangclifton/android/floatlabel/FloatLabel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DefaultLabelAnimator"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 420
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/iangclifton/android/floatlabel/FloatLabel$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/iangclifton/android/floatlabel/FloatLabel$1;

    .prologue
    .line 420
    invoke-direct {p0}, Lcom/iangclifton/android/floatlabel/FloatLabel$DefaultLabelAnimator;-><init>()V

    return-void
.end method


# virtual methods
.method public onDisplayLabel(Landroid/view/View;)V
    .registers 6
    .param p1, "label"    # Landroid/view/View;

    .prologue
    .line 424
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v1, v2

    .line 425
    .local v1, "offset":F
    invoke-virtual {p1}, Landroid/view/View;->getY()F

    move-result v0

    .line 426
    .local v0, "currentY":F
    cmpl-float v2, v0, v1

    if-eqz v2, :cond_12

    .line 427
    invoke-virtual {p1, v1}, Landroid/view/View;->setY(F)V

    .line 429
    :cond_12
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->y(F)Landroid/view/ViewPropertyAnimator;

    .line 430
    return-void
.end method

.method public onHideLabel(Landroid/view/View;)V
    .registers 6
    .param p1, "label"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    .line 434
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v1, v2

    .line 435
    .local v1, "offset":F
    invoke-virtual {p1}, Landroid/view/View;->getY()F

    move-result v0

    .line 436
    .local v0, "currentY":F
    cmpl-float v2, v0, v3

    if-eqz v2, :cond_13

    .line 437
    invoke-virtual {p1, v3}, Landroid/view/View;->setY(F)V

    .line 439
    :cond_13
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/ViewPropertyAnimator;->y(F)Landroid/view/ViewPropertyAnimator;

    .line 440
    return-void
.end method
