.class public Lcom/github/mikephil/charting/formatter/DefaultFillFormatter;
.super Ljava/lang/Object;
.source "DefaultFillFormatter.java"

# interfaces
.implements Lcom/github/mikephil/charting/formatter/FillFormatter;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFillLinePosition(Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;)F
    .registers 11
    .param p1, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;
    .param p2, "dataProvider"    # Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;

    .prologue
    const/4 v7, 0x0

    .line 18
    const/4 v3, 0x0

    .line 19
    .local v3, "fillMin":F
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;->getYChartMax()F

    move-result v0

    .line 20
    .local v0, "chartMaxY":F
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;->getYChartMin()F

    move-result v1

    .line 22
    .local v1, "chartMinY":F
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;->getLineData()Lcom/github/mikephil/charting/data/LineData;

    move-result-object v2

    .line 24
    .local v2, "data":Lcom/github/mikephil/charting/data/LineData;
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getYMax()F

    move-result v6

    cmpl-float v6, v6, v7

    if-lez v6, :cond_20

    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getYMin()F

    move-result v6

    cmpg-float v6, v6, v7

    if-gez v6, :cond_20

    .line 25
    const/4 v3, 0x0

    .line 42
    :goto_1f
    return v3

    .line 30
    :cond_20
    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/LineData;->getYMax()F

    move-result v6

    cmpl-float v6, v6, v7

    if-lez v6, :cond_3c

    .line 31
    const/4 v4, 0x0

    .line 34
    .local v4, "max":F
    :goto_29
    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/LineData;->getYMin()F

    move-result v6

    cmpg-float v6, v6, v7

    if-gez v6, :cond_3e

    .line 35
    const/4 v5, 0x0

    .line 39
    .local v5, "min":F
    :goto_32
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getYMin()F

    move-result v6

    cmpl-float v6, v6, v7

    if-ltz v6, :cond_40

    move v3, v5

    :goto_3b
    goto :goto_1f

    .line 33
    .end local v4    # "max":F
    .end local v5    # "min":F
    :cond_3c
    move v4, v0

    .restart local v4    # "max":F
    goto :goto_29

    .line 37
    :cond_3e
    move v5, v1

    .restart local v5    # "min":F
    goto :goto_32

    :cond_40
    move v3, v4

    .line 39
    goto :goto_3b
.end method
