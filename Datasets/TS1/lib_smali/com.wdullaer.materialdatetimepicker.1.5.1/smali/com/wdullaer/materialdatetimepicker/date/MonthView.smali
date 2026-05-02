.class public abstract Lcom/wdullaer/materialdatetimepicker/date/MonthView;
.super Landroid/view/View;
.source "MonthView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wdullaer/materialdatetimepicker/date/MonthView$OnDayClickListener;,
        Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;
    }
.end annotation


# static fields
.field protected static DAY_SELECTED_CIRCLE_SIZE:I = 0x0

.field protected static DAY_SEPARATOR_WIDTH:I = 0x0

.field protected static final DEFAULT_FOCUS_MONTH:I = -0x1

.field protected static DEFAULT_HEIGHT:I = 0x0

.field protected static final DEFAULT_NUM_DAYS:I = 0x7

.field protected static final DEFAULT_NUM_ROWS:I = 0x6

.field protected static final DEFAULT_SELECTED_DAY:I = -0x1

.field protected static final DEFAULT_SHOW_WK_NUM:I = 0x0

.field protected static final DEFAULT_WEEK_START:I = 0x1

.field protected static final MAX_NUM_ROWS:I = 0x6

.field protected static MINI_DAY_NUMBER_TEXT_SIZE:I = 0x0

.field protected static MIN_HEIGHT:I = 0x0

.field protected static MONTH_DAY_LABEL_TEXT_SIZE:I = 0x0

.field protected static MONTH_HEADER_SIZE:I = 0x0

.field protected static MONTH_LABEL_TEXT_SIZE:I = 0x0

.field private static final SELECTED_CIRCLE_ALPHA:I = 0xff

.field private static final TAG:Ljava/lang/String; = "MonthView"

.field public static final VIEW_PARAMS_FOCUS_MONTH:Ljava/lang/String; = "focus_month"

.field public static final VIEW_PARAMS_HEIGHT:Ljava/lang/String; = "height"

.field public static final VIEW_PARAMS_MONTH:Ljava/lang/String; = "month"

.field public static final VIEW_PARAMS_NUM_DAYS:Ljava/lang/String; = "num_days"

.field public static final VIEW_PARAMS_SELECTED_DAY:Ljava/lang/String; = "selected_day"

.field public static final VIEW_PARAMS_SHOW_WK_NUM:Ljava/lang/String; = "show_wk_num"

.field public static final VIEW_PARAMS_WEEK_START:Ljava/lang/String; = "week_start"

.field public static final VIEW_PARAMS_YEAR:Ljava/lang/String; = "year"

.field protected static mScale:F


# instance fields
.field private final mCalendar:Ljava/util/Calendar;

.field protected mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

.field protected final mDayLabelCalendar:Ljava/util/Calendar;

.field private mDayOfWeekStart:I

.field private mDayOfWeekTypeface:Ljava/lang/String;

.field protected mDayTextColor:I

.field protected mDisabledDayTextColor:I

.field protected mEdgePadding:I

.field protected mFirstJulianDay:I

.field protected mFirstMonth:I

.field private final mFormatter:Ljava/util/Formatter;

.field protected mHasToday:Z

.field protected mHighlightedDayTextColor:I

.field protected mLastMonth:I

.field private mLockAccessibilityDelegate:Z

.field protected mMonth:I

.field protected mMonthDayLabelPaint:Landroid/graphics/Paint;

.field protected mMonthDayTextColor:I

.field protected mMonthNumPaint:Landroid/graphics/Paint;

.field protected mMonthTitleColor:I

.field protected mMonthTitlePaint:Landroid/graphics/Paint;

.field private mMonthTitleTypeface:Ljava/lang/String;

.field protected mNumCells:I

.field protected mNumDays:I

.field protected mNumRows:I

.field protected mOnDayClickListener:Lcom/wdullaer/materialdatetimepicker/date/MonthView$OnDayClickListener;

.field protected mRowHeight:I

.field protected mSelectedCirclePaint:Landroid/graphics/Paint;

.field protected mSelectedDay:I

.field protected mSelectedDayTextColor:I

.field protected mSelectedLeft:I

.field protected mSelectedRight:I

.field private final mStringBuilder:Ljava/lang/StringBuilder;

.field protected mToday:I

.field protected mTodayNumberColor:I

.field private final mTouchHelper:Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;

.field protected mWeekStart:I

.field protected mWidth:I

