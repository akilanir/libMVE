.class public Lcom/github/mikephil/charting/utils/Transformer;
.super Ljava/lang/Object;
.source "Transformer.java"


# instance fields
.field private mMBuffer1:Landroid/graphics/Matrix;

.field private mMBuffer2:Landroid/graphics/Matrix;

.field protected mMatrixOffset:Landroid/graphics/Matrix;

.field protected mMatrixValueToPx:Landroid/graphics/Matrix;

.field protected mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;)V
    .registers 3
    .param p1, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixValueToPx:Landroid/graphics/Matrix;

    .line 35
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixOffset:Landroid/graphics/Matrix;

    .line 449
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMBuffer1:Landroid/graphics/Matrix;

    .line 458
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMBuffer2:Landroid/graphics/Matrix;

    .line 40
    iput-object p1, p0, Lcom/github/mikephil/charting/utils/Transformer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .line 41
    return-void
.end method


# virtual methods
.method public generateTransformedValuesBarChart(Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;ILcom/github/mikephil/charting/data/BarData;F)[F
    .registers 15
    .param p1, "data"    # Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    .param p2, "dataSetIndex"    # I
    .param p3, "bd"    # Lcom/github/mikephil/charting/data/BarData;
    .param p4, "phaseY"    # F

    .prologue
    .line 227
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryCount()I

    move-result v8

    mul-int/lit8 v8, v8, 0x2

    new-array v5, v8, [F

    .line 229
    .local v5, "valuePoints":[F
    invoke-virtual {p3}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v3

    .line 230
    .local v3, "setCount":I
    invoke-virtual {p3}, Lcom/github/mikephil/charting/data/BarData;->getGroupSpace()F

    move-result v4

    .line 232
    .local v4, "space":F
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_11
    array-length v8, v5

    if-ge v2, v8, :cond_40

    .line 234
    div-int/lit8 v8, v2, 0x2

    invoke-interface {p1, v8}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v0

    .line 235
    .local v0, "e":Lcom/github/mikephil/charting/data/Entry;
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v1

    .line 238
    .local v1, "i":I
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v8

    add-int/lit8 v9, v3, -0x1

    mul-int/2addr v9, v1

    add-int/2addr v8, v9

    add-int/2addr v8, p2

    int-to-float v8, v8

    int-to-float v9, v1

    mul-float/2addr v9, v4

    add-float/2addr v8, v9

    const/high16 v9, 0x40000000    # 2.0f

    div-float v9, v4, v9

    add-float v6, v8, v9

    .line 240
    .local v6, "x":F
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v7

    .line 242
    .local v7, "y":F
    aput v6, v5, v2

    .line 243
    add-int/lit8 v8, v2, 0x1

    mul-float v9, v7, p4

    aput v9, v5, v8

    .line 232
    add-int/lit8 v2, v2, 0x2

    goto :goto_11

    .line 246
    .end local v0    # "e":Lcom/github/mikephil/charting/data/Entry;
    .end local v1    # "i":I
    .end local v6    # "x":F
    .end local v7    # "y":F
    :cond_40
    invoke-virtual {p0}, Lcom/github/mikephil/charting/utils/Transformer;->getValueToPixelMatrix()Landroid/graphics/Matrix;

    move-result-object v8

    invoke-virtual {v8, v5}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 248
    return-object v5
.end method

.method public generateTransformedValuesBubble(Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;FFII)[F
    .registers 12
    .param p1, "data"    # Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;
    .param p2, "phaseX"    # F
    .param p3, "phaseY"    # F
    .param p4, "from"    # I
    .param p5, "to"    # I

    .prologue
    .line 137
    sub-int v4, p5, p4

    int-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v4, v4

    mul-int/lit8 v0, v4, 0x2

    .line 139
    .local v0, "count":I
    new-array v3, v0, [F

    .line 141
    .local v3, "valuePoints":[F
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_d
    if-ge v2, v0, :cond_2f

    .line 143
    div-int/lit8 v4, v2, 0x2

    add-int/2addr v4, p4

    invoke-interface {p1, v4}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v1

    .line 145
    .local v1, "e":Lcom/github/mikephil/charting/data/Entry;
    if-eqz v1, :cond_2c

    .line 146
    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v4

    sub-int/2addr v4, p4

    int-to-float v4, v4

    mul-float/2addr v4, p2

    int-to-float v5, p4

    add-float/2addr v4, v5

    aput v4, v3, v2

    .line 147
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v5

    mul-float/2addr v5, p3

    aput v5, v3, v4

    .line 141
    :cond_2c
    add-int/lit8 v2, v2, 0x2

    goto :goto_d

    .line 151
    .end local v1    # "e":Lcom/github/mikephil/charting/data/Entry;
    :cond_2f
    invoke-virtual {p0}, Lcom/github/mikephil/charting/utils/Transformer;->getValueToPixelMatrix()Landroid/graphics/Matrix;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 153
    return-object v3
.end method

.method public generateTransformedValuesCandle(Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;FFII)[F
    .registers 12
    .param p1, "data"    # Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;
    .param p2, "phaseX"    # F
    .param p3, "phaseY"    # F
    .param p4, "from"    # I
    .param p5, "to"    # I

    .prologue
    .line 195
    sub-int v4, p5, p4

    int-to-float v4, v4

    mul-float/2addr v4, p2

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v4, v4

    mul-int/lit8 v0, v4, 0x2

    .line 197
    .local v0, "count":I
    new-array v3, v0, [F

    .line 199
    .local v3, "valuePoints":[F
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_f
    if-ge v2, v0, :cond_2f

    .line 201
    div-int/lit8 v4, v2, 0x2

    add-int/2addr v4, p4

    invoke-interface {p1, v4}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/data/CandleEntry;

    .line 203
    .local v1, "e":Lcom/github/mikephil/charting/data/CandleEntry;
    if-eqz v1, :cond_2c

    .line 204
    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/CandleEntry;->getXIndex()I

    move-result v4

    int-to-float v4, v4

    aput v4, v3, v2

    .line 205
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/CandleEntry;->getHigh()F

    move-result v5

    mul-float/2addr v5, p3

    aput v5, v3, v4

    .line 199
    :cond_2c
    add-int/lit8 v2, v2, 0x2

    goto :goto_f

    .line 209
    .end local v1    # "e":Lcom/github/mikephil/charting/data/CandleEntry;
    :cond_2f
    invoke-virtual {p0}, Lcom/github/mikephil/charting/utils/Transformer;->getValueToPixelMatrix()Landroid/graphics/Matrix;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 211
    return-object v3
.end method

.method public generateTransformedValuesHorizontalBarChart(Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;ILcom/github/mikephil/charting/data/BarData;F)[F
    .registers 15
    .param p1, "data"    # Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    .param p2, "dataSet"    # I
    .param p3, "bd"    # Lcom/github/mikephil/charting/data/BarData;
    .param p4, "phaseY"    # F

    .prologue
    .line 262
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryCount()I

    move-result v8

    mul-int/lit8 v8, v8, 0x2

    new-array v5, v8, [F

    .line 264
    .local v5, "valuePoints":[F
    invoke-virtual {p3}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v3

    .line 265
    .local v3, "setCount":I
    invoke-virtual {p3}, Lcom/github/mikephil/charting/data/BarData;->getGroupSpace()F

    move-result v4

    .line 267
    .local v4, "space":F
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_11
    array-length v8, v5

    if-ge v2, v8, :cond_3c

    .line 269
    div-int/lit8 v8, v2, 0x2

    invoke-interface {p1, v8}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v0

    .line 270
    .local v0, "e":Lcom/github/mikephil/charting/data/Entry;
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v1

    .line 273
    .local v1, "i":I
    add-int/lit8 v8, v3, -0x1

    mul-int/2addr v8, v1

    add-int/2addr v8, v1

    add-int/2addr v8, p2

    int-to-float v8, v8

    int-to-float v9, v1

    mul-float/2addr v9, v4

    add-float/2addr v8, v9

    const/high16 v9, 0x40000000    # 2.0f

    div-float v9, v4, v9

    add-float v6, v8, v9

    .line 275
    .local v6, "x":F
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v7

    .line 277
    .local v7, "y":F
    mul-float v8, v7, p4

    aput v8, v5, v2

    .line 278
    add-int/lit8 v8, v2, 0x1

    aput v6, v5, v8

    .line 267
    add-int/lit8 v2, v2, 0x2

    goto :goto_11

    .line 281
    .end local v0    # "e":Lcom/github/mikephil/charting/data/Entry;
    .end local v1    # "i":I
    .end local v6    # "x":F
    .end local v7    # "y":F
    :cond_3c
    invoke-virtual {p0}, Lcom/github/mikephil/charting/utils/Transformer;->getValueToPixelMatrix()Landroid/graphics/Matrix;

    move-result-object v8

    invoke-virtual {v8, v5}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 283
    return-object v5
.end method

.method public generateTransformedValuesLine(Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;FFII)[F
    .registers 12
    .param p1, "data"    # Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;
    .param p2, "phaseX"    # F
    .param p3, "phaseY"    # F
    .param p4, "from"    # I
    .param p5, "to"    # I

    .prologue
    .line 166
    sub-int v4, p5, p4

    int-to-float v4, v4

    mul-float/2addr v4, p2

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v4, v4

    mul-int/lit8 v0, v4, 0x2

    .line 168
    .local v0, "count":I
    new-array v3, v0, [F

    .line 170
    .local v3, "valuePoints":[F
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_f
    if-ge v2, v0, :cond_2d

    .line 172
    div-int/lit8 v4, v2, 0x2

    add-int/2addr v4, p4

    invoke-interface {p1, v4}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v1

    .line 174
    .local v1, "e":Lcom/github/mikephil/charting/data/Entry;
    if-eqz v1, :cond_2a

    .line 175
    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v4

    int-to-float v4, v4

    aput v4, v3, v2

    .line 176
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v5

    mul-float/2addr v5, p3

    aput v5, v3, v4

    .line 170
    :cond_2a
    add-int/lit8 v2, v2, 0x2

    goto :goto_f

    .line 180
    .end local v1    # "e":Lcom/github/mikephil/charting/data/Entry;
    :cond_2d
    invoke-virtual {p0}, Lcom/github/mikephil/charting/utils/Transformer;->getValueToPixelMatrix()Landroid/graphics/Matrix;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 182
    return-object v3
.end method

.method public generateTransformedValuesScatter(Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;F)[F
    .registers 8
    .param p1, "data"    # Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;
    .param p2, "phaseY"    # F

    .prologue
    .line 110
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getEntryCount()I

    move-result v3

    mul-int/lit8 v3, v3, 0x2

    new-array v2, v3, [F

    .line 112
    .local v2, "valuePoints":[F
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_9
    array-length v3, v2

    if-ge v1, v3, :cond_27

    .line 114
    div-int/lit8 v3, v1, 0x2

    invoke-interface {p1, v3}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v0

    .line 116
    .local v0, "e":Lcom/github/mikephil/charting/data/Entry;
    if-eqz v0, :cond_24

    .line 117
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v3

    int-to-float v3, v3

    aput v3, v2, v1

    .line 118
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v4

    mul-float/2addr v4, p2

    aput v4, v2, v3

    .line 112
    :cond_24
    add-int/lit8 v1, v1, 0x2

    goto :goto_9

    .line 122
    .end local v0    # "e":Lcom/github/mikephil/charting/data/Entry;
    :cond_27
    invoke-virtual {p0}, Lcom/github/mikephil/charting/utils/Transformer;->getValueToPixelMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 124
    return-object v2
.end method

.method public getOffsetMatrix()Landroid/graphics/Matrix;
    .registers 2

    .prologue
    .line 446
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixOffset:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getPixelToValueMatrix()Landroid/graphics/Matrix;
    .registers 3

    .prologue
    .line 461
    invoke-virtual {p0}, Lcom/github/mikephil/charting/utils/Transformer;->getValueToPixelMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMBuffer2:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 462
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMBuffer2:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getValueMatrix()Landroid/graphics/Matrix;
    .registers 2

    .prologue
    .line 442
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixValueToPx:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getValueToPixelMatrix()Landroid/graphics/Matrix;
    .registers 3

    .prologue
    .line 452
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMBuffer1:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixValueToPx:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 453
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMBuffer1:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/github/mikephil/charting/utils/Transformer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v1, v1, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMatrixTouch:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 454
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMBuffer1:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixOffset:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 455
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMBuffer1:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getValuesByTouchPoint(FF)Lcom/github/mikephil/charting/utils/PointD;
    .registers 11
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 429
    const/4 v5, 0x2

    new-array v0, v5, [F

    .line 430
    .local v0, "pts":[F
    aput p1, v0, v6

    .line 431
    aput p2, v0, v7

    .line 433
    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/utils/Transformer;->pixelsToValue([F)V

    .line 435
    aget v5, v0, v6

    float-to-double v1, v5

    .line 436
    .local v1, "xTouchVal":D
    aget v5, v0, v7

    float-to-double v3, v5

    .line 438
    .local v3, "yTouchVal":D
    new-instance v5, Lcom/github/mikephil/charting/utils/PointD;

    invoke-direct {v5, v1, v2, v3, v4}, Lcom/github/mikephil/charting/utils/PointD;-><init>(DD)V

    return-object v5
.end method

.method public pathValueToPixel(Landroid/graphics/Path;)V
    .registers 3
    .param p1, "path"    # Landroid/graphics/Path;

    .prologue
    .line 294
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixValueToPx:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 295
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getMatrixTouch()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 296
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixOffset:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 297
    return-void
.end method

.method public pathValuesToPixel(Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/graphics/Path;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 306
    .local p1, "paths":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/Path;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_13

    .line 307
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Path;

    invoke-virtual {p0, v1}, Lcom/github/mikephil/charting/utils/Transformer;->pathValueToPixel(Landroid/graphics/Path;)V

    .line 306
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 309
    :cond_13
    return-void
.end method

.method public pixelsToValue([F)V
    .registers 4
    .param p1, "pixels"    # [F

    .prologue
    .line 403
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 406
    .local v0, "tmp":Landroid/graphics/Matrix;
    iget-object v1, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixOffset:Landroid/graphics/Matrix;

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 407
    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 409
    iget-object v1, p0, Lcom/github/mikephil/charting/utils/Transformer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getMatrixTouch()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 410
    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 412
    iget-object v1, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixValueToPx:Landroid/graphics/Matrix;

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 413
    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 414
    return-void
.end method

.method public pointValuesToPixel([F)V
    .registers 3
    .param p1, "pts"    # [F

    .prologue
    .line 319
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixValueToPx:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 320
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getMatrixTouch()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 321
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixOffset:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 322
    return-void
.end method

.method public prepareMatrixOffset(Z)V
    .registers 6
    .param p1, "inverted"    # Z

    .prologue
    .line 79
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixOffset:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 83
    if-nez p1, :cond_20

    .line 84
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixOffset:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/github/mikephil/charting/utils/Transformer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetLeft()F

    move-result v1

    iget-object v2, p0, Lcom/github/mikephil/charting/utils/Transformer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartHeight()F

    move-result v2

    iget-object v3, p0, Lcom/github/mikephil/charting/utils/Transformer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetBottom()F

    move-result v3

    sub-float/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 98
    :goto_1f
    return-void

    .line 87
    :cond_20
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixOffset:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/github/mikephil/charting/utils/Transformer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetLeft()F

    move-result v1

    iget-object v2, p0, Lcom/github/mikephil/charting/utils/Transformer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetTop()F

    move-result v2

    neg-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 89
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixOffset:Landroid/graphics/Matrix;

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v2, -0x40800000    # -1.0f

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    goto :goto_1f
.end method

.method public prepareMatrixValuePx(FFFF)V
    .registers 10
    .param p1, "xChartMin"    # F
    .param p2, "deltaX"    # F
    .param p3, "deltaY"    # F
    .param p4, "yChartMin"    # F

    .prologue
    .line 54
    iget-object v2, p0, Lcom/github/mikephil/charting/utils/Transformer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentWidth()F

    move-result v2

    div-float v0, v2, p2

    .line 55
    .local v0, "scaleX":F
    iget-object v2, p0, Lcom/github/mikephil/charting/utils/Transformer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentHeight()F

    move-result v2

    div-float v1, v2, p3

    .line 57
    .local v1, "scaleY":F
    invoke-static {v0}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v2

    if-eqz v2, :cond_17

    .line 59
    const/4 v0, 0x0

    .line 61
    :cond_17
    invoke-static {v1}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 63
    const/4 v1, 0x0

    .line 67
    :cond_1e
    iget-object v2, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixValueToPx:Landroid/graphics/Matrix;

    invoke-virtual {v2}, Landroid/graphics/Matrix;->reset()V

    .line 68
    iget-object v2, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixValueToPx:Landroid/graphics/Matrix;

    neg-float v3, p1

    neg-float v4, p4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 69
    iget-object v2, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixValueToPx:Landroid/graphics/Matrix;

    neg-float v3, v1

    invoke-virtual {v2, v0, v3}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 70
    return-void
.end method

.method public rectValueToPixel(Landroid/graphics/RectF;)V
    .registers 3
    .param p1, "r"    # Landroid/graphics/RectF;

    .prologue
    .line 331
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixValueToPx:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 332
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getMatrixTouch()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 333
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixOffset:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 334
    return-void
.end method

.method public rectValueToPixel(Landroid/graphics/RectF;F)V
    .registers 4
    .param p1, "r"    # Landroid/graphics/RectF;
    .param p2, "phaseY"    # F

    .prologue
    .line 345
    iget v0, p1, Landroid/graphics/RectF;->top:F

    mul-float/2addr v0, p2

    iput v0, p1, Landroid/graphics/RectF;->top:F

    .line 346
    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    mul-float/2addr v0, p2

    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    .line 348
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixValueToPx:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 349
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getMatrixTouch()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 350
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixOffset:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 351
    return-void
.end method

.method public rectValueToPixelHorizontal(Landroid/graphics/RectF;)V
    .registers 3
    .param p1, "r"    # Landroid/graphics/RectF;

    .prologue
    .line 360
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixValueToPx:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 361
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getMatrixTouch()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 362
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixOffset:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 363
    return-void
.end method

.method public rectValueToPixelHorizontal(Landroid/graphics/RectF;F)V
    .registers 4
    .param p1, "r"    # Landroid/graphics/RectF;
    .param p2, "phaseY"    # F

    .prologue
    .line 374
    iget v0, p1, Landroid/graphics/RectF;->left:F

    mul-float/2addr v0, p2

    iput v0, p1, Landroid/graphics/RectF;->left:F

    .line 375
    iget v0, p1, Landroid/graphics/RectF;->right:F

    mul-float/2addr v0, p2

    iput v0, p1, Landroid/graphics/RectF;->right:F

    .line 377
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixValueToPx:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 378
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getMatrixTouch()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 379
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/Transformer;->mMatrixOffset:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 380
    return-void
.end method

.method public rectValuesToPixel(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/graphics/RectF;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 389
    .local p1, "rects":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/RectF;>;"
    invoke-virtual {p0}, Lcom/github/mikephil/charting/utils/Transformer;->getValueToPixelMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    .line 391
    .local v1, "m":Landroid/graphics/Matrix;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_17

    .line 392
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/RectF;

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 391
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 393
    :cond_17
    return-void
.end method
