.class Lcom/rey/material/widget/DatePicker$MonthView;
.super Landroid/view/View;
.source "DatePicker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/DatePicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MonthView"
.end annotation


# instance fields
.field private mAnimProgress:F

.field private mFirstDayCol:I

.field private mMaxAvailDay:I

.field private mMaxDay:I

.field private mMinAvailDay:I

.field private mMonth:I

.field private mMonthText:Ljava/lang/String;

.field private mPreviousSelectedDay:I

.field private mRunning:Z

.field private mSelectedDay:I

.field private mStartTime:J

.field private mToday:I

.field private mTouchedDay:I

.field private final mUpdater:Ljava/lang/Runnable;

.field private mYear:I

.field final synthetic this$0:Lcom/rey/material/widget/DatePicker;


# direct methods
.method public constructor <init>(Lcom/rey/material/widget/DatePicker;Landroid/content/Context;)V
    .registers 4
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, -0x1

    .line 572
    iput-object p1, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    .line 573
    invoke-direct {p0, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 559
    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mTouchedDay:I

    .line 565
    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMinAvailDay:I

    .line 566
    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMaxAvailDay:I

    .line 567
    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mToday:I

    .line 568
    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mSelectedDay:I

    .line 569
    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mPreviousSelectedDay:I

    .line 761
    new-instance v0, Lcom/rey/material/widget/DatePicker$MonthView$1;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/DatePicker$MonthView$1;-><init>(Lcom/rey/material/widget/DatePicker$MonthView;)V

    iput-object v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mUpdater:Ljava/lang/Runnable;

    .line 575
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/DatePicker$MonthView;->setWillNotDraw(Z)V

    .line 576
    return-void
.end method

.method static synthetic access$2400(Lcom/rey/material/widget/DatePicker$MonthView;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/widget/DatePicker$MonthView;

    .prologue
    .line 553
    invoke-direct {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->update()V

    return-void
.end method

.method private calculateMonthView()V
    .registers 7

    .prologue
    const/4 v3, 0x5

    const/4 v5, 0x2

    const/4 v4, 0x1

    .line 615
    iget-object v1, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;
    invoke-static {v1}, Lcom/rey/material/widget/DatePicker;->access$200(Lcom/rey/material/widget/DatePicker;)Ljava/util/Calendar;

    move-result-object v1

    invoke-virtual {v1, v3, v4}, Ljava/util/Calendar;->set(II)V

    .line 616
    iget-object v1, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;
    invoke-static {v1}, Lcom/rey/material/widget/DatePicker;->access$200(Lcom/rey/material/widget/DatePicker;)Ljava/util/Calendar;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMonth:I

    invoke-virtual {v1, v5, v2}, Ljava/util/Calendar;->set(II)V

    .line 617
    iget-object v1, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;
    invoke-static {v1}, Lcom/rey/material/widget/DatePicker;->access$200(Lcom/rey/material/widget/DatePicker;)Ljava/util/Calendar;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mYear:I

    invoke-virtual {v1, v4, v2}, Ljava/util/Calendar;->set(II)V

    .line 619
    iget-object v1, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;
    invoke-static {v1}, Lcom/rey/material/widget/DatePicker;->access$200(Lcom/rey/material/widget/DatePicker;)Ljava/util/Calendar;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v1

    iput v1, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMaxDay:I

    .line 620
    iget-object v1, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;
    invoke-static {v1}, Lcom/rey/material/widget/DatePicker;->access$200(Lcom/rey/material/widget/DatePicker;)Ljava/util/Calendar;

    move-result-object v1

    const/4 v2, 0x7

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v0

    .line 621
    .local v0, "dayOfWeek":I
    iget-object v1, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mFirstDayOfWeek:I
    invoke-static {v1}, Lcom/rey/material/widget/DatePicker;->access$300(Lcom/rey/material/widget/DatePicker;)I

    move-result v1

    if-ge v0, v1, :cond_85

    add-int/lit8 v1, v0, 0x7

    iget-object v2, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mFirstDayOfWeek:I
    invoke-static {v2}, Lcom/rey/material/widget/DatePicker;->access$300(Lcom/rey/material/widget/DatePicker;)I

    move-result v2

    sub-int/2addr v1, v2

    :goto_4a
    iput v1, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mFirstDayCol:I

    .line 622
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;
    invoke-static {v2}, Lcom/rey/material/widget/DatePicker;->access$200(Lcom/rey/material/widget/DatePicker;)Ljava/util/Calendar;

    move-result-object v2

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-virtual {v2, v5, v5, v3}, Ljava/util/Calendar;->getDisplayName(IILjava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "%4d"

    new-array v3, v4, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mYear:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMonthText:Ljava/lang/String;

    .line 623
    return-void

    .line 621
    :cond_85
    iget-object v1, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mFirstDayOfWeek:I
    invoke-static {v1}, Lcom/rey/material/widget/DatePicker;->access$300(Lcom/rey/material/widget/DatePicker;)I

    move-result v1

    sub-int v1, v0, v1

    goto :goto_4a
.end method

.method private getTouchedDay(FF)I
    .registers 11
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    const/4 v5, -0x1

    .line 704
    iget-object v6, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mDayPadding:I
    invoke-static {v6}, Lcom/rey/material/widget/DatePicker;->access$1000(Lcom/rey/material/widget/DatePicker;)I

    move-result v6

    mul-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    iget-object v7, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mDayBaseHeight:F
    invoke-static {v7}, Lcom/rey/material/widget/DatePicker;->access$1100(Lcom/rey/material/widget/DatePicker;)F

    move-result v7

    add-float/2addr v6, v7

    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->getPaddingTop()I

    move-result v7

    int-to-float v7, v7

    add-float/2addr v6, v7

    iget-object v7, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mDayHeight:F
    invoke-static {v7}, Lcom/rey/material/widget/DatePicker;->access$1300(Lcom/rey/material/widget/DatePicker;)F

    move-result v7

    add-float v3, v6, v7

    .line 705
    .local v3, "paddingTop":F
    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->getPaddingLeft()I

    move-result v6

    int-to-float v6, v6

    cmpg-float v6, p1, v6

    if-ltz v6, :cond_48

    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->getWidth()I

    move-result v6

    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->getPaddingRight()I

    move-result v7

    sub-int/2addr v6, v7

    int-to-float v6, v6

    cmpl-float v6, p1, v6

    if-gtz v6, :cond_48

    cmpg-float v6, p2, v3

    if-ltz v6, :cond_48

    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->getHeight()I

    move-result v6

    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->getPaddingBottom()I

    move-result v7

    sub-int/2addr v6, v7

    int-to-float v6, v6

    cmpl-float v6, p2, v6

    if-lez v6, :cond_4a

    :cond_48
    move v1, v5

    .line 716
    :cond_49
    :goto_49
    return v1

    .line 708
    :cond_4a
    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->getPaddingLeft()I

    move-result v6

    int-to-float v6, v6

    sub-float v6, p1, v6

    iget-object v7, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mDayWidth:F
    invoke-static {v7}, Lcom/rey/material/widget/DatePicker;->access$900(Lcom/rey/material/widget/DatePicker;)F

    move-result v7

    div-float/2addr v6, v7

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    move-result-wide v6

    double-to-int v0, v6

    .line 709
    .local v0, "col":I
    sub-float v6, p2, v3

    iget-object v7, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mDayHeight:F
    invoke-static {v7}, Lcom/rey/material/widget/DatePicker;->access$1300(Lcom/rey/material/widget/DatePicker;)F

    move-result v7

    div-float/2addr v6, v7

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    move-result-wide v6

    double-to-int v4, v6

    .line 710
    .local v4, "row":I
    iget v6, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMaxAvailDay:I

    if-lez v6, :cond_8b

    iget v6, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMaxAvailDay:I

    iget v7, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMaxDay:I

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 712
    .local v2, "maxDay":I
    :goto_79
    mul-int/lit8 v6, v4, 0x7

    add-int/2addr v6, v0

    iget v7, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mFirstDayCol:I

    sub-int/2addr v6, v7

    add-int/lit8 v1, v6, 0x1

    .line 713
    .local v1, "day":I
    if-ltz v1, :cond_89

    iget v6, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMinAvailDay:I

    if-lt v1, v6, :cond_89

    if-le v1, v2, :cond_49

    :cond_89
    move v1, v5

    .line 714
    goto :goto_49

    .line 710
    .end local v1    # "day":I
    .end local v2    # "maxDay":I
    :cond_8b
    iget v2, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMaxDay:I

    goto :goto_79
.end method

.method private resetAnimation()V
    .registers 3

    .prologue
    .line 739
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mStartTime:J

    .line 740
    const/4 v0, 0x0

    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mAnimProgress:F

    .line 741
    return-void
.end method

.method private startAnimation()V
    .registers 7

    .prologue
    .line 744
    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->getHandler()Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_1c

    .line 745
    invoke-direct {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->resetAnimation()V

    .line 746
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mRunning:Z

    .line 747
    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->getHandler()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x10

    add-long/2addr v2, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    .line 750
    :cond_1c
    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->invalidate()V

    .line 751
    return-void
.end method

.method private stopAnimation()V
    .registers 3

    .prologue
    .line 754
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mRunning:Z

    .line 755
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mAnimProgress:F

    .line 756
    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->getHandler()Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_16

    .line 757
    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->getHandler()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mUpdater:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 758
    :cond_16
    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->invalidate()V

    .line 759
    return-void
.end method

.method private update()V
    .registers 9

    .prologue
    const/high16 v4, 0x3f800000    # 1.0f

    .line 771
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 772
    .local v0, "curTime":J
    iget-wide v2, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mStartTime:J

    sub-long v2, v0, v2

    long-to-float v2, v2

    iget-object v3, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mAnimDuration:I
    invoke-static {v3}, Lcom/rey/material/widget/DatePicker;->access$2500(Lcom/rey/material/widget/DatePicker;)I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-static {v4, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mAnimProgress:F

    .line 774
    iget v2, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mAnimProgress:F

    cmpl-float v2, v2, v4

    if-nez v2, :cond_22

    .line 775
    invoke-direct {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->stopAnimation()V

    .line 777
    :cond_22
    iget-boolean v2, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mRunning:Z

    if-eqz v2, :cond_3c

    .line 778
    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->getHandler()Landroid/os/Handler;

    move-result-object v2

    if-eqz v2, :cond_40

    .line 779
    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->getHandler()Landroid/os/Handler;

    move-result-object v2

    iget-object v3, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    const-wide/16 v6, 0x10

    add-long/2addr v4, v6

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    .line 784
    :cond_3c
    :goto_3c
    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->invalidate()V

    .line 785
    return-void

    .line 781
    :cond_40
    invoke-direct {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->stopAnimation()V

    goto :goto_3c
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 16
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 633
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$700(Lcom/rey/material/widget/DatePicker;)Landroid/graphics/Paint;

    move-result-object v11

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mTextSize:I
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$600(Lcom/rey/material/widget/DatePicker;)I

    move-result v12

    int-to-float v12, v12

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 634
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$700(Lcom/rey/material/widget/DatePicker;)Landroid/graphics/Paint;

    move-result-object v11

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mTypeface:Landroid/graphics/Typeface;
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$800(Lcom/rey/material/widget/DatePicker;)Landroid/graphics/Typeface;

    move-result-object v12

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 635
    const/high16 v11, 0x40600000    # 3.5f

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mDayWidth:F
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$900(Lcom/rey/material/widget/DatePicker;)F

    move-result v12

    mul-float/2addr v11, v12

    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->getPaddingLeft()I

    move-result v12

    int-to-float v12, v12

    add-float v9, v11, v12

    .line 636
    .local v9, "x":F
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mDayPadding:I
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$1000(Lcom/rey/material/widget/DatePicker;)I

    move-result v11

    mul-int/lit8 v11, v11, 0x2

    int-to-float v11, v11

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mDayBaseHeight:F
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$1100(Lcom/rey/material/widget/DatePicker;)F

    move-result v12

    add-float/2addr v11, v12

    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->getPaddingTop()I

    move-result v12

    int-to-float v12, v12

    add-float v10, v11, v12

    .line 637
    .local v10, "y":F
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$700(Lcom/rey/material/widget/DatePicker;)Landroid/graphics/Paint;

    move-result-object v11

    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 638
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$700(Lcom/rey/material/widget/DatePicker;)Landroid/graphics/Paint;

    move-result-object v11

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mTextColor:I
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$1200(Lcom/rey/material/widget/DatePicker;)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->setColor(I)V

    .line 639
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMonthText:Ljava/lang/String;

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$700(Lcom/rey/material/widget/DatePicker;)Landroid/graphics/Paint;

    move-result-object v12

    invoke-virtual {p1, v11, v9, v10, v12}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 642
    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->getPaddingLeft()I

    move-result v11

    int-to-float v5, v11

    .line 643
    .local v5, "paddingLeft":F
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mDayPadding:I
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$1000(Lcom/rey/material/widget/DatePicker;)I

    move-result v11

    mul-int/lit8 v11, v11, 0x2

    int-to-float v11, v11

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mDayBaseHeight:F
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$1100(Lcom/rey/material/widget/DatePicker;)F

    move-result v12

    add-float/2addr v11, v12

    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->getPaddingTop()I

    move-result v12

    int-to-float v12, v12

    add-float v6, v11, v12

    .line 644
    .local v6, "paddingTop":F
    iget v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mSelectedDay:I

    if-lez v11, :cond_e8

    .line 645
    iget v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mFirstDayCol:I

    iget v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mSelectedDay:I

    add-int/2addr v11, v12

    add-int/lit8 v11, v11, -0x1

    rem-int/lit8 v0, v11, 0x7

    .line 646
    .local v0, "col":I
    iget v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mFirstDayCol:I

    iget v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mSelectedDay:I

    add-int/2addr v11, v12

    add-int/lit8 v11, v11, -0x1

    div-int/lit8 v11, v11, 0x7

    add-int/lit8 v8, v11, 0x1

    .line 648
    .local v8, "row":I
    int-to-float v11, v0

    const/high16 v12, 0x3f000000    # 0.5f

    add-float/2addr v11, v12

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mDayWidth:F
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$900(Lcom/rey/material/widget/DatePicker;)F

    move-result v12

    mul-float/2addr v11, v12

    add-float v9, v11, v5

    .line 649
    int-to-float v11, v8

    const/high16 v12, 0x3f000000    # 0.5f

    add-float/2addr v11, v12

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mDayHeight:F
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$1300(Lcom/rey/material/widget/DatePicker;)F

    move-result v12

    mul-float/2addr v11, v12

    add-float v10, v11, v6

    .line 650
    iget-boolean v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mRunning:Z

    if-eqz v11, :cond_1a8

    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mInInterpolator:Landroid/view/animation/Interpolator;
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$1400(Lcom/rey/material/widget/DatePicker;)Landroid/view/animation/Interpolator;

    move-result-object v11

    iget v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mAnimProgress:F

    invoke-interface {v11, v12}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v11

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mSelectionRadius:F
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$1500(Lcom/rey/material/widget/DatePicker;)F

    move-result v12

    mul-float v7, v11, v12

    .line 651
    .local v7, "radius":F
    :goto_d0
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$700(Lcom/rey/material/widget/DatePicker;)Landroid/graphics/Paint;

    move-result-object v11

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mSelectionColor:I
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$1600(Lcom/rey/material/widget/DatePicker;)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->setColor(I)V

    .line 652
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$700(Lcom/rey/material/widget/DatePicker;)Landroid/graphics/Paint;

    move-result-object v11

    invoke-virtual {p1, v9, v10, v7, v11}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 655
    .end local v0    # "col":I
    .end local v7    # "radius":F
    .end local v8    # "row":I
    :cond_e8
    iget-boolean v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mRunning:Z

    if-eqz v11, :cond_14d

    iget v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mPreviousSelectedDay:I

    if-lez v11, :cond_14d

    .line 656
    iget v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mFirstDayCol:I

    iget v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mPreviousSelectedDay:I

    add-int/2addr v11, v12

    add-int/lit8 v11, v11, -0x1

    rem-int/lit8 v0, v11, 0x7

    .line 657
    .restart local v0    # "col":I
    iget v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mFirstDayCol:I

    iget v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mPreviousSelectedDay:I

    add-int/2addr v11, v12

    add-int/lit8 v11, v11, -0x1

    div-int/lit8 v11, v11, 0x7

    add-int/lit8 v8, v11, 0x1

    .line 659
    .restart local v8    # "row":I
    int-to-float v11, v0

    const/high16 v12, 0x3f000000    # 0.5f

    add-float/2addr v11, v12

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mDayWidth:F
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$900(Lcom/rey/material/widget/DatePicker;)F

    move-result v12

    mul-float/2addr v11, v12

    add-float v9, v11, v5

    .line 660
    int-to-float v11, v8

    const/high16 v12, 0x3f000000    # 0.5f

    add-float/2addr v11, v12

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mDayHeight:F
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$1300(Lcom/rey/material/widget/DatePicker;)F

    move-result v12

    mul-float/2addr v11, v12

    add-float v10, v11, v6

    .line 661
    const/high16 v11, 0x3f800000    # 1.0f

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mOutInterpolator:Landroid/view/animation/Interpolator;
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$1700(Lcom/rey/material/widget/DatePicker;)Landroid/view/animation/Interpolator;

    move-result-object v12

    iget v13, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mAnimProgress:F

    invoke-interface {v12, v13}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v12

    sub-float/2addr v11, v12

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mSelectionRadius:F
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$1500(Lcom/rey/material/widget/DatePicker;)F

    move-result v12

    mul-float v7, v11, v12

    .line 662
    .restart local v7    # "radius":F
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$700(Lcom/rey/material/widget/DatePicker;)Landroid/graphics/Paint;

    move-result-object v11

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mSelectionColor:I
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$1600(Lcom/rey/material/widget/DatePicker;)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->setColor(I)V

    .line 663
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$700(Lcom/rey/material/widget/DatePicker;)Landroid/graphics/Paint;

    move-result-object v11

    invoke-virtual {p1, v9, v10, v7, v11}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 667
    .end local v0    # "col":I
    .end local v7    # "radius":F
    .end local v8    # "row":I
    :cond_14d
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$700(Lcom/rey/material/widget/DatePicker;)Landroid/graphics/Paint;

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 668
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$700(Lcom/rey/material/widget/DatePicker;)Landroid/graphics/Paint;

    move-result-object v11

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mTextLabelColor:I
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$1800(Lcom/rey/material/widget/DatePicker;)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->setColor(I)V

    .line 669
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mDayHeight:F
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$1300(Lcom/rey/material/widget/DatePicker;)F

    move-result v11

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mDayBaseHeight:F
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$1100(Lcom/rey/material/widget/DatePicker;)F

    move-result v12

    add-float/2addr v11, v12

    const/high16 v12, 0x40000000    # 2.0f

    div-float/2addr v11, v12

    add-float/2addr v6, v11

    .line 670
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_178
    const/4 v11, 0x7

    if-ge v2, v11, :cond_1b0

    .line 671
    int-to-float v11, v2

    const/high16 v12, 0x3f000000    # 0.5f

    add-float/2addr v11, v12

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mDayWidth:F
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$900(Lcom/rey/material/widget/DatePicker;)F

    move-result v12

    mul-float/2addr v11, v12

    add-float v9, v11, v5

    .line 672
    move v10, v6

    .line 673
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mFirstDayOfWeek:I
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$300(Lcom/rey/material/widget/DatePicker;)I

    move-result v11

    add-int/2addr v11, v2

    add-int/lit8 v11, v11, -0x1

    rem-int/lit8 v3, v11, 0x7

    .line 674
    .local v3, "index":I
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mLabels:[Ljava/lang/String;
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$1900(Lcom/rey/material/widget/DatePicker;)[Ljava/lang/String;

    move-result-object v11

    aget-object v11, v11, v3

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$700(Lcom/rey/material/widget/DatePicker;)Landroid/graphics/Paint;

    move-result-object v12

    invoke-virtual {p1, v11, v9, v10, v12}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 670
    add-int/lit8 v2, v2, 0x1

    goto :goto_178

    .line 650
    .end local v2    # "i":I
    .end local v3    # "index":I
    .restart local v0    # "col":I
    .restart local v8    # "row":I
    :cond_1a8
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mSelectionRadius:F
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$1500(Lcom/rey/material/widget/DatePicker;)F

    move-result v7

    goto/16 :goto_d0

    .line 678
    .end local v0    # "col":I
    .end local v8    # "row":I
    .restart local v2    # "i":I
    :cond_1b0
    iget v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mFirstDayCol:I

    .line 679
    .restart local v0    # "col":I
    const/4 v8, 0x1

    .line 680
    .restart local v8    # "row":I
    iget v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMaxAvailDay:I

    if-lez v11, :cond_208

    iget v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMaxAvailDay:I

    iget v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMaxDay:I

    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 681
    .local v4, "maxDay":I
    :goto_1bf
    const/4 v1, 0x1

    .local v1, "day":I
    :goto_1c0
    iget v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMaxDay:I

    if-gt v1, v11, :cond_245

    .line 682
    iget v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mSelectedDay:I

    if-ne v1, v11, :cond_20b

    .line 683
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$700(Lcom/rey/material/widget/DatePicker;)Landroid/graphics/Paint;

    move-result-object v11

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mTextHighlightColor:I
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$2000(Lcom/rey/material/widget/DatePicker;)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->setColor(I)V

    .line 691
    :goto_1d7
    int-to-float v11, v0

    const/high16 v12, 0x3f000000    # 0.5f

    add-float/2addr v11, v12

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mDayWidth:F
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$900(Lcom/rey/material/widget/DatePicker;)F

    move-result v12

    mul-float/2addr v11, v12

    add-float v9, v11, v5

    .line 692
    int-to-float v11, v8

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mDayHeight:F
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$1300(Lcom/rey/material/widget/DatePicker;)F

    move-result v12

    mul-float/2addr v11, v12

    add-float v10, v11, v6

    .line 694
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # invokes: Lcom/rey/material/widget/DatePicker;->getDayText(I)Ljava/lang/String;
    invoke-static {v11, v1}, Lcom/rey/material/widget/DatePicker;->access$2200(Lcom/rey/material/widget/DatePicker;I)Ljava/lang/String;

    move-result-object v11

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$700(Lcom/rey/material/widget/DatePicker;)Landroid/graphics/Paint;

    move-result-object v12

    invoke-virtual {p1, v11, v9, v10, v12}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 695
    add-int/lit8 v0, v0, 0x1

    .line 696
    const/4 v11, 0x7

    if-ne v0, v11, :cond_205

    .line 697
    const/4 v0, 0x0

    .line 698
    add-int/lit8 v8, v8, 0x1

    .line 681
    :cond_205
    add-int/lit8 v1, v1, 0x1

    goto :goto_1c0

    .line 680
    .end local v1    # "day":I
    .end local v4    # "maxDay":I
    :cond_208
    iget v4, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMaxDay:I

    goto :goto_1bf

    .line 684
    .restart local v1    # "day":I
    .restart local v4    # "maxDay":I
    :cond_20b
    iget v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMinAvailDay:I

    if-lt v1, v11, :cond_211

    if-le v1, v4, :cond_221

    .line 685
    :cond_211
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$700(Lcom/rey/material/widget/DatePicker;)Landroid/graphics/Paint;

    move-result-object v11

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mTextDisableColor:I
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$2100(Lcom/rey/material/widget/DatePicker;)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_1d7

    .line 686
    :cond_221
    iget v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mToday:I

    if-ne v1, v11, :cond_235

    .line 687
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$700(Lcom/rey/material/widget/DatePicker;)Landroid/graphics/Paint;

    move-result-object v11

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mSelectionColor:I
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$1600(Lcom/rey/material/widget/DatePicker;)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_1d7

    .line 689
    :cond_235
    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaint:Landroid/graphics/Paint;
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$700(Lcom/rey/material/widget/DatePicker;)Landroid/graphics/Paint;

    move-result-object v11

    iget-object v12, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mTextColor:I
    invoke-static {v12}, Lcom/rey/material/widget/DatePicker;->access$1200(Lcom/rey/material/widget/DatePicker;)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_1d7

    .line 701
    :cond_245
    return-void
.end method

.method protected onMeasure(II)V
    .registers 5
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 627
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mMonthRealWidth:I
    invoke-static {v0}, Lcom/rey/material/widget/DatePicker;->access$400(Lcom/rey/material/widget/DatePicker;)I

    move-result v0

    iget-object v1, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mMonthRealHeight:I
    invoke-static {v1}, Lcom/rey/material/widget/DatePicker;->access$500(Lcom/rey/material/widget/DatePicker;)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/rey/material/widget/DatePicker$MonthView;->setMeasuredDimension(II)V

    .line 628
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 8
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v5, -0x1

    const/4 v4, 0x1

    .line 721
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_42

    .line 735
    :cond_9
    :goto_9
    :pswitch_9
    return v4

    .line 723
    :pswitch_a
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/rey/material/widget/DatePicker$MonthView;->getTouchedDay(FF)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mTouchedDay:I

    goto :goto_9

    .line 726
    :pswitch_19
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/rey/material/widget/DatePicker$MonthView;->getTouchedDay(FF)I

    move-result v0

    iget v1, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mTouchedDay:I

    if-ne v0, v1, :cond_9

    iget v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mTouchedDay:I

    if-lez v0, :cond_9

    .line 727
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mAdapter:Lcom/rey/material/widget/DatePicker$MonthAdapter;
    invoke-static {v0}, Lcom/rey/material/widget/DatePicker;->access$2300(Lcom/rey/material/widget/DatePicker;)Lcom/rey/material/widget/DatePicker$MonthAdapter;

    move-result-object v0

    iget v1, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mTouchedDay:I

    iget v2, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMonth:I

    iget v3, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mYear:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/rey/material/widget/DatePicker$MonthAdapter;->setDate(IIIZ)V

    .line 728
    iput v5, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mTouchedDay:I

    goto :goto_9

    .line 732
    :pswitch_3f
    iput v5, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mTouchedDay:I

    goto :goto_9

    .line 721
    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_a
        :pswitch_19
        :pswitch_9
        :pswitch_3f
    .end packed-switch
.end method

.method public setAvailableDay(II)V
    .registers 4
    .param p1, "min"    # I
    .param p2, "max"    # I

    .prologue
    .line 607
    iget v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMinAvailDay:I

    if-ne v0, p1, :cond_8

    iget v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMaxAvailDay:I

    if-eq v0, p2, :cond_f

    .line 608
    :cond_8
    iput p1, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMinAvailDay:I

    .line 609
    iput p2, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMaxAvailDay:I

    .line 610
    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->invalidate()V

    .line 612
    :cond_f
    return-void
.end method

.method public setMonth(II)V
    .registers 4
    .param p1, "month"    # I
    .param p2, "year"    # I

    .prologue
    .line 579
    iget v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMonth:I

    if-ne v0, p1, :cond_8

    iget v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mYear:I

    if-eq v0, p2, :cond_12

    .line 580
    :cond_8
    iput p1, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mMonth:I

    .line 581
    iput p2, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mYear:I

    .line 582
    invoke-direct {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->calculateMonthView()V

    .line 583
    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->invalidate()V

    .line 585
    :cond_12
    return-void
.end method

.method public setSelectedDay(IZ)V
    .registers 4
    .param p1, "day"    # I
    .param p2, "animation"    # Z

    .prologue
    .line 588
    iget v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mSelectedDay:I

    if-eq v0, p1, :cond_f

    .line 589
    iget v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mSelectedDay:I

    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mPreviousSelectedDay:I

    .line 590
    iput p1, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mSelectedDay:I

    .line 592
    if-eqz p2, :cond_10

    .line 593
    invoke-direct {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->startAnimation()V

    .line 597
    :cond_f
    :goto_f
    return-void

    .line 595
    :cond_10
    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->invalidate()V

    goto :goto_f
.end method

.method public setToday(I)V
    .registers 3
    .param p1, "day"    # I

    .prologue
    .line 600
    iget v0, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mToday:I

    if-eq v0, p1, :cond_9

    .line 601
    iput p1, p0, Lcom/rey/material/widget/DatePicker$MonthView;->mToday:I

    .line 602
    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthView;->invalidate()V

    .line 604
    :cond_9
    return-void
.end method
