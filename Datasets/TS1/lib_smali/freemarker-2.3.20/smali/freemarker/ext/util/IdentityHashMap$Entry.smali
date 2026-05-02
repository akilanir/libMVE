.class Lfreemarker/ext/util/IdentityHashMap$Entry;
.super Ljava/lang/Object;
.source "IdentityHashMap.java"

# interfaces
.implements Ljava/util/Map$Entry;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/util/IdentityHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Entry"
.end annotation


# instance fields
.field hash:I

.field key:Ljava/lang/Object;

.field next:Lfreemarker/ext/util/IdentityHashMap$Entry;

.field value:Ljava/lang/Object;


# direct methods
.method constructor <init>(ILjava/lang/Object;Ljava/lang/Object;Lfreemarker/ext/util/IdentityHashMap$Entry;)V
    .registers 5
    .param p1, "hash"    # I
    .param p2, "key"    # Ljava/lang/Object;
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "next"    # Lfreemarker/ext/util/IdentityHashMap$Entry;

    .prologue
    .line 696
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 697
    iput p1, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->hash:I

    .line 698
    iput-object p2, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->key:Ljava/lang/Object;

    .line 699
    iput-object p3, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    .line 700
    iput-object p4, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 701
    return-void
.end method


# virtual methods
.method protected clone()Ljava/lang/Object;
    .registers 6

    .prologue
    .line 705
    new-instance v1, Lfreemarker/ext/util/IdentityHashMap$Entry;

    iget v2, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->hash:I

    iget-object v3, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->key:Ljava/lang/Object;

    iget-object v4, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    if-nez v0, :cond_11

    const/4 v0, 0x0

    :goto_d
    invoke-direct {v1, v2, v3, v4, v0}, Lfreemarker/ext/util/IdentityHashMap$Entry;-><init>(ILjava/lang/Object;Ljava/lang/Object;Lfreemarker/ext/util/IdentityHashMap$Entry;)V

    return-object v1

    :cond_11
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    invoke-virtual {v0}, Lfreemarker/ext/util/IdentityHashMap$Entry;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/ext/util/IdentityHashMap$Entry;

    goto :goto_d
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 733
    instance-of v2, p1, Ljava/util/Map$Entry;

    if-nez v2, :cond_6

    .line 737
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 735
    check-cast v0, Ljava/util/Map$Entry;

    .line 737
    .local v0, "e":Ljava/util/Map$Entry;
    iget-object v2, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->key:Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    if-ne v2, v3, :cond_5

    iget-object v2, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    if-nez v2, :cond_1d

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_5

    :goto_1b
    const/4 v1, 0x1

    goto :goto_5

    :cond_1d
    iget-object v2, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    goto :goto_1b
.end method

.method public getKey()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 716
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->key:Ljava/lang/Object;

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 721
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 745
    iget v1, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->hash:I

    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    if-nez v0, :cond_9

    const/4 v0, 0x0

    :goto_7
    xor-int/2addr v0, v1

    return v0

    :cond_9
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_7
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 726
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    .line 727
    .local v0, "oldValue":Ljava/lang/Object;
    iput-object p1, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    .line 728
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 750
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->key:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
