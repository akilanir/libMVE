.class public Lcom/mikepenz/materialize/MaterializeBuilder;
.super Ljava/lang/Object;
.source "MaterializeBuilder.java"


# instance fields
.field protected mActivity:Landroid/app/Activity;

.field protected mContainer:Landroid/view/ViewGroup;

.field protected mContainerLayoutParams:Landroid/view/ViewGroup$LayoutParams;

.field protected mContentRoot:Landroid/view/ViewGroup;

.field protected mFullscreen:Z

.field protected mRootView:Landroid/view/ViewGroup;

.field protected mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

.field protected mStatusBarColor:I

.field protected mStatusBarColorRes:I

.field protected mSystemUIHidden:Z

.field protected mTintNavigationBar:Z

.field protected mTintStatusBar:Z

.field protected mTranslucentActionBarCompatibility:Z

.field protected mTranslucentNavigationBar:Z

.field protected mTranslucentNavigationBarProgrammatically:Z

.field protected mTranslucentStatusBar:Z

.field protected mTranslucentStatusBarProgrammatically:Z


# direct methods
.method public constructor <init>()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput v1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mStatusBarColor:I

    .line 85
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mStatusBarColorRes:I

    .line 111
    iput-boolean v1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentActionBarCompatibility:Z

    .line 126
    iput-boolean v2, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentStatusBar:Z

    .line 146
    iput-boolean v2, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentStatusBarProgrammatically:Z

    .line 165
    iput-boolean v2, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTintStatusBar:Z

    .line 179
    iput-boolean v1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentNavigationBar:Z

    .line 199
    iput-boolean v1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentNavigationBarProgrammatically:Z

    .line 217
    iput-boolean v1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTintNavigationBar:Z

    .line 236
    iput-boolean v1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mFullscreen:Z

    .line 260
    iput-boolean v1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mSystemUIHidden:Z

    .line 280
    iput-object v3, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mContainer:Landroid/view/ViewGroup;

    .line 294
    iput-object v3, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mContainerLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .registers 6
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput v1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mStatusBarColor:I

    .line 85
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mStatusBarColorRes:I

    .line 111
    iput-boolean v1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentActionBarCompatibility:Z

    .line 126
    iput-boolean v2, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentStatusBar:Z

    .line 146
    iput-boolean v2, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentStatusBarProgrammatically:Z

    .line 165
    iput-boolean v2, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTintStatusBar:Z

    .line 179
    iput-boolean v1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentNavigationBar:Z

    .line 199
    iput-boolean v1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentNavigationBarProgrammatically:Z

    .line 217
    iput-boolean v1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTintNavigationBar:Z

    .line 236
    iput-boolean v1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mFullscreen:Z

    .line 260
    iput-boolean v1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mSystemUIHidden:Z

    .line 280
    iput-object v3, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mContainer:Landroid/view/ViewGroup;

    .line 294
    iput-object v3, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mContainerLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    .line 37
    const v0, 0x1020002

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mRootView:Landroid/view/ViewGroup;

    .line 38
    iput-object p1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mActivity:Landroid/app/Activity;

    .line 39
    return-void
.end method


