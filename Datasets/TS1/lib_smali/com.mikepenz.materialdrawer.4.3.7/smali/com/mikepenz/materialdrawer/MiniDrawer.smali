.class public Lcom/mikepenz/materialdrawer/MiniDrawer;
.super Ljava/lang/Object;
.source "MiniDrawer.java"


# static fields
.field public static final ITEM:I = 0x2

.field public static final PROFILE:I = 0x1


# instance fields
.field private mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

.field private mContainer:Landroid/widget/LinearLayout;

.field private mCrossFader:Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;

.field private mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

.field private mDrawerAdapter:Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;

.field private mEnableSelectedMiniDrawerItemBackground:Z

.field private mInRTL:Z

.field private mIncludeSecondaryDrawerItems:Z

.field private mInnerShadow:Z

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mInnerShadow:Z

    .line 66
    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mInRTL:Z

    .line 73
    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mIncludeSecondaryDrawerItems:Z

    .line 80
    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mEnableSelectedMiniDrawerItemBackground:Z

    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/materialdrawer/MiniDrawer;)Lcom/mikepenz/materialdrawer/Drawer;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/MiniDrawer;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mikepenz/materialdrawer/MiniDrawer;)Lcom/mikepenz/materialdrawer/AccountHeader;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/MiniDrawer;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mikepenz/materialdrawer/MiniDrawer;)Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/MiniDrawer;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mCrossFader:Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;

    return-object v0
.end method


