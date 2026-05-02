.class public abstract Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;
.super Lcom/lb/material_preferences_library/custom_preferences/Preference;
.source "TwoStatePreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference$SavedState;
    }
.end annotation


# instance fields
.field mChecked:Z

.field private mCheckedSet:Z

.field private mDisableDependentsState:Z

.field private mSummaryOff:Ljava/lang/CharSequence;

.field private mSummaryOn:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 43
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 44
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 38
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 33
    invoke-direct {p0, p1, p2, p3}, Lcom/lb/material_preferences_library/custom_preferences/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 28
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lb/material_preferences_library/custom_preferences/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 29
    return-void
.end method


# virtual methods
.method public getDisableDependentsState()Z
    .registers 2

    .prologue
    .line 172
    iget-boolean v0, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mDisableDependentsState:Z

    return v0
.end method

.method public getSummaryOff()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 160
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mSummaryOff:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getSummaryOn()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mSummaryOn:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public isChecked()Z
    .registers 2

    .prologue
    .line 87
    iget-boolean v0, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mChecked:Z

    return v0
.end method

.method protected onClick()V
    .registers 3

    .prologue
    .line 49
    invoke-super {p0}, Lcom/lb/material_preferences_library/custom_preferences/Preference;->onClick()V

    .line 51
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->isChecked()Z

    move-result v1

    if-nez v1, :cond_18

    const/4 v0, 0x1

    .line 52
    .local v0, "newValue":Z
    :goto_a
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 54
    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->setChecked(Z)V

    .line 56
    :cond_17
    return-void

    .line 51
    .end local v0    # "newValue":Z
    :cond_18
    const/4 v0, 0x0

    goto :goto_a
.end method

