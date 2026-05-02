.class public Lcom/rey/material/app/ToolbarManager$ThemableNavigationManager;
.super Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;
.source "ToolbarManager.java"

# interfaces
.implements Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/ToolbarManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ThemableNavigationManager"
.end annotation


# instance fields
.field private mCurrentStyle:I

.field private mStyleId:I


# direct methods
.method public constructor <init>(ILandroid/support/v4/app/FragmentManager;Landroid/support/v7/widget/Toolbar;Landroid/support/v4/widget/DrawerLayout;)V
    .registers 6
    .param p1, "styleId"    # I
    .param p2, "fragmentManager"    # Landroid/support/v4/app/FragmentManager;
    .param p3, "toolbar"    # Landroid/support/v7/widget/Toolbar;
    .param p4, "drawerLayout"    # Landroid/support/v4/widget/DrawerLayout;

    .prologue
    .line 527
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/rey/material/app/ThemeManager;->getCurrentStyle(I)I

    move-result v0

    invoke-direct {p0, v0, p2, p3, p4}, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;-><init>(ILandroid/support/v4/app/FragmentManager;Landroid/support/v7/widget/Toolbar;Landroid/support/v4/widget/DrawerLayout;)V

    .line 528
    iput p1, p0, Lcom/rey/material/app/ToolbarManager$ThemableNavigationManager;->mStyleId:I

    .line 529
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/rey/material/app/ThemeManager;->getCurrentStyle(I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/ToolbarManager$ThemableNavigationManager;->mCurrentStyle:I

    .line 530
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->registerOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 531
    return-void
.end method


# virtual methods
.method public onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V
    .registers 7
    .param p1, "event"    # Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 535
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v2

    iget v3, p0, Lcom/rey/material/app/ToolbarManager$ThemableNavigationManager;->mStyleId:I

    invoke-virtual {v2, v3}, Lcom/rey/material/app/ThemeManager;->getCurrentStyle(I)I

    move-result v1

    .line 536
    .local v1, "style":I
    iget v2, p0, Lcom/rey/material/app/ToolbarManager$ThemableNavigationManager;->mCurrentStyle:I

    if-eq v2, v1, :cond_34

    .line 537
    iput v1, p0, Lcom/rey/material/app/ToolbarManager$ThemableNavigationManager;->mCurrentStyle:I

    .line 538
    new-instance v2, Lcom/rey/material/drawable/NavigationDrawerDrawable$Builder;

    iget-object v3, p0, Lcom/rey/material/app/ToolbarManager$ThemableNavigationManager;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v3}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v3

    iget v4, p0, Lcom/rey/material/app/ToolbarManager$ThemableNavigationManager;->mCurrentStyle:I

    invoke-direct {v2, v3, v4}, Lcom/rey/material/drawable/NavigationDrawerDrawable$Builder;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v2}, Lcom/rey/material/drawable/NavigationDrawerDrawable$Builder;->build()Lcom/rey/material/drawable/NavigationDrawerDrawable;

    move-result-object v0

    .line 539
    .local v0, "drawable":Lcom/rey/material/drawable/NavigationDrawerDrawable;
    iget-object v2, p0, Lcom/rey/material/app/ToolbarManager$ThemableNavigationManager;->mNavigationIcon:Lcom/rey/material/drawable/NavigationDrawerDrawable;

    invoke-virtual {v2}, Lcom/rey/material/drawable/NavigationDrawerDrawable;->getIconState()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/rey/material/drawable/NavigationDrawerDrawable;->switchIconState(IZ)V

    .line 540
    iput-object v0, p0, Lcom/rey/material/app/ToolbarManager$ThemableNavigationManager;->mNavigationIcon:Lcom/rey/material/drawable/NavigationDrawerDrawable;

    .line 541
    iget-object v2, p0, Lcom/rey/material/app/ToolbarManager$ThemableNavigationManager;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v3, p0, Lcom/rey/material/app/ToolbarManager$ThemableNavigationManager;->mNavigationIcon:Lcom/rey/material/drawable/NavigationDrawerDrawable;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 543
    .end local v0    # "drawable":Lcom/rey/material/drawable/NavigationDrawerDrawable;
    :cond_34
    return-void
.end method
