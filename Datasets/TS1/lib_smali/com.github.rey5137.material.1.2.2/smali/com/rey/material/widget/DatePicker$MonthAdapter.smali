.class Lcom/rey/material/widget/DatePicker$MonthAdapter;
.super Landroid/widget/BaseAdapter;
.source "DatePicker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/DatePicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MonthAdapter"
.end annotation


# instance fields
.field private mDay:I

.field private mMaxDay:I

.field private mMaxMonth:I

.field private mMaxMonthValue:I

.field private mMaxYear:I

.field private mMinDay:I

.field private mMinMonth:I

.field private mMinMonthValue:I

.field private mMinYear:I

.field private mMonth:I

.field private mToday:I

.field private mTodayMonth:I

.field private mTodayYear:I

.field private mYear:I

.field final synthetic this$0:Lcom/rey/material/widget/DatePicker;


# direct methods
.method private constructor <init>(Lcom/rey/material/widget/DatePicker;)V
    .registers 3

    .prologue
    const/4 v0, -0x1

    .line 789
    iput-object p1, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->this$0:Lcom/rey/material/widget/DatePicker;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 790
    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mDay:I

    .line 791
    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMonth:I

    .line 792
    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mYear:I

    .line 793
    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMinDay:I

    .line 794
    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMinMonth:I

    .line 795
    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMinYear:I

    .line 796
    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMaxDay:I

    .line 797
    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMaxMonth:I

    .line 798
    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMaxYear:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/rey/material/widget/DatePicker;Lcom/rey/material/widget/DatePicker$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/rey/material/widget/DatePicker;
    .param p2, "x1"    # Lcom/rey/material/widget/DatePicker$1;

    .prologue
    .line 789
    invoke-direct {p0, p1}, Lcom/rey/material/widget/DatePicker$MonthAdapter;-><init>(Lcom/rey/material/widget/DatePicker;)V

    return-void
.end method

