.class public Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;
.super Landroid/app/DialogFragment;
.source "DatePickerDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;,
        Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;
    }
.end annotation


# static fields
.field private static final ANIMATION_DELAY:I = 0x1f4

.field private static final ANIMATION_DURATION:I = 0x12c

.field private static DAY_FORMAT:Ljava/text/SimpleDateFormat; = null

.field private static final DEFAULT_END_YEAR:I = 0x834

.field private static final DEFAULT_START_YEAR:I = 0x76c

.field private static final KEY_CURRENT_VIEW:Ljava/lang/String; = "current_view"

.field private static final KEY_LIST_POSITION:Ljava/lang/String; = "list_position"

.field private static final KEY_LIST_POSITION_OFFSET:Ljava/lang/String; = "list_position_offset"

.field private static final KEY_SELECTED_DAY:Ljava/lang/String; = "day"

.field private static final KEY_SELECTED_MONTH:Ljava/lang/String; = "month"

.field private static final KEY_SELECTED_YEAR:Ljava/lang/String; = "year"

.field private static final KEY_WEEK_START:Ljava/lang/String; = "week_start"

.field private static final KEY_YEAR_END:Ljava/lang/String; = "year_end"

.field private static final KEY_YEAR_START:Ljava/lang/String; = "year_start"

.field private static final MONTH_AND_DAY_VIEW:I = 0x0

.field private static final TAG:Ljava/lang/String; = "DatePickerDialog"

.field private static final UNINITIALIZED:I = -0x1

.field private static YEAR_FORMAT:Ljava/text/SimpleDateFormat; = null

.field private static final YEAR_VIEW:I = 0x1


# instance fields
.field private mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

.field private final mCalendar:Ljava/util/Calendar;

.field private mCallBack:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;

.field private mCurrentView:I

.field private mDayOfWeekView:Landroid/widget/TextView;

.field private mDayPickerDescription:Ljava/lang/String;

.field private mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

.field private mDelayAnimation:Z

.field private mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

.field private mListeners:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;",
            ">;"
        }
    .end annotation
.end field

.field private mMaxDate:Ljava/util/Calendar;

.field private mMaxYear:I

.field private mMinDate:Ljava/util/Calendar;

.field private mMinYear:I

.field private mMonthAndDayView:Landroid/widget/LinearLayout;

.field private mSelectDay:Ljava/lang/String;

.field private mSelectYear:Ljava/lang/String;

.field private mSelectedDayTextView:Landroid/widget/TextView;

.field private mSelectedMonthTextView:Landroid/widget/TextView;

.field private mWeekStart:I

.field private mYearPickerDescription:Ljava/lang/String;

.field private mYearPickerView:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

.field private mYearView:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 78
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->YEAR_FORMAT:Ljava/text/SimpleDateFormat;

    .line 79
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "dd"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->DAY_FORMAT:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 137
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    .line 81
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    .line 83
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mListeners:Ljava/util/HashSet;

    .line 95
    const/4 v0, -0x1

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCurrentView:I

    .line 97
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v0}, Ljava/util/Calendar;->getFirstDayOfWeek()I

    move-result v0

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mWeekStart:I

    .line 98
    const/16 v0, 0x76c

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMinYear:I

    .line 99
    const/16 v0, 0x834

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMaxYear:I

    .line 105
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDelayAnimation:Z

    .line 139
    return-void
.end method

.method static synthetic access$000(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;)Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCallBack:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;)Ljava/util/Calendar;
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    return-object v0
.end method

.method private adjustDayInMonthIfNeeded(II)V
    .registers 7
    .param p1, "month"    # I
    .param p2, "year"    # I

    .prologue
    const/4 v3, 0x5

    .line 444
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    move-result v0

    .line 445
    .local v0, "day":I
    invoke-static {p1, p2}, Lcom/wdullaer/materialdatetimepicker/Utils;->getDaysInMonth(II)I

    move-result v1

    .line 446
    .local v1, "daysInMonth":I
    if-le v0, v1, :cond_12

    .line 447
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v2, v3, v1}, Ljava/util/Calendar;->set(II)V

    .line 449
    :cond_12
    return-void
.end method

