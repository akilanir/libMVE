.class public Lcom/github/mikephil/charting/utils/TransformerHorizontalBarChart;
.super Lcom/github/mikephil/charting/utils/Transformer;
.source "TransformerHorizontalBarChart.java"


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;)V
    .registers 2
    .param p1, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .prologue
    .line 12
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/utils/Transformer;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    .line 13
    return-void
.end method


# virtual methods
.method public prepareMatrixOffset(Z)V
    .registers 6
    .param p1, "inverted"    # Z

    .prologue
    .line 22
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/TransformerHorizontalBarChart;->mMatrixOffset:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 26
    if-nez p1, :cond_20

    .line 27
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/TransformerHorizontalBarChart;->mMatrixOffset:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/github/mikephil/charting/utils/TransformerHorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetLeft()F

    move-result v1

    iget-object v2, p0, Lcom/github/mikephil/charting/utils/TransformerHorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartHeight()F

    move-result v2

    iget-object v3, p0, Lcom/github/mikephil/charting/utils/TransformerHorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetBottom()F

    move-result v3

    sub-float/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 43
    :goto_1f
    return-void

    .line 30
    :cond_20
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/TransformerHorizontalBarChart;->mMatrixOffset:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/github/mikephil/charting/utils/TransformerHorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartWidth()F

    move-result v1

    iget-object v2, p0, Lcom/github/mikephil/charting/utils/TransformerHorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetRight()F

    move-result v2

    sub-float/2addr v1, v2

    neg-float v1, v1

    iget-object v2, p0, Lcom/github/mikephil/charting/utils/TransformerHorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartHeight()F

    move-result v2

    iget-object v3, p0, Lcom/github/mikephil/charting/utils/TransformerHorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetBottom()F

    move-result v3

    sub-float/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 34
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/TransformerHorizontalBarChart;->mMatrixOffset:Landroid/graphics/Matrix;

    const/high16 v1, -0x40800000    # -1.0f

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    goto :goto_1f
.end method
