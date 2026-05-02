.class public abstract Lcom/jenzz/materialpreference/TwoStatePreference;
.super Lcom/jenzz/materialpreference/Preference;
.source "TwoStatePreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jenzz/materialpreference/TwoStatePreference$SavedState;
    }
.end annotation


# instance fields
.field private disableDependentsState:Z

.field private isChecked:Z

.field private isCheckedSet:Z

.field private summaryOff:Ljava/lang/CharSequence;

.field private summaryOn:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/jenzz/materialpreference/Preference;-><init>(Landroid/content/Context;)V

    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 26
    invoke-direct {p0, p1, p2}, Lcom/jenzz/materialpreference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 30
    invoke-direct {p0, p1, p2, p3}, Lcom/jenzz/materialpreference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/jenzz/materialpreference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 36
    return-void
.end method


# virtual methods
.method public getDisableDependentsState()Z
    .registers 2

    .prologue
    .line 155
    iget-boolean v0, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->disableDependentsState:Z

    return v0
.end method

.method public getSummaryOff()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->summaryOff:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getSummaryOn()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 112
    iget-object v0, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->summaryOn:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public isChecked()Z
    .registers 2

    .prologue
    .line 74
    iget-boolean v0, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->isChecked:Z

    return v0
.end method

.method protected onClick()V
    .registers 3

    .prologue
    .line 40
    invoke-super {p0}, Lcom/jenzz/materialpreference/Preference;->onClick()V

    .line 42
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/TwoStatePreference;->isChecked()Z

    move-result v1

    if-nez v1, :cond_18

    const/4 v0, 0x1

    .line 43
    .local v0, "newValue":Z
    :goto_a
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/jenzz/materialpreference/TwoStatePreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 44
    invoke-virtual {p0, v0}, Lcom/jenzz/materialpreference/TwoStatePreference;->setChecked(Z)V

    .line 46
    :cond_17
    return-void

    .line 42
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
    .line 171
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
    .line 229
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/jenzz/materialpreference/TwoStatePreference$SavedState;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 231
    :cond_e
    invoke-super {p0, p1}, Lcom/jenzz/materialpreference/Preference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 238
    :goto_11
    return-void

    :cond_12
    move-object v0, p1

    .line 235
    check-cast v0, Lcom/jenzz/materialpreference/TwoStatePreference$SavedState;

    .line 236
    .local v0, "myState":Lcom/jenzz/materialpreference/TwoStatePreference$SavedState;
    invoke-virtual {v0}, Lcom/jenzz/materialpreference/TwoStatePreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Lcom/jenzz/materialpreference/Preference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 237
    iget-boolean v1, v0, Lcom/jenzz/materialpreference/TwoStatePreference$SavedState;->checked:Z

    invoke-virtual {p0, v1}, Lcom/jenzz/materialpreference/TwoStatePreference;->setChecked(Z)V

    goto :goto_11
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 216
    invoke-super {p0}, Lcom/jenzz/materialpreference/Preference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 217
    .local v1, "superState":Landroid/os/Parcelable;
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/TwoStatePreference;->isPersistent()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 224
    .end local v1    # "superState":Landroid/os/Parcelable;
    :goto_a
    return-object v1

    .line 222
    .restart local v1    # "superState":Landroid/os/Parcelable;
    :cond_b
    new-instance v0, Lcom/jenzz/materialpreference/TwoStatePreference$SavedState;

    invoke-direct {v0, v1}, Lcom/jenzz/materialpreference/TwoStatePreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 223
    .local v0, "myState":Lcom/jenzz/materialpreference/TwoStatePreference$SavedState;
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/TwoStatePreference;->isChecked()Z

    move-result v2

    iput-boolean v2, v0, Lcom/jenzz/materialpreference/TwoStatePreference$SavedState;->checked:Z

    move-object v1, v0

    .line 224
    goto :goto_a
.end method

.method protected onSetInitialValue(ZLjava/lang/Object;)V
    .registers 4
    .param p1, "restoreValue"    # Z
    .param p2, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 176
    if-eqz p1, :cond_c

    iget-boolean v0, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->isChecked:Z

    invoke-virtual {p0, v0}, Lcom/jenzz/materialpreference/TwoStatePreference;->getPersistedBoolean(Z)Z

    move-result v0

    .end local p2    # "defaultValue":Ljava/lang/Object;
    :goto_8
    invoke-virtual {p0, v0}, Lcom/jenzz/materialpreference/TwoStatePreference;->setChecked(Z)V

    .line 177
    return-void

    .line 176
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

    .line 56
    iget-boolean v2, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->isChecked:Z

    if-eq v2, p1, :cond_20

    move v0, v1

    .line 57
    .local v0, "changed":Z
    :goto_6
    if-nez v0, :cond_c

    iget-boolean v2, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->isCheckedSet:Z

    if-nez v2, :cond_1f

    .line 58
    :cond_c
    iput-boolean p1, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->isChecked:Z

    .line 59
    iput-boolean v1, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->isCheckedSet:Z

    .line 60
    invoke-virtual {p0, p1}, Lcom/jenzz/materialpreference/TwoStatePreference;->persistBoolean(Z)Z

    .line 61
    if-eqz v0, :cond_1f

    .line 62
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/TwoStatePreference;->shouldDisableDependents()Z

    move-result v1

    invoke-virtual {p0, v1}, Lcom/jenzz/materialpreference/TwoStatePreference;->notifyDependencyChange(Z)V

    .line 63
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/TwoStatePreference;->notifyChanged()V

    .line 66
    :cond_1f
    return-void

    .line 56
    .end local v0    # "changed":Z
    :cond_20
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public setDisableDependentsState(Z)V
    .registers 2
    .param p1, "disableDependentsState"    # Z

    .prologue
    .line 166
    iput-boolean p1, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->disableDependentsState:Z

    .line 167
    return-void
