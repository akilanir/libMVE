.class public Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;
.super Landroid/preference/ListPreference;
.source "MaterialListPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$3;,
        Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;)V

    .line 36
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 41
    invoke-direct {p0, p1, p2}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 46
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 47
    invoke-direct {p0, p1, p2}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 48
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
    .line 52
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 53
    invoke-direct {p0, p1, p2}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 54
    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->context:Landroid/content/Context;

    .line 58
    invoke-static {p1, p0, p2}, Lcom/afollestad/materialdialogs/prefs/PrefUtil;->setLayoutResource(Landroid/content/Context;Landroid/preference/Preference;Landroid/util/AttributeSet;)V

    .line 59
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-gt v0, v1, :cond_f

    .line 60
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->setWidgetLayoutResource(I)V

    .line 61
    :cond_f
    return-void
.end method


# virtual methods
.method public getDialog()Landroid/app/Dialog;
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    return-object v0
.end method

.method public getListView()Landroid/widget/ListView;
    .registers 2

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    .line 77
    :goto_7
    return-object v0

    :cond_8
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    check-cast v0, Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getListView()Landroid/widget/ListView;

    move-result-object v0

    goto :goto_7
.end method

.method public onActivityDestroy()V
    .registers 2

    .prologue
    .line 153
    invoke-super {p0}, Landroid/preference/ListPreference;->onActivityDestroy()V

    .line 154
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 155
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    .line 156
    :cond_14
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 147
    invoke-super {p0, p1}, Landroid/preference/ListPreference;->onDismiss(Landroid/content/DialogInterface;)V

    .line 148
    invoke-static {p0, p0}, Lcom/afollestad/materialdialogs/prefs/PrefUtil;->unregisterOnActivityDestroyListener(Landroid/preference/Preference;Landroid/preference/PreferenceManager$OnActivityDestroyListener;)V

    .line 149
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 174
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 176
    :cond_e
    invoke-super {p0, p1}, Landroid/preference/ListPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 185
    :cond_11
    :goto_11
    return-void

    :cond_12
    move-object v0, p1

    .line 180
    check-cast v0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;

    .line 181
    .local v0, "myState":Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;
    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/preference/ListPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 182
    iget-boolean v1, v0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;->isDialogShowing:Z

    if-eqz v1, :cond_11

    .line 183
    iget-object v1, v0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;->dialogBundle:Landroid/os/Bundle;

    invoke-virtual {p0, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->showDialog(Landroid/os/Bundle;)V

    goto :goto_11
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 5

    .prologue
    .line 160
    invoke-super {p0}, Landroid/preference/ListPreference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v2

    .line 161
    .local v2, "superState":Landroid/os/Parcelable;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 162
    .local v0, "dialog":Landroid/app/Dialog;
    if-eqz v0, :cond_10

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v3

    if-nez v3, :cond_12

    :cond_10
    move-object v1, v2

    .line 169
    :goto_11
    return-object v1

    .line 166
    :cond_12
    new-instance v1, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;

    invoke-direct {v1, v2}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 167
    .local v1, "myState":Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;
    const/4 v3, 0x1

    iput-boolean v3, v1, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;->isDialogShowing:Z

    .line 168
    invoke-virtual {v0}, Landroid/app/Dialog;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v3

    iput-object v3, v1, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;->dialogBundle:Landroid/os/Bundle;

    goto :goto_11
.end method

.method public setEntries([Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "entries"    # [Ljava/lang/CharSequence;

    .prologue
    .line 65
    invoke-super {p0, p1}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 66
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    if-eqz v0, :cond_c

    .line 67
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0, p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setItems([Ljava/lang/CharSequence;)V

    .line 68
    :cond_c
    return-void
.end method

.method protected showDialog(Landroid/os/Bundle;)V
    .registers 7
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 82
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_c

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v3

    if-nez v3, :cond_14

    .line 83
    :cond_c
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "ListPreference requires an entries array and an entryValues array."

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 87
    :cond_14
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v2

    .line 88
    .local v2, "preselect":I
    new-instance v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v4, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->context:Landroid/content/Context;

    invoke-direct {v3, v4}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getDialogTitle()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->title(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getDialogIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->icon(Landroid/graphics/drawable/Drawable;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v3

    new-instance v4, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$2;

    invoke-direct {v4, p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$2;-><init>(Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;)V

    invoke-virtual {v3, v4}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onAny(Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getNegativeButtonText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items([Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss(Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v3

    new-instance v4, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$1;

    invoke-direct {v4, p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$1;-><init>(Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;)V

    invoke-virtual {v3, v2, v4}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsCallbackSingleChoice(ILcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    .line 128
    .local v0, "builder":Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->onCreateDialogView()Landroid/view/View;

    move-result-object v1

    .line 129
    .local v1, "contentView":Landroid/view/View;
    if-eqz v1, :cond_87

    .line 130
    invoke-virtual {p0, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->onBindDialogView(Landroid/view/View;)V

    .line 131
    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView(Landroid/view/View;Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 136
    :goto_6b
    invoke-static {p0, p0}, Lcom/afollestad/materialdialogs/prefs/PrefUtil;->registerOnActivityDestroyListener(Landroid/preference/Preference;Landroid/preference/PreferenceManager$OnActivityDestroyListener;)V

    .line 138
    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->build()Lcom/afollestad/materialdialogs/MaterialDialog;

    move-result-object v3

    iput-object v3, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 139
    if-eqz p1, :cond_7b

    .line 140
    iget-object v3, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v3, p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 141
    :cond_7b
    iget-object v3, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    const/4 v4, -0x2

    invoke-virtual {p0, v3, v4}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->onClick(Landroid/content/DialogInterface;I)V

    .line 142
    iget-object v3, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v3}, Lcom/afollestad/materialdialogs/MaterialDialog;->show()V

    .line 143
    return-void

    .line 133
    :cond_87
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getDialogMessage()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->content(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    goto :goto_6b
.end method
