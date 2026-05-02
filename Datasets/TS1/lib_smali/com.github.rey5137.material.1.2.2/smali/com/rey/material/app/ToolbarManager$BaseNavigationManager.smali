.class public Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;
.super Lcom/rey/material/app/ToolbarManager$NavigationManager;
.source "ToolbarManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/ToolbarManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BaseNavigationManager"
.end annotation


# instance fields
.field protected mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

.field protected mFragmentManager:Landroid/support/v4/app/FragmentManager;


# direct methods
.method public constructor <init>(ILandroid/support/v4/app/FragmentManager;Landroid/support/v7/widget/Toolbar;Landroid/support/v4/widget/DrawerLayout;)V
    .registers 7
    .param p1, "styleId"    # I
    .param p2, "fragmentManager"    # Landroid/support/v4/app/FragmentManager;
    .param p3, "toolbar"    # Landroid/support/v7/widget/Toolbar;
    .param p4, "drawerLayout"    # Landroid/support/v4/widget/DrawerLayout;

    .prologue
    .line 430
    new-instance v0, Lcom/rey/material/drawable/NavigationDrawerDrawable$Builder;

    invoke-virtual {p3}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/rey/material/drawable/NavigationDrawerDrawable$Builder;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0}, Lcom/rey/material/drawable/NavigationDrawerDrawable$Builder;->build()Lcom/rey/material/drawable/NavigationDrawerDrawable;

    move-result-object v0

    invoke-direct {p0, v0, p3}, Lcom/rey/material/app/ToolbarManager$NavigationManager;-><init>(Lcom/rey/material/drawable/NavigationDrawerDrawable;Landroid/support/v7/widget/Toolbar;)V

    .line 431
    iput-object p4, p0, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    .line 432
    iput-object p2, p0, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    .line 434
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-eqz v0, :cond_22

    .line 435
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    new-instance v1, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager$1;

    invoke-direct {v1, p0}, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager$1;-><init>(Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->setDrawerListener(Landroid/support/v4/widget/DrawerLayout$DrawerListener;)V

    .line 459
    :cond_22
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    new-instance v1, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager$2;

    invoke-direct {v1, p0}, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager$2;-><init>(Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->addOnBackStackChangedListener(Landroid/support/v4/app/FragmentManager$OnBackStackChangedListener;)V

    .line 465
    return-void
.end method


# virtual methods
.method public isBackState()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    .line 469
    iget-object v1, p0, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->getBackStackEntryCount()I

    move-result v1

    if-gt v1, v0, :cond_18

    iget-object v1, p0, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-eqz v1, :cond_19

    iget-object v1, p0, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    const v2, 0x800003

    invoke-virtual {v1, v2}, Landroid/support/v4/widget/DrawerLayout;->isDrawerOpen(I)Z

    move-result v1

    if-eqz v1, :cond_19

    :cond_18
    :goto_18
    return v0

    :cond_19
    const/4 v0, 0x0

    goto :goto_18
.end method

.method protected onDrawerClosed(Landroid/view/View;)V
    .registers 2
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    .line 507
    return-void
.end method

.method protected onDrawerOpened(Landroid/view/View;)V
    .registers 2
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    .line 505
    return-void
.end method

.method protected onDrawerSlide(Landroid/view/View;F)V
    .registers 5
    .param p1, "drawerView"    # Landroid/view/View;
    .param p2, "slideOffset"    # F

    .prologue
    .line 494
    invoke-virtual {p0}, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;->shouldSyncDrawerSlidingProgress()Z

    move-result v0

    if-nez v0, :cond_a

    .line 495
    invoke-virtual {p0}, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;->notifyStateInvalidated()V

    .line 503
    :goto_9
    return-void

    .line 498
    :cond_a
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    const v1, 0x800003

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->isDrawerOpen(I)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 499
    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, p2

    invoke-virtual {p0, v0, v1}, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;->notifyStateProgressChanged(ZF)V

    goto :goto_9

    .line 501
    :cond_1d
    const/4 v0, 0x1

    invoke-virtual {p0, v0, p2}, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;->notifyStateProgressChanged(ZF)V

    goto :goto_9
.end method

.method protected onDrawerStateChanged(I)V
    .registers 2
    .param p1, "newState"    # I

    .prologue
    .line 509
    return-void
.end method

.method protected onFragmentChanged()V
    .registers 1

    .prologue
    .line 486
    invoke-virtual {p0}, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;->notifyStateChanged()V

    .line 487
    return-void
.end method

.method public onNavigationClick()V
    .registers 1

    .prologue
    .line 473
    return-void
.end method

.method protected shouldSyncDrawerSlidingProgress()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 479
    iget-object v1, p0, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->getBackStackEntryCount()I

    move-result v1

    if-le v1, v0, :cond_a

    .line 480
    const/4 v0, 0x0

    .line 482
    :cond_a
    return v0
.end method
