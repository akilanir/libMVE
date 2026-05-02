.class Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;
.super Landroid/widget/FrameLayout;
.source "DatePickerDialog.java"

# interfaces
.implements Lcom/rey/material/widget/DatePicker$OnDateChangedListener;
.implements Lcom/rey/material/widget/YearPicker$OnYearChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/DatePickerDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DatePickerLayout"
.end annotation


# static fields
.field private static final BASE_TEXT:Ljava/lang/String; = "0"

.field private static final DAY_FORMAT:Ljava/lang/String; = "%2d"

.field private static final YEAR_FORMAT:Ljava/lang/String; = "%4d"


# instance fields
.field private mBaseX:F

.field private mCenterY:F

.field private mDatePicker:Lcom/rey/material/widget/DatePicker;

.field private mDay:Ljava/lang/String;

.field private mDaySelectMode:Z

.field private mDayY:F

.field private mFirstWidth:F

.field private mHeaderPrimaryColor:I

.field private mHeaderPrimaryHeight:I

.field private mHeaderPrimaryRealHeight:I

.field private mHeaderPrimaryTextSize:I

.field private mHeaderRealWidth:I

.field private mHeaderSecondaryBackground:Landroid/graphics/Path;

.field private mHeaderSecondaryColor:I

.field private mHeaderSecondaryHeight:I

.field private mHeaderSecondaryTextSize:I

.field private mLocationDirty:Z

.field private mMonth:Ljava/lang/String;

.field private mMonthFirst:Z

.field private mMonthY:F

.field private mPadding:I

.field private mPaint:Landroid/graphics/Paint;

.field private mRect:Landroid/graphics/RectF;

.field private mSecondWidth:F

.field private mTextHeaderColor:I

.field private mWeekDay:Ljava/lang/String;

.field private mWeekDayY:F

.field private mYear:Ljava/lang/String;

.field private mYearPicker:Lcom/rey/material/widget/YearPicker;

.field private mYearY:F

.field final synthetic this$0:Lcom/rey/material/app/DatePickerDialog;


# direct methods
.method public constructor <init>(Lcom/rey/material/app/DatePickerDialog;Landroid/content/Context;)V
    .registers 10
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/16 v1, 0x8

    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 244
    iput-object p1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->this$0:Lcom/rey/material/app/DatePickerDialog;

    .line 245
    invoke-direct {p0, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 211
    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mTextHeaderColor:I

    .line 221
    iput-boolean v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDaySelectMode:Z

    .line 223
    iput-boolean v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonthFirst:Z

    .line 224
    iput-boolean v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mLocationDirty:Z

    .line 247
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    .line 248
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 249
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 250
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mRect:Landroid/graphics/RectF;

    .line 251
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryBackground:Landroid/graphics/Path;

    .line 252
    invoke-static {p2, v1}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPadding:I

    .line 254
    new-instance v0, Lcom/rey/material/widget/YearPicker;

    invoke-direct {v0, p2}, Lcom/rey/material/widget/YearPicker;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    .line 255
    new-instance v0, Lcom/rey/material/widget/DatePicker;

    invoke-direct {v0, p2}, Lcom/rey/material/widget/DatePicker;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    .line 256
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    iget v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPadding:I

    iget v4, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPadding:I

    iget v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPadding:I

    iget v6, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPadding:I

    invoke-virtual {v0, v3, v4, v5, v6}, Lcom/rey/material/widget/YearPicker;->setPadding(IIII)V

    .line 257
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    invoke-virtual {v0, p0}, Lcom/rey/material/widget/YearPicker;->setOnYearChangedListener(Lcom/rey/material/widget/YearPicker$OnYearChangedListener;)V

    .line 258
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    iget v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPadding:I

    iget v4, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPadding:I

    iget v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPadding:I

    iget v6, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPadding:I

    invoke-virtual {v0, v3, v4, v5, v6}, Lcom/rey/material/widget/DatePicker;->setContentPadding(IIII)V

    .line 259
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v0, p0}, Lcom/rey/material/widget/DatePicker;->setOnDateChangedListener(Lcom/rey/material/widget/DatePicker$OnDateChangedListener;)V

    .line 261
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {p0, v0}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->addView(Landroid/view/View;)V

    .line 262
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    invoke-virtual {p0, v0}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->addView(Landroid/view/View;)V

    .line 264
    iget-object v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    iget-boolean v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDaySelectMode:Z

    if-eqz v0, :cond_be

    move v0, v1

    :goto_7f
    invoke-virtual {v3, v0}, Lcom/rey/material/widget/YearPicker;->setVisibility(I)V

    .line 265
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    iget-boolean v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDaySelectMode:Z

    if-eqz v3, :cond_89

    move v1, v2

    :cond_89
    invoke-virtual {v0, v1}, Lcom/rey/material/widget/DatePicker;->setVisibility(I)V

    .line 267
    invoke-direct {p0}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->isMonthFirst()Z

    move-result v0

    iput-boolean v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonthFirst:Z

    .line 269
    invoke-virtual {p0, v2}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->setWillNotDraw(Z)V

    .line 271
    const/16 v0, 0x90

    invoke-static {p2, v0}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryHeight:I

    .line 272
    const/16 v0, 0x20

    invoke-static {p2, v0}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    .line 273
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/rey/material/R$dimen;->abc_text_size_display_2_material:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryTextSize:I

    .line 274
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/rey/material/R$dimen;->abc_text_size_headline_material:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryTextSize:I

    .line 275
    return-void

    :cond_be
    move v0, v2

    .line 264
    goto :goto_7f
.end method

