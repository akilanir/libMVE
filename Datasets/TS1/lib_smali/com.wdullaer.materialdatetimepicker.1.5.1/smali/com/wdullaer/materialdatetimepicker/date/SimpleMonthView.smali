.class public Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;
.super Lcom/wdullaer/materialdatetimepicker/date/MonthView;
.source "SimpleMonthView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attr"    # Landroid/util/AttributeSet;
    .param p3, "controller"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    .prologue
    .line 27
    invoke-direct {p0, p1, p2, p3}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;)V

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

    .line 38
    :cond_14
    invoke-virtual {p0, p2, p3, p4}, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->isHighlighted(III)Z

    move-result v0

    if-eqz v0, :cond_4b

    .line 39
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mMonthNumPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 46
    :goto_26
    invoke-virtual {p0, p2, p3, p4}, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->isOutOfRange(III)Z

    move-result v0

    if-eqz v0, :cond_58

    .line 47
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mMonthNumPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mDisabledDayTextColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 58
    :goto_33
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

    .line 59
    return-void

    .line 42
    :cond_4b
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mMonthNumPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto :goto_26

    .line 49
    :cond_58
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mSelectedDay:I

    if-ne v0, p4, :cond_70

    .line 50
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mMonthNumPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 51
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mMonthNumPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mSelectedDayTextColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_33

    .line 52
    :cond_70
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mHasToday:Z

    if-eqz v0, :cond_80

    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mToday:I

    if-ne v0, p4, :cond_80

    .line 53
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mMonthNumPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mTodayNumberColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_33

    .line 55
    :cond_80
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mMonthNumPaint:Landroid/graphics/Paint;

    invoke-virtual {p0, p2, p3, p4}, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->isHighlighted(III)Z

    move-result v0

    if-eqz v0, :cond_8e

    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mHighlightedDayTextColor:I

    :goto_8a
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_33

    :cond_8e
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;->mDayTextColor:I

    goto :goto_8a
.end method
