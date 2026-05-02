.class public Landroid/support/v7/preference/Preference;
.super Ljava/lang/Object;
.source "Preference.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/preference/Preference$BaseSavedState;,
        Landroid/support/v7/preference/Preference$OnPreferenceChangeInternalListener;,
        Landroid/support/v7/preference/Preference$OnPreferenceClickListener;,
        Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Landroid/support/v7/preference/Preference;",
        ">;"
    }
.end annotation


# static fields
.field public static final DEFAULT_ORDER:I = 0x7fffffff


# instance fields
.field private mBaseMethodCalled:Z

.field private final mClickListener:Landroid/view/View$OnClickListener;

.field private mContext:Landroid/content/Context;

.field private mDefaultValue:Ljava/lang/Object;

.field private mDependencyKey:Ljava/lang/String;

.field private mDependencyMet:Z

.field private mDependents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/preference/Preference;",
            ">;"
        }
    .end annotation
.end field

.field private mEnabled:Z

.field private mExtras:Landroid/os/Bundle;

.field private mFragment:Ljava/lang/String;

.field private mHasId:Z

.field private mIcon:Landroid/graphics/drawable/Drawable;

.field private mIconResId:I

.field private mId:J

.field private mIntent:Landroid/content/Intent;

.field private mKey:Ljava/lang/String;

.field private mLayoutResId:I

.field private mListener:Landroid/support/v7/preference/Preference$OnPreferenceChangeInternalListener;

.field private mOnChangeListener:Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;

.field private mOnClickListener:Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

.field private mOrder:I

.field private mParentDependencyMet:Z

.field private mPersistent:Z

.field private mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

.field private mRequiresKey:Z

.field private mSelectable:Z

.field private mShouldDisableView:Z

.field private mSummary:Ljava/lang/CharSequence;

.field private mTitle:Ljava/lang/CharSequence;

.field private mVisible:Z

