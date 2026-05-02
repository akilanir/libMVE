.class public interface abstract Lcom/nhaarman/listviewanimations/util/ListViewWrapper;
.super Ljava/lang/Object;
.source "ListViewWrapper.java"


# virtual methods
.method public abstract getAdapter()Landroid/widget/ListAdapter;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getChildAt(I)Landroid/view/View;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getChildCount()I
.end method

.method public abstract getCount()I
.end method

.method public abstract getFirstVisiblePosition()I
.end method

.method public abstract getHeaderViewsCount()I
.end method

.method public abstract getLastVisiblePosition()I
.end method

.method public abstract getListView()Landroid/view/ViewGroup;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract getPositionForView(Landroid/view/View;)I
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract smoothScrollBy(II)V
.end method