.field protected mYear:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 100
    const/16 v0, 0x20

    sput v0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->DEFAULT_HEIGHT:I

    .line 101
    const/16 v0, 0xa

    sput v0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->MIN_HEIGHT:I

    .line 112
    const/4 v0, 0x1

    sput v0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->DAY_SEPARATOR_WIDTH:I

    .line 120
    const/4 v0, 0x0

    sput v0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mScale:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 190
    invoke-direct {p0, p1, v0, v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;)V

    .line 191
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attr"    # Landroid/util/AttributeSet;
    .param p3, "controller"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    .prologue
    const/4 v2, 0x1

    const/4 v0, 0x0

    const/4 v4, -0x1

    .line 194
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 125
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mEdgePadding:I

    .line 139
    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mFirstJulianDay:I

    .line 141
    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mFirstMonth:I

    .line 143
    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mLastMonth:I

    .line 151
    sget v3, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->DEFAULT_HEIGHT:I

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mRowHeight:I

    .line 153
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mHasToday:Z

    .line 155
    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mSelectedDay:I

    .line 157
    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mToday:I

    .line 159
    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mWeekStart:I

    .line 161
    const/4 v3, 0x7

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumDays:I

    .line 163
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumDays:I

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumCells:I

    .line 165
    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mSelectedLeft:I

    .line 167
    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mSelectedRight:I

    .line 173
    const/4 v3, 0x6

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumRows:I

    .line 338
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mDayOfWeekStart:I

    .line 195
    iput-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    .line 196
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 198
    .local v1, "res":Landroid/content/res/Resources;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v3

    iput-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mDayLabelCalendar:Ljava/util/Calendar;

    .line 199
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v3

    iput-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mCalendar:Ljava/util/Calendar;

    .line 201
    sget v3, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_day_of_week_label_typeface:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mDayOfWeekTypeface:Ljava/lang/String;

    .line 202
    sget v3, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_sans_serif:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthTitleTypeface:Ljava/lang/String;

    .line 204
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    if-eqz v3, :cond_59

    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v3}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->isThemeDark()Z

    move-result v3

    if-eqz v3, :cond_59

    move v0, v2

    .line 205
    .local v0, "darkTheme":Z
    :cond_59
    if-eqz v0, :cond_f4

    .line 206
    sget v3, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_date_picker_text_normal_dark_theme:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mDayTextColor:I

    .line 207
    sget v3, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_date_picker_month_day_dark_theme:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthDayTextColor:I

    .line 208
    sget v3, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_date_picker_text_disabled_dark_theme:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mDisabledDayTextColor:I

    .line 209
    sget v3, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_date_picker_text_highlighted_dark_theme:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mHighlightedDayTextColor:I

    .line 217
    :goto_7b
    sget v3, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_white:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mSelectedDayTextColor:I

    .line 218
    sget v3, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_accent_color:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mTodayNumberColor:I

    .line 219
    sget v3, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_white:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthTitleColor:I

    .line 221
    new-instance v3, Ljava/lang/StringBuilder;

    const/16 v4, 0x32

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mStringBuilder:Ljava/lang/StringBuilder;

    .line 222
    new-instance v3, Ljava/util/Formatter;

    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mStringBuilder:Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ljava/util/Formatter;-><init>(Ljava/lang/Appendable;Ljava/util/Locale;)V

    iput-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mFormatter:Ljava/util/Formatter;

    .line 224
    sget v3, Lcom/wdullaer/materialdatetimepicker/R$dimen;->mdtp_day_number_size:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    sput v3, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->MINI_DAY_NUMBER_TEXT_SIZE:I

    .line 225
    sget v3, Lcom/wdullaer/materialdatetimepicker/R$dimen;->mdtp_month_label_size:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    sput v3, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->MONTH_LABEL_TEXT_SIZE:I

    .line 226
    sget v3, Lcom/wdullaer/materialdatetimepicker/R$dimen;->mdtp_month_day_label_text_size:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    sput v3, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->MONTH_DAY_LABEL_TEXT_SIZE:I

    .line 227
    sget v3, Lcom/wdullaer/materialdatetimepicker/R$dimen;->mdtp_month_list_item_header_height:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v3

    sput v3, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->MONTH_HEADER_SIZE:I

    .line 228
    sget v3, Lcom/wdullaer/materialdatetimepicker/R$dimen;->mdtp_day_number_select_circle_radius:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    sput v3, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->DAY_SELECTED_CIRCLE_SIZE:I

    .line 231
    sget v3, Lcom/wdullaer/materialdatetimepicker/R$dimen;->mdtp_date_picker_view_animator_height:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v3

    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getMonthHeaderSize()I

    move-result v4

    sub-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x6

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mRowHeight:I

    .line 235
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getMonthViewTouchHelper()Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;

    move-result-object v3

    iput-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mTouchHelper:Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;

    .line 236
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mTouchHelper:Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;

    invoke-static {p0, v3}, Landroid/support/v4/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroid/support/v4/view/AccessibilityDelegateCompat;)V

    .line 237
    invoke-static {p0, v2}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    .line 238
    iput-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mLockAccessibilityDelegate:Z

    .line 241
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->initView()V

    .line 242
    return-void

    .line 212
    :cond_f4
    sget v3, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_date_picker_text_normal:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mDayTextColor:I

    .line 213
    sget v3, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_date_picker_month_day:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthDayTextColor:I

    .line 214
    sget v3, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_date_picker_text_disabled:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mDisabledDayTextColor:I

    .line 215
    sget v3, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_date_picker_text_highlighted:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mHighlightedDayTextColor:I

    goto/16 :goto_7b
.end method

.method static synthetic access$000(Lcom/wdullaer/materialdatetimepicker/date/MonthView;I)V
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/date/MonthView;
    .param p1, "x1"    # I

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->onDayClick(I)V

    return-void
.end method

