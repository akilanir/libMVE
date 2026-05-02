.class Lcom/mikepenz/fastadapter/FastAdapter$1;
.super Ljava/lang/Object;
.source "FastAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/fastadapter/FastAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/fastadapter/FastAdapter;

.field final synthetic val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;


# direct methods
.method constructor <init>(Lcom/mikepenz/fastadapter/FastAdapter;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 3
    .param p1, "this$0"    # Lcom/mikepenz/fastadapter/FastAdapter;

    .prologue
    .line 289
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter$1;, "Lcom/mikepenz/fastadapter/FastAdapter$1;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    iput-object p2, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 8
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 292
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter$1;, "Lcom/mikepenz/fastadapter/FastAdapter$1;"
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v1

    .line 293
    .local v1, "pos":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_58

    .line 294
    const/4 v0, 0x0

    .line 295
    .local v0, "consumed":Z
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v3, v1}, Lcom/mikepenz/fastadapter/FastAdapter;->getRelativeInfo(I)Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;

    move-result-object v2

    .line 296
    .local v2, "relativeInfo":Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;, "Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo<TItem;>;"
    iget-object v3, v2, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->item:Lcom/mikepenz/fastadapter/IItem;

    if-eqz v3, :cond_58

    iget-object v3, v2, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->item:Lcom/mikepenz/fastadapter/IItem;

    invoke-interface {v3}, Lcom/mikepenz/fastadapter/IItem;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_58

    .line 298
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    # getter for: Lcom/mikepenz/fastadapter/FastAdapter;->mOnPreClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;
    invoke-static {v3}, Lcom/mikepenz/fastadapter/FastAdapter;->access$000(Lcom/mikepenz/fastadapter/FastAdapter;)Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;

    move-result-object v3

    if-eqz v3, :cond_32

    .line 299
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    # getter for: Lcom/mikepenz/fastadapter/FastAdapter;->mOnPreClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;
    invoke-static {v3}, Lcom/mikepenz/fastadapter/FastAdapter;->access$000(Lcom/mikepenz/fastadapter/FastAdapter;)Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;

    move-result-object v3

    iget-object v4, v2, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->adapter:Lcom/mikepenz/fastadapter/IAdapter;

    iget-object v5, v2, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->item:Lcom/mikepenz/fastadapter/IItem;

    invoke-interface {v3, p1, v4, v5, v1}, Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;->onClick(Landroid/view/View;Lcom/mikepenz/fastadapter/IAdapter;Lcom/mikepenz/fastadapter/IItem;I)Z

    move-result v0

    .line 302
    :cond_32
    if-nez v0, :cond_43

    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    # getter for: Lcom/mikepenz/fastadapter/FastAdapter;->mSelectOnLongClick:Z
    invoke-static {v3}, Lcom/mikepenz/fastadapter/FastAdapter;->access$100(Lcom/mikepenz/fastadapter/FastAdapter;)Z

    move-result v3

    if-nez v3, :cond_43

    .line 303
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    iget-object v4, v2, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->item:Lcom/mikepenz/fastadapter/IItem;

    # invokes: Lcom/mikepenz/fastadapter/FastAdapter;->handleSelection(Landroid/view/View;Lcom/mikepenz/fastadapter/IItem;I)V
    invoke-static {v3, p1, v4, v1}, Lcom/mikepenz/fastadapter/FastAdapter;->access$200(Lcom/mikepenz/fastadapter/FastAdapter;Landroid/view/View;Lcom/mikepenz/fastadapter/IItem;I)V

    .line 307
    :cond_43
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    # getter for: Lcom/mikepenz/fastadapter/FastAdapter;->mOnClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;
    invoke-static {v3}, Lcom/mikepenz/fastadapter/FastAdapter;->access$300(Lcom/mikepenz/fastadapter/FastAdapter;)Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;

    move-result-object v3

    if-eqz v3, :cond_58

    .line 308
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    # getter for: Lcom/mikepenz/fastadapter/FastAdapter;->mOnClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;
    invoke-static {v3}, Lcom/mikepenz/fastadapter/FastAdapter;->access$300(Lcom/mikepenz/fastadapter/FastAdapter;)Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;

    move-result-object v3

    iget-object v4, v2, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->adapter:Lcom/mikepenz/fastadapter/IAdapter;

    iget-object v5, v2, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->item:Lcom/mikepenz/fastadapter/IItem;

    invoke-interface {v3, p1, v4, v5, v1}, Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;->onClick(Landroid/view/View;Lcom/mikepenz/fastadapter/IAdapter;Lcom/mikepenz/fastadapter/IItem;I)Z

    .line 312
    .end local v0    # "consumed":Z
    .end local v2    # "relativeInfo":Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;, "Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo<TItem;>;"
    :cond_58
    return-void
.end method
