.class Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;
.super Landroid/widget/FrameLayout;
.source "TimePickerDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/rey/material/widget/TimePicker$OnTimeChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/TimePickerDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TimePickerLayout"
.end annotation


# static fields
.field private static final BASE_TEXT:Ljava/lang/String; = "0"

.field private static final FORMAT:Ljava/lang/String; = "%02d"

.field private static final FORMAT_NO_LEADING_ZERO:Ljava/lang/String; = "%d"

.field private static final TIME_DIVIDER:Ljava/lang/String; = ":"


# instance fields
.field private mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

.field private mBaseHeight:F

.field private mBaseY:F

.field private mCheckBoxSize:I

.field private mDividerX:F

.field private mHeaderBackground:Landroid/graphics/Path;

.field private mHeaderHeight:I

.field private mHeaderRealHeight:I

.field private mHeaderRealWidth:I

.field private mHour:Ljava/lang/String;

.field private mHourWidth:F

.field private mHourX:F

.field private mIsAm:Z

.field private mIsLeadingZero:Z

.field private mLocationDirty:Z

.field private mMidday:Ljava/lang/String;

.field private mMiddayX:F

.field private mMinute:Ljava/lang/String;

.field private mMinuteWidth:F

.field private mMinuteX:F

.field private mOnTimeChangedListener:Lcom/rey/material/app/TimePickerDialog$OnTimeChangedListener;

.field private mPaint:Landroid/graphics/Paint;

.field private mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

.field private mRect:Landroid/graphics/RectF;

.field private mTextTimeColor:I

.field private mTextTimeSize:I

.field private mTimePicker:Lcom/rey/material/widget/TimePicker;

.field final synthetic this$0:Lcom/rey/material/app/TimePickerDialog;