# virtual methods
.method public build()Lcom/mikepenz/materialize/Materialize;
    .registers 13

    .prologue
    const/16 v11, 0x15

    const/16 v10, 0x13

    const/4 v5, 0x1

    const/4 v9, -0x1

    const/4 v6, 0x0

    .line 323
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mActivity:Landroid/app/Activity;

    if-nez v4, :cond_13

    .line 324
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "please pass an activity"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 328
    :cond_13
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v4

    sget v7, Lcom/mikepenz/materialize/R$layout;->materialize:I

    iget-object v8, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mRootView:Landroid/view/ViewGroup;

    invoke-virtual {v4, v7, v8, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;

    iput-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    .line 331
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mRootView:Landroid/view/ViewGroup;

    if-eqz v4, :cond_31

    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mRootView:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-nez v4, :cond_39

    .line 332
    :cond_31
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "You have to set your layout for this activity with setContentView() first. Or you build the drawer on your own with .buildView()"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 336
    :cond_39
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mRootView:Landroid/view/ViewGroup;

    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 338
    .local v3, "originalContentView":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getId()I

    move-result v4

    sget v7, Lcom/mikepenz/materialize/R$id;->materialize_root:I

    if-ne v4, v7, :cond_196

    move v0, v5

    .line 341
    .local v0, "alreadyInflated":Z
    :goto_48
    iget v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mStatusBarColor:I

    if-nez v4, :cond_199

    iget v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mStatusBarColorRes:I

    if-eq v4, v9, :cond_199

    .line 342
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget v7, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mStatusBarColorRes:I

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    iput v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mStatusBarColor:I

    .line 348
    :cond_5e
    :goto_5e
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    iget v7, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mStatusBarColor:I

    invoke-interface {v4, v7}, Lcom/mikepenz/materialize/view/IScrimInsetsLayout;->setInsetForeground(I)V

    .line 349
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    iget-boolean v7, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTintStatusBar:Z

    invoke-interface {v4, v7}, Lcom/mikepenz/materialize/view/IScrimInsetsLayout;->setTintStatusBar(Z)V

    .line 350
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    iget-boolean v7, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTintNavigationBar:Z

    invoke-interface {v4, v7}, Lcom/mikepenz/materialize/view/IScrimInsetsLayout;->setTintNavigationBar(Z)V

    .line 353
    iget-object v7, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    iget-boolean v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mFullscreen:Z

    if-nez v4, :cond_1ab

    iget-boolean v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mSystemUIHidden:Z

    if-nez v4, :cond_1ab

    move v4, v5

    :goto_7e
    invoke-interface {v7, v4}, Lcom/mikepenz/materialize/view/IScrimInsetsLayout;->setSystemUIVisible(Z)V

    .line 356
    if-nez v0, :cond_d0

    iget-boolean v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentStatusBar:Z

    if-eqz v4, :cond_d0

    .line 357
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v4, v10, :cond_94

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v4, v11, :cond_94

    .line 358
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v4, v5}, Lcom/mikepenz/materialize/util/UIUtils;->setTranslucentStatusFlag(Landroid/app/Activity;Z)V

    .line 360
    :cond_94
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v4, v10, :cond_ab

    .line 361
    iget-boolean v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentStatusBarProgrammatically:Z

    if-eqz v4, :cond_ab

    .line 362
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    const/16 v7, 0x500

    invoke-virtual {v4, v7}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 365
    :cond_ab
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v4, v11, :cond_c1

    .line 366
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v4, v6}, Lcom/mikepenz/materialize/util/UIUtils;->setTranslucentStatusFlag(Landroid/app/Activity;Z)V

    .line 367
    iget-boolean v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentStatusBarProgrammatically:Z

    if-eqz v4, :cond_c1

    .line 368
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 371
    :cond_c1
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    invoke-interface {v4}, Lcom/mikepenz/materialize/view/IScrimInsetsLayout;->getView()Landroid/view/ViewGroup;

    move-result-object v4

    iget-object v7, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v7}, Lcom/mikepenz/materialize/util/UIUtils;->getStatusBarHeight(Landroid/content/Context;)I

    move-result v7

    invoke-virtual {v4, v6, v7, v6, v6}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 375
    :cond_d0
    if-nez v0, :cond_110

    iget-boolean v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentNavigationBar:Z

    if-eqz v4, :cond_110

    .line 376
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v4, v10, :cond_e3

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v4, v11, :cond_e3

    .line 377
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v4, v5}, Lcom/mikepenz/materialize/util/UIUtils;->setTranslucentNavigationFlag(Landroid/app/Activity;Z)V

    .line 379
    :cond_e3
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v4, v10, :cond_ff

    .line 380
    iget-boolean v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentNavigationBarProgrammatically:Z

    if-eqz v4, :cond_ff

    .line 381
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    const/16 v7, 0x500

    invoke-virtual {v4, v7}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 382
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v4, v5}, Lcom/mikepenz/materialize/util/UIUtils;->setTranslucentNavigationFlag(Landroid/app/Activity;Z)V

    .line 385
    :cond_ff
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v4, v11, :cond_110

    .line 386
    iget-boolean v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentNavigationBarProgrammatically:Z

    if-eqz v4, :cond_110

    .line 387
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 393
    :cond_110
    iget-boolean v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mSystemUIHidden:Z

    if-eqz v4, :cond_129

    .line 394
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xb

    if-lt v4, v5, :cond_129

    .line 395
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    .line 396
    .local v1, "decorView":Landroid/view/View;
    const/16 v4, 0x1706

    invoke-virtual {v1, v4}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 406
    .end local v1    # "decorView":Landroid/view/View;
    :cond_129
    if-nez v0, :cond_1ae

    .line 408
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mRootView:Landroid/view/ViewGroup;

    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 415
    :goto_130
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v9, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 421
    .local v2, "layoutParamsContentView":Landroid/widget/FrameLayout$LayoutParams;
    iget-boolean v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mFullscreen:Z

    if-nez v4, :cond_149

    iget-boolean v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentNavigationBar:Z

    if-eqz v4, :cond_149

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v4, v10, :cond_149

    .line 422
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v4}, Lcom/mikepenz/materialize/util/UIUtils;->getNavigationBarHeight(Landroid/content/Context;)I

    move-result v4

    iput v4, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 426
    :cond_149
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    invoke-interface {v4}, Lcom/mikepenz/materialize/view/IScrimInsetsLayout;->getView()Landroid/view/ViewGroup;

    move-result-object v4

    invoke-virtual {v4, v3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 429
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    invoke-interface {v4}, Lcom/mikepenz/materialize/view/IScrimInsetsLayout;->getView()Landroid/view/ViewGroup;

    move-result-object v4

    iput-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mContentRoot:Landroid/view/ViewGroup;

    .line 430
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mContainer:Landroid/view/ViewGroup;

    if-eqz v4, :cond_172

    .line 431
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mContainer:Landroid/view/ViewGroup;

    iput-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mContentRoot:Landroid/view/ViewGroup;

    .line 432
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mContentRoot:Landroid/view/ViewGroup;

    iget-object v5, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    invoke-interface {v5}, Lcom/mikepenz/materialize/view/IScrimInsetsLayout;->getView()Landroid/view/ViewGroup;

    move-result-object v5

    new-instance v6, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v6, v9, v9}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 439
    :cond_172
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mContentRoot:Landroid/view/ViewGroup;

    sget v5, Lcom/mikepenz/materialize/R$id;->materialize_root:I

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->setId(I)V

    .line 442
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mContainerLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    if-nez v4, :cond_184

    .line 443
    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v4, v9, v9}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    iput-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mContainerLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    .line 449
    :cond_184
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mRootView:Landroid/view/ViewGroup;

    iget-object v5, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mContentRoot:Landroid/view/ViewGroup;

    iget-object v6, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mContainerLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v4, v5, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 452
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mActivity:Landroid/app/Activity;

    .line 455
    new-instance v4, Lcom/mikepenz/materialize/Materialize;

    invoke-direct {v4, p0}, Lcom/mikepenz/materialize/Materialize;-><init>(Lcom/mikepenz/materialize/MaterializeBuilder;)V

    return-object v4

    .end local v0    # "alreadyInflated":Z
    .end local v2    # "layoutParamsContentView":Landroid/widget/FrameLayout$LayoutParams;
    :cond_196
    move v0, v6

    .line 338
    goto/16 :goto_48

    .line 343
    .restart local v0    # "alreadyInflated":Z
    :cond_199
    iget v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mStatusBarColor:I

    if-nez v4, :cond_5e

    .line 344
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mActivity:Landroid/app/Activity;

    sget v7, Lcom/mikepenz/materialize/R$attr;->colorPrimaryDark:I

    sget v8, Lcom/mikepenz/materialize/R$color;->materialize_primary_dark:I

    invoke-static {v4, v7, v8}, Lcom/mikepenz/materialize/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v4

    iput v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mStatusBarColor:I

    goto/16 :goto_5e

    :cond_1ab
    move v4, v6

    .line 353
    goto/16 :goto_7e

    .line 411
    :cond_1ae
    iget-object v4, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mRootView:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->removeAllViews()V

    goto/16 :goto_130
