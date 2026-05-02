.class Lcom/mikepenz/fastadapter/FastAdapter$3;
.super Ljava/lang/Object;
.source "FastAdapter.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


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
    .line 419
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter$3;, "Lcom/mikepenz/fastadapter/FastAdapter$3;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/FastAdapter$3;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    iput-object p2, p0, Lcom/mikepenz/fastadapter/FastAdapter$3;->val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 10
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 422
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter$3;, "Lcom/mikepenz/fastadapter/FastAdapter$3;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter$3;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    # getter for: Lcom/mikepenz/fastadapter/FastAdapter;->mOnTouchListener:Lcom/mikepenz/fastadapter/FastAdapter$OnTouchListener;
    invoke-static {v0}, Lcom/mikepenz/fastadapter/FastAdapter;->access$800(Lcom/mikepenz/fastadapter/FastAdapter;)Lcom/mikepenz/fastadapter/FastAdapter$OnTouchListener;

    move-result-object v0

    if-eqz v0, :cond_28

    .line 423
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter$3;->val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v5

    .line 424
    .local v5, "pos":I
    const/4 v0, -0x1

    if-eq v5, v0, :cond_28

    .line 425
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter$3;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, v5}, Lcom/mikepenz/fastadapter/FastAdapter;->getRelativeInfo(I)Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;

    move-result-object v6

    .line 426
    .local v6, "relativeInfo":Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;, "Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter$3;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    # getter for: Lcom/mikepenz/fastadapter/FastAdapter;->mOnTouchListener:Lcom/mikepenz/fastadapter/FastAdapter$OnTouchListener;
    invoke-static {v0}, Lcom/mikepenz/fastadapter/FastAdapter;->access$800(Lcom/mikepenz/fastadapter/FastAdapter;)Lcom/mikepenz/fastadapter/FastAdapter$OnTouchListener;

    move-result-object v0

    iget-object v3, v6, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->adapter:Lcom/mikepenz/fastadapter/IAdapter;

    iget-object v4, v6, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->item:Lcom/mikepenz/fastadapter/IItem;

    move-object v1, p1

    move-object v2, p2

    invoke-interface/range {v0 .. v5}, Lcom/mikepenz/fastadapter/FastAdapter$OnTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;Lcom/mikepenz/fastadapter/IAdapter;Lcom/mikepenz/fastadapter/IItem;I)Z

    move-result v0

    .line 429
    .end local v5    # "pos":I
    .end local v6    # "relativeInfo":Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;, "Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo<TItem;>;"
    :goto_27
    return v0

    :cond_28
    const/4 v0, 0x0

    goto :goto_27
.end method
