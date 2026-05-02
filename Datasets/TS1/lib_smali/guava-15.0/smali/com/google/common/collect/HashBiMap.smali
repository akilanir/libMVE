.class public final Lcom/google/common/collect/HashBiMap;
.super Ljava/util/AbstractMap;
.source "HashBiMap.java"

# interfaces
.implements Lcom/google/common/collect/BiMap;
.implements Ljava/io/Serializable;


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
    emulated = true
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/HashBiMap$1;,
        Lcom/google/common/collect/HashBiMap$InverseSerializedForm;,
        Lcom/google/common/collect/HashBiMap$Inverse;,
        Lcom/google/common/collect/HashBiMap$EntrySet;,
        Lcom/google/common/collect/HashBiMap$KeySet;,
        Lcom/google/common/collect/HashBiMap$Itr;,
        Lcom/google/common/collect/HashBiMap$BiEntry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractMap",
        "<TK;TV;>;",
        "Lcom/google/common/collect/BiMap",
        "<TK;TV;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final LOAD_FACTOR:D = 1.0

.field private static final serialVersionUID:J
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "Not needed in emulated source"
    .end annotation
.end field


# instance fields
.field private transient hashTableKToV:[Lcom/google/common/collect/HashBiMap$BiEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lcom/google/common/collect/HashBiMap$BiEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private transient hashTableVToK:[Lcom/google/common/collect/HashBiMap$BiEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lcom/google/common/collect/HashBiMap$BiEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private transient inverse:Lcom/google/common/collect/BiMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/BiMap",
            "<TV;TK;>;"
        }
    .end annotation
.end field

.field private transient mask:I

.field private transient modCount:I

.field private transient size:I


# direct methods
.method private constructor <init>(I)V
    .registers 2
    .param p1, "expectedSize"    # I

    .prologue
    .line 105
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 106
    invoke-direct {p0, p1}, Lcom/google/common/collect/HashBiMap;->init(I)V

    .line 107
    return-void
.end method

.method static synthetic access$000(Lcom/google/common/collect/HashBiMap;)I
    .registers 2
    .param p0, "x0"    # Lcom/google/common/collect/HashBiMap;

    .prologue
    .line 51
    iget v0, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    return v0
.end method

.method static synthetic access$100(Lcom/google/common/collect/HashBiMap;)[Lcom/google/common/collect/HashBiMap$BiEntry;
    .registers 2
    .param p0, "x0"    # Lcom/google/common/collect/HashBiMap;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->hashTableKToV:[Lcom/google/common/collect/HashBiMap$BiEntry;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/google/common/collect/HashBiMap;Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 5
    .param p0, "x0"    # Lcom/google/common/collect/HashBiMap;
    .param p1, "x1"    # Ljava/lang/Object;
    .param p2, "x2"    # Ljava/lang/Object;
    .param p3, "x3"    # Z

    .prologue
    .line 51
    invoke-direct {p0, p1, p2, p3}, Lcom/google/common/collect/HashBiMap;->putInverse(Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/google/common/collect/HashBiMap;Lcom/google/common/collect/HashBiMap$BiEntry;)V
    .registers 2
    .param p0, "x0"    # Lcom/google/common/collect/HashBiMap;
    .param p1, "x1"    # Lcom/google/common/collect/HashBiMap$BiEntry;

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/google/common/collect/HashBiMap;->delete(Lcom/google/common/collect/HashBiMap$BiEntry;)V

    return-void
.end method

.method static synthetic access$300(Ljava/lang/Object;)I
    .registers 2
    .param p0, "x0"    # Ljava/lang/Object;

    .prologue
    .line 51
    invoke-static {p0}, Lcom/google/common/collect/HashBiMap;->hash(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/google/common/collect/HashBiMap;Ljava/lang/Object;I)Lcom/google/common/collect/HashBiMap$BiEntry;
    .registers 4
    .param p0, "x0"    # Lcom/google/common/collect/HashBiMap;
    .param p1, "x1"    # Ljava/lang/Object;
    .param p2, "x2"    # I

    .prologue
    .line 51
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/HashBiMap;->seekByKey(Ljava/lang/Object;I)Lcom/google/common/collect/HashBiMap$BiEntry;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/google/common/collect/HashBiMap;Ljava/lang/Object;I)Lcom/google/common/collect/HashBiMap$BiEntry;
    .registers 4
    .param p0, "x0"    # Lcom/google/common/collect/HashBiMap;
    .param p1, "x1"    # Ljava/lang/Object;
    .param p2, "x2"    # I

    .prologue
    .line 51
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/HashBiMap;->seekByValue(Ljava/lang/Object;I)Lcom/google/common/collect/HashBiMap$BiEntry;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lcom/google/common/collect/HashBiMap;Lcom/google/common/collect/HashBiMap$BiEntry;)V
    .registers 2
    .param p0, "x0"    # Lcom/google/common/collect/HashBiMap;
    .param p1, "x1"    # Lcom/google/common/collect/HashBiMap$BiEntry;

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/google/common/collect/HashBiMap;->insert(Lcom/google/common/collect/HashBiMap$BiEntry;)V

    return-void
