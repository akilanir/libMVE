.class public abstract Landroid/support/v7/preference/TwoStatePreference;
.super Landroid/support/v7/preference/Preference;
.source "TwoStatePreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/preference/TwoStatePreference$SavedState;
    }
.end annotation


# instance fields
.field protected mChecked:Z

.field private mCheckedSet:Z

.field private mDisableDependentsState:Z

.field private mSummaryOff:Ljava/lang/CharSequence;

.field private mSummaryOn:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 55
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/preference/TwoStatePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/preference/TwoStatePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 52
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 47
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroid/support/v7/preference/TwoStatePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 43
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v7/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 44
    return-void
.end method


# virtual methods
.method public getDisableDependentsState()Z
    .registers 2

    .prologue
    .line 166
    iget-boolean v0, p0, Landroid/support/v7/preference/TwoStatePreference;->mDisableDependentsState:Z

    return v0
.end method

.method public getSummaryOff()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 155
    iget-object v0, p0, Landroid/support/v7/preference/TwoStatePreference;->mSummaryOff:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getSummaryOn()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Landroid/support/v7/preference/TwoStatePreference;->mSummaryOn:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public isChecked()Z
    .registers 2

    .prologue
    .line 93
    iget-boolean v0, p0, Landroid/support/v7/preference/TwoStatePreference;->mChecked:Z

    return v0
.end method

.method protected onClick()V
    .registers 3

    .prologue
    .line 60
    invoke-super {p0}, Landroid/support/v7/preference/Preference;->onClick()V

    .line 62
    invoke-virtual {p0}, Landroid/support/v7/preference/TwoStatePreference;->isChecked()Z

    move-result v1

    if-nez v1, :cond_18

    const/4 v0, 0x1

    .line 63
    .local v0, "newValue":Z
    :goto_a
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/support/v7/preference/TwoStatePreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 64
    invoke-virtual {p0, v0}, Landroid/support/v7/preference/TwoStatePreference;->setChecked(Z)V

    .line 66
    :cond_17
    return-void

    .line 62
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
    .line 181
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
    .line 248
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Landroid/support/v7/preference/TwoStatePreference$SavedState;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 250
    :cond_e
    invoke-super {p0, p1}, Landroid/support/v7/preference/Preference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 257
    :goto_11
    return-void

    :cond_12
    move-object v0, p1

    .line 254
    check-cast v0, Landroid/support/v7/preference/TwoStatePreference$SavedState;

    .line 255
    .local v0, "myState":Landroid/support/v7/preference/TwoStatePreference$SavedState;
    invoke-virtual {v0}, Landroid/support/v7/preference/TwoStatePreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/support/v7/preference/Preference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 256
    iget-boolean v1, v0, Landroid/support/v7/preference/TwoStatePreference$SavedState;->checked:Z

    invoke-virtual {p0, v1}, Landroid/support/v7/preference/TwoStatePreference;->setChecked(Z)V

    goto :goto_11
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 235
    invoke-super {p0}, Landroid/support/v7/preference/Preference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 236
    .local v1, "superState":Landroid/os/Parcelable;
    invoke-virtual {p0}, Landroid/support/v7/preference/TwoStatePreference;->isPersistent()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 243
    .end local v1    # "superState":Landroid/os/Parcelable;
    :goto_a
    return-object v1

    .line 241
    .restart local v1    # "superState":Landroid/os/Parcelable;
    :cond_b
    new-instance v0, Landroid/support/v7/preference/TwoStatePreference$SavedState;

    invoke-direct {v0, v1}, Landroid/support/v7/preference/TwoStatePreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 242
    .local v0, "myState":Landroid/support/v7/preference/TwoStatePreference$SavedState;
    invoke-virtual {p0}, Landroid/support/v7/preference/TwoStatePreference;->isChecked()Z

    move-result v2

    iput-boolean v2, v0, Landroid/support/v7/preference/TwoStatePreference$SavedState;->checked:Z

    move-object v1, v0

    .line 243
    goto :goto_a
.end method

