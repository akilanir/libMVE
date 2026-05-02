.class Lcom/github/clans/fab/FloatingActionMenu$6;
.super Ljava/lang/Object;
.source "FloatingActionMenu.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/clans/fab/FloatingActionMenu;->close(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/clans/fab/FloatingActionMenu;

.field final synthetic val$animate:Z

.field final synthetic val$fab:Lcom/github/clans/fab/FloatingActionButton;


# direct methods
.method constructor <init>(Lcom/github/clans/fab/FloatingActionMenu;Lcom/github/clans/fab/FloatingActionButton;Z)V
    .registers 4
    .param p1, "this$0"    # Lcom/github/clans/fab/FloatingActionMenu;

    .prologue
    .line 636
    iput-object p1, p0, Lcom/github/clans/fab/FloatingActionMenu$6;->this$0:Lcom/github/clans/fab/FloatingActionMenu;

    iput-object p2, p0, Lcom/github/clans/fab/FloatingActionMenu$6;->val$fab:Lcom/github/clans/fab/FloatingActionButton;

    iput-boolean p3, p0, Lcom/github/clans/fab/FloatingActionMenu$6;->val$animate:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 639
    iget-object v1, p0, Lcom/github/clans/fab/FloatingActionMenu$6;->val$fab:Lcom/github/clans/fab/FloatingActionButton;

    iget-boolean v2, p0, Lcom/github/clans/fab/FloatingActionMenu$6;->val$animate:Z

    invoke-virtual {v1, v2}, Lcom/github/clans/fab/FloatingActionButton;->hide(Z)V

    .line 640
    iget-object v1, p0, Lcom/github/clans/fab/FloatingActionMenu$6;->val$fab:Lcom/github/clans/fab/FloatingActionButton;

    sget v2, Lcom/github/clans/fab/R$id;->fab_label:I

    invoke-virtual {v1, v2}, Lcom/github/clans/fab/FloatingActionButton;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/clans/fab/Label;

    .line 641
    .local v0, "label":Lcom/github/clans/fab/Label;
    if-eqz v0, :cond_18

    .line 642
    iget-boolean v1, p0, Lcom/github/clans/fab/FloatingActionMenu$6;->val$animate:Z

    invoke-virtual {v0, v1}, Lcom/github/clans/fab/Label;->hide(Z)V

    .line 644
    :cond_18
    return-void
.end method
