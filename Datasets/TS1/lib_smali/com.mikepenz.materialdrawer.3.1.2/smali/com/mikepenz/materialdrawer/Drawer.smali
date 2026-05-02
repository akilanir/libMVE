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
.field protected static final BUNDLE_FOOTER_SELECTION:Ljava/lang/String; = "bundle_footer_selection"

.field protected static final BUNDLE_SELECTION:Ljava/lang/String; = "bundle_selection"

.field protected static final PREF_USER_LEARNED_DRAWER:Ljava/lang/String; = "navigation_drawer_learned"


# instance fields
.field private mContentView:Landroid/widget/FrameLayout;

.field private final mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

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
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mKeyboardUtil:Lcom/mikepenz/materialdrawer/util/KeyboardUtil;

    .line 808
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerSelection:I

    .line 54
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    .line 55
    return-void
.end method

.method private setItems(Ljava/util/ArrayList;Z)V
    .registers 5
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
    .line 546
    .local p1, "drawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iput-object p1, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    .line 549
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerItems:Ljava/util/ArrayList;

    if-eqz v0, :cond_14

    if-nez p2, :cond_14

    .line 550
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerItems:Ljava/util/ArrayList;

    .line 555
    :goto_c
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->dataUpdated()V

    .line 556
    return-void

    .line 552
    :cond_14
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->setDrawerItems(Ljava/util/ArrayList;)V

    goto :goto_c
.end method


# virtual methods
.method public addFooterItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 4
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 705
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    if-nez v0, :cond_f

    .line 706
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    .line 708
    :cond_f
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 710
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/DrawerUtils;->rebuildFooterView(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    .line 711
    return-void
.end method

.method public addFooterItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;I)V
    .registers 5
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .param p2, "position"    # I

    .prologue
    .line 720
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    if-nez v0, :cond_f

    .line 721
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    .line 723
    :cond_f
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 725
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/DrawerUtils;->rebuildFooterView(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    .line 726
    return-void
.end method

.method public addItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 3
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 466
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    if-eqz v0, :cond_14

    .line 467
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 468
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->dataUpdated()V

    .line 470
    :cond_14
    return-void
.end method

.method public addItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;I)V
    .registers 4
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .param p2, "position"    # I

    .prologue
    .line 479
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    if-eqz v0, :cond_14

    .line 480
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 481
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->dataUpdated()V

    .line 483
    :cond_14
    return-void
.end method

.method public varargs addItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 3
    .param p1, "drawerItems"    # [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 524
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    if-eqz v0, :cond_14

    .line 525
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 526
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->dataUpdated()V

    .line 528
    :cond_14
    return-void
.end method

.method public closeDrawer()V
    .registers 3

    .prologue
    .line 79
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-eqz v0, :cond_15

    .line 80
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->closeDrawer(I)V

    .line 82
    :cond_15
    return-void
.end method

.method public getActionBarDrawerToggle()Landroid/support/v7/app/ActionBarDrawerToggle;
    .registers 2

    .prologue
    .line 277
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

    return-object v0
.end method

.method public getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;
    .registers 2

    .prologue
    .line 193
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    return-object v0
.end method

.method public getContent()Landroid/widget/FrameLayout;
    .registers 3

    .prologue
    .line 172
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mContentView:Landroid/widget/FrameLayout;

    if-nez v0, :cond_18

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-eqz v0, :cond_18

    .line 173
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    sget v1, Lcom/mikepenz/materialdrawer/R$id;->content_layout:I

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mContentView:Landroid/widget/FrameLayout;

    .line 175
    :cond_18
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mContentView:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method public getCurrentFooterSelection()I
    .registers 2

    .prologue
    .line 335
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentFooterSelection:I

    return v0
.end method

.method public getCurrentSelection()I
    .registers 2

    .prologue
    .line 326
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    return v0
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
    .line 202
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getDrawerLayout()Landroid/support/v4/widget/DrawerLayout;
    .registers 2

    .prologue
    .line 63
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    return-object v0
.end method

