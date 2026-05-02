.class Lcom/rey/material/widget/ListView$1;
.super Ljava/lang/Object;
.source "ListView.java"

# interfaces
.implements Landroid/widget/AbsListView$RecyclerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/widget/ListView;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/ListView;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/ListView;)V
    .registers 2

    .prologue
    .line 44
    iput-object p1, p0, Lcom/rey/material/widget/ListView$1;->this$0:Lcom/rey/material/widget/ListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMovedToScrapHeap(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 48
    invoke-static {p1}, Lcom/rey/material/widget/RippleManager;->cancelRipple(Landroid/view/View;)V

    .line 50
    iget-object v0, p0, Lcom/rey/material/widget/ListView$1;->this$0:Lcom/rey/material/widget/ListView;

    # getter for: Lcom/rey/material/widget/ListView;->mRecyclerListener:Landroid/widget/AbsListView$RecyclerListener;
    invoke-static {v0}, Lcom/rey/material/widget/ListView;->access$000(Lcom/rey/material/widget/ListView;)Landroid/widget/AbsListView$RecyclerListener;

    move-result-object v0

    if-eqz v0, :cond_14

    .line 51
    iget-object v0, p0, Lcom/rey/material/widget/ListView$1;->this$0:Lcom/rey/material/widget/ListView;

    # getter for: Lcom/rey/material/widget/ListView;->mRecyclerListener:Landroid/widget/AbsListView$RecyclerListener;
    invoke-static {v0}, Lcom/rey/material/widget/ListView;->access$000(Lcom/rey/material/widget/ListView;)Landroid/widget/AbsListView$RecyclerListener;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/widget/AbsListView$RecyclerListener;->onMovedToScrapHeap(Landroid/view/View;)V

    .line 52
    :cond_14
    return-void
.end method