# direct methods
.method public constructor <init>(Lcom/rey/material/app/TimePickerDialog;Landroid/content/Context;)V
    .registers 12
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v8, 0x4

    const/16 v7, 0x11

    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 184
    iput-object p1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    .line 185
    invoke-direct {p0, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 145
    const/high16 v2, -0x1000000

    iput v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTextTimeColor:I

    .line 147
    iput-boolean v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mIsLeadingZero:Z

    .line 149
    iput-boolean v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mIsAm:Z

    .line 168
    iput-boolean v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mLocationDirty:Z

    .line 187
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    .line 188
    iget-object v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 189
    new-instance v2, Landroid/graphics/Path;

    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    iput-object v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderBackground:Landroid/graphics/Path;

    .line 190
    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iput-object v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mRect:Landroid/graphics/RectF;

    .line 192
    new-instance v2, Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-direct {v2, p2}, Lcom/rey/material/widget/CircleCheckedTextView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    .line 193
    new-instance v2, Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-direct {v2, p2}, Lcom/rey/material/widget/CircleCheckedTextView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    .line 194
    new-instance v2, Lcom/rey/material/widget/TimePicker;

    invoke-direct {v2, p2}, Lcom/rey/material/widget/TimePicker;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    .line 196
    iget-object v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    iget v3, p1, Lcom/rey/material/app/TimePickerDialog;->mContentPadding:I

    iget v4, p1, Lcom/rey/material/app/TimePickerDialog;->mContentPadding:I

    iget v5, p1, Lcom/rey/material/app/TimePickerDialog;->mContentPadding:I

    iget v6, p1, Lcom/rey/material/app/TimePickerDialog;->mContentPadding:I

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/rey/material/widget/TimePicker;->setPadding(IIII)V

    .line 197
    iget-object v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v2, p0}, Lcom/rey/material/widget/TimePicker;->setOnTimeChangedListener(Lcom/rey/material/widget/TimePicker$OnTimeChangedListener;)V

    .line 198
    iget-object v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v2, v7}, Lcom/rey/material/widget/CircleCheckedTextView;->setGravity(I)V

    .line 199
    iget-object v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v2, v7}, Lcom/rey/material/widget/CircleCheckedTextView;->setGravity(I)V

    .line 200
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v7, :cond_6f

    .line 201
    iget-object v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v2, v8}, Lcom/rey/material/widget/CircleCheckedTextView;->setTextAlignment(I)V

    .line 202
    iget-object v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v2, v8}, Lcom/rey/material/widget/CircleCheckedTextView;->setTextAlignment(I)V

    .line 204
    :cond_6f
    iget-object v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    iget-boolean v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mIsAm:Z

    invoke-virtual {v2, v3}, Lcom/rey/material/widget/CircleCheckedTextView;->setCheckedImmediately(Z)V

    .line 205
    iget-object v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    iget-boolean v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mIsAm:Z

    if-nez v3, :cond_b8

    :goto_7c
    invoke-virtual {v2, v0}, Lcom/rey/material/widget/CircleCheckedTextView;->setCheckedImmediately(Z)V

    .line 206
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v0, p0}, Lcom/rey/material/widget/CircleCheckedTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 207
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v0, p0}, Lcom/rey/material/widget/CircleCheckedTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 209
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {p0, v0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->addView(Landroid/view/View;)V

    .line 210
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {p0, v0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->addView(Landroid/view/View;)V

    .line 211
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {p0, v0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->addView(Landroid/view/View;)V

    .line 213
    invoke-virtual {p0, v1}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->setWillNotDraw(Z)V

    .line 215
    const/16 v0, 0x30

    invoke-static {p2, v0}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mCheckBoxSize:I

    .line 216
    const/16 v0, 0x78

    invoke-static {p2, v0}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderHeight:I

    .line 217
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/rey/material/R$dimen;->abc_text_size_headline_material:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTextTimeSize:I

    .line 218
    return-void

    :cond_b8
    move v0, v1

    .line 205
    goto :goto_7c
.end method

.method private isTouched(FFFFFF)Z
    .registers 8
    .param p1, "left"    # F
    .param p2, "top"    # F
    .param p3, "right"    # F
    .param p4, "bottom"    # F
    .param p5, "x"    # F
    .param p6, "y"    # F

    .prologue
    .line 574
    cmpl-float v0, p5, p1

    if-ltz v0, :cond_12

    cmpg-float v0, p5, p3

    if-gtz v0, :cond_12

    cmpl-float v0, p6, p2

    if-ltz v0, :cond_12

    cmpg-float v0, p6, p4

    if-gtz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private measureTimeText()V
    .registers 8

    .prologue
    const/high16 v6, 0x40000000    # 2.0f

    const/4 v5, 0x0

    .line 523
    iget-boolean v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mLocationDirty:Z

    if-nez v2, :cond_8

    .line 544
    :goto_7
    return-void

    .line 526
    :cond_8
    iget-object v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTextTimeSize:I

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 528
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 529
    .local v0, "bounds":Landroid/graphics/Rect;
    iget-object v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    const-string v3, "0"

    const-string v4, "0"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2, v3, v5, v4, v0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 530
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    iput v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mBaseHeight:F

    .line 532
    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealHeight:I

    int-to-float v2, v2

    iget v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mBaseHeight:F

    add-float/2addr v2, v3

    div-float/2addr v2, v6

    iput v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mBaseY:F

    .line 534
    iget-object v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    const-string v3, ":"

    const-string v4, ":"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2, v3, v5, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v1

    .line 535
    .local v1, "dividerWidth":F
    iget-object v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget-object v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHour:Ljava/lang/String;

    iget-object v4, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHour:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2, v3, v5, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v2

    iput v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHourWidth:F

    .line 536
    iget-object v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget-object v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMinute:Ljava/lang/String;

    iget-object v4, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMinute:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2, v3, v5, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v2

    iput v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMinuteWidth:F

    .line 538
    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealWidth:I

    int-to-float v2, v2

    sub-float/2addr v2, v1

    div-float/2addr v2, v6

    iput v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mDividerX:F

    .line 539
    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mDividerX:F

    iget v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHourWidth:F

    sub-float/2addr v2, v3

    iput v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHourX:F

    .line 540
    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mDividerX:F

    add-float/2addr v2, v1

    iput v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMinuteX:F

    .line 541
    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMinuteX:F

    iget v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMinuteWidth:F

    add-float/2addr v2, v3

    iput v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMiddayX:F

    .line 543
    iput-boolean v5, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mLocationDirty:Z

    goto :goto_7
.end method

.method private setAm(ZZ)V
    .registers 8
    .param p1, "am"    # Z
    .param p2, "animation"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 314
    iget-object v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v3}, Lcom/rey/material/widget/TimePicker;->is24Hour()Z

    move-result v3

    if-eqz v3, :cond_b

    .line 335
    :cond_a
    :goto_a
    return-void

    .line 317
    :cond_b
    iget-boolean v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mIsAm:Z

    if-eq v3, p1, :cond_a

    .line 318
    invoke-virtual {p0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->getHour()I

    move-result v0

    .line 320
    .local v0, "oldHour":I
    iput-boolean p1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mIsAm:Z

    .line 321
    if-eqz p2, :cond_56

    .line 322
    iget-object v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    iget-boolean v4, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mIsAm:Z

    invoke-virtual {v3, v4}, Lcom/rey/material/widget/CircleCheckedTextView;->setChecked(Z)V

    .line 323
    iget-object v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    iget-boolean v4, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mIsAm:Z

    if-nez v4, :cond_54

    :goto_24
    invoke-virtual {v3, v1}, Lcom/rey/material/widget/CircleCheckedTextView;->setChecked(Z)V

    .line 329
    :goto_27
    iget-boolean v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mIsAm:Z

    if-eqz v1, :cond_69

    iget-object v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v1}, Lcom/rey/material/widget/CircleCheckedTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_35
    iput-object v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMidday:Ljava/lang/String;

    .line 330
    iget v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealWidth:I

    iget v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealHeight:I

    invoke-virtual {p0, v2, v2, v1, v3}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->invalidate(IIII)V

    .line 332
    iget-object v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mOnTimeChangedListener:Lcom/rey/material/app/TimePickerDialog$OnTimeChangedListener;

    if-eqz v1, :cond_a

    .line 333
    iget-object v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mOnTimeChangedListener:Lcom/rey/material/app/TimePickerDialog$OnTimeChangedListener;

    invoke-virtual {p0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->getMinute()I

    move-result v2

    invoke-virtual {p0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->getHour()I

    move-result v3

    invoke-virtual {p0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->getMinute()I

    move-result v4

    invoke-interface {v1, v0, v2, v3, v4}, Lcom/rey/material/app/TimePickerDialog$OnTimeChangedListener;->onTimeChanged(IIII)V

    goto :goto_a

    :cond_54
    move v1, v2

    .line 323
    goto :goto_24

    .line 326
    :cond_56
    iget-object v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    iget-boolean v4, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mIsAm:Z

    invoke-virtual {v3, v4}, Lcom/rey/material/widget/CircleCheckedTextView;->setCheckedImmediately(Z)V

    .line 327
    iget-object v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    iget-boolean v4, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mIsAm:Z

    if-nez v4, :cond_67

    :goto_63
    invoke-virtual {v3, v1}, Lcom/rey/material/widget/CircleCheckedTextView;->setCheckedImmediately(Z)V

    goto :goto_27

    :cond_67
    move v1, v2

    goto :goto_63

    .line 329
    :cond_69
    iget-object v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v1}, Lcom/rey/material/widget/CircleCheckedTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_35
.end method


# virtual methods
.method public applyStyle(I)V
    .registers 16
    .param p1, "resId"    # I

    .prologue
    const/4 v11, 0x2

    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 221
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v9, p1}, Lcom/rey/material/widget/TimePicker;->applyStyle(I)V

    .line 223
    invoke-virtual {p0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->getContext()Landroid/content/Context;

    move-result-object v4

    .line 224
    .local v4, "context":Landroid/content/Context;
    sget-object v9, Lcom/rey/material/R$styleable;->TimePickerDialog:[I

    invoke-virtual {v4, p1, v9}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 226
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v1, 0x0

    .line 227
    .local v1, "am":Ljava/lang/String;
    const/4 v7, 0x0

    .line 229
    .local v7, "pm":Ljava/lang/String;
    const/4 v6, 0x0

    .local v6, "i":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v5

    .local v5, "count":I
    :goto_19
    if-ge v6, v5, :cond_5f

    .line 230
    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v2

    .line 232
    .local v2, "attr":I
    sget v9, Lcom/rey/material/R$styleable;->TimePickerDialog_tp_headerHeight:I

    if-ne v2, v9, :cond_2c

    .line 233
    invoke-virtual {v0, v2, v12}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v9

    iput v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderHeight:I

    .line 229
    :cond_29
    :goto_29
    add-int/lit8 v6, v6, 0x1

    goto :goto_19

    .line 234
    :cond_2c
    sget v9, Lcom/rey/material/R$styleable;->TimePickerDialog_tp_textTimeColor:I

    if-ne v2, v9, :cond_37

    .line 235
    invoke-virtual {v0, v2, v12}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v9

    iput v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTextTimeColor:I

    goto :goto_29

    .line 236
    :cond_37
    sget v9, Lcom/rey/material/R$styleable;->TimePickerDialog_tp_textTimeSize:I

    if-ne v2, v9, :cond_42

    .line 237
    invoke-virtual {v0, v2, v12}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v9

    iput v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTextTimeSize:I

    goto :goto_29

    .line 238
    :cond_42
    sget v9, Lcom/rey/material/R$styleable;->TimePickerDialog_tp_leadingZero:I

    if-ne v2, v9, :cond_4d

    .line 239
    invoke-virtual {v0, v2, v12}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v9

    iput-boolean v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mIsLeadingZero:Z

    goto :goto_29

    .line 240
    :cond_4d
    sget v9, Lcom/rey/material/R$styleable;->TimePickerDialog_tp_am:I

    if-ne v2, v9, :cond_56

    .line 241
    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_29

    .line 242
    :cond_56
    sget v9, Lcom/rey/material/R$styleable;->TimePickerDialog_tp_pm:I

    if-ne v2, v9, :cond_29

    .line 243
    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    goto :goto_29

    .line 246
    .end local v2    # "attr":I
    :cond_5f
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 248
    if-nez v1, :cond_6c

    .line 249
    invoke-static {v12}, Landroid/text/format/DateUtils;->getAMPMString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    .line 251
    :cond_6c
    if-nez v7, :cond_76

    .line 252
    invoke-static {v13}, Landroid/text/format/DateUtils;->getAMPMString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v7

    .line 254
    :cond_76
    new-array v8, v11, [[I

    new-array v9, v13, [I

    const v10, -0x10100a0

    aput v10, v9, v12

    aput-object v9, v8, v12

    new-array v9, v13, [I

    const v10, 0x10100a0

    aput v10, v9, v12

    aput-object v9, v8, v13

    .line 258
    .local v8, "states":[[I
    new-array v3, v11, [I

    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v9}, Lcom/rey/material/widget/TimePicker;->getTextColor()I

    move-result v9

    aput v9, v3, v12

    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v9}, Lcom/rey/material/widget/TimePicker;->getTextHighlightColor()I

    move-result v9

    aput v9, v3, v13

    .line 263
    .local v3, "colors":[I
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    iget-object v10, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v10}, Lcom/rey/material/widget/TimePicker;->getSelectionColor()I

    move-result v10

    invoke-virtual {v9, v10}, Lcom/rey/material/widget/CircleCheckedTextView;->setBackgroundColor(I)V

    .line 264
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    iget-object v10, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v10}, Lcom/rey/material/widget/TimePicker;->getAnimDuration()I

    move-result v10

    invoke-virtual {v9, v10}, Lcom/rey/material/widget/CircleCheckedTextView;->setAnimDuration(I)V

    .line 265
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    iget-object v10, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v10}, Lcom/rey/material/widget/TimePicker;->getInInterpolator()Landroid/view/animation/Interpolator;

    move-result-object v10

    iget-object v11, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v11}, Lcom/rey/material/widget/TimePicker;->getOutInterpolator()Landroid/view/animation/Interpolator;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lcom/rey/material/widget/CircleCheckedTextView;->setInterpolator(Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;)V

    .line 266
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    iget-object v10, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v10}, Lcom/rey/material/widget/TimePicker;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/rey/material/widget/CircleCheckedTextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 267
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    iget-object v10, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v10}, Lcom/rey/material/widget/TimePicker;->getTextSize()I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {v9, v12, v10}, Lcom/rey/material/widget/CircleCheckedTextView;->setTextSize(IF)V

    .line 268
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    new-instance v10, Landroid/content/res/ColorStateList;

    invoke-direct {v10, v8, v3}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {v9, v10}, Lcom/rey/material/widget/CircleCheckedTextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 269
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v9, v1}, Lcom/rey/material/widget/CircleCheckedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 271
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    iget-object v10, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v10}, Lcom/rey/material/widget/TimePicker;->getSelectionColor()I

    move-result v10

    invoke-virtual {v9, v10}, Lcom/rey/material/widget/CircleCheckedTextView;->setBackgroundColor(I)V

    .line 272
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    iget-object v10, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v10}, Lcom/rey/material/widget/TimePicker;->getAnimDuration()I

    move-result v10

    invoke-virtual {v9, v10}, Lcom/rey/material/widget/CircleCheckedTextView;->setAnimDuration(I)V

    .line 273
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    iget-object v10, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v10}, Lcom/rey/material/widget/TimePicker;->getInInterpolator()Landroid/view/animation/Interpolator;

    move-result-object v10

    iget-object v11, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v11}, Lcom/rey/material/widget/TimePicker;->getOutInterpolator()Landroid/view/animation/Interpolator;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lcom/rey/material/widget/CircleCheckedTextView;->setInterpolator(Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;)V

    .line 274
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    iget-object v10, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v10}, Lcom/rey/material/widget/TimePicker;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/rey/material/widget/CircleCheckedTextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 275
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    iget-object v10, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v10}, Lcom/rey/material/widget/TimePicker;->getTextSize()I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {v9, v12, v10}, Lcom/rey/material/widget/CircleCheckedTextView;->setTextSize(IF)V

    .line 276
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    new-instance v10, Landroid/content/res/ColorStateList;

    invoke-direct {v10, v8, v3}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {v9, v10}, Lcom/rey/material/widget/CircleCheckedTextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 277
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v9, v7}, Lcom/rey/material/widget/CircleCheckedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 279
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget-object v10, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v10}, Lcom/rey/material/widget/TimePicker;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 281
    iget-boolean v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mIsLeadingZero:Z

    if-eqz v9, :cond_19f

    const-string v9, "%02d"

    :goto_147
    new-array v11, v13, [Ljava/lang/Object;

    iget-object v10, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v10}, Lcom/rey/material/widget/TimePicker;->is24Hour()Z

    move-result v10

    if-nez v10, :cond_1a2

    iget-object v10, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v10}, Lcom/rey/material/widget/TimePicker;->getHour()I

    move-result v10

    if-nez v10, :cond_1a2

    const/16 v10, 0xc

    :goto_15b
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v11, v12

    invoke-static {v9, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHour:Ljava/lang/String;

    .line 282
    const-string v9, "%02d"

    new-array v10, v13, [Ljava/lang/Object;

    iget-object v11, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v11}, Lcom/rey/material/widget/TimePicker;->getMinute()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v12

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMinute:Ljava/lang/String;

    .line 284
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v9}, Lcom/rey/material/widget/TimePicker;->is24Hour()Z

    move-result v9

    if-nez v9, :cond_195

    .line 285
    iget-boolean v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mIsAm:Z

    if-eqz v9, :cond_1a9

    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v9}, Lcom/rey/material/widget/CircleCheckedTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v9

    invoke-interface {v9}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v9

    :goto_193
    iput-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMidday:Ljava/lang/String;

    .line 287
    :cond_195
    iput-boolean v13, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mLocationDirty:Z

    .line 288
    iget v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealWidth:I

    iget v10, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealHeight:I

    invoke-virtual {p0, v12, v12, v9, v10}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->invalidate(IIII)V

    .line 289
    return-void

    .line 281
    :cond_19f
    const-string v9, "%d"

    goto :goto_147

    :cond_1a2
    iget-object v10, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v10}, Lcom/rey/material/widget/TimePicker;->getHour()I

    move-result v10

    goto :goto_15b

    .line 285
    :cond_1a9
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v9}, Lcom/rey/material/widget/CircleCheckedTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v9

    invoke-interface {v9}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v9

    goto :goto_193
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 548
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 550
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 551
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v1}, Lcom/rey/material/widget/TimePicker;->getSelectionColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 552
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderBackground:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 554
    invoke-direct {p0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->measureTimeText()V

    .line 556
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTextTimeSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 557
    iget-object v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/TimePicker;->getMode()I

    move-result v0

    if-nez v0, :cond_9d

    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/TimePicker;->getTextHighlightColor()I

    move-result v0

    :goto_37
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 558
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHour:Ljava/lang/String;

    iget v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHourX:F

    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mBaseY:F

    iget-object v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 560
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTextTimeColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 561
    const-string v0, ":"

    iget v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mDividerX:F

    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mBaseY:F

    iget-object v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 563
    iget-object v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/TimePicker;->getMode()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_a0

    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/TimePicker;->getTextHighlightColor()I

    move-result v0

    :goto_68
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 564
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMinute:Ljava/lang/String;

    iget v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMinuteX:F

    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mBaseY:F

    iget-object v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 566
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/TimePicker;->is24Hour()Z

    move-result v0

    if-nez v0, :cond_9c

    .line 567
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v1}, Lcom/rey/material/widget/TimePicker;->getTextSize()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 568
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTextTimeColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 569
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMidday:Ljava/lang/String;

    iget v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMiddayX:F

    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mBaseY:F

    iget-object v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 571
    :cond_9c
    return-void

    .line 557
    :cond_9d
    iget v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTextTimeColor:I

    goto :goto_37

    .line 563
    :cond_a0
    iget v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTextTimeColor:I

    goto :goto_68
