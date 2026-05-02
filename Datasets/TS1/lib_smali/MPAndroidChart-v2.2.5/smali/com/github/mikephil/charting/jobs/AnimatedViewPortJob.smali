.class public abstract Lcom/github/mikephil/charting/jobs/AnimatedViewPortJob;
.super Lcom/github/mikephil/charting/jobs/ViewPortJob;
.source "AnimatedViewPortJob.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation


# instance fields
.field protected animator:Landroid/animation/ObjectAnimator;

.field protected phase:F

.field protected xOrigin:F

.field protected yOrigin:F


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;FFJ)V
    .registers 12
    .param p1, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;
    .param p2, "xValue"    # F
    .param p3, "yValue"    # F
    .param p4, "trans"    # Lcom/github/mikephil/charting/utils/Transformer;
    .param p5, "v"    # Landroid/view/View;
    .param p6, "xOrigin"    # F
    .param p7, "yOrigin"    # F
    .param p8, "duration"    # J

    .prologue
    .line 25
    invoke-direct/range {p0 .. p5}, Lcom/github/mikephil/charting/jobs/ViewPortJob;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;)V

    .line 26
    iput p6, p0, Lcom/github/mikephil/charting/jobs/AnimatedViewPortJob;->xOrigin:F

    .line 27
    iput p7, p0, Lcom/github/mikephil/charting/jobs/AnimatedViewPortJob;->yOrigin:F

    .line 28
    const-string v0, "phase"

    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_20

    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedViewPortJob;->animator:Landroid/animation/ObjectAnimator;

    .line 29
    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedViewPortJob;->animator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0, p8, p9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 30
    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedViewPortJob;->animator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0, p0}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 31
    return-void

    .line 28
    :array_20
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public getPhase()F
    .registers 2

    .prologue
    .line 40
    iget v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedViewPortJob;->phase:F

    return v0
.end method

.method public getXOrigin()F
    .registers 2

    .prologue
    .line 48
    iget v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedViewPortJob;->xOrigin:F

    return v0
.end method

.method public getYOrigin()F
    .registers 2

    .prologue
    .line 52
    iget v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedViewPortJob;->yOrigin:F

    return v0
.end method

.method public run()V
    .registers 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 36
    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedViewPortJob;->animator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 37
    return-void
.end method

.method public setPhase(F)V
    .registers 2
    .param p1, "phase"    # F

    .prologue
    .line 44
    iput p1, p0, Lcom/github/mikephil/charting/jobs/AnimatedViewPortJob;->phase:F

    .line 45
    return-void
.end method