.method private calToday()V
    .registers 4

    .prologue
    .line 876
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;
    invoke-static {v0}, Lcom/rey/material/widget/DatePicker;->access$200(Lcom/rey/material/widget/DatePicker;)Ljava/util/Calendar;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 877
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;
    invoke-static {v0}, Lcom/rey/material/widget/DatePicker;->access$200(Lcom/rey/material/widget/DatePicker;)Ljava/util/Calendar;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mToday:I

    .line 878
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;
    invoke-static {v0}, Lcom/rey/material/widget/DatePicker;->access$200(Lcom/rey/material/widget/DatePicker;)Ljava/util/Calendar;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mTodayMonth:I

    .line 879
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mCalendar:Ljava/util/Calendar;
    invoke-static {v0}, Lcom/rey/material/widget/DatePicker;->access$200(Lcom/rey/material/widget/DatePicker;)Ljava/util/Calendar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mTodayYear:I

    .line 880
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 3

    .prologue
    .line 884
    iget v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMaxMonthValue:I

    iget v1, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMinMonthValue:I

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getDay()I
    .registers 2

    .prologue
    .line 864
    iget v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mDay:I

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 889
    iget v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMinMonthValue:I

    add-int/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 894
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getMonth()I
    .registers 2

    .prologue
    .line 868
    iget v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMonth:I

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 16
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 899
    move-object v6, p2

    check-cast v6, Lcom/rey/material/widget/DatePicker$MonthView;

    .line 900
    .local v6, "v":Lcom/rey/material/widget/DatePicker$MonthView;
    if-nez v6, :cond_2b

    .line 901
    new-instance v6, Lcom/rey/material/widget/DatePicker$MonthView;

    .end local v6    # "v":Lcom/rey/material/widget/DatePicker$MonthView;
    iget-object v8, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->this$0:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v6, v8, v9}, Lcom/rey/material/widget/DatePicker$MonthView;-><init>(Lcom/rey/material/widget/DatePicker;Landroid/content/Context;)V

    .line 902
    .restart local v6    # "v":Lcom/rey/material/widget/DatePicker$MonthView;
    iget-object v8, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaddingLeft:I
    invoke-static {v8}, Lcom/rey/material/widget/DatePicker;->access$2700(Lcom/rey/material/widget/DatePicker;)I

    move-result v8

    iget-object v9, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaddingTop:I
    invoke-static {v9}, Lcom/rey/material/widget/DatePicker;->access$2800(Lcom/rey/material/widget/DatePicker;)I

    move-result v9

    iget-object v10, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaddingRight:I
    invoke-static {v10}, Lcom/rey/material/widget/DatePicker;->access$2900(Lcom/rey/material/widget/DatePicker;)I

    move-result v10

    iget-object v11, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mPaddingBottom:I
    invoke-static {v11}, Lcom/rey/material/widget/DatePicker;->access$3000(Lcom/rey/material/widget/DatePicker;)I

    move-result v11

    invoke-virtual {v6, v8, v9, v10, v11}, Lcom/rey/material/widget/DatePicker$MonthView;->setPadding(IIII)V

    .line 905
    :cond_2b
    invoke-direct {p0}, Lcom/rey/material/widget/DatePicker$MonthAdapter;->calToday()V

    .line 906
    invoke-virtual {p0, p1}, Lcom/rey/material/widget/DatePicker$MonthAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 907
    .local v4, "monthValue":I
    div-int/lit8 v7, v4, 0xc

    .line 908
    .local v7, "year":I
    rem-int/lit8 v3, v4, 0xc

    .line 909
    .local v3, "month":I
    iget v8, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMinMonth:I

    if-ne v3, v8, :cond_72

    iget v8, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMinYear:I

    if-ne v7, v8, :cond_72

    iget v2, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMinDay:I

    .line 910
    .local v2, "minDay":I
    :goto_46
    iget v8, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMaxMonth:I

    if-ne v3, v8, :cond_74

    iget v8, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMaxYear:I

    if-ne v7, v8, :cond_74

    iget v1, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMaxDay:I

    .line 911
    .local v1, "maxDay":I
    :goto_50
    iget v8, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mTodayMonth:I

    if-ne v8, v3, :cond_76

    iget v8, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mTodayYear:I

    if-ne v8, v7, :cond_76

    iget v5, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mToday:I

    .line 912
    .local v5, "today":I
    :goto_5a
    iget v8, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMonth:I

    if-ne v3, v8, :cond_78

    iget v8, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mYear:I

    if-ne v7, v8, :cond_78

    iget v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mDay:I

    .line 914
    .local v0, "day":I
    :goto_64
    invoke-virtual {v6, v3, v7}, Lcom/rey/material/widget/DatePicker$MonthView;->setMonth(II)V

    .line 915
    invoke-virtual {v6, v5}, Lcom/rey/material/widget/DatePicker$MonthView;->setToday(I)V

    .line 916
    invoke-virtual {v6, v2, v1}, Lcom/rey/material/widget/DatePicker$MonthView;->setAvailableDay(II)V

    .line 917
    const/4 v8, 0x0

    invoke-virtual {v6, v0, v8}, Lcom/rey/material/widget/DatePicker$MonthView;->setSelectedDay(IZ)V

    .line 919
    return-object v6

    .line 909
    .end local v0    # "day":I
    .end local v1    # "maxDay":I
    .end local v2    # "minDay":I
    .end local v5    # "today":I
    :cond_72
    const/4 v2, -0x1

    goto :goto_46

    .line 910
    .restart local v2    # "minDay":I
    :cond_74
    const/4 v1, -0x1

    goto :goto_50

    .line 911
    .restart local v1    # "maxDay":I
    :cond_76
    const/4 v5, -0x1

    goto :goto_5a

    .line 912
    .restart local v5    # "today":I
    :cond_78
    const/4 v0, -0x1

    goto :goto_64
.end method

.method public getYear()I
    .registers 2

    .prologue
    .line 872
    iget v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mYear:I

    return v0
.end method