.method public getFooter()Landroid/view/View;
    .registers 2

    .prologue
    .line 259
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterView:Landroid/view/View;

    return-object v0
.end method

.method public getFooterPositionFromIdentifier(I)I
    .registers 3
    .param p1, "identifier"    # I

    .prologue
    .line 317
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-static {v0, p1}, Lcom/mikepenz/materialdrawer/DrawerUtils;->getFooterPositionFromIdentifier(Lcom/mikepenz/materialdrawer/DrawerBuilder;I)I

    move-result v0

    return v0
.end method

.method public getFooterPositionFromIdentifier(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)I
    .registers 3
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 307
    invoke-interface {p1}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getIdentifier()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/Drawer;->getFooterPositionFromIdentifier(I)I

    move-result v0

    return v0
.end method

.method public getHeader()Landroid/view/View;
    .registers 2

    .prologue
    .line 211
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderView:Landroid/view/View;

    return-object v0
.end method

.method public getListView()Landroid/widget/ListView;
    .registers 2

    .prologue
    .line 184
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    return-object v0
.end method

.method public getOnDrawerItemClickListener()Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;
    .registers 2

    .prologue
    .line 783
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    return-object v0
.end method

.method public getOnDrawerItemLongClickListener()Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;
    .registers 2

    .prologue
    .line 801
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemLongClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;

    return-object v0
.end method

.method public getPositionFromIdentifier(I)I
    .registers 3
    .param p1, "identifier"    # I

    .prologue
    .line 297
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-static {v0, p1}, Lcom/mikepenz/materialdrawer/DrawerUtils;->getPositionFromIdentifier(Lcom/mikepenz/materialdrawer/DrawerBuilder;I)I

    move-result v0

    return v0
.end method

.method public getPositionFromIdentifier(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)I
    .registers 3
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 287
    invoke-interface {p1}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getIdentifier()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/Drawer;->getPositionFromIdentifier(I)I

    move-result v0

    return v0
.end method

.method public getScrimInsetsFrameLayout()Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;
    .registers 2

    .prologue
    .line 128
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerContentRoot:Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;

    return-object v0
.end method

.method public getSlider()Landroid/widget/RelativeLayout;
    .registers 2

    .prologue
    .line 163
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method public getStickyFooter()Landroid/view/View;
    .registers 2

    .prologue
    .line 268
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    return-object v0
.end method

.method public getStickyHeader()Landroid/view/View;
    .registers 2

    .prologue
    .line 220
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyHeaderView:Landroid/view/View;

    return-object v0
.end method

.method public isDrawerOpen()Z
    .registers 3

    .prologue
    .line 91
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_1d

    .line 92
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->isDrawerOpen(I)Z

    move-result v0

    .line 94
    :goto_1c
    return v0

    :cond_1d
    const/4 v0, 0x0

    goto :goto_1c
.end method

.method public keyboardSupportEnabled(Landroid/app/Activity;Z)V
    .registers 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "enable"    # Z

    .prologue
    .line 141
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getContent()Landroid/widget/FrameLayout;

    move-result-object v0

    if-eqz v0, :cond_30

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getContent()Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v0

    if-lez v0, :cond_30

    .line 142
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mKeyboardUtil:Lcom/mikepenz/materialdrawer/util/KeyboardUtil;

    if-nez v0, :cond_29

    .line 143
    new-instance v0, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getContent()Landroid/widget/FrameLayout;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mKeyboardUtil:Lcom/mikepenz/materialdrawer/util/KeyboardUtil;

    .line 144
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mKeyboardUtil:Lcom/mikepenz/materialdrawer/util/KeyboardUtil;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;->disable()V

    .line 147
    :cond_29
    if-eqz p2, :cond_31

    .line 148
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mKeyboardUtil:Lcom/mikepenz/materialdrawer/util/KeyboardUtil;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;->enable()V

    .line 153
    :cond_30
    :goto_30
    return-void

    .line 150
    :cond_31
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mKeyboardUtil:Lcom/mikepenz/materialdrawer/util/KeyboardUtil;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;->disable()V

    goto :goto_30
.end method

