.class public Lcom/rey/material/widget/DatePicker;
.super Lcom/rey/material/widget/ListView;
.source "DatePicker.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/widget/DatePicker$MonthAdapter;,
        Lcom/rey/material/widget/DatePicker$MonthView;,
        Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;,
        Lcom/rey/material/widget/DatePicker$OnDateChangedListener;
    }
.end annotation


# static fields
.field private static final DAY_FORMAT:Ljava/lang/String; = "%2d"

.field protected static final LIST_TOP_OFFSET:I = -0x1

.field protected static final SCROLL_CHANGE_DELAY:I = 0x28

.field protected static final SCROLL_DURATION:I = 0xfa

.field private static final YEAR_FORMAT:Ljava/lang/String; = "%4d"

.field private static mDayTexts:[Ljava/lang/String;


# instance fields
.field private mAdapter:Lcom/rey/material/widget/DatePicker$MonthAdapter;

.field private mAnimDuration:I

.field private mCalendar:Ljava/util/Calendar;

.field protected mCurrentScrollState:I

.field private mDayBaseHeight:F

.field private mDayBaseWidth:F

.field private mDayHeight:F

.field private mDayPadding:I

.field private mDayWidth:F

.field private mFirstDayOfWeek:I

.field protected mFriction:F

.field protected mHandler:Landroid/os/Handler;

.field private mInInterpolator:Landroid/view/animation/Interpolator;

.field private mLabels:[Ljava/lang/String;

.field private mMonthRealHeight:I

.field private mMonthRealWidth:I

.field private mOnDateChangedListener:Lcom/rey/material/widget/DatePicker$OnDateChangedListener;

.field private mOutInterpolator:Landroid/view/animation/Interpolator;

.field private mPaddingBottom:I

.field private mPaddingLeft:I

.field private mPaddingRight:I

.field private mPaddingTop:I

.field private mPaint:Landroid/graphics/Paint;

.field protected mPreviousScrollPosition:J

.field protected mPreviousScrollState:I

.field protected mScrollStateChangedRunnable:Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;

.field private mSelectionColor:I

.field private mSelectionRadius:F

.field private mTextColor:I

.field private mTextDisableColor:I

.field private mTextHighlightColor:I

.field private mTextLabelColor:I

.field private mTextSize:I

.field private mTypeface:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 108
    invoke-direct {p0, p1}, Lcom/rey/material/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 91
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/DatePicker;->mHandler:Landroid/os/Handler;

    .line 93
    iput v1, p0, Lcom/rey/material/widget/DatePicker;->mCurrentScrollState:I

    .line 95
    iput v1, p0, Lcom/rey/material/widget/DatePicker;->mPreviousScrollState:I

    .line 96
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/rey/material/widget/DatePicker;->mFriction:F

    .line 97
    new-instance v0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;

    invoke-direct {v0, p0, v2}, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;-><init>(Lcom/rey/material/widget/DatePicker;Lcom/rey/material/widget/DatePicker$1;)V

    iput-object v0, p0, Lcom/rey/material/widget/DatePicker;->mScrollStateChangedRunnable:Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;

    .line 110
    invoke-virtual {p0, p1, v2, v1, v1}, Lcom/rey/material/widget/DatePicker;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 111
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, 0x0

    .line 114
    invoke-direct {p0, p1, p2}, Lcom/rey/material/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 91
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/DatePicker;->mHandler:Landroid/os/Handler;

    .line 93
    iput v2, p0, Lcom/rey/material/widget/DatePicker;->mCurrentScrollState:I

    .line 95
    iput v2, p0, Lcom/rey/material/widget/DatePicker;->mPreviousScrollState:I

    .line 96
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/rey/material/widget/DatePicker;->mFriction:F

    .line 97
    new-instance v0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;-><init>(Lcom/rey/material/widget/DatePicker;Lcom/rey/material/widget/DatePicker$1;)V

    iput-object v0, p0, Lcom/rey/material/widget/DatePicker;->mScrollStateChangedRunnable:Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;

    .line 116
    invoke-virtual {p0, p1, p2, v2, v2}, Lcom/rey/material/widget/DatePicker;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 117
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v2, 0x0

    .line 120
    invoke-direct {p0, p1, p2, p3}, Lcom/rey/material/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 91
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/DatePicker;->mHandler:Landroid/os/Handler;

    .line 93
    iput v2, p0, Lcom/rey/material/widget/DatePicker;->mCurrentScrollState:I

    .line 95
    iput v2, p0, Lcom/rey/material/widget/DatePicker;->mPreviousScrollState:I

    .line 96
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/rey/material/widget/DatePicker;->mFriction:F

    .line 97
    new-instance v0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;-><init>(Lcom/rey/material/widget/DatePicker;Lcom/rey/material/widget/DatePicker$1;)V

    iput-object v0, p0, Lcom/rey/material/widget/DatePicker;->mScrollStateChangedRunnable:Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;

    .line 122
    invoke-virtual {p0, p1, p2, p3, v2}, Lcom/rey/material/widget/DatePicker;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 123
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/4 v1, 0x0

    .line 126
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 91
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/DatePicker;->mHandler:Landroid/os/Handler;

    .line 93
    iput v1, p0, Lcom/rey/material/widget/DatePicker;->mCurrentScrollState:I

    .line 95
    iput v1, p0, Lcom/rey/material/widget/DatePicker;->mPreviousScrollState:I

    .line 96
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/rey/material/widget/DatePicker;->mFriction:F

    .line 97
    new-instance v0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;-><init>(Lcom/rey/material/widget/DatePicker;Lcom/rey/material/widget/DatePicker$1;)V

    iput-object v0, p0, Lcom/rey/material/widget/DatePicker;->mScrollStateChangedRunnable:Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;

    .line 128
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/DatePicker;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 129
    return-void
.end method

.method static synthetic access$1000(Lcom/rey/material/widget/DatePicker;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mDayPadding:I

    return v0
.end method

.method static synthetic access$1100(Lcom/rey/material/widget/DatePicker;)F
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mDayBaseHeight:F

    return v0
.end method

.method static synthetic access$1200(Lcom/rey/material/widget/DatePicker;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mTextColor:I

    return v0
.end method

.method static synthetic access$1300(Lcom/rey/material/widget/DatePicker;)F
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mDayHeight:F

    return v0
.end method

.method static synthetic access$1400(Lcom/rey/material/widget/DatePicker;)Landroid/view/animation/Interpolator;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mInInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/rey/material/widget/DatePicker;)F
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mSelectionRadius:F

    return v0
.end method

.method static synthetic access$1600(Lcom/rey/material/widget/DatePicker;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mSelectionColor:I

    return v0
.end method

.method static synthetic access$1700(Lcom/rey/material/widget/DatePicker;)Landroid/view/animation/Interpolator;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mOutInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/rey/material/widget/DatePicker;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mTextLabelColor:I

    return v0
.end method

.method static synthetic access$1900(Lcom/rey/material/widget/DatePicker;)[Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mLabels:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/rey/material/widget/DatePicker;)Ljava/util/Calendar;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/rey/material/widget/DatePicker;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mTextHighlightColor:I

    return v0
.end method

.method static synthetic access$2100(Lcom/rey/material/widget/DatePicker;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mTextDisableColor:I

    return v0
.end method

.method static synthetic access$2200(Lcom/rey/material/widget/DatePicker;I)Ljava/lang/String;
    .registers 3
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;
    .param p1, "x1"    # I

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/rey/material/widget/DatePicker;->getDayText(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2300(Lcom/rey/material/widget/DatePicker;)Lcom/rey/material/widget/DatePicker$MonthAdapter;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mAdapter:Lcom/rey/material/widget/DatePicker$MonthAdapter;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/rey/material/widget/DatePicker;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mAnimDuration:I

    return v0
.end method

.method static synthetic access$2600(Lcom/rey/material/widget/DatePicker;)Lcom/rey/material/widget/DatePicker$OnDateChangedListener;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mOnDateChangedListener:Lcom/rey/material/widget/DatePicker$OnDateChangedListener;

    return-object v0
.end method

.method static synthetic access$2700(Lcom/rey/material/widget/DatePicker;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mPaddingLeft:I

    return v0
.end method

.method static synthetic access$2800(Lcom/rey/material/widget/DatePicker;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mPaddingTop:I

    return v0
.end method

.method static synthetic access$2900(Lcom/rey/material/widget/DatePicker;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mPaddingRight:I

    return v0
.end method

.method static synthetic access$300(Lcom/rey/material/widget/DatePicker;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mFirstDayOfWeek:I

    return v0
.end method

.method static synthetic access$3000(Lcom/rey/material/widget/DatePicker;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mPaddingBottom:I

    return v0
.end method

.method static synthetic access$400(Lcom/rey/material/widget/DatePicker;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mMonthRealWidth:I

    return v0
.end method

.method static synthetic access$500(Lcom/rey/material/widget/DatePicker;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mMonthRealHeight:I

    return v0
.end method

.method static synthetic access$600(Lcom/rey/material/widget/DatePicker;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mTextSize:I

    return v0
.end method

.method static synthetic access$700(Lcom/rey/material/widget/DatePicker;)Landroid/graphics/Paint;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method static synthetic access$800(Lcom/rey/material/widget/DatePicker;)Landroid/graphics/Typeface;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mTypeface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method static synthetic access$900(Lcom/rey/material/widget/DatePicker;)F
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker;

    .prologue
    .line 38
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mDayWidth:F

    return v0
.end method

.method private getDayText(I)Ljava/lang/String;
    .registers 8
    .param p1, "day"    # I

    .prologue
    .line 372
    sget-object v0, Lcom/rey/material/widget/DatePicker;->mDayTexts:[Ljava/lang/String;

    if-nez v0, :cond_12

    .line 373
    const-class v1, Lcom/rey/material/widget/DatePicker;

    monitor-enter v1

    .line 374
    :try_start_7
    sget-object v0, Lcom/rey/material/widget/DatePicker;->mDayTexts:[Ljava/lang/String;

    if-nez v0, :cond_11

    .line 375
    const/16 v0, 0x1f

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lcom/rey/material/widget/DatePicker;->mDayTexts:[Ljava/lang/String;

    .line 376
    :cond_11
    monitor-exit v1
    :try_end_12
    .catchall {:try_start_7 .. :try_end_12} :catchall_37

    .line 379
    :cond_12
    sget-object v0, Lcom/rey/material/widget/DatePicker;->mDayTexts:[Ljava/lang/String;

    add-int/lit8 v1, p1, -0x1

    aget-object v0, v0, v1

    if-nez v0, :cond_30

    .line 380
    sget-object v0, Lcom/rey/material/widget/DatePicker;->mDayTexts:[Ljava/lang/String;

    add-int/lit8 v1, p1, -0x1

    const-string v2, "%2d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 382
    :cond_30
    sget-object v0, Lcom/rey/material/widget/DatePicker;->mDayTexts:[Ljava/lang/String;

    add-int/lit8 v1, p1, -0x1

    aget-object v0, v0, v1

    return-object v0

    .line 376
    :catchall_37
    move-exception v0

    :try_start_38
    monitor-exit v1
    :try_end_39
    .catchall {:try_start_38 .. :try_end_39} :catchall_37

    throw v0
.end method

.method private measureBaseSize()V
    .registers 6

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x0

    .line 302
    iget-object v1, p0, Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/rey/material/widget/DatePicker;->mTextSize:I

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 303
    iget-object v1, p0, Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/rey/material/widget/DatePicker;->mTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 304
    iget-object v1, p0, Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;

    const-string v2, "88"

    invoke-virtual {v1, v2, v3, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v1

    iget v2, p0, Lcom/rey/material/widget/DatePicker;->mDayPadding:I

    mul-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    add-float/2addr v1, v2

    iput v1, p0, Lcom/rey/material/widget/DatePicker;->mDayBaseWidth:F

    .line 306
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 307
    .local v0, "bounds":Landroid/graphics/Rect;
    iget-object v1, p0, Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;

    const-string v2, "88"

    invoke-virtual {v1, v2, v3, v4, v0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 308
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lcom/rey/material/widget/DatePicker;->mDayBaseHeight:F

    .line 309
    return-void
.end method

.method private measureMonthView(II)V
    .registers 12
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 312
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v5

    .line 313
    .local v5, "widthMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v6

    .line 314
    .local v6, "widthSize":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 315
    .local v1, "heightMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 317
    .local v2, "heightSize":I
    invoke-direct {p0}, Lcom/rey/material/widget/DatePicker;->measureBaseSize()V

    .line 319
    iget v7, p0, Lcom/rey/material/widget/DatePicker;->mDayBaseWidth:F

    iget v8, p0, Lcom/rey/material/widget/DatePicker;->mDayBaseHeight:F

    invoke-static {v7, v8}, Ljava/lang/Math;->max(FF)F

    move-result v7

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 321
    .local v3, "size":I
    mul-int/lit8 v7, v3, 0x7

    iget v8, p0, Lcom/rey/material/widget/DatePicker;->mPaddingLeft:I

    add-int/2addr v7, v8

    iget v8, p0, Lcom/rey/material/widget/DatePicker;->mPaddingRight:I

    add-int v4, v7, v8

    .line 322
    .local v4, "width":I
    mul-int/lit8 v7, v3, 0x7

    int-to-float v7, v7

    iget v8, p0, Lcom/rey/material/widget/DatePicker;->mDayBaseHeight:F

    add-float/2addr v7, v8

    iget v8, p0, Lcom/rey/material/widget/DatePicker;->mDayPadding:I

    mul-int/lit8 v8, v8, 0x2

    int-to-float v8, v8

    add-float/2addr v7, v8

    iget v8, p0, Lcom/rey/material/widget/DatePicker;->mPaddingTop:I

    int-to-float v8, v8

    add-float/2addr v7, v8

    iget v8, p0, Lcom/rey/material/widget/DatePicker;->mPaddingBottom:I

    int-to-float v8, v8

    add-float/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 324
    .local v0, "height":I
    sparse-switch v5, :sswitch_data_5a

    .line 333
    :goto_43
    sparse-switch v1, :sswitch_data_64

    .line 342
    :goto_46
    iput v4, p0, Lcom/rey/material/widget/DatePicker;->mMonthRealWidth:I

    .line 343
    iput v0, p0, Lcom/rey/material/widget/DatePicker;->mMonthRealHeight:I

    .line 344
    return-void

    .line 326
    :sswitch_4b
    invoke-static {v4, v6}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 327
    goto :goto_43

    .line 329
    :sswitch_50
    move v4, v6

    goto :goto_43

    .line 335
    :sswitch_52
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 336
    goto :goto_46

    .line 338
    :sswitch_57
    move v0, v2

    goto :goto_46

    .line 324
    nop

    :sswitch_data_5a
    .sparse-switch
        -0x80000000 -> :sswitch_4b
        0x40000000 -> :sswitch_50
    .end sparse-switch

    .line 333
    :sswitch_data_64
    .sparse-switch
        -0x80000000 -> :sswitch_52
        0x40000000 -> :sswitch_57
    .end sparse-switch
.end method

.method private setFrictionIfSupported(F)V
    .registers 4
    .param p1, "friction"    # F
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 281
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_9

    .line 282
    invoke-virtual {p0, p1}, Lcom/rey/material/widget/DatePicker;->setFriction(F)V

    .line 283
    :cond_9
    return-void
.end method


# virtual methods
.method protected applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 24
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 180
    invoke-super/range {p0 .. p4}, Lcom/rey/material/widget/ListView;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 182
    sget-object v17, Lcom/rey/material/R$styleable;->DatePicker:[I

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, v17

    move/from16 v3, p3

    move/from16 v4, p4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v5

    .line 184
    .local v5, "a":Landroid/content/res/TypedArray;
    const/4 v8, 0x0

    .line 185
    .local v8, "familyName":Ljava/lang/String;
    const/16 v16, -0x1

    .line 187
    .local v16, "style":I
    const/4 v10, -0x1

    .line 188
    .local v10, "padding":I
    const/4 v13, -0x1

    .line 189
    .local v13, "paddingLeft":I
    const/4 v14, -0x1

    .line 190
    .local v14, "paddingRight":I
    const/4 v15, -0x1

    .line 191
    .local v15, "paddingTop":I
    const/4 v11, -0x1

    .line 192
    .local v11, "paddingBottom":I
    const/4 v12, 0x0

    .line 194
    .local v12, "paddingDefined":Z
    const/4 v9, 0x0

    .local v9, "i":I
    invoke-virtual {v5}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v7

    .local v7, "count":I
    :goto_21
    if-ge v9, v7, :cond_169

    .line 195
    invoke-virtual {v5, v9}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v6

    .line 197
    .local v6, "attr":I
    sget v17, Lcom/rey/material/R$styleable;->DatePicker_dp_dayTextSize:I

    move/from16 v0, v17

    if-ne v6, v0, :cond_3e

    .line 198
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/rey/material/widget/DatePicker;->mTextSize:I

    .line 194
    :cond_3b
    :goto_3b
    add-int/lit8 v9, v9, 0x1

    goto :goto_21

    .line 199
    :cond_3e
    sget v17, Lcom/rey/material/R$styleable;->DatePicker_dp_textColor:I

    move/from16 v0, v17

    if-ne v6, v0, :cond_53

    .line 200
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/rey/material/widget/DatePicker;->mTextColor:I

    goto :goto_3b

    .line 201
    :cond_53
    sget v17, Lcom/rey/material/R$styleable;->DatePicker_dp_textHighlightColor:I

    move/from16 v0, v17

    if-ne v6, v0, :cond_68

    .line 202
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/rey/material/widget/DatePicker;->mTextHighlightColor:I

    goto :goto_3b

    .line 203
    :cond_68
    sget v17, Lcom/rey/material/R$styleable;->DatePicker_dp_textLabelColor:I

    move/from16 v0, v17

    if-ne v6, v0, :cond_7d

    .line 204
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/rey/material/widget/DatePicker;->mTextLabelColor:I

    goto :goto_3b

    .line 205
    :cond_7d
    sget v17, Lcom/rey/material/R$styleable;->DatePicker_dp_textDisableColor:I

    move/from16 v0, v17

    if-ne v6, v0, :cond_92

    .line 206
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/rey/material/widget/DatePicker;->mTextDisableColor:I

    goto :goto_3b

    .line 207
    :cond_92
    sget v17, Lcom/rey/material/R$styleable;->DatePicker_dp_selectionColor:I

    move/from16 v0, v17

    if-ne v6, v0, :cond_a7

    .line 208
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/rey/material/widget/DatePicker;->mSelectionColor:I

    goto :goto_3b

    .line 209
    :cond_a7
    sget v17, Lcom/rey/material/R$styleable;->DatePicker_dp_animDuration:I

    move/from16 v0, v17

    if-ne v6, v0, :cond_bc

    .line 210
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/rey/material/widget/DatePicker;->mAnimDuration:I

    goto :goto_3b

    .line 211
    :cond_bc
    sget v17, Lcom/rey/material/R$styleable;->DatePicker_dp_inInterpolator:I

    move/from16 v0, v17

    if-ne v6, v0, :cond_da

    .line 212
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v17

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/rey/material/widget/DatePicker;->mInInterpolator:Landroid/view/animation/Interpolator;

    goto/16 :goto_3b

    .line 213
    :cond_da
    sget v17, Lcom/rey/material/R$styleable;->DatePicker_dp_outInterpolator:I

    move/from16 v0, v17

    if-ne v6, v0, :cond_f8

    .line 214
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v17

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/rey/material/widget/DatePicker;->mOutInterpolator:Landroid/view/animation/Interpolator;

    goto/16 :goto_3b

    .line 215
    :cond_f8
    sget v17, Lcom/rey/material/R$styleable;->DatePicker_dp_fontFamily:I

    move/from16 v0, v17

    if-ne v6, v0, :cond_104

    .line 216
    invoke-virtual {v5, v6}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_3b

    .line 217
    :cond_104
    sget v17, Lcom/rey/material/R$styleable;->DatePicker_dp_textStyle:I

    move/from16 v0, v17

    if-ne v6, v0, :cond_114

    .line 218
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v16

    goto/16 :goto_3b

    .line 219
    :cond_114
    sget v17, Lcom/rey/material/R$styleable;->DatePicker_android_padding:I

    move/from16 v0, v17

    if-ne v6, v0, :cond_125

    .line 220
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v10

    .line 221
    const/4 v12, 0x1

    goto/16 :goto_3b

    .line 223
    :cond_125
    sget v17, Lcom/rey/material/R$styleable;->DatePicker_android_paddingLeft:I

    move/from16 v0, v17

    if-ne v6, v0, :cond_136

    .line 224
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v13

    .line 225
    const/4 v12, 0x1

    goto/16 :goto_3b

    .line 227
    :cond_136
    sget v17, Lcom/rey/material/R$styleable;->DatePicker_android_paddingTop:I

    move/from16 v0, v17

    if-ne v6, v0, :cond_147

    .line 228
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v15

    .line 229
    const/4 v12, 0x1

    goto/16 :goto_3b

    .line 231
    :cond_147
    sget v17, Lcom/rey/material/R$styleable;->DatePicker_android_paddingRight:I

    move/from16 v0, v17

    if-ne v6, v0, :cond_158

    .line 232
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v14

    .line 233
    const/4 v12, 0x1

    goto/16 :goto_3b

    .line 235
    :cond_158
    sget v17, Lcom/rey/material/R$styleable;->DatePicker_android_paddingBottom:I

    move/from16 v0, v17

    if-ne v6, v0, :cond_3b

    .line 236
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v11

    .line 237
    const/4 v12, 0x1

    goto/16 :goto_3b

    .line 241
    .end local v6    # "attr":I
    :cond_169
    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/widget/DatePicker;->mTextSize:I

    move/from16 v17, v0

    if-gez v17, :cond_181

    .line 242
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    sget v18, Lcom/rey/material/R$dimen;->abc_text_size_caption_material:I

    invoke-virtual/range {v17 .. v18}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/rey/material/widget/DatePicker;->mTextSize:I

    .line 244
    :cond_181
    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/widget/DatePicker;->mAnimDuration:I

    move/from16 v17, v0

    if-gez v17, :cond_19a

    .line 245
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    const v18, 0x10e0001

    invoke-virtual/range {v17 .. v18}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/rey/material/widget/DatePicker;->mAnimDuration:I

    .line 247
    :cond_19a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/DatePicker;->mInInterpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v17, v0

    if-nez v17, :cond_1ad

    .line 248
    new-instance v17, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct/range {v17 .. v17}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/rey/material/widget/DatePicker;->mInInterpolator:Landroid/view/animation/Interpolator;

    .line 250
    :cond_1ad
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/DatePicker;->mOutInterpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v17, v0

    if-nez v17, :cond_1c0

    .line 251
    new-instance v17, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct/range {v17 .. v17}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/rey/material/widget/DatePicker;->mOutInterpolator:Landroid/view/animation/Interpolator;

    .line 253
    :cond_1c0
    if-nez v8, :cond_1c4

    if-ltz v16, :cond_1d2

    .line 254
    :cond_1c4
    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-static {v0, v8, v1}, Lcom/rey/material/util/TypefaceUtil;->load(Landroid/content/Context;Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/rey/material/widget/DatePicker;->mTypeface:Landroid/graphics/Typeface;

    .line 256
    :cond_1d2
    invoke-virtual {v5}, Landroid/content/res/TypedArray;->recycle()V

    .line 258
    if-eqz v12, :cond_1f6

    .line 259
    if-ltz v10, :cond_1de

    .line 260
    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v10, v10, v10}, Lcom/rey/material/widget/DatePicker;->setContentPadding(IIII)V

    .line 262
    :cond_1de
    if-ltz v13, :cond_1e4

    .line 263
    move-object/from16 v0, p0

    iput v13, v0, Lcom/rey/material/widget/DatePicker;->mPaddingLeft:I

    .line 265
    :cond_1e4
    if-ltz v15, :cond_1ea

    .line 266
    move-object/from16 v0, p0

    iput v15, v0, Lcom/rey/material/widget/DatePicker;->mPaddingTop:I

    .line 268
    :cond_1ea
    if-ltz v14, :cond_1f0

    .line 269
    move-object/from16 v0, p0

    iput v14, v0, Lcom/rey/material/widget/DatePicker;->mPaddingRight:I

    .line 271
    :cond_1f0
    if-ltz v11, :cond_1f6

    .line 272
    move-object/from16 v0, p0

    iput v11, v0, Lcom/rey/material/widget/DatePicker;->mPaddingBottom:I

    .line 275
    :cond_1f6
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/DatePicker;->requestLayout()V

    .line 276
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/DatePicker;->mAdapter:Lcom/rey/material/widget/DatePicker$MonthAdapter;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/rey/material/widget/DatePicker$MonthAdapter;->notifyDataSetInvalidated()V

    .line 277
    return-void
.end method

.method public getCalendar()Ljava/util/Calendar;
    .registers 2

    .prologue
    .line 502
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;

    return-object v0
.end method

.method public getDay()I
    .registers 2

    .prologue
    .line 444
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mAdapter:Lcom/rey/material/widget/DatePicker$MonthAdapter;

    invoke-virtual {v0}, Lcom/rey/material/widget/DatePicker$MonthAdapter;->getDay()I

    move-result v0

    return v0
.end method

.method public getFormattedDate(Ljava/text/DateFormat;)Ljava/lang/String;
    .registers 5
    .param p1, "formatter"    # Ljava/text/DateFormat;

    .prologue
    .line 467
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/rey/material/widget/DatePicker;->mAdapter:Lcom/rey/material/widget/DatePicker$MonthAdapter;

    invoke-virtual {v2}, Lcom/rey/material/widget/DatePicker$MonthAdapter;->getYear()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 468
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/rey/material/widget/DatePicker;->mAdapter:Lcom/rey/material/widget/DatePicker$MonthAdapter;

    invoke-virtual {v2}, Lcom/rey/material/widget/DatePicker$MonthAdapter;->getMonth()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 469
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/rey/material/widget/DatePicker;->mAdapter:Lcom/rey/material/widget/DatePicker$MonthAdapter;

    invoke-virtual {v2}, Lcom/rey/material/widget/DatePicker$MonthAdapter;->getDay()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 470
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMonth()I
    .registers 2

    .prologue
    .line 451
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mAdapter:Lcom/rey/material/widget/DatePicker$MonthAdapter;

    invoke-virtual {v0}, Lcom/rey/material/widget/DatePicker$MonthAdapter;->getMonth()I

    move-result v0

    return v0
.end method

.method public getSelectionColor()I
    .registers 2

    .prologue
    .line 474
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mSelectionColor:I

    return v0
.end method

.method public getTextColor()I
    .registers 2

    .prologue
    .line 486
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mTextColor:I

    return v0
.end method

.method public getTextDisableColor()I
    .registers 2

    .prologue
    .line 498
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mTextDisableColor:I

    return v0
.end method

.method public getTextHighlightColor()I
    .registers 2

    .prologue
    .line 494
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mTextHighlightColor:I

    return v0
.end method

.method public getTextLabelColor()I
    .registers 2

    .prologue
    .line 490
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mTextLabelColor:I

    return v0
.end method

.method public getTextSize()I
    .registers 2

    .prologue
    .line 478
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mTextSize:I

    return v0
.end method

.method public getTypeface()Landroid/graphics/Typeface;
    .registers 2

    .prologue
    .line 482
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mTypeface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public getYear()I
    .registers 2

    .prologue
    .line 458
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mAdapter:Lcom/rey/material/widget/DatePicker$MonthAdapter;

    invoke-virtual {v0}, Lcom/rey/material/widget/DatePicker$MonthAdapter;->getYear()I

    move-result v0

    return v0
.end method

.method public goTo(II)V
    .registers 5
    .param p1, "month"    # I
    .param p2, "year"    # I

    .prologue
    .line 404
    iget-object v1, p0, Lcom/rey/material/widget/DatePicker;->mAdapter:Lcom/rey/material/widget/DatePicker$MonthAdapter;

    invoke-virtual {v1, p1, p2}, Lcom/rey/material/widget/DatePicker$MonthAdapter;->positionOfMonth(II)I

    move-result v0

    .line 405
    .local v0, "position":I
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/rey/material/widget/DatePicker;->postSetSelectionFromTop(II)V

    .line 406
    return-void
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 14
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/high16 v8, -0x1000000

    const/4 v7, 0x7

    const/4 v6, 0x1

    const/4 v5, -0x1

    const/4 v4, 0x0

    .line 133
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object v3, p0, Lcom/rey/material/widget/DatePicker;->mTypeface:Landroid/graphics/Typeface;

    .line 134
    iput v5, p0, Lcom/rey/material/widget/DatePicker;->mTextSize:I

    .line 135
    iput v8, p0, Lcom/rey/material/widget/DatePicker;->mTextColor:I

    .line 136
    const v3, -0x89898a

    iput v3, p0, Lcom/rey/material/widget/DatePicker;->mTextLabelColor:I

    .line 137
    iput v5, p0, Lcom/rey/material/widget/DatePicker;->mTextHighlightColor:I

    .line 138
    iput v5, p0, Lcom/rey/material/widget/DatePicker;->mAnimDuration:I

    .line 139
    new-array v3, v7, [Ljava/lang/String;

    iput-object v3, p0, Lcom/rey/material/widget/DatePicker;->mLabels:[Ljava/lang/String;

    .line 140
    const/high16 v3, 0x3f800000    # 1.0f

    iput v3, p0, Lcom/rey/material/widget/DatePicker;->mFriction:F

    .line 142
    invoke-virtual {p0, v4}, Lcom/rey/material/widget/DatePicker;->setWillNotDraw(Z)V

    .line 143
    invoke-static {}, Lcom/rey/material/drawable/BlankDrawable;->getInstance()Lcom/rey/material/drawable/BlankDrawable;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/rey/material/widget/DatePicker;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 144
    invoke-virtual {p0, v4}, Lcom/rey/material/widget/DatePicker;->setCacheColorHint(I)V

    .line 145
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/rey/material/widget/DatePicker;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 146
    invoke-virtual {p0, v6}, Lcom/rey/material/widget/DatePicker;->setItemsCanFocus(Z)V

    .line 147
    invoke-virtual {p0, v4}, Lcom/rey/material/widget/DatePicker;->setFastScrollEnabled(Z)V

    .line 148
    invoke-virtual {p0, v4}, Lcom/rey/material/widget/DatePicker;->setVerticalScrollBarEnabled(Z)V

    .line 149
    invoke-virtual {p0, p0}, Lcom/rey/material/widget/DatePicker;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 150
    invoke-virtual {p0, v4}, Lcom/rey/material/widget/DatePicker;->setFadingEdgeLength(I)V

    .line 151
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollFriction()F

    move-result v3

    iget v4, p0, Lcom/rey/material/widget/DatePicker;->mFriction:F

    mul-float/2addr v3, v4

    invoke-direct {p0, v3}, Lcom/rey/material/widget/DatePicker;->setFrictionIfSupported(F)V

    .line 153
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3, v6}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v3, p0, Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;

    .line 154
    iget-object v3, p0, Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 155
    iget-object v3, p0, Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 157
    const/4 v3, 0x4

    invoke-static {p1, v3}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v3

    iput v3, p0, Lcom/rey/material/widget/DatePicker;->mDayPadding:I

    .line 159
    invoke-static {p1, v8}, Lcom/rey/material/util/ThemeUtil;->colorPrimary(Landroid/content/Context;I)I

    move-result v3

    iput v3, p0, Lcom/rey/material/widget/DatePicker;->mSelectionColor:I

    .line 161
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v3

    iput-object v3, p0, Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;

    .line 162
    iget-object v3, p0, Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v3}, Ljava/util/Calendar;->getFirstDayOfWeek()I

    move-result v3

    iput v3, p0, Lcom/rey/material/widget/DatePicker;->mFirstDayOfWeek:I

    .line 164
    iget-object v3, p0, Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v3, v7}, Ljava/util/Calendar;->get(I)I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    .line 165
    .local v2, "index":I
    new-instance v0, Ljava/text/SimpleDateFormat;

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x12

    if-lt v3, v4, :cond_ac

    const-string v3, "EEEEE"

    :goto_8b
    invoke-direct {v0, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 166
    .local v0, "format":Ljava/text/DateFormat;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8f
    if-ge v1, v7, :cond_af

    .line 167
    iget-object v3, p0, Lcom/rey/material/widget/DatePicker;->mLabels:[Ljava/lang/String;

    iget-object v4, p0, Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v4}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v2

    .line 168
    add-int/lit8 v3, v2, 0x1

    rem-int/lit8 v2, v3, 0x7

    .line 169
    iget-object v3, p0, Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;

    const/4 v4, 0x5

    invoke-virtual {v3, v4, v6}, Ljava/util/Calendar;->add(II)V

    .line 166
    add-int/lit8 v1, v1, 0x1

    goto :goto_8f

    .line 165
    .end local v0    # "format":Ljava/text/DateFormat;
    .end local v1    # "i":I
    :cond_ac
    const-string v3, "E"

    goto :goto_8b

    .line 172
    .restart local v0    # "format":Ljava/text/DateFormat;
    .restart local v1    # "i":I
    :cond_af
    new-instance v3, Lcom/rey/material/widget/DatePicker$MonthAdapter;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lcom/rey/material/widget/DatePicker$MonthAdapter;-><init>(Lcom/rey/material/widget/DatePicker;Lcom/rey/material/widget/DatePicker$1;)V

    iput-object v3, p0, Lcom/rey/material/widget/DatePicker;->mAdapter:Lcom/rey/material/widget/DatePicker$MonthAdapter;

    .line 173
    iget-object v3, p0, Lcom/rey/material/widget/DatePicker;->mAdapter:Lcom/rey/material/widget/DatePicker$MonthAdapter;

    invoke-virtual {p0, v3}, Lcom/rey/material/widget/DatePicker;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 175
    invoke-super {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/ListView;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 176
    return-void
.end method

.method protected onMeasure(II)V
    .registers 3
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 348
    invoke-direct {p0, p1, p2}, Lcom/rey/material/widget/DatePicker;->measureMonthView(II)V

    .line 349
    invoke-super {p0, p1, p2}, Lcom/rey/material/widget/ListView;->onMeasure(II)V

    .line 350
    return-void
.end method

.method public onScroll(Landroid/widget/AbsListView;III)V
    .registers 8
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "firstVisibleItem"    # I
    .param p3, "visibleItemCount"    # I
    .param p4, "totalItemCount"    # I

    .prologue
    .line 287
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/rey/material/widget/DatePicker$MonthView;

    .line 288
    .local v0, "child":Lcom/rey/material/widget/DatePicker$MonthView;
    if-nez v0, :cond_a

    .line 294
    :goto_9
    return-void

    .line 292
    :cond_a
    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker;->getFirstVisiblePosition()I

    move-result v1

    invoke-virtual {v0}, Lcom/rey/material/widget/DatePicker$MonthView;->getHeight()I

    move-result v2

    mul-int/2addr v1, v2

    invoke-virtual {v0}, Lcom/rey/material/widget/DatePicker$MonthView;->getBottom()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-long v1, v1

    iput-wide v1, p0, Lcom/rey/material/widget/DatePicker;->mPreviousScrollPosition:J

    .line 293
    iget v1, p0, Lcom/rey/material/widget/DatePicker;->mCurrentScrollState:I

    iput v1, p0, Lcom/rey/material/widget/DatePicker;->mPreviousScrollState:I

    goto :goto_9
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .registers 4
    .param p1, "absListView"    # Landroid/widget/AbsListView;
    .param p2, "scroll"    # I

    .prologue
    .line 298
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mScrollStateChangedRunnable:Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->doScrollStateChange(Landroid/widget/AbsListView;I)V

    .line 299
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .registers 8
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    const/high16 v2, 0x40e00000    # 7.0f

    .line 354
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mPaddingLeft:I

    sub-int v0, p1, v0

    iget v1, p0, Lcom/rey/material/widget/DatePicker;->mPaddingRight:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    div-float/2addr v0, v2

    iput v0, p0, Lcom/rey/material/widget/DatePicker;->mDayWidth:F

    .line 355
    int-to-float v0, p2

    iget v1, p0, Lcom/rey/material/widget/DatePicker;->mDayBaseHeight:F

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/rey/material/widget/DatePicker;->mDayPadding:I

    mul-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/rey/material/widget/DatePicker;->mPaddingTop:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/rey/material/widget/DatePicker;->mPaddingBottom:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    div-float/2addr v0, v2

    iput v0, p0, Lcom/rey/material/widget/DatePicker;->mDayHeight:F

    .line 356
    iget v0, p0, Lcom/rey/material/widget/DatePicker;->mDayWidth:F

    iget v1, p0, Lcom/rey/material/widget/DatePicker;->mDayHeight:F

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iput v0, p0, Lcom/rey/material/widget/DatePicker;->mSelectionRadius:F

    .line 357
    return-void
.end method

.method public postSetSelectionFromTop(II)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "offset"    # I

    .prologue
    .line 409
    new-instance v0, Lcom/rey/material/widget/DatePicker$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/rey/material/widget/DatePicker$1;-><init>(Lcom/rey/material/widget/DatePicker;II)V

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/DatePicker;->post(Ljava/lang/Runnable;)Z

    .line 416
    return-void
.end method

.method public setContentPadding(IIII)V
    .registers 5
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 365
    iput p1, p0, Lcom/rey/material/widget/DatePicker;->mPaddingLeft:I

    .line 366
    iput p2, p0, Lcom/rey/material/widget/DatePicker;->mPaddingTop:I

    .line 367
    iput p3, p0, Lcom/rey/material/widget/DatePicker;->mPaddingRight:I

    .line 368
    iput p4, p0, Lcom/rey/material/widget/DatePicker;->mPaddingBottom:I

    .line 369
    return-void
.end method

.method public setDate(III)V
    .registers 6
    .param p1, "day"    # I
    .param p2, "month"    # I
    .param p3, "year"    # I

    .prologue
    .line 425
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mAdapter:Lcom/rey/material/widget/DatePicker$MonthAdapter;

    invoke-virtual {v0}, Lcom/rey/material/widget/DatePicker$MonthAdapter;->getYear()I

    move-result v0

    if-ne v0, p3, :cond_19

    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mAdapter:Lcom/rey/material/widget/DatePicker$MonthAdapter;

    invoke-virtual {v0}, Lcom/rey/material/widget/DatePicker$MonthAdapter;->getMonth()I

    move-result v0

    if-ne v0, p2, :cond_19

    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mAdapter:Lcom/rey/material/widget/DatePicker$MonthAdapter;

    invoke-virtual {v0}, Lcom/rey/material/widget/DatePicker$MonthAdapter;->getDay()I

    move-result v0

    if-ne v0, p1, :cond_19

    .line 430
    :goto_18
    return-void

    .line 428
    :cond_19
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mAdapter:Lcom/rey/material/widget/DatePicker$MonthAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/rey/material/widget/DatePicker$MonthAdapter;->setDate(IIIZ)V

    .line 429
    invoke-virtual {p0, p2, p3}, Lcom/rey/material/widget/DatePicker;->goTo(II)V

    goto :goto_18
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
    .line 395
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker;->mAdapter:Lcom/rey/material/widget/DatePicker$MonthAdapter;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/rey/material/widget/DatePicker$MonthAdapter;->setDateRange(IIIIII)V

    .line 396
    return-void
.end method

.method public setOnDateChangedListener(Lcom/rey/material/widget/DatePicker$OnDateChangedListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/rey/material/widget/DatePicker$OnDateChangedListener;

    .prologue
    .line 437
    iput-object p1, p0, Lcom/rey/material/widget/DatePicker;->mOnDateChangedListener:Lcom/rey/material/widget/DatePicker$OnDateChangedListener;

    .line 438
    return-void
.end method

.method public setPadding(IIII)V
    .registers 6
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    const/4 v0, 0x0

    .line 361
    invoke-super {p0, v0, v0, v0, v0}, Lcom/rey/material/widget/ListView;->setPadding(IIII)V

    .line 362
    return-void
.end method
