.class public abstract Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;
.super Lcom/lb/material_preferences_library/custom_preferences/Preference;
.source "DialogPreference.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/content/DialogInterface$OnDismissListener;
.implements Landroid/preference/PreferenceManager$OnActivityDestroyListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState;
    }
.end annotation


# instance fields
.field private mBuilder:Landroid/support/v7/app/AlertDialog$Builder;

.field private mDialog:Landroid/app/Dialog;

.field private mDialogIcon:Landroid/graphics/drawable/Drawable;

.field private mDialogLayoutResId:I

.field private mDialogMessage:Ljava/lang/CharSequence;

.field private mDialogTitle:Ljava/lang/CharSequence;

.field private mNegativeButtonText:Ljava/lang/CharSequence;

.field private mPositiveButtonText:Ljava/lang/CharSequence;

.field private mWhichButtonClicked:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 89
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 90
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 84
    sget v0, Lcom/lb/material_preferences_library/R$attr;->dialogPreferenceStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 85
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 79
    invoke-direct {p0, p1, p2, p3}, Lcom/lb/material_preferences_library/custom_preferences/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 80
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 74
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lb/material_preferences_library/custom_preferences/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 75
    return-void
.end method

.method private requestInputMethod(Landroid/app/Dialog;)V
    .registers 4
    .param p1, "dialog"    # Landroid/app/Dialog;

    .prologue
    .line 374
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 375
    .local v0, "window":Landroid/view/Window;
    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 376
    return-void
.end method


# virtual methods
.method public getDialog()Landroid/app/Dialog;
    .registers 2

    .prologue
    .line 461
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialog:Landroid/app/Dialog;

    return-object v0
.end method

.method public getDialogIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 194
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogIcon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getDialogLayoutResource()I
    .registers 2

    .prologue
    .line 278
    iget v0, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogLayoutResId:I

    return v0
.end method

