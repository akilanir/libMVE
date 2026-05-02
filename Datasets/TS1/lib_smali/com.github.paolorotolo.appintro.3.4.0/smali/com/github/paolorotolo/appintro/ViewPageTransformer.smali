.class Lcom/github/paolorotolo/appintro/ViewPageTransformer;
.super Ljava/lang/Object;
.source "ViewPageTransformer.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$PageTransformer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/paolorotolo/appintro/ViewPageTransformer$1;,
        Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;
    }
.end annotation


# static fields
.field private static final MIN_ALPHA_SLIDE:F = 0.35f

.field private static final MIN_ALPHA_ZOOM:F = 0.5f

.field private static final MIN_SCALE_DEPTH:F = 0.75f

.field private static final MIN_SCALE_ZOOM:F = 0.85f

.field private static final SCALE_FACTOR_SLIDE:F = 0.85f


# instance fields
.field private final mTransformType:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;


# direct methods
.method constructor <init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V
    .registers 2
    .param p1, "transformType"    # Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/github/paolorotolo/appintro/ViewPageTransformer;->mTransformType:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    .line 21
    return-void
.end method


# virtual methods
.method public transformPage(Landroid/view/View;F)V
    .registers 14
    .param p1, "page"    # Landroid/view/View;
    .param p2, "position"    # F
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 35
    sget-object v7, Lcom/github/paolorotolo/appintro/ViewPageTransformer$1;->$SwitchMap$com$github$paolorotolo$appintro$ViewPageTransformer$TransformType:[I

    iget-object v8, p0, Lcom/github/paolorotolo/appintro/ViewPageTransformer;->mTransformType:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-virtual {v8}, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->ordinal()I

    move-result v8

    aget v7, v7, v8

    packed-switch v7, :pswitch_data_126

    .line 113
    :goto_d
    return-void

    .line 37
    :pswitch_e
    const/high16 v7, -0x3e100000    # -30.0f

    mul-float/2addr v7, p2

    invoke-virtual {p1, v7}, Landroid/view/View;->setRotationY(F)V

    goto :goto_d

    .line 41
    :pswitch_15
    const/4 v7, 0x0

    cmpg-float v7, p2, v7

    if-gez v7, :cond_60

    const/high16 v7, -0x40800000    # -1.0f

    cmpl-float v7, p2, v7

    if-lez v7, :cond_60

    .line 43
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v7

    const/high16 v8, 0x3f800000    # 1.0f

    sub-float/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    const v8, 0x3e199998    # 0.14999998f

    mul-float/2addr v7, v8

    const v8, 0x3f59999a    # 0.85f

    add-float v3, v7, v8

    .line 44
    .local v3, "scale":F
    const v7, 0x3eb33333    # 0.35f

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v9

    sub-float/2addr v8, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 45
    .local v0, "alpha":F
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v2

    .line 46
    .local v2, "pageWidth":I
    neg-int v7, v2

    int-to-float v7, v7

    mul-float v4, p2, v7

    .line 47
    .local v4, "translateValue":F
    neg-int v7, v2

    int-to-float v7, v7

    cmpl-float v7, v4, v7

    if-lez v7, :cond_5e

    .line 48
    move v5, v4

    .line 109
    .end local v2    # "pageWidth":I
    .end local v4    # "translateValue":F
    .local v5, "translationX":F
    :goto_51
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 110
    invoke-virtual {p1, v5}, Landroid/view/View;->setTranslationX(F)V

    .line 111
    invoke-virtual {p1, v3}, Landroid/view/View;->setScaleX(F)V

    .line 112
    invoke-virtual {p1, v3}, Landroid/view/View;->setScaleY(F)V

    goto :goto_d

    .line 50
    .end local v5    # "translationX":F
    .restart local v2    # "pageWidth":I
    .restart local v4    # "translateValue":F
    :cond_5e
    const/4 v5, 0x0

    .restart local v5    # "translationX":F
    goto :goto_51

    .line 53
    .end local v0    # "alpha":F
    .end local v2    # "pageWidth":I
    .end local v3    # "scale":F
    .end local v4    # "translateValue":F
    .end local v5    # "translationX":F
    :cond_60
    const/high16 v0, 0x3f800000    # 1.0f

    .line 54
    .restart local v0    # "alpha":F
    const/high16 v3, 0x3f800000    # 1.0f

    .line 55
    .restart local v3    # "scale":F
    const/4 v5, 0x0

    .line 57
    .restart local v5    # "translationX":F
    goto :goto_51

    .line 60
    .end local v0    # "alpha":F
    .end local v3    # "scale":F
    .end local v5    # "translationX":F
    :pswitch_66
    const/4 v7, 0x0

    cmpl-float v7, p2, v7

    if-lez v7, :cond_8c

    const/high16 v7, 0x3f800000    # 1.0f

    cmpg-float v7, p2, v7

    if-gez v7, :cond_8c

    .line 62
    const/high16 v7, 0x3f800000    # 1.0f

    sub-float v0, v7, p2

    .line 63
    .restart local v0    # "alpha":F
    const/high16 v7, 0x3f400000    # 0.75f

    const/high16 v8, 0x3e800000    # 0.25f

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v10

    sub-float/2addr v9, v10

    mul-float/2addr v8, v9

    add-float v3, v7, v8

    .line 64
    .restart local v3    # "scale":F
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v7

    int-to-float v7, v7

    neg-float v8, p2

    mul-float v5, v7, v8

    .restart local v5    # "translationX":F
    goto :goto_51

    .line 67
    .end local v0    # "alpha":F
    .end local v3    # "scale":F
    .end local v5    # "translationX":F
    :cond_8c
    const/high16 v0, 0x3f800000    # 1.0f

    .line 68
    .restart local v0    # "alpha":F
    const/high16 v3, 0x3f800000    # 1.0f

    .line 69
    .restart local v3    # "scale":F
    const/4 v5, 0x0

    .line 71
    .restart local v5    # "translationX":F
    goto :goto_51

    .line 74
    .end local v0    # "alpha":F
    .end local v3    # "scale":F
    .end local v5    # "translationX":F
    :pswitch_92
    const/high16 v7, -0x40800000    # -1.0f

    cmpl-float v7, p2, v7

    if-ltz v7, :cond_ec

    const/high16 v7, 0x3f800000    # 1.0f

    cmpg-float v7, p2, v7

    if-gtz v7, :cond_ec

    .line 75
    const v7, 0x3f59999a    # 0.85f

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v9

    sub-float/2addr v8, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 76
    .restart local v3    # "scale":F
    const/high16 v7, 0x3f000000    # 0.5f

    const v8, 0x3f59999a    # 0.85f

    sub-float v8, v3, v8

    const v9, 0x3e199998    # 0.14999998f

    div-float/2addr v8, v9

    const/high16 v9, 0x3f000000    # 0.5f

    mul-float/2addr v8, v9

    add-float v0, v7, v8

    .line 78
    .restart local v0    # "alpha":F
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v7

    int-to-float v7, v7

    const/high16 v8, 0x3f800000    # 1.0f

    sub-float/2addr v8, v3

    mul-float/2addr v7, v8

    const/high16 v8, 0x40000000    # 2.0f

    div-float v6, v7, v8

    .line 79
    .local v6, "vMargin":F
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v7

    int-to-float v7, v7

    const/high16 v8, 0x3f800000    # 1.0f

    sub-float/2addr v8, v3

    mul-float/2addr v7, v8

    const/high16 v8, 0x40000000    # 2.0f

    div-float v1, v7, v8

    .line 80
    .local v1, "hMargin":F
    const/4 v7, 0x0

    cmpg-float v7, p2, v7

    if-gez v7, :cond_e3

    .line 81
    const/high16 v7, 0x40000000    # 2.0f

    div-float v7, v6, v7

    sub-float v5, v1, v7

    .restart local v5    # "translationX":F
    goto/16 :goto_51

    .line 83
    .end local v5    # "translationX":F
    :cond_e3
    neg-float v7, v1

    const/high16 v8, 0x40000000    # 2.0f

    div-float v8, v6, v8

    add-float v5, v7, v8

    .restart local v5    # "translationX":F
    goto/16 :goto_51

    .line 86
    .end local v0    # "alpha":F
    .end local v1    # "hMargin":F
    .end local v3    # "scale":F
    .end local v5    # "translationX":F
    .end local v6    # "vMargin":F
    :cond_ec
    const/high16 v0, 0x3f800000    # 1.0f

    .line 87
    .restart local v0    # "alpha":F
    const/high16 v3, 0x3f800000    # 1.0f

    .line 88
    .restart local v3    # "scale":F
    const/4 v5, 0x0

    .line 90
    .restart local v5    # "translationX":F
    goto/16 :goto_51

    .line 92
    .end local v0    # "alpha":F
    .end local v3    # "scale":F
    .end local v5    # "translationX":F
    :pswitch_f3
    const/high16 v7, -0x40800000    # -1.0f

    cmpg-float v7, p2, v7

    if-lez v7, :cond_ff

    const/high16 v7, 0x3f800000    # 1.0f

    cmpl-float v7, p2, v7

    if-ltz v7, :cond_109

    .line 93
    :cond_ff
    const/4 v7, 0x0

    invoke-virtual {p1, v7}, Landroid/view/View;->setAlpha(F)V

    .line 94
    const/4 v7, 0x0

    invoke-virtual {p1, v7}, Landroid/view/View;->setClickable(Z)V

    goto/16 :goto_d

    .line 95
    :cond_109
    const/4 v7, 0x0

    cmpl-float v7, p2, v7

    if-nez v7, :cond_119

    .line 96
    const/high16 v7, 0x3f800000    # 1.0f

    invoke-virtual {p1, v7}, Landroid/view/View;->setAlpha(F)V

    .line 97
    const/4 v7, 0x1

    invoke-virtual {p1, v7}, Landroid/view/View;->setClickable(Z)V

    goto/16 :goto_d

    .line 100
    :cond_119
    const/high16 v7, 0x3f800000    # 1.0f

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v8

    sub-float/2addr v7, v8

    invoke-virtual {p1, v7}, Landroid/view/View;->setAlpha(F)V

    goto/16 :goto_d

    .line 35
    nop

    :pswitch_data_126
    .packed-switch 0x1
        :pswitch_e
        :pswitch_15
        :pswitch_66
        :pswitch_92
        :pswitch_f3
    .end packed-switch
.end method
