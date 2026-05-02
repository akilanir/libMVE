.class public abstract Lcom/github/mikephil/charting/jobs/ViewPortJob;
.super Ljava/lang/Object;
.source "ViewPortJob.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field protected mTrans:Lcom/github/mikephil/charting/utils/Transformer;

.field protected mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

.field protected pts:[F

.field protected view:Landroid/view/View;

.field protected xValue:F

.field protected yValue:F


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;)V
    .registers 8
    .param p1, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;
    .param p2, "xValue"    # F
    .param p3, "yValue"    # F
    .param p4, "trans"    # Lcom/github/mikephil/charting/utils/Transformer;
    .param p5, "v"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, 0x2

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/github/mikephil/charting/jobs/ViewPortJob;->pts:[F

    .line 23
    iput v1, p0, Lcom/github/mikephil/charting/jobs/ViewPortJob;->xValue:F

    .line 24
    iput v1, p0, Lcom/github/mikephil/charting/jobs/ViewPortJob;->yValue:F

    .line 31
    iput-object p1, p0, Lcom/github/mikephil/charting/jobs/ViewPortJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .line 32
    iput p2, p0, Lcom/github/mikephil/charting/jobs/ViewPortJob;->xValue:F

    .line 33
    iput p3, p0, Lcom/github/mikephil/charting/jobs/ViewPortJob;->yValue:F

    .line 34
    iput-object p4, p0, Lcom/github/mikephil/charting/jobs/ViewPortJob;->mTrans:Lcom/github/mikephil/charting/utils/Transformer;

    .line 35
    iput-object p5, p0, Lcom/github/mikephil/charting/jobs/ViewPortJob;->view:Landroid/view/View;

    .line 36
    return-void
.end method


# virtual methods
.method public getXValue()F
    .registers 2

    .prologue
    .line 39
    iget v0, p0, Lcom/github/mikephil/charting/jobs/ViewPortJob;->xValue:F

    return v0
.end method

.method public getYValue()F
    .registers 2

    .prologue
    .line 43
    iget v0, p0, Lcom/github/mikephil/charting/jobs/ViewPortJob;->yValue:F

    return v0
.end method