.method protected onSetInitialValue(ZLjava/lang/Object;)V
    .registers 4
    .param p1, "restoreValue"    # Z
    .param p2, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 186
    if-eqz p1, :cond_c

    iget-boolean v0, p0, Landroid/support/v7/preference/TwoStatePreference;->mChecked:Z

    invoke-virtual {p0, v0}, Landroid/support/v7/preference/TwoStatePreference;->getPersistedBoolean(Z)Z

    move-result v0

    .end local p2    # "defaultValue":Ljava/lang/Object;
    :goto_8
    invoke-virtual {p0, v0}, Landroid/support/v7/preference/TwoStatePreference;->setChecked(Z)V

    .line 188
    return-void

    .line 186
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

    .line 75
    iget-boolean v2, p0, Landroid/support/v7/preference/TwoStatePreference;->mChecked:Z

    if-eq v2, p1, :cond_20

    move v0, v1

    .line 76
    .local v0, "changed":Z
    :goto_6
    if-nez v0, :cond_c

    iget-boolean v2, p0, Landroid/support/v7/preference/TwoStatePreference;->mCheckedSet:Z

    if-nez v2, :cond_1f

    .line 77
    :cond_c
    iput-boolean p1, p0, Landroid/support/v7/preference/TwoStatePreference;->mChecked:Z

    .line 78
    iput-boolean v1, p0, Landroid/support/v7/preference/TwoStatePreference;->mCheckedSet:Z

    .line 79
    invoke-virtual {p0, p1}, Landroid/support/v7/preference/TwoStatePreference;->persistBoolean(Z)Z

    .line 80
    if-eqz v0, :cond_1f

    .line 81
    invoke-virtual {p0}, Landroid/support/v7/preference/TwoStatePreference;->shouldDisableDependents()Z

    move-result v1

    invoke-virtual {p0, v1}, Landroid/support/v7/preference/TwoStatePreference;->notifyDependencyChange(Z)V

    .line 82
    invoke-virtual {p0}, Landroid/support/v7/preference/TwoStatePreference;->notifyChanged()V

    .line 85
    :cond_1f
    return-void

    .line 75
    .end local v0    # "changed":Z
    :cond_20
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public setDisableDependentsState(Z)V
    .registers 2
    .param p1, "disableDependentsState"    # Z

    .prologue
    .line 176
    iput-boolean p1, p0, Landroid/support/v7/preference/TwoStatePreference;->mDisableDependentsState:Z

    .line 177
    return-void
.end method

.method public setSummaryOff(I)V
    .registers 3
    .param p1, "summaryResId"    # I

    .prologue
    .line 147
    invoke-virtual {p0}, Landroid/support/v7/preference/TwoStatePreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/preference/TwoStatePreference;->setSummaryOff(Ljava/lang/CharSequence;)V

    .line 148
    return-void
.end method

