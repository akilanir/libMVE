.class Lcom/rey/material/app/ToolbarManager$BaseNavigationManager$1;
.super Ljava/lang/Object;
.source "ToolbarManager.java"

# interfaces
.implements Landroid/support/v4/widget/DrawerLayout$DrawerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;-><init>(ILandroid/support/v4/app/FragmentManager;Landroid/support/v7/widget/Toolbar;Landroid/support/v4/widget/DrawerLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;


# direct methods
.method constructor <init>(Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;)V
    .registers 2

    .prologue
    .line 435
    iput-object p1, p0, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager$1;->this$0:Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDrawerClosed(Landroid/view/View;)V
    .registers 3
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    .line 449
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager$1;->this$0:Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;->onDrawerClosed(Landroid/view/View;)V

    .line 450
    return-void
.end method

.method public onDrawerOpened(Landroid/view/View;)V
    .registers 3
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    .line 444
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager$1;->this$0:Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;->onDrawerOpened(Landroid/view/View;)V

    .line 445
    return-void
.end method

.method public onDrawerSlide(Landroid/view/View;F)V
    .registers 4
    .param p1, "drawerView"    # Landroid/view/View;
    .param p2, "slideOffset"    # F

    .prologue
    .line 439
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager$1;->this$0:Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;->onDrawerSlide(Landroid/view/View;F)V

    .line 440
    return-void
.end method

.method public onDrawerStateChanged(I)V
    .registers 3
    .param p1, "newState"    # I

    .prologue
    .line 454
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager$1;->this$0:Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;->onDrawerStateChanged(I)V

    .line 455
    return-void
.end method
