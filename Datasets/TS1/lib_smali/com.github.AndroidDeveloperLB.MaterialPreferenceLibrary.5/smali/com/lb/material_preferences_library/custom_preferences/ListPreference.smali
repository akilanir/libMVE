.class public Lcom/lb/material_preferences_library/custom_preferences/ListPreference;
.super Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;
.source "ListPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lb/material_preferences_library/custom_preferences/ListPreference$SavedState;
    }
.end annotation


# instance fields
.field private mClickedDialogEntryIndex:I

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
    .line 67
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 68
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 62
    sget v0, Lcom/lb/material_preferences_library/R$attr;->dialogPreferenceStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 63
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 57
    invoke-direct {p0, p1, p2, p3}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 58
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 52
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 53
    return-void
.end method

.method static synthetic access$002(Lcom/lb/material_preferences_library/custom_preferences/ListPreference;I)I
    .registers 2
    .param p0, "x0"    # Lcom/lb/material_preferences_library/custom_preferences/ListPreference;
    .param p1, "x1"    # I

    .prologue
    .line 41
    iput p1, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mClickedDialogEntryIndex:I

    return p1
.end method

.method private getValueIndex()I
    .registers 2

    .prologue
    .line 274
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mValue:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v0

    return v0
.end method


# virtual methods
.method public findIndexOfValue(Ljava/lang/String;)I
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 265
    if-eqz p1, :cond_1b

    iget-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mEntryValues:[Ljava/lang/CharSequence;

    if-eqz v1, :cond_1b

    .line 266
    iget-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mEntryValues:[Ljava/lang/CharSequence;

    array-length v1, v1

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_b
    if-ltz v0, :cond_1b

    .line 267
    iget-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mEntryValues:[Ljava/lang/CharSequence;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 269
    .end local v0    # "i":I
    :goto_17
    return v0

    .line 266
    .restart local v0    # "i":I
    :cond_18
    add-int/lit8 v0, v0, -0x1

    goto :goto_b

    .line 269
    .end local v0    # "i":I
    :cond_1b
    const/4 v0, -0x1

    goto :goto_17
.end method

.method public getEntries()[Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 121
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mEntries:[Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getEntry()Ljava/lang/CharSequence;
    .registers 3

    .prologue
    .line 253
    invoke-direct {p0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->getValueIndex()I

    move-result v0

    .line 254
    .local v0, "index":I
    if-ltz v0, :cond_f

    iget-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mEntries:[Ljava/lang/CharSequence;

    if-eqz v1, :cond_f

    iget-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mEntries:[Ljava/lang/CharSequence;

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
    .line 152
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mEntryValues:[Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getSummary()Ljava/lang/CharSequence;
    .registers 5

    .prologue
    .line 188
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v0

    .line 189
    .local v0, "entry":Ljava/lang/CharSequence;
    iget-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mSummary:Ljava/lang/String;

    if-nez v1, :cond_d

    .line 191
    invoke-super {p0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v1

    .line 195
    .end local v0    # "entry":Ljava/lang/CharSequence;
    :goto_c
    return-object v1

    .restart local v0    # "entry":Ljava/lang/CharSequence;
    :cond_d
    iget-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mSummary:Ljava/lang/String;

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
    .line 243
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mValue:Ljava/lang/String;

    return-object v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 73
    invoke-super {p0, p1, p2, p3, p4}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 74
    sget-object v1, Lcom/lb/material_preferences_library/R$styleable;->ListPreference:[I

    invoke-virtual {p1, p2, v1, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 76
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Lcom/lb/material_preferences_library/R$styleable;->ListPreference_entries:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mEntries:[Ljava/lang/CharSequence;

    .line 77
    sget v1, Lcom/lb/material_preferences_library/R$styleable;->ListPreference_entryValues:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mEntryValues:[Ljava/lang/CharSequence;

    .line 78
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 87
    invoke-super {p0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v1

    if-nez v1, :cond_26

    const/4 v1, 0x0

    :goto_23
    iput-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mSummary:Ljava/lang/String;

    .line 88
    return-void

    .line 87
    :cond_26
    invoke-super {p0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_23
.end method

.method protected onDialogClosed(Z)V
    .registers 5
    .param p1, "positiveResult"    # Z

    .prologue
    .line 334
    invoke-super {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->onDialogClosed(Z)V

    .line 336
    if-eqz p1, :cond_20

    iget v1, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mClickedDialogEntryIndex:I

    if-ltz v1, :cond_20

    iget-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mEntryValues:[Ljava/lang/CharSequence;

    if-eqz v1, :cond_20

    .line 338
    iget-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mEntryValues:[Ljava/lang/CharSequence;

    iget v2, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mClickedDialogEntryIndex:I

    aget-object v1, v1, v2

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 339
    .local v0, "value":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 341
    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->setValue(Ljava/lang/String;)V

    .line 344
    .end local v0    # "value":Ljava/lang/String;
    :cond_20
    return-void
.end method

.method protected onGetDefaultValue(Landroid/content/res/TypedArray;I)Ljava/lang/Object;
    .registers 4
    .param p1, "a"    # Landroid/content/res/TypedArray;
    .param p2, "index"    # I

    .prologue
    .line 349
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onPrepareDialogBuilder(Landroid/support/v7/app/AlertDialog$Builder;)V
    .registers 7
    .param p1, "builder"    # Landroid/support/v7/app/AlertDialog$Builder;

    .prologue
    const/4 v4, 0x0

    .line 280
    invoke-super {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->onPrepareDialogBuilder(Landroid/support/v7/app/AlertDialog$Builder;)V

    .line 281
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mEntries:[Ljava/lang/CharSequence;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mEntryValues:[Ljava/lang/CharSequence;

    if-nez v0, :cond_14

    .line 283
    :cond_c
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "ListPreference requires an entries array and an entryValues array."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 286
    :cond_14
    invoke-direct {p0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->getValueIndex()I

    move-result v0

    iput v0, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mClickedDialogEntryIndex:I

    .line 307
    new-instance v0, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/lb/material_preferences_library/R$layout;->mpl__simple_list_item_single_choice:I

    iget-object v3, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mEntries:[Ljava/lang/CharSequence;

    invoke-direct {v0, v1, v2, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    iget v1, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mClickedDialogEntryIndex:I

    new-instance v2, Lcom/lb/material_preferences_library/custom_preferences/ListPreference$1;

    invoke-direct {v2, p0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference$1;-><init>(Lcom/lb/material_preferences_library/custom_preferences/ListPreference;)V

    invoke-virtual {p1, v0, v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setSingleChoiceItems(Landroid/widget/ListAdapter;ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 328
    invoke-virtual {p1, v4, v4}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 329
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 376
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/lb/material_preferences_library/custom_preferences/ListPreference$SavedState;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 379
    :cond_e
    invoke-super {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 386
    :goto_11
    return-void

    :cond_12
    move-object v0, p1

    .line 383
    check-cast v0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference$SavedState;

    .line 384
    .local v0, "myState":Lcom/lb/material_preferences_library/custom_preferences/ListPreference$SavedState;
    invoke-virtual {v0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 385
    iget-object v1, v0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference$SavedState;->value:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->setValue(Ljava/lang/String;)V

    goto :goto_11
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 361
    invoke-super {p0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 362
    .local v1, "superState":Landroid/os/Parcelable;
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->isPersistent()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 370
    .end local v1    # "superState":Landroid/os/Parcelable;
    :goto_a
    return-object v1

    .line 368
    .restart local v1    # "superState":Landroid/os/Parcelable;
    :cond_b
    new-instance v0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference$SavedState;

    invoke-direct {v0, v1}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 369
    .local v0, "myState":Lcom/lb/material_preferences_library/custom_preferences/ListPreference$SavedState;
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference$SavedState;->value:Ljava/lang/String;

    move-object v1, v0

    .line 370
    goto :goto_a
.end method

.method protected onSetInitialValue(ZLjava/lang/Object;)V
    .registers 4
    .param p1, "restoreValue"    # Z
    .param p2, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 355
    if-eqz p1, :cond_c

    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mValue:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->getPersistedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .end local p2    # "defaultValue":Ljava/lang/Object;
    :goto_8
    invoke-virtual {p0, p2}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->setValue(Ljava/lang/String;)V

    .line 356
    return-void

    .line 355
    .restart local p2    # "defaultValue":Ljava/lang/Object;
    :cond_c
    check-cast p2, Ljava/lang/String;

    goto :goto_8
.end method

.method public setEntries(I)V
    .registers 3
    .param p1, "entriesResId"    # I

    .prologue
    .line 111
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 112
    return-void
.end method

.method public setEntries([Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "entries"    # [Ljava/lang/CharSequence;

    .prologue
    .line 102
    iput-object p1, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mEntries:[Ljava/lang/CharSequence;

    .line 103
    return-void
.end method

.method public setEntryValues(I)V
    .registers 3
    .param p1, "entryValuesResId"    # I

    .prologue
    .line 142
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 143
    return-void
.end method

.method public setEntryValues([Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "entryValues"    # [Ljava/lang/CharSequence;

    .prologue
    .line 133
    iput-object p1, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mEntryValues:[Ljava/lang/CharSequence;

    .line 134
    return-void
.end method

.method public setSummary(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "summary"    # Ljava/lang/CharSequence;

    .prologue
    .line 211
    invoke-super {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 212
    if-nez p1, :cond_d

    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mSummary:Ljava/lang/String;

    if-eqz v0, :cond_d

    .line 214
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mSummary:Ljava/lang/String;

    .line 220
    :cond_c
    :goto_c
    return-void

    .line 216
    :cond_d
    if-eqz p1, :cond_c

    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mSummary:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 218
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mSummary:Ljava/lang/String;

    goto :goto_c
.end method

.method public setValue(Ljava/lang/String;)V
    .registers 5
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 164
    iget-object v2, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mValue:Ljava/lang/String;

    invoke-static {v2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1d

    move v0, v1

    .line 165
    .local v0, "changed":Z
    :goto_a
    if-nez v0, :cond_10

    iget-boolean v2, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mValueSet:Z

    if-nez v2, :cond_1c

    .line 167
    :cond_10
    iput-object p1, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mValue:Ljava/lang/String;

    .line 168
    iput-boolean v1, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mValueSet:Z

    .line 169
    invoke-virtual {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->persistString(Ljava/lang/String;)Z

    .line 170
    if-eqz v0, :cond_1c

    .line 172
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->notifyChanged()V

    .line 175
    :cond_1c
    return-void

    .line 164
    .end local v0    # "changed":Z
    :cond_1d
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public setValueIndex(I)V
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 229
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mEntryValues:[Ljava/lang/CharSequence;

    if-eqz v0, :cond_f

    .line 231
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mEntryValues:[Ljava/lang/CharSequence;

    aget-object v0, v0, p1

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->setValue(Ljava/lang/String;)V

    .line 233
    :cond_f
    return-void
.end method
