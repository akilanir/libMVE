.class public abstract Lcom/nhaarman/listviewanimations/ArrayAdapter;
.super Landroid/widget/BaseAdapter;
.source "ArrayAdapter.java"

# interfaces
.implements Lcom/nhaarman/listviewanimations/util/Swappable;
.implements Lcom/nhaarman/listviewanimations/util/Insertable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/widget/BaseAdapter;",
        "Lcom/nhaarman/listviewanimations/util/Swappable;",
        "Lcom/nhaarman/listviewanimations/util/Insertable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private mDataSetChangedSlavedAdapter:Landroid/widget/BaseAdapter;

.field private final mItems:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 47
    .local p0, "this":Lcom/nhaarman/listviewanimations/ArrayAdapter;, "Lcom/nhaarman/listviewanimations/ArrayAdapter<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/nhaarman/listviewanimations/ArrayAdapter;-><init>(Ljava/util/List;)V

    .line 48
    return-void
.end method

.method protected constructor <init>(Ljava/util/List;)V
    .registers 3
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 53
    .local p0, "this":Lcom/nhaarman/listviewanimations/ArrayAdapter;, "Lcom/nhaarman/listviewanimations/ArrayAdapter<TT;>;"
    .local p1, "objects":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 54
    if-eqz p1, :cond_8

    .line 55
    iput-object p1, p0, Lcom/nhaarman/listviewanimations/ArrayAdapter;->mItems:Ljava/util/List;

    .line 59
    :goto_7
    return-void

    .line 57
    :cond_8
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nhaarman/listviewanimations/ArrayAdapter;->mItems:Ljava/util/List;

    goto :goto_7
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .registers 4
    .param p1, "index"    # I
    .param p2    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .prologue
    .line 100
    .local p0, "this":Lcom/nhaarman/listviewanimations/ArrayAdapter;, "Lcom/nhaarman/listviewanimations/ArrayAdapter<TT;>;"
    .local p2, "item":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/ArrayAdapter;->mItems:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 101
    invoke-virtual {p0}, Lcom/nhaarman/listviewanimations/ArrayAdapter;->notifyDataSetChanged()V

    .line 102
    return-void
.end method

.method public add(Ljava/lang/Object;)Z
    .registers 4
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 93
    .local p0, "this":Lcom/nhaarman/listviewanimations/ArrayAdapter;, "Lcom/nhaarman/listviewanimations/ArrayAdapter<TT;>;"
    .local p1, "object":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/ArrayAdapter;->mItems:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-result v0

    .line 94
    .local v0, "result":Z
    invoke-virtual {p0}, Lcom/nhaarman/listviewanimations/ArrayAdapter;->notifyDataSetChanged()V

    .line 95
    return v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .registers 4
    .param p1    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+TT;>;)Z"
        }
    .end annotation

    .prologue
    .line 112
    .local p0, "this":Lcom/nhaarman/listviewanimations/ArrayAdapter;, "Lcom/nhaarman/listviewanimations/ArrayAdapter<TT;>;"
    .local p1, "collection":Ljava/util/Collection;, "Ljava/util/Collection<+TT;>;"
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/ArrayAdapter;->mItems:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    move-result v0

    .line 113
    .local v0, "result":Z
    invoke-virtual {p0}, Lcom/nhaarman/listviewanimations/ArrayAdapter;->notifyDataSetChanged()V

    .line 114
    return v0
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 122
    .local p0, "this":Lcom/nhaarman/listviewanimations/ArrayAdapter;, "Lcom/nhaarman/listviewanimations/ArrayAdapter<TT;>;"
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/ArrayAdapter;->mItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 123
    invoke-virtual {p0}, Lcom/nhaarman/listviewanimations/ArrayAdapter;->notifyDataSetChanged()V

    .line 124
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 118
    .local p0, "this":Lcom/nhaarman/listviewanimations/ArrayAdapter;, "Lcom/nhaarman/listviewanimations/ArrayAdapter<TT;>;"
    .local p1, "object":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/ArrayAdapter;->mItems:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 63
    .local p0, "this":Lcom/nhaarman/listviewanimations/ArrayAdapter;, "Lcom/nhaarman/listviewanimations/ArrayAdapter<TT;>;"
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/ArrayAdapter;->mItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "position"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "this":Lcom/nhaarman/listviewanimations/ArrayAdapter;, "Lcom/nhaarman/listviewanimations/ArrayAdapter<TT;>;"
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/ArrayAdapter;->mItems:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 68
    .local p0, "this":Lcom/nhaarman/listviewanimations/ArrayAdapter;, "Lcom/nhaarman/listviewanimations/ArrayAdapter<TT;>;"
    int-to-long v0, p1

    return-wide v0
