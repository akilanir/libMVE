.class public abstract Landroid/support/v14/preference/PreferenceFragment;
.super Landroid/app/Fragment;
.source "PreferenceFragment.java"

# interfaces
.implements Landroid/support/v7/preference/PreferenceManager$OnPreferenceTreeClickListener;
.implements Landroid/support/v7/preference/PreferenceManager$OnDisplayPreferenceDialogListener;
.implements Landroid/support/v7/preference/PreferenceManager$OnNavigateToScreenListener;
.implements Landroid/support/v7/preference/DialogPreference$TargetFragment;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;,
        Landroid/support/v14/preference/PreferenceFragment$OnPreferenceDisplayDialogCallback;,
        Landroid/support/v14/preference/PreferenceFragment$OnPreferenceStartScreenCallback;,
        Landroid/support/v14/preference/PreferenceFragment$OnPreferenceStartFragmentCallback;
    }
.end annotation


# static fields
.field public static final ARG_PREFERENCE_ROOT:Ljava/lang/String; = "android.support.v7.preference.PreferenceFragmentCompat.PREFERENCE_ROOT"

.field private static final DIALOG_FRAGMENT_TAG:Ljava/lang/String; = "android.support.v14.preference.PreferenceFragment.DIALOG"

.field private static final MSG_BIND_PREFERENCES:I = 0x1

.field private static final PREFERENCES_TAG:Ljava/lang/String; = "android:preferences"


# instance fields
.field private final mDividerDecoration:Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;

.field private mHandler:Landroid/os/Handler;

.field private mHavePrefs:Z

.field private mInitDone:Z

.field private mLayoutResId:I

.field private mList:Landroid/support/v7/widget/RecyclerView;

.field private mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

.field private final mRequestFocus:Ljava/lang/Runnable;

.field private mStyledContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 111
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 136
    sget v0, Landroid/support/v14/preference/R$layout;->preference_list_fragment:I

    iput v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mLayoutResId:I

    .line 138
    new-instance v0, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;-><init>(Landroid/support/v14/preference/PreferenceFragment;Landroid/support/v14/preference/PreferenceFragment$1;)V

    iput-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mDividerDecoration:Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;

    .line 141
    new-instance v0, Landroid/support/v14/preference/PreferenceFragment$1;

    invoke-direct {v0, p0}, Landroid/support/v14/preference/PreferenceFragment$1;-><init>(Landroid/support/v14/preference/PreferenceFragment;)V

    iput-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mHandler:Landroid/os/Handler;

    .line 153
    new-instance v0, Landroid/support/v14/preference/PreferenceFragment$2;

    invoke-direct {v0, p0}, Landroid/support/v14/preference/PreferenceFragment$2;-><init>(Landroid/support/v14/preference/PreferenceFragment;)V

    iput-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mRequestFocus:Ljava/lang/Runnable;

    .line 631
    return-void
.end method

.method static synthetic access$100(Landroid/support/v14/preference/PreferenceFragment;)V
    .registers 1
    .param p0, "x0"    # Landroid/support/v14/preference/PreferenceFragment;

    .prologue
    .line 111
    invoke-direct {p0}, Landroid/support/v14/preference/PreferenceFragment;->bindPreferences()V

    return-void
.end method