.method private animIn(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 322
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 323
    .local v0, "anim":Landroid/view/animation/Animation;
    invoke-virtual {p0}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x10e0001

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 324
    new-instance v1, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout$2;

    invoke-direct {v1, p0, p1}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout$2;-><init>(Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 338
    invoke-virtual {p1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 339
    return-void
.end method

.method private animOut(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 304
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 305
    .local v0, "anim":Landroid/view/animation/Animation;
    invoke-virtual {p0}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x10e0001

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 306
    new-instance v1, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout$1;

    invoke-direct {v1, p0, p1}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout$1;-><init>(Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 318
    invoke-virtual {p1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 319
    return-void
.end method

.method private isMonthFirst()Z
    .registers 6

    .prologue
    const/4 v2, 0x0

    .line 278
    invoke-static {v2}, Ljava/text/SimpleDateFormat;->getDateInstance(I)Ljava/text/DateFormat;

    move-result-object v0

    check-cast v0, Ljava/text/SimpleDateFormat;

    .line 279
    .local v0, "format":Ljava/text/SimpleDateFormat;
    invoke-virtual {v0}, Ljava/text/SimpleDateFormat;->toLocalizedPattern()Ljava/lang/String;

    move-result-object v1

    .line 281
    .local v1, "pattern":Ljava/lang/String;
    const-string v3, "M"

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const-string v4, "d"

    invoke-virtual {v1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-ge v3, v4, :cond_1a

    const/4 v2, 0x1

    :cond_1a
    return v2
.end method

.method private isTouched(FFFFFF)Z
    .registers 8
    .param p1, "left"    # F
    .param p2, "top"    # F
    .param p3, "right"    # F
    .param p4, "bottom"    # F
    .param p5, "x"    # F
    .param p6, "y"    # F

    .prologue
    .line 663
    cmpl-float v0, p5, p1

    if-ltz v0, :cond_12

    cmpg-float v0, p5, p3

    if-gtz v0, :cond_12

    cmpl-float v0, p6, p2

    if-ltz v0, :cond_12

    cmpg-float v0, p6, p4

    if-gtz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private measureHeaderText()V
    .registers 14

    .prologue
    const/high16 v12, 0x40000000    # 2.0f

    const/4 v11, 0x0

    .line 574
    iget-boolean v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mLocationDirty:Z

    if-nez v7, :cond_8

    .line 624
    :goto_7
    return-void

    .line 577
    :cond_8
    iget-object v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mWeekDay:Ljava/lang/String;

    if-nez v7, :cond_f

    .line 578
    iput-boolean v11, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mLocationDirty:Z

    goto :goto_7

    .line 582
    :cond_f
    iget v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderRealWidth:I

    int-to-float v7, v7

    div-float/2addr v7, v12

    iput v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mBaseX:F

    .line 583
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 585
    .local v2, "bounds":Landroid/graphics/Rect;
    iget-object v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget-object v8, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v8}, Lcom/rey/material/widget/DatePicker;->getTextSize()I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 586
    iget-object v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    const-string v8, "0"

    const-string v9, "0"

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {v7, v8, v11, v9, v2}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 587
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v3

    .line 588
    .local v3, "height":I
    iget v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    add-int/2addr v7, v3

    int-to-float v7, v7

    div-float/2addr v7, v12

    iput v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mWeekDayY:F

    .line 590
    iget-object v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget v8, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryTextSize:I

    int-to-float v8, v8

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 591
    iget-object v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    const-string v8, "0"

    const-string v9, "0"

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {v7, v8, v11, v9, v2}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 592
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v4

    .line 593
    .local v4, "primaryTextHeight":I
    iget-boolean v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonthFirst:Z

    if-eqz v7, :cond_db

    .line 594
    iget-object v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget-object v8, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDay:Ljava/lang/String;

    iget-object v9, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDay:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {v7, v8, v11, v9}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v7

    iput v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mFirstWidth:F

    .line 598
    :goto_6b
    iget-object v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget v8, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryTextSize:I

    int-to-float v8, v8

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 599
    iget-object v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    const-string v8, "0"

    const-string v9, "0"

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {v7, v8, v11, v9, v2}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 600
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v5

    .line 601
    .local v5, "secondaryTextHeight":I
    iget-boolean v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonthFirst:Z

    if-eqz v7, :cond_ec

    .line 602
    iget v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mFirstWidth:F

    iget-object v8, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget-object v9, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonth:Ljava/lang/String;

    iget-object v10, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonth:Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {v8, v9, v11, v10}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->max(FF)F

    move-result v7

    iput v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mFirstWidth:F

    .line 605
    :goto_9e
    iget-object v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget-object v8, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYear:Ljava/lang/String;

    iget-object v9, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYear:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {v7, v8, v11, v9}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v7

    iput v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mSecondWidth:F

    .line 607
    iget v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    int-to-float v7, v7

    iget v8, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryRealHeight:I

    add-int/2addr v8, v4

    int-to-float v8, v8

    div-float/2addr v8, v12

    add-float/2addr v7, v8

    iput v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mCenterY:F

    .line 608
    iget v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryRealHeight:I

    sub-int/2addr v7, v4

    int-to-float v7, v7

    div-float/2addr v7, v12

    int-to-float v8, v5

    add-float/2addr v7, v8

    div-float v6, v7, v12

    .line 609
    .local v6, "y":F
    iget v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    int-to-float v7, v7

    add-float v0, v7, v6

    .line 610
    .local v0, "aboveY":F
    iget v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mCenterY:F

    add-float v1, v7, v6

    .line 612
    .local v1, "belowY":F
    iget-boolean v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonthFirst:Z

    if-eqz v7, :cond_103

    .line 613
    iget v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mCenterY:F

    iput v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDayY:F

    .line 614
    iput v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonthY:F

    .line 621
    :goto_d5
    iput v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearY:F

    .line 623
    iput-boolean v11, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mLocationDirty:Z

    goto/16 :goto_7

    .line 596
    .end local v0    # "aboveY":F
    .end local v1    # "belowY":F
    .end local v5    # "secondaryTextHeight":I
    .end local v6    # "y":F
    :cond_db
    iget-object v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget-object v8, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonth:Ljava/lang/String;

    iget-object v9, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonth:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {v7, v8, v11, v9}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v7

    iput v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mFirstWidth:F

    goto :goto_6b

    .line 604
    .restart local v5    # "secondaryTextHeight":I
    :cond_ec
    iget v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mFirstWidth:F

    iget-object v8, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget-object v9, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDay:Ljava/lang/String;

    iget-object v10, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDay:Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {v8, v9, v11, v10}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->max(FF)F

    move-result v7

    iput v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mFirstWidth:F

    goto :goto_9e

    .line 617
    .restart local v0    # "aboveY":F
    .restart local v1    # "belowY":F
    .restart local v6    # "y":F
    :cond_103
    iget v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mCenterY:F

    iput v7, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonthY:F

    .line 618
    iput v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDayY:F

    goto :goto_d5
.end method


# virtual methods
.method public applyStyle(I)V
    .registers 9
    .param p1, "resId"    # I

    .prologue
    const/4 v6, 0x0

    .line 342
    iget-object v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    invoke-virtual {v5, p1}, Lcom/rey/material/widget/YearPicker;->applyStyle(I)V

    .line 343
    iget-object v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v5, p1}, Lcom/rey/material/widget/DatePicker;->applyStyle(I)V

    .line 345
    iget-object v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v5}, Lcom/rey/material/widget/DatePicker;->getSelectionColor()I

    move-result v5

    iput v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryColor:I

    .line 346
    iget v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryColor:I

    iput v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryColor:I

    .line 348
    invoke-virtual {p0}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 349
    .local v2, "context":Landroid/content/Context;
    sget-object v5, Lcom/rey/material/R$styleable;->DatePickerDialog:[I

    invoke-virtual {v2, p1, v5}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 351
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v4, 0x0

    .local v4, "i":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v3

    .local v3, "count":I
    :goto_26
    if-ge v4, v3, :cond_7b

    .line 352
    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v1

    .line 354
    .local v1, "attr":I
    sget v5, Lcom/rey/material/R$styleable;->DatePickerDialog_dp_headerPrimaryHeight:I

    if-ne v1, v5, :cond_39

    .line 355
    invoke-virtual {v0, v1, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    iput v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryHeight:I

    .line 351
    :cond_36
    :goto_36
    add-int/lit8 v4, v4, 0x1

    goto :goto_26

    .line 356
    :cond_39
    sget v5, Lcom/rey/material/R$styleable;->DatePickerDialog_dp_headerSecondaryHeight:I

    if-ne v1, v5, :cond_44

    .line 357
    invoke-virtual {v0, v1, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    iput v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    goto :goto_36

    .line 358
    :cond_44
    sget v5, Lcom/rey/material/R$styleable;->DatePickerDialog_dp_headerPrimaryColor:I

    if-ne v1, v5, :cond_4f

    .line 359
    invoke-virtual {v0, v1, v6}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v5

    iput v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryColor:I

    goto :goto_36

    .line 360
    :cond_4f
    sget v5, Lcom/rey/material/R$styleable;->DatePickerDialog_dp_headerSecondaryColor:I

    if-ne v1, v5, :cond_5a

    .line 361
    invoke-virtual {v0, v1, v6}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v5

    iput v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryColor:I

    goto :goto_36

    .line 362
    :cond_5a
    sget v5, Lcom/rey/material/R$styleable;->DatePickerDialog_dp_headerPrimaryTextSize:I

    if-ne v1, v5, :cond_65

    .line 363
    invoke-virtual {v0, v1, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    iput v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryTextSize:I

    goto :goto_36

    .line 364
    :cond_65
    sget v5, Lcom/rey/material/R$styleable;->DatePickerDialog_dp_headerSecondaryTextSize:I

    if-ne v1, v5, :cond_70

    .line 365
    invoke-virtual {v0, v1, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    iput v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryTextSize:I

    goto :goto_36

    .line 366
    :cond_70
    sget v5, Lcom/rey/material/R$styleable;->DatePickerDialog_dp_textHeaderColor:I

    if-ne v1, v5, :cond_36

    .line 367
    invoke-virtual {v0, v1, v6}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v5

    iput v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mTextHeaderColor:I

    goto :goto_36

    .line 370
    .end local v1    # "attr":I
    :cond_7b
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 372
    iget-object v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget-object v6, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v6}, Lcom/rey/material/widget/DatePicker;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 373
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v7, 0x0

    .line 628
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 630
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 631
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryBackground:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 632
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 633
    const/4 v1, 0x0

    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    int-to-float v2, v0

    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderRealWidth:I

    int-to-float v3, v0

    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryRealHeight:I

    iget v4, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    add-int/2addr v0, v4

    int-to-float v4, v0

    iget-object v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 635
    invoke-direct {p0}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->measureHeaderText()V

    .line 637
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mWeekDay:Ljava/lang/String;

    if-nez v0, :cond_34

    .line 660
    :goto_33
    return-void

    .line 640
    :cond_34
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v1}, Lcom/rey/material/widget/DatePicker;->getTextSize()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 641
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v1}, Lcom/rey/material/widget/DatePicker;->getTextHighlightColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 643
    iget-object v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mWeekDay:Ljava/lang/String;

    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mWeekDay:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    iget v4, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mBaseX:F

    iget v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mWeekDayY:F

    iget-object v6, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v2, v7

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;IIFFLandroid/graphics/Paint;)V

    .line 645
    iget-object v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget-boolean v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDaySelectMode:Z

    if-eqz v0, :cond_cb

    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/DatePicker;->getTextHighlightColor()I

    move-result v0

    :goto_6a
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 646
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryTextSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 647
    iget-boolean v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonthFirst:Z

    if-eqz v0, :cond_ce

    .line 648
    iget-object v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDay:Ljava/lang/String;

    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDay:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    iget v4, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mBaseX:F

    iget v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDayY:F

    iget-object v6, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v2, v7

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;IIFFLandroid/graphics/Paint;)V

    .line 652
    :goto_8c
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryTextSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 653
    iget-boolean v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonthFirst:Z

    if-eqz v0, :cond_e2

    .line 654
    iget-object v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonth:Ljava/lang/String;

    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonth:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    iget v4, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mBaseX:F

    iget v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonthY:F

    iget-object v6, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v2, v7

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;IIFFLandroid/graphics/Paint;)V

    .line 658
    :goto_ab
    iget-object v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget-boolean v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDaySelectMode:Z

    if-eqz v0, :cond_f6

    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mTextHeaderColor:I

    :goto_b3
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 659
    iget-object v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYear:Ljava/lang/String;

    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYear:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    iget v4, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mBaseX:F

    iget v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearY:F

    iget-object v6, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v2, v7

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;IIFFLandroid/graphics/Paint;)V

    goto/16 :goto_33

    .line 645
    :cond_cb
    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mTextHeaderColor:I

    goto :goto_6a

    .line 650
    :cond_ce
    iget-object v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonth:Ljava/lang/String;

    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonth:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    iget v4, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mBaseX:F

    iget v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonthY:F

    iget-object v6, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v2, v7

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;IIFFLandroid/graphics/Paint;)V

    goto :goto_8c

    .line 656
    :cond_e2
    iget-object v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDay:Ljava/lang/String;

    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDay:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    iget v4, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mBaseX:F

    iget v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDayY:F

    iget-object v6, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v2, v7

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;IIFFLandroid/graphics/Paint;)V

    goto :goto_ab

    .line 658
    :cond_f6
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/DatePicker;->getTextHighlightColor()I

    move-result v0

    goto :goto_b3
