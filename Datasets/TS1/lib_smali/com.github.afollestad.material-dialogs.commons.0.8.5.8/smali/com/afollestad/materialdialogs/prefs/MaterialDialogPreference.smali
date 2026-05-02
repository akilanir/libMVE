.class public Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;
.super Landroid/preference/DialogPreference;
.source "MaterialDialogPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$2;,
        Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 29
    invoke-direct {p0, p1}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;)V

    .line 30
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
    invoke-direct {p0, p1, p2}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 39
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 40
    invoke-direct {p0, p1, p2}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 41
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
    .line 45
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 46
    invoke-direct {p0, p1, p2}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 47
    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->context:Landroid/content/Context;

    .line 52
    invoke-static {p1, p0, p2}, Lcom/afollestad/materialdialogs/prefs/PrefUtil;->setLayoutResource(Landroid/content/Context;Landroid/preference/Preference;Landroid/util/AttributeSet;)V

    .line 53
    return-void
.end method


# virtual methods
.method public getDialog()Landroid/app/Dialog;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    return-object v0
.end method

.method public onActivityDestroy()V
    .registers 2

    .prologue
    .line 110
    invoke-super {p0}, Landroid/preference/DialogPreference;->onActivityDestroy()V

    .line 111
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 112
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    .line 113
    :cond_14
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 104
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onDismiss(Landroid/content/DialogInterface;)V

    .line 105
    invoke-static {p0, p0}, Lcom/afollestad/materialdialogs/prefs/PrefUtil;->unregisterOnActivityDestroyListener(Landroid/preference/Preference;Landroid/preference/PreferenceManager$OnActivityDestroyListener;)V

    .line 106
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 131
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 133
    :cond_e
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 142
    :cond_11
    :goto_11
    return-void

    :cond_12
    move-object v0, p1

    .line 137
    check-cast v0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;

    .line 138
    .local v0, "myState":Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;
    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/preference/DialogPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 139
    iget-boolean v1, v0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;->isDialogShowing:Z

    if-eqz v1, :cond_11

    .line 140
    iget-object v1, v0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;->dialogBundle:Landroid/os/Bundle;

    invoke-virtual {p0, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->showDialog(Landroid/os/Bundle;)V

    goto :goto_11
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 5

    .prologue
    .line 117
    invoke-super {p0}, Landroid/preference/DialogPreference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v2

    .line 118
    .local v2, "superState":Landroid/os/Parcelable;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 119
    .local v0, "dialog":Landroid/app/Dialog;
    if-eqz v0, :cond_10

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v3

    if-nez v3, :cond_12

    :cond_10
    move-object v1, v2

    .line 126
    :goto_11
    return-object v1

    .line 123
    :cond_12
    new-instance v1, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;

    invoke-direct {v1, v2}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 124
    .local v1, "myState":Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;
    const/4 v3, 0x1

    iput-boolean v3, v1, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;->isDialogShowing:Z

    .line 125
    invoke-virtual {v0}, Landroid/app/Dialog;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v3

    iput-object v3, v1, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;->dialogBundle:Landroid/os/Bundle;

    goto :goto_11
.end method

.method protected showDialog(Landroid/os/Bundle;)V
    .registers 6
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 62
    new-instance v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v3, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->getDialogTitle()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->title(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->getDialogIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->icon(Landroid/graphics/drawable/Drawable;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$1;

    invoke-direct {v3, p0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$1;-><init>(Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;)V

    invoke-virtual {v2, v3}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onAny(Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->getPositiveButtonText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->getNegativeButtonText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss(Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    .line 86
    .local v0, "builder":Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->onCreateDialogView()Landroid/view/View;

    move-result-object v1

    .line 87
    .local v1, "contentView":Landroid/view/View;
    if-eqz v1, :cond_5c

    .line 88
    invoke-virtual {p0, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->onBindDialogView(Landroid/view/View;)V

    .line 89
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView(Landroid/view/View;Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 94
    :goto_46
    invoke-static {p0, p0}, Lcom/afollestad/materialdialogs/prefs/PrefUtil;->registerOnActivityDestroyListener(Landroid/preference/Preference;Landroid/preference/PreferenceManager$OnActivityDestroyListener;)V

    .line 96
    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->build()Lcom/afollestad/materialdialogs/MaterialDialog;

    move-result-object v2

    iput-object v2, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 97
    if-eqz p1, :cond_56

    .line 98
    iget-object v2, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v2, p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 99
    :cond_56
    iget-object v2, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v2}, Lcom/afollestad/materialdialogs/MaterialDialog;->show()V

    .line 100
    return-void

    .line 91
    :cond_5c
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->getDialogMessage()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->content(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    goto :goto_46
.end method