.method public positionOfMonth(II)I
    .registers 5
    .param p1, "month"    # I
    .param p2, "year"    # I

    .prologue
    .line 860
    mul-int/lit8 v0, p2, 0xc

    add-int/2addr v0, p1

    iget v1, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMinMonthValue:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public setDate(IIIZ)V
    .registers 18
    .param p1, "day"    # I
    .param p2, "month"    # I
    .param p3, "year"    # I
    .param p4, "animation"    # Z

    .prologue
    .line 825
    iget v1, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMonth:I

    if-ne v1, p2, :cond_a

    iget v1, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mYear:I

    move/from16 v0, p3

    if-eq v1, v0, :cond_6e

    .line 826
    :cond_a
    iget-object v1, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->this$0:Lcom/rey/material/widget/DatePicker;

    iget v5, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMonth:I

    iget v6, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mYear:I

    invoke-virtual {p0, v5, v6}, Lcom/rey/material/widget/DatePicker$MonthAdapter;->positionOfMonth(II)I

    move-result v5

    iget-object v6, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->this$0:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v6}, Lcom/rey/material/widget/DatePicker;->getFirstVisiblePosition()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-virtual {v1, v5}, Lcom/rey/material/widget/DatePicker;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Lcom/rey/material/widget/DatePicker$MonthView;

    .line 827
    .local v12, "v":Lcom/rey/material/widget/DatePicker$MonthView;
    if-eqz v12, :cond_28

    .line 828
    const/4 v1, -0x1

    const/4 v5, 0x0

    invoke-virtual {v12, v1, v5}, Lcom/rey/material/widget/DatePicker$MonthView;->setSelectedDay(IZ)V

    .line 830
    :cond_28
    iget v2, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mDay:I

    .line 831
    .local v2, "oldDay":I
    iget v3, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMonth:I

    .line 832
    .local v3, "oldMonth":I
    iget v4, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mYear:I

    .line 834
    .local v4, "oldYear":I
    iput p1, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mDay:I

    .line 835
    iput p2, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMonth:I

    .line 836
    move/from16 v0, p3

    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mYear:I

    .line 838
    iget-object v1, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->this$0:Lcom/rey/material/widget/DatePicker;

    iget v5, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMonth:I

    iget v6, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mYear:I

    invoke-virtual {p0, v5, v6}, Lcom/rey/material/widget/DatePicker$MonthAdapter;->positionOfMonth(II)I

    move-result v5

    iget-object v6, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->this$0:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v6}, Lcom/rey/material/widget/DatePicker;->getFirstVisiblePosition()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-virtual {v1, v5}, Lcom/rey/material/widget/DatePicker;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    .end local v12    # "v":Lcom/rey/material/widget/DatePicker$MonthView;
    check-cast v12, Lcom/rey/material/widget/DatePicker$MonthView;

    .line 839
    .restart local v12    # "v":Lcom/rey/material/widget/DatePicker$MonthView;
    if-eqz v12, :cond_56

    .line 840
    iget v1, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mDay:I

    move/from16 v0, p4

    invoke-virtual {v12, v1, v0}, Lcom/rey/material/widget/DatePicker$MonthView;->setSelectedDay(IZ)V

    .line 842
    :cond_56
    iget-object v1, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mOnDateChangedListener:Lcom/rey/material/widget/DatePicker$OnDateChangedListener;
    invoke-static {v1}, Lcom/rey/material/widget/DatePicker;->access$2600(Lcom/rey/material/widget/DatePicker;)Lcom/rey/material/widget/DatePicker$OnDateChangedListener;

    move-result-object v1

    if-eqz v1, :cond_6d

    .line 843
    iget-object v1, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mOnDateChangedListener:Lcom/rey/material/widget/DatePicker$OnDateChangedListener;
    invoke-static {v1}, Lcom/rey/material/widget/DatePicker;->access$2600(Lcom/rey/material/widget/DatePicker;)Lcom/rey/material/widget/DatePicker$OnDateChangedListener;

    move-result-object v1

    iget v5, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mDay:I

    iget v6, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMonth:I

    iget v7, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mYear:I

    invoke-interface/range {v1 .. v7}, Lcom/rey/material/widget/DatePicker$OnDateChangedListener;->onDateChanged(IIIIII)V

    .line 857
    .end local v2    # "oldDay":I
    .end local v3    # "oldMonth":I
    .end local v4    # "oldYear":I
    .end local v12    # "v":Lcom/rey/material/widget/DatePicker$MonthView;
    :cond_6d
    :goto_6d
    return-void

    .line 845
    :cond_6e
    iget v1, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mDay:I

    if-eq p1, v1, :cond_6d

    .line 846
    iget v2, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mDay:I

    .line 848
    .restart local v2    # "oldDay":I
    iput p1, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mDay:I

    .line 850
    iget-object v1, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->this$0:Lcom/rey/material/widget/DatePicker;

    iget v5, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMonth:I

    iget v6, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mYear:I

    invoke-virtual {p0, v5, v6}, Lcom/rey/material/widget/DatePicker$MonthAdapter;->positionOfMonth(II)I

    move-result v5

    iget-object v6, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->this$0:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v6}, Lcom/rey/material/widget/DatePicker;->getFirstVisiblePosition()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-virtual {v1, v5}, Lcom/rey/material/widget/DatePicker;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Lcom/rey/material/widget/DatePicker$MonthView;

    .line 851
    .restart local v12    # "v":Lcom/rey/material/widget/DatePicker$MonthView;
    if-eqz v12, :cond_96

    .line 852
    iget v1, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mDay:I

    move/from16 v0, p4

    invoke-virtual {v12, v1, v0}, Lcom/rey/material/widget/DatePicker$MonthView;->setSelectedDay(IZ)V

    .line 854
    :cond_96
    iget-object v1, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mOnDateChangedListener:Lcom/rey/material/widget/DatePicker$OnDateChangedListener;
    invoke-static {v1}, Lcom/rey/material/widget/DatePicker;->access$2600(Lcom/rey/material/widget/DatePicker;)Lcom/rey/material/widget/DatePicker$OnDateChangedListener;

    move-result-object v1

    if-eqz v1, :cond_6d

    .line 855
    iget-object v1, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->this$0:Lcom/rey/material/widget/DatePicker;

    # getter for: Lcom/rey/material/widget/DatePicker;->mOnDateChangedListener:Lcom/rey/material/widget/DatePicker$OnDateChangedListener;
    invoke-static {v1}, Lcom/rey/material/widget/DatePicker;->access$2600(Lcom/rey/material/widget/DatePicker;)Lcom/rey/material/widget/DatePicker$OnDateChangedListener;

    move-result-object v5

    iget v7, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMonth:I

    iget v8, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mYear:I

    iget v9, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mDay:I

    iget v10, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMonth:I

    iget v11, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mYear:I

    move v6, v2

    invoke-interface/range {v5 .. v11}, Lcom/rey/material/widget/DatePicker$OnDateChangedListener;->onDateChanged(IIIIII)V

    goto :goto_6d
