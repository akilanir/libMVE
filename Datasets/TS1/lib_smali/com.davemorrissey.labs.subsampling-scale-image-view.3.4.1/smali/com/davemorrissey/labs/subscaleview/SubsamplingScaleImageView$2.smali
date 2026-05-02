.class Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "SubsamplingScaleImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setGestureDetector(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;)V
    .registers 3

    .prologue
    .line 490
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    iput-object p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .registers 8
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 512
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->zoomEnabled:Z
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$1300(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Z

    move-result v2

    if-eqz v2, :cond_c9

    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Z

    move-result v2

    if-eqz v2, :cond_c9

    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;

    move-result-object v2

    if-eqz v2, :cond_c9

    .line 515
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->val$context:Landroid/content/Context;

    # invokes: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setGestureDetector(Landroid/content/Context;)V
    invoke-static {v2, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$1400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;)V

    .line 516
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleEnabled:Z
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$1500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Z

    move-result v2

    if-eqz v2, :cond_a2

    .line 519
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    new-instance v3, Landroid/graphics/PointF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/graphics/PointF;-><init>(FF)V

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;
    invoke-static {v2, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$1602(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 520
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    new-instance v3, Landroid/graphics/PointF;

    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;

    move-result-object v4

    iget v4, v4, Landroid/graphics/PointF;->x:F

    iget-object v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;
    invoke-static {v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;

    move-result-object v5

    iget v5, v5, Landroid/graphics/PointF;->y:F

    invoke-direct {v3, v4, v5}, Landroid/graphics/PointF;-><init>(FF)V

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;
    invoke-static {v2, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$1702(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 521
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F
    invoke-static {v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$1000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)F

    move-result v3

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F
    invoke-static {v2, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$1802(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;F)F

    .line 522
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z
    invoke-static {v2, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$1902(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Z)Z

    .line 523
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z
    invoke-static {v2, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$902(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Z)Z

    .line 524
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;
    invoke-static {v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$1600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceCoord(Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v2

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleCenter:Landroid/graphics/PointF;
    invoke-static {v1, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$2002(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 525
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    const/high16 v2, -0x40800000    # -1.0f

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F
    invoke-static {v1, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$2102(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;F)F

    .line 526
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    new-instance v2, Landroid/graphics/PointF;

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleCenter:Landroid/graphics/PointF;
    invoke-static {v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$2000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;

    move-result-object v3

    iget v3, v3, Landroid/graphics/PointF;->x:F

    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleCenter:Landroid/graphics/PointF;
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$2000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;

    move-result-object v4

    iget v4, v4, Landroid/graphics/PointF;->y:F

    invoke-direct {v2, v3, v4}, Landroid/graphics/PointF;-><init>(FF)V

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastPoint:Landroid/graphics/PointF;
    invoke-static {v1, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$2202(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 527
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleMoved:Z
    invoke-static {v1, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$2302(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Z)Z

    .line 536
    :goto_a1
    return v0

    .line 532
    :cond_a2
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    new-instance v3, Landroid/graphics/PointF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-virtual {v2, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceCoord(Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v2

    new-instance v3, Landroid/graphics/PointF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/graphics/PointF;-><init>(FF)V

    # invokes: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoom(Landroid/graphics/PointF;Landroid/graphics/PointF;)V
    invoke-static {v0, v2, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$2400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    move v0, v1

    .line 533
    goto :goto_a1

    .line 536
    :cond_c9
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onDoubleTapEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_a1
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 14
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    const/4 v3, 0x1

    const/high16 v8, 0x43fa0000    # 500.0f

    const/high16 v7, 0x42480000    # 50.0f

    const/high16 v6, 0x3e800000    # 0.25f

    .line 494
    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Z

    move-result v4

    if-eqz v4, :cond_b9

    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Z

    move-result v4

    if-eqz v4, :cond_b9

    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;

    move-result-object v4

    if-eqz v4, :cond_b9

    if-eqz p1, :cond_b9

    if-eqz p2, :cond_b9

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpl-float v4, v4, v7

    if-gtz v4, :cond_45

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpl-float v4, v4, v7

    if-lez v4, :cond_b9

    :cond_45
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpl-float v4, v4, v8

    if-gtz v4, :cond_55

    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpl-float v4, v4, v8

    if-lez v4, :cond_b9

    :cond_55
    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Z

    move-result v4

    if-nez v4, :cond_b9

    .line 495
    new-instance v2, Landroid/graphics/PointF;

    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;

    move-result-object v4

    iget v4, v4, Landroid/graphics/PointF;->x:F

    mul-float v5, p3, v6

    add-float/2addr v4, v5

    iget-object v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;
    invoke-static {v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;

    move-result-object v5

    iget v5, v5, Landroid/graphics/PointF;->y:F

    mul-float/2addr v6, p4

    add-float/2addr v5, v6

    invoke-direct {v2, v4, v5}, Landroid/graphics/PointF;-><init>(FF)V

    .line 496
    .local v2, "vTranslateEnd":Landroid/graphics/PointF;
    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    iget v5, v2, Landroid/graphics/PointF;->x:F

    sub-float/2addr v4, v5

    iget-object v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F
    invoke-static {v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$1000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)F

    move-result v5

    div-float v0, v4, v5

    .line 497
    .local v0, "sCenterXEnd":F
    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    iget v5, v2, Landroid/graphics/PointF;->y:F

    sub-float/2addr v4, v5

    iget-object v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F
    invoke-static {v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$1000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)F

    move-result v5

    div-float v1, v4, v5

    .line 498
    .local v1, "sCenterYEnd":F
    new-instance v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

    iget-object v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    new-instance v6, Landroid/graphics/PointF;

    invoke-direct {v6, v0, v1}, Landroid/graphics/PointF;-><init>(FF)V

    const/4 v7, 0x0

    invoke-direct {v4, v5, v6, v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    invoke-virtual {v4, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->withEasing(I)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

    move-result-object v4

    const/4 v5, 0x0

    # invokes: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->withPanLimited(Z)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;
    invoke-static {v4, v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->access$1200(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;Z)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->start()V

    .line 501
    .end local v0    # "sCenterXEnd":F
    .end local v1    # "sCenterYEnd":F
    .end local v2    # "vTranslateEnd":Landroid/graphics/PointF;
    :goto_b8
    return v3

    :cond_b9
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v3

    goto :goto_b8
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 506
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->performClick()Z

    .line 507
    const/4 v0, 0x1

    return v0
.end method
