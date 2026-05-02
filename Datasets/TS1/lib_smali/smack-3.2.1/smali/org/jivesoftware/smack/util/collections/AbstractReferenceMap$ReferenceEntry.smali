.class public Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;
.super Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
.source "AbstractReferenceMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "ReferenceEntry"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field protected final parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field protected refKey:Ljava/lang/ref/Reference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/Reference",
            "<TK;>;"
        }
    .end annotation
.end field

.field protected refValue:Ljava/lang/ref/Reference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/Reference",
            "<TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;ILjava/lang/Object;Ljava/lang/Object;)V
    .registers 7
    .param p3, "hashCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap",
            "<TK;TV;>;",
            "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry",
            "<TK;TV;>;ITK;TV;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry<TK;TV;>;"
    .local p1, "parent":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    .local p2, "next":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry<TK;TV;>;"
    .local p4, "key":Ljava/lang/Object;, "TK;"
    .local p5, "value":Ljava/lang/Object;, "TV;"
    const/4 v0, 0x0

    .line 583
    invoke-direct {p0, p2, p3, v0, v0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;-><init>(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;ILjava/lang/Object;Ljava/lang/Object;)V

    .line 584
    iput-object p1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    .line 585
    iget v0, p1, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->keyType:I

    if-eqz v0, :cond_1f

    .line 586
    iget v0, p1, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->keyType:I

    invoke-virtual {p0, v0, p4, p3}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->toReference(ILjava/lang/Object;I)Ljava/lang/ref/Reference;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->refKey:Ljava/lang/ref/Reference;

    .line 590
    :goto_12
    iget v0, p1, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->valueType:I

    if-eqz v0, :cond_23

    .line 591
    iget v0, p1, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->valueType:I

    invoke-virtual {p0, v0, p5, p3}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->toReference(ILjava/lang/Object;I)Ljava/lang/ref/Reference;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->refValue:Ljava/lang/ref/Reference;

    .line 595
    :goto_1e
    return-void

    .line 588
    :cond_1f
    invoke-virtual {p0, p4}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->setKey(Ljava/lang/Object;)V

    goto :goto_12

    .line 593
    :cond_23
    invoke-virtual {p0, p5}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1e
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 9
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry<TK;TV;>;"
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 644
    if-ne p1, p0, :cond_5

    .line 659
    :cond_4
    :goto_4
    return v3

    .line 647
    :cond_5
    instance-of v5, p1, Ljava/util/Map$Entry;

    if-nez v5, :cond_b

    move v3, v4

    .line 648
    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 651
    check-cast v0, Ljava/util/Map$Entry;

    .line 652
    .local v0, "entry":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    .line 653
    .local v1, "entryKey":Ljava/lang/Object;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    .line 654
    .local v2, "entryValue":Ljava/lang/Object;
    if-eqz v1, :cond_1a

    if-nez v2, :cond_1c

    :cond_1a
    move v3, v4

    .line 655
    goto :goto_4

    .line 659
    :cond_1c
    iget-object v5, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v1, v6}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->isEqualKey(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_34

    iget-object v5, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v2, v6}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->isEqualValue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    :cond_34
    move v3, v4

    goto :goto_4
.end method