.end method

.method public getCalendar()Ljava/util/Calendar;
    .registers 2

    .prologue
    .line 424
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/DatePicker;->getCalendar()Ljava/util/Calendar;

    move-result-object v0

    return-object v0
.end method

.method public getDay()I
    .registers 2

    .prologue
    .line 408
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/DatePicker;->getDay()I

    move-result v0

    return v0
.end method

.method public getFormattedDate(Ljava/text/DateFormat;)Ljava/lang/String;
    .registers 3
    .param p1, "formatter"    # Ljava/text/DateFormat;

    .prologue
    .line 420
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/DatePicker;->getFormattedDate(Ljava/text/DateFormat;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMonth()I
    .registers 2

    .prologue
    .line 412
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/DatePicker;->getMonth()I

    move-result v0

    return v0
.end method

.method public getYear()I
    .registers 2

    .prologue
    .line 416
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/DatePicker;->getYear()I

    move-result v0

    return v0
.end method

.method public onDateChanged(IIIIII)V
    .registers 15
    .param p1, "oldDay"    # I
    .param p2, "oldMonth"    # I
    .param p3, "oldYear"    # I
    .param p4, "newDay"    # I
    .param p5, "newMonth"    # I
    .param p6, "newYear"    # I

    .prologue
    const/4 v2, 0x2

    const/4 v1, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 435
    iget-boolean v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDaySelectMode:Z

    if-eqz v0, :cond_d

    .line 436
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    invoke-virtual {v0, p6}, Lcom/rey/material/widget/YearPicker;->setYear(I)V

    .line 438
    :cond_d
    if-ltz p4, :cond_13

    if-ltz p5, :cond_13

    if-gez p6, :cond_3f

    .line 439
    :cond_13
    iput-object v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mWeekDay:Ljava/lang/String;

    .line 440
    iput-object v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonth:Ljava/lang/String;

    .line 441
    iput-object v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDay:Ljava/lang/String;

    .line 442
    iput-object v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYear:Ljava/lang/String;

    .line 459
    :cond_1b
    :goto_1b
    iput-boolean v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mLocationDirty:Z

    .line 460
    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderRealWidth:I

    iget v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryRealHeight:I

    iget v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    add-int/2addr v1, v2

    invoke-virtual {p0, v4, v4, v0, v1}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->invalidate(IIII)V

    .line 462
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->this$0:Lcom/rey/material/app/DatePickerDialog;

    # getter for: Lcom/rey/material/app/DatePickerDialog;->mOnDateChangedListener:Lcom/rey/material/app/DatePickerDialog$OnDateChangedListener;
    invoke-static {v0}, Lcom/rey/material/app/DatePickerDialog;->access$000(Lcom/rey/material/app/DatePickerDialog;)Lcom/rey/material/app/DatePickerDialog$OnDateChangedListener;

    move-result-object v0

    if-eqz v0, :cond_3e

    .line 463
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->this$0:Lcom/rey/material/app/DatePickerDialog;

    # getter for: Lcom/rey/material/app/DatePickerDialog;->mOnDateChangedListener:Lcom/rey/material/app/DatePickerDialog$OnDateChangedListener;
    invoke-static {v0}, Lcom/rey/material/app/DatePickerDialog;->access$000(Lcom/rey/material/app/DatePickerDialog;)Lcom/rey/material/app/DatePickerDialog$OnDateChangedListener;

    move-result-object v0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-interface/range {v0 .. v6}, Lcom/rey/material/app/DatePickerDialog$OnDateChangedListener;->onDateChanged(IIIIII)V

    .line 464
    :cond_3e
    return-void

    .line 445
    :cond_3f
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/DatePicker;->getCalendar()Ljava/util/Calendar;

    move-result-object v7

    .line 446
    .local v7, "cal":Ljava/util/Calendar;
    invoke-virtual {v7, v3, p6}, Ljava/util/Calendar;->set(II)V

    .line 447
    invoke-virtual {v7, v2, p5}, Ljava/util/Calendar;->set(II)V

    .line 448
    const/4 v0, 0x5

    invoke-virtual {v7, v0, p4}, Ljava/util/Calendar;->set(II)V

    .line 450
    const/4 v0, 0x7

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v7, v0, v2, v1}, Ljava/util/Calendar;->getDisplayName(IILjava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mWeekDay:Ljava/lang/String;

    .line 451
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v7, v2, v3, v0}, Ljava/util/Calendar;->getDisplayName(IILjava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mMonth:Ljava/lang/String;

    .line 452
    const-string v0, "%2d"

    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDay:Ljava/lang/String;

    .line 453
    const-string v0, "%4d"

    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYear:Ljava/lang/String;

    .line 455
    if-ne p2, p5, :cond_88

    if-eq p3, p6, :cond_1b

    .line 456
    :cond_88
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v0, p5, p6}, Lcom/rey/material/widget/DatePicker;->goTo(II)V

    goto :goto_1b
