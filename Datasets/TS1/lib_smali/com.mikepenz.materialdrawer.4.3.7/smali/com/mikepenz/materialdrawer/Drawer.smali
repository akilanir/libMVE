.class public Lcom/mikepenz/materialdrawer/Drawer;
.super Ljava/lang/Object;
.source "Drawer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemSelectedListener;,
        Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;,
        Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;,
        Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;,
        Lcom/mikepenz/materialdrawer/Drawer$OnDrawerNavigationListener;
    }
.end annotation


# static fields
.field protected static final BUNDLE_DRAWER_CONTENT_SWITCHED:Ljava/lang/String; = "bundle_drawer_content_switched"

.field protected static final BUNDLE_DRAWER_CONTENT_SWITCHED_APPENDED:Ljava/lang/String; = "bundle_drawer_content_switched_appended"

.field protected static final BUNDLE_SELECTION:Ljava/lang/String; = "bundle_selection"

.field protected static final BUNDLE_SELECTION_APPENDED:Ljava/lang/String; = "bundle_selection_appended"

.field protected static final BUNDLE_STICKY_FOOTER_SELECTION:Ljava/lang/String; = "bundle_sticky_footer_selection"

.field protected static final BUNDLE_STICKY_FOOTER_SELECTION_APPENDED:Ljava/lang/String; = "bundle_sticky_footer_selection_appended"

.field protected static final PREF_USER_LEARNED_DRAWER:Ljava/lang/String; = "navigation_drawer_learned"


# instance fields
.field private mContentView:Landroid/widget/FrameLayout;

.field protected final mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

.field private mKeyboardUtil:Lcom/mikepenz/materialdrawer/util/KeyboardUtil;

.field private originalDrawerItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;"
        }
    .end annotation
.end field

.field private originalDrawerSelection:I

.field private originalOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;


# direct methods
.method protected constructor <init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V
    .registers 3
    .param p1, "drawerBuilder"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mKeyboardUtil:Lcom/mikepenz/materialdrawer/util/KeyboardUtil;

    .line 824
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerSelection:I

    .line 62
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    .line 63
    return-void
.end method

.method private getStickyFooterShadow()Landroid/view/View;
    .registers 2

    .prologue
    .line 334
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterShadowView:Landroid/view/View;

    return-object v0
.end method

.method private setItems(Ljava/util/ArrayList;Z)V
    .registers 4
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "switchedItems"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 681
    .local p1, "drawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerItems:Ljava/util/ArrayList;

    if-eqz v0, :cond_10

    if-nez p2, :cond_10

    .line 682
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerItems:Ljava/util/ArrayList;

    .line 687
    :goto_8
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyDataSetChanged()V

    .line 688
    return-void

    .line 684
    :cond_10
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->setDrawerItems(Ljava/util/ArrayList;)V

    goto :goto_8
.end method


