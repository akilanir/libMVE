.class public abstract Landroid/support/v7/preference/PreferenceFragmentCompat;
.super Landroid/support/v4/app/Fragment;
.source "PreferenceFragmentCompat.java"

# interfaces
.implements Landroid/support/v7/preference/PreferenceManager$OnPreferenceTreeClickListener;
.implements Landroid/support/v7/preference/PreferenceManager$OnDisplayPreferenceDialogListener;
.implements Landroid/support/v7/preference/PreferenceManager$OnNavigateToScreenListener;
.implements Landroid/support/v7/preference/DialogPreference$TargetFragment;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;,
        Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceDisplayDialogCallback;,
        Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceStartScreenCallback;,
        Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceStartFragmentCallback;
    }
.end annotation


# static fields
.field public static final ARG_PREFERENCE_ROOT:Ljava/lang/String; = "android.support.v7.preference.PreferenceFragmentCompat.PREFERENCE_ROOT"

.field private static final DIALOG_FRAGMENT_TAG:Ljava/lang/String; = "android.support.v7.preference.PreferenceFragment.DIALOG"

.field private static final MSG_BIND_PREFERENCES:I = 0x1

.field private static final PREFERENCES_TAG:Ljava/lang/String; = "android:preferences"


# instance fields
.field private final mDividerDecoration:Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;

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
    .line 103
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 128
    sget v0, Landroid/support/v7/preference/R$layout;->preference_list_fragment:I

    iput v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mLayoutResId:I

    .line 130
    new-instance v0, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;-><init>(Landroid/support/v7/preference/PreferenceFragmentCompat;Landroid/support/v7/preference/PreferenceFragmentCompat$1;)V

    iput-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mDividerDecoration:Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;

    .line 133
    new-instance v0, Landroid/support/v7/preference/PreferenceFragmentCompat$1;

    invoke-direct {v0, p0}, Landroid/support/v7/preference/PreferenceFragmentCompat$1;-><init>(Landroid/support/v7/preference/PreferenceFragmentCompat;)V

    iput-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mHandler:Landroid/os/Handler;

    .line 145
    new-instance v0, Landroid/support/v7/preference/PreferenceFragmentCompat$2;

    invoke-direct {v0, p0}, Landroid/support/v7/preference/PreferenceFragmentCompat$2;-><init>(Landroid/support/v7/preference/PreferenceFragmentCompat;)V

    iput-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mRequestFocus:Ljava/lang/Runnable;

    .line 623
    return-void
.end method

