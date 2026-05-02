.class public Lcom/github/mikephil/charting/jobs/MoveViewJob;
.super Lcom/github/mikephil/charting/jobs/ViewPortJob;
.source "MoveViewJob.java"


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;)V
    .registers 6
    .param p1, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;
    .param p2, "xValue"    # F
    .param p3, "yValue"    # F
    .param p4, "trans"    # Lcom/github/mikephil/charting/utils/Transformer;
    .param p5, "v"    # Landroid/view/View;

    .prologue
    .line 15
    invoke-direct/range {p0 .. p5}, Lcom/github/mikephil/charting/jobs/ViewPortJob;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;)V

    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 21
    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/MoveViewJob;->pts:[F

    const/4 v1, 0x0

    iget v2, p0, Lcom/github/mikephil/charting/jobs/MoveViewJob;->xValue:F

    aput v2, v0, v1

    .line 22
    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/MoveViewJob;->pts:[F

    const/4 v1, 0x1

    iget v2, p0, Lcom/github/mikephil/charting/jobs/MoveViewJob;->yValue:F

    aput v2, v0, v1

    .line 24
    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/MoveViewJob;->mTrans:Lcom/github/mikephil/charting/utils/Transformer;

    iget-object v1, p0, Lcom/github/mikephil/charting/jobs/MoveViewJob;->pts:[F

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 25
    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/MoveViewJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v1, p0, Lcom/github/mikephil/charting/jobs/MoveViewJob;->pts:[F

    iget-object v2, p0, Lcom/github/mikephil/charting/jobs/MoveViewJob;->view:Landroid/view/View;

    invoke-virtual {v0, v1, v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->centerViewPort([FLandroid/view/View;)V

    .line 26
    return-void
.end method
