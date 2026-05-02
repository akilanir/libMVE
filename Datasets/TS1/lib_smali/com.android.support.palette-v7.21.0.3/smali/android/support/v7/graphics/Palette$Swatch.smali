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
.method constructor <init>(II)V
    .registers 4
    .param p1, "rgbColor"    # I
    .param p2, "population"    # I

    .prologue
    .line 543
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 544
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v0

    iput v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mRed:I

    .line 545
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v0

    iput v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mGreen:I

    .line 546
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    iput v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mBlue:I

    .line 547
    iput p1, p0, Landroid/support/v7/graphics/Palette$Swatch;->mRgb:I

    .line 548
    iput p2, p0, Landroid/support/v7/graphics/Palette$Swatch;->mPopulation:I

    .line 549
    return-void
.end method

.method constructor <init>(IIII)V
    .registers 6
    .param p1, "red"    # I
    .param p2, "green"    # I
    .param p3, "blue"    # I
    .param p4, "population"    # I

    .prologue
    .line 551
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 552
    iput p1, p0, Landroid/support/v7/graphics/Palette$Swatch;->mRed:I

    .line 553
    iput p2, p0, Landroid/support/v7/graphics/Palette$Swatch;->mGreen:I

    .line 554
    iput p3, p0, Landroid/support/v7/graphics/Palette$Swatch;->mBlue:I

    .line 555
    invoke-static {p1, p2, p3}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mRgb:I

    .line 556
    iput p4, p0, Landroid/support/v7/graphics/Palette$Swatch;->mPopulation:I

    .line 557
    return-void
.end method

.method private ensureTextColorsGenerated()V
    .registers 3

    .prologue
    .line 607
    iget-boolean v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mGeneratedTextColors:Z

    if-nez v0, :cond_1b

    .line 608
    iget v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mRgb:I

    const/high16 v1, 0x40400000    # 3.0f

    invoke-static {v0, v1}, Landroid/support/v7/graphics/ColorUtils;->getTextColorForBackground(IF)I

    move-result v0

    iput v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mTitleTextColor:I

    .line 610
    iget v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mRgb:I

    const/high16 v1, 0x40900000    # 4.5f

    invoke-static {v0, v1}, Landroid/support/v7/graphics/ColorUtils;->getTextColorForBackground(IF)I

    move-result v0

    iput v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mBodyTextColor:I

    .line 612
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mGeneratedTextColors:Z

    .line 614
    :cond_1b
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 629
    if-ne p0, p1, :cond_5

    .line 637
    :cond_4
    :goto_4
    return v1

    .line 632
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    .line 633
    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 636
    check-cast v0, Landroid/support/v7/graphics/Palette$Swatch;

    .line 637
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

    .prologue
    .line 602
    invoke-direct {p0}, Landroid/support/v7/graphics/Palette$Swatch;->ensureTextColorsGenerated()V

    .line 603
    iget v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mBodyTextColor:I

    return v0
.end method

.method public getHsl()[F
    .registers 5

    .prologue
    .line 573
    iget-object v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mHsl:[F

    if-nez v0, :cond_14

    .line 575
    const/4 v0, 0x3

    new-array v0, v0, [F

    iput-object v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mHsl:[F

    .line 576
    iget v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mRed:I

    iget v1, p0, Landroid/support/v7/graphics/Palette$Swatch;->mGreen:I

    iget v2, p0, Landroid/support/v7/graphics/Palette$Swatch;->mBlue:I

    iget-object v3, p0, Landroid/support/v7/graphics/Palette$Swatch;->mHsl:[F

    invoke-static {v0, v1, v2, v3}, Landroid/support/v7/graphics/ColorUtils;->RGBtoHSL(III[F)V

    .line 578
    :cond_14
    iget-object v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mHsl:[F

    return-object v0
.end method

.method public getPopulation()I
    .registers 2

    .prologue
    .line 585
    iget v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mPopulation:I

    return v0
.end method

.method public getRgb()I
    .registers 2

    .prologue
    .line 563
    iget v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mRgb:I

    return v0
.end method

.method public getTitleTextColor()I
    .registers 2

    .prologue
    .line 593
    invoke-direct {p0}, Landroid/support/v7/graphics/Palette$Swatch;->ensureTextColorsGenerated()V

    .line 594
    iget v0, p0, Landroid/support/v7/graphics/Palette$Swatch;->mTitleTextColor:I

    return v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 642
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

    .line 618
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

    iget v1, p0, Landroid/support/v7/graphics/Palette$Swatch;->mTitleTextColor:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " [Body Text: #"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/support/v7/graphics/Palette$Swatch;->mBodyTextColor:I

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
