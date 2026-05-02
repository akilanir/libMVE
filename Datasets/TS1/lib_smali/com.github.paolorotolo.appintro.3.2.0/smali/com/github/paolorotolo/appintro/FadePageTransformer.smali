.class Lcom/github/paolorotolo/appintro/FadePageTransformer;
.super Ljava/lang/Object;
.source "FadePageTransformer.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$PageTransformer;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public transformPage(Landroid/view/View;F)V
    .registers 7
    .param p1, "view"    # Landroid/view/View;
    .param p2, "position"    # F

    .prologue
    const/4 v3, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    neg-float v1, p2

    mul-float/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 12
    const/high16 v0, -0x40800000    # -1.0f

    cmpg-float v0, p2, v0

    if-lez v0, :cond_17

    cmpl-float v0, p2, v2

    if-ltz v0, :cond_1f

    .line 13
    :cond_17
    invoke-virtual {p1, v3}, Landroid/view/View;->setAlpha(F)V

    .line 14
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 22
    :goto_1e
    return-void

    .line 15
    :cond_1f
    cmpl-float v0, p2, v3

    if-nez v0, :cond_2b

    .line 16
    invoke-virtual {p1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 17
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    goto :goto_1e

    .line 20
    :cond_2b
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v0

    sub-float v0, v2, v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    goto :goto_1e
.end method