.method protected onGetDefaultValue(Landroid/content/res/TypedArray;I)Ljava/lang/Object;
    .registers 4
    .param p1, "a"    # Landroid/content/res/TypedArray;
    .param p2, "index"    # I

    .prologue
    .line 189
    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 263
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference$SavedState;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 266
    :cond_e
    invoke-super {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/Preference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 273
    :goto_11
    return-void

    :cond_12
    move-object v0, p1

    .line 270
    check-cast v0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference$SavedState;

    .line 271
    .local v0, "myState":Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference$SavedState;
    invoke-virtual {v0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/Preference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 272
    iget-boolean v1, v0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference$SavedState;->checked:Z

    invoke-virtual {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->setChecked(Z)V

    goto :goto_11
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 248
    invoke-super {p0}, Lcom/lb/material_preferences_library/custom_preferences/Preference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 249
    .local v1, "superState":Landroid/os/Parcelable;
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->isPersistent()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 257
    .end local v1    # "superState":Landroid/os/Parcelable;
    :goto_a
    return-object v1

    .line 255
    .restart local v1    # "superState":Landroid/os/Parcelable;
    :cond_b
    new-instance v0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference$SavedState;

    invoke-direct {v0, v1}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 256
    .local v0, "myState":Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference$SavedState;
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->isChecked()Z

    move-result v2

    iput-boolean v2, v0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference$SavedState;->checked:Z

    move-object v1, v0

    .line 257
    goto :goto_a
.end method

.method protected onSetInitialValue(ZLjava/lang/Object;)V
    .registers 4
    .param p1, "restoreValue"    # Z
    .param p2, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 195
    if-eqz p1, :cond_c

    iget-boolean v0, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mChecked:Z

    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->getPersistedBoolean(Z)Z

    move-result v0

    .end local p2    # "defaultValue":Ljava/lang/Object;
    :goto_8
    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->setChecked(Z)V

    .line 197
    return-void

    .line 195
    .restart local p2    # "defaultValue":Ljava/lang/Object;
    :cond_c
    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "defaultValue":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_8
.end method

.method public setChecked(Z)V
    .registers 5
    .param p1, "checked"    # Z

    .prologue
    const/4 v1, 0x1

    .line 66
    iget-boolean v2, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mChecked:Z

    if-eq v2, p1, :cond_20

    move v0, v1

    .line 67
    .local v0, "changed":Z
    :goto_6
    if-nez v0, :cond_c

    iget-boolean v2, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mCheckedSet:Z

    if-nez v2, :cond_1f

    .line 69
    :cond_c
    iput-boolean p1, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mChecked:Z

    .line 70
    iput-boolean v1, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mCheckedSet:Z

    .line 71
    invoke-virtual {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->persistBoolean(Z)Z

    .line 72
    if-eqz v0, :cond_1f

    .line 74
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->shouldDisableDependents()Z

    move-result v1

    invoke-virtual {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->notifyDependencyChange(Z)V

    .line 75
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->notifyChanged()V

    .line 78
    :cond_1f
    return-void

    .line 66
    .end local v0    # "changed":Z
    :cond_20
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public setDisableDependentsState(Z)V
    .registers 2
    .param p1, "disableDependentsState"    # Z

    .prologue
    .line 183
    iput-boolean p1, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mDisableDependentsState:Z

    .line 184
    return-void
.end method

.method public setSummaryOff(I)V
    .registers 3
    .param p1, "summaryResId"    # I

    .prologue
    .line 150
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->setSummaryOff(Ljava/lang/CharSequence;)V

    .line 151
    return-void
.end method

.method public setSummaryOff(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "summary"    # Ljava/lang/CharSequence;

    .prologue
    .line 137
    iput-object p1, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mSummaryOff:Ljava/lang/CharSequence;

    .line 138
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->isChecked()Z

    move-result v0

    if-nez v0, :cond_b

    .line 140
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->notifyChanged()V

    .line 142
    :cond_b
    return-void
.end method

.method public setSummaryOn(I)V
    .registers 3
    .param p1, "summaryResId"    # I

    .prologue
    .line 117
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->setSummaryOn(Ljava/lang/CharSequence;)V

    .line 118
    return-void
.end method

.method public setSummaryOn(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "summary"    # Ljava/lang/CharSequence;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mSummaryOn:Ljava/lang/CharSequence;

    .line 105
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 107
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->notifyChanged()V

    .line 109
    :cond_b
    return-void
.end method

.method public shouldDisableDependents()Z
    .registers 5

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 93
    iget-boolean v3, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mDisableDependentsState:Z

    if-eqz v3, :cond_12

    iget-boolean v0, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mChecked:Z

    .line 94
    .local v0, "shouldDisable":Z
    :goto_8
    if-nez v0, :cond_10

    invoke-super {p0}, Lcom/lb/material_preferences_library/custom_preferences/Preference;->shouldDisableDependents()Z

    move-result v3

    if-eqz v3, :cond_11

    :cond_10
    move v1, v2

    :cond_11
    return v1

    .line 93
    .end local v0    # "shouldDisable":Z
    :cond_12
    iget-boolean v3, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mChecked:Z

    if-nez v3, :cond_18

    move v0, v2

    goto :goto_8

    :cond_18
    move v0, v1

    goto :goto_8
.end method

.method syncSummaryView(Landroid/view/View;)V
    .registers 7
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 207
    const v4, 0x1020010

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 208
    .local v2, "summaryView":Landroid/widget/TextView;
    if-eqz v2, :cond_3c

    .line 210
    const/4 v3, 0x1

    .line 211
    .local v3, "useDefaultSummary":Z
    iget-boolean v4, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mChecked:Z

    if-eqz v4, :cond_3d

    iget-object v4, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mSummaryOn:Ljava/lang/CharSequence;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3d

    .line 213
    iget-object v4, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mSummaryOn:Ljava/lang/CharSequence;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 214
    const/4 v3, 0x0

    .line 222
    :cond_1e
    :goto_1e
    if-eqz v3, :cond_2e

    .line 224
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v1

    .line 225
    .local v1, "summary":Ljava/lang/CharSequence;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2e

    .line 227
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 228
    const/4 v3, 0x0

    .line 232
    .end local v1    # "summary":Ljava/lang/CharSequence;
    :cond_2e
    const/16 v0, 0x8

    .line 233
    .local v0, "newVisibility":I
    if-nez v3, :cond_33

    .line 236
    const/4 v0, 0x0

    .line 238
    :cond_33
    invoke-virtual {v2}, Landroid/widget/TextView;->getVisibility()I

    move-result v4

    if-eq v0, v4, :cond_3c

    .line 240
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 243
    .end local v0    # "newVisibility":I
    .end local v3    # "useDefaultSummary":Z
    :cond_3c
    return-void

    .line 216
    .restart local v3    # "useDefaultSummary":Z
    :cond_3d
    iget-boolean v4, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mChecked:Z

    if-nez v4, :cond_1e

    iget-object v4, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mSummaryOff:Ljava/lang/CharSequence;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1e

    .line 218
    iget-object v4, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;->mSummaryOff:Ljava/lang/CharSequence;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 219
    const/4 v3, 0x0

    goto :goto_1e
.end method
