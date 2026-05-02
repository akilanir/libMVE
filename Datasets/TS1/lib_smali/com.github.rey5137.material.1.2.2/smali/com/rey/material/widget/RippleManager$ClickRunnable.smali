.class Lcom/rey/material/widget/RippleManager$ClickRunnable;
.super Ljava/lang/Object;
.source "RippleManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/RippleManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ClickRunnable"
.end annotation


# instance fields
.field mView:Landroid/view/View;

.field final synthetic this$0:Lcom/rey/material/widget/RippleManager;


# direct methods
.method public constructor <init>(Lcom/rey/material/widget/RippleManager;Landroid/view/View;)V
    .registers 3
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 119
    iput-object p1, p0, Lcom/rey/material/widget/RippleManager$ClickRunnable;->this$0:Lcom/rey/material/widget/RippleManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    iput-object p2, p0, Lcom/rey/material/widget/RippleManager$ClickRunnable;->mView:Landroid/view/View;

    .line 121
    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 125
    iget-object v0, p0, Lcom/rey/material/widget/RippleManager$ClickRunnable;->this$0:Lcom/rey/material/widget/RippleManager;

    const/4 v1, 0x0

    # setter for: Lcom/rey/material/widget/RippleManager;->mClickScheduled:Z
    invoke-static {v0, v1}, Lcom/rey/material/widget/RippleManager;->access$002(Lcom/rey/material/widget/RippleManager;Z)Z

    .line 126
    iget-object v0, p0, Lcom/rey/material/widget/RippleManager$ClickRunnable;->this$0:Lcom/rey/material/widget/RippleManager;

    iget-object v1, p0, Lcom/rey/material/widget/RippleManager$ClickRunnable;->mView:Landroid/view/View;

    # invokes: Lcom/rey/material/widget/RippleManager;->dispatchClickEvent(Landroid/view/View;)V
    invoke-static {v0, v1}, Lcom/rey/material/widget/RippleManager;->access$100(Lcom/rey/material/widget/RippleManager;Landroid/view/View;)V

    .line 127
    return-void
.end method
