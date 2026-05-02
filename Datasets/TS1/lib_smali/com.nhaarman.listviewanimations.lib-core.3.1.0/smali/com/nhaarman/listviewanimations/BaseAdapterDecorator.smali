.class public abstract Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;
.super Landroid/widget/BaseAdapter;
.source "BaseAdapterDecorator.java"

# interfaces
.implements Landroid/widget/SectionIndexer;
.implements Lcom/nhaarman/listviewanimations/util/Swappable;
.implements Lcom/nhaarman/listviewanimations/util/Insertable;
.implements Lcom/nhaarman/listviewanimations/util/ListViewWrapperSetter;


# instance fields
.field private final mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private mListViewWrapper:Lcom/nhaarman/listviewanimations/util/ListViewWrapper;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Landroid/widget/BaseAdapter;)V
    .registers 2
    .param p1, "baseAdapter"    # Landroid/widget/BaseAdapter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 58
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 59
    iput-object p1, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    .line 60
    return-void
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .registers 5
    .param p1, "index"    # I
    .param p2, "item"    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 240
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    instance-of v0, v0, Lcom/nhaarman/listviewanimations/util/Insertable;

    if-eqz v0, :cond_e

    .line 242
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    check-cast v0, Lcom/nhaarman/listviewanimations/util/Insertable;

    invoke-interface {v0, p1, p2}, Lcom/nhaarman/listviewanimations/util/Insertable;->add(ILjava/lang/Object;)V

    .line 246
    :goto_d
    return-void

    .line 244
    :cond_e
    const-string v0, "ListViewAnimations"

    const-string v1, "Warning: add called on an adapter that does not implement Insertable!"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_d
.end method

.method public areAllItemsEnabled()Z
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->areAllItemsEnabled()Z

    move-result v0

    return v0
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getDecoratedBaseAdapter()Landroid/widget/BaseAdapter;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 67
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    return-object v0
.end method

.method public getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 5
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 136
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0, p1, p2, p3}, Landroid/widget/BaseAdapter;->getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 114
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0, p1}, Landroid/widget/BaseAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 119
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0, p1}, Landroid/widget/BaseAdapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 141
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0, p1}, Landroid/widget/BaseAdapter;->getItemViewType(I)I

    move-result v0

    return v0
.end method

.method public getListViewWrapper()Lcom/nhaarman/listviewanimations/util/ListViewWrapper;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 91
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mListViewWrapper:Lcom/nhaarman/listviewanimations/util/ListViewWrapper;

    return-object v0
.end method

.method public getPositionForSection(I)I
    .registers 4
    .param p1, "sectionIndex"    # I

    .prologue
    .line 203
    const/4 v0, 0x0

    .line 204
    .local v0, "result":I
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    instance-of v1, v1, Landroid/widget/SectionIndexer;

    if-eqz v1, :cond_f

    .line 205
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    check-cast v1, Landroid/widget/SectionIndexer;

    invoke-interface {v1, p1}, Landroid/widget/SectionIndexer;->getPositionForSection(I)I

    move-result v0

    .line 207
    :cond_f
    return v0
.end method

.method protected getRootAdapter()Landroid/widget/BaseAdapter;
    .registers 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 75
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    .line 76
    .local v0, "adapter":Landroid/widget/BaseAdapter;
    :goto_2
    instance-of v1, v0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;

    if-eqz v1, :cond_d

    .line 77
    check-cast v0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;

    .end local v0    # "adapter":Landroid/widget/BaseAdapter;
    invoke-virtual {v0}, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->getDecoratedBaseAdapter()Landroid/widget/BaseAdapter;

    move-result-object v0

    .restart local v0    # "adapter":Landroid/widget/BaseAdapter;
    goto :goto_2

    .line 79
    :cond_d
    return-object v0
.end method

.method public getSectionForPosition(I)I
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 212
    const/4 v0, 0x0

    .line 213
    .local v0, "result":I
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    instance-of v1, v1, Landroid/widget/SectionIndexer;

    if-eqz v1, :cond_f

    .line 214
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    check-cast v1, Landroid/widget/SectionIndexer;

    invoke-interface {v1, p1}, Landroid/widget/SectionIndexer;->getSectionForPosition(I)I

    move-result v0

    .line 216
    :cond_f
    return v0
.end method

