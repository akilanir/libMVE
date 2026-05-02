.class public Lcom/jenzz/materialpreference/SwitchPreference;
.super Lcom/jenzz/materialpreference/TwoStatePreference;
.source "SwitchPreference.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 12
    invoke-direct {p0, p1}, Lcom/jenzz/materialpreference/TwoStatePreference;-><init>(Landroid/content/Context;)V

    .line 13
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v1, v1}, Lcom/jenzz/materialpreference/SwitchPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v0, 0x0

    .line 17
    invoke-direct {p0, p1, p2}, Lcom/jenzz/materialpreference/TwoStatePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/jenzz/materialpreference/SwitchPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 22
    invoke-direct {p0, p1, p2, p3}, Lcom/jenzz/materialpreference/TwoStatePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/jenzz/materialpreference/SwitchPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 27
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/jenzz/materialpreference/TwoStatePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 28
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/jenzz/materialpreference/SwitchPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 29
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

    .line 32
    const/4 v1, 0x3

    new-array v1, v1, [I

    fill-array-data v1, :array_2c

    invoke-virtual {p1, p2, v1, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 36
    .local v0, "typedArray":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/jenzz/materialpreference/SwitchPreference;->setSummaryOn(Ljava/lang/CharSequence;)V

    .line 37
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/jenzz/materialpreference/SwitchPreference;->setSummaryOff(Ljava/lang/CharSequence;)V

    .line 38
    const/4 v1, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Lcom/jenzz/materialpreference/SwitchPreference;->setDisableDependentsState(Z)V

    .line 40
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 42
    sget v1, Lcom/jenzz/materialpreference/R$layout;->mp_switch_preference:I

    invoke-virtual {p0, v1}, Lcom/jenzz/materialpreference/SwitchPreference;->setWidgetLayoutResource(I)V

    .line 43
    return-void

    .line 32
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
    .line 47
    invoke-super {p0, p1}, Lcom/jenzz/materialpreference/TwoStatePreference;->onBindView(Landroid/view/View;)V

    .line 49
    sget v1, Lcom/jenzz/materialpreference/R$id;->switch_compat:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/SwitchCompat;

    .line 50
    .local v0, "switchCompat":Landroid/support/v7/widget/SwitchCompat;
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/SwitchPreference;->isChecked()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/SwitchCompat;->setChecked(Z)V

    .line 52
    invoke-virtual {p0, p1}, Lcom/jenzz/materialpreference/SwitchPreference;->syncSummaryView(Landroid/view/View;)V

    .line 53
    return-void
.end method
