.class Lcom/rey/material/app/ToolbarManager$1;
.super Ljava/lang/Object;
.source "ToolbarManager.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


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
    .line 61
    iput-object p1, p0, Lcom/rey/material/app/ToolbarManager$1;->this$0:Lcom/rey/material/app/ToolbarManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager$1;->this$0:Lcom/rey/material/app/ToolbarManager;

    # invokes: Lcom/rey/material/app/ToolbarManager;->onGlobalLayout()V
    invoke-static {v0}, Lcom/rey/material/app/ToolbarManager;->access$000(Lcom/rey/material/app/ToolbarManager;)V

    .line 65
    return-void
.end method
