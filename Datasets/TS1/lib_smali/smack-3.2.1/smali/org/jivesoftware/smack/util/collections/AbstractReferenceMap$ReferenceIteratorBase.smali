.class Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;
.super Ljava/lang/Object;
.source "AbstractReferenceMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ReferenceIteratorBase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field currentKey:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field currentValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field

.field entry:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field expectedModCount:I

.field index:I

.field nextKey:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field nextValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field

.field final parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field previous:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 752
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase<TK;TV;>;"
    .local p1, "parent":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 753
    iput-object p1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    .line 754
    invoke-virtual {p1}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->size()I

    move-result v0

    if-eqz v0, :cond_15

    iget-object v0, p1, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    array-length v0, v0

    :goto_e
    iput v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->index:I

    .line 757
    iget v0, p1, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->modCount:I

    iput v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->expectedModCount:I

    .line 758
    return-void

    .line 754
    :cond_15
    const/4 v0, 0x0

    goto :goto_e
.end method

.method private checkMod()V
    .registers 3

    .prologue
    .line 786
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase<TK;TV;>;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    iget v0, v0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->modCount:I

    iget v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->expectedModCount:I

    if-eq v0, v1, :cond_e

    .line 787
    new-instance v0, Ljava/util/ConcurrentModificationException;

    invoke-direct {v0}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw v0

    .line 789
    :cond_e
    return-void
.end method

.method private nextNull()Z
    .registers 2

    .prologue
    .line 792
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase<TK;TV;>;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->nextKey:Ljava/lang/Object;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->nextValue:Ljava/lang/Object;

    if-nez v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method


# virtual methods
.method protected currentEntry()Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 810
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase<TK;TV;>;"
    invoke-direct {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->checkMod()V

    .line 811
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->previous:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;

    return-object v0
.end method

.method public hasNext()Z
    .registers 5

    .prologue
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase<TK;TV;>;"
    const/4 v3, 0x0

    .line 761
    invoke-direct {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->checkMod()V

    .line 762
    :cond_4
    :goto_4
    invoke-direct {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->nextNull()Z

    move-result v2

    if-eqz v2, :cond_44

    .line 763
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->entry:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;

    .line 764
    .local v0, "e":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry<TK;TV;>;"
    iget v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->index:I

    .line 765
    .local v1, "i":I
    :goto_e
    if-nez v0, :cond_1d

    if-lez v1, :cond_1d

    .line 766
    add-int/lit8 v1, v1, -0x1

    .line 767
    iget-object v2, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    iget-object v2, v2, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    aget-object v0, v2, v1

    .end local v0    # "e":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry<TK;TV;>;"
    check-cast v0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;

    .restart local v0    # "e":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry<TK;TV;>;"
    goto :goto_e

    .line 769
    :cond_1d
    iput-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->entry:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;

    .line 770
    iput v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->index:I

    .line 771
    if-nez v0, :cond_29

    .line 772
    iput-object v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->currentKey:Ljava/lang/Object;

    .line 773
    iput-object v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->currentValue:Ljava/lang/Object;

    .line 774
    const/4 v2, 0x0

    .line 782
    .end local v0    # "e":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry<TK;TV;>;"
    .end local v1    # "i":I
    :goto_28
    return v2

    .line 776
    .restart local v0    # "e":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry<TK;TV;>;"
    .restart local v1    # "i":I
    :cond_29
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v2

    iput-object v2, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->nextKey:Ljava/lang/Object;

    .line 777
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->getValue()Ljava/lang/Object;

    move-result-object v2

    iput-object v2, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->nextValue:Ljava/lang/Object;

    .line 778
    invoke-direct {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->nextNull()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 779
    iget-object v2, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->entry:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->next()Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;

    move-result-object v2

    iput-object v2, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->entry:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;

    goto :goto_4

    .line 782
    .end local v0    # "e":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry<TK;TV;>;"
    .end local v1    # "i":I
    :cond_44
    const/4 v2, 0x1

    goto :goto_28
.end method

.method protected nextEntry()Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase<TK;TV;>;"
    const/4 v1, 0x0

    .line 796
    invoke-direct {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->checkMod()V

    .line 797
    invoke-direct {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->nextNull()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->hasNext()Z

    move-result v0

    if-nez v0, :cond_16

    .line 798
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 800
    :cond_16
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->entry:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;

    iput-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->previous:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;

    .line 801
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->entry:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->next()Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->entry:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;

    .line 802
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->nextKey:Ljava/lang/Object;

    iput-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->currentKey:Ljava/lang/Object;

    .line 803
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->nextValue:Ljava/lang/Object;

    iput-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->currentValue:Ljava/lang/Object;

    .line 804
    iput-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->nextKey:Ljava/lang/Object;

    .line 805
    iput-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->nextValue:Ljava/lang/Object;

    .line 806
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->previous:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;

    return-object v0
.end method

.method public remove()V
    .registers 4

    .prologue
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase<TK;TV;>;"
    const/4 v2, 0x0

    .line 819
    invoke-direct {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->checkMod()V

    .line 820
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->previous:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;

    if-nez v0, :cond_e

    .line 821
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 823
    :cond_e
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    iget-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->currentKey:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 824
    iput-object v2, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->previous:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;

    .line 825
    iput-object v2, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->currentKey:Ljava/lang/Object;

    .line 826
    iput-object v2, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->currentValue:Ljava/lang/Object;

    .line 827
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    iget v0, v0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->modCount:I

    iput v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->expectedModCount:I

    .line 828
    return-void
.end method

.method public superNext()Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 815
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase<TK;TV;>;"
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;->nextEntry()Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;

    move-result-object v0

    return-object v0
.end method
