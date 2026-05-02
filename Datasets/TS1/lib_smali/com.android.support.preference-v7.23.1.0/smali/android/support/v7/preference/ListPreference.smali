.class public Landroid/support/v7/preference/ListPreference;
.super Landroid/support/v7/preference/DialogPreference;
.source "ListPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/preference/ListPreference$SavedState;
    }
.end annotation


# instance fields
.field private mEntries:[Ljava/lang/CharSequence;

.field private mEntryValues:[Ljava/lang/CharSequence;

.field private mSummary:Ljava/lang/String;

.field private mValue:Ljava/lang/String;

.field private mValueSet:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 81
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/preference/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 82
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 77
    sget v0, Landroid/support/v7/preference/R$attr;->dialogPreferenceStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/preference/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 78
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 73
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroid/support/v7/preference/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 74
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 47
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v7/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 49
    sget-object v1, Landroid/support/v7/preference/R$styleable;->ListPreference:[I

    invoke-virtual {p1, p2, v1, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 52
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Landroid/support/v7/preference/R$styleable;->ListPreference_entries:I

    sget v2, Landroid/support/v7/preference/R$styleable;->ListPreference_android_entries:I

    invoke-static {v0, v1, v2}, Landroid/support/v4/content/res/TypedArrayUtils;->getTextArray(Landroid/content/res/TypedArray;II)[Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/preference/ListPreference;->mEntries:[Ljava/lang/CharSequence;

    .line 55
    sget v1, Landroid/support/v7/preference/R$styleable;->ListPreference_entryValues:I

    sget v2, Landroid/support/v7/preference/R$styleable;->ListPreference_android_entryValues:I

    invoke-static {v0, v1, v2}, Landroid/support/v4/content/res/TypedArrayUtils;->getTextArray(Landroid/content/res/TypedArray;II)[Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/preference/ListPreference;->mEntryValues:[Ljava/lang/CharSequence;

    .line 58
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 63
    sget-object v1, Landroid/support/v7/preference/R$styleable;->Preference:[I

    invoke-virtual {p1, p2, v1, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 66
    sget v1, Landroid/support/v7/preference/R$styleable;->Preference_summary:I

    sget v2, Landroid/support/v7/preference/R$styleable;->Preference_android_summary:I

    invoke-static {v0, v1, v2}, Landroid/support/v4/content/res/TypedArrayUtils;->getString(Landroid/content/res/TypedArray;II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/preference/ListPreference;->mSummary:Ljava/lang/String;

    .line 69
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 70
    return-void
.end method

.method private getValueIndex()I
    .registers 2

    .prologue
    .line 248
    iget-object v0, p0, Landroid/support/v7/preference/ListPreference;->mValue:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/support/v7/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v0

    return v0
.end method


# virtual methods
.method public findIndexOfValue(Ljava/lang/String;)I
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 237
    if-eqz p1, :cond_1b

    iget-object v1, p0, Landroid/support/v7/preference/ListPreference;->mEntryValues:[Ljava/lang/CharSequence;

    if-eqz v1, :cond_1b

    .line 238
    iget-object v1, p0, Landroid/support/v7/preference/ListPreference;->mEntryValues:[Ljava/lang/CharSequence;

    array-length v1, v1

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_b
    if-ltz v0, :cond_1b

    .line 239
    iget-object v1, p0, Landroid/support/v7/preference/ListPreference;->mEntryValues:[Ljava/lang/CharSequence;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 244
    .end local v0    # "i":I
    :goto_17
    return v0

    .line 238
    .restart local v0    # "i":I
    :cond_18
    add-int/lit8 v0, v0, -0x1

    goto :goto_b

    .line 244
    .end local v0    # "i":I
    :cond_1b
    const/4 v0, -0x1

    goto :goto_17
.end method

.method public getEntries()[Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 112
    iget-object v0, p0, Landroid/support/v7/preference/ListPreference;->mEntries:[Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getEntry()Ljava/lang/CharSequence;
    .registers 3

    .prologue
    .line 226
    invoke-direct {p0}, Landroid/support/v7/preference/ListPreference;->getValueIndex()I

    move-result v0

    .line 227
    .local v0, "index":I
    if-ltz v0, :cond_f

    iget-object v1, p0, Landroid/support/v7/preference/ListPreference;->mEntries:[Ljava/lang/CharSequence;

    if-eqz v1, :cond_f

    iget-object v1, p0, Landroid/support/v7/preference/ListPreference;->mEntries:[Ljava/lang/CharSequence;

    aget-object v1, v1, v0

    :goto_e
    return-object v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public getEntryValues()[Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 140
    iget-object v0, p0, Landroid/support/v7/preference/ListPreference;->mEntryValues:[Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getSummary()Ljava/lang/CharSequence;
    .registers 5

    .prologue
    .line 172
    invoke-virtual {p0}, Landroid/support/v7/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v0

    .line 173
    .local v0, "entry":Ljava/lang/CharSequence;
    iget-object v1, p0, Landroid/support/v7/preference/ListPreference;->mSummary:Ljava/lang/String;

    if-nez v1, :cond_d

    .line 174
    invoke-super {p0}, Landroid/support/v7/preference/DialogPreference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v1

    .line 176
    .end local v0    # "entry":Ljava/lang/CharSequence;
    :goto_c
    return-object v1

    .restart local v0    # "entry":Ljava/lang/CharSequence;
    :cond_d
    iget-object v1, p0, Landroid/support/v7/preference/ListPreference;->mSummary:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    if-nez v0, :cond_17

    const-string v0, ""

    .end local v0    # "entry":Ljava/lang/CharSequence;
    :cond_17
    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 217
    iget-object v0, p0, Landroid/support/v7/preference/ListPreference;->mValue:Ljava/lang/String;

    return-object v0
.end method

.method protected onGetDefaultValue(Landroid/content/res/TypedArray;I)Ljava/lang/Object;
    .registers 4
    .param p1, "a"    # Landroid/content/res/TypedArray;
    .param p2, "index"    # I

    .prologue
    .line 253
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 276
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Landroid/support/v7/preference/ListPreference$SavedState;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 278
    :cond_e
    invoke-super {p0, p1}, Landroid/support/v7/preference/DialogPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 285
    :goto_11
    return-void

    :cond_12
    move-object v0, p1

    .line 282
    check-cast v0, Landroid/support/v7/preference/ListPreference$SavedState;

    .line 283
    .local v0, "myState":Landroid/support/v7/preference/ListPreference$SavedState;
    invoke-virtual {v0}, Landroid/support/v7/preference/ListPreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/support/v7/preference/DialogPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 284
    iget-object v1, v0, Landroid/support/v7/preference/ListPreference$SavedState;->value:Ljava/lang/String;

    invoke-virtual {p0, v1}, Landroid/support/v7/preference/ListPreference;->setValue(Ljava/lang/String;)V

    goto :goto_11
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 263
    invoke-super {p0}, Landroid/support/v7/preference/DialogPreference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 264
    .local v1, "superState":Landroid/os/Parcelable;
    invoke-virtual {p0}, Landroid/support/v7/preference/ListPreference;->isPersistent()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 271
    .end local v1    # "superState":Landroid/os/Parcelable;
    :goto_a
    return-object v1

    .line 269
    .restart local v1    # "superState":Landroid/os/Parcelable;
    :cond_b
    new-instance v0, Landroid/support/v7/preference/ListPreference$SavedState;

    invoke-direct {v0, v1}, Landroid/support/v7/preference/ListPreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 270
    .local v0, "myState":Landroid/support/v7/preference/ListPreference$SavedState;
    invoke-virtual {p0}, Landroid/support/v7/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Landroid/support/v7/preference/ListPreference$SavedState;->value:Ljava/lang/String;

    move-object v1, v0

    .line 271
    goto :goto_a
.end method

.method protected onSetInitialValue(ZLjava/lang/Object;)V
    .registers 4
    .param p1, "restoreValue"    # Z
    .param p2, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 258
    if-eqz p1, :cond_c

    iget-object v0, p0, Landroid/support/v7/preference/ListPreference;->mValue:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/support/v7/preference/ListPreference;->getPersistedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .end local p2    # "defaultValue":Ljava/lang/Object;
    :goto_8
    invoke-virtual {p0, p2}, Landroid/support/v7/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 259
    return-void

    .line 258
    .restart local p2    # "defaultValue":Ljava/lang/Object;
    :cond_c
    check-cast p2, Ljava/lang/String;

    goto :goto_8
.end method

.method public setEntries(I)V
    .registers 3
    .param p1, "entriesResId"    # I
        .annotation build Landroid/support/annotation/ArrayRes;
        .end annotation
    .end param

    .prologue
    .line 103
    invoke-virtual {p0}, Landroid/support/v7/preference/ListPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 104
    return-void
.end method

.method public setEntries([Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "entries"    # [Ljava/lang/CharSequence;

    .prologue
    .line 95
    iput-object p1, p0, Landroid/support/v7/preference/ListPreference;->mEntries:[Ljava/lang/CharSequence;

    .line 96
    return-void
.end method

.method public setEntryValues(I)V
    .registers 3
    .param p1, "entryValuesResId"    # I
        .annotation build Landroid/support/annotation/ArrayRes;
        .end annotation
    .end param

    .prologue
    .line 131
    invoke-virtual {p0}, Landroid/support/v7/preference/ListPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 132
    return-void
.end method

.method public setEntryValues([Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "entryValues"    # [Ljava/lang/CharSequence;

    .prologue
    .line 123
    iput-object p1, p0, Landroid/support/v7/preference/ListPreference;->mEntryValues:[Ljava/lang/CharSequence;

    .line 124
    return-void
.end method

.method public setSummary(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "summary"    # Ljava/lang/CharSequence;

    .prologue
    .line 191
    invoke-super {p0, p1}, Landroid/support/v7/preference/DialogPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 192
    if-nez p1, :cond_d

    iget-object v0, p0, Landroid/support/v7/preference/ListPreference;->mSummary:Ljava/lang/String;

    if-eqz v0, :cond_d

    .line 193
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/preference/ListPreference;->mSummary:Ljava/lang/String;

    .line 197
    :cond_c
    :goto_c
    return-void

    .line 194
    :cond_d
    if-eqz p1, :cond_c

    iget-object v0, p0, Landroid/support/v7/preference/ListPreference;->mSummary:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 195
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/preference/ListPreference;->mSummary:Ljava/lang/String;

    goto :goto_c
.end method

.method public setValue(Ljava/lang/String;)V
    .registers 5
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 151
    iget-object v2, p0, Landroid/support/v7/preference/ListPreference;->mValue:Ljava/lang/String;

    invoke-static {v2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1d

    move v0, v1

    .line 152
    .local v0, "changed":Z
    :goto_a
    if-nez v0, :cond_10

    iget-boolean v2, p0, Landroid/support/v7/preference/ListPreference;->mValueSet:Z

    if-nez v2, :cond_1c

    .line 153
    :cond_10
    iput-object p1, p0, Landroid/support/v7/preference/ListPreference;->mValue:Ljava/lang/String;

    .line 154
    iput-boolean v1, p0, Landroid/support/v7/preference/ListPreference;->mValueSet:Z

    .line 155
    invoke-virtual {p0, p1}, Landroid/support/v7/preference/ListPreference;->persistString(Ljava/lang/String;)Z

    .line 156
    if-eqz v0, :cond_1c

    .line 157
    invoke-virtual {p0}, Landroid/support/v7/preference/ListPreference;->notifyChanged()V

    .line 160
    :cond_1c
    return-void

    .line 151
    .end local v0    # "changed":Z
    :cond_1d
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public setValueIndex(I)V
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 205
    iget-object v0, p0, Landroid/support/v7/preference/ListPreference;->mEntryValues:[Ljava/lang/CharSequence;

    if-eqz v0, :cond_f

    .line 206
    iget-object v0, p0, Landroid/support/v7/preference/ListPreference;->mEntryValues:[Ljava/lang/CharSequence;

    aget-object v0, v0, p1

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 208
    :cond_f
    return-void
.end method