.method public getKey()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .prologue
    .line 604
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry<TK;TV;>;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    iget v0, v0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->keyType:I

    if-lez v0, :cond_d

    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->refKey:Ljava/lang/ref/Reference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    invoke-super {p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->getKey()Ljava/lang/Object;

    move-result-object v0

    goto :goto_c
.end method

.method public getValue()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .prologue
    .line 614
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry<TK;TV;>;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    iget v0, v0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->valueType:I

    if-lez v0, :cond_d

    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->refValue:Ljava/lang/ref/Reference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    invoke-super {p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->getValue()Ljava/lang/Object;

    move-result-object v0

    goto :goto_c
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 670
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry<TK;TV;>;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->hashEntry(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method protected next()Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 722
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry<TK;TV;>;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    check-cast v0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;

    return-object v0
.end method

.method purge(Ljava/lang/ref/Reference;)Z
    .registers 6
    .param p1, "ref"    # Ljava/lang/ref/Reference;

    .prologue
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry<TK;TV;>;"
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 701
    iget-object v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    iget v3, v3, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->keyType:I

    if-lez v3, :cond_33

    iget-object v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->refKey:Ljava/lang/ref/Reference;

    if-ne v3, p1, :cond_33

    move v0, v2

    .line 702
    .local v0, "r":Z
    :goto_d
    if-nez v0, :cond_19

    iget-object v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    iget v3, v3, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->valueType:I

    if-lez v3, :cond_35

    iget-object v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->refValue:Ljava/lang/ref/Reference;

    if-ne v3, p1, :cond_35

    :cond_19
    move v0, v2

    .line 703
    :goto_1a
    if-eqz v0, :cond_32

    .line 704
    iget-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    iget v1, v1, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->keyType:I

    if-lez v1, :cond_27

    .line 705
    iget-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->refKey:Ljava/lang/ref/Reference;

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->clear()V

    .line 707
    :cond_27
    iget-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    iget v1, v1, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->valueType:I

    if-lez v1, :cond_37

    .line 708
    iget-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->refValue:Ljava/lang/ref/Reference;

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->clear()V

    .line 713
    :cond_32
    :goto_32
    return v0

    .end local v0    # "r":Z
    :cond_33
    move v0, v1

    .line 701
    goto :goto_d

    .restart local v0    # "r":Z
    :cond_35
    move v0, v1

    .line 702
    goto :goto_1a

    .line 709
    :cond_37
    iget-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    iget-boolean v1, v1, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->purgeValues:Z

    if-eqz v1, :cond_32

    .line 710
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_32
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)TV;"
        }
    .end annotation

    .prologue
    .line 624
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry<TK;TV;>;"
    .local p1, "obj":Ljava/lang/Object;, "TV;"
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->getValue()Ljava/lang/Object;

    move-result-object v0

    .line 625
    .local v0, "old":Ljava/lang/Object;, "TV;"
    iget-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    iget v1, v1, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->valueType:I

    if-lez v1, :cond_1c

    .line 626
    iget-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->refValue:Ljava/lang/ref/Reference;

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->clear()V

    .line 627
    iget-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    iget v1, v1, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->valueType:I

    iget v2, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->hashCode:I

    invoke-virtual {p0, v1, p1, v2}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->toReference(ILjava/lang/Object;I)Ljava/lang/ref/Reference;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->refValue:Ljava/lang/ref/Reference;

    .line 631
    :goto_1b
    return-object v0

    .line 629
    :cond_1c
    invoke-super {p0, p1}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1b
.end method

.method protected toReference(ILjava/lang/Object;I)Ljava/lang/ref/Reference;
    .registers 6
    .param p1, "type"    # I
    .param p3, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(ITT;I)",
            "Ljava/lang/ref/Reference",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 684
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry<TK;TV;>;"
    .local p2, "referent":Ljava/lang/Object;, "TT;"
    packed-switch p1, :pswitch_data_24

    .line 690
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Attempt to create hard reference in ReferenceMap!"

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 686
    :pswitch_b
    new-instance v0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$SoftRef;

    iget-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    # getter for: Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->queue:Ljava/lang/ref/ReferenceQueue;
    invoke-static {v1}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->access$000(Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;)Ljava/lang/ref/ReferenceQueue;

    move-result-object v1

    invoke-direct {v0, p3, p2, v1}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$SoftRef;-><init>(ILjava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 688
    :goto_16
    return-object v0

    :pswitch_17
    new-instance v0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$WeakRef;

    iget-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->parent:Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    # getter for: Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->queue:Ljava/lang/ref/ReferenceQueue;
    invoke-static {v1}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->access$000(Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;)Ljava/lang/ref/ReferenceQueue;

    move-result-object v1

    invoke-direct {v0, p3, p2, v1}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$WeakRef;-><init>(ILjava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    goto :goto_16

    .line 684
    nop

    :pswitch_data_24
    .packed-switch 0x1
        :pswitch_b
        :pswitch_17
    .end packed-switch
.end method
