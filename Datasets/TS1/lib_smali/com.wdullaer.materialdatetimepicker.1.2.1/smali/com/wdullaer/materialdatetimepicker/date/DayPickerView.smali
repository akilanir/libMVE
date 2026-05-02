.class public abstract Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;
.super Landroid/widget/ListView;
.source "DayPickerView.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;
.implements Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;
    }
.end annotation


# static fields
.field public static final DAYS_PER_WEEK:I = 0x7

.field protected static final GOTO_SCROLL_DURATION:I = 0xfa

.field public static LIST_TOP_OFFSET:I = 0x0

.field protected static final SCROLL_CHANGE_DELAY:I = 0x28

.field protected static final SCROLL_HYST_WEEKS:I = 0x2

.field private static final TAG:Ljava/lang/String; = "MonthFragment"

.field private static YEAR_FORMAT:Ljava/text/SimpleDateFormat;


# instance fields
.field protected mAdapter:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;

.field protected mContext:Landroid/content/Context;

.field private mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

.field protected mCurrentMonthDisplayed:I

.field protected mCurrentScrollState:I

.field protected mDaysPerWeek:I

.field protected mFirstDayOfWeek:I

.field protected mFriction:F

.field protected mHandler:Landroid/os/Handler;

.field protected mNumWeeks:I

.field private mPerformingScroll:Z

.field protected mPrevMonthName:Ljava/lang/CharSequence;

.field protected mPreviousScrollPosition:J

.field protected mPreviousScrollState:I

.field protected mScrollStateChangedRunnable:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;

.field protected mSelectedDay:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

.field protected mShowWeekNumber:Z