.method private calculateNumRows()I
    .registers 6

    .prologue
    .line 412
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->findDayOffset()I

    move-result v1

    .line 413
    .local v1, "offset":I
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumCells:I

    add-int/2addr v3, v1

    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumDays:I

    div-int v0, v3, v4

    .line 414
    .local v0, "dividend":I
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumCells:I

    add-int/2addr v3, v1

    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumDays:I

    rem-int v2, v3, v4

    .line 415
    .local v2, "remainder":I
    if-lez v2, :cond_17

    const/4 v3, 0x1

    :goto_15
    add-int/2addr v3, v0

    return v3

    :cond_17
    const/4 v3, 0x0

    goto :goto_15
.end method

.method private getMonthAndYearString()Ljava/lang/String;
    .registers 9

    .prologue
    .line 454
    const/16 v6, 0x34

    .line 456
    .local v6, "flags":I
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mStringBuilder:Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 457
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    .line 458
    .local v2, "millis":J
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mFormatter:Ljava/util/Formatter;

    const/4 v7, 0x0

    move-wide v4, v2

    invoke-static/range {v0 .. v7}, Landroid/text/format/DateUtils;->formatDateRange(Landroid/content/Context;Ljava/util/Formatter;JJILjava/lang/String;)Ljava/util/Formatter;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private isAfterMax(III)Z
    .registers 9
    .param p1, "year"    # I
    .param p2, "month"    # I
    .param p3, "day"    # I

    .prologue
    const/4 v4, 0x2

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 676
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    if-nez v3, :cond_8

    .line 699
    :cond_7
    :goto_7
    return v1

    .line 679
    :cond_8
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v3}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->getMaxDate()Ljava/util/Calendar;

    move-result-object v0

    .line 680
    .local v0, "maxDate":Ljava/util/Calendar;
    if-eqz v0, :cond_7

    .line 684
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-le p1, v3, :cond_18

    move v1, v2

    .line 685
    goto :goto_7

    .line 686
    :cond_18
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-lt p1, v3, :cond_7

    .line 690
    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-le p2, v3, :cond_26

    move v1, v2

    .line 691
    goto :goto_7

    .line 692
    :cond_26
    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-lt p2, v3, :cond_7

    .line 696
    const/4 v3, 0x5

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-le p3, v3, :cond_7

    move v1, v2

    .line 697
    goto :goto_7
.end method

.method private isBeforeMin(III)Z
    .registers 9
    .param p1, "year"    # I
    .param p2, "month"    # I
    .param p3, "day"    # I

    .prologue
    const/4 v4, 0x2

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 648
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    if-nez v3, :cond_8

    .line 671
    :cond_7
    :goto_7
    return v1

    .line 651
    :cond_8
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v3}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->getMinDate()Ljava/util/Calendar;

    move-result-object v0

    .line 652
    .local v0, "minDate":Ljava/util/Calendar;
    if-eqz v0, :cond_7

    .line 656
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-ge p1, v3, :cond_18

    move v1, v2

    .line 657
    goto :goto_7

    .line 658
    :cond_18
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-gt p1, v3, :cond_7

    .line 662
    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-ge p2, v3, :cond_26

    move v1, v2

    .line 663
    goto :goto_7

    .line 664
    :cond_26
    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-gt p2, v3, :cond_7

    .line 668
    const/4 v3, 0x5

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-ge p3, v3, :cond_7

    move v1, v2

    .line 669
    goto :goto_7
.end method