.end method

.method public withActivity(Landroid/app/Activity;)Lcom/mikepenz/materialize/MaterializeBuilder;
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 49
    const v0, 0x1020002

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mRootView:Landroid/view/ViewGroup;

    .line 50
    iput-object p1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mActivity:Landroid/app/Activity;

    .line 51
    return-object p0
.end method

.method public withContainer(Landroid/view/ViewGroup;)Lcom/mikepenz/materialize/MaterializeBuilder;
    .registers 2
    .param p1, "container"    # Landroid/view/ViewGroup;

    .prologue
    .line 289
    iput-object p1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mContainer:Landroid/view/ViewGroup;

    .line 290
    return-object p0
.end method

.method public withContainer(Landroid/view/ViewGroup;Landroid/view/ViewGroup$LayoutParams;)Lcom/mikepenz/materialize/MaterializeBuilder;
    .registers 3
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "layoutParams"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 315
    iput-object p1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mContainer:Landroid/view/ViewGroup;

    .line 316
    iput-object p2, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mContainerLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    .line 317
    return-object p0
.end method

.method public withContainerLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lcom/mikepenz/materialize/MaterializeBuilder;
    .registers 2
    .param p1, "layoutParams"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 303
    iput-object p1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mContainerLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    .line 304
    return-object p0
