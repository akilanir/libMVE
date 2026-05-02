.class public final Landroid/support/v7/graphics/Palette;
.super Ljava/lang/Object;
.source "Palette.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/graphics/Palette$Swatch;,
        Landroid/support/v7/graphics/Palette$PaletteAsyncListener;
    }
.end annotation


# static fields
.field private static final CALCULATE_BITMAP_MIN_DIMENSION:I = 0x64

.field private static final DEFAULT_CALCULATE_NUMBER_COLORS:I = 0x10

.field private static final MAX_DARK_LUMA:F = 0.45f

.field private static final MAX_MUTED_SATURATION:F = 0.4f

.field private static final MAX_NORMAL_LUMA:F = 0.7f

.field private static final MIN_CONTRAST_BODY_TEXT:F = 4.5f

.field private static final MIN_CONTRAST_TITLE_TEXT:F = 3.0f

.field private static final MIN_LIGHT_LUMA:F = 0.55f

.field private static final MIN_NORMAL_LUMA:F = 0.3f

.field private static final MIN_VIBRANT_SATURATION:F = 0.35f

.field private static final TARGET_DARK_LUMA:F = 0.26f

.field private static final TARGET_LIGHT_LUMA:F = 0.74f

.field private static final TARGET_MUTED_SATURATION:F = 0.3f

.field private static final TARGET_NORMAL_LUMA:F = 0.5f

.field private static final TARGET_VIBRANT_SATURATION:F = 1.0f

.field private static final WEIGHT_LUMA:F = 6.0f

.field private static final WEIGHT_POPULATION:F = 1.0f

.field private static final WEIGHT_SATURATION:F = 3.0f


# instance fields
.field private mDarkMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

.field private mDarkVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

.field private final mHighestPopulation:I

.field private mLightMutedColor:Landroid/support/v7/graphics/Palette$Swatch;

.field private mLightVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

.field private mMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

.field private final mSwatches:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/graphics/Palette$Swatch;",
            ">;"
        }
    .end annotation
.end field

.field private mVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;