.end method

.method public getFormattedTime(Ljava/text/DateFormat;)Ljava/lang/String;
    .registers 6
    .param p1, "formatter"    # Ljava/text/DateFormat;

    .prologue
    const/4 v3, 0x0

    .line 338
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 339
    .local v0, "cal":Ljava/util/Calendar;
    const/16 v1, 0xb

    invoke-virtual {p0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->getHour()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 340
    const/16 v1, 0xc

    invoke-virtual {p0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->getMinute()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 341
    const/16 v1, 0xd

    invoke-virtual {v0, v1, v3}, Ljava/util/Calendar;->set(II)V

    .line 342
    const/16 v1, 0xe

    invoke-virtual {v0, v1, v3}, Ljava/util/Calendar;->set(II)V

    .line 344
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getHour()I
    .registers 2

    .prologue
    .line 302
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/TimePicker;->is24Hour()Z

    move-result v0

    if-nez v0, :cond_c

    iget-boolean v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mIsAm:Z

    if-eqz v0, :cond_13

    :cond_c
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/TimePicker;->getHour()I

    move-result v0

    :goto_12
    return v0

    :cond_13
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/TimePicker;->getHour()I

    move-result v0

    add-int/lit8 v0, v0, 0xc

    goto :goto_12
.end method

.method public getMinute()I
    .registers 2

    .prologue
    .line 310
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/TimePicker;->getMinute()I

    move-result v0

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x1

    .line 353
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    if-ne p1, v0, :cond_a

    move v0, v1

    :goto_6
    invoke-direct {p0, v0, v1}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->setAm(ZZ)V

    .line 354
    return-void

    .line 353
    :cond_a
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public onHourChanged(II)V
    .registers 9
    .param p1, "oldValue"    # I
    .param p2, "newValue"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 363
    iget-object v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v1}, Lcom/rey/material/widget/TimePicker;->is24Hour()Z

    move-result v1

    if-nez v1, :cond_e

    iget-boolean v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mIsAm:Z

    if-eqz v1, :cond_4e

    :cond_e
    move v0, p1

    .line 365
    .local v0, "oldHour":I
    :goto_f
    iget-boolean v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mIsLeadingZero:Z

    if-eqz v1, :cond_51

    const-string v1, "%02d"

    :goto_15
    new-array v2, v5, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v3}, Lcom/rey/material/widget/TimePicker;->is24Hour()Z

    move-result v3

    if-nez v3, :cond_23

    if-nez p2, :cond_23

    const/16 p2, 0xc

    .end local p2    # "newValue":I
    :cond_23
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHour:Ljava/lang/String;

    .line 366
    iput-boolean v5, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mLocationDirty:Z

    .line 367
    iget v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealWidth:I

    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealHeight:I

    invoke-virtual {p0, v4, v4, v1, v2}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->invalidate(IIII)V

    .line 369
    iget-object v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mOnTimeChangedListener:Lcom/rey/material/app/TimePickerDialog$OnTimeChangedListener;

    if-eqz v1, :cond_4d

    .line 370
    iget-object v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mOnTimeChangedListener:Lcom/rey/material/app/TimePickerDialog$OnTimeChangedListener;

    invoke-virtual {p0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->getMinute()I

    move-result v2

    invoke-virtual {p0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->getHour()I

    move-result v3

    invoke-virtual {p0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->getMinute()I

    move-result v4

    invoke-interface {v1, v0, v2, v3, v4}, Lcom/rey/material/app/TimePickerDialog$OnTimeChangedListener;->onTimeChanged(IIII)V

    .line 371
    :cond_4d
    return-void

    .line 363
    .end local v0    # "oldHour":I
    .restart local p2    # "newValue":I
    :cond_4e
    add-int/lit8 v0, p1, 0xc

    goto :goto_f

    .line 365
    .restart local v0    # "oldHour":I
    :cond_51
    const-string v1, "%d"

    goto :goto_15
.end method

.method protected onLayout(ZIIII)V
    .registers 20
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 485
    const/4 v2, 0x0

    .line 486
    .local v2, "childLeft":I
    const/4 v4, 0x0

    .line 487
    .local v4, "childTop":I
    sub-int v3, p4, p2

    .line 488
    .local v3, "childRight":I
    sub-int v1, p5, p3

    .line 490
    .local v1, "childBottom":I
    invoke-virtual {p0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v8

    iget v8, v8, Landroid/content/res/Configuration;->orientation:I

    const/4 v9, 0x1

    if-ne v8, v9, :cond_61

    const/4 v5, 0x1

    .line 491
    .local v5, "isPortrait":Z
    :goto_18
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v8}, Lcom/rey/material/widget/TimePicker;->is24Hour()Z

    move-result v8

    if-eqz v8, :cond_63

    const/4 v0, 0x0

    .line 493
    .local v0, "checkboxSize":I
    :goto_21
    if-eqz v5, :cond_66

    .line 494
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    iget v8, v8, Lcom/rey/material/app/TimePickerDialog;->mContentPadding:I

    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    iget v9, v9, Lcom/rey/material/app/TimePickerDialog;->mActionPadding:I

    add-int v6, v8, v9

    .line 495
    .local v6, "paddingHorizontal":I
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    iget v8, v8, Lcom/rey/material/app/TimePickerDialog;->mContentPadding:I

    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    iget v9, v9, Lcom/rey/material/app/TimePickerDialog;->mActionPadding:I

    sub-int v7, v8, v9

    .line 497
    .local v7, "paddingVertical":I
    if-lez v0, :cond_57

    .line 498
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    add-int v9, v2, v6

    sub-int v10, v1, v7

    sub-int/2addr v10, v0

    add-int v11, v2, v6

    add-int/2addr v11, v0

    sub-int v12, v1, v7

    invoke-virtual {v8, v9, v10, v11, v12}, Lcom/rey/material/widget/CircleCheckedTextView;->layout(IIII)V

    .line 499
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    sub-int v9, v3, v6

    sub-int/2addr v9, v0

    sub-int v10, v1, v7

    sub-int/2addr v10, v0

    sub-int v11, v3, v6

    sub-int v12, v1, v7

    invoke-virtual {v8, v9, v10, v11, v12}, Lcom/rey/material/widget/CircleCheckedTextView;->layout(IIII)V

    .line 502
    :cond_57
    iget v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealHeight:I

    add-int/2addr v4, v8

    .line 503
    sub-int/2addr v1, v0

    .line 504
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v8, v2, v4, v3, v1}, Lcom/rey/material/widget/TimePicker;->layout(IIII)V

    .line 520
    :cond_60
    :goto_60
    return-void

    .line 490
    .end local v0    # "checkboxSize":I
    .end local v5    # "isPortrait":Z
    .end local v6    # "paddingHorizontal":I
    .end local v7    # "paddingVertical":I
    :cond_61
    const/4 v5, 0x0

    goto :goto_18

    .line 491
    .restart local v5    # "isPortrait":Z
    :cond_63
    iget v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mCheckBoxSize:I

    goto :goto_21

    .line 507
    .restart local v0    # "checkboxSize":I
    :cond_66
    div-int/lit8 v8, v3, 0x2

    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v9}, Lcom/rey/material/widget/TimePicker;->getMeasuredWidth()I

    move-result v9

    sub-int/2addr v8, v9

    div-int/lit8 v6, v8, 0x2

    .line 508
    .restart local v6    # "paddingHorizontal":I
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v8}, Lcom/rey/material/widget/TimePicker;->getMeasuredHeight()I

    move-result v8

    sub-int v8, v1, v8

    div-int/lit8 v7, v8, 0x2

    .line 509
    .restart local v7    # "paddingVertical":I
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    sub-int v9, v3, v6

    iget-object v10, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v10}, Lcom/rey/material/widget/TimePicker;->getMeasuredWidth()I

    move-result v10

    sub-int/2addr v9, v10

    add-int v10, v4, v7

    sub-int v11, v3, v6

    add-int v12, v4, v7

    iget-object v13, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v13}, Lcom/rey/material/widget/TimePicker;->getMeasuredHeight()I

    move-result v13

    add-int/2addr v12, v13

    invoke-virtual {v8, v9, v10, v11, v12}, Lcom/rey/material/widget/TimePicker;->layout(IIII)V

    .line 511
    if-lez v0, :cond_60

    .line 512
    div-int/lit8 v3, v3, 0x2

    .line 514
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    iget v8, v8, Lcom/rey/material/app/TimePickerDialog;->mContentPadding:I

    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    iget v9, v9, Lcom/rey/material/app/TimePickerDialog;->mActionPadding:I

    add-int v6, v8, v9

    .line 515
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    iget v8, v8, Lcom/rey/material/app/TimePickerDialog;->mContentPadding:I

    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    iget v9, v9, Lcom/rey/material/app/TimePickerDialog;->mActionPadding:I

    sub-int v7, v8, v9

    .line 516
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    add-int v9, v2, v6

    sub-int v10, v1, v7

    sub-int/2addr v10, v0

    add-int v11, v2, v6

    add-int/2addr v11, v0

    sub-int v12, v1, v7

    invoke-virtual {v8, v9, v10, v11, v12}, Lcom/rey/material/widget/CircleCheckedTextView;->layout(IIII)V

    .line 517
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    sub-int v9, v3, v6

    sub-int/2addr v9, v0

    sub-int v10, v1, v7

    sub-int/2addr v10, v0

    sub-int v11, v3, v6

    sub-int v12, v1, v7

    invoke-virtual {v8, v9, v10, v11, v12}, Lcom/rey/material/widget/CircleCheckedTextView;->layout(IIII)V

    goto :goto_60
