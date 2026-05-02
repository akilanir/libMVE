.class Lfreemarker/ext/util/IdentityHashMap$3;
.super Ljava/util/AbstractSet;
.source "IdentityHashMap.java"


# instance fields
.field private final this$0:Lfreemarker/ext/util/IdentityHashMap;


# direct methods
.method constructor <init>(Lfreemarker/ext/util/IdentityHashMap;)V
    .registers 2

    .prologue
    .line 606
    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/util/IdentityHashMap$3;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 665
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$3;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-virtual {v0}, Lfreemarker/ext/util/IdentityHashMap;->clear()V

    .line 666
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 11
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v6, 0x0

    .line 614
    instance-of v7, p1, Ljava/util/Map$Entry;

    if-nez v7, :cond_6

    .line 625
    :cond_5
    :goto_5
    return v6

    :cond_6
    move-object v1, p1

    .line 616
    check-cast v1, Ljava/util/Map$Entry;

    .line 617
    .local v1, "entry":Ljava/util/Map$Entry;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    .line 618
    .local v4, "key":Ljava/lang/Object;
    iget-object v7, p0, Lfreemarker/ext/util/IdentityHashMap$3;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-static {v7}, Lfreemarker/ext/util/IdentityHashMap;->access$200(Lfreemarker/ext/util/IdentityHashMap;)[Lfreemarker/ext/util/IdentityHashMap$Entry;

    move-result-object v5

    .line 619
    .local v5, "tab":[Lfreemarker/ext/util/IdentityHashMap$Entry;
    if-nez v4, :cond_2d

    move v2, v6

    .line 620
    .local v2, "hash":I
    :goto_16
    const v7, 0x7fffffff

    and-int/2addr v7, v2

    array-length v8, v5

    rem-int v3, v7, v8

    .line 622
    .local v3, "index":I
    aget-object v0, v5, v3

    .local v0, "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :goto_1f
    if-eqz v0, :cond_5

    .line 623
    iget v7, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->hash:I

    if-ne v7, v2, :cond_32

    invoke-virtual {v0, v1}, Lfreemarker/ext/util/IdentityHashMap$Entry;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_32

    .line 624
    const/4 v6, 0x1

    goto :goto_5

    .line 619
    .end local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    .end local v2    # "hash":I
    .end local v3    # "index":I
    :cond_2d
    invoke-static {v4}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v2

    goto :goto_16

    .line 622
    .restart local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    .restart local v2    # "hash":I
    .restart local v3    # "index":I
    :cond_32
    iget-object v0, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    goto :goto_1f
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 3

    .prologue
    .line 609
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$3;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lfreemarker/ext/util/IdentityHashMap;->access$000(Lfreemarker/ext/util/IdentityHashMap;I)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 12
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v7, 0x0

    .line 630
    instance-of v8, p1, Ljava/util/Map$Entry;

    if-nez v8, :cond_6

    .line 655
    :cond_5
    :goto_5
    return v7

    :cond_6
    move-object v1, p1

    .line 632
    check-cast v1, Ljava/util/Map$Entry;

    .line 633
    .local v1, "entry":Ljava/util/Map$Entry;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    .line 634
    .local v4, "key":Ljava/lang/Object;
    iget-object v8, p0, Lfreemarker/ext/util/IdentityHashMap$3;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-static {v8}, Lfreemarker/ext/util/IdentityHashMap;->access$200(Lfreemarker/ext/util/IdentityHashMap;)[Lfreemarker/ext/util/IdentityHashMap$Entry;

    move-result-object v6

    .line 635
    .local v6, "tab":[Lfreemarker/ext/util/IdentityHashMap$Entry;
    if-nez v4, :cond_41

    move v2, v7

    .line 636
    .local v2, "hash":I
    :goto_16
    const v8, 0x7fffffff

    and-int/2addr v8, v2

    array-length v9, v6

    rem-int v3, v8, v9

    .line 638
    .local v3, "index":I
    aget-object v0, v6, v3

    .local v0, "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    const/4 v5, 0x0

    .line 639
    .local v5, "prev":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :goto_20
    if-eqz v0, :cond_5

    .line 642
    iget v8, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->hash:I

    if-ne v8, v2, :cond_4b

    invoke-virtual {v0, v1}, Lfreemarker/ext/util/IdentityHashMap$Entry;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4b

    .line 644
    iget-object v7, p0, Lfreemarker/ext/util/IdentityHashMap$3;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-static {v7}, Lfreemarker/ext/util/IdentityHashMap;->access$308(Lfreemarker/ext/util/IdentityHashMap;)I

    .line 645
    if-eqz v5, :cond_46

    .line 646
    iget-object v7, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    iput-object v7, v5, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 650
    :goto_37
    iget-object v7, p0, Lfreemarker/ext/util/IdentityHashMap$3;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-static {v7}, Lfreemarker/ext/util/IdentityHashMap;->access$110(Lfreemarker/ext/util/IdentityHashMap;)I

    .line 651
    const/4 v7, 0x0

    iput-object v7, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    .line 652
    const/4 v7, 0x1

    goto :goto_5

    .line 635
    .end local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    .end local v2    # "hash":I
    .end local v3    # "index":I
    .end local v5    # "prev":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :cond_41
    invoke-static {v4}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v2

    goto :goto_16

    .line 648
    .restart local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    .restart local v2    # "hash":I
    .restart local v3    # "index":I
    .restart local v5    # "prev":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :cond_46
    iget-object v7, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    aput-object v7, v6, v3

    goto :goto_37

    .line 640
    :cond_4b
    move-object v5, v0

    iget-object v0, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    goto :goto_20
.end method

.method public size()I
    .registers 2

    .prologue
    .line 660
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$3;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-static {v0}, Lfreemarker/ext/util/IdentityHashMap;->access$100(Lfreemarker/ext/util/IdentityHashMap;)I

    move-result v0

    return v0
.end method
