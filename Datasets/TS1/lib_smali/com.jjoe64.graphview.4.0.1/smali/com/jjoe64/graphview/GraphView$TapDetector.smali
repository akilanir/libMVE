.class Lcom/jjoe64/graphview/GraphView$TapDetector;
.super Ljava/lang/Object;
.source "GraphView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jjoe64/graphview/GraphView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TapDetector"
.end annotation


# instance fields
.field private lastDown:J

.field private lastPoint:Landroid/graphics/PointF;

.field final synthetic this$0:Lcom/jjoe64/graphview/GraphView;


# direct methods
.method private constructor <init>(Lcom/jjoe64/graphview/GraphView;)V
    .registers 2

    .prologue
    .line 73
    iput-object p1, p0, Lcom/jjoe64/graphview/GraphView$TapDetector;->this$0:Lcom/jjoe64/graphview/GraphView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/jjoe64/graphview/GraphView;Lcom/jjoe64/graphview/GraphView$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/jjoe64/graphview/GraphView;
    .param p2, "x1"    # Lcom/jjoe64/graphview/GraphView$1;

    .prologue
    .line 73
    invoke-direct {p0, p1}, Lcom/jjoe64/graphview/GraphView$TapDetector;-><init>(Lcom/jjoe64/graphview/GraphView;)V

    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 8
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const-wide/16 v4, 0x0

    const/4 v0, 0x1

    const/high16 v3, 0x42700000    # 60.0f

    .line 91
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_22

    .line 92
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/jjoe64/graphview/GraphView$TapDetector;->lastDown:J

    .line 93
    new-instance v0, Landroid/graphics/PointF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v0, p0, Lcom/jjoe64/graphview/GraphView$TapDetector;->lastPoint:Landroid/graphics/PointF;

    .line 104
    :cond_20
    :goto_20
    const/4 v0, 0x0

    :goto_21
    return v0

    .line 94
    :cond_22
    iget-wide v1, p0, Lcom/jjoe64/graphview/GraphView$TapDetector;->lastDown:J

    cmp-long v1, v1, v4

    if-lez v1, :cond_54

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_54

    .line 95
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget-object v1, p0, Lcom/jjoe64/graphview/GraphView$TapDetector;->lastPoint:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpl-float v0, v0, v3

    if-gtz v0, :cond_51

    .line 96
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iget-object v1, p0, Lcom/jjoe64/graphview/GraphView$TapDetector;->lastPoint:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->y:F

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpl-float v0, v0, v3

    if-lez v0, :cond_20

    .line 97
    :cond_51
    iput-wide v4, p0, Lcom/jjoe64/graphview/GraphView$TapDetector;->lastDown:J

    goto :goto_20

    .line 99
    :cond_54
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-ne v1, v0, :cond_20

    .line 100
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/jjoe64/graphview/GraphView$TapDetector;->lastDown:J

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x190

    cmp-long v1, v1, v3

    if-gez v1, :cond_20

    goto :goto_21
.end method
