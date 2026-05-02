.class public Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;
.super Lcom/wdullaer/materialdatetimepicker/date/MonthView;
.source "SimpleMonthView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;-><init>(Landroid/content/Context;)V

    .line 28
    return-void
.end method


# virtual methods
.method public drawMonthDay(Landroid/graphics/Canvas;IIIIIIIII)V
    .registers 15
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "year"    # I
    .param p3, "month"    # I
    .param p4, "day"    # I
    .param p5, "x"    # I
    .param p6, "y"    # I
    .param p7, "startX"    # I
    .param p8, "stopX"    # I
    .param p9, "startY"    # I
    .param p10, "stopY"    # I

    .prologue
    .line 33
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mSelectedDay:I

    if-ne v0, p4, :cond_14

    .line 34
    int-to-float v0, p5

    sget v1, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->MINI_DAY_NUMBER_TEXT_SIZE:I

    div-int/lit8 v1, v1, 0x3

    sub-int v1, p6, v1

    int-to-float v1, v1

    sget v2, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->DAY_SELECTED_CIRCLE_SIZE:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mSelectedCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 39
    :cond_14
    invoke-virtual {p0, p2, p3, p4}, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->isOutOfRange(III)Z

    move-result v0

    if-eqz v0, :cond_39

    .line 40
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mMonthNumPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mDisabledDayTextColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 48
    :goto_21
    const-string v0, "%d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    int-to-float v1, p5

    int-to-float v2, p6

    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mMonthNumPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 49
    return-void

    .line 41
    :cond_39
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mSelectedDay:I

    if-ne v0, p4, :cond_45

    .line 42
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mMonthNumPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mSelectedDayTextColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_21

    .line 43
    :cond_45
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mHasToday:Z

    if-eqz v0, :cond_55

    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mToday:I

    if-ne v0, p4, :cond_55

    .line 44
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mMonthNumPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mTodayNumberColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_21

    .line 46
    :cond_55
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mMonthNumPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mDayTextColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_21
.end method
