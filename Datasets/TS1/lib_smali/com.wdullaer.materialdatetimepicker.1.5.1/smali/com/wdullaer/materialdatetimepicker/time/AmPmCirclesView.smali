.class public Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;
.super Landroid/view/View;
.source "AmPmCirclesView.java"


# static fields
.field private static final AM:I = 0x0

.field private static final PM:I = 0x1

.field private static final SELECTED_ALPHA:I = 0xff

.field private static final SELECTED_ALPHA_THEME_DARK:I = 0xff

.field private static final TAG:Ljava/lang/String; = "AmPmCirclesView"


# instance fields
.field private mAmOrPm:I

.field private mAmOrPmPressed:I

.field private mAmPmCircleRadius:I

.field private mAmPmCircleRadiusMultiplier:F

.field private mAmPmSelectedTextColor:I

.field private mAmPmTextColor:I

.field private mAmPmYCenter:I

.field private mAmText:Ljava/lang/String;

.field private mAmXCenter:I

.field private mCircleRadiusMultiplier:F

.field private mDrawValuesReady:Z

.field private mIsInitialized:Z

.field private final mPaint:Landroid/graphics/Paint;

.field private mPmText:Ljava/lang/String;

.field private mPmXCenter:I

.field private mSelectedAlpha:I

.field private mSelectedColor:I

.field private mTouchedColor:I

.field private mUnselectedColor:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 68
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 43
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPaint:Landroid/graphics/Paint;

    .line 69
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mIsInitialized:Z

    .line 70
    return-void
.end method


# virtual methods
.method public getIsTouchingAmOrPm(FF)I
    .registers 9
    .param p1, "xCoord"    # F
    .param p2, "yCoord"    # F

    .prologue
    const/4 v3, -0x1

    .line 136
    iget-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mDrawValuesReady:Z

    if-nez v4, :cond_6

    .line 155
    :cond_5
    :goto_5
    return v3

    .line 140
    :cond_6
    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmYCenter:I

    int-to-float v4, v4

    sub-float v4, p2, v4

    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmYCenter:I

    int-to-float v5, v5

    sub-float v5, p2, v5

    mul-float/2addr v4, v5

    float-to-int v2, v4

    .line 142
    .local v2, "squaredYDistance":I
    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmXCenter:I

    int-to-float v4, v4

    sub-float v4, p1, v4

    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmXCenter:I

    int-to-float v5, v5

    sub-float v5, p1, v5

    mul-float/2addr v4, v5

    int-to-float v5, v2

    add-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    double-to-int v0, v4

    .line 144
    .local v0, "distanceToAmCenter":I
    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmCircleRadius:I

    if-gt v0, v4, :cond_2b

    .line 145
    const/4 v3, 0x0

    goto :goto_5

    .line 148
    :cond_2b
    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPmXCenter:I

    int-to-float v4, v4

    sub-float v4, p1, v4

    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPmXCenter:I

    int-to-float v5, v5

    sub-float v5, p1, v5

    mul-float/2addr v4, v5

    int-to-float v5, v2

    add-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    double-to-int v1, v4

    .line 150
    .local v1, "distanceToPmCenter":I
    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmCircleRadius:I

    if-gt v1, v4, :cond_5

    .line 151
    const/4 v3, 0x1

    goto :goto_5
.end method

