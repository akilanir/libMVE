.class Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$1;
.super Ljava/lang/Object;
.source "ClickListenerHelper.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper;->listen(Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/view/View;Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$OnClickListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper;

.field final synthetic val$onClickListener:Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$OnClickListener;

.field final synthetic val$viewHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;


# direct methods
.method constructor <init>(Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper;Landroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$OnClickListener;)V
    .registers 4
    .param p1, "this$0"    # Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper;

    .prologue
    .line 32
    .local p0, "this":Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$1;, "Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$1;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$1;->this$0:Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper;

    iput-object p2, p0, Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$1;->val$viewHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iput-object p3, p0, Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$1;->val$onClickListener:Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$OnClickListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 36
    .local p0, "this":Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$1;, "Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$1;"
    iget-object v2, p0, Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$1;->val$viewHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v1

    .line 38
    .local v1, "pos":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_18

    .line 40
    iget-object v2, p0, Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$1;->this$0:Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper;

    # getter for: Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;
    invoke-static {v2}, Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper;->access$000(Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper;)Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/mikepenz/fastadapter/FastAdapter;->getItem(I)Lcom/mikepenz/fastadapter/IItem;

    move-result-object v0

    .line 41
    .local v0, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    iget-object v2, p0, Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$1;->val$onClickListener:Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$OnClickListener;

    invoke-interface {v2, p1, v1, v0}, Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$OnClickListener;->onClick(Landroid/view/View;ILcom/mikepenz/fastadapter/IItem;)V

    .line 43
    .end local v0    # "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    :cond_18
    return-void
.end method