.end method

.method protected onMeasure(II)V
    .registers 16
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/4 v4, 0x1

    const/high16 v10, -0x80000000

    const/high16 v12, 0x40000000    # 2.0f

    const/16 v11, 0x8

    const/4 v8, 0x0

    .line 385
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v7

    .line 386
    .local v7, "widthSize":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v6

    .line 387
    .local v6, "widthMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    .line 388
    .local v3, "heightSize":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    .line 390
    .local v2, "heightMode":I
    invoke-virtual {p0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v9

    iget v9, v9, Landroid/content/res/Configuration;->orientation:I

    if-ne v9, v4, :cond_67

    .line 392
    .local v4, "isPortrait":Z
    :goto_28
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v9}, Lcom/rey/material/widget/TimePicker;->is24Hour()Z

    move-result v9

    if-eqz v9, :cond_69

    move v0, v8

    .line 394
    .local v0, "checkboxSize":I
    :goto_31
    if-eqz v4, :cond_77

    .line 395
    if-ne v2, v10, :cond_3e

    .line 396
    add-int v9, v0, v7

    iget v10, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderHeight:I

    add-int/2addr v9, v10

    invoke-static {v3, v9}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 398
    :cond_3e
    if-lez v0, :cond_6c

    .line 399
    iget v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mCheckBoxSize:I

    invoke-static {v9, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 400
    .local v5, "spec":I
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v9, v8}, Lcom/rey/material/widget/CircleCheckedTextView;->setVisibility(I)V

    .line 401
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v9, v8}, Lcom/rey/material/widget/CircleCheckedTextView;->setVisibility(I)V

    .line 402
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v8, v5, v5}, Lcom/rey/material/widget/CircleCheckedTextView;->measure(II)V

    .line 403
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v8, v5, v5}, Lcom/rey/material/widget/CircleCheckedTextView;->measure(II)V

    .line 410
    .end local v5    # "spec":I
    :goto_5a
    invoke-static {v7, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 411
    .restart local v5    # "spec":I
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v8, v5, v5}, Lcom/rey/material/widget/TimePicker;->measure(II)V

    .line 413
    invoke-virtual {p0, v7, v3}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->setMeasuredDimension(II)V

    .line 438
    :goto_66
    return-void

    .end local v0    # "checkboxSize":I
    .end local v4    # "isPortrait":Z
    .end local v5    # "spec":I
    :cond_67
    move v4, v8

    .line 390
    goto :goto_28

    .line 392
    .restart local v4    # "isPortrait":Z
    :cond_69
    iget v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mCheckBoxSize:I

    goto :goto_31

    .line 406
    .restart local v0    # "checkboxSize":I
    :cond_6c
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v8, v11}, Lcom/rey/material/widget/CircleCheckedTextView;->setVisibility(I)V

    .line 407
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v8, v11}, Lcom/rey/material/widget/CircleCheckedTextView;->setVisibility(I)V

    goto :goto_5a

    .line 416
    :cond_77
    div-int/lit8 v1, v7, 0x2

    .line 418
    .local v1, "halfWidth":I
    if-ne v2, v10, :cond_8d

    .line 419
    if-lez v0, :cond_b8

    iget v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderHeight:I

    add-int/2addr v9, v0

    iget-object v10, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    iget v10, v10, Lcom/rey/material/app/TimePickerDialog;->mContentPadding:I

    add-int/2addr v9, v10

    :goto_85
    invoke-static {v9, v1}, Ljava/lang/Math;->max(II)I

    move-result v9

    invoke-static {v3, v9}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 421
    :cond_8d
    if-lez v0, :cond_bb

    .line 422
    invoke-static {v0, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 423
    .restart local v5    # "spec":I
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v9, v8}, Lcom/rey/material/widget/CircleCheckedTextView;->setVisibility(I)V

    .line 424
    iget-object v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v9, v8}, Lcom/rey/material/widget/CircleCheckedTextView;->setVisibility(I)V

    .line 425
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v8, v5, v5}, Lcom/rey/material/widget/CircleCheckedTextView;->measure(II)V

    .line 426
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v8, v5, v5}, Lcom/rey/material/widget/CircleCheckedTextView;->measure(II)V

    .line 433
    .end local v5    # "spec":I
    :goto_a7
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v8

    invoke-static {v8, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 434
    .restart local v5    # "spec":I
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v8, v5, v5}, Lcom/rey/material/widget/TimePicker;->measure(II)V

    .line 436
    invoke-virtual {p0, v7, v3}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->setMeasuredDimension(II)V

    goto :goto_66

    .line 419
    .end local v5    # "spec":I
    :cond_b8
    iget v9, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderHeight:I

    goto :goto_85

    .line 429
    :cond_bb
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mAmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v8, v11}, Lcom/rey/material/widget/CircleCheckedTextView;->setVisibility(I)V

    .line 430
    iget-object v8, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mPmView:Lcom/rey/material/widget/CircleCheckedTextView;

    invoke-virtual {v8, v11}, Lcom/rey/material/widget/CircleCheckedTextView;->setVisibility(I)V

    goto :goto_a7
