.class public Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "SimpleSectionedGridAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ViewHolder"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 331
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get(Landroid/view/View;I)Landroid/view/View;
    .registers 4
    .param p0, "view"    # Landroid/view/View;
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(",
            "Landroid/view/View;",
            "I)TT;"
        }
    .end annotation

    .prologue
    .line 334
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/SparseArray;

    .line 335
    .local v1, "viewHolder":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/view/View;>;"
    if-nez v1, :cond_10

    .line 336
    new-instance v1, Landroid/util/SparseArray;

    .end local v1    # "viewHolder":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/view/View;>;"
    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 337
    .restart local v1    # "viewHolder":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/view/View;>;"
    invoke-virtual {p0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 339
    :cond_10
    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 340
    .local v0, "childView":Landroid/view/View;
    if-nez v0, :cond_1f

    .line 341
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 342
    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 344
    :cond_1f
    return-object v0
.end method