.method static synthetic access$200(Landroid/support/v14/preference/PreferenceFragment;)Landroid/support/v7/widget/RecyclerView;
    .registers 2
    .param p0, "x0"    # Landroid/support/v14/preference/PreferenceFragment;

    .prologue
    .line 111
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mList:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method private bindPreferences()V
    .registers 4

    .prologue
    .line 515
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getPreferenceScreen()Landroid/support/v7/preference/PreferenceScreen;

    move-result-object v0

    .line 516
    .local v0, "preferenceScreen":Landroid/support/v7/preference/PreferenceScreen;
    if-eqz v0, :cond_14

    .line 517
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getListView()Landroid/support/v7/widget/RecyclerView;

    move-result-object v1

    invoke-virtual {p0, v0}, Landroid/support/v14/preference/PreferenceFragment;->onCreateAdapter(Landroid/support/v7/preference/PreferenceScreen;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 518
    invoke-virtual {v0}, Landroid/support/v7/preference/PreferenceScreen;->onAttached()V

    .line 520
    :cond_14
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->onBindPreferences()V

    .line 521
    return-void
.end method

.method private postBindPreferences()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 510
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 512
    :goto_9
    return-void

    .line 511
    :cond_a
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    goto :goto_9
.end method

.method private requirePreferenceManager()V
    .registers 3

    .prologue
    .line 504
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    if-nez v0, :cond_c

    .line 505
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "This should be called after super.onCreate."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 507
    :cond_c
    return-void
.end method


# virtual methods
.method public addPreferencesFromResource(I)V
    .registers 5
    .param p1, "preferencesResId"    # I
        .annotation build Landroid/support/annotation/XmlRes;
        .end annotation
    .end param

    .prologue
    .line 412
    invoke-direct {p0}, Landroid/support/v14/preference/PreferenceFragment;->requirePreferenceManager()V

    .line 414
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    iget-object v1, p0, Landroid/support/v14/preference/PreferenceFragment;->mStyledContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getPreferenceScreen()Landroid/support/v7/preference/PreferenceScreen;

    move-result-object v2

    invoke-virtual {v0, v1, p1, v2}, Landroid/support/v7/preference/PreferenceManager;->inflateFromResource(Landroid/content/Context;ILandroid/support/v7/preference/PreferenceScreen;)Landroid/support/v7/preference/PreferenceScreen;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v14/preference/PreferenceFragment;->setPreferenceScreen(Landroid/support/v7/preference/PreferenceScreen;)V

    .line 416
    return-void
.end method

.method public findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;
    .registers 3
    .param p1, "key"    # Ljava/lang/CharSequence;

    .prologue
    .line 497
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    if-nez v0, :cond_6

    .line 498
    const/4 v0, 0x0

    .line 500
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/preference/PreferenceManager;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    goto :goto_5
.end method

.method public getCallbackFragment()Landroid/app/Fragment;
    .registers 2

    .prologue
    .line 628
    const/4 v0, 0x0

    return-object v0
.end method

.method public final getListView()Landroid/support/v7/widget/RecyclerView;
    .registers 2

    .prologue
    .line 532
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mList:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method public getPreferenceManager()Landroid/support/v7/preference/PreferenceManager;
    .registers 2

    .prologue
    .line 377
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    return-object v0
.end method

.method public getPreferenceScreen()Landroid/support/v7/preference/PreferenceScreen;
    .registers 2

    .prologue
    .line 402
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0}, Landroid/support/v7/preference/PreferenceManager;->getPreferenceScreen()Landroid/support/v7/preference/PreferenceScreen;

    move-result-object v0

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 319
    invoke-super {p0, p1}, Landroid/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 321
    iget-boolean v2, p0, Landroid/support/v14/preference/PreferenceFragment;->mHavePrefs:Z

    if-eqz v2, :cond_a

    .line 322
    invoke-direct {p0}, Landroid/support/v14/preference/PreferenceFragment;->bindPreferences()V

    .line 325
    :cond_a
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/support/v14/preference/PreferenceFragment;->mInitDone:Z

    .line 327
    if-eqz p1, :cond_20

    .line 328
    const-string v2, "android:preferences"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 329
    .local v0, "container":Landroid/os/Bundle;
    if-eqz v0, :cond_20

    .line 330
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getPreferenceScreen()Landroid/support/v7/preference/PreferenceScreen;

    move-result-object v1

    .line 331
    .local v1, "preferenceScreen":Landroid/support/v7/preference/PreferenceScreen;
    if-eqz v1, :cond_20

    .line 332
    invoke-virtual {v1, v0}, Landroid/support/v7/preference/PreferenceScreen;->restoreHierarchyState(Landroid/os/Bundle;)V

    .line 336
    .end local v0    # "container":Landroid/os/Bundle;
    .end local v1    # "preferenceScreen":Landroid/support/v7/preference/PreferenceScreen;
    :cond_20
    return-void
.end method