.end method

.method protected onLayout(ZIIII)V
    .registers 13
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    const/4 v4, 0x1

    .line 555
    const/4 v1, 0x0

    .line 556
    .local v1, "childLeft":I
    const/4 v3, 0x0

    .line 557
    .local v3, "childTop":I
    sub-int v2, p4, p2

    .line 558
    .local v2, "childRight":I
    sub-int v0, p5, p3

    .line 560
    .local v0, "childBottom":I
    invoke-virtual {p0}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v5

    iget v5, v5, Landroid/content/res/Configuration;->orientation:I

    if-ne v5, v4, :cond_3c

    .line 562
    .local v4, "isPortrait":Z
    :goto_17
    if-eqz v4, :cond_3e

    .line 563
    iget v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryRealHeight:I

    iget v6, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    add-int/2addr v5, v6

    add-int/2addr v3, v5

    .line 567
    :goto_1f
    iget-object v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v5, v1, v3, v2, v0}, Lcom/rey/material/widget/DatePicker;->layout(IIII)V

    .line 569
    add-int v5, v0, v3

    iget-object v6, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    invoke-virtual {v6}, Lcom/rey/material/widget/YearPicker;->getMeasuredHeight()I

    move-result v6

    sub-int/2addr v5, v6

    div-int/lit8 v3, v5, 0x2

    .line 570
    iget-object v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    iget-object v6, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    invoke-virtual {v6}, Lcom/rey/material/widget/YearPicker;->getMeasuredHeight()I

    move-result v6

    add-int/2addr v6, v3

    invoke-virtual {v5, v1, v3, v2, v6}, Lcom/rey/material/widget/YearPicker;->layout(IIII)V

    .line 571
    return-void

    .line 560
    .end local v4    # "isPortrait":Z
    :cond_3c
    const/4 v4, 0x0

    goto :goto_17

    .line 565
    .restart local v4    # "isPortrait":Z
    :cond_3e
    iget v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderRealWidth:I

    add-int/2addr v1, v5

    goto :goto_1f
