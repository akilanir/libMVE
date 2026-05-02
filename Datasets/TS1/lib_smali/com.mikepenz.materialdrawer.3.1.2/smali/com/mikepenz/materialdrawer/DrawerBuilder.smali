.class public Lcom/mikepenz/materialdrawer/DrawerBuilder;
.super Ljava/lang/Object;
.source "DrawerBuilder.java"


# instance fields
.field protected mAccountHeader:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;

.field protected mAccountHeaderSticky:Z

.field protected mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

.field protected mActionBarDrawerToggleEnabled:Z

.field protected mActivity:Landroid/app/Activity;

.field protected mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

.field protected mAnimateActionBarDrawerToggle:Z

.field protected mAnimateDrawerItems:Z

.field protected mCloseOnClick:Z

.field protected mCurrentFooterSelection:I

.field protected mCurrentSelection:I

.field protected mCustomView:Landroid/view/View;

.field protected mDelayOnDrawerClose:I

.field protected mDisplayBelowStatusBar:Ljava/lang/Boolean;

.field protected mDrawerContentRoot:Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;

.field protected mDrawerGravity:Ljava/lang/Integer;

.field protected mDrawerItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;"
        }
    .end annotation
.end field

.field protected mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

.field protected mDrawerWidth:I

.field protected mFireInitialOnClick:Z

.field protected mFooterClickable:Z

.field protected mFooterDivider:Z

.field protected mFooterView:Landroid/view/View;

.field protected mFullscreen:Z

.field protected mHeaderClickable:Z

.field protected mHeaderDivider:Z

.field protected mHeaderOffset:I

.field protected mHeaderView:Landroid/view/View;

.field protected mListView:Landroid/widget/ListView;

.field protected mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

.field protected mOnDrawerItemLongClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;

.field protected mOnDrawerItemSelectedListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemSelectedListener;

.field protected mOnDrawerListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;

.field protected mOnDrawerNavigationListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerNavigationListener;

.field protected mRootView:Landroid/view/ViewGroup;

.field protected mSavedInstance:Landroid/os/Bundle;

.field protected mSelectedItem:I

.field protected mShowDrawerOnFirstLaunch:Z

.field protected mSliderBackgroundColor:I

.field protected mSliderBackgroundColorRes:I

.field protected mSliderBackgroundDrawable:Landroid/graphics/drawable/Drawable;

.field protected mSliderBackgroundDrawableRes:I

.field protected mSliderLayout:Landroid/widget/RelativeLayout;

.field protected mStatusBarColor:I

.field protected mStatusBarColorRes:I

.field protected mStickyDrawerItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;"
        }
    .end annotation
.end field

.field protected mStickyFooterDivider:Ljava/lang/Boolean;

.field protected mStickyFooterView:Landroid/view/ViewGroup;

.field protected mStickyHeaderView:Landroid/view/View;

.field protected mToolbar:Landroid/support/v7/widget/Toolbar;

.field protected mTranslucentActionBarCompatibility:Z

.field protected mTranslucentNavigationBar:Z

.field protected mTranslucentNavigationBarProgrammatically:Z

.field protected mTranslucentStatusBar:Z

.field protected mTranslucentStatusBarProgrammatically:Z

.field protected mTranslucentStatusBarShadow:Ljava/lang/Boolean;

.field protected mUsed:Z


# direct methods
.method public constructor <init>()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v0, -0x1

    const/4 v1, 0x0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mUsed:Z

    .line 44
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    .line 45
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentFooterSelection:I

    .line 112
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentActionBarCompatibility:Z

    .line 139
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBar:Z

    .line 173
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarProgrammatically:Z

    .line 192
    iput-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarShadow:Ljava/lang/Boolean;

    .line 224
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBar:Z

    .line 244
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBarProgrammatically:Z

    .line 263
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFullscreen:Z

    .line 336
    iput v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColor:I

    .line 337
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColorRes:I

    .line 362
    iput v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColor:I

    .line 363
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColorRes:I

    .line 364
    iput-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 365
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundDrawableRes:I

    .line 418
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerWidth:I

    .line 462
    const v0, 0x800003

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    .line 477
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeaderSticky:Z

    .line 510
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAnimateActionBarDrawerToggle:Z

    .line 527
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggleEnabled:Z

    .line 557
    iput v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    .line 558
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderDivider:Z

    .line 559
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderClickable:Z

    .line 652
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterDivider:Z

    .line 653
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterClickable:Z

    .line 709
    iput-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterDivider:Ljava/lang/Boolean;

    .line 753
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFireInitialOnClick:Z

    .line 767
    iput v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSelectedItem:I

    .line 811
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAnimateDrawerItems:Z

    .line 825
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    .line 856
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    .line 887
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCloseOnClick:Z

    .line 901
    const/16 v0, 0x96

    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDelayOnDrawerClose:I

    .line 989
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mShowDrawerOnFirstLaunch:Z

    .line 57
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .registers 6
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v0, -0x1

    const/4 v1, 0x0

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mUsed:Z

    .line 44
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    .line 45
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentFooterSelection:I

    .line 112
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentActionBarCompatibility:Z

    .line 139
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBar:Z

    .line 173
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarProgrammatically:Z

    .line 192
    iput-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarShadow:Ljava/lang/Boolean;

    .line 224
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBar:Z

    .line 244
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBarProgrammatically:Z

    .line 263
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFullscreen:Z

    .line 336
    iput v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColor:I

    .line 337
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColorRes:I

    .line 362
    iput v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColor:I

    .line 363
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColorRes:I

    .line 364
    iput-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 365
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundDrawableRes:I

    .line 418
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerWidth:I

    .line 462
    const v0, 0x800003

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    .line 477
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeaderSticky:Z

    .line 510
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAnimateActionBarDrawerToggle:Z

    .line 527
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggleEnabled:Z

    .line 557
    iput v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    .line 558
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderDivider:Z

    .line 559
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderClickable:Z

    .line 652
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterDivider:Z

    .line 653
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterClickable:Z

    .line 709
    iput-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterDivider:Ljava/lang/Boolean;

    .line 753
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFireInitialOnClick:Z

    .line 767
    iput v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSelectedItem:I

    .line 811
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAnimateDrawerItems:Z

    .line 825
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    .line 856
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    .line 887
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCloseOnClick:Z

    .line 901
    const/16 v0, 0x96

    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDelayOnDrawerClose:I

    .line 989
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mShowDrawerOnFirstLaunch:Z

    .line 65
    const v0, 0x1020002

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    .line 66
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    .line 67
    return-void
