.class final Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
.super Ljava/lang/Object;
.source "ActionBarActivityDelegateBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/app/ActionBarActivityDelegateBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PanelFeatureState"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState$SavedState;
    }
.end annotation


# instance fields
.field decorView:Landroid/view/ViewGroup;

.field featureId:I

.field frozenActionViewState:Landroid/os/Bundle;

.field frozenMenuState:Landroid/os/Bundle;

.field isHandled:Z

.field isOpen:Z

.field isPrepared:Z

.field listMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

.field listPresenterContext:Landroid/content/Context;

.field menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

.field public qwertyMode:Z

.field refreshDecorView:Z

.field refreshMenuContent:Z

.field shownPanelView:Landroid/view/View;

.field wasLastOpen:Z


# direct methods
.method constructor <init>(I)V
    .registers 3
    .param p1, "featureId"    # I

    .prologue
    .line 1502
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1503
    iput p1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->featureId:I

    .line 1505
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->refreshDecorView:Z

    .line 1506
    return-void
.end method


# virtual methods
.method applyFrozenState()V
    .registers 3

    .prologue
    .line 1600
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-eqz v0, :cond_12

    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->frozenMenuState:Landroid/os/Bundle;

    if-eqz v0, :cond_12

    .line 1601
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->frozenMenuState:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->restorePresenterStates(Landroid/os/Bundle;)V

    .line 1602
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->frozenMenuState:Landroid/os/Bundle;

    .line 1604
    :cond_12
    return-void
.end method

.method public clearMenuPresenters()V
    .registers 3

    .prologue
    .line 1518
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-eqz v0, :cond_b

    .line 1519
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->listMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->removeMenuPresenter(Landroid/support/v7/internal/view/menu/MenuPresenter;)V

    .line 1521
    :cond_b
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->listMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    .line 1522
    return-void
.end method