.end method

.method static synthetic access$900(Lcom/google/common/collect/HashBiMap;)I
    .registers 2
    .param p0, "x0"    # Lcom/google/common/collect/HashBiMap;

    .prologue
    .line 51
    iget v0, p0, Lcom/google/common/collect/HashBiMap;->size:I

    return v0
.end method

.method public static create()Lcom/google/common/collect/HashBiMap;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/google/common/collect/HashBiMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 57
    const/16 v0, 0x10

    invoke-static {v0}, Lcom/google/common/collect/HashBiMap;->create(I)Lcom/google/common/collect/HashBiMap;

    move-result-object v0

    return-object v0
.end method

.method public static create(I)Lcom/google/common/collect/HashBiMap;
    .registers 2
    .param p0, "expectedSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(I)",
            "Lcom/google/common/collect/HashBiMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 67
    new-instance v0, Lcom/google/common/collect/HashBiMap;

    invoke-direct {v0, p0}, Lcom/google/common/collect/HashBiMap;-><init>(I)V

    return-object v0
.end method

.method public static create(Ljava/util/Map;)Lcom/google/common/collect/HashBiMap;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)",
            "Lcom/google/common/collect/HashBiMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 75
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v1

    invoke-static {v1}, Lcom/google/common/collect/HashBiMap;->create(I)Lcom/google/common/collect/HashBiMap;

    move-result-object v0

    .line 76
    .local v0, "bimap":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    invoke-virtual {v0, p0}, Lcom/google/common/collect/HashBiMap;->putAll(Ljava/util/Map;)V

    .line 77
    return-object v0
.end method

