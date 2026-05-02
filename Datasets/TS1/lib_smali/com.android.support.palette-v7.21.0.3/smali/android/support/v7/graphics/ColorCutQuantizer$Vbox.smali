.class Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;
.super Ljava/lang/Object;
.source "ColorCutQuantizer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/graphics/ColorCutQuantizer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Vbox"
.end annotation


# instance fields
.field private mLowerIndex:I

.field private mMaxBlue:I

.field private mMaxGreen:I

.field private mMaxRed:I

.field private mMinBlue:I

.field private mMinGreen:I

.field private mMinRed:I

.field private mUpperIndex:I

.field final synthetic this$0:Landroid/support/v7/graphics/ColorCutQuantizer;


# direct methods
.method constructor <init>(Landroid/support/v7/graphics/ColorCutQuantizer;II)V
    .registers 4
    .param p2, "lowerIndex"    # I
    .param p3, "upperIndex"    # I

    .prologue
    .line 190
    iput-object p1, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->this$0:Landroid/support/v7/graphics/ColorCutQuantizer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 191
    iput p2, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mLowerIndex:I

    .line 192
    iput p3, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mUpperIndex:I

    .line 193
    invoke-virtual {p0}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->fitBox()V

    .line 194
    return-void
.end method


# virtual methods
.method canSplit()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 202
    invoke-virtual {p0}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->getColorCount()I

    move-result v1

    if-le v1, v0, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method findSplitPoint()I
    .registers 8

    .prologue
    .line 292
    invoke-virtual {p0}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->getLongestColorDimension()I

    move-result v3

    .line 297
    .local v3, "longestDimension":I
    iget-object v4, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->this$0:Landroid/support/v7/graphics/ColorCutQuantizer;

    iget v5, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mLowerIndex:I

    iget v6, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mUpperIndex:I

    # invokes: Landroid/support/v7/graphics/ColorCutQuantizer;->modifySignificantOctet(III)V
    invoke-static {v4, v3, v5, v6}, Landroid/support/v7/graphics/ColorCutQuantizer;->access$100(Landroid/support/v7/graphics/ColorCutQuantizer;III)V

    .line 300
    iget-object v4, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->this$0:Landroid/support/v7/graphics/ColorCutQuantizer;

    # getter for: Landroid/support/v7/graphics/ColorCutQuantizer;->mColors:[I
    invoke-static {v4}, Landroid/support/v7/graphics/ColorCutQuantizer;->access$000(Landroid/support/v7/graphics/ColorCutQuantizer;)[I

    move-result-object v4

    iget v5, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mLowerIndex:I

    iget v6, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mUpperIndex:I

    add-int/lit8 v6, v6, 0x1

    invoke-static {v4, v5, v6}, Ljava/util/Arrays;->sort([III)V

    .line 303
    iget-object v4, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->this$0:Landroid/support/v7/graphics/ColorCutQuantizer;

    iget v5, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mLowerIndex:I

    iget v6, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mUpperIndex:I

    # invokes: Landroid/support/v7/graphics/ColorCutQuantizer;->modifySignificantOctet(III)V
    invoke-static {v4, v3, v5, v6}, Landroid/support/v7/graphics/ColorCutQuantizer;->access$100(Landroid/support/v7/graphics/ColorCutQuantizer;III)V

    .line 305
    invoke-virtual {p0, v3}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->midPoint(I)I

    move-result v1

    .line 307
    .local v1, "dimensionMidPoint":I
    iget v2, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mLowerIndex:I

    .local v2, "i":I
    :goto_2b
    iget v4, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mUpperIndex:I

    if-gt v2, v4, :cond_52

    .line 308
    iget-object v4, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->this$0:Landroid/support/v7/graphics/ColorCutQuantizer;

    # getter for: Landroid/support/v7/graphics/ColorCutQuantizer;->mColors:[I
    invoke-static {v4}, Landroid/support/v7/graphics/ColorCutQuantizer;->access$000(Landroid/support/v7/graphics/ColorCutQuantizer;)[I

    move-result-object v4

    aget v0, v4, v2

    .line 310
    .local v0, "color":I
    packed-switch v3, :pswitch_data_56

    .line 307
    :cond_3a
    add-int/lit8 v2, v2, 0x1

    goto :goto_2b

    .line 312
    :pswitch_3d
    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    move-result v4

    if-lt v4, v1, :cond_3a

    .line 329
    .end local v0    # "color":I
    .end local v2    # "i":I
    :goto_43
    return v2

    .line 317
    .restart local v0    # "color":I
    .restart local v2    # "i":I
    :pswitch_44
    invoke-static {v0}, Landroid/graphics/Color;->green(I)I

    move-result v4

    if-lt v4, v1, :cond_3a

    goto :goto_43

    .line 322
    :pswitch_4b
    invoke-static {v0}, Landroid/graphics/Color;->blue(I)I

    move-result v4

    if-le v4, v1, :cond_3a

    goto :goto_43

    .line 329
    .end local v0    # "color":I
    :cond_52
    iget v2, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mLowerIndex:I

    goto :goto_43

    .line 310
    nop

    :pswitch_data_56
    .packed-switch -0x3
        :pswitch_3d
        :pswitch_44
        :pswitch_4b
    .end packed-switch
.end method

.method fitBox()V
    .registers 7

    .prologue
    .line 214
    const/16 v5, 0xff

    iput v5, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinBlue:I

    iput v5, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinGreen:I

    iput v5, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinRed:I

    .line 215
    const/4 v5, 0x0

    iput v5, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxBlue:I

    iput v5, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxGreen:I

    iput v5, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxRed:I

    .line 217
    iget v3, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mLowerIndex:I

    .local v3, "i":I
    :goto_11
    iget v5, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mUpperIndex:I

    if-gt v3, v5, :cond_50

    .line 218
    iget-object v5, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->this$0:Landroid/support/v7/graphics/ColorCutQuantizer;

    # getter for: Landroid/support/v7/graphics/ColorCutQuantizer;->mColors:[I
    invoke-static {v5}, Landroid/support/v7/graphics/ColorCutQuantizer;->access$000(Landroid/support/v7/graphics/ColorCutQuantizer;)[I

    move-result-object v5

    aget v1, v5, v3

    .line 219
    .local v1, "color":I
    invoke-static {v1}, Landroid/graphics/Color;->red(I)I

    move-result v4

    .line 220
    .local v4, "r":I
    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    move-result v2

    .line 221
    .local v2, "g":I
    invoke-static {v1}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    .line 222
    .local v0, "b":I
    iget v5, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxRed:I

    if-le v4, v5, :cond_2f

    .line 223
    iput v4, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxRed:I

    .line 225
    :cond_2f
    iget v5, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinRed:I

    if-ge v4, v5, :cond_35

    .line 226
    iput v4, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinRed:I

    .line 228
    :cond_35
    iget v5, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxGreen:I

    if-le v2, v5, :cond_3b

    .line 229
    iput v2, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxGreen:I

    .line 231
    :cond_3b
    iget v5, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinGreen:I

    if-ge v2, v5, :cond_41

    .line 232
    iput v2, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinGreen:I

    .line 234
    :cond_41
    iget v5, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxBlue:I

    if-le v0, v5, :cond_47

    .line 235
    iput v0, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxBlue:I

    .line 237
    :cond_47
    iget v5, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinBlue:I

    if-ge v0, v5, :cond_4d

    .line 238
    iput v0, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinBlue:I

    .line 217
    :cond_4d
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    .line 241
    .end local v0    # "b":I
    .end local v1    # "color":I
    .end local v2    # "g":I
    .end local v4    # "r":I
    :cond_50
    return-void
.end method

.method getAverageColor()Landroid/support/v7/graphics/Palette$Swatch;
    .registers 13

    .prologue
    .line 336
    const/4 v8, 0x0

    .line 337
    .local v8, "redSum":I
    const/4 v5, 0x0

    .line 338
    .local v5, "greenSum":I
    const/4 v1, 0x0

    .line 339
    .local v1, "blueSum":I
    const/4 v9, 0x0

    .line 341
    .local v9, "totalPopulation":I
    iget v6, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mLowerIndex:I

    .local v6, "i":I
    :goto_6
    iget v10, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mUpperIndex:I

    if-gt v6, v10, :cond_32

    .line 342
    iget-object v10, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->this$0:Landroid/support/v7/graphics/ColorCutQuantizer;

    # getter for: Landroid/support/v7/graphics/ColorCutQuantizer;->mColors:[I
    invoke-static {v10}, Landroid/support/v7/graphics/ColorCutQuantizer;->access$000(Landroid/support/v7/graphics/ColorCutQuantizer;)[I

    move-result-object v10

    aget v2, v10, v6

    .line 343
    .local v2, "color":I
    iget-object v10, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->this$0:Landroid/support/v7/graphics/ColorCutQuantizer;

    # getter for: Landroid/support/v7/graphics/ColorCutQuantizer;->mColorPopulations:Landroid/util/SparseIntArray;
    invoke-static {v10}, Landroid/support/v7/graphics/ColorCutQuantizer;->access$200(Landroid/support/v7/graphics/ColorCutQuantizer;)Landroid/util/SparseIntArray;

    move-result-object v10

    invoke-virtual {v10, v2}, Landroid/util/SparseIntArray;->get(I)I

    move-result v3

    .line 345
    .local v3, "colorPopulation":I
    add-int/2addr v9, v3

    .line 346
    invoke-static {v2}, Landroid/graphics/Color;->red(I)I

    move-result v10

    mul-int/2addr v10, v3

    add-int/2addr v8, v10

    .line 347
    invoke-static {v2}, Landroid/graphics/Color;->green(I)I

    move-result v10

    mul-int/2addr v10, v3

    add-int/2addr v5, v10

    .line 348
    invoke-static {v2}, Landroid/graphics/Color;->blue(I)I

    move-result v10

    mul-int/2addr v10, v3

    add-int/2addr v1, v10

    .line 341
    add-int/lit8 v6, v6, 0x1

    goto :goto_6

    .line 351
    .end local v2    # "color":I
    .end local v3    # "colorPopulation":I
    :cond_32
    int-to-float v10, v8

    int-to-float v11, v9

    div-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 352
    .local v7, "redAverage":I
    int-to-float v10, v5

    int-to-float v11, v9

    div-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v4

    .line 353
    .local v4, "greenAverage":I
    int-to-float v10, v1

    int-to-float v11, v9

    div-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 355
    .local v0, "blueAverage":I
    new-instance v10, Landroid/support/v7/graphics/Palette$Swatch;

    invoke-direct {v10, v7, v4, v0, v9}, Landroid/support/v7/graphics/Palette$Swatch;-><init>(IIII)V

    return-object v10
.end method

.method getColorCount()I
    .registers 3

    .prologue
    .line 206
    iget v0, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mUpperIndex:I

    iget v1, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mLowerIndex:I

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method getLongestColorDimension()I
    .registers 6

    .prologue
    .line 269
    iget v3, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxRed:I

    iget v4, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinRed:I

    sub-int v2, v3, v4

    .line 270
    .local v2, "redLength":I
    iget v3, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxGreen:I

    iget v4, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinGreen:I

    sub-int v1, v3, v4

    .line 271
    .local v1, "greenLength":I
    iget v3, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxBlue:I

    iget v4, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinBlue:I

    sub-int v0, v3, v4

    .line 273
    .local v0, "blueLength":I
    if-lt v2, v1, :cond_18

    if-lt v2, v0, :cond_18

    .line 274
    const/4 v3, -0x3

    .line 278
    :goto_17
    return v3

    .line 275
    :cond_18
    if-lt v1, v2, :cond_1e

    if-lt v1, v0, :cond_1e

    .line 276
    const/4 v3, -0x2

    goto :goto_17

    .line 278
    :cond_1e
    const/4 v3, -0x1

    goto :goto_17
.end method

.method getVolume()I
    .registers 4

    .prologue
    .line 197
    iget v0, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxRed:I

    iget v1, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinRed:I

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxGreen:I

    iget v2, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinGreen:I

    sub-int/2addr v1, v2

    add-int/lit8 v1, v1, 0x1

    mul-int/2addr v0, v1

    iget v1, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxBlue:I

    iget v2, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinBlue:I

    sub-int/2addr v1, v2

    add-int/lit8 v1, v1, 0x1

    mul-int/2addr v0, v1

    return v0
.end method

.method midPoint(I)I
    .registers 4
    .param p1, "dimension"    # I

    .prologue
    .line 362
    packed-switch p1, :pswitch_data_1c

    .line 365
    iget v0, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinRed:I

    iget v1, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxRed:I

    add-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    .line 369
    :goto_a
    return v0

    .line 367
    :pswitch_b
    iget v0, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinGreen:I

    iget v1, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxGreen:I

    add-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    goto :goto_a

    .line 369
    :pswitch_13
    iget v0, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinBlue:I

    iget v1, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxBlue:I

    add-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    goto :goto_a

    .line 362
    nop

    :pswitch_data_1c
    .packed-switch -0x2
        :pswitch_b
        :pswitch_13
    .end packed-switch
.end method

.method splitBox()Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;
    .registers 6

    .prologue
    .line 249
    invoke-virtual {p0}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->canSplit()Z

    move-result v2

    if-nez v2, :cond_e

    .line 250
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Can not split a box with only 1 color"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 254
    :cond_e
    invoke-virtual {p0}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->findSplitPoint()I

    move-result v1

    .line 256
    .local v1, "splitPoint":I
    new-instance v0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;

    iget-object v2, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->this$0:Landroid/support/v7/graphics/ColorCutQuantizer;

    add-int/lit8 v3, v1, 0x1

    iget v4, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mUpperIndex:I

    invoke-direct {v0, v2, v3, v4}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;-><init>(Landroid/support/v7/graphics/ColorCutQuantizer;II)V

    .line 259
    .local v0, "newBox":Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;
    iput v1, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mUpperIndex:I

    .line 260
    invoke-virtual {p0}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->fitBox()V

    .line 262
    return-object v0
.end method
