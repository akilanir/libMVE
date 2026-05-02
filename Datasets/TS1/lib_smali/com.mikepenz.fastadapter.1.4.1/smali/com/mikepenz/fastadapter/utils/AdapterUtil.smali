.class public Lcom/mikepenz/fastadapter/utils/AdapterUtil;
.super Ljava/lang/Object;
.source "AdapterUtil.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static adjustPosition(Landroid/util/SparseIntArray;III)Landroid/util/SparseIntArray;
    .registers 10
    .param p0, "positions"    # Landroid/util/SparseIntArray;
    .param p1, "startPosition"    # I
    .param p2, "endPosition"    # I
    .param p3, "adjustBy"    # I

    .prologue
    .line 87
    new-instance v2, Landroid/util/SparseIntArray;

    invoke-direct {v2}, Landroid/util/SparseIntArray;-><init>()V

    .line 89
    .local v2, "newPositions":Landroid/util/SparseIntArray;
    invoke-virtual {p0}, Landroid/util/SparseIntArray;->size()I

    move-result v1

    .line 90
    .local v1, "length":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    if-ge v0, v1, :cond_3c

    .line 91
    invoke-virtual {p0, v0}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v3

    .line 94
    .local v3, "position":I
    if-lt v3, p1, :cond_14

    if-le v3, p2, :cond_1e

    .line 95
    :cond_14
    invoke-virtual {p0, v0}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v4

    invoke-virtual {v2, v3, v4}, Landroid/util/SparseIntArray;->put(II)V

    .line 90
    :cond_1b
    :goto_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 96
    :cond_1e
    if-lez p3, :cond_2a

    .line 98
    add-int v4, v3, p3

    invoke-virtual {p0, v0}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v5

    invoke-virtual {v2, v4, v5}, Landroid/util/SparseIntArray;->put(II)V

    goto :goto_1b

    .line 99
    :cond_2a
    if-gez p3, :cond_1b

    .line 102
    add-int v4, p1, p3

    if-le v3, v4, :cond_32

    if-le v3, p1, :cond_1b

    .line 106
    :cond_32
    add-int v4, v3, p3

    invoke-virtual {p0, v0}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v5

    invoke-virtual {v2, v4, v5}, Landroid/util/SparseIntArray;->put(II)V

    goto :goto_1b

    .line 111
    .end local v3    # "position":I
    :cond_3c
    return-object v2
.end method

.method public static adjustPosition(Ljava/util/Set;III)Ljava/util/SortedSet;
    .registers 9
    .param p1, "startPosition"    # I
    .param p2, "endPosition"    # I
    .param p3, "adjustBy"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;III)",
            "Ljava/util/SortedSet",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "positions":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    new-instance v1, Ljava/util/TreeSet;

    invoke-direct {v1}, Ljava/util/TreeSet;-><init>()V

    .line 53
    .local v1, "newPositions":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Ljava/lang/Integer;>;"
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_9
    :goto_9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_43

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 54
    .local v0, "entry":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 57
    .local v2, "position":I
    if-lt v2, p1, :cond_1d

    if-le v2, p2, :cond_25

    .line 58
    :cond_1d
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 59
    :cond_25
    if-lez p3, :cond_31

    .line 61
    add-int v4, v2, p3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 62
    :cond_31
    if-gez p3, :cond_9

    .line 65
    add-int v4, p1, p3

    if-le v2, v4, :cond_39

    if-le v2, p1, :cond_9

    .line 69
    :cond_39
    add-int v4, v2, p3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 74
    .end local v0    # "entry":Ljava/lang/Integer;
    .end local v2    # "position":I
    :cond_43
    return-object v1
.end method

.method public static handleStates(Lcom/mikepenz/fastadapter/FastAdapter;II)V
    .registers 7
    .param p0, "fastAdapter"    # Lcom/mikepenz/fastadapter/FastAdapter;
    .param p1, "startPosition"    # I
    .param p2, "endPosition"    # I

    .prologue
    .line 26
    move v0, p2

    .local v0, "i":I
    :goto_1
    if-lt v0, p1, :cond_4e

    .line 27
    invoke-virtual {p0, v0}, Lcom/mikepenz/fastadapter/FastAdapter;->getItem(I)Lcom/mikepenz/fastadapter/IItem;

    move-result-object v1

    .line 28
    .local v1, "updateItem":Lcom/mikepenz/fastadapter/IItem;
    invoke-interface {v1}, Lcom/mikepenz/fastadapter/IItem;->isSelected()Z

    move-result v2

    if-eqz v2, :cond_34

    .line 29
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/FastAdapter;->getSelections()Ljava/util/Set;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 33
    :cond_18
    :goto_18
    instance-of v2, v1, Lcom/mikepenz/fastadapter/IExpandable;

    if-eqz v2, :cond_31

    .line 34
    check-cast v1, Lcom/mikepenz/fastadapter/IExpandable;

    .end local v1    # "updateItem":Lcom/mikepenz/fastadapter/IItem;
    invoke-interface {v1}, Lcom/mikepenz/fastadapter/IExpandable;->isExpanded()Z

    move-result v2

    if-eqz v2, :cond_31

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/FastAdapter;->getExpanded()Landroid/util/SparseIntArray;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/util/SparseIntArray;->indexOfKey(I)I

    move-result v2

    if-gez v2, :cond_31

    .line 35
    invoke-virtual {p0, v0}, Lcom/mikepenz/fastadapter/FastAdapter;->expand(I)V

    .line 26
    :cond_31
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 30
    .restart local v1    # "updateItem":Lcom/mikepenz/fastadapter/IItem;
    :cond_34
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/FastAdapter;->getSelections()Ljava/util/Set;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    .line 31
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/FastAdapter;->getSelections()Ljava/util/Set;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_18

    .line 39
    .end local v1    # "updateItem":Lcom/mikepenz/fastadapter/IItem;
    :cond_4e
    return-void
.end method
