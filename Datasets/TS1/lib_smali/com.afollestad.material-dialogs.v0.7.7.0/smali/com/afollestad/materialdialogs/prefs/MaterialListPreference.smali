.class public Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;
.super Landroid/preference/ListPreference;
.source "MaterialListPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;)V

    .line 31
    invoke-direct {p0, p1}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->init(Landroid/content/Context;)V

    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 35
    invoke-direct {p0, p1, p2}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 36
    invoke-direct {p0, p1}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->init(Landroid/content/Context;)V

    .line 37
    return-void
.end method

.method private init(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->context:Landroid/content/Context;

    .line 41
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-gt v0, v1, :cond_c

    .line 42
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->setWidgetLayoutResource(I)V

    .line 43
    :cond_c
    return-void
.end method


# virtual methods
.method public getDialog()Landroid/app/Dialog;
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    return-object v0
.end method

.method public onActivityDestroy()V
    .registers 2

    .prologue
    .line 146
    invoke-super {p0}, Landroid/preference/ListPreference;->onActivityDestroy()V

    .line 147
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 148
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    .line 149
    :cond_14
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 9
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 132
    invoke-super {p0, p1}, Landroid/preference/ListPreference;->onDismiss(Landroid/content/DialogInterface;)V

    .line 134
    :try_start_3
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v1

    .line 135
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

    .line 138
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 139
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_26} :catch_27

    .line 142
    .end local v0    # "method":Ljava/lang/reflect/Method;
    .end local v1    # "pm":Landroid/preference/PreferenceManager;
    :goto_26
    return-void

    .line 140
    :catch_27
    move-exception v2

    goto :goto_26
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 167
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 169
    :cond_e
    invoke-super {p0, p1}, Landroid/preference/ListPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 178
    :cond_11
    :goto_11
    return-void

    :cond_12
    move-object v0, p1

    .line 173
    check-cast v0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;

    .line 174
    .local v0, "myState":Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;
    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/preference/ListPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 175
    iget-boolean v1, v0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;->isDialogShowing:Z

    if-eqz v1, :cond_11

    .line 176
    iget-object v1, v0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;->dialogBundle:Landroid/os/Bundle;

    invoke-virtual {p0, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->showDialog(Landroid/os/Bundle;)V

    goto :goto_11
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 5

    .prologue
    .line 153
    invoke-super {p0}, Landroid/preference/ListPreference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v2

    .line 154
    .local v2, "superState":Landroid/os/Parcelable;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 155
    .local v0, "dialog":Landroid/app/Dialog;
    if-eqz v0, :cond_10

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v3

    if-nez v3, :cond_12

    :cond_10
    move-object v1, v2

    .line 162
    :goto_11
    return-object v1

    .line 159
    :cond_12
    new-instance v1, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;

    invoke-direct {v1, v2}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 160
    .local v1, "myState":Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;
    const/4 v3, 0x1

    iput-boolean v3, v1, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;->isDialogShowing:Z

    .line 161
    invoke-virtual {v0}, Landroid/app/Dialog;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v3

    iput-object v3, v1, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;->dialogBundle:Landroid/os/Bundle;

    goto :goto_11
.end method

.method public setEntries([Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "entries"    # [Ljava/lang/CharSequence;

    .prologue
    .line 47
    invoke-super {p0, p1}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 48
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    if-eqz v0, :cond_c

    .line 49
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0, p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setItems([Ljava/lang/CharSequence;)V

    .line 50
    :cond_c
    return-void
.end method

.method protected showDialog(Landroid/os/Bundle;)V
    .registers 12
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 59
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v5

    if-eqz v5, :cond_e

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v5

    if-nez v5, :cond_16

    .line 60
    :cond_e
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "ListPreference requires an entries array and an entryValues array."

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 64
    :cond_16
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v4

    .line 65
    .local v4, "preselect":I
    new-instance v5, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v6, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->context:Landroid/content/Context;

    invoke-direct {v5, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getDialogTitle()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->title(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getDialogMessage()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->content(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getDialogIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->icon(Landroid/graphics/drawable/Drawable;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v5

    invoke-virtual {v5, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v5

    new-instance v6, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$2;

    invoke-direct {v6, p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$2;-><init>(Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;)V

    invoke-virtual {v5, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback(Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getNegativeButtonText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items([Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v5

    invoke-virtual {v5, v7}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss(Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v5

    new-instance v6, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$1;

    invoke-direct {v6, p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$1;-><init>(Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;)V

    invoke-virtual {v5, v4, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsCallbackSingleChoice(ILcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    .line 106
    .local v0, "builder":Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->onCreateDialogView()Landroid/view/View;

    move-result-object v1

    .line 107
    .local v1, "contentView":Landroid/view/View;
    if-eqz v1, :cond_a9

    .line 108
    invoke-virtual {p0, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->onBindDialogView(Landroid/view/View;)V

    .line 109
    invoke-virtual {v0, v1, v8}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView(Landroid/view/View;Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 115
    :goto_73
    :try_start_73
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v3

    .line 116
    .local v3, "pm":Landroid/preference/PreferenceManager;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v6, "registerOnActivityDestroyListener"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v8, 0x0

    const-class v9, Landroid/preference/PreferenceManager$OnActivityDestroyListener;

    aput-object v9, v7, v8

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 119
    .local v2, "method":Ljava/lang/reflect/Method;
    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 120
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p0, v5, v6

    invoke-virtual {v2, v3, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_96
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_96} :catch_b1

    .line 124
    .end local v2    # "method":Ljava/lang/reflect/Method;
    .end local v3    # "pm":Landroid/preference/PreferenceManager;
    :goto_96
    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->build()Lcom/afollestad/materialdialogs/MaterialDialog;

    move-result-object v5

    iput-object v5, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 125
    if-eqz p1, :cond_a3

    .line 126
    iget-object v5, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v5, p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 127
    :cond_a3
    iget-object v5, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v5}, Lcom/afollestad/materialdialogs/MaterialDialog;->show()V

    .line 128
    return-void

    .line 111
    :cond_a9
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getDialogMessage()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->content(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    goto :goto_73

    .line 121
    :catch_b1
    move-exception v5

    goto :goto_96
.end method