.method public static newInstance(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;III)Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;
    .registers 5
    .param p0, "callBack"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;
    .param p1, "year"    # I
    .param p2, "monthOfYear"    # I
    .param p3, "dayOfMonth"    # I

    .prologue
    .line 150
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;

    invoke-direct {v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;-><init>()V

    .line 151
    .local v0, "ret":Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;
    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->initialize(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;III)V

    .line 152
    return-object v0
.end method

.method private setCurrentView(I)V
    .registers 15
    .param p1, "viewIndex"    # I

    .prologue
    const-wide/16 v11, 0x1f4

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 300
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v6}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    .line 302
    .local v2, "millis":J
    packed-switch p1, :pswitch_data_d4

    .line 344
    :goto_d
    return-void

    .line 304
    :pswitch_e
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMonthAndDayView:Landroid/widget/LinearLayout;

    const v7, 0x3f666666    # 0.9f

    const v8, 0x3f866666    # 1.05f

    invoke-static {v6, v7, v8}, Lcom/wdullaer/materialdatetimepicker/Utils;->getPulseAnimator(Landroid/view/View;FF)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 306
    .local v4, "pulseAnimator":Landroid/animation/ObjectAnimator;
    iget-boolean v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDelayAnimation:Z

    if-eqz v6, :cond_23

    .line 307
    invoke-virtual {v4, v11, v12}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 308
    iput-boolean v9, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDelayAnimation:Z

    .line 310
    :cond_23
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v6}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->onDateChanged()V

    .line 311
    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCurrentView:I

    if-eq v6, p1, :cond_3d

    .line 312
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMonthAndDayView:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v10}, Landroid/widget/LinearLayout;->setSelected(Z)V

    .line 313
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearView:Landroid/widget/TextView;

    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setSelected(Z)V

    .line 314
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    invoke-virtual {v6, v9}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->setDisplayedChild(I)V

    .line 315
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCurrentView:I

    .line 317
    :cond_3d
    invoke-virtual {v4}, Landroid/animation/ObjectAnimator;->start()V

    .line 319
    const/16 v1, 0x10

    .line 320
    .local v1, "flags":I
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-static {v6, v2, v3, v1}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object v0

    .line 321
    .local v0, "dayString":Ljava/lang/String;
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerDescription:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 322
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mSelectDay:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    goto :goto_d

    .line 325
    .end local v0    # "dayString":Ljava/lang/String;
    .end local v1    # "flags":I
    .end local v4    # "pulseAnimator":Landroid/animation/ObjectAnimator;
    :pswitch_70
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearView:Landroid/widget/TextView;

    const v7, 0x3f59999a    # 0.85f

    const v8, 0x3f8ccccd    # 1.1f

    invoke-static {v6, v7, v8}, Lcom/wdullaer/materialdatetimepicker/Utils;->getPulseAnimator(Landroid/view/View;FF)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 326
    .restart local v4    # "pulseAnimator":Landroid/animation/ObjectAnimator;
    iget-boolean v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDelayAnimation:Z

    if-eqz v6, :cond_85

    .line 327
    invoke-virtual {v4, v11, v12}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 328
    iput-boolean v9, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDelayAnimation:Z

    .line 330
    :cond_85
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearPickerView:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    invoke-virtual {v6}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->onDateChanged()V

    .line 331
    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCurrentView:I

    if-eq v6, p1, :cond_9f

    .line 332
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMonthAndDayView:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v9}, Landroid/widget/LinearLayout;->setSelected(Z)V

    .line 333
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearView:Landroid/widget/TextView;

    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setSelected(Z)V

    .line 334
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    invoke-virtual {v6, v10}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->setDisplayedChild(I)V

    .line 335
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCurrentView:I

    .line 337
    :cond_9f
    invoke-virtual {v4}, Landroid/animation/ObjectAnimator;->start()V

    .line 339
    sget-object v6, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->YEAR_FORMAT:Ljava/text/SimpleDateFormat;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 340
    .local v5, "yearString":Ljava/lang/CharSequence;
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearPickerDescription:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 341
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mSelectYear:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    goto/16 :goto_d

    .line 302
    nop

    :pswitch_data_d4
    .packed-switch 0x0
        :pswitch_e
        :pswitch_70
    .end packed-switch
