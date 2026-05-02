.class public Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;
.super Landroid/widget/ListView;
.source "YearPickerView.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$YearAdapter;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "YearPickerView"


# instance fields
.field private mAccentColor:I

.field private mAdapter:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$YearAdapter;

.field private mChildSize:I

.field private final mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

.field private mSelectedView:Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;

.field private mViewSize:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "controller"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 55
    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    .line 56
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v2, p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->registerOnDateChangedListener(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener;)V

    .line 57
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v0, v2, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 59
    .local v0, "frame":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 61
    .local v1, "res":Landroid/content/res/Resources;
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$dimen;->mdtp_date_picker_view_animator_height:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v2

    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mViewSize:I

    .line 62
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$dimen;->mdtp_year_label_height:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v2

    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mChildSize:I

    .line 63
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->setVerticalFadingEdgeEnabled(Z)V

    .line 64
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mChildSize:I

    div-int/lit8 v2, v2, 0x3

    invoke-virtual {p0, v2}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->setFadingEdgeLength(I)V

    .line 65
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->init(Landroid/content/Context;)V

    .line 66
    invoke-virtual {p0, p0}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 67
    new-instance v2, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    invoke-virtual {p0, v2}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 68
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->setDividerHeight(I)V

    .line 69
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->onDateChanged()V

    .line 70
    return-void
.end method

.method static synthetic access$000(Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;)I
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    .prologue
    .line 40
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mAccentColor:I

    return v0
.end method

.method static synthetic access$100(Landroid/widget/TextView;)I
    .registers 2
    .param p0, "x0"    # Landroid/widget/TextView;

    .prologue
    .line 40
    invoke-static {p0}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->getYearFromTextView(Landroid/widget/TextView;)I

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;)Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    return-object v0
.end method

.method static synthetic access$302(Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;)Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;
    .param p1, "x1"    # Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mSelectedView:Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;

    return-object p1
.end method

.method private static getYearFromTextView(Landroid/widget/TextView;)I
    .registers 2
    .param p0, "view"    # Landroid/widget/TextView;

    .prologue
    .line 105
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method private init(Landroid/content/Context;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 73
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 74
    .local v1, "years":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v2}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->getMinYear()I

    move-result v0

    .local v0, "year":I
    :goto_b
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v2}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->getMaxYear()I

    move-result v2

    if-gt v0, v2, :cond_29

    .line 75
    const-string v2, "%d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 77
    :cond_29
    new-instance v2, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$YearAdapter;

    sget v3, Lcom/wdullaer/materialdatetimepicker/R$layout;->mdtp_year_label_text_view:I

    invoke-direct {v2, p0, p1, v3, v1}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$YearAdapter;-><init>(Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;Landroid/content/Context;ILjava/util/List;)V

    iput-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mAdapter:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$YearAdapter;

    .line 78
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mAdapter:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$YearAdapter;

    invoke-virtual {p0, v2}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 79
    return-void
.end method


# virtual methods
.method public getFirstPositionOffset()I
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 146
    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 147
    .local v0, "firstChild":Landroid/view/View;
    if-nez v0, :cond_8

    .line 150
    :goto_7
    return v1

    :cond_8
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v1

    goto :goto_7
.end method

.method public onDateChanged()V
    .registers 3

    .prologue
    .line 155
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mAdapter:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$YearAdapter;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$YearAdapter;->notifyDataSetChanged()V

    .line 156
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->getSelectedDay()Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    move-result-object v0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->year:I

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->getMinYear()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->postSetSelectionCentered(I)V

    .line 157
    return-void
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 5
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    const/4 v2, 0x0

    .line 161
    invoke-super {p0, p1}, Landroid/widget/ListView;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 162
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v0

    const/16 v1, 0x1000

    if-ne v0, v1, :cond_12

    .line 163
    invoke-virtual {p1, v2}, Landroid/view/accessibility/AccessibilityEvent;->setFromIndex(I)V

    .line 164
    invoke-virtual {p1, v2}, Landroid/view/accessibility/AccessibilityEvent;->setToIndex(I)V

    .line 166
    :cond_12
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 9
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 87
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->tryVibrate()V

    move-object v0, p2

    .line 88
    check-cast v0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;

    .line 89
    .local v0, "clickedView":Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;
    if-eqz v0, :cond_34

    .line 90
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mSelectedView:Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;

    if-eq v0, v1, :cond_26

    .line 91
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mSelectedView:Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;

    if-eqz v1, :cond_1d

    .line 92
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mSelectedView:Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->drawIndicator(Z)V

    .line 93
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mSelectedView:Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;

    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->requestLayout()V

    .line 95
    :cond_1d
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->drawIndicator(Z)V

    .line 96
    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->requestLayout()V

    .line 97
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mSelectedView:Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;

    .line 99
    :cond_26
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-static {v0}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->getYearFromTextView(Landroid/widget/TextView;)I

    move-result v2

    invoke-interface {v1, v2}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->onYearSelected(I)V

    .line 100
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mAdapter:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$YearAdapter;

    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$YearAdapter;->notifyDataSetChanged()V

    .line 102
    :cond_34
    return-void
.end method

.method public postSetSelectionCentered(I)V
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 131
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mViewSize:I

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mChildSize:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    invoke-virtual {p0, p1, v0}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->postSetSelectionFromTop(II)V

    .line 132
    return-void
.end method

.method public postSetSelectionFromTop(II)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "offset"    # I

    .prologue
    .line 135
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$1;-><init>(Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;II)V

    invoke-virtual {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->post(Ljava/lang/Runnable;)Z

    .line 143
    return-void
.end method

.method public setAccentColor(I)V
    .registers 2
    .param p1, "accentColor"    # I

    .prologue
    .line 82
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->mAccentColor:I

    .line 83
    return-void
.end method
