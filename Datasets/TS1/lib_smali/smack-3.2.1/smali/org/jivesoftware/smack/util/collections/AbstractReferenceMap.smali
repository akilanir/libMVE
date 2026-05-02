.class public abstract Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;
.super Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;
.source "AbstractReferenceMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$WeakRef;,
        Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$SoftRef;,
        Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceMapIterator;,
        Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceValuesIterator;,
        Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceKeySetIterator;,
        Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntrySetIterator;,
        Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase;,
        Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;,
        Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceValues;,
        Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceKeySet;,
        Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntrySet;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap",
        "<TK;TV;>;"
    }
.end annotation


# static fields
.field public static final HARD:I = 0x0

.field public static final SOFT:I = 0x1

.field public static final WEAK:I = 0x2


# instance fields
.field protected keyType:I

.field protected purgeValues:Z

.field private transient queue:Ljava/lang/ref/ReferenceQueue;

.field protected valueType:I


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 126
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    invoke-direct {p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;-><init>()V

    .line 127
    return-void
.end method

.method protected constructor <init>(IIIFZ)V
    .registers 7
    .param p1, "keyType"    # I
    .param p2, "valueType"    # I
    .param p3, "capacity"    # I
    .param p4, "loadFactor"    # F
    .param p5, "purgeValues"    # Z

    .prologue
    .line 143
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    invoke-direct {p0, p3, p4}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;-><init>(IF)V

    .line 144
    const-string v0, "keyType"

    invoke-static {v0, p1}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->verify(Ljava/lang/String;I)V

    .line 145
    const-string v0, "valueType"

    invoke-static {v0, p2}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->verify(Ljava/lang/String;I)V

    .line 146
    iput p1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->keyType:I

    .line 147
    iput p2, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->valueType:I

    .line 148
    iput-boolean p5, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->purgeValues:Z

    .line 149
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;)Ljava/lang/ref/ReferenceQueue;
    .registers 2
    .param p0, "x0"    # Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;

    .prologue
    .line 79
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->queue:Ljava/lang/ref/ReferenceQueue;

    return-object v0
.end method

.method private static verify(Ljava/lang/String;I)V
    .registers 5
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "type"    # I

    .prologue
    .line 167
    if-ltz p1, :cond_5

    const/4 v0, 0x2

    if-le p1, v0, :cond_1e

    .line 168
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " must be HARD, SOFT, WEAK."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 170
    :cond_1e
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 277
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    invoke-super {p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->clear()V

    .line 278
    :cond_3
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->queue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v0}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    if-nez v0, :cond_3

    .line 280
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    const/4 v1, 0x0

    .line 200
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->purgeBeforeRead()V

    .line 201
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->getEntry(Ljava/lang/Object;)Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    move-result-object v0

    .line 202
    .local v0, "entry":Ljava/util/Map$Entry;
    if-nez v0, :cond_b

    .line 205
    :cond_a
    :goto_a
    return v1

    :cond_b
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_a

    const/4 v1, 0x1

    goto :goto_a
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 215
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->purgeBeforeRead()V

    .line 216
    if-nez p1, :cond_7

    .line 217
    const/4 v0, 0x0

    .line 219
    :goto_6
    return v0

    :cond_7
    invoke-super {p0, p1}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_6
.end method

