.class public Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;
.super Landroid/preference/MultiSelectListPreference;
.source "MaterialMultiSelectListPreference.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
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
    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->init(Landroid/content/Context;)V

    .line 43
    return-void
.end method

.method static synthetic access$000(Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;Ljava/lang/Object;)Z
    .registers 3
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 31
    invoke-virtual {p0, p1}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private init(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->context:Landroid/content/Context;

    .line 54
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-gt v0, v1, :cond_c

    .line 55
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->setWidgetLayoutResource(I)V

    .line 56
    :cond_c
    return-void
.end method


# virtual methods
.method public getDialog()Landroid/app/Dialog;
    .registers 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    return-object v0
.end method

.method public onActivityDestroy()V
    .registers 2

    .prologue
    .line 150
    invoke-super {p0}, Landroid/preference/MultiSelectListPreference;->onActivityDestroy()V

    .line 151
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 152
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    .line 153
    :cond_14
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 9
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 136
    invoke-super {p0, p1}, Landroid/preference/MultiSelectListPreference;->onDismiss(Landroid/content/DialogInterface;)V

    .line 138
    :try_start_3
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v1

    .line 139
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

    .line 142
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 143
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_26} :catch_27

    .line 146
    .end local v0    # "method":Ljava/lang/reflect/Method;
    .end local v1    # "pm":Landroid/preference/PreferenceManager;
    :goto_26
    return-void

    .line 144
    :catch_27
    move-exception v2

    goto :goto_26
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 171
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 173
    :cond_e
    invoke-super {p0, p1}, Landroid/preference/MultiSelectListPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 182
    :cond_11
    :goto_11
    return-void

    :cond_12
    move-object v0, p1

    .line 177
    check-cast v0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;

    .line 178
    .local v0, "myState":Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;
    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/preference/MultiSelectListPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 179
    iget-boolean v1, v0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;->isDialogShowing:Z

    if-eqz v1, :cond_11

    .line 180
    iget-object v1, v0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;->dialogBundle:Landroid/os/Bundle;

    invoke-virtual {p0, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->showDialog(Landroid/os/Bundle;)V

    goto :goto_11
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 5

    .prologue
    .line 157
    invoke-super {p0}, Landroid/preference/MultiSelectListPreference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v2

    .line 158
    .local v2, "superState":Landroid/os/Parcelable;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 159
    .local v0, "dialog":Landroid/app/Dialog;
    if-eqz v0, :cond_10

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v3

    if-nez v3, :cond_12

    :cond_10
    move-object v1, v2

    .line 166
    :goto_11
    return-object v1

    .line 163
    :cond_12
    new-instance v1, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;

    invoke-direct {v1, v2}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 164
    .local v1, "myState":Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;
    const/4 v3, 0x1

    iput-boolean v3, v1, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;->isDialogShowing:Z

    .line 165
    invoke-virtual {v0}, Landroid/app/Dialog;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v3

    iput-object v3, v1, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState;->dialogBundle:Landroid/os/Bundle;

    goto :goto_11
.end method

.method public setEntries([Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "entries"    # [Ljava/lang/CharSequence;

    .prologue
    .line 47
    invoke-super {p0, p1}, Landroid/preference/MultiSelectListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 48
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    if-eqz v0, :cond_c

    .line 49
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v0, p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setItems([Ljava/lang/CharSequence;)V

    .line 50
    :cond_c
    return-void
.end method

.method protected showDialog(Landroid/os/Bundle;)V
    .registers 15
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    const/4 v11, 0x0

    .line 65
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 66
    .local v4, "indices":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->getValues()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_e
    :goto_e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 67
    .local v7, "s":Ljava/lang/String;
    invoke-virtual {p0, v7}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v3

    .line 68
    .local v3, "index":I
    if-ltz v3, :cond_e

    .line 69
    invoke-virtual {p0, v7}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_e

    .line 71
    .end local v3    # "index":I
    .end local v7    # "s":Ljava/lang/String;
    :cond_2c
    new-instance v8, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v9, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->context:Landroid/content/Context;

    invoke-direct {v8, v9}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->getDialogTitle()Ljava/lang/CharSequence;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->title(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v8

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->getDialogMessage()Ljava/lang/CharSequence;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->content(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v8

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->getDialogIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->icon(Landroid/graphics/drawable/Drawable;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v8

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->getNegativeButtonText()Ljava/lang/CharSequence;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v8

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->getPositiveButtonText()Ljava/lang/CharSequence;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v8

    new-instance v9, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$2;

    invoke-direct {v9, p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$2;-><init>(Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;)V

    invoke-virtual {v8, v9}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback(Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v8

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items([Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v9

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/Integer;

    invoke-interface {v4, v8}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/Integer;

    new-instance v10, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$1;

    invoke-direct {v10, p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$1;-><init>(Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;)V

    invoke-virtual {v9, v8, v10}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsCallbackMultiChoice([Ljava/lang/Integer;Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v8

    invoke-virtual {v8, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    .line 110
    .local v0, "builder":Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->onCreateDialogView()Landroid/view/View;

    move-result-object v1

    .line 111
    .local v1, "contentView":Landroid/view/View;
    if-eqz v1, :cond_c7

    .line 112
    invoke-virtual {p0, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->onBindDialogView(Landroid/view/View;)V

    .line 113
    invoke-virtual {v0, v1, v11}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView(Landroid/view/View;Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 119
    :goto_91
    :try_start_91
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v6

    .line 120
    .local v6, "pm":Landroid/preference/PreferenceManager;
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string v9, "registerOnActivityDestroyListener"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Class;

    const/4 v11, 0x0

    const-class v12, Landroid/preference/PreferenceManager$OnActivityDestroyListener;

    aput-object v12, v10, v11

    invoke-virtual {v8, v9, v10}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 123
    .local v5, "method":Ljava/lang/reflect/Method;
    const/4 v8, 0x1

    invoke-virtual {v5, v8}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 124
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p0, v8, v9

    invoke-virtual {v5, v6, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_b4
    .catch Ljava/lang/Exception; {:try_start_91 .. :try_end_b4} :catch_cf

    .line 128
    .end local v5    # "method":Ljava/lang/reflect/Method;
    .end local v6    # "pm":Landroid/preference/PreferenceManager;
    :goto_b4
    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->build()Lcom/afollestad/materialdialogs/MaterialDialog;

    move-result-object v8

    iput-object v8, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 129
    if-eqz p1, :cond_c1

    .line 130
    iget-object v8, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v8, p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 131
    :cond_c1
    iget-object v8, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->mDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v8}, Lcom/afollestad/materialdialogs/MaterialDialog;->show()V

    .line 132
    return-void

    .line 115
    :cond_c7
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->getDialogMessage()Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v0, v8}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->content(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    goto :goto_91

    .line 125
    :catch_cf
    move-exception v8

    goto :goto_b4
.end method
