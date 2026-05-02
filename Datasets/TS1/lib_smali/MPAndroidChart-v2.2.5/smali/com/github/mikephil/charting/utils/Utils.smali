.class public abstract Lcom/github/mikephil/charting/utils/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field public static final DEG2RAD:D = 0.017453292519943295

.field public static final FDEG2RAD:F = 0.017453292f

.field private static final POW_10:[I

.field private static mDrawTextRectBuffer:Landroid/graphics/Rect;

.field private static mFontMetricsBuffer:Landroid/graphics/Paint$FontMetrics;

.field private static mMaximumFlingVelocity:I

.field private static mMetrics:Landroid/util/DisplayMetrics;

.field private static mMinimumFlingVelocity:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 39
    const/16 v0, 0x32

    sput v0, Lcom/github/mikephil/charting/utils/Utils;->mMinimumFlingVelocity:I

    .line 40
    const/16 v0, 0x1f40

    sput v0, Lcom/github/mikephil/charting/utils/Utils;->mMaximumFlingVelocity:I

    .line 198
    const/16 v0, 0xa

    new-array v0, v0, [I

    fill-array-data v0, :array_20

    sput-object v0, Lcom/github/mikephil/charting/utils/Utils;->POW_10:[I

    .line 604
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/github/mikephil/charting/utils/Utils;->mDrawTextRectBuffer:Landroid/graphics/Rect;

    .line 605
    new-instance v0, Landroid/graphics/Paint$FontMetrics;

    invoke-direct {v0}, Landroid/graphics/Paint$FontMetrics;-><init>()V

    sput-object v0, Lcom/github/mikephil/charting/utils/Utils;->mFontMetricsBuffer:Landroid/graphics/Paint$FontMetrics;

    return-void

    .line 198
    :array_20
    .array-data 4
        0x1
        0xa
        0x64
        0x3e8
        0x2710
        0x186a0
        0xf4240
        0x989680
        0x5f5e100
        0x3b9aca00
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static calcTextHeight(Landroid/graphics/Paint;Ljava/lang/String;)I
    .registers 5
    .param p0, "paint"    # Landroid/graphics/Paint;
    .param p1, "demoText"    # Ljava/lang/String;

    .prologue
    .line 164
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 165
    .local v0, "r":Landroid/graphics/Rect;
    const/4 v1, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p0, p1, v1, v2, v0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 166
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v1

    return v1
.end method

.method public static calcTextSize(Landroid/graphics/Paint;Ljava/lang/String;)Lcom/github/mikephil/charting/utils/FSize;
    .registers 6
    .param p0, "paint"    # Landroid/graphics/Paint;
    .param p1, "demoText"    # Ljava/lang/String;

    .prologue
    .line 189
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 190
    .local v0, "r":Landroid/graphics/Rect;
    const/4 v1, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p0, p1, v1, v2, v0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 191
    new-instance v1, Lcom/github/mikephil/charting/utils/FSize;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    invoke-direct {v1, v2, v3}, Lcom/github/mikephil/charting/utils/FSize;-><init>(FF)V

    return-object v1
.end method

.method public static calcTextWidth(Landroid/graphics/Paint;Ljava/lang/String;)I
    .registers 3
    .param p0, "paint"    # Landroid/graphics/Paint;
    .param p1, "demoText"    # Ljava/lang/String;

    .prologue
    .line 151
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method public static convertDpToPixel(F)F
    .registers 5
    .param p0, "dp"    # F

    .prologue
    .line 99
    sget-object v2, Lcom/github/mikephil/charting/utils/Utils;->mMetrics:Landroid/util/DisplayMetrics;

    if-nez v2, :cond_c

    .line 101
    const-string v2, "MPChartLib-Utils"

    const-string v3, "Utils NOT INITIALIZED. You need to call Utils.init(...) at least once before calling Utils.convertDpToPixel(...). Otherwise conversion does not take place."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    .end local p0    # "dp":F
    :goto_b
    return p0

    .line 111
    .restart local p0    # "dp":F
    :cond_c
    sget-object v0, Lcom/github/mikephil/charting/utils/Utils;->mMetrics:Landroid/util/DisplayMetrics;

    .line 112
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    iget v2, v0, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float v2, v2

    const/high16 v3, 0x43200000    # 160.0f

    div-float/2addr v2, v3

    mul-float v1, p0, v2

    .local v1, "px":F
    move p0, v1

    .line 113
    goto :goto_b
.end method

.method public static convertIntegers(Ljava/util/List;)[I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)[I"
        }
    .end annotation

    .prologue
    .line 341
    .local p0, "integers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    new-array v1, v2, [I

    .line 343
    .local v1, "ret":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    array-length v2, v1

    if-ge v0, v2, :cond_19

    .line 344
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aput v2, v1, v0

    .line 343
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 347
    :cond_19
    return-object v1
.end method

.method public static convertPixelsToDp(F)F
    .registers 5
    .param p0, "px"    # F

    .prologue
    .line 125
    sget-object v2, Lcom/github/mikephil/charting/utils/Utils;->mMetrics:Landroid/util/DisplayMetrics;

    if-nez v2, :cond_c

    .line 127
    const-string v2, "MPChartLib-Utils"

    const-string v3, "Utils NOT INITIALIZED. You need to call Utils.init(...) at least once before calling Utils.convertPixelsToDp(...). Otherwise conversion does not take place."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    .end local p0    # "px":F
    :goto_b
    return p0

    .line 137
    .restart local p0    # "px":F
    :cond_c
    sget-object v1, Lcom/github/mikephil/charting/utils/Utils;->mMetrics:Landroid/util/DisplayMetrics;

    .line 138
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    iget v2, v1, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float v2, v2

    const/high16 v3, 0x43200000    # 160.0f

    div-float/2addr v2, v3

    div-float v0, p0, v2

    .local v0, "dp":F
    move p0, v0

    .line 139
    goto :goto_b
.end method

.method public static convertStrings(Ljava/util/List;)[Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 358
    .local p0, "strings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    new-array v1, v2, [Ljava/lang/String;

    .line 360
    .local v1, "ret":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    array-length v2, v1

    if-ge v0, v2, :cond_15

    .line 361
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    aput-object v2, v1, v0

    .line 360
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 364
    :cond_15
    return-object v1
.end method

.method public static drawMultilineText(Landroid/graphics/Canvas;Landroid/text/StaticLayout;FFLandroid/text/TextPaint;Landroid/graphics/PointF;F)V
    .registers 20
    .param p0, "c"    # Landroid/graphics/Canvas;
    .param p1, "textLayout"    # Landroid/text/StaticLayout;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "paint"    # Landroid/text/TextPaint;
    .param p5, "anchor"    # Landroid/graphics/PointF;
    .param p6, "angleDegrees"    # F

    .prologue
    .line 677
    const/4 v2, 0x0

    .line 678
    .local v2, "drawOffsetX":F
    const/4 v3, 0x0

    .line 682
    .local v3, "drawOffsetY":F
    sget-object v10, Lcom/github/mikephil/charting/utils/Utils;->mFontMetricsBuffer:Landroid/graphics/Paint$FontMetrics;

    move-object/from16 v0, p4

    invoke-virtual {v0, v10}, Landroid/text/TextPaint;->getFontMetrics(Landroid/graphics/Paint$FontMetrics;)F

    move-result v5

    .line 684
    .local v5, "lineHeight":F
    invoke-virtual {p1}, Landroid/text/StaticLayout;->getWidth()I

    move-result v10

    int-to-float v4, v10

    .line 685
    .local v4, "drawWidth":F
    invoke-virtual {p1}, Landroid/text/StaticLayout;->getLineCount()I

    move-result v10

    int-to-float v10, v10

    mul-float v1, v10, v5

    .line 688
    .local v1, "drawHeight":F
    sget-object v10, Lcom/github/mikephil/charting/utils/Utils;->mDrawTextRectBuffer:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->left:I

    int-to-float v10, v10

    sub-float/2addr v2, v10

    .line 693
    add-float/2addr v3, v1

    .line 696
    invoke-virtual/range {p4 .. p4}, Landroid/text/TextPaint;->getTextAlign()Landroid/graphics/Paint$Align;

    move-result-object v6

    .line 697
    .local v6, "originalTextAlign":Landroid/graphics/Paint$Align;
    sget-object v10, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    move-object/from16 v0, p4

    invoke-virtual {v0, v10}, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 699
    const/4 v10, 0x0

    cmpl-float v10, p6, v10

    if-eqz v10, :cond_82

    .line 702
    const/high16 v10, 0x3f000000    # 0.5f

    mul-float/2addr v10, v4

    sub-float/2addr v2, v10

    .line 703
    const/high16 v10, 0x3f000000    # 0.5f

    mul-float/2addr v10, v1

    sub-float/2addr v3, v10

    .line 705
    move v8, p2

    .line 706
    .local v8, "translateX":F
    move/from16 v9, p3

    .line 709
    .local v9, "translateY":F
    move-object/from16 v0, p5

    iget v10, v0, Landroid/graphics/PointF;->x:F

    const/high16 v11, 0x3f000000    # 0.5f

    cmpl-float v10, v10, v11

    if-nez v10, :cond_4c

    move-object/from16 v0, p5

    iget v10, v0, Landroid/graphics/PointF;->y:F

    const/high16 v11, 0x3f000000    # 0.5f

    cmpl-float v10, v10, v11

    if-eqz v10, :cond_68

    .line 710
    :cond_4c
    move/from16 v0, p6

    invoke-static {v4, v1, v0}, Lcom/github/mikephil/charting/utils/Utils;->getSizeOfRotatedRectangleByDegrees(FFF)Lcom/github/mikephil/charting/utils/FSize;

    move-result-object v7

    .line 715
    .local v7, "rotatedSize":Lcom/github/mikephil/charting/utils/FSize;
    iget v10, v7, Lcom/github/mikephil/charting/utils/FSize;->width:F

    move-object/from16 v0, p5

    iget v11, v0, Landroid/graphics/PointF;->x:F

    const/high16 v12, 0x3f000000    # 0.5f

    sub-float/2addr v11, v12

    mul-float/2addr v10, v11

    sub-float/2addr v8, v10

    .line 716
    iget v10, v7, Lcom/github/mikephil/charting/utils/FSize;->height:F

    move-object/from16 v0, p5

    iget v11, v0, Landroid/graphics/PointF;->y:F

    const/high16 v12, 0x3f000000    # 0.5f

    sub-float/2addr v11, v12

    mul-float/2addr v10, v11

    sub-float/2addr v9, v10

    .line 719
    .end local v7    # "rotatedSize":Lcom/github/mikephil/charting/utils/FSize;
    :cond_68
    invoke-virtual {p0}, Landroid/graphics/Canvas;->save()I

    .line 720
    invoke-virtual {p0, v8, v9}, Landroid/graphics/Canvas;->translate(FF)V

    .line 721
    move/from16 v0, p6

    invoke-virtual {p0, v0}, Landroid/graphics/Canvas;->rotate(F)V

    .line 723
    invoke-virtual {p0, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 724
    invoke-virtual {p1, p0}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 726
    invoke-virtual {p0}, Landroid/graphics/Canvas;->restore()V

    .line 745
    .end local v8    # "translateX":F
    .end local v9    # "translateY":F
    :goto_7c
    move-object/from16 v0, p4

    invoke-virtual {v0, v6}, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 746
    return-void

    .line 728
    :cond_82
    move-object/from16 v0, p5

    iget v10, v0, Landroid/graphics/PointF;->x:F

    const/4 v11, 0x0

    cmpl-float v10, v10, v11

    if-nez v10, :cond_94

    move-object/from16 v0, p5

    iget v10, v0, Landroid/graphics/PointF;->y:F

    const/4 v11, 0x0

    cmpl-float v10, v10, v11

    if-eqz v10, :cond_a0

    .line 730
    :cond_94
    move-object/from16 v0, p5

    iget v10, v0, Landroid/graphics/PointF;->x:F

    mul-float/2addr v10, v4

    sub-float/2addr v2, v10

    .line 731
    move-object/from16 v0, p5

    iget v10, v0, Landroid/graphics/PointF;->y:F

    mul-float/2addr v10, v1

    sub-float/2addr v3, v10

    .line 734
    :cond_a0
    add-float/2addr v2, p2

    .line 735
    add-float v3, v3, p3

    .line 737
    invoke-virtual {p0}, Landroid/graphics/Canvas;->save()I

    .line 739
    invoke-virtual {p0, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 740
    invoke-virtual {p1, p0}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 742
    invoke-virtual {p0}, Landroid/graphics/Canvas;->restore()V

    goto :goto_7c
.end method

.method public static drawMultilineText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/text/TextPaint;Lcom/github/mikephil/charting/utils/FSize;Landroid/graphics/PointF;F)V
    .registers 18
    .param p0, "c"    # Landroid/graphics/Canvas;
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "paint"    # Landroid/text/TextPaint;
    .param p5, "constrainedToSize"    # Lcom/github/mikephil/charting/utils/FSize;
    .param p6, "anchor"    # Landroid/graphics/PointF;
    .param p7, "angleDegrees"    # F

    .prologue
    .line 754
    new-instance v0, Landroid/text/StaticLayout;

    const/4 v2, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    iget v1, p5, Lcom/github/mikephil/charting/utils/FSize;->width:F

    float-to-double v4, v1

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    double-to-int v5, v4

    sget-object v6, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v1, p1

    move-object v4, p4

    invoke-direct/range {v0 .. v9}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;IILandroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .local v0, "textLayout":Landroid/text/StaticLayout;
    move-object v1, p0

    move-object v2, v0

    move v3, p2

    move v4, p3

    move-object v5, p4

    move-object/from16 v6, p6

    move/from16 v7, p7

    .line 761
    invoke-static/range {v1 .. v7}, Lcom/github/mikephil/charting/utils/Utils;->drawMultilineText(Landroid/graphics/Canvas;Landroid/text/StaticLayout;FFLandroid/text/TextPaint;Landroid/graphics/PointF;F)V

    .line 762
    return-void
.end method

.method public static drawXAxisValue(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;Landroid/graphics/PointF;F)V
    .registers 18
    .param p0, "c"    # Landroid/graphics/Canvas;
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "paint"    # Landroid/graphics/Paint;
    .param p5, "anchor"    # Landroid/graphics/PointF;
    .param p6, "angleDegrees"    # F

    .prologue
    .line 611
    const/4 v1, 0x0

    .line 612
    .local v1, "drawOffsetX":F
    const/4 v2, 0x0

    .line 614
    .local v2, "drawOffsetY":F
    sget-object v8, Lcom/github/mikephil/charting/utils/Utils;->mFontMetricsBuffer:Landroid/graphics/Paint$FontMetrics;

    invoke-virtual {p4, v8}, Landroid/graphics/Paint;->getFontMetrics(Landroid/graphics/Paint$FontMetrics;)F

    move-result v3

    .line 615
    .local v3, "lineHeight":F
    const/4 v8, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v9

    sget-object v10, Lcom/github/mikephil/charting/utils/Utils;->mDrawTextRectBuffer:Landroid/graphics/Rect;

    invoke-virtual {p4, p1, v8, v9, v10}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 618
    sget-object v8, Lcom/github/mikephil/charting/utils/Utils;->mDrawTextRectBuffer:Landroid/graphics/Rect;

    iget v8, v8, Landroid/graphics/Rect;->left:I

    int-to-float v8, v8

    sub-float/2addr v1, v8

    .line 623
    sget-object v8, Lcom/github/mikephil/charting/utils/Utils;->mFontMetricsBuffer:Landroid/graphics/Paint$FontMetrics;

    iget v8, v8, Landroid/graphics/Paint$FontMetrics;->ascent:F

    neg-float v8, v8

    add-float/2addr v2, v8

    .line 626
    invoke-virtual {p4}, Landroid/graphics/Paint;->getTextAlign()Landroid/graphics/Paint$Align;

    move-result-object v4

    .line 627
    .local v4, "originalTextAlign":Landroid/graphics/Paint$Align;
    sget-object v8, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {p4, v8}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 629
    const/4 v8, 0x0

    cmpl-float v8, p6, v8

    if-eqz v8, :cond_89

    .line 632
    sget-object v8, Lcom/github/mikephil/charting/utils/Utils;->mDrawTextRectBuffer:Landroid/graphics/Rect;

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v8

    int-to-float v8, v8

    const/high16 v9, 0x3f000000    # 0.5f

    mul-float/2addr v8, v9

    sub-float/2addr v1, v8

    .line 633
    const/high16 v8, 0x3f000000    # 0.5f

    mul-float/2addr v8, v3

    sub-float/2addr v2, v8

    .line 635
    move v6, p2

    .line 636
    .local v6, "translateX":F
    move v7, p3

    .line 639
    .local v7, "translateY":F
    move-object/from16 v0, p5

    iget v8, v0, Landroid/graphics/PointF;->x:F

    const/high16 v9, 0x3f000000    # 0.5f

    cmpl-float v8, v8, v9

    if-nez v8, :cond_51

    move-object/from16 v0, p5

    iget v8, v0, Landroid/graphics/PointF;->y:F

    const/high16 v9, 0x3f000000    # 0.5f

    cmpl-float v8, v8, v9

    if-eqz v8, :cond_74

    .line 640
    :cond_51
    sget-object v8, Lcom/github/mikephil/charting/utils/Utils;->mDrawTextRectBuffer:Landroid/graphics/Rect;

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v8

    int-to-float v8, v8

    move/from16 v0, p6

    invoke-static {v8, v3, v0}, Lcom/github/mikephil/charting/utils/Utils;->getSizeOfRotatedRectangleByDegrees(FFF)Lcom/github/mikephil/charting/utils/FSize;

    move-result-object v5

    .line 645
    .local v5, "rotatedSize":Lcom/github/mikephil/charting/utils/FSize;
    iget v8, v5, Lcom/github/mikephil/charting/utils/FSize;->width:F

    move-object/from16 v0, p5

    iget v9, v0, Landroid/graphics/PointF;->x:F

    const/high16 v10, 0x3f000000    # 0.5f

    sub-float/2addr v9, v10

    mul-float/2addr v8, v9

    sub-float/2addr v6, v8

    .line 646
    iget v8, v5, Lcom/github/mikephil/charting/utils/FSize;->height:F

    move-object/from16 v0, p5

    iget v9, v0, Landroid/graphics/PointF;->y:F

    const/high16 v10, 0x3f000000    # 0.5f

    sub-float/2addr v9, v10

    mul-float/2addr v8, v9

    sub-float/2addr v7, v8

    .line 649
    .end local v5    # "rotatedSize":Lcom/github/mikephil/charting/utils/FSize;
    :cond_74
    invoke-virtual {p0}, Landroid/graphics/Canvas;->save()I

    .line 650
    invoke-virtual {p0, v6, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 651
    move/from16 v0, p6

    invoke-virtual {p0, v0}, Landroid/graphics/Canvas;->rotate(F)V

    .line 653
    invoke-virtual {p0, p1, v1, v2, p4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 655
    invoke-virtual {p0}, Landroid/graphics/Canvas;->restore()V

    .line 669
    .end local v6    # "translateX":F
    .end local v7    # "translateY":F
    :goto_85
    invoke-virtual {p4, v4}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 670
    return-void

    .line 657
    :cond_89
    move-object/from16 v0, p5

    iget v8, v0, Landroid/graphics/PointF;->x:F

    const/4 v9, 0x0

    cmpl-float v8, v8, v9

    if-nez v8, :cond_9b

    move-object/from16 v0, p5

    iget v8, v0, Landroid/graphics/PointF;->y:F

    const/4 v9, 0x0

    cmpl-float v8, v8, v9

    if-eqz v8, :cond_ae

    .line 659
    :cond_9b
    sget-object v8, Lcom/github/mikephil/charting/utils/Utils;->mDrawTextRectBuffer:Landroid/graphics/Rect;

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v8

    int-to-float v8, v8

    move-object/from16 v0, p5

    iget v9, v0, Landroid/graphics/PointF;->x:F

    mul-float/2addr v8, v9

    sub-float/2addr v1, v8

    .line 660
    move-object/from16 v0, p5

    iget v8, v0, Landroid/graphics/PointF;->y:F

    mul-float/2addr v8, v3

    sub-float/2addr v2, v8

    .line 663
    :cond_ae
    add-float/2addr v1, p2

    .line 664
    add-float/2addr v2, p3

    .line 666
    invoke-virtual {p0, p1, v1, v2, p4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_85
.end method

.method public static formatNumber(FIZ)Ljava/lang/String;
    .registers 4
    .param p0, "number"    # F
    .param p1, "digitCount"    # I
    .param p2, "separateThousands"    # Z

    .prologue
    .line 213
    const/16 v0, 0x2e

    invoke-static {p0, p1, p2, v0}, Lcom/github/mikephil/charting/utils/Utils;->formatNumber(FIZC)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatNumber(FIZC)Ljava/lang/String;
    .registers 17
    .param p0, "number"    # F
    .param p1, "digitCount"    # I
    .param p2, "separateThousands"    # Z
    .param p3, "separateChar"    # C

    .prologue
    .line 229
    const/16 v11, 0x23

    new-array v8, v11, [C

    .line 231
    .local v8, "out":[C
    const/4 v7, 0x0

    .line 232
    .local v7, "neg":Z
    const/4 v11, 0x0

    cmpl-float v11, p0, v11

    if-nez v11, :cond_d

    .line 233
    const-string v11, "0"

    .line 303
    :goto_c
    return-object v11

    .line 236
    :cond_d
    const/4 v10, 0x0

    .line 237
    .local v10, "zero":Z
    const/high16 v11, 0x3f800000    # 1.0f

    cmpg-float v11, p0, v11

    if-gez v11, :cond_1b

    const/high16 v11, -0x40800000    # -1.0f

    cmpl-float v11, p0, v11

    if-lez v11, :cond_1b

    .line 238
    const/4 v10, 0x1

    .line 241
    :cond_1b
    const/4 v11, 0x0

    cmpg-float v11, p0, v11

    if-gez v11, :cond_22

    .line 242
    const/4 v7, 0x1

    .line 243
    neg-float p0, p0

    .line 246
    :cond_22
    sget-object v11, Lcom/github/mikephil/charting/utils/Utils;->POW_10:[I

    array-length v11, v11

    if-le p1, v11, :cond_2c

    .line 247
    sget-object v11, Lcom/github/mikephil/charting/utils/Utils;->POW_10:[I

    array-length v11, v11

    add-int/lit8 p1, v11, -0x1

    .line 250
    :cond_2c
    sget-object v11, Lcom/github/mikephil/charting/utils/Utils;->POW_10:[I

    aget v11, v11, p1

    int-to-float v11, v11

    mul-float/2addr p0, v11

    .line 251
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result v11

    int-to-long v5, v11

    .line 252
    .local v5, "lval":J
    array-length v11, v8

    add-int/lit8 v3, v11, -0x1

    .line 253
    .local v3, "ind":I
    const/4 v0, 0x0

    .line 254
    .local v0, "charCount":I
    const/4 v1, 0x0

    .local v1, "decimalPointAdded":Z
    move v4, v3

    .line 256
    .end local v3    # "ind":I
    .local v4, "ind":I
    :goto_3d
    const-wide/16 v11, 0x0

    cmp-long v11, v5, v11

    if-nez v11, :cond_47

    add-int/lit8 v11, p1, 0x1

    if-ge v0, v11, :cond_8f

    .line 257
    :cond_47
    const-wide/16 v11, 0xa

    rem-long v11, v5, v11

    long-to-int v2, v11

    .line 258
    .local v2, "digit":I
    const-wide/16 v11, 0xa

    div-long/2addr v5, v11

    .line 259
    add-int/lit8 v3, v4, -0x1

    .end local v4    # "ind":I
    .restart local v3    # "ind":I
    add-int/lit8 v11, v2, 0x30

    int-to-char v11, v11

    aput-char v11, v8, v4

    .line 260
    add-int/lit8 v0, v0, 0x1

    .line 263
    if-ne v0, p1, :cond_66

    .line 264
    add-int/lit8 v4, v3, -0x1

    .end local v3    # "ind":I
    .restart local v4    # "ind":I
    const/16 v11, 0x2c

    aput-char v11, v8, v3

    .line 265
    add-int/lit8 v0, v0, 0x1

    .line 266
    const/4 v1, 0x1

    move v3, v4

    .end local v4    # "ind":I
    .restart local v3    # "ind":I
    :cond_64
    :goto_64
    move v4, v3

    .line 286
    .end local v3    # "ind":I
    .restart local v4    # "ind":I
    goto :goto_3d

    .line 269
    .end local v4    # "ind":I
    .restart local v3    # "ind":I
    :cond_66
    if-eqz p2, :cond_64

    const-wide/16 v11, 0x0

    cmp-long v11, v5, v11

    if-eqz v11, :cond_64

    if-le v0, p1, :cond_64

    .line 271
    if-eqz v1, :cond_80

    .line 273
    sub-int v11, v0, p1

    rem-int/lit8 v11, v11, 0x4

    if-nez v11, :cond_64

    .line 274
    add-int/lit8 v4, v3, -0x1

    .end local v3    # "ind":I
    .restart local v4    # "ind":I
    aput-char p3, v8, v3

    .line 275
    add-int/lit8 v0, v0, 0x1

    move v3, v4

    .end local v4    # "ind":I
    .restart local v3    # "ind":I
    goto :goto_64

    .line 280
    :cond_80
    sub-int v11, v0, p1

    rem-int/lit8 v11, v11, 0x4

    const/4 v12, 0x3

    if-ne v11, v12, :cond_64

    .line 281
    add-int/lit8 v4, v3, -0x1

    .end local v3    # "ind":I
    .restart local v4    # "ind":I
    aput-char p3, v8, v3

    .line 282
    add-int/lit8 v0, v0, 0x1

    move v3, v4

    .end local v4    # "ind":I
    .restart local v3    # "ind":I
    goto :goto_64

    .line 289
    .end local v2    # "digit":I
    .end local v3    # "ind":I
    .restart local v4    # "ind":I
    :cond_8f
    if-eqz v10, :cond_9a

    .line 290
    add-int/lit8 v3, v4, -0x1

    .end local v4    # "ind":I
    .restart local v3    # "ind":I
    const/16 v11, 0x30

    aput-char v11, v8, v4

    .line 291
    add-int/lit8 v0, v0, 0x1

    move v4, v3

    .line 295
    .end local v3    # "ind":I
    .restart local v4    # "ind":I
    :cond_9a
    if-eqz v7, :cond_af

    .line 296
    add-int/lit8 v3, v4, -0x1

    .end local v4    # "ind":I
    .restart local v3    # "ind":I
    const/16 v11, 0x2d

    aput-char v11, v8, v4

    .line 297
    add-int/lit8 v0, v0, 0x1

    .line 300
    :goto_a4
    array-length v11, v8

    sub-int v9, v11, v0

    .line 303
    .local v9, "start":I
    array-length v11, v8

    sub-int/2addr v11, v9

    invoke-static {v8, v9, v11}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object v11

    goto/16 :goto_c

    .end local v3    # "ind":I
    .end local v9    # "start":I
    .restart local v4    # "ind":I
    :cond_af
    move v3, v4

    .end local v4    # "ind":I
    .restart local v3    # "ind":I
    goto :goto_a4
.end method

.method public static getClosestDataSetIndexByPixelY(Ljava/util/List;FLcom/github/mikephil/charting/components/YAxis$AxisDependency;)I
    .registers 5
    .param p1, "y"    # F
    .param p2, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/utils/SelectionDetail;",
            ">;F",
            "Lcom/github/mikephil/charting/components/YAxis$AxisDependency;",
            ")I"
        }
    .end annotation

    .prologue
    .line 412
    .local p0, "valsAtIndex":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/utils/SelectionDetail;>;"
    invoke-static {p0, p1, p2}, Lcom/github/mikephil/charting/utils/Utils;->getClosestSelectionDetailByPixelY(Ljava/util/List;FLcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/SelectionDetail;

    move-result-object v0

    .line 414
    .local v0, "sel":Lcom/github/mikephil/charting/utils/SelectionDetail;
    if-nez v0, :cond_a

    .line 415
    const v1, -0x7fffffff

    .line 417
    :goto_9
    return v1

    :cond_a
    iget v1, v0, Lcom/github/mikephil/charting/utils/SelectionDetail;->dataSetIndex:I

    goto :goto_9
.end method

.method public static getClosestDataSetIndexByValue(Ljava/util/List;FLcom/github/mikephil/charting/components/YAxis$AxisDependency;)I
    .registers 5
    .param p1, "value"    # F
    .param p2, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/utils/SelectionDetail;",
            ">;F",
            "Lcom/github/mikephil/charting/components/YAxis$AxisDependency;",
            ")I"
        }
    .end annotation

    .prologue
    .line 394
    .local p0, "valsAtIndex":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/utils/SelectionDetail;>;"
    invoke-static {p0, p1, p2}, Lcom/github/mikephil/charting/utils/Utils;->getClosestSelectionDetailByValue(Ljava/util/List;FLcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/SelectionDetail;

    move-result-object v0

    .line 396
    .local v0, "sel":Lcom/github/mikephil/charting/utils/SelectionDetail;
    if-nez v0, :cond_a

    .line 397
    const v1, -0x7fffffff

    .line 399
    :goto_9
    return v1

    :cond_a
    iget v1, v0, Lcom/github/mikephil/charting/utils/SelectionDetail;->dataSetIndex:I

    goto :goto_9
.end method

.method public static getClosestSelectionDetailByPixelY(Ljava/util/List;FLcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/SelectionDetail;
    .registers 9
    .param p1, "y"    # F
    .param p2, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/utils/SelectionDetail;",
            ">;F",
            "Lcom/github/mikephil/charting/components/YAxis$AxisDependency;",
            ")",
            "Lcom/github/mikephil/charting/utils/SelectionDetail;"
        }
    .end annotation

    .prologue
    .line 464
    .local p0, "valsAtIndex":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/utils/SelectionDetail;>;"
    const/4 v1, 0x0

    .line 465
    .local v1, "closest":Lcom/github/mikephil/charting/utils/SelectionDetail;
    const v2, 0x7f7fffff    # Float.MAX_VALUE

    .line 467
    .local v2, "distance":F
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_5
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v5

    if-ge v3, v5, :cond_2b

    .line 469
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/github/mikephil/charting/utils/SelectionDetail;

    .line 471
    .local v4, "sel":Lcom/github/mikephil/charting/utils/SelectionDetail;
    if-eqz p2, :cond_1b

    iget-object v5, v4, Lcom/github/mikephil/charting/utils/SelectionDetail;->dataSet:Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    invoke-interface {v5}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v5

    if-ne v5, p2, :cond_28

    .line 473
    :cond_1b
    iget v5, v4, Lcom/github/mikephil/charting/utils/SelectionDetail;->y:F

    sub-float/2addr v5, p1

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 474
    .local v0, "cdistance":F
    cmpg-float v5, v0, v2

    if-gez v5, :cond_28

    .line 475
    move-object v1, v4

    .line 476
    move v2, v0

    .line 467
    .end local v0    # "cdistance":F
    :cond_28
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 481
    .end local v4    # "sel":Lcom/github/mikephil/charting/utils/SelectionDetail;
    :cond_2b
    return-object v1
.end method

.method public static getClosestSelectionDetailByValue(Ljava/util/List;FLcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/SelectionDetail;
    .registers 9
    .param p1, "value"    # F
    .param p2, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/utils/SelectionDetail;",
            ">;F",
            "Lcom/github/mikephil/charting/components/YAxis$AxisDependency;",
            ")",
            "Lcom/github/mikephil/charting/utils/SelectionDetail;"
        }
    .end annotation

    .prologue
    .line 432
    .local p0, "valsAtIndex":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/utils/SelectionDetail;>;"
    const/4 v1, 0x0

    .line 433
    .local v1, "closest":Lcom/github/mikephil/charting/utils/SelectionDetail;
    const v2, 0x7f7fffff    # Float.MAX_VALUE

    .line 435
    .local v2, "distance":F
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_5
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v5

    if-ge v3, v5, :cond_2b

    .line 437
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/github/mikephil/charting/utils/SelectionDetail;

    .line 439
    .local v4, "sel":Lcom/github/mikephil/charting/utils/SelectionDetail;
    if-eqz p2, :cond_1b

    iget-object v5, v4, Lcom/github/mikephil/charting/utils/SelectionDetail;->dataSet:Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    invoke-interface {v5}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v5

    if-ne v5, p2, :cond_28

    .line 441
    :cond_1b
    iget v5, v4, Lcom/github/mikephil/charting/utils/SelectionDetail;->value:F

    sub-float/2addr v5, p1

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 442
    .local v0, "cdistance":F
    cmpg-float v5, v0, v2

    if-gez v5, :cond_28

    .line 443
    move-object v1, v4

    .line 444
    move v2, v0

    .line 435
    .end local v0    # "cdistance":F
    :cond_28
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 449
    .end local v4    # "sel":Lcom/github/mikephil/charting/utils/SelectionDetail;
    :cond_2b
    return-object v1
.end method

.method public static getDecimals(F)I
    .registers 4
    .param p0, "number"    # F

    .prologue
    .line 329
    float-to-double v1, p0

    invoke-static {v1, v2}, Lcom/github/mikephil/charting/utils/Utils;->roundToNextSignificant(D)F

    move-result v0

    .line 330
    .local v0, "i":F
    float-to-double v1, v0

    invoke-static {v1, v2}, Ljava/lang/Math;->log10(D)D

    move-result-wide v1

    neg-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    add-int/lit8 v1, v1, 0x2

    return v1
.end method

.method public static getLineHeight(Landroid/graphics/Paint;)F
    .registers 4
    .param p0, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 170
    invoke-virtual {p0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v0

    .line 171
    .local v0, "metrics":Landroid/graphics/Paint$FontMetrics;
    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->descent:F

    iget v2, v0, Landroid/graphics/Paint$FontMetrics;->ascent:F

    sub-float/2addr v1, v2

    return v1
.end method

.method public static getLineSpacing(Landroid/graphics/Paint;)F
    .registers 4
    .param p0, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 175
    invoke-virtual {p0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v0

    .line 176
    .local v0, "metrics":Landroid/graphics/Paint$FontMetrics;
    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->ascent:F

    iget v2, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    sub-float/2addr v1, v2

    iget v2, v0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    add-float/2addr v1, v2

    return v1
.end method

.method public static getMaximumFlingVelocity()I
    .registers 1

    .prologue
    .line 591
    sget v0, Lcom/github/mikephil/charting/utils/Utils;->mMaximumFlingVelocity:I

    return v0
.end method

.method public static getMinimumDistance(Ljava/util/List;FLcom/github/mikephil/charting/components/YAxis$AxisDependency;)F
    .registers 8
    .param p1, "y"    # F
    .param p2, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/utils/SelectionDetail;",
            ">;F",
            "Lcom/github/mikephil/charting/components/YAxis$AxisDependency;",
            ")F"
        }
    .end annotation

    .prologue
    .line 497
    .local p0, "valsAtIndex":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/utils/SelectionDetail;>;"
    const v1, 0x7f7fffff    # Float.MAX_VALUE

    .line 499
    .local v1, "distance":F
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_4
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_27

    .line 501
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/mikephil/charting/utils/SelectionDetail;

    .line 503
    .local v3, "sel":Lcom/github/mikephil/charting/utils/SelectionDetail;
    iget-object v4, v3, Lcom/github/mikephil/charting/utils/SelectionDetail;->dataSet:Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v4

    if-ne v4, p2, :cond_24

    .line 505
    iget v4, v3, Lcom/github/mikephil/charting/utils/SelectionDetail;->y:F

    sub-float/2addr v4, p1

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 506
    .local v0, "cdistance":F
    cmpg-float v4, v0, v1

    if-gez v4, :cond_24

    .line 507
    move v1, v0

    .line 499
    .end local v0    # "cdistance":F
    :cond_24
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 512
    .end local v3    # "sel":Lcom/github/mikephil/charting/utils/SelectionDetail;
    :cond_27
    return v1
.end method

.method public static getMinimumFlingVelocity()I
    .registers 1

    .prologue
    .line 587
    sget v0, Lcom/github/mikephil/charting/utils/Utils;->mMinimumFlingVelocity:I

    return v0
.end method

.method public static getNormalizedAngle(F)F
    .registers 3
    .param p0, "angle"    # F

    .prologue
    const/high16 v1, 0x43b40000    # 360.0f

    .line 598
    :goto_2
    const/4 v0, 0x0

    cmpg-float v0, p0, v0

    if-gez v0, :cond_9

    .line 599
    add-float/2addr p0, v1

    goto :goto_2

    .line 601
    :cond_9
    rem-float v0, p0, v1

    return v0
.end method

.method public static getPosition(Landroid/graphics/PointF;FF)Landroid/graphics/PointF;
    .registers 11
    .param p0, "center"    # Landroid/graphics/PointF;
    .param p1, "dist"    # F
    .param p2, "angle"    # F

    .prologue
    .line 541
    new-instance v0, Landroid/graphics/PointF;

    iget v1, p0, Landroid/graphics/PointF;->x:F

    float-to-double v1, v1

    float-to-double v3, p1

    float-to-double v5, p2

    invoke-static {v5, v6}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    mul-double/2addr v3, v5

    add-double/2addr v1, v3

    double-to-float v1, v1

    iget v2, p0, Landroid/graphics/PointF;->y:F

    float-to-double v2, v2

    float-to-double v4, p1

    float-to-double v6, p2

    invoke-static {v6, v7}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    mul-double/2addr v4, v6

    add-double/2addr v2, v4

    double-to-float v2, v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 543
    .local v0, "p":Landroid/graphics/PointF;
    return-object v0
.end method

.method public static getSDKInt()I
    .registers 1

    .prologue
    .line 792
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    return v0
.end method

.method public static getSizeOfRotatedRectangleByDegrees(FFF)Lcom/github/mikephil/charting/utils/FSize;
    .registers 5
    .param p0, "rectangleWidth"    # F
    .param p1, "rectangleHeight"    # F
    .param p2, "degrees"    # F

    .prologue
    .line 777
    const v1, 0x3c8efa35

    mul-float v0, p2, v1

    .line 778
    .local v0, "radians":F
    invoke-static {p0, p1, v0}, Lcom/github/mikephil/charting/utils/Utils;->getSizeOfRotatedRectangleByRadians(FFF)Lcom/github/mikephil/charting/utils/FSize;

    move-result-object v1

    return-object v1
.end method

.method public static getSizeOfRotatedRectangleByDegrees(Lcom/github/mikephil/charting/utils/FSize;F)Lcom/github/mikephil/charting/utils/FSize;
    .registers 5
    .param p0, "rectangleSize"    # Lcom/github/mikephil/charting/utils/FSize;
    .param p1, "degrees"    # F

    .prologue
    .line 765
    const v1, 0x3c8efa35

    mul-float v0, p1, v1

    .line 766
    .local v0, "radians":F
    iget v1, p0, Lcom/github/mikephil/charting/utils/FSize;->width:F

    iget v2, p0, Lcom/github/mikephil/charting/utils/FSize;->height:F

    invoke-static {v1, v2, v0}, Lcom/github/mikephil/charting/utils/Utils;->getSizeOfRotatedRectangleByRadians(FFF)Lcom/github/mikephil/charting/utils/FSize;

    move-result-object v1

    return-object v1
.end method

.method public static getSizeOfRotatedRectangleByRadians(FFF)Lcom/github/mikephil/charting/utils/FSize;
    .registers 8
    .param p0, "rectangleWidth"    # F
    .param p1, "rectangleHeight"    # F
    .param p2, "radians"    # F

    .prologue
    .line 783
    new-instance v0, Lcom/github/mikephil/charting/utils/FSize;

    float-to-double v1, p2

    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v1

    double-to-float v1, v1

    mul-float/2addr v1, p0

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    float-to-double v2, p2

    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    double-to-float v2, v2

    mul-float/2addr v2, p1

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    add-float/2addr v1, v2

    float-to-double v2, p2

    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    double-to-float v2, v2

    mul-float/2addr v2, p0

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    float-to-double v3, p2

    invoke-static {v3, v4}, Ljava/lang/Math;->cos(D)D

    move-result-wide v3

    double-to-float v3, v3

    mul-float/2addr v3, p1

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    add-float/2addr v2, v3

    invoke-direct {v0, v1, v2}, Lcom/github/mikephil/charting/utils/FSize;-><init>(FF)V

    return-object v0
.end method

.method public static getSizeOfRotatedRectangleByRadians(Lcom/github/mikephil/charting/utils/FSize;F)Lcom/github/mikephil/charting/utils/FSize;
    .registers 4
    .param p0, "rectangleSize"    # Lcom/github/mikephil/charting/utils/FSize;
    .param p1, "radians"    # F

    .prologue
    .line 771
    iget v0, p0, Lcom/github/mikephil/charting/utils/FSize;->width:F

    iget v1, p0, Lcom/github/mikephil/charting/utils/FSize;->height:F

    invoke-static {v0, v1, p1}, Lcom/github/mikephil/charting/utils/Utils;->getSizeOfRotatedRectangleByRadians(FFF)Lcom/github/mikephil/charting/utils/FSize;

    move-result-object v0

    return-object v0
.end method

.method public static granularity(FI)D
    .registers 13
    .param p0, "range"    # F
    .param p1, "labelCount"    # I

    .prologue
    const-wide/high16 v9, 0x4024000000000000L    # 10.0

    .line 806
    int-to-float v7, p1

    div-float v7, p0, v7

    float-to-double v5, v7

    .line 807
    .local v5, "rawInterval":D
    invoke-static {v5, v6}, Lcom/github/mikephil/charting/utils/Utils;->roundToNextSignificant(D)F

    move-result v7

    float-to-double v0, v7

    .line 810
    .local v0, "interval":D
    invoke-static {v0, v1}, Ljava/lang/Math;->log10(D)D

    move-result-wide v7

    double-to-int v7, v7

    int-to-double v7, v7

    invoke-static {v9, v10, v7, v8}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v7

    invoke-static {v7, v8}, Lcom/github/mikephil/charting/utils/Utils;->roundToNextSignificant(D)F

    move-result v7

    float-to-double v2, v7

    .line 812
    .local v2, "intervalMagnitude":D
    div-double v7, v0, v2

    double-to-int v4, v7

    .line 814
    .local v4, "intervalSigDigit":I
    const/4 v7, 0x5

    if-le v4, v7, :cond_26

    .line 815
    mul-double v7, v9, v2

    invoke-static {v7, v8}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    .line 818
    :cond_26
    const-wide v7, 0x3fb999999999999aL    # 0.1

    mul-double/2addr v7, v0

    return-wide v7
.end method

.method public static init(Landroid/content/Context;)V
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 52
    if-nez p0, :cond_16

    .line 54
    invoke-static {}, Landroid/view/ViewConfiguration;->getMinimumFlingVelocity()I

    move-result v2

    sput v2, Lcom/github/mikephil/charting/utils/Utils;->mMinimumFlingVelocity:I

    .line 56
    invoke-static {}, Landroid/view/ViewConfiguration;->getMaximumFlingVelocity()I

    move-result v2

    sput v2, Lcom/github/mikephil/charting/utils/Utils;->mMaximumFlingVelocity:I

    .line 58
    const-string v2, "MPChartLib-Utils"

    const-string v3, "Utils.init(...) PROVIDED CONTEXT OBJECT IS NULL"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    :goto_15
    return-void

    .line 62
    :cond_16
    invoke-static {p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    .line 63
    .local v1, "viewConfiguration":Landroid/view/ViewConfiguration;
    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v2

    sput v2, Lcom/github/mikephil/charting/utils/Utils;->mMinimumFlingVelocity:I

    .line 64
    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v2

    sput v2, Lcom/github/mikephil/charting/utils/Utils;->mMaximumFlingVelocity:I

    .line 66
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 67
    .local v0, "res":Landroid/content/res/Resources;
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    sput-object v2, Lcom/github/mikephil/charting/utils/Utils;->mMetrics:Landroid/util/DisplayMetrics;

    goto :goto_15
.end method

.method public static init(Landroid/content/res/Resources;)V
    .registers 2
    .param p0, "res"    # Landroid/content/res/Resources;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 80
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    sput-object v0, Lcom/github/mikephil/charting/utils/Utils;->mMetrics:Landroid/util/DisplayMetrics;

    .line 83
    invoke-static {}, Landroid/view/ViewConfiguration;->getMinimumFlingVelocity()I

    move-result v0

    sput v0, Lcom/github/mikephil/charting/utils/Utils;->mMinimumFlingVelocity:I

    .line 85
    invoke-static {}, Landroid/view/ViewConfiguration;->getMaximumFlingVelocity()I

    move-result v0

    sput v0, Lcom/github/mikephil/charting/utils/Utils;->mMaximumFlingVelocity:I

    .line 86
    return-void
.end method

.method public static needsDefaultFormatter(Lcom/github/mikephil/charting/formatter/ValueFormatter;)Z
    .registers 3
    .param p0, "formatter"    # Lcom/github/mikephil/charting/formatter/ValueFormatter;

    .prologue
    const/4 v0, 0x1

    .line 522
    if-nez p0, :cond_4

    .line 527
    :cond_3
    :goto_3
    return v0

    .line 524
    :cond_4
    instance-of v1, p0, Lcom/github/mikephil/charting/formatter/DefaultValueFormatter;

    if-nez v1, :cond_3

    .line 527
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public static nextUp(D)D
    .registers 8
    .param p0, "d"    # D

    .prologue
    const-wide/16 v4, 0x0

    .line 375
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v0, p0, v0

    if-nez v0, :cond_9

    .line 379
    .end local p0    # "d":D
    :goto_8
    return-wide p0

    .line 378
    .restart local p0    # "d":D
    :cond_9
    add-double/2addr p0, v4

    .line 379
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide v2

    cmpl-double v0, p0, v4

    if-ltz v0, :cond_1a

    const-wide/16 v0, 0x1

    :goto_14
    add-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide p0

    goto :goto_8

    :cond_1a
    const-wide/16 v0, -0x1

    goto :goto_14
.end method

.method public static postInvalidateOnAnimation(Landroid/view/View;)V
    .registers 3
    .param p0, "view"    # Landroid/view/View;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 580
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_a

    .line 581
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 584
    :goto_9
    return-void

    .line 583
    :cond_a
    const-wide/16 v0, 0xa

    invoke-virtual {p0, v0, v1}, Landroid/view/View;->postInvalidateDelayed(J)V

    goto :goto_9
.end method

.method public static roundToNextSignificant(D)F
    .registers 11
    .param p0, "number"    # D

    .prologue
    .line 313
    const-wide/16 v5, 0x0

    cmpg-double v5, p0, v5

    if-gez v5, :cond_26

    neg-double v5, p0

    :goto_7
    invoke-static {v5, v6}, Ljava/lang/Math;->log10(D)D

    move-result-wide v5

    double-to-float v5, v5

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-float v0, v5

    .line 314
    .local v0, "d":F
    float-to-int v5, v0

    rsub-int/lit8 v2, v5, 0x1

    .line 315
    .local v2, "pw":I
    const-wide/high16 v5, 0x4024000000000000L    # 10.0

    int-to-double v7, v2

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v5

    double-to-float v1, v5

    .line 316
    .local v1, "magnitude":F
    float-to-double v5, v1

    mul-double/2addr v5, p0

    invoke-static {v5, v6}, Ljava/lang/Math;->round(D)J

    move-result-wide v3

    .line 317
    .local v3, "shifted":J
    long-to-float v5, v3

    div-float/2addr v5, v1

    return v5

    .end local v0    # "d":F
    .end local v1    # "magnitude":F
    .end local v2    # "pw":I
    .end local v3    # "shifted":J
    :cond_26
    move-wide v5, p0

    .line 313
    goto :goto_7
.end method

.method public static velocityTrackerPointerUpCleanUpIfNecessary(Landroid/view/MotionEvent;Landroid/view/VelocityTracker;)V
    .registers 14
    .param p0, "ev"    # Landroid/view/MotionEvent;
    .param p1, "tracker"    # Landroid/view/VelocityTracker;

    .prologue
    .line 551
    const/16 v10, 0x3e8

    sget v11, Lcom/github/mikephil/charting/utils/Utils;->mMaximumFlingVelocity:I

    int-to-float v11, v11

    invoke-virtual {p1, v10, v11}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 552
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v5

    .line 553
    .local v5, "upIndex":I
    invoke-virtual {p0, v5}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    .line 554
    .local v3, "id1":I
    invoke-virtual {p1, v3}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v7

    .line 555
    .local v7, "x1":F
    invoke-virtual {p1, v3}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v9

    .line 556
    .local v9, "y1":F
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .local v0, "count":I
    :goto_1d
    if-ge v2, v0, :cond_3e

    .line 557
    if-ne v2, v5, :cond_24

    .line 556
    :cond_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_1d

    .line 560
    :cond_24
    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v4

    .line 561
    .local v4, "id2":I
    invoke-virtual {p1, v4}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v10

    mul-float v6, v7, v10

    .line 562
    .local v6, "x":F
    invoke-virtual {p1, v4}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v10

    mul-float v8, v9, v10

    .line 564
    .local v8, "y":F
    add-float v1, v6, v8

    .line 565
    .local v1, "dot":F
    const/4 v10, 0x0

    cmpg-float v10, v1, v10

    if-gez v10, :cond_21

    .line 566
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->clear()V

    .line 570
    .end local v1    # "dot":F
    .end local v4    # "id2":I
    .end local v6    # "x":F
    .end local v8    # "y":F
    :cond_3e
    return-void
.end method
