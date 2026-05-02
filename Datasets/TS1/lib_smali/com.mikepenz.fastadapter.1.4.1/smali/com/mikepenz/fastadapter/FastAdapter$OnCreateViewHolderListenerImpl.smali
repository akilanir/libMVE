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
    .line 1316
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
    .line 1337
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListenerImpl;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>.OnCreateViewHolderListenerImpl;"
    return-object p1
.end method

.method public onPreCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 1326
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListenerImpl;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>.OnCreateViewHolderListenerImpl;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListenerImpl;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p2}, Lcom/mikepenz/fastadapter/FastAdapter;->getTypeInstance(I)Lcom/mikepenz/fastadapter/IItem;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/mikepenz/fastadapter/IItem;->getViewHolder(Landroid/view/ViewGroup;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method
