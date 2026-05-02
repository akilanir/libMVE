.class public Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;
.super Lcom/github/mikephil/charting/jobs/AnimatedViewPortJob;
.source "AnimatedZoomJob.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation


# instance fields
.field protected xValCount:F

.field protected yAxis:Lcom/github/mikephil/charting/components/YAxis;

.field protected zoomCenterX:F

.field protected zoomCenterY:F

.field protected zoomOriginX:F

.field protected zoomOriginY:F


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Landroid/view/View;Lcom/github/mikephil/charting/utils/Transformer;Lcom/github/mikephil/charting/components/YAxis;FFFFFFFFFJ)V
    .registers 27
    .param p1, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "trans"    # Lcom/github/mikephil/charting/utils/Transformer;
    .param p4, "axis"    # Lcom/github/mikephil/charting/components/YAxis;
    .param p5, "xValCount"    # F
    .param p6, "scaleX"    # F
    .param p7, "scaleY"    # F
    .param p8, "xOrigin"    # F
    .param p9, "yOrigin"    # F
    .param p10, "zoomCenterX"    # F
    .param p11, "zoomCenterY"    # F
    .param p12, "zoomOriginX"    # F
    .param p13, "zoomOriginY"    # F
    .param p14, "duration"    # J
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 32
    move-object v1, p0

    move-object v2, p1

    move/from16 v3, p6

    move/from16 v4, p7

    move-object v5, p3

    move-object v6, p2

    move/from16 v7, p8

    move/from16 v8, p9

    move-wide/from16 v9, p14

    invoke-direct/range {v1 .. v10}, Lcom/github/mikephil/charting/jobs/AnimatedViewPortJob;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;FFJ)V

    .line 34
    move/from16 v0, p10

    iput v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->zoomCenterX:F

    .line 35
    move/from16 v0, p11

    iput v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->zoomCenterY:F

    .line 36
    move/from16 v0, p12

    iput v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->zoomOriginX:F

    .line 37
    move/from16 v0, p13

    iput v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->zoomOriginY:F

    .line 38
    iget-object v1, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->animator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v1, p0}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 39
    iput-object p4, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->yAxis:Lcom/github/mikephil/charting/components/YAxis;

    .line 40
    move/from16 v0, p5

    iput v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->xValCount:F

    .line 41
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 73
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 66
    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->view:Landroid/view/View;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->calculateOffsets()V

    .line 67
    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->view:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->postInvalidate()V

    .line 68
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 78
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 83
    return-void
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 14
    .param p1, "animation"    # Landroid/animation/ValueAnimator;

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    const/high16 v9, 0x40000000    # 2.0f

    .line 46
    iget v5, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->xOrigin:F

    iget v6, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->xValue:F

    iget v7, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->xOrigin:F

    sub-float/2addr v6, v7

    iget v7, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->phase:F

    mul-float/2addr v6, v7

    add-float v1, v5, v6

    .line 47
    .local v1, "scaleX":F
    iget v5, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->yOrigin:F

    iget v6, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->yValue:F

    iget v7, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->yOrigin:F

    sub-float/2addr v6, v7

    iget v7, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->phase:F

    mul-float/2addr v6, v7

    add-float v2, v5, v6

    .line 49
    .local v2, "scaleY":F
    iget-object v5, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v5, v1, v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->setZoom(FF)Landroid/graphics/Matrix;

    move-result-object v0

    .line 50
    .local v0, "save":Landroid/graphics/Matrix;
    iget-object v5, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v6, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->view:Landroid/view/View;

    invoke-virtual {v5, v0, v6, v10}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->refresh(Landroid/graphics/Matrix;Landroid/view/View;Z)Landroid/graphics/Matrix;

    .line 52
    iget-object v5, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->yAxis:Lcom/github/mikephil/charting/components/YAxis;

    iget v5, v5, Lcom/github/mikephil/charting/components/YAxis;->mAxisRange:F

    iget-object v6, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleY()F

    move-result v6

    div-float v3, v5, v6

    .line 53
    .local v3, "valsInView":F
    iget v5, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->xValCount:F

    iget-object v6, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleX()F

    move-result v6

    div-float v4, v5, v6

    .line 55
    .local v4, "xsInView":F
    iget-object v5, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->pts:[F

    iget v6, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->zoomOriginX:F

    iget v7, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->zoomCenterX:F

    div-float v8, v4, v9

    sub-float/2addr v7, v8

    iget v8, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->zoomOriginX:F

    sub-float/2addr v7, v8

    iget v8, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->phase:F

    mul-float/2addr v7, v8

    add-float/2addr v6, v7

    aput v6, v5, v10

    .line 56
    iget-object v5, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->pts:[F

    iget v6, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->zoomOriginY:F

    iget v7, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->zoomCenterY:F

    div-float v8, v3, v9

    add-float/2addr v7, v8

    iget v8, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->zoomOriginY:F

    sub-float/2addr v7, v8

    iget v8, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->phase:F

    mul-float/2addr v7, v8

    add-float/2addr v6, v7

    aput v6, v5, v11

    .line 58
    iget-object v5, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->mTrans:Lcom/github/mikephil/charting/utils/Transformer;

    iget-object v6, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->pts:[F

    invoke-virtual {v5, v6}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 60
    iget-object v5, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v6, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->pts:[F

    invoke-virtual {v5, v6}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->translate([F)Landroid/graphics/Matrix;

    move-result-object v0

    .line 61
    iget-object v5, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v6, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->view:Landroid/view/View;

    invoke-virtual {v5, v0, v6, v11}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->refresh(Landroid/graphics/Matrix;Landroid/view/View;Z)Landroid/graphics/Matrix;

    .line 62
    return-void
.end method
