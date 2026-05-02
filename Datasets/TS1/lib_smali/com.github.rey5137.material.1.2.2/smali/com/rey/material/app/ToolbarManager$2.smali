.class Lcom/rey/material/app/ToolbarManager$2;
.super Ljava/lang/Object;
.source "ToolbarManager.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/ToolbarManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/app/ToolbarManager;


# direct methods
.method constructor <init>(Lcom/rey/material/app/ToolbarManager;)V
    .registers 2

    .prologue
    .line 70
    iput-object p1, p0, Lcom/rey/material/app/ToolbarManager$2;->this$0:Lcom/rey/material/app/ToolbarManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 3
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager$2;->this$0:Lcom/rey/material/app/ToolbarManager;

    # getter for: Lcom/rey/material/app/ToolbarManager;->mAppCompatDelegate:Landroid/support/v7/app/AppCompatDelegate;
    invoke-static {v0}, Lcom/rey/material/app/ToolbarManager;->access$100(Lcom/rey/material/app/ToolbarManager;)Landroid/support/v7/app/AppCompatDelegate;

    move-result-object v0

    if-eqz v0, :cond_12

    .line 78
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager$2;->this$0:Lcom/rey/material/app/ToolbarManager;

    # getter for: Lcom/rey/material/app/ToolbarManager;->mAppCompatDelegate:Landroid/support/v7/app/AppCompatDelegate;
    invoke-static {v0}, Lcom/rey/material/app/ToolbarManager;->access$100(Lcom/rey/material/app/ToolbarManager;)Landroid/support/v7/app/AppCompatDelegate;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AppCompatDelegate;->invalidateOptionsMenu()V

    .line 81
    :goto_11
    return-void

    .line 80
    :cond_12
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager$2;->this$0:Lcom/rey/material/app/ToolbarManager;

    invoke-virtual {v0}, Lcom/rey/material/app/ToolbarManager;->onPrepareMenu()V

    goto :goto_11
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 85
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 73
    return-void
.end method
