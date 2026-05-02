.class public Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;
.super Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;
.source "SwitchPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference$1;,
        Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference$Listener;
    }
.end annotation


# instance fields
.field private final mListener:Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference$Listener;

.field private mSwitchOff:Ljava/lang/CharSequence;

.field private mSwitchOn:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 101
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 102
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 89
    sget v0, Lcom/lb/material_preferences_library/R$attr;->switchPreferenceStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 90
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 78
    invoke-direct {p0, p1, p2, p3}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 26
    new-instance v0, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference$Listener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference$Listener;-><init>(Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference$1;)V

    iput-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->mListener:Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference$Listener;

    .line 79
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 64
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 26
    new-instance v0, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference$Listener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference$Listener;-><init>(Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference$1;)V

    iput-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->mListener:Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference$Listener;

    .line 65
    return-void
.end method

.method static synthetic access$100(Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;Ljava/lang/Object;)Z
    .registers 3
    .param p0, "x0"    # Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 24
    invoke-virtual {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public getSwitchTextOff()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 209
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->mSwitchOff:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getSwitchTextOn()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 201
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->mSwitchOn:Ljava/lang/CharSequence;

    return-object v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 107
    invoke-super {p0, p1, p2, p3, p4}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 108
    sget v1, Lcom/lb/material_preferences_library/R$layout;->mpl__switch_preference:I

    invoke-virtual {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->setWidgetLayoutResource(I)V

    .line 110
    sget-object v1, Lcom/lb/material_preferences_library/R$styleable;->SwitchPreference:[I

    invoke-virtual {p1, p2, v1, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 112
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Lcom/lb/material_preferences_library/R$styleable;->SwitchPreference_summaryOn:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->setSummaryOn(Ljava/lang/CharSequence;)V

    .line 113
    sget v1, Lcom/lb/material_preferences_library/R$styleable;->SwitchPreference_summaryOff:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->setSummaryOff(Ljava/lang/CharSequence;)V

    .line 114
    sget v1, Lcom/lb/material_preferences_library/R$styleable;->SwitchPreference_switchTextOn:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->setSwitchTextOn(Ljava/lang/CharSequence;)V

    .line 116
    sget v1, Lcom/lb/material_preferences_library/R$styleable;->SwitchPreference_switchTextOff:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->setSwitchTextOff(Ljava/lang/CharSequence;)V

    .line 118
    sget v1, Lcom/lb/material_preferences_library/R$styleable;->SwitchPreference_disableDependentsState:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->setDisableDependentsState(Z)V

    .line 120
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 121
    return-void
.end method

.method protected onBindView(Landroid/view/View;)V
    .registers 6
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 126
    invoke-super {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->onBindView(Landroid/view/View;)V

    .line 127
    const v2, 0x1020001

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 128
    .local v0, "checkableView":Landroid/view/View;
    if-eqz v0, :cond_39

    instance-of v2, v0, Landroid/widget/Checkable;

    if-eqz v2, :cond_39

    .line 130
    instance-of v2, v0, Landroid/support/v7/widget/SwitchCompat;

    if-eqz v2, :cond_1b

    move-object v1, v0

    .line 132
    check-cast v1, Landroid/support/v7/widget/SwitchCompat;

    .line 133
    .local v1, "switchView":Landroid/support/v7/widget/SwitchCompat;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/SwitchCompat;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .end local v1    # "switchView":Landroid/support/v7/widget/SwitchCompat;
    :cond_1b
    move-object v2, v0

    .line 136
    check-cast v2, Landroid/widget/Checkable;

    iget-boolean v3, p0, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->mChecked:Z

    invoke-interface {v2, v3}, Landroid/widget/Checkable;->setChecked(Z)V

    .line 138
    instance-of v2, v0, Landroid/support/v7/widget/SwitchCompat;

    if-eqz v2, :cond_39

    move-object v1, v0

    .line 140
    check-cast v1, Landroid/support/v7/widget/SwitchCompat;

    .line 141
    .restart local v1    # "switchView":Landroid/support/v7/widget/SwitchCompat;
    iget-object v2, p0, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->mSwitchOn:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/SwitchCompat;->setTextOn(Ljava/lang/CharSequence;)V

    .line 142
    iget-object v2, p0, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->mSwitchOff:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/SwitchCompat;->setTextOff(Ljava/lang/CharSequence;)V

    .line 143
    iget-object v2, p0, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->mListener:Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference$Listener;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/SwitchCompat;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 147
    .end local v1    # "switchView":Landroid/support/v7/widget/SwitchCompat;
    :cond_39
    invoke-virtual {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->syncSummaryView(Landroid/view/View;)V

    .line 148
    return-void
.end method

.method public setSwitchTextOff(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 193
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->setSwitchTextOff(Ljava/lang/CharSequence;)V

    .line 194
    return-void
.end method

.method public setSwitchTextOff(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "offText"    # Ljava/lang/CharSequence;

    .prologue
    .line 170
    iput-object p1, p0, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->mSwitchOff:Ljava/lang/CharSequence;

    .line 171
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->notifyChanged()V

    .line 172
    return-void
.end method

.method public setSwitchTextOn(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 182
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->setSwitchTextOn(Ljava/lang/CharSequence;)V

    .line 183
    return-void
.end method

.method public setSwitchTextOn(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "onText"    # Ljava/lang/CharSequence;

    .prologue
    .line 158
    iput-object p1, p0, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->mSwitchOn:Ljava/lang/CharSequence;

    .line 159
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->notifyChanged()V

    .line 160
    return-void
.end method
