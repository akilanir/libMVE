.class public Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;
.super Landroid/preference/EditTextPreference;
.source "MaterialEditTextPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;
    }
.end annotation


# instance fields
.field private final callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

.field private mColor:I

.field private mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

.field private mEditText:Landroid/widget/EditText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 44
    invoke-direct {p0, p1, p2}, Landroid/preference/EditTextPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 39
    const/4 v1, 0x0

    iput v1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mColor:I

    .line 162
    new-instance v1, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$1;

    invoke-direct {v1, p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$1;-><init>(Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;)V

    iput-object v1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    .line 46
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_38

    .line 47
    const v1, 0x1010435

    invoke-static {p1, v1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v0

    .line 49
    .local v0, "fallback":I
    :goto_1a
    sget v1, Lcom/afollestad/materialdialogs/R$attr;->colorAccent:I

    invoke-static {p1, v1, v0}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;II)I

    move-result v1

    iput v1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mColor:I

    .line 51
    new-instance v1, Landroid/support/v7/widget/AppCompatEditText;

    invoke-direct {v1, p1, p2}, Landroid/support/v7/widget/AppCompatEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mEditText:Landroid/widget/EditText;

    .line 53
    iget-object v1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mEditText:Landroid/widget/EditText;

    const v2, 0x1020003

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setId(I)V

    .line 54
    iget-object v1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mEditText:Landroid/widget/EditText;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 55
    return-void

    .line 48
    .end local v0    # "fallback":I
    :cond_38
    const/4 v0, 0x0

    .restart local v0    # "fallback":I
    goto :goto_1a
.end method

.method static synthetic access$000(Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;)Landroid/widget/EditText;
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$100(Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;Ljava/lang/Object;)Z
    .registers 3
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 37
    invoke-virtual {p0, p1}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private requestInputMethod(Landroid/app/Dialog;)V
    .registers 4
    .param p1, "dialog"    # Landroid/app/Dialog;

    .prologue
    .line 186
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 187
    .local v0, "window":Landroid/view/Window;
    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 188
    return-void
.end method


# virtual methods
.method public getDialog()Landroid/app/Dialog;
    .registers 2

    .prologue
    .line 98
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    return-object v0
.end method

.method public getEditText()Landroid/widget/EditText;
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method public onActivityDestroy()V
    .registers 2

    .prologue
    .line 192
    invoke-super {p0}, Landroid/preference/EditTextPreference;->onActivityDestroy()V

    .line 193
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 194
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    .line 195
    :cond_14
    return-void
.end method

.method protected onAddEditTextToDialogView(Landroid/view/View;Landroid/widget/EditText;)V
    .registers 6
    .param p1, "dialogView"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "editText"    # Landroid/widget/EditText;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 63
    check-cast p1, Landroid/view/ViewGroup;

    .end local p1    # "dialogView":Landroid/view/View;
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 65
    return-void
.end method

.method protected onBindDialogView(Landroid/view/View;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 69
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mEditText:Landroid/widget/EditText;

    .line 70
    .local v0, "editText":Landroid/widget/EditText;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 72
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->length()I

    move-result v2

    if-lez v2, :cond_1a

    .line 73
    invoke-virtual {v0}, Landroid/widget/EditText;->length()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setSelection(I)V

    .line 74
    :cond_1a
    invoke-virtual {v0}, Landroid/widget/EditText;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 75
    .local v1, "oldParent":Landroid/view/ViewParent;
    if-eq v1, p1, :cond_2a

    .line 76
    if-eqz v1, :cond_27

    .line 77
    check-cast v1, Landroid/view/ViewGroup;

    .end local v1    # "oldParent":Landroid/view/ViewParent;
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 78
    :cond_27
    invoke-virtual {p0, p1, v0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->onAddEditTextToDialogView(Landroid/view/View;Landroid/widget/EditText;)V

    .line 80
    :cond_2a
    return-void
.end method

.method protected onDialogClosed(Z)V
    .registers 4
    .param p1, "positiveResult"    # Z

    .prologue
    .line 84
    if-eqz p1, :cond_15

    .line 85
    iget-object v1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 86
    .local v0, "value":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 87
    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->setText(Ljava/lang/String;)V

    .line 89
    .end local v0    # "value":Ljava/lang/String;
    :cond_15
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 9
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 146
    invoke-super {p0, p1}, Landroid/preference/EditTextPreference;->onDismiss(Landroid/content/DialogInterface;)V

    .line 148
    :try_start_3
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v1

    .line 149
    .local v1, "pm":Landroid/preference/PreferenceManager;
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "unregisterOnActivityDestroyListener"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/preference/PreferenceManager$OnActivityDestroyListener;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 152
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 153
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_26} :catch_27

    .line 156
    .end local v0    # "method":Ljava/lang/reflect/Method;
    .end local v1    # "pm":Landroid/preference/PreferenceManager;
    :goto_26
    return-void

    .line 154
    :catch_27
    move-exception v2

    goto :goto_26
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 213
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 215
    :cond_e
    invoke-super {p0, p1}, Landroid/preference/EditTextPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 224
    :cond_11
    :goto_11
    return-void

    :cond_12
    move-object v0, p1

    .line 219
    check-cast v0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;

    .line 220
    .local v0, "myState":Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;
    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/preference/EditTextPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 221
    iget-boolean v1, v0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;->isDialogShowing:Z

    if-eqz v1, :cond_11

    .line 222
    iget-object v1, v0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;->dialogBundle:Landroid/os/Bundle;

    invoke-virtual {p0, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->showDialog(Landroid/os/Bundle;)V

    goto :goto_11
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 5

    .prologue
    .line 199
    invoke-super {p0}, Landroid/preference/EditTextPreference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v2

    .line 200
    .local v2, "superState":Landroid/os/Parcelable;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 201
    .local v0, "dialog":Landroid/app/Dialog;
    if-eqz v0, :cond_10

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v3

    if-nez v3, :cond_12

    :cond_10
    move-object v1, v2

    .line 208
    :goto_11
    return-object v1

    .line 205
    :cond_12
    new-instance v1, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;

    invoke-direct {v1, v2}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 206
    .local v1, "myState":Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;
    const/4 v3, 0x1

    iput-boolean v3, v1, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;->isDialogShowing:Z

    .line 207
    invoke-virtual {v0}, Landroid/app/Dialog;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v3

    iput-object v3, v1, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;->dialogBundle:Landroid/os/Bundle;

    goto :goto_11
.end method

.method protected showDialog(Landroid/os/Bundle;)V
    .registers 12
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x0

    .line 103
    new-instance v5, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getDialogTitle()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->title(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getDialogIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->icon(Landroid/graphics/drawable/Drawable;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getPositiveButtonText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getNegativeButtonText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v5

    invoke-virtual {v5, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v5

    iget-object v6, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    invoke-virtual {v5, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback(Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v5

    invoke-virtual {v5, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v1

    .line 112
    .local v1, "mBuilder":Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    sget v6, Lcom/afollestad/materialdialogs/R$layout;->md_stub_inputpref:I

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 113
    .local v0, "layout":Landroid/view/View;
    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->onBindDialogView(Landroid/view/View;)V

    .line 115
    iget-object v5, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mEditText:Landroid/widget/EditText;

    iget v6, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mColor:I

    invoke-static {v5, v6}, Lcom/afollestad/materialdialogs/internal/MDTintHelper;->setTint(Landroid/widget/EditText;I)V

    .line 117
    const v5, 0x102000b

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 118
    .local v2, "message":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getDialogMessage()Ljava/lang/CharSequence;

    move-result-object v5

    if-eqz v5, :cond_b6

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getDialogMessage()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_b6

    .line 119
    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 120
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getDialogMessage()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    :goto_78
    invoke-virtual {v1, v0, v8}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView(Landroid/view/View;Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 127
    :try_start_7b
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v4

    .line 128
    .local v4, "pm":Landroid/preference/PreferenceManager;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v6, "registerOnActivityDestroyListener"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v8, 0x0

    const-class v9, Landroid/preference/PreferenceManager$OnActivityDestroyListener;

    aput-object v9, v7, v8

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 131
    .local v3, "method":Ljava/lang/reflect/Method;
    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 132
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p0, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_9e
    .catch Ljava/lang/Exception; {:try_start_7b .. :try_end_9e} :catch_bc

    .line 136
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v4    # "pm":Landroid/preference/PreferenceManager;
    :goto_9e
    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->build()Lcom/afollestad/materialdialogs/MaterialDialog;

    move-result-object v5

    iput-object v5, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 137
    if-eqz p1, :cond_ab

    .line 138
    iget-object v5, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v5, p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 139
    :cond_ab
    iget-object v5, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-direct {p0, v5}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->requestInputMethod(Landroid/app/Dialog;)V

    .line 141
    iget-object v5, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v5}, Lcom/afollestad/materialdialogs/MaterialDialog;->show()V

    .line 142
    return-void

    .line 122
    :cond_b6
    const/16 v5, 0x8

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_78

    .line 133
    :catch_bc
    move-exception v5

    goto :goto_9e
.end method
