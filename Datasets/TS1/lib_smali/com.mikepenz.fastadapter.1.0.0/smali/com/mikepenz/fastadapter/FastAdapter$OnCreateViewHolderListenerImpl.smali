.class public Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListenerImpl;
.super Ljava/lang/Object;
.source "FastAdapter.java"

# interfaces
.implements Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/fastadapter/FastAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "OnCreateViewHolderListenerImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/fastadapter/FastAdapter;


# direct methods
.method public constructor <init>(Lcom/mikepenz/fastadapter/FastAdapter;)V
    .registers 2
    .param p1, "this$0"    # Lcom/mikepenz/fastadapter/FastAdapter;

    .prologue
    .line 1124
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListenerImpl;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>.OnCreateViewHolderListenerImpl;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListenerImpl;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPostCreateViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 2
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 1145
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListenerImpl;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>.OnCreateViewHolderListenerImpl;"
    return-object p1
.end method

.method public onPreCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 5
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 1134
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListenerImpl;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>.OnCreateViewHolderListenerImpl;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListenerImpl;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    # getter for: Lcom/mikepenz/fastadapter/FastAdapter;->mTypeInstances:Landroid/support/v4/util/ArrayMap;
    invoke-static {v0}, Lcom/mikepenz/fastadapter/FastAdapter;->access$700(Lcom/mikepenz/fastadapter/FastAdapter;)Landroid/support/v4/util/ArrayMap;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/fastadapter/IItem;

    invoke-interface {v0, p1}, Lcom/mikepenz/fastadapter/IItem;->getViewHolder(Landroid/view/ViewGroup;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method
