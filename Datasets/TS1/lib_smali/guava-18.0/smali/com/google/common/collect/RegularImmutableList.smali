.class Lcom/google/common/collect/RegularImmutableList;
.super Lcom/google/common/collect/ImmutableList;
.source "RegularImmutableList.java"


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
    emulated = true
    serializable = true
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ImmutableList",
        "<TE;>;"
    }
.end annotation


# instance fields
.field private final transient array:[Ljava/lang/Object;

.field private final transient offset:I

.field private final transient size:I


# direct methods
.method constructor <init>([Ljava/lang/Object;)V
    .registers 4
    .param p1, "array"    # [Ljava/lang/Object;

    .prologue
    .line 43
    .local p0, "this":Lcom/google/common/collect/RegularImmutableList;, "Lcom/google/common/collect/RegularImmutableList<TE;>;"
    const/4 v0, 0x0

    array-length v1, p1

    invoke-direct {p0, p1, v0, v1}, Lcom/google/common/collect/RegularImmutableList;-><init>([Ljava/lang/Object;II)V

    .line 44
    return-void
.end method

.method constructor <init>([Ljava/lang/Object;II)V
    .registers 4
    .param p1, "array"    # [Ljava/lang/Object;
    .param p2, "offset"    # I
    .param p3, "size"    # I

    .prologue
    .line 36
    .local p0, "this":Lcom/google/common/collect/RegularImmutableList;, "Lcom/google/common/collect/RegularImmutableList<TE;>;"
    invoke-direct {p0}, Lcom/google/common/collect/ImmutableList;-><init>()V

    .line 37
    iput p2, p0, Lcom/google/common/collect/RegularImmutableList;->offset:I

    .line 38
    iput p3, p0, Lcom/google/common/collect/RegularImmutableList;->size:I

    .line 39
    iput-object p1, p0, Lcom/google/common/collect/RegularImmutableList;->array:[Ljava/lang/Object;

    .line 40
    return-void
.end method


# virtual methods
.method copyIntoArray([Ljava/lang/Object;I)I
    .registers 6
    .param p1, "dst"    # [Ljava/lang/Object;
    .param p2, "dstOff"    # I

    .prologue
    .line 57
    .local p0, "this":Lcom/google/common/collect/RegularImmutableList;, "Lcom/google/common/collect/RegularImmutableList<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableList;->array:[Ljava/lang/Object;

    iget v1, p0, Lcom/google/common/collect/RegularImmutableList;->offset:I

    iget v2, p0, Lcom/google/common/collect/RegularImmutableList;->size:I

    invoke-static {v0, v1, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 58
    iget v0, p0, Lcom/google/common/collect/RegularImmutableList;->size:I

    add-int/2addr v0, p2

    return v0
.end method

.method public get(I)Ljava/lang/Object;
    .registers 4
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .prologue
    .line 65
    .local p0, "this":Lcom/google/common/collect/RegularImmutableList;, "Lcom/google/common/collect/RegularImmutableList<TE;>;"
    iget v0, p0, Lcom/google/common/collect/RegularImmutableList;->size:I

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkElementIndex(II)I

    .line 66
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableList;->array:[Ljava/lang/Object;

    iget v1, p0, Lcom/google/common/collect/RegularImmutableList;->offset:I

    add-int/2addr v1, p1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .registers 6
    .param p1, "object"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .local p0, "this":Lcom/google/common/collect/RegularImmutableList;, "Lcom/google/common/collect/RegularImmutableList<TE;>;"
    const/4 v1, -0x1

    .line 71
    if-nez p1, :cond_5

    move v0, v1

    .line 79
    :cond_4
    :goto_4
    return v0

    .line 74
    :cond_5
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    iget v2, p0, Lcom/google/common/collect/RegularImmutableList;->size:I

    if-ge v0, v2, :cond_1a

    .line 75
    iget-object v2, p0, Lcom/google/common/collect/RegularImmutableList;->array:[Ljava/lang/Object;

    iget v3, p0, Lcom/google/common/collect/RegularImmutableList;->offset:I

    add-int/2addr v3, v0

    aget-object v2, v2, v3

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 74
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_1a
    move v0, v1

    .line 79
    goto :goto_4
.end method

.method isPartialView()Z
    .registers 3

    .prologue
    .line 52
    .local p0, "this":Lcom/google/common/collect/RegularImmutableList;, "Lcom/google/common/collect/RegularImmutableList<TE;>;"
    iget v0, p0, Lcom/google/common/collect/RegularImmutableList;->size:I

    iget-object v1, p0, Lcom/google/common/collect/RegularImmutableList;->array:[Ljava/lang/Object;

    array-length v1, v1

    if-eq v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .registers 6
    .param p1, "object"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .local p0, "this":Lcom/google/common/collect/RegularImmutableList;, "Lcom/google/common/collect/RegularImmutableList<TE;>;"
    const/4 v1, -0x1

    .line 84
    if-nez p1, :cond_5

    move v0, v1

    .line 92
    :cond_4
    :goto_4
    return v0

    .line 87
    :cond_5
    iget v2, p0, Lcom/google/common/collect/RegularImmutableList;->size:I

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_9
    if-ltz v0, :cond_1b

    .line 88
    iget-object v2, p0, Lcom/google/common/collect/RegularImmutableList;->array:[Ljava/lang/Object;

    iget v3, p0, Lcom/google/common/collect/RegularImmutableList;->offset:I

    add-int/2addr v3, v0

    aget-object v2, v2, v3

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 87
    add-int/lit8 v0, v0, -0x1

    goto :goto_9

    :cond_1b
    move v0, v1

    .line 92
    goto :goto_4
.end method

.method public listIterator(I)Lcom/google/common/collect/UnmodifiableListIterator;
    .registers 5
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/collect/UnmodifiableListIterator",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 106
    .local p0, "this":Lcom/google/common/collect/RegularImmutableList;, "Lcom/google/common/collect/RegularImmutableList<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableList;->array:[Ljava/lang/Object;

    iget v1, p0, Lcom/google/common/collect/RegularImmutableList;->offset:I

    iget v2, p0, Lcom/google/common/collect/RegularImmutableList;->size:I

    invoke-static {v0, v1, v2, p1}, Lcom/google/common/collect/Iterators;->forArray([Ljava/lang/Object;III)Lcom/google/common/collect/UnmodifiableListIterator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic listIterator(I)Ljava/util/ListIterator;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 29
    .local p0, "this":Lcom/google/common/collect/RegularImmutableList;, "Lcom/google/common/collect/RegularImmutableList<TE;>;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/RegularImmutableList;->listIterator(I)Lcom/google/common/collect/UnmodifiableListIterator;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 48
    .local p0, "this":Lcom/google/common/collect/RegularImmutableList;, "Lcom/google/common/collect/RegularImmutableList<TE;>;"
    iget v0, p0, Lcom/google/common/collect/RegularImmutableList;->size:I

    return v0
.end method

.method subListUnchecked(II)Lcom/google/common/collect/ImmutableList;
    .registers 7
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/google/common/collect/ImmutableList",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 97
    .local p0, "this":Lcom/google/common/collect/RegularImmutableList;, "Lcom/google/common/collect/RegularImmutableList<TE;>;"
    new-instance v0, Lcom/google/common/collect/RegularImmutableList;

    iget-object v1, p0, Lcom/google/common/collect/RegularImmutableList;->array:[Ljava/lang/Object;

    iget v2, p0, Lcom/google/common/collect/RegularImmutableList;->offset:I

    add-int/2addr v2, p1

    sub-int v3, p2, p1

    invoke-direct {v0, v1, v2, v3}, Lcom/google/common/collect/RegularImmutableList;-><init>([Ljava/lang/Object;II)V

    return-object v0
.end method
