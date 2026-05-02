.class public Lorg/metalev/multitouch/controller/MultiTouchController;
.super Ljava/lang/Object;
.source "MultiTouchController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;,
        Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;,
        Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static ACTION_POINTER_INDEX_SHIFT:I = 0x0

.field private static ACTION_POINTER_UP:I = 0x0

.field public static final DEBUG:Z = false

.field private static final EVENT_SETTLE_TIME_INTERVAL:J = 0x14L

.field private static final MAX_MULTITOUCH_DIM_JUMP_SIZE:F = 40.0f

.field private static final MAX_MULTITOUCH_POS_JUMP_SIZE:F = 30.0f

.field public static final MAX_TOUCH_POINTS:I = 0x14

.field private static final MIN_MULTITOUCH_SEPARATION:F = 30.0f

.field private static final MODE_DRAG:I = 0x1

.field private static final MODE_NOTHING:I = 0x0

.field private static final MODE_PINCH:I = 0x2

.field private static m_getHistoricalPressure:Ljava/lang/reflect/Method;

.field private static m_getHistoricalX:Ljava/lang/reflect/Method;

.field private static m_getHistoricalY:Ljava/lang/reflect/Method;

.field private static m_getPointerCount:Ljava/lang/reflect/Method;

.field private static m_getPointerId:Ljava/lang/reflect/Method;

.field private static m_getPressure:Ljava/lang/reflect/Method;

.field private static m_getX:Ljava/lang/reflect/Method;

.field private static m_getY:Ljava/lang/reflect/Method;

.field public static final multiTouchSupported:Z

