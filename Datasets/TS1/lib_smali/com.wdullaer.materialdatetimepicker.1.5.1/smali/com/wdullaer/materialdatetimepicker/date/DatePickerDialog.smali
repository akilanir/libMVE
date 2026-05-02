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

.field private static final KEY_ACCENT:Ljava/lang/String; = "accent"

.field private static final KEY_CURRENT_VIEW:Ljava/lang/String; = "current_view"

.field private static final KEY_DISMISS:Ljava/lang/String; = "dismiss"

.field private static final KEY_HIGHLIGHTED_DAYS:Ljava/lang/String; = "highlighted_days"

.field private static final KEY_LIST_POSITION:Ljava/lang/String; = "list_position"

.field private static final KEY_LIST_POSITION_OFFSET:Ljava/lang/String; = "list_position_offset"

.field private static final KEY_MAX_DATE:Ljava/lang/String; = "max_date"

.field private static final KEY_MIN_DATE:Ljava/lang/String; = "min_date"

.field private static final KEY_SELECTABLE_DAYS:Ljava/lang/String; = "selectable_days"

.field private static final KEY_SELECTED_DAY:Ljava/lang/String; = "day"

.field private static final KEY_SELECTED_MONTH:Ljava/lang/String; = "month"

.field private static final KEY_SELECTED_YEAR:Ljava/lang/String; = "year"

.field private static final KEY_THEME_DARK:Ljava/lang/String; = "theme_dark"

.field private static final KEY_VIBRATE:Ljava/lang/String; = "vibrate"

.field private static final KEY_WEEK_START:Ljava/lang/String; = "week_start"

.field private static final KEY_YEAR_END:Ljava/lang/String; = "year_end"

.field private static final KEY_YEAR_START:Ljava/lang/String; = "year_start"

.field private static final MONTH_AND_DAY_VIEW:I = 0x0

.field private static final TAG:Ljava/lang/String; = "DatePickerDialog"

.field private static final UNINITIALIZED:I = -0x1

.field private static YEAR_FORMAT:Ljava/text/SimpleDateFormat; = null

.field private static final YEAR_VIEW:I = 0x1


# instance fields
.field private highlightedDays:[Ljava/util/Calendar;

.field private mAccentColor:I

.field private mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

.field private final mCalendar:Ljava/util/Calendar;

.field private mCallBack:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;

.field private mCurrentView:I

.field private mDayOfWeekView:Landroid/widget/TextView;

.field private mDayPickerDescription:Ljava/lang/String;

.field private mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

.field private mDelayAnimation:Z

.field private mDismissOnPause:Z

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

.field private mOnCancelListener:Landroid/content/DialogInterface$OnCancelListener;

.field private mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

.field private mSelectDay:Ljava/lang/String;

.field private mSelectYear:Ljava/lang/String;

.field private mSelectedDayTextView:Landroid/widget/TextView;

.field private mSelectedMonthTextView:Landroid/widget/TextView;

.field private mThemeDark:Z

.field private mVibrate:Z

.field private mWeekStart:I

.field private mYearPickerDescription:Ljava/lang/String;

.field private mYearPickerView:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

.field private mYearView:Landroid/widget/TextView;

.field private selectableDays:[Ljava/util/Calendar;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 87
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->YEAR_FORMAT:Ljava/text/SimpleDateFormat;

    .line 88
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "dd"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->DAY_FORMAT:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, -0x1

    .line 154
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    .line 90
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    .line 92
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mListeners:Ljava/util/HashSet;

    .line 106
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCurrentView:I

    .line 108
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v0}, Ljava/util/Calendar;->getFirstDayOfWeek()I

    move-result v0

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mWeekStart:I

    .line 109
    const/16 v0, 0x76c

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMinYear:I

    .line 110
    const/16 v0, 0x834

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMaxYear:I

    .line 116
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAccentColor:I

    .line 122
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDelayAnimation:Z

    .line 156
    return-void
.end method

.method static synthetic access$000(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;)Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCallBack:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;)Ljava/util/Calendar;
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    return-object v0
.end method

