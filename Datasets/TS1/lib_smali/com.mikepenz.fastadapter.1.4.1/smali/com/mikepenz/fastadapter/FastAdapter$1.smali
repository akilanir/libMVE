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
    .line 333
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter$1;, "Lcom/mikepenz/fastadapter/FastAdapter$1;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    iput-object p2, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 11
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 336
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter$1;, "Lcom/mikepenz/fastadapter/FastAdapter$1;"
    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v4

    .line 337
    .local v4, "pos":I
    const/4 v6, -0x1

    if-eq v4, v6, :cond_c6

    .line 338
    const/4 v0, 0x0

    .line 339
    .local v0, "consumed":Z
    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v6, v4}, Lcom/mikepenz/fastadapter/FastAdapter;->getRelativeInfo(I)Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;

    move-result-object v5

    .line 340
    .local v5, "relativeInfo":Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;, "Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo<TItem;>;"
    iget-object v3, v5, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->item:Lcom/mikepenz/fastadapter/IItem;

    .line 341
    .local v3, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    if-eqz v3, :cond_c6

    invoke-interface {v3}, Lcom/mikepenz/fastadapter/IItem;->isEnabled()Z

    move-result v6

    if-eqz v6, :cond_c6

    .line 343
    instance-of v6, v3, Lcom/mikepenz/fastadapter/IClickable;

    if-eqz v6, :cond_34

    move-object v6, v3

    check-cast v6, Lcom/mikepenz/fastadapter/IClickable;

    invoke-interface {v6}, Lcom/mikepenz/fastadapter/IClickable;->getOnPreItemClickListener()Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;

    move-result-object v6

    if-eqz v6, :cond_34

    move-object v6, v3

    .line 344
    check-cast v6, Lcom/mikepenz/fastadapter/IClickable;

    invoke-interface {v6}, Lcom/mikepenz/fastadapter/IClickable;->getOnPreItemClickListener()Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;

    move-result-object v6

    iget-object v7, v5, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->adapter:Lcom/mikepenz/fastadapter/IAdapter;

    invoke-interface {v6, p1, v7, v3, v4}, Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;->onClick(Landroid/view/View;Lcom/mikepenz/fastadapter/IAdapter;Lcom/mikepenz/fastadapter/IItem;I)Z

    move-result v0

    .line 348
    :cond_34
    if-nez v0, :cond_4a

    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    # getter for: Lcom/mikepenz/fastadapter/FastAdapter;->mOnPreClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;
    invoke-static {v6}, Lcom/mikepenz/fastadapter/FastAdapter;->access$000(Lcom/mikepenz/fastadapter/FastAdapter;)Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;

    move-result-object v6

    if-eqz v6, :cond_4a

    .line 349
    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    # getter for: Lcom/mikepenz/fastadapter/FastAdapter;->mOnPreClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;
    invoke-static {v6}, Lcom/mikepenz/fastadapter/FastAdapter;->access$000(Lcom/mikepenz/fastadapter/FastAdapter;)Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;

    move-result-object v6

    iget-object v7, v5, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->adapter:Lcom/mikepenz/fastadapter/IAdapter;

    invoke-interface {v6, p1, v7, v3, v4}, Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;->onClick(Landroid/view/View;Lcom/mikepenz/fastadapter/IAdapter;Lcom/mikepenz/fastadapter/IItem;I)Z

    move-result v0

    .line 353
    :cond_4a
    if-nez v0, :cond_5e

    instance-of v6, v3, Lcom/mikepenz/fastadapter/IExpandable;

    if-eqz v6, :cond_5e

    move-object v6, v3

    .line 354
    check-cast v6, Lcom/mikepenz/fastadapter/IExpandable;

    invoke-interface {v6}, Lcom/mikepenz/fastadapter/IExpandable;->getSubItems()Ljava/util/List;

    move-result-object v6

    if-eqz v6, :cond_5e

    .line 355
    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v6, v4}, Lcom/mikepenz/fastadapter/FastAdapter;->toggleExpandable(I)V

    .line 360
    :cond_5e
    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    # getter for: Lcom/mikepenz/fastadapter/FastAdapter;->mOnlyOneExpandedItem:Z
    invoke-static {v6}, Lcom/mikepenz/fastadapter/FastAdapter;->access$100(Lcom/mikepenz/fastadapter/FastAdapter;)Z

    move-result v6

    if-eqz v6, :cond_80

    .line 361
    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v6}, Lcom/mikepenz/fastadapter/FastAdapter;->getExpandedItems()[I

    move-result-object v1

    .line 362
    .local v1, "expandedItems":[I
    array-length v6, v1

    add-int/lit8 v2, v6, -0x1

    .local v2, "i":I
    :goto_6f
    if-ltz v2, :cond_80

    .line 363
    aget v6, v1, v2

    if-eq v6, v4, :cond_7d

    .line 364
    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    aget v7, v1, v2

    const/4 v8, 0x1

    invoke-virtual {v6, v7, v8}, Lcom/mikepenz/fastadapter/FastAdapter;->collapse(IZ)V

    .line 362
    :cond_7d
    add-int/lit8 v2, v2, -0x1

    goto :goto_6f

    .line 370
    .end local v1    # "expandedItems":[I
    .end local v2    # "i":I
    :cond_80
    if-nez v0, :cond_97

    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    # getter for: Lcom/mikepenz/fastadapter/FastAdapter;->mSelectOnLongClick:Z
    invoke-static {v6}, Lcom/mikepenz/fastadapter/FastAdapter;->access$200(Lcom/mikepenz/fastadapter/FastAdapter;)Z

    move-result v6

    if-nez v6, :cond_97

    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    # getter for: Lcom/mikepenz/fastadapter/FastAdapter;->mSelectable:Z
    invoke-static {v6}, Lcom/mikepenz/fastadapter/FastAdapter;->access$300(Lcom/mikepenz/fastadapter/FastAdapter;)Z

    move-result v6

    if-eqz v6, :cond_97

    .line 371
    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    # invokes: Lcom/mikepenz/fastadapter/FastAdapter;->handleSelection(Landroid/view/View;Lcom/mikepenz/fastadapter/IItem;I)V
    invoke-static {v6, p1, v3, v4}, Lcom/mikepenz/fastadapter/FastAdapter;->access$400(Lcom/mikepenz/fastadapter/FastAdapter;Landroid/view/View;Lcom/mikepenz/fastadapter/IItem;I)V

    .line 375
    :cond_97
    instance-of v6, v3, Lcom/mikepenz/fastadapter/IClickable;

    if-eqz v6, :cond_b1

    move-object v6, v3

    check-cast v6, Lcom/mikepenz/fastadapter/IClickable;

    invoke-interface {v6}, Lcom/mikepenz/fastadapter/IClickable;->getOnItemClickListener()Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;

    move-result-object v6

    if-eqz v6, :cond_b1

    move-object v6, v3

    .line 376
    check-cast v6, Lcom/mikepenz/fastadapter/IClickable;

    invoke-interface {v6}, Lcom/mikepenz/fastadapter/IClickable;->getOnItemClickListener()Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;

    move-result-object v6

    iget-object v7, v5, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->adapter:Lcom/mikepenz/fastadapter/IAdapter;

    invoke-interface {v6, p1, v7, v3, v4}, Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;->onClick(Landroid/view/View;Lcom/mikepenz/fastadapter/IAdapter;Lcom/mikepenz/fastadapter/IItem;I)Z

    move-result v0

    .line 380
    :cond_b1
    if-nez v0, :cond_c6

    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    # getter for: Lcom/mikepenz/fastadapter/FastAdapter;->mOnClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;
    invoke-static {v6}, Lcom/mikepenz/fastadapter/FastAdapter;->access$500(Lcom/mikepenz/fastadapter/FastAdapter;)Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;

    move-result-object v6

    if-eqz v6, :cond_c6

    .line 381
    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter$1;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    # getter for: Lcom/mikepenz/fastadapter/FastAdapter;->mOnClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;
    invoke-static {v6}, Lcom/mikepenz/fastadapter/FastAdapter;->access$500(Lcom/mikepenz/fastadapter/FastAdapter;)Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;

    move-result-object v6

    iget-object v7, v5, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->adapter:Lcom/mikepenz/fastadapter/IAdapter;

    invoke-interface {v6, p1, v7, v3, v4}, Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;->onClick(Landroid/view/View;Lcom/mikepenz/fastadapter/IAdapter;Lcom/mikepenz/fastadapter/IItem;I)Z

    .line 385
    .end local v0    # "consumed":Z
    .end local v3    # "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    .end local v5    # "relativeInfo":Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;, "Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo<TItem;>;"
    :cond_c6
    return-void
.end method