.end method

.method private updateDisplay(Z)V
    .registers 12
    .param p1, "announce"    # Z

    .prologue
    const/4 v9, 0x2

    .line 347
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayOfWeekView:Landroid/widget/TextView;

    if-eqz v5, :cond_1d

    .line 348
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayOfWeekView:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v7, 0x7

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v8

    invoke-virtual {v6, v7, v9, v8}, Ljava/util/Calendar;->getDisplayName(IILjava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 352
    :cond_1d
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mSelectedMonthTextView:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v7, 0x1

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v8

    invoke-virtual {v6, v9, v7, v8}, Ljava/util/Calendar;->getDisplayName(IILjava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 354
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mSelectedDayTextView:Landroid/widget/TextView;

    sget-object v6, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->DAY_FORMAT:Ljava/text/SimpleDateFormat;

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v7}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 355
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearView:Landroid/widget/TextView;

    sget-object v6, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->YEAR_FORMAT:Ljava/text/SimpleDateFormat;

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v7}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 358
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v5}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    .line 359
    .local v2, "millis":J
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    invoke-virtual {v5, v2, v3}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->setDateMillis(J)V

    .line 360
    const/16 v0, 0x18

    .line 361
    .local v0, "flags":I
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-static {v5, v2, v3, v0}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object v4

    .line 362
    .local v4, "monthAndDayText":Ljava/lang/String;
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMonthAndDayView:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v4}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 364
    if-eqz p1, :cond_82

    .line 365
    const/16 v0, 0x14

    .line 366
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-static {v5, v2, v3, v0}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object v1

    .line 367
    .local v1, "fullDateText":Ljava/lang/String;
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    invoke-static {v5, v1}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 369
    .end local v1    # "fullDateText":Ljava/lang/String;
    :cond_82
    return-void
.end method