.method public openDrawer()V
    .registers 3

    .prologue
    .line 70
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_1b

    .line 71
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->openDrawer(I)V

    .line 73
    :cond_1b
    return-void
.end method

.method public removeAllFooterItems()V
    .registers 3

    .prologue
    .line 760
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    if-eqz v0, :cond_d

    .line 761
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 763
    :cond_d
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    if-eqz v0, :cond_1c

    .line 764
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 766
    :cond_1c
    return-void
.end method

.method public removeAllItems()V
    .registers 2

    .prologue
    .line 514
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 515
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->dataUpdated()V

    .line 516
    return-void
.end method

.method public removeFooterItem(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 749
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, p1, :cond_17

    .line 750
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 753
    :cond_17
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/DrawerUtils;->rebuildFooterView(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    .line 754
    return-void
.end method

.method public removeHeader()V
    .registers 3

    .prologue
    .line 246
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getListView()Landroid/widget/ListView;

    move-result-object v0

    if-eqz v0, :cond_21

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getHeader()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_21

    .line 247
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getHeader()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->removeHeaderView(Landroid/view/View;)Z

    .line 248
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderView:Landroid/view/View;

    .line 249
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    const/4 v1, 0x0

    iput v1, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    .line 251
    :cond_21
    return-void
.end method

.method public removeItem(I)V
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 504
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->checkDrawerItem(IZ)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 505
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 506
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->dataUpdated()V

    .line 508
    :cond_17
    return-void
.end method

.method public resetDrawerContent()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 846
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->switchedDrawerContent()Z

    move-result v0

    if-eqz v0, :cond_33

    .line 848
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/Drawer;->setOnDrawerItemClickListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;)V

    .line 849
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerItems:Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/mikepenz/materialdrawer/Drawer;->setItems(Ljava/util/ArrayList;Z)V

    .line 850
    iget v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerSelection:I

    invoke-virtual {p0, v0, v2}, Lcom/mikepenz/materialdrawer/Drawer;->setSelection(IZ)Z

    .line 852
    iput-object v3, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    .line 853
    iput-object v3, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerItems:Ljava/util/ArrayList;

    .line 854
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerSelection:I

    .line 856
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->resetAnimation()V

    .line 858
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getStickyFooter()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_33

    .line 859
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getStickyFooter()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 862
    :cond_33
    return-void
.end method

.method public saveInstanceState(Landroid/os/Bundle;)Landroid/os/Bundle;
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 871
    if-eqz p1, :cond_14

    .line 872
    const-string v0, "bundle_selection"

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 873
    const-string v0, "bundle_footer_selection"

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentFooterSelection:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 875
    :cond_14
    return-object p1
.end method

.method public setFooterItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;I)V
    .registers 4
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .param p2, "position"    # I

    .prologue
    .line 735
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, p2, :cond_17

    .line 736
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 739
    :cond_17
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/DrawerUtils;->rebuildFooterView(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    .line 740
    return-void
.end method

.method public setFooterSelection(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 423
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/materialdrawer/Drawer;->setFooterSelection(IZ)V

    .line 424
    return-void
.end method

.method public setFooterSelection(IZ)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "fireOnClick"    # Z

    .prologue
    .line 434
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-static {v0, p1, p2}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setFooterSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;IZ)V

    .line 435
    return-void
.end method

.method public setFooterSelectionByIdentifier(IZ)V
    .registers 4
    .param p1, "identifier"    # I
    .param p2, "fireOnClick"    # Z

    .prologue
    .line 367
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->getPositionFromIdentifier(I)I

    move-result v0

    invoke-virtual {p0, v0, p2}, Lcom/mikepenz/materialdrawer/Drawer;->setFooterSelection(IZ)V

    .line 368
    return-void
.end method

.method public setFullscreen(Z)V
    .registers 4
    .param p1, "fullscreen"    # Z

    .prologue
    .line 105
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerContentRoot:Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;

    if-eqz v0, :cond_10

    .line 106
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerContentRoot:Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;

    if-nez p1, :cond_11

    const/4 v0, 0x1

    :goto_d
    invoke-virtual {v1, v0}, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->setEnabled(Z)V

    .line 108
    :cond_10
    return-void

    .line 106
    :cond_11
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public setHeader(Landroid/view/View;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 229
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getListView()Landroid/widget/ListView;

    move-result-object v1

    if-eqz v1, :cond_3a

    .line 230
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v0

    .line 231
    .local v0, "adapter":Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getListView()Landroid/widget/ListView;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 232
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getHeader()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_23

    .line 233
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getListView()Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getHeader()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->removeHeaderView(Landroid/view/View;)Z

    .line 235
    :cond_23
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getListView()Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    .line 236
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getListView()Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 237
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iput-object p1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderView:Landroid/view/View;

    .line 238
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    const/4 v2, 0x1

    iput v2, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    .line 240
    .end local v0    # "adapter":Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;
    :cond_3a
    return-void
.end method

.method public setItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;I)V
    .registers 4
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .param p2, "position"    # I

    .prologue
    .line 492
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    if-eqz v0, :cond_14

    .line 493
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 494
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->dataUpdated()V

    .line 496
    :cond_14
    return-void
.end method

.method public setItems(Ljava/util/ArrayList;)V
    .registers 3
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
    .line 536
    .local p1, "drawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/mikepenz/materialdrawer/Drawer;->setItems(Ljava/util/ArrayList;Z)V

    .line 537
    return-void
.end method

.method public setOnDrawerItemClickListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;)V
    .registers 3
    .param p1, "onDrawerItemClickListener"    # Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    .prologue
    .line 774
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iput-object p1, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    .line 775
    return-void
