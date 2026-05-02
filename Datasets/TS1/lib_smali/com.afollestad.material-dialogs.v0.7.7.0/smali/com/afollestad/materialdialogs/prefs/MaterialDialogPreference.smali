.class public Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;
.super Landroid/preference/DialogPreference;
.source "MaterialDialogPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 31
    invoke-direct {p0, p1}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;)V

    .line 32
    invoke-direct {p0, p1}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->init(Landroid/content/Context;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    invoke-direct {p0, p1}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->init(Landroid/content/Context;)V

    .line 38
    return-void
.end method

.method private init(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->context:Landroid/content/Context;

    .line 42
    return-void
.end method


# virtual methods
.method public getDialog()Landroid/app/Dialog;
    .registers 2

    .prologue
    .line 46
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    return-object v0
.end method

.method public onActivityDestroy()V
    .registers 2

    .prologue
    .line 116
    invoke-super {p0}, Landroid/preference/DialogPreference;->onActivityDestroy()V

    .line 117
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 118
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    .line 119
    :cond_14
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 9
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 102
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onDismiss(Landroid/content/DialogInterface;)V

    .line 104
    :try_start_3
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v1

    .line 105
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

    .line 108
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 109
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_26} :catch_27

    .line 112
    .end local v0    # "method":Ljava/lang/reflect/Method;
    .end local v1    # "pm":Landroid/preference/PreferenceManager;
    :goto_26
    return-void

    .line 110
    :catch_27
    move-exception v2

    goto :goto_26
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 137
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 139
    :cond_e
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 148
    :cond_11
    :goto_11
    return-void

    :cond_12
    move-object v0, p1

    .line 143
    check-cast v0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;

    .line 144
    .local v0, "myState":Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;
    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/preference/DialogPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 145
    iget-boolean v1, v0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;->isDialogShowing:Z

    if-eqz v1, :cond_11

    .line 146
    iget-object v1, v0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;->dialogBundle:Landroid/os/Bundle;

    invoke-virtual {p0, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->showDialog(Landroid/os/Bundle;)V

    goto :goto_11
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 5

    .prologue
    .line 123
    invoke-super {p0}, Landroid/preference/DialogPreference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v2

    .line 124
    .local v2, "superState":Landroid/os/Parcelable;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 125
    .local v0, "dialog":Landroid/app/Dialog;
    if-eqz v0, :cond_10

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v3

    if-nez v3, :cond_12

    :cond_10
    move-object v1, v2

    .line 132
    :goto_11
    return-object v1

    .line 129
    :cond_12
    new-instance v1, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;

    invoke-direct {v1, v2}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 130
    .local v1, "myState":Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;
    const/4 v3, 0x1

    iput-boolean v3, v1, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;->isDialogShowing:Z

    .line 131
    invoke-virtual {v0}, Landroid/app/Dialog;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v3

    iput-object v3, v1, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState;->dialogBundle:Landroid/os/Bundle;

    goto :goto_11
.end method

.method protected showDialog(Landroid/os/Bundle;)V
    .registers 11
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 51
    new-instance v4, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v5, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->context:Landroid/content/Context;

    invoke-direct {v4, v5}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->getDialogTitle()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->title(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->getDialogMessage()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->content(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->getDialogIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->icon(Landroid/graphics/drawable/Drawable;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v4

    invoke-virtual {v4, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v4

    new-instance v5, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$1;

    invoke-direct {v5, p0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$1;-><init>(Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;)V

    invoke-virtual {v4, v5}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback(Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->getPositiveButtonText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->getNegativeButtonText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v4

    invoke-virtual {v4, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss(Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    .line 76
    .local v0, "builder":Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->onCreateDialogView()Landroid/view/View;

    move-result-object v1

    .line 77
    .local v1, "contentView":Landroid/view/View;
    if-eqz v1, :cond_84

    .line 78
    invoke-virtual {p0, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->onBindDialogView(Landroid/view/View;)V

    .line 79
    invoke-virtual {v0, v1, v7}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView(Landroid/view/View;Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 85
    :goto_4e
    :try_start_4e
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v3

    .line 86
    .local v3, "pm":Landroid/preference/PreferenceManager;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "registerOnActivityDestroyListener"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Landroid/preference/PreferenceManager$OnActivityDestroyListener;

    aput-object v8, v6, v7

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 89
    .local v2, "method":Ljava/lang/reflect/Method;
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 90
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p0, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_71
    .catch Ljava/lang/Exception; {:try_start_4e .. :try_end_71} :catch_8c

    .line 94
    .end local v2    # "method":Ljava/lang/reflect/Method;
    .end local v3    # "pm":Landroid/preference/PreferenceManager;
    :goto_71
    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->build()Lcom/afollestad/materialdialogs/MaterialDialog;

    move-result-object v4

    iput-object v4, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 95
    if-eqz p1, :cond_7e

    .line 96
    iget-object v4, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v4, p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 97
    :cond_7e
    iget-object v4, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v4}, Lcom/afollestad/materialdialogs/MaterialDialog;->show()V

    .line 98
    return-void

    .line 81
    :cond_84
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->getDialogMessage()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->content(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    goto :goto_4e

    .line 91
    :catch_8c
    move-exception v4

    goto :goto_71
.end method