.method private adjustDayInMonthIfNeeded(Ljava/util/Calendar;)V
    .registers 5
    .param p1, "calendar"    # Ljava/util/Calendar;

    .prologue
    const/4 v2, 0x5

    .line 617
    invoke-virtual {p1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v0

    .line 618
    .local v0, "day":I
    invoke-virtual {p1, v2}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v1

    .line 619
    .local v1, "daysInMonth":I
    if-le v0, v1, :cond_e

    .line 620
    invoke-virtual {p1, v2, v1}, Ljava/util/Calendar;->set(II)V

    .line 622
    :cond_e
    return-void
.end method

.method public static newInstance(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;III)Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;
    .registers 5
    .param p0, "callBack"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;
    .param p1, "year"    # I
    .param p2, "monthOfYear"    # I
    .param p3, "dayOfMonth"    # I

    .prologue
    .line 167
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;

    invoke-direct {v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;-><init>()V

    .line 168
    .local v0, "ret":Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;
    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->initialize(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;III)V

    .line 169
    return-object v0
.end method

.method private setCurrentView(I)V
    .registers 15
    .param p1, "viewIndex"    # I

    .prologue
    const-wide/16 v11, 0x1f4

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 369
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v6}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    .line 371
    .local v2, "millis":J
    packed-switch p1, :pswitch_data_d4

    .line 413
    :goto_d
    return-void

    .line 373
    :pswitch_e
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMonthAndDayView:Landroid/widget/LinearLayout;

    const v7, 0x3f666666    # 0.9f

    const v8, 0x3f866666    # 1.05f

    invoke-static {v6, v7, v8}, Lcom/wdullaer/materialdatetimepicker/Utils;->getPulseAnimator(Landroid/view/View;FF)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 375
    .local v4, "pulseAnimator":Landroid/animation/ObjectAnimator;
    iget-boolean v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDelayAnimation:Z

    if-eqz v6, :cond_23

    .line 376
    invoke-virtual {v4, v11, v12}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 377
    iput-boolean v9, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDelayAnimation:Z

    .line 379
    :cond_23
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v6}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->onDateChanged()V

    .line 380
    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCurrentView:I

    if-eq v6, p1, :cond_3d

    .line 381
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMonthAndDayView:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v10}, Landroid/widget/LinearLayout;->setSelected(Z)V

    .line 382
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearView:Landroid/widget/TextView;

    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setSelected(Z)V

    .line 383
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    invoke-virtual {v6, v9}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->setDisplayedChild(I)V

    .line 384
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCurrentView:I

    .line 386
    :cond_3d
    invoke-virtual {v4}, Landroid/animation/ObjectAnimator;->start()V

    .line 388
    const/16 v1, 0x10

    .line 389
    .local v1, "flags":I
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-static {v6, v2, v3, v1}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object v0

    .line 390
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

    .line 391
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mSelectDay:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    goto :goto_d

    .line 394
    .end local v0    # "dayString":Ljava/lang/String;
    .end local v1    # "flags":I
    .end local v4    # "pulseAnimator":Landroid/animation/ObjectAnimator;
    :pswitch_70
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearView:Landroid/widget/TextView;

    const v7, 0x3f59999a    # 0.85f

    const v8, 0x3f8ccccd    # 1.1f

    invoke-static {v6, v7, v8}, Lcom/wdullaer/materialdatetimepicker/Utils;->getPulseAnimator(Landroid/view/View;FF)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 395
    .restart local v4    # "pulseAnimator":Landroid/animation/ObjectAnimator;
    iget-boolean v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDelayAnimation:Z

    if-eqz v6, :cond_85

    .line 396
    invoke-virtual {v4, v11, v12}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 397
    iput-boolean v9, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDelayAnimation:Z

    .line 399
    :cond_85
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearPickerView:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    invoke-virtual {v6}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->onDateChanged()V

    .line 400
    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCurrentView:I

    if-eq v6, p1, :cond_9f

    .line 401
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMonthAndDayView:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v9}, Landroid/widget/LinearLayout;->setSelected(Z)V

    .line 402
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearView:Landroid/widget/TextView;

    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setSelected(Z)V

    .line 403
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    invoke-virtual {v6, v10}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->setDisplayedChild(I)V

    .line 404
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCurrentView:I

    .line 406
    :cond_9f
    invoke-virtual {v4}, Landroid/animation/ObjectAnimator;->start()V

    .line 408
    sget-object v6, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->YEAR_FORMAT:Ljava/text/SimpleDateFormat;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 409
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

    .line 410
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mSelectYear:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    goto/16 :goto_d

    .line 371
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

    .line 416
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayOfWeekView:Landroid/widget/TextView;

    if-eqz v5, :cond_1d

    .line 417
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

    .line 421
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

    .line 423
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mSelectedDayTextView:Landroid/widget/TextView;

    sget-object v6, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->DAY_FORMAT:Ljava/text/SimpleDateFormat;

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v7}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 424
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearView:Landroid/widget/TextView;

    sget-object v6, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->YEAR_FORMAT:Ljava/text/SimpleDateFormat;

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v7}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 427
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v5}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    .line 428
    .local v2, "millis":J
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    invoke-virtual {v5, v2, v3}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->setDateMillis(J)V

    .line 429
    const/16 v0, 0x18

    .line 430
    .local v0, "flags":I
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-static {v5, v2, v3, v0}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object v4

    .line 431
    .local v4, "monthAndDayText":Ljava/lang/String;
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMonthAndDayView:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v4}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 433
    if-eqz p1, :cond_82

    .line 434
    const/16 v0, 0x14

    .line 435
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-static {v5, v2, v3, v0}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object v1

    .line 436
    .local v1, "fullDateText":Ljava/lang/String;
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    invoke-static {v5, v1}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 438
    .end local v1    # "fullDateText":Ljava/lang/String;
    :cond_82
    return-void
