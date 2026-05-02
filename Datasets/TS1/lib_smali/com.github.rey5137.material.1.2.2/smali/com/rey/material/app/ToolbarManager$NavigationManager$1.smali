.class Lcom/rey/material/app/ToolbarManager$NavigationManager$1;
.super Ljava/lang/Object;
.source "ToolbarManager.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/app/ToolbarManager$NavigationManager;-><init>(Lcom/rey/material/drawable/NavigationDrawerDrawable;Landroid/support/v7/widget/Toolbar;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/app/ToolbarManager$NavigationManager;


# direct methods
.method constructor <init>(Lcom/rey/material/app/ToolbarManager$NavigationManager;)V
    .registers 2

    .prologue
    .line 372
    iput-object p1, p0, Lcom/rey/material/app/ToolbarManager$NavigationManager$1;->this$0:Lcom/rey/material/app/ToolbarManager$NavigationManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 375
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager$NavigationManager$1;->this$0:Lcom/rey/material/app/ToolbarManager$NavigationManager;

    invoke-virtual {v0}, Lcom/rey/material/app/ToolbarManager$NavigationManager;->onNavigationClick()V

    .line 376
    return-void
.end method