.method private updatePickers()V
    .registers 3

    .prologue
    .line 480
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mListeners:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 481
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;>;"
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    .line 482
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;

    invoke-interface {v1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;->onDateChanged()V

    goto :goto_6

    .line 484
    :cond_16
    return-void
.end method


# virtual methods
.method public getFirstDayOfWeek()I
    .registers 2

    .prologue
    .line 504
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mWeekStart:I

    return v0
.end method

.method public getMaxDate()Ljava/util/Calendar;
    .registers 2

    .prologue
    .line 432
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMaxDate:Ljava/util/Calendar;

    return-object v0
.end method

.method public getMaxYear()I
    .registers 2

    .prologue
    .line 499
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMaxYear:I

    return v0
.end method

.method public getMinDate()Ljava/util/Calendar;
    .registers 2

    .prologue
    .line 411
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMinDate:Ljava/util/Calendar;

    return-object v0
.end method

.method public getMinYear()I
    .registers 2

    .prologue
    .line 494
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMinYear:I

    return v0
.end method

.method public getSelectedDay()Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;
    .registers 3

    .prologue
    .line 489
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;-><init>(Ljava/util/Calendar;)V

    return-object v0
.end method

.method public initialize(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;III)V
    .registers 7
    .param p1, "callBack"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;
    .param p2, "year"    # I
    .param p3, "monthOfYear"    # I
    .param p4, "dayOfMonth"    # I

    .prologue
    .line 156
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCallBack:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;

    .line 157
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p2}, Ljava/util/Calendar;->set(II)V

    .line 158
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p3}, Ljava/util/Calendar;->set(II)V

    .line 159
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v1, 0x5

    invoke-virtual {v0, v1, p4}, Ljava/util/Calendar;->set(II)V

    .line 160
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 453
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->tryVibrate()V

    .line 454
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/wdullaer/materialdatetimepicker/R$id;->date_picker_year:I

    if-ne v0, v1, :cond_10

    .line 455
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->setCurrentView(I)V

    .line 459
    :cond_f
    :goto_f
    return-void

    .line 456
    :cond_10
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/wdullaer/materialdatetimepicker/R$id;->date_picker_month_and_day:I

    if-ne v0, v1, :cond_f

    .line 457
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->setCurrentView(I)V

    goto :goto_f
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 164
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 165
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 166
    .local v0, "activity":Landroid/app/Activity;
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 168
    if-eqz p1, :cond_35

    .line 169
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v2, 0x1

    const-string v3, "year"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 170
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v2, 0x2

    const-string v3, "month"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 171
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v2, 0x5

    const-string v3, "day"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 173
    :cond_35
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 18
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 198
    const-string v11, "DatePickerDialog"

    const-string v12, "onCreateView: "

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v11

    invoke-virtual {v11}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v11

    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Landroid/view/Window;->requestFeature(I)Z

    .line 201
    sget v11, Lcom/wdullaer/materialdatetimepicker/R$layout;->mdtp_date_picker_dialog:I

    const/4 v12, 0x0

    invoke-virtual {p1, v11, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v10

    .line 203
    .local v10, "view":Landroid/view/View;
    sget v11, Lcom/wdullaer/materialdatetimepicker/R$id;->date_picker_header:I

    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    iput-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayOfWeekView:Landroid/widget/TextView;

    .line 204
    sget v11, Lcom/wdullaer/materialdatetimepicker/R$id;->date_picker_month_and_day:I

    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/LinearLayout;

    iput-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMonthAndDayView:Landroid/widget/LinearLayout;

    .line 205
    iget-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMonthAndDayView:Landroid/widget/LinearLayout;

    invoke-virtual {v11, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 206
    sget v11, Lcom/wdullaer/materialdatetimepicker/R$id;->date_picker_month:I

    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    iput-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mSelectedMonthTextView:Landroid/widget/TextView;

    .line 207
    sget v11, Lcom/wdullaer/materialdatetimepicker/R$id;->date_picker_day:I

    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    iput-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mSelectedDayTextView:Landroid/widget/TextView;

    .line 208
    sget v11, Lcom/wdullaer/materialdatetimepicker/R$id;->date_picker_year:I

    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    iput-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearView:Landroid/widget/TextView;

    .line 209
    iget-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearView:Landroid/widget/TextView;

    invoke-virtual {v11, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 211
    const/4 v6, -0x1

    .line 212
    .local v6, "listPosition":I
    const/4 v7, 0x0

    .line 213
    .local v7, "listPositionOffset":I
    const/4 v5, 0x0

    .line 214
    .local v5, "currentView":I
    if-eqz p3, :cond_91

    .line 215
    const-string v11, "week_start"

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v11

    iput v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mWeekStart:I

    .line 216
    const-string v11, "year_start"

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v11

    iput v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMinYear:I

    .line 217
    const-string v11, "year_end"

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v11

    iput v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMaxYear:I

    .line 218
    const-string v11, "current_view"

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    .line 219
    const-string v11, "list_position"

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    .line 220
    const-string v11, "list_position_offset"

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v7

    .line 223
    :cond_91
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->getActivity()Landroid/app/Activity;

    move-result-object v1

    .line 224
    .local v1, "activity":Landroid/app/Activity;
    new-instance v11, Lcom/wdullaer/materialdatetimepicker/date/SimpleDayPickerView;

    invoke-direct {v11, v1, p0}, Lcom/wdullaer/materialdatetimepicker/date/SimpleDayPickerView;-><init>(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;)V

    iput-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 225
    new-instance v11, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    invoke-direct {v11, v1, p0}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;-><init>(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;)V

    iput-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearPickerView:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    .line 227
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    .line 228
    .local v9, "res":Landroid/content/res/Resources;
    sget v11, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_day_picker_description:I

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerDescription:Ljava/lang/String;

    .line 229
    sget v11, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_select_day:I

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mSelectDay:Ljava/lang/String;

    .line 230
    sget v11, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_year_picker_description:I

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearPickerDescription:Ljava/lang/String;

    .line 231
    sget v11, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_select_year:I

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mSelectYear:Ljava/lang/String;

    .line 233
    sget v11, Lcom/wdullaer/materialdatetimepicker/R$id;->animator:I

    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    iput-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    .line 234
    iget-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    iget-object v12, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v11, v12}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->addView(Landroid/view/View;)V

    .line 235
    iget-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    iget-object v12, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearPickerView:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    invoke-virtual {v11, v12}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->addView(Landroid/view/View;)V

    .line 236
    iget-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    iget-object v12, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v12}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v12

    invoke-virtual {v11, v12, v13}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->setDateMillis(J)V

    .line 238
    new-instance v2, Landroid/view/animation/AlphaAnimation;

    const/4 v11, 0x0

    const/high16 v12, 0x3f800000    # 1.0f

    invoke-direct {v2, v11, v12}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 239
    .local v2, "animation":Landroid/view/animation/Animation;
    const-wide/16 v11, 0x12c

    invoke-virtual {v2, v11, v12}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 240
    iget-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    invoke-virtual {v11, v2}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 242
    new-instance v3, Landroid/view/animation/AlphaAnimation;

    const/high16 v11, 0x3f800000    # 1.0f

    const/4 v12, 0x0

    invoke-direct {v3, v11, v12}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 243
    .local v3, "animation2":Landroid/view/animation/Animation;
    const-wide/16 v11, 0x12c

    invoke-virtual {v3, v11, v12}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 244
    iget-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    invoke-virtual {v11, v3}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 246
    sget v11, Lcom/wdullaer/materialdatetimepicker/R$id;->ok:I

    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/Button;

    .line 247
    .local v8, "okButton":Landroid/widget/Button;
    new-instance v11, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$1;

    invoke-direct {v11, p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$1;-><init>(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;)V

    invoke-virtual {v8, v11}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 259
    const-string v11, "Roboto-Medium"

    invoke-static {v1, v11}, Lcom/wdullaer/materialdatetimepicker/TypefaceHelper;->get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v11

    invoke-virtual {v8, v11}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 261
    sget v11, Lcom/wdullaer/materialdatetimepicker/R$id;->cancel:I

    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    .line 262
    .local v4, "cancelButton":Landroid/widget/Button;
    new-instance v11, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$2;

    invoke-direct {v11, p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$2;-><init>(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;)V

    invoke-virtual {v4, v11}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 269
    const-string v11, "Roboto-Medium"

    invoke-static {v1, v11}, Lcom/wdullaer/materialdatetimepicker/TypefaceHelper;->get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v11

    invoke-virtual {v4, v11}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 270
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->isCancelable()Z

    move-result v11

    if-eqz v11, :cond_163

    const/4 v11, 0x0

    :goto_147
    invoke-virtual {v4, v11}, Landroid/widget/Button;->setVisibility(I)V

    .line 272
    const/4 v11, 0x0

    invoke-direct {p0, v11}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->updateDisplay(Z)V

    .line 273
    invoke-direct {p0, v5}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->setCurrentView(I)V

    .line 275
    const/4 v11, -0x1

    if-eq v6, v11, :cond_15b

    .line 276
    if-nez v5, :cond_166

    .line 277
    iget-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v11, v6}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->postSetSelection(I)V

    .line 283
    :cond_15b
    :goto_15b
    new-instance v11, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    invoke-direct {v11, v1}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;-><init>(Landroid/content/Context;)V

    iput-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    .line 284
    return-object v10

    .line 270
    :cond_163
    const/16 v11, 0x8

    goto :goto_147

    .line 278
    :cond_166
    const/4 v11, 0x1

    if-ne v5, v11, :cond_15b

    .line 279
    iget-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearPickerView:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    invoke-virtual {v11, v6, v7}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->postSetSelectionFromTop(II)V

    goto :goto_15b
.end method

.method public onDayOfMonthSelected(III)V
    .registers 7
    .param p1, "year"    # I
    .param p2, "month"    # I
    .param p3, "day"    # I

    .prologue
    const/4 v2, 0x1

    .line 472
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v0, v2, p1}, Ljava/util/Calendar;->set(II)V

    .line 473
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p2}, Ljava/util/Calendar;->set(II)V

    .line 474
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v1, 0x5

    invoke-virtual {v0, v1, p3}, Ljava/util/Calendar;->set(II)V

    .line 475
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->updatePickers()V

    .line 476
    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->updateDisplay(Z)V

    .line 477
    return-void