.end method

.method public setOnDrawerItemLongClickListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;)V
    .registers 3
    .param p1, "onDrawerItemLongClickListener"    # Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;

    .prologue
    .line 792
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iput-object p1, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemLongClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;

    .line 793
    return-void
.end method

.method public setSelection(I)Z
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 398
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/materialdrawer/Drawer;->setSelection(IZ)Z

    move-result v0

    return v0
.end method

.method public setSelection(IZ)Z
    .registers 6
    .param p1, "position"    # I
    .param p2, "fireOnClick"    # Z

    .prologue
    const/4 v0, 0x0

    .line 410
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    if-eqz v1, :cond_13

    .line 411
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-virtual {v2, p1, v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getDrawerItem(IZ)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v0

    invoke-static {v1, p1, p2, v0}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setListSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;IZLcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z

    move-result v0

    .line 413
    :cond_13
    return v0
.end method

.method public setSelection(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z
    .registers 4
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 377
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->getPositionFromIdentifier(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)I

    move-result v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/mikepenz/materialdrawer/Drawer;->setSelection(IZ)Z

    move-result v0

    return v0
.end method

.method public setSelection(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Z)Z
    .registers 4
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .param p2, "fireOnClick"    # Z

    .prologue
    .line 388
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->getPositionFromIdentifier(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)I

    move-result v0

    invoke-virtual {p0, v0, p2}, Lcom/mikepenz/materialdrawer/Drawer;->setSelection(IZ)Z

    move-result v0

    return v0
.end method

.method public setSelectionByIdentifier(I)Z
    .registers 4
    .param p1, "identifier"    # I

    .prologue
    .line 345
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->getPositionFromIdentifier(I)I

    move-result v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/mikepenz/materialdrawer/Drawer;->setSelection(IZ)Z

    move-result v0

    return v0
.end method

.method public setSelectionByIdentifier(IZ)Z
    .registers 4
    .param p1, "identifier"    # I
    .param p2, "fireOnClick"    # Z

    .prologue
    .line 356
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->getPositionFromIdentifier(I)I

    move-result v0

    invoke-virtual {p0, v0, p2}, Lcom/mikepenz/materialdrawer/Drawer;->setSelection(IZ)Z

    move-result v0

    return v0
.end method

.method public setStatusBarColor(I)V
    .registers 3
    .param p1, "statusBarColor"    # I

    .prologue
    .line 116
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerContentRoot:Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;

    if-eqz v0, :cond_14

    .line 117
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerContentRoot:Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;

    invoke-virtual {v0, p1}, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->setInsetForeground(I)V

    .line 118
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerContentRoot:Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->invalidate()V

    .line 120
    :cond_14
    return-void
.end method

.method public switchDrawerContent(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;Ljava/util/ArrayList;I)V
    .registers 6
    .param p1, "onDrawerItemClickListener"    # Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;
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
    .line 823
    .local p2, "drawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->switchedDrawerContent()Z

    move-result v0

    if-nez v0, :cond_39

    .line 825
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getOnDrawerItemClickListener()Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    .line 826
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getDrawerItems()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerItems:Ljava/util/ArrayList;

    .line 827
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getCurrentSelection()I

    move-result v0

    iput v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->originalDrawerSelection:I

    .line 830
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->setOnDrawerItemClickListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;)V

    .line 831
    const/4 v0, 0x1

    invoke-direct {p0, p2, v0}, Lcom/mikepenz/materialdrawer/Drawer;->setItems(Ljava/util/ArrayList;Z)V

    .line 832
    const/4 v0, 0x0

    invoke-virtual {p0, p3, v0}, Lcom/mikepenz/materialdrawer/Drawer;->setSelection(IZ)Z

    .line 834
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->resetAnimation()V

    .line 836
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getStickyFooter()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_39

    .line 837
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/Drawer;->getStickyFooter()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 840
    :cond_39
    return-void
.end method

.method public switchedDrawerContent()Z
    .registers 3

    .prologue
    .line 811
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

.method public updateBadge(Ljava/lang/String;I)V
    .registers 6
    .param p1, "badge"    # Ljava/lang/String;
    .param p2, "position"    # I

    .prologue
    .line 605
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    const/4 v2, 0x0

    invoke-virtual {v1, p2, v2}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->checkDrawerItem(IZ)Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 606
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 608
    .local v0, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    instance-of v1, v0, Lcom/mikepenz/materialdrawer/model/interfaces/Badgeable;

    if-eqz v1, :cond_1d

    move-object v1, v0

    .line 609
    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/Badgeable;

    invoke-interface {v1, p1}, Lcom/mikepenz/materialdrawer/model/interfaces/Badgeable;->setBadge(Ljava/lang/String;)V

    .line 612
    :cond_1d
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1, p2, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 613
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyDataSetChanged()V

    .line 615
    .end local v0    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    :cond_2b
    return-void
.end method

.method public updateFooterItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 3
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 681
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->getFooterPositionFromIdentifier(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/materialdrawer/Drawer;->updateFooterItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;I)V

    .line 682
    return-void
.end method

.method public updateFooterItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;I)V
    .registers 4
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .param p2, "position"    # I

    .prologue
    .line 691
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, p2, :cond_17

    .line 692
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 695
    :cond_17
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/DrawerUtils;->rebuildFooterView(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    .line 696
    return-void
.end method

.method public updateIcon(II)V
    .registers 6
    .param p1, "iconRes"    # I
    .param p2, "position"    # I

    .prologue
    .line 643
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    if-eqz v1, :cond_3d

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    const/4 v2, 0x0

    invoke-virtual {v1, p2, v2}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->checkDrawerItem(IZ)Z

    move-result v1

    if-eqz v1, :cond_3d

    .line 644
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 646
    .local v0, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    instance-of v1, v0, Lcom/mikepenz/materialdrawer/model/interfaces/Iconable;

    if-eqz v1, :cond_2f

    move-object v1, v0

    .line 647
    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/Iconable;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v2, v2, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRootView:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getCompatDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/mikepenz/materialdrawer/model/interfaces/Iconable;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 650
    :cond_2f
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1, p2, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 651
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyDataSetChanged()V

    .line 653
    .end local v0    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    :cond_3d
    return-void
.end method

.method public updateIcon(Landroid/graphics/drawable/Drawable;I)V
    .registers 6
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;
    .param p2, "position"    # I

    .prologue
    .line 624
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    const/4 v2, 0x0

    invoke-virtual {v1, p2, v2}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->checkDrawerItem(IZ)Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 625
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 627
    .local v0, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    instance-of v1, v0, Lcom/mikepenz/materialdrawer/model/interfaces/Iconable;

    if-eqz v1, :cond_1d

    move-object v1, v0

    .line 628
    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/Iconable;

    invoke-interface {v1, p1}, Lcom/mikepenz/materialdrawer/model/interfaces/Iconable;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 631
    :cond_1d
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1, p2, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 632
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyDataSetChanged()V

    .line 634
    .end local v0    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    :cond_2b
    return-void
.end method

.method public updateIcon(Lcom/mikepenz/iconics/typeface/IIcon;I)V
    .registers 6
    .param p1, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;
    .param p2, "position"    # I

    .prologue
    .line 662
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    const/4 v2, 0x0

    invoke-virtual {v1, p2, v2}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->checkDrawerItem(IZ)Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 663
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 665
    .local v0, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    instance-of v1, v0, Lcom/mikepenz/materialdrawer/model/interfaces/Iconable;

    if-eqz v1, :cond_1d

    move-object v1, v0

    .line 666
    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/Iconable;

    invoke-interface {v1, p1}, Lcom/mikepenz/materialdrawer/model/interfaces/Iconable;->setIIcon(Lcom/mikepenz/iconics/typeface/IIcon;)V

    .line 669
    :cond_1d
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1, p2, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 670
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyDataSetChanged()V

    .line 672
    .end local v0    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    :cond_2b
    return-void
.end method

.method public updateItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 3
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 444
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/Drawer;->getPositionFromIdentifier(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/materialdrawer/Drawer;->updateItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;I)V

    .line 445
    return-void
.end method

.method public updateItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;I)V
    .registers 5
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .param p2, "position"    # I

    .prologue
    .line 454
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, p2, v1}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->checkDrawerItem(IZ)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 455
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 456
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->dataUpdated()V

    .line 458
    :cond_17
    return-void
