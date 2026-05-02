.class public Lcom/wdullaer/materialdatetimepicker/time/CircleView;
.super Landroid/view/View;
.source "CircleView.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CircleView"


# instance fields
.field private mAmPmCircleRadiusMultiplier:F

.field private mCircleColor:I

.field private mCircleRadius:I

.field private mCircleRadiusMultiplier:F

.field private mDotColor:I

.field private mDrawValuesReady:Z

.field private mIs24HourMode:Z

.field private mIsInitialized:Z

.field private final mPaint:Landroid/graphics/Paint;

.field private mXCenter:I

.field private mYCenter:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 34
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mPaint:Landroid/graphics/Paint;

    .line 50
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 51
    .local v0, "res":Landroid/content/res/Resources;
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_circle_color:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mCircleColor:I

    .line 52
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_numbers_text_color:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mDotColor:I

    .line 53
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mPaint:Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 55
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mIsInitialized:Z

    .line 56
    return-void
.end method


# virtual methods
.method public initialize(Landroid/content/Context;Z)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "is24HourMode"    # Z

    .prologue
    .line 59
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mIsInitialized:Z

    if-eqz v1, :cond_c

    .line 60
    const-string v1, "CircleView"

    const-string v2, "CircleView may only be initialized once."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    :goto_b
    return-void

    .line 64
    :cond_c
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 65
    .local v0, "res":Landroid/content/res/Resources;
    iput-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mIs24HourMode:Z

    .line 66
    if-eqz p2, :cond_24

    .line 67
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_circle_radius_multiplier_24HourMode:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mCircleRadiusMultiplier:F

    .line 76
    :goto_20
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mIsInitialized:Z

    goto :goto_b

    .line 70
    :cond_24
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_circle_radius_multiplier:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mCircleRadiusMultiplier:F

    .line 72
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_ampm_circle_radius_multiplier:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mAmPmCircleRadiusMultiplier:F

    goto :goto_20
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 93
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->getWidth()I

    move-result v1

    .line 94
    .local v1, "viewWidth":I
    if-eqz v1, :cond_a

    iget-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mIsInitialized:Z

    if-nez v2, :cond_b

    .line 121
    :cond_a
    :goto_a
    return-void

    .line 98
    :cond_b
    iget-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mDrawValuesReady:Z

    if-nez v2, :cond_47

    .line 99
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mXCenter:I

    .line 100
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mYCenter:I

    .line 101
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mXCenter:I

    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mYCenter:I

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    int-to-float v2, v2

    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mCircleRadiusMultiplier:F

    mul-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mCircleRadius:I

    .line 103
    iget-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mIs24HourMode:Z

    if-nez v2, :cond_44

    .line 107
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mCircleRadius:I

    int-to-float v2, v2

    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mAmPmCircleRadiusMultiplier:F

    mul-float/2addr v2, v3

    float-to-int v0, v2

    .line 108
    .local v0, "amPmCircleRadius":I
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mYCenter:I

    int-to-double v2, v2

    int-to-double v4, v0

    const-wide/high16 v6, 0x3fe8000000000000L    # 0.75

    mul-double/2addr v4, v6

    sub-double/2addr v2, v4

    double-to-int v2, v2

    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mYCenter:I

    .line 111
    .end local v0    # "amPmCircleRadius":I
    :cond_44
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mDrawValuesReady:Z

    .line 115
    :cond_47
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mPaint:Landroid/graphics/Paint;

    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mCircleColor:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 116
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mXCenter:I

    int-to-float v2, v2

    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mYCenter:I

    int-to-float v3, v3

    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mCircleRadius:I

    int-to-float v4, v4

    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 119
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mPaint:Landroid/graphics/Paint;

    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mDotColor:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 120
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mXCenter:I

    int-to-float v2, v2

    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mYCenter:I

    int-to-float v3, v3

    const/high16 v4, 0x40800000    # 4.0f

    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_a
.end method

.method setTheme(Landroid/content/Context;Z)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "dark"    # Z

    .prologue
    .line 80
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 81
    .local v0, "res":Landroid/content/res/Resources;
    if-eqz p2, :cond_17

    .line 82
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_dark_gray:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mCircleColor:I

    .line 83
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_white:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mDotColor:I

    .line 88
    :goto_16
    return-void

    .line 85
    :cond_17
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_circle_color:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mCircleColor:I

    .line 86
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_numbers_text_color:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->mDotColor:I

    goto :goto_16
.end method
