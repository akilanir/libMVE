.class public Lcom/nhaarman/listviewanimations/util/AbsListViewWrapper;
.super Ljava/lang/Object;
.source "AbsListViewWrapper.java"

# interfaces
.implements Lcom/nhaarman/listviewanimations/util/ListViewWrapper;


# instance fields
.field private final mAbsListView:Landroid/widget/AbsListView;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/widget/AbsListView;)V
    .registers 2
    .param p1, "absListView"    # Landroid/widget/AbsListView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/nhaarman/listviewanimations/util/AbsListViewWrapper;->mAbsListView:Landroid/widget/AbsListView;

    .line 33
    return-void
.end method


# virtual methods
.method public getAdapter()Landroid/widget/ListAdapter;
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/util/AbsListViewWrapper;->mAbsListView:Landroid/widget/AbsListView;

    invoke-virtual {v0}, Landroid/widget/AbsListView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    check-cast v0, Landroid/widget/ListAdapter;

    return-object v0
.end method

.method public getChildAt(I)Landroid/view/View;
    .registers 3
    .param p1, "index"    # I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 44
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/util/AbsListViewWrapper;->mAbsListView:Landroid/widget/AbsListView;

    invoke-virtual {v0, p1}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getChildCount()I
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/util/AbsListViewWrapper;->mAbsListView:Landroid/widget/AbsListView;

    invoke-virtual {v0}, Landroid/widget/AbsListView;->getChildCount()I

    move-result v0

    return v0
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/util/AbsListViewWrapper;->mAbsListView:Landroid/widget/AbsListView;

    invoke-virtual {v0}, Landroid/widget/AbsListView;->getCount()I

    move-result v0

    return v0
.end method

.method public getFirstVisiblePosition()I
    .registers 2

    .prologue
    .line 49
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/util/AbsListViewWrapper;->mAbsListView:Landroid/widget/AbsListView;

    invoke-virtual {v0}, Landroid/widget/AbsListView;->getFirstVisiblePosition()I

    move-result v0

    return v0
.end method

.method public getHeaderViewsCount()I
    .registers 3

    .prologue
    .line 69
    const/4 v0, 0x0

    .line 70
    .local v0, "result":I
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/util/AbsListViewWrapper;->mAbsListView:Landroid/widget/AbsListView;

    instance-of v1, v1, Landroid/widget/ListView;

    if-eqz v1, :cond_f

    .line 71
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/util/AbsListViewWrapper;->mAbsListView:Landroid/widget/AbsListView;

    check-cast v1, Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result v0

    .line 73
    :cond_f
    return v0
.end method

.method public getLastVisiblePosition()I
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/util/AbsListViewWrapper;->mAbsListView:Landroid/widget/AbsListView;

    invoke-virtual {v0}, Landroid/widget/AbsListView;->getLastVisiblePosition()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getListView()Landroid/view/ViewGroup;
    .registers 2

    .prologue
    .line 26
    invoke-virtual {p0}, Lcom/nhaarman/listviewanimations/util/AbsListViewWrapper;->getListView()Landroid/widget/AbsListView;

    move-result-object v0

    return-object v0
.end method

.method public getListView()Landroid/widget/AbsListView;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 38
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/util/AbsListViewWrapper;->mAbsListView:Landroid/widget/AbsListView;

    return-object v0
.end method

.method public getPositionForView(Landroid/view/View;)I
    .registers 3
    .param p1, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 78
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/util/AbsListViewWrapper;->mAbsListView:Landroid/widget/AbsListView;

    invoke-virtual {v0, p1}, Landroid/widget/AbsListView;->getPositionForView(Landroid/view/View;)I

    move-result v0

    return v0
.end method

.method public smoothScrollBy(II)V
    .registers 4
    .param p1, "distance"    # I
    .param p2, "duration"    # I

    .prologue
    .line 88
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/util/AbsListViewWrapper;->mAbsListView:Landroid/widget/AbsListView;

    invoke-virtual {v0, p1, p2}, Landroid/widget/AbsListView;->smoothScrollBy(II)V

    .line 89
    return-void
.end method