.field private static final pointerIds:[I

.field private static final pressureVals:[F

.field private static final xVals:[F

.field private static final yVals:[F


# instance fields
.field private handleSingleTouchEvents:Z

.field private mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

.field private mCurrPtAng:F

.field private mCurrPtDiam:F

.field private mCurrPtHeight:F

.field private mCurrPtWidth:F

.field private mCurrPtX:F

.field private mCurrPtY:F

.field private mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

.field private mMode:I

.field private mPrevPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

.field private mSettleEndTime:J

.field private mSettleStartTime:J

.field objectCanvas:Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas",
            "<TT;>;"
        }
    .end annotation
.end field

.field private selectedObject:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private startAngleMinusPinchAngle:F

.field private startPosX:F

.field private startPosY:F

.field private startScaleOverPinchDiam:F

.field private startScaleXOverPinchWidth:F

.field private startScaleYOverPinchHeight:F


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/16 v7, 0x14

    .line 211
    const/4 v2, 0x6

    sput v2, Lorg/metalev/multitouch/controller/MultiTouchController;->ACTION_POINTER_UP:I

    .line 212
    const/16 v2, 0x8

    sput v2, Lorg/metalev/multitouch/controller/MultiTouchController;->ACTION_POINTER_INDEX_SHIFT:I

    .line 215
    const/4 v1, 0x0

    .line 218
    .local v1, "succeeded":Z
    :try_start_a
    const-class v2, Landroid/view/MotionEvent;

    const-string v3, "getPointerCount"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Lorg/metalev/multitouch/controller/MultiTouchController;->m_getPointerCount:Ljava/lang/reflect/Method;

    .line 219
    const-class v2, Landroid/view/MotionEvent;

    const-string v3, "getPointerId"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Lorg/metalev/multitouch/controller/MultiTouchController;->m_getPointerId:Ljava/lang/reflect/Method;

    .line 220
    const-class v2, Landroid/view/MotionEvent;

    const-string v3, "getPressure"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Lorg/metalev/multitouch/controller/MultiTouchController;->m_getPressure:Ljava/lang/reflect/Method;

    .line 221
    const-class v2, Landroid/view/MotionEvent;

    const-string v3, "getHistoricalX"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Lorg/metalev/multitouch/controller/MultiTouchController;->m_getHistoricalX:Ljava/lang/reflect/Method;

    .line 222
    const-class v2, Landroid/view/MotionEvent;

    const-string v3, "getHistoricalY"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Lorg/metalev/multitouch/controller/MultiTouchController;->m_getHistoricalY:Ljava/lang/reflect/Method;

    .line 223
    const-class v2, Landroid/view/MotionEvent;

    const-string v3, "getHistoricalPressure"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Lorg/metalev/multitouch/controller/MultiTouchController;->m_getHistoricalPressure:Ljava/lang/reflect/Method;

    .line 224
    const-class v2, Landroid/view/MotionEvent;

    const-string v3, "getX"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Lorg/metalev/multitouch/controller/MultiTouchController;->m_getX:Ljava/lang/reflect/Method;

    .line 225
    const-class v2, Landroid/view/MotionEvent;

    const-string v3, "getY"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Lorg/metalev/multitouch/controller/MultiTouchController;->m_getY:Ljava/lang/reflect/Method;
    :try_end_a4
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a4} :catch_da

    .line 226
    const/4 v1, 0x1

    .line 230
    :goto_a5
    sput-boolean v1, Lorg/metalev/multitouch/controller/MultiTouchController;->multiTouchSupported:Z

    .line 231
    sget-boolean v2, Lorg/metalev/multitouch/controller/MultiTouchController;->multiTouchSupported:Z

    if-eqz v2, :cond_c9

    .line 235
    :try_start_ab
    const-class v2, Landroid/view/MotionEvent;

    const-string v3, "ACTION_POINTER_UP"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    sput v2, Lorg/metalev/multitouch/controller/MultiTouchController;->ACTION_POINTER_UP:I

    .line 236
    const-class v2, Landroid/view/MotionEvent;

    const-string v3, "ACTION_POINTER_INDEX_SHIFT"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    sput v2, Lorg/metalev/multitouch/controller/MultiTouchController;->ACTION_POINTER_INDEX_SHIFT:I
    :try_end_c9
    .catch Ljava/lang/Exception; {:try_start_ab .. :try_end_c9} :catch_e3

    .line 244
    :cond_c9
    :goto_c9
    new-array v2, v7, [F

    sput-object v2, Lorg/metalev/multitouch/controller/MultiTouchController;->xVals:[F

    .line 245
    new-array v2, v7, [F

    sput-object v2, Lorg/metalev/multitouch/controller/MultiTouchController;->yVals:[F

    .line 246
    new-array v2, v7, [F

    sput-object v2, Lorg/metalev/multitouch/controller/MultiTouchController;->pressureVals:[F

    .line 247
    new-array v2, v7, [I

    sput-object v2, Lorg/metalev/multitouch/controller/MultiTouchController;->pointerIds:[I

    return-void

    .line 227
    :catch_da
    move-exception v0

    .line 228
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "MultiTouchController"

    const-string v3, "static initializer failed"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_a5

    .line 237
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_e3
    move-exception v2

    goto :goto_c9
.end method

.method public constructor <init>(Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 173
    .local p0, "this":Lorg/metalev/multitouch/controller/MultiTouchController;, "Lorg/metalev/multitouch/controller/MultiTouchController<TT;>;"
    .local p1, "objectCanvas":Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;, "Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas<TT;>;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/metalev/multitouch/controller/MultiTouchController;-><init>(Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;Z)V

    .line 174
    return-void
.end method

.method public constructor <init>(Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;Z)V
    .registers 4
    .param p2, "handleSingleTouchEvents"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas",
            "<TT;>;Z)V"
        }
    .end annotation

    .prologue
    .line 177
    .local p0, "this":Lorg/metalev/multitouch/controller/MultiTouchController;, "Lorg/metalev/multitouch/controller/MultiTouchController<TT;>;"
    .local p1, "objectCanvas":Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;, "Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->selectedObject:Ljava/lang/Object;

    .line 141
    new-instance v0, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    invoke-direct {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;-><init>()V

    iput-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    .line 167
    const/4 v0, 0x0

    iput v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mMode:I

    .line 178
    new-instance v0, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-direct {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;-><init>()V

    iput-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    .line 179
    new-instance v0, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-direct {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;-><init>()V

    iput-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mPrevPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    .line 180
    iput-boolean p2, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->handleSingleTouchEvents:Z

    .line 181
    iput-object p1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->objectCanvas:Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;

    .line 182
    return-void
.end method

.method private anchorAtThisPositionAndScale()V
    .registers 6

    .prologue
    .local p0, "this":Lorg/metalev/multitouch/controller/MultiTouchController;, "Lorg/metalev/multitouch/controller/MultiTouchController<TT;>;"
    const/high16 v2, 0x3f800000    # 1.0f

    .line 332
    iget-object v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->selectedObject:Ljava/lang/Object;

    if-nez v1, :cond_7

    .line 351
    :goto_6
    return-void

    .line 336
    :cond_7
    iget-object v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->objectCanvas:Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;

    iget-object v3, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->selectedObject:Ljava/lang/Object;

    iget-object v4, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    invoke-interface {v1, v3, v4}, Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;->getPositionAndScale(Ljava/lang/Object;Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;)V

    .line 343
    iget-object v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    # getter for: Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->updateScale:Z
    invoke-static {v1}, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->access$000(Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;)Z

    move-result v1

    if-nez v1, :cond_63

    move v1, v2

    :goto_19
    div-float v0, v2, v1

    .line 344
    .local v0, "currScaleInv":F
    invoke-direct {p0}, Lorg/metalev/multitouch/controller/MultiTouchController;->extractCurrPtInfo()V

    .line 345
    iget v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPtX:F

    iget-object v2, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    # getter for: Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->xOff:F
    invoke-static {v2}, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->access$500(Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;)F

    move-result v2

    sub-float/2addr v1, v2

    mul-float/2addr v1, v0

    iput v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->startPosX:F

    .line 346
    iget v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPtY:F

    iget-object v2, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    # getter for: Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->yOff:F
    invoke-static {v2}, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->access$600(Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;)F

    move-result v2

    sub-float/2addr v1, v2

    mul-float/2addr v1, v0

    iput v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->startPosY:F

    .line 347
    iget-object v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    # getter for: Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->scale:F
    invoke-static {v1}, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->access$400(Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;)F

    move-result v1

    iget v2, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPtDiam:F

    div-float/2addr v1, v2

    iput v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->startScaleOverPinchDiam:F

    .line 348
    iget-object v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    # getter for: Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->scaleX:F
    invoke-static {v1}, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->access$700(Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;)F

    move-result v1

    iget v2, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPtWidth:F

    div-float/2addr v1, v2

    iput v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->startScaleXOverPinchWidth:F

    .line 349
    iget-object v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    # getter for: Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->scaleY:F
    invoke-static {v1}, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->access$800(Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;)F

    move-result v1

    iget v2, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPtHeight:F

    div-float/2addr v1, v2

    iput v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->startScaleYOverPinchHeight:F

    .line 350
    iget-object v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    # getter for: Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->angle:F
    invoke-static {v1}, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->access$900(Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;)F

    move-result v1

    iget v2, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPtAng:F

    sub-float/2addr v1, v2

    iput v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->startAngleMinusPinchAngle:F

    goto :goto_6

    .line 343
    .end local v0    # "currScaleInv":F
    :cond_63
    iget-object v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    # getter for: Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->scale:F
    invoke-static {v1}, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->access$400(Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;)F

    move-result v1

    const/4 v3, 0x0

    cmpl-float v1, v1, v3

    if-nez v1, :cond_70

    move v1, v2

    goto :goto_19

    :cond_70
    iget-object v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    # getter for: Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->scale:F
    invoke-static {v1}, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->access$400(Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;)F

    move-result v1

    goto :goto_19
.end method

.method private decodeTouchEvent(I[F[F[F[IIZJ)V
    .registers 21
    .param p1, "pointerCount"    # I
    .param p2, "x"    # [F
    .param p3, "y"    # [F
    .param p4, "pressure"    # [F
    .param p5, "pointerIds"    # [I
    .param p6, "action"    # I
    .param p7, "down"    # Z
    .param p8, "eventTime"    # J

    .prologue
    .line 318
    .local p0, "this":Lorg/metalev/multitouch/controller/MultiTouchController;, "Lorg/metalev/multitouch/controller/MultiTouchController<TT;>;"
    iget-object v10, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mPrevPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    .line 319
    .local v10, "tmp":Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    iput-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mPrevPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    .line 320
    iput-object v10, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    .line 322
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move-wide/from16 v8, p8

    # invokes: Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->set(I[F[F[F[IIZJ)V
    invoke-static/range {v0 .. v9}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->access$300(Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;I[F[F[F[IIZJ)V

    .line 323
    invoke-direct {p0}, Lorg/metalev/multitouch/controller/MultiTouchController;->multiTouchController()V

    .line 324
    return-void
.end method

.method private extractCurrPtInfo()V
    .registers 5

    .prologue
    .local p0, "this":Lorg/metalev/multitouch/controller/MultiTouchController;, "Lorg/metalev/multitouch/controller/MultiTouchController<TT;>;"
    const/high16 v3, 0x41f00000    # 30.0f

    const/4 v1, 0x0

    .line 124
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getX()F

    move-result v0

    iput v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPtX:F

    .line 125
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getY()F

    move-result v0

    iput v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPtY:F

    .line 126
    const v2, 0x41aa6666    # 21.3f

    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    # getter for: Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->updateScale:Z
    invoke-static {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->access$000(Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;)Z

    move-result v0

    if-nez v0, :cond_4e

    move v0, v1

    :goto_1f
    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPtDiam:F

    .line 127
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    # getter for: Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->updateScaleXY:Z
    invoke-static {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->access$100(Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;)Z

    move-result v0

    if-nez v0, :cond_55

    move v0, v1

    :goto_2e
    invoke-static {v3, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPtWidth:F

    .line 128
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    # getter for: Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->updateScaleXY:Z
    invoke-static {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->access$100(Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;)Z

    move-result v0

    if-nez v0, :cond_5c

    move v0, v1

    :goto_3d
    invoke-static {v3, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPtHeight:F

    .line 129
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    # getter for: Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->updateAngle:Z
    invoke-static {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->access$200(Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;)Z

    move-result v0

    if-nez v0, :cond_63

    :goto_4b
    iput v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPtAng:F

    .line 130
    return-void

    .line 126
    :cond_4e
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getMultiTouchDiameter()F

    move-result v0

    goto :goto_1f

    .line 127
    :cond_55
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getMultiTouchWidth()F

    move-result v0

    goto :goto_2e

    .line 128
    :cond_5c
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getMultiTouchHeight()F

    move-result v0

    goto :goto_3d

    .line 129
    :cond_63
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getMultiTouchAngle()F

    move-result v1

    goto :goto_4b
.end method

.method private multiTouchController()V
    .registers 8

    .prologue
    .local p0, "this":Lorg/metalev/multitouch/controller/MultiTouchController;, "Lorg/metalev/multitouch/controller/MultiTouchController<TT;>;"
    const/4 v1, 0x0

    const/high16 v6, 0x42200000    # 40.0f

    const/high16 v5, 0x41f00000    # 30.0f

    const/high16 v4, 0x3f000000    # 0.5f

    const-wide/16 v2, 0x14

    .line 391
    iget v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mMode:I

    packed-switch v0, :pswitch_data_13e

    .line 486
    :cond_e
    :goto_e
    return-void

    .line 396
    :pswitch_f
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->isDown()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 398
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->objectCanvas:Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;

    iget-object v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-interface {v0, v1}, Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;->getDraggableObjectAtPoint(Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->selectedObject:Ljava/lang/Object;

    .line 399
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->selectedObject:Ljava/lang/Object;

    if-eqz v0, :cond_e

    .line 401
    const/4 v0, 0x1

    iput v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mMode:I

    .line 402
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->objectCanvas:Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;

    iget-object v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->selectedObject:Ljava/lang/Object;

    iget-object v2, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-interface {v0, v1, v2}, Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;->selectObject(Ljava/lang/Object;Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;)V

    .line 403
    invoke-direct {p0}, Lorg/metalev/multitouch/controller/MultiTouchController;->anchorAtThisPositionAndScale()V

    .line 405
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getEventTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mSettleEndTime:J

    iput-wide v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mSettleStartTime:J

    goto :goto_e

    .line 414
    :pswitch_3f
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->isDown()Z

    move-result v0

    if-nez v0, :cond_54

    .line 416
    iput v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mMode:I

    .line 417
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->objectCanvas:Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->selectedObject:Ljava/lang/Object;

    iget-object v2, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-interface {v0, v1, v2}, Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;->selectObject(Ljava/lang/Object;Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;)V

    goto :goto_e

    .line 419
    :cond_54
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->isMultiTouch()Z

    move-result v0

    if-eqz v0, :cond_70

    .line 421
    const/4 v0, 0x2

    iput v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mMode:I

    .line 423
    invoke-direct {p0}, Lorg/metalev/multitouch/controller/MultiTouchController;->anchorAtThisPositionAndScale()V

    .line 425
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getEventTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mSettleStartTime:J

    .line 426
    iget-wide v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mSettleStartTime:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mSettleEndTime:J

    goto :goto_e

    .line 430
    :cond_70
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getEventTime()J

    move-result-wide v0

    iget-wide v2, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mSettleEndTime:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_80

    .line 433
    invoke-direct {p0}, Lorg/metalev/multitouch/controller/MultiTouchController;->anchorAtThisPositionAndScale()V

    goto :goto_e

    .line 436
    :cond_80
    invoke-direct {p0}, Lorg/metalev/multitouch/controller/MultiTouchController;->performDragOrPinch()V

    goto :goto_e

    .line 445
    :pswitch_84
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->isMultiTouch()Z

    move-result v0

    if-eqz v0, :cond_94

    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->isDown()Z

    move-result v0

    if-nez v0, :cond_bf

    .line 448
    :cond_94
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->isDown()Z

    move-result v0

    if-nez v0, :cond_aa

    .line 450
    iput v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mMode:I

    .line 451
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->objectCanvas:Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->selectedObject:Ljava/lang/Object;

    iget-object v2, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-interface {v0, v1, v2}, Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;->selectObject(Ljava/lang/Object;Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;)V

    goto/16 :goto_e

    .line 455
    :cond_aa
    const/4 v0, 0x1

    iput v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mMode:I

    .line 457
    invoke-direct {p0}, Lorg/metalev/multitouch/controller/MultiTouchController;->anchorAtThisPositionAndScale()V

    .line 459
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getEventTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mSettleStartTime:J

    .line 460
    iget-wide v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mSettleStartTime:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mSettleEndTime:J

    goto/16 :goto_e

    .line 465
    :cond_bf
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getX()F

    move-result v0

    iget-object v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mPrevPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v1}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getX()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpl-float v0, v0, v5

    if-gtz v0, :cond_115

    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getY()F

    move-result v0

    iget-object v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mPrevPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v1}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getY()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpl-float v0, v0, v5

    if-gtz v0, :cond_115

    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getMultiTouchWidth()F

    move-result v0

    iget-object v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mPrevPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v1}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getMultiTouchWidth()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    mul-float/2addr v0, v4

    cmpl-float v0, v0, v6

    if-gtz v0, :cond_115

    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getMultiTouchHeight()F

    move-result v0

    iget-object v1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mPrevPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v1}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getMultiTouchHeight()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    mul-float/2addr v0, v4

    cmpl-float v0, v0, v6

    if-lez v0, :cond_127

    .line 470
    :cond_115
    invoke-direct {p0}, Lorg/metalev/multitouch/controller/MultiTouchController;->anchorAtThisPositionAndScale()V

    .line 471
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getEventTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mSettleStartTime:J

    .line 472
    iget-wide v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mSettleStartTime:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mSettleEndTime:J

    goto/16 :goto_e

    .line 474
    :cond_127
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    # getter for: Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->eventTime:J
    invoke-static {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->access$1000(Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;)J

    move-result-wide v0

    iget-wide v2, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mSettleEndTime:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_138

    .line 476
    invoke-direct {p0}, Lorg/metalev/multitouch/controller/MultiTouchController;->anchorAtThisPositionAndScale()V

    goto/16 :goto_e

    .line 479
    :cond_138
    invoke-direct {p0}, Lorg/metalev/multitouch/controller/MultiTouchController;->performDragOrPinch()V

    goto/16 :goto_e

    .line 391
    nop

    :pswitch_data_13e
    .packed-switch 0x0
        :pswitch_f
        :pswitch_3f
        :pswitch_84
    .end packed-switch
.end method

.method private performDragOrPinch()V
    .registers 13

    .prologue
    .local p0, "this":Lorg/metalev/multitouch/controller/MultiTouchController;, "Lorg/metalev/multitouch/controller/MultiTouchController<TT;>;"
    const/high16 v7, 0x3f800000    # 1.0f

    .line 356
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->selectedObject:Ljava/lang/Object;

    if-nez v0, :cond_7

    .line 375
    :cond_6
    :goto_6
    return-void

    .line 360
    :cond_7
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    # getter for: Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->updateScale:Z
    invoke-static {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->access$000(Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;)Z

    move-result v0

    if-nez v0, :cond_4c

    .line 361
    .local v7, "currScale":F
    :cond_f
    :goto_f
    invoke-direct {p0}, Lorg/metalev/multitouch/controller/MultiTouchController;->extractCurrPtInfo()V

    .line 362
    iget v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPtX:F

    iget v9, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->startPosX:F

    mul-float/2addr v9, v7

    sub-float v1, v0, v9

    .line 363
    .local v1, "newPosX":F
    iget v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPtY:F

    iget v9, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->startPosY:F

    mul-float/2addr v9, v7

    sub-float v2, v0, v9

    .line 364
    .local v2, "newPosY":F
    iget v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->startScaleOverPinchDiam:F

    iget v9, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPtDiam:F

    mul-float v3, v0, v9

    .line 365
    .local v3, "newScale":F
    iget v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->startScaleXOverPinchWidth:F

    iget v9, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPtWidth:F

    mul-float v4, v0, v9

    .line 366
    .local v4, "newScaleX":F
    iget v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->startScaleYOverPinchHeight:F

    iget v9, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPtHeight:F

    mul-float v5, v0, v9

    .line 367
    .local v5, "newScaleY":F
    iget v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->startAngleMinusPinchAngle:F

    iget v9, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPtAng:F

    add-float v6, v0, v9

    .line 370
    .local v6, "newAngle":F
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    invoke-virtual/range {v0 .. v6}, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->set(FFFFFF)V

    .line 372
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->objectCanvas:Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;

    iget-object v9, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->selectedObject:Ljava/lang/Object;

    iget-object v10, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    iget-object v11, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrPt:Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    invoke-interface {v0, v9, v10, v11}, Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;->setPositionAndScale(Ljava/lang/Object;Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;)Z

    move-result v8

    .line 373
    .local v8, "success":Z
    if-nez v8, :cond_6

    goto :goto_6

    .line 360
    .end local v1    # "newPosX":F
    .end local v2    # "newPosY":F
    .end local v3    # "newScale":F
    .end local v4    # "newScaleX":F
    .end local v5    # "newScaleY":F
    .end local v6    # "newAngle":F
    .end local v7    # "currScale":F
    .end local v8    # "success":Z
    :cond_4c
    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    # getter for: Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->scale:F
    invoke-static {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->access$400(Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;)F

    move-result v0

    const/4 v9, 0x0

    cmpl-float v0, v0, v9

    if-eqz v0, :cond_f

    iget-object v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mCurrXform:Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    # getter for: Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->scale:F
    invoke-static {v0}, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->access$400(Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;)F

    move-result v7

    goto :goto_f
.end method


# virtual methods
.method protected getHandleSingleTouchEvents()Z
    .registers 2

    .prologue
    .line 197
    .local p0, "this":Lorg/metalev/multitouch/controller/MultiTouchController;, "Lorg/metalev/multitouch/controller/MultiTouchController<TT;>;"
    iget-boolean v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->handleSingleTouchEvents:Z

    return v0
.end method

.method public getMode()I
    .registers 2

    .prologue
    .line 489
    .local p0, "this":Lorg/metalev/multitouch/controller/MultiTouchController;, "Lorg/metalev/multitouch/controller/MultiTouchController<TT;>;"
    iget v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mMode:I

    return v0
.end method

.method public isPinching()Z
    .registers 3

    .prologue
    .line 379
    .local p0, "this":Lorg/metalev/multitouch/controller/MultiTouchController;, "Lorg/metalev/multitouch/controller/MultiTouchController<TT;>;"
    iget v0, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->mMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 21
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 253
    .local p0, "this":Lorg/metalev/multitouch/controller/MultiTouchController;, "Lorg/metalev/multitouch/controller/MultiTouchController<TT;>;"
    :try_start_0
    sget-boolean v1, Lorg/metalev/multitouch/controller/MultiTouchController;->multiTouchSupported:Z

    if-eqz v1, :cond_26

    sget-object v1, Lorg/metalev/multitouch/controller/MultiTouchController;->m_getPointerCount:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    move-object/from16 v0, p1

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 256
    .local v2, "pointerCount":I
    :goto_15
    move-object/from16 v0, p0

    iget v1, v0, Lorg/metalev/multitouch/controller/MultiTouchController;->mMode:I

    if-nez v1, :cond_28

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lorg/metalev/multitouch/controller/MultiTouchController;->handleSingleTouchEvents:Z

    if-nez v1, :cond_28

    const/4 v1, 0x1

    if-ne v2, v1, :cond_28

    .line 258
    const/4 v1, 0x0

    .line 309
    .end local v2    # "pointerCount":I
    :goto_25
    return v1

    .line 253
    :cond_26
    const/4 v2, 0x1

    goto :goto_15

    .line 263
    .restart local v2    # "pointerCount":I
    :cond_28
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v11

    .line 264
    .local v11, "action":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getHistorySize()I

    move-result v1

    div-int v14, v1, v2

    .line 265
    .local v14, "histLen":I
    const/4 v13, 0x0

    .local v13, "histIdx":I
    :goto_33
    if-gt v13, v14, :cond_191

    .line 267
    if-ge v13, v14, :cond_85

    const/16 v16, 0x1

    .line 268
    .local v16, "processingHist":Z
    :goto_39
    sget-boolean v1, Lorg/metalev/multitouch/controller/MultiTouchController;->multiTouchSupported:Z

    if-eqz v1, :cond_40

    const/4 v1, 0x1

    if-ne v2, v1, :cond_97

    .line 274
    :cond_40
    sget-object v3, Lorg/metalev/multitouch/controller/MultiTouchController;->xVals:[F

    const/4 v4, 0x0

    if-eqz v16, :cond_88

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/view/MotionEvent;->getHistoricalX(I)F

    move-result v1

    :goto_4b
    aput v1, v3, v4

    .line 275
    sget-object v3, Lorg/metalev/multitouch/controller/MultiTouchController;->yVals:[F

    const/4 v4, 0x0

    if-eqz v16, :cond_8d

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/view/MotionEvent;->getHistoricalY(I)F

    move-result v1

    :goto_58
    aput v1, v3, v4

    .line 276
    sget-object v3, Lorg/metalev/multitouch/controller/MultiTouchController;->pressureVals:[F

    const/4 v4, 0x0

    if-eqz v16, :cond_92

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/view/MotionEvent;->getHistoricalPressure(I)F

    move-result v1

    :goto_65
    aput v1, v3, v4

    .line 297
    :cond_67
    sget-object v3, Lorg/metalev/multitouch/controller/MultiTouchController;->xVals:[F

    sget-object v4, Lorg/metalev/multitouch/controller/MultiTouchController;->yVals:[F

    sget-object v5, Lorg/metalev/multitouch/controller/MultiTouchController;->pressureVals:[F

    sget-object v6, Lorg/metalev/multitouch/controller/MultiTouchController;->pointerIds:[I

    if-eqz v16, :cond_171

    const/4 v7, 0x2

    :goto_72
    if-eqz v16, :cond_174

    const/4 v8, 0x1

    :goto_75
    if-eqz v16, :cond_18b

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/view/MotionEvent;->getHistoricalEventTime(I)J

    move-result-wide v9

    :goto_7d
    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v10}, Lorg/metalev/multitouch/controller/MultiTouchController;->decodeTouchEvent(I[F[F[F[IIZJ)V

    .line 265
    add-int/lit8 v13, v13, 0x1

    goto :goto_33

    .line 267
    .end local v16    # "processingHist":Z
    :cond_85
    const/16 v16, 0x0

    goto :goto_39

    .line 274
    .restart local v16    # "processingHist":Z
    :cond_88
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    goto :goto_4b

    .line 275
    :cond_8d
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    goto :goto_58

    .line 276
    :cond_92
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPressure()F

    move-result v1

    goto :goto_65

    .line 281
    :cond_97
    const/16 v1, 0x14

    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result v15

    .line 284
    .local v15, "numPointers":I
    const/16 v18, 0x0

    .local v18, "ptrIdx":I
    :goto_9f
    move/from16 v0, v18

    if-ge v0, v15, :cond_67

    .line 285
    sget-object v1, Lorg/metalev/multitouch/controller/MultiTouchController;->m_getPointerId:Ljava/lang/reflect/Method;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    move-object/from16 v0, p1

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v17

    .line 286
    .local v17, "ptrId":I
    sget-object v1, Lorg/metalev/multitouch/controller/MultiTouchController;->pointerIds:[I

    aput v17, v1, v18

    .line 290
    sget-object v3, Lorg/metalev/multitouch/controller/MultiTouchController;->xVals:[F

    if-eqz v16, :cond_138

    sget-object v1, Lorg/metalev/multitouch/controller/MultiTouchController;->m_getHistoricalX:Ljava/lang/reflect/Method;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    move-object/from16 v0, p1

    invoke-virtual {v1, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    :goto_dc
    check-cast v1, Ljava/lang/Float;

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    aput v1, v3, v18

    .line 291
    sget-object v3, Lorg/metalev/multitouch/controller/MultiTouchController;->yVals:[F

    if-eqz v16, :cond_14b

    sget-object v1, Lorg/metalev/multitouch/controller/MultiTouchController;->m_getHistoricalY:Ljava/lang/reflect/Method;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    move-object/from16 v0, p1

    invoke-virtual {v1, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    :goto_103
    check-cast v1, Ljava/lang/Float;

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    aput v1, v3, v18

    .line 292
    sget-object v3, Lorg/metalev/multitouch/controller/MultiTouchController;->pressureVals:[F

    if-eqz v16, :cond_15e

    sget-object v1, Lorg/metalev/multitouch/controller/MultiTouchController;->m_getHistoricalPressure:Ljava/lang/reflect/Method;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    move-object/from16 v0, p1

    invoke-virtual {v1, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    :goto_12a
    check-cast v1, Ljava/lang/Float;

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    aput v1, v3, v18

    .line 284
    add-int/lit8 v18, v18, 0x1

    goto/16 :goto_9f

    .line 290
    :cond_138
    sget-object v1, Lorg/metalev/multitouch/controller/MultiTouchController;->m_getX:Ljava/lang/reflect/Method;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    move-object/from16 v0, p1

    invoke-virtual {v1, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_dc

    .line 291
    :cond_14b
    sget-object v1, Lorg/metalev/multitouch/controller/MultiTouchController;->m_getY:Ljava/lang/reflect/Method;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    move-object/from16 v0, p1

    invoke-virtual {v1, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_103

    .line 292
    :cond_15e
    sget-object v1, Lorg/metalev/multitouch/controller/MultiTouchController;->m_getPressure:Ljava/lang/reflect/Method;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    move-object/from16 v0, p1

    invoke-virtual {v1, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_12a

    .end local v15    # "numPointers":I
    .end local v17    # "ptrId":I
    .end local v18    # "ptrIdx":I
    :cond_171
    move v7, v11

    .line 297
    goto/16 :goto_72

    :cond_174
    const/4 v1, 0x1

    if-eq v11, v1, :cond_188

    const/4 v1, 0x1

    sget v8, Lorg/metalev/multitouch/controller/MultiTouchController;->ACTION_POINTER_INDEX_SHIFT:I

    shl-int/2addr v1, v8

    add-int/lit8 v1, v1, -0x1

    and-int/2addr v1, v11

    sget v8, Lorg/metalev/multitouch/controller/MultiTouchController;->ACTION_POINTER_UP:I

    if-eq v1, v8, :cond_188

    const/4 v1, 0x3

    if-eq v11, v1, :cond_188

    const/4 v8, 0x1

    goto/16 :goto_75

    :cond_188
    const/4 v8, 0x0

    goto/16 :goto_75

    :cond_18b
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J
    :try_end_18e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_18e} :catch_194

    move-result-wide v9

    goto/16 :goto_7d

    .line 305
    .end local v16    # "processingHist":Z
    :cond_191
    const/4 v1, 0x1

    goto/16 :goto_25

    .line 306
    .end local v2    # "pointerCount":I
    .end local v11    # "action":I
    .end local v13    # "histIdx":I
    .end local v14    # "histLen":I
    :catch_194
    move-exception v12

    .line 308
    .local v12, "e":Ljava/lang/Exception;
    const-string v1, "MultiTouchController"

    const-string v3, "onTouchEvent() failed"

    invoke-static {v1, v3, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 309
    const/4 v1, 0x0

    goto/16 :goto_25
.end method

.method protected setHandleSingleTouchEvents(Z)V
    .registers 2
    .param p1, "handleSingleTouchEvents"    # Z

    .prologue
    .line 190
    .local p0, "this":Lorg/metalev/multitouch/controller/MultiTouchController;, "Lorg/metalev/multitouch/controller/MultiTouchController<TT;>;"
    iput-boolean p1, p0, Lorg/metalev/multitouch/controller/MultiTouchController;->handleSingleTouchEvents:Z

    .line 191
    return-void
.end method