.end method

.method public onPause()V
    .registers 2

    .prologue
    .line 295
    invoke-super {p0}, Landroid/app/DialogFragment;->onPause()V

    .line 296
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->stop()V

    .line 297
    return-void
.end method

.method public onResume()V
    .registers 2

    .prologue
    .line 289
    invoke-super {p0}, Landroid/app/DialogFragment;->onResume()V

    .line 290
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->start()V

    .line 291
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 7
    .param p1, "outState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v4, 0x1

    .line 177
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 178
    const-string v1, "year"

    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v2, v4}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 179
    const-string v1, "month"

    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 180
    const-string v1, "day"

    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 181
    const-string v1, "week_start"

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mWeekStart:I

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 182
    const-string v1, "year_start"

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMinYear:I

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 183
    const-string v1, "year_end"

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMaxYear:I

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 184
    const-string v1, "current_view"

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCurrentView:I

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 185
    const/4 v0, -0x1

    .line 186
    .local v0, "listPosition":I
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCurrentView:I

    if-nez v1, :cond_54

    .line 187
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getMostVisiblePosition()I

    move-result v0

    .line 192
    :cond_4e
    :goto_4e
    const-string v1, "list_position"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 193
    return-void

    .line 188
    :cond_54
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCurrentView:I

    if-ne v1, v4, :cond_4e

    .line 189
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearPickerView:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->getFirstVisiblePosition()I

    move-result v0

    .line 190
    const-string v1, "list_position_offset"

    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearPickerView:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->getFirstPositionOffset()I

    move-result v2

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_4e
.end method

