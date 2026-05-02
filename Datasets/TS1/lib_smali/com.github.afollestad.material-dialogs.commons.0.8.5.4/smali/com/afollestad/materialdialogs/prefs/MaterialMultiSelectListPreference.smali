.class public Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;
.super Landroid/preference/MultiSelectListPreference;
.source "MaterialMultiSelectListPreference.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$3;,
        Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;
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
    .line 36
    invoke-direct {p0, p1}, Landroid/preference/MultiSelectListPreference;-><init>(Landroid/content/Context;)V

    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 41
    invoke-direct {p0, p1, p2}, Landroid/preference/MultiSelectListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 42
    invoke-direct {p0, p1, p2}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 43
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
    .line 47
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/MultiSelectListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 48
    invoke-direct {p0, p1, p2}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 49
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
    .line 53
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/preference/MultiSelectListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 54
    invoke-direct {p0, p1, p2}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 55
    return-void
.end method

.method static synthetic access$000(Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;Ljava/lang/Object;)Z
    .registers 3
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 30
    invoke-virtual {p0, p1}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->context:Landroid/content/Context;

    .line 66
    invoke-static {p1, p0, p2}, Lcom/afollestad/materialdialogs/prefs/PrefUtil;->setLayoutResource(Landroid/content/Context;Landroid/preference/Preference;Landroid/util/AttributeSet;)V

    .line 67
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-gt v0, v1, :cond_f

    .line 68
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->setWidgetLayoutResource(I)V

    .line 69
    :cond_f
    return-void
.end method


# virtual methods
.method public getDialog()Landroid/app/Dialog;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    return-object v0
.end method

.method public onActivityDestroy()V
    .registers 2

    .prologue
    .line 146
    invoke-super {p0}, Landroid/preference/MultiSelectListPreference;->onActivityDestroy()V

    .line 147
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 148
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    .line 149
    :cond_14
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 140
    invoke-super {p0, p1}, Landroid/preference/MultiSelectListPreference;->onDismiss(Landroid/content/DialogInterface;)V

    .line 141
    invoke-static {p0, p0}, Lcom/afollestad/materialdialogs/prefs/PrefUtil;->unregisterOnActivityDestroyListener(Landroid/preference/Preference;Landroid/preference/PreferenceManager$OnActivityDestroyListener;)V

    .line 142
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 167
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 169
    :cond_e
    invoke-super {p0, p1}, Landroid/preference/MultiSelectListPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 178
    :cond_11
    :goto_11
    return-void

    :cond_12
    move-object v0, p1

    .line 173
    check-cast v0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;

    .line 174
    .local v0, "myState":Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;
    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/preference/MultiSelectListPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 175
    iget-boolean v1, v0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;->isDialogShowing:Z

    if-eqz v1, :cond_11

    .line 176
    iget-object v1, v0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;->dialogBundle:Landroid/os/Bundle;

    invoke-virtual {p0, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->showDialog(Landroid/os/Bundle;)V

    goto :goto_11
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 5

    .prologue
    .line 153
    invoke-super {p0}, Landroid/preference/MultiSelectListPreference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v2

    .line 154
    .local v2, "superState":Landroid/os/Parcelable;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->getDialog()Landroid/app/Dialog;

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
    new-instance v1, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;

    invoke-direct {v1, v2}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 160
    .local v1, "myState":Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;
    const/4 v3, 0x1

    iput-boolean v3, v1, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;->isDialogShowing:Z

    .line 161
    invoke-virtual {v0}, Landroid/app/Dialog;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v3

    iput-object v3, v1, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;->dialogBundle:Landroid/os/Bundle;

    goto :goto_11
.end method

.method public setEntries([Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "entries"    # [Ljava/lang/CharSequence;

    .prologue
    .line 59
    invoke-super {p0, p1}, Landroid/preference/MultiSelectListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 60
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    if-eqz v0, :cond_c

    .line 61
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0, p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setItems([Ljava/lang/CharSequence;)V

    .line 62
    :cond_c
    return-void
.end method

.method protected showDialog(Landroid/os/Bundle;)V
    .registers 11
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 78
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 79
    .local v4, "indices":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->getValues()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_d
    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 80
    .local v5, "s":Ljava/lang/String;
    invoke-virtual {p0, v5}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v3

    .line 81
    .local v3, "index":I
    if-ltz v3, :cond_d

    .line 82
    invoke-virtual {p0, v5}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 84
    .end local v3    # "index":I
    .end local v5    # "s":Ljava/lang/String;
    :cond_2b
    new-instance v6, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v7, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->context:Landroid/content/Context;

    invoke-direct {v6, v7}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->getDialogTitle()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->title(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->getDialogIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->icon(Landroid/graphics/drawable/Drawable;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->getNegativeButtonText()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->getPositiveButtonText()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v6

    new-instance v7, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$2;

    invoke-direct {v7, p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$2;-><init>(Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;)V

    invoke-virtual {v6, v7}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onAny(Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items([Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v7

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    new-array v6, v6, [Ljava/lang/Integer;

    invoke-interface {v4, v6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/Integer;

    new-instance v8, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$1;

    invoke-direct {v8, p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$1;-><init>(Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;)V

    invoke-virtual {v7, v6, v8}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsCallbackMultiChoice([Ljava/lang/Integer;Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v6

    invoke-virtual {v6, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    .line 122
    .local v0, "builder":Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->onCreateDialogView()Landroid/view/View;

    move-result-object v1

    .line 123
    .local v1, "contentView":Landroid/view/View;
    if-eqz v1, :cond_9f

    .line 124
    invoke-virtual {p0, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->onBindDialogView(Landroid/view/View;)V

    .line 125
    const/4 v6, 0x0

    invoke-virtual {v0, v1, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView(Landroid/view/View;Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 130
    :goto_89
    invoke-static {p0, p0}, Lcom/afollestad/materialdialogs/prefs/PrefUtil;->registerOnActivityDestroyListener(Landroid/preference/Preference;Landroid/preference/PreferenceManager$OnActivityDestroyListener;)V

    .line 132
    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->build()Lcom/afollestad/materialdialogs/MaterialDialog;

    move-result-object v6

    iput-object v6, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 133
    if-eqz p1, :cond_99

    .line 134
    iget-object v6, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v6, p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 135
    :cond_99
    iget-object v6, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v6}, Lcom/afollestad/materialdialogs/MaterialDialog;->show()V

    .line 136
    return-void

    .line 127
    :cond_9f
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->getDialogMessage()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->content(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    goto :goto_89
.end method