.method protected onBindPreferences()V
    .registers 1

    .prologue
    .line 525
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 206
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 207
    new-instance v3, Landroid/util/TypedValue;

    invoke-direct {v3}, Landroid/util/TypedValue;-><init>()V

    .line 208
    .local v3, "tv":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    sget v5, Landroid/support/v14/preference/R$attr;->preferenceTheme:I

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v3, v6}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 209
    iget v2, v3, Landroid/util/TypedValue;->resourceId:I

    .line 210
    .local v2, "theme":I
    if-gtz v2, :cond_22

    .line 211
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "Must specify preferenceTheme in theme"

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 213
    :cond_22
    new-instance v4, Landroid/view/ContextThemeWrapper;

    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object v4, p0, Landroid/support/v14/preference/PreferenceFragment;->mStyledContext:Landroid/content/Context;

    .line 215
    new-instance v4, Landroid/support/v7/preference/PreferenceManager;

    iget-object v5, p0, Landroid/support/v14/preference/PreferenceFragment;->mStyledContext:Landroid/content/Context;

    invoke-direct {v4, v5}, Landroid/support/v7/preference/PreferenceManager;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Landroid/support/v14/preference/PreferenceFragment;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    .line 216
    iget-object v4, p0, Landroid/support/v14/preference/PreferenceFragment;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v4, p0}, Landroid/support/v7/preference/PreferenceManager;->setOnNavigateToScreenListener(Landroid/support/v7/preference/PreferenceManager$OnNavigateToScreenListener;)V

    .line 217
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 219
    .local v0, "args":Landroid/os/Bundle;
    if-eqz v0, :cond_4f

    .line 220
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    const-string v5, "android.support.v7.preference.PreferenceFragmentCompat.PREFERENCE_ROOT"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 224
    .local v1, "rootKey":Ljava/lang/String;
    :goto_4b
    invoke-virtual {p0, p1, v1}, Landroid/support/v14/preference/PreferenceFragment;->onCreatePreferences(Landroid/os/Bundle;Ljava/lang/String;)V

    .line 225
    return-void

    .line 222
    .end local v1    # "rootKey":Ljava/lang/String;
    :cond_4f
    const/4 v1, 0x0

    .restart local v1    # "rootKey":Ljava/lang/String;
    goto :goto_4b
.end method

.method protected onCreateAdapter(Landroid/support/v7/preference/PreferenceScreen;)Landroid/support/v7/widget/RecyclerView$Adapter;
    .registers 3
    .param p1, "preferenceScreen"    # Landroid/support/v7/preference/PreferenceScreen;

    .prologue
    .line 575
    new-instance v0, Landroid/support/v7/preference/PreferenceGroupAdapter;

    invoke-direct {v0, p1}, Landroid/support/v7/preference/PreferenceGroupAdapter;-><init>(Landroid/support/v7/preference/PreferenceGroup;)V

    return-object v0
.end method

.method public onCreateLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;
    .registers 3

    .prologue
    .line 565
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public abstract onCreatePreferences(Landroid/os/Bundle;Ljava/lang/String;)V
.end method