.method public getDialogMessage()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 165
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogMessage:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getDialogTitle()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogTitle:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getNegativeButtonText()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 258
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mNegativeButtonText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getPositiveButtonText()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 227
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mPositiveButtonText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 95
    invoke-super {p0, p1, p2, p3, p4}, Lcom/lb/material_preferences_library/custom_preferences/Preference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 96
    sget-object v1, Lcom/lb/material_preferences_library/R$styleable;->DialogPreference:[I

    invoke-virtual {p1, p2, v1, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 98
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Lcom/lb/material_preferences_library/R$styleable;->DialogPreference_dialogTitle:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogTitle:Ljava/lang/CharSequence;

    .line 99
    iget-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogTitle:Ljava/lang/CharSequence;

    if-nez v1, :cond_1b

    .line 103
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogTitle:Ljava/lang/CharSequence;

    .line 106
    :cond_1b
    sget v1, Lcom/lb/material_preferences_library/R$styleable;->DialogPreference_dialogMessage:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogMessage:Ljava/lang/CharSequence;

    .line 107
    sget v1, Lcom/lb/material_preferences_library/R$styleable;->DialogPreference_dialogIcon:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogIcon:Landroid/graphics/drawable/Drawable;

    .line 108
    sget v1, Lcom/lb/material_preferences_library/R$styleable;->DialogPreference_positiveButtonText:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mPositiveButtonText:Ljava/lang/CharSequence;

    .line 109
    sget v1, Lcom/lb/material_preferences_library/R$styleable;->DialogPreference_negativeButtonText:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mNegativeButtonText:Ljava/lang/CharSequence;

    .line 110
    sget v1, Lcom/lb/material_preferences_library/R$styleable;->DialogPreference_dialogLayout:I

    iget v2, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogLayoutResId:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogLayoutResId:I

    .line 111
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 112
    return-void
.end method

.method protected needInputMethod()Z
    .registers 2

    .prologue
    .line 366
    const/4 v0, 0x0

    return v0
.end method

.method public onActivityDestroy()V
    .registers 2

    .prologue
    .line 470
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_d

    .line 476
    :cond_c
    :goto_c
    return-void

    .line 475
    :cond_d
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    goto :goto_c
.end method

.method protected onBindDialogView(Landroid/view/View;)V
    .registers 6
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 406
    const v3, 0x102000b

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 408
    .local v0, "dialogMessageView":Landroid/view/View;
    if-eqz v0, :cond_29

    .line 410
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->getDialogMessage()Ljava/lang/CharSequence;

    move-result-object v1

    .line 411
    .local v1, "message":Ljava/lang/CharSequence;
    const/16 v2, 0x8

    .line 413
    .local v2, "newVisibility":I
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_20

    .line 415
    instance-of v3, v0, Landroid/widget/TextView;

    if-eqz v3, :cond_1f

    move-object v3, v0

    .line 417
    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 420
    :cond_1f
    const/4 v2, 0x0

    .line 423
    :cond_20
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-eq v3, v2, :cond_29

    .line 425
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 428
    .end local v1    # "message":Ljava/lang/CharSequence;
    .end local v2    # "newVisibility":I
    :cond_29
    return-void
.end method

.method protected onClick()V
    .registers 2

    .prologue
    .line 307
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 310
    :goto_c
    return-void

    .line 309
    :cond_d
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->showDialog(Landroid/os/Bundle;)V

    goto :goto_c
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 432
    iput p2, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mWhichButtonClicked:I

    .line 433
    return-void
.end method

.method protected onCreateDialogView()Landroid/view/View;
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 388
    iget v2, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogLayoutResId:I

    if-nez v2, :cond_6

    .line 394
    :goto_5
    return-object v1

    .line 393
    :cond_6
    iget-object v2, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mBuilder:Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {v2}, Landroid/support/v7/app/AlertDialog$Builder;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 394
    .local v0, "inflater":Landroid/view/LayoutInflater;
    iget v2, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogLayoutResId:I

    invoke-virtual {v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    goto :goto_5
.end method

.method protected onDialogClosed(Z)V
    .registers 2
    .param p1, "positiveResult"    # Z

    .prologue
    .line 452
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 437
    invoke-static {}, Lcom/lb/material_preferences_library/custom_preferences/PreferenceManagerEx;->getInstance()Lcom/lb/material_preferences_library/custom_preferences/PreferenceManagerEx;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Lcom/lb/material_preferences_library/custom_preferences/PreferenceManagerEx;->unregisterOnActivityDestroyListener(Landroid/preference/PreferenceManager;Landroid/preference/PreferenceManager$OnActivityDestroyListener;)V

    .line 439
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialog:Landroid/app/Dialog;

    .line 440
    iget v0, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mWhichButtonClicked:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_18

    const/4 v0, 0x1

    :goto_14
    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->onDialogClosed(Z)V

    .line 441
    return-void

    .line 440
    :cond_18
    const/4 v0, 0x0

    goto :goto_14
.end method

.method protected onPrepareDialogBuilder(Landroid/support/v7/app/AlertDialog$Builder;)V
    .registers 2
    .param p1, "builder"    # Landroid/support/v7/app/AlertDialog$Builder;

    .prologue
    .line 302
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 496
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 499
    :cond_e
    invoke-super {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/Preference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 509
    :cond_11
    :goto_11
    return-void

    :cond_12
    move-object v0, p1

    .line 503
    check-cast v0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState;

    .line 504
    .local v0, "myState":Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState;
    invoke-virtual {v0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/Preference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 505
    iget-boolean v1, v0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState;->isDialogShowing:Z

    if-eqz v1, :cond_11

    .line 507
    iget-object v1, v0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState;->dialogBundle:Landroid/os/Bundle;

    invoke-virtual {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->showDialog(Landroid/os/Bundle;)V

    goto :goto_11
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 481
    invoke-super {p0}, Lcom/lb/material_preferences_library/custom_preferences/Preference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 482
    .local v1, "superState":Landroid/os/Parcelable;
    iget-object v2, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialog:Landroid/app/Dialog;

    if-eqz v2, :cond_10

    iget-object v2, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->isShowing()Z

    move-result v2

    if-nez v2, :cond_12

    :cond_10
    move-object v0, v1

    .line 490
    :goto_11
    return-object v0

    .line 487
    :cond_12
    new-instance v0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState;

    invoke-direct {v0, v1}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 488
    .local v0, "myState":Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState;
    const/4 v2, 0x1

    iput-boolean v2, v0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState;->isDialogShowing:Z

    .line 489
    iget-object v2, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v2

    iput-object v2, v0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState;->dialogBundle:Landroid/os/Bundle;

    goto :goto_11
.end method

.method public setDialogIcon(I)V
    .registers 4
    .param p1, "dialogIconRes"    # I

    .prologue
    .line 205
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/support/v4/content/res/ResourcesCompat;->getDrawable(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogIcon:Landroid/graphics/drawable/Drawable;

    .line 206
    return-void
.end method

.method public setDialogIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "dialogIcon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 184
    iput-object p1, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogIcon:Landroid/graphics/drawable/Drawable;

    .line 185
    return-void
.end method

.method public setDialogLayoutResource(I)V
    .registers 2
    .param p1, "dialogLayoutResId"    # I

    .prologue
    .line 290
    iput p1, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogLayoutResId:I

    .line 291
    return-void
.end method

.method public setDialogMessage(I)V
    .registers 3
    .param p1, "dialogMessageResId"    # I

    .prologue
    .line 174
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->setDialogMessage(Ljava/lang/CharSequence;)V

    .line 175
    return-void
.end method

.method public setDialogMessage(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "dialogMessage"    # Ljava/lang/CharSequence;

    .prologue
    .line 155
    iput-object p1, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogMessage:Ljava/lang/CharSequence;

    .line 156
    return-void
.end method

.method public setDialogTitle(I)V
    .registers 3
    .param p1, "dialogTitleResId"    # I

    .prologue
    .line 140
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->setDialogTitle(Ljava/lang/CharSequence;)V

    .line 141
    return-void
.end method

.method public setDialogTitle(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "dialogTitle"    # Ljava/lang/CharSequence;

    .prologue
    .line 121
    iput-object p1, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogTitle:Ljava/lang/CharSequence;

    .line 122
    return-void
.end method

.method public setNegativeButtonText(I)V
    .registers 3
    .param p1, "negativeButtonTextResId"    # I

    .prologue
    .line 267
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->setNegativeButtonText(Ljava/lang/CharSequence;)V

    .line 268
    return-void
.end method

.method public setNegativeButtonText(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "negativeButtonText"    # Ljava/lang/CharSequence;

    .prologue
    .line 247
    iput-object p1, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mNegativeButtonText:Ljava/lang/CharSequence;

    .line 248
    return-void
.end method

.method public setPositiveButtonText(I)V
    .registers 3
    .param p1, "positiveButtonTextResId"    # I

    .prologue
    .line 236
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->setPositiveButtonText(Ljava/lang/CharSequence;)V

    .line 237
    return-void
.end method

.method public setPositiveButtonText(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "positiveButtonText"    # Ljava/lang/CharSequence;

    .prologue
    .line 216
    iput-object p1, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mPositiveButtonText:Ljava/lang/CharSequence;

    .line 217
    return-void
.end method

.method protected showDialog(Landroid/os/Bundle;)V
    .registers 7
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 321
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 323
    .local v1, "context":Landroid/content/Context;
    const/4 v3, -0x2

    iput v3, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mWhichButtonClicked:I

    .line 324
    new-instance v3, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-direct {v3, v1}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v4, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogTitle:Ljava/lang/CharSequence;

    invoke-virtual {v3, v4}, Landroid/support/v7/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, v4}, Landroid/support/v7/app/AlertDialog$Builder;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mPositiveButtonText:Ljava/lang/CharSequence;

    invoke-virtual {v3, v4, p0}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mNegativeButtonText:Ljava/lang/CharSequence;

    invoke-virtual {v3, v4, p0}, Landroid/support/v7/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v3

    iput-object v3, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mBuilder:Landroid/support/v7/app/AlertDialog$Builder;

    .line 329
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->onCreateDialogView()Landroid/view/View;

    move-result-object v0

    .line 330
    .local v0, "contentView":Landroid/view/View;
    if-eqz v0, :cond_61

    .line 332
    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->onBindDialogView(Landroid/view/View;)V

    .line 333
    iget-object v3, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mBuilder:Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {v3, v0}, Landroid/support/v7/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 340
    :goto_34
    iget-object v3, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mBuilder:Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {p0, v3}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->onPrepareDialogBuilder(Landroid/support/v7/app/AlertDialog$Builder;)V

    .line 341
    invoke-static {}, Lcom/lb/material_preferences_library/custom_preferences/PreferenceManagerEx;->getInstance()Lcom/lb/material_preferences_library/custom_preferences/PreferenceManagerEx;

    move-result-object v3

    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v4

    invoke-virtual {v3, v4, p0}, Lcom/lb/material_preferences_library/custom_preferences/PreferenceManagerEx;->registerOnActivityDestroyListener(Landroid/preference/PreferenceManager;Landroid/preference/PreferenceManager$OnActivityDestroyListener;)V

    .line 344
    iget-object v3, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mBuilder:Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {v3}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v2

    iput-object v2, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialog:Landroid/app/Dialog;

    .line 345
    .local v2, "dialog":Landroid/app/Dialog;
    if-eqz p1, :cond_51

    .line 347
    invoke-virtual {v2, p1}, Landroid/app/Dialog;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 349
    :cond_51
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->needInputMethod()Z

    move-result v3

    if-eqz v3, :cond_5a

    .line 351
    invoke-direct {p0, v2}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->requestInputMethod(Landroid/app/Dialog;)V

    .line 353
    :cond_5a
    invoke-virtual {v2, p0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 354
    invoke-virtual {v2}, Landroid/app/Dialog;->show()V

    .line 355
    return-void

    .line 337
    .end local v2    # "dialog":Landroid/app/Dialog;
    :cond_61
    iget-object v3, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mBuilder:Landroid/support/v7/app/AlertDialog$Builder;

    iget-object v4, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;->mDialogMessage:Ljava/lang/CharSequence;

    invoke-virtual {v3, v4}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    goto :goto_34
.end method
