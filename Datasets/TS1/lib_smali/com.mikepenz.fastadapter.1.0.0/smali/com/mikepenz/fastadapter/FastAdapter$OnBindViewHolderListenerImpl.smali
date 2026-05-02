.class public Lcom/mikepenz/fastadapter/FastAdapter$OnBindViewHolderListenerImpl;
.super Ljava/lang/Object;
.source "FastAdapter.java"

# interfaces
.implements Lcom/mikepenz/fastadapter/FastAdapter$OnBindViewHolderListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/fastadapter/FastAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "OnBindViewHolderListenerImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/fastadapter/FastAdapter;


# direct methods
.method public constructor <init>(Lcom/mikepenz/fastadapter/FastAdapter;)V
    .registers 2
    .param p1, "this$0"    # Lcom/mikepenz/fastadapter/FastAdapter;

    .prologue
    .line 1159
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter$OnBindViewHolderListenerImpl;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>.OnBindViewHolderListenerImpl;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/FastAdapter$OnBindViewHolderListenerImpl;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 4
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 1168
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter$OnBindViewHolderListenerImpl;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>.OnBindViewHolderListenerImpl;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter$OnBindViewHolderListenerImpl;->this$0:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p2}, Lcom/mikepenz/fastadapter/FastAdapter;->getItem(I)Lcom/mikepenz/fastadapter/IItem;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/mikepenz/fastadapter/IItem;->bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 1169
    return-void
.end method
