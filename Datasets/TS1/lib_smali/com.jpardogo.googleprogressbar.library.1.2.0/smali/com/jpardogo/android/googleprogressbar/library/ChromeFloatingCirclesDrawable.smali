.class public Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "ChromeFloatingCirclesDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$1;,
        Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$Builder;,
        Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;
    }
.end annotation


# static fields
.field private static final ACCELERATION_LEVEL:I = 0x2

.field private static final ALPHA_OPAQUE:I = 0xff

.field private static final CENT_LEVEL:I = 0x1388

.field private static final MAX_LEVEL:I = 0x2710

.field private static final MID_LEVEL:I = 0x9c4


# instance fields
.field private acceleration:I

.field private colorSign:I

.field private currentProgressStates:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

.field private distance:D

.field private mAlpha:I

.field private mArrowPoints:[Landroid/graphics/Point;

.field private mColorFilter:Landroid/graphics/ColorFilter;

.field private mPaint1:Landroid/graphics/Paint;

.field private mPaint2:Landroid/graphics/Paint;

.field private mPaint3:Landroid/graphics/Paint;

.field private mPaint4:Landroid/graphics/Paint;

.field private max_speed:D

.field private offset:I

.field private offsetPercentage:D

.field private unit:D

.field private width:I

.field private x_beg:I

.field private x_end:I

.field private y_beg:I

.field private y_end:I


# direct methods
.method public constructor <init>([I)V
    .registers 4
    .param p1, "colors"    # [I

    .prologue
    .line 58
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 29
    const/16 v0, 0xff

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mAlpha:I

    .line 42
    const/4 v0, 0x2

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->acceleration:I

    .line 43
    const-wide v0, 0x4157d78400000000L    # 6250000.0

    iput-wide v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->distance:D

    .line 49
    sget-object v0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;->GREEN_TOP:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->currentProgressStates:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

    .line 59
    invoke-direct {p0, p1}, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->initCirclesProgress([I)V

    .line 60
    return-void
.end method

.method private changeTopColor()V
    .registers 3

    .prologue
    .line 169
    sget-object v0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$1;->$SwitchMap$com$jpardogo$android$googleprogressbar$library$ChromeFloatingCirclesDrawable$ProgressStates:[I

    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->currentProgressStates:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

    invoke-virtual {v1}, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_22

    .line 183
    :goto_d
    return-void

    .line 171
    :pswitch_e
    sget-object v0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;->YELLOW_TOP:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->currentProgressStates:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

    goto :goto_d

    .line 174
    :pswitch_13
    sget-object v0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;->RED_TOP:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->currentProgressStates:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

    goto :goto_d

    .line 177
    :pswitch_18
    sget-object v0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;->BLUE_TOP:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->currentProgressStates:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

    goto :goto_d

    .line 180
    :pswitch_1d
    sget-object v0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;->GREEN_TOP:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->currentProgressStates:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

    goto :goto_d

    .line 169
    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_e
        :pswitch_13
        :pswitch_18
        :pswitch_1d
    .end packed-switch
.end method

.method private initCirclesProgress([I)V
    .registers 4
    .param p1, "colors"    # [I

    .prologue
    .line 64
    invoke-direct {p0, p1}, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->initColors([I)V

    .line 67
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mAlpha:I

    invoke-virtual {p0, v0}, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->setAlpha(I)V

    .line 68
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mColorFilter:Landroid/graphics/ColorFilter;

    invoke-virtual {p0, v0}, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 71
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->setAcceleration(I)V

    .line 72
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offsetPercentage:D

    .line 75
    const/4 v0, 0x1

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->colorSign:I

    .line 76
    return-void
.end method

.method private initColors([I)V
    .registers 5
    .param p1, "colors"    # [I

    .prologue
    const/4 v2, 0x1

    .line 80
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint1:Landroid/graphics/Paint;

    .line 81
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint1:Landroid/graphics/Paint;

    const/4 v1, 0x0

    aget v1, p1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 82
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint1:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 85
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint2:Landroid/graphics/Paint;

    .line 86
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint2:Landroid/graphics/Paint;

    aget v1, p1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 87
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint2:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 90
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint3:Landroid/graphics/Paint;

    .line 91
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint3:Landroid/graphics/Paint;

    const/4 v1, 0x2

    aget v1, p1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 92
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint3:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 95
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint4:Landroid/graphics/Paint;

    .line 96
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint4:Landroid/graphics/Paint;

    const/4 v1, 0x3

    aget v1, p1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 97
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint4:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 98
    return-void
.end method

.method private measureCircleProgress(II)V
    .registers 12
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    const/4 v8, 0x1

    const-wide/high16 v6, 0x4010000000000000L    # 4.0

    .line 216
    if-le p1, p2, :cond_87

    .line 218
    add-int/lit8 v0, p2, -0x1

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->width:I

    .line 219
    sub-int v0, p1, p2

    div-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->x_beg:I

    .line 220
    iput v8, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->y_beg:I

    .line 221
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->x_beg:I

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->width:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->x_end:I

    .line 222
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->width:I

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->y_end:I

    .line 232
    :goto_1e
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->width:I

    int-to-double v0, v0

    const-wide/high16 v2, 0x4014000000000000L    # 5.0

    div-double/2addr v0, v2

    iput-wide v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    .line 235
    const/4 v0, 0x4

    new-array v0, v0, [Landroid/graphics/Point;

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    .line 236
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    const/4 v1, 0x0

    new-instance v2, Landroid/graphics/Point;

    iget-wide v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    double-to-int v3, v3

    iget v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->x_beg:I

    add-int/2addr v3, v4

    iget-wide v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    double-to-int v4, v4

    iget v5, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->y_beg:I

    add-int/2addr v4, v5

    invoke-direct {v2, v3, v4}, Landroid/graphics/Point;-><init>(II)V

    aput-object v2, v0, v1

    .line 237
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    new-instance v1, Landroid/graphics/Point;

    iget-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    mul-double/2addr v2, v6

    double-to-int v2, v2

    iget v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->x_beg:I

    add-int/2addr v2, v3

    iget-wide v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    mul-double/2addr v3, v6

    double-to-int v3, v3

    iget v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->y_beg:I

    add-int/2addr v3, v4

    invoke-direct {v1, v2, v3}, Landroid/graphics/Point;-><init>(II)V

    aput-object v1, v0, v8

    .line 238
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    const/4 v1, 0x2

    new-instance v2, Landroid/graphics/Point;

    iget-wide v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    double-to-int v3, v3

    iget v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->x_beg:I

    add-int/2addr v3, v4

    iget-wide v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    mul-double/2addr v4, v6

    double-to-int v4, v4

    iget v5, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->y_beg:I

    add-int/2addr v4, v5

    invoke-direct {v2, v3, v4}, Landroid/graphics/Point;-><init>(II)V

    aput-object v2, v0, v1

    .line 239
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    const/4 v1, 0x3

    new-instance v2, Landroid/graphics/Point;

    iget-wide v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    mul-double/2addr v3, v6

    double-to-int v3, v3

    iget v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->x_beg:I

    add-int/2addr v3, v4

    iget-wide v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    double-to-int v4, v4

    iget v5, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->y_beg:I

    add-int/2addr v4, v5

    invoke-direct {v2, v3, v4}, Landroid/graphics/Point;-><init>(II)V

    aput-object v2, v0, v1

    .line 240
    return-void

    .line 226
    :cond_87
    add-int/lit8 v0, p1, -0x1

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->width:I

    .line 227
    iput v8, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->x_beg:I

    .line 228
    sub-int v0, p2, p1

    div-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->y_beg:I

    .line 229
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->width:I

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->x_end:I

    .line 230
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->y_beg:I

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->width:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->y_end:I

    goto/16 :goto_1e
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 188
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->currentProgressStates:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

    sget-object v1, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;->RED_TOP:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

    if-eq v0, v1, :cond_20

    .line 189
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v0, v0, v4

    iget v0, v0, Landroid/graphics/Point;->x:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v1, v1, v4

    iget v1, v1, Landroid/graphics/Point;->y:I

    int-to-float v1, v1

    iget-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    double-to-float v2, v2

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint1:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 190
    :cond_20
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->currentProgressStates:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

    sget-object v1, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;->BLUE_TOP:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

    if-eq v0, v1, :cond_3c

    .line 191
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v0, v0, v5

    iget v0, v0, Landroid/graphics/Point;->x:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v1, v1, v5

    iget v1, v1, Landroid/graphics/Point;->y:I

    int-to-float v1, v1

    iget-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    double-to-float v2, v2

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint2:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 192
    :cond_3c
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->currentProgressStates:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

    sget-object v1, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;->YELLOW_TOP:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

    if-eq v0, v1, :cond_58

    .line 193
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v0, v0, v6

    iget v0, v0, Landroid/graphics/Point;->x:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v1, v1, v6

    iget v1, v1, Landroid/graphics/Point;->y:I

    int-to-float v1, v1

    iget-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    double-to-float v2, v2

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint3:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 194
    :cond_58
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->currentProgressStates:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

    sget-object v1, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;->GREEN_TOP:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

    if-eq v0, v1, :cond_74

    .line 195
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v0, v0, v7

    iget v0, v0, Landroid/graphics/Point;->x:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v1, v1, v7

    iget v1, v1, Landroid/graphics/Point;->y:I

    int-to-float v1, v1

    iget-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    double-to-float v2, v2

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint4:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 198
    :cond_74
    sget-object v0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$1;->$SwitchMap$com$jpardogo$android$googleprogressbar$library$ChromeFloatingCirclesDrawable$ProgressStates:[I

    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->currentProgressStates:Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;

    invoke-virtual {v1}, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_de

    .line 212
    :goto_81
    return-void

    .line 200
    :pswitch_82
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v0, v0, v7

    iget v0, v0, Landroid/graphics/Point;->x:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v1, v1, v7

    iget v1, v1, Landroid/graphics/Point;->y:I

    int-to-float v1, v1

    iget-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    double-to-float v2, v2

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint4:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_81

    .line 203
    :pswitch_99
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v0, v0, v6

    iget v0, v0, Landroid/graphics/Point;->x:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v1, v1, v6

    iget v1, v1, Landroid/graphics/Point;->y:I

    int-to-float v1, v1

    iget-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    double-to-float v2, v2

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint3:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_81

    .line 206
    :pswitch_b0
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v0, v0, v4

    iget v0, v0, Landroid/graphics/Point;->x:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v1, v1, v4

    iget v1, v1, Landroid/graphics/Point;->y:I

    int-to-float v1, v1

    iget-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    double-to-float v2, v2

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint1:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_81

    .line 209
    :pswitch_c7
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v0, v0, v5

    iget v0, v0, Landroid/graphics/Point;->x:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v1, v1, v5

    iget v1, v1, Landroid/graphics/Point;->y:I

    int-to-float v1, v1

    iget-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    double-to-float v2, v2

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint2:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_81

    .line 198
    :pswitch_data_de
    .packed-switch 0x1
        :pswitch_82
        :pswitch_99
        :pswitch_b0
        :pswitch_c7
    .end packed-switch
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 267
    const/4 v0, -0x3

    return v0
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 272
    invoke-virtual {p0}, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    .line 273
    .local v0, "callback":Landroid/graphics/drawable/Drawable$Callback;
    if-eqz v0, :cond_9

    .line 274
    invoke-interface {v0, p0}, Landroid/graphics/drawable/Drawable$Callback;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 276
    :cond_9
    return-void
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .registers 4
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 102
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 103
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->measureCircleProgress(II)V

    .line 104
    return-void
.end method

.method protected onLevelChange(I)Z
    .registers 10
    .param p1, "level"    # I

    .prologue
    .line 112
    const/16 v2, 0x2710

    iget v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->acceleration:I

    div-int/2addr v2, v3

    rem-int/2addr p1, v2

    .line 114
    const/16 v2, 0x9c4

    iget v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->acceleration:I

    div-int/2addr v2, v3

    rem-int v1, p1, v2

    .line 115
    .local v1, "temp_level":I
    iget-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    const-wide/high16 v4, 0x4008000000000000L    # 3.0

    mul-double/2addr v2, v4

    double-to-int v0, v2

    .line 116
    .local v0, "ef_width":I
    const/16 v2, 0x1388

    iget v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->acceleration:I

    div-int/2addr v2, v3

    if-ge p1, v2, :cond_e5

    .line 117
    const/16 v2, 0x9c4

    iget v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->acceleration:I

    div-int/2addr v2, v3

    if-ge p1, v2, :cond_bc

    .line 119
    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->colorSign:I

    const/16 v3, 0xf

    if-ne v2, v3, :cond_2d

    .line 120
    invoke-direct {p0}, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->changeTopColor()V

    .line 121
    const/4 v2, 0x1

    iput v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->colorSign:I

    .line 124
    :cond_2d
    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    iget v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->acceleration:I

    int-to-double v4, v4

    mul-double/2addr v2, v4

    int-to-double v4, v1

    mul-double/2addr v2, v4

    int-to-double v4, v1

    mul-double/2addr v2, v4

    iget-wide v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->distance:D

    div-double/2addr v2, v4

    iput-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offsetPercentage:D

    .line 125
    iget-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offsetPercentage:D

    int-to-double v4, v0

    mul-double/2addr v2, v4

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    div-double/2addr v2, v4

    double-to-int v2, v2

    iput v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offset:I

    .line 160
    :goto_46
    iget-object v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    iget-wide v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    double-to-int v3, v3

    iget v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->x_beg:I

    add-int/2addr v3, v4

    iget v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offset:I

    add-int/2addr v3, v4

    iget-wide v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    double-to-int v4, v4

    iget v5, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->y_beg:I

    add-int/2addr v4, v5

    iget v5, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offset:I

    add-int/2addr v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Point;->set(II)V

    .line 161
    iget-object v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    const/4 v3, 0x1

    aget-object v2, v2, v3

    iget-wide v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    const-wide/high16 v5, 0x4010000000000000L    # 4.0

    mul-double/2addr v3, v5

    double-to-int v3, v3

    iget v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->x_beg:I

    add-int/2addr v3, v4

    iget v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offset:I

    sub-int/2addr v3, v4

    iget-wide v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    const-wide/high16 v6, 0x4010000000000000L    # 4.0

    mul-double/2addr v4, v6

    double-to-int v4, v4

    iget v5, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->y_beg:I

    add-int/2addr v4, v5

    iget v5, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offset:I

    sub-int/2addr v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Point;->set(II)V

    .line 162
    iget-object v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    const/4 v3, 0x2

    aget-object v2, v2, v3

    iget-wide v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    double-to-int v3, v3

    iget v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->x_beg:I

    add-int/2addr v3, v4

    iget v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offset:I

    add-int/2addr v3, v4

    iget-wide v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    const-wide/high16 v6, 0x4010000000000000L    # 4.0

    mul-double/2addr v4, v6

    double-to-int v4, v4

    iget v5, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->y_beg:I

    add-int/2addr v4, v5

    iget v5, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offset:I

    sub-int/2addr v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Point;->set(II)V

    .line 163
    iget-object v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mArrowPoints:[Landroid/graphics/Point;

    const/4 v3, 0x3

    aget-object v2, v2, v3

    iget-wide v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    const-wide/high16 v5, 0x4010000000000000L    # 4.0

    mul-double/2addr v3, v5

    double-to-int v3, v3

    iget v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->x_beg:I

    add-int/2addr v3, v4

    iget v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offset:I

    sub-int/2addr v3, v4

    iget-wide v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->unit:D

    double-to-int v4, v4

    iget v5, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->y_beg:I

    add-int/2addr v4, v5

    iget v5, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offset:I

    add-int/2addr v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Point;->set(II)V

    .line 165
    const/4 v2, 0x1

    return v2

    .line 129
    :cond_bc
    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->colorSign:I

    or-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->colorSign:I

    .line 131
    iget-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->max_speed:D

    int-to-double v4, v1

    mul-double/2addr v2, v4

    const-wide/high16 v4, 0x3fe0000000000000L    # 0.5

    iget v6, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->acceleration:I

    int-to-double v6, v6

    mul-double/2addr v4, v6

    int-to-double v6, v1

    mul-double/2addr v4, v6

    int-to-double v6, v1

    mul-double/2addr v4, v6

    sub-double/2addr v2, v4

    iget-wide v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->distance:D

    div-double/2addr v2, v4

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    add-double/2addr v2, v4

    iput-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offsetPercentage:D

    .line 134
    iget-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offsetPercentage:D

    int-to-double v4, v0

    mul-double/2addr v2, v4

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    div-double/2addr v2, v4

    double-to-int v2, v2

    iput v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offset:I

    goto/16 :goto_46

    .line 138
    :cond_e5
    const/16 v2, 0x1d4c

    iget v3, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->acceleration:I

    div-int/2addr v2, v3

    if-ge p1, v2, :cond_117

    .line 140
    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->colorSign:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_fa

    .line 141
    invoke-direct {p0}, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->changeTopColor()V

    .line 142
    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->colorSign:I

    or-int/lit8 v2, v2, 0x4

    iput v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->colorSign:I

    .line 145
    :cond_fa
    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    iget v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->acceleration:I

    int-to-double v4, v4

    mul-double/2addr v2, v4

    int-to-double v4, v1

    mul-double/2addr v2, v4

    int-to-double v4, v1

    mul-double/2addr v2, v4

    iget-wide v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->distance:D

    div-double/2addr v2, v4

    iput-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offsetPercentage:D

    .line 146
    int-to-double v2, v0

    iget-wide v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offsetPercentage:D

    int-to-double v6, v0

    mul-double/2addr v4, v6

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    div-double/2addr v4, v6

    sub-double/2addr v2, v4

    double-to-int v2, v2

    iput v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offset:I

    goto/16 :goto_46

    .line 150
    :cond_117
    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->colorSign:I

    or-int/lit8 v2, v2, 0x8

    iput v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->colorSign:I

    .line 152
    iget-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->max_speed:D

    int-to-double v4, v1

    mul-double/2addr v2, v4

    const-wide/high16 v4, 0x3fe0000000000000L    # 0.5

    iget v6, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->acceleration:I

    int-to-double v6, v6

    mul-double/2addr v4, v6

    int-to-double v6, v1

    mul-double/2addr v4, v6

    int-to-double v6, v1

    mul-double/2addr v4, v6

    sub-double/2addr v2, v4

    iget-wide v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->distance:D

    div-double/2addr v2, v4

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    add-double/2addr v2, v4

    iput-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offsetPercentage:D

    .line 155
    iget-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offsetPercentage:D

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    cmpl-double v2, v2, v4

    if-nez v2, :cond_14e

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    :goto_13e
    iput-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offsetPercentage:D

    .line 156
    int-to-double v2, v0

    iget-wide v4, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offsetPercentage:D

    int-to-double v6, v0

    mul-double/2addr v4, v6

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    div-double/2addr v4, v6

    sub-double/2addr v2, v4

    double-to-int v2, v2

    iput v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offset:I

    goto/16 :goto_46

    .line 155
    :cond_14e
    iget-wide v2, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->offsetPercentage:D

    goto :goto_13e
.end method

.method public scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .registers 6
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;
    .param p2, "what"    # Ljava/lang/Runnable;
    .param p3, "when"    # J

    .prologue
    .line 280
    invoke-virtual {p0}, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    .line 281
    .local v0, "callback":Landroid/graphics/drawable/Drawable$Callback;
    if-eqz v0, :cond_9

    .line 282
    invoke-interface {v0, p0, p2, p3, p4}, Landroid/graphics/drawable/Drawable$Callback;->scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V

    .line 284
    :cond_9
    return-void
.end method

.method public setAcceleration(I)V
    .registers 7
    .param p1, "acceleration"    # I

    .prologue
    const/16 v4, 0x9c4

    .line 243
    iput p1, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->acceleration:I

    .line 244
    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    int-to-double v2, p1

    mul-double/2addr v0, v2

    div-int v2, v4, p1

    int-to-double v2, v2

    mul-double/2addr v0, v2

    div-int v2, v4, p1

    int-to-double v2, v2

    mul-double/2addr v0, v2

    iput-wide v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->distance:D

    .line 245
    div-int v0, v4, p1

    mul-int/2addr v0, p1

    int-to-double v0, v0

    iput-wide v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->max_speed:D

    .line 246
    return-void
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 250
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint1:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 251
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint2:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 252
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint3:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 253
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint4:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 254
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 258
    iput-object p1, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mColorFilter:Landroid/graphics/ColorFilter;

    .line 259
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint1:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 260
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint2:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 261
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint3:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 262
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->mPaint4:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 263
    return-void
.end method

.method public unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .registers 4
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;
    .param p2, "what"    # Ljava/lang/Runnable;

    .prologue
    .line 288
    invoke-virtual {p0}, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    .line 289
    .local v0, "callback":Landroid/graphics/drawable/Drawable$Callback;
    if-eqz v0, :cond_9

    .line 290
    invoke-interface {v0, p0, p2}, Landroid/graphics/drawable/Drawable$Callback;->unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V

    .line 292
    :cond_9
    return-void
.end method