.method public onCreateRecyclerView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/support/v7/widget/RecyclerView;
    .registers 7
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "parent"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 550
    sget v1, Landroid/support/v14/preference/R$layout;->preference_recyclerview:I

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    .line 553
    .local v0, "recyclerView":Landroid/support/v7/widget/RecyclerView;
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->onCreateLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 555
    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 22
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 243
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v14/preference/PreferenceFragment;->mStyledContext:Landroid/content/Context;

    const/4 v14, 0x0

    sget-object v15, Landroid/support/v14/preference/R$styleable;->PreferenceFragment:[I

    sget v16, Landroid/support/v14/preference/R$attr;->preferenceFragmentStyle:I

    const/16 v17, 0x0

    invoke-virtual/range {v13 .. v17}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v2

    .line 248
    .local v2, "a":Landroid/content/res/TypedArray;
    sget v13, Landroid/support/v14/preference/R$styleable;->PreferenceFragment_android_layout:I

    move-object/from16 v0, p0

    iget v14, v0, Landroid/support/v14/preference/PreferenceFragment;->mLayoutResId:I

    invoke-virtual {v2, v13, v14}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v13

    move-object/from16 v0, p0

    iput v13, v0, Landroid/support/v14/preference/PreferenceFragment;->mLayoutResId:I

    .line 250
    sget v13, Landroid/support/v14/preference/R$styleable;->PreferenceFragment_android_divider:I

    invoke-virtual {v2, v13}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 251
    .local v3, "divider":Landroid/graphics/drawable/Drawable;
    sget v13, Landroid/support/v14/preference/R$styleable;->PreferenceFragment_android_dividerHeight:I

    const/4 v14, -0x1

    invoke-virtual {v2, v13, v14}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    .line 254
    .local v4, "dividerHeight":I
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 257
    new-instance v11, Landroid/util/TypedValue;

    invoke-direct {v11}, Landroid/util/TypedValue;-><init>()V

    .line 258
    .local v11, "tv":Landroid/util/TypedValue;
    invoke-virtual/range {p0 .. p0}, Landroid/support/v14/preference/PreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v13

    invoke-virtual {v13}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v13

    sget v14, Landroid/support/v14/preference/R$attr;->preferenceTheme:I

    const/4 v15, 0x1

    invoke-virtual {v13, v14, v11, v15}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 259
    iget v8, v11, Landroid/util/TypedValue;->resourceId:I

    .line 261
    .local v8, "theme":I
    new-instance v9, Landroid/view/ContextThemeWrapper;

    invoke-virtual/range {p1 .. p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v9, v13, v8}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 262
    .local v9, "themedContext":Landroid/content/Context;
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v10

    .line 264
    .local v10, "themedInflater":Landroid/view/LayoutInflater;
    move-object/from16 v0, p0

    iget v13, v0, Landroid/support/v14/preference/PreferenceFragment;->mLayoutResId:I

    const/4 v14, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v10, v13, v0, v14}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v12

    .line 266
    .local v12, "view":Landroid/view/View;
    sget v13, Landroid/support/v14/preference/R$id;->list_container:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    .line 267
    .local v7, "rawListContainer":Landroid/view/View;
    instance-of v13, v7, Landroid/view/ViewGroup;

    if-nez v13, :cond_6e

    .line 268
    new-instance v13, Ljava/lang/RuntimeException;

    const-string v14, "Content has view with id attribute \'R.id.list_container\' that is not a ViewGroup class"

    invoke-direct {v13, v14}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v13

    :cond_6e
    move-object v5, v7

    .line 272
    check-cast v5, Landroid/view/ViewGroup;

    .line 274
    .local v5, "listContainer":Landroid/view/ViewGroup;
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v10, v5, v1}, Landroid/support/v14/preference/PreferenceFragment;->onCreateRecyclerView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v6

    .line 276
    .local v6, "listView":Landroid/support/v7/widget/RecyclerView;
    if-nez v6, :cond_83

    .line 277
    new-instance v13, Ljava/lang/RuntimeException;

    const-string v14, "Could not create RecyclerView"

    invoke-direct {v13, v14}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 280
    :cond_83
    move-object/from16 v0, p0

    iput-object v6, v0, Landroid/support/v14/preference/PreferenceFragment;->mList:Landroid/support/v7/widget/RecyclerView;

    .line 282
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v14/preference/PreferenceFragment;->mDividerDecoration:Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;

    invoke-virtual {v6, v13}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 283
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Landroid/support/v14/preference/PreferenceFragment;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 284
    const/4 v13, -0x1

    if-eq v4, v13, :cond_9b

    .line 285
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Landroid/support/v14/preference/PreferenceFragment;->setDividerHeight(I)V

    .line 288
    :cond_9b
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v14/preference/PreferenceFragment;->mList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v5, v13}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 289
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v14/preference/PreferenceFragment;->mHandler:Landroid/os/Handler;

    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v14/preference/PreferenceFragment;->mRequestFocus:Ljava/lang/Runnable;

    invoke-virtual {v13, v14}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 290
    return-object v12
.end method

.method public onDestroyView()V
    .registers 3

    .prologue
    .line 354
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mList:Landroid/support/v7/widget/RecyclerView;

    .line 355
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroid/support/v14/preference/PreferenceFragment;->mRequestFocus:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 356
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 357
    invoke-super {p0}, Landroid/app/Fragment;->onDestroyView()V

    .line 358
    return-void
.end method

