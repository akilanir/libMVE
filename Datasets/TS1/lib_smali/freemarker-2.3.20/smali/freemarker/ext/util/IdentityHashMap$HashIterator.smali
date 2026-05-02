.class Lfreemarker/ext/util/IdentityHashMap$HashIterator;
.super Ljava/lang/Object;
.source "IdentityHashMap.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/util/IdentityHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HashIterator"
.end annotation


# instance fields
.field entry:Lfreemarker/ext/util/IdentityHashMap$Entry;

.field private expectedModCount:I

.field index:I

.field lastReturned:Lfreemarker/ext/util/IdentityHashMap$Entry;

.field table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

.field private final this$0:Lfreemarker/ext/util/IdentityHashMap;

.field type:I


# direct methods
.method constructor <init>(Lfreemarker/ext/util/IdentityHashMap;I)V
    .registers 5
    .param p2, "type"    # I

    .prologue
    const/4 v1, 0x0

    .line 803
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    .line 789
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-static {v0}, Lfreemarker/ext/util/IdentityHashMap;->access$200(Lfreemarker/ext/util/IdentityHashMap;)[Lfreemarker/ext/util/IdentityHashMap$Entry;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 790
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    array-length v0, v0

    iput v0, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->index:I

    .line 791
    iput-object v1, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->entry:Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 792
    iput-object v1, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->lastReturned:Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 800
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-static {v0}, Lfreemarker/ext/util/IdentityHashMap;->access$300(Lfreemarker/ext/util/IdentityHashMap;)I

    move-result v0

    iput v0, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->expectedModCount:I

    .line 804
    iput p2, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->type:I

    .line 805
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 5

    .prologue
    .line 809
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->entry:Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 810
    .local v0, "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    iget v1, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->index:I

    .line 811
    .local v1, "i":I
    iget-object v2, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 813
    .local v2, "t":[Lfreemarker/ext/util/IdentityHashMap$Entry;
    :goto_6
    if-nez v0, :cond_f

    if-lez v1, :cond_f

    .line 814
    add-int/lit8 v1, v1, -0x1

    aget-object v0, v2, v1

    goto :goto_6

    .line 815
    :cond_f
    iput-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->entry:Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 816
    iput v1, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->index:I

    .line 817
    if-eqz v0, :cond_17

    const/4 v3, 0x1

    :goto_16
    return v3

    :cond_17
    const/4 v3, 0x0

    goto :goto_16
.end method

.method public next()Ljava/lang/Object;
    .registers 7

    .prologue
    .line 822
    iget-object v4, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-static {v4}, Lfreemarker/ext/util/IdentityHashMap;->access$300(Lfreemarker/ext/util/IdentityHashMap;)I

    move-result v4

    iget v5, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->expectedModCount:I

    if-eq v4, v5, :cond_10

    .line 823
    new-instance v4, Ljava/util/ConcurrentModificationException;

    invoke-direct {v4}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw v4

    .line 825
    :cond_10
    iget-object v1, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->entry:Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 826
    .local v1, "et":Lfreemarker/ext/util/IdentityHashMap$Entry;
    iget v2, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->index:I

    .line 827
    .local v2, "i":I
    iget-object v3, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 830
    .local v3, "t":[Lfreemarker/ext/util/IdentityHashMap$Entry;
    :goto_16
    if-nez v1, :cond_1f

    if-lez v2, :cond_1f

    .line 831
    add-int/lit8 v2, v2, -0x1

    aget-object v1, v3, v2

    goto :goto_16

    .line 833
    :cond_1f
    iput-object v1, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->entry:Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 834
    iput v2, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->index:I

    .line 835
    if-eqz v1, :cond_3c

    .line 837
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->entry:Lfreemarker/ext/util/IdentityHashMap$Entry;

    iput-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->lastReturned:Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 838
    .local v0, "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    iget-object v4, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    iput-object v4, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->entry:Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 839
    iget v4, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->type:I

    if-nez v4, :cond_34

    iget-object v0, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->key:Ljava/lang/Object;

    .end local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :cond_33
    :goto_33
    return-object v0

    .restart local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :cond_34
    iget v4, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->type:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_33

    iget-object v0, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    goto :goto_33

    .line 841
    .end local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :cond_3c
    new-instance v4, Ljava/util/NoSuchElementException;

    invoke-direct {v4}, Ljava/util/NoSuchElementException;-><init>()V

    throw v4
.end method

.method public remove()V
    .registers 7

    .prologue
    .line 846
    iget-object v4, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->lastReturned:Lfreemarker/ext/util/IdentityHashMap$Entry;

    if-nez v4, :cond_a

    .line 847
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    throw v4

    .line 848
    :cond_a
    iget-object v4, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-static {v4}, Lfreemarker/ext/util/IdentityHashMap;->access$300(Lfreemarker/ext/util/IdentityHashMap;)I

    move-result v4

    iget v5, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->expectedModCount:I

    if-eq v4, v5, :cond_1a

    .line 849
    new-instance v4, Ljava/util/ConcurrentModificationException;

    invoke-direct {v4}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw v4

    .line 851
    :cond_1a
    iget-object v4, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-static {v4}, Lfreemarker/ext/util/IdentityHashMap;->access$200(Lfreemarker/ext/util/IdentityHashMap;)[Lfreemarker/ext/util/IdentityHashMap$Entry;

    move-result-object v3

    .line 852
    .local v3, "tab":[Lfreemarker/ext/util/IdentityHashMap$Entry;
    iget-object v4, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->lastReturned:Lfreemarker/ext/util/IdentityHashMap$Entry;

    iget v4, v4, Lfreemarker/ext/util/IdentityHashMap$Entry;->hash:I

    const v5, 0x7fffffff

    and-int/2addr v4, v5

    array-length v5, v3

    rem-int v1, v4, v5

    .line 854
    .local v1, "index":I
    aget-object v0, v3, v1

    .local v0, "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    const/4 v2, 0x0

    .line 855
    .local v2, "prev":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :goto_2e
    if-eqz v0, :cond_57

    .line 858
    iget-object v4, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->lastReturned:Lfreemarker/ext/util/IdentityHashMap$Entry;

    if-ne v0, v4, :cond_53

    .line 860
    iget-object v4, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-static {v4}, Lfreemarker/ext/util/IdentityHashMap;->access$308(Lfreemarker/ext/util/IdentityHashMap;)I

    .line 861
    iget v4, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->expectedModCount:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->expectedModCount:I

    .line 862
    if-nez v2, :cond_4e

    .line 863
    iget-object v4, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    aput-object v4, v3, v1

    .line 866
    :goto_45
    iget-object v4, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-static {v4}, Lfreemarker/ext/util/IdentityHashMap;->access$110(Lfreemarker/ext/util/IdentityHashMap;)I

    .line 867
    const/4 v4, 0x0

    iput-object v4, p0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;->lastReturned:Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 868
    return-void

    .line 865
    :cond_4e
    iget-object v4, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    iput-object v4, v2, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    goto :goto_45

    .line 856
    :cond_53
    move-object v2, v0

    iget-object v0, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    goto :goto_2e

    .line 871
    :cond_57
    new-instance v4, Ljava/util/ConcurrentModificationException;

    invoke-direct {v4}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw v4
.end method
