.class public Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;
.super Landroid/widget/FrameLayout;
.source "RadialPickerLayout.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;
    }
.end annotation


# static fields
.field private static final AM:I = 0x0

.field private static final AMPM_INDEX:I = 0x2

.field private static final ENABLE_PICKER_INDEX:I = 0x3

.field private static final HOUR_INDEX:I = 0x0

.field private static final HOUR_VALUE_TO_DEGREES_STEP_SIZE:I = 0x1e

.field private static final MINUTE_INDEX:I = 0x1

.field private static final MINUTE_VALUE_TO_DEGREES_STEP_SIZE:I = 0x6

.field private static final PM:I = 0x1

.field private static final TAG:Ljava/lang/String; = "RadialPickerLayout"

.field private static final VISIBLE_DEGREES_STEP_SIZE:I = 0x1e


# instance fields
.field private final TAP_TIMEOUT:I

.field private final TOUCH_SLOP:I

.field private mAccessibilityManager:Landroid/view/accessibility/AccessibilityManager;

.field private mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

.field private mCircleView:Lcom/wdullaer/materialdatetimepicker/time/CircleView;

.field private mCurrentHoursOfDay:I

.field private mCurrentItemShowing:I

.field private mCurrentMinutes:I

.field private mDoingMove:Z

.field private mDoingTouch:Z

.field private mDownDegrees:I

.field private mDownX:F

.field private mDownY:F

.field private mGrayBox:Landroid/view/View;

.field private mHandler:Landroid/os/Handler;

.field private mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

.field private mHideAmPm:Z

.field private mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

.field private mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

.field private mInputEnabled:Z

.field private mIs24HourMode:Z

.field private mIsTouchingAmOrPm:I

.field private mLastValueSelected:I

.field private mListener:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;

.field private mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

.field private mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