.method getListMenuView(Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;)Landroid/support/v7/internal/view/menu/MenuView;
    .registers 6
    .param p1, "cb"    # Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;

    .prologue
    .line 1562
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-nez v1, :cond_6

    const/4 v0, 0x0

    .line 1573
    :goto_5
    return-object v0

    .line 1564
    :cond_6
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->listMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    if-nez v1, :cond_21

    .line 1565
    new-instance v1, Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->listPresenterContext:Landroid/content/Context;

    sget v3, Landroid/support/v7/appcompat/R$layout;->abc_list_menu_item_layout:I

    invoke-direct {v1, v2, v3}, Landroid/support/v7/internal/view/menu/ListMenuPresenter;-><init>(Landroid/content/Context;I)V

    iput-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->listMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    .line 1567
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->listMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    invoke-virtual {v1, p1}, Landroid/support/v7/internal/view/menu/ListMenuPresenter;->setCallback(Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;)V

    .line 1568
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->listMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    invoke-virtual {v1, v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->addMenuPresenter(Landroid/support/v7/internal/view/menu/MenuPresenter;)V

    .line 1571
    :cond_21
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->listMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->decorView:Landroid/view/ViewGroup;

    invoke-virtual {v1, v2}, Landroid/support/v7/internal/view/menu/ListMenuPresenter;->getMenuView(Landroid/view/ViewGroup;)Landroid/support/v7/internal/view/menu/MenuView;

    move-result-object v0

    .line 1573
    .local v0, "result":Landroid/support/v7/internal/view/menu/MenuView;
    goto :goto_5
.end method

.method public hasPanelItems()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 1509
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->shownPanelView:Landroid/view/View;

    if-nez v1, :cond_6

    .line 1511
    :cond_5
    :goto_5
    return v0

    :cond_6
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->listMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    invoke-virtual {v1}, Landroid/support/v7/internal/view/menu/ListMenuPresenter;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    if-lez v1, :cond_5

    const/4 v0, 0x1

    goto :goto_5
.end method

.method onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    const/4 v2, 0x0

    .line 1590
    move-object v0, p1

    check-cast v0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState$SavedState;

    .line 1591
    .local v0, "savedState":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState$SavedState;
    iget v1, v0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState$SavedState;->featureId:I

    iput v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->featureId:I

    .line 1592
    iget-boolean v1, v0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState$SavedState;->isOpen:Z

    iput-boolean v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->wasLastOpen:Z

    .line 1593
    iget-object v1, v0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState$SavedState;->menuState:Landroid/os/Bundle;

    iput-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->frozenMenuState:Landroid/os/Bundle;

    .line 1595
    iput-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->shownPanelView:Landroid/view/View;

    .line 1596
    iput-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->decorView:Landroid/view/ViewGroup;

    .line 1597
    return-void
.end method

.method onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 1577
    new-instance v0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState$SavedState;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState$SavedState;-><init>(Landroid/support/v7/app/ActionBarActivityDelegateBase$1;)V

    .line 1578
    .local v0, "savedState":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState$SavedState;
    iget v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->featureId:I

    iput v1, v0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState$SavedState;->featureId:I

    .line 1579
    iget-boolean v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->isOpen:Z

    iput-boolean v1, v0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState$SavedState;->isOpen:Z

    .line 1581
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-eqz v1, :cond_20

    .line 1582
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    iput-object v1, v0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState$SavedState;->menuState:Landroid/os/Bundle;

    .line 1583
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    iget-object v2, v0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState$SavedState;->menuState:Landroid/os/Bundle;

    invoke-virtual {v1, v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->savePresenterStates(Landroid/os/Bundle;)V

    .line 1586
    :cond_20
    return-object v0
.end method

.method setMenu(Landroid/support/v7/internal/view/menu/MenuBuilder;)V
    .registers 4
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;

    .prologue
    .line 1550
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-ne p1, v0, :cond_5

    .line 1559
    :cond_4
    :goto_4
    return-void

    .line 1552
    :cond_5
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-eqz v0, :cond_10

    .line 1553
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->listMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->removeMenuPresenter(Landroid/support/v7/internal/view/menu/MenuPresenter;)V

    .line 1555
    :cond_10
    iput-object p1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    .line 1556
    if-eqz p1, :cond_4

    .line 1557
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->listMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    if-eqz v0, :cond_4

    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->listMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    invoke-virtual {p1, v0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->addMenuPresenter(Landroid/support/v7/internal/view/menu/MenuPresenter;)V

    goto :goto_4
.end method

.method setStyle(Landroid/content/Context;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x1

    .line 1525
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 1526
    .local v1, "outValue":Landroid/util/TypedValue;
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    .line 1527
    .local v2, "widgetTheme":Landroid/content/res/Resources$Theme;
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 1530
    sget v3, Landroid/support/v7/appcompat/R$attr;->actionBarPopupTheme:I

    invoke-virtual {v2, v3, v1, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 1531
    iget v3, v1, Landroid/util/TypedValue;->resourceId:I

    if-eqz v3, :cond_23

    .line 1532
    iget v3, v1, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 1536
    :cond_23
    sget v3, Landroid/support/v7/appcompat/R$attr;->panelMenuListTheme:I

    invoke-virtual {v2, v3, v1, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 1537
    iget v3, v1, Landroid/util/TypedValue;->resourceId:I

    if-eqz v3, :cond_41

    .line 1538
    iget v3, v1, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 1543
    :goto_31
    new-instance v0, Landroid/view/ContextThemeWrapper;

    const/4 v3, 0x0

    invoke-direct {v0, p1, v3}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 1544
    .end local p1    # "context":Landroid/content/Context;
    .local v0, "context":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 1546
    iput-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->listPresenterContext:Landroid/content/Context;

    .line 1547
    return-void

    .line 1540
    .end local v0    # "context":Landroid/content/Context;
    .restart local p1    # "context":Landroid/content/Context;
    :cond_41
    sget v3, Landroid/support/v7/appcompat/R$style;->Theme_AppCompat_CompactMenu:I

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    goto :goto_31
.end method