.field protected mTempDay:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 58
    const/4 v0, -0x1

    sput v0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->LIST_TOP_OFFSET:I

    .line 64
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->YEAR_FORMAT:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    .line 95
    invoke-direct {p0, p1, p2}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 61
    const/4 v0, 0x6

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mNumWeeks:I

    .line 62
    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mShowWeekNumber:Z

    .line 63
    const/4 v0, 0x7

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mDaysPerWeek:I

    .line 67
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mFriction:F

    .line 73
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    invoke-direct {v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;-><init>()V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mSelectedDay:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    .line 76
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    invoke-direct {v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;-><init>()V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mTempDay:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    .line 87
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mPreviousScrollState:I

    .line 89
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mCurrentScrollState:I

    .line 282
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;

    invoke-direct {v0, p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;-><init>(Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;)V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mScrollStateChangedRunnable:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;

    .line 96
    invoke-virtual {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->init(Landroid/content/Context;)V

    .line 97
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "controller"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    .prologue
    const/4 v1, 0x0

    .line 100
    invoke-direct {p0, p1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 61
    const/4 v0, 0x6

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mNumWeeks:I

    .line 62
    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mShowWeekNumber:Z

    .line 63
    const/4 v0, 0x7

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mDaysPerWeek:I

    .line 67
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mFriction:F

    .line 73
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    invoke-direct {v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;-><init>()V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mSelectedDay:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    .line 76
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    invoke-direct {v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;-><init>()V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mTempDay:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    .line 87
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mPreviousScrollState:I

    .line 89
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mCurrentScrollState:I

    .line 282
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;

    invoke-direct {v0, p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;-><init>(Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;)V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mScrollStateChangedRunnable:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;

    .line 101
    invoke-virtual {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->init(Landroid/content/Context;)V

    .line 102
    invoke-virtual {p0, p2}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->setController(Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;)V

    .line 103
    return-void
.end method

.method private findAccessibilityFocus()Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;
    .registers 7

    .prologue
    .line 379
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getChildCount()I

    move-result v1

    .line 380
    .local v1, "childCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_5
    if-ge v3, v1, :cond_27

    .line 381
    invoke-virtual {p0, v3}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 382
    .local v0, "child":Landroid/view/View;
    instance-of v4, v0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    if-eqz v4, :cond_24

    move-object v4, v0

    .line 383
    check-cast v4, Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    invoke-virtual {v4}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getAccessibilityFocus()Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    move-result-object v2

    .line 384
    .local v2, "focus":Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;
    if-eqz v2, :cond_24

    .line 385
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x11

    if-ne v4, v5, :cond_23

    .line 387
    check-cast v0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .end local v0    # "child":Landroid/view/View;
    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->clearAccessibilityFocus()V

    .line 394
    .end local v2    # "focus":Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;
    :cond_23
    :goto_23
    return-object v2

    .line 380
    .restart local v0    # "child":Landroid/view/View;
    :cond_24
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 394
    .end local v0    # "child":Landroid/view/View;
    :cond_27
    const/4 v2, 0x0

    goto :goto_23
.end method

.method private static getMonthAndYearString(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)Ljava/lang/String;
    .registers 7
    .param p0, "day"    # Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    .prologue
    const/4 v5, 0x2

    .line 440
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 441
    .local v0, "cal":Ljava/util/Calendar;
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->year:I

    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->month:I

    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->day:I

    invoke-virtual {v0, v2, v3, v4}, Ljava/util/Calendar;->set(III)V

    .line 443
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 444
    .local v1, "sbuf":Ljava/lang/StringBuffer;
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v0, v5, v5, v2}, Ljava/util/Calendar;->getDisplayName(IILjava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 445
    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 446
    sget-object v2, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->YEAR_FORMAT:Ljava/text/SimpleDateFormat;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 447
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private restoreAccessibilityFocus(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)Z
    .registers 7
    .param p1, "day"    # Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    .prologue
    const/4 v3, 0x0

    .line 405
    if-nez p1, :cond_4

    .line 419
    :cond_3
    :goto_3
    return v3

    .line 409
    :cond_4
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getChildCount()I

    move-result v1

    .line 410
    .local v1, "childCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_9
    if-ge v2, v1, :cond_3

    .line 411
    invoke-virtual {p0, v2}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 412
    .local v0, "child":Landroid/view/View;
    instance-of v4, v0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    if-eqz v4, :cond_1d

    .line 413
    check-cast v0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .end local v0    # "child":Landroid/view/View;
    invoke-virtual {v0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->restoreAccessibilityFocus(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)Z

    move-result v4

    if-eqz v4, :cond_1d

    .line 414
    const/4 v3, 0x1

    goto :goto_3

    .line 410
    :cond_1d
    add-int/lit8 v2, v2, 0x1

    goto :goto_9
.end method


# virtual methods
.method public abstract createMonthAdapter(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;)Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;
.end method

.method public getMostVisiblePosition()I
    .registers 12

    .prologue
    .line 344
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getFirstVisiblePosition()I

    move-result v3

    .line 345
    .local v3, "firstPosition":I
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getHeight()I

    move-result v4

    .line 347
    .local v4, "height":I
    const/4 v6, 0x0

    .line 348
    .local v6, "maxDisplayedHeight":I
    const/4 v7, 0x0

    .line 349
    .local v7, "mostVisibleIndex":I
    const/4 v5, 0x0

    .line 350
    .local v5, "i":I
    const/4 v0, 0x0

    .line 351
    .local v0, "bottom":I
    :goto_c
    if-ge v0, v4, :cond_14

    .line 352
    invoke-virtual {p0, v5}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 353
    .local v1, "child":Landroid/view/View;
    if-nez v1, :cond_17

    .line 364
    .end local v1    # "child":Landroid/view/View;
    :cond_14
    add-int v8, v3, v7

    return v8

    .line 356
    .restart local v1    # "child":Landroid/view/View;
    :cond_17
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v0

    .line 357
    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    move-result v8

    const/4 v9, 0x0

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v10

    invoke-static {v9, v10}, Ljava/lang/Math;->max(II)I

    move-result v9

    sub-int v2, v8, v9

    .line 358
    .local v2, "displayedHeight":I
    if-le v2, v6, :cond_2e

    .line 359
    move v7, v5

    .line 360
    move v6, v2

    .line 362
    :cond_2e
    add-int/lit8 v5, v5, 0x1

    .line 363
    goto :goto_c
.end method

.method public goTo(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;ZZZ)Z
    .registers 15
    .param p1, "day"    # Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;
    .param p2, "animate"    # Z
    .param p3, "setSelected"    # Z
    .param p4, "forceScroll"    # Z

    .prologue
    const/4 v9, 0x3

    .line 180
    if-eqz p3, :cond_8

    .line 181
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mSelectedDay:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    invoke-virtual {v6, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->set(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)V

    .line 184
    :cond_8
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mTempDay:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    invoke-virtual {v6, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->set(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)V

    .line 185
    iget v6, p1, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->year:I

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v7}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->getMinYear()I

    move-result v7

    sub-int/2addr v6, v7

    mul-int/lit8 v6, v6, 0xc

    iget v7, p1, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->month:I

    add-int v3, v6, v7

    .line 189
    .local v3, "position":I
    const/4 v1, 0x0

    .line 190
    .local v1, "i":I
    const/4 v5, 0x0

    .line 193
    .local v5, "top":I
    :goto_1e
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 194
    .local v0, "child":Landroid/view/View;
    if-nez v0, :cond_6c

    .line 205
    :cond_26
    if-eqz v0, :cond_a1

    .line 206
    invoke-virtual {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getPositionForView(Landroid/view/View;)I

    move-result v4

    .line 211
    .local v4, "selectedPosition":I
    :goto_2c
    if-eqz p3, :cond_35

    .line 212
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mAdapter:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mSelectedDay:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    invoke-virtual {v6, v7}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->setSelectedDay(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)V

    .line 215
    :cond_35
    const-string v6, "MonthFragment"

    invoke-static {v6, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_55

    .line 216
    const-string v6, "MonthFragment"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "GoTo position "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    :cond_55
    if-ne v3, v4, :cond_59

    if-eqz p4, :cond_a8

    .line 221
    :cond_59
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mTempDay:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    invoke-virtual {p0, v6}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->setMonthDisplayed(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)V

    .line 222
    const/4 v6, 0x2

    iput v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mPreviousScrollState:I

    .line 223
    if-eqz p2, :cond_a3

    .line 224
    sget v6, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->LIST_TOP_OFFSET:I

    const/16 v7, 0xfa

    invoke-virtual {p0, v3, v6, v7}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->smoothScrollToPositionFromTop(III)V

    .line 226
    const/4 v6, 0x1

    .line 233
    :goto_6b
    return v6

    .line 197
    .end local v4    # "selectedPosition":I
    :cond_6c
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v5

    .line 198
    const-string v6, "MonthFragment"

    invoke-static {v6, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_9c

    .line 199
    const-string v6, "MonthFragment"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "child at "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    add-int/lit8 v8, v2, -0x1

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " has top "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    :cond_9c
    if-gez v5, :cond_26

    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto/16 :goto_1e

    .line 208
    .end local v1    # "i":I
    .restart local v2    # "i":I
    :cond_a1
    const/4 v4, 0x0

    .restart local v4    # "selectedPosition":I
    goto :goto_2c

    .line 228
    :cond_a3
    invoke-virtual {p0, v3}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->postSetSelection(I)V

    .line 233
    :cond_a6
    :goto_a6
    const/4 v6, 0x0

    goto :goto_6b

    .line 230
    :cond_a8
    if-eqz p3, :cond_a6

    .line 231
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mSelectedDay:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    invoke-virtual {p0, v6}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->setMonthDisplayed(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)V

    goto :goto_a6
.end method

.method public init(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, -0x1

    .line 113
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mHandler:Landroid/os/Handler;

    .line 114
    new-instance v0, Landroid/widget/AbsListView$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 115
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->setDrawSelectorOnTop(Z)V

    .line 117
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mContext:Landroid/content/Context;

    .line 118
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->setUpListView()V

    .line 119
    return-void
.end method

.method protected layoutChildren()V
    .registers 3

    .prologue
    .line 424
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->findAccessibilityFocus()Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    move-result-object v0

    .line 425
    .local v0, "focusedDay":Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;
    invoke-super {p0}, Landroid/widget/ListView;->layoutChildren()V

    .line 426
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mPerformingScroll:Z

    if-eqz v1, :cond_f

    .line 427
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mPerformingScroll:Z

    .line 431
    :goto_e
    return-void

    .line 429
    :cond_f
    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->restoreAccessibilityFocus(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)Z

    goto :goto_e
.end method

.method public onChange()V
    .registers 1

    .prologue
    .line 122
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->refreshAdapter()V

    .line 123
    return-void
.end method

.method public onDateChanged()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 369
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->getSelectedDay()Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v2, v2}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->goTo(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;ZZZ)Z

    .line 370
    return-void
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 3
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 435
    invoke-super {p0, p1}, Landroid/widget/ListView;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 436
    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setItemCount(I)V

    .line 437
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 3
    .param p1, "info"    # Landroid/view/accessibility/AccessibilityNodeInfo;

    .prologue
    .line 456
    invoke-super {p0, p1}, Landroid/widget/ListView;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 457
    const/16 v0, 0x1000

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 458
    const/16 v0, 0x2000

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 459
    return-void
.end method

.method public onScroll(Landroid/widget/AbsListView;III)V
    .registers 10
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "firstVisibleItem"    # I
    .param p3, "visibleItemCount"    # I
    .param p4, "totalItemCount"    # I

    .prologue
    .line 255
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 256
    .local v0, "child":Lcom/wdullaer/materialdatetimepicker/date/MonthView;
    if-nez v0, :cond_a

    .line 264
    :goto_9
    return-void

    .line 261
    :cond_a
    invoke-virtual {p1}, Landroid/widget/AbsListView;->getFirstVisiblePosition()I

    move-result v3

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getHeight()I

    move-result v4

    mul-int/2addr v3, v4

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getBottom()I

    move-result v4

    sub-int/2addr v3, v4

    int-to-long v1, v3

    .line 262
    .local v1, "currScroll":J
    iput-wide v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mPreviousScrollPosition:J

    .line 263
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mCurrentScrollState:I

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mPreviousScrollState:I

    goto :goto_9
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .registers 4
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 279
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mScrollStateChangedRunnable:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;

    invoke-virtual {v0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->doScrollStateChange(Landroid/widget/AbsListView;I)V

    .line 280
    return-void
.end method

.method public performAccessibilityAction(ILandroid/os/Bundle;)Z
    .registers 15
    .param p1, "action"    # I
    .param p2, "arguments"    # Landroid/os/Bundle;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/16 v11, 0x2000

    const/16 v10, 0x1000

    const/4 v9, -0x1

    const/4 v8, 0x0

    const/4 v5, 0x1

    .line 467
    if-eq p1, v10, :cond_10

    if-eq p1, v11, :cond_10

    .line 469
    invoke-super {p0, p1, p2}, Landroid/widget/ListView;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    move-result v5

    .line 504
    :goto_f
    return v5

    .line 473
    :cond_10
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getFirstVisiblePosition()I

    move-result v1

    .line 474
    .local v1, "firstVisiblePosition":I
    rem-int/lit8 v3, v1, 0xc

    .line 475
    .local v3, "month":I
    div-int/lit8 v6, v1, 0xc

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v7}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->getMinYear()I

    move-result v7

    add-int v4, v6, v7

    .line 476
    .local v4, "year":I
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    invoke-direct {v0, v4, v3, v5}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;-><init>(III)V

    .line 479
    .local v0, "day":Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;
    if-ne p1, v10, :cond_48

    .line 480
    iget v6, v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->month:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->month:I

    .line 481
    iget v6, v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->month:I

    const/16 v7, 0xc

    if-ne v6, v7, :cond_3b

    .line 482
    iput v8, v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->month:I

    .line 483
    iget v6, v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->year:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->year:I

    .line 501
    :cond_3b
    :goto_3b
    invoke-static {v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getMonthAndYearString(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, v6}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 502
    invoke-virtual {p0, v0, v5, v8, v5}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->goTo(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;ZZZ)Z

    .line 503
    iput-boolean v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mPerformingScroll:Z

    goto :goto_f

    .line 485
    :cond_48
    if-ne p1, v11, :cond_3b

    .line 486
    invoke-virtual {p0, v8}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 489
    .local v2, "firstVisibleView":Landroid/view/View;
    if-eqz v2, :cond_3b

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v6

    if-lt v6, v9, :cond_3b

    .line 492
    iget v6, v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->month:I

    add-int/lit8 v6, v6, -0x1

    iput v6, v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->month:I

    .line 493
    iget v6, v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->month:I

    if-ne v6, v9, :cond_3b

    .line 494
    const/16 v6, 0xb

    iput v6, v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->month:I

    .line 495
    iget v6, v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->year:I

    add-int/lit8 v6, v6, -0x1

    iput v6, v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->year:I

    goto :goto_3b
.end method

.method public postSetSelection(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 237
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->clearFocus()V

    .line 238
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$1;

    invoke-direct {v0, p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$1;-><init>(Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;I)V

    invoke-virtual {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->post(Ljava/lang/Runnable;)Z

    .line 245
    const/4 v0, 0x0

    invoke-virtual {p0, p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->onScrollStateChanged(Landroid/widget/AbsListView;I)V

    .line 246
    return-void
.end method

.method protected refreshAdapter()V
    .registers 3

    .prologue
    .line 130
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mAdapter:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;

    if-nez v0, :cond_16

    .line 131
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-virtual {p0, v0, v1}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->createMonthAdapter(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;)Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mAdapter:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;

    .line 136
    :goto_10
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mAdapter:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;

    invoke-virtual {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 137
    return-void

    .line 133
    :cond_16
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mAdapter:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mSelectedDay:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    invoke-virtual {v0, v1}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->setSelectedDay(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)V

    goto :goto_10
.end method

.method public setController(Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;)V
    .registers 3
    .param p1, "controller"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    .line 107
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v0, p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->registerOnDateChangedListener(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;)V

    .line 108
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->refreshAdapter()V

    .line 109
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->onDateChanged()V

    .line 110
    return-void
.end method

.method protected setMonthDisplayed(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)V
    .registers 3
    .param p1, "date"    # Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    .prologue
    .line 271
    iget v0, p1, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->month:I

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mCurrentMonthDisplayed:I

    .line 272
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->invalidateViews()V

    .line 273
    return-void
.end method

.method protected setUpListView()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 148
    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->setCacheColorHint(I)V

    .line 150
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 152
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->setItemsCanFocus(Z)V

    .line 154
    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->setFastScrollEnabled(Z)V

    .line 155
    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->setVerticalScrollBarEnabled(Z)V

    .line 156
    invoke-virtual {p0, p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 157
    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->setFadingEdgeLength(I)V

    .line 159
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollFriction()F

    move-result v0

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mFriction:F

    mul-float/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->setFriction(F)V

    .line 160
    return-void
.end method