.end method

.method private updatePickers()V
    .registers 4

    .prologue
    .line 653
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mListeners:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;

    .local v1, "listener":Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;
    invoke-interface {v1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;->onDateChanged()V

    goto :goto_6

    .line 654
    .end local v1    # "listener":Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;
    :cond_16
    return-void
.end method


# virtual methods
.method public dismissOnPause(Z)V
    .registers 2
    .param p1, "dismissOnPause"    # Z

    .prologue
    .line 453
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDismissOnPause:Z

    .line 454
    return-void
.end method

.method public getAccentColor()I
    .registers 2

    .prologue
    .line 486
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAccentColor:I

    return v0
.end method

.method public getFirstDayOfWeek()I
    .registers 2

    .prologue
    .line 678
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mWeekStart:I

    return v0
.end method

.method public getHighlightedDays()[Ljava/util/Calendar;
    .registers 2

    .prologue
    .line 574
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->highlightedDays:[Ljava/util/Calendar;

    return-object v0
.end method

.method public getMaxDate()Ljava/util/Calendar;
    .registers 2

    .prologue
    .line 555
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMaxDate:Ljava/util/Calendar;

    return-object v0
.end method

.method public getMaxYear()I
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 671
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->selectableDays:[Ljava/util/Calendar;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->selectableDays:[Ljava/util/Calendar;

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->selectableDays:[Ljava/util/Calendar;

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    aget-object v0, v0, v1

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v0

    .line 673
    :goto_12
    return v0

    :cond_13
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMaxDate:Ljava/util/Calendar;

    if-eqz v0, :cond_28

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMaxDate:Ljava/util/Calendar;

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v0

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMaxYear:I

    if-ge v0, v1, :cond_28

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMaxDate:Ljava/util/Calendar;

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v0

    goto :goto_12

    :cond_28
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMaxYear:I

    goto :goto_12
.end method

.method public getMinDate()Ljava/util/Calendar;
    .registers 2

    .prologue
    .line 533
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMinDate:Ljava/util/Calendar;

    return-object v0
.end method

.method public getMinYear()I
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 664
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->selectableDays:[Ljava/util/Calendar;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->selectableDays:[Ljava/util/Calendar;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v0

    .line 666
    :goto_e
    return v0

    :cond_f
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMinDate:Ljava/util/Calendar;

    if-eqz v0, :cond_24

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v0

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMinYear:I

    if-le v0, v1, :cond_24

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v0

    goto :goto_e

    :cond_24
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMinYear:I

    goto :goto_e
.end method

.method public getSelectableDays()[Ljava/util/Calendar;
    .registers 2

    .prologue
    .line 594
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->selectableDays:[Ljava/util/Calendar;

    return-object v0
.end method

.method public getSelectedDay()Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;
    .registers 3

    .prologue
    .line 659
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;-><init>(Ljava/util/Calendar;)V

    return-object v0
.end method

.method public initialize(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;III)V
    .registers 9
    .param p1, "callBack"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;
    .param p2, "year"    # I
    .param p3, "monthOfYear"    # I
    .param p4, "dayOfMonth"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 173
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCallBack:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;

    .line 174
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v0, v3, p2}, Ljava/util/Calendar;->set(II)V

    .line 175
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p3}, Ljava/util/Calendar;->set(II)V

    .line 176
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v1, 0x5

    invoke-virtual {v0, v1, p4}, Ljava/util/Calendar;->set(II)V

    .line 177
    iput-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mThemeDark:Z

    .line 178
    const/4 v0, -0x1

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAccentColor:I

    .line 179
    iput-boolean v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mVibrate:Z

    .line 180
    iput-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDismissOnPause:Z

    .line 181
    return-void
.end method

.method public isThemeDark()Z
    .registers 2

    .prologue
    .line 470
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mThemeDark:Z

    return v0
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 358
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    .line 359
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mOnCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mOnCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnCancelListener;->onCancel(Landroid/content/DialogInterface;)V

    .line 360
    :cond_c
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 626
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->tryVibrate()V

    .line 627
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/wdullaer/materialdatetimepicker/R$id;->date_picker_year:I

    if-ne v0, v1, :cond_10

    .line 628
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->setCurrentView(I)V

    .line 632
    :cond_f
    :goto_f
    return-void

    .line 629
    :cond_10
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/wdullaer/materialdatetimepicker/R$id;->date_picker_month_and_day:I

    if-ne v0, v1, :cond_f

    .line 630
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->setCurrentView(I)V

    goto :goto_f
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 185
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 186
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 187
    .local v0, "activity":Landroid/app/Activity;
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 189
    if-eqz p1, :cond_35

    .line 190
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v2, 0x1

    const-string v3, "year"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 191
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v2, 0x2

    const-string v3, "month"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 192
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v2, 0x5

    const-string v3, "day"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 194
    :cond_35
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 20
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 227
    const-string v13, "DatePickerDialog"

    const-string v14, "onCreateView: "

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v13

    invoke-virtual {v13}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v13

    const/4 v14, 0x1

    invoke-virtual {v13, v14}, Landroid/view/Window;->requestFeature(I)Z

    .line 230
    sget v13, Lcom/wdullaer/materialdatetimepicker/R$layout;->mdtp_date_picker_dialog:I

    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v12

    .line 232
    .local v12, "view":Landroid/view/View;
    sget v13, Lcom/wdullaer/materialdatetimepicker/R$id;->date_picker_header:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayOfWeekView:Landroid/widget/TextView;

    .line 233
    sget v13, Lcom/wdullaer/materialdatetimepicker/R$id;->date_picker_month_and_day:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/LinearLayout;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMonthAndDayView:Landroid/widget/LinearLayout;

    .line 234
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMonthAndDayView:Landroid/widget/LinearLayout;

    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 235
    sget v13, Lcom/wdullaer/materialdatetimepicker/R$id;->date_picker_month:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mSelectedMonthTextView:Landroid/widget/TextView;

    .line 236
    sget v13, Lcom/wdullaer/materialdatetimepicker/R$id;->date_picker_day:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mSelectedDayTextView:Landroid/widget/TextView;

    .line 237
    sget v13, Lcom/wdullaer/materialdatetimepicker/R$id;->date_picker_year:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearView:Landroid/widget/TextView;

    .line 238
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearView:Landroid/widget/TextView;

    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 240
    const/4 v8, -0x1

    .line 241
    .local v8, "listPosition":I
    const/4 v9, 0x0

    .line 242
    .local v9, "listPositionOffset":I
    const/4 v7, 0x0

    .line 243
    .local v7, "currentView":I
    if-eqz p3, :cond_117

    .line 244
    const-string v13, "week_start"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p0

    iput v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mWeekStart:I

    .line 245
    const-string v13, "year_start"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p0

    iput v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMinYear:I

    .line 246
    const-string v13, "year_end"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p0

    iput v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMaxYear:I

    .line 247
    const-string v13, "current_view"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v7

    .line 248
    const-string v13, "list_position"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v8

    .line 249
    const-string v13, "list_position_offset"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v9

    .line 250
    const-string v13, "min_date"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v13

    check-cast v13, Ljava/util/Calendar;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMinDate:Ljava/util/Calendar;

    .line 251
    const-string v13, "max_date"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v13

    check-cast v13, Ljava/util/Calendar;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMaxDate:Ljava/util/Calendar;

    .line 252
    const-string v13, "highlighted_days"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v13

    check-cast v13, [Ljava/util/Calendar;

    check-cast v13, [Ljava/util/Calendar;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->highlightedDays:[Ljava/util/Calendar;

    .line 253
    const-string v13, "selectable_days"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v13

    check-cast v13, [Ljava/util/Calendar;

    check-cast v13, [Ljava/util/Calendar;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->selectableDays:[Ljava/util/Calendar;

    .line 254
    const-string v13, "theme_dark"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mThemeDark:Z

    .line 255
    const-string v13, "accent"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p0

    iput v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAccentColor:I

    .line 256
    const-string v13, "vibrate"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mVibrate:Z

    .line 257
    const-string v13, "dismiss"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDismissOnPause:Z

    .line 260
    :cond_117
    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->getActivity()Landroid/app/Activity;

    move-result-object v2

    .line 261
    .local v2, "activity":Landroid/app/Activity;
    new-instance v13, Lcom/wdullaer/materialdatetimepicker/date/SimpleDayPickerView;

    move-object/from16 v0, p0

    invoke-direct {v13, v2, v0}, Lcom/wdullaer/materialdatetimepicker/date/SimpleDayPickerView;-><init>(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;)V

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 262
    new-instance v13, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    move-object/from16 v0, p0

    invoke-direct {v13, v2, v0}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;-><init>(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;)V

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearPickerView:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    .line 264
    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    .line 265
    .local v11, "res":Landroid/content/res/Resources;
    sget v13, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_day_picker_description:I

    invoke-virtual {v11, v13}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerDescription:Ljava/lang/String;

    .line 266
    sget v13, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_select_day:I

    invoke-virtual {v11, v13}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mSelectDay:Ljava/lang/String;

    .line 267
    sget v13, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_year_picker_description:I

    invoke-virtual {v11, v13}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearPickerDescription:Ljava/lang/String;

    .line 268
    sget v13, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_select_year:I

    invoke-virtual {v11, v13}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mSelectYear:Ljava/lang/String;

    .line 270
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mThemeDark:Z

    if-eqz v13, :cond_28d

    sget v5, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_date_picker_view_animator_dark_theme:I

    .line 271
    .local v5, "bgColorResource":I
    :goto_165
    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    invoke-virtual {v13, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v13

    invoke-virtual {v12, v13}, Landroid/view/View;->setBackgroundColor(I)V

    .line 273
    sget v13, Lcom/wdullaer/materialdatetimepicker/R$id;->animator:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    .line 274
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v13, v14}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->addView(Landroid/view/View;)V

    .line 275
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearPickerView:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    invoke-virtual {v13, v14}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->addView(Landroid/view/View;)V

    .line 276
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v14}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v14

    invoke-virtual {v13, v14, v15}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->setDateMillis(J)V

    .line 278
    new-instance v3, Landroid/view/animation/AlphaAnimation;

    const/4 v13, 0x0

    const/high16 v14, 0x3f800000    # 1.0f

    invoke-direct {v3, v13, v14}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 279
    .local v3, "animation":Landroid/view/animation/Animation;
    const-wide/16 v13, 0x12c

    invoke-virtual {v3, v13, v14}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 280
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    invoke-virtual {v13, v3}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 282
    new-instance v4, Landroid/view/animation/AlphaAnimation;

    const/high16 v13, 0x3f800000    # 1.0f

    const/4 v14, 0x0

    invoke-direct {v4, v13, v14}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 283
    .local v4, "animation2":Landroid/view/animation/Animation;
    const-wide/16 v13, 0x12c

    invoke-virtual {v4, v13, v14}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 284
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAnimator:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    invoke-virtual {v13, v4}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 286
    sget v13, Lcom/wdullaer/materialdatetimepicker/R$id;->ok:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Button;

    .line 287
    .local v10, "okButton":Landroid/widget/Button;
    new-instance v13, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$1;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$1;-><init>(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;)V

    invoke-virtual {v10, v13}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 299
    const-string v13, "Roboto-Medium"

    invoke-static {v2, v13}, Lcom/wdullaer/materialdatetimepicker/TypefaceHelper;->get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v13

    invoke-virtual {v10, v13}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 301
    sget v13, Lcom/wdullaer/materialdatetimepicker/R$id;->cancel:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Button;

    .line 302
    .local v6, "cancelButton":Landroid/widget/Button;
    new-instance v13, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$2;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$2;-><init>(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;)V

    invoke-virtual {v6, v13}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 309
    const-string v13, "Roboto-Medium"

    invoke-static {v2, v13}, Lcom/wdullaer/materialdatetimepicker/TypefaceHelper;->get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v13

    invoke-virtual {v6, v13}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 310
    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->isCancelable()Z

    move-result v13

    if-eqz v13, :cond_291

    const/4 v13, 0x0

    :goto_206
    invoke-virtual {v6, v13}, Landroid/widget/Button;->setVisibility(I)V

    .line 313
    move-object/from16 v0, p0

    iget v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAccentColor:I

    const/4 v14, -0x1

    if-ne v13, v14, :cond_21f

    .line 314
    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->getActivity()Landroid/app/Activity;

    move-result-object v13

    invoke-static {v13}, Lcom/wdullaer/materialdatetimepicker/Utils;->getAccentColorFromThemeIfAvailable(Landroid/content/Context;)I

    move-result v1

    .line 315
    .local v1, "accentColor":I
    const/4 v13, -0x1

    if-eq v1, v13, :cond_21f

    .line 316
    move-object/from16 v0, p0

    iput v1, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAccentColor:I

    .line 319
    .end local v1    # "accentColor":I
    :cond_21f
    move-object/from16 v0, p0

    iget v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAccentColor:I

    const/4 v14, -0x1

    if-eq v13, v14, :cond_26c

    .line 320
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayOfWeekView:Landroid/widget/TextView;

    if-eqz v13, :cond_23b

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayOfWeekView:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget v14, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAccentColor:I

    invoke-static {v14}, Lcom/wdullaer/materialdatetimepicker/Utils;->darkenColor(I)I

    move-result v14

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 321
    :cond_23b
    sget v13, Lcom/wdullaer/materialdatetimepicker/R$id;->day_picker_selected_date_layout:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    move-object/from16 v0, p0

    iget v14, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAccentColor:I

    invoke-virtual {v13, v14}, Landroid/view/View;->setBackgroundColor(I)V

    .line 322
    move-object/from16 v0, p0

    iget v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAccentColor:I

    invoke-virtual {v10, v13}, Landroid/widget/Button;->setTextColor(I)V

    .line 323
    move-object/from16 v0, p0

    iget v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAccentColor:I

    invoke-virtual {v6, v13}, Landroid/widget/Button;->setTextColor(I)V

    .line 324
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearPickerView:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    move-object/from16 v0, p0

    iget v14, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAccentColor:I

    invoke-virtual {v13, v14}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->setAccentColor(I)V

    .line 325
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    move-object/from16 v0, p0

    iget v14, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAccentColor:I

    invoke-virtual {v13, v14}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->setAccentColor(I)V

    .line 328
    :cond_26c
    const/4 v13, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->updateDisplay(Z)V

    .line 329
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->setCurrentView(I)V

    .line 331
    const/4 v13, -0x1

    if-eq v8, v13, :cond_283

    .line 332
    if-nez v7, :cond_295

    .line 333
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v13, v8}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->postSetSelection(I)V

    .line 339
    :cond_283
    :goto_283
    new-instance v13, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    invoke-direct {v13, v2}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    .line 340
    return-object v12

    .line 270
    .end local v3    # "animation":Landroid/view/animation/Animation;
    .end local v4    # "animation2":Landroid/view/animation/Animation;
    .end local v5    # "bgColorResource":I
    .end local v6    # "cancelButton":Landroid/widget/Button;
    .end local v10    # "okButton":Landroid/widget/Button;
    :cond_28d
    sget v5, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_date_picker_view_animator:I

    goto/16 :goto_165

    .line 310
    .restart local v3    # "animation":Landroid/view/animation/Animation;
    .restart local v4    # "animation2":Landroid/view/animation/Animation;
    .restart local v5    # "bgColorResource":I
    .restart local v6    # "cancelButton":Landroid/widget/Button;
    .restart local v10    # "okButton":Landroid/widget/Button;
    :cond_291
    const/16 v13, 0x8

    goto/16 :goto_206

    .line 334
    :cond_295
    const/4 v13, 0x1

    if-ne v7, v13, :cond_283

    .line 335
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearPickerView:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    invoke-virtual {v13, v8, v9}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->postSetSelectionFromTop(II)V

    goto :goto_283
.end method

.method public onDayOfMonthSelected(III)V
    .registers 7
    .param p1, "year"    # I
    .param p2, "month"    # I
    .param p3, "day"    # I

    .prologue
    const/4 v2, 0x1

    .line 645
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v0, v2, p1}, Ljava/util/Calendar;->set(II)V

    .line 646
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p2}, Ljava/util/Calendar;->set(II)V

    .line 647
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v1, 0x5

    invoke-virtual {v0, v1, p3}, Ljava/util/Calendar;->set(II)V

    .line 648
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->updatePickers()V

    .line 649
    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->updateDisplay(Z)V

    .line 650
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 364
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 365
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    .line 366
    :cond_c
    return-void
.end method

.method public onPause()V
    .registers 2

    .prologue
    .line 351
    invoke-super {p0}, Landroid/app/DialogFragment;->onPause()V

    .line 352
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->stop()V

    .line 353
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDismissOnPause:Z

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->dismiss()V

    .line 354
    :cond_f
    return-void
.end method

.method public onResume()V
    .registers 2

    .prologue
    .line 345
    invoke-super {p0}, Landroid/app/DialogFragment;->onResume()V

    .line 346
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->start()V

    .line 347
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

    .line 198
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 199
    const-string v1, "year"

    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v2, v4}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 200
    const-string v1, "month"

    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 201
    const-string v1, "day"

    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 202
    const-string v1, "week_start"

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mWeekStart:I

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 203
    const-string v1, "year_start"

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMinYear:I

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 204
    const-string v1, "year_end"

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMaxYear:I

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 205
    const-string v1, "current_view"

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCurrentView:I

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 206
    const/4 v0, -0x1

    .line 207
    .local v0, "listPosition":I
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCurrentView:I

    if-nez v1, :cond_8c

    .line 208
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getMostVisiblePosition()I

    move-result v0

    .line 213
    :cond_4e
    :goto_4e
    const-string v1, "list_position"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 214
    const-string v1, "min_date"

    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 215
    const-string v1, "max_date"

    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMaxDate:Ljava/util/Calendar;

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 216
    const-string v1, "highlighted_days"

    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->highlightedDays:[Ljava/util/Calendar;

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 217
    const-string v1, "selectable_days"

    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->selectableDays:[Ljava/util/Calendar;

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 218
    const-string v1, "theme_dark"

    iget-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mThemeDark:Z

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 219
    const-string v1, "accent"

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAccentColor:I

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 220
    const-string v1, "vibrate"

    iget-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mVibrate:Z

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 221
    const-string v1, "dismiss"

    iget-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDismissOnPause:Z

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 222
    return-void

    .line 209
    :cond_8c
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCurrentView:I

    if-ne v1, v4, :cond_4e

    .line 210
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearPickerView:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->getFirstVisiblePosition()I

    move-result v0

    .line 211
    const-string v1, "list_position_offset"

    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mYearPickerView:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->getFirstPositionOffset()I

    move-result v2

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_4e
.end method

.method public onYearSelected(I)V
    .registers 4
    .param p1, "year"    # I

    .prologue
    const/4 v1, 0x1

    .line 636
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->adjustDayInMonthIfNeeded(Ljava/util/Calendar;)V

    .line 637
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v0, v1, p1}, Ljava/util/Calendar;->set(II)V

    .line 638
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->updatePickers()V

    .line 639
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->setCurrentView(I)V

    .line 640
    invoke-direct {p0, v1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->updateDisplay(Z)V

    .line 641
    return-void
.end method

.method public registerOnDateChangedListener(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;

    .prologue
    .line 683
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mListeners:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 684
    return-void
.end method

.method public setAccentColor(I)V
    .registers 2
    .param p1, "accentColor"    # I

    .prologue
    .line 478
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mAccentColor:I

    .line 479
    return-void
.end method

.method public setFirstDayOfWeek(I)V
    .registers 4
    .param p1, "startOfWeek"    # I

    .prologue
    .line 491
    const/4 v0, 0x1

    if-lt p1, v0, :cond_6

    const/4 v0, 0x7

    if-le p1, v0, :cond_e

    .line 492
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Value must be between Calendar.SUNDAY and Calendar.SATURDAY"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 495
    :cond_e
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mWeekStart:I

    .line 496
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    if-eqz v0, :cond_19

    .line 497
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->onChange()V

    .line 499
    :cond_19
    return-void
.end method

.method public setHighlightedDays([Ljava/util/Calendar;)V
    .registers 2
    .param p1, "highlightedDays"    # [Ljava/util/Calendar;

    .prologue
    .line 565
    invoke-static {p1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 566
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->highlightedDays:[Ljava/util/Calendar;

    .line 567
    return-void
.end method

.method public setMaxDate(Ljava/util/Calendar;)V
    .registers 3
    .param p1, "calendar"    # Ljava/util/Calendar;

    .prologue
    .line 543
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMaxDate:Ljava/util/Calendar;

    .line 545
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    if-eqz v0, :cond_b

    .line 546
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->onChange()V

    .line 548
    :cond_b
    return-void
.end method

.method public setMinDate(Ljava/util/Calendar;)V
    .registers 3
    .param p1, "calendar"    # Ljava/util/Calendar;

    .prologue
    .line 521
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMinDate:Ljava/util/Calendar;

    .line 523
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    if-eqz v0, :cond_b

    .line 524
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->onChange()V

    .line 526
    :cond_b
    return-void
.end method

.method public setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V
    .registers 2
    .param p1, "onCancelListener"    # Landroid/content/DialogInterface$OnCancelListener;

    .prologue
    .line 604
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mOnCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    .line 605
    return-void
.end method

.method public setOnDateSetListener(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;

    .prologue
    .line 599
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mCallBack:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener;

    .line 600
    return-void
.end method

.method public setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V
    .registers 2
    .param p1, "onDismissListener"    # Landroid/content/DialogInterface$OnDismissListener;

    .prologue
    .line 609
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    .line 610
    return-void
.end method

.method public setSelectableDays([Ljava/util/Calendar;)V
    .registers 2
    .param p1, "selectableDays"    # [Ljava/util/Calendar;

    .prologue
    .line 585
    invoke-static {p1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 586
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->selectableDays:[Ljava/util/Calendar;

    .line 587
    return-void
.end method

.method public setThemeDark(Z)V
    .registers 2
    .param p1, "themeDark"    # Z

    .prologue
    .line 461
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mThemeDark:Z

    .line 462
    return-void
.end method

.method public setYearRange(II)V
    .registers 5
    .param p1, "startYear"    # I
    .param p2, "endYear"    # I

    .prologue
    .line 503
    if-ge p2, p1, :cond_a

    .line 504
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Year end must be larger than or equal to year start"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 507
    :cond_a
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMinYear:I

    .line 508
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mMaxYear:I

    .line 509
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    if-eqz v0, :cond_17

    .line 510
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mDayPickerView:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->onChange()V

    .line 512
    :cond_17
    return-void
.end method

.method public tryVibrate()V
    .registers 2

    .prologue
    .line 693
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mVibrate:Z

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->tryVibrate()V

    .line 694
    :cond_9
    return-void
.end method

.method public unregisterOnDateChangedListener(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;

    .prologue
    .line 688
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mListeners:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 689
    return-void
.end method

.method public vibrate(Z)V
    .registers 2
    .param p1, "vibrate"    # Z

    .prologue
    .line 445
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->mVibrate:Z

    .line 446
    return-void
.end method