.method static synthetic access$100(Landroid/support/v7/preference/PreferenceFragmentCompat;)V
    .registers 1
    .param p0, "x0"    # Landroid/support/v7/preference/PreferenceFragmentCompat;

    .prologue
    .line 103
    invoke-direct {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->bindPreferences()V

    return-void
.end method

.method static synthetic access$200(Landroid/support/v7/preference/PreferenceFragmentCompat;)Landroid/support/v7/widget/RecyclerView;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/preference/PreferenceFragmentCompat;

    .prologue
    .line 103
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mList:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method private bindPreferences()V
    .registers 4

    .prologue
    .line 509
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroid/support/v7/preference/PreferenceScreen;

    move-result-object v0

    .line 510
    .local v0, "preferenceScreen":Landroid/support/v7/preference/PreferenceScreen;
    if-eqz v0, :cond_14

    .line 511
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getListView()Landroid/support/v7/widget/RecyclerView;

    move-result-object v1

    invoke-virtual {p0, v0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->onCreateAdapter(Landroid/support/v7/preference/PreferenceScreen;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 512
    invoke-virtual {v0}, Landroid/support/v7/preference/PreferenceScreen;->onAttached()V

    .line 514
    :cond_14
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->onBindPreferences()V

    .line 515
    return-void
.end method

.method private postBindPreferences()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 504
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 506
    :goto_9
    return-void

    .line 505
    :cond_a
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    goto :goto_9
.end method

.method private requirePreferenceManager()V
    .registers 3

    .prologue
    .line 498
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    if-nez v0, :cond_c

    .line 499
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "This should be called after super.onCreate."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 501
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
    .line 406
    invoke-direct {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->requirePreferenceManager()V

    .line 408
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    iget-object v1, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mStyledContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroid/support/v7/preference/PreferenceScreen;

    move-result-object v2

    invoke-virtual {v0, v1, p1, v2}, Landroid/support/v7/preference/PreferenceManager;->inflateFromResource(Landroid/content/Context;ILandroid/support/v7/preference/PreferenceScreen;)Landroid/support/v7/preference/PreferenceScreen;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->setPreferenceScreen(Landroid/support/v7/preference/PreferenceScreen;)V

    .line 410
    return-void
.end method

.method public findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;
    .registers 3
    .param p1, "key"    # Ljava/lang/CharSequence;

    .prologue
    .line 491
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    if-nez v0, :cond_6

    .line 492
    const/4 v0, 0x0

    .line 494
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/preference/PreferenceManager;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    goto :goto_5
.end method

.method public getCallbackFragment()Landroid/support/v4/app/Fragment;
    .registers 2

    .prologue
    .line 620
    const/4 v0, 0x0

    return-object v0
.end method

.method public final getListView()Landroid/support/v7/widget/RecyclerView;
    .registers 2

    .prologue
    .line 526
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mList:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method public getPreferenceManager()Landroid/support/v7/preference/PreferenceManager;
    .registers 2

    .prologue
    .line 371
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    return-object v0
.end method

.method public getPreferenceScreen()Landroid/support/v7/preference/PreferenceScreen;
    .registers 2

    .prologue
    .line 396
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0}, Landroid/support/v7/preference/PreferenceManager;->getPreferenceScreen()Landroid/support/v7/preference/PreferenceScreen;

    move-result-object v0

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 313
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 315
    iget-boolean v2, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mHavePrefs:Z

    if-eqz v2, :cond_a

    .line 316
    invoke-direct {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->bindPreferences()V

    .line 319
    :cond_a
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mInitDone:Z

    .line 321
    if-eqz p1, :cond_20

    .line 322
    const-string v2, "android:preferences"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 323
    .local v0, "container":Landroid/os/Bundle;
    if-eqz v0, :cond_20

    .line 324
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroid/support/v7/preference/PreferenceScreen;

    move-result-object v1

    .line 325
    .local v1, "preferenceScreen":Landroid/support/v7/preference/PreferenceScreen;
    if-eqz v1, :cond_20

    .line 326
    invoke-virtual {v1, v0}, Landroid/support/v7/preference/PreferenceScreen;->restoreHierarchyState(Landroid/os/Bundle;)V

    .line 330
    .end local v0    # "container":Landroid/os/Bundle;
    .end local v1    # "preferenceScreen":Landroid/support/v7/preference/PreferenceScreen;
    :cond_20
    return-void
.end method

.method protected onBindPreferences()V
    .registers 1

    .prologue
    .line 519
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 198
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 199
    new-instance v3, Landroid/util/TypedValue;

    invoke-direct {v3}, Landroid/util/TypedValue;-><init>()V

    .line 200
    .local v3, "tv":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentActivity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    sget v5, Landroid/support/v7/preference/R$attr;->preferenceTheme:I

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v3, v6}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 201
    iget v2, v3, Landroid/util/TypedValue;->resourceId:I

    .line 202
    .local v2, "theme":I
    if-gtz v2, :cond_22

    .line 203
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "Must specify preferenceTheme in theme"

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 205
    :cond_22
    new-instance v4, Landroid/view/ContextThemeWrapper;

    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object v4, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mStyledContext:Landroid/content/Context;

    .line 207
    new-instance v4, Landroid/support/v7/preference/PreferenceManager;

    iget-object v5, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mStyledContext:Landroid/content/Context;

    invoke-direct {v4, v5}, Landroid/support/v7/preference/PreferenceManager;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    .line 208
    iget-object v4, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v4, p0}, Landroid/support/v7/preference/PreferenceManager;->setOnNavigateToScreenListener(Landroid/support/v7/preference/PreferenceManager$OnNavigateToScreenListener;)V

    .line 209
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 211
    .local v0, "args":Landroid/os/Bundle;
    if-eqz v0, :cond_4f

    .line 212
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    const-string v5, "android.support.v7.preference.PreferenceFragmentCompat.PREFERENCE_ROOT"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 216
    .local v1, "rootKey":Ljava/lang/String;
    :goto_4b
    invoke-virtual {p0, p1, v1}, Landroid/support/v7/preference/PreferenceFragmentCompat;->onCreatePreferences(Landroid/os/Bundle;Ljava/lang/String;)V

    .line 217
    return-void

    .line 214
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
    .line 569
    new-instance v0, Landroid/support/v7/preference/PreferenceGroupAdapter;

    invoke-direct {v0, p1}, Landroid/support/v7/preference/PreferenceGroupAdapter;-><init>(Landroid/support/v7/preference/PreferenceGroup;)V

    return-object v0
.end method

.method public onCreateLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;
    .registers 3

    .prologue
    .line 559
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getActivity()Landroid/support/v4/app/FragmentActivity;

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
    .line 544
    sget v1, Landroid/support/v7/preference/R$layout;->preference_recyclerview:I

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    .line 547
    .local v0, "recyclerView":Landroid/support/v7/widget/RecyclerView;
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->onCreateLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 549
    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 22
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 235
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mStyledContext:Landroid/content/Context;

    const/4 v14, 0x0

    sget-object v15, Landroid/support/v7/preference/R$styleable;->PreferenceFragmentCompat:[I

    sget v16, Landroid/support/v7/preference/R$attr;->preferenceFragmentCompatStyle:I

    const/16 v17, 0x0

    invoke-virtual/range {v13 .. v17}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v2

    .line 240
    .local v2, "a":Landroid/content/res/TypedArray;
    sget v13, Landroid/support/v7/preference/R$styleable;->PreferenceFragmentCompat_android_layout:I

    move-object/from16 v0, p0

    iget v14, v0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mLayoutResId:I

    invoke-virtual {v2, v13, v14}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v13

    move-object/from16 v0, p0

    iput v13, v0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mLayoutResId:I

    .line 243
    sget v13, Landroid/support/v7/preference/R$styleable;->PreferenceFragmentCompat_android_divider:I

    invoke-virtual {v2, v13}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 245
    .local v3, "divider":Landroid/graphics/drawable/Drawable;
    sget v13, Landroid/support/v7/preference/R$styleable;->PreferenceFragmentCompat_android_dividerHeight:I

    const/4 v14, -0x1

    invoke-virtual {v2, v13, v14}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    .line 248
    .local v4, "dividerHeight":I
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 251
    new-instance v11, Landroid/util/TypedValue;

    invoke-direct {v11}, Landroid/util/TypedValue;-><init>()V

    .line 252
    .local v11, "tv":Landroid/util/TypedValue;
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v13

    invoke-virtual {v13}, Landroid/support/v4/app/FragmentActivity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v13

    sget v14, Landroid/support/v7/preference/R$attr;->preferenceTheme:I

    const/4 v15, 0x1

    invoke-virtual {v13, v14, v11, v15}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 253
    iget v8, v11, Landroid/util/TypedValue;->resourceId:I

    .line 255
    .local v8, "theme":I
    new-instance v9, Landroid/view/ContextThemeWrapper;

    invoke-virtual/range {p1 .. p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v9, v13, v8}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 256
    .local v9, "themedContext":Landroid/content/Context;
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v10

    .line 258
    .local v10, "themedInflater":Landroid/view/LayoutInflater;
    move-object/from16 v0, p0

    iget v13, v0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mLayoutResId:I

    const/4 v14, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v10, v13, v0, v14}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v12

    .line 260
    .local v12, "view":Landroid/view/View;
    sget v13, Landroid/support/v7/preference/R$id;->list_container:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    .line 261
    .local v7, "rawListContainer":Landroid/view/View;
    instance-of v13, v7, Landroid/view/ViewGroup;

    if-nez v13, :cond_6e

    .line 262
    new-instance v13, Ljava/lang/RuntimeException;

    const-string v14, "Content has view with id attribute \'R.id.list_container\' that is not a ViewGroup class"

    invoke-direct {v13, v14}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v13

    :cond_6e
    move-object v5, v7

    .line 266
    check-cast v5, Landroid/view/ViewGroup;

    .line 268
    .local v5, "listContainer":Landroid/view/ViewGroup;
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v10, v5, v1}, Landroid/support/v7/preference/PreferenceFragmentCompat;->onCreateRecyclerView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v6

    .line 270
    .local v6, "listView":Landroid/support/v7/widget/RecyclerView;
    if-nez v6, :cond_83

    .line 271
    new-instance v13, Ljava/lang/RuntimeException;

    const-string v14, "Could not create RecyclerView"

    invoke-direct {v13, v14}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 274
    :cond_83
    move-object/from16 v0, p0

    iput-object v6, v0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mList:Landroid/support/v7/widget/RecyclerView;

    .line 276
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mDividerDecoration:Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;

    invoke-virtual {v6, v13}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 277
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Landroid/support/v7/preference/PreferenceFragmentCompat;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 278
    const/4 v13, -0x1

    if-eq v4, v13, :cond_9b

    .line 279
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Landroid/support/v7/preference/PreferenceFragmentCompat;->setDividerHeight(I)V

    .line 282
    :cond_9b
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v5, v13}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 283
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mHandler:Landroid/os/Handler;

    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mRequestFocus:Ljava/lang/Runnable;

    invoke-virtual {v13, v14}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 284
    return-object v12
