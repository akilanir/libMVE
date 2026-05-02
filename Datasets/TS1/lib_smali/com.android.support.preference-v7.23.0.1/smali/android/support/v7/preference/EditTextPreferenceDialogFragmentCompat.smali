.class public Landroid/support/v7/preference/EditTextPreferenceDialogFragmentCompat;
.super Landroid/support/v7/preference/PreferenceDialogFragmentCompat;
.source "EditTextPreferenceDialogFragmentCompat.java"


# instance fields
.field private mEditText:Landroid/widget/EditText;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/support/v7/preference/PreferenceDialogFragmentCompat;-><init>()V

    return-void
.end method

.method private getEditTextPreference()Landroid/support/v7/preference/EditTextPreference;
    .registers 2

    .prologue
    .line 58
    invoke-virtual {p0}, Landroid/support/v7/preference/EditTextPreferenceDialogFragmentCompat;->getPreference()Landroid/support/v7/preference/DialogPreference;

    move-result-object v0

    check-cast v0, Landroid/support/v7/preference/EditTextPreference;

    return-object v0
.end method

.method public static newInstance(Ljava/lang/String;)Landroid/support/v7/preference/EditTextPreferenceDialogFragmentCompat;
    .registers 4
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 31
    new-instance v1, Landroid/support/v7/preference/EditTextPreferenceDialogFragmentCompat;

    invoke-direct {v1}, Landroid/support/v7/preference/EditTextPreferenceDialogFragmentCompat;-><init>()V

    .line 32
    .local v1, "fragment":Landroid/support/v7/preference/EditTextPreferenceDialogFragmentCompat;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x1

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 33
    .local v0, "b":Landroid/os/Bundle;
    const-string v2, "key"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    invoke-virtual {v1, v0}, Landroid/support/v7/preference/EditTextPreferenceDialogFragmentCompat;->setArguments(Landroid/os/Bundle;)V

    .line 35
    return-object v1
.end method


# virtual methods
.method protected needInputMethod()Z
    .registers 2

    .prologue
    .line 65
    const/4 v0, 0x1

    return v0
.end method

.method protected onAddEditTextToDialogView(Landroid/view/View;Landroid/widget/EditText;)V
    .registers 6
    .param p1, "dialogView"    # Landroid/view/View;
    .param p2, "editText"    # Landroid/widget/EditText;

    .prologue
    .line 74
    sget v1, Landroid/support/v7/preference/R$id;->edittext_container:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 76
    .local v0, "container":Landroid/view/ViewGroup;
    if-eqz v0, :cond_f

    .line 77
    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-virtual {v0, p2, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 80
    :cond_f
    return-void
.end method

.method protected onBindDialogView(Landroid/view/View;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 40
    invoke-super {p0, p1}, Landroid/support/v7/preference/PreferenceDialogFragmentCompat;->onBindDialogView(Landroid/view/View;)V

    .line 42
    new-instance v1, Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Landroid/support/v7/preference/EditTextPreferenceDialogFragmentCompat;->mEditText:Landroid/widget/EditText;

    .line 44
    iget-object v1, p0, Landroid/support/v7/preference/EditTextPreferenceDialogFragmentCompat;->mEditText:Landroid/widget/EditText;

    const v2, 0x1020003

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setId(I)V

    .line 46
    iget-object v1, p0, Landroid/support/v7/preference/EditTextPreferenceDialogFragmentCompat;->mEditText:Landroid/widget/EditText;

    invoke-direct {p0}, Landroid/support/v7/preference/EditTextPreferenceDialogFragmentCompat;->getEditTextPreference()Landroid/support/v7/preference/EditTextPreference;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v7/preference/EditTextPreference;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 48
    iget-object v1, p0, Landroid/support/v7/preference/EditTextPreferenceDialogFragmentCompat;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 49
    .local v0, "oldParent":Landroid/view/ViewParent;
    if-eq v0, p1, :cond_39

    .line 50
    if-eqz v0, :cond_34

    .line 51
    check-cast v0, Landroid/view/ViewGroup;

    .end local v0    # "oldParent":Landroid/view/ViewParent;
    iget-object v1, p0, Landroid/support/v7/preference/EditTextPreferenceDialogFragmentCompat;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 53
    :cond_34
    iget-object v1, p0, Landroid/support/v7/preference/EditTextPreferenceDialogFragmentCompat;->mEditText:Landroid/widget/EditText;

    invoke-virtual {p0, p1, v1}, Landroid/support/v7/preference/EditTextPreferenceDialogFragmentCompat;->onAddEditTextToDialogView(Landroid/view/View;Landroid/widget/EditText;)V

    .line 55
    :cond_39
    return-void
.end method

.method public onDialogClosed(Z)V
    .registers 4
    .param p1, "positiveResult"    # Z

    .prologue
    .line 85
    if-eqz p1, :cond_1d

    .line 86
    iget-object v1, p0, Landroid/support/v7/preference/EditTextPreferenceDialogFragmentCompat;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 87
    .local v0, "value":Ljava/lang/String;
    invoke-direct {p0}, Landroid/support/v7/preference/EditTextPreferenceDialogFragmentCompat;->getEditTextPreference()Landroid/support/v7/preference/EditTextPreference;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v7/preference/EditTextPreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 88
    invoke-direct {p0}, Landroid/support/v7/preference/EditTextPreferenceDialogFragmentCompat;->getEditTextPreference()Landroid/support/v7/preference/EditTextPreference;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v7/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 91
    .end local v0    # "value":Ljava/lang/String;
    :cond_1d
    return-void
.end method