.method private isSelectable(III)Z
    .registers 13
    .param p1, "year"    # I
    .param p2, "month"    # I
    .param p3, "day"    # I

    .prologue
    const/4 v8, 0x5

    const/4 v7, 0x2

    const/4 v5, 0x1

    .line 634
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v6}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->getSelectableDays()[Ljava/util/Calendar;

    move-result-object v4

    .line 635
    .local v4, "selectableDays":[Ljava/util/Calendar;
    move-object v0, v4

    .local v0, "arr$":[Ljava/util/Calendar;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_c
    if-ge v2, v3, :cond_16

    aget-object v1, v0, v2

    .line 636
    .local v1, "c":Ljava/util/Calendar;
    invoke-virtual {v1, v5}, Ljava/util/Calendar;->get(I)I

    move-result v6

    if-ge p1, v6, :cond_18

    .line 644
    .end local v1    # "c":Ljava/util/Calendar;
    :cond_16
    const/4 v5, 0x0

    :cond_17
    return v5

    .line 637
    .restart local v1    # "c":Ljava/util/Calendar;
    :cond_18
    invoke-virtual {v1, v5}, Ljava/util/Calendar;->get(I)I

    move-result v6

    if-le p1, v6, :cond_21

    .line 635
    :cond_1e
    :goto_1e
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 638
    :cond_21
    invoke-virtual {v1, v7}, Ljava/util/Calendar;->get(I)I

    move-result v6

    if-lt p2, v6, :cond_16

    .line 639
    invoke-virtual {v1, v7}, Ljava/util/Calendar;->get(I)I

    move-result v6

    if-gt p2, v6, :cond_1e

    .line 640
    invoke-virtual {v1, v8}, Ljava/util/Calendar;->get(I)I

    move-result v6

    if-lt p3, v6, :cond_16

    .line 641
    invoke-virtual {v1, v8}, Ljava/util/Calendar;->get(I)I

    move-result v6

    if-le p3, v6, :cond_17

    goto :goto_1e
.end method

.method private onDayClick(I)V
    .registers 6
    .param p1, "day"    # I

    .prologue
    .line 600
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mYear:I

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonth:I

    invoke-virtual {p0, v0, v1, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->isOutOfRange(III)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 611
    :goto_a
    return-void

    .line 605
    :cond_b
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mOnDayClickListener:Lcom/wdullaer/materialdatetimepicker/date/MonthView$OnDayClickListener;

    if-eqz v0, :cond_1d

    .line 606
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mOnDayClickListener:Lcom/wdullaer/materialdatetimepicker/date/MonthView$OnDayClickListener;

    new-instance v1, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mYear:I

    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonth:I

    invoke-direct {v1, v2, v3, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;-><init>(III)V

    invoke-interface {v0, p0, v1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$OnDayClickListener;->onDayClick(Lcom/wdullaer/materialdatetimepicker/date/MonthView;Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)V

    .line 610
    :cond_1d
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mTouchHelper:Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->sendEventForVirtualView(II)Z

    goto :goto_a
.end method

.method private sameDay(ILjava/util/Calendar;)Z
    .registers 6
    .param p1, "day"    # I
    .param p2, "today"    # Ljava/util/Calendar;

    .prologue
    const/4 v0, 0x1

    .line 419
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mYear:I

    invoke-virtual {p2, v0}, Ljava/util/Calendar;->get(I)I

    move-result v2

    if-ne v1, v2, :cond_1a

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonth:I

    const/4 v2, 0x2

    invoke-virtual {p2, v2}, Ljava/util/Calendar;->get(I)I

    move-result v2

    if-ne v1, v2, :cond_1a

    const/4 v1, 0x5

    invoke-virtual {p2, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    if-ne p1, v1, :cond_1a

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method


# virtual methods
.method public clearAccessibilityFocus()V
    .registers 2

    .prologue
    .line 741
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mTouchHelper:Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->clearFocusedVirtualView()V

    .line 742
    return-void
.end method

.method public dispatchHoverEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/MotionEvent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 268
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mTouchHelper:Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;

    invoke-virtual {v0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->dispatchHoverEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 269
    const/4 v0, 0x1

    .line 271
    :goto_9
    return v0

    :cond_a
    invoke-super {p0, p1}, Landroid/view/View;->dispatchHoverEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_9
.end method

.method public abstract drawMonthDay(Landroid/graphics/Canvas;IIIIIIIII)V
.end method

.method protected drawMonthDayLabels(Landroid/graphics/Canvas;)V
    .registers 14
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 468
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getMonthHeaderSize()I

    move-result v9

    sget v10, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->MONTH_DAY_LABEL_TEXT_SIZE:I

    div-int/lit8 v10, v10, 0x2

    sub-int v8, v9, v10

    .line 469
    .local v8, "y":I
    iget v9, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mWidth:I

    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mEdgePadding:I

    mul-int/lit8 v10, v10, 0x2

    sub-int/2addr v9, v10

    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumDays:I

    mul-int/lit8 v10, v10, 0x2

    div-int v1, v9, v10

    .line 471
    .local v1, "dayWidthHalf":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_18
    iget v9, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumDays:I

    if-ge v2, v9, :cond_b6

    .line 472
    mul-int/lit8 v9, v2, 0x2

    add-int/lit8 v9, v9, 0x1

    mul-int/2addr v9, v1

    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mEdgePadding:I

    add-int v7, v9, v10

    .line 474
    .local v7, "x":I
    iget v9, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mWeekStart:I

    add-int/2addr v9, v2

    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumDays:I

    rem-int v0, v9, v10

    .line 475
    .local v0, "calendarDay":I
    iget-object v9, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mDayLabelCalendar:Ljava/util/Calendar;

    const/4 v10, 0x7

    invoke-virtual {v9, v10, v0}, Ljava/util/Calendar;->set(II)V

    .line 476
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    .line 477
    .local v5, "locale":Ljava/util/Locale;
    iget-object v9, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mDayLabelCalendar:Ljava/util/Calendar;

    const/4 v10, 0x7

    const/4 v11, 0x1

    invoke-virtual {v9, v10, v11, v5}, Ljava/util/Calendar;->getDisplayName(IILjava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    .line 478
    .local v4, "localWeekDisplayName":Ljava/lang/String;
    invoke-virtual {v4, v5}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    const/4 v11, 0x1

    invoke-virtual {v9, v10, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 480
    .local v6, "weekString":Ljava/lang/String;
    sget-object v9, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    invoke-virtual {v5, v9}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_68

    sget-object v9, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    invoke-virtual {v5, v9}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_68

    sget-object v9, Ljava/util/Locale;->SIMPLIFIED_CHINESE:Ljava/util/Locale;

    invoke-virtual {v5, v9}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_68

    sget-object v9, Ljava/util/Locale;->TRADITIONAL_CHINESE:Ljava/util/Locale;

    invoke-virtual {v5, v9}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_72

    .line 481
    :cond_68
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    .line 482
    .local v3, "len":I
    add-int/lit8 v9, v3, -0x1

    invoke-virtual {v4, v9, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 485
    .end local v3    # "len":I
    :cond_72
    invoke-virtual {v5}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v9

    const-string v10, "he"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_8a

    invoke-virtual {v5}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v9

    const-string v10, "iw"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a0

    .line 486
    :cond_8a
    iget-object v9, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mDayLabelCalendar:Ljava/util/Calendar;

    const/4 v10, 0x7

    invoke-virtual {v9, v10}, Ljava/util/Calendar;->get(I)I

    move-result v9

    const/4 v10, 0x7

    if-eq v9, v10, :cond_ab

    .line 487
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    .line 488
    .restart local v3    # "len":I
    add-int/lit8 v9, v3, -0x2

    add-int/lit8 v10, v3, -0x1

    invoke-virtual {v4, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 496
    .end local v3    # "len":I
    :cond_a0
    :goto_a0
    int-to-float v9, v7

    int-to-float v10, v8

    iget-object v11, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthDayLabelPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v9, v10, v11}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 471
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_18

    .line 493
    :cond_ab
    invoke-virtual {v4, v5}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    const/4 v11, 0x1

    invoke-virtual {v9, v10, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    goto :goto_a0

    .line 498
    .end local v0    # "calendarDay":I
    .end local v4    # "localWeekDisplayName":Ljava/lang/String;
    .end local v5    # "locale":Ljava/util/Locale;
    .end local v6    # "weekString":Ljava/lang/String;
    .end local v7    # "x":I
    :cond_b6
    return-void
.end method

.method protected drawMonthNums(Landroid/graphics/Canvas;)V
    .registers 16
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 507
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mRowHeight:I

    sget v1, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->MINI_DAY_NUMBER_TEXT_SIZE:I

    add-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    sget v1, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->DAY_SEPARATOR_WIDTH:I

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getMonthHeaderSize()I

    move-result v1

    add-int v6, v0, v1

    .line 509
    .local v6, "y":I
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mWidth:I

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mEdgePadding:I

    mul-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    int-to-float v0, v0

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumDays:I

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    mul-float/2addr v1, v2

    div-float v11, v0, v1

    .line 510
    .local v11, "dayWidthHalf":F
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->findDayOffset()I

    move-result v12

    .line 511
    .local v12, "j":I
    const/4 v4, 0x1

    .local v4, "dayNumber":I
    :goto_25
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumCells:I

    if-gt v4, v0, :cond_61

    .line 512
    mul-int/lit8 v0, v12, 0x2

    add-int/lit8 v0, v0, 0x1

    int-to-float v0, v0

    mul-float/2addr v0, v11

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mEdgePadding:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    float-to-int v5, v0

    .line 514
    .local v5, "x":I
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mRowHeight:I

    sget v1, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->MINI_DAY_NUMBER_TEXT_SIZE:I

    add-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    sget v1, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->DAY_SEPARATOR_WIDTH:I

    sub-int v13, v0, v1

    .line 516
    .local v13, "yRelativeToDay":I
    int-to-float v0, v5

    sub-float/2addr v0, v11

    float-to-int v7, v0

    .line 517
    .local v7, "startX":I
    int-to-float v0, v5

    add-float/2addr v0, v11

    float-to-int v8, v0

    .line 518
    .local v8, "stopX":I
    sub-int v9, v6, v13

    .line 519
    .local v9, "startY":I
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mRowHeight:I

    add-int v10, v9, v0

    .line 521
    .local v10, "stopY":I
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mYear:I

    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonth:I

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v10}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->drawMonthDay(Landroid/graphics/Canvas;IIIIIIIII)V

    .line 523
    add-int/lit8 v12, v12, 0x1

    .line 524
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumDays:I

    if-ne v12, v0, :cond_5e

    .line 525
    const/4 v12, 0x0

    .line 526
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mRowHeight:I

    add-int/2addr v6, v0

    .line 511
    :cond_5e
    add-int/lit8 v4, v4, 0x1

    goto :goto_25

    .line 529
    .end local v5    # "x":I
    .end local v7    # "startX":I
    .end local v8    # "stopX":I
    .end local v9    # "startY":I
    .end local v10    # "stopY":I
    .end local v13    # "yRelativeToDay":I
    :cond_61
    return-void
.end method

.method protected drawMonthTitle(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 462
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mWidth:I

    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mEdgePadding:I

    mul-int/lit8 v3, v3, 0x2

    add-int/2addr v2, v3

    div-int/lit8 v0, v2, 0x2

    .line 463
    .local v0, "x":I
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getMonthHeaderSize()I

    move-result v2

    sget v3, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->MONTH_DAY_LABEL_TEXT_SIZE:I

    sub-int/2addr v2, v3

    div-int/lit8 v1, v2, 0x2

    .line 464
    .local v1, "y":I
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getMonthAndYearString()Ljava/lang/String;

    move-result-object v2

    int-to-float v3, v0

    int-to-float v4, v1

    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthTitlePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 465
    return-void
.end method

.method protected findDayOffset()I
    .registers 3

    .prologue
    .line 549
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mDayOfWeekStart:I

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mWeekStart:I

    if-ge v0, v1, :cond_f

    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mDayOfWeekStart:I

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumDays:I

    add-int/2addr v0, v1

    :goto_b
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mWeekStart:I

    sub-int/2addr v0, v1

    return v0

    :cond_f
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mDayOfWeekStart:I

    goto :goto_b
.end method

.method public getAccessibilityFocus()Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;
    .registers 5

    .prologue
    .line 729
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mTouchHelper:Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;

    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->getFocusedVirtualView()I

    move-result v0

    .line 730
    .local v0, "day":I
    if-ltz v0, :cond_12

    .line 731
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mYear:I

    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonth:I

    invoke-direct {v1, v2, v3, v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;-><init>(III)V

    .line 733
    :goto_11
    return-object v1

    :cond_12
    const/4 v1, 0x0

    goto :goto_11
.end method

.method public getDayFromLocation(FF)I
    .registers 5
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 562
    invoke-virtual {p0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getInternalDayFromLocation(FF)I

    move-result v0

    .line 563
    .local v0, "day":I
    const/4 v1, 0x1

    if-lt v0, v1, :cond_b

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumCells:I

    if-le v0, v1, :cond_c

    .line 564
    :cond_b
    const/4 v0, -0x1

    .line 566
    .end local v0    # "day":I
    :cond_c
    return v0
.end method

.method protected getInternalDayFromLocation(FF)I
    .registers 10
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 577
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mEdgePadding:I

    .line 578
    .local v2, "dayStart":I
    int-to-float v4, v2

    cmpg-float v4, p1, v4

    if-ltz v4, :cond_11

    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mWidth:I

    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mEdgePadding:I

    sub-int/2addr v4, v5

    int-to-float v4, v4

    cmpl-float v4, p1, v4

    if-lez v4, :cond_13

    .line 579
    :cond_11
    const/4 v1, -0x1

    .line 587
    :goto_12
    return v1

    .line 582
    :cond_13
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getMonthHeaderSize()I

    move-result v4

    int-to-float v4, v4

    sub-float v4, p2, v4

    float-to-int v4, v4

    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mRowHeight:I

    div-int v3, v4, v5

    .line 583
    .local v3, "row":I
    int-to-float v4, v2

    sub-float v4, p1, v4

    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumDays:I

    int-to-float v5, v5

    mul-float/2addr v4, v5

    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mWidth:I

    sub-int/2addr v5, v2

    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mEdgePadding:I

    sub-int/2addr v5, v6

    int-to-float v5, v5

    div-float/2addr v4, v5

    float-to-int v0, v4

    .line 585
    .local v0, "column":I
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->findDayOffset()I

    move-result v4

    sub-int v4, v0, v4

    add-int/lit8 v1, v4, 0x1

    .line 586
    .local v1, "day":I
    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumDays:I

    mul-int/2addr v4, v3

    add-int/2addr v1, v4

    .line 587
    goto :goto_12
.end method

.method public getMonth()I
    .registers 2

    .prologue
    .line 439
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonth:I

    return v0
.end method

.method protected getMonthHeaderSize()I
    .registers 2

    .prologue
    .line 450
    sget v0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->MONTH_HEADER_SIZE:I

    return v0
.end method

.method protected getMonthViewTouchHelper()Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;
    .registers 2

    .prologue
    .line 249
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;

    invoke-direct {v0, p0, p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;-><init>(Lcom/wdullaer/materialdatetimepicker/date/MonthView;Landroid/view/View;)V

    return-object v0
.end method

.method public getYear()I
    .registers 2

    .prologue
    .line 443
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mYear:I

    return v0
.end method

.method protected initView()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 292
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthTitlePaint:Landroid/graphics/Paint;

    .line 293
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthTitlePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 294
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthTitlePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 295
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthTitlePaint:Landroid/graphics/Paint;

    sget v1, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->MONTH_LABEL_TEXT_SIZE:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 296
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthTitlePaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthTitleTypeface:Ljava/lang/String;

    invoke-static {v1, v3}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 297
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthTitlePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mDayTextColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 298
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthTitlePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 299
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthTitlePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 301
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mSelectedCirclePaint:Landroid/graphics/Paint;

    .line 302
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mSelectedCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 303
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mSelectedCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 304
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mSelectedCirclePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mTodayNumberColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 305
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mSelectedCirclePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 306
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mSelectedCirclePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 307
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mSelectedCirclePaint:Landroid/graphics/Paint;

    const/16 v1, 0xff

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 309
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthDayLabelPaint:Landroid/graphics/Paint;

    .line 310
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthDayLabelPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 311
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthDayLabelPaint:Landroid/graphics/Paint;

    sget v1, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->MONTH_DAY_LABEL_TEXT_SIZE:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 312
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthDayLabelPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthDayTextColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 313
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthDayLabelPaint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "Roboto-Medium"

    invoke-static {v1, v2}, Lcom/wdullaer/materialdatetimepicker/TypefaceHelper;->get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 314
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthDayLabelPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 315
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthDayLabelPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 316
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthDayLabelPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 318
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthNumPaint:Landroid/graphics/Paint;

    .line 319
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthNumPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 320
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthNumPaint:Landroid/graphics/Paint;

    sget v1, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->MINI_DAY_NUMBER_TEXT_SIZE:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 321
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthNumPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 322
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthNumPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 323
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonthNumPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 324
    return-void
.end method

.method protected isHighlighted(III)Z
    .registers 14
    .param p1, "year"    # I
    .param p2, "month"    # I
    .param p3, "day"    # I

    .prologue
    const/4 v9, 0x5

    const/4 v8, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x1

    .line 710
    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v7}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->getHighlightedDays()[Ljava/util/Calendar;

    move-result-object v2

    .line 711
    .local v2, "highlightedDays":[Ljava/util/Calendar;
    if-nez v2, :cond_d

    .line 721
    :cond_c
    :goto_c
    return v5

    .line 712
    :cond_d
    move-object v0, v2

    .local v0, "arr$":[Ljava/util/Calendar;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_10
    if-ge v3, v4, :cond_c

    aget-object v1, v0, v3

    .line 713
    .local v1, "c":Ljava/util/Calendar;
    invoke-virtual {v1, v6}, Ljava/util/Calendar;->get(I)I

    move-result v7

    if-lt p1, v7, :cond_c

    .line 714
    invoke-virtual {v1, v6}, Ljava/util/Calendar;->get(I)I

    move-result v7

    if-le p1, v7, :cond_23

    .line 712
    :cond_20
    add-int/lit8 v3, v3, 0x1

    goto :goto_10

    .line 715
    :cond_23
    invoke-virtual {v1, v8}, Ljava/util/Calendar;->get(I)I

    move-result v7

    if-lt p2, v7, :cond_c

    .line 716
    invoke-virtual {v1, v8}, Ljava/util/Calendar;->get(I)I

    move-result v7

    if-gt p2, v7, :cond_20

    .line 717
    invoke-virtual {v1, v9}, Ljava/util/Calendar;->get(I)I

    move-result v7

    if-lt p3, v7, :cond_c

    .line 718
    invoke-virtual {v1, v9}, Ljava/util/Calendar;->get(I)I

    move-result v7

    if-gt p3, v7, :cond_20

    move v5, v6

    .line 719
    goto :goto_c
.end method

.method protected isOutOfRange(III)Z
    .registers 7
    .param p1, "year"    # I
    .param p2, "month"    # I
    .param p3, "day"    # I

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 619
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v2}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->getSelectableDays()[Ljava/util/Calendar;

    move-result-object v2

    if-eqz v2, :cond_13

    .line 620
    invoke-direct {p0, p1, p2, p3}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->isSelectable(III)Z

    move-result v2

    if-nez v2, :cond_11

    .line 630
    :cond_10
    :goto_10
    return v0

    :cond_11
    move v0, v1

    .line 620
    goto :goto_10

    .line 623
    :cond_13
    invoke-direct {p0, p1, p2, p3}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->isBeforeMin(III)Z

    move-result v2

    if-nez v2, :cond_10

    .line 626
    invoke-direct {p0, p1, p2, p3}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->isAfterMax(III)Z

    move-result v2

    if-nez v2, :cond_10

    move v0, v1

    .line 630
    goto :goto_10
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 2
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 333
    invoke-virtual {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->drawMonthTitle(Landroid/graphics/Canvas;)V

    .line 334
    invoke-virtual {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->drawMonthDayLabels(Landroid/graphics/Canvas;)V

    .line 335
    invoke-virtual {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->drawMonthNums(Landroid/graphics/Canvas;)V

    .line 336
    return-void
.end method

.method protected onMeasure(II)V
    .registers 6
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 426
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mRowHeight:I

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumRows:I

    mul-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getMonthHeaderSize()I

    move-result v2

    add-int/2addr v1, v2

    add-int/lit8 v1, v1, 0x5

    invoke-virtual {p0, v0, v1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->setMeasuredDimension(II)V

    .line 428
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .registers 6
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 432
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mWidth:I

    .line 435
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mTouchHelper:Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->invalidateRoot()V

    .line 436
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5
    .param p1, "event"    # Landroid/view/MotionEvent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 276
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    packed-switch v1, :pswitch_data_1c

    .line 284
    :cond_7
    :goto_7
    const/4 v1, 0x1

    return v1

    .line 278
    :pswitch_9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {p0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getDayFromLocation(FF)I

    move-result v0

    .line 279
    .local v0, "day":I
    if-ltz v0, :cond_7

    .line 280
    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->onDayClick(I)V

    goto :goto_7

    .line 276
    nop

    :pswitch_data_1c
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public restoreAccessibilityFocus(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)Z
    .registers 4
    .param p1, "day"    # Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    .prologue
    .line 752
    iget v0, p1, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->year:I

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mYear:I

    if-ne v0, v1, :cond_12

    iget v0, p1, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->month:I

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonth:I

    if-ne v0, v1, :cond_12

    iget v0, p1, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->day:I

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumCells:I

    if-le v0, v1, :cond_14

    .line 753
    :cond_12
    const/4 v0, 0x0

    .line 756
    :goto_13
    return v0

    .line 755
    :cond_14
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mTouchHelper:Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;

    iget v1, p1, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->day:I

    invoke-virtual {v0, v1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->setFocusedVirtualView(I)V

    .line 756
    const/4 v0, 0x1

    goto :goto_13
.end method

.method public reuse()V
    .registers 2

    .prologue
    .line 407
    const/4 v0, 0x6

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumRows:I

    .line 408
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->requestLayout()V

    .line 409
    return-void
.end method

.method public setAccentColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 327
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mTodayNumberColor:I

    .line 328
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mSelectedCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 329
    return-void
.end method

.method public setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V
    .registers 3
    .param p1, "delegate"    # Landroid/view/View$AccessibilityDelegate;

    .prologue
    .line 256
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mLockAccessibilityDelegate:Z

    if-nez v0, :cond_7

    .line 257
    invoke-super {p0, p1}, Landroid/view/View;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    .line 259
    :cond_7
    return-void
.end method

.method public setDatePickerController(Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;)V
    .registers 2
    .param p1, "controller"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    .prologue
    .line 245
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    .line 246
    return-void
.end method

.method public setMonthParams(Ljava/util/HashMap;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    const/4 v7, 0x5

    const/4 v6, 0x1

    .line 351
    const-string v3, "month"

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1a

    const-string v3, "year"

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1a

    .line 352
    new-instance v3, Ljava/security/InvalidParameterException;

    const-string v4, "You must specify month and year for this view"

    invoke-direct {v3, v4}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 354
    :cond_1a
    invoke-virtual {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->setTag(Ljava/lang/Object;)V

    .line 356
    const-string v3, "height"

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3d

    .line 357
    const-string v3, "height"

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mRowHeight:I

    .line 358
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mRowHeight:I

    sget v4, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->MIN_HEIGHT:I

    if-ge v3, v4, :cond_3d

    .line 359
    sget v3, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->MIN_HEIGHT:I

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mRowHeight:I

    .line 362
    :cond_3d
    const-string v3, "selected_day"

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_53

    .line 363
    const-string v3, "selected_day"

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mSelectedDay:I

    .line 367
    :cond_53
    const-string v3, "month"

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonth:I

    .line 368
    const-string v3, "year"

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mYear:I

    .line 373
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    .line 374
    .local v2, "today":Ljava/util/Calendar;
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mHasToday:Z

    .line 375
    const/4 v3, -0x1

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mToday:I

    .line 377
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mCalendar:Ljava/util/Calendar;

    const/4 v4, 0x2

    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonth:I

    invoke-virtual {v3, v4, v5}, Ljava/util/Calendar;->set(II)V

    .line 378
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mCalendar:Ljava/util/Calendar;

    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mYear:I

    invoke-virtual {v3, v6, v4}, Ljava/util/Calendar;->set(II)V

    .line 379
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v3, v7, v6}, Ljava/util/Calendar;->set(II)V

    .line 380
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mCalendar:Ljava/util/Calendar;

    const/4 v4, 0x7

    invoke-virtual {v3, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mDayOfWeekStart:I

    .line 382
    const-string v3, "week_start"

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c8

    .line 383
    const-string v3, "week_start"

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mWeekStart:I

    .line 388
    :goto_ac
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v3, v7}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v3

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumCells:I

    .line 389
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_b5
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumCells:I

    if-ge v1, v3, :cond_d1

    .line 390
    add-int/lit8 v0, v1, 0x1

    .line 391
    .local v0, "day":I
    invoke-direct {p0, v0, v2}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->sameDay(ILjava/util/Calendar;)Z

    move-result v3

    if-eqz v3, :cond_c5

    .line 392
    iput-boolean v6, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mHasToday:Z

    .line 393
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mToday:I

    .line 389
    :cond_c5
    add-int/lit8 v1, v1, 0x1

    goto :goto_b5

    .line 385
    .end local v0    # "day":I
    .end local v1    # "i":I
    :cond_c8
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v3}, Ljava/util/Calendar;->getFirstDayOfWeek()I

    move-result v3

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mWeekStart:I

    goto :goto_ac

    .line 396
    .restart local v1    # "i":I
    :cond_d1
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->calculateNumRows()I

    move-result v3

    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumRows:I

    .line 399
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mTouchHelper:Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;

    invoke-virtual {v3}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->invalidateRoot()V

    .line 400
    return-void
.end method

.method public setOnDayClickListener(Lcom/wdullaer/materialdatetimepicker/date/MonthView$OnDayClickListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/wdullaer/materialdatetimepicker/date/MonthView$OnDayClickListener;

    .prologue
    .line 262
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mOnDayClickListener:Lcom/wdullaer/materialdatetimepicker/date/MonthView$OnDayClickListener;

    .line 263
    return-void
.end method

.method public setSelectedDay(I)V
    .registers 2
    .param p1, "day"    # I

    .prologue
    .line 403
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mSelectedDay:I

    .line 404
    return-void
.end method
