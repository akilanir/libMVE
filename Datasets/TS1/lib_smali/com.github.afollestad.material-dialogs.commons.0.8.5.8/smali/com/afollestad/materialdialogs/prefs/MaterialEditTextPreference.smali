.class public Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;
.super Landroid/preference/EditTextPreference;
.source "MaterialEditTextPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$2;,
        Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;
    }
.end annotation


# instance fields
.field private mColor:I

.field private mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

.field private mEditText:Landroid/widget/EditText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Landroid/preference/EditTextPreference;-><init>(Landroid/content/Context;)V

    .line 41
    const/4 v0, 0x0

    iput v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mColor:I

    .line 47
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 51
    invoke-direct {p0, p1, p2}, Landroid/preference/EditTextPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 41
    const/4 v0, 0x0

    iput v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mColor:I

    .line 52
    invoke-direct {p0, p1, p2}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 53
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 57
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/EditTextPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 41
    const/4 v0, 0x0

    iput v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mColor:I

    .line 58
    invoke-direct {p0, p1, p2}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 63
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/preference/EditTextPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 41
    const/4 v0, 0x0

    iput v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mColor:I

    .line 64
    invoke-direct {p0, p1, p2}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 65
    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 69
    invoke-static {p1, p0, p2}, Lcom/afollestad/materialdialogs/prefs/PrefUtil;->setLayoutResource(Landroid/content/Context;Landroid/preference/Preference;Landroid/util/AttributeSet;)V

    .line 71
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_34

    .line 72
    const v1, 0x1010435

    invoke-static {p1, v1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v0

    .line 74
    .local v0, "fallback":I
    :goto_10
    sget v1, Lcom/afollestad/materialdialogs/commons/R$attr;->colorAccent:I

    invoke-static {p1, v1, v0}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;II)I

    move-result v0

    .line 75
    sget v1, Lcom/afollestad/materialdialogs/commons/R$attr;->md_widget_color:I

    invoke-static {p1, v1, v0}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;II)I

    move-result v1

    iput v1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mColor:I

    .line 77
    new-instance v1, Landroid/support/v7/widget/AppCompatEditText;

    invoke-direct {v1, p1, p2}, Landroid/support/v7/widget/AppCompatEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mEditText:Landroid/widget/EditText;

    .line 79
    iget-object v1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mEditText:Landroid/widget/EditText;

    const v2, 0x1020003

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setId(I)V

    .line 80
    iget-object v1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mEditText:Landroid/widget/EditText;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 81
    return-void

    .line 73
    .end local v0    # "fallback":I
    :cond_34
    const/4 v0, 0x0

    .restart local v0    # "fallback":I
    goto :goto_10
.end method

.method private requestInputMethod(Landroid/app/Dialog;)V
    .registers 4
    .param p1, "dialog"    # Landroid/app/Dialog;

    .prologue
    .line 185
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 186
    .local v0, "window":Landroid/view/Window;
    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 187
    return-void
.end method


# virtual methods
.method public getDialog()Landroid/app/Dialog;
    .registers 2

    .prologue
    .line 121
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    return-object v0
.end method

.method public getEditText()Landroid/widget/EditText;
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method public onActivityDestroy()V
    .registers 2

    .prologue
    .line 191
    invoke-super {p0}, Landroid/preference/EditTextPreference;->onActivityDestroy()V

    .line 192
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 193
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    .line 194
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
    .line 85
    check-cast p1, Landroid/view/ViewGroup;

    .end local p1    # "dialogView":Landroid/view/View;
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 87
    return-void
.end method

