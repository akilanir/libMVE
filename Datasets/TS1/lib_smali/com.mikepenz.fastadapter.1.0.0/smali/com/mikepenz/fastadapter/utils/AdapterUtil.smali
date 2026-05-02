.class public Lcom/mikepenz/fastadapter/utils/AdapterUtil;
.super Ljava/lang/Object;
.source "AdapterUtil.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static adjustPosition(Landroid/util/SparseIntArray;III)Landroid/util/SparseIntArray;
    .registers 9
    .param p0, "positions"    # Landroid/util/SparseIntArray;
    .param p1, "startPosition"    # I
    .param p2, "endPosition"    # I
    .param p3, "adjustBy"    # I

    .prologue
    .line 60
    new-instance v1, Landroid/util/SparseIntArray;

    invoke-direct {v1}, Landroid/util/SparseIntArray;-><init>()V

    .line 62
    .local v1, "newPositions":Landroid/util/SparseIntArray;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    invoke-virtual {p0}, Landroid/util/SparseIntArray;->size()I

    move-result v3

    if-ge v0, v3, :cond_3c

    .line 63
    invoke-virtual {p0, v0}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v2

    .line 66
    .local v2, "position":I
    if-lt v2, p1, :cond_14

    if-le v2, p2, :cond_1e

    .line 67
    :cond_14
    invoke-virtual {p0, v0}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/util/SparseIntArray;->put(II)V

    .line 62
    :cond_1b
    :goto_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 68
    :cond_1e
    if-lez p3, :cond_2a

    .line 70
    add-int v3, v2, p3

    invoke-virtual {p0, v0}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v4

    invoke-virtual {v1, v3, v4}, Landroid/util/SparseIntArray;->put(II)V

    goto :goto_1b

    .line 71
    :cond_2a
    if-gez p3, :cond_1b

    .line 74
    add-int v3, p1, p3

    if-le v2, v3, :cond_32

    if-le v2, p1, :cond_1b

    .line 78
    :cond_32
    add-int v3, v2, p3

    invoke-virtual {p0, v0}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v4

    invoke-virtual {v1, v3, v4}, Landroid/util/SparseIntArray;->put(II)V

    goto :goto_1b

    .line 83
    .end local v2    # "position":I
    :cond_3c
    return-object v1
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
    .line 24
    .local p0, "positions":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    new-instance v1, Ljava/util/TreeSet;

    invoke-direct {v1}, Ljava/util/TreeSet;-><init>()V

    .line 26
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

    .line 27
    .local v0, "entry":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 30
    .local v2, "position":I
    if-lt v2, p1, :cond_1d

    if-le v2, p2, :cond_25

    .line 31
    :cond_1d
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 32
    :cond_25
    if-lez p3, :cond_31

    .line 34
    add-int v4, v2, p3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 35
    :cond_31
    if-gez p3, :cond_9

    .line 38
    add-int v4, p1, p3

    if-le v2, v4, :cond_39

    if-le v2, p1, :cond_9

    .line 42
    :cond_39
    add-int v4, v2, p3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 47
    .end local v0    # "entry":Ljava/lang/Integer;
    .end local v2    # "position":I
    :cond_43
    return-object v1
.end method
