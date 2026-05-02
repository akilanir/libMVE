.class public Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;
.super Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;
.source "EditTextPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState;
    }
.end annotation


# instance fields
.field private mEditText:Landroid/widget/EditText;

.field private mText:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 76
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 77
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 71
    sget v0, Lcom/lb/material_preferences_library/R$attr;->editTextPreferenceStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 72
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 66
    invoke-direct {p0, p1, p2, p3}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 67
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 61
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 62
    return-void
.end method


# virtual methods
.method public getEditText()Landroid/widget/EditText;
    .registers 2

    .prologue
    .line 202
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->mEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->mText:Ljava/lang/String;

    return-object v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 82
    invoke-super {p0, p1, p2, p3, p4}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 83
    new-instance v0, Landroid/support/v7/widget/AppCompatEditText;

    invoke-direct {v0, p1, p2}, Landroid/support/v7/widget/AppCompatEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->mEditText:Landroid/widget/EditText;

    .line 86
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->mEditText:Landroid/widget/EditText;

    const v1, 0x1020003

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setId(I)V

    .line 94
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->mEditText:Landroid/widget/EditText;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 95
    sget v0, Lcom/lb/material_preferences_library/R$layout;->mpl__edittext_dialog_preference:I

    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->setDialogLayoutResource(I)V

    .line 96
    return-void
.end method

.method protected needInputMethod()Z
    .registers 2

    .prologue
    .line 208
    const/4 v0, 0x1

    return v0
.end method

.method protected onAddEditTextToDialogView(Landroid/view/View;Landroid/widget/EditText;)V
    .registers 6
    .param p1, "dialogView"    # Landroid/view/View;
    .param p2, "editText"    # Landroid/widget/EditText;

    .prologue
    .line 154
    sget v1, Lcom/lb/material_preferences_library/R$id;->edittext_container:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 156
    .local v0, "container":Landroid/view/ViewGroup;
    if-eqz v0, :cond_f

    .line 158
    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-virtual {v0, p2, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 161
    :cond_f
    return-void
.end method

.method protected onBindDialogView(Landroid/view/View;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 131
    invoke-super {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->onBindDialogView(Landroid/view/View;)V

    .line 133
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->mEditText:Landroid/widget/EditText;

    .line 134
    .local v0, "editText":Landroid/widget/EditText;
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 136
    invoke-virtual {v0}, Landroid/widget/EditText;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 137
    .local v1, "oldParent":Landroid/view/ViewParent;
    if-eq v1, p1, :cond_1c

    .line 139
    if-eqz v1, :cond_19

    .line 141
    check-cast v1, Landroid/view/ViewGroup;

    .end local v1    # "oldParent":Landroid/view/ViewParent;
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 143
    :cond_19
    invoke-virtual {p0, p1, v0}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->onAddEditTextToDialogView(Landroid/view/View;Landroid/widget/EditText;)V

    .line 145
    :cond_1c
    return-void
.end method

.method protected onDialogClosed(Z)V
    .registers 4
    .param p1, "positiveResult"    # Z

    .prologue
    .line 166
    invoke-super {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->onDialogClosed(Z)V

    .line 167
    if-eqz p1, :cond_18

    .line 169
    iget-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 170
    .local v0, "value":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 172
    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 175
    .end local v0    # "value":Ljava/lang/String;
    :cond_18
    return-void
.end method

.method protected onGetDefaultValue(Landroid/content/res/TypedArray;I)Ljava/lang/Object;
    .registers 4
    .param p1, "a"    # Landroid/content/res/TypedArray;
    .param p2, "index"    # I

    .prologue
    .line 180
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

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

    const-class v2, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 232
    :cond_e
    invoke-super {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 239
    :goto_11
    return-void

    :cond_12
    move-object v0, p1

    .line 236
    check-cast v0, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState;

    .line 237
    .local v0, "myState":Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState;
    invoke-virtual {v0}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 238
    iget-object v1, v0, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState;->text:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->setText(Ljava/lang/String;)V

    goto :goto_11
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 214
    invoke-super {p0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 215
    .local v1, "superState":Landroid/os/Parcelable;
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->isPersistent()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 223
    .end local v1    # "superState":Landroid/os/Parcelable;
    :goto_a
    return-object v1

    .line 221
    .restart local v1    # "superState":Landroid/os/Parcelable;
    :cond_b
    new-instance v0, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState;

    invoke-direct {v0, v1}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 222
    .local v0, "myState":Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState;
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->getText()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState;->text:Ljava/lang/String;

    move-object v1, v0

    .line 223
    goto :goto_a
.end method

.method protected onSetInitialValue(ZLjava/lang/Object;)V
    .registers 4
    .param p1, "restoreValue"    # Z
    .param p2, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 186
    if-eqz p1, :cond_c

    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->mText:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->getPersistedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .end local p2    # "defaultValue":Ljava/lang/Object;
    :goto_8
    invoke-virtual {p0, p2}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 187
    return-void

    .line 186
    .restart local p2    # "defaultValue":Ljava/lang/Object;
    :cond_c
    check-cast p2, Ljava/lang/String;

    goto :goto_8
.end method

.method public setText(Ljava/lang/String;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 105
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->shouldDisableDependents()Z

    move-result v1

    .line 107
    .local v1, "wasBlocking":Z
    iput-object p1, p0, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->mText:Ljava/lang/String;

    .line 109
    invoke-virtual {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->persistString(Ljava/lang/String;)Z

    .line 111
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->shouldDisableDependents()Z

    move-result v0

    .line 112
    .local v0, "isBlocking":Z
    if-eq v0, v1, :cond_12

    .line 114
    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->notifyDependencyChange(Z)V

    .line 116
    :cond_12
    return-void
.end method

.method public shouldDisableDependents()Z
    .registers 2

    .prologue
    .line 192
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->mText:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_e

    invoke-super {p0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->shouldDisableDependents()Z

    move-result v0

    if-eqz v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method