.method protected onBindDialogView(Landroid/view/View;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingSuperCall"
        }
    .end annotation

    .prologue
    .line 92
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mEditText:Landroid/widget/EditText;

    .line 93
    .local v0, "editText":Landroid/widget/EditText;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 95
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->length()I

    move-result v2

    if-lez v2, :cond_1a

    .line 96
    invoke-virtual {v0}, Landroid/widget/EditText;->length()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setSelection(I)V

    .line 97
    :cond_1a
    invoke-virtual {v0}, Landroid/widget/EditText;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 98
    .local v1, "oldParent":Landroid/view/ViewParent;
    if-eq v1, p1, :cond_2a

    .line 99
    if-eqz v1, :cond_27

    .line 100
    check-cast v1, Landroid/view/ViewGroup;

    .end local v1    # "oldParent":Landroid/view/ViewParent;
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 101
    :cond_27
    invoke-virtual {p0, p1, v0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->onAddEditTextToDialogView(Landroid/view/View;Landroid/widget/EditText;)V

    .line 103
    :cond_2a
    return-void
.end method

.method protected onDialogClosed(Z)V
    .registers 4
    .param p1, "positiveResult"    # Z

    .prologue
    .line 107
    if-eqz p1, :cond_15

    .line 108
    iget-object v1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 109
    .local v0, "value":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 110
    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->setText(Ljava/lang/String;)V

    .line 112
    .end local v0    # "value":Ljava/lang/String;
    :cond_15
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 177
    invoke-super {p0, p1}, Landroid/preference/EditTextPreference;->onDismiss(Landroid/content/DialogInterface;)V

    .line 178
    invoke-static {p0, p0}, Lcom/afollestad/materialdialogs/prefs/PrefUtil;->unregisterOnActivityDestroyListener(Landroid/preference/Preference;Landroid/preference/PreferenceManager$OnActivityDestroyListener;)V

    .line 179
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 212
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 214
    :cond_e
    invoke-super {p0, p1}, Landroid/preference/EditTextPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 223
    :cond_11
    :goto_11
    return-void

    :cond_12
    move-object v0, p1

    .line 218
    check-cast v0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;

    .line 219
    .local v0, "myState":Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;
    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/preference/EditTextPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 220
    iget-boolean v1, v0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;->isDialogShowing:Z

    if-eqz v1, :cond_11

    .line 221
    iget-object v1, v0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;->dialogBundle:Landroid/os/Bundle;

    invoke-virtual {p0, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->showDialog(Landroid/os/Bundle;)V

    goto :goto_11
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 5

    .prologue
    .line 198
    invoke-super {p0}, Landroid/preference/EditTextPreference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v2

    .line 199
    .local v2, "superState":Landroid/os/Parcelable;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 200
    .local v0, "dialog":Landroid/app/Dialog;
    if-eqz v0, :cond_10

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v3

    if-nez v3, :cond_12

    :cond_10
    move-object v1, v2

    .line 207
    :goto_11
    return-object v1

    .line 204
    :cond_12
    new-instance v1, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;

    invoke-direct {v1, v2}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 205
    .local v1, "myState":Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;
    const/4 v3, 0x1

    iput-boolean v3, v1, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;->isDialogShowing:Z

    .line 206
    invoke-virtual {v0}, Landroid/app/Dialog;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v3

    iput-object v3, v1, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState;->dialogBundle:Landroid/os/Bundle;

    goto :goto_11
.end method

.method protected showDialog(Landroid/os/Bundle;)V
    .registers 9
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    const/4 v6, 0x0

    .line 126
    new-instance v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getDialogTitle()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->title(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getDialogIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->icon(Landroid/graphics/drawable/Drawable;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getPositiveButtonText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getNegativeButtonText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v3

    new-instance v4, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$1;

    invoke-direct {v4, p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$1;-><init>(Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;)V

    invoke-virtual {v3, v4}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onAny(Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v1

    .line 151
    .local v1, "mBuilder":Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    sget v4, Lcom/afollestad/materialdialogs/commons/R$layout;->md_stub_inputpref:I

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 152
    .local v0, "layout":Landroid/view/View;
    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->onBindDialogView(Landroid/view/View;)V

    .line 154
    iget-object v3, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mEditText:Landroid/widget/EditText;

    iget v4, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mColor:I

    invoke-static {v3, v4}, Lcom/afollestad/materialdialogs/internal/MDTintHelper;->setTint(Landroid/widget/EditText;I)V

    .line 156
    const v3, 0x102000b

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 157
    .local v2, "message":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getDialogMessage()Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_99

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getDialogMessage()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_99

    .line 158
    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 159
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->getDialogMessage()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    :goto_7b
    invoke-virtual {v1, v0, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView(Landroid/view/View;Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 165
    invoke-static {p0, p0}, Lcom/afollestad/materialdialogs/prefs/PrefUtil;->registerOnActivityDestroyListener(Landroid/preference/Preference;Landroid/preference/PreferenceManager$OnActivityDestroyListener;)V

    .line 167
    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->build()Lcom/afollestad/materialdialogs/MaterialDialog;

    move-result-object v3

    iput-object v3, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 168
    if-eqz p1, :cond_8e

    .line 169
    iget-object v3, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v3, p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 170
    :cond_8e
    iget-object v3, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-direct {p0, v3}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->requestInputMethod(Landroid/app/Dialog;)V

    .line 172
    iget-object v3, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v3}, Lcom/afollestad/materialdialogs/MaterialDialog;->show()V

    .line 173
    return-void

    .line 161
    :cond_99
    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_7b
.end method