.method public setSummaryOff(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "summary"    # Ljava/lang/CharSequence;

    .prologue
    .line 136
    iput-object p1, p0, Landroid/support/v7/preference/TwoStatePreference;->mSummaryOff:Ljava/lang/CharSequence;

    .line 137
    invoke-virtual {p0}, Landroid/support/v7/preference/TwoStatePreference;->isChecked()Z

    move-result v0

    if-nez v0, :cond_b

    .line 138
    invoke-virtual {p0}, Landroid/support/v7/preference/TwoStatePreference;->notifyChanged()V

    .line 140
    :cond_b
    return-void
.end method

.method public setSummaryOn(I)V
    .registers 3
    .param p1, "summaryResId"    # I

    .prologue
    .line 119
    invoke-virtual {p0}, Landroid/support/v7/preference/TwoStatePreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/preference/TwoStatePreference;->setSummaryOn(Ljava/lang/CharSequence;)V

    .line 120
    return-void
.end method

.method public setSummaryOn(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "summary"    # Ljava/lang/CharSequence;

    .prologue
    .line 108
    iput-object p1, p0, Landroid/support/v7/preference/TwoStatePreference;->mSummaryOn:Ljava/lang/CharSequence;

    .line 109
    invoke-virtual {p0}, Landroid/support/v7/preference/TwoStatePreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 110
    invoke-virtual {p0}, Landroid/support/v7/preference/TwoStatePreference;->notifyChanged()V

    .line 112
    :cond_b
    return-void
.end method

.method public shouldDisableDependents()Z
    .registers 5

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 98
    iget-boolean v3, p0, Landroid/support/v7/preference/TwoStatePreference;->mDisableDependentsState:Z

    if-eqz v3, :cond_12

    iget-boolean v0, p0, Landroid/support/v7/preference/TwoStatePreference;->mChecked:Z

    .line 99
    .local v0, "shouldDisable":Z
    :goto_8
    if-nez v0, :cond_10

    invoke-super {p0}, Landroid/support/v7/preference/Preference;->shouldDisableDependents()Z

    move-result v3

    if-eqz v3, :cond_11

    :cond_10
    move v1, v2

    :cond_11
    return v1

    .line 98
    .end local v0    # "shouldDisable":Z
    :cond_12
    iget-boolean v3, p0, Landroid/support/v7/preference/TwoStatePreference;->mChecked:Z

    if-nez v3, :cond_18

    move v0, v2

    goto :goto_8

    :cond_18
    move v0, v1

    goto :goto_8
.end method

.method protected syncSummaryView(Landroid/support/v7/preference/PreferenceViewHolder;)V
    .registers 4
    .param p1, "holder"    # Landroid/support/v7/preference/PreferenceViewHolder;

    .prologue
    .line 196
    const v1, 0x1020010

    invoke-virtual {p1, v1}, Landroid/support/v7/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 197
    .local v0, "view":Landroid/view/View;
    invoke-virtual {p0, v0}, Landroid/support/v7/preference/TwoStatePreference;->syncSummaryView(Landroid/view/View;)V

    .line 198
    return-void
.end method

.method protected syncSummaryView(Landroid/view/View;)V
    .registers 7
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 204
    instance-of v4, p1, Landroid/widget/TextView;

    if-nez v4, :cond_5

    .line 231
    :cond_4
    :goto_4
    return-void

    :cond_5
    move-object v2, p1

    .line 207
    check-cast v2, Landroid/widget/TextView;

    .line 208
    .local v2, "summaryView":Landroid/widget/TextView;
    const/4 v3, 0x1

    .line 209
    .local v3, "useDefaultSummary":Z
    iget-boolean v4, p0, Landroid/support/v7/preference/TwoStatePreference;->mChecked:Z

    if-eqz v4, :cond_3a

    iget-object v4, p0, Landroid/support/v7/preference/TwoStatePreference;->mSummaryOn:Ljava/lang/CharSequence;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3a

    .line 210
    iget-object v4, p0, Landroid/support/v7/preference/TwoStatePreference;->mSummaryOn:Ljava/lang/CharSequence;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 211
    const/4 v3, 0x0

    .line 216
    :cond_1b
    :goto_1b
    if-eqz v3, :cond_2b

    .line 217
    invoke-virtual {p0}, Landroid/support/v7/preference/TwoStatePreference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v1

    .line 218
    .local v1, "summary":Ljava/lang/CharSequence;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2b

    .line 219
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 220
    const/4 v3, 0x0

    .line 223
    .end local v1    # "summary":Ljava/lang/CharSequence;
    :cond_2b
    const/16 v0, 0x8

    .line 224
    .local v0, "newVisibility":I
    if-nez v3, :cond_30

    .line 226
    const/4 v0, 0x0

    .line 228
    :cond_30
    invoke-virtual {v2}, Landroid/widget/TextView;->getVisibility()I

    move-result v4

    if-eq v0, v4, :cond_4

    .line 229
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_4

    .line 212
    .end local v0    # "newVisibility":I
    :cond_3a
    iget-boolean v4, p0, Landroid/support/v7/preference/TwoStatePreference;->mChecked:Z

    if-nez v4, :cond_1b

    iget-object v4, p0, Landroid/support/v7/preference/TwoStatePreference;->mSummaryOff:Ljava/lang/CharSequence;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1b

    .line 213
    iget-object v4, p0, Landroid/support/v7/preference/TwoStatePreference;->mSummaryOff:Ljava/lang/CharSequence;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 214
    const/4 v3, 0x0

    goto :goto_1b
.end method