.method private createTable(I)[Lcom/google/common/collect/HashBiMap$BiEntry;
    .registers 3
    .param p1, "length"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)[",
            "Lcom/google/common/collect/HashBiMap$BiEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 303
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    new-array v0, p1, [Lcom/google/common/collect/HashBiMap$BiEntry;

    return-object v0
.end method

.method private delete(Lcom/google/common/collect/HashBiMap$BiEntry;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/HashBiMap$BiEntry",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 124
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    .local p1, "entry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    iget v4, p1, Lcom/google/common/collect/HashBiMap$BiEntry;->keyHash:I

    iget v5, p0, Lcom/google/common/collect/HashBiMap;->mask:I

    and-int v1, v4, v5

    .line 125
    .local v1, "keyBucket":I
    const/4 v2, 0x0

    .line 126
    .local v2, "prevBucketEntry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    iget-object v4, p0, Lcom/google/common/collect/HashBiMap;->hashTableKToV:[Lcom/google/common/collect/HashBiMap$BiEntry;

    aget-object v0, v4, v1

    .line 128
    .local v0, "bucketEntry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    :goto_b
    if-ne v0, p1, :cond_3c

    .line 129
    if-nez v2, :cond_37

    .line 130
    iget-object v4, p0, Lcom/google/common/collect/HashBiMap;->hashTableKToV:[Lcom/google/common/collect/HashBiMap$BiEntry;

    iget-object v5, p1, Lcom/google/common/collect/HashBiMap$BiEntry;->nextInKToVBucket:Lcom/google/common/collect/HashBiMap$BiEntry;

    aput-object v5, v4, v1

    .line 139
    :goto_15
    iget v4, p1, Lcom/google/common/collect/HashBiMap$BiEntry;->valueHash:I

    iget v5, p0, Lcom/google/common/collect/HashBiMap;->mask:I

    and-int v3, v4, v5

    .line 140
    .local v3, "valueBucket":I
    const/4 v2, 0x0

    .line 141
    iget-object v4, p0, Lcom/google/common/collect/HashBiMap;->hashTableVToK:[Lcom/google/common/collect/HashBiMap$BiEntry;

    aget-object v0, v4, v3

    .line 143
    :goto_20
    if-ne v0, p1, :cond_45

    .line 144
    if-nez v2, :cond_40

    .line 145
    iget-object v4, p0, Lcom/google/common/collect/HashBiMap;->hashTableVToK:[Lcom/google/common/collect/HashBiMap$BiEntry;

    iget-object v5, p1, Lcom/google/common/collect/HashBiMap$BiEntry;->nextInVToKBucket:Lcom/google/common/collect/HashBiMap$BiEntry;

    aput-object v5, v4, v3

    .line 154
    :goto_2a
    iget v4, p0, Lcom/google/common/collect/HashBiMap;->size:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lcom/google/common/collect/HashBiMap;->size:I

    .line 155
    iget v4, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    .line 156
    return-void

    .line 132
    .end local v3    # "valueBucket":I
    :cond_37
    iget-object v4, p1, Lcom/google/common/collect/HashBiMap$BiEntry;->nextInKToVBucket:Lcom/google/common/collect/HashBiMap$BiEntry;

    iput-object v4, v2, Lcom/google/common/collect/HashBiMap$BiEntry;->nextInKToVBucket:Lcom/google/common/collect/HashBiMap$BiEntry;

    goto :goto_15

    .line 136
    :cond_3c
    move-object v2, v0

    .line 127
    iget-object v0, v0, Lcom/google/common/collect/HashBiMap$BiEntry;->nextInKToVBucket:Lcom/google/common/collect/HashBiMap$BiEntry;

    goto :goto_b

    .line 147
    .restart local v3    # "valueBucket":I
    :cond_40
    iget-object v4, p1, Lcom/google/common/collect/HashBiMap$BiEntry;->nextInVToKBucket:Lcom/google/common/collect/HashBiMap$BiEntry;

    iput-object v4, v2, Lcom/google/common/collect/HashBiMap$BiEntry;->nextInVToKBucket:Lcom/google/common/collect/HashBiMap$BiEntry;

    goto :goto_2a

    .line 151
    :cond_45
    move-object v2, v0

    .line 142
    iget-object v0, v0, Lcom/google/common/collect/HashBiMap$BiEntry;->nextInVToKBucket:Lcom/google/common/collect/HashBiMap$BiEntry;

    goto :goto_20
.end method

.method private static hash(Ljava/lang/Object;)I
    .registers 2
    .param p0, "o"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 172
    if-nez p0, :cond_8

    const/4 v0, 0x0

    :goto_3
    invoke-static {v0}, Lcom/google/common/collect/Hashing;->smear(I)I

    move-result v0

    return v0

    :cond_8
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_3
.end method

.method private init(I)V
    .registers 8
    .param p1, "expectedSize"    # I

    .prologue
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 110
    if-ltz p1, :cond_2d

    move v1, v2

    :goto_5
    const-string v4, "expectedSize must be >= 0 but was %s"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v3

    invoke-static {v1, v4, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 111
    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    invoke-static {p1, v1, v2}, Lcom/google/common/collect/Hashing;->closedTableSize(ID)I

    move-result v0

    .line 112
    .local v0, "tableSize":I
    invoke-direct {p0, v0}, Lcom/google/common/collect/HashBiMap;->createTable(I)[Lcom/google/common/collect/HashBiMap$BiEntry;

    move-result-object v1

    iput-object v1, p0, Lcom/google/common/collect/HashBiMap;->hashTableKToV:[Lcom/google/common/collect/HashBiMap$BiEntry;

    .line 113
    invoke-direct {p0, v0}, Lcom/google/common/collect/HashBiMap;->createTable(I)[Lcom/google/common/collect/HashBiMap$BiEntry;

    move-result-object v1

    iput-object v1, p0, Lcom/google/common/collect/HashBiMap;->hashTableVToK:[Lcom/google/common/collect/HashBiMap$BiEntry;

    .line 114
    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lcom/google/common/collect/HashBiMap;->mask:I

    .line 115
    iput v3, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    .line 116
    iput v3, p0, Lcom/google/common/collect/HashBiMap;->size:I

    .line 117
    return-void

    .end local v0    # "tableSize":I
    :cond_2d
    move v1, v3

    .line 110
    goto :goto_5
.end method

.method private insert(Lcom/google/common/collect/HashBiMap$BiEntry;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/HashBiMap$BiEntry",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 159
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    .local p1, "entry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    iget v2, p1, Lcom/google/common/collect/HashBiMap$BiEntry;->keyHash:I

    iget v3, p0, Lcom/google/common/collect/HashBiMap;->mask:I

    and-int v0, v2, v3

    .line 160
    .local v0, "keyBucket":I
    iget-object v2, p0, Lcom/google/common/collect/HashBiMap;->hashTableKToV:[Lcom/google/common/collect/HashBiMap$BiEntry;

    aget-object v2, v2, v0

    iput-object v2, p1, Lcom/google/common/collect/HashBiMap$BiEntry;->nextInKToVBucket:Lcom/google/common/collect/HashBiMap$BiEntry;

    .line 161
    iget-object v2, p0, Lcom/google/common/collect/HashBiMap;->hashTableKToV:[Lcom/google/common/collect/HashBiMap$BiEntry;

    aput-object p1, v2, v0

    .line 163
    iget v2, p1, Lcom/google/common/collect/HashBiMap$BiEntry;->valueHash:I

    iget v3, p0, Lcom/google/common/collect/HashBiMap;->mask:I

    and-int v1, v2, v3

    .line 164
    .local v1, "valueBucket":I
    iget-object v2, p0, Lcom/google/common/collect/HashBiMap;->hashTableVToK:[Lcom/google/common/collect/HashBiMap$BiEntry;

    aget-object v2, v2, v1

    iput-object v2, p1, Lcom/google/common/collect/HashBiMap$BiEntry;->nextInVToKBucket:Lcom/google/common/collect/HashBiMap$BiEntry;

    .line 165
    iget-object v2, p0, Lcom/google/common/collect/HashBiMap;->hashTableVToK:[Lcom/google/common/collect/HashBiMap$BiEntry;

    aput-object p1, v2, v1

    .line 167
    iget v2, p0, Lcom/google/common/collect/HashBiMap;->size:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/google/common/collect/HashBiMap;->size:I

    .line 168
    iget v2, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    .line 169
    return-void
.end method

.method private put(Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 12
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "force"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;Z)TV;"
        }
    .end annotation

    .prologue
    .line 223
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    invoke-static {p1}, Lcom/google/common/collect/HashBiMap;->hash(Ljava/lang/Object;)I

    move-result v0

    .line 224
    .local v0, "keyHash":I
    invoke-static {p2}, Lcom/google/common/collect/HashBiMap;->hash(Ljava/lang/Object;)I

    move-result v4

    .line 226
    .local v4, "valueHash":I
    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/HashBiMap;->seekByKey(Ljava/lang/Object;I)Lcom/google/common/collect/HashBiMap$BiEntry;

    move-result-object v2

    .line 227
    .local v2, "oldEntryForKey":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    if-eqz v2, :cond_1b

    iget v5, v2, Lcom/google/common/collect/HashBiMap$BiEntry;->valueHash:I

    if-ne v4, v5, :cond_1b

    iget-object v5, v2, Lcom/google/common/collect/HashBiMap$BiEntry;->value:Ljava/lang/Object;

    invoke-static {p2, v5}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1b

    .line 247
    .end local p2    # "value":Ljava/lang/Object;, "TV;"
    :goto_1a
    return-object p2

    .line 232
    .restart local p2    # "value":Ljava/lang/Object;, "TV;"
    :cond_1b
    invoke-direct {p0, p2, v4}, Lcom/google/common/collect/HashBiMap;->seekByValue(Ljava/lang/Object;I)Lcom/google/common/collect/HashBiMap$BiEntry;

    move-result-object v3

    .line 233
    .local v3, "oldEntryForValue":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    if-eqz v3, :cond_26

    .line 234
    if-eqz p3, :cond_3b

    .line 235
    invoke-direct {p0, v3}, Lcom/google/common/collect/HashBiMap;->delete(Lcom/google/common/collect/HashBiMap$BiEntry;)V

    .line 241
    :cond_26
    if-eqz v2, :cond_2b

    .line 242
    invoke-direct {p0, v2}, Lcom/google/common/collect/HashBiMap;->delete(Lcom/google/common/collect/HashBiMap$BiEntry;)V

    .line 244
    :cond_2b
    new-instance v1, Lcom/google/common/collect/HashBiMap$BiEntry;

    invoke-direct {v1, p1, v0, p2, v4}, Lcom/google/common/collect/HashBiMap$BiEntry;-><init>(Ljava/lang/Object;ILjava/lang/Object;I)V

    .line 245
    .local v1, "newEntry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    invoke-direct {p0, v1}, Lcom/google/common/collect/HashBiMap;->insert(Lcom/google/common/collect/HashBiMap$BiEntry;)V

    .line 246
    invoke-direct {p0}, Lcom/google/common/collect/HashBiMap;->rehashIfNecessary()V

    .line 247
    if-nez v2, :cond_54

    const/4 v5, 0x0

    :goto_39
    move-object p2, v5

    goto :goto_1a

    .line 237
    .end local v1    # "newEntry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    :cond_3b
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "value already present: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 247
    .restart local v1    # "newEntry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    :cond_54
    iget-object v5, v2, Lcom/google/common/collect/HashBiMap$BiEntry;->value:Ljava/lang/Object;

    goto :goto_39
.end method

.method private putInverse(Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 12
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "force"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;TK;Z)TK;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 252
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    .local p1, "value":Ljava/lang/Object;, "TV;"
    .local p2, "key":Ljava/lang/Object;, "TK;"
    invoke-static {p1}, Lcom/google/common/collect/HashBiMap;->hash(Ljava/lang/Object;)I

    move-result v4

    .line 253
    .local v4, "valueHash":I
    invoke-static {p2}, Lcom/google/common/collect/HashBiMap;->hash(Ljava/lang/Object;)I

    move-result v0

    .line 255
    .local v0, "keyHash":I
    invoke-direct {p0, p1, v4}, Lcom/google/common/collect/HashBiMap;->seekByValue(Ljava/lang/Object;I)Lcom/google/common/collect/HashBiMap$BiEntry;

    move-result-object v3

    .line 256
    .local v3, "oldEntryForValue":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    if-eqz v3, :cond_1b

    iget v5, v3, Lcom/google/common/collect/HashBiMap$BiEntry;->keyHash:I

    if-ne v0, v5, :cond_1b

    iget-object v5, v3, Lcom/google/common/collect/HashBiMap$BiEntry;->key:Ljava/lang/Object;

    invoke-static {p2, v5}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1b

    .line 276
    .end local p2    # "key":Ljava/lang/Object;, "TK;"
    :goto_1a
    return-object p2

    .line 261
    .restart local p2    # "key":Ljava/lang/Object;, "TK;"
    :cond_1b
    invoke-direct {p0, p2, v0}, Lcom/google/common/collect/HashBiMap;->seekByKey(Ljava/lang/Object;I)Lcom/google/common/collect/HashBiMap$BiEntry;

    move-result-object v2

    .line 262
    .local v2, "oldEntryForKey":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    if-eqz v2, :cond_26

    .line 263
    if-eqz p3, :cond_3b

    .line 264
    invoke-direct {p0, v2}, Lcom/google/common/collect/HashBiMap;->delete(Lcom/google/common/collect/HashBiMap$BiEntry;)V

    .line 270
    :cond_26
    if-eqz v3, :cond_2b

    .line 271
    invoke-direct {p0, v3}, Lcom/google/common/collect/HashBiMap;->delete(Lcom/google/common/collect/HashBiMap$BiEntry;)V

    .line 273
    :cond_2b
    new-instance v1, Lcom/google/common/collect/HashBiMap$BiEntry;

    invoke-direct {v1, p2, v0, p1, v4}, Lcom/google/common/collect/HashBiMap$BiEntry;-><init>(Ljava/lang/Object;ILjava/lang/Object;I)V

    .line 274
    .local v1, "newEntry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    invoke-direct {p0, v1}, Lcom/google/common/collect/HashBiMap;->insert(Lcom/google/common/collect/HashBiMap$BiEntry;)V

    .line 275
    invoke-direct {p0}, Lcom/google/common/collect/HashBiMap;->rehashIfNecessary()V

    .line 276
    if-nez v3, :cond_54

    const/4 v5, 0x0

    :goto_39
    move-object p2, v5

    goto :goto_1a

    .line 266
    .end local v1    # "newEntry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    :cond_3b
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "value already present: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 276
    .restart local v1    # "newEntry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    :cond_54
    iget-object v5, v3, Lcom/google/common/collect/HashBiMap$BiEntry;->key:Ljava/lang/Object;

    goto :goto_39
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 3
    .param p1, "stream"    # Ljava/io/ObjectInputStream;
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "java.io.ObjectInputStream"
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 658
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 659
    invoke-static {p1}, Lcom/google/common/collect/Serialization;->readCount(Ljava/io/ObjectInputStream;)I

    move-result v0

    .line 660
    .local v0, "size":I
    invoke-direct {p0, v0}, Lcom/google/common/collect/HashBiMap;->init(I)V

    .line 661
    invoke-static {p0, p1, v0}, Lcom/google/common/collect/Serialization;->populateMap(Ljava/util/Map;Ljava/io/ObjectInputStream;I)V

    .line 662
    return-void
.end method

.method private rehashIfNecessary()V
    .registers 10

    .prologue
    .line 280
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    iget-object v4, p0, Lcom/google/common/collect/HashBiMap;->hashTableKToV:[Lcom/google/common/collect/HashBiMap$BiEntry;

    .line 281
    .local v4, "oldKToV":[Lcom/google/common/collect/HashBiMap$BiEntry;, "[Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    iget v5, p0, Lcom/google/common/collect/HashBiMap;->size:I

    array-length v6, v4

    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    invoke-static {v5, v6, v7, v8}, Lcom/google/common/collect/Hashing;->needsResizing(IID)Z

    move-result v5

    if-eqz v5, :cond_3b

    .line 282
    array-length v5, v4

    mul-int/lit8 v2, v5, 0x2

    .line 284
    .local v2, "newTableSize":I
    invoke-direct {p0, v2}, Lcom/google/common/collect/HashBiMap;->createTable(I)[Lcom/google/common/collect/HashBiMap$BiEntry;

    move-result-object v5

    iput-object v5, p0, Lcom/google/common/collect/HashBiMap;->hashTableKToV:[Lcom/google/common/collect/HashBiMap$BiEntry;

    .line 285
    invoke-direct {p0, v2}, Lcom/google/common/collect/HashBiMap;->createTable(I)[Lcom/google/common/collect/HashBiMap$BiEntry;

    move-result-object v5

    iput-object v5, p0, Lcom/google/common/collect/HashBiMap;->hashTableVToK:[Lcom/google/common/collect/HashBiMap$BiEntry;

    .line 286
    add-int/lit8 v5, v2, -0x1

    iput v5, p0, Lcom/google/common/collect/HashBiMap;->mask:I

    .line 287
    const/4 v5, 0x0

    iput v5, p0, Lcom/google/common/collect/HashBiMap;->size:I

    .line 289
    const/4 v0, 0x0

    .local v0, "bucket":I
    :goto_24
    array-length v5, v4

    if-ge v0, v5, :cond_35

    .line 290
    aget-object v1, v4, v0

    .line 291
    .local v1, "entry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    :goto_29
    if-eqz v1, :cond_32

    .line 292
    iget-object v3, v1, Lcom/google/common/collect/HashBiMap$BiEntry;->nextInKToVBucket:Lcom/google/common/collect/HashBiMap$BiEntry;

    .line 293
    .local v3, "nextEntry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    invoke-direct {p0, v1}, Lcom/google/common/collect/HashBiMap;->insert(Lcom/google/common/collect/HashBiMap$BiEntry;)V

    .line 294
    move-object v1, v3

    .line 295
    goto :goto_29

    .line 289
    .end local v3    # "nextEntry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    :cond_32
    add-int/lit8 v0, v0, 0x1

    goto :goto_24

    .line 297
    .end local v1    # "entry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    :cond_35
    iget v5, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    .line 299
    .end local v0    # "bucket":I
    .end local v2    # "newTableSize":I
    :cond_3b
    return-void
.end method

.method private seekByKey(Ljava/lang/Object;I)Lcom/google/common/collect/HashBiMap$BiEntry;
    .registers 6
    .param p1, "key"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "keyHash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "I)",
            "Lcom/google/common/collect/HashBiMap$BiEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 176
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->hashTableKToV:[Lcom/google/common/collect/HashBiMap$BiEntry;

    iget v2, p0, Lcom/google/common/collect/HashBiMap;->mask:I

    and-int/2addr v2, p2

    aget-object v0, v1, v2

    .local v0, "entry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    :goto_7
    if-eqz v0, :cond_19

    .line 178
    iget v1, v0, Lcom/google/common/collect/HashBiMap$BiEntry;->keyHash:I

    if-ne p2, v1, :cond_16

    iget-object v1, v0, Lcom/google/common/collect/HashBiMap$BiEntry;->key:Ljava/lang/Object;

    invoke-static {p1, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 182
    .end local v0    # "entry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    :goto_15
    return-object v0

    .line 177
    .restart local v0    # "entry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    :cond_16
    iget-object v0, v0, Lcom/google/common/collect/HashBiMap$BiEntry;->nextInKToVBucket:Lcom/google/common/collect/HashBiMap$BiEntry;

    goto :goto_7

    .line 182
    :cond_19
    const/4 v0, 0x0

    goto :goto_15
.end method

.method private seekByValue(Ljava/lang/Object;I)Lcom/google/common/collect/HashBiMap$BiEntry;
    .registers 6
    .param p1, "value"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "valueHash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "I)",
            "Lcom/google/common/collect/HashBiMap$BiEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 186
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->hashTableVToK:[Lcom/google/common/collect/HashBiMap$BiEntry;

    iget v2, p0, Lcom/google/common/collect/HashBiMap;->mask:I

    and-int/2addr v2, p2

    aget-object v0, v1, v2

    .local v0, "entry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    :goto_7
    if-eqz v0, :cond_19

    .line 188
    iget v1, v0, Lcom/google/common/collect/HashBiMap$BiEntry;->valueHash:I

    if-ne p2, v1, :cond_16

    iget-object v1, v0, Lcom/google/common/collect/HashBiMap$BiEntry;->value:Ljava/lang/Object;

    invoke-static {p1, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 192
    .end local v0    # "entry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    :goto_15
    return-object v0

    .line 187
    .restart local v0    # "entry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    :cond_16
    iget-object v0, v0, Lcom/google/common/collect/HashBiMap$BiEntry;->nextInVToKBucket:Lcom/google/common/collect/HashBiMap$BiEntry;

    goto :goto_7

    .line 192
    :cond_19
    const/4 v0, 0x0

    goto :goto_15
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 2
    .param p1, "stream"    # Ljava/io/ObjectOutputStream;
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "java.io.ObjectOutputStream"
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 652
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 653
    invoke-static {p0, p1}, Lcom/google/common/collect/Serialization;->writeMap(Ljava/util/Map;Ljava/io/ObjectOutputStream;)V

    .line 654
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 3

    .prologue
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    const/4 v1, 0x0

    .line 319
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/common/collect/HashBiMap;->size:I

    .line 320
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->hashTableKToV:[Lcom/google/common/collect/HashBiMap$BiEntry;

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 321
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->hashTableVToK:[Lcom/google/common/collect/HashBiMap$BiEntry;

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 322
    iget v0, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    .line 323
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 197
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    invoke-static {p1}, Lcom/google/common/collect/HashBiMap;->hash(Ljava/lang/Object;)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/HashBiMap;->seekByKey(Ljava/lang/Object;I)Lcom/google/common/collect/HashBiMap$BiEntry;

    move-result-object v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 202
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    invoke-static {p1}, Lcom/google/common/collect/HashBiMap;->hash(Ljava/lang/Object;)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/HashBiMap;->seekByValue(Ljava/lang/Object;I)Lcom/google/common/collect/HashBiMap$BiEntry;

    move-result-object v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public entrySet()Ljava/util/Set;
    .registers 3
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
    .line 422
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    new-instance v0, Lcom/google/common/collect/HashBiMap$EntrySet;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/HashBiMap$EntrySet;-><init>(Lcom/google/common/collect/HashBiMap;Lcom/google/common/collect/HashBiMap$1;)V

    return-object v0
.end method

.method public forcePut(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 219
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/google/common/collect/HashBiMap;->put(Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 208
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    invoke-static {p1}, Lcom/google/common/collect/HashBiMap;->hash(Ljava/lang/Object;)I

    move-result v1

    invoke-direct {p0, p1, v1}, Lcom/google/common/collect/HashBiMap;->seekByKey(Ljava/lang/Object;I)Lcom/google/common/collect/HashBiMap$BiEntry;

    move-result-object v0

    .line 209
    .local v0, "entry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    iget-object v1, v0, Lcom/google/common/collect/HashBiMap$BiEntry;->value:Ljava/lang/Object;

    goto :goto_b
.end method

.method public inverse()Lcom/google/common/collect/BiMap;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/BiMap",
            "<TV;TK;>;"
        }
    .end annotation

    .prologue
    .line 482
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->inverse:Lcom/google/common/collect/BiMap;

    if-nez v0, :cond_d

    new-instance v0, Lcom/google/common/collect/HashBiMap$Inverse;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/HashBiMap$Inverse;-><init>(Lcom/google/common/collect/HashBiMap;Lcom/google/common/collect/HashBiMap$1;)V

    iput-object v0, p0, Lcom/google/common/collect/HashBiMap;->inverse:Lcom/google/common/collect/BiMap;

    :goto_c
    return-object v0

    :cond_d
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->inverse:Lcom/google/common/collect/BiMap;

    goto :goto_c
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
    .line 385
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    new-instance v0, Lcom/google/common/collect/HashBiMap$KeySet;

    invoke-direct {v0, p0}, Lcom/google/common/collect/HashBiMap$KeySet;-><init>(Lcom/google/common/collect/HashBiMap;)V

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 214
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/common/collect/HashBiMap;->put(Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 308
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    invoke-static {p1}, Lcom/google/common/collect/HashBiMap;->hash(Ljava/lang/Object;)I

    move-result v1

    invoke-direct {p0, p1, v1}, Lcom/google/common/collect/HashBiMap;->seekByKey(Ljava/lang/Object;I)Lcom/google/common/collect/HashBiMap$BiEntry;

    move-result-object v0

    .line 309
    .local v0, "entry":Lcom/google/common/collect/HashBiMap$BiEntry;, "Lcom/google/common/collect/HashBiMap$BiEntry<TK;TV;>;"
    if-nez v0, :cond_c

    .line 310
    const/4 v1, 0x0

    .line 313
    :goto_b
    return-object v1

    .line 312
    :cond_c
    invoke-direct {p0, v0}, Lcom/google/common/collect/HashBiMap;->delete(Lcom/google/common/collect/HashBiMap$BiEntry;)V

    .line 313
    iget-object v1, v0, Lcom/google/common/collect/HashBiMap$BiEntry;->value:Ljava/lang/Object;

    goto :goto_b
.end method

.method public size()I
    .registers 2

    .prologue
    .line 327
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    iget v0, p0, Lcom/google/common/collect/HashBiMap;->size:I

    return v0
.end method

.method public bridge synthetic values()Ljava/util/Collection;
    .registers 2

    .prologue
    .line 50
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/HashBiMap;->values()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public values()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 417
    .local p0, "this":Lcom/google/common/collect/HashBiMap;, "Lcom/google/common/collect/HashBiMap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/HashBiMap;->inverse()Lcom/google/common/collect/BiMap;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/collect/BiMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method