.end method

.method private createContent()V
    .registers 19

    .prologue
    .line 1355
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCustomView:Landroid/view/View;

    if-eqz v2, :cond_1d

    .line 1356
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x1

    invoke-direct {v9, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1360
    .local v9, "contentParams":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, v9, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 1361
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCustomView:Landroid/view/View;

    invoke-virtual {v2, v3, v9}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1524
    .end local v9    # "contentParams":Landroid/widget/LinearLayout$LayoutParams;
    :cond_1c
    :goto_1c
    return-void

    .line 1366
    :cond_1d
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    if-nez v2, :cond_b8

    .line 1367
    new-instance v2, Landroid/widget/ListView;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    .line 1368
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setChoiceMode(I)V

    .line 1369
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 1371
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setFadingEdgeLength(I)V

    .line 1372
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setCacheColorHint(I)V

    .line 1374
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    sget v4, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_background:I

    sget v5, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_background:I

    invoke-static {v3, v4, v5}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setDrawingCacheBackgroundColor(I)V

    .line 1376
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-le v2, v3, :cond_71

    .line 1377
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setDrawSelectorOnTop(Z)V

    .line 1379
    :cond_71
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setClipToPadding(Z)V

    .line 1381
    const/4 v12, 0x0

    .line 1382
    .local v12, "paddingTop":I
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBar:Z

    if-eqz v2, :cond_86

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentActionBarCompatibility:Z

    if-eqz v2, :cond_8c

    :cond_86
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFullscreen:Z

    if-eqz v2, :cond_94

    .line 1383
    :cond_8c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v2}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getStatusBarHeight(Landroid/content/Context;)I

    move-result v12

    .line 1385
    :cond_94
    const/4 v11, 0x0

    .line 1386
    .local v11, "paddingBottom":I
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBar:Z

    if-nez v2, :cond_a1

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFullscreen:Z

    if-eqz v2, :cond_af

    :cond_a1
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-lt v2, v3, :cond_af

    .line 1387
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v2}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getNavigationBarHeight(Landroid/content/Context;)I

    move-result v11

    .line 1390
    :cond_af
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v12, v4, v11}, Landroid/widget/ListView;->setPadding(IIII)V

    .line 1393
    .end local v11    # "paddingBottom":I
    .end local v12    # "paddingTop":I
    :cond_b8
    new-instance v13, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x1

    invoke-direct {v13, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1397
    .local v13, "params":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, v13, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 1398
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    invoke-virtual {v2, v3, v13}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1401
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    sget v3, Lcom/mikepenz/materialdrawer/R$id;->shadow_top:I

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v16

    .line 1402
    .local v16, "statusBarShadow":Landroid/view/View;
    invoke-virtual/range {v16 .. v16}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v15

    check-cast v15, Landroid/widget/RelativeLayout$LayoutParams;

    .line 1403
    .local v15, "shadowLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getStatusBarHeight(Landroid/content/Context;Z)I

    move-result v2

    iput v2, v15, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 1404
    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1407
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBar:Z

    if-eqz v2, :cond_fa

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentActionBarCompatibility:Z

    if-eqz v2, :cond_10a

    :cond_fa
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarShadow:Ljava/lang/Boolean;

    if-eqz v2, :cond_200

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarShadow:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_200

    .line 1408
    :cond_10a
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarShadow:Ljava/lang/Boolean;

    if-nez v2, :cond_1fb

    .line 1410
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x14

    if-le v2, v3, :cond_1f2

    .line 1412
    invoke-virtual/range {v16 .. v16}, Landroid/view/View;->bringToFront()V

    .line 1427
    :goto_119
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    if-eqz v2, :cond_13a

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    if-nez v2, :cond_13a

    .line 1428
    new-instance v2, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAnimateDrawerItems:Z

    invoke-direct {v2, v3, v4, v5}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;-><init>(Landroid/app/Activity;Ljava/util/ArrayList;Z)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    .line 1432
    :cond_13a
    invoke-static/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/DrawerUtils;->handleHeaderView(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    .line 1435
    new-instance v2, Lcom/mikepenz/materialdrawer/DrawerBuilder$4;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder$4;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Lcom/mikepenz/materialdrawer/DrawerUtils;->handleFooterView(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/view/View$OnClickListener;)V

    .line 1444
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    if-eqz v2, :cond_164

    .line 1446
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 1449
    move-object/from16 v0, p0

    iget v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSelectedItem:I

    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v2, v3}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setListSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;IZ)Z

    .line 1453
    :cond_164
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    new-instance v3, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 1480
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    new-instance v3, Lcom/mikepenz/materialdrawer/DrawerBuilder$6;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder$6;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 1491
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    new-instance v3, Lcom/mikepenz/materialdrawer/DrawerBuilder$7;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder$7;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 1508
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    if-eqz v2, :cond_19c

    .line 1509
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->smoothScrollToPosition(I)V

    .line 1513
    :cond_19c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSavedInstance:Landroid/os/Bundle;

    if-eqz v2, :cond_1c4

    .line 1514
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSavedInstance:Landroid/os/Bundle;

    const-string v3, "bundle_selection"

    const/4 v4, -0x1

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v14

    .line 1515
    .local v14, "selection":I
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v14, v2}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setListSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;IZ)Z

    .line 1516
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSavedInstance:Landroid/os/Bundle;

    const-string v3, "bundle_footer_selection"

    const/4 v4, -0x1

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v10

    .line 1517
    .local v10, "footerSelection":I
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v10, v2}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setFooterSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;IZ)V

    .line 1521
    .end local v10    # "footerSelection":I
    .end local v14    # "selection":I
    :cond_1c4
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFireInitialOnClick:Z

    if-eqz v2, :cond_1c

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    if-eqz v2, :cond_1c

    .line 1522
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget v5, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    int-to-long v6, v6

    move-object/from16 v0, p0

    iget v8, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    const/16 v17, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v8, v1}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getDrawerItem(IZ)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v8

    invoke-interface/range {v2 .. v8}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJLcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z

    goto/16 :goto_1c

    .line 1415
    :cond_1f2
    const/16 v2, 0x8

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_119

    .line 1419
    :cond_1fb
    invoke-virtual/range {v16 .. v16}, Landroid/view/View;->bringToFront()V

    goto/16 :goto_119

    .line 1423
    :cond_200
    const/16 v2, 0x8

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_119
.end method

