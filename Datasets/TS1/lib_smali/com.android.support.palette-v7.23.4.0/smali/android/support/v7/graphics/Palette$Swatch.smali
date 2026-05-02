.class public final Landroid/support/v7/graphics/Palette$Swatch;
.super Ljava/lang/Object;
.source "Palette.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/graphics/Palette;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Swatch"
.end annotation


# instance fields
.field private final mBlue:I

.field private mBodyTextColor:I

.field private mGeneratedTextColors:Z

.field private final mGreen:I

.field private mHsl:[F

.field private final mPopulation:I

.field private final mRed:I

.field private final mRgb:I

.field private mTitleTextColor:I


# direct methods
.method public constructor <init>(II)V
    .registers 4
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .param p2, "population"    # I

    .prologue
    .line 424
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 425
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v0

    iput v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mRed:I

    .line 426
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v0

    iput v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mGreen:I

    .line 427
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    iput v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mBlue:I

    .line 428
    iput p1, p0, Landroid/support/v7/graphics/Palette$Swatch;->mRgb:I

    .line 429
    iput p2, p0, Landroid/support/v7/graphics/Palette$Swatch;->mPopulation:I

    .line 430
    return-void
.end method

.method constructor <init>(IIII)V
    .registers 6
    .param p1, "red"    # I
    .param p2, "green"    # I
    .param p3, "blue"    # I
    .param p4, "population"    # I

    .prologue
    .line 432
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 433
    iput p1, p0, Landroid/support/v7/graphics/Palette$Swatch;->mRed:I

    .line 434
    iput p2, p0, Landroid/support/v7/graphics/Palette$Swatch;->mGreen:I

    .line 435
    iput p3, p0, Landroid/support/v7/graphics/Palette$Swatch;->mBlue:I

    .line 436
    invoke-static {p1, p2, p3}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mRgb:I

    .line 437
    iput p4, p0, Landroid/support/v7/graphics/Palette$Swatch;->mPopulation:I

    .line 438
    return-void
.end method

.method constructor <init>([FI)V
    .registers 4
    .param p1, "hsl"    # [F
    .param p2, "population"    # I

    .prologue
    .line 441
    invoke-static {p1}, Landroid/support/v4/graphics/ColorUtils;->HSLToColor([F)I

    move-result v0

    invoke-direct {p0, v0, p2}, Landroid/support/v7/graphics/Palette$Swatch;-><init>(II)V

    .line 442
    iput-object p1, p0, Landroid/support/v7/graphics/Palette$Swatch;->mHsl:[F

    .line 443
    return-void
.end method

.method private ensureTextColorsGenerated()V
    .registers 11

    .prologue
    const/high16 v9, 0x40900000    # 4.5f

    const/high16 v8, 0x40400000    # 3.0f

    const/4 v7, 0x1

    const/high16 v6, -0x1000000

    const/4 v5, -0x1

    .line 495
    iget-boolean v4, p0, Landroid/support/v7/graphics/Palette$Swatch;->mGeneratedTextColors:Z

    if-nez v4, :cond_2a

    .line 497
    iget v4, p0, Landroid/support/v7/graphics/Palette$Swatch;->mRgb:I

    invoke-static {v5, v4, v9}, Landroid/support/v4/graphics/ColorUtils;->calculateMinimumAlpha(IIF)I

    move-result v2

    .line 499
    .local v2, "lightBodyAlpha":I
    iget v4, p0, Landroid/support/v7/graphics/Palette$Swatch;->mRgb:I

    invoke-static {v5, v4, v8}, Landroid/support/v4/graphics/ColorUtils;->calculateMinimumAlpha(IIF)I

    move-result v3

    .line 502
    .local v3, "lightTitleAlpha":I
    if-eq v2, v5, :cond_2b

    if-eq v3, v5, :cond_2b

    .line 504
    invoke-static {v5, v2}, Landroid/support/v4/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v4

    iput v4, p0, Landroid/support/v7/graphics/Palette$Swatch;->mBodyTextColor:I

    .line 505
    invoke-static {v5, v3}, Landroid/support/v4/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v4

    iput v4, p0, Landroid/support/v7/graphics/Palette$Swatch;->mTitleTextColor:I

    .line 506
    iput-boolean v7, p0, Landroid/support/v7/graphics/Palette$Swatch;->mGeneratedTextColors:Z

    .line 533
    .end local v2    # "lightBodyAlpha":I
    .end local v3    # "lightTitleAlpha":I
    :cond_2a
    :goto_2a
    return-void

    .line 510
    .restart local v2    # "lightBodyAlpha":I
    .restart local v3    # "lightTitleAlpha":I
    :cond_2b
    iget v4, p0, Landroid/support/v7/graphics/Palette$Swatch;->mRgb:I

    invoke-static {v6, v4, v9}, Landroid/support/v4/graphics/ColorUtils;->calculateMinimumAlpha(IIF)I

    move-result v0

    .line 512
    .local v0, "darkBodyAlpha":I
    iget v4, p0, Landroid/support/v7/graphics/Palette$Swatch;->mRgb:I

    invoke-static {v6, v4, v8}, Landroid/support/v4/graphics/ColorUtils;->calculateMinimumAlpha(IIF)I

    move-result v1

    .line 515
    .local v1, "darkTitleAlpha":I
    if-eq v0, v5, :cond_4a

    if-eq v0, v5, :cond_4a

    .line 517
    invoke-static {v6, v0}, Landroid/support/v4/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v4

    iput v4, p0, Landroid/support/v7/graphics/Palette$Swatch;->mBodyTextColor:I

    .line 518
    invoke-static {v6, v1}, Landroid/support/v4/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v4

    iput v4, p0, Landroid/support/v7/graphics/Palette$Swatch;->mTitleTextColor:I

    .line 519
    iput-boolean v7, p0, Landroid/support/v7/graphics/Palette$Swatch;->mGeneratedTextColors:Z

    goto :goto_2a

    .line 525
    :cond_4a
    if-eq v2, v5, :cond_5d

    invoke-static {v5, v2}, Landroid/support/v4/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v4

    :goto_50
    iput v4, p0, Landroid/support/v7/graphics/Palette$Swatch;->mBodyTextColor:I

    .line 528
    if-eq v3, v5, :cond_62

    invoke-static {v5, v3}, Landroid/support/v4/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v4

    :goto_58
    iput v4, p0, Landroid/support/v7/graphics/Palette$Swatch;->mTitleTextColor:I

    .line 531
    iput-boolean v7, p0, Landroid/support/v7/graphics/Palette$Swatch;->mGeneratedTextColors:Z

    goto :goto_2a

    .line 525
    :cond_5d
    invoke-static {v6, v0}, Landroid/support/v4/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v4

    goto :goto_50

    .line 528
    :cond_62
    invoke-static {v6, v1}, Landroid/support/v4/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v4

    goto :goto_58
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 549
    if-ne p0, p1, :cond_5

    .line 557
    :cond_4
    :goto_4
    return v1

    .line 552
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    .line 553
    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 556
    check-cast v0, Landroid/support/v7/graphics/Palette$Swatch;

    .line 557
    .local v0, "swatch":Landroid/support/v7/graphics/Palette$Swatch;
    iget v3, p0, Landroid/support/v7/graphics/Palette$Swatch;->mPopulation:I

    iget v4, v0, Landroid/support/v7/graphics/Palette$Swatch;->mPopulation:I

    if-ne v3, v4, :cond_22

    iget v3, p0, Landroid/support/v7/graphics/Palette$Swatch;->mRgb:I

    iget v4, v0, Landroid/support/v7/graphics/Palette$Swatch;->mRgb:I

    if-eq v3, v4, :cond_4

    :cond_22
    move v1, v2

    goto :goto_4
.end method

.method public getBodyTextColor()I
    .registers 2
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation

    .prologue
    .line 490
    invoke-direct {p0}, Landroid/support/v7/graphics/Palette$Swatch;->ensureTextColorsGenerated()V

    .line 491
    iget v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mBodyTextColor:I

    return v0
.end method

.method public getHsl()[F
    .registers 5

    .prologue
    .line 460
    iget-object v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mHsl:[F

    if-nez v0, :cond_9

    .line 461
    const/4 v0, 0x3

    new-array v0, v0, [F

    iput-object v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mHsl:[F

    .line 463
    :cond_9
    iget v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mRed:I

    iget v1, p0, Landroid/support/v7/graphics/Palette$Swatch;->mGreen:I

    iget v2, p0, Landroid/support/v7/graphics/Palette$Swatch;->mBlue:I

    iget-object v3, p0, Landroid/support/v7/graphics/Palette$Swatch;->mHsl:[F

    invoke-static {v0, v1, v2, v3}, Landroid/support/v4/graphics/ColorUtils;->RGBToHSL(III[F)V

    .line 464
    iget-object v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mHsl:[F

    return-object v0
.end method

.method public getPopulation()I
    .registers 2

    .prologue
    .line 471
    iget v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mPopulation:I

    return v0
.end method

.method public getRgb()I
    .registers 2
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation

    .prologue
    .line 450
    iget v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mRgb:I

    return v0
.end method

.method public getTitleTextColor()I
    .registers 2
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation

    .prologue
    .line 480
    invoke-direct {p0}, Landroid/support/v7/graphics/Palette$Swatch;->ensureTextColorsGenerated()V

    .line 481
    iget v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mTitleTextColor:I

    return v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 562
    iget v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mRgb:I

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Landroid/support/v7/graphics/Palette$Swatch;->mPopulation:I

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    const/16 v2, 0x5d

    .line 537
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " [RGB: #"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/support/v7/graphics/Palette$Swatch;->getRgb()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " [HSL: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/support/v7/graphics/Palette$Swatch;->getHsl()[F

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->toString([F)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " [Population: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/support/v7/graphics/Palette$Swatch;->mPopulation:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " [Title Text: #"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/support/v7/graphics/Palette$Swatch;->getTitleTextColor()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " [Body Text: #"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/support/v7/graphics/Palette$Swatch;->getBodyTextColor()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