# direct methods
.method private constructor <init>(Ljava/util/List;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/graphics/Palette$Swatch;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 189
    .local p1, "swatches":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/graphics/Palette$Swatch;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 190
    iput-object p1, p0, Landroid/support/v7/graphics/Palette;->mSwatches:Ljava/util/List;

    .line 191
    invoke-direct {p0}, Landroid/support/v7/graphics/Palette;->findMaxPopulation()I

    move-result v0

    iput v0, p0, Landroid/support/v7/graphics/Palette;->mHighestPopulation:I

    .line 193
    const/high16 v1, 0x3f000000    # 0.5f

    const v2, 0x3e99999a    # 0.3f

    const v3, 0x3f333333    # 0.7f

    const/high16 v4, 0x3f800000    # 1.0f

    const v5, 0x3eb33333    # 0.35f

    const/high16 v6, 0x3f800000    # 1.0f

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Landroid/support/v7/graphics/Palette;->findColor(FFFFFF)Landroid/support/v7/graphics/Palette$Swatch;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/graphics/Palette;->mVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    .line 196
    const v1, 0x3f3d70a4    # 0.74f

    const v2, 0x3f0ccccd    # 0.55f

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    const v5, 0x3eb33333    # 0.35f

    const/high16 v6, 0x3f800000    # 1.0f

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Landroid/support/v7/graphics/Palette;->findColor(FFFFFF)Landroid/support/v7/graphics/Palette$Swatch;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/graphics/Palette;->mLightVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    .line 199
    const v1, 0x3e851eb8    # 0.26f

    const/4 v2, 0x0

    const v3, 0x3ee66666    # 0.45f

    const/high16 v4, 0x3f800000    # 1.0f

    const v5, 0x3eb33333    # 0.35f

    const/high16 v6, 0x3f800000    # 1.0f

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Landroid/support/v7/graphics/Palette;->findColor(FFFFFF)Landroid/support/v7/graphics/Palette$Swatch;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/graphics/Palette;->mDarkVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    .line 202
    const/high16 v1, 0x3f000000    # 0.5f

    const v2, 0x3e99999a    # 0.3f

    const v3, 0x3f333333    # 0.7f

    const v4, 0x3e99999a    # 0.3f

    const/4 v5, 0x0

    const v6, 0x3ecccccd    # 0.4f

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Landroid/support/v7/graphics/Palette;->findColor(FFFFFF)Landroid/support/v7/graphics/Palette$Swatch;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/graphics/Palette;->mMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    .line 205
    const v1, 0x3f3d70a4    # 0.74f

    const v2, 0x3f0ccccd    # 0.55f

    const/high16 v3, 0x3f800000    # 1.0f

    const v4, 0x3e99999a    # 0.3f

    const/4 v5, 0x0

    const v6, 0x3ecccccd    # 0.4f

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Landroid/support/v7/graphics/Palette;->findColor(FFFFFF)Landroid/support/v7/graphics/Palette$Swatch;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/graphics/Palette;->mLightMutedColor:Landroid/support/v7/graphics/Palette$Swatch;

    .line 208
    const v1, 0x3e851eb8    # 0.26f

    const/4 v2, 0x0

    const v3, 0x3ee66666    # 0.45f

    const v4, 0x3e99999a    # 0.3f

    const/4 v5, 0x0

    const v6, 0x3ecccccd    # 0.4f

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Landroid/support/v7/graphics/Palette;->findColor(FFFFFF)Landroid/support/v7/graphics/Palette$Swatch;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/graphics/Palette;->mDarkMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    .line 212
    invoke-direct {p0}, Landroid/support/v7/graphics/Palette;->generateEmptySwatches()V

    .line 213
    return-void
.end method

.method private static checkAsyncListenerParam(Landroid/support/v7/graphics/Palette$PaletteAsyncListener;)V
    .registers 3
    .param p0, "listener"    # Landroid/support/v7/graphics/Palette$PaletteAsyncListener;

    .prologue
    .line 523
    if-nez p0, :cond_a

    .line 524
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "listener can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 526
    :cond_a
    return-void
.end method

.method private static checkBitmapParam(Landroid/graphics/Bitmap;)V
    .registers 3
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 508
    if-nez p0, :cond_a

    .line 509
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bitmap can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 511
    :cond_a
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 512
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bitmap can not be recycled"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 514
    :cond_18
    return-void
.end method

.method private static checkNumberColorsParam(I)V
    .registers 3
    .param p0, "numColors"    # I

    .prologue
    .line 517
    const/4 v0, 0x1

    if-ge p0, v0, :cond_b

    .line 518
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "numColors must be 1 of greater"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 520
    :cond_b
    return-void
.end method

.method private static copyHslValues(Landroid/support/v7/graphics/Palette$Swatch;)[F
    .registers 5
    .param p0, "color"    # Landroid/support/v7/graphics/Palette$Swatch;

    .prologue
    const/4 v3, 0x3

    const/4 v2, 0x0

    .line 475
    new-array v0, v3, [F

    .line 476
    .local v0, "newHsl":[F
    invoke-virtual {p0}, Landroid/support/v7/graphics/Palette$Swatch;->getHsl()[F

    move-result-object v1

    invoke-static {v1, v2, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 477
    return-object v0
.end method

.method private static createComparisonValue(FFFFII)F
    .registers 10
    .param p0, "saturation"    # F
    .param p1, "targetSaturation"    # F
    .param p2, "luma"    # F
    .param p3, "targetLuma"    # F
    .param p4, "population"    # I
    .param p5, "highestPopulation"    # I

    .prologue
    .line 464
    const/4 v0, 0x6

    new-array v0, v0, [F

    const/4 v1, 0x0

    invoke-static {p0, p1}, Landroid/support/v7/graphics/Palette;->invertDiff(FF)F

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x1

    const/high16 v2, 0x40400000    # 3.0f

    aput v2, v0, v1

    const/4 v1, 0x2

    invoke-static {p2, p3}, Landroid/support/v7/graphics/Palette;->invertDiff(FF)F

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x3

    const/high16 v2, 0x40c00000    # 6.0f

    aput v2, v0, v1

    const/4 v1, 0x4

    int-to-float v2, p4

    int-to-float v3, p5

    div-float/2addr v2, v3

    aput v2, v0, v1

    const/4 v1, 0x5

    const/high16 v2, 0x3f800000    # 1.0f

    aput v2, v0, v1

    invoke-static {v0}, Landroid/support/v7/graphics/Palette;->weightedMean([F)F

    move-result v0

    return v0
.end method

.method private findColor(FFFFFF)Landroid/support/v7/graphics/Palette$Swatch;
    .registers 18
    .param p1, "targetLuma"    # F
    .param p2, "minLuma"    # F
    .param p3, "maxLuma"    # F
    .param p4, "targetSaturation"    # F
    .param p5, "minSaturation"    # F
    .param p6, "maxSaturation"    # F

    .prologue
    .line 329
    const/4 v7, 0x0

    .line 330
    .local v7, "max":Landroid/support/v7/graphics/Palette$Swatch;
    const/4 v8, 0x0

    .line 332
    .local v8, "maxValue":F
    iget-object v1, p0, Landroid/support/v7/graphics/Palette;->mSwatches:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_8
    :goto_8
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4d

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/support/v7/graphics/Palette$Swatch;

    .line 333
    .local v9, "swatch":Landroid/support/v7/graphics/Palette$Swatch;
    invoke-virtual {v9}, Landroid/support/v7/graphics/Palette$Swatch;->getHsl()[F

    move-result-object v1

    const/4 v3, 0x1

    aget v0, v1, v3

    .line 334
    .local v0, "sat":F
    invoke-virtual {v9}, Landroid/support/v7/graphics/Palette$Swatch;->getHsl()[F

    move-result-object v1

    const/4 v3, 0x2

    aget v2, v1, v3

    .line 336
    .local v2, "luma":F
    cmpl-float v1, v0, p5

    if-ltz v1, :cond_8

    cmpg-float v1, v0, p6

    if-gtz v1, :cond_8

    cmpl-float v1, v2, p2

    if-ltz v1, :cond_8

    cmpg-float v1, v2, p3

    if-gtz v1, :cond_8

    invoke-direct {p0, v9}, Landroid/support/v7/graphics/Palette;->isAlreadySelected(Landroid/support/v7/graphics/Palette$Swatch;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 339
    invoke-virtual {v9}, Landroid/support/v7/graphics/Palette$Swatch;->getPopulation()I

    move-result v4

    iget v5, p0, Landroid/support/v7/graphics/Palette;->mHighestPopulation:I

    move v1, p4

    move v3, p1

    invoke-static/range {v0 .. v5}, Landroid/support/v7/graphics/Palette;->createComparisonValue(FFFFII)F

    move-result v10

    .line 341
    .local v10, "thisValue":F
    if-eqz v7, :cond_4a

    cmpl-float v1, v10, v8

    if-lez v1, :cond_8

    .line 342
    :cond_4a
    move-object v7, v9

    .line 343
    move v8, v10

    goto :goto_8

    .line 348
    .end local v0    # "sat":F
    .end local v2    # "luma":F
    .end local v9    # "swatch":Landroid/support/v7/graphics/Palette$Swatch;
    .end local v10    # "thisValue":F
    :cond_4d
    return-object v7
.end method

.method private findMaxPopulation()I
    .registers 5

    .prologue
    .line 380
    const/4 v1, 0x0

    .line 381
    .local v1, "population":I
    iget-object v3, p0, Landroid/support/v7/graphics/Palette;->mSwatches:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/graphics/Palette$Swatch;

    .line 382
    .local v2, "swatch":Landroid/support/v7/graphics/Palette$Swatch;
    invoke-virtual {v2}, Landroid/support/v7/graphics/Palette$Swatch;->getPopulation()I

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 383
    goto :goto_7

    .line 384
    .end local v2    # "swatch":Landroid/support/v7/graphics/Palette$Swatch;
    :cond_1c
    return v1
.end method

.method public static generate(Landroid/graphics/Bitmap;)Landroid/support/v7/graphics/Palette;
    .registers 2
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 115
    const/16 v0, 0x10

    invoke-static {p0, v0}, Landroid/support/v7/graphics/Palette;->generate(Landroid/graphics/Bitmap;I)Landroid/support/v7/graphics/Palette;

    move-result-object v0

    return-object v0
.end method

.method public static generate(Landroid/graphics/Bitmap;I)Landroid/support/v7/graphics/Palette;
    .registers 6
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "numColors"    # I

    .prologue
    .line 128
    invoke-static {p0}, Landroid/support/v7/graphics/Palette;->checkBitmapParam(Landroid/graphics/Bitmap;)V

    .line 129
    invoke-static {p1}, Landroid/support/v7/graphics/Palette;->checkNumberColorsParam(I)V

    .line 132
    invoke-static {p0}, Landroid/support/v7/graphics/Palette;->scaleBitmapDown(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 135
    .local v1, "scaledBitmap":Landroid/graphics/Bitmap;
    invoke-static {v1, p1}, Landroid/support/v7/graphics/ColorCutQuantizer;->fromBitmap(Landroid/graphics/Bitmap;I)Landroid/support/v7/graphics/ColorCutQuantizer;

    move-result-object v0

    .line 138
    .local v0, "quantizer":Landroid/support/v7/graphics/ColorCutQuantizer;
    if-eq v1, p0, :cond_13

    .line 139
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 143
    :cond_13
    new-instance v2, Landroid/support/v7/graphics/Palette;

    invoke-virtual {v0}, Landroid/support/v7/graphics/ColorCutQuantizer;->getQuantizedColors()Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/support/v7/graphics/Palette;-><init>(Ljava/util/List;)V

    return-object v2
.end method

.method public static generateAsync(Landroid/graphics/Bitmap;ILandroid/support/v7/graphics/Palette$PaletteAsyncListener;)Landroid/os/AsyncTask;
    .registers 6
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "numColors"    # I
    .param p2, "listener"    # Landroid/support/v7/graphics/Palette$PaletteAsyncListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "I",
            "Landroid/support/v7/graphics/Palette$PaletteAsyncListener;",
            ")",
            "Landroid/os/AsyncTask",
            "<",
            "Landroid/graphics/Bitmap;",
            "Ljava/lang/Void;",
            "Landroid/support/v7/graphics/Palette;",
            ">;"
        }
    .end annotation

    .prologue
    .line 171
    invoke-static {p0}, Landroid/support/v7/graphics/Palette;->checkBitmapParam(Landroid/graphics/Bitmap;)V

    .line 172
    invoke-static {p1}, Landroid/support/v7/graphics/Palette;->checkNumberColorsParam(I)V

    .line 173
    invoke-static {p2}, Landroid/support/v7/graphics/Palette;->checkAsyncListenerParam(Landroid/support/v7/graphics/Palette$PaletteAsyncListener;)V

    .line 175
    new-instance v0, Landroid/support/v7/graphics/Palette$1;

    invoke-direct {v0, p1, p2}, Landroid/support/v7/graphics/Palette$1;-><init>(ILandroid/support/v7/graphics/Palette$PaletteAsyncListener;)V

    const/4 v1, 0x1

    new-array v1, v1, [Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    invoke-static {v0, v1}, Landroid/support/v4/os/AsyncTaskCompat;->executeParallel(Landroid/os/AsyncTask;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v0

    return-object v0
.end method

.method public static generateAsync(Landroid/graphics/Bitmap;Landroid/support/v7/graphics/Palette$PaletteAsyncListener;)Landroid/os/AsyncTask;
    .registers 3
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "listener"    # Landroid/support/v7/graphics/Palette$PaletteAsyncListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Landroid/support/v7/graphics/Palette$PaletteAsyncListener;",
            ")",
            "Landroid/os/AsyncTask",
            "<",
            "Landroid/graphics/Bitmap;",
            "Ljava/lang/Void;",
            "Landroid/support/v7/graphics/Palette;",
            ">;"
        }
    .end annotation

    .prologue
    .line 157
    const/16 v0, 0x10

    invoke-static {p0, v0, p1}, Landroid/support/v7/graphics/Palette;->generateAsync(Landroid/graphics/Bitmap;ILandroid/support/v7/graphics/Palette$PaletteAsyncListener;)Landroid/os/AsyncTask;

    move-result-object v0

    return-object v0
.end method

.method private generateEmptySwatches()V
    .registers 6

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x0

    .line 355
    iget-object v1, p0, Landroid/support/v7/graphics/Palette;->mVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-nez v1, :cond_1f

    .line 357
    iget-object v1, p0, Landroid/support/v7/graphics/Palette;->mDarkVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v1, :cond_1f

    .line 359
    iget-object v1, p0, Landroid/support/v7/graphics/Palette;->mDarkVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    invoke-static {v1}, Landroid/support/v7/graphics/Palette;->copyHslValues(Landroid/support/v7/graphics/Palette$Swatch;)[F

    move-result-object v0

    .line 360
    .local v0, "newHsl":[F
    const/high16 v1, 0x3f000000    # 0.5f

    aput v1, v0, v4

    .line 361
    new-instance v1, Landroid/support/v7/graphics/Palette$Swatch;

    invoke-static {v0}, Landroid/support/v7/graphics/ColorUtils;->HSLtoRGB([F)I

    move-result v2

    invoke-direct {v1, v2, v3}, Landroid/support/v7/graphics/Palette$Swatch;-><init>(II)V

    iput-object v1, p0, Landroid/support/v7/graphics/Palette;->mVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    .line 365
    .end local v0    # "newHsl":[F
    :cond_1f
    iget-object v1, p0, Landroid/support/v7/graphics/Palette;->mDarkVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-nez v1, :cond_3d

    .line 367
    iget-object v1, p0, Landroid/support/v7/graphics/Palette;->mVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v1, :cond_3d

    .line 369
    iget-object v1, p0, Landroid/support/v7/graphics/Palette;->mVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    invoke-static {v1}, Landroid/support/v7/graphics/Palette;->copyHslValues(Landroid/support/v7/graphics/Palette$Swatch;)[F

    move-result-object v0

    .line 370
    .restart local v0    # "newHsl":[F
    const v1, 0x3e851eb8    # 0.26f

    aput v1, v0, v4

    .line 371
    new-instance v1, Landroid/support/v7/graphics/Palette$Swatch;

    invoke-static {v0}, Landroid/support/v7/graphics/ColorUtils;->HSLtoRGB([F)I

    move-result v2

    invoke-direct {v1, v2, v3}, Landroid/support/v7/graphics/Palette$Swatch;-><init>(II)V

    iput-object v1, p0, Landroid/support/v7/graphics/Palette;->mDarkVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    .line 374
    .end local v0    # "newHsl":[F
    :cond_3d
    return-void
.end method

.method private static invertDiff(FF)F
    .registers 4
    .param p0, "value"    # F
    .param p1, "targetValue"    # F

    .prologue
    .line 489
    const/high16 v0, 0x3f800000    # 1.0f

    sub-float v1, p0, p1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    sub-float/2addr v0, v1

    return v0
.end method

.method private isAlreadySelected(Landroid/support/v7/graphics/Palette$Swatch;)Z
    .registers 3
    .param p1, "swatch"    # Landroid/support/v7/graphics/Palette$Swatch;

    .prologue
    .line 322
    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eq v0, p1, :cond_18

    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mDarkVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eq v0, p1, :cond_18

    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mLightVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eq v0, p1, :cond_18

    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eq v0, p1, :cond_18

    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mDarkMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eq v0, p1, :cond_18

    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mLightMutedColor:Landroid/support/v7/graphics/Palette$Swatch;

    if-ne v0, p1, :cond_1a

    :cond_18
    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method private static scaleBitmapDown(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 6
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 447
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 449
    .local v0, "minDimension":I
    const/16 v2, 0x64

    if-gt v0, v2, :cond_11

    .line 455
    .end local p0    # "bitmap":Landroid/graphics/Bitmap;
    :goto_10
    return-object p0

    .line 454
    .restart local p0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_11
    const/high16 v2, 0x42c80000    # 100.0f

    int-to-float v3, v0

    div-float v1, v2, v3

    .line 455
    .local v1, "scaleRatio":F
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v1

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v1

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    const/4 v4, 0x0

    invoke-static {p0, v2, v3, v4}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_10
.end method

.method private static varargs weightedMean([F)F
    .registers 7
    .param p0, "values"    # [F

    .prologue
    .line 493
    const/4 v1, 0x0

    .line 494
    .local v1, "sum":F
    const/4 v2, 0x0

    .line 496
    .local v2, "sumWeight":F
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    array-length v5, p0

    if-ge v0, v5, :cond_13

    .line 497
    aget v3, p0, v0

    .line 498
    .local v3, "value":F
    add-int/lit8 v5, v0, 0x1

    aget v4, p0, v5

    .line 500
    .local v4, "weight":F
    mul-float v5, v3, v4

    add-float/2addr v1, v5

    .line 501
    add-float/2addr v2, v4

    .line 496
    add-int/lit8 v0, v0, 0x2

    goto :goto_3

    .line 504
    .end local v3    # "value":F
    .end local v4    # "weight":F
    :cond_13
    div-float v5, v1, v2

    return v5
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 389
    if-ne p0, p1, :cond_5

    .line 426
    :cond_4
    :goto_4
    return v1

    .line 392
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    .line 393
    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 396
    check-cast v0, Landroid/support/v7/graphics/Palette;

    .line 398
    .local v0, "palette":Landroid/support/v7/graphics/Palette;
    iget-object v3, p0, Landroid/support/v7/graphics/Palette;->mSwatches:Ljava/util/List;

    if-eqz v3, :cond_26

    iget-object v3, p0, Landroid/support/v7/graphics/Palette;->mSwatches:Ljava/util/List;

    iget-object v4, v0, Landroid/support/v7/graphics/Palette;->mSwatches:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2a

    :cond_24
    move v1, v2

    .line 399
    goto :goto_4

    .line 398
    :cond_26
    iget-object v3, v0, Landroid/support/v7/graphics/Palette;->mSwatches:Ljava/util/List;

    if-nez v3, :cond_24

    .line 401
    :cond_2a
    iget-object v3, p0, Landroid/support/v7/graphics/Palette;->mDarkMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v3, :cond_3a

    iget-object v3, p0, Landroid/support/v7/graphics/Palette;->mDarkMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    iget-object v4, v0, Landroid/support/v7/graphics/Palette;->mDarkMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    invoke-virtual {v3, v4}, Landroid/support/v7/graphics/Palette$Swatch;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3e

    :cond_38
    move v1, v2

    .line 403
    goto :goto_4

    .line 401
    :cond_3a
    iget-object v3, v0, Landroid/support/v7/graphics/Palette;->mDarkMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-nez v3, :cond_38

    .line 405
    :cond_3e
    iget-object v3, p0, Landroid/support/v7/graphics/Palette;->mDarkVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v3, :cond_4e

    iget-object v3, p0, Landroid/support/v7/graphics/Palette;->mDarkVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    iget-object v4, v0, Landroid/support/v7/graphics/Palette;->mDarkVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    invoke-virtual {v3, v4}, Landroid/support/v7/graphics/Palette$Swatch;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_52

    :cond_4c
    move v1, v2

    .line 407
    goto :goto_4

    .line 405
    :cond_4e
    iget-object v3, v0, Landroid/support/v7/graphics/Palette;->mDarkVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-nez v3, :cond_4c

    .line 409
    :cond_52
    iget-object v3, p0, Landroid/support/v7/graphics/Palette;->mLightMutedColor:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v3, :cond_62

    iget-object v3, p0, Landroid/support/v7/graphics/Palette;->mLightMutedColor:Landroid/support/v7/graphics/Palette$Swatch;

    iget-object v4, v0, Landroid/support/v7/graphics/Palette;->mLightMutedColor:Landroid/support/v7/graphics/Palette$Swatch;

    invoke-virtual {v3, v4}, Landroid/support/v7/graphics/Palette$Swatch;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_66

    :cond_60
    move v1, v2

    .line 411
    goto :goto_4

    .line 409
    :cond_62
    iget-object v3, v0, Landroid/support/v7/graphics/Palette;->mLightMutedColor:Landroid/support/v7/graphics/Palette$Swatch;

    if-nez v3, :cond_60

    .line 413
    :cond_66
    iget-object v3, p0, Landroid/support/v7/graphics/Palette;->mLightVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v3, :cond_76

    iget-object v3, p0, Landroid/support/v7/graphics/Palette;->mLightVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    iget-object v4, v0, Landroid/support/v7/graphics/Palette;->mLightVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    invoke-virtual {v3, v4}, Landroid/support/v7/graphics/Palette$Swatch;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7a

    :cond_74
    move v1, v2

    .line 415
    goto :goto_4

    .line 413
    :cond_76
    iget-object v3, v0, Landroid/support/v7/graphics/Palette;->mLightVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-nez v3, :cond_74

    .line 417
    :cond_7a
    iget-object v3, p0, Landroid/support/v7/graphics/Palette;->mMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v3, :cond_8b

    iget-object v3, p0, Landroid/support/v7/graphics/Palette;->mMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    iget-object v4, v0, Landroid/support/v7/graphics/Palette;->mMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    invoke-virtual {v3, v4}, Landroid/support/v7/graphics/Palette$Swatch;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8f

    :cond_88
    move v1, v2

    .line 419
    goto/16 :goto_4

    .line 417
    :cond_8b
    iget-object v3, v0, Landroid/support/v7/graphics/Palette;->mMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-nez v3, :cond_88

    .line 421
    :cond_8f
    iget-object v3, p0, Landroid/support/v7/graphics/Palette;->mVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v3, :cond_a0

    iget-object v3, p0, Landroid/support/v7/graphics/Palette;->mVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    iget-object v4, v0, Landroid/support/v7/graphics/Palette;->mVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    invoke-virtual {v3, v4}, Landroid/support/v7/graphics/Palette$Swatch;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :goto_9d
    move v1, v2

    .line 423
    goto/16 :goto_4

    .line 421
    :cond_a0
    iget-object v3, v0, Landroid/support/v7/graphics/Palette;->mVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v3, :cond_4

    goto :goto_9d
.end method

.method public getDarkMutedColor(I)I
    .registers 3
    .param p1, "defaultColor"    # I

    .prologue
    .line 315
    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mDarkMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v0, :cond_a

    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mDarkMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    invoke-virtual {v0}, Landroid/support/v7/graphics/Palette$Swatch;->getRgb()I

    move-result p1

    .end local p1    # "defaultColor":I
    :cond_a
    return p1
.end method

.method public getDarkMutedSwatch()Landroid/support/v7/graphics/Palette$Swatch;
    .registers 2

    .prologue
    .line 261
    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mDarkMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    return-object v0
.end method

.method public getDarkVibrantColor(I)I
    .registers 3
    .param p1, "defaultColor"    # I

    .prologue
    .line 288
    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mDarkVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v0, :cond_a

    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mDarkVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    invoke-virtual {v0}, Landroid/support/v7/graphics/Palette$Swatch;->getRgb()I

    move-result p1

    .end local p1    # "defaultColor":I
    :cond_a
    return p1
.end method

.method public getDarkVibrantSwatch()Landroid/support/v7/graphics/Palette$Swatch;
    .registers 2

    .prologue
    .line 240
    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mDarkVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    return-object v0
.end method

.method public getLightMutedColor(I)I
    .registers 3
    .param p1, "defaultColor"    # I

    .prologue
    .line 306
    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mLightMutedColor:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v0, :cond_a

    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mLightMutedColor:Landroid/support/v7/graphics/Palette$Swatch;

    invoke-virtual {v0}, Landroid/support/v7/graphics/Palette$Swatch;->getRgb()I

    move-result p1

    .end local p1    # "defaultColor":I
    :cond_a
    return p1
.end method

.method public getLightMutedSwatch()Landroid/support/v7/graphics/Palette$Swatch;
    .registers 2

    .prologue
    .line 254
    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mLightMutedColor:Landroid/support/v7/graphics/Palette$Swatch;

    return-object v0
.end method

.method public getLightVibrantColor(I)I
    .registers 3
    .param p1, "defaultColor"    # I

    .prologue
    .line 279
    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mLightVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v0, :cond_a

    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mLightVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    invoke-virtual {v0}, Landroid/support/v7/graphics/Palette$Swatch;->getRgb()I

    move-result p1

    .end local p1    # "defaultColor":I
    :cond_a
    return p1
.end method

.method public getLightVibrantSwatch()Landroid/support/v7/graphics/Palette$Swatch;
    .registers 2

    .prologue
    .line 233
    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mLightVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    return-object v0
.end method

.method public getMutedColor(I)I
    .registers 3
    .param p1, "defaultColor"    # I

    .prologue
    .line 297
    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v0, :cond_a

    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    invoke-virtual {v0}, Landroid/support/v7/graphics/Palette$Swatch;->getRgb()I

    move-result p1

    .end local p1    # "defaultColor":I
    :cond_a
    return p1
.end method

.method public getMutedSwatch()Landroid/support/v7/graphics/Palette$Swatch;
    .registers 2

    .prologue
    .line 247
    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    return-object v0
.end method

.method public getSwatches()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/graphics/Palette$Swatch;",
            ">;"
        }
    .end annotation

    .prologue
    .line 219
    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mSwatches:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getVibrantColor(I)I
    .registers 3
    .param p1, "defaultColor"    # I

    .prologue
    .line 270
    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v0, :cond_a

    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    invoke-virtual {v0}, Landroid/support/v7/graphics/Palette$Swatch;->getRgb()I

    move-result p1

    .end local p1    # "defaultColor":I
    :cond_a
    return p1
.end method

.method public getVibrantSwatch()Landroid/support/v7/graphics/Palette$Swatch;
    .registers 2

    .prologue
    .line 226
    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    return-object v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 431
    iget-object v2, p0, Landroid/support/v7/graphics/Palette;->mSwatches:Ljava/util/List;

    if-eqz v2, :cond_60

    iget-object v2, p0, Landroid/support/v7/graphics/Palette;->mSwatches:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->hashCode()I

    move-result v0

    .line 432
    .local v0, "result":I
    :goto_b
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Landroid/support/v7/graphics/Palette;->mVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v2, :cond_62

    iget-object v2, p0, Landroid/support/v7/graphics/Palette;->mVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    invoke-virtual {v2}, Landroid/support/v7/graphics/Palette$Swatch;->hashCode()I

    move-result v2

    :goto_17
    add-int v0, v3, v2

    .line 433
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Landroid/support/v7/graphics/Palette;->mMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v2, :cond_64

    iget-object v2, p0, Landroid/support/v7/graphics/Palette;->mMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    invoke-virtual {v2}, Landroid/support/v7/graphics/Palette$Swatch;->hashCode()I

    move-result v2

    :goto_25
    add-int v0, v3, v2

    .line 434
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Landroid/support/v7/graphics/Palette;->mDarkVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v2, :cond_66

    iget-object v2, p0, Landroid/support/v7/graphics/Palette;->mDarkVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    invoke-virtual {v2}, Landroid/support/v7/graphics/Palette$Swatch;->hashCode()I

    move-result v2

    :goto_33
    add-int v0, v3, v2

    .line 435
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Landroid/support/v7/graphics/Palette;->mDarkMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v2, :cond_68

    iget-object v2, p0, Landroid/support/v7/graphics/Palette;->mDarkMutedSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    invoke-virtual {v2}, Landroid/support/v7/graphics/Palette$Swatch;->hashCode()I

    move-result v2

    :goto_41
    add-int v0, v3, v2

    .line 436
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Landroid/support/v7/graphics/Palette;->mLightVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v2, :cond_6a

    iget-object v2, p0, Landroid/support/v7/graphics/Palette;->mLightVibrantSwatch:Landroid/support/v7/graphics/Palette$Swatch;

    invoke-virtual {v2}, Landroid/support/v7/graphics/Palette$Swatch;->hashCode()I

    move-result v2

    :goto_4f
    add-int v0, v3, v2

    .line 437
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Landroid/support/v7/graphics/Palette;->mLightMutedColor:Landroid/support/v7/graphics/Palette$Swatch;

    if-eqz v3, :cond_5d

    iget-object v1, p0, Landroid/support/v7/graphics/Palette;->mLightMutedColor:Landroid/support/v7/graphics/Palette$Swatch;

    invoke-virtual {v1}, Landroid/support/v7/graphics/Palette$Swatch;->hashCode()I

    move-result v1

    :cond_5d
    add-int v0, v2, v1

    .line 438
    return v0

    .end local v0    # "result":I
    :cond_60
    move v0, v1

    .line 431
    goto :goto_b

    .restart local v0    # "result":I
    :cond_62
    move v2, v1

    .line 432
    goto :goto_17

    :cond_64
    move v2, v1

    .line 433
    goto :goto_25

    :cond_66
    move v2, v1

    .line 434
    goto :goto_33

    :cond_68
    move v2, v1

    .line 435
    goto :goto_41

    :cond_6a
    move v2, v1

    .line 436
    goto :goto_4f
.end method