# virtual methods
.method public build(Landroid/content/Context;)Landroid/view/View;
    .registers 7
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 144
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mContainer:Landroid/widget/LinearLayout;

    .line 145
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mInnerShadow:Z

    if-eqz v0, :cond_18

    .line 146
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mInRTL:Z

    if-nez v0, :cond_c2

    .line 147
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mContainer:Landroid/widget/LinearLayout;

    sget v1, Lcom/mikepenz/materialdrawer/R$drawable;->material_drawer_shadow_left:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 154
    :cond_18
    :goto_18
    new-instance v0, Landroid/support/v7/widget/RecyclerView;

    invoke-direct {v0, p1}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 155
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mContainer:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v1, v2, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    .line 158
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Landroid/support/v7/widget/DefaultItemAnimator;

    invoke-direct {v1}, Landroid/support/v7/widget/DefaultItemAnimator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    .line 160
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/RecyclerView;->setFadingEdgeLength(I)V

    .line 163
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/RecyclerView;->setClipToPadding(Z)V

    .line 165
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-direct {v1, p1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 167
    new-instance v0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawerAdapter:Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;

    .line 168
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawerAdapter:Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 171
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    if-eqz v0, :cond_87

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    if-eqz v0, :cond_87

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-boolean v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFullscreen:Z

    if-nez v0, :cond_6c

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-boolean v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBar:Z

    if-eqz v0, :cond_87

    .line 172
    :cond_6c
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result v1

    invoke-static {p1}, Lcom/mikepenz/materialize/util/UIUtils;->getStatusBarHeight(Landroid/content/Context;)I

    move-result v2

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getPaddingRight()I

    move-result v3

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView;->getPaddingBottom()I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/support/v7/widget/RecyclerView;->setPadding(IIII)V

    .line 176
    :cond_87
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    if-eqz v0, :cond_bc

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    if-eqz v0, :cond_bc

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-boolean v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFullscreen:Z

    if-nez v0, :cond_a1

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-boolean v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBar:Z

    if-eqz v0, :cond_bc

    .line 177
    :cond_a1
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result v1

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView;->getPaddingTop()I

    move-result v2

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getPaddingRight()I

    move-result v3

    invoke-static {p1}, Lcom/mikepenz/materialize/util/UIUtils;->getNavigationBarHeight(Landroid/content/Context;)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/support/v7/widget/RecyclerView;->setPadding(IIII)V

    .line 181
    :cond_bc
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/MiniDrawer;->createItems()V

    .line 183
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mContainer:Landroid/widget/LinearLayout;

    return-object v0

    .line 149
    :cond_c2
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mContainer:Landroid/widget/LinearLayout;

    sget v1, Lcom/mikepenz/materialdrawer/R$drawable;->material_drawer_shadow_right:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    goto/16 :goto_18
.end method

.method public createItems()V
    .registers 7

    .prologue
    .line 270
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawerAdapter:Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;

    invoke-virtual {v4}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->clearDrawerItems()V

    .line 272
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

    if-eqz v4, :cond_1f

    .line 273
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

    invoke-virtual {v4}, Lcom/mikepenz/materialdrawer/AccountHeader;->getActiveProfile()Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    move-result-object v3

    .line 274
    .local v3, "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    instance-of v4, v3, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    if-eqz v4, :cond_1f

    .line 275
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawerAdapter:Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;

    new-instance v5, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;

    check-cast v3, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    .end local v3    # "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    invoke-direct {v5, v3}, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;-><init>(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;)V

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->addDrawerItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 279
    :cond_1f
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    if-eqz v4, :cond_5b

    .line 280
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    invoke-virtual {v4}, Lcom/mikepenz/materialdrawer/Drawer;->getDrawerItems()Ljava/util/ArrayList;

    move-result-object v4

    if-eqz v4, :cond_5b

    .line 281
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    invoke-virtual {v4}, Lcom/mikepenz/materialdrawer/Drawer;->getDrawerItems()Ljava/util/ArrayList;

    move-result-object v1

    .line 282
    .local v1, "drawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    invoke-virtual {v4}, Lcom/mikepenz/materialdrawer/Drawer;->switchedDrawerContent()Z

    move-result v4

    if-eqz v4, :cond_3f

    .line 283
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    invoke-virtual {v4}, Lcom/mikepenz/materialdrawer/Drawer;->getOriginalDrawerItems()Ljava/util/ArrayList;

    move-result-object v1

    .line 287
    :cond_3f
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_43
    :goto_43
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 288
    .local v0, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/MiniDrawer;->generateMiniDrawerItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v2

    .line 289
    .local v2, "miniDrawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    if-eqz v2, :cond_43

    .line 290
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawerAdapter:Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;

    invoke-virtual {v5, v2}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->addDrawerItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    goto :goto_43

    .line 297
    .end local v0    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .end local v1    # "drawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    .end local v2    # "miniDrawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    :cond_5b
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawerAdapter:Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;

    new-instance v5, Lcom/mikepenz/materialdrawer/MiniDrawer$1;

    invoke-direct {v5, p0}, Lcom/mikepenz/materialdrawer/MiniDrawer$1;-><init>(Lcom/mikepenz/materialdrawer/MiniDrawer;)V

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->setOnClickListener(Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnClickListener;)V

    .line 319
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/support/v7/widget/RecyclerView;->scrollToPosition(I)V

    .line 320
    return-void
.end method

.method public generateMiniDrawerItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .registers 4
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 114
    instance-of v0, p1, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    if-eqz v0, :cond_12

    .line 115
    new-instance v0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;

    check-cast p1, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    .end local p1    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;-><init>(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;)V

    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mEnableSelectedMiniDrawerItemBackground:Z

    invoke-virtual {v0, v1}, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->withEnableSelectedBackground(Z)Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;

    move-result-object v0

    .line 119
    :goto_11
    return-object v0

    .line 116
    .restart local p1    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    :cond_12
    instance-of v0, p1, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    if-eqz v0, :cond_28

    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mIncludeSecondaryDrawerItems:Z

    if-eqz v0, :cond_28

    .line 117
    new-instance v0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;

    check-cast p1, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    .end local p1    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;-><init>(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;)V

    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mEnableSelectedMiniDrawerItemBackground:Z

    invoke-virtual {v0, v1}, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->withEnableSelectedBackground(Z)Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;

    move-result-object v0

    goto :goto_11

    .line 119
    .restart local p1    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    :cond_28
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public getAccountHeader()Lcom/mikepenz/materialdrawer/AccountHeader;
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

    return-object v0
.end method

.method public getCrossFader()Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mCrossFader:Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;

    return-object v0
.end method

.method public getDrawer()Lcom/mikepenz/materialdrawer/Drawer;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    return-object v0
.end method

.method public getDrawerAdapter()Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawerAdapter:Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;

    return-object v0
.end method

.method public getMiniDrawerType(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)I
    .registers 3
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 129
    instance-of v0, p1, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;

    if-eqz v0, :cond_6

    .line 130
    const/4 v0, 0x1

    .line 134
    :goto_5
    return v0

    .line 131
    :cond_6
    instance-of v0, p1, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;

    if-eqz v0, :cond_c

    .line 132
    const/4 v0, 0x2

    goto :goto_5

    .line 134
    :cond_c
    const/4 v0, -0x1

    goto :goto_5
.end method

.method public getRecyclerView()Landroid/support/v7/widget/RecyclerView;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method public onItemClick(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z
    .registers 4
    .param p1, "selectedDrawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 214
    invoke-interface {p1}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->isSelectable()Z

    move-result v1

    if-eqz v1, :cond_20

    .line 216
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mCrossFader:Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;

    if-eqz v1, :cond_17

    .line 217
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mCrossFader:Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;

    invoke-interface {v1}, Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;->isCrossfaded()Z

    move-result v1

    if-eqz v1, :cond_17

    .line 218
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mCrossFader:Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;

    invoke-interface {v1}, Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;->crossfade()V

    .line 223
    :cond_17
    invoke-interface {p1}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getIdentifier()I

    move-result v0

    .line 226
    .local v0, "identifier":I
    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/MiniDrawer;->setSelection(I)V

    .line 228
    const/4 v1, 0x0

    .line 230
    .end local v0    # "identifier":I
    :goto_1f
    return v1

    :cond_20
    const/4 v1, 0x1

    goto :goto_1f
.end method

.method public onProfileClick()V
    .registers 5

    .prologue
    .line 191
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mCrossFader:Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;

    if-eqz v1, :cond_11

    .line 192
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mCrossFader:Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;

    invoke-interface {v1}, Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;->isCrossfaded()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 193
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mCrossFader:Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;

    invoke-interface {v1}, Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;->crossfade()V

    .line 198
    :cond_11
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

    if-eqz v1, :cond_2c

    .line 199
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/AccountHeader;->getActiveProfile()Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    move-result-object v0

    .line 200
    .local v0, "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    instance-of v1, v0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    if-eqz v1, :cond_2c

    .line 201
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawerAdapter:Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;

    const/4 v2, 0x0

    new-instance v3, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;

    check-cast v0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    .end local v0    # "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    invoke-direct {v3, v0}, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;-><init>(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;)V

    invoke-virtual {v1, v2, v3}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->setDrawerItem(ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 204
    :cond_2c
    return-void
.end method

.method public setSelection(I)V
    .registers 5
    .param p1, "identifier"    # I

    .prologue
    .line 240
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawerAdapter:Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->getDrawerItems()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_23

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 241
    .local v0, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getIdentifier()I

    move-result v1

    if-ne v1, p1, :cond_21

    const/4 v1, 0x1

    :goto_1d
    invoke-interface {v0, v1}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->withSetSelected(Z)Ljava/lang/Object;

    goto :goto_a

    :cond_21
    const/4 v1, 0x0

    goto :goto_1d

    .line 243
    .end local v0    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    :cond_23
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawerAdapter:Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->notifyDataSetChanged()V

    .line 244
    return-void
.end method

.method public updateItem(I)V
    .registers 7
    .param p1, "identifier"    # I

    .prologue
    .line 252
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    if-eqz v3, :cond_4a

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawerAdapter:Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;

    if-eqz v3, :cond_4a

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawerAdapter:Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;

    invoke-virtual {v3}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->getDrawerItems()Ljava/util/ArrayList;

    move-result-object v3

    if-eqz v3, :cond_4a

    const/4 v3, -0x1

    if-eq p1, v3, :cond_4a

    .line 253
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    invoke-virtual {v3, p1}, Lcom/mikepenz/materialdrawer/Drawer;->getDrawerItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v0

    .line 255
    .local v0, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1a
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawerAdapter:Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;

    invoke-virtual {v3}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->getDrawerItems()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_4a

    .line 256
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawerAdapter:Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;

    invoke-virtual {v3}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->getDrawerItems()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    invoke-interface {v3}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getIdentifier()I

    move-result v3

    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getIdentifier()I

    move-result v4

    if-ne v3, v4, :cond_47

    .line 257
    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/MiniDrawer;->generateMiniDrawerItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v2

    .line 258
    .local v2, "miniDrawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    if-eqz v2, :cond_47

    .line 259
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawerAdapter:Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;

    invoke-virtual {v3, v1, v2}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->setDrawerItem(ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 255
    .end local v2    # "miniDrawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    :cond_47
    add-int/lit8 v1, v1, 0x1

    goto :goto_1a

    .line 264
    .end local v0    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .end local v1    # "i":I
    :cond_4a
    return-void
.end method

.method public withAccountHeader(Lcom/mikepenz/materialdrawer/AccountHeader;)Lcom/mikepenz/materialdrawer/MiniDrawer;
    .registers 2
    .param p1, "accountHeader"    # Lcom/mikepenz/materialdrawer/AccountHeader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 48
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

    .line 49
    return-object p0
.end method

.method public withCrossFader(Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;)Lcom/mikepenz/materialdrawer/MiniDrawer;
    .registers 2
    .param p1, "crossFader"    # Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 55
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mCrossFader:Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;

    .line 56
    return-object p0
.end method

.method public withDrawer(Lcom/mikepenz/materialdrawer/Drawer;)Lcom/mikepenz/materialdrawer/MiniDrawer;
    .registers 2
    .param p1, "drawer"    # Lcom/mikepenz/materialdrawer/Drawer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 41
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    .line 42
    return-object p0
.end method

.method public withEnableSelectedMiniDrawerItemBackground(Z)Lcom/mikepenz/materialdrawer/MiniDrawer;
    .registers 2
    .param p1, "enableSelectedMiniDrawerItemBackground"    # Z

    .prologue
    .line 83
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mEnableSelectedMiniDrawerItemBackground:Z

    .line 84
    return-object p0
.end method

.method public withInRTL(Z)Lcom/mikepenz/materialdrawer/MiniDrawer;
    .registers 2
    .param p1, "inRTL"    # Z

    .prologue
    .line 69
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mInRTL:Z

    .line 70
    return-object p0
.end method

.method public withIncludeSecondaryDrawerItems(Z)Lcom/mikepenz/materialdrawer/MiniDrawer;
    .registers 2
    .param p1, "includeSecondaryDrawerItems"    # Z

    .prologue
    .line 76
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mIncludeSecondaryDrawerItems:Z

    .line 77
    return-object p0
.end method

.method public withInnerShadow(Z)Lcom/mikepenz/materialdrawer/MiniDrawer;
    .registers 2
    .param p1, "innerShadow"    # Z

    .prologue
    .line 62
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer;->mInnerShadow:Z

    .line 63
    return-object p0
.end method
