.class Lcom/rey/material/app/ToolbarManager$BaseNavigationManager$2;
.super Ljava/lang/Object;
.source "ToolbarManager.java"

# interfaces
.implements Landroid/support/v4/app/FragmentManager$OnBackStackChangedListener;


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
    .line 459
    iput-object p1, p0, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager$2;->this$0:Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackStackChanged()V
    .registers 2

    .prologue
    .line 462
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager$2;->this$0:Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;

    invoke-virtual {v0}, Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;->onFragmentChanged()V

    .line 463
    return-void
.end method
