.class public abstract Lcom/rey/material/app/ToolbarManager$NavigationManager;
.super Ljava/lang/Object;
.source "ToolbarManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/ToolbarManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "NavigationManager"
.end annotation


# instance fields
.field protected mNavigationIcon:Lcom/rey/material/drawable/NavigationDrawerDrawable;

.field protected mToolbar:Landroid/support/v7/widget/Toolbar;


# direct methods
.method public constructor <init>(Lcom/rey/material/drawable/NavigationDrawerDrawable;Landroid/support/v7/widget/Toolbar;)V
    .registers 5
    .param p1, "navigationIcon"    # Lcom/rey/material/drawable/NavigationDrawerDrawable;
    .param p2, "toolbar"    # Landroid/support/v7/widget/Toolbar;

    .prologue
    .line 368
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 369
    iput-object p2, p0, Lcom/rey/material/app/ToolbarManager$NavigationManager;->mToolbar:Landroid/support/v7/widget/Toolbar;

    .line 370
    iput-object p1, p0, Lcom/rey/material/app/ToolbarManager$NavigationManager;->mNavigationIcon:Lcom/rey/material/drawable/NavigationDrawerDrawable;

    .line 371
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager$NavigationManager;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v1, p0, Lcom/rey/material/app/ToolbarManager$NavigationManager;->mNavigationIcon:Lcom/rey/material/drawable/NavigationDrawerDrawable;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 372
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager$NavigationManager;->mToolbar:Landroid/support/v7/widget/Toolbar;

    new-instance v1, Lcom/rey/material/app/ToolbarManager$NavigationManager$1;

    invoke-direct {v1, p0}, Lcom/rey/material/app/ToolbarManager$NavigationManager$1;-><init>(Lcom/rey/material/app/ToolbarManager$NavigationManager;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 378
    return-void
.end method


# virtual methods
.method public abstract isBackState()Z
.end method

.method public notifyStateChanged()V
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 402
    iget-object v2, p0, Lcom/rey/material/app/ToolbarManager$NavigationManager;->mNavigationIcon:Lcom/rey/material/drawable/NavigationDrawerDrawable;

    invoke-virtual {p0}, Lcom/rey/material/app/ToolbarManager$NavigationManager;->isBackState()Z

    move-result v0

    if-eqz v0, :cond_e

    move v0, v1

    :goto_a
    invoke-virtual {v2, v0, v1}, Lcom/rey/material/drawable/NavigationDrawerDrawable;->switchIconState(IZ)V

    .line 403
    return-void

    .line 402
    :cond_e
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public notifyStateInvalidated()V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 395
    iget-object v2, p0, Lcom/rey/material/app/ToolbarManager$NavigationManager;->mNavigationIcon:Lcom/rey/material/drawable/NavigationDrawerDrawable;

    invoke-virtual {p0}, Lcom/rey/material/app/ToolbarManager$NavigationManager;->isBackState()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_a
    invoke-virtual {v2, v0, v1}, Lcom/rey/material/drawable/NavigationDrawerDrawable;->switchIconState(IZ)V

    .line 396
    return-void

    :cond_e
    move v0, v1

    .line 395
    goto :goto_a
.end method

.method public notifyStateProgressChanged(ZF)V
    .registers 5
    .param p1, "isBackState"    # Z
    .param p2, "progress"    # F

    .prologue
    .line 411
    iget-object v1, p0, Lcom/rey/material/app/ToolbarManager$NavigationManager;->mNavigationIcon:Lcom/rey/material/drawable/NavigationDrawerDrawable;

    if-eqz p1, :cond_9

    const/4 v0, 0x1

    :goto_5
    invoke-virtual {v1, v0, p2}, Lcom/rey/material/drawable/NavigationDrawerDrawable;->setIconState(IF)Z

    .line 412
    return-void

    .line 411
    :cond_9
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public abstract onNavigationClick()V
.end method
