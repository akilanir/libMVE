.class public Lcom/mikepenz/materialdrawer/DrawerBuilder;
.super Ljava/lang/Object;
.source "DrawerBuilder.java"


# instance fields
.field protected mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

.field protected mAccountHeaderSticky:Z

.field protected mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

.field protected mActionBarDrawerToggleEnabled:Z

.field protected mActivity:Landroid/app/Activity;

.field protected mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

.field protected mAdapterWrapper:Landroid/support/v7/widget/RecyclerView$Adapter;

.field protected mAnimateActionBarDrawerToggle:Z

.field protected mAppended:Z

.field protected mCloseOnClick:Z

.field protected mCurrentSelection:I

.field protected mCurrentStickyFooterSelection:I

.field protected mCustomView:Landroid/view/View;

.field protected mDelayOnDrawerClose:I

.field protected mDisplayBelowStatusBar:Ljava/lang/Boolean;

.field protected mDrawerGravity:Ljava/lang/Integer;

.field protected mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

.field protected mDrawerWidth:I

.field protected mFireInitialOnClick:Z

.field protected mFooterClickable:Z

.field protected mFooterDivider:Z

.field protected mFooterView:Landroid/view/View;

.field protected mFullscreen:Z

.field protected mHasStableIds:Z

.field protected mHeaderClickable:Z

.field protected mHeaderDivider:Z

.field protected mHeaderView:Landroid/view/View;

.field private mInnerShadow:Z

.field protected mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

.field protected mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

.field protected mMaterialize:Lcom/mikepenz/materialize/Materialize;

.field protected mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

.field protected mOnDrawerItemLongClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;

.field protected mOnDrawerListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;

.field protected mOnDrawerNavigationListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerNavigationListener;

.field protected mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field protected mRootView:Landroid/view/ViewGroup;

.field protected mSavedInstance:Landroid/os/Bundle;

.field protected mScrollToTopAfterClick:Z

.field protected mSelectedItemIdentifier:I

.field protected mSelectedItemPosition:I

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

.field protected mStickyFooterDivider:Z

.field protected mStickyFooterShadow:Z

.field protected mStickyFooterShadowView:Landroid/view/View;

.field protected mStickyFooterView:Landroid/view/ViewGroup;

.field protected mStickyHeaderView:Landroid/view/View;

.field protected mSystemUIHidden:Z

.field protected mToolbar:Landroid/support/v7/widget/Toolbar;

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

    const/4 v0, -0x1

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mUsed:Z

    .line 63
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    .line 64
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentStickyFooterSelection:I

    .line 65
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAppended:Z

    .line 138
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBar:Z

    .line 171
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarProgrammatically:Z

    .line 189
    iput-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarShadow:Ljava/lang/Boolean;

    .line 202
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mInnerShadow:Z

    .line 231
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBar:Z

    .line 251
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBarProgrammatically:Z

    .line 270
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFullscreen:Z

    .line 291
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSystemUIHidden:Z

    .line 364
    iput v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColor:I

    .line 365
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColorRes:I

    .line 390
    iput v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColor:I

    .line 391
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColorRes:I

    .line 392
    iput-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 393
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundDrawableRes:I

    .line 446
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerWidth:I

    .line 490
    const v0, 0x800003

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    .line 505
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeaderSticky:Z

    .line 533
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAnimateActionBarDrawerToggle:Z

    .line 550
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggleEnabled:Z

    .line 579
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mScrollToTopAfterClick:Z

    .line 595
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderDivider:Z

    .line 596
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderClickable:Z

    .line 685
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterDivider:Z

    .line 686
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterClickable:Z

    .line 743
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterDivider:Z

    .line 747
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterShadow:Z

    .line 802
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFireInitialOnClick:Z

    .line 816
    iput v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSelectedItemPosition:I

    .line 830
    iput v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSelectedItemIdentifier:I

    .line 859
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHasStableIds:Z

    .line 924
    iput-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    .line 960
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    .line 1050
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCloseOnClick:Z

    .line 1064
    const/16 v0, 0x32

    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDelayOnDrawerClose:I

    .line 1138
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mShowDrawerOnFirstLaunch:Z

    .line 80
    invoke-static {}, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->getInstance()Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->clear()V

    .line 81
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .registers 6
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x0

    const/4 v0, -0x1

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mUsed:Z

    .line 63
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    .line 64
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentStickyFooterSelection:I

    .line 65
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAppended:Z

    .line 138
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBar:Z

    .line 171
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarProgrammatically:Z

    .line 189
    iput-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarShadow:Ljava/lang/Boolean;

    .line 202
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mInnerShadow:Z

    .line 231
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBar:Z

    .line 251
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBarProgrammatically:Z

    .line 270
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFullscreen:Z

    .line 291
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSystemUIHidden:Z

    .line 364
    iput v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColor:I

    .line 365
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColorRes:I

    .line 390
    iput v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColor:I

    .line 391
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColorRes:I

    .line 392
    iput-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 393
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundDrawableRes:I

    .line 446
    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerWidth:I

    .line 490
    const v0, 0x800003

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    .line 505
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeaderSticky:Z

    .line 533
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAnimateActionBarDrawerToggle:Z

    .line 550
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggleEnabled:Z

    .line 579
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mScrollToTopAfterClick:Z

    .line 595
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderDivider:Z

    .line 596
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderClickable:Z

    .line 685
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterDivider:Z

    .line 686
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterClickable:Z

    .line 743
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterDivider:Z

    .line 747
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterShadow:Z

    .line 802
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFireInitialOnClick:Z

    .line 816
    iput v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSelectedItemPosition:I

    .line 830
    iput v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSelectedItemIdentifier:I

    .line 859
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHasStableIds:Z

    .line 924
    iput-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    .line 960
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    .line 1050
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCloseOnClick:Z

    .line 1064
    const/16 v0, 0x32

    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDelayOnDrawerClose:I

    .line 1138
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mShowDrawerOnFirstLaunch:Z

    .line 89
    const v0, 0x1020002

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    .line 90
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    .line 91
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    .line 92
    return-void
.end method