# virtual methods
.method public addItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 4
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 602
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v1

    invoke-static {p1}, Lcom/mikepenz/materialdrawer/util/IdDistributor;->checkId(Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;)Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    invoke-virtual {v1, v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->addDrawerItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 603
    return-void
.end method

.method public addItemAtPosition(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;I)V
    .registers 5
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "position"    # I

    .prologue
    .line 612
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v1

    invoke-static {p1}, Lcom/mikepenz/materialdrawer/util/IdDistributor;->checkId(Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;)Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    invoke-virtual {v1, p2, v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->addDrawerItem(ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 613
    return-void
.end method

.method public varargs addItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 4
    .param p1, "drawerItems"    # [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 661
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v1

    invoke-static {p1}, Lcom/mikepenz/materialdrawer/util/IdDistributor;->checkIds([Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;)[Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;

    move-result-object v0

    check-cast v0, [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    invoke-virtual {v1, v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->addDrawerItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 662
    return-void
.end method

.method public addStickyFooterItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 4
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 721
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    if-nez v0, :cond_f

    .line 722
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    .line 724
    :cond_f
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/mikepenz/materialdrawer/util/IdDistributor;->checkId(Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;)Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 726
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/DrawerUtils;->rebuildStickyFooterView(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    .line 727
    return-void
.end method

.method public addStickyFooterItemAtPosition(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;I)V
    .registers 5
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "position"    # I

    .prologue
    .line 736
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    if-nez v0, :cond_f

    .line 737
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    .line 739
    :cond_f
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/mikepenz/materialdrawer/util/IdDistributor;->checkId(Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;)Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 741
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/DrawerUtils;->rebuildStickyFooterView(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    .line 742
    return-void
.end method

.method public closeDrawer()V
    .registers 3

    .prologue
    .line 124
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-eqz v0, :cond_15

    .line 125
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->closeDrawer(I)V

    .line 127
    :cond_15
    return-void
.end method

.method public getActionBarDrawerToggle()Landroid/support/v7/app/ActionBarDrawerToggle;
    .registers 2

    .prologue
    .line 343
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

    return-object v0
.end method

.method public getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;
    .registers 2

    .prologue
    .line 249
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    return-object v0
.end method

.method public getContent()Landroid/widget/FrameLayout;
    .registers 3

    .prologue
    .line 228
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mContentView:Landroid/widget/FrameLayout;

    if-nez v0, :cond_18

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-eqz v0, :cond_18

    .line 229
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    sget v1, Lcom/mikepenz/materialdrawer/R$id;->content_layout:I

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mContentView:Landroid/widget/FrameLayout;

    .line 231
    :cond_18
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mContentView:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method public getCurrentSelectedPosition()I
    .registers 2

    .prologue
    .line 402
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    return v0
.end method

.method public getCurrentSelection()I
    .registers 4

    .prologue
    .line 411
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget v2, v2, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    invoke-virtual {v1, v2}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getDrawerItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v0

    .line 412
    .local v0, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    if-eqz v0, :cond_11

    .line 413
    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getIdentifier()I

    move-result v1

    .line 415
    :goto_10
    return v1

    :cond_11
    const/4 v1, -0x1

    goto :goto_10
.end method

.method public getCurrentStickyFooterSelectedPosition()I
    .registers 2

    .prologue
    .line 424
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentStickyFooterSelection:I

    return v0
.end method

.method public getDrawerItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .registers 4
    .param p1, "identifier"    # I

    .prologue
    .line 373
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->getPosition(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public getDrawerItems()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 258
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getDrawerItems()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getDrawerLayout()Landroid/support/v4/widget/DrawerLayout;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    return-object v0
.end method

.method public getFooter()Landroid/view/View;
    .registers 2

    .prologue
    .line 316
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterView:Landroid/view/View;

    return-object v0
.end method

.method public getHeader()Landroid/view/View;
    .registers 2

    .prologue
    .line 267
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderView:Landroid/view/View;

    return-object v0
.end method

.method public getMaterialize()Lcom/mikepenz/materialize/Materialize;
    .registers 2

    .prologue
    .line 185
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mMaterialize:Lcom/mikepenz/materialize/Materialize;

    return-object v0
.end method

.method public getOnDrawerItemClickListener()Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;
    .registers 2

    .prologue
    .line 799
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    return-object v0
.end method

.method public getOnDrawerItemLongClickListener()Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;
    .registers 2

    .prologue
    .line 817
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemLongClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;

    return-object v0
.end method

.method public getOriginalDrawerItems()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 841
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerItems:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getPosition(I)I
    .registers 3
    .param p1, "identifier"    # I

    .prologue
    .line 363
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-static {v0, p1}, Lcom/mikepenz/materialdrawer/DrawerUtils;->getPositionByIdentifier(Lcom/mikepenz/materialdrawer/DrawerBuilder;I)I

    move-result v0

    return v0
.end method

.method public getPosition(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)I
    .registers 3
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 353
    invoke-interface {p1}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getIdentifier()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/Drawer;->getPosition(I)I

    move-result v0

    return v0
.end method

.method public getRecyclerView()Landroid/support/v7/widget/RecyclerView;
    .registers 2

    .prologue
    .line 240
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method public getScrimInsetsFrameLayout()Lcom/mikepenz/materialize/view/IScrimInsetsLayout;
    .registers 2

    .prologue
    .line 173
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mMaterialize:Lcom/mikepenz/materialize/Materialize;

    if-eqz v0, :cond_f

    .line 174
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mMaterialize:Lcom/mikepenz/materialize/Materialize;

    invoke-virtual {v0}, Lcom/mikepenz/materialize/Materialize;->getScrimInsetsFrameLayout()Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    move-result-object v0

    .line 176
    :goto_e
    return-object v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public getSlider()Landroid/widget/RelativeLayout;
    .registers 2

    .prologue
    .line 219
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method public getStickyFooter()Landroid/view/View;
    .registers 2

    .prologue
    .line 325
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    return-object v0
.end method

.method public getStickyFooterPosition(I)I
    .registers 3
    .param p1, "identifier"    # I

    .prologue
    .line 393
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-static {v0, p1}, Lcom/mikepenz/materialdrawer/DrawerUtils;->getStickyFooterPositionByIdentifier(Lcom/mikepenz/materialdrawer/DrawerBuilder;I)I

    move-result v0

    return v0
.end method

.method public getStickyFooterPosition(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)I
    .registers 3
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 383
    invoke-interface {p1}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getIdentifier()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/Drawer;->getStickyFooterPosition(I)I

    move-result v0

    return v0
.end method

.method public getStickyHeader()Landroid/view/View;
    .registers 2

    .prologue
    .line 276
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyHeaderView:Landroid/view/View;

    return-object v0
.end method

.method public isDrawerOpen()Z
    .registers 3

    .prologue
    .line 136
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_1d

    .line 137
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->isDrawerOpen(I)Z

    move-result v0

    .line 139
    :goto_1c
    return v0

    :cond_1d
    const/4 v0, 0x0

    goto :goto_1c
.end method

.method public keyboardSupportEnabled(Landroid/app/Activity;Z)V
    .registers 6
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "enable"    # Z

    .prologue
    .line 197
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getContent()Landroid/widget/FrameLayout;

    move-result-object v0

    if-eqz v0, :cond_30

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getContent()Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v0

    if-lez v0, :cond_30

    .line 198
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mKeyboardUtil:Lcom/mikepenz/materialdrawer/util/KeyboardUtil;

    if-nez v0, :cond_29

    .line 199
    new-instance v0, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getContent()Landroid/widget/FrameLayout;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mKeyboardUtil:Lcom/mikepenz/materialdrawer/util/KeyboardUtil;

    .line 200
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mKeyboardUtil:Lcom/mikepenz/materialdrawer/util/KeyboardUtil;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;->disable()V

    .line 203
    :cond_29
    if-eqz p2, :cond_31

    .line 204
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mKeyboardUtil:Lcom/mikepenz/materialdrawer/util/KeyboardUtil;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;->enable()V

    .line 209
    :cond_30
    :goto_30
    return-void

    .line 206
    :cond_31
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mKeyboardUtil:Lcom/mikepenz/materialdrawer/util/KeyboardUtil;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;->disable()V

    goto :goto_30
.end method

.method public openDrawer()V
    .registers 3

    .prologue
    .line 115
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_1b

    .line 116
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->openDrawer(I)V

    .line 118
    :cond_1b
    return-void
.end method

.method public removeAllItems()V
    .registers 2

    .prologue
    .line 652
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->clearDrawerItems()V

    .line 653
    return-void
.end method

.method public removeAllStickyFooterItems()V
    .registers 3

    .prologue
    .line 776
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    if-eqz v0, :cond_d

    .line 777
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 779
    :cond_d
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    if-eqz v0, :cond_1c

    .line 780
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 782
    :cond_1c
    return-void
.end method

.method public removeHeader()V
    .registers 2

    .prologue
    .line 307
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->clearHeaderItems()V

    .line 308
    return-void
.end method

.method public removeItem(I)V
    .registers 5
    .param p1, "identifier"    # I

    .prologue
    .line 642
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->getPosition(I)I

    move-result v0

    .line 643
    .local v0, "position":I
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->checkDrawerItem(IZ)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 644
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->removeDrawerItem(I)V

    .line 646
    :cond_16
    return-void
.end method

.method public removeItemByPosition(I)V
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 631
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->checkDrawerItem(IZ)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 632
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->removeDrawerItem(I)V

    .line 634
    :cond_12
    return-void
.end method

.method public removeStickyFooterItemAtPosition(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 765
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, p1, :cond_17

    .line 766
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 769
    :cond_17
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/DrawerUtils;->rebuildStickyFooterView(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    .line 770
    return-void
.end method

.method public resetDrawerContent()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 878
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->switchedDrawerContent()Z

    move-result v0

    if-eqz v0, :cond_56

    .line 880
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/Drawer;->setOnDrawerItemClickListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;)V

    .line 881
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerItems:Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/mikepenz/materialdrawer/Drawer;->setItems(Ljava/util/ArrayList;Z)V

    .line 882
    iget v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerSelection:I

    invoke-virtual {p0, v0, v2}, Lcom/mikepenz/materialdrawer/Drawer;->setSelectionAtPosition(IZ)Z

    .line 884
    iput-object v3, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    .line 885
    iput-object v3, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerItems:Ljava/util/ArrayList;

    .line 886
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerSelection:I

    .line 889
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 892
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getStickyFooter()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_33

    .line 893
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getStickyFooter()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 895
    :cond_33
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getStickyFooterShadow()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_40

    .line 896
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getStickyFooterShadow()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 900
    :cond_40
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

    if-eqz v0, :cond_56

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    if-eqz v0, :cond_56

    .line 901
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iput-boolean v2, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionListShown:Z

    .line 904
    :cond_56
    return-void
.end method

.method public saveInstanceState(Landroid/os/Bundle;)Landroid/os/Bundle;
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 913
    if-eqz p1, :cond_27

    .line 914
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-boolean v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAppended:Z

    if-nez v0, :cond_2d

    .line 915
    const-string v1, "bundle_selection"

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->switchedDrawerContent()Z

    move-result v0

    if-eqz v0, :cond_28

    iget v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerSelection:I

    :goto_12
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 916
    const-string v0, "bundle_sticky_footer_selection"

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentStickyFooterSelection:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 917
    const-string v0, "bundle_drawer_content_switched"

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->switchedDrawerContent()Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 924
    :cond_27
    :goto_27
    return-object p1

    .line 915
    :cond_28
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    goto :goto_12

    .line 919
    :cond_2d
    const-string v1, "bundle_selection_appended"

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->switchedDrawerContent()Z

    move-result v0

    if-eqz v0, :cond_4d

    iget v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerSelection:I

    :goto_37
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 920
    const-string v0, "bundle_sticky_footer_selection_appended"

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentStickyFooterSelection:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 921
    const-string v0, "bundle_drawer_content_switched_appended"

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->switchedDrawerContent()Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_27

    .line 919
    :cond_4d
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    goto :goto_37
.end method

.method public setActionBarDrawerToggle(Landroid/support/v7/app/ActionBarDrawerToggle;)V
    .registers 5
    .param p1, "actionBarDrawerToggle"    # Landroid/support/v7/app/ActionBarDrawerToggle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 106
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggleEnabled:Z

    .line 107
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iput-object p1, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

    .line 108
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->handleDrawerNavigation(Landroid/app/Activity;Z)V

    .line 109
    return-void
.end method

.method public setFullscreen(Z)V
    .registers 3
    .param p1, "fullscreen"    # Z

    .prologue
    .line 150
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mMaterialize:Lcom/mikepenz/materialize/Materialize;

    if-eqz v0, :cond_d

    .line 151
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mMaterialize:Lcom/mikepenz/materialize/Materialize;

    invoke-virtual {v0, p1}, Lcom/mikepenz/materialize/Materialize;->setFullscreen(Z)V

    .line 153
    :cond_d
    return-void
.end method

.method public setHeader(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 285
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/materialdrawer/Drawer;->setHeader(Landroid/view/View;Z)V

    .line 286
    return-void
.end method

.method public setHeader(Landroid/view/View;Z)V
    .registers 8
    .param p1, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "divider"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v4, 0x0

    .line 295
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->clearHeaderItems()V

    .line 296
    if-eqz p2, :cond_26

    .line 297
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v0

    new-array v1, v1, [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    new-instance v2, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;

    invoke-direct {v2}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;-><init>()V

    invoke-virtual {v2, p1}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->withView(Landroid/view/View;)Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;

    move-result-object v2

    sget-object v3, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;->TOP:Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;

    invoke-virtual {v2, v3}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->withViewPosition(Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;)Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-virtual {v0, v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->addHeaderDrawerItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 301
    :goto_25
    return-void

    .line 299
    :cond_26
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v0

    new-array v1, v1, [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    new-instance v2, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;

    invoke-direct {v2}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;-><init>()V

    invoke-virtual {v2, p1}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->withView(Landroid/view/View;)Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;

    move-result-object v2

    sget-object v3, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;->NONE:Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;

    invoke-virtual {v2, v3}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->withViewPosition(Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;)Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-virtual {v0, v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->addHeaderDrawerItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    goto :goto_25
.end method

.method public setItemAtPosition(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;I)V
    .registers 5
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "position"    # I

    .prologue
    .line 622
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v1

    invoke-static {p1}, Lcom/mikepenz/materialdrawer/util/IdDistributor;->checkId(Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;)Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    invoke-virtual {v1, p2, v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->addDrawerItem(ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 623
    return-void
.end method

.method public setItems(Ljava/util/ArrayList;)V
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
            ">;)V"
        }
    .end annotation

    .prologue
    .line 670
    .local p1, "drawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/util/IdDistributor;->checkIds(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/mikepenz/materialdrawer/Drawer;->setItems(Ljava/util/ArrayList;Z)V

    .line 671
    return-void
.end method

.method public setOnDrawerItemClickListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;)V
    .registers 3
    .param p1, "onDrawerItemClickListener"    # Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    .prologue
    .line 790
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iput-object p1, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    .line 791
    return-void
.end method

.method public setOnDrawerItemLongClickListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;)V
    .registers 3
    .param p1, "onDrawerItemLongClickListener"    # Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;

    .prologue
    .line 808
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iput-object p1, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemLongClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;

    .line 809
    return-void
.end method

.method public setSelection(I)Z
    .registers 4
    .param p1, "identifier"    # I

    .prologue
    .line 434
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->getPosition(I)I

    move-result v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/mikepenz/materialdrawer/Drawer;->setSelectionAtPosition(IZ)Z

    move-result v0

    return v0
.end method

.method public setSelection(IZ)Z
    .registers 4
    .param p1, "identifier"    # I
    .param p2, "fireOnClick"    # Z

    .prologue
    .line 445
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->getPosition(I)I

    move-result v0

    invoke-virtual {p0, v0, p2}, Lcom/mikepenz/materialdrawer/Drawer;->setSelectionAtPosition(IZ)Z

    move-result v0

    return v0
.end method

.method public setSelection(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z
    .registers 4
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 466
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->getPosition(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)I

    move-result v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/mikepenz/materialdrawer/Drawer;->setSelectionAtPosition(IZ)Z

    move-result v0

    return v0
.end method

.method public setSelection(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Z)Z
    .registers 4
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "fireOnClick"    # Z

    .prologue
    .line 477
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->getPosition(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)I

    move-result v0

    invoke-virtual {p0, v0, p2}, Lcom/mikepenz/materialdrawer/Drawer;->setSelectionAtPosition(IZ)Z

    move-result v0

    return v0
.end method

.method public setSelectionAtPosition(I)Z
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 487
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/materialdrawer/Drawer;->setSelectionAtPosition(IZ)Z

    move-result v0

    return v0
.end method

.method public setSelectionAtPosition(IZ)Z
    .registers 5
    .param p1, "position"    # I
    .param p2, "fireOnClick"    # Z

    .prologue
    .line 499
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    if-eqz v0, :cond_13

    .line 500
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-virtual {v1, p1}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getDrawerItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v1

    invoke-static {v0, p1, p2, v1}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setRecyclerViewSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;IZLcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z

    move-result v0

    .line 502
    :goto_12
    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public setStatusBarColor(I)V
    .registers 3
    .param p1, "statusBarColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 161
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mMaterialize:Lcom/mikepenz/materialize/Materialize;

    if-eqz v0, :cond_1c

    .line 162
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mMaterialize:Lcom/mikepenz/materialize/Materialize;

    invoke-virtual {v0, p1}, Lcom/mikepenz/materialize/Materialize;->setStatusBarColor(I)V

    .line 163
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mMaterialize:Lcom/mikepenz/materialize/Materialize;

    invoke-virtual {v0}, Lcom/mikepenz/materialize/Materialize;->getScrimInsetsFrameLayout()Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    move-result-object v0

    invoke-interface {v0}, Lcom/mikepenz/materialize/view/IScrimInsetsLayout;->getView()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewGroup;->invalidate()V

    .line 165
    :cond_1c
    return-void
.end method

.method public setStickyFooterItemAtPosition(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;I)V
    .registers 5
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "position"    # I

    .prologue
    .line 751
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, p2, :cond_1b

    .line 752
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/mikepenz/materialdrawer/util/IdDistributor;->checkId(Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;)Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 755
    :cond_1b
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/DrawerUtils;->rebuildStickyFooterView(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    .line 756
    return-void
.end method

.method public setStickyFooterSelection(IZ)V
    .registers 4
    .param p1, "identifier"    # I
    .param p2, "fireOnClick"    # Z

    .prologue
    .line 456
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->getPosition(I)I

    move-result v0

    invoke-virtual {p0, v0, p2}, Lcom/mikepenz/materialdrawer/Drawer;->setStickyFooterSelectionAtPosition(IZ)V

    .line 457
    return-void
.end method

.method public setStickyFooterSelectionAtPosition(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 512
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/materialdrawer/Drawer;->setStickyFooterSelectionAtPosition(IZ)V

    .line 513
    return-void
.end method

.method public setStickyFooterSelectionAtPosition(IZ)V
    .registers 5
    .param p1, "position"    # I
    .param p2, "fireOnClick"    # Z

    .prologue
    .line 523
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setStickyFooterSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;ILjava/lang/Boolean;)V

    .line 524
    return-void
.end method

.method public setToolbar(Landroid/app/Activity;Landroid/support/v7/widget/Toolbar;)V
    .registers 4
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "toolbar"    # Landroid/support/v7/widget/Toolbar;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 83
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/mikepenz/materialdrawer/Drawer;->setToolbar(Landroid/app/Activity;Landroid/support/v7/widget/Toolbar;Z)V

    .line 84
    return-void
.end method

.method public setToolbar(Landroid/app/Activity;Landroid/support/v7/widget/Toolbar;Z)V
    .registers 5
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "toolbar"    # Landroid/support/v7/widget/Toolbar;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "recreateActionBarDrawerToggle"    # Z

    .prologue
    .line 96
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iput-object p2, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mToolbar:Landroid/support/v7/widget/Toolbar;

    .line 97
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-virtual {v0, p1, p3}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->handleDrawerNavigation(Landroid/app/Activity;Z)V

    .line 98
    return-void
.end method

.method public switchDrawerContent(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;Ljava/util/ArrayList;I)V
    .registers 6
    .param p1, "onDrawerItemClickListener"    # Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "drawerSelection"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .local p2, "drawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    const/16 v1, 0x8

    .line 853
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->switchedDrawerContent()Z

    move-result v0

    if-nez v0, :cond_3f

    .line 855
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getOnDrawerItemClickListener()Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    .line 856
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getDrawerItems()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerItems:Ljava/util/ArrayList;

    .line 857
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getCurrentSelectedPosition()I

    move-result v0

    iput v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerSelection:I

    .line 860
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->setOnDrawerItemClickListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;)V

    .line 861
    const/4 v0, 0x1

    invoke-direct {p0, p2, v0}, Lcom/mikepenz/materialdrawer/Drawer;->setItems(Ljava/util/ArrayList;Z)V

    .line 862
    const/4 v0, 0x0

    invoke-virtual {p0, p3, v0}, Lcom/mikepenz/materialdrawer/Drawer;->setSelectionAtPosition(IZ)Z

    .line 865
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getStickyFooter()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_32

    .line 866
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getStickyFooter()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 868
    :cond_32
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getStickyFooterShadow()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_3f

    .line 869
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getStickyFooterShadow()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 872
    :cond_3f
    return-void
.end method

.method public switchedDrawerContent()Z
    .registers 3

    .prologue
    .line 832
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    if-nez v0, :cond_d

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerItems:Ljava/util/ArrayList;

    if-nez v0, :cond_d

    iget v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerSelection:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_f

    :cond_d
    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public updateBadge(ILcom/mikepenz/materialdrawer/holder/StringHolder;)V
    .registers 6
    .param p1, "identifier"    # I
    .param p2, "badge"    # Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .prologue
    .line 544
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->getDrawerItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v1

    .line 545
    .local v1, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    instance-of v2, v1, Lcom/mikepenz/materialdrawer/model/interfaces/Badgeable;

    if-eqz v2, :cond_13

    move-object v0, v1

    .line 546
    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/Badgeable;

    .line 547
    .local v0, "badgeable":Lcom/mikepenz/materialdrawer/model/interfaces/Badgeable;
    invoke-interface {v0, p2}, Lcom/mikepenz/materialdrawer/model/interfaces/Badgeable;->withBadge(Lcom/mikepenz/materialdrawer/holder/StringHolder;)Ljava/lang/Object;

    .line 548
    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .end local v0    # "badgeable":Lcom/mikepenz/materialdrawer/model/interfaces/Badgeable;
    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/Drawer;->updateItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 550
    :cond_13
    return-void
.end method

.method public updateIcon(ILcom/mikepenz/materialdrawer/holder/ImageHolder;)V
    .registers 6
    .param p1, "identifier"    # I
    .param p2, "image"    # Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .prologue
    .line 576
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->getDrawerItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v0

    .line 577
    .local v0, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    instance-of v2, v0, Lcom/mikepenz/materialdrawer/model/interfaces/Iconable;

    if-eqz v2, :cond_13

    move-object v1, v0

    .line 578
    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/Iconable;

    .line 579
    .local v1, "pdi":Lcom/mikepenz/materialdrawer/model/interfaces/Iconable;
    invoke-interface {v1, p2}, Lcom/mikepenz/materialdrawer/model/interfaces/Iconable;->withIcon(Lcom/mikepenz/materialdrawer/holder/ImageHolder;)Ljava/lang/Object;

    .line 580
    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .end local v1    # "pdi":Lcom/mikepenz/materialdrawer/model/interfaces/Iconable;
    invoke-virtual {p0, v1}, Lcom/mikepenz/materialdrawer/Drawer;->updateItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 582
    :cond_13
    return-void
.end method

.method public updateItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 3
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 533
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->getPosition(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/materialdrawer/Drawer;->updateItemAtPosition(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;I)V

    .line 534
    return-void
.end method

.method public updateItemAtPosition(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;I)V
    .registers 5
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "position"    # I

    .prologue
    .line 591
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, p2, v1}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->checkDrawerItem(IZ)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 592
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v0

    invoke-virtual {v0, p2, p1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->setDrawerItem(ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 594
    :cond_12
    return-void
.end method

.method public updateName(ILcom/mikepenz/materialdrawer/holder/StringHolder;)V
    .registers 6
    .param p1, "identifier"    # I
    .param p2, "name"    # Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .prologue
    .line 560
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->getDrawerItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v0

    .line 561
    .local v0, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    instance-of v2, v0, Lcom/mikepenz/materialdrawer/model/interfaces/Nameable;

    if-eqz v2, :cond_13

    move-object v1, v0

    .line 562
    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/Nameable;

    .line 563
    .local v1, "pdi":Lcom/mikepenz/materialdrawer/model/interfaces/Nameable;
    invoke-interface {v1, p2}, Lcom/mikepenz/materialdrawer/model/interfaces/Nameable;->withName(Lcom/mikepenz/materialdrawer/holder/StringHolder;)Ljava/lang/Object;

    .line 564
    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .end local v1    # "pdi":Lcom/mikepenz/materialdrawer/model/interfaces/Nameable;
    invoke-virtual {p0, v1}, Lcom/mikepenz/materialdrawer/Drawer;->updateItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 566
    :cond_13
    return-void
.end method

.method public updateStickyFooterItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 3
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 697
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->getStickyFooterPosition(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/materialdrawer/Drawer;->updateStickyFooterItemAtPosition(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;I)V

    .line 698
    return-void
.end method

.method public updateStickyFooterItemAtPosition(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;I)V
    .registers 4
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "position"    # I

    .prologue
    .line 707
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, p2, :cond_17

    .line 708
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 711
    :cond_17
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/DrawerUtils;->rebuildStickyFooterView(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    .line 712
    return-void
.end method
