.class public Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;
.super Landroid/text/style/ReplacementSpan;
.source "CustomTypefaceSpan.java"


# static fields
.field private static final BASELINE_RATIO:F = 0.14285715f

.field private static final LOCAL_PAINT:Landroid/graphics/Paint;

.field private static final ROTATION_DURATION:I = 0x7d0

.field private static final TEXT_BOUNDS:Landroid/graphics/Rect;


# instance fields
.field private final baselineAligned:Z

.field private final icon:Ljava/lang/String;

.field private final iconColor:I

.field private final iconSizePx:F

.field private final iconSizeRatio:F

.field private final rotate:Z

.field private final rotationStartTime:J

.field private final type:Landroid/graphics/Typeface;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 12
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->TEXT_BOUNDS:Landroid/graphics/Rect;

    .line 13
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    sput-object v0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->LOCAL_PAINT:Landroid/graphics/Paint;

    return-void
.end method

.method public constructor <init>(Lcom/joanzapata/iconify/Icon;Landroid/graphics/Typeface;FFIZZ)V
    .registers 10
    .param p1, "icon"    # Lcom/joanzapata/iconify/Icon;
    .param p2, "type"    # Landroid/graphics/Typeface;
    .param p3, "iconSizePx"    # F
    .param p4, "iconSizeRatio"    # F
    .param p5, "iconColor"    # I
    .param p6, "rotate"    # Z
    .param p7, "baselineAligned"    # Z

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/text/style/ReplacementSpan;-><init>()V

    .line 28
    iput-boolean p6, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->rotate:Z

    .line 29
    iput-boolean p7, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->baselineAligned:Z

    .line 30
    invoke-interface {p1}, Lcom/joanzapata/iconify/Icon;->character()C

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->icon:Ljava/lang/String;

    .line 31
    iput-object p2, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->type:Landroid/graphics/Typeface;

    .line 32
    iput p3, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->iconSizePx:F

    .line 33
    iput p4, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->iconSizeRatio:F

    .line 34
    iput p5, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->iconColor:I

    .line 35
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->rotationStartTime:J

    .line 36
    return-void
.end method