.end method

.method public getItems()Ljava/util/List;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, "this":Lcom/nhaarman/listviewanimations/ArrayAdapter;, "Lcom/nhaarman/listviewanimations/ArrayAdapter<TT;>;"
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/ArrayAdapter;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public notifyDataSetChanged()V
    .registers 2

    .prologue
    .line 152
    .local p0, "this":Lcom/nhaarman/listviewanimations/ArrayAdapter;, "Lcom/nhaarman/listviewanimations/ArrayAdapter<TT;>;"
    invoke-super {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 153
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/ArrayAdapter;->mDataSetChangedSlavedAdapter:Landroid/widget/BaseAdapter;

    if-eqz v0, :cond_c

    .line 154
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/ArrayAdapter;->mDataSetChangedSlavedAdapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 156
    :cond_c
    return-void
.end method

.method public propagateNotifyDataSetChanged(Landroid/widget/BaseAdapter;)V
    .registers 2
    .param p1, "slavedAdapter"    # Landroid/widget/BaseAdapter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 147
    .local p0, "this":Lcom/nhaarman/listviewanimations/ArrayAdapter;, "Lcom/nhaarman/listviewanimations/ArrayAdapter<TT;>;"
    iput-object p1, p0, Lcom/nhaarman/listviewanimations/ArrayAdapter;->mDataSetChangedSlavedAdapter:Landroid/widget/BaseAdapter;

    .line 148
    return-void
.end method

.method public remove(I)Ljava/lang/Object;
    .registers 4
    .param p1, "location"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 134
    .local p0, "this":Lcom/nhaarman/listviewanimations/ArrayAdapter;, "Lcom/nhaarman/listviewanimations/ArrayAdapter<TT;>;"
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/ArrayAdapter;->mItems:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    .line 135
    .local v0, "result":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0}, Lcom/nhaarman/listviewanimations/ArrayAdapter;->notifyDataSetChanged()V

    .line 136
    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "object"    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 127
    .local p0, "this":Lcom/nhaarman/listviewanimations/ArrayAdapter;, "Lcom/nhaarman/listviewanimations/ArrayAdapter<TT;>;"
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/ArrayAdapter;->mItems:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 128
    .local v0, "result":Z
    invoke-virtual {p0}, Lcom/nhaarman/listviewanimations/ArrayAdapter;->notifyDataSetChanged()V

    .line 129
    return v0
.end method

.method public swapItems(II)V
    .registers 6
    .param p1, "positionOne"    # I
    .param p2, "positionTwo"    # I

    .prologue
    .line 141
    .local p0, "this":Lcom/nhaarman/listviewanimations/ArrayAdapter;, "Lcom/nhaarman/listviewanimations/ArrayAdapter<TT;>;"
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/ArrayAdapter;->mItems:Ljava/util/List;

    invoke-virtual {p0, p2}, Lcom/nhaarman/listviewanimations/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, p1, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 142
    .local v0, "firstItem":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0}, Lcom/nhaarman/listviewanimations/ArrayAdapter;->notifyDataSetChanged()V

    .line 143
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/ArrayAdapter;->mItems:Ljava/util/List;

    invoke-interface {v1, p2, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 144
    return-void
.end method