.method private handleShowOnFirstLaunch()V
    .registers 5

    .prologue
    .line 1022
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-eqz v2, :cond_2f

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-eqz v2, :cond_2f

    iget-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mShowDrawerOnFirstLaunch:Z

    if-eqz v2, :cond_2f

    .line 1023
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1025
    .local v1, "preferences":Landroid/content/SharedPreferences;
    const-string v2, "navigation_drawer_learned"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_2f

    .line 1027
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v3}, Landroid/support/v4/widget/DrawerLayout;->openDrawer(Landroid/view/View;)V

    .line 1030
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1031
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "navigation_drawer_learned"

    const/4 v3, 0x1

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1032
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1035
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v1    # "preferences":Landroid/content/SharedPreferences;
    :cond_2f
    return-void
.end method


# virtual methods
.method public varargs addDrawerItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "drawerItems"    # [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 845
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 846
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    .line 849
    :cond_b
    if-eqz p1, :cond_12

    .line 850
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 852
    :cond_12
    return-object p0
.end method

.method public varargs addStickyDrawerItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "stickyDrawerItems"    # [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 876
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 877
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    .line 880
    :cond_b
    if-eqz p1, :cond_12

    .line 881
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 883
    :cond_12
    return-object p0
.end method

.method public append(Lcom/mikepenz/materialdrawer/Drawer;)Lcom/mikepenz/materialdrawer/Drawer;
    .registers 8
    .param p1, "result"    # Lcom/mikepenz/materialdrawer/Drawer;

    .prologue
    const/4 v5, 0x1

    .line 1314
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mUsed:Z

    if-eqz v1, :cond_d

    .line 1315
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "you must not reuse a DrawerBuilder builder"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1317
    :cond_d
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    if-nez v1, :cond_19

    .line 1318
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "please set the gravity for the drawer"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1322
    :cond_19
    iput-boolean v5, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mUsed:Z

    .line 1325
    invoke-virtual {p1}, Lcom/mikepenz/materialdrawer/Drawer;->getDrawerLayout()Landroid/support/v4/widget/DrawerLayout;

    move-result-object v1

    iput-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    .line 1328
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_slider:I

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    .line 1329
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    sget v3, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_background:I

    sget v4, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_background:I

    invoke-static {v2, v3, v4}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 1331
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    .line 1333
    .local v0, "params":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->gravity:I

    .line 1335
    invoke-static {p0, v0}, Lcom/mikepenz/materialdrawer/DrawerUtils;->processDrawerLayoutParams(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/support/v4/widget/DrawerLayout$LayoutParams;)Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    move-result-object v0

    .line 1337
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1339
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v2, v5}, Landroid/support/v4/widget/DrawerLayout;->addView(Landroid/view/View;I)V

    .line 1342
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->createContent()V

    .line 1345
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    .line 1347
    new-instance v1, Lcom/mikepenz/materialdrawer/Drawer;

    invoke-direct {v1, p0}, Lcom/mikepenz/materialdrawer/Drawer;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    return-object v1
.end method