.field private mSnapPrefer30sMap:[I

.field private mTimeInitialized:Z

.field private mTransition:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v4, 0x0

    const/4 v3, -0x1

    .line 101
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 85
    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    .line 94
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHandler:Landroid/os/Handler;

    .line 103
    invoke-virtual {p0, p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 104
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 105
    .local v0, "vc":Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->TOUCH_SLOP:I

    .line 106
    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->TAP_TIMEOUT:I

    .line 107
    iput-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingMove:Z

    .line 109
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/CircleView;

    invoke-direct {v1, p1}, Lcom/wdullaer/materialdatetimepicker/time/CircleView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCircleView:Lcom/wdullaer/materialdatetimepicker/time/CircleView;

    .line 110
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCircleView:Lcom/wdullaer/materialdatetimepicker/time/CircleView;

    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->addView(Landroid/view/View;)V

    .line 112
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-direct {v1, p1}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    .line 113
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->addView(Landroid/view/View;)V

    .line 115
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-direct {v1, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 116
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->addView(Landroid/view/View;)V

    .line 117
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-direct {v1, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 118
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->addView(Landroid/view/View;)V

    .line 120
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-direct {v1, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 121
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->addView(Landroid/view/View;)V

    .line 122
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-direct {v1, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 123
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->addView(Landroid/view/View;)V

    .line 126
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->preparePrefer30sMap()V

    .line 128
    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mLastValueSelected:I

    .line 130
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mInputEnabled:Z

    .line 132
    new-instance v1, Landroid/view/View;

    invoke-direct {v1, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mGrayBox:Landroid/view/View;

    .line 133
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mGrayBox:Landroid/view/View;

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 135
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mGrayBox:Landroid/view/View;

    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_transparent_black:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 136
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mGrayBox:Landroid/view/View;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 137
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mGrayBox:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->addView(Landroid/view/View;)V

    .line 139
    const-string v1, "accessibility"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/accessibility/AccessibilityManager;

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAccessibilityManager:Landroid/view/accessibility/AccessibilityManager;

    .line 141
    iput-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTimeInitialized:Z

    .line 142
    return-void
.end method

.method static synthetic access$000(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)I
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .prologue
    .line 48
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    return v0
.end method

.method static synthetic access$100(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    return-object v0
.end method

.method static synthetic access$202(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;
    .param p1, "x1"    # Z

    .prologue
    .line 48
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingMove:Z

    return p1
.end method

.method static synthetic access$300(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)I
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .prologue
    .line 48
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDownDegrees:I

    return v0
.end method

.method static synthetic access$400(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;IZZZ)I
    .registers 6
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;
    .param p1, "x1"    # I
    .param p2, "x2"    # Z
    .param p3, "x3"    # Z
    .param p4, "x4"    # Z

    .prologue
    .line 48
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->reselectSelector(IZZZ)I

    move-result v0

    return v0
.end method

.method static synthetic access$502(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;I)I
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;
    .param p1, "x1"    # I

    .prologue
    .line 48
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mLastValueSelected:I

    return p1
.end method

.method static synthetic access$600(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mListener:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;

    return-object v0
.end method

.method private getCurrentlyShowingValue()I
    .registers 3

    .prologue
    .line 283
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v0

    .line 284
    .local v0, "currentIndex":I
    if-nez v0, :cond_9

    .line 285
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentHoursOfDay:I

    .line 289
    :goto_8
    return v1

    .line 286
    :cond_9
    const/4 v1, 0x1

    if-ne v0, v1, :cond_f

    .line 287
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentMinutes:I

    goto :goto_8

    .line 289
    :cond_f
    const/4 v1, -0x1

    goto :goto_8
.end method

.method private getDegreesFromCoords(FFZ[Ljava/lang/Boolean;)I
    .registers 7
    .param p1, "pointX"    # F
    .param p2, "pointY"    # F
    .param p3, "forceLegal"    # Z
    .param p4, "isInnerCircle"    # [Ljava/lang/Boolean;

    .prologue
    .line 515
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v0

    .line 516
    .local v0, "currentItem":I
    if-nez v0, :cond_d

    .line 517
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v1, p1, p2, p3, p4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getDegreesFromCoords(FFZ[Ljava/lang/Boolean;)I

    move-result v1

    .line 523
    :goto_c
    return v1

    .line 519
    :cond_d
    const/4 v1, 0x1

    if-ne v0, v1, :cond_17

    .line 520
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v1, p1, p2, p3, p4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getDegreesFromCoords(FFZ[Ljava/lang/Boolean;)I

    move-result v1

    goto :goto_c

    .line 523
    :cond_17
    const/4 v1, -0x1

    goto :goto_c
.end method

.method private isHourInnerCircle(I)Z
    .registers 3
    .param p1, "hourOfDay"    # I

    .prologue
    .line 267
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIs24HourMode:Z

    if-eqz v0, :cond_c

    const/16 v0, 0xc

    if-gt p1, v0, :cond_c

    if-eqz p1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private preparePrefer30sMap()V
    .registers 7

    .prologue
    const/16 v5, 0x169

    .line 353
    new-array v4, v5, [I

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mSnapPrefer30sMap:[I

    .line 356
    const/4 v3, 0x0

    .line 358
    .local v3, "snappedOutputDegrees":I
    const/4 v0, 0x1

    .line 362
    .local v0, "count":I
    const/16 v2, 0x8

    .line 364
    .local v2, "expectedCount":I
    const/4 v1, 0x0

    .local v1, "degrees":I
    :goto_b
    if-ge v1, v5, :cond_2a

    .line 366
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mSnapPrefer30sMap:[I

    aput v3, v4, v1

    .line 369
    if-ne v0, v2, :cond_27

    .line 370
    add-int/lit8 v3, v3, 0x6

    .line 371
    const/16 v4, 0x168

    if-ne v3, v4, :cond_1e

    .line 372
    const/4 v2, 0x7

    .line 378
    :goto_1a
    const/4 v0, 0x1

    .line 364
    :goto_1b
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 373
    :cond_1e
    rem-int/lit8 v4, v3, 0x1e

    if-nez v4, :cond_25

    .line 374
    const/16 v2, 0xe

    goto :goto_1a

    .line 376
    :cond_25
    const/4 v2, 0x4

    goto :goto_1a

    .line 380
    :cond_27
    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    .line 383
    :cond_2a
    return-void
.end method

.method private reselectSelector(IZZZ)I
    .registers 13
    .param p1, "degrees"    # I
    .param p2, "isInnerCircle"    # Z
    .param p3, "forceToVisibleValue"    # Z
    .param p4, "forceDrawDot"    # Z

    .prologue
    const/16 v7, 0x168

    const/4 v6, 0x0

    const/4 v4, -0x1

    const/4 v5, 0x1

    .line 444
    if-ne p1, v4, :cond_8

    .line 498
    :cond_7
    :goto_7
    return v4

    .line 447
    :cond_8
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v1

    .line 450
    .local v1, "currentShowing":I
    if-nez p3, :cond_4e

    if-ne v1, v5, :cond_4e

    move v0, v5

    .line 451
    .local v0, "allowFineGrained":Z
    :goto_11
    if-eqz v0, :cond_50

    .line 452
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->snapPrefer30s(I)I

    move-result p1

    .line 458
    :goto_17
    if-nez v1, :cond_55

    .line 459
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 460
    .local v2, "radialSelectorView":Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;
    const/16 v3, 0x1e

    .line 465
    .local v3, "stepSize":I
    :goto_1d
    invoke-virtual {v2, p1, p2, p4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->setSelection(IZZ)V

    .line 466
    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->invalidate()V

    .line 469
    if-nez v1, :cond_64

    .line 470
    iget-boolean v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIs24HourMode:Z

    if-eqz v6, :cond_5f

    .line 471
    if-nez p1, :cond_59

    if-eqz p2, :cond_59

    .line 472
    const/16 p1, 0x168

    .line 483
    :cond_2f
    :goto_2f
    div-int v4, p1, v3

    .line 485
    .local v4, "value":I
    if-nez v1, :cond_3d

    iget-boolean v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIs24HourMode:Z

    if-eqz v6, :cond_3d

    if-nez p2, :cond_3d

    if-eqz p1, :cond_3d

    .line 486
    add-int/lit8 v4, v4, 0xc

    .line 490
    :cond_3d
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v6

    if-nez v6, :cond_6a

    .line 491
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v5, v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 492
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->invalidate()V

    goto :goto_7

    .end local v0    # "allowFineGrained":Z
    .end local v2    # "radialSelectorView":Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;
    .end local v3    # "stepSize":I
    .end local v4    # "value":I
    :cond_4e
    move v0, v6

    .line 450
    goto :goto_11

    .line 454
    .restart local v0    # "allowFineGrained":Z
    :cond_50
    invoke-static {p1, v6}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->snapOnly30s(II)I

    move-result p1

    goto :goto_17

    .line 462
    :cond_55
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 463
    .restart local v2    # "radialSelectorView":Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;
    const/4 v3, 0x6

    .restart local v3    # "stepSize":I
    goto :goto_1d

    .line 473
    :cond_59
    if-ne p1, v7, :cond_2f

    if-nez p2, :cond_2f

    .line 474
    const/4 p1, 0x0

    goto :goto_2f

    .line 476
    :cond_5f
    if-nez p1, :cond_2f

    .line 477
    const/16 p1, 0x168

    goto :goto_2f

    .line 479
    :cond_64
    if-ne p1, v7, :cond_2f

    if-ne v1, v5, :cond_2f

    .line 480
    const/4 p1, 0x0

    goto :goto_2f

    .line 493
    .restart local v4    # "value":I
    :cond_6a
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v6

    if-ne v6, v5, :cond_7

    .line 494
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v5, v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 495
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->invalidate()V

    goto :goto_7
.end method

.method private setItem(II)V
    .registers 8
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v4, 0x0

    .line 244
    if-nez p1, :cond_24

    .line 245
    invoke-direct {p0, v4, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setValueForItem(II)V

    .line 246
    rem-int/lit8 v2, p2, 0xc

    mul-int/lit8 v0, v2, 0x1e

    .line 247
    .local v0, "hourDegrees":I
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-direct {p0, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->isHourInnerCircle(I)Z

    move-result v3

    invoke-virtual {v2, v0, v3, v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->setSelection(IZZ)V

    .line 248
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->invalidate()V

    .line 249
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v2, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 250
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->invalidate()V

    .line 259
    .end local v0    # "hourDegrees":I
    :cond_23
    :goto_23
    return-void

    .line 251
    :cond_24
    if-ne p1, v2, :cond_23

    .line 252
    invoke-direct {p0, v2, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setValueForItem(II)V

    .line 253
    mul-int/lit8 v1, p2, 0x6

    .line 254
    .local v1, "minuteDegrees":I
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v2, v1, v4, v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->setSelection(IZZ)V

    .line 255
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->invalidate()V

    .line 256
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v2, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 257
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->invalidate()V

    goto :goto_23
.end method

.method private setValueForItem(II)V
    .registers 5
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    const/4 v1, 0x1

    .line 306
    if-nez p1, :cond_6

    .line 307
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentHoursOfDay:I

    .line 317
    :cond_5
    :goto_5
    return-void

    .line 308
    :cond_6
    if-ne p1, v1, :cond_b

    .line 309
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentMinutes:I

    goto :goto_5

    .line 310
    :cond_b
    const/4 v0, 0x2

    if-ne p1, v0, :cond_5

    .line 311
    if-nez p2, :cond_17

    .line 312
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentHoursOfDay:I

    rem-int/lit8 v0, v0, 0xc

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentHoursOfDay:I

    goto :goto_5

    .line 313
    :cond_17
    if-ne p2, v1, :cond_5

    .line 314
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentHoursOfDay:I

    rem-int/lit8 v0, v0, 0xc

    add-int/lit8 v0, v0, 0xc

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentHoursOfDay:I

    goto :goto_5
.end method

.method private static snapOnly30s(II)I
    .registers 7
    .param p0, "degrees"    # I
    .param p1, "forceHigherOrLower"    # I

    .prologue
    .line 409
    const/16 v2, 0x1e

    .line 410
    .local v2, "stepSize":I
    div-int v3, p0, v2

    mul-int v1, v3, v2

    .line 411
    .local v1, "floor":I
    add-int v0, v1, v2

    .line 412
    .local v0, "ceiling":I
    const/4 v3, 0x1

    if-ne p1, v3, :cond_d

    .line 413
    move p0, v0

    .line 426
    :goto_c
    return p0

    .line 414
    :cond_d
    const/4 v3, -0x1

    if-ne p1, v3, :cond_15

    .line 415
    if-ne p0, v1, :cond_13

    .line 416
    sub-int/2addr v1, v2

    .line 418
    :cond_13
    move p0, v1

    goto :goto_c

    .line 420
    :cond_15
    sub-int v3, p0, v1

    sub-int v4, v0, p0

    if-ge v3, v4, :cond_1d

    .line 421
    move p0, v1

    goto :goto_c

    .line 423
    :cond_1d
    move p0, v0

    goto :goto_c
.end method

.method private snapPrefer30s(I)I
    .registers 3
    .param p1, "degrees"    # I

    .prologue
    .line 393
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mSnapPrefer30sMap:[I

    if-nez v0, :cond_6

    .line 394
    const/4 v0, -0x1

    .line 396
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mSnapPrefer30sMap:[I

    aget v0, v0, p1

    goto :goto_5
.end method


# virtual methods
.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 10
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    const/4 v5, 0x1

    .line 776
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v6

    const/16 v7, 0x20

    if-ne v6, v7, :cond_3c

    .line 778
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->clear()V

    .line 779
    new-instance v3, Landroid/text/format/Time;

    invoke-direct {v3}, Landroid/text/format/Time;-><init>()V

    .line 780
    .local v3, "time":Landroid/text/format/Time;
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getHours()I

    move-result v6

    iput v6, v3, Landroid/text/format/Time;->hour:I

    .line 781
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getMinutes()I

    move-result v6

    iput v6, v3, Landroid/text/format/Time;->minute:I

    .line 782
    invoke-virtual {v3, v5}, Landroid/text/format/Time;->normalize(Z)J

    move-result-wide v1

    .line 783
    .local v1, "millis":J
    const/4 v0, 0x1

    .line 784
    .local v0, "flags":I
    iget-boolean v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIs24HourMode:Z

    if-eqz v6, :cond_2c

    .line 785
    or-int/lit16 v0, v0, 0x80

    .line 787
    :cond_2c
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6, v1, v2, v0}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object v4

    .line 788
    .local v4, "timeString":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 791
    .end local v0    # "flags":I
    .end local v1    # "millis":J
    .end local v3    # "time":Landroid/text/format/Time;
    .end local v4    # "timeString":Ljava/lang/String;
    :goto_3b
    return v5

    :cond_3c
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v5

    goto :goto_3b
.end method

.method public getCurrentItemShowing()I
    .registers 4

    .prologue
    .line 531
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentItemShowing:I

    if-eqz v0, :cond_25

    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentItemShowing:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_25

    .line 532
    const-string v0, "RadialPickerLayout"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Current item showing was unfortunately set to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentItemShowing:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 533
    const/4 v0, -0x1

    .line 535
    :goto_24
    return v0

    :cond_25
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentItemShowing:I

    goto :goto_24
.end method

.method public getHours()I
    .registers 2

    .prologue
    .line 271
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentHoursOfDay:I

    return v0
.end method

.method public getIsCurrentlyAmOrPm()I
    .registers 3

    .prologue
    .line 294
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentHoursOfDay:I

    const/16 v1, 0xc

    if-ge v0, v1, :cond_8

    .line 295
    const/4 v0, 0x0

    .line 299
    :goto_7
    return v0

    .line 296
    :cond_8
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentHoursOfDay:I

    const/16 v1, 0x18

    if-ge v0, v1, :cond_10

    .line 297
    const/4 v0, 0x1

    goto :goto_7

    .line 299
    :cond_10
    const/4 v0, -0x1

    goto :goto_7
.end method

.method public getMinutes()I
    .registers 2

    .prologue
    .line 275
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentMinutes:I

    return v0
.end method

.method public initialize(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;IIZ)V
    .registers 30
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "hapticFeedbackController"    # Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;
    .param p3, "initialHoursOfDay"    # I
    .param p4, "initialMinutes"    # I
    .param p5, "is24HourMode"    # Z

    .prologue
    .line 174
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTimeInitialized:Z

    if-eqz v2, :cond_e

    .line 175
    const-string v2, "RadialPickerLayout"

    const-string v5, "Time has already been initialized."

    invoke-static {v2, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    :goto_d
    return-void

    .line 179
    :cond_e
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    .line 180
    move/from16 v0, p5

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIs24HourMode:Z

    .line 181
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAccessibilityManager:Landroid/view/accessibility/AccessibilityManager;

    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    move-result v2

    if-eqz v2, :cond_d2

    const/4 v2, 0x1

    :goto_25
    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHideAmPm:Z

    .line 184
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCircleView:Lcom/wdullaer/materialdatetimepicker/time/CircleView;

    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHideAmPm:Z

    move-object/from16 v0, p1

    invoke-virtual {v2, v0, v5}, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->initialize(Landroid/content/Context;Z)V

    .line 185
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCircleView:Lcom/wdullaer/materialdatetimepicker/time/CircleView;

    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->invalidate()V

    .line 186
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHideAmPm:Z

    if-nez v2, :cond_5a

    .line 187
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    const/16 v2, 0xc

    move/from16 v0, p3

    if-ge v0, v2, :cond_d8

    const/4 v2, 0x0

    :goto_4e
    move-object/from16 v0, p1

    invoke-virtual {v5, v0, v2}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->initialize(Landroid/content/Context;I)V

    .line 188
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->invalidate()V

    .line 192
    :cond_5a
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 193
    .local v3, "res":Landroid/content/res/Resources;
    const/16 v2, 0xc

    new-array v0, v2, [I

    move-object/from16 v18, v0

    fill-array-data v18, :array_17c

    .line 194
    .local v18, "hours":[I
    const/16 v2, 0xc

    new-array v0, v2, [I

    move-object/from16 v19, v0

    fill-array-data v19, :array_198

    .line 195
    .local v19, "hours_24":[I
    const/16 v2, 0xc

    new-array v0, v2, [I

    move-object/from16 v22, v0

    fill-array-data v22, :array_1b4

    .line 196
    .local v22, "minutes":[I
    const/16 v2, 0xc

    new-array v4, v2, [Ljava/lang/String;

    .line 197
    .local v4, "hoursTexts":[Ljava/lang/String;
    const/16 v2, 0xc

    new-array v0, v2, [Ljava/lang/String;

    move-object/from16 v21, v0

    .line 198
    .local v21, "innerHoursTexts":[Ljava/lang/String;
    const/16 v2, 0xc

    new-array v0, v2, [Ljava/lang/String;

    move-object/from16 v23, v0

    .line 199
    .local v23, "minutesTexts":[Ljava/lang/String;
    const/16 v20, 0x0

    .local v20, "i":I
    :goto_8b
    const/16 v2, 0xc

    move/from16 v0, v20

    if-ge v0, v2, :cond_ee

    .line 200
    if-eqz p5, :cond_db

    const-string v2, "%02d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aget v7, v19, v20

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    :goto_a5
    aput-object v2, v4, v20

    .line 202
    const-string v2, "%d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aget v7, v18, v20

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v21, v20

    .line 203
    const-string v2, "%02d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aget v7, v22, v20

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v23, v20

    .line 199
    add-int/lit8 v20, v20, 0x1

    goto :goto_8b

    .line 181
    .end local v3    # "res":Landroid/content/res/Resources;
    .end local v4    # "hoursTexts":[Ljava/lang/String;
    .end local v18    # "hours":[I
    .end local v19    # "hours_24":[I
    .end local v20    # "i":I
    .end local v21    # "innerHoursTexts":[Ljava/lang/String;
    .end local v22    # "minutes":[I
    .end local v23    # "minutesTexts":[Ljava/lang/String;
    :cond_d2
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIs24HourMode:Z

    goto/16 :goto_25

    .line 187
    :cond_d8
    const/4 v2, 0x1

    goto/16 :goto_4e

    .line 200
    .restart local v3    # "res":Landroid/content/res/Resources;
    .restart local v4    # "hoursTexts":[Ljava/lang/String;
    .restart local v18    # "hours":[I
    .restart local v19    # "hours_24":[I
    .restart local v20    # "i":I
    .restart local v21    # "innerHoursTexts":[Ljava/lang/String;
    .restart local v22    # "minutes":[I
    .restart local v23    # "minutesTexts":[Ljava/lang/String;
    :cond_db
    const-string v2, "%d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aget v7, v18, v20

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_a5

    .line 205
    :cond_ee
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    if-eqz p5, :cond_176

    move-object/from16 v5, v21

    :goto_f6
    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHideAmPm:Z

    const/4 v7, 0x1

    invoke-virtual/range {v2 .. v7}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->initialize(Landroid/content/res/Resources;[Ljava/lang/String;[Ljava/lang/String;ZZ)V

    .line 207
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    if-eqz p5, :cond_179

    move/from16 v2, p3

    :goto_106
    invoke-virtual {v5, v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 208
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->invalidate()V

    .line 209
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHideAmPm:Z

    const/4 v10, 0x0

    move-object v6, v3

    move-object/from16 v7, v23

    invoke-virtual/range {v5 .. v10}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->initialize(Landroid/content/res/Resources;[Ljava/lang/String;[Ljava/lang/String;ZZ)V

    .line 210
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    move/from16 v0, p4

    invoke-virtual {v2, v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 211
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->invalidate()V

    .line 214
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move/from16 v1, p3

    invoke-direct {v0, v2, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setValueForItem(II)V

    .line 215
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p4

    invoke-direct {v0, v2, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setValueForItem(II)V

    .line 216
    rem-int/lit8 v2, p3, 0xc

    mul-int/lit8 v10, v2, 0x1e

    .line 217
    .local v10, "hourDegrees":I
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHideAmPm:Z

    const/4 v9, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->isHourInnerCircle(I)Z

    move-result v11

    move-object/from16 v6, p1

    move/from16 v8, p5

    invoke-virtual/range {v5 .. v11}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->initialize(Landroid/content/Context;ZZZIZ)V

    .line 219
    mul-int/lit8 v16, p4, 0x6

    .line 220
    .local v16, "minuteDegrees":I
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHideAmPm:Z

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v17, 0x0

    move-object/from16 v12, p1

    invoke-virtual/range {v11 .. v17}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->initialize(Landroid/content/Context;ZZZIZ)V

    .line 223
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTimeInitialized:Z

    goto/16 :goto_d

    .line 205
    .end local v10    # "hourDegrees":I
    .end local v16    # "minuteDegrees":I
    :cond_176
    const/4 v5, 0x0

    goto/16 :goto_f6

    .line 207
    :cond_179
    rem-int/lit8 v2, p3, 0xc

    goto :goto_106

    .line 193
    :array_17c
    .array-data 4
        0xc
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
        0x7
        0x8
        0x9
        0xa
        0xb
    .end array-data

    .line 194
    :array_198
    .array-data 4
        0x0
        0xd
        0xe
        0xf
        0x10
        0x11
        0x12
        0x13
        0x14
        0x15
        0x16
        0x17
    .end array-data

    .line 195
    :array_1b4
    .array-data 4
        0x0
        0x5
        0xa
        0xf
        0x14
        0x19
        0x1e
        0x23
        0x28
        0x2d
        0x32
        0x37
    .end array-data
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 3
    .param p1, "info"    # Landroid/view/accessibility/AccessibilityNodeInfo;

    .prologue
    .line 766
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 767
    const/16 v0, 0x1000

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 768
    const/16 v0, 0x2000

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 769
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 17
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 584
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    .line 585
    .local v4, "eventX":F
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    .line 588
    .local v5, "eventY":F
    const/4 v10, 0x1

    new-array v7, v10, [Ljava/lang/Boolean;

    .line 589
    .local v7, "isInnerCircle":[Ljava/lang/Boolean;
    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    aput-object v11, v7, v10

    .line 591
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v10

    packed-switch v10, :pswitch_data_1c8

    .line 742
    :cond_1a
    :goto_1a
    const/4 v10, 0x0

    :goto_1b
    return v10

    .line 593
    :pswitch_1c
    iget-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mInputEnabled:Z

    if-nez v10, :cond_22

    .line 594
    const/4 v10, 0x1

    goto :goto_1b

    .line 597
    :cond_22
    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDownX:F

    .line 598
    iput v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDownY:F

    .line 600
    const/4 v10, -0x1

    iput v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mLastValueSelected:I

    .line 601
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingMove:Z

    .line 602
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingTouch:Z

    .line 604
    iget-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHideAmPm:Z

    if-nez v10, :cond_5b

    .line 605
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v10, v4, v5}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->getIsTouchingAmOrPm(FF)I

    move-result v10

    iput v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    .line 609
    :goto_3b
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    if-eqz v10, :cond_44

    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    const/4 v11, 0x1

    if-ne v10, v11, :cond_5f

    .line 612
    :cond_44
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    invoke-virtual {v10}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->tryVibrate()V

    .line 613
    const/4 v10, -0x1

    iput v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDownDegrees:I

    .line 614
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHandler:Landroid/os/Handler;

    new-instance v11, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$1;

    invoke-direct {v11, p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$1;-><init>(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)V

    iget v12, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->TAP_TIMEOUT:I

    int-to-long v12, v12

    invoke-virtual {v10, v11, v12, v13}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 643
    :cond_59
    :goto_59
    const/4 v10, 0x1

    goto :goto_1b

    .line 607
    :cond_5b
    const/4 v10, -0x1

    iput v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    goto :goto_3b

    .line 624
    :cond_5f
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAccessibilityManager:Landroid/view/accessibility/AccessibilityManager;

    invoke-virtual {v10}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    move-result v6

    .line 626
    .local v6, "forceLegal":Z
    invoke-direct {p0, v4, v5, v6, v7}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getDegreesFromCoords(FFZ[Ljava/lang/Boolean;)I

    move-result v10

    iput v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDownDegrees:I

    .line 627
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDownDegrees:I

    const/4 v11, -0x1

    if-eq v10, v11, :cond_59

    .line 630
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    invoke-virtual {v10}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->tryVibrate()V

    .line 631
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHandler:Landroid/os/Handler;

    new-instance v11, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$2;

    invoke-direct {v11, p0, v7}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$2;-><init>(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;[Ljava/lang/Boolean;)V

    iget v12, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->TAP_TIMEOUT:I

    int-to-long v12, v12

    invoke-virtual {v10, v11, v12, v13}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_59

    .line 645
    .end local v6    # "forceLegal":Z
    :pswitch_83
    iget-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mInputEnabled:Z

    if-nez v10, :cond_90

    .line 647
    const-string v10, "RadialPickerLayout"

    const-string v11, "Input was disabled, but received ACTION_MOVE."

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 648
    const/4 v10, 0x1

    goto :goto_1b

    .line 651
    :cond_90
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDownY:F

    sub-float v10, v5, v10

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v2

    .line 652
    .local v2, "dY":F
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDownX:F

    sub-float v10, v4, v10

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 654
    .local v1, "dX":F
    iget-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingMove:Z

    if-nez v10, :cond_b2

    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->TOUCH_SLOP:I

    int-to-float v10, v10

    cmpg-float v10, v1, v10

    if-gtz v10, :cond_b2

    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->TOUCH_SLOP:I

    int-to-float v10, v10

    cmpg-float v10, v2, v10

    if-lez v10, :cond_1a

    .line 662
    :cond_b2
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    if-eqz v10, :cond_bb

    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    const/4 v11, 0x1

    if-ne v10, v11, :cond_db

    .line 663
    :cond_bb
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHandler:Landroid/os/Handler;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 664
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v10, v4, v5}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->getIsTouchingAmOrPm(FF)I

    move-result v8

    .line 665
    .local v8, "isTouchingAmOrPm":I
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    if-eq v8, v10, :cond_1a

    .line 666
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    const/4 v11, -0x1

    invoke-virtual {v10, v11}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->setAmOrPmPressed(I)V

    .line 667
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v10}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->invalidate()V

    .line 668
    const/4 v10, -0x1

    iput v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    goto/16 :goto_1a

    .line 673
    .end local v8    # "isTouchingAmOrPm":I
    :cond_db
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDownDegrees:I

    const/4 v11, -0x1

    if-eq v10, v11, :cond_1a

    .line 679
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingMove:Z

    .line 680
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHandler:Landroid/os/Handler;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 681
    const/4 v10, 0x1

    invoke-direct {p0, v4, v5, v10, v7}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getDegreesFromCoords(FFZ[Ljava/lang/Boolean;)I

    move-result v3

    .line 682
    .local v3, "degrees":I
    const/4 v10, -0x1

    if-eq v3, v10, :cond_113

    .line 683
    const/4 v10, 0x0

    aget-object v10, v7, v10

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    const/4 v11, 0x0

    const/4 v12, 0x1

    invoke-direct {p0, v3, v10, v11, v12}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->reselectSelector(IZZZ)I

    move-result v9

    .line 684
    .local v9, "value":I
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mLastValueSelected:I

    if-eq v9, v10, :cond_113

    .line 685
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    invoke-virtual {v10}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->tryVibrate()V

    .line 686
    iput v9, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mLastValueSelected:I

    .line 687
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mListener:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;

    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v11

    const/4 v12, 0x0

    invoke-interface {v10, v11, v9, v12}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;->onValueSelected(IIZ)V

    .line 690
    .end local v9    # "value":I
    :cond_113
    const/4 v10, 0x1

    goto/16 :goto_1b

    .line 692
    .end local v1    # "dX":F
    .end local v2    # "dY":F
    .end local v3    # "degrees":I
    :pswitch_116
    iget-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mInputEnabled:Z

    if-nez v10, :cond_12c

    .line 694
    const-string v10, "RadialPickerLayout"

    const-string v11, "Input was disabled, but received ACTION_UP."

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 695
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mListener:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;

    const/4 v11, 0x3

    const/4 v12, 0x1

    const/4 v13, 0x0

    invoke-interface {v10, v11, v12, v13}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;->onValueSelected(IIZ)V

    .line 696
    const/4 v10, 0x1

    goto/16 :goto_1b

    .line 699
    :cond_12c
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHandler:Landroid/os/Handler;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 700
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingTouch:Z

    .line 703
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    if-eqz v10, :cond_13e

    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    const/4 v11, 0x1

    if-ne v10, v11, :cond_170

    .line 704
    :cond_13e
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v10, v4, v5}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->getIsTouchingAmOrPm(FF)I

    move-result v8

    .line 705
    .restart local v8    # "isTouchingAmOrPm":I
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    const/4 v11, -0x1

    invoke-virtual {v10, v11}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->setAmOrPmPressed(I)V

    .line 706
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v10}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->invalidate()V

    .line 708
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    if-ne v8, v10, :cond_16b

    .line 709
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v10, v8}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->setAmOrPm(I)V

    .line 710
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getIsCurrentlyAmOrPm()I

    move-result v10

    if-eq v10, v8, :cond_16b

    .line 711
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mListener:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;

    const/4 v11, 0x2

    iget v12, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    const/4 v13, 0x0

    invoke-interface {v10, v11, v12, v13}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;->onValueSelected(IIZ)V

    .line 712
    const/4 v10, 0x2

    invoke-direct {p0, v10, v8}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setValueForItem(II)V

    .line 715
    :cond_16b
    const/4 v10, -0x1

    iput v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    goto/16 :goto_1a

    .line 720
    .end local v8    # "isTouchingAmOrPm":I
    :cond_170
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDownDegrees:I

    const/4 v11, -0x1

    if-eq v10, v11, :cond_1b5

    .line 721
    iget-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingMove:Z

    invoke-direct {p0, v4, v5, v10, v7}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getDegreesFromCoords(FFZ[Ljava/lang/Boolean;)I

    move-result v3

    .line 722
    .restart local v3    # "degrees":I
    const/4 v10, -0x1

    if-eq v3, v10, :cond_1b5

    .line 723
    const/4 v10, 0x0

    aget-object v10, v7, v10

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v11

    iget-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingMove:Z

    if-nez v10, :cond_1bb

    const/4 v10, 0x1

    :goto_18a
    const/4 v12, 0x0

    invoke-direct {p0, v3, v11, v10, v12}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->reselectSelector(IZZZ)I

    move-result v9

    .line 725
    .restart local v9    # "value":I
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v10

    if-nez v10, :cond_1a4

    iget-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIs24HourMode:Z

    if-nez v10, :cond_1a4

    .line 726
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getIsCurrentlyAmOrPm()I

    move-result v0

    .line 727
    .local v0, "amOrPm":I
    if-nez v0, :cond_1bd

    const/16 v10, 0xc

    if-ne v9, v10, :cond_1bd

    .line 728
    const/4 v9, 0x0

    .line 733
    .end local v0    # "amOrPm":I
    :cond_1a4
    :goto_1a4
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v10

    invoke-direct {p0, v10, v9}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setValueForItem(II)V

    .line 734
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mListener:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;

    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v11

    const/4 v12, 0x1

    invoke-interface {v10, v11, v9, v12}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;->onValueSelected(IIZ)V

    .line 737
    .end local v3    # "degrees":I
    .end local v9    # "value":I
    :cond_1b5
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingMove:Z

    .line 738
    const/4 v10, 0x1

    goto/16 :goto_1b

    .line 723
    .restart local v3    # "degrees":I
    :cond_1bb
    const/4 v10, 0x0

    goto :goto_18a

    .line 729
    .restart local v0    # "amOrPm":I
    .restart local v9    # "value":I
    :cond_1bd
    const/4 v10, 0x1

    if-ne v0, v10, :cond_1a4

    const/16 v10, 0xc

    if-eq v9, v10, :cond_1a4

    .line 730
    add-int/lit8 v9, v9, 0xc

    goto :goto_1a4

    .line 591
    nop

    :pswitch_data_1c8
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_116
        :pswitch_83
    .end packed-switch
.end method

.method public performAccessibilityAction(ILandroid/os/Bundle;)Z
    .registers 13
    .param p1, "action"    # I
    .param p2, "arguments"    # Landroid/os/Bundle;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 801
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 849
    :goto_8
    return v7

    .line 805
    :cond_9
    const/4 v0, 0x0

    .line 806
    .local v0, "changeMultiplier":I
    const/16 v9, 0x1000

    if-ne p1, v9, :cond_3e

    .line 807
    const/4 v0, 0x1

    .line 811
    :cond_f
    :goto_f
    if-eqz v0, :cond_53

    .line 812
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentlyShowingValue()I

    move-result v6

    .line 813
    .local v6, "value":I
    const/4 v5, 0x0

    .line 814
    .local v5, "stepSize":I
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v1

    .line 815
    .local v1, "currentItemShowing":I
    if-nez v1, :cond_44

    .line 816
    const/16 v5, 0x1e

    .line 817
    rem-int/lit8 v6, v6, 0xc

    .line 822
    :cond_20
    :goto_20
    mul-int v2, v6, v5

    .line 823
    .local v2, "degrees":I
    invoke-static {v2, v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->snapOnly30s(II)I

    move-result v2

    .line 824
    div-int v6, v2, v5

    .line 825
    const/4 v3, 0x0

    .line 826
    .local v3, "maxValue":I
    const/4 v4, 0x0

    .line 827
    .local v4, "minValue":I
    if-nez v1, :cond_4c

    .line 828
    iget-boolean v9, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIs24HourMode:Z

    if-eqz v9, :cond_48

    .line 829
    const/16 v3, 0x17

    .line 837
    :goto_32
    if-le v6, v3, :cond_4f

    .line 839
    move v6, v4

    .line 844
    :cond_35
    :goto_35
    invoke-direct {p0, v1, v6}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setItem(II)V

    .line 845
    iget-object v9, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mListener:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;

    invoke-interface {v9, v1, v6, v8}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;->onValueSelected(IIZ)V

    goto :goto_8

    .line 808
    .end local v1    # "currentItemShowing":I
    .end local v2    # "degrees":I
    .end local v3    # "maxValue":I
    .end local v4    # "minValue":I
    .end local v5    # "stepSize":I
    .end local v6    # "value":I
    :cond_3e
    const/16 v9, 0x2000

    if-ne p1, v9, :cond_f

    .line 809
    const/4 v0, -0x1

    goto :goto_f

    .line 818
    .restart local v1    # "currentItemShowing":I
    .restart local v5    # "stepSize":I
    .restart local v6    # "value":I
    :cond_44
    if-ne v1, v7, :cond_20

    .line 819
    const/4 v5, 0x6

    goto :goto_20

    .line 831
    .restart local v2    # "degrees":I
    .restart local v3    # "maxValue":I
    .restart local v4    # "minValue":I
    :cond_48
    const/16 v3, 0xc

    .line 832
    const/4 v4, 0x1

    goto :goto_32

    .line 835
    :cond_4c
    const/16 v3, 0x37

    goto :goto_32

    .line 840
    :cond_4f
    if-ge v6, v4, :cond_35

    .line 842
    move v6, v3

    goto :goto_35

    .end local v1    # "currentItemShowing":I
    .end local v2    # "degrees":I
    .end local v3    # "maxValue":I
    .end local v4    # "minValue":I
    .end local v5    # "stepSize":I
    .end local v6    # "value":I
    :cond_53
    move v7, v8

    .line 849
    goto :goto_8
.end method

.method public setAmOrPm(I)V
    .registers 3
    .param p1, "amOrPm"    # I

    .prologue
    .line 324
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->setAmOrPm(I)V

    .line 325
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->invalidate()V

    .line 326
    const/4 v0, 0x2

    invoke-direct {p0, v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setValueForItem(II)V

    .line 327
    return-void
.end method

.method public setCurrentItemShowing(IZ)V
    .registers 12
    .param p1, "index"    # I
    .param p2, "animate"    # Z

    .prologue
    const/16 v3, 0xff

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v4, 0x0

    const/4 v6, 0x1

    .line 543
    if-eqz p1, :cond_23

    if-eq p1, v6, :cond_23

    .line 544
    const-string v4, "RadialPickerLayout"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "TimePicker does not support view at index "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 580
    :goto_22
    return-void

    .line 548
    :cond_23
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v2

    .line 549
    .local v2, "lastIndex":I
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentItemShowing:I

    .line 551
    if-eqz p2, :cond_98

    if-eq p1, v2, :cond_98

    .line 552
    const/4 v5, 0x4

    new-array v0, v5, [Landroid/animation/ObjectAnimator;

    .line 553
    .local v0, "anims":[Landroid/animation/ObjectAnimator;
    if-ne p1, v6, :cond_75

    .line 554
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getDisappearAnimator()Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v0, v4

    .line 555
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getDisappearAnimator()Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v0, v6

    .line 556
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getReappearAnimator()Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v0, v7

    .line 557
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getReappearAnimator()Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v0, v8

    .line 565
    :cond_52
    :goto_52
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTransition:Landroid/animation/AnimatorSet;

    if-eqz v4, :cond_63

    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTransition:Landroid/animation/AnimatorSet;

    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v4

    if-eqz v4, :cond_63

    .line 566
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTransition:Landroid/animation/AnimatorSet;

    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->end()V

    .line 568
    :cond_63
    new-instance v4, Landroid/animation/AnimatorSet;

    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTransition:Landroid/animation/AnimatorSet;

    .line 569
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTransition:Landroid/animation/AnimatorSet;

    invoke-virtual {v4, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 570
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTransition:Landroid/animation/AnimatorSet;

    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->start()V

    goto :goto_22

    .line 558
    :cond_75
    if-nez p1, :cond_52

    .line 559
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getReappearAnimator()Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v0, v4

    .line 560
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getReappearAnimator()Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v0, v6

    .line 561
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getDisappearAnimator()Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v0, v7

    .line 562
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getDisappearAnimator()Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v0, v8

    goto :goto_52

    .line 572
    .end local v0    # "anims":[Landroid/animation/ObjectAnimator;
    :cond_98
    if-nez p1, :cond_b7

    move v1, v3

    .line 573
    .local v1, "hourAlpha":I
    :goto_9b
    if-ne p1, v6, :cond_b9

    .line 574
    .local v3, "minuteAlpha":I
    :goto_9d
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    int-to-float v5, v1

    invoke-virtual {v4, v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setAlpha(F)V

    .line 575
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    int-to-float v5, v1

    invoke-virtual {v4, v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->setAlpha(F)V

    .line 576
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    int-to-float v5, v3

    invoke-virtual {v4, v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setAlpha(F)V

    .line 577
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    int-to-float v5, v3

    invoke-virtual {v4, v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->setAlpha(F)V

    goto/16 :goto_22

    .end local v1    # "hourAlpha":I
    .end local v3    # "minuteAlpha":I
    :cond_b7
    move v1, v4

    .line 572
    goto :goto_9b

    .restart local v1    # "hourAlpha":I
    :cond_b9
    move v3, v4

    .line 573
    goto :goto_9d
.end method

.method public setOnValueSelectedListener(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;

    .prologue
    .line 162
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mListener:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;

    .line 163
    return-void
.end method

.method setTheme(Landroid/content/Context;Z)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "themeDark"    # Z

    .prologue
    .line 227
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCircleView:Lcom/wdullaer/materialdatetimepicker/time/CircleView;

    invoke-virtual {v0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->setTheme(Landroid/content/Context;Z)V

    .line 228
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->setTheme(Landroid/content/Context;Z)V

    .line 229
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setTheme(Landroid/content/Context;Z)V

    .line 230
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setTheme(Landroid/content/Context;Z)V

    .line 231
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->setTheme(Landroid/content/Context;Z)V

    .line 232
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->setTheme(Landroid/content/Context;Z)V

    .line 233
    return-void
.end method

.method public setTime(II)V
    .registers 4
    .param p1, "hours"    # I
    .param p2, "minutes"    # I

    .prologue
    .line 236
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setItem(II)V

    .line 237
    const/4 v0, 0x1

    invoke-direct {p0, v0, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setItem(II)V

    .line 238
    return-void
.end method

.method public trySettingInputEnabled(Z)Z
    .registers 4
    .param p1, "inputEnabled"    # Z

    .prologue
    const/4 v0, 0x0

    .line 749
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingTouch:Z

    if-eqz v1, :cond_8

    if-nez p1, :cond_8

    .line 757
    :goto_7
    return v0

    .line 755
    :cond_8
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mInputEnabled:Z

    .line 756
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mGrayBox:Landroid/view/View;

    if-eqz p1, :cond_f

    const/4 v0, 0x4

    :cond_f
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 757
    const/4 v0, 0x1

    goto :goto_7
.end method
