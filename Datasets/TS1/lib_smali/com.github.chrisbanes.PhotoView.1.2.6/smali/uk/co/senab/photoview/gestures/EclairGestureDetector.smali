.class public Luk/co/senab/photoview/gestures/EclairGestureDetector;
.super Luk/co/senab/photoview/gestures/CupcakeGestureDetector;
.source "EclairGestureDetector.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x5
.end annotation


# static fields
.field private static final INVALID_POINTER_ID:I = -0x1


# instance fields
.field private mActivePointerId:I

.field private mActivePointerIndex:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    invoke-direct {p0, p1}, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;-><init>(Landroid/content/Context;)V

    .line 28
    const/4 v0, -0x1

    iput v0, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerId:I

    .line 29
    const/4 v0, 0x0

    iput v0, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerIndex:I

    .line 33
    return-void
.end method


# virtual methods
.method getActiveX(Landroid/view/MotionEvent;)F
    .registers 4
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 38
    :try_start_0
    iget v1, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerIndex:I

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    .line 40
    :goto_6
    return v1

    .line 39
    :catch_7
    move-exception v0

    .line 40
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    goto :goto_6
.end method

.method getActiveY(Landroid/view/MotionEvent;)F
    .registers 4
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 47
    :try_start_0
    iget v1, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerIndex:I

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    .line 49
    :goto_6
    return v1

    .line 48
    :catch_7
    move-exception v0

    .line 49
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    goto :goto_6
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 11
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v5, 0x1

    const/4 v8, -0x1

    const/4 v6, 0x0

    .line 55
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 56
    .local v0, "action":I
    and-int/lit16 v7, v0, 0xff

    packed-switch v7, :pswitch_data_52

    .line 81
    :cond_c
    :goto_c
    :pswitch_c
    iget v7, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerId:I

    if-eq v7, v8, :cond_12

    iget v6, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerId:I

    :cond_12
    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v6

    iput v6, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerIndex:I

    .line 85
    :try_start_18
    invoke-super {p0, p1}, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z
    :try_end_1b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_18 .. :try_end_1b} :catch_4f

    move-result v5

    .line 88
    :goto_1c
    return v5

    .line 58
    :pswitch_1d
    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v7

    iput v7, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerId:I

    goto :goto_c

    .line 62
    :pswitch_24
    iput v8, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerId:I

    goto :goto_c

    .line 68
    :pswitch_27
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v7

    invoke-static {v7}, Luk/co/senab/photoview/Compat;->getPointerIndex(I)I

    move-result v4

    .line 69
    .local v4, "pointerIndex":I
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    .line 70
    .local v3, "pointerId":I
    iget v7, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerId:I

    if-ne v3, v7, :cond_c

    .line 73
    if-nez v4, :cond_4d

    move v2, v5

    .line 74
    .local v2, "newPointerIndex":I
    :goto_3a
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v7

    iput v7, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerId:I

    .line 75
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    iput v7, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mLastTouchX:F

    .line 76
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v7

    iput v7, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mLastTouchY:F

    goto :goto_c

    .end local v2    # "newPointerIndex":I
    :cond_4d
    move v2, v6

    .line 73
    goto :goto_3a

    .line 86
    .end local v3    # "pointerId":I
    .end local v4    # "pointerIndex":I
    :catch_4f
    move-exception v1

    .line 88
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    goto :goto_1c

    .line 56
    nop

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_24
        :pswitch_c
        :pswitch_24
        :pswitch_c
        :pswitch_c
        :pswitch_27
    .end packed-switch
.end method