.end method

.method public withFullscreen(Z)Lcom/mikepenz/materialize/MaterializeBuilder;
    .registers 4
    .param p1, "fullscreen"    # Z

    .prologue
    const/4 v1, 0x0

    .line 246
    iput-boolean p1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mFullscreen:Z

    .line 248
    if-eqz p1, :cond_12

    .line 249
    invoke-virtual {p0, v1}, Lcom/mikepenz/materialize/MaterializeBuilder;->withTranslucentStatusBar(Z)Lcom/mikepenz/materialize/MaterializeBuilder;

    .line 250
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mikepenz/materialize/MaterializeBuilder;->withTranslucentNavigationBarProgrammatically(Z)Lcom/mikepenz/materialize/MaterializeBuilder;

    .line 251
    invoke-virtual {p0, v1}, Lcom/mikepenz/materialize/MaterializeBuilder;->withTintedStatusBar(Z)Lcom/mikepenz/materialize/MaterializeBuilder;

    .line 252
    invoke-virtual {p0, v1}, Lcom/mikepenz/materialize/MaterializeBuilder;->withTintedNavigationBar(Z)Lcom/mikepenz/materialize/MaterializeBuilder;

    .line 255
    :cond_12
    return-object p0
.end method

.method public withRootView(I)Lcom/mikepenz/materialize/MaterializeBuilder;
    .registers 4
    .param p1, "rootViewRes"    # I

    .prologue
    .line 76
    iget-object v0, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_c

    .line 77
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "please pass an activity first to use this call"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 80
    :cond_c
    iget-object v0, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {p0, v0}, Lcom/mikepenz/materialize/MaterializeBuilder;->withRootView(Landroid/view/ViewGroup;)Lcom/mikepenz/materialize/MaterializeBuilder;

    move-result-object v0

    return-object v0
.end method

.method public withRootView(Landroid/view/ViewGroup;)Lcom/mikepenz/materialize/MaterializeBuilder;
    .registers 3
    .param p1, "rootView"    # Landroid/view/ViewGroup;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mRootView:Landroid/view/ViewGroup;

    .line 64
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mikepenz/materialize/MaterializeBuilder;->withTranslucentStatusBar(Z)Lcom/mikepenz/materialize/MaterializeBuilder;

    .line 66
    return-object p0
.end method