.end method

.method public onDestroyView()V
    .registers 3

    .prologue
    .line 348
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mList:Landroid/support/v7/widget/RecyclerView;

    .line 349
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mRequestFocus:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 350
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 351
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroyView()V

    .line 352
    return-void
.end method

.method public onDisplayPreferenceDialog(Landroid/support/v7/preference/Preference;)V
    .registers 6
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 582
    const/4 v1, 0x0

    .line 583
    .local v1, "handled":Z
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getCallbackFragment()Landroid/support/v4/app/Fragment;

    move-result-object v2

    instance-of v2, v2, Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceDisplayDialogCallback;

    if-eqz v2, :cond_13

    .line 584
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getCallbackFragment()Landroid/support/v4/app/Fragment;

    move-result-object v2

    check-cast v2, Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceDisplayDialogCallback;

    invoke-interface {v2, p0, p1}, Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceDisplayDialogCallback;->onPreferenceDisplayDialog(Landroid/support/v7/preference/PreferenceFragmentCompat;Landroid/support/v7/preference/Preference;)Z

    move-result v1

    .line 587
    :cond_13
    if-nez v1, :cond_27

    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    instance-of v2, v2, Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceDisplayDialogCallback;

    if-eqz v2, :cond_27

    .line 588
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    check-cast v2, Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceDisplayDialogCallback;

    invoke-interface {v2, p0, p1}, Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceDisplayDialogCallback;->onPreferenceDisplayDialog(Landroid/support/v7/preference/PreferenceFragmentCompat;Landroid/support/v7/preference/Preference;)Z

    move-result v1

    .line 592
    :cond_27
    if-eqz v1, :cond_2a

    .line 612
    :cond_29
    :goto_29
    return-void

    .line 597
    :cond_2a
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    const-string v3, "android.support.v7.preference.PreferenceFragment.DIALOG"

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v2

    if-nez v2, :cond_29

    .line 602
    instance-of v2, p1, Landroid/support/v7/preference/EditTextPreference;

    if-eqz v2, :cond_50

    .line 603
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v7/preference/EditTextPreferenceDialogFragmentCompat;->newInstance(Ljava/lang/String;)Landroid/support/v7/preference/EditTextPreferenceDialogFragmentCompat;

    move-result-object v0

    .line 610
    .local v0, "f":Landroid/support/v4/app/DialogFragment;
    :goto_42
    const/4 v2, 0x0

    invoke-virtual {v0, p0, v2}, Landroid/support/v4/app/DialogFragment;->setTargetFragment(Landroid/support/v4/app/Fragment;I)V

    .line 611
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    const-string v3, "android.support.v7.preference.PreferenceFragment.DIALOG"

    invoke-virtual {v0, v2, v3}, Landroid/support/v4/app/DialogFragment;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    goto :goto_29

    .line 604
    .end local v0    # "f":Landroid/support/v4/app/DialogFragment;
    :cond_50
    instance-of v2, p1, Landroid/support/v7/preference/ListPreference;

    if-eqz v2, :cond_5d

    .line 605
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v7/preference/ListPreferenceDialogFragmentCompat;->newInstance(Ljava/lang/String;)Landroid/support/v7/preference/ListPreferenceDialogFragmentCompat;

    move-result-object v0

    .restart local v0    # "f":Landroid/support/v4/app/DialogFragment;
    goto :goto_42

    .line 607
    .end local v0    # "f":Landroid/support/v4/app/DialogFragment;
    :cond_5d
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Tried to display dialog for unknown preference type. Did you forget to override onDisplayPreferenceDialog()?"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public onNavigateToScreen(Landroid/support/v7/preference/PreferenceScreen;)V
    .registers 4
    .param p1, "preferenceScreen"    # Landroid/support/v7/preference/PreferenceScreen;

    .prologue
    .line 472
    const/4 v0, 0x0

    .line 473
    .local v0, "handled":Z
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getCallbackFragment()Landroid/support/v4/app/Fragment;

    move-result-object v1

    instance-of v1, v1, Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceStartScreenCallback;

    if-eqz v1, :cond_13

    .line 474
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getCallbackFragment()Landroid/support/v4/app/Fragment;

    move-result-object v1

    check-cast v1, Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceStartScreenCallback;

    invoke-interface {v1, p0, p1}, Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceStartScreenCallback;->onPreferenceStartScreen(Landroid/support/v7/preference/PreferenceFragmentCompat;Landroid/support/v7/preference/PreferenceScreen;)Z

    move-result v0

    .line 477
    :cond_13
    if-nez v0, :cond_26

    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    instance-of v1, v1, Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceStartScreenCallback;

    if-eqz v1, :cond_26

    .line 478
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    check-cast v1, Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceStartScreenCallback;

    invoke-interface {v1, p0, p1}, Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceStartScreenCallback;->onPreferenceStartScreen(Landroid/support/v7/preference/PreferenceFragmentCompat;Landroid/support/v7/preference/PreferenceScreen;)Z

    .line 481
    :cond_26
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/support/v7/preference/Preference;)Z
    .registers 4
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 445
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getFragment()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2e

    .line 446
    const/4 v0, 0x0

    .line 447
    .local v0, "handled":Z
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getCallbackFragment()Landroid/support/v4/app/Fragment;

    move-result-object v1

    instance-of v1, v1, Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceStartFragmentCallback;

    if-eqz v1, :cond_19

    .line 448
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getCallbackFragment()Landroid/support/v4/app/Fragment;

    move-result-object v1

    check-cast v1, Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceStartFragmentCallback;

    invoke-interface {v1, p0, p1}, Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceStartFragmentCallback;->onPreferenceStartFragment(Landroid/support/v7/preference/PreferenceFragmentCompat;Landroid/support/v7/preference/Preference;)Z

    move-result v0

    .line 451
    :cond_19
    if-nez v0, :cond_2d

    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    instance-of v1, v1, Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceStartFragmentCallback;

    if-eqz v1, :cond_2d

    .line 452
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    check-cast v1, Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceStartFragmentCallback;

    invoke-interface {v1, p0, p1}, Landroid/support/v7/preference/PreferenceFragmentCompat$OnPreferenceStartFragmentCallback;->onPreferenceStartFragment(Landroid/support/v7/preference/PreferenceFragmentCompat;Landroid/support/v7/preference/Preference;)Z

    move-result v0

    .line 457
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
    .line 356
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 358
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroid/support/v7/preference/PreferenceScreen;

    move-result-object v1

    .line 359
    .local v1, "preferenceScreen":Landroid/support/v7/preference/PreferenceScreen;
    if-eqz v1, :cond_16

    .line 360
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 361
    .local v0, "container":Landroid/os/Bundle;
    invoke-virtual {v1, v0}, Landroid/support/v7/preference/PreferenceScreen;->saveHierarchyState(Landroid/os/Bundle;)V

    .line 362
    const-string v2, "android:preferences"

    invoke-virtual {p1, v2, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 364
    .end local v0    # "container":Landroid/os/Bundle;
    :cond_16
    return-void
.end method

.method public onStart()V
    .registers 2

    .prologue
    .line 334
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStart()V

    .line 335
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0, p0}, Landroid/support/v7/preference/PreferenceManager;->setOnPreferenceTreeClickListener(Landroid/support/v7/preference/PreferenceManager$OnPreferenceTreeClickListener;)V

    .line 336
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0, p0}, Landroid/support/v7/preference/PreferenceManager;->setOnDisplayPreferenceDialogListener(Landroid/support/v7/preference/PreferenceManager$OnDisplayPreferenceDialogListener;)V

    .line 337
    return-void
