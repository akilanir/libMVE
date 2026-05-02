.class public Lcom/github/mikephil/charting/jobs/ZoomJob;
.super Lcom/github/mikephil/charting/jobs/ViewPortJob;
.source "ZoomJob.java"


# instance fields
.field protected axisDependency:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

.field protected scaleX:F

.field protected scaleY:F


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFFFLcom/github/mikephil/charting/utils/Transformer;Lcom/github/mikephil/charting/components/YAxis$AxisDependency;Landroid/view/View;)V
    .registers 15
    .param p1, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;
    .param p2, "scaleX"    # F
    .param p3, "scaleY"    # F
    .param p4, "xValue"    # F
    .param p5, "yValue"    # F
    .param p6, "trans"    # Lcom/github/mikephil/charting/utils/Transformer;
    .param p7, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;
    .param p8, "v"    # Landroid/view/View;

    .prologue
    .line 23
    move-object v0, p0

    move-object v1, p1

    move v2, p4

    move v3, p5

    move-object v4, p6

    move-object v5, p8

    invoke-direct/range {v0 .. v5}, Lcom/github/mikephil/charting/jobs/ViewPortJob;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;)V

    .line 25
    iput p2, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->scaleX:F

    .line 26
    iput p3, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->scaleY:F

    .line 27
    iput-object p7, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->axisDependency:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .line 28
    return-void
.end method


# virtual methods
.method public run()V
    .registers 9

    .prologue
    const/high16 v6, 0x40000000    # 2.0f

    const/4 v7, 0x0

    .line 33
    iget-object v3, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget v4, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->scaleX:F

    iget v5, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->scaleY:F

    invoke-virtual {v3, v4, v5}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->zoom(FF)Landroid/graphics/Matrix;

    move-result-object v0

    .line 34
    .local v0, "save":Landroid/graphics/Matrix;
    iget-object v3, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v4, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->view:Landroid/view/View;

    invoke-virtual {v3, v0, v4, v7}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->refresh(Landroid/graphics/Matrix;Landroid/view/View;Z)Landroid/graphics/Matrix;

    .line 36
    iget-object v3, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->view:Landroid/view/View;

    check-cast v3, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    iget-object v4, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->axisDependency:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    invoke-virtual {v3, v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getDeltaY(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)F

    move-result v3

    iget-object v4, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleY()F

    move-result v4

    div-float v1, v3, v4

    .line 37
    .local v1, "valsInView":F
    iget-object v3, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->view:Landroid/view/View;

    check-cast v3, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v3

    invoke-virtual {v3}, Lcom/github/mikephil/charting/components/XAxis;->getValues()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleX()F

    move-result v4

    div-float v2, v3, v4

    .line 39
    .local v2, "xsInView":F
    iget-object v3, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->pts:[F

    iget v4, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->xValue:F

    div-float v5, v2, v6

    sub-float/2addr v4, v5

    aput v4, v3, v7

    .line 40
    iget-object v3, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->pts:[F

    const/4 v4, 0x1

    iget v5, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->yValue:F

    div-float v6, v1, v6

    add-float/2addr v5, v6

    aput v5, v3, v4

    .line 42
    iget-object v3, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->mTrans:Lcom/github/mikephil/charting/utils/Transformer;

    iget-object v4, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->pts:[F

    invoke-virtual {v3, v4}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 44
    iget-object v3, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v4, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->pts:[F

    invoke-virtual {v3, v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->translate([F)Landroid/graphics/Matrix;

    move-result-object v0

    .line 45
    iget-object v3, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v4, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->view:Landroid/view/View;

    invoke-virtual {v3, v0, v4, v7}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->refresh(Landroid/graphics/Matrix;Landroid/view/View;Z)Landroid/graphics/Matrix;

    .line 47
    iget-object v3, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->view:Landroid/view/View;

    check-cast v3, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->calculateOffsets()V

    .line 48
    iget-object v3, p0, Lcom/github/mikephil/charting/jobs/ZoomJob;->view:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->postInvalidate()V

    .line 49
    return-void
.end method
