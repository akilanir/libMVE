.class public Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;
.super Lcom/github/mikephil/charting/jobs/AnimatedViewPortJob;
.source "AnimatedMoveViewJob.java"


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;FFJ)V
    .registers 10
    .param p1, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;
    .param p2, "xValue"    # F
    .param p3, "yValue"    # F
    .param p4, "trans"    # Lcom/github/mikephil/charting/utils/Transformer;
    .param p5, "v"    # Landroid/view/View;
    .param p6, "xOrigin"    # F
    .param p7, "yOrigin"    # F
    .param p8, "duration"    # J

    .prologue
    .line 17
    invoke-direct/range {p0 .. p9}, Lcom/github/mikephil/charting/jobs/AnimatedViewPortJob;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;FFJ)V

    .line 18
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 7
    .param p1, "animation"    # Landroid/animation/ValueAnimator;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->pts:[F

    const/4 v1, 0x0

    iget v2, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->xOrigin:F

    iget v3, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->xValue:F

    iget v4, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->xOrigin:F

    sub-float/2addr v3, v4

    iget v4, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->phase:F

    mul-float/2addr v3, v4

    add-float/2addr v2, v3

    aput v2, v0, v1

    .line 24
    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->pts:[F

    const/4 v1, 0x1

    iget v2, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->yOrigin:F

    iget v3, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->yValue:F

    iget v4, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->yOrigin:F

    sub-float/2addr v3, v4

    iget v4, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->phase:F

    mul-float/2addr v3, v4

    add-float/2addr v2, v3

    aput v2, v0, v1

    .line 26
    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->mTrans:Lcom/github/mikephil/charting/utils/Transformer;

    iget-object v1, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->pts:[F

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 27
    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v1, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->pts:[F

    iget-object v2, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->view:Landroid/view/View;

    invoke-virtual {v0, v1, v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->centerViewPort([FLandroid/view/View;)V

    .line 28
    return-void
.end method