.method public build()Lcom/mikepenz/materialdrawer/Drawer;
    .registers 14

    .prologue
    const/16 v6, 0x15

    const/4 v12, 0x1

    const/16 v5, 0x13

    const/4 v4, -0x1

    const/4 v3, 0x0

    .line 1043
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mUsed:Z

    if-eqz v0, :cond_13

    .line 1044
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "you must not reuse a DrawerBuilder builder"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1046
    :cond_13
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_1f

    .line 1047
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "please pass an activity"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1051
    :cond_1f
    iput-boolean v12, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mUsed:Z

    .line 1054
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-nez v0, :cond_28

    .line 1055
    invoke-virtual {p0, v4}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->withDrawerLayout(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;

    .line 1059
    :cond_28
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    if-eqz v0, :cond_34

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-nez v0, :cond_3c

    .line 1060
    :cond_34
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "You have to set your layout for this activity with setContentView() first. Or you build the drawer on your own with .buildView()"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1064
    :cond_3c
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 1065
    .local v8, "contentView":Landroid/view/View;
    instance-of v7, v8, Landroid/support/v4/widget/DrawerLayout;

    .line 1068
    .local v7, "alreadyInflated":Z
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0, v3}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerContentRoot:Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;

    .line 1071
    if-nez v7, :cond_b6

    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBar:Z

    if-eqz v0, :cond_b6

    .line 1072
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v5, :cond_61

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v0, v6, :cond_61

    .line 1073
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v0, v12}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setTranslucentStatusFlag(Landroid/app/Activity;Z)V

    .line 1075
    :cond_61
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v5, :cond_78

    .line 1076
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarProgrammatically:Z

    if-eqz v0, :cond_78

    .line 1077
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x500

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 1080
    :cond_78
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v6, :cond_8e

    .line 1081
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v0, v3}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setTranslucentStatusFlag(Landroid/app/Activity;Z)V

    .line 1082
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarProgrammatically:Z

    if-eqz v0, :cond_8e

    .line 1083
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 1086
    :cond_8e
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerContentRoot:Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getStatusBarHeight(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v3, v1, v3, v3}, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->setPadding(IIII)V

    .line 1089
    iget v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColor:I

    if-nez v0, :cond_17d

    iget v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColorRes:I

    if-eq v0, v4, :cond_17d

    .line 1090
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColorRes:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColor:I

    .line 1094
    :cond_af
    :goto_af
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerContentRoot:Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;

    iget v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColor:I

    invoke-virtual {v0, v1}, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->setInsetForeground(I)V

    .line 1098
    :cond_b6
    if-nez v7, :cond_f6

    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBar:Z

    if-eqz v0, :cond_f6

    .line 1099
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v5, :cond_c9

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v0, v6, :cond_c9

    .line 1100
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v0, v12}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setTranslucentNavigationFlag(Landroid/app/Activity;Z)V

    .line 1102
    :cond_c9
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v5, :cond_e5

    .line 1103
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBarProgrammatically:Z

    if-eqz v0, :cond_e5

    .line 1104
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x500

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 1105
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v0, v12}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setTranslucentNavigationFlag(Landroid/app/Activity;Z)V

    .line 1108
    :cond_e5
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v6, :cond_f6

    .line 1109
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBarProgrammatically:Z

    if-eqz v0, :cond_f6

    .line 1110
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 1116
    :cond_f6
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFullscreen:Z

    if-eqz v0, :cond_103

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v5, :cond_103

    .line 1117
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerContentRoot:Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;

    invoke-virtual {v0, v3}, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->setEnabled(Z)V

    .line 1121
    :cond_103
    if-nez v7, :cond_18f

    .line 1123
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    invoke-virtual {v0, v8}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 1130
    :goto_10a
    new-instance v9, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v9, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1136
    .local v9, "layoutParamsContentView":Landroid/widget/FrameLayout$LayoutParams;
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBar:Z

    if-eqz v0, :cond_11f

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v5, :cond_11f

    .line 1137
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getNavigationBarHeight(Landroid/content/Context;)I

    move-result v0

    iput v0, v9, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 1141
    :cond_11f
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerContentRoot:Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;

    invoke-virtual {v0, v8, v9}, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1144
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v2, v4, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1150
    new-instance v11, Lcom/mikepenz/materialdrawer/DrawerBuilder$1;

    invoke-direct {v11, p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder$1;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    .line 1169
    .local v11, "toolbarNavigationListener":Landroid/view/View$OnClickListener;
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggleEnabled:Z

    if-eqz v0, :cond_158

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

    if-nez v0, :cond_158

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mToolbar:Landroid/support/v7/widget/Toolbar;

    if-eqz v0, :cond_158

    .line 1170
    new-instance v0, Lcom/mikepenz/materialdrawer/DrawerBuilder$2;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mToolbar:Landroid/support/v7/widget/Toolbar;

    sget v5, Lcom/mikepenz/materialdrawer/R$string;->drawer_open:I

    sget v6, Lcom/mikepenz/materialdrawer/R$string;->drawer_close:I

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/mikepenz/materialdrawer/DrawerBuilder$2;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/app/Activity;Landroid/support/v4/widget/DrawerLayout;Landroid/support/v7/widget/Toolbar;II)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

    .line 1200
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

    invoke-virtual {v0}, Landroid/support/v7/app/ActionBarDrawerToggle;->syncState()V

    .line 1205
    :cond_158
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mToolbar:Landroid/support/v7/widget/Toolbar;

    if-eqz v0, :cond_161

    .line 1206
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, v11}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1210
    :cond_161
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

    if-eqz v0, :cond_196

    .line 1211
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

    invoke-virtual {v0, v11}, Landroid/support/v7/app/ActionBarDrawerToggle;->setToolbarNavigationClickListener(Landroid/view/View$OnClickListener;)V

    .line 1212
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->setDrawerListener(Landroid/support/v4/widget/DrawerLayout$DrawerListener;)V

    .line 1244
    :goto_171
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->buildView()Lcom/mikepenz/materialdrawer/Drawer;

    move-result-object v10

    .line 1247
    .local v10, "result":Lcom/mikepenz/materialdrawer/Drawer;
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1, v12}, Landroid/support/v4/widget/DrawerLayout;->addView(Landroid/view/View;I)V

    .line 1249
    return-object v10

    .line 1091
    .end local v9    # "layoutParamsContentView":Landroid/widget/FrameLayout$LayoutParams;
    .end local v10    # "result":Lcom/mikepenz/materialdrawer/Drawer;
    .end local v11    # "toolbarNavigationListener":Landroid/view/View$OnClickListener;
    :cond_17d
    iget v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColor:I

    if-nez v0, :cond_af

    .line 1092
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    sget v1, Lcom/mikepenz/materialdrawer/R$attr;->colorPrimaryDark:I

    sget v2, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_primary_dark:I

    invoke-static {v0, v1, v2}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColor:I

    goto/16 :goto_af

    .line 1126
    :cond_18f
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    goto/16 :goto_10a

    .line 1214
    .restart local v9    # "layoutParamsContentView":Landroid/widget/FrameLayout$LayoutParams;
    .restart local v11    # "toolbarNavigationListener":Landroid/view/View$OnClickListener;
    :cond_196
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    new-instance v1, Lcom/mikepenz/materialdrawer/DrawerBuilder$3;

    invoke-direct {v1, p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder$3;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->setDrawerListener(Landroid/support/v4/widget/DrawerLayout$DrawerListener;)V

    goto :goto_171
.end method

.method public buildView()Lcom/mikepenz/materialdrawer/Drawer;
    .registers 8

    .prologue
    const/4 v6, -0x1

    .line 1259
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    sget v3, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_slider:I

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout;

    iput-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    .line 1260
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    sget v4, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_background:I

    sget v5, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_background:I

    invoke-static {v3, v4, v5}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 1262
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    .line 1263
    .local v0, "params":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    if-eqz v0, :cond_3e

    .line 1265
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->gravity:I

    .line 1267
    invoke-static {p0, v0}, Lcom/mikepenz/materialdrawer/DrawerUtils;->processDrawerLayoutParams(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/support/v4/widget/DrawerLayout$LayoutParams;)Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    move-result-object v0

    .line 1269
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1273
    :cond_3e
    iget v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColor:I

    if-eqz v2, :cond_74

    .line 1274
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    iget v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColor:I

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 1284
    :cond_49
    :goto_49
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-ge v2, v3, :cond_5c

    .line 1285
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    sget v3, Lcom/mikepenz/materialdrawer/R$drawable;->drawer_shadow:I

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Landroid/support/v4/widget/DrawerLayout;->setDrawerShadow(II)V

    .line 1289
    :cond_5c
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->createContent()V

    .line 1292
    new-instance v1, Lcom/mikepenz/materialdrawer/Drawer;

    invoke-direct {v1, p0}, Lcom/mikepenz/materialdrawer/Drawer;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    .line 1294
    .local v1, "result":Lcom/mikepenz/materialdrawer/Drawer;
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeader:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;

    if-eqz v2, :cond_6d

    .line 1295
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeader:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;

    invoke-virtual {v2, v1}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->setDrawer(Lcom/mikepenz/materialdrawer/Drawer;)V

    .line 1299
    :cond_6d
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->handleShowOnFirstLaunch()V

    .line 1302
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    .line 1304
    return-object v1

    .line 1275
    .end local v1    # "result":Lcom/mikepenz/materialdrawer/Drawer;
    :cond_74
    iget v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColorRes:I

    if-eq v2, v6, :cond_8a

    .line 1276
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColorRes:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    goto :goto_49

    .line 1277
    :cond_8a
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_96

    .line 1278
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    invoke-static {v2, v3}, Lcom/mikepenz/materialdrawer/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    goto :goto_49

    .line 1279
    :cond_96
    iget v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundDrawableRes:I

    if-eq v2, v6, :cond_49

    .line 1280
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    iget v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColorRes:I

    invoke-static {v2, v3}, Lcom/mikepenz/materialdrawer/util/UIUtils;->setBackground(Landroid/view/View;I)V

    goto :goto_49
.end method

.method protected checkDrawerItem(IZ)Z
    .registers 7
    .param p1, "position"    # I
    .param p2, "includeOffset"    # Z

    .prologue
    const/4 v0, 0x1

    const/4 v3, -0x1

    .line 1571
    if-eqz p2, :cond_1b

    .line 1572
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    if-eqz v1, :cond_29

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    sub-int v2, p1, v2

    if-le v1, v2, :cond_29

    iget v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    sub-int v1, p1, v1

    if-le v1, v3, :cond_29

    .line 1580
    :cond_1a
    :goto_1a
    return v0

    .line 1576
    :cond_1b
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    if-eqz v1, :cond_29

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v1, p1, :cond_29

    if-gt p1, v3, :cond_1a

    .line 1580
    :cond_29
    const/4 v0, 0x0

    goto :goto_1a
.end method

.method protected closeDrawerDelayed()V
    .registers 5

    .prologue
    .line 1530
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCloseOnClick:Z

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-eqz v0, :cond_1d

    .line 1531
    iget v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDelayOnDrawerClose:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_1e

    .line 1532
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lcom/mikepenz/materialdrawer/DrawerBuilder$8;

    invoke-direct {v1, p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder$8;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    iget v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDelayOnDrawerClose:I

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1542
    :cond_1d
    :goto_1d
    return-void

    .line 1539
    :cond_1e
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0}, Landroid/support/v4/widget/DrawerLayout;->closeDrawers()V

    goto :goto_1d
.end method

.method protected getDrawerItem(IZ)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .registers 6
    .param p1, "position"    # I
    .param p2, "includeOffset"    # Z

    .prologue
    const/4 v2, -0x1

    .line 1551
    if-eqz p2, :cond_26

    .line 1552
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    if-eqz v0, :cond_3d

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    sub-int v1, p1, v1

    if-le v0, v1, :cond_3d

    iget v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    sub-int v0, p1, v0

    if-le v0, v2, :cond_3d

    .line 1553
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    iget v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    sub-int v1, p1, v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 1560
    :goto_25
    return-object v0

    .line 1556
    :cond_26
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    if-eqz v0, :cond_3d

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, p1, :cond_3d

    if-le p1, v2, :cond_3d

    .line 1557
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    goto :goto_25

    .line 1560
    :cond_3d
    const/4 v0, 0x0

    goto :goto_25
.end method

.method protected resetStickyFooterSelection()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 1587
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    instance-of v1, v1, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_31

    .line 1588
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_31

    .line 1589
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_23

    .line 1590
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/View;->setActivated(Z)V

    .line 1592
    :cond_23
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/View;->setSelected(Z)V

    .line 1588
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 1595
    .end local v0    # "i":I
    :cond_31
    return-void
.end method

.method public withAccountHeader(Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "accountHeader"    # Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;

    .prologue
    .line 487
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->withAccountHeader(Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;

    move-result-object v0

    return-object v0
.end method

.method public withAccountHeader(Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 4
    .param p1, "accountHeader"    # Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;
    .param p2, "accountHeaderSticky"    # Z

    .prologue
    .line 499
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeader:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;

    .line 500
    iput-boolean p2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeaderSticky:Z

    .line 503
    if-nez p2, :cond_9

    .line 504
    const/4 v0, 0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    .line 506
    :cond_9
    return-object p0
.end method

.method public withActionBarDrawerToggle(Landroid/support/v7/app/ActionBarDrawerToggle;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "actionBarDrawerToggle"    # Landroid/support/v7/app/ActionBarDrawerToggle;

    .prologue
    .line 550
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggleEnabled:Z

    .line 551
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

    .line 552
    return-object p0
.end method

.method public withActionBarDrawerToggle(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "actionBarDrawerToggleEnabled"    # Z

    .prologue
    .line 536
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggleEnabled:Z

    .line 537
    return-object p0
.end method

.method public withActionBarDrawerToggleAnimated(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "actionBarDrawerToggleAnimated"    # Z

    .prologue
    .line 521
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAnimateActionBarDrawerToggle:Z

    .line 522
    return-object p0
.end method

.method public withActivity(Landroid/app/Activity;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 77
    const v0, 0x1020002

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    .line 78
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    .line 79
    return-object p0
.end method

.method public withAdapter(Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "adapter"    # Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    .prologue
    .line 806
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    .line 807
    return-object p0
.end method

.method public withAnimateDrawerItems(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "animateDrawerItems"    # Z

    .prologue
    .line 820
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAnimateDrawerItems:Z

    .line 821
    return-object p0
.end method

.method public withCloseOnClick(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "closeOnClick"    # Z

    .prologue
    .line 896
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCloseOnClick:Z

    .line 897
    return-object p0
.end method

.method public withCustomView(Landroid/view/View;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "customView"    # Landroid/view/View;

    .prologue
    .line 294
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCustomView:Landroid/view/View;

    .line 295
    return-object p0
.end method

.method public withDelayOnDrawerClose(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "delayOnDrawerClose"    # I

    .prologue
    .line 913
    iput p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDelayOnDrawerClose:I

    .line 914
    return-object p0
.end method

.method public withDisplayBelowStatusBar(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "displayBelowStatusBar"    # Z

    .prologue
    .line 167
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDisplayBelowStatusBar:Ljava/lang/Boolean;

    .line 168
    return-object p0
.end method

.method public withDisplayBelowToolbar(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "displayBelowToolbar"    # Z

    .prologue
    .line 134
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentActionBarCompatibility:Z

    .line 135
    return-object p0
.end method

.method public withDrawerGravity(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "gravity"    # I

    .prologue
    .line 471
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    .line 472
    return-object p0
.end method

.method public withDrawerItems(Ljava/util/ArrayList;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;)",
            "Lcom/mikepenz/materialdrawer/DrawerBuilder;"
        }
    .end annotation

    .prologue
    .line 834
    .local p1, "drawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    .line 835
    return-object p0
.end method

.method public withDrawerLayout(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 6
    .param p1, "resLayout"    # I

    .prologue
    const/4 v3, 0x0

    .line 322
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_d

    .line 323
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "please pass an activity first to use this call"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 326
    :cond_d
    const/4 v0, -0x1

    if-eq p1, v0, :cond_21

    .line 327
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    invoke-virtual {v0, p1, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    .line 332
    :goto_20
    return-object p0

    .line 329
    :cond_21
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer:I

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    goto :goto_20
.end method

.method public withDrawerLayout(Landroid/support/v4/widget/DrawerLayout;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "drawerLayout"    # Landroid/support/v4/widget/DrawerLayout;

    .prologue
    .line 310
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    .line 311
    return-object p0
.end method

.method public withDrawerWidthDp(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 4
    .param p1, "drawerWidthDp"    # I

    .prologue
    .line 438
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_c

    .line 439
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "please pass an activity first to use this call"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 442
    :cond_c
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerWidth:I

    .line 443
    return-object p0
.end method

.method public withDrawerWidthPx(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "drawerWidthPx"    # I

    .prologue
    .line 427
    iput p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerWidth:I

    .line 428
    return-object p0
.end method

.method public withDrawerWidthRes(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 4
    .param p1, "drawerWidthRes"    # I

    .prologue
    .line 453
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_c

    .line 454
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "please pass an activity first to use this call"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 457
    :cond_c
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerWidth:I

    .line 458
    return-object p0
.end method

.method public withFireOnInitialOnClick(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "fireOnInitialOnClick"    # Z

    .prologue
    .line 762
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFireInitialOnClick:Z

    .line 763
    return-object p0
.end method

.method public withFooter(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 5
    .param p1, "footerViewRes"    # I

    .prologue
    .line 673
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_c

    .line 674
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "please pass an activity first to use this call"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 677
    :cond_c
    const/4 v0, -0x1

    if-eq p1, v0, :cond_1d

    .line 679
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterView:Landroid/view/View;

    .line 682
    :cond_1d
    return-object p0
.end method

.method public withFooter(Landroid/view/View;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "footerView"    # Landroid/view/View;

    .prologue
    .line 662
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterView:Landroid/view/View;

    .line 663
    return-object p0
.end method

.method public withFooterClickable(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "footerClickable"    # Z

    .prologue
    .line 692
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterClickable:Z

    .line 693
    return-object p0
.end method

.method public withFooterDivider(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "footerDivider"    # Z

    .prologue
    .line 703
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterDivider:Z

    .line 704
    return-object p0
.end method

.method public withFullscreen(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "fullscreen"    # Z

    .prologue
    const/4 v0, 0x0

    .line 273
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFullscreen:Z

    .line 275
    if-eqz p1, :cond_b

    .line 276
    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->withTranslucentStatusBar(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;

    .line 277
    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->withTranslucentNavigationBar(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;

    .line 280
    :cond_b
    return-object p0
.end method

.method public withHeader(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 5
    .param p1, "headerViewRes"    # I

    .prologue
    .line 581
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_c

    .line 582
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "please pass an activity first to use this call"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 585
    :cond_c
    const/4 v0, -0x1

    if-eq p1, v0, :cond_20

    .line 587
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderView:Landroid/view/View;

    .line 589
    const/4 v0, 0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    .line 592
    :cond_20
    return-object p0
.end method

.method public withHeader(Landroid/view/View;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "headerView"    # Landroid/view/View;

    .prologue
    .line 568
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderView:Landroid/view/View;

    .line 570
    const/4 v0, 0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    .line 571
    return-object p0
.end method

.method public withHeaderClickable(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "headerClickable"    # Z

    .prologue
    .line 602
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderClickable:Z

    .line 603
    return-object p0
.end method

.method public withHeaderDivider(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "headerDivider"    # Z

    .prologue
    .line 613
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderDivider:Z

    .line 614
    return-object p0
.end method

.method public withListView(Landroid/widget/ListView;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "listView"    # Landroid/widget/ListView;

    .prologue
    .line 791
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    .line 792
    return-object p0
.end method

.method public withOnDrawerItemClickListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "onDrawerItemClickListener"    # Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    .prologue
    .line 942
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    .line 943
    return-object p0
.end method

.method public withOnDrawerItemLongClickListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "onDrawerItemLongClickListener"    # Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;

    .prologue
    .line 956
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemLongClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;

    .line 957
    return-object p0
.end method

.method public withOnDrawerItemSelectedListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemSelectedListener;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "onDrawerItemSelectedListener"    # Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemSelectedListener;

    .prologue
    .line 970
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemSelectedListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemSelectedListener;

    .line 971
    return-object p0
.end method

.method public withOnDrawerListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "onDrawerListener"    # Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;

    .prologue
    .line 928
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;

    .line 929
    return-object p0
.end method

.method public withOnDrawerNavigationListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerNavigationListener;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "onDrawerNavigationListener"    # Lcom/mikepenz/materialdrawer/Drawer$OnDrawerNavigationListener;

    .prologue
    .line 984
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerNavigationListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerNavigationListener;

    .line 985
    return-object p0
.end method

.method public withRootView(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 4
    .param p1, "rootViewRes"    # I

    .prologue
    .line 104
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_c

    .line 105
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "please pass an activity first to use this call"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    :cond_c
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->withRootView(Landroid/view/ViewGroup;)Lcom/mikepenz/materialdrawer/DrawerBuilder;

    move-result-object v0

    return-object v0
.end method

.method public withRootView(Landroid/view/ViewGroup;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "rootView"    # Landroid/view/ViewGroup;

    .prologue
    .line 89
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    .line 92
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->withTranslucentStatusBar(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;

    .line 94
    return-object p0
.end method

.method public withSavedInstance(Landroid/os/Bundle;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "savedInstance"    # Landroid/os/Bundle;

    .prologue
    .line 1013
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSavedInstance:Landroid/os/Bundle;

    .line 1014
    return-object p0
.end method

.method public withSelectedItem(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "selectedItem"    # I

    .prologue
    .line 776
    iput p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSelectedItem:I

    .line 777
    return-object p0
.end method

.method public withShowDrawerOnFirstLaunch(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "showDrawerOnFirstLaunch"    # Z

    .prologue
    .line 998
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mShowDrawerOnFirstLaunch:Z

    .line 999
    return-object p0
.end method

.method public withSliderBackgroundColor(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "sliderBackgroundColor"    # I

    .prologue
    .line 375
    iput p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColor:I

    .line 376
    return-object p0
.end method

.method public withSliderBackgroundColorRes(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "sliderBackgroundColorRes"    # I

    .prologue
    .line 387
    iput p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColorRes:I

    .line 388
    return-object p0
.end method

.method public withSliderBackgroundDrawable(Landroid/graphics/drawable/Drawable;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "sliderBackgroundDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 400
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 401
    return-object p0
.end method

.method public withSliderBackgroundDrawableRes(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "sliderBackgroundDrawableRes"    # I

    .prologue
    .line 413
    iput p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundDrawableRes:I

    .line 414
    return-object p0
.end method

.method public withStatusBarColor(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "statusBarColor"    # I

    .prologue
    .line 346
    iput p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColor:I

    .line 347
    return-object p0
.end method

.method public withStatusBarColorRes(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "statusBarColorRes"    # I

    .prologue
    .line 357
    iput p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColorRes:I

    .line 358
    return-object p0
.end method

.method public withStickyDrawerItems(Ljava/util/ArrayList;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;)",
            "Lcom/mikepenz/materialdrawer/DrawerBuilder;"
        }
    .end annotation

    .prologue
    .line 865
    .local p1, "stickyDrawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    .line 866
    return-object p0
.end method

.method public withStickyFooter(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 5
    .param p1, "stickyFooterRes"    # I

    .prologue
    .line 729
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_c

    .line 730
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "please pass an activity first to use this call"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 733
    :cond_c
    const/4 v0, -0x1

    if-eq p1, v0, :cond_1f

    .line 735
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    .line 738
    :cond_1f
    return-object p0
.end method

.method public withStickyFooter(Landroid/view/ViewGroup;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "stickyFooter"    # Landroid/view/ViewGroup;

    .prologue
    .line 718
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    .line 719
    return-object p0
.end method

.method public withStickyFooterDivider(Ljava/lang/Boolean;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "stickyFooterDivider"    # Ljava/lang/Boolean;

    .prologue
    .line 748
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterDivider:Ljava/lang/Boolean;

    .line 749
    return-object p0
.end method

.method public withStickyHeader(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 5
    .param p1, "stickyHeaderRes"    # I

    .prologue
    .line 638
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_c

    .line 639
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "please pass an activity first to use this call"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 642
    :cond_c
    const/4 v0, -0x1

    if-eq p1, v0, :cond_1d

    .line 644
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyHeaderView:Landroid/view/View;

    .line 647
    :cond_1d
    return-object p0
.end method

.method public withStickyHeader(Landroid/view/View;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "stickyHeader"    # Landroid/view/View;

    .prologue
    .line 627
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyHeaderView:Landroid/view/View;

    .line 628
    return-object p0
.end method

.method public withToolbar(Landroid/support/v7/widget/Toolbar;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "toolbar"    # Landroid/support/v7/widget/Toolbar;

    .prologue
    .line 219
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mToolbar:Landroid/support/v7/widget/Toolbar;

    .line 220
    return-object p0
.end method

.method public withTranslucentActionBarCompatibility(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "translucentActionBarCompatibility"    # Z

    .prologue
    .line 122
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentActionBarCompatibility:Z

    .line 123
    return-object p0
.end method

.method public withTranslucentNavigationBar(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "translucentNavigationBar"    # Z

    .prologue
    .line 233
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBar:Z

    .line 236
    if-nez p1, :cond_7

    .line 237
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBarProgrammatically:Z

    .line 240
    :cond_7
    return-object p0
.end method

.method public withTranslucentNavigationBarProgrammatically(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "translucentNavigationBarProgrammatically"    # Z

    .prologue
    .line 253
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBarProgrammatically:Z

    .line 255
    if-eqz p1, :cond_7

    .line 256
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBar:Z

    .line 258
    :cond_7
    return-object p0
.end method

.method public withTranslucentStatusBar(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "translucentStatusBar"    # Z

    .prologue
    .line 148
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBar:Z

    .line 151
    if-nez p1, :cond_7

    .line 152
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarProgrammatically:Z

    .line 154
    :cond_7
    return-object p0
.end method

.method public withTranslucentStatusBarProgrammatically(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "translucentStatusBarProgrammatically"    # Z

    .prologue
    .line 183
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarProgrammatically:Z

    .line 185
    if-eqz p1, :cond_7

    .line 186
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBar:Z

    .line 188
    :cond_7
    return-object p0
.end method

.method public withTranslucentStatusBarShadow(Ljava/lang/Boolean;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "translucentStatusBarShadow"    # Ljava/lang/Boolean;

    .prologue
    .line 202
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarShadow:Ljava/lang/Boolean;

    .line 203
    return-object p0
.end method