.field private mWidgetLayoutResId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 334
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 335
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 325
    sget v0, Landroid/support/v7/preference/R$attr;->preferenceStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 326
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 307
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroid/support/v7/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 308
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const v3, 0x7fffffff

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 231
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    iput v3, p0, Landroid/support/v7/preference/Preference;->mOrder:I

    .line 115
    iput-boolean v4, p0, Landroid/support/v7/preference/Preference;->mEnabled:Z

    .line 116
    iput-boolean v4, p0, Landroid/support/v7/preference/Preference;->mSelectable:Z

    .line 118
    iput-boolean v4, p0, Landroid/support/v7/preference/Preference;->mPersistent:Z

    .line 121
    iput-boolean v4, p0, Landroid/support/v7/preference/Preference;->mDependencyMet:Z

    .line 122
    iput-boolean v4, p0, Landroid/support/v7/preference/Preference;->mParentDependencyMet:Z

    .line 123
    iput-boolean v4, p0, Landroid/support/v7/preference/Preference;->mVisible:Z

    .line 128
    iput-boolean v4, p0, Landroid/support/v7/preference/Preference;->mShouldDisableView:Z

    .line 130
    sget v1, Landroid/support/v7/preference/R$layout;->preference:I

    iput v1, p0, Landroid/support/v7/preference/Preference;->mLayoutResId:I

    .line 139
    new-instance v1, Landroid/support/v7/preference/Preference$1;

    invoke-direct {v1, p0}, Landroid/support/v7/preference/Preference$1;-><init>(Landroid/support/v7/preference/Preference;)V

    iput-object v1, p0, Landroid/support/v7/preference/Preference;->mClickListener:Landroid/view/View$OnClickListener;

    .line 232
    iput-object p1, p0, Landroid/support/v7/preference/Preference;->mContext:Landroid/content/Context;

    .line 234
    sget-object v1, Landroid/support/v7/preference/R$styleable;->Preference:[I

    invoke-virtual {p1, p2, v1, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 237
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Landroid/support/v7/preference/R$styleable;->Preference_icon:I

    sget v2, Landroid/support/v7/preference/R$styleable;->Preference_android_icon:I

    invoke-static {v0, v1, v2, v5}, Landroid/support/v4/content/res/TypedArrayUtils;->getResourceId(Landroid/content/res/TypedArray;III)I

    move-result v1

    iput v1, p0, Landroid/support/v7/preference/Preference;->mIconResId:I

    .line 240
    sget v1, Landroid/support/v7/preference/R$styleable;->Preference_key:I

    sget v2, Landroid/support/v7/preference/R$styleable;->Preference_android_key:I

    invoke-static {v0, v1, v2}, Landroid/support/v4/content/res/TypedArrayUtils;->getString(Landroid/content/res/TypedArray;II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/preference/Preference;->mKey:Ljava/lang/String;

    .line 243
    sget v1, Landroid/support/v7/preference/R$styleable;->Preference_title:I

    sget v2, Landroid/support/v7/preference/R$styleable;->Preference_android_title:I

    invoke-static {v0, v1, v2}, Landroid/support/v4/content/res/TypedArrayUtils;->getString(Landroid/content/res/TypedArray;II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/preference/Preference;->mTitle:Ljava/lang/CharSequence;

    .line 246
    sget v1, Landroid/support/v7/preference/R$styleable;->Preference_summary:I

    sget v2, Landroid/support/v7/preference/R$styleable;->Preference_android_summary:I

    invoke-static {v0, v1, v2}, Landroid/support/v4/content/res/TypedArrayUtils;->getString(Landroid/content/res/TypedArray;II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/preference/Preference;->mSummary:Ljava/lang/CharSequence;

    .line 249
    sget v1, Landroid/support/v7/preference/R$styleable;->Preference_order:I

    sget v2, Landroid/support/v7/preference/R$styleable;->Preference_android_order:I

    invoke-static {v0, v1, v2, v3}, Landroid/support/v4/content/res/TypedArrayUtils;->getInt(Landroid/content/res/TypedArray;III)I

    move-result v1

    iput v1, p0, Landroid/support/v7/preference/Preference;->mOrder:I

    .line 252
    sget v1, Landroid/support/v7/preference/R$styleable;->Preference_fragment:I

    sget v2, Landroid/support/v7/preference/R$styleable;->Preference_android_fragment:I

    invoke-static {v0, v1, v2}, Landroid/support/v4/content/res/TypedArrayUtils;->getString(Landroid/content/res/TypedArray;II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/preference/Preference;->mFragment:Ljava/lang/String;

    .line 255
    sget v1, Landroid/support/v7/preference/R$styleable;->Preference_layout:I

    sget v2, Landroid/support/v7/preference/R$styleable;->Preference_android_layout:I

    sget v3, Landroid/support/v7/preference/R$layout;->preference:I

    invoke-static {v0, v1, v2, v3}, Landroid/support/v4/content/res/TypedArrayUtils;->getResourceId(Landroid/content/res/TypedArray;III)I

    move-result v1

    iput v1, p0, Landroid/support/v7/preference/Preference;->mLayoutResId:I

    .line 258
    sget v1, Landroid/support/v7/preference/R$styleable;->Preference_widgetLayout:I

    sget v2, Landroid/support/v7/preference/R$styleable;->Preference_android_widgetLayout:I

    invoke-static {v0, v1, v2, v5}, Landroid/support/v4/content/res/TypedArrayUtils;->getResourceId(Landroid/content/res/TypedArray;III)I

    move-result v1

    iput v1, p0, Landroid/support/v7/preference/Preference;->mWidgetLayoutResId:I

    .line 261
    sget v1, Landroid/support/v7/preference/R$styleable;->Preference_enabled:I

    sget v2, Landroid/support/v7/preference/R$styleable;->Preference_android_enabled:I

    invoke-static {v0, v1, v2, v4}, Landroid/support/v4/content/res/TypedArrayUtils;->getBoolean(Landroid/content/res/TypedArray;IIZ)Z

    move-result v1

    iput-boolean v1, p0, Landroid/support/v7/preference/Preference;->mEnabled:Z

    .line 264
    sget v1, Landroid/support/v7/preference/R$styleable;->Preference_selectable:I

    sget v2, Landroid/support/v7/preference/R$styleable;->Preference_android_selectable:I

    invoke-static {v0, v1, v2, v4}, Landroid/support/v4/content/res/TypedArrayUtils;->getBoolean(Landroid/content/res/TypedArray;IIZ)Z

    move-result v1

    iput-boolean v1, p0, Landroid/support/v7/preference/Preference;->mSelectable:Z

    .line 267
    sget v1, Landroid/support/v7/preference/R$styleable;->Preference_persistent:I

    sget v2, Landroid/support/v7/preference/R$styleable;->Preference_android_persistent:I

    invoke-static {v0, v1, v2, v4}, Landroid/support/v4/content/res/TypedArrayUtils;->getBoolean(Landroid/content/res/TypedArray;IIZ)Z

    move-result v1

    iput-boolean v1, p0, Landroid/support/v7/preference/Preference;->mPersistent:Z

    .line 270
    sget v1, Landroid/support/v7/preference/R$styleable;->Preference_dependency:I

    sget v2, Landroid/support/v7/preference/R$styleable;->Preference_android_dependency:I

    invoke-static {v0, v1, v2}, Landroid/support/v4/content/res/TypedArrayUtils;->getString(Landroid/content/res/TypedArray;II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/preference/Preference;->mDependencyKey:Ljava/lang/String;

    .line 273
    sget v1, Landroid/support/v7/preference/R$styleable;->Preference_defaultValue:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_c3

    .line 274
    sget v1, Landroid/support/v7/preference/R$styleable;->Preference_defaultValue:I

    invoke-virtual {p0, v0, v1}, Landroid/support/v7/preference/Preference;->onGetDefaultValue(Landroid/content/res/TypedArray;I)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/preference/Preference;->mDefaultValue:Ljava/lang/Object;

    .line 279
    :cond_b5
    :goto_b5
    sget v1, Landroid/support/v7/preference/R$styleable;->Preference_shouldDisableView:I

    sget v2, Landroid/support/v7/preference/R$styleable;->Preference_shouldDisableView:I

    invoke-static {v0, v1, v2, v4}, Landroid/support/v4/content/res/TypedArrayUtils;->getBoolean(Landroid/content/res/TypedArray;IIZ)Z

    move-result v1

    iput-boolean v1, p0, Landroid/support/v7/preference/Preference;->mShouldDisableView:Z

    .line 283
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 284
    return-void

    .line 275
    :cond_c3
    sget v1, Landroid/support/v7/preference/R$styleable;->Preference_android_defaultValue:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_b5

    .line 276
    sget v1, Landroid/support/v7/preference/R$styleable;->Preference_android_defaultValue:I

    invoke-virtual {p0, v0, v1}, Landroid/support/v7/preference/Preference;->onGetDefaultValue(Landroid/content/res/TypedArray;I)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/preference/Preference;->mDefaultValue:Ljava/lang/Object;

    goto :goto_b5
.end method

.method private dispatchSetInitialValue()V
    .registers 4

    .prologue
    .line 1292
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->shouldPersist()Z

    move-result v0

    .line 1293
    .local v0, "shouldPersist":Z
    if-eqz v0, :cond_12

    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v7/preference/Preference;->mKey:Ljava/lang/String;

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1d

    .line 1294
    :cond_12
    iget-object v1, p0, Landroid/support/v7/preference/Preference;->mDefaultValue:Ljava/lang/Object;

    if-eqz v1, :cond_1c

    .line 1295
    const/4 v1, 0x0

    iget-object v2, p0, Landroid/support/v7/preference/Preference;->mDefaultValue:Ljava/lang/Object;

    invoke-virtual {p0, v1, v2}, Landroid/support/v7/preference/Preference;->onSetInitialValue(ZLjava/lang/Object;)V

    .line 1300
    :cond_1c
    :goto_1c
    return-void

    .line 1298
    :cond_1d
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/support/v7/preference/Preference;->onSetInitialValue(ZLjava/lang/Object;)V

    goto :goto_1c
.end method

.method private registerDependency()V
    .registers 5

    .prologue
    .line 1110
    iget-object v1, p0, Landroid/support/v7/preference/Preference;->mDependencyKey:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 1119
    :goto_8
    return-void

    .line 1112
    :cond_9
    iget-object v1, p0, Landroid/support/v7/preference/Preference;->mDependencyKey:Ljava/lang/String;

    invoke-virtual {p0, v1}, Landroid/support/v7/preference/Preference;->findPreferenceInHierarchy(Ljava/lang/String;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 1113
    .local v0, "preference":Landroid/support/v7/preference/Preference;
    if-eqz v0, :cond_15

    .line 1114
    invoke-direct {v0, p0}, Landroid/support/v7/preference/Preference;->registerDependent(Landroid/support/v7/preference/Preference;)V

    goto :goto_8

    .line 1116
    :cond_15
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Dependency \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v7/preference/Preference;->mDependencyKey:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\" not found for preference \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v7/preference/Preference;->mKey:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\" (title: \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v7/preference/Preference;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private registerDependent(Landroid/support/v7/preference/Preference;)V
    .registers 3
    .param p1, "dependent"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 1158
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mDependents:Ljava/util/List;

    if-nez v0, :cond_b

    .line 1159
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/preference/Preference;->mDependents:Ljava/util/List;

    .line 1162
    :cond_b
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mDependents:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1164
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->shouldDisableDependents()Z

    move-result v0

    invoke-virtual {p1, p0, v0}, Landroid/support/v7/preference/Preference;->onDependencyChanged(Landroid/support/v7/preference/Preference;Z)V

    .line 1165
    return-void
.end method

.method private setEnabledStateOnViews(Landroid/view/View;Z)V
    .registers 6
    .param p1, "v"    # Landroid/view/View;
    .param p2, "enabled"    # Z

    .prologue
    .line 537
    invoke-virtual {p1, p2}, Landroid/view/View;->setEnabled(Z)V

    .line 539
    instance-of v2, p1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_1c

    move-object v1, p1

    .line 540
    check-cast v1, Landroid/view/ViewGroup;

    .line 541
    .local v1, "vg":Landroid/view/ViewGroup;
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_10
    if-ltz v0, :cond_1c

    .line 542
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {p0, v2, p2}, Landroid/support/v7/preference/Preference;->setEnabledStateOnViews(Landroid/view/View;Z)V

    .line 541
    add-int/lit8 v0, v0, -0x1

    goto :goto_10

    .line 545
    .end local v0    # "i":I
    .end local v1    # "vg":Landroid/view/ViewGroup;
    :cond_1c
    return-void
.end method

.method private tryCommit(Landroid/content/SharedPreferences$Editor;)V
    .registers 3
    .param p1, "editor"    # Landroid/content/SharedPreferences$Editor;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1323
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0}, Landroid/support/v7/preference/PreferenceManager;->shouldCommit()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1324
    invoke-static {}, Landroid/support/v4/content/SharedPreferencesCompat$EditorCompat;->getInstance()Landroid/support/v4/content/SharedPreferencesCompat$EditorCompat;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v4/content/SharedPreferencesCompat$EditorCompat;->apply(Landroid/content/SharedPreferences$Editor;)V

    .line 1326
    :cond_f
    return-void
.end method

.method private unregisterDependency()V
    .registers 3

    .prologue
    .line 1122
    iget-object v1, p0, Landroid/support/v7/preference/Preference;->mDependencyKey:Ljava/lang/String;

    if-eqz v1, :cond_f

    .line 1123
    iget-object v1, p0, Landroid/support/v7/preference/Preference;->mDependencyKey:Ljava/lang/String;

    invoke-virtual {p0, v1}, Landroid/support/v7/preference/Preference;->findPreferenceInHierarchy(Ljava/lang/String;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 1124
    .local v0, "oldDependency":Landroid/support/v7/preference/Preference;
    if-eqz v0, :cond_f

    .line 1125
    invoke-direct {v0, p0}, Landroid/support/v7/preference/Preference;->unregisterDependent(Landroid/support/v7/preference/Preference;)V

    .line 1128
    .end local v0    # "oldDependency":Landroid/support/v7/preference/Preference;
    :cond_f
    return-void
.end method

.method private unregisterDependent(Landroid/support/v7/preference/Preference;)V
    .registers 3
    .param p1, "dependent"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 1176
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mDependents:Ljava/util/List;

    if-eqz v0, :cond_9

    .line 1177
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mDependents:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 1179
    :cond_9
    return-void
.end method


# virtual methods
.method public callChangeListener(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 892
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mOnChangeListener:Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;

    if-eqz v0, :cond_c

    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mOnChangeListener:Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;

    invoke-interface {v0, p0, p1}, Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;->onPreferenceChange(Landroid/support/v7/preference/Preference;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public compareTo(Landroid/support/v7/preference/Preference;)I
    .registers 4
    .param p1, "another"    # Landroid/support/v7/preference/Preference;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1011
    iget v0, p0, Landroid/support/v7/preference/Preference;->mOrder:I

    iget v1, p1, Landroid/support/v7/preference/Preference;->mOrder:I

    if-eq v0, v1, :cond_c

    .line 1013
    iget v0, p0, Landroid/support/v7/preference/Preference;->mOrder:I

    iget v1, p1, Landroid/support/v7/preference/Preference;->mOrder:I

    sub-int/2addr v0, v1

    .line 1023
    :goto_b
    return v0

    .line 1014
    :cond_c
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mTitle:Ljava/lang/CharSequence;

    iget-object v1, p1, Landroid/support/v7/preference/Preference;->mTitle:Ljava/lang/CharSequence;

    if-ne v0, v1, :cond_14

    .line 1016
    const/4 v0, 0x0

    goto :goto_b

    .line 1017
    :cond_14
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mTitle:Ljava/lang/CharSequence;

    if-nez v0, :cond_1a

    .line 1018
    const/4 v0, 0x1

    goto :goto_b

    .line 1019
    :cond_1a
    iget-object v0, p1, Landroid/support/v7/preference/Preference;->mTitle:Ljava/lang/CharSequence;

    if-nez v0, :cond_20

    .line 1020
    const/4 v0, -0x1

    goto :goto_b

    .line 1023
    :cond_20
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mTitle:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p1, Landroid/support/v7/preference/Preference;->mTitle:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    goto :goto_b
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 79
    check-cast p1, Landroid/support/v7/preference/Preference;

    invoke-virtual {p0, p1}, Landroid/support/v7/preference/Preference;->compareTo(Landroid/support/v7/preference/Preference;)I

    move-result v0

    return v0
.end method

.method dispatchRestoreInstanceState(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "container"    # Landroid/os/Bundle;

    .prologue
    .line 1663
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->hasKey()Z

    move-result v1

    if-eqz v1, :cond_20

    .line 1664
    iget-object v1, p0, Landroid/support/v7/preference/Preference;->mKey:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    .line 1665
    .local v0, "state":Landroid/os/Parcelable;
    if-eqz v0, :cond_20

    .line 1666
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v7/preference/Preference;->mBaseMethodCalled:Z

    .line 1667
    invoke-virtual {p0, v0}, Landroid/support/v7/preference/Preference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 1668
    iget-boolean v1, p0, Landroid/support/v7/preference/Preference;->mBaseMethodCalled:Z

    if-nez v1, :cond_20

    .line 1669
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Derived class did not call super.onRestoreInstanceState()"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1674
    .end local v0    # "state":Landroid/os/Parcelable;
    :cond_20
    return-void
.end method

.method dispatchSaveInstanceState(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "container"    # Landroid/os/Bundle;

    .prologue
    .line 1610
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->hasKey()Z

    move-result v1

    if-eqz v1, :cond_20

    .line 1611
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v7/preference/Preference;->mBaseMethodCalled:Z

    .line 1612
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    .line 1613
    .local v0, "state":Landroid/os/Parcelable;
    iget-boolean v1, p0, Landroid/support/v7/preference/Preference;->mBaseMethodCalled:Z

    if-nez v1, :cond_19

    .line 1614
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Derived class did not call super.onSaveInstanceState()"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1617
    :cond_19
    if-eqz v0, :cond_20

    .line 1618
    iget-object v1, p0, Landroid/support/v7/preference/Preference;->mKey:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1621
    .end local v0    # "state":Landroid/os/Parcelable;
    :cond_20
    return-void
.end method

.method protected findPreferenceInHierarchy(Ljava/lang/String;)Landroid/support/v7/preference/Preference;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 1141
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_a

    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    if-nez v0, :cond_c

    .line 1142
    :cond_a
    const/4 v0, 0x0

    .line 1145
    :goto_b
    return-object v0

    :cond_c
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/preference/PreferenceManager;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    goto :goto_b
.end method

.method public getContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 982
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getDependency()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1267
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mDependencyKey:Ljava/lang/String;

    return-object v0
.end method

.method public getExtras()Landroid/os/Bundle;
    .registers 2

    .prologue
    .line 397
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mExtras:Landroid/os/Bundle;

    if-nez v0, :cond_b

    .line 398
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Landroid/support/v7/preference/Preference;->mExtras:Landroid/os/Bundle;

    .line 400
    :cond_b
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mExtras:Landroid/os/Bundle;

    return-object v0
.end method

.method getFilterableStringBuilder()Ljava/lang/StringBuilder;
    .registers 6

    .prologue
    const/16 v4, 0x20

    .line 1571
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1572
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    .line 1573
    .local v2, "title":Ljava/lang/CharSequence;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_18

    .line 1574
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1576
    :cond_18
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v1

    .line 1577
    .local v1, "summary":Ljava/lang/CharSequence;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_29

    .line 1578
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1580
    :cond_29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_38

    .line 1582
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 1584
    :cond_38
    return-object v0
.end method

.method public getFragment()Ljava/lang/String;
    .registers 2

    .prologue
    .line 388
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mFragment:Ljava/lang/String;

    return-object v0
.end method

.method public getIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 649
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mIcon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method getId()J
    .registers 3

    .prologue
    .line 788
    iget-wide v0, p0, Landroid/support/v7/preference/Preference;->mId:J

    return-wide v0
.end method

.method public getIntent()Landroid/content/Intent;
    .registers 2

    .prologue
    .line 370
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mIntent:Landroid/content/Intent;

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 821
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mKey:Ljava/lang/String;

    return-object v0
.end method

.method public final getLayoutResource()I
    .registers 2

    .prologue
    .line 437
    iget v0, p0, Landroid/support/v7/preference/Preference;->mLayoutResId:I

    return v0
.end method

.method public getOnPreferenceChangeListener()Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;
    .registers 2

    .prologue
    .line 913
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mOnChangeListener:Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;

    return-object v0
.end method

.method public getOnPreferenceClickListener()Landroid/support/v7/preference/Preference$OnPreferenceClickListener;
    .registers 2

    .prologue
    .line 931
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mOnClickListener:Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    return-object v0
.end method

.method public getOrder()I
    .registers 2

    .prologue
    .line 577
    iget v0, p0, Landroid/support/v7/preference/Preference;->mOrder:I

    return v0
.end method

.method protected getPersistedBoolean(Z)Z
    .registers 4
    .param p1, "defaultReturnValue"    # Z

    .prologue
    .line 1547
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->shouldPersist()Z

    move-result v0

    if-nez v0, :cond_7

    .line 1551
    .end local p1    # "defaultReturnValue":Z
    :goto_6
    return p1

    .restart local p1    # "defaultReturnValue":Z
    :cond_7
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0}, Landroid/support/v7/preference/PreferenceManager;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/preference/Preference;->mKey:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    goto :goto_6
.end method

.method protected getPersistedFloat(F)F
    .registers 4
    .param p1, "defaultReturnValue"    # F

    .prologue
    .line 1459
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->shouldPersist()Z

    move-result v0

    if-nez v0, :cond_7

    .line 1463
    .end local p1    # "defaultReturnValue":F
    :goto_6
    return p1

    .restart local p1    # "defaultReturnValue":F
    :cond_7
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0}, Landroid/support/v7/preference/PreferenceManager;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/preference/Preference;->mKey:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result p1

    goto :goto_6
.end method

.method protected getPersistedInt(I)I
    .registers 4
    .param p1, "defaultReturnValue"    # I

    .prologue
    .line 1415
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->shouldPersist()Z

    move-result v0

    if-nez v0, :cond_7

    .line 1419
    .end local p1    # "defaultReturnValue":I
    :goto_6
    return p1

    .restart local p1    # "defaultReturnValue":I
    :cond_7
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0}, Landroid/support/v7/preference/PreferenceManager;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/preference/Preference;->mKey:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    goto :goto_6
.end method

.method protected getPersistedLong(J)J
    .registers 5
    .param p1, "defaultReturnValue"    # J

    .prologue
    .line 1503
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->shouldPersist()Z

    move-result v0

    if-nez v0, :cond_7

    .line 1507
    .end local p1    # "defaultReturnValue":J
    :goto_6
    return-wide p1

    .restart local p1    # "defaultReturnValue":J
    :cond_7
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0}, Landroid/support/v7/preference/PreferenceManager;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/preference/Preference;->mKey:Ljava/lang/String;

    invoke-interface {v0, v1, p1, p2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide p1

    goto :goto_6
.end method

.method protected getPersistedString(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "defaultReturnValue"    # Ljava/lang/String;

    .prologue
    .line 1371
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->shouldPersist()Z

    move-result v0

    if-nez v0, :cond_7

    .line 1375
    .end local p1    # "defaultReturnValue":Ljava/lang/String;
    :goto_6
    return-object p1

    .restart local p1    # "defaultReturnValue":Ljava/lang/String;
    :cond_7
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0}, Landroid/support/v7/preference/PreferenceManager;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/preference/Preference;->mKey:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_6
.end method

.method public getPreferenceManager()Landroid/support/v7/preference/PreferenceManager;
    .registers 2

    .prologue
    .line 1063
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    return-object v0
.end method

.method public getSharedPreferences()Landroid/content/SharedPreferences;
    .registers 2

    .prologue
    .line 995
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    if-nez v0, :cond_6

    .line 996
    const/4 v0, 0x0

    .line 999
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0}, Landroid/support/v7/preference/PreferenceManager;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    goto :goto_5
.end method

.method public getShouldDisableView()Z
    .registers 2

    .prologue
    .line 753
    iget-boolean v0, p0, Landroid/support/v7/preference/Preference;->mShouldDisableView:Z

    return v0
.end method

.method public getSummary()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 659
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mSummary:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 612
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mTitle:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public final getWidgetLayoutResource()I
    .registers 2

    .prologue
    .line 462
    iget v0, p0, Landroid/support/v7/preference/Preference;->mWidgetLayoutResId:I

    return v0
.end method

.method public hasKey()Z
    .registers 2

    .prologue
    .line 845
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mKey:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isEnabled()Z
    .registers 2

    .prologue
    .line 707
    iget-boolean v0, p0, Landroid/support/v7/preference/Preference;->mEnabled:Z

    if-eqz v0, :cond_e

    iget-boolean v0, p0, Landroid/support/v7/preference/Preference;->mDependencyMet:Z

    if-eqz v0, :cond_e

    iget-boolean v0, p0, Landroid/support/v7/preference/Preference;->mParentDependencyMet:Z

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isPersistent()Z
    .registers 2

    .prologue
    .line 855
    iget-boolean v0, p0, Landroid/support/v7/preference/Preference;->mPersistent:Z

    return v0
.end method

.method public isSelectable()Z
    .registers 2

    .prologue
    .line 728
    iget-boolean v0, p0, Landroid/support/v7/preference/Preference;->mSelectable:Z

    return v0
.end method

.method public final isVisible()Z
    .registers 2

    .prologue
    .line 778
    iget-boolean v0, p0, Landroid/support/v7/preference/Preference;->mVisible:Z

    return v0
.end method

.method protected notifyChanged()V
    .registers 2

    .prologue
    .line 1041
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mListener:Landroid/support/v7/preference/Preference$OnPreferenceChangeInternalListener;

    if-eqz v0, :cond_9

    .line 1042
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mListener:Landroid/support/v7/preference/Preference$OnPreferenceChangeInternalListener;

    invoke-interface {v0, p0}, Landroid/support/v7/preference/Preference$OnPreferenceChangeInternalListener;->onPreferenceChange(Landroid/support/v7/preference/Preference;)V

    .line 1044
    :cond_9
    return-void
.end method

.method public notifyDependencyChange(Z)V
    .registers 6
    .param p1, "disableDependents"    # Z

    .prologue
    .line 1189
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mDependents:Ljava/util/List;

    .line 1191
    .local v0, "dependents":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/preference/Preference;>;"
    if-nez v0, :cond_5

    .line 1199
    :cond_4
    return-void

    .line 1195
    :cond_5
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    .line 1196
    .local v1, "dependentsCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_a
    if-ge v2, v1, :cond_4

    .line 1197
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/preference/Preference;

    invoke-virtual {v3, p0, p1}, Landroid/support/v7/preference/Preference;->onDependencyChanged(Landroid/support/v7/preference/Preference;Z)V

    .line 1196
    add-int/lit8 v2, v2, 0x1

    goto :goto_a
.end method

.method protected notifyHierarchyChanged()V
    .registers 2

    .prologue
    .line 1052
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mListener:Landroid/support/v7/preference/Preference$OnPreferenceChangeInternalListener;

    if-eqz v0, :cond_9

    .line 1053
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mListener:Landroid/support/v7/preference/Preference$OnPreferenceChangeInternalListener;

    invoke-interface {v0, p0}, Landroid/support/v7/preference/Preference$OnPreferenceChangeInternalListener;->onPreferenceHierarchyChange(Landroid/support/v7/preference/Preference;)V

    .line 1055
    :cond_9
    return-void
.end method

.method public onAttached()V
    .registers 1

    .prologue
    .line 1105
    invoke-direct {p0}, Landroid/support/v7/preference/Preference;->registerDependency()V

    .line 1106
    return-void
.end method

.method protected onAttachedToHierarchy(Landroid/support/v7/preference/PreferenceManager;)V
    .registers 4
    .param p1, "preferenceManager"    # Landroid/support/v7/preference/PreferenceManager;

    .prologue
    .line 1073
    iput-object p1, p0, Landroid/support/v7/preference/Preference;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    .line 1075
    iget-boolean v0, p0, Landroid/support/v7/preference/Preference;->mHasId:Z

    if-nez v0, :cond_c

    .line 1076
    invoke-virtual {p1}, Landroid/support/v7/preference/PreferenceManager;->getNextId()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/support/v7/preference/Preference;->mId:J

    .line 1079
    :cond_c
    invoke-direct {p0}, Landroid/support/v7/preference/Preference;->dispatchSetInitialValue()V

    .line 1080
    return-void
.end method

.method protected onAttachedToHierarchy(Landroid/support/v7/preference/PreferenceManager;J)V
    .registers 6
    .param p1, "preferenceManager"    # Landroid/support/v7/preference/PreferenceManager;
    .param p2, "id"    # J

    .prologue
    const/4 v1, 0x0

    .line 1087
    iput-wide p2, p0, Landroid/support/v7/preference/Preference;->mId:J

    .line 1088
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/preference/Preference;->mHasId:Z

    .line 1090
    :try_start_6
    invoke-virtual {p0, p1}, Landroid/support/v7/preference/Preference;->onAttachedToHierarchy(Landroid/support/v7/preference/PreferenceManager;)V
    :try_end_9
    .catchall {:try_start_6 .. :try_end_9} :catchall_c

    .line 1092
    iput-boolean v1, p0, Landroid/support/v7/preference/Preference;->mHasId:Z

    .line 1094
    return-void

    .line 1092
    :catchall_c
    move-exception v0

    iput-boolean v1, p0, Landroid/support/v7/preference/Preference;->mHasId:Z

    throw v0
.end method

.method public onBindViewHolder(Landroid/support/v7/preference/PreferenceViewHolder;)V
    .registers 13
    .param p1, "holder"    # Landroid/support/v7/preference/PreferenceViewHolder;

    .prologue
    const/16 v9, 0x8

    const/4 v8, 0x0

    .line 478
    iget-object v7, p1, Landroid/support/v7/preference/PreferenceViewHolder;->itemView:Landroid/view/View;

    iget-object v10, p0, Landroid/support/v7/preference/Preference;->mClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v7, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 480
    const v7, 0x1020016

    invoke-virtual {p1, v7}, Landroid/support/v7/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 481
    .local v6, "titleView":Landroid/widget/TextView;
    if-eqz v6, :cond_25

    .line 482
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v5

    .line 483
    .local v5, "title":Ljava/lang/CharSequence;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_a0

    .line 484
    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 485
    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 491
    .end local v5    # "title":Ljava/lang/CharSequence;
    :cond_25
    :goto_25
    const v7, 0x1020010

    invoke-virtual {p1, v7}, Landroid/support/v7/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 492
    .local v4, "summaryView":Landroid/widget/TextView;
    if-eqz v4, :cond_40

    .line 493
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v3

    .line 494
    .local v3, "summary":Ljava/lang/CharSequence;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_a4

    .line 495
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 496
    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 502
    .end local v3    # "summary":Ljava/lang/CharSequence;
    :cond_40
    :goto_40
    const v7, 0x1020006

    invoke-virtual {p1, v7}, Landroid/support/v7/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 503
    .local v1, "imageView":Landroid/widget/ImageView;
    if-eqz v1, :cond_74

    .line 504
    iget v7, p0, Landroid/support/v7/preference/Preference;->mIconResId:I

    if-nez v7, :cond_53

    iget-object v7, p0, Landroid/support/v7/preference/Preference;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_6c

    .line 505
    :cond_53
    iget-object v7, p0, Landroid/support/v7/preference/Preference;->mIcon:Landroid/graphics/drawable/Drawable;

    if-nez v7, :cond_63

    .line 506
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v7

    iget v10, p0, Landroid/support/v7/preference/Preference;->mIconResId:I

    invoke-static {v7, v10}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    iput-object v7, p0, Landroid/support/v7/preference/Preference;->mIcon:Landroid/graphics/drawable/Drawable;

    .line 508
    :cond_63
    iget-object v7, p0, Landroid/support/v7/preference/Preference;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_6c

    .line 509
    iget-object v7, p0, Landroid/support/v7/preference/Preference;->mIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 512
    :cond_6c
    iget-object v7, p0, Landroid/support/v7/preference/Preference;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_a8

    move v7, v8

    :goto_71
    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 515
    :cond_74
    sget v7, Landroid/support/v7/preference/R$id;->icon_frame:I

    invoke-virtual {p1, v7}, Landroid/support/v7/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 516
    .local v0, "imageFrame":Landroid/view/View;
    if-eqz v0, :cond_83

    .line 517
    iget-object v7, p0, Landroid/support/v7/preference/Preference;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_aa

    :goto_80
    invoke-virtual {v0, v8}, Landroid/view/View;->setVisibility(I)V

    .line 520
    :cond_83
    iget-boolean v7, p0, Landroid/support/v7/preference/Preference;->mShouldDisableView:Z

    if-eqz v7, :cond_ac

    .line 521
    iget-object v7, p1, Landroid/support/v7/preference/PreferenceViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->isEnabled()Z

    move-result v8

    invoke-direct {p0, v7, v8}, Landroid/support/v7/preference/Preference;->setEnabledStateOnViews(Landroid/view/View;Z)V

    .line 526
    :goto_90
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->isSelectable()Z

    move-result v2

    .line 527
    .local v2, "selectable":Z
    iget-object v7, p1, Landroid/support/v7/preference/PreferenceViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v7, v2}, Landroid/view/View;->setFocusable(Z)V

    .line 529
    invoke-virtual {p1, v2}, Landroid/support/v7/preference/PreferenceViewHolder;->setDividerAllowedAbove(Z)V

    .line 530
    invoke-virtual {p1, v2}, Landroid/support/v7/preference/PreferenceViewHolder;->setDividerAllowedBelow(Z)V

    .line 531
    return-void

    .line 487
    .end local v0    # "imageFrame":Landroid/view/View;
    .end local v1    # "imageView":Landroid/widget/ImageView;
    .end local v2    # "selectable":Z
    .end local v4    # "summaryView":Landroid/widget/TextView;
    .restart local v5    # "title":Ljava/lang/CharSequence;
    :cond_a0
    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_25

    .line 498
    .end local v5    # "title":Ljava/lang/CharSequence;
    .restart local v3    # "summary":Ljava/lang/CharSequence;
    .restart local v4    # "summaryView":Landroid/widget/TextView;
    :cond_a4
    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_40

    .end local v3    # "summary":Ljava/lang/CharSequence;
    .restart local v1    # "imageView":Landroid/widget/ImageView;
    :cond_a8
    move v7, v9

    .line 512
    goto :goto_71

    .restart local v0    # "imageFrame":Landroid/view/View;
    :cond_aa
    move v8, v9

    .line 517
    goto :goto_80

    .line 523
    :cond_ac
    iget-object v7, p1, Landroid/support/v7/preference/PreferenceViewHolder;->itemView:Landroid/view/View;

    const/4 v8, 0x1

    invoke-direct {p0, v7, v8}, Landroid/support/v7/preference/Preference;->setEnabledStateOnViews(Landroid/view/View;Z)V

    goto :goto_90
.end method

.method protected onClick()V
    .registers 1

    .prologue
    .line 798
    return-void
.end method

.method public onDependencyChanged(Landroid/support/v7/preference/Preference;Z)V
    .registers 4
    .param p1, "dependency"    # Landroid/support/v7/preference/Preference;
    .param p2, "disableDependent"    # Z

    .prologue
    .line 1208
    iget-boolean v0, p0, Landroid/support/v7/preference/Preference;->mDependencyMet:Z

    if-ne v0, p2, :cond_13

    .line 1209
    if-nez p2, :cond_14

    const/4 v0, 0x1

    :goto_7
    iput-boolean v0, p0, Landroid/support/v7/preference/Preference;->mDependencyMet:Z

    .line 1212
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->shouldDisableDependents()Z

    move-result v0

    invoke-virtual {p0, v0}, Landroid/support/v7/preference/Preference;->notifyDependencyChange(Z)V

    .line 1214
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->notifyChanged()V

    .line 1216
    :cond_13
    return-void

    .line 1209
    :cond_14
    const/4 v0, 0x0

    goto :goto_7
.end method

.method protected onGetDefaultValue(Landroid/content/res/TypedArray;I)Ljava/lang/Object;
    .registers 4
    .param p1, "a"    # Landroid/content/res/TypedArray;
    .param p2, "index"    # I

    .prologue
    .line 351
    const/4 v0, 0x0

    return-object v0
.end method

.method public onParentChanged(Landroid/support/v7/preference/Preference;Z)V
    .registers 4
    .param p1, "parent"    # Landroid/support/v7/preference/Preference;
    .param p2, "disableChild"    # Z

    .prologue
    .line 1225
    iget-boolean v0, p0, Landroid/support/v7/preference/Preference;->mParentDependencyMet:Z

    if-ne v0, p2, :cond_13

    .line 1226
    if-nez p2, :cond_14

    const/4 v0, 0x1

    :goto_7
    iput-boolean v0, p0, Landroid/support/v7/preference/Preference;->mParentDependencyMet:Z

    .line 1229
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->shouldDisableDependents()Z

    move-result v0

    invoke-virtual {p0, v0}, Landroid/support/v7/preference/Preference;->notifyDependencyChange(Z)V

    .line 1231
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->notifyChanged()V

    .line 1233
    :cond_13
    return-void

    .line 1226
    :cond_14
    const/4 v0, 0x0

    goto :goto_7
.end method

.method protected onPrepareForRemoval()V
    .registers 1

    .prologue
    .line 1276
    invoke-direct {p0}, Landroid/support/v7/preference/Preference;->unregisterDependency()V

    .line 1277
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 4
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 1687
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/preference/Preference;->mBaseMethodCalled:Z

    .line 1688
    sget-object v0, Landroid/support/v7/preference/Preference$BaseSavedState;->EMPTY_STATE:Landroid/view/AbsSavedState;

    if-eq p1, v0, :cond_11

    if-eqz p1, :cond_11

    .line 1689
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Wrong state class -- expecting Preference State"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1691
    :cond_11
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 2

    .prologue
    .line 1636
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/preference/Preference;->mBaseMethodCalled:Z

    .line 1637
    sget-object v0, Landroid/support/v7/preference/Preference$BaseSavedState;->EMPTY_STATE:Landroid/view/AbsSavedState;

    return-object v0
.end method

.method protected onSetInitialValue(ZLjava/lang/Object;)V
    .registers 3
    .param p1, "restorePersistedValue"    # Z
    .param p2, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 1320
    return-void
.end method

.method public peekExtras()Landroid/os/Bundle;
    .registers 2

    .prologue
    .line 408
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mExtras:Landroid/os/Bundle;

    return-object v0
.end method

.method public performClick()V
    .registers 5

    .prologue
    .line 948
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->isEnabled()Z

    move-result v3

    if-nez v3, :cond_7

    .line 971
    :cond_6
    :goto_6
    return-void

    .line 952
    :cond_7
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->onClick()V

    .line 954
    iget-object v3, p0, Landroid/support/v7/preference/Preference;->mOnClickListener:Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    if-eqz v3, :cond_16

    iget-object v3, p0, Landroid/support/v7/preference/Preference;->mOnClickListener:Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    invoke-interface {v3, p0}, Landroid/support/v7/preference/Preference$OnPreferenceClickListener;->onPreferenceClick(Landroid/support/v7/preference/Preference;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 958
    :cond_16
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->getPreferenceManager()Landroid/support/v7/preference/PreferenceManager;

    move-result-object v2

    .line 959
    .local v2, "preferenceManager":Landroid/support/v7/preference/PreferenceManager;
    if-eqz v2, :cond_28

    .line 960
    invoke-virtual {v2}, Landroid/support/v7/preference/PreferenceManager;->getOnPreferenceTreeClickListener()Landroid/support/v7/preference/PreferenceManager$OnPreferenceTreeClickListener;

    move-result-object v1

    .line 962
    .local v1, "listener":Landroid/support/v7/preference/PreferenceManager$OnPreferenceTreeClickListener;
    if-eqz v1, :cond_28

    invoke-interface {v1, p0}, Landroid/support/v7/preference/PreferenceManager$OnPreferenceTreeClickListener;->onPreferenceTreeClick(Landroid/support/v7/preference/Preference;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 967
    .end local v1    # "listener":Landroid/support/v7/preference/PreferenceManager$OnPreferenceTreeClickListener;
    :cond_28
    iget-object v3, p0, Landroid/support/v7/preference/Preference;->mIntent:Landroid/content/Intent;

    if-eqz v3, :cond_6

    .line 968
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 969
    .local v0, "context":Landroid/content/Context;
    iget-object v3, p0, Landroid/support/v7/preference/Preference;->mIntent:Landroid/content/Intent;

    invoke-virtual {v0, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_6
.end method

.method protected performClick(Landroid/view/View;)V
    .registers 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 938
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->performClick()V

    .line 939
    return-void
.end method

.method protected persistBoolean(Z)Z
    .registers 6
    .param p1, "value"    # Z

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 1521
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->shouldPersist()Z

    move-result v3

    if-eqz v3, :cond_21

    .line 1522
    if-nez p1, :cond_b

    move v1, v2

    :cond_b
    invoke-virtual {p0, v1}, Landroid/support/v7/preference/Preference;->getPersistedBoolean(Z)Z

    move-result v1

    if-ne p1, v1, :cond_12

    .line 1532
    :goto_11
    return v2

    .line 1527
    :cond_12
    iget-object v1, p0, Landroid/support/v7/preference/Preference;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v1}, Landroid/support/v7/preference/PreferenceManager;->getEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1528
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    iget-object v1, p0, Landroid/support/v7/preference/Preference;->mKey:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1529
    invoke-direct {p0, v0}, Landroid/support/v7/preference/Preference;->tryCommit(Landroid/content/SharedPreferences$Editor;)V

    goto :goto_11

    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_21
    move v2, v1

    .line 1532
    goto :goto_11
.end method

.method protected persistFloat(F)Z
    .registers 5
    .param p1, "value"    # F

    .prologue
    const/4 v1, 0x1

    .line 1433
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->shouldPersist()Z

    move-result v2

    if-eqz v2, :cond_21

    .line 1434
    const/high16 v2, 0x7fc00000    # Float.NaN

    invoke-virtual {p0, v2}, Landroid/support/v7/preference/Preference;->getPersistedFloat(F)F

    move-result v2

    cmpl-float v2, p1, v2

    if-nez v2, :cond_12

    .line 1444
    :goto_11
    return v1

    .line 1439
    :cond_12
    iget-object v2, p0, Landroid/support/v7/preference/Preference;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v2}, Landroid/support/v7/preference/PreferenceManager;->getEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1440
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    iget-object v2, p0, Landroid/support/v7/preference/Preference;->mKey:Ljava/lang/String;

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    .line 1441
    invoke-direct {p0, v0}, Landroid/support/v7/preference/Preference;->tryCommit(Landroid/content/SharedPreferences$Editor;)V

    goto :goto_11

    .line 1444
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_21
    const/4 v1, 0x0

    goto :goto_11
.end method

.method protected persistInt(I)Z
    .registers 5
    .param p1, "value"    # I

    .prologue
    const/4 v1, 0x1

    .line 1389
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->shouldPersist()Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 1390
    xor-int/lit8 v2, p1, -0x1

    invoke-virtual {p0, v2}, Landroid/support/v7/preference/Preference;->getPersistedInt(I)I

    move-result v2

    if-ne p1, v2, :cond_10

    .line 1400
    :goto_f
    return v1

    .line 1395
    :cond_10
    iget-object v2, p0, Landroid/support/v7/preference/Preference;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v2}, Landroid/support/v7/preference/PreferenceManager;->getEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1396
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    iget-object v2, p0, Landroid/support/v7/preference/Preference;->mKey:Ljava/lang/String;

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 1397
    invoke-direct {p0, v0}, Landroid/support/v7/preference/Preference;->tryCommit(Landroid/content/SharedPreferences$Editor;)V

    goto :goto_f

    .line 1400
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_1f
    const/4 v1, 0x0

    goto :goto_f
.end method

.method protected persistLong(J)Z
    .registers 7
    .param p1, "value"    # J

    .prologue
    const/4 v1, 0x1

    .line 1477
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->shouldPersist()Z

    move-result v2

    if-eqz v2, :cond_22

    .line 1478
    const-wide/16 v2, -0x1

    xor-long/2addr v2, p1

    invoke-virtual {p0, v2, v3}, Landroid/support/v7/preference/Preference;->getPersistedLong(J)J

    move-result-wide v2

    cmp-long v2, p1, v2

    if-nez v2, :cond_13

    .line 1488
    :goto_12
    return v1

    .line 1483
    :cond_13
    iget-object v2, p0, Landroid/support/v7/preference/Preference;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v2}, Landroid/support/v7/preference/PreferenceManager;->getEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1484
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    iget-object v2, p0, Landroid/support/v7/preference/Preference;->mKey:Ljava/lang/String;

    invoke-interface {v0, v2, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 1485
    invoke-direct {p0, v0}, Landroid/support/v7/preference/Preference;->tryCommit(Landroid/content/SharedPreferences$Editor;)V

    goto :goto_12

    .line 1488
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_22
    const/4 v1, 0x0

    goto :goto_12
.end method

.method protected persistString(Ljava/lang/String;)Z
    .registers 5
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 1342
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->shouldPersist()Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 1344
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Landroid/support/v7/preference/Preference;->getPersistedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-ne p1, v2, :cond_f

    .line 1354
    :goto_e
    return v1

    .line 1349
    :cond_f
    iget-object v2, p0, Landroid/support/v7/preference/Preference;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v2}, Landroid/support/v7/preference/PreferenceManager;->getEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1350
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    iget-object v2, p0, Landroid/support/v7/preference/Preference;->mKey:Ljava/lang/String;

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1351
    invoke-direct {p0, v0}, Landroid/support/v7/preference/Preference;->tryCommit(Landroid/content/SharedPreferences$Editor;)V

    goto :goto_e

    .line 1354
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_1e
    const/4 v1, 0x0

    goto :goto_e
.end method

.method requireKey()V
    .registers 3

    .prologue
    .line 832
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mKey:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 833
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Preference does not have a key assigned."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 836
    :cond_10
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/preference/Preference;->mRequiresKey:Z

    .line 837
    return-void
.end method

.method public restoreHierarchyState(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "container"    # Landroid/os/Bundle;

    .prologue
    .line 1649
    invoke-virtual {p0, p1}, Landroid/support/v7/preference/Preference;->dispatchRestoreInstanceState(Landroid/os/Bundle;)V

    .line 1650
    return-void
.end method

.method public saveHierarchyState(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "container"    # Landroid/os/Bundle;

    .prologue
    .line 1596
    invoke-virtual {p0, p1}, Landroid/support/v7/preference/Preference;->dispatchSaveInstanceState(Landroid/os/Bundle;)V

    .line 1597
    return-void
.end method

.method public setDefaultValue(Ljava/lang/Object;)V
    .registers 2
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 1287
    iput-object p1, p0, Landroid/support/v7/preference/Preference;->mDefaultValue:Ljava/lang/Object;

    .line 1288
    return-void
.end method

.method public setDependency(Ljava/lang/String;)V
    .registers 2
    .param p1, "dependencyKey"    # Ljava/lang/String;

    .prologue
    .line 1253
    invoke-direct {p0}, Landroid/support/v7/preference/Preference;->unregisterDependency()V

    .line 1256
    iput-object p1, p0, Landroid/support/v7/preference/Preference;->mDependencyKey:Ljava/lang/String;

    .line 1257
    invoke-direct {p0}, Landroid/support/v7/preference/Preference;->registerDependency()V

    .line 1258
    return-void
.end method

.method public setEnabled(Z)V
    .registers 3
    .param p1, "enabled"    # Z

    .prologue
    .line 691
    iget-boolean v0, p0, Landroid/support/v7/preference/Preference;->mEnabled:Z

    if-eq v0, p1, :cond_10

    .line 692
    iput-boolean p1, p0, Landroid/support/v7/preference/Preference;->mEnabled:Z

    .line 695
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->shouldDisableDependents()Z

    move-result v0

    invoke-virtual {p0, v0}, Landroid/support/v7/preference/Preference;->notifyDependencyChange(Z)V

    .line 697
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->notifyChanged()V

    .line 699
    :cond_10
    return-void
.end method

.method public setFragment(Ljava/lang/String;)V
    .registers 2
    .param p1, "fragment"    # Ljava/lang/String;

    .prologue
    .line 379
    iput-object p1, p0, Landroid/support/v7/preference/Preference;->mFragment:Ljava/lang/String;

    .line 380
    return-void
.end method

.method public setIcon(I)V
    .registers 3
    .param p1, "iconResId"    # I

    .prologue
    .line 638
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/preference/Preference;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 639
    iput p1, p0, Landroid/support/v7/preference/Preference;->mIconResId:I

    .line 640
    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 624
    if-nez p1, :cond_6

    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mIcon:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_c

    :cond_6
    if-eqz p1, :cond_14

    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_14

    .line 625
    :cond_c
    iput-object p1, p0, Landroid/support/v7/preference/Preference;->mIcon:Landroid/graphics/drawable/Drawable;

    .line 626
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/preference/Preference;->mIconResId:I

    .line 627
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->notifyChanged()V

    .line 629
    :cond_14
    return-void
.end method

.method public setIntent(Landroid/content/Intent;)V
    .registers 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 361
    iput-object p1, p0, Landroid/support/v7/preference/Preference;->mIntent:Landroid/content/Intent;

    .line 362
    return-void
.end method

.method public setKey(Ljava/lang/String;)V
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 807
    iput-object p1, p0, Landroid/support/v7/preference/Preference;->mKey:Ljava/lang/String;

    .line 809
    iget-boolean v0, p0, Landroid/support/v7/preference/Preference;->mRequiresKey:Z

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->hasKey()Z

    move-result v0

    if-nez v0, :cond_f

    .line 810
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->requireKey()V

    .line 812
    :cond_f
    return-void
.end method

.method public setLayoutResource(I)V
    .registers 2
    .param p1, "layoutResId"    # I

    .prologue
    .line 428
    iput p1, p0, Landroid/support/v7/preference/Preference;->mLayoutResId:I

    .line 429
    return-void
.end method

.method final setOnPreferenceChangeInternalListener(Landroid/support/v7/preference/Preference$OnPreferenceChangeInternalListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/support/v7/preference/Preference$OnPreferenceChangeInternalListener;

    .prologue
    .line 1034
    iput-object p1, p0, Landroid/support/v7/preference/Preference;->mListener:Landroid/support/v7/preference/Preference$OnPreferenceChangeInternalListener;

    .line 1035
    return-void
.end method

.method public setOnPreferenceChangeListener(Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;)V
    .registers 2
    .param p1, "onPreferenceChangeListener"    # Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;

    .prologue
    .line 903
    iput-object p1, p0, Landroid/support/v7/preference/Preference;->mOnChangeListener:Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;

    .line 904
    return-void
.end method

.method public setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V
    .registers 2
    .param p1, "onPreferenceClickListener"    # Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    .prologue
    .line 922
    iput-object p1, p0, Landroid/support/v7/preference/Preference;->mOnClickListener:Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    .line 923
    return-void
.end method

.method public setOrder(I)V
    .registers 3
    .param p1, "order"    # I

    .prologue
    .line 561
    iget v0, p0, Landroid/support/v7/preference/Preference;->mOrder:I

    if-eq p1, v0, :cond_9

    .line 562
    iput p1, p0, Landroid/support/v7/preference/Preference;->mOrder:I

    .line 565
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->notifyHierarchyChanged()V

    .line 567
    :cond_9
    return-void
.end method

.method public setPersistent(Z)V
    .registers 2
    .param p1, "persistent"    # Z

    .prologue
    .line 880
    iput-boolean p1, p0, Landroid/support/v7/preference/Preference;->mPersistent:Z

    .line 881
    return-void
.end method

.method public setSelectable(Z)V
    .registers 3
    .param p1, "selectable"    # Z

    .prologue
    .line 716
    iget-boolean v0, p0, Landroid/support/v7/preference/Preference;->mSelectable:Z

    if-eq v0, p1, :cond_9

    .line 717
    iput-boolean p1, p0, Landroid/support/v7/preference/Preference;->mSelectable:Z

    .line 718
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->notifyChanged()V

    .line 720
    :cond_9
    return-void
.end method

.method public setShouldDisableView(Z)V
    .registers 2
    .param p1, "shouldDisableView"    # Z

    .prologue
    .line 743
    iput-boolean p1, p0, Landroid/support/v7/preference/Preference;->mShouldDisableView:Z

    .line 744
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->notifyChanged()V

    .line 745
    return-void
.end method

.method public setSummary(I)V
    .registers 3
    .param p1, "summaryResId"    # I

    .prologue
    .line 681
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 682
    return-void
.end method

.method public setSummary(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "summary"    # Ljava/lang/CharSequence;

    .prologue
    .line 668
    if-nez p1, :cond_6

    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mSummary:Ljava/lang/CharSequence;

    if-nez v0, :cond_10

    :cond_6
    if-eqz p1, :cond_15

    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mSummary:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    .line 669
    :cond_10
    iput-object p1, p0, Landroid/support/v7/preference/Preference;->mSummary:Ljava/lang/CharSequence;

    .line 670
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->notifyChanged()V

    .line 672
    :cond_15
    return-void
.end method

.method public setTitle(I)V
    .registers 3
    .param p1, "titleResId"    # I

    .prologue
    .line 602
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 603
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 589
    if-nez p1, :cond_6

    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mTitle:Ljava/lang/CharSequence;

    if-nez v0, :cond_10

    :cond_6
    if-eqz p1, :cond_15

    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    .line 590
    :cond_10
    iput-object p1, p0, Landroid/support/v7/preference/Preference;->mTitle:Ljava/lang/CharSequence;

    .line 591
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->notifyChanged()V

    .line 593
    :cond_15
    return-void
.end method

.method public final setVisible(Z)V
    .registers 3
    .param p1, "visible"    # Z

    .prologue
    .line 764
    iget-boolean v0, p0, Landroid/support/v7/preference/Preference;->mVisible:Z

    if-eq v0, p1, :cond_f

    .line 765
    iput-boolean p1, p0, Landroid/support/v7/preference/Preference;->mVisible:Z

    .line 766
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mListener:Landroid/support/v7/preference/Preference$OnPreferenceChangeInternalListener;

    if-eqz v0, :cond_f

    .line 767
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mListener:Landroid/support/v7/preference/Preference$OnPreferenceChangeInternalListener;

    invoke-interface {v0, p0}, Landroid/support/v7/preference/Preference$OnPreferenceChangeInternalListener;->onPreferenceVisibilityChange(Landroid/support/v7/preference/Preference;)V

    .line 770
    :cond_f
    return-void
.end method

.method public setWidgetLayoutResource(I)V
    .registers 2
    .param p1, "widgetLayoutResId"    # I

    .prologue
    .line 453
    iput p1, p0, Landroid/support/v7/preference/Preference;->mWidgetLayoutResId:I

    .line 454
    return-void
.end method

.method public shouldDisableDependents()Z
    .registers 2

    .prologue
    .line 1242
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method protected shouldPersist()Z
    .registers 2

    .prologue
    .line 868
    iget-object v0, p0, Landroid/support/v7/preference/Preference;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    if-eqz v0, :cond_12

    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->isPersistent()Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->hasKey()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1556
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->getFilterableStringBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