.end method

.method public setSummaryOff(I)V
    .registers 3
    .param p1, "summaryResId"    # I

    .prologue
    .line 135
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/TwoStatePreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jenzz/materialpreference/TwoStatePreference;->setSummaryOff(Ljava/lang/CharSequence;)V

    .line 136
    return-void
.end method

.method public setSummaryOff(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "summary"    # Ljava/lang/CharSequence;

    .prologue
    .line 122
    iput-object p1, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->summaryOff:Ljava/lang/CharSequence;

    .line 123
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/TwoStatePreference;->isChecked()Z

    move-result v0

    if-nez v0, :cond_b

    .line 124
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/TwoStatePreference;->notifyChanged()V

    .line 126
    :cond_b
    return-void
.end method

.method public setSummaryOn(I)V
    .registers 3
    .param p1, "summaryResId"    # I

    .prologue
    .line 103
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/TwoStatePreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jenzz/materialpreference/TwoStatePreference;->setSummaryOn(Ljava/lang/CharSequence;)V

    .line 104
    return-void
.end method

.method public setSummaryOn(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "summary"    # Ljava/lang/CharSequence;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->summaryOn:Ljava/lang/CharSequence;

    .line 91
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/TwoStatePreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 92
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/TwoStatePreference;->notifyChanged()V

    .line 94
    :cond_b
    return-void
.end method

.method public shouldDisableDependents()Z
    .registers 5

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 79
    iget-boolean v3, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->disableDependentsState:Z

    if-eqz v3, :cond_12

    iget-boolean v0, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->isChecked:Z

    .line 80
    .local v0, "shouldDisable":Z
    :goto_8
    if-nez v0, :cond_10

    invoke-super {p0}, Lcom/jenzz/materialpreference/Preference;->shouldDisableDependents()Z

    move-result v3

    if-eqz v3, :cond_11

    :cond_10
    move v1, v2

    :cond_11
    return v1

    .line 79
    .end local v0    # "shouldDisable":Z
    :cond_12
    iget-boolean v3, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->isChecked:Z

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
    .line 187
    const/4 v2, 0x1

    .line 188
    .local v2, "useDefaultSummary":Z
    iget-boolean v3, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->isChecked:Z

    if-eqz v3, :cond_3a

    iget-object v3, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->summaryOn:Ljava/lang/CharSequence;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3a

    .line 189
    iget-object v3, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->summaryView:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->summaryOn:Ljava/lang/CharSequence;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 190
    const/4 v2, 0x0

    .line 196
    :cond_15
    :goto_15
    if-eqz v2, :cond_27

    .line 197
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/TwoStatePreference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v1

    .line 198
    .local v1, "summary":Ljava/lang/CharSequence;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_27

    .line 199
    iget-object v3, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->summaryView:Landroid/widget/TextView;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 200
    const/4 v2, 0x0

    .line 204
    .end local v1    # "summary":Ljava/lang/CharSequence;
    :cond_27
    const/16 v0, 0x8

    .line 205
    .local v0, "newVisibility":I
    if-nez v2, :cond_2c

    .line 207
    const/4 v0, 0x0

    .line 209
    :cond_2c
    iget-object v3, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->summaryView:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getVisibility()I

    move-result v3

    if-eq v0, v3, :cond_39

    .line 210
    iget-object v3, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->summaryView:Landroid/widget/TextView;

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 212
    :cond_39
    return-void

    .line 191
    .end local v0    # "newVisibility":I
    :cond_3a
    iget-boolean v3, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->isChecked:Z

    if-nez v3, :cond_15

    iget-object v3, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->summaryOff:Ljava/lang/CharSequence;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_15

    .line 192
    iget-object v3, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->summaryView:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/jenzz/materialpreference/TwoStatePreference;->summaryOff:Ljava/lang/CharSequence;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 193
    const/4 v2, 0x0

    goto :goto_15
.end method
