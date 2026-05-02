.class Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$2;
.super Ljava/lang/Object;
.source "BaseDrawerAdapter.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

.field final synthetic val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;


# direct methods
.method constructor <init>(Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 3
    .param p1, "this$0"    # Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    .prologue
    .line 220
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$2;->this$0:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    iput-object p2, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$2;->val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 223
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$2;->this$0:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    # getter for: Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mOnLongClickListener:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnLongClickListener;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->access$100(Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;)Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnLongClickListener;

    move-result-object v1

    if-eqz v1, :cond_1f

    .line 224
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$2;->val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v0

    .line 225
    .local v0, "pos":I
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$2;->this$0:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    # getter for: Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mOnLongClickListener:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnLongClickListener;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->access$100(Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;)Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnLongClickListener;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$2;->this$0:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v2, v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v2

    invoke-interface {v1, p1, v0, v2}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnLongClickListener;->onLongClick(Landroid/view/View;ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z

    move-result v1

    .line 227
    .end local v0    # "pos":I
    :goto_1e
    return v1

    :cond_1f
    const/4 v1, 0x0

    goto :goto_1e
.end method