.method public createEntry(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;ILjava/lang/Object;Ljava/lang/Object;)Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
    .registers 11
    .param p2, "hashCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;ITK;TV;)",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 451
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    .local p1, "next":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    .local p3, "key":Ljava/lang/Object;, "TK;"
    .local p4, "value":Ljava/lang/Object;, "TV;"
    new-instance v0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;

    move-object v2, p1

    check-cast v2, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;

    move-object v1, p0

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;-><init>(Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;ILjava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method protected createEntrySetIterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 460
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    new-instance v0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntrySetIterator;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntrySetIterator;-><init>(Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;)V

    return-object v0
.end method

.method protected createKeySetIterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 469
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    new-instance v0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceKeySetIterator;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceKeySetIterator;-><init>(Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;)V

    return-object v0
.end method

.method protected createValuesIterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 478
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    new-instance v0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceValuesIterator;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceValuesIterator;-><init>(Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;)V

    return-object v0
.end method

.method protected doReadObject(Ljava/io/ObjectInputStream;)V
    .registers 7
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 1006
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v3

    iput v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->keyType:I

    .line 1007
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v3

    iput v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->valueType:I

    .line 1008
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v3

    iput-boolean v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->purgeValues:Z

    .line 1009
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readFloat()F

    move-result v3

    iput v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->loadFactor:F

    .line 1010
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    .line 1011
    .local v0, "capacity":I
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->init()V

    .line 1012
    new-array v3, v0, [Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    iput-object v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    .line 1014
    :goto_23
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    .line 1015
    .local v1, "key":Ljava/lang/Object;, "TK;"
    if-nez v1, :cond_35

    .line 1021
    iget-object v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    array-length v3, v3

    iget v4, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->loadFactor:F

    invoke-virtual {p0, v3, v4}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->calculateThreshold(IF)I

    move-result v3

    iput v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->threshold:I

    .line 1023
    return-void

    .line 1018
    :cond_35
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v2

    .line 1019
    .local v2, "value":Ljava/lang/Object;, "TV;"
    invoke-virtual {p0, v1, v2}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_23
.end method

.method protected doWriteObject(Ljava/io/ObjectOutputStream;)V
    .registers 4
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 975
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    iget v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->keyType:I

    invoke-virtual {p1, v1}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 976
    iget v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->valueType:I

    invoke-virtual {p1, v1}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 977
    iget-boolean v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->purgeValues:Z

    invoke-virtual {p1, v1}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 978
    iget v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->loadFactor:F

    invoke-virtual {p1, v1}, Ljava/io/ObjectOutputStream;->writeFloat(F)V

    .line 979
    iget-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    array-length v1, v1

    invoke-virtual {p1, v1}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 980
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->mapIterator()Lorg/jivesoftware/smack/util/collections/MapIterator;

    move-result-object v0

    .local v0, "it":Lorg/jivesoftware/smack/util/collections/MapIterator;
    :goto_1e
    invoke-interface {v0}, Lorg/jivesoftware/smack/util/collections/MapIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_33

    .line 981
    invoke-interface {v0}, Lorg/jivesoftware/smack/util/collections/MapIterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 982
    invoke-interface {v0}, Lorg/jivesoftware/smack/util/collections/MapIterator;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    goto :goto_1e

    .line 984
    :cond_33
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 986
    return-void
.end method

.method public entrySet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 301
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->entrySet:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$EntrySet;

    if-nez v0, :cond_b

    .line 302
    new-instance v0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntrySet;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntrySet;-><init>(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->entrySet:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$EntrySet;

    .line 304
    :cond_b
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->entrySet:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$EntrySet;

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 229
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->purgeBeforeRead()V

    .line 230
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->getEntry(Ljava/lang/Object;)Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    move-result-object v0

    .line 231
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    if-nez v0, :cond_b

    .line 232
    const/4 v1, 0x0

    .line 234
    :goto_a
    return-object v1

    :cond_b
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    goto :goto_a
.end method

.method protected getEntry(Ljava/lang/Object;)Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 403
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    if-nez p1, :cond_4

    .line 404
    const/4 v0, 0x0

    .line 406
    :goto_3
    return-object v0

    :cond_4
    invoke-super {p0, p1}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->getEntry(Ljava/lang/Object;)Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    move-result-object v0

    goto :goto_3
.end method

.method protected hashEntry(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 5
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    const/4 v0, 0x0

    .line 419
    if-nez p1, :cond_8

    move v1, v0

    :goto_4
    if-nez p2, :cond_d

    :goto_6
    xor-int/2addr v0, v1

    return v0

    :cond_8
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_4

    :cond_d
    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_6
.end method

.method protected init()V
    .registers 2

    .prologue
    .line 155
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->queue:Ljava/lang/ref/ReferenceQueue;

    .line 156
    return-void
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 189
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->purgeBeforeRead()V

    .line 190
    invoke-super {p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method protected isEqualKey(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .param p1, "key1"    # Ljava/lang/Object;
    .param p2, "key2"    # Ljava/lang/Object;

    .prologue
    .line 438
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    if-eq p1, p2, :cond_8

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public keySet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 313
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->keySet:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$KeySet;

    if-nez v0, :cond_b

    .line 314
    new-instance v0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceKeySet;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceKeySet;-><init>(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->keySet:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$KeySet;

    .line 316
    :cond_b
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->keySet:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$KeySet;

    return-object v0
.end method

.method public mapIterator()Lorg/jivesoftware/smack/util/collections/MapIterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/jivesoftware/smack/util/collections/MapIterator",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 290
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    new-instance v0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceMapIterator;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceMapIterator;-><init>(Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;)V

    return-object v0
.end method

.method protected purge()V
    .registers 3

    .prologue
    .line 359
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    iget-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->queue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v1}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    .line 360
    .local v0, "ref":Ljava/lang/ref/Reference;
    :goto_6
    if-eqz v0, :cond_12

    .line 361
    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->purge(Ljava/lang/ref/Reference;)V

    .line 362
    iget-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->queue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v1}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    goto :goto_6

    .line 364
    :cond_12
    return-void
.end method

.method protected purge(Ljava/lang/ref/Reference;)V
    .registers 8
    .param p1, "ref"    # Ljava/lang/ref/Reference;

    .prologue
    .line 375
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    .line 376
    .local v1, "hash":I
    iget-object v4, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    array-length v4, v4

    invoke-virtual {p0, v1, v4}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->hashIndex(II)I

    move-result v2

    .line 377
    .local v2, "index":I
    const/4 v3, 0x0

    .line 378
    .local v3, "previous":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    iget-object v4, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    aget-object v0, v4, v2

    .line 379
    .local v0, "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    :goto_10
    if-eqz v0, :cond_29

    move-object v4, v0

    .line 380
    check-cast v4, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;

    invoke-virtual {v4, p1}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry;->purge(Ljava/lang/ref/Reference;)Z

    move-result v4

    if-eqz v4, :cond_2f

    .line 381
    if-nez v3, :cond_2a

    .line 382
    iget-object v4, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    iget-object v5, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    aput-object v5, v4, v2

    .line 386
    :goto_23
    iget v4, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->size:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->size:I

    .line 393
    :cond_29
    return-void

    .line 384
    :cond_2a
    iget-object v4, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    iput-object v4, v3, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    goto :goto_23

    .line 389
    :cond_2f
    move-object v3, v0

    .line 390
    iget-object v0, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    goto :goto_10
.end method

.method protected purgeBeforeRead()V
    .registers 1

    .prologue
    .line 338
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->purge()V

    .line 339
    return-void
.end method

.method protected purgeBeforeWrite()V
    .registers 1

    .prologue
    .line 347
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->purge()V

    .line 348
    return-void
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 248
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    if-nez p1, :cond_a

    .line 249
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "null keys not allowed"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 251
    :cond_a
    if-nez p2, :cond_14

    .line 252
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "null values not allowed"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 255
    :cond_14
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->purgeBeforeWrite()V

    .line 256
    invoke-super {p0, p1, p2}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 266
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    if-nez p1, :cond_4

    .line 267
    const/4 v0, 0x0

    .line 270
    :goto_3
    return-object v0

    .line 269
    :cond_4
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->purgeBeforeWrite()V

    .line 270
    invoke-super {p0, p1}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_3
.end method

.method public size()I
    .registers 2

    .prologue
    .line 179
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->purgeBeforeRead()V

    .line 180
    invoke-super {p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->size()I

    move-result v0

    return v0
.end method

.method public values()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 325
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;, "Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap<TK;TV;>;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->values:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$Values;

    if-nez v0, :cond_b

    .line 326
    new-instance v0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceValues;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceValues;-><init>(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->values:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$Values;

    .line 328
    :cond_b
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractReferenceMap;->values:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$Values;

    return-object v0
.end method
