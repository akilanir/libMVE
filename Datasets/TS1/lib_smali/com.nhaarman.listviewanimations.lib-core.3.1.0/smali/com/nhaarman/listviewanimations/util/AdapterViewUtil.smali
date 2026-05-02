.class public Lcom/nhaarman/listviewanimations/util/AdapterViewUtil;
.super Ljava/lang/Object;
.source "AdapterViewUtil.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    return-void
.end method

.method public static getPositionForView(Landroid/widget/AbsListView;Landroid/view/View;)I
    .registers 4
    .param p0, "absListView"    # Landroid/widget/AbsListView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 58
    invoke-virtual {p0, p1}, Landroid/widget/AbsListView;->getPositionForView(Landroid/view/View;)I

    move-result v0

    .line 59
    .local v0, "position":I
    instance-of v1, p0, Landroid/widget/ListView;

    if-eqz v1, :cond_f

    .line 60
    check-cast p0, Landroid/widget/ListView;

    .end local p0    # "absListView":Landroid/widget/AbsListView;
    invoke-virtual {p0}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result v1

    sub-int/2addr v0, v1

    .line 62
    :cond_f
    return v0
.end method

.method public static getPositionForView(Lcom/nhaarman/listviewanimations/util/ListViewWrapper;Landroid/view/View;)I
    .registers 4
    .param p0, "listViewWrapper"    # Lcom/nhaarman/listviewanimations/util/ListViewWrapper;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 43
    invoke-interface {p0, p1}, Lcom/nhaarman/listviewanimations/util/ListViewWrapper;->getPositionForView(Landroid/view/View;)I

    move-result v0

    invoke-interface {p0}, Lcom/nhaarman/listviewanimations/util/ListViewWrapper;->getHeaderViewsCount()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public static getViewForPosition(Landroid/widget/AbsListView;I)Landroid/view/View;
    .registers 7
    .param p0, "absListView"    # Landroid/widget/AbsListView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "position"    # I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 96
    invoke-virtual {p0}, Landroid/widget/AbsListView;->getChildCount()I

    move-result v1

    .line 97
    .local v1, "childCount":I
    const/4 v2, 0x0

    .line 98
    .local v2, "downView":Landroid/view/View;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_6
    if-ge v3, v1, :cond_1a

    if-nez v2, :cond_1a

    .line 99
    invoke-virtual {p0, v3}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 100
    .local v0, "child":Landroid/view/View;
    if-eqz v0, :cond_17

    invoke-static {p0, v0}, Lcom/nhaarman/listviewanimations/util/AdapterViewUtil;->getPositionForView(Landroid/widget/AbsListView;Landroid/view/View;)I

    move-result v4

    if-ne v4, p1, :cond_17

    .line 101
    move-object v2, v0

    .line 98
    :cond_17
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 104
    .end local v0    # "child":Landroid/view/View;
    :cond_1a
    return-object v2
.end method

.method public static getViewForPosition(Lcom/nhaarman/listviewanimations/util/ListViewWrapper;I)Landroid/view/View;
    .registers 7
    .param p0, "listViewWrapper"    # Lcom/nhaarman/listviewanimations/util/ListViewWrapper;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "position"    # I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 75
    invoke-interface {p0}, Lcom/nhaarman/listviewanimations/util/ListViewWrapper;->getChildCount()I

    move-result v1

    .line 76
    .local v1, "childCount":I
    const/4 v2, 0x0

    .line 77
    .local v2, "downView":Landroid/view/View;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_6
    if-ge v3, v1, :cond_1a

    if-nez v2, :cond_1a

    .line 78
    invoke-interface {p0, v3}, Lcom/nhaarman/listviewanimations/util/ListViewWrapper;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 79
    .local v0, "child":Landroid/view/View;
    if-eqz v0, :cond_17

    invoke-static {p0, v0}, Lcom/nhaarman/listviewanimations/util/AdapterViewUtil;->getPositionForView(Lcom/nhaarman/listviewanimations/util/ListViewWrapper;Landroid/view/View;)I

    move-result v4

    if-ne v4, p1, :cond_17

    .line 80
    move-object v2, v0

    .line 77
    :cond_17
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 83
    .end local v0    # "child":Landroid/view/View;
    :cond_1a
    return-object v2
.end method