.method public onDisplayPreferenceDialog(Landroid/support/v7/preference/Preference;)V
    .registers 6
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 588
    const/4 v1, 0x0

    .line 589
    .local v1, "handled":Z
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getCallbackFragment()Landroid/app/Fragment;

    move-result-object v2

    instance-of v2, v2, Landroid/support/v14/preference/PreferenceFragment$OnPreferenceDisplayDialogCallback;

    if-eqz v2, :cond_13

    .line 590
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getCallbackFragment()Landroid/app/Fragment;

    move-result-object v2

    check-cast v2, Landroid/support/v14/preference/PreferenceFragment$OnPreferenceDisplayDialogCallback;

    invoke-interface {v2, p0, p1}, Landroid/support/v14/preference/PreferenceFragment$OnPreferenceDisplayDialogCallback;->onPreferenceDisplayDialog(Landroid/support/v14/preference/PreferenceFragment;Landroid/support/v7/preference/Preference;)Z

    move-result v1

    .line 593
    :cond_13
    if-nez v1, :cond_27

    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    instance-of v2, v2, Landroid/support/v14/preference/PreferenceFragment$OnPreferenceDisplayDialogCallback;

    if-eqz v2, :cond_27

    .line 594
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    check-cast v2, Landroid/support/v14/preference/PreferenceFragment$OnPreferenceDisplayDialogCallback;

    invoke-interface {v2, p0, p1}, Landroid/support/v14/preference/PreferenceFragment$OnPreferenceDisplayDialogCallback;->onPreferenceDisplayDialog(Landroid/support/v14/preference/PreferenceFragment;Landroid/support/v7/preference/Preference;)Z

    move-result v1

    .line 598
    :cond_27
    if-eqz v1, :cond_2a

    .line 620
    :cond_29
    :goto_29
    return-void

    .line 603
    :cond_2a
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    const-string v3, "android.support.v14.preference.PreferenceFragment.DIALOG"

    invoke-virtual {v2, v3}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v2

    if-nez v2, :cond_29

    .line 608
    instance-of v2, p1, Landroid/support/v7/preference/EditTextPreference;

    if-eqz v2, :cond_50

    .line 609
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v14/preference/EditTextPreferenceDialogFragment;->newInstance(Ljava/lang/String;)Landroid/support/v14/preference/EditTextPreferenceDialogFragment;

    move-result-object v0

    .line 618
    .local v0, "f":Landroid/app/DialogFragment;
    :goto_42
    const/4 v2, 0x0

    invoke-virtual {v0, p0, v2}, Landroid/app/DialogFragment;->setTargetFragment(Landroid/app/Fragment;I)V

    .line 619
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    const-string v3, "android.support.v14.preference.PreferenceFragment.DIALOG"

    invoke-virtual {v0, v2, v3}, Landroid/app/DialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    goto :goto_29

    .line 610
    .end local v0    # "f":Landroid/app/DialogFragment;
    :cond_50
    instance-of v2, p1, Landroid/support/v7/preference/ListPreference;

    if-eqz v2, :cond_5d

    .line 611
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v14/preference/ListPreferenceDialogFragment;->newInstance(Ljava/lang/String;)Landroid/support/v14/preference/ListPreferenceDialogFragment;

    move-result-object v0

    .restart local v0    # "f":Landroid/app/DialogFragment;
    goto :goto_42

    .line 612
    .end local v0    # "f":Landroid/app/DialogFragment;
    :cond_5d
    instance-of v2, p1, Landroid/support/v14/preference/MultiSelectListPreference;

    if-eqz v2, :cond_6a

    .line 613
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v14/preference/MultiSelectListPreferenceDialogFragment;->newInstance(Ljava/lang/String;)Landroid/support/v14/preference/MultiSelectListPreferenceDialogFragment;

    move-result-object v0

    .restart local v0    # "f":Landroid/app/DialogFragment;
    goto :goto_42

    .line 615
    .end local v0    # "f":Landroid/app/DialogFragment;
    :cond_6a
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Tried to display dialog for unknown preference type. Did you forget to override onDisplayPreferenceDialog()?"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public onNavigateToScreen(Landroid/support/v7/preference/PreferenceScreen;)V
    .registers 4
    .param p1, "preferenceScreen"    # Landroid/support/v7/preference/PreferenceScreen;

    .prologue
    .line 478
    const/4 v0, 0x0

    .line 479
    .local v0, "handled":Z
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getCallbackFragment()Landroid/app/Fragment;

    move-result-object v1

    instance-of v1, v1, Landroid/support/v14/preference/PreferenceFragment$OnPreferenceStartScreenCallback;

    if-eqz v1, :cond_13

    .line 480
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getCallbackFragment()Landroid/app/Fragment;

    move-result-object v1

    check-cast v1, Landroid/support/v14/preference/PreferenceFragment$OnPreferenceStartScreenCallback;

    invoke-interface {v1, p0, p1}, Landroid/support/v14/preference/PreferenceFragment$OnPreferenceStartScreenCallback;->onPreferenceStartScreen(Landroid/support/v14/preference/PreferenceFragment;Landroid/support/v7/preference/PreferenceScreen;)Z

    move-result v0

    .line 483
    :cond_13
    if-nez v0, :cond_26

    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    instance-of v1, v1, Landroid/support/v14/preference/PreferenceFragment$OnPreferenceStartScreenCallback;

    if-eqz v1, :cond_26

    .line 484
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    check-cast v1, Landroid/support/v14/preference/PreferenceFragment$OnPreferenceStartScreenCallback;

    invoke-interface {v1, p0, p1}, Landroid/support/v14/preference/PreferenceFragment$OnPreferenceStartScreenCallback;->onPreferenceStartScreen(Landroid/support/v14/preference/PreferenceFragment;Landroid/support/v7/preference/PreferenceScreen;)Z

    .line 487
    :cond_26
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/support/v7/preference/Preference;)Z
    .registers 4
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 451
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getFragment()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2e

    .line 452
    const/4 v0, 0x0

    .line 453
    .local v0, "handled":Z
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getCallbackFragment()Landroid/app/Fragment;

    move-result-object v1

    instance-of v1, v1, Landroid/support/v14/preference/PreferenceFragment$OnPreferenceStartFragmentCallback;

    if-eqz v1, :cond_19

    .line 454
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getCallbackFragment()Landroid/app/Fragment;

    move-result-object v1

    check-cast v1, Landroid/support/v14/preference/PreferenceFragment$OnPreferenceStartFragmentCallback;

    invoke-interface {v1, p0, p1}, Landroid/support/v14/preference/PreferenceFragment$OnPreferenceStartFragmentCallback;->onPreferenceStartFragment(Landroid/support/v14/preference/PreferenceFragment;Landroid/support/v7/preference/Preference;)Z

    move-result v0

    .line 457
    :cond_19
    if-nez v0, :cond_2d

    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    instance-of v1, v1, Landroid/support/v14/preference/PreferenceFragment$OnPreferenceStartFragmentCallback;

    if-eqz v1, :cond_2d

    .line 458
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    check-cast v1, Landroid/support/v14/preference/PreferenceFragment$OnPreferenceStartFragmentCallback;

    invoke-interface {v1, p0, p1}, Landroid/support/v14/preference/PreferenceFragment$OnPreferenceStartFragmentCallback;->onPreferenceStartFragment(Landroid/support/v14/preference/PreferenceFragment;Landroid/support/v7/preference/Preference;)Z

    move-result v0

    .line 463
    .end local v0    # "handled":Z
    :cond_2d
    :goto_2d
    return v0

    :cond_2e
    const/4 v0, 0x0

    goto :goto_2d
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 362
    invoke-super {p0, p1}, Landroid/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 364
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->getPreferenceScreen()Landroid/support/v7/preference/PreferenceScreen;

    move-result-object v1

    .line 365
    .local v1, "preferenceScreen":Landroid/support/v7/preference/PreferenceScreen;
    if-eqz v1, :cond_16

    .line 366
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 367
    .local v0, "container":Landroid/os/Bundle;
    invoke-virtual {v1, v0}, Landroid/support/v7/preference/PreferenceScreen;->saveHierarchyState(Landroid/os/Bundle;)V

    .line 368
    const-string v2, "android:preferences"

    invoke-virtual {p1, v2, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 370
    .end local v0    # "container":Landroid/os/Bundle;
    :cond_16
    return-void
.end method

.method public onStart()V
    .registers 2

    .prologue
    .line 340
    invoke-super {p0}, Landroid/app/Fragment;->onStart()V

    .line 341
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0, p0}, Landroid/support/v7/preference/PreferenceManager;->setOnPreferenceTreeClickListener(Landroid/support/v7/preference/PreferenceManager$OnPreferenceTreeClickListener;)V

    .line 342
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0, p0}, Landroid/support/v7/preference/PreferenceManager;->setOnDisplayPreferenceDialogListener(Landroid/support/v7/preference/PreferenceManager$OnDisplayPreferenceDialogListener;)V

    .line 343
    return-void