.method public onYearSelected(I)V
    .registers 5
    .param p1, "year"    # I

    .prologue
    const/4 v2, 0x1

    .line 463
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    invoke-direct {p0, v0, p1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->adjustDayInMonthIfNeeded(II)V

    .line 464
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v0, v2, p1}, Ljava/util/Calendar;->set(II)V

    .line 465
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->updatePickers()V

    .line 466
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->setCurrentView(I)V

    .line 467
    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->updateDisplay(Z)V

    .line 468
    return-void
.end method

.method public registerOnDateChangedListener(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;

    .prologue
    .line 509
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mListeners:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 510
    return-void
.end method

.method public setFirstDayOfWeek(I)V
    .registers 4
    .param p1, "startOfWeek"    # I

    .prologue
    .line 372
    const/4 v0, 0x1

    if-lt p1, v0, :cond_6

    const/4 v0, 0x7

    if-le p1, v0, :cond_e

    .line 373
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Value must be between Calendar.SUNDAY and Calendar.SATURDAY"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 376
    :cond_e
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mWeekStart:I

    .line 377
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    if-eqz v0, :cond_19

    .line 378
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->onChange()V

    .line 380
    :cond_19
    return-void
.end method

.method public setMaxDate(Ljava/util/Calendar;)V
    .registers 3
    .param p1, "calendar"    # Ljava/util/Calendar;

    .prologue
    .line 420
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMaxDate:Ljava/util/Calendar;

    .line 422
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    if-eqz v0, :cond_b

    .line 423
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->onChange()V

    .line 425
    :cond_b
    return-void
.end method

.method public setMinDate(Ljava/util/Calendar;)V
    .registers 3
    .param p1, "calendar"    # Ljava/util/Calendar;

    .prologue
    .line 399
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMinDate:Ljava/util/Calendar;

    .line 401
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    if-eqz v0, :cond_b

    .line 402
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->onChange()V

    .line 404
    :cond_b
    return-void
.end method

.method public setOnDateSetListener(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;

    .prologue
    .line 436
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCallBack:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;

    .line 437
    return-void
.end method

.method public setYearRange(II)V
    .registers 5
    .param p1, "startYear"    # I
    .param p2, "endYear"    # I

    .prologue
    .line 383
    if-gt p2, p1, :cond_a

    .line 384
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Year end must be larger than year start"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 386
    :cond_a
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMinYear:I

    .line 387
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMaxYear:I

    .line 388
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    if-eqz v0, :cond_17

    .line 389
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->onChange()V

    .line 391
    :cond_17
    return-void
.end method

.method public tryVibrate()V
    .registers 2

    .prologue
    .line 519
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->tryVibrate()V

    .line 520
    return-void
.end method

.method public unregisterOnDateChangedListener(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;

    .prologue
    .line 514
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mListeners:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 515
    return-void
.end method