.method public getSections()[Ljava/lang/Object;
    .registers 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 222
    const/4 v1, 0x0

    new-array v0, v1, [Ljava/lang/Object;

    .line 223
    .local v0, "result":[Ljava/lang/Object;
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    instance-of v1, v1, Landroid/widget/SectionIndexer;

    if-eqz v1, :cond_11

    .line 224
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    check-cast v1, Landroid/widget/SectionIndexer;

    invoke-interface {v1}, Landroid/widget/SectionIndexer;->getSections()[Ljava/lang/Object;

    move-result-object v0

    .line 226
    :cond_11
    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 5
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 125
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0, p1, p2, p3}, Landroid/widget/BaseAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getViewTypeCount()I
    .registers 2

    .prologue
    .line 146
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->getViewTypeCount()I

    move-result v0

    return v0
.end method

.method public hasStableIds()Z
    .registers 2

    .prologue
    .line 151
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->hasStableIds()Z

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 156
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public isEnabled(I)Z
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 161
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0, p1}, Landroid/widget/BaseAdapter;->isEnabled(I)Z

    move-result v0

    return v0
.end method

.method public notifyDataSetChanged()V
    .registers 2

    .prologue
    .line 166
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    instance-of v0, v0, Lcom/nhaarman/listviewanimations/ArrayAdapter;

    if-nez v0, :cond_b

    .line 170
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 172
    :cond_b
    return-void
.end method

.method public notifyDataSetChanged(Z)V
    .registers 3
    .param p1, "force"    # Z

    .prologue
    .line 179
    if-nez p1, :cond_8

    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    instance-of v0, v0, Lcom/nhaarman/listviewanimations/ArrayAdapter;

    if-nez v0, :cond_d

    .line 182
    :cond_8
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 184
    :cond_d
    return-void
.end method

.method public notifyDataSetInvalidated()V
    .registers 2

    .prologue
    .line 188
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetInvalidated()V

    .line 189
    return-void
.end method

.method public registerDataSetObserver(Landroid/database/DataSetObserver;)V
    .registers 3
    .param p1, "observer"    # Landroid/database/DataSetObserver;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 193
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0, p1}, Landroid/widget/BaseAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 194
    return-void
.end method

.method public setAbsListView(Landroid/widget/AbsListView;)V
    .registers 3
    .param p1, "absListView"    # Landroid/widget/AbsListView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 83
    new-instance v0, Lcom/nhaarman/listviewanimations/util/AbsListViewWrapper;

    invoke-direct {v0, p1}, Lcom/nhaarman/listviewanimations/util/AbsListViewWrapper;-><init>(Landroid/widget/AbsListView;)V

    invoke-virtual {p0, v0}, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->setListViewWrapper(Lcom/nhaarman/listviewanimations/util/ListViewWrapper;)V

    .line 84
    return-void
.end method

.method public setListViewWrapper(Lcom/nhaarman/listviewanimations/util/ListViewWrapper;)V
    .registers 3
    .param p1, "listViewWrapper"    # Lcom/nhaarman/listviewanimations/util/ListViewWrapper;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 100
    iput-object p1, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mListViewWrapper:Lcom/nhaarman/listviewanimations/util/ListViewWrapper;

    .line 102
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    instance-of v0, v0, Lcom/nhaarman/listviewanimations/util/ListViewWrapperSetter;

    if-eqz v0, :cond_f

    .line 103
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    check-cast v0, Lcom/nhaarman/listviewanimations/util/ListViewWrapperSetter;

    invoke-interface {v0, p1}, Lcom/nhaarman/listviewanimations/util/ListViewWrapperSetter;->setListViewWrapper(Lcom/nhaarman/listviewanimations/util/ListViewWrapper;)V

    .line 105
    :cond_f
    return-void
.end method

.method public swapItems(II)V
    .registers 5
    .param p1, "positionOne"    # I
    .param p2, "positionTwo"    # I

    .prologue
    .line 231
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    instance-of v0, v0, Lcom/nhaarman/listviewanimations/util/Swappable;

    if-eqz v0, :cond_e

    .line 232
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    check-cast v0, Lcom/nhaarman/listviewanimations/util/Swappable;

    invoke-interface {v0, p1, p2}, Lcom/nhaarman/listviewanimations/util/Swappable;->swapItems(II)V

    .line 236
    :goto_d
    return-void

    .line 234
    :cond_e
    const-string v0, "ListViewAnimations"

    const-string v1, "Warning: swapItems called on an adapter that does not implement Swappable!"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_d
.end method

.method public unregisterDataSetObserver(Landroid/database/DataSetObserver;)V
    .registers 3
    .param p1, "observer"    # Landroid/database/DataSetObserver;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 198
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->mDecoratedBaseAdapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0, p1}, Landroid/widget/BaseAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 199
    return-void
.end method