.method private applyCustomTypeFace(Landroid/graphics/Paint;Landroid/graphics/Typeface;)V
    .registers 5
    .param p1, "paint"    # Landroid/graphics/Paint;
    .param p2, "tf"    # Landroid/graphics/Typeface;

    .prologue
    const/4 v1, 0x0

    .line 80
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 81
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setTextSkewX(F)V

    .line 82
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 83
    iget-boolean v0, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->rotate:Z

    if-eqz v0, :cond_12

    invoke-virtual {p1}, Landroid/graphics/Paint;->clearShadowLayer()V

    .line 84
    :cond_12
    iget v0, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->iconSizeRatio:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_2f

    invoke-virtual {p1}, Landroid/graphics/Paint;->getTextSize()F

    move-result v0

    iget v1, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->iconSizeRatio:F

    mul-float/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 86
    :cond_22
    :goto_22
    iget v0, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->iconColor:I

    const v1, 0x7fffffff

    if-ge v0, v1, :cond_2e

    iget v0, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->iconColor:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 87
    :cond_2e
    return-void

    .line 85
    :cond_2f
    iget v0, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->iconSizePx:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_22

    iget v0, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->iconSizePx:F

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    goto :goto_22
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .registers 19
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "text"    # Ljava/lang/CharSequence;
    .param p3, "start"    # I
    .param p4, "end"    # I
    .param p5, "x"    # F
    .param p6, "top"    # I
    .param p7, "y"    # I
    .param p8, "bottom"    # I
    .param p9, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 58
    iget-object v5, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->type:Landroid/graphics/Typeface;

    move-object/from16 v0, p9

    invoke-direct {p0, v0, v5}, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->applyCustomTypeFace(Landroid/graphics/Paint;Landroid/graphics/Typeface;)V

    .line 59
    iget-object v5, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->icon:Ljava/lang/String;

    const/4 v6, 0x0

    const/4 v7, 0x1

    sget-object v8, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->TEXT_BOUNDS:Landroid/graphics/Rect;

    move-object/from16 v0, p9

    invoke-virtual {v0, v5, v6, v7, v8}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 60
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 61
    iget-boolean v5, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->baselineAligned:Z

    if-eqz v5, :cond_76

    const/4 v1, 0x0

    .line 62
    .local v1, "baselineRatio":F
    :goto_1a
    iget-boolean v5, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->rotate:Z

    if-eqz v5, :cond_54

    .line 63
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iget-wide v7, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->rotationStartTime:J

    sub-long/2addr v5, v7

    long-to-float v5, v5

    const/high16 v6, 0x44fa0000    # 2000.0f

    div-float/2addr v5, v6

    const/high16 v6, 0x43b40000    # 360.0f

    mul-float v4, v5, v6

    .line 64
    .local v4, "rotation":F
    sget-object v5, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->TEXT_BOUNDS:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v5

    int-to-float v5, v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v5, v6

    add-float v2, p5, v5

    .line 65
    .local v2, "centerX":F
    move/from16 v0, p7

    int-to-float v5, v0

    sget-object v6, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->TEXT_BOUNDS:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v6

    int-to-float v6, v6

    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v6, v7

    sub-float/2addr v5, v6

    sget-object v6, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->TEXT_BOUNDS:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v1

    add-float v3, v5, v6

    .line 66
    .local v3, "centerY":F
    invoke-virtual {p1, v4, v2, v3}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 69
    .end local v2    # "centerX":F
    .end local v3    # "centerY":F
    .end local v4    # "rotation":F
    :cond_54
    iget-object v5, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->icon:Ljava/lang/String;

    sget-object v6, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->TEXT_BOUNDS:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->left:I

    int-to-float v6, v6

    sub-float v6, p5, v6

    sget-object v7, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->TEXT_BOUNDS:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->bottom:I

    sub-int v7, p7, v7

    int-to-float v7, v7

    sget-object v8, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->TEXT_BOUNDS:Landroid/graphics/Rect;

    .line 71
    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v8

    int-to-float v8, v8

    mul-float/2addr v8, v1

    add-float/2addr v7, v8

    .line 69
    move-object/from16 v0, p9

    invoke-virtual {p1, v5, v6, v7, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 72
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 73
    return-void

    .line 61
    .end local v1    # "baselineRatio":F
    :cond_76
    const v1, 0x3e124925

    goto :goto_1a
.end method

.method public getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I
    .registers 12
    .param p1, "paint"    # Landroid/graphics/Paint;
    .param p2, "text"    # Ljava/lang/CharSequence;
    .param p3, "start"    # I
    .param p4, "end"    # I
    .param p5, "fm"    # Landroid/graphics/Paint$FontMetricsInt;

    .prologue
    .line 41
    sget-object v1, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->LOCAL_PAINT:Landroid/graphics/Paint;

    invoke-virtual {v1, p1}, Landroid/graphics/Paint;->set(Landroid/graphics/Paint;)V

    .line 42
    sget-object v1, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->LOCAL_PAINT:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->type:Landroid/graphics/Typeface;

    invoke-direct {p0, v1, v2}, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->applyCustomTypeFace(Landroid/graphics/Paint;Landroid/graphics/Typeface;)V

    .line 43
    sget-object v1, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->LOCAL_PAINT:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->icon:Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x1

    sget-object v5, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->TEXT_BOUNDS:Landroid/graphics/Rect;

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 44
    if-eqz p5, :cond_3d

    .line 45
    iget-boolean v1, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->baselineAligned:Z

    if-eqz v1, :cond_44

    const/4 v0, 0x0

    .line 46
    .local v0, "baselineRatio":F
    :goto_1e
    sget-object v1, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->TEXT_BOUNDS:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v0

    float-to-int v1, v1

    iput v1, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 47
    sget-object v1, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->TEXT_BOUNDS:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    iget v2, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    sub-int/2addr v1, v2

    neg-int v1, v1

    iput v1, p5, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 48
    iget v1, p5, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    iput v1, p5, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 49
    iget v1, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iput v1, p5, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 51
    .end local v0    # "baselineRatio":F
    :cond_3d
    sget-object v1, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->TEXT_BOUNDS:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    return v1

    .line 45
    :cond_44
    const v0, 0x3e124925

    goto :goto_1e
.end method

.method public isAnimated()Z
    .registers 2

    .prologue
    .line 76
    iget-boolean v0, p0, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->rotate:Z

    return v0
.end method