.method public withStatusBarColor(I)Lcom/mikepenz/materialize/MaterializeBuilder;
    .registers 2
    .param p1, "statusBarColor"    # I

    .prologue
    .line 94
    iput p1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mStatusBarColor:I

    .line 95
    return-object p0
.end method

.method public withStatusBarColorRes(I)Lcom/mikepenz/materialize/MaterializeBuilder;
    .registers 2
    .param p1, "statusBarColorRes"    # I

    .prologue
    .line 105
    iput p1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mStatusBarColorRes:I

    .line 106
    return-object p0
.end method

.method public withSystemUIHidden(Z)Lcom/mikepenz/materialize/MaterializeBuilder;
    .registers 2
    .param p1, "systemUIHidden"    # Z

    .prologue
    .line 270
    iput-boolean p1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mSystemUIHidden:Z

    .line 272
    if-eqz p1, :cond_7

    .line 273
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialize/MaterializeBuilder;->withFullscreen(Z)Lcom/mikepenz/materialize/MaterializeBuilder;

    .line 276
    :cond_7
    return-object p0
.end method

.method public withTintedNavigationBar(Z)Lcom/mikepenz/materialize/MaterializeBuilder;
    .registers 3
    .param p1, "tintedNavigationBar"    # Z

    .prologue
    .line 226
    iput-boolean p1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTintNavigationBar:Z

    .line 228
    if-eqz p1, :cond_8

    .line 229
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mikepenz/materialize/MaterializeBuilder;->withTranslucentNavigationBarProgrammatically(Z)Lcom/mikepenz/materialize/MaterializeBuilder;

    .line 232
    :cond_8
    return-object p0
.end method

.method public withTintedStatusBar(Z)Lcom/mikepenz/materialize/MaterializeBuilder;
    .registers 2
    .param p1, "tintedStatusBar"    # Z

    .prologue
    .line 174
    iput-boolean p1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTintStatusBar:Z

    .line 175
    return-object p0
.end method

.method public withTranslucentActionBarCompatibility(Z)Lcom/mikepenz/materialize/MaterializeBuilder;
    .registers 2
    .param p1, "translucentActionBarCompatibility"    # Z

    .prologue
    .line 121
    iput-boolean p1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentActionBarCompatibility:Z

    .line 122
    return-object p0
.end method

.method public withTranslucentNavigationBar(Z)Lcom/mikepenz/materialize/MaterializeBuilder;
    .registers 3
    .param p1, "translucentNavigationBar"    # Z

    .prologue
    .line 188
    iput-boolean p1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentNavigationBar:Z

    .line 191
    if-nez p1, :cond_7

    .line 192
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentNavigationBarProgrammatically:Z

    .line 195
    :cond_7
    return-object p0
.end method

.method public withTranslucentNavigationBarProgrammatically(Z)Lcom/mikepenz/materialize/MaterializeBuilder;
    .registers 3
    .param p1, "translucentNavigationBarProgrammatically"    # Z

    .prologue
    .line 208
    iput-boolean p1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentNavigationBarProgrammatically:Z

    .line 210
    if-eqz p1, :cond_7

    .line 211
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentNavigationBar:Z

    .line 213
    :cond_7
    return-object p0
.end method

.method public withTranslucentStatusBar(Z)Lcom/mikepenz/materialize/MaterializeBuilder;
    .registers 3
    .param p1, "translucentStatusBar"    # Z

    .prologue
    .line 135
    iput-boolean p1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentStatusBar:Z

    .line 138
    if-nez p1, :cond_7

    .line 139
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentStatusBarProgrammatically:Z

    .line 141
    :cond_7
    return-object p0
.end method

.method public withTranslucentStatusBarProgrammatically(Z)Lcom/mikepenz/materialize/MaterializeBuilder;
    .registers 3
    .param p1, "translucentStatusBarProgrammatically"    # Z

    .prologue
    .line 156
    iput-boolean p1, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentStatusBarProgrammatically:Z

    .line 158
    if-eqz p1, :cond_7

    .line 159
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialize/MaterializeBuilder;->mTranslucentStatusBar:Z

    .line 161
    :cond_7
    return-object p0
.end method