.end method

.method public setDateRange(IIIIII)V
    .registers 10
    .param p1, "minDay"    # I
    .param p2, "minMonth"    # I
    .param p3, "minYear"    # I
    .param p4, "maxDay"    # I
    .param p5, "maxMonth"    # I
    .param p6, "maxYear"    # I

    .prologue
    .line 806
    if-ltz p1, :cond_6

    if-ltz p2, :cond_6

    if-gez p3, :cond_34

    :cond_6
    const/4 v1, 0x0

    .line 807
    .local v1, "minMonthValue":I
    :goto_7
    if-ltz p4, :cond_d

    if-ltz p5, :cond_d

    if-gez p6, :cond_39

    :cond_d
    const v0, 0x7ffffffe

    .line 809
    .local v0, "maxMonthValue":I
    :goto_10
    iget v2, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMinDay:I

    if-ne p1, v2, :cond_20

    iget v2, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMinMonthValue:I

    if-ne v2, v1, :cond_20

    iget v2, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMaxDay:I

    if-ne p4, v2, :cond_20

    iget v2, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMaxMonthValue:I

    if-eq v2, v0, :cond_33

    .line 810
    :cond_20
    iput p1, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMinDay:I

    .line 811
    iput p2, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMinMonth:I

    .line 812
    iput p3, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMinYear:I

    .line 814
    iput p4, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMaxDay:I

    .line 815
    iput p5, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMaxMonth:I

    .line 816
    iput p6, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMaxYear:I

    .line 818
    iput v1, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMinMonthValue:I

    .line 819
    iput v0, p0, Lcom/rey/material/widget/DatePicker$MonthAdapter;->mMaxMonthValue:I

    .line 820
    invoke-virtual {p0}, Lcom/rey/material/widget/DatePicker$MonthAdapter;->notifyDataSetChanged()V

    .line 822
    :cond_33
    return-void

    .line 806
    .end local v0    # "maxMonthValue":I
    .end local v1    # "minMonthValue":I
    :cond_34
    mul-int/lit8 v2, p3, 0xc

    add-int v1, v2, p2

    goto :goto_7

    .line 807
    .restart local v1    # "minMonthValue":I
    :cond_39
    mul-int/lit8 v2, p6, 0xc

    add-int v0, v2, p5

    goto :goto_10
.end method
