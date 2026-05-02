.class public Lcom/nononsenseapps/filepicker/FileItemAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "FileItemAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mList:Landroid/support/v7/util/SortedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v7/util/SortedList",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final mLogic:Lcom/nononsenseapps/filepicker/LogicHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nononsenseapps/filepicker/LogicHandler",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/nononsenseapps/filepicker/LogicHandler;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nononsenseapps/filepicker/LogicHandler",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 33
    .local p0, "this":Lcom/nononsenseapps/filepicker/FileItemAdapter;, "Lcom/nononsenseapps/filepicker/FileItemAdapter<TT;>;"
    .local p1, "logic":Lcom/nononsenseapps/filepicker/LogicHandler;, "Lcom/nononsenseapps/filepicker/LogicHandler<TT;>;"
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 31
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/FileItemAdapter;->mList:Landroid/support/v7/util/SortedList;

    .line 34
    iput-object p1, p0, Lcom/nononsenseapps/filepicker/FileItemAdapter;->mLogic:Lcom/nononsenseapps/filepicker/LogicHandler;

    .line 35
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .registers 2

    .prologue
    .line 70
    .local p0, "this":Lcom/nononsenseapps/filepicker/FileItemAdapter;, "Lcom/nononsenseapps/filepicker/FileItemAdapter<TT;>;"
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/FileItemAdapter;->mList:Landroid/support/v7/util/SortedList;

    if-nez v0, :cond_6

    .line 71
    const/4 v0, 0x0

    .line 75
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/FileItemAdapter;->mList:Landroid/support/v7/util/SortedList;

    invoke-virtual {v0}, Landroid/support/v7/util/SortedList;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_5
.end method

.method public getItemViewType(I)I
    .registers 5
    .param p1, "headerPosition"    # I

    .prologue
    .line 60
    .local p0, "this":Lcom/nononsenseapps/filepicker/FileItemAdapter;, "Lcom/nononsenseapps/filepicker/FileItemAdapter<TT;>;"
    if-nez p1, :cond_4

    .line 61
    const/4 v1, 0x0

    .line 64
    :goto_3
    return v1

    .line 63
    :cond_4
    add-int/lit8 v0, p1, -0x1

    .line 64
    .local v0, "pos":I
    iget-object v1, p0, Lcom/nononsenseapps/filepicker/FileItemAdapter;->mLogic:Lcom/nononsenseapps/filepicker/LogicHandler;

    iget-object v2, p0, Lcom/nononsenseapps/filepicker/FileItemAdapter;->mList:Landroid/support/v7/util/SortedList;

    invoke-virtual {v2, v0}, Landroid/support/v7/util/SortedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Lcom/nononsenseapps/filepicker/LogicHandler;->getItemViewType(ILjava/lang/Object;)I

    move-result v1

    goto :goto_3
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 6
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "headerPosition"    # I

    .prologue
    .line 50
    .local p0, "this":Lcom/nononsenseapps/filepicker/FileItemAdapter;, "Lcom/nononsenseapps/filepicker/FileItemAdapter<TT;>;"
    if-nez p2, :cond_a

    .line 51
    iget-object v1, p0, Lcom/nononsenseapps/filepicker/FileItemAdapter;->mLogic:Lcom/nononsenseapps/filepicker/LogicHandler;

    check-cast p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;

    .end local p1    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-interface {v1, p1}, Lcom/nononsenseapps/filepicker/LogicHandler;->onBindHeaderViewHolder(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;)V

    .line 56
    :goto_9
    return-void

    .line 53
    .restart local p1    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_a
    add-int/lit8 v0, p2, -0x1

    .line 54
    .local v0, "pos":I
    iget-object v1, p0, Lcom/nononsenseapps/filepicker/FileItemAdapter;->mLogic:Lcom/nononsenseapps/filepicker/LogicHandler;

    check-cast p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;

    .end local p1    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    iget-object v2, p0, Lcom/nononsenseapps/filepicker/FileItemAdapter;->mList:Landroid/support/v7/util/SortedList;

    invoke-virtual {v2, v0}, Landroid/support/v7/util/SortedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, p1, v0, v2}, Lcom/nononsenseapps/filepicker/LogicHandler;->onBindViewHolder(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;ILjava/lang/Object;)V

    goto :goto_9
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 44
    .local p0, "this":Lcom/nononsenseapps/filepicker/FileItemAdapter;, "Lcom/nononsenseapps/filepicker/FileItemAdapter<TT;>;"
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/FileItemAdapter;->mLogic:Lcom/nononsenseapps/filepicker/LogicHandler;

    invoke-interface {v0, p1, p2}, Lcom/nononsenseapps/filepicker/LogicHandler;->onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public setList(Landroid/support/v7/util/SortedList;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v7/util/SortedList",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p0, "this":Lcom/nononsenseapps/filepicker/FileItemAdapter;, "Lcom/nononsenseapps/filepicker/FileItemAdapter<TT;>;"
    .local p1, "list":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    iput-object p1, p0, Lcom/nononsenseapps/filepicker/FileItemAdapter;->mList:Landroid/support/v7/util/SortedList;

    .line 39
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/FileItemAdapter;->notifyDataSetChanged()V

    .line 40
    return-void
.end method
