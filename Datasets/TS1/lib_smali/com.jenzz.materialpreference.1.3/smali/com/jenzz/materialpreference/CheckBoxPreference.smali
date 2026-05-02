.class public Lcom/jenzz/materialpreference/CheckBoxPreference;
.super Lcom/jenzz/materialpreference/TwoStatePreference;
.source "CheckBoxPreference.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 14
    invoke-direct {p0, p1}, Lcom/jenzz/materialpreference/TwoStatePreference;-><init>(Landroid/content/Context;)V

    .line 15
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v1, v1}, Lcom/jenzz/materialpreference/CheckBoxPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v0, 0x0

    .line 19
    invoke-direct {p0, p1, p2}, Lcom/jenzz/materialpreference/TwoStatePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/jenzz/materialpreference/CheckBoxPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 24
    invoke-direct {p0, p1, p2, p3}, Lcom/jenzz/materialpreference/TwoStatePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 25
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/jenzz/materialpreference/CheckBoxPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 30
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/jenzz/materialpreference/TwoStatePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 31
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/jenzz/materialpreference/CheckBoxPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 32
    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/4 v2, 0x0

    .line 35
    const/4 v1, 0x3

    new-array v1, v1, [I

    fill-array-data v1, :array_2c

    invoke-virtual {p1, p2, v1, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 39
    .local v0, "typedArray":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/jenzz/materialpreference/CheckBoxPreference;->setSummaryOn(Ljava/lang/CharSequence;)V

    .line 40
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/jenzz/materialpreference/CheckBoxPreference;->setSummaryOff(Ljava/lang/CharSequence;)V

    .line 41
    const/4 v1, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Lcom/jenzz/materialpreference/CheckBoxPreference;->setDisableDependentsState(Z)V

    .line 43
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 45
    sget v1, Lcom/jenzz/materialpreference/R$layout;->mp_checkbox_preference:I

    invoke-virtual {p0, v1}, Lcom/jenzz/materialpreference/CheckBoxPreference;->setWidgetLayoutResource(I)V

    .line 46
    return-void

    .line 35
    nop

    :array_2c
    .array-data 4
        0x10101ef
        0x10101f0
        0x10101f1
    .end array-data
.end method


# virtual methods
.method protected onBindView(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 50
    invoke-super {p0, p1}, Lcom/jenzz/materialpreference/TwoStatePreference;->onBindView(Landroid/view/View;)V

    .line 52
    sget v1, Lcom/jenzz/materialpreference/R$id;->checkbox:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 53
    .local v0, "checkboxView":Landroid/widget/CheckBox;
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/CheckBoxPreference;->isChecked()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 55
    invoke-static {}, Lcom/jenzz/materialpreference/ThemeUtils;->isAtLeastL()Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 57
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 60
    :cond_1c
    invoke-virtual {p0, p1}, Lcom/jenzz/materialpreference/CheckBoxPreference;->syncSummaryView(Landroid/view/View;)V

    .line 61
    return-void
.end method