.method private addMenuItems(Landroid/view/Menu;Z)V
    .registers 11
    .param p1, "mMenu"    # Landroid/view/Menu;
    .param p2, "subMenu"    # Z

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1013
    sget v0, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_menu_default_group:I

    .line 1014
    .local v0, "groupId":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    invoke-interface {p1}, Landroid/view/Menu;->size()I

    move-result v4

    if-ge v1, v4, :cond_106

    .line 1015
    invoke-interface {p1, v1}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 1017
    .local v3, "mMenuItem":Landroid/view/MenuItem;
    if-nez p2, :cond_31

    invoke-interface {v3}, Landroid/view/MenuItem;->getGroupId()I

    move-result v4

    if-eq v4, v0, :cond_31

    invoke-interface {v3}, Landroid/view/MenuItem;->getGroupId()I

    move-result v4

    if-eqz v4, :cond_31

    .line 1018
    invoke-interface {v3}, Landroid/view/MenuItem;->getGroupId()I

    move-result v0

    .line 1019
    new-instance v2, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem;

    invoke-direct {v2}, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem;-><init>()V

    .line 1020
    .local v2, "iDrawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v4

    new-array v5, v7, [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    aput-object v2, v5, v6

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->addDrawerItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 1022
    .end local v2    # "iDrawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    :cond_31
    invoke-interface {v3}, Landroid/view/MenuItem;->hasSubMenu()Z

    move-result v4

    if-eqz v4, :cond_83

    .line 1023
    new-instance v4, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    invoke-direct {v4}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;-><init>()V

    .line 1024
    invoke-interface {v3}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->withName(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    .line 1025
    invoke-interface {v3}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->withIcon(Landroid/graphics/drawable/Drawable;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    .line 1026
    invoke-interface {v3}, Landroid/view/MenuItem;->getItemId()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->withIdentifier(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    .line 1027
    invoke-interface {v3}, Landroid/view/MenuItem;->isEnabled()Z

    move-result v5

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->withEnabled(Z)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    .line 1028
    invoke-virtual {v4, v6}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->withSelectable(Z)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 1029
    .restart local v2    # "iDrawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v4

    new-array v5, v7, [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    aput-object v2, v5, v6

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->addDrawerItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 1030
    invoke-interface {v3}, Landroid/view/MenuItem;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v4

    invoke-direct {p0, v4, v7}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->addMenuItems(Landroid/view/Menu;Z)V

    .line 1014
    :goto_80
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 1031
    .end local v2    # "iDrawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    :cond_83
    invoke-interface {v3}, Landroid/view/MenuItem;->getGroupId()I

    move-result v4

    if-nez v4, :cond_8b

    if-eqz p2, :cond_c8

    .line 1032
    :cond_8b
    new-instance v4, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    invoke-direct {v4}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;-><init>()V

    .line 1033
    invoke-interface {v3}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->withName(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    .line 1034
    invoke-interface {v3}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->withIcon(Landroid/graphics/drawable/Drawable;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    .line 1035
    invoke-interface {v3}, Landroid/view/MenuItem;->getItemId()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->withIdentifier(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    .line 1036
    invoke-interface {v3}, Landroid/view/MenuItem;->isEnabled()Z

    move-result v5

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->withEnabled(Z)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 1037
    .restart local v2    # "iDrawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v4

    new-array v5, v7, [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    aput-object v2, v5, v6

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->addDrawerItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    goto :goto_80

    .line 1039
    .end local v2    # "iDrawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    :cond_c8
    new-instance v4, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    invoke-direct {v4}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;-><init>()V

    .line 1040
    invoke-interface {v3}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->withName(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    .line 1041
    invoke-interface {v3}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->withIcon(Landroid/graphics/drawable/Drawable;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    .line 1042
    invoke-interface {v3}, Landroid/view/MenuItem;->getItemId()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->withIdentifier(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    .line 1043
    invoke-interface {v3}, Landroid/view/MenuItem;->isEnabled()Z

    move-result v5

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->withEnabled(Z)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 1044
    .restart local v2    # "iDrawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v4

    new-array v5, v7, [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    aput-object v2, v5, v6

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->addDrawerItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    goto/16 :goto_80

    .line 1047
    .end local v2    # "iDrawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .end local v3    # "mMenuItem":Landroid/view/MenuItem;
    :cond_106
    return-void
.end method

.method private createContent()V
    .registers 16

    .prologue
    const/high16 v14, 0x3f800000    # 1.0f

    const/4 v13, 0x0

    const/16 v12, 0x8

    const/4 v11, 0x0

    const/4 v10, -0x1

    .line 1503
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCustomView:Landroid/view/View;

    if-eqz v7, :cond_1a

    .line 1504
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v10, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1508
    .local v0, "contentParams":Landroid/widget/LinearLayout$LayoutParams;
    iput v14, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 1509
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    iget-object v8, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCustomView:Landroid/view/View;

    invoke-virtual {v7, v8, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1694
    .end local v0    # "contentParams":Landroid/widget/LinearLayout$LayoutParams;
    :cond_19
    :goto_19
    return-void

    .line 1514
    :cond_1a
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x15

    if-ge v7, v8, :cond_3c

    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-eqz v7, :cond_3c

    .line 1515
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const v8, 0x800003

    if-ne v7, v8, :cond_1b9

    .line 1516
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    sget v8, Lcom/mikepenz/materialdrawer/R$drawable;->material_drawer_shadow_right:I

    iget-object v9, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-virtual {v7, v8, v9}, Landroid/support/v4/widget/DrawerLayout;->setDrawerShadow(II)V

    .line 1523
    :cond_3c
    :goto_3c
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    if-nez v7, :cond_ae

    .line 1524
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v7}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v7

    sget v8, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_recycler_view:I

    iget-object v9, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v7, v8, v9, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/support/v7/widget/RecyclerView;

    iput-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 1526
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    if-nez v7, :cond_1c8

    .line 1527
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v8, Landroid/support/v7/widget/DefaultItemAnimator;

    invoke-direct {v8}, Landroid/support/v7/widget/DefaultItemAnimator;-><init>()V

    invoke-virtual {v7, v8}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    .line 1532
    :goto_60
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v7, v11}, Landroid/support/v7/widget/RecyclerView;->setFadingEdgeLength(I)V

    .line 1536
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v7, v11}, Landroid/support/v7/widget/RecyclerView;->setClipToPadding(Z)V

    .line 1538
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v8, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v7, v8}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 1540
    const/4 v3, 0x0

    .line 1541
    .local v3, "paddingTop":I
    iget-boolean v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBar:Z

    if-nez v7, :cond_7a

    iget-boolean v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFullscreen:Z

    if-eqz v7, :cond_90

    :cond_7a
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDisplayBelowStatusBar:Ljava/lang/Boolean;

    if-eqz v7, :cond_86

    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDisplayBelowStatusBar:Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-nez v7, :cond_90

    :cond_86
    iget-boolean v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSystemUIHidden:Z

    if-nez v7, :cond_90

    .line 1542
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v7}, Lcom/mikepenz/materialize/util/UIUtils;->getStatusBarHeight(Landroid/content/Context;)I

    move-result v3

    .line 1544
    :cond_90
    const/4 v2, 0x0

    .line 1545
    .local v2, "paddingBottom":I
    iget-boolean v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBar:Z

    if-nez v7, :cond_99

    iget-boolean v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFullscreen:Z

    if-eqz v7, :cond_a9

    :cond_99
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x13

    if-lt v7, v8, :cond_a9

    iget-boolean v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSystemUIHidden:Z

    if-nez v7, :cond_a9

    .line 1546
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v7}, Lcom/mikepenz/materialize/util/UIUtils;->getNavigationBarHeight(Landroid/content/Context;)I

    move-result v2

    .line 1549
    :cond_a9
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v7, v11, v3, v11, v2}, Landroid/support/v7/widget/RecyclerView;->setPadding(IIII)V

    .line 1552
    .end local v2    # "paddingBottom":I
    .end local v3    # "paddingTop":I
    :cond_ae
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v10, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1556
    .local v4, "params":Landroid/widget/LinearLayout$LayoutParams;
    iput v14, v4, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 1557
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    iget-object v8, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v7, v8, v4}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1560
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    sget v8, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_shadow_top:I

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 1561
    .local v6, "statusBarShadow":Landroid/view/View;
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/RelativeLayout$LayoutParams;

    .line 1562
    .local v5, "shadowLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    const/4 v8, 0x1

    invoke-static {v7, v8}, Lcom/mikepenz/materialize/util/UIUtils;->getStatusBarHeight(Landroid/content/Context;Z)I

    move-result v7

    iput v7, v5, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 1563
    invoke-virtual {v6, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1565
    iget-boolean v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mInnerShadow:Z

    if-eqz v7, :cond_f8

    .line 1566
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    sget v8, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_inner_shadow:I

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 1567
    .local v1, "innerShadow":Landroid/view/View;
    invoke-virtual {v1, v11}, Landroid/view/View;->setVisibility(I)V

    .line 1568
    invoke-virtual {v1}, Landroid/view/View;->bringToFront()V

    .line 1569
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const v8, 0x800003

    if-ne v7, v8, :cond_1d1

    .line 1570
    sget v7, Lcom/mikepenz/materialdrawer/R$drawable;->material_drawer_shadow_left:I

    invoke-virtual {v1, v7}, Landroid/view/View;->setBackgroundResource(I)V

    .line 1577
    .end local v1    # "innerShadow":Landroid/view/View;
    :cond_f8
    :goto_f8
    iget v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColor:I

    if-eqz v7, :cond_1d8

    .line 1578
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    iget v8, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColor:I

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 1588
    :cond_103
    :goto_103
    iget-boolean v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBar:Z

    if-nez v7, :cond_113

    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarShadow:Ljava/lang/Boolean;

    if-eqz v7, :cond_20f

    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarShadow:Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_20f

    .line 1589
    :cond_113
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarShadow:Ljava/lang/Boolean;

    if-nez v7, :cond_20a

    .line 1591
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x15

    if-lt v7, v8, :cond_205

    .line 1593
    invoke-virtual {v6}, Landroid/view/View;->bringToFront()V

    .line 1607
    :goto_120
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDisplayBelowStatusBar:Ljava/lang/Boolean;

    if-eqz v7, :cond_12f

    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDisplayBelowStatusBar:Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_12f

    .line 1609
    invoke-virtual {v6, v12}, Landroid/view/View;->setVisibility(I)V

    .line 1613
    :cond_12f
    invoke-static {p0}, Lcom/mikepenz/materialdrawer/DrawerUtils;->handleHeaderView(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    .line 1616
    new-instance v7, Lcom/mikepenz/materialdrawer/DrawerBuilder$4;

    invoke-direct {v7, p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder$4;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    invoke-static {p0, v7}, Lcom/mikepenz/materialdrawer/DrawerUtils;->handleFooterView(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/view/View$OnClickListener;)V

    .line 1627
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapterWrapper:Landroid/support/v7/widget/RecyclerView$Adapter;

    if-nez v7, :cond_214

    .line 1628
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 1634
    :goto_147
    iget v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSelectedItemPosition:I

    if-nez v7, :cond_157

    iget v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSelectedItemIdentifier:I

    if-eqz v7, :cond_157

    .line 1635
    iget v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSelectedItemIdentifier:I

    invoke-static {p0, v7}, Lcom/mikepenz/materialdrawer/DrawerUtils;->getPositionByIdentifier(Lcom/mikepenz/materialdrawer/DrawerBuilder;I)I

    move-result v7

    iput v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSelectedItemPosition:I

    .line 1637
    :cond_157
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderView:Landroid/view/View;

    if-eqz v7, :cond_162

    iget v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSelectedItemPosition:I

    if-nez v7, :cond_162

    .line 1638
    const/4 v7, 0x1

    iput v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSelectedItemPosition:I

    .line 1640
    :cond_162
    iget v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSelectedItemPosition:I

    invoke-static {p0, v7, v11}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setRecyclerViewSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;IZ)Z

    .line 1643
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    new-instance v8, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;

    invoke-direct {v8, p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    invoke-virtual {v7, v8}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->setOnClickListener(Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnClickListener;)V

    .line 1665
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    new-instance v8, Lcom/mikepenz/materialdrawer/DrawerBuilder$6;

    invoke-direct {v8, p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder$6;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    invoke-virtual {v7, v8}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->setOnLongClickListener(Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnLongClickListener;)V

    .line 1675
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    if-eqz v7, :cond_184

    .line 1676
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v7, v11}, Landroid/support/v7/widget/RecyclerView;->scrollToPosition(I)V

    .line 1680
    :cond_184
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSavedInstance:Landroid/os/Bundle;

    if-eqz v7, :cond_1a2

    .line 1681
    iget-boolean v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAppended:Z

    if-nez v7, :cond_21d

    .line 1682
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSavedInstance:Landroid/os/Bundle;

    const-string v8, "bundle_selection"

    invoke-virtual {v7, v8, v10}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v7

    invoke-static {p0, v7, v11}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setRecyclerViewSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;IZ)Z

    .line 1683
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSavedInstance:Landroid/os/Bundle;

    const-string v8, "bundle_sticky_footer_selection"

    invoke-virtual {v7, v8, v10}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v7

    invoke-static {p0, v7, v13}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setStickyFooterSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;ILjava/lang/Boolean;)V

    .line 1691
    :cond_1a2
    :goto_1a2
    iget-boolean v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFireInitialOnClick:Z

    if-eqz v7, :cond_19

    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    if-eqz v7, :cond_19

    .line 1692
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    iget v8, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    iget v9, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    invoke-virtual {p0, v9}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getDrawerItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v9

    invoke-interface {v7, v13, v8, v9}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;->onItemClick(Landroid/view/View;ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z

    goto/16 :goto_19

    .line 1518
    .end local v4    # "params":Landroid/widget/LinearLayout$LayoutParams;
    .end local v5    # "shadowLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v6    # "statusBarShadow":Landroid/view/View;
    :cond_1b9
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    sget v8, Lcom/mikepenz/materialdrawer/R$drawable;->material_drawer_shadow_left:I

    iget-object v9, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-virtual {v7, v8, v9}, Landroid/support/v4/widget/DrawerLayout;->setDrawerShadow(II)V

    goto/16 :goto_3c

    .line 1529
    :cond_1c8
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v8, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    invoke-virtual {v7, v8}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    goto/16 :goto_60

    .line 1572
    .restart local v1    # "innerShadow":Landroid/view/View;
    .restart local v4    # "params":Landroid/widget/LinearLayout$LayoutParams;
    .restart local v5    # "shadowLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v6    # "statusBarShadow":Landroid/view/View;
    :cond_1d1
    sget v7, Lcom/mikepenz/materialdrawer/R$drawable;->material_drawer_shadow_right:I

    invoke-virtual {v1, v7}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_f8

    .line 1579
    .end local v1    # "innerShadow":Landroid/view/View;
    :cond_1d8
    iget v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColorRes:I

    if-eq v7, v10, :cond_1eb

    .line 1580
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    iget-object v8, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    iget v9, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColorRes:I

    invoke-static {v8, v9}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    goto/16 :goto_103

    .line 1581
    :cond_1eb
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_1f8

    .line 1582
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    iget-object v8, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    invoke-static {v7, v8}, Lcom/mikepenz/materialize/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_103

    .line 1583
    :cond_1f8
    iget v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundDrawableRes:I

    if-eq v7, v10, :cond_103

    .line 1584
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    iget v8, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColorRes:I

    invoke-static {v7, v8}, Lcom/mikepenz/materialize/util/UIUtils;->setBackground(Landroid/view/View;I)V

    goto/16 :goto_103

    .line 1596
    :cond_205
    invoke-virtual {v6, v12}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_120

    .line 1600
    :cond_20a
    invoke-virtual {v6}, Landroid/view/View;->bringToFront()V

    goto/16 :goto_120

    .line 1604
    :cond_20f
    invoke-virtual {v6, v12}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_120

    .line 1630
    :cond_214
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v8, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapterWrapper:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v7, v8}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    goto/16 :goto_147

    .line 1685
    :cond_21d
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSavedInstance:Landroid/os/Bundle;

    const-string v8, "bundle_selection_appended"

    invoke-virtual {v7, v8, v10}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v7

    invoke-static {p0, v7, v11}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setRecyclerViewSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;IZ)Z

    .line 1686
    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSavedInstance:Landroid/os/Bundle;

    const-string v8, "bundle_sticky_footer_selection_appended"

    invoke-virtual {v7, v8, v10}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v7

    invoke-static {p0, v7, v13}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setStickyFooterSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;ILjava/lang/Boolean;)V

    goto/16 :goto_1a2
.end method

.method private handleShowOnFirstLaunch()V
    .registers 5

    .prologue
    .line 1171
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-eqz v2, :cond_2f

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-eqz v2, :cond_2f

    iget-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mShowDrawerOnFirstLaunch:Z

    if-eqz v2, :cond_2f

    .line 1172
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1174
    .local v1, "preferences":Landroid/content/SharedPreferences;
    const-string v2, "navigation_drawer_learned"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_2f

    .line 1176
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v3}, Landroid/support/v4/widget/DrawerLayout;->openDrawer(Landroid/view/View;)V

    .line 1179
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1180
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "navigation_drawer_learned"

    const/4 v3, 0x1

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1181
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1184
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v1    # "preferences":Landroid/content/SharedPreferences;
    :cond_2f
    return-void
.end method


# virtual methods
.method public varargs addDrawerItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 4
    .param p1, "drawerItems"    # [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 955
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v1

    invoke-static {p1}, Lcom/mikepenz/materialdrawer/util/IdDistributor;->checkIds([Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;)[Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;

    move-result-object v0

    check-cast v0, [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    invoke-virtual {v1, v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->addDrawerItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 956
    return-object p0
.end method

.method public varargs addStickyDrawerItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 4
    .param p1, "stickyDrawerItems"    # [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 980
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 981
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    .line 984
    :cond_b
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/mikepenz/materialdrawer/util/IdDistributor;->checkIds([Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;)[Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 986
    return-object p0
.end method

.method public append(Lcom/mikepenz/materialdrawer/Drawer;)Lcom/mikepenz/materialdrawer/Drawer;
    .registers 10
    .param p1, "result"    # Lcom/mikepenz/materialdrawer/Drawer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 1453
    iget-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mUsed:Z

    if-eqz v2, :cond_e

    .line 1454
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "you must not reuse a DrawerBuilder builder"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1456
    :cond_e
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    if-nez v2, :cond_1a

    .line 1457
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "please set the gravity for the drawer"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1461
    :cond_1a
    iput-boolean v6, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mUsed:Z

    .line 1462
    iput-boolean v6, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAppended:Z

    .line 1465
    invoke-virtual {p1}, Lcom/mikepenz/materialdrawer/Drawer;->getDrawerLayout()Landroid/support/v4/widget/DrawerLayout;

    move-result-object v2

    iput-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    .line 1468
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    sget v3, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_slider:I

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v2, v3, v4, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout;

    iput-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    .line 1469
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    sget v4, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_background:I

    sget v5, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_background:I

    invoke-static {v3, v4, v5}, Lcom/mikepenz/materialize/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 1471
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    .line 1473
    .local v1, "params":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, v1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->gravity:I

    .line 1475
    invoke-static {p0, v1}, Lcom/mikepenz/materialdrawer/DrawerUtils;->processDrawerLayoutParams(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/support/v4/widget/DrawerLayout$LayoutParams;)Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    move-result-object v1

    .line 1477
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1479
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v3, v6}, Landroid/support/v4/widget/DrawerLayout;->addView(Landroid/view/View;I)V

    .line 1482
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->createContent()V

    .line 1485
    new-instance v0, Lcom/mikepenz/materialdrawer/Drawer;

    invoke-direct {v0, p0}, Lcom/mikepenz/materialdrawer/Drawer;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    .line 1488
    .local v0, "appendedResult":Lcom/mikepenz/materialdrawer/Drawer;
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSavedInstance:Landroid/os/Bundle;

    if-eqz v2, :cond_82

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSavedInstance:Landroid/os/Bundle;

    const-string v3, "bundle_drawer_content_switched_appended"

    invoke-virtual {v2, v3, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_82

    .line 1489
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2, v3}, Lcom/mikepenz/materialdrawer/AccountHeader;->toggleSelectionList(Landroid/content/Context;)V

    .line 1493
    :cond_82
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    .line 1495
    return-object v0
.end method

.method public build()Lcom/mikepenz/materialdrawer/Drawer;
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 1192
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mUsed:Z

    if-eqz v1, :cond_d

    .line 1193
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "you must not reuse a DrawerBuilder builder"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1195
    :cond_d
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-nez v1, :cond_19

    .line 1196
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "please pass an activity"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1200
    :cond_19
    iput-boolean v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mUsed:Z

    .line 1203
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-nez v1, :cond_23

    .line 1204
    const/4 v1, -0x1

    invoke-virtual {p0, v1}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->withDrawerLayout(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;

    .line 1208
    :cond_23
    new-instance v1, Lcom/mikepenz/materialize/MaterializeBuilder;

    invoke-direct {v1}, Lcom/mikepenz/materialize/MaterializeBuilder;-><init>()V

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    .line 1209
    invoke-virtual {v1, v2}, Lcom/mikepenz/materialize/MaterializeBuilder;->withActivity(Landroid/app/Activity;)Lcom/mikepenz/materialize/MaterializeBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    .line 1210
    invoke-virtual {v1, v2}, Lcom/mikepenz/materialize/MaterializeBuilder;->withRootView(Landroid/view/ViewGroup;)Lcom/mikepenz/materialize/MaterializeBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFullscreen:Z

    .line 1211
    invoke-virtual {v1, v2}, Lcom/mikepenz/materialize/MaterializeBuilder;->withFullscreen(Z)Lcom/mikepenz/materialize/MaterializeBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSystemUIHidden:Z

    .line 1212
    invoke-virtual {v1, v2}, Lcom/mikepenz/materialize/MaterializeBuilder;->withSystemUIHidden(Z)Lcom/mikepenz/materialize/MaterializeBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBar:Z

    .line 1213
    invoke-virtual {v1, v2}, Lcom/mikepenz/materialize/MaterializeBuilder;->withTranslucentStatusBar(Z)Lcom/mikepenz/materialize/MaterializeBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarProgrammatically:Z

    .line 1214
    invoke-virtual {v1, v2}, Lcom/mikepenz/materialize/MaterializeBuilder;->withTranslucentStatusBarProgrammatically(Z)Lcom/mikepenz/materialize/MaterializeBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBar:Z

    .line 1215
    invoke-virtual {v1, v2}, Lcom/mikepenz/materialize/MaterializeBuilder;->withTranslucentNavigationBar(Z)Lcom/mikepenz/materialize/MaterializeBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBarProgrammatically:Z

    .line 1216
    invoke-virtual {v1, v2}, Lcom/mikepenz/materialize/MaterializeBuilder;->withTranslucentNavigationBarProgrammatically(Z)Lcom/mikepenz/materialize/MaterializeBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    .line 1217
    invoke-virtual {v1, v2}, Lcom/mikepenz/materialize/MaterializeBuilder;->withContainer(Landroid/view/ViewGroup;)Lcom/mikepenz/materialize/MaterializeBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColor:I

    .line 1218
    invoke-virtual {v1, v2}, Lcom/mikepenz/materialize/MaterializeBuilder;->withStatusBarColor(I)Lcom/mikepenz/materialize/MaterializeBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColorRes:I

    .line 1219
    invoke-virtual {v1, v2}, Lcom/mikepenz/materialize/MaterializeBuilder;->withStatusBarColorRes(I)Lcom/mikepenz/materialize/MaterializeBuilder;

    move-result-object v1

    .line 1220
    invoke-virtual {v1}, Lcom/mikepenz/materialize/MaterializeBuilder;->build()Lcom/mikepenz/materialize/Materialize;

    move-result-object v1

    iput-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mMaterialize:Lcom/mikepenz/materialize/Materialize;

    .line 1223
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->handleDrawerNavigation(Landroid/app/Activity;Z)V

    .line 1226
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->buildView()Lcom/mikepenz/materialdrawer/Drawer;

    move-result-object v0

    .line 1229
    .local v0, "result":Lcom/mikepenz/materialdrawer/Drawer;
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v2, v3}, Landroid/support/v4/widget/DrawerLayout;->addView(Landroid/view/View;I)V

    .line 1231
    return-object v0
.end method

.method public buildForFragment()Lcom/mikepenz/materialdrawer/Drawer;
    .registers 10

    .prologue
    const/4 v4, 0x1

    const/4 v8, -0x1

    const/4 v5, 0x0

    .line 1240
    iget-boolean v6, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mUsed:Z

    if-eqz v6, :cond_f

    .line 1241
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "you must not reuse a DrawerBuilder builder"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1243
    :cond_f
    iget-object v6, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-nez v6, :cond_1b

    .line 1244
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "please pass an activity"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1246
    :cond_1b
    iget-object v6, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    if-nez v6, :cond_27

    .line 1247
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "please pass the view which should host the DrawerLayout"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1251
    :cond_27
    iput-boolean v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mUsed:Z

    .line 1254
    iget-object v6, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-nez v6, :cond_30

    .line 1255
    invoke-virtual {p0, v8}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->withDrawerLayout(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;

    .line 1260
    :cond_30
    iget-object v6, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    invoke-virtual {v6, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1262
    .local v2, "originalContentView":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v6

    sget v7, Lcom/mikepenz/materialdrawer/R$id;->materialize_root:I

    if-ne v6, v7, :cond_6f

    move v0, v4

    .line 1265
    .local v0, "alreadyInflated":Z
    :goto_3f
    if-nez v0, :cond_71

    .line 1267
    iget-object v6, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    invoke-virtual {v6, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 1274
    :goto_46
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v8, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1280
    .local v1, "layoutParamsContentView":Landroid/widget/FrameLayout$LayoutParams;
    iget-object v6, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v6, v7, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1283
    iget-object v6, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    sget v7, Lcom/mikepenz/materialdrawer/R$id;->materialize_root:I

    invoke-virtual {v6, v7}, Landroid/support/v4/widget/DrawerLayout;->setId(I)V

    .line 1286
    iget-object v6, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0, v6, v5}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->handleDrawerNavigation(Landroid/app/Activity;Z)V

    .line 1289
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->buildView()Lcom/mikepenz/materialdrawer/Drawer;

    move-result-object v3

    .line 1292
    .local v3, "result":Lcom/mikepenz/materialdrawer/Drawer;
    iget-object v6, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v6, v2, v5}, Landroid/support/v4/widget/DrawerLayout;->addView(Landroid/view/View;I)V

    .line 1294
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v6, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v5, v6, v4}, Landroid/support/v4/widget/DrawerLayout;->addView(Landroid/view/View;I)V

    .line 1296
    return-object v3

    .end local v0    # "alreadyInflated":Z
    .end local v1    # "layoutParamsContentView":Landroid/widget/FrameLayout$LayoutParams;
    .end local v3    # "result":Lcom/mikepenz/materialdrawer/Drawer;
    :cond_6f
    move v0, v5

    .line 1262
    goto :goto_3f

    .line 1270
    .restart local v0    # "alreadyInflated":Z
    :cond_71
    iget-object v6, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/ViewGroup;->removeAllViews()V

    goto :goto_46
.end method

.method public buildView()Lcom/mikepenz/materialdrawer/Drawer;
    .registers 8

    .prologue
    const/4 v6, 0x0

    .line 1409
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    sget v3, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_slider:I

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v2, v3, v4, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout;

    iput-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    .line 1410
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    sget v4, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_background:I

    sget v5, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_background:I

    invoke-static {v3, v4, v5}, Lcom/mikepenz/materialize/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 1412
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    .line 1413
    .local v0, "params":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    if-eqz v0, :cond_3d

    .line 1415
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->gravity:I

    .line 1417
    invoke-static {p0, v0}, Lcom/mikepenz/materialdrawer/DrawerUtils;->processDrawerLayoutParams(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/support/v4/widget/DrawerLayout$LayoutParams;)Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    move-result-object v0

    .line 1419
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1423
    :cond_3d
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->createContent()V

    .line 1426
    new-instance v1, Lcom/mikepenz/materialdrawer/Drawer;

    invoke-direct {v1, p0}, Lcom/mikepenz/materialdrawer/Drawer;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    .line 1428
    .local v1, "result":Lcom/mikepenz/materialdrawer/Drawer;
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

    if-eqz v2, :cond_4e

    .line 1429
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

    invoke-virtual {v2, v1}, Lcom/mikepenz/materialdrawer/AccountHeader;->setDrawer(Lcom/mikepenz/materialdrawer/Drawer;)V

    .line 1433
    :cond_4e
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSavedInstance:Landroid/os/Bundle;

    if-eqz v2, :cond_63

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSavedInstance:Landroid/os/Bundle;

    const-string v3, "bundle_drawer_content_switched"

    invoke-virtual {v2, v3, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_63

    .line 1434
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2, v3}, Lcom/mikepenz/materialdrawer/AccountHeader;->toggleSelectionList(Landroid/content/Context;)V

    .line 1438
    :cond_63
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->handleShowOnFirstLaunch()V

    .line 1441
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    .line 1443
    return-object v1
.end method

.method protected checkDrawerItem(IZ)Z
    .registers 4
    .param p1, "position"    # I
    .param p2, "includeOffset"    # Z

    .prologue
    .line 1736
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method protected closeDrawerDelayed()V
    .registers 5

    .prologue
    .line 1700
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCloseOnClick:Z

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-eqz v0, :cond_1d

    .line 1701
    iget v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDelayOnDrawerClose:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_1e

    .line 1702
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lcom/mikepenz/materialdrawer/DrawerBuilder$7;

    invoke-direct {v1, p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder$7;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    iget v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDelayOnDrawerClose:I

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1716
    :cond_1d
    :goto_1d
    return-void

    .line 1713
    :cond_1e
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0}, Landroid/support/v4/widget/DrawerLayout;->closeDrawers()V

    goto :goto_1d
.end method

.method protected getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;
    .registers 3

    .prologue
    .line 898
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    if-nez v0, :cond_12

    .line 899
    new-instance v0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    .line 900
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHasStableIds:Z

    invoke-virtual {v0, v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->setHasStableIds(Z)V

    .line 902
    :cond_12
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    return-object v0
.end method

.method protected getDrawerItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 1725
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method protected handleDrawerNavigation(Landroid/app/Activity;Z)V
    .registers 11
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "recreateActionBarDrawerToggle"    # Z

    .prologue
    .line 1304
    new-instance v7, Lcom/mikepenz/materialdrawer/DrawerBuilder$1;

    invoke-direct {v7, p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder$1;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    .line 1322
    .local v7, "toolbarNavigationListener":Landroid/view/View$OnClickListener;
    if-eqz p2, :cond_a

    .line 1323
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

    .line 1327
    :cond_a
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggleEnabled:Z

    if-eqz v0, :cond_2c

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

    if-nez v0, :cond_2c

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mToolbar:Landroid/support/v7/widget/Toolbar;

    if-eqz v0, :cond_2c

    .line 1328
    new-instance v0, Lcom/mikepenz/materialdrawer/DrawerBuilder$2;

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mToolbar:Landroid/support/v7/widget/Toolbar;

    sget v5, Lcom/mikepenz/materialdrawer/R$string;->material_drawer_open:I

    sget v6, Lcom/mikepenz/materialdrawer/R$string;->material_drawer_close:I

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v6}, Lcom/mikepenz/materialdrawer/DrawerBuilder$2;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/app/Activity;Landroid/support/v4/widget/DrawerLayout;Landroid/support/v7/widget/Toolbar;II)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

    .line 1358
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

    invoke-virtual {v0}, Landroid/support/v7/app/ActionBarDrawerToggle;->syncState()V

    .line 1363
    :cond_2c
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mToolbar:Landroid/support/v7/widget/Toolbar;

    if-eqz v0, :cond_35

    .line 1364
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, v7}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1368
    :cond_35
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

    if-eqz v0, :cond_46

    .line 1369
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

    invoke-virtual {v0, v7}, Landroid/support/v7/app/ActionBarDrawerToggle;->setToolbarNavigationClickListener(Landroid/view/View$OnClickListener;)V

    .line 1370
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->setDrawerListener(Landroid/support/v4/widget/DrawerLayout$DrawerListener;)V

    .line 1400
    :goto_45
    return-void

    .line 1372
    :cond_46
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    new-instance v1, Lcom/mikepenz/materialdrawer/DrawerBuilder$3;

    invoke-direct {v1, p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder$3;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->setDrawerListener(Landroid/support/v4/widget/DrawerLayout$DrawerListener;)V

    goto :goto_45
.end method

.method public inflateMenu(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 5
    .param p1, "menuRes"    # I
        .annotation build Landroid/support/annotation/MenuRes;
        .end annotation
    .end param

    .prologue
    .line 996
    new-instance v1, Landroid/support/v7/internal/view/SupportMenuInflater;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/support/v7/internal/view/SupportMenuInflater;-><init>(Landroid/content/Context;)V

    .line 997
    .local v1, "menuInflater":Landroid/view/MenuInflater;
    new-instance v0, Landroid/support/v7/internal/view/menu/MenuBuilder;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;-><init>(Landroid/content/Context;)V

    .line 999
    .local v0, "mMenu":Landroid/support/v7/internal/view/menu/MenuBuilder;
    invoke-virtual {v1, p1, v0}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 1001
    const/4 v2, 0x0

    invoke-direct {p0, v0, v2}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->addMenuItems(Landroid/view/Menu;Z)V

    .line 1003
    return-object p0
.end method

.method protected resetStickyFooterSelection()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 1743
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    instance-of v1, v1, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_2b

    .line 1744
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_2b

    .line 1745
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_1f

    .line 1746
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/View;->setActivated(Z)V

    .line 1748
    :cond_1f
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/View;->setSelected(Z)V

    .line 1744
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 1751
    .end local v0    # "i":I
    :cond_2b
    return-void
.end method

.method public withAccountHeader(Lcom/mikepenz/materialdrawer/AccountHeader;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "accountHeader"    # Lcom/mikepenz/materialdrawer/AccountHeader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 515
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->withAccountHeader(Lcom/mikepenz/materialdrawer/AccountHeader;Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;

    move-result-object v0

    return-object v0
.end method

.method public withAccountHeader(Lcom/mikepenz/materialdrawer/AccountHeader;Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "accountHeader"    # Lcom/mikepenz/materialdrawer/AccountHeader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "accountHeaderSticky"    # Z

    .prologue
    .line 527
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

    .line 528
    iput-boolean p2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeaderSticky:Z

    .line 529
    return-object p0
.end method

.method public withActionBarDrawerToggle(Landroid/support/v7/app/ActionBarDrawerToggle;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "actionBarDrawerToggle"    # Landroid/support/v7/app/ActionBarDrawerToggle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 573
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggleEnabled:Z

    .line 574
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

    .line 575
    return-object p0
.end method

.method public withActionBarDrawerToggle(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "actionBarDrawerToggleEnabled"    # Z

    .prologue
    .line 559
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggleEnabled:Z

    .line 560
    return-object p0
.end method

.method public withActionBarDrawerToggleAnimated(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "actionBarDrawerToggleAnimated"    # Z

    .prologue
    .line 544
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAnimateActionBarDrawerToggle:Z

    .line 545
    return-object p0
.end method

.method public withActivity(Landroid/app/Activity;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 4
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 102
    const v0, 0x1020002

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    .line 103
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    .line 104
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    .line 105
    return-object p0
.end method

.method public withAdapter(Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 4
    .param p1, "adapter"    # Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 885
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    if-eqz v0, :cond_c

    .line 886
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "the adapter was already set or items were added to it. A header is also a RecyclerItem"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 888
    :cond_c
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    .line 889
    return-object p0
.end method

.method public withAdapterWrapper(Landroid/support/v7/widget/RecyclerView$Adapter;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 4
    .param p1, "adapterWrapper"    # Landroid/support/v7/widget/RecyclerView$Adapter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 915
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    if-nez v0, :cond_c

    .line 916
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "this adapter has to be set in conjunction to a normal adapter which is used inside this wrapper adapter"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 918
    :cond_c
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapterWrapper:Landroid/support/v7/widget/RecyclerView$Adapter;

    .line 919
    return-object p0
.end method

.method public withCloseOnClick(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "closeOnClick"    # Z

    .prologue
    .line 1059
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCloseOnClick:Z

    .line 1060
    return-object p0
.end method

.method public withCustomView(Landroid/view/View;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "customView"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 322
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCustomView:Landroid/view/View;

    .line 323
    return-object p0
.end method

.method public withDelayOnDrawerClose(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "delayOnDrawerClose"    # I

    .prologue
    .line 1076
    iput p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDelayOnDrawerClose:I

    .line 1077
    return-object p0
.end method

.method public withDisplayBelowStatusBar(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "displayBelowStatusBar"    # Z

    .prologue
    .line 165
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDisplayBelowStatusBar:Ljava/lang/Boolean;

    .line 166
    return-object p0
.end method

.method public withDrawerGravity(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "gravity"    # I

    .prologue
    .line 499
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    .line 500
    return-object p0
.end method

.method public withDrawerItems(Ljava/util/ArrayList;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 4
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
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
    .line 944
    .local p1, "drawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v0

    invoke-static {p1}, Lcom/mikepenz/materialdrawer/util/IdDistributor;->checkIds(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->setDrawerItems(Ljava/util/ArrayList;)V

    .line 945
    return-object p0
.end method

.method public withDrawerLayout(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 6
    .param p1, "resLayout"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x0

    .line 350
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_d

    .line 351
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "please pass an activity first to use this call"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 354
    :cond_d
    const/4 v0, -0x1

    if-eq p1, v0, :cond_21

    .line 355
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    invoke-virtual {v0, p1, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    .line 360
    :goto_20
    return-object p0

    .line 357
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
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 338
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    .line 339
    return-object p0
.end method

.method public withDrawerWidthDp(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 4
    .param p1, "drawerWidthDp"    # I

    .prologue
    .line 466
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_c

    .line 467
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "please pass an activity first to use this call"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 470
    :cond_c
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerWidth:I

    .line 471
    return-object p0
.end method

.method public withDrawerWidthPx(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "drawerWidthPx"    # I

    .prologue
    .line 455
    iput p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerWidth:I

    .line 456
    return-object p0
.end method

.method public withDrawerWidthRes(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 4
    .param p1, "drawerWidthRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 481
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_c

    .line 482
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "please pass an activity first to use this call"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 485
    :cond_c
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerWidth:I

    .line 486
    return-object p0
.end method

.method public withFireOnInitialOnClick(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "fireOnInitialOnClick"    # Z

    .prologue
    .line 811
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFireInitialOnClick:Z

    .line 812
    return-object p0
.end method

.method public withFooter(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 5
    .param p1, "footerViewRes"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param

    .prologue
    .line 706
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_c

    .line 707
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "please pass an activity first to use this call"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 710
    :cond_c
    const/4 v0, -0x1

    if-eq p1, v0, :cond_1d

    .line 712
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterView:Landroid/view/View;

    .line 715
    :cond_1d
    return-object p0
.end method

.method public withFooter(Landroid/view/View;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "footerView"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 695
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterView:Landroid/view/View;

    .line 696
    return-object p0
.end method

.method public withFooterClickable(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "footerClickable"    # Z

    .prologue
    .line 725
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterClickable:Z

    .line 726
    return-object p0
.end method

.method public withFooterDivider(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "footerDivider"    # Z

    .prologue
    .line 736
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterDivider:Z

    .line 737
    return-object p0
.end method

.method public withFullscreen(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "fullscreen"    # Z

    .prologue
    const/4 v0, 0x0

    .line 280
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFullscreen:Z

    .line 282
    if-eqz p1, :cond_b

    .line 283
    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->withTranslucentStatusBar(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;

    .line 284
    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->withTranslucentNavigationBar(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;

    .line 287
    :cond_b
    return-object p0
.end method

.method public withHasStableIds(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "hasStableIds"    # Z

    .prologue
    .line 870
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHasStableIds:Z

    .line 871
    return-object p0
.end method

.method public withHeader(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 5
    .param p1, "headerViewRes"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param

    .prologue
    .line 616
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_c

    .line 617
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "please pass an activity first to use this call"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 620
    :cond_c
    const/4 v0, -0x1

    if-eq p1, v0, :cond_1d

    .line 622
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderView:Landroid/view/View;

    .line 625
    :cond_1d
    return-object p0
.end method

.method public withHeader(Landroid/view/View;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "headerView"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 605
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderView:Landroid/view/View;

    .line 606
    return-object p0
.end method

.method public withHeaderClickable(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "headerClickable"    # Z

    .prologue
    .line 635
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderClickable:Z

    .line 636
    return-object p0
.end method

.method public withHeaderDivider(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "headerDivider"    # Z

    .prologue
    .line 646
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderDivider:Z

    .line 647
    return-object p0
.end method

.method public withInnerShadow(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "innerShadow"    # Z

    .prologue
    .line 211
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mInnerShadow:Z

    .line 212
    return-object p0
.end method

.method public withItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "itemAnimator"    # Landroid/support/v7/widget/RecyclerView$ItemAnimator;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 933
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    .line 934
    return-object p0
.end method

.method public withOnDrawerItemClickListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "onDrawerItemClickListener"    # Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1105
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    .line 1106
    return-object p0
.end method

.method public withOnDrawerItemLongClickListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "onDrawerItemLongClickListener"    # Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1119
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemLongClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;

    .line 1120
    return-object p0
.end method

.method public withOnDrawerListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "onDrawerListener"    # Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1091
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;

    .line 1092
    return-object p0
.end method

.method public withOnDrawerNavigationListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerNavigationListener;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "onDrawerNavigationListener"    # Lcom/mikepenz/materialdrawer/Drawer$OnDrawerNavigationListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1133
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerNavigationListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerNavigationListener;

    .line 1134
    return-object p0
.end method

.method public withRecyclerView(Landroid/support/v7/widget/RecyclerView;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 854
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 855
    return-object p0
.end method

.method public withRootView(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 4
    .param p1, "rootViewRes"    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param

    .prologue
    .line 130
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_c

    .line 131
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "please pass an activity first to use this call"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 134
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
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 115
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    .line 118
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->withTranslucentStatusBar(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;

    .line 120
    return-object p0
.end method

.method public withSavedInstance(Landroid/os/Bundle;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "savedInstance"    # Landroid/os/Bundle;

    .prologue
    .line 1162
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSavedInstance:Landroid/os/Bundle;

    .line 1163
    return-object p0
.end method

.method public withScrollToTopAfterClick(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "scrollToTopAfterClick"    # Z

    .prologue
    .line 588
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mScrollToTopAfterClick:Z

    .line 589
    return-object p0
.end method

.method public withSelectedItem(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "selectedItemIdentifier"    # I

    .prologue
    .line 839
    iput p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSelectedItemIdentifier:I

    .line 840
    return-object p0
.end method

.method public withSelectedItemByPosition(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "selectedItemPosition"    # I

    .prologue
    .line 825
    iput p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSelectedItemPosition:I

    .line 826
    return-object p0
.end method

.method public withShowDrawerOnFirstLaunch(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "showDrawerOnFirstLaunch"    # Z

    .prologue
    .line 1147
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mShowDrawerOnFirstLaunch:Z

    .line 1148
    return-object p0
.end method

.method public withSliderBackgroundColor(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "sliderBackgroundColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 403
    iput p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColor:I

    .line 404
    return-object p0
.end method

.method public withSliderBackgroundColorRes(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "sliderBackgroundColorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 415
    iput p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundColorRes:I

    .line 416
    return-object p0
.end method

.method public withSliderBackgroundDrawable(Landroid/graphics/drawable/Drawable;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "sliderBackgroundDrawable"    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 428
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 429
    return-object p0
.end method

.method public withSliderBackgroundDrawableRes(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "sliderBackgroundDrawableRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 441
    iput p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderBackgroundDrawableRes:I

    .line 442
    return-object p0
.end method

.method public withStatusBarColor(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "statusBarColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 374
    iput p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColor:I

    .line 375
    return-object p0
.end method

.method public withStatusBarColorRes(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "statusBarColorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 385
    iput p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStatusBarColorRes:I

    .line 386
    return-object p0
.end method

.method public withStickyDrawerItems(Ljava/util/ArrayList;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
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
    .line 969
    .local p1, "stickyDrawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/util/IdDistributor;->checkIds(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    .line 970
    return-object p0
.end method

.method public withStickyFooter(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 5
    .param p1, "stickyFooterRes"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param

    .prologue
    .line 767
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_c

    .line 768
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "please pass an activity first to use this call"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 771
    :cond_c
    const/4 v0, -0x1

    if-eq p1, v0, :cond_1f

    .line 773
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    .line 776
    :cond_1f
    return-object p0
.end method

.method public withStickyFooter(Landroid/view/ViewGroup;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "stickyFooter"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 756
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    .line 757
    return-object p0
.end method

.method public withStickyFooterDivider(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "stickyFooterDivider"    # Z

    .prologue
    .line 786
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterDivider:Z

    .line 787
    return-object p0
.end method

.method public withStickyFooterShadow(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "stickyFooterShadow"    # Z

    .prologue
    .line 797
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterShadow:Z

    .line 798
    return-object p0
.end method

.method public withStickyHeader(I)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 5
    .param p1, "stickyHeaderRes"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param

    .prologue
    .line 671
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_c

    .line 672
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "please pass an activity first to use this call"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 675
    :cond_c
    const/4 v0, -0x1

    if-eq p1, v0, :cond_1d

    .line 677
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyHeaderView:Landroid/view/View;

    .line 680
    :cond_1d
    return-object p0
.end method

.method public withStickyHeader(Landroid/view/View;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "stickyHeader"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 660
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyHeaderView:Landroid/view/View;

    .line 661
    return-object p0
.end method

.method public withSystemUIHidden(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "systemUIHidden"    # Z

    .prologue
    .line 301
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSystemUIHidden:Z

    .line 303
    if-eqz p1, :cond_7

    .line 304
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->withFullscreen(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;

    .line 307
    :cond_7
    return-object p0
.end method

.method public withToolbar(Landroid/support/v7/widget/Toolbar;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "toolbar"    # Landroid/support/v7/widget/Toolbar;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 226
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mToolbar:Landroid/support/v7/widget/Toolbar;

    .line 227
    return-object p0
.end method

.method public withTranslucentNavigationBar(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "translucentNavigationBar"    # Z

    .prologue
    .line 240
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBar:Z

    .line 243
    if-nez p1, :cond_7

    .line 244
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBarProgrammatically:Z

    .line 247
    :cond_7
    return-object p0
.end method

.method public withTranslucentNavigationBarProgrammatically(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "translucentNavigationBarProgrammatically"    # Z

    .prologue
    .line 260
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBarProgrammatically:Z

    .line 262
    if-eqz p1, :cond_7

    .line 263
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBar:Z

    .line 265
    :cond_7
    return-object p0
.end method

.method public withTranslucentStatusBar(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "translucentStatusBar"    # Z

    .prologue
    .line 147
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBar:Z

    .line 150
    if-nez p1, :cond_7

    .line 151
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarProgrammatically:Z

    .line 153
    :cond_7
    return-object p0
.end method

.method public withTranslucentStatusBarProgrammatically(Z)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 3
    .param p1, "translucentStatusBarProgrammatically"    # Z

    .prologue
    .line 180
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarProgrammatically:Z

    .line 182
    if-eqz p1, :cond_7

    .line 183
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBar:Z

    .line 185
    :cond_7
    return-object p0
.end method

.method public withTranslucentStatusBarShadow(Ljava/lang/Boolean;)Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .registers 2
    .param p1, "translucentStatusBarShadow"    # Ljava/lang/Boolean;

    .prologue
    .line 197
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBarShadow:Ljava/lang/Boolean;

    .line 198
    return-object p0
.end method