.end method

.method public onStop()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 347
    invoke-super {p0}, Landroid/app/Fragment;->onStop()V

    .line 348
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/PreferenceManager;->setOnPreferenceTreeClickListener(Landroid/support/v7/preference/PreferenceManager$OnPreferenceTreeClickListener;)V

    .line 349
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/PreferenceManager;->setOnDisplayPreferenceDialogListener(Landroid/support/v7/preference/PreferenceManager$OnDisplayPreferenceDialogListener;)V

    .line 350
    return-void
.end method

.method protected onUnbindPreferences()V
    .registers 1

    .prologue
    .line 529
    return-void
.end method

.method public setDivider(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "divider"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 303
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mDividerDecoration:Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;

    invoke-virtual {v0, p1}, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 304
    return-void
.end method

.method public setDividerHeight(I)V
    .registers 3
    .param p1, "height"    # I

    .prologue
    .line 314
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mDividerDecoration:Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;

    invoke-virtual {v0, p1}, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->setDividerHeight(I)V

    .line 315
    return-void
.end method

.method public setPreferenceScreen(Landroid/support/v7/preference/PreferenceScreen;)V
    .registers 3
    .param p1, "preferenceScreen"    # Landroid/support/v7/preference/PreferenceScreen;

    .prologue
    .line 386
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/preference/PreferenceManager;->setPreferences(Landroid/support/v7/preference/PreferenceScreen;)Z

    move-result v0

    if-eqz v0, :cond_17

    if-eqz p1, :cond_17

    .line 387
    invoke-virtual {p0}, Landroid/support/v14/preference/PreferenceFragment;->onUnbindPreferences()V

    .line 388
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mHavePrefs:Z

    .line 389
    iget-boolean v0, p0, Landroid/support/v14/preference/PreferenceFragment;->mInitDone:Z

    if-eqz v0, :cond_17

    .line 390
    invoke-direct {p0}, Landroid/support/v14/preference/PreferenceFragment;->postBindPreferences()V

    .line 393
    :cond_17
    return-void
.end method

.method public setPreferencesFromResource(ILjava/lang/String;)V
    .registers 8
    .param p1, "preferencesResId"    # I
        .annotation build Landroid/support/annotation/XmlRes;
        .end annotation
    .end param
    .param p2, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 428
    invoke-direct {p0}, Landroid/support/v14/preference/PreferenceFragment;->requirePreferenceManager()V

    .line 430
    iget-object v2, p0, Landroid/support/v14/preference/PreferenceFragment;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    iget-object v3, p0, Landroid/support/v14/preference/PreferenceFragment;->mStyledContext:Landroid/content/Context;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, p1, v4}, Landroid/support/v7/preference/PreferenceManager;->inflateFromResource(Landroid/content/Context;ILandroid/support/v7/preference/PreferenceScreen;)Landroid/support/v7/preference/PreferenceScreen;

    move-result-object v1

    .line 434
    .local v1, "xmlRoot":Landroid/support/v7/preference/PreferenceScreen;
    if-eqz p2, :cond_35

    .line 435
    invoke-virtual {v1, p2}, Landroid/support/v7/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 436
    .local v0, "root":Landroid/support/v7/preference/Preference;
    instance-of v2, v0, Landroid/support/v7/preference/PreferenceScreen;

    if-nez v2, :cond_36

    .line 437
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Preference object with key "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is not a PreferenceScreen"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 441
    .end local v0    # "root":Landroid/support/v7/preference/Preference;
    :cond_35
    move-object v0, v1

    .line 444
    .restart local v0    # "root":Landroid/support/v7/preference/Preference;
    :cond_36
    check-cast v0, Landroid/support/v7/preference/PreferenceScreen;

    .end local v0    # "root":Landroid/support/v7/preference/Preference;
    invoke-virtual {p0, v0}, Landroid/support/v14/preference/PreferenceFragment;->setPreferenceScreen(Landroid/support/v7/preference/PreferenceScreen;)V

    .line 445
    return-void
.end method