.end method

.method protected onMeasure(II)V
    .registers 15
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/4 v4, 0x1

    const/high16 v10, -0x80000000

    const/high16 v11, 0x40000000    # 2.0f

    const/4 v8, 0x0

    .line 468
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v6

    .line 469
    .local v6, "widthSize":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v5

    .line 470
    .local v5, "widthMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 471
    .local v2, "heightSize":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 473
    .local v1, "heightMode":I
    invoke-virtual {p0}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v9

    iget v9, v9, Landroid/content/res/Configuration;->orientation:I

    if-ne v9, v4, :cond_40

    .line 474
    .local v4, "isPortrait":Z
    :goto_26
    if-eqz v4, :cond_85

    .line 475
    if-ne v1, v10, :cond_42

    .line 476
    invoke-static {v6, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 477
    .local v7, "ws":I
    invoke-static {v8, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .line 478
    .local v3, "hs":I
    iget-object v8, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v8, v7, v3}, Lcom/rey/material/widget/DatePicker;->measure(II)V

    .line 479
    iget-object v8, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    invoke-virtual {v8, v7, v7}, Lcom/rey/material/widget/YearPicker;->measure(II)V

    .line 490
    .end local v3    # "hs":I
    :cond_3c
    :goto_3c
    invoke-virtual {p0, v6, v2}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->setMeasuredDimension(II)V

    .line 510
    :goto_3f
    return-void

    .end local v4    # "isPortrait":Z
    .end local v7    # "ws":I
    :cond_40
    move v4, v8

    .line 473
    goto :goto_26

    .line 482
    .restart local v4    # "isPortrait":Z
    :cond_42
    iget v9, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    sub-int v9, v2, v9

    iget v10, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryHeight:I

    sub-int/2addr v9, v10

    iget-object v10, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v10}, Lcom/rey/material/widget/DatePicker;->getMeasuredHeight()I

    move-result v10

    invoke-static {v9, v10}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 483
    .local v0, "height":I
    invoke-static {v6, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 484
    .restart local v7    # "ws":I
    iget-object v9, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-static {v0, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v10

    invoke-virtual {v9, v7, v10}, Lcom/rey/material/widget/DatePicker;->measure(II)V

    .line 485
    iget-object v9, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    invoke-static {v8, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    invoke-virtual {v9, v7, v8}, Lcom/rey/material/widget/YearPicker;->measure(II)V

    .line 486
    iget-object v8, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    invoke-virtual {v8}, Lcom/rey/material/widget/YearPicker;->getMeasuredHeight()I

    move-result v8

    if-eq v8, v0, :cond_3c

    .line 487
    iget-object v8, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    iget-object v9, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    invoke-virtual {v9}, Lcom/rey/material/widget/YearPicker;->getMeasuredHeight()I

    move-result v9

    invoke-static {v9, v0}, Ljava/lang/Math;->min(II)I

    move-result v9

    invoke-static {v9, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v9

    invoke-virtual {v8, v7, v9}, Lcom/rey/material/widget/YearPicker;->measure(II)V

    goto :goto_3c

    .line 493
    .end local v0    # "height":I
    .end local v7    # "ws":I
    :cond_85
    if-ne v1, v10, :cond_9f

    .line 494
    div-int/lit8 v9, v6, 0x2

    invoke-static {v9, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 495
    .restart local v7    # "ws":I
    invoke-static {v8, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .line 496
    .restart local v3    # "hs":I
    iget-object v8, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v8, v7, v3}, Lcom/rey/material/widget/DatePicker;->measure(II)V

    .line 497
    iget-object v8, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    invoke-virtual {v8, v7, v7}, Lcom/rey/material/widget/YearPicker;->measure(II)V

    .line 508
    .end local v3    # "hs":I
    :cond_9b
    :goto_9b
    invoke-virtual {p0, v6, v2}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->setMeasuredDimension(II)V

    goto :goto_3f

    .line 500
    .end local v7    # "ws":I
    :cond_9f
    iget-object v9, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v9}, Lcom/rey/material/widget/DatePicker;->getMeasuredHeight()I

    move-result v9

    invoke-static {v2, v9}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 501
    .restart local v0    # "height":I
    div-int/lit8 v9, v6, 0x2

    invoke-static {v9, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 502
    .restart local v7    # "ws":I
    iget-object v9, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-static {v0, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v10

    invoke-virtual {v9, v7, v10}, Lcom/rey/material/widget/DatePicker;->measure(II)V

    .line 503
    iget-object v9, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    invoke-static {v8, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    invoke-virtual {v9, v7, v8}, Lcom/rey/material/widget/YearPicker;->measure(II)V

    .line 504
    iget-object v8, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    invoke-virtual {v8}, Lcom/rey/material/widget/YearPicker;->getMeasuredHeight()I

    move-result v8

    if-eq v8, v0, :cond_9b

    .line 505
    iget-object v8, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    iget-object v9, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    invoke-virtual {v9}, Lcom/rey/material/widget/YearPicker;->getMeasuredHeight()I

    move-result v9

    invoke-static {v9, v0}, Ljava/lang/Math;->min(II)I

    move-result v9

    invoke-static {v9, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v9

    invoke-virtual {v8, v7, v9}, Lcom/rey/material/widget/YearPicker;->measure(II)V

    goto :goto_9b
.end method

.method protected onSizeChanged(IIII)V
    .registers 14
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    const/high16 v5, 0x43340000    # 180.0f

    const/high16 v8, 0x42b40000    # 90.0f

    const/4 v0, 0x0

    const/high16 v7, 0x40000000    # 2.0f

    const/4 v1, 0x0

    .line 514
    invoke-virtual {p0}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->orientation:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_49

    const/4 v6, 0x1

    .line 516
    .local v6, "isPortrait":Z
    :goto_1a
    if-eqz v6, :cond_bb

    .line 517
    iput p1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderRealWidth:I

    .line 518
    iget v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    sub-int v2, p2, v2

    iget-object v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v3}, Lcom/rey/material/widget/DatePicker;->getMeasuredHeight()I

    move-result v3

    sub-int/2addr v2, v3

    iput v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryRealHeight:I

    .line 519
    iget-object v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryBackground:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 520
    iget-object v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->this$0:Lcom/rey/material/app/DatePickerDialog;

    # getter for: Lcom/rey/material/app/DatePickerDialog;->mCornerRadius:F
    invoke-static {v2}, Lcom/rey/material/app/DatePickerDialog;->access$100(Lcom/rey/material/app/DatePickerDialog;)F

    move-result v2

    cmpl-float v2, v2, v1

    if-nez v2, :cond_4b

    .line 521
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryBackground:Landroid/graphics/Path;

    iget v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderRealWidth:I

    int-to-float v3, v2

    iget v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    int-to-float v4, v2

    sget-object v5, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    move v2, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 551
    :goto_48
    return-void

    .end local v6    # "isPortrait":Z
    :cond_49
    move v6, v0

    .line 514
    goto :goto_1a

    .line 523
    .restart local v6    # "isPortrait":Z
    :cond_4b
    iget-object v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryBackground:Landroid/graphics/Path;

    iget v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    int-to-float v3, v3

    invoke-virtual {v2, v1, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 524
    iget-object v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryBackground:Landroid/graphics/Path;

    iget-object v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->this$0:Lcom/rey/material/app/DatePickerDialog;

    # getter for: Lcom/rey/material/app/DatePickerDialog;->mCornerRadius:F
    invoke-static {v3}, Lcom/rey/material/app/DatePickerDialog;->access$100(Lcom/rey/material/app/DatePickerDialog;)F

    move-result v3

    invoke-virtual {v2, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 525
    iget-object v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->this$0:Lcom/rey/material/app/DatePickerDialog;

    # getter for: Lcom/rey/material/app/DatePickerDialog;->mCornerRadius:F
    invoke-static {v3}, Lcom/rey/material/app/DatePickerDialog;->access$100(Lcom/rey/material/app/DatePickerDialog;)F

    move-result v3

    mul-float/2addr v3, v7

    iget-object v4, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->this$0:Lcom/rey/material/app/DatePickerDialog;

    # getter for: Lcom/rey/material/app/DatePickerDialog;->mCornerRadius:F
    invoke-static {v4}, Lcom/rey/material/app/DatePickerDialog;->access$100(Lcom/rey/material/app/DatePickerDialog;)F

    move-result v4

    mul-float/2addr v4, v7

    invoke-virtual {v2, v1, v1, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 526
    iget-object v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryBackground:Landroid/graphics/Path;

    iget-object v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mRect:Landroid/graphics/RectF;

    invoke-virtual {v2, v3, v5, v8, v0}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 527
    iget-object v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryBackground:Landroid/graphics/Path;

    iget v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderRealWidth:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->this$0:Lcom/rey/material/app/DatePickerDialog;

    # getter for: Lcom/rey/material/app/DatePickerDialog;->mCornerRadius:F
    invoke-static {v4}, Lcom/rey/material/app/DatePickerDialog;->access$100(Lcom/rey/material/app/DatePickerDialog;)F

    move-result v4

    sub-float/2addr v3, v4

    invoke-virtual {v2, v3, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 528
    iget-object v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mRect:Landroid/graphics/RectF;

    iget v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderRealWidth:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->this$0:Lcom/rey/material/app/DatePickerDialog;

    # getter for: Lcom/rey/material/app/DatePickerDialog;->mCornerRadius:F
    invoke-static {v4}, Lcom/rey/material/app/DatePickerDialog;->access$100(Lcom/rey/material/app/DatePickerDialog;)F

    move-result v4

    mul-float/2addr v4, v7

    sub-float/2addr v3, v4

    iget v4, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderRealWidth:I

    int-to-float v4, v4

    iget-object v5, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->this$0:Lcom/rey/material/app/DatePickerDialog;

    # getter for: Lcom/rey/material/app/DatePickerDialog;->mCornerRadius:F
    invoke-static {v5}, Lcom/rey/material/app/DatePickerDialog;->access$100(Lcom/rey/material/app/DatePickerDialog;)F

    move-result v5

    mul-float/2addr v5, v7

    invoke-virtual {v2, v3, v1, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 529
    iget-object v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryBackground:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mRect:Landroid/graphics/RectF;

    const/high16 v3, 0x43870000    # 270.0f

    invoke-virtual {v1, v2, v3, v8, v0}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 530
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryBackground:Landroid/graphics/Path;

    iget v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderRealWidth:I

    int-to-float v1, v1

    iget v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 531
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryBackground:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    goto :goto_48

    .line 535
    :cond_bb
    iget-object v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v2}, Lcom/rey/material/widget/DatePicker;->getMeasuredWidth()I

    move-result v2

    sub-int v2, p1, v2

    iput v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderRealWidth:I

    .line 536
    iget v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    sub-int v2, p2, v2

    iput v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryRealHeight:I

    .line 537
    iget-object v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryBackground:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 538
    iget-object v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->this$0:Lcom/rey/material/app/DatePickerDialog;

    # getter for: Lcom/rey/material/app/DatePickerDialog;->mCornerRadius:F
    invoke-static {v2}, Lcom/rey/material/app/DatePickerDialog;->access$100(Lcom/rey/material/app/DatePickerDialog;)F

    move-result v2

    cmpl-float v2, v2, v1

    if-nez v2, :cond_ea

    .line 539
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryBackground:Landroid/graphics/Path;

    iget v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderRealWidth:I

    int-to-float v3, v2

    iget v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    int-to-float v4, v2

    sget-object v5, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    move v2, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    goto/16 :goto_48

    .line 541
    :cond_ea
    iget-object v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryBackground:Landroid/graphics/Path;

    iget v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    int-to-float v3, v3

    invoke-virtual {v2, v1, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 542
    iget-object v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryBackground:Landroid/graphics/Path;

    iget-object v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->this$0:Lcom/rey/material/app/DatePickerDialog;

    # getter for: Lcom/rey/material/app/DatePickerDialog;->mCornerRadius:F
    invoke-static {v3}, Lcom/rey/material/app/DatePickerDialog;->access$100(Lcom/rey/material/app/DatePickerDialog;)F

    move-result v3

    invoke-virtual {v2, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 543
    iget-object v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->this$0:Lcom/rey/material/app/DatePickerDialog;

    # getter for: Lcom/rey/material/app/DatePickerDialog;->mCornerRadius:F
    invoke-static {v3}, Lcom/rey/material/app/DatePickerDialog;->access$100(Lcom/rey/material/app/DatePickerDialog;)F

    move-result v3

    mul-float/2addr v3, v7

    iget-object v4, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->this$0:Lcom/rey/material/app/DatePickerDialog;

    # getter for: Lcom/rey/material/app/DatePickerDialog;->mCornerRadius:F
    invoke-static {v4}, Lcom/rey/material/app/DatePickerDialog;->access$100(Lcom/rey/material/app/DatePickerDialog;)F

    move-result v4

    mul-float/2addr v4, v7

    invoke-virtual {v2, v1, v1, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 544
    iget-object v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryBackground:Landroid/graphics/Path;

    iget-object v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mRect:Landroid/graphics/RectF;

    invoke-virtual {v2, v3, v5, v8, v0}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 545
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryBackground:Landroid/graphics/Path;

    iget v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderRealWidth:I

    int-to-float v2, v2

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 546
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryBackground:Landroid/graphics/Path;

    iget v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderRealWidth:I

    int-to-float v1, v1

    iget v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 547
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryBackground:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    goto/16 :goto_48
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 13
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    const/high16 v10, 0x40000000    # 2.0f

    .line 668
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v7

    .line 670
    .local v7, "handled":Z
    if-eqz v7, :cond_c

    move v8, v7

    .line 694
    :goto_b
    return v8

    .line 673
    :cond_c
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_b4

    :cond_13
    move v8, v9

    .line 694
    goto :goto_b

    .line 675
    :pswitch_15
    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mBaseX:F

    iget v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mFirstWidth:F

    div-float/2addr v1, v10

    sub-float v1, v0, v1

    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    int-to-float v2, v0

    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mBaseX:F

    iget v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mFirstWidth:F

    div-float/2addr v3, v10

    add-float/2addr v3, v0

    iget v4, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mCenterY:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->isTouched(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_3f

    .line 676
    iget-boolean v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDaySelectMode:Z

    if-nez v0, :cond_3d

    move v0, v8

    :goto_3b
    move v8, v0

    goto :goto_b

    :cond_3d
    move v0, v9

    goto :goto_3b

    .line 678
    :cond_3f
    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mBaseX:F

    iget v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mSecondWidth:F

    div-float/2addr v1, v10

    sub-float v1, v0, v1

    iget v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mCenterY:F

    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mBaseX:F

    iget v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mSecondWidth:F

    div-float/2addr v3, v10

    add-float/2addr v3, v0

    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    iget v4, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryRealHeight:I

    add-int/2addr v0, v4

    int-to-float v4, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->isTouched(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 679
    iget-boolean v8, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDaySelectMode:Z

    goto :goto_b

    .line 682
    :pswitch_66
    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mBaseX:F

    iget v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mFirstWidth:F

    div-float/2addr v1, v10

    sub-float v1, v0, v1

    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    int-to-float v2, v0

    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mBaseX:F

    iget v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mFirstWidth:F

    div-float/2addr v3, v10

    add-float/2addr v3, v0

    iget v4, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mCenterY:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->isTouched(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_8b

    .line 683
    invoke-virtual {p0, v8}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->setDateSelectMode(Z)V

    goto :goto_b

    .line 687
    :cond_8b
    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mBaseX:F

    iget v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mSecondWidth:F

    div-float/2addr v1, v10

    sub-float v1, v0, v1

    iget v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mCenterY:F

    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mBaseX:F

    iget v3, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mSecondWidth:F

    div-float/2addr v3, v10

    add-float/2addr v3, v0

    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    iget v4, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryRealHeight:I

    add-int/2addr v0, v4

    int-to-float v4, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->isTouched(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 688
    invoke-virtual {p0, v9}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->setDateSelectMode(Z)V

    goto/16 :goto_b

    .line 673
    :pswitch_data_b4
    .packed-switch 0x0
        :pswitch_15
        :pswitch_66
    .end packed-switch
.end method

.method public onYearChanged(II)V
    .registers 6
    .param p1, "oldYear"    # I
    .param p2, "newYear"    # I

    .prologue
    .line 429
    iget-boolean v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDaySelectMode:Z

    if-nez v0, :cond_15

    .line 430
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    iget-object v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v1}, Lcom/rey/material/widget/DatePicker;->getDay()I

    move-result v1

    iget-object v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v2}, Lcom/rey/material/widget/DatePicker;->getMonth()I

    move-result v2

    invoke-virtual {v0, v1, v2, p2}, Lcom/rey/material/widget/DatePicker;->setDate(III)V

    .line 431
    :cond_15
    return-void
.end method

.method public setDate(III)V
    .registers 5
    .param p1, "day"    # I
    .param p2, "month"    # I
    .param p3, "year"    # I

    .prologue
    .line 395
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v0, p1, p2, p3}, Lcom/rey/material/widget/DatePicker;->setDate(III)V

    .line 396
    return-void
.end method

.method public setDate(J)V
    .registers 8
    .param p1, "time"    # J

    .prologue
    .line 399
    iget-object v4, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v4}, Lcom/rey/material/widget/DatePicker;->getCalendar()Ljava/util/Calendar;

    move-result-object v0

    .line 400
    .local v0, "cal":Ljava/util/Calendar;
    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 401
    const/4 v4, 0x5

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v1

    .line 402
    .local v1, "day":I
    const/4 v4, 0x2

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v2

    .line 403
    .local v2, "month":I
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    .line 404
    .local v3, "year":I
    iget-object v4, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v4, v1, v2, v3}, Lcom/rey/material/widget/DatePicker;->setDate(III)V

    .line 405
    return-void
.end method

.method public setDateRange(IIIIII)V
    .registers 14
    .param p1, "minDay"    # I
    .param p2, "minMonth"    # I
    .param p3, "minYear"    # I
    .param p4, "maxDay"    # I
    .param p5, "maxMonth"    # I
    .param p6, "maxYear"    # I

    .prologue
    .line 376
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/rey/material/widget/DatePicker;->setDateRange(IIIIII)V

    .line 377
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    invoke-virtual {v0, p3, p6}, Lcom/rey/material/widget/YearPicker;->setYearRange(II)V

    .line 378
    return-void
.end method

.method public setDateRange(JJ)V
    .registers 16
    .param p1, "minTime"    # J
    .param p3, "maxTime"    # J

    .prologue
    const/4 v10, 0x5

    const/4 v9, 0x2

    const/4 v8, 0x1

    .line 381
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/DatePicker;->getCalendar()Ljava/util/Calendar;

    move-result-object v7

    .line 382
    .local v7, "cal":Ljava/util/Calendar;
    invoke-virtual {v7, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 383
    invoke-virtual {v7, v10}, Ljava/util/Calendar;->get(I)I

    move-result v1

    .line 384
    .local v1, "minDay":I
    invoke-virtual {v7, v9}, Ljava/util/Calendar;->get(I)I

    move-result v2

    .line 385
    .local v2, "minMonth":I
    invoke-virtual {v7, v8}, Ljava/util/Calendar;->get(I)I

    move-result v3

    .line 386
    .local v3, "minYear":I
    invoke-virtual {v7, p3, p4}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 387
    invoke-virtual {v7, v10}, Ljava/util/Calendar;->get(I)I

    move-result v4

    .line 388
    .local v4, "maxDay":I
    invoke-virtual {v7, v9}, Ljava/util/Calendar;->get(I)I

    move-result v5

    .line 389
    .local v5, "maxMonth":I
    invoke-virtual {v7, v8}, Ljava/util/Calendar;->get(I)I

    move-result v6

    .local v6, "maxYear":I
    move-object v0, p0

    .line 391
    invoke-virtual/range {v0 .. v6}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->setDateRange(IIIIII)V

    .line 392
    return-void
.end method

.method public setDateSelectMode(Z)V
    .registers 6
    .param p1, "enable"    # Z

    .prologue
    const/4 v3, 0x0

    .line 285
    iget-boolean v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDaySelectMode:Z

    if-eq v0, p1, :cond_30

    .line 286
    iput-boolean p1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDaySelectMode:Z

    .line 288
    iget-boolean v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDaySelectMode:Z

    if-eqz v0, :cond_31

    .line 289
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    iget-object v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v1}, Lcom/rey/material/widget/DatePicker;->getMonth()I

    move-result v1

    iget-object v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v2}, Lcom/rey/material/widget/DatePicker;->getYear()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/rey/material/widget/DatePicker;->goTo(II)V

    .line 290
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    invoke-direct {p0, v0}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->animOut(Landroid/view/View;)V

    .line 291
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-direct {p0, v0}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->animIn(Landroid/view/View;)V

    .line 299
    :goto_26
    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderRealWidth:I

    iget v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderPrimaryRealHeight:I

    iget v2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mHeaderSecondaryHeight:I

    add-int/2addr v1, v2

    invoke-virtual {p0, v3, v3, v0, v1}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->invalidate(IIII)V

    .line 301
    :cond_30
    return-void

    .line 294
    :cond_31
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    iget-object v1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    invoke-virtual {v1}, Lcom/rey/material/widget/YearPicker;->getYear()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/YearPicker;->goTo(I)V

    .line 295
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mDatePicker:Lcom/rey/material/widget/DatePicker;

    invoke-direct {p0, v0}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->animOut(Landroid/view/View;)V

    .line 296
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->mYearPicker:Lcom/rey/material/widget/YearPicker;

    invoke-direct {p0, v0}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->animIn(Landroid/view/View;)V

    goto :goto_26
.end method
