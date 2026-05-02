.class public Lcom/lb/material_preferences_library/custom_preferences/CheckBoxPreference;
.super Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;
.source "CheckBoxPreference.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 69
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/lb/material_preferences_library/custom_preferences/CheckBoxPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 70
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 64
    sget v0, Lcom/lb/material_preferences_library/R$attr;->checkBoxPreferenceStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/lb/material_preferences_library/custom_preferences/CheckBoxPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 65
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 42
    invoke-direct {p0, p1, p2, p3}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 43
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 47
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 48
    return-void
.end method


# virtual methods
.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 53
    invoke-super {p0, p1, p2, p3, p4}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 54
    sget v1, Lcom/lb/material_preferences_library/R$layout;->mpl__preference_widget_checkbox:I

    invoke-virtual {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/CheckBoxPreference;->setWidgetLayoutResource(I)V

    .line 55
    sget-object v1, Lcom/lb/material_preferences_library/R$styleable;->CheckBoxPreference:[I

    invoke-virtual {p1, p2, v1, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 56
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Lcom/lb/material_preferences_library/R$styleable;->CheckBoxPreference_summaryOn:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/CheckBoxPreference;->setSummaryOn(Ljava/lang/CharSequence;)V

    .line 57
    sget v1, Lcom/lb/material_preferences_library/R$styleable;->CheckBoxPreference_summaryOff:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/CheckBoxPreference;->setSummaryOff(Ljava/lang/CharSequence;)V

    .line 58
    sget v1, Lcom/lb/material_preferences_library/R$styleable;->CheckBoxPreference_disableDependentsState:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/CheckBoxPreference;->setDisableDependentsState(Z)V

    .line 59
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 60
    return-void
.end method

.method protected onBindView(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 75
    invoke-super {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->onBindView(Landroid/view/View;)V

    .line 76
    const v1, 0x1020001

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 77
    .local v0, "checkboxView":Landroid/view/View;
    if-eqz v0, :cond_17

    instance-of v1, v0, Landroid/widget/Checkable;

    if-eqz v1, :cond_17

    .line 78
    check-cast v0, Landroid/widget/Checkable;

    .end local v0    # "checkboxView":Landroid/view/View;
    iget-boolean v1, p0, Lcom/lb/material_preferences_library/custom_preferences/CheckBoxPreference;->mChecked:Z

    invoke-interface {v0, v1}, Landroid/widget/Checkable;->setChecked(Z)V

    .line 79
    :cond_17
    invoke-virtual {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/CheckBoxPreference;->syncSummaryView(Landroid/view/View;)V

    .line 80
    return-void
.end method