.end method

.method public updateName(II)V
    .registers 6
    .param p1, "nameRes"    # I
    .param p2, "position"    # I

    .prologue
    .line 565
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    const/4 v2, 0x0

    invoke-virtual {v1, p2, v2}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->checkDrawerItem(IZ)Z

    move-result v1

    if-eqz v1, :cond_32

    .line 566
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 568
    .local v0, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    instance-of v1, v0, Lcom/mikepenz/materialdrawer/model/interfaces/Nameable;

    if-eqz v1, :cond_24

    move-object v1, v0

    .line 569
    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/Nameable;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lcom/mikepenz/materialdrawer/model/interfaces/Nameable;->setName(Ljava/lang/String;)V

    move-object v1, v0

    .line 570
    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/Nameable;

    invoke-interface {v1, p1}, Lcom/mikepenz/materialdrawer/model/interfaces/Nameable;->setNameRes(I)V

    .line 573
    :cond_24
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1, p2, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 574
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyDataSetChanged()V

    .line 576
    .end local v0    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    :cond_32
    return-void
.end method

.method public updateName(Ljava/lang/String;I)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "position"    # I

    .prologue
    .line 585
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    const/4 v2, 0x0

    invoke-virtual {v1, p2, v2}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->checkDrawerItem(IZ)Z

    move-result v1

    if-eqz v1, :cond_32

    .line 586
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 588
    .local v0, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    instance-of v1, v0, Lcom/mikepenz/materialdrawer/model/interfaces/Nameable;

    if-eqz v1, :cond_24

    move-object v1, v0

    .line 589
    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/Nameable;

    const/4 v2, -0x1

    invoke-interface {v1, v2}, Lcom/mikepenz/materialdrawer/model/interfaces/Nameable;->setNameRes(I)V

    move-object v1, v0

    .line 590
    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/Nameable;

    invoke-interface {v1, p1}, Lcom/mikepenz/materialdrawer/model/interfaces/Nameable;->setName(Ljava/lang/String;)V

    .line 593
    :cond_24
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1, p2, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 594
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/Drawer;->mDrawerBuilder:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyDataSetChanged()V

    .line 596
    .end local v0    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    :cond_32
    return-void
.end method