.end method

.method public onStop()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 341
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStop()V

    .line 342
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/PreferenceManager;->setOnPreferenceTreeClickListener(Landroid/support/v7/preference/PreferenceManager$OnPreferenceTreeClickListener;)V

    .line 343
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/PreferenceManager;->setOnDisplayPreferenceDialogListener(Landroid/support/v7/preference/PreferenceManager$OnDisplayPreferenceDialogListener;)V

    .line 344
    return-void
.end method

.method protected onUnbindPreferences()V
    .registers 1

    .prologue
    .line 523
    return-void
.end method

.method public setDivider(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "divider"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 297
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mDividerDecoration:Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;

    invoke-virtual {v0, p1}, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 298
    return-void
.end method

.method public setDividerHeight(I)V
    .registers 3
    .param p1, "height"    # I

    .prologue
    .line 308
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mDividerDecoration:Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;

    invoke-virtual {v0, p1}, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->setDividerHeight(I)V

    .line 309
    return-void
.end method

.method public setPreferenceScreen(Landroid/support/v7/preference/PreferenceScreen;)V
    .registers 3
    .param p1, "preferenceScreen"    # Landroid/support/v7/preference/PreferenceScreen;

    .prologue
    .line 380
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/preference/PreferenceManager;->setPreferences(Landroid/support/v7/preference/PreferenceScreen;)Z

    move-result v0

    if-eqz v0, :cond_17

    if-eqz p1, :cond_17

    .line 381
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->onUnbindPreferences()V

    .line 382
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mHavePrefs:Z

    .line 383
    iget-boolean v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mInitDone:Z

    if-eqz v0, :cond_17

    .line 384
    invoke-direct {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->postBindPreferences()V

    .line 387
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
    .line 422
    invoke-direct {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->requirePreferenceManager()V

    .line 424
    iget-object v2, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    iget-object v3, p0, Landroid/support/v7/preference/PreferenceFragmentCompat;->mStyledContext:Landroid/content/Context;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, p1, v4}, Landroid/support/v7/preference/PreferenceManager;->inflateFromResource(Landroid/content/Context;ILandroid/support/v7/preference/PreferenceScreen;)Landroid/support/v7/preference/PreferenceScreen;

    move-result-object v1

    .line 428
    .local v1, "xmlRoot":Landroid/support/v7/preference/PreferenceScreen;
    if-eqz p2, :cond_35

    .line 429
    invoke-virtual {v1, p2}, Landroid/support/v7/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 430
    .local v0, "root":Landroid/support/v7/preference/Preference;
    instance-of v2, v0, Landroid/support/v7/preference/PreferenceScreen;

    if-nez v2, :cond_36

    .line 431
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

    .line 435
    .end local v0    # "root":Landroid/support/v7/preference/Preference;
    :cond_35
    move-object v0, v1

    .line 438
    .restart local v0    # "root":Landroid/support/v7/preference/Preference;
    :cond_36
    check-cast v0, Landroid/support/v7/preference/PreferenceScreen;

    .end local v0    # "root":Landroid/support/v7/preference/Preference;
    invoke-virtual {p0, v0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->setPreferenceScreen(Landroid/support/v7/preference/PreferenceScreen;)V

    .line 439
    return-void
.end method