.end method

.method public onMinuteChanged(II)V
    .registers 8
    .param p1, "oldValue"    # I
    .param p2, "newValue"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 375
    const-string v0, "%02d"

    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMinute:Ljava/lang/String;

    .line 376
    iput-boolean v4, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mLocationDirty:Z

    .line 377
    iget v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealWidth:I

    iget v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealHeight:I

    invoke-virtual {p0, v3, v3, v0, v1}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->invalidate(IIII)V

    .line 379
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mOnTimeChangedListener:Lcom/rey/material/app/TimePickerDialog$OnTimeChangedListener;

    if-eqz v0, :cond_2c

    .line 380
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mOnTimeChangedListener:Lcom/rey/material/app/TimePickerDialog$OnTimeChangedListener;

    invoke-virtual {p0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->getHour()I

    move-result v1

    invoke-virtual {p0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->getHour()I

    move-result v2

    invoke-interface {v0, v1, p1, v2, p2}, Lcom/rey/material/app/TimePickerDialog$OnTimeChangedListener;->onTimeChanged(IIII)V

    .line 381
    :cond_2c
    return-void
.end method

.method public onModeChanged(I)V
    .registers 5
    .param p1, "mode"    # I

    .prologue
    const/4 v2, 0x0

    .line 358
    iget v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealWidth:I

    iget v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealHeight:I

    invoke-virtual {p0, v2, v2, v0, v1}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->invalidate(IIII)V

    .line 359
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .registers 15
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    const/4 v0, 0x1

    const/high16 v9, 0x42b40000    # 90.0f

    const/4 v2, 0x0

    const/high16 v8, 0x40000000    # 2.0f

    const/4 v1, 0x0

    .line 442
    invoke-virtual {p0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v3, v3, Landroid/content/res/Configuration;->orientation:I

    if-ne v3, v0, :cond_4a

    move v7, v0

    .line 444
    .local v7, "isPortrait":Z
    :goto_18
    iput-boolean v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mLocationDirty:Z

    .line 445
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/TimePicker;->is24Hour()Z

    move-result v0

    if-eqz v0, :cond_4c

    move v6, v2

    .line 447
    .local v6, "checkboxSize":I
    :goto_23
    if-eqz v7, :cond_c1

    .line 448
    iput p1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealWidth:I

    .line 449
    sub-int v0, p2, v6

    sub-int/2addr v0, p1

    iput v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealHeight:I

    .line 450
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderBackground:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 451
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    # getter for: Lcom/rey/material/app/TimePickerDialog;->mCornerRadius:F
    invoke-static {v0}, Lcom/rey/material/app/TimePickerDialog;->access$000(Lcom/rey/material/app/TimePickerDialog;)F

    move-result v0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_4f

    .line 452
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderBackground:Landroid/graphics/Path;

    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealWidth:I

    int-to-float v3, v2

    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealHeight:I

    int-to-float v4, v2

    sget-object v5, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    move v2, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 481
    .end local p2    # "h":I
    :goto_49
    return-void

    .end local v6    # "checkboxSize":I
    .end local v7    # "isPortrait":Z
    .restart local p2    # "h":I
    :cond_4a
    move v7, v2

    .line 442
    goto :goto_18

    .line 445
    .restart local v7    # "isPortrait":Z
    :cond_4c
    iget v6, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mCheckBoxSize:I

    goto :goto_23

    .line 454
    .restart local v6    # "checkboxSize":I
    :cond_4f
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderBackground:Landroid/graphics/Path;

    iget v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealHeight:I

    int-to-float v3, v3

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 455
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderBackground:Landroid/graphics/Path;

    iget-object v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    # getter for: Lcom/rey/material/app/TimePickerDialog;->mCornerRadius:F
    invoke-static {v3}, Lcom/rey/material/app/TimePickerDialog;->access$000(Lcom/rey/material/app/TimePickerDialog;)F

    move-result v3

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 456
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    # getter for: Lcom/rey/material/app/TimePickerDialog;->mCornerRadius:F
    invoke-static {v3}, Lcom/rey/material/app/TimePickerDialog;->access$000(Lcom/rey/material/app/TimePickerDialog;)F

    move-result v3

    mul-float/2addr v3, v8

    iget-object v4, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    # getter for: Lcom/rey/material/app/TimePickerDialog;->mCornerRadius:F
    invoke-static {v4}, Lcom/rey/material/app/TimePickerDialog;->access$000(Lcom/rey/material/app/TimePickerDialog;)F

    move-result v4

    mul-float/2addr v4, v8

    invoke-virtual {v0, v1, v1, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 457
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderBackground:Landroid/graphics/Path;

    iget-object v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mRect:Landroid/graphics/RectF;

    const/high16 v4, 0x43340000    # 180.0f

    invoke-virtual {v0, v3, v4, v9, v2}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 458
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderBackground:Landroid/graphics/Path;

    iget v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealWidth:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    # getter for: Lcom/rey/material/app/TimePickerDialog;->mCornerRadius:F
    invoke-static {v4}, Lcom/rey/material/app/TimePickerDialog;->access$000(Lcom/rey/material/app/TimePickerDialog;)F

    move-result v4

    sub-float/2addr v3, v4

    invoke-virtual {v0, v3, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 459
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mRect:Landroid/graphics/RectF;

    iget v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealWidth:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    # getter for: Lcom/rey/material/app/TimePickerDialog;->mCornerRadius:F
    invoke-static {v4}, Lcom/rey/material/app/TimePickerDialog;->access$000(Lcom/rey/material/app/TimePickerDialog;)F

    move-result v4

    mul-float/2addr v4, v8

    sub-float/2addr v3, v4

    iget v4, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealWidth:I

    int-to-float v4, v4

    iget-object v5, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    # getter for: Lcom/rey/material/app/TimePickerDialog;->mCornerRadius:F
    invoke-static {v5}, Lcom/rey/material/app/TimePickerDialog;->access$000(Lcom/rey/material/app/TimePickerDialog;)F

    move-result v5

    mul-float/2addr v5, v8

    invoke-virtual {v0, v3, v1, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 460
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderBackground:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mRect:Landroid/graphics/RectF;

    const/high16 v3, 0x43870000    # 270.0f

    invoke-virtual {v0, v1, v3, v9, v2}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 461
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderBackground:Landroid/graphics/Path;

    iget v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealWidth:I

    int-to-float v1, v1

    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealHeight:I

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 462
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderBackground:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    goto :goto_49

    .line 466
    :cond_c1
    div-int/lit8 v0, p1, 0x2

    iput v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealWidth:I

    .line 467
    if-lez v6, :cond_cf

    sub-int v0, p2, v6

    iget-object v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    iget v3, v3, Lcom/rey/material/app/TimePickerDialog;->mContentPadding:I

    sub-int p2, v0, v3

    .end local p2    # "h":I
    :cond_cf
    iput p2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealHeight:I

    .line 468
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderBackground:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 469
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    # getter for: Lcom/rey/material/app/TimePickerDialog;->mCornerRadius:F
    invoke-static {v0}, Lcom/rey/material/app/TimePickerDialog;->access$000(Lcom/rey/material/app/TimePickerDialog;)F

    move-result v0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_f0

    .line 470
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderBackground:Landroid/graphics/Path;

    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealWidth:I

    int-to-float v3, v2

    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealHeight:I

    int-to-float v4, v2

    sget-object v5, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    move v2, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    goto/16 :goto_49

    .line 472
    :cond_f0
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderBackground:Landroid/graphics/Path;

    iget v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealHeight:I

    int-to-float v3, v3

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 473
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderBackground:Landroid/graphics/Path;

    iget-object v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    # getter for: Lcom/rey/material/app/TimePickerDialog;->mCornerRadius:F
    invoke-static {v3}, Lcom/rey/material/app/TimePickerDialog;->access$000(Lcom/rey/material/app/TimePickerDialog;)F

    move-result v3

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 474
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    # getter for: Lcom/rey/material/app/TimePickerDialog;->mCornerRadius:F
    invoke-static {v3}, Lcom/rey/material/app/TimePickerDialog;->access$000(Lcom/rey/material/app/TimePickerDialog;)F

    move-result v3

    mul-float/2addr v3, v8

    iget-object v4, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->this$0:Lcom/rey/material/app/TimePickerDialog;

    # getter for: Lcom/rey/material/app/TimePickerDialog;->mCornerRadius:F
    invoke-static {v4}, Lcom/rey/material/app/TimePickerDialog;->access$000(Lcom/rey/material/app/TimePickerDialog;)F

    move-result v4

    mul-float/2addr v4, v8

    invoke-virtual {v0, v1, v1, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 475
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderBackground:Landroid/graphics/Path;

    iget-object v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mRect:Landroid/graphics/RectF;

    const/high16 v4, 0x43340000    # 180.0f

    invoke-virtual {v0, v3, v4, v9, v2}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 476
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderBackground:Landroid/graphics/Path;

    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealWidth:I

    int-to-float v2, v2

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 477
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderBackground:Landroid/graphics/Path;

    iget v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealWidth:I

    int-to-float v1, v1

    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderRealHeight:I

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 478
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHeaderBackground:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    goto/16 :goto_49
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 12
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 579
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v7

    .line 581
    .local v7, "handled":Z
    if-eqz v7, :cond_9

    .line 601
    .end local v7    # "handled":Z
    :goto_8
    return v7

    .line 584
    .restart local v7    # "handled":Z
    :cond_9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_b0

    :cond_10
    :goto_10
    move v7, v9

    .line 601
    goto :goto_8

    .line 586
    :pswitch_12
    iget v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHourX:F

    iget v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mBaseY:F

    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mBaseHeight:F

    sub-float v2, v0, v2

    iget v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHourX:F

    iget v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHourWidth:F

    add-float/2addr v3, v0

    iget v4, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mBaseY:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->isTouched(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 587
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/TimePicker;->getMode()I

    move-result v0

    if-ne v0, v8, :cond_3b

    move v0, v8

    :goto_39
    move v7, v0

    goto :goto_8

    :cond_3b
    move v0, v9

    goto :goto_39

    .line 589
    :cond_3d
    iget v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMinuteX:F

    iget v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mBaseY:F

    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mBaseHeight:F

    sub-float v2, v0, v2

    iget v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMinuteX:F

    iget v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMinuteWidth:F

    add-float/2addr v3, v0

    iget v4, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mBaseY:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->isTouched(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 590
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/TimePicker;->getMode()I

    move-result v0

    if-nez v0, :cond_65

    :goto_63
    move v7, v8

    goto :goto_8

    :cond_65
    move v8, v9

    goto :goto_63

    .line 593
    :pswitch_67
    iget v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHourX:F

    iget v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mBaseY:F

    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mBaseHeight:F

    sub-float v2, v0, v2

    iget v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHourX:F

    iget v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mHourWidth:F

    add-float/2addr v3, v0

    iget v4, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mBaseY:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->isTouched(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_8a

    .line 594
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v0, v9, v8}, Lcom/rey/material/widget/TimePicker;->setMode(IZ)V

    .line 596
    :cond_8a
    iget v1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMinuteX:F

    iget v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mBaseY:F

    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mBaseHeight:F

    sub-float v2, v0, v2

    iget v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMinuteX:F

    iget v3, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mMinuteWidth:F

    add-float/2addr v3, v0

    iget v4, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mBaseY:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->isTouched(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 597
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v0, v8, v8}, Lcom/rey/material/widget/TimePicker;->setMode(IZ)V

    goto/16 :goto_10

    .line 584
    nop

    :pswitch_data_b0
    .packed-switch 0x0
        :pswitch_12
        :pswitch_67
    .end packed-switch
.end method

.method public setHour(I)V
    .registers 4
    .param p1, "hour"    # I

    .prologue
    const/4 v1, 0x0

    .line 292
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/TimePicker;->is24Hour()Z

    move-result v0

    if-nez v0, :cond_14

    .line 293
    const/16 v0, 0xb

    if-le p1, v0, :cond_1a

    const/16 v0, 0x18

    if-ge p1, v0, :cond_1a

    .line 294
    invoke-direct {p0, v1, v1}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->setAm(ZZ)V

    .line 298
    :cond_14
    :goto_14
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/TimePicker;->setHour(I)V

    .line 299
    return-void

    .line 296
    :cond_1a
    const/4 v0, 0x1

    invoke-direct {p0, v0, v1}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->setAm(ZZ)V

    goto :goto_14
.end method

.method public setMinute(I)V
    .registers 3
    .param p1, "minute"    # I

    .prologue
    .line 306
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mTimePicker:Lcom/rey/material/widget/TimePicker;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/TimePicker;->setMinute(I)V

    .line 307
    return-void
.end method

.method public setOnTimeChangedListener(Lcom/rey/material/app/TimePickerDialog$OnTimeChangedListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/rey/material/app/TimePickerDialog$OnTimeChangedListener;

    .prologue
    .line 348
    iput-object p1, p0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->mOnTimeChangedListener:Lcom/rey/material/app/TimePickerDialog$OnTimeChangedListener;

    .line 349
    return-void
.end method
