.class public Lcom/yalantis/ucrop/util/RotationGestureDetector;
.super Ljava/lang/Object;
.source "RotationGestureDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yalantis/ucrop/util/RotationGestureDetector$OnRotationGestureListener;,
        Lcom/yalantis/ucrop/util/RotationGestureDetector$SimpleOnRotationGestureListener;
    }
.end annotation


# static fields
.field private static final INVALID_POINTER_INDEX:I = -0x1


# instance fields
.field private fX:F

.field private fY:F

.field private mAngle:F

.field private mIsFirstTouch:Z

.field private mListener:Lcom/yalantis/ucrop/util/RotationGestureDetector$OnRotationGestureListener;

.field private mPointerIndex1:I

.field private mPointerIndex2:I

.field private sX:F

.field private sY:F


# direct methods
.method public constructor <init>(Lcom/yalantis/ucrop/util/RotationGestureDetector$OnRotationGestureListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/yalantis/ucrop/util/RotationGestureDetector$OnRotationGestureListener;

    .prologue
    const/4 v0, -0x1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mListener:Lcom/yalantis/ucrop/util/RotationGestureDetector$OnRotationGestureListener;

    .line 20
    iput v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mPointerIndex1:I

    .line 21
    iput v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mPointerIndex2:I

    .line 22
    return-void
.end method

.method private calculateAngleBetweenLines(FFFFFFFF)F
    .registers 14
    .param p1, "fx1"    # F
    .param p2, "fy1"    # F
    .param p3, "fx2"    # F
    .param p4, "fy2"    # F
    .param p5, "sx1"    # F
    .param p6, "sy1"    # F
    .param p7, "sx2"    # F
    .param p8, "sy2"    # F

    .prologue
    .line 81
    sub-float v0, p2, p4

    float-to-double v0, v0

    sub-float v2, p1, p3

    float-to-double v2, v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    double-to-float v0, v0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v0

    double-to-float v0, v0

    sub-float v1, p6, p8

    float-to-double v1, v1

    sub-float v3, p5, p7

    float-to-double v3, v3

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v1

    double-to-float v1, v1

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v1

    double-to-float v1, v1

    invoke-direct {p0, v0, v1}, Lcom/yalantis/ucrop/util/RotationGestureDetector;->calculateAngleDelta(FF)F

    move-result v0

    return v0
.end method

.method private calculateAngleDelta(FF)F
    .registers 6
    .param p1, "angleFrom"    # F
    .param p2, "angleTo"    # F

    .prologue
    const/high16 v2, 0x43b40000    # 360.0f

    .line 87
    rem-float v0, p2, v2

    rem-float v1, p1, v2

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mAngle:F

    .line 89
    iget v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mAngle:F

    const/high16 v1, -0x3ccc0000    # -180.0f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_19

    .line 90
    iget v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mAngle:F

    add-float/2addr v0, v2

    iput v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mAngle:F

    .line 95
    :cond_16
    :goto_16
    iget v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mAngle:F

    return v0

    .line 91
    :cond_19
    iget v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mAngle:F

    const/high16 v1, 0x43340000    # 180.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_16

    .line 92
    iget v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mAngle:F

    sub-float/2addr v0, v2

    iput v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mAngle:F

    goto :goto_16
.end method


# virtual methods
.method public getAngle()F
    .registers 2

    .prologue
    .line 25
    iget v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mAngle:F

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 12
    .param p1, "event"    # Landroid/view/MotionEvent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x0

    const/4 v9, 0x1

    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 29
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    packed-switch v0, :pswitch_data_9e

    .line 76
    :cond_b
    :goto_b
    :pswitch_b
    return v9

    .line 31
    :pswitch_c
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->sX:F

    .line 32
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->sY:F

    .line 33
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    iput v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mPointerIndex1:I

    .line 34
    iput v2, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mAngle:F

    .line 35
    iput-boolean v9, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mIsFirstTouch:Z

    goto :goto_b

    .line 38
    :pswitch_27
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->fX:F

    .line 39
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->fY:F

    .line 40
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    iput v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mPointerIndex2:I

    .line 41
    iput v2, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mAngle:F

    .line 42
    iput-boolean v9, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mIsFirstTouch:Z

    goto :goto_b

    .line 45
    :pswitch_46
    iget v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mPointerIndex1:I

    if-eq v0, v1, :cond_b

    iget v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mPointerIndex2:I

    if-eq v0, v1, :cond_b

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    iget v1, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mPointerIndex2:I

    if-le v0, v1, :cond_b

    .line 48
    iget v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mPointerIndex1:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    .line 49
    .local v7, "nsX":F
    iget v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mPointerIndex1:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    .line 50
    .local v8, "nsY":F
    iget v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mPointerIndex2:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v5

    .line 51
    .local v5, "nfX":F
    iget v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mPointerIndex2:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    .line 53
    .local v6, "nfY":F
    iget-boolean v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mIsFirstTouch:Z

    if-eqz v0, :cond_88

    .line 54
    iput v2, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mAngle:F

    .line 55
    iput-boolean v3, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mIsFirstTouch:Z

    .line 60
    :goto_76
    iget-object v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mListener:Lcom/yalantis/ucrop/util/RotationGestureDetector$OnRotationGestureListener;

    if-eqz v0, :cond_7f

    .line 61
    iget-object v0, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mListener:Lcom/yalantis/ucrop/util/RotationGestureDetector$OnRotationGestureListener;

    invoke-interface {v0, p0}, Lcom/yalantis/ucrop/util/RotationGestureDetector$OnRotationGestureListener;->onRotation(Lcom/yalantis/ucrop/util/RotationGestureDetector;)Z

    .line 63
    :cond_7f
    iput v5, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->fX:F

    .line 64
    iput v6, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->fY:F

    .line 65
    iput v7, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->sX:F

    .line 66
    iput v8, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->sY:F

    goto :goto_b

    .line 57
    :cond_88
    iget v1, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->fX:F

    iget v2, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->fY:F

    iget v3, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->sX:F

    iget v4, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->sY:F

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/yalantis/ucrop/util/RotationGestureDetector;->calculateAngleBetweenLines(FFFFFFFF)F

    goto :goto_76

    .line 70
    .end local v5    # "nfX":F
    .end local v6    # "nfY":F
    .end local v7    # "nsX":F
    .end local v8    # "nsY":F
    :pswitch_95
    iput v1, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mPointerIndex1:I

    goto/16 :goto_b

    .line 73
    :pswitch_99
    iput v1, p0, Lcom/yalantis/ucrop/util/RotationGestureDetector;->mPointerIndex2:I

    goto/16 :goto_b

    .line 29
    nop

    :pswitch_data_9e
    .packed-switch 0x0
        :pswitch_c
        :pswitch_95
        :pswitch_46
        :pswitch_b
        :pswitch_b
        :pswitch_27
        :pswitch_99
    .end packed-switch
.end method