.method public initialize(Landroid/content/Context;I)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "amOrPm"    # I

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 73
    iget-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mIsInitialized:Z

    if-eqz v4, :cond_e

    .line 74
    const-string v4, "AmPmCirclesView"

    const-string v5, "AmPmCirclesView may only be initialized once."

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    :goto_d
    return-void

    .line 78
    :cond_e
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 79
    .local v1, "res":Landroid/content/res/Resources;
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_white:I

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mUnselectedColor:I

    .line 80
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_accent_color:I

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mSelectedColor:I

    .line 81
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_accent_color_dark:I

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mTouchedColor:I

    .line 82
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_ampm_text_color:I

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmTextColor:I

    .line 83
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_white:I

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmSelectedTextColor:I

    .line 84
    const/16 v4, 0xff

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mSelectedAlpha:I

    .line 85
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_sans_serif:I

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 86
    .local v3, "typefaceFamily":Ljava/lang/String;
    invoke-static {v3, v7}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v2

    .line 87
    .local v2, "tf":Landroid/graphics/Typeface;
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 88
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 89
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 91
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_circle_radius_multiplier:I

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mCircleRadiusMultiplier:F

    .line 93
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_ampm_circle_radius_multiplier:I

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmCircleRadiusMultiplier:F

    .line 95
    new-instance v4, Ljava/text/DateFormatSymbols;

    invoke-direct {v4}, Ljava/text/DateFormatSymbols;-><init>()V

    invoke-virtual {v4}, Ljava/text/DateFormatSymbols;->getAmPmStrings()[Ljava/lang/String;

    move-result-object v0

    .line 96
    .local v0, "amPmTexts":[Ljava/lang/String;
    aget-object v4, v0, v7

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmText:Ljava/lang/String;

    .line 97
    aget-object v4, v0, v6

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPmText:Ljava/lang/String;

    .line 99
    invoke-virtual {p0, p2}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->setAmOrPm(I)V

    .line 100
    const/4 v4, -0x1

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmOrPmPressed:I

    .line 102
    iput-boolean v6, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mIsInitialized:Z

    goto :goto_d
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 25
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 160
    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->getWidth()I

    move-result v16

    .line 161
    .local v16, "viewWidth":I
    if-eqz v16, :cond_e

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mIsInitialized:Z

    move/from16 v17, v0

    if-nez v17, :cond_f

    .line 225
    :cond_e
    :goto_e
    return-void

    .line 165
    :cond_f
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mDrawValuesReady:Z

    move/from16 v17, v0

    if-nez v17, :cond_b4

    .line 166
    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->getWidth()I

    move-result v17

    div-int/lit8 v9, v17, 0x2

    .line 167
    .local v9, "layoutXCenter":I
    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->getHeight()I

    move-result v17

    div-int/lit8 v10, v17, 0x2

    .line 168
    .local v10, "layoutYCenter":I
    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v17

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mCircleRadiusMultiplier:F

    move/from16 v18, v0

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v8, v0

    .line 170
    .local v8, "circleRadius":I
    int-to-float v0, v8

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmCircleRadiusMultiplier:F

    move/from16 v18, v0

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmCircleRadius:I

    .line 171
    int-to-double v0, v10

    move-wide/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmCircleRadius:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-double v0, v0

    move-wide/from16 v19, v0

    const-wide/high16 v21, 0x3fe8000000000000L    # 0.75

    mul-double v19, v19, v21

    add-double v17, v17, v19

    move-wide/from16 v0, v17

    double-to-int v10, v0

    .line 172
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmCircleRadius:I

    move/from16 v17, v0

    mul-int/lit8 v17, v17, 0x3

    div-int/lit8 v14, v17, 0x4

    .line 173
    .local v14, "textSize":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v17, v0

    int-to-float v0, v14

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 176
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmCircleRadius:I

    move/from16 v17, v0

    div-int/lit8 v17, v17, 0x2

    sub-int v17, v10, v17

    add-int v17, v17, v8

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmYCenter:I

    .line 179
    sub-int v17, v9, v8

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmCircleRadius:I

    move/from16 v18, v0

    add-int v17, v17, v18

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmXCenter:I

    .line 180
    add-int v17, v9, v8

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmCircleRadius:I

    move/from16 v18, v0

    sub-int v17, v17, v18

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPmXCenter:I

    .line 182
    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mDrawValuesReady:Z

    .line 187
    .end local v8    # "circleRadius":I
    .end local v9    # "layoutXCenter":I
    .end local v10    # "layoutYCenter":I
    .end local v14    # "textSize":I
    :cond_b4
    move-object/from16 v0, p0

    iget v6, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mUnselectedColor:I

    .line 188
    .local v6, "amColor":I
    const/16 v5, 0xff

    .line 189
    .local v5, "amAlpha":I
    move-object/from16 v0, p0

    iget v7, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmTextColor:I

    .line 190
    .local v7, "amTextColor":I
    move-object/from16 v0, p0

    iget v12, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mUnselectedColor:I

    .line 191
    .local v12, "pmColor":I
    const/16 v11, 0xff

    .line 192
    .local v11, "pmAlpha":I
    move-object/from16 v0, p0

    iget v13, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmTextColor:I

    .line 194
    .local v13, "pmTextColor":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmOrPm:I

    move/from16 v17, v0

    if-nez v17, :cond_20b

    .line 195
    move-object/from16 v0, p0

    iget v6, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mSelectedColor:I

    .line 196
    move-object/from16 v0, p0

    iget v5, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mSelectedAlpha:I

    .line 197
    move-object/from16 v0, p0

    iget v7, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmSelectedTextColor:I

    .line 203
    :cond_dc
    :goto_dc
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmOrPmPressed:I

    move/from16 v17, v0

    if-nez v17, :cond_227

    .line 204
    move-object/from16 v0, p0

    iget v6, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mTouchedColor:I

    .line 205
    move-object/from16 v0, p0

    iget v5, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mSelectedAlpha:I

    .line 212
    :cond_ec
    :goto_ec
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 213
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 214
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmXCenter:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmYCenter:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmCircleRadius:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v20, v0

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    move/from16 v3, v19

    move-object/from16 v4, v20

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 215
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Landroid/graphics/Paint;->setColor(I)V

    .line 216
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 217
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPmXCenter:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmYCenter:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmCircleRadius:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v20, v0

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    move/from16 v3, v19

    move-object/from16 v4, v20

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 220
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 221
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmYCenter:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/graphics/Paint;->descent()F

    move-result v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/graphics/Paint;->ascent()F

    move-result v19

    add-float v18, v18, v19

    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v18, v0

    div-int/lit8 v18, v18, 0x2

    sub-int v15, v17, v18

    .line 222
    .local v15, "textYCenter":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmText:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmXCenter:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    int-to-float v0, v15

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v20, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move/from16 v2, v18

    move/from16 v3, v19

    move-object/from16 v4, v20

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 223
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Landroid/graphics/Paint;->setColor(I)V

    .line 224
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPmText:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPmXCenter:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    int-to-float v0, v15

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v20, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move/from16 v2, v18

    move/from16 v3, v19

    move-object/from16 v4, v20

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto/16 :goto_e

    .line 198
    .end local v15    # "textYCenter":I
    :cond_20b
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmOrPm:I

    move/from16 v17, v0

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_dc

    .line 199
    move-object/from16 v0, p0

    iget v12, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mSelectedColor:I

    .line 200
    move-object/from16 v0, p0

    iget v11, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mSelectedAlpha:I

    .line 201
    move-object/from16 v0, p0

    iget v13, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmSelectedTextColor:I

    goto/16 :goto_dc

    .line 206
    :cond_227
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmOrPmPressed:I

    move/from16 v17, v0

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_ec

    .line 207
    move-object/from16 v0, p0

    iget v12, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mTouchedColor:I

    .line 208
    move-object/from16 v0, p0

    iget v11, v0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mSelectedAlpha:I

    goto/16 :goto_ec
.end method

.method public setAccentColor(I)V
    .registers 2
    .param p1, "accentColor"    # I

    .prologue
    .line 121
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mSelectedColor:I

    .line 122
    return-void
.end method

.method public setAmOrPm(I)V
    .registers 2
    .param p1, "amOrPm"    # I

    .prologue
    .line 125
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmOrPm:I

    .line 126
    return-void
.end method

.method public setAmOrPmPressed(I)V
    .registers 2
    .param p1, "amOrPmPressed"    # I

    .prologue
    .line 129
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmOrPmPressed:I

    .line 130
    return-void
.end method

.method setTheme(Landroid/content/Context;Z)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "themeDark"    # Z

    .prologue
    const/16 v2, 0xff

    .line 106
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 107
    .local v0, "res":Landroid/content/res/Resources;
    if-eqz p2, :cond_23

    .line 108
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_circle_background_dark_theme:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mUnselectedColor:I

    .line 109
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_red:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mSelectedColor:I

    .line 110
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_white:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmTextColor:I

    .line 111
    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mSelectedAlpha:I

    .line 118
    :goto_22
    return-void

    .line 113
    :cond_23
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_white:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mUnselectedColor:I

    .line 114
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_accent_color:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mSelectedColor:I

    .line 115
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_ampm_text_color:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mAmPmTextColor:I

    .line 116
    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->mSelectedAlpha:I

    goto :goto_22
.end method
