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

.field private mTimePickerDialog:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

.field private mTransition:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v4, 0x0

    const/4 v3, -0x1

    .line 104
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 88
    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    .line 97
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHandler:Landroid/os/Handler;

    .line 106
    invoke-virtual {p0, p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 107
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 108
    .local v0, "vc":Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->TOUCH_SLOP:I

    .line 109
    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->TAP_TIMEOUT:I

    .line 110
    iput-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingMove:Z

    .line 112
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/CircleView;

    invoke-direct {v1, p1}, Lcom/wdullaer/materialdatetimepicker/time/CircleView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCircleView:Lcom/wdullaer/materialdatetimepicker/time/CircleView;

    .line 113
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCircleView:Lcom/wdullaer/materialdatetimepicker/time/CircleView;

    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->addView(Landroid/view/View;)V

    .line 115
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-direct {v1, p1}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    .line 116
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->addView(Landroid/view/View;)V

    .line 118
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-direct {v1, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 119
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->addView(Landroid/view/View;)V

    .line 120
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-direct {v1, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 121
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->addView(Landroid/view/View;)V

    .line 123
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-direct {v1, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 124
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->addView(Landroid/view/View;)V

    .line 125
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-direct {v1, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 126
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->addView(Landroid/view/View;)V

    .line 129
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->preparePrefer30sMap()V

    .line 131
    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mLastValueSelected:I

    .line 133
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mInputEnabled:Z

    .line 135
    new-instance v1, Landroid/view/View;

    invoke-direct {v1, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mGrayBox:Landroid/view/View;

    .line 136
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mGrayBox:Landroid/view/View;

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 138
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mGrayBox:Landroid/view/View;

    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_transparent_black:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 139
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mGrayBox:Landroid/view/View;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 140
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mGrayBox:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->addView(Landroid/view/View;)V

    .line 142
    const-string v1, "accessibility"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/accessibility/AccessibilityManager;

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAccessibilityManager:Landroid/view/accessibility/AccessibilityManager;

    .line 144
    iput-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTimeInitialized:Z

    .line 145
    return-void
.end method

.method static synthetic access$000(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)I
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .prologue
    .line 51
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    return v0
.end method

.method static synthetic access$100(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    return-object v0
.end method

.method static synthetic access$202(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;
    .param p1, "x1"    # Z

    .prologue
    .line 51
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingMove:Z

    return p1
.end method

.method static synthetic access$300(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)I
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .prologue
    .line 51
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
    .line 51
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->reselectSelector(IZZZ)I

    move-result v0

    return v0
.end method

.method static synthetic access$502(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;I)I
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;
    .param p1, "x1"    # I

    .prologue
    .line 51
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mLastValueSelected:I

    return p1
.end method

.method static synthetic access$600(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mListener:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;

    return-object v0
.end method

.method private getCurrentlyShowingValue()I
    .registers 3

    .prologue
    .line 293
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v0

    .line 294
    .local v0, "currentIndex":I
    if-nez v0, :cond_9

    .line 295
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentHoursOfDay:I

    .line 299
    :goto_8
    return v1

    .line 296
    :cond_9
    const/4 v1, 0x1

    if-ne v0, v1, :cond_f

    .line 297
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentMinutes:I

    goto :goto_8

    .line 299
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
    .line 525
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v0

    .line 526
    .local v0, "currentItem":I
    if-nez v0, :cond_d

    .line 527
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v1, p1, p2, p3, p4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getDegreesFromCoords(FFZ[Ljava/lang/Boolean;)I

    move-result v1

    .line 533
    :goto_c
    return v1

    .line 529
    :cond_d
    const/4 v1, 0x1

    if-ne v0, v1, :cond_17

    .line 530
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v1, p1, p2, p3, p4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getDegreesFromCoords(FFZ[Ljava/lang/Boolean;)I

    move-result v1

    goto :goto_c

    .line 533
    :cond_17
    const/4 v1, -0x1

    goto :goto_c
.end method

.method private isHourInnerCircle(I)Z
    .registers 3
    .param p1, "hourOfDay"    # I

    .prologue
    .line 277
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

    .line 363
    new-array v4, v5, [I

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mSnapPrefer30sMap:[I

    .line 366
    const/4 v3, 0x0

    .line 368
    .local v3, "snappedOutputDegrees":I
    const/4 v0, 0x1

    .line 372
    .local v0, "count":I
    const/16 v2, 0x8

    .line 374
    .local v2, "expectedCount":I
    const/4 v1, 0x0

    .local v1, "degrees":I
    :goto_b
    if-ge v1, v5, :cond_2a

    .line 376
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mSnapPrefer30sMap:[I

    aput v3, v4, v1

    .line 379
    if-ne v0, v2, :cond_27

    .line 380
    add-int/lit8 v3, v3, 0x6

    .line 381
    const/16 v4, 0x168

    if-ne v3, v4, :cond_1e

    .line 382
    const/4 v2, 0x7

    .line 388
    :goto_1a
    const/4 v0, 0x1

    .line 374
    :goto_1b
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 383
    :cond_1e
    rem-int/lit8 v4, v3, 0x1e

    if-nez v4, :cond_25

    .line 384
    const/16 v2, 0xe

    goto :goto_1a

    .line 386
    :cond_25
    const/4 v2, 0x4

    goto :goto_1a

    .line 390
    :cond_27
    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    .line 393
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

    .line 454
    if-ne p1, v4, :cond_8

    .line 508
    :cond_7
    :goto_7
    return v4

    .line 457
    :cond_8
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v1

    .line 460
    .local v1, "currentShowing":I
    if-nez p3, :cond_4e

    if-ne v1, v5, :cond_4e

    move v0, v5

    .line 461
    .local v0, "allowFineGrained":Z
    :goto_11
    if-eqz v0, :cond_50

    .line 462
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->snapPrefer30s(I)I

    move-result p1

    .line 468
    :goto_17
    if-nez v1, :cond_55

    .line 469
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 470
    .local v2, "radialSelectorView":Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;
    const/16 v3, 0x1e

    .line 475
    .local v3, "stepSize":I
    :goto_1d
    invoke-virtual {v2, p1, p2, p4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->setSelection(IZZ)V

    .line 476
    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->invalidate()V

    .line 479
    if-nez v1, :cond_64

    .line 480
    iget-boolean v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIs24HourMode:Z

    if-eqz v6, :cond_5f

    .line 481
    if-nez p1, :cond_59

    if-eqz p2, :cond_59

    .line 482
    const/16 p1, 0x168

    .line 493
    :cond_2f
    :goto_2f
    div-int v4, p1, v3

    .line 495
    .local v4, "value":I
    if-nez v1, :cond_3d

    iget-boolean v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIs24HourMode:Z

    if-eqz v6, :cond_3d

    if-nez p2, :cond_3d

    if-eqz p1, :cond_3d

    .line 496
    add-int/lit8 v4, v4, 0xc

    .line 500
    :cond_3d
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v6

    if-nez v6, :cond_6a

    .line 501
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v5, v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 502
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->invalidate()V

    goto :goto_7

    .end local v0    # "allowFineGrained":Z
    .end local v2    # "radialSelectorView":Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;
    .end local v3    # "stepSize":I
    .end local v4    # "value":I
    :cond_4e
    move v0, v6

    .line 460
    goto :goto_11

    .line 464
    .restart local v0    # "allowFineGrained":Z
    :cond_50
    invoke-static {p1, v6}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->snapOnly30s(II)I

    move-result p1

    goto :goto_17

    .line 472
    :cond_55
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 473
    .restart local v2    # "radialSelectorView":Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;
    const/4 v3, 0x6

    .restart local v3    # "stepSize":I
    goto :goto_1d

    .line 483
    :cond_59
    if-ne p1, v7, :cond_2f

    if-nez p2, :cond_2f

    .line 484
    const/4 p1, 0x0

    goto :goto_2f

    .line 486
    :cond_5f
    if-nez p1, :cond_2f

    .line 487
    const/16 p1, 0x168

    goto :goto_2f

    .line 489
    :cond_64
    if-ne p1, v7, :cond_2f

    if-ne v1, v5, :cond_2f

    .line 490
    const/4 p1, 0x0

    goto :goto_2f

    .line 503
    .restart local v4    # "value":I
    :cond_6a
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v6

    if-ne v6, v5, :cond_7

    .line 504
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v5, v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 505
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

    .line 254
    if-nez p1, :cond_24

    .line 255
    invoke-direct {p0, v4, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setValueForItem(II)V

    .line 256
    rem-int/lit8 v2, p2, 0xc

    mul-int/lit8 v0, v2, 0x1e

    .line 257
    .local v0, "hourDegrees":I
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-direct {p0, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->isHourInnerCircle(I)Z

    move-result v3

    invoke-virtual {v2, v0, v3, v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->setSelection(IZZ)V

    .line 258
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->invalidate()V

    .line 259
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v2, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 260
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->invalidate()V

    .line 269
    .end local v0    # "hourDegrees":I
    :cond_23
    :goto_23
    return-void

    .line 261
    :cond_24
    if-ne p1, v2, :cond_23

    .line 262
    invoke-direct {p0, v2, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setValueForItem(II)V

    .line 263
    mul-int/lit8 v1, p2, 0x6

    .line 264
    .local v1, "minuteDegrees":I
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v2, v1, v4, v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->setSelection(IZZ)V

    .line 265
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->invalidate()V

    .line 266
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v2, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 267
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

    .line 316
    if-nez p1, :cond_6

    .line 317
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentHoursOfDay:I

    .line 327
    :cond_5
    :goto_5
    return-void

    .line 318
    :cond_6
    if-ne p1, v1, :cond_b

    .line 319
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentMinutes:I

    goto :goto_5

    .line 320
    :cond_b
    const/4 v0, 0x2

    if-ne p1, v0, :cond_5

    .line 321
    if-nez p2, :cond_17

    .line 322
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentHoursOfDay:I

    rem-int/lit8 v0, v0, 0xc

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentHoursOfDay:I

    goto :goto_5

    .line 323
    :cond_17
    if-ne p2, v1, :cond_5

    .line 324
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
    .line 419
    const/16 v2, 0x1e

    .line 420
    .local v2, "stepSize":I
    div-int v3, p0, v2

    mul-int v1, v3, v2

    .line 421
    .local v1, "floor":I
    add-int v0, v1, v2

    .line 422
    .local v0, "ceiling":I
    const/4 v3, 0x1

    if-ne p1, v3, :cond_d

    .line 423
    move p0, v0

    .line 436
    :goto_c
    return p0

    .line 424
    :cond_d
    const/4 v3, -0x1

    if-ne p1, v3, :cond_15

    .line 425
    if-ne p0, v1, :cond_13

    .line 426
    sub-int/2addr v1, v2

    .line 428
    :cond_13
    move p0, v1

    goto :goto_c

    .line 430
    :cond_15
    sub-int v3, p0, v1

    sub-int v4, v0, p0

    if-ge v3, v4, :cond_1d

    .line 431
    move p0, v1

    goto :goto_c

    .line 433
    :cond_1d
    move p0, v0

    goto :goto_c
.end method

.method private snapPrefer30s(I)I
    .registers 3
    .param p1, "degrees"    # I

    .prologue
    .line 403
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mSnapPrefer30sMap:[I

    if-nez v0, :cond_6

    .line 404
    const/4 v0, -0x1

    .line 406
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mSnapPrefer30sMap:[I

    aget v0, v0, p1

    goto :goto_5
.end method


# virtual methods
.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 9
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 793
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v5

    const/16 v6, 0x20

    if-ne v5, v6, :cond_41

    .line 795
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->clear()V

    .line 796
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v3

    .line 797
    .local v3, "time":Ljava/util/Calendar;
    const/16 v5, 0xa

    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getHours()I

    move-result v6

    invoke-virtual {v3, v5, v6}, Ljava/util/Calendar;->set(II)V

    .line 798
    const/16 v5, 0xc

    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getMinutes()I

    move-result v6

    invoke-virtual {v3, v5, v6}, Ljava/util/Calendar;->set(II)V

    .line 799
    invoke-virtual {v3}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v1

    .line 800
    .local v1, "millis":J
    const/4 v0, 0x1

    .line 801
    .local v0, "flags":I
    iget-boolean v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIs24HourMode:Z

    if-eqz v5, :cond_30

    .line 802
    or-int/lit16 v0, v0, 0x80

    .line 804
    :cond_30
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5, v1, v2, v0}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object v4

    .line 805
    .local v4, "timeString":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 806
    const/4 v5, 0x1

    .line 808
    .end local v0    # "flags":I
    .end local v1    # "millis":J
    .end local v3    # "time":Ljava/util/Calendar;
    .end local v4    # "timeString":Ljava/lang/String;
    :goto_40
    return v5

    :cond_41
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v5

    goto :goto_40
.end method

.method public getCurrentItemShowing()I
    .registers 4

    .prologue
    .line 541
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentItemShowing:I

    if-eqz v0, :cond_25

    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentItemShowing:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_25

    .line 542
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

    .line 543
    const/4 v0, -0x1

    .line 545
    :goto_24
    return v0

    :cond_25
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentItemShowing:I

    goto :goto_24
.end method

.method public getHours()I
    .registers 2

    .prologue
    .line 281
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentHoursOfDay:I

    return v0
.end method

.method public getIsCurrentlyAmOrPm()I
    .registers 3

    .prologue
    .line 304
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentHoursOfDay:I

    const/16 v1, 0xc

    if-ge v0, v1, :cond_8

    .line 305
    const/4 v0, 0x0

    .line 309
    :goto_7
    return v0

    .line 306
    :cond_8
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentHoursOfDay:I

    const/16 v1, 0x18

    if-ge v0, v1, :cond_10

    .line 307
    const/4 v0, 0x1

    goto :goto_7

    .line 309
    :cond_10
    const/4 v0, -0x1

    goto :goto_7
.end method

.method public getMinutes()I
    .registers 2

    .prologue
    .line 285
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentMinutes:I

    return v0
.end method

.method public initialize(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;IIZ)V
    .registers 30
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "timePickerDialog"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;
    .param p3, "initialHoursOfDay"    # I
    .param p4, "initialMinutes"    # I
    .param p5, "is24HourMode"    # Z

    .prologue
    .line 177
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTimeInitialized:Z

    if-eqz v2, :cond_e

    .line 178
    const-string v2, "RadialPickerLayout"

    const-string v5, "Time has already been initialized."

    invoke-static {v2, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    :goto_d
    return-void

    .line 182
    :cond_e
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTimePickerDialog:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    .line 183
    move/from16 v0, p5

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIs24HourMode:Z

    .line 184
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAccessibilityManager:Landroid/view/accessibility/AccessibilityManager;

    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    move-result v2

    if-nez v2, :cond_2a

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIs24HourMode:Z

    if-eqz v2, :cond_d8

    :cond_2a
    const/4 v2, 0x1

    :goto_2b
    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHideAmPm:Z

    .line 187
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCircleView:Lcom/wdullaer/materialdatetimepicker/time/CircleView;

    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHideAmPm:Z

    move-object/from16 v0, p1

    invoke-virtual {v2, v0, v5}, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->initialize(Landroid/content/Context;Z)V

    .line 188
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCircleView:Lcom/wdullaer/materialdatetimepicker/time/CircleView;

    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->invalidate()V

    .line 189
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHideAmPm:Z

    if-nez v2, :cond_60

    .line 190
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    const/16 v2, 0xc

    move/from16 v0, p3

    if-ge v0, v2, :cond_db

    const/4 v2, 0x0

    :goto_54
    move-object/from16 v0, p1

    invoke-virtual {v5, v0, v2}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->initialize(Landroid/content/Context;I)V

    .line 191
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->invalidate()V

    .line 195
    :cond_60
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 196
    .local v3, "res":Landroid/content/res/Resources;
    const/16 v2, 0xc

    new-array v0, v2, [I

    move-object/from16 v18, v0

    fill-array-data v18, :array_182

    .line 197
    .local v18, "hours":[I
    const/16 v2, 0xc

    new-array v0, v2, [I

    move-object/from16 v19, v0

    fill-array-data v19, :array_19e

    .line 198
    .local v19, "hours_24":[I
    const/16 v2, 0xc

    new-array v0, v2, [I

    move-object/from16 v22, v0

    fill-array-data v22, :array_1ba

    .line 199
    .local v22, "minutes":[I
    const/16 v2, 0xc

    new-array v4, v2, [Ljava/lang/String;

    .line 200
    .local v4, "hoursTexts":[Ljava/lang/String;
    const/16 v2, 0xc

    new-array v0, v2, [Ljava/lang/String;

    move-object/from16 v21, v0

    .line 201
    .local v21, "innerHoursTexts":[Ljava/lang/String;
    const/16 v2, 0xc

    new-array v0, v2, [Ljava/lang/String;

    move-object/from16 v23, v0

    .line 202
    .local v23, "minutesTexts":[Ljava/lang/String;
    const/16 v20, 0x0

    .local v20, "i":I
    :goto_91
    const/16 v2, 0xc

    move/from16 v0, v20

    if-ge v0, v2, :cond_f1

    .line 203
    if-eqz p5, :cond_de

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

    :goto_ab
    aput-object v2, v4, v20

    .line 205
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

    .line 206
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

    .line 202
    add-int/lit8 v20, v20, 0x1

    goto :goto_91

    .line 184
    .end local v3    # "res":Landroid/content/res/Resources;
    .end local v4    # "hoursTexts":[Ljava/lang/String;
    .end local v18    # "hours":[I
    .end local v19    # "hours_24":[I
    .end local v20    # "i":I
    .end local v21    # "innerHoursTexts":[Ljava/lang/String;
    .end local v22    # "minutes":[I
    .end local v23    # "minutesTexts":[Ljava/lang/String;
    :cond_d8
    const/4 v2, 0x0

    goto/16 :goto_2b

    .line 190
    :cond_db
    const/4 v2, 0x1

    goto/16 :goto_54

    .line 203
    .restart local v3    # "res":Landroid/content/res/Resources;
    .restart local v4    # "hoursTexts":[Ljava/lang/String;
    .restart local v18    # "hours":[I
    .restart local v19    # "hours_24":[I
    .restart local v20    # "i":I
    .restart local v21    # "innerHoursTexts":[Ljava/lang/String;
    .restart local v22    # "minutes":[I
    .restart local v23    # "minutesTexts":[Ljava/lang/String;
    :cond_de
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

    goto :goto_ab

    .line 208
    :cond_f1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    if-eqz p5, :cond_179

    move-object/from16 v5, v21

    :goto_f9
    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHideAmPm:Z

    const/4 v7, 0x1

    invoke-virtual/range {v2 .. v7}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->initialize(Landroid/content/res/Resources;[Ljava/lang/String;[Ljava/lang/String;ZZ)V

    .line 210
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    if-eqz p5, :cond_17c

    move/from16 v2, p3

    :goto_109
    invoke-virtual {v5, v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 211
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->invalidate()V

    .line 212
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHideAmPm:Z

    const/4 v10, 0x0

    move-object v6, v3

    move-object/from16 v7, v23

    invoke-virtual/range {v5 .. v10}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->initialize(Landroid/content/res/Resources;[Ljava/lang/String;[Ljava/lang/String;ZZ)V

    .line 213
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    move/from16 v0, p4

    invoke-virtual {v2, v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 214
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->invalidate()V

    .line 217
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move/from16 v1, p3

    invoke-direct {v0, v2, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setValueForItem(II)V

    .line 218
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p4

    invoke-direct {v0, v2, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setValueForItem(II)V

    .line 219
    rem-int/lit8 v2, p3, 0xc

    mul-int/lit8 v10, v2, 0x1e

    .line 220
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

    .line 222
    mul-int/lit8 v16, p4, 0x6

    .line 223
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

    .line 226
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTimeInitialized:Z

    goto/16 :goto_d

    .line 208
    .end local v10    # "hourDegrees":I
    .end local v16    # "minuteDegrees":I
    :cond_179
    const/4 v5, 0x0

    goto/16 :goto_f9

    .line 210
    :cond_17c
    rem-int/lit8 v2, p3, 0xc

    aget v2, v18, v2

    goto :goto_109

    .line 196
    nop

    :array_182
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

    .line 197
    :array_19e
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

    .line 198
    :array_1ba
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
    .registers 4
    .param p1, "info"    # Landroid/view/accessibility/AccessibilityNodeInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 777
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 778
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_14

    .line 779
    sget-object v0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_SCROLL_BACKWARD:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 780
    sget-object v0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_SCROLL_FORWARD:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 786
    :goto_13
    return-void

    .line 783
    :cond_14
    const/16 v0, 0x1000

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 784
    const/16 v0, 0x2000

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    goto :goto_13
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 17
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 594
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    .line 595
    .local v4, "eventX":F
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    .line 598
    .local v5, "eventY":F
    const/4 v10, 0x1

    new-array v7, v10, [Ljava/lang/Boolean;

    .line 599
    .local v7, "isInnerCircle":[Ljava/lang/Boolean;
    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    aput-object v11, v7, v10

    .line 601
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v10

    packed-switch v10, :pswitch_data_1c8

    .line 752
    :cond_1a
    :goto_1a
    const/4 v10, 0x0

    :goto_1b
    return v10

    .line 603
    :pswitch_1c
    iget-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mInputEnabled:Z

    if-nez v10, :cond_22

    .line 604
    const/4 v10, 0x1

    goto :goto_1b

    .line 607
    :cond_22
    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDownX:F

    .line 608
    iput v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDownY:F

    .line 610
    const/4 v10, -0x1

    iput v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mLastValueSelected:I

    .line 611
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingMove:Z

    .line 612
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingTouch:Z

    .line 614
    iget-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHideAmPm:Z

    if-nez v10, :cond_5b

    .line 615
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v10, v4, v5}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->getIsTouchingAmOrPm(FF)I

    move-result v10

    iput v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    .line 619
    :goto_3b
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    if-eqz v10, :cond_44

    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    const/4 v11, 0x1

    if-ne v10, v11, :cond_5f

    .line 622
    :cond_44
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTimePickerDialog:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    invoke-virtual {v10}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->tryVibrate()V

    .line 623
    const/4 v10, -0x1

    iput v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDownDegrees:I

    .line 624
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHandler:Landroid/os/Handler;

    new-instance v11, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$1;

    invoke-direct {v11, p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$1;-><init>(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)V

    iget v12, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->TAP_TIMEOUT:I

    int-to-long v12, v12

    invoke-virtual {v10, v11, v12, v13}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 653
    :cond_59
    :goto_59
    const/4 v10, 0x1

    goto :goto_1b

    .line 617
    :cond_5b
    const/4 v10, -0x1

    iput v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    goto :goto_3b

    .line 634
    :cond_5f
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAccessibilityManager:Landroid/view/accessibility/AccessibilityManager;

    invoke-virtual {v10}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    move-result v6

    .line 636
    .local v6, "forceLegal":Z
    invoke-direct {p0, v4, v5, v6, v7}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getDegreesFromCoords(FFZ[Ljava/lang/Boolean;)I

    move-result v10

    iput v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDownDegrees:I

    .line 637
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDownDegrees:I

    const/4 v11, -0x1

    if-eq v10, v11, :cond_59

    .line 640
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTimePickerDialog:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    invoke-virtual {v10}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->tryVibrate()V

    .line 641
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHandler:Landroid/os/Handler;

    new-instance v11, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$2;

    invoke-direct {v11, p0, v7}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$2;-><init>(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;[Ljava/lang/Boolean;)V

    iget v12, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->TAP_TIMEOUT:I

    int-to-long v12, v12

    invoke-virtual {v10, v11, v12, v13}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_59

    .line 655
    .end local v6    # "forceLegal":Z
    :pswitch_83
    iget-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mInputEnabled:Z

    if-nez v10, :cond_90

    .line 657
    const-string v10, "RadialPickerLayout"

    const-string v11, "Input was disabled, but received ACTION_MOVE."

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 658
    const/4 v10, 0x1

    goto :goto_1b

    .line 661
    :cond_90
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDownY:F

    sub-float v10, v5, v10

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v2

    .line 662
    .local v2, "dY":F
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDownX:F

    sub-float v10, v4, v10

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 664
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

    .line 672
    :cond_b2
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    if-eqz v10, :cond_bb

    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    const/4 v11, 0x1

    if-ne v10, v11, :cond_db

    .line 673
    :cond_bb
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHandler:Landroid/os/Handler;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 674
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v10, v4, v5}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->getIsTouchingAmOrPm(FF)I

    move-result v8

    .line 675
    .local v8, "isTouchingAmOrPm":I
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    if-eq v8, v10, :cond_1a

    .line 676
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    const/4 v11, -0x1

    invoke-virtual {v10, v11}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->setAmOrPmPressed(I)V

    .line 677
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v10}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->invalidate()V

    .line 678
    const/4 v10, -0x1

    iput v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    goto/16 :goto_1a

    .line 683
    .end local v8    # "isTouchingAmOrPm":I
    :cond_db
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDownDegrees:I

    const/4 v11, -0x1

    if-eq v10, v11, :cond_1a

    .line 689
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingMove:Z

    .line 690
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHandler:Landroid/os/Handler;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 691
    const/4 v10, 0x1

    invoke-direct {p0, v4, v5, v10, v7}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getDegreesFromCoords(FFZ[Ljava/lang/Boolean;)I

    move-result v3

    .line 692
    .local v3, "degrees":I
    const/4 v10, -0x1

    if-eq v3, v10, :cond_113

    .line 693
    const/4 v10, 0x0

    aget-object v10, v7, v10

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    const/4 v11, 0x0

    const/4 v12, 0x1

    invoke-direct {p0, v3, v10, v11, v12}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->reselectSelector(IZZZ)I

    move-result v9

    .line 694
    .local v9, "value":I
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mLastValueSelected:I

    if-eq v9, v10, :cond_113

    .line 695
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTimePickerDialog:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    invoke-virtual {v10}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->tryVibrate()V

    .line 696
    iput v9, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mLastValueSelected:I

    .line 697
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mListener:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;

    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v11

    const/4 v12, 0x0

    invoke-interface {v10, v11, v9, v12}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;->onValueSelected(IIZ)V

    .line 700
    .end local v9    # "value":I
    :cond_113
    const/4 v10, 0x1

    goto/16 :goto_1b

    .line 702
    .end local v1    # "dX":F
    .end local v2    # "dY":F
    .end local v3    # "degrees":I
    :pswitch_116
    iget-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mInputEnabled:Z

    if-nez v10, :cond_12c

    .line 704
    const-string v10, "RadialPickerLayout"

    const-string v11, "Input was disabled, but received ACTION_UP."

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 705
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mListener:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;

    const/4 v11, 0x3

    const/4 v12, 0x1

    const/4 v13, 0x0

    invoke-interface {v10, v11, v12, v13}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;->onValueSelected(IIZ)V

    .line 706
    const/4 v10, 0x1

    goto/16 :goto_1b

    .line 709
    :cond_12c
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHandler:Landroid/os/Handler;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 710
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingTouch:Z

    .line 713
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    if-eqz v10, :cond_13e

    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    const/4 v11, 0x1

    if-ne v10, v11, :cond_170

    .line 714
    :cond_13e
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v10, v4, v5}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->getIsTouchingAmOrPm(FF)I

    move-result v8

    .line 715
    .restart local v8    # "isTouchingAmOrPm":I
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    const/4 v11, -0x1

    invoke-virtual {v10, v11}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->setAmOrPmPressed(I)V

    .line 716
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v10}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->invalidate()V

    .line 718
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    if-ne v8, v10, :cond_16b

    .line 719
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v10, v8}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->setAmOrPm(I)V

    .line 720
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getIsCurrentlyAmOrPm()I

    move-result v10

    if-eq v10, v8, :cond_16b

    .line 721
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mListener:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;

    const/4 v11, 0x2

    iget v12, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    const/4 v13, 0x0

    invoke-interface {v10, v11, v12, v13}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;->onValueSelected(IIZ)V

    .line 722
    const/4 v10, 0x2

    invoke-direct {p0, v10, v8}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setValueForItem(II)V

    .line 725
    :cond_16b
    const/4 v10, -0x1

    iput v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIsTouchingAmOrPm:I

    goto/16 :goto_1a

    .line 730
    .end local v8    # "isTouchingAmOrPm":I
    :cond_170
    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDownDegrees:I

    const/4 v11, -0x1

    if-eq v10, v11, :cond_1b5

    .line 731
    iget-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingMove:Z

    invoke-direct {p0, v4, v5, v10, v7}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getDegreesFromCoords(FFZ[Ljava/lang/Boolean;)I

    move-result v3

    .line 732
    .restart local v3    # "degrees":I
    const/4 v10, -0x1

    if-eq v3, v10, :cond_1b5

    .line 733
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

    .line 735
    .restart local v9    # "value":I
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v10

    if-nez v10, :cond_1a4

    iget-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIs24HourMode:Z

    if-nez v10, :cond_1a4

    .line 736
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getIsCurrentlyAmOrPm()I

    move-result v0

    .line 737
    .local v0, "amOrPm":I
    if-nez v0, :cond_1bd

    const/16 v10, 0xc

    if-ne v9, v10, :cond_1bd

    .line 738
    const/4 v9, 0x0

    .line 743
    .end local v0    # "amOrPm":I
    :cond_1a4
    :goto_1a4
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v10

    invoke-direct {p0, v10, v9}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setValueForItem(II)V

    .line 744
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mListener:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;

    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v11

    const/4 v12, 0x1

    invoke-interface {v10, v11, v9, v12}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;->onValueSelected(IIZ)V

    .line 747
    .end local v3    # "degrees":I
    .end local v9    # "value":I
    :cond_1b5
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingMove:Z

    .line 748
    const/4 v10, 0x1

    goto/16 :goto_1b

    .line 733
    .restart local v3    # "degrees":I
    :cond_1bb
    const/4 v10, 0x0

    goto :goto_18a

    .line 739
    .restart local v0    # "amOrPm":I
    .restart local v9    # "value":I
    :cond_1bd
    const/4 v10, 0x1

    if-ne v0, v10, :cond_1a4

    const/16 v10, 0xc

    if-eq v9, v10, :cond_1a4

    .line 740
    add-int/lit8 v9, v9, 0xc

    goto :goto_1a4

    .line 601
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

    .line 818
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 866
    :goto_8
    return v7

    .line 822
    :cond_9
    const/4 v0, 0x0

    .line 823
    .local v0, "changeMultiplier":I
    const/16 v9, 0x1000

    if-ne p1, v9, :cond_3e

    .line 824
    const/4 v0, 0x1

    .line 828
    :cond_f
    :goto_f
    if-eqz v0, :cond_53

    .line 829
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentlyShowingValue()I

    move-result v6

    .line 830
    .local v6, "value":I
    const/4 v5, 0x0

    .line 831
    .local v5, "stepSize":I
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v1

    .line 832
    .local v1, "currentItemShowing":I
    if-nez v1, :cond_44

    .line 833
    const/16 v5, 0x1e

    .line 834
    rem-int/lit8 v6, v6, 0xc

    .line 839
    :cond_20
    :goto_20
    mul-int v2, v6, v5

    .line 840
    .local v2, "degrees":I
    invoke-static {v2, v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->snapOnly30s(II)I

    move-result v2

    .line 841
    div-int v6, v2, v5

    .line 842
    const/4 v3, 0x0

    .line 843
    .local v3, "maxValue":I
    const/4 v4, 0x0

    .line 844
    .local v4, "minValue":I
    if-nez v1, :cond_4c

    .line 845
    iget-boolean v9, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mIs24HourMode:Z

    if-eqz v9, :cond_48

    .line 846
    const/16 v3, 0x17

    .line 854
    :goto_32
    if-le v6, v3, :cond_4f

    .line 856
    move v6, v4

    .line 861
    :cond_35
    :goto_35
    invoke-direct {p0, v1, v6}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setItem(II)V

    .line 862
    iget-object v9, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mListener:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;

    invoke-interface {v9, v1, v6, v8}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;->onValueSelected(IIZ)V

    goto :goto_8

    .line 825
    .end local v1    # "currentItemShowing":I
    .end local v2    # "degrees":I
    .end local v3    # "maxValue":I
    .end local v4    # "minValue":I
    .end local v5    # "stepSize":I
    .end local v6    # "value":I
    :cond_3e
    const/16 v9, 0x2000

    if-ne p1, v9, :cond_f

    .line 826
    const/4 v0, -0x1

    goto :goto_f

    .line 835
    .restart local v1    # "currentItemShowing":I
    .restart local v5    # "stepSize":I
    .restart local v6    # "value":I
    :cond_44
    if-ne v1, v7, :cond_20

    .line 836
    const/4 v5, 0x6

    goto :goto_20

    .line 848
    .restart local v2    # "degrees":I
    .restart local v3    # "maxValue":I
    .restart local v4    # "minValue":I
    :cond_48
    const/16 v3, 0xc

    .line 849
    const/4 v4, 0x1

    goto :goto_32

    .line 852
    :cond_4c
    const/16 v3, 0x37

    goto :goto_32

    .line 857
    :cond_4f
    if-ge v6, v4, :cond_35

    .line 859
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

    .line 866
    goto :goto_8
.end method

.method public setAccentColor(I)V
    .registers 3
    .param p1, "accentColor"    # I

    .prologue
    .line 239
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->setAccentColor(I)V

    .line 240
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->setAccentColor(I)V

    .line 241
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->setAccentColor(I)V

    .line 242
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCircleView:Lcom/wdullaer/materialdatetimepicker/time/CircleView;

    invoke-virtual {v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->setAccentColor(I)V

    .line 243
    return-void
.end method

.method public setAmOrPm(I)V
    .registers 3
    .param p1, "amOrPm"    # I

    .prologue
    .line 334
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->setAmOrPm(I)V

    .line 335
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->invalidate()V

    .line 336
    const/4 v0, 0x2

    invoke-direct {p0, v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setValueForItem(II)V

    .line 337
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

    .line 553
    if-eqz p1, :cond_23

    if-eq p1, v6, :cond_23

    .line 554
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

    .line 590
    :goto_22
    return-void

    .line 558
    :cond_23
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v2

    .line 559
    .local v2, "lastIndex":I
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCurrentItemShowing:I

    .line 561
    if-eqz p2, :cond_98

    if-eq p1, v2, :cond_98

    .line 562
    const/4 v5, 0x4

    new-array v0, v5, [Landroid/animation/ObjectAnimator;

    .line 563
    .local v0, "anims":[Landroid/animation/ObjectAnimator;
    if-ne p1, v6, :cond_75

    .line 564
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getDisappearAnimator()Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v0, v4

    .line 565
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getDisappearAnimator()Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v0, v6

    .line 566
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getReappearAnimator()Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v0, v7

    .line 567
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getReappearAnimator()Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v0, v8

    .line 575
    :cond_52
    :goto_52
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTransition:Landroid/animation/AnimatorSet;

    if-eqz v4, :cond_63

    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTransition:Landroid/animation/AnimatorSet;

    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v4

    if-eqz v4, :cond_63

    .line 576
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTransition:Landroid/animation/AnimatorSet;

    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->end()V

    .line 578
    :cond_63
    new-instance v4, Landroid/animation/AnimatorSet;

    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTransition:Landroid/animation/AnimatorSet;

    .line 579
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTransition:Landroid/animation/AnimatorSet;

    invoke-virtual {v4, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 580
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mTransition:Landroid/animation/AnimatorSet;

    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->start()V

    goto :goto_22

    .line 568
    :cond_75
    if-nez p1, :cond_52

    .line 569
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getReappearAnimator()Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v0, v4

    .line 570
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getReappearAnimator()Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v0, v6

    .line 571
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getDisappearAnimator()Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v0, v7

    .line 572
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getDisappearAnimator()Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v0, v8

    goto :goto_52

    .line 582
    .end local v0    # "anims":[Landroid/animation/ObjectAnimator;
    :cond_98
    if-nez p1, :cond_b7

    move v1, v3

    .line 583
    .local v1, "hourAlpha":I
    :goto_9b
    if-ne p1, v6, :cond_b9

    .line 584
    .local v3, "minuteAlpha":I
    :goto_9d
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    int-to-float v5, v1

    invoke-virtual {v4, v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setAlpha(F)V

    .line 585
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    int-to-float v5, v1

    invoke-virtual {v4, v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->setAlpha(F)V

    .line 586
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    int-to-float v5, v3

    invoke-virtual {v4, v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setAlpha(F)V

    .line 587
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    int-to-float v5, v3

    invoke-virtual {v4, v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->setAlpha(F)V

    goto/16 :goto_22

    .end local v1    # "hourAlpha":I
    .end local v3    # "minuteAlpha":I
    :cond_b7
    move v1, v4

    .line 582
    goto :goto_9b

    .restart local v1    # "hourAlpha":I
    :cond_b9
    move v3, v4

    .line 583
    goto :goto_9d
.end method

.method public setOnValueSelectedListener(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;

    .prologue
    .line 165
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mListener:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;

    .line 166
    return-void
.end method

.method setTheme(Landroid/content/Context;Z)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "themeDark"    # Z

    .prologue
    .line 230
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mCircleView:Lcom/wdullaer/materialdatetimepicker/time/CircleView;

    invoke-virtual {v0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->setTheme(Landroid/content/Context;Z)V

    .line 231
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mAmPmCirclesView:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    invoke-virtual {v0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->setTheme(Landroid/content/Context;Z)V

    .line 232
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setTheme(Landroid/content/Context;Z)V

    .line 233
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialTextsView:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    invoke-virtual {v0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setTheme(Landroid/content/Context;Z)V

    .line 234
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mHourRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->setTheme(Landroid/content/Context;Z)V

    .line 235
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mMinuteRadialSelectorView:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    invoke-virtual {v0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->setTheme(Landroid/content/Context;Z)V

    .line 236
    return-void
.end method

.method public setTime(II)V
    .registers 4
    .param p1, "hours"    # I
    .param p2, "minutes"    # I

    .prologue
    .line 246
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setItem(II)V

    .line 247
    const/4 v0, 0x1

    invoke-direct {p0, v0, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setItem(II)V

    .line 248
    return-void
.end method

.method public trySettingInputEnabled(Z)Z
    .registers 4
    .param p1, "inputEnabled"    # Z

    .prologue
    const/4 v0, 0x0

    .line 759
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mDoingTouch:Z

    if-eqz v1, :cond_8

    if-nez p1, :cond_8

    .line 767
    :goto_7
    return v0

    .line 765
    :cond_8
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mInputEnabled:Z

    .line 766
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->mGrayBox:Landroid/view/View;

    if-eqz p1, :cond_f

    const/4 v0, 0x4

    :cond_f
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 767
    const/4 v0, 0x1

    goto :goto_7
.end method
