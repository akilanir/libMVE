.class public Lfreemarker/ext/util/IdentityHashMap;
.super Ljava/util/AbstractMap;
.source "IdentityHashMap.java"

# interfaces
.implements Ljava/util/Map;
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/ext/util/IdentityHashMap$HashIterator;,
        Lfreemarker/ext/util/IdentityHashMap$EmptyHashIterator;,
        Lfreemarker/ext/util/IdentityHashMap$Entry;
    }
.end annotation


# static fields
.field private static final ENTRIES:I = 0x2

.field private static final KEYS:I = 0x0

.field private static final VALUES:I = 0x1

.field private static emptyHashIterator:Lfreemarker/ext/util/IdentityHashMap$EmptyHashIterator; = null

.field public static final serialVersionUID:J = 0x507dac1c31660d1L


# instance fields
.field private transient count:I

.field private transient entrySet:Ljava/util/Set;

.field private transient keySet:Ljava/util/Set;

.field private loadFactor:F

.field private transient modCount:I

.field private transient table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

.field private threshold:I

.field private transient values:Ljava/util/Collection;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 759
    new-instance v0, Lfreemarker/ext/util/IdentityHashMap$EmptyHashIterator;

    invoke-direct {v0}, Lfreemarker/ext/util/IdentityHashMap$EmptyHashIterator;-><init>()V

    sput-object v0, Lfreemarker/ext/util/IdentityHashMap;->emptyHashIterator:Lfreemarker/ext/util/IdentityHashMap$EmptyHashIterator;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 155
    const/16 v0, 0xb

    const/high16 v1, 0x3f400000    # 0.75f

    invoke-direct {p0, v0, v1}, Lfreemarker/ext/util/IdentityHashMap;-><init>(IF)V

    .line 156
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "initialCapacity"    # I

    .prologue
    .line 146
    const/high16 v0, 0x3f400000    # 0.75f

    invoke-direct {p0, p1, v0}, Lfreemarker/ext/util/IdentityHashMap;-><init>(IF)V

    .line 147
    return-void
.end method

.method public constructor <init>(IF)V
    .registers 6
    .param p1, "initialCapacity"    # I
    .param p2, "loadFactor"    # F

    .prologue
    const/4 v1, 0x0

    .line 122
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 110
    const/4 v0, 0x0

    iput v0, p0, Lfreemarker/ext/util/IdentityHashMap;->modCount:I

    .line 502
    iput-object v1, p0, Lfreemarker/ext/util/IdentityHashMap;->keySet:Ljava/util/Set;

    .line 503
    iput-object v1, p0, Lfreemarker/ext/util/IdentityHashMap;->entrySet:Ljava/util/Set;

    .line 504
    iput-object v1, p0, Lfreemarker/ext/util/IdentityHashMap;->values:Ljava/util/Collection;

    .line 123
    if-gez p1, :cond_28

    .line 124
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Illegal Initial Capacity: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 126
    :cond_28
    const/4 v0, 0x0

    cmpg-float v0, p2, v0

    if-lez v0, :cond_33

    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_4c

    .line 127
    :cond_33
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Illegal Load factor: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(F)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 129
    :cond_4c
    if-nez p1, :cond_4f

    .line 130
    const/4 p1, 0x1

    .line 131
    :cond_4f
    iput p2, p0, Lfreemarker/ext/util/IdentityHashMap;->loadFactor:F

    .line 132
    new-array v0, p1, [Lfreemarker/ext/util/IdentityHashMap$Entry;

    iput-object v0, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 133
    int-to-float v0, p1

    mul-float/2addr v0, p2

    float-to-int v0, v0

    iput v0, p0, Lfreemarker/ext/util/IdentityHashMap;->threshold:I

    .line 134
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .registers 4
    .param p1, "t"    # Ljava/util/Map;

    .prologue
    .line 168
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    const/16 v1, 0xb

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/high16 v1, 0x3f400000    # 0.75f

    invoke-direct {p0, v0, v1}, Lfreemarker/ext/util/IdentityHashMap;-><init>(IF)V

    .line 169
    invoke-virtual {p0, p1}, Lfreemarker/ext/util/IdentityHashMap;->putAll(Ljava/util/Map;)V

    .line 170
    return-void
.end method

.method static access$000(Lfreemarker/ext/util/IdentityHashMap;I)Ljava/util/Iterator;
    .registers 3
    .param p0, "x0"    # Lfreemarker/ext/util/IdentityHashMap;
    .param p1, "x1"    # I

    .prologue
    .line 72
    invoke-direct {p0, p1}, Lfreemarker/ext/util/IdentityHashMap;->getHashIterator(I)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method static access$100(Lfreemarker/ext/util/IdentityHashMap;)I
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/util/IdentityHashMap;

    .prologue
    .line 72
    iget v0, p0, Lfreemarker/ext/util/IdentityHashMap;->count:I

    return v0
.end method

.method static access$110(Lfreemarker/ext/util/IdentityHashMap;)I
    .registers 3
    .param p0, "x0"    # Lfreemarker/ext/util/IdentityHashMap;

    .prologue
    .line 72
    iget v0, p0, Lfreemarker/ext/util/IdentityHashMap;->count:I

    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lfreemarker/ext/util/IdentityHashMap;->count:I

    return v0
.end method

.method static access$200(Lfreemarker/ext/util/IdentityHashMap;)[Lfreemarker/ext/util/IdentityHashMap$Entry;
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/util/IdentityHashMap;

    .prologue
    .line 72
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    return-object v0
.end method

.method static access$300(Lfreemarker/ext/util/IdentityHashMap;)I
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/util/IdentityHashMap;

    .prologue
    .line 72
    iget v0, p0, Lfreemarker/ext/util/IdentityHashMap;->modCount:I

    return v0
.end method

.method static access$308(Lfreemarker/ext/util/IdentityHashMap;)I
    .registers 3
    .param p0, "x0"    # Lfreemarker/ext/util/IdentityHashMap;

    .prologue
    .line 72
    iget v0, p0, Lfreemarker/ext/util/IdentityHashMap;->modCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lfreemarker/ext/util/IdentityHashMap;->modCount:I

    return v0
.end method

.method private getHashIterator(I)Ljava/util/Iterator;
    .registers 3
    .param p1, "type"    # I

    .prologue
    .line 675
    iget v0, p0, Lfreemarker/ext/util/IdentityHashMap;->count:I

    if-nez v0, :cond_7

    .line 677
    sget-object v0, Lfreemarker/ext/util/IdentityHashMap;->emptyHashIterator:Lfreemarker/ext/util/IdentityHashMap$EmptyHashIterator;

    .line 681
    :goto_6
    return-object v0

    :cond_7
    new-instance v0, Lfreemarker/ext/util/IdentityHashMap$HashIterator;

    invoke-direct {v0, p0, p1}, Lfreemarker/ext/util/IdentityHashMap$HashIterator;-><init>(Lfreemarker/ext/util/IdentityHashMap;I)V

    goto :goto_6
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 8
    .param p1, "s"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 920
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 923
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v2

    .line 924
    .local v2, "numBuckets":I
    new-array v5, v2, [Lfreemarker/ext/util/IdentityHashMap$Entry;

    iput-object v5, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 927
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v3

    .line 930
    .local v3, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    if-ge v0, v3, :cond_20

    .line 932
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    .line 933
    .local v1, "key":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v4

    .line 934
    .local v4, "value":Ljava/lang/Object;
    invoke-virtual {p0, v1, v4}, Lfreemarker/ext/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 930
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 936
    .end local v1    # "key":Ljava/lang/Object;
    .end local v4    # "value":Ljava/lang/Object;
    :cond_20
    return-void
.end method

.method private rehash()V
    .registers 12

    .prologue
    .line 291
    iget-object v9, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    array-length v7, v9

    .line 292
    .local v7, "oldCapacity":I
    iget-object v8, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 294
    .local v8, "oldMap":[Lfreemarker/ext/util/IdentityHashMap$Entry;
    mul-int/lit8 v9, v7, 0x2

    add-int/lit8 v4, v9, 0x1

    .line 295
    .local v4, "newCapacity":I
    new-array v5, v4, [Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 297
    .local v5, "newMap":[Lfreemarker/ext/util/IdentityHashMap$Entry;
    iget v9, p0, Lfreemarker/ext/util/IdentityHashMap;->modCount:I

    add-int/lit8 v9, v9, 0x1

    iput v9, p0, Lfreemarker/ext/util/IdentityHashMap;->modCount:I

    .line 298
    int-to-float v9, v4

    iget v10, p0, Lfreemarker/ext/util/IdentityHashMap;->loadFactor:F

    mul-float/2addr v9, v10

    float-to-int v9, v9

    iput v9, p0, Lfreemarker/ext/util/IdentityHashMap;->threshold:I

    .line 299
    iput-object v5, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 301
    move v1, v7

    .local v1, "i":I
    move v2, v1

    .end local v1    # "i":I
    .local v2, "i":I
    :goto_1c
    add-int/lit8 v1, v2, -0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    if-lez v2, :cond_38

    .line 303
    aget-object v6, v8, v1

    .local v6, "old":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :goto_22
    if-eqz v6, :cond_36

    .line 305
    move-object v0, v6

    .line 306
    .local v0, "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    iget-object v6, v6, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 308
    iget v9, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->hash:I

    const v10, 0x7fffffff

    and-int/2addr v9, v10

    rem-int v3, v9, v4

    .line 309
    .local v3, "index":I
    aget-object v9, v5, v3

    iput-object v9, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 310
    aput-object v0, v5, v3

    goto :goto_22

    .end local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    .end local v3    # "index":I
    :cond_36
    move v2, v1

    .line 311
    .end local v1    # "i":I
    .restart local v2    # "i":I
    goto :goto_1c

    .line 313
    .end local v2    # "i":I
    .end local v6    # "old":Lfreemarker/ext/util/IdentityHashMap$Entry;
    .restart local v1    # "i":I
    :cond_38
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 5
    .param p1, "s"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 890
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 893
    iget-object v2, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    array-length v2, v2

    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 896
    iget v2, p0, Lfreemarker/ext/util/IdentityHashMap;->count:I

    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 899
    iget-object v2, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    array-length v2, v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "index":I
    :goto_13
    if-ltz v1, :cond_2b

    .line 901
    iget-object v2, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    aget-object v0, v2, v1

    .line 903
    .local v0, "entry":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :goto_19
    if-eqz v0, :cond_28

    .line 905
    iget-object v2, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->key:Ljava/lang/Object;

    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 906
    iget-object v2, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 907
    iget-object v0, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    goto :goto_19

    .line 899
    :cond_28
    add-int/lit8 v1, v1, -0x1

    goto :goto_13

    .line 910
    .end local v0    # "entry":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :cond_2b
    return-void
.end method


# virtual methods
.method capacity()I
    .registers 2

    .prologue
    .line 940
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    array-length v0, v0

    return v0
.end method

.method public clear()V
    .registers 4

    .prologue
    .line 463
    iget-object v1, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 464
    .local v1, "tab":[Lfreemarker/ext/util/IdentityHashMap$Entry;
    iget v2, p0, Lfreemarker/ext/util/IdentityHashMap;->modCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lfreemarker/ext/util/IdentityHashMap;->modCount:I

    .line 465
    array-length v0, v1

    .local v0, "index":I
    :goto_9
    add-int/lit8 v0, v0, -0x1

    if-ltz v0, :cond_11

    .line 466
    const/4 v2, 0x0

    aput-object v2, v1, v0

    goto :goto_9

    .line 467
    :cond_11
    const/4 v2, 0x0

    iput v2, p0, Lfreemarker/ext/util/IdentityHashMap;->count:I

    .line 468
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .registers 8

    .prologue
    const/4 v5, 0x0

    .line 480
    :try_start_1
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfreemarker/ext/util/IdentityHashMap;

    .line 481
    .local v3, "t":Lfreemarker/ext/util/IdentityHashMap;
    iget-object v4, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    array-length v4, v4

    new-array v4, v4, [Lfreemarker/ext/util/IdentityHashMap$Entry;

    iput-object v4, v3, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 482
    iget-object v4, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    array-length v1, v4

    .local v1, "i":I
    move v2, v1

    .end local v1    # "i":I
    .local v2, "i":I
    :goto_12
    add-int/lit8 v1, v2, -0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    if-lez v2, :cond_2e

    .line 484
    iget-object v6, v3, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    iget-object v4, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    aget-object v4, v4, v1

    if-eqz v4, :cond_2c

    iget-object v4, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    aget-object v4, v4, v1

    invoke-virtual {v4}, Lfreemarker/ext/util/IdentityHashMap$Entry;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lfreemarker/ext/util/IdentityHashMap$Entry;

    :goto_28
    aput-object v4, v6, v1

    move v2, v1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    goto :goto_12

    .end local v2    # "i":I
    .restart local v1    # "i":I
    :cond_2c
    move-object v4, v5

    goto :goto_28

    .line 487
    :cond_2e
    const/4 v4, 0x0

    iput-object v4, v3, Lfreemarker/ext/util/IdentityHashMap;->keySet:Ljava/util/Set;

    .line 488
    const/4 v4, 0x0

    iput-object v4, v3, Lfreemarker/ext/util/IdentityHashMap;->entrySet:Ljava/util/Set;

    .line 489
    const/4 v4, 0x0

    iput-object v4, v3, Lfreemarker/ext/util/IdentityHashMap;->values:Ljava/util/Collection;

    .line 490
    const/4 v4, 0x0

    iput v4, v3, Lfreemarker/ext/util/IdentityHashMap;->modCount:I
    :try_end_3a
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_3a} :catch_3b

    .line 491
    return-object v3

    .line 493
    .end local v1    # "i":I
    .end local v3    # "t":Lfreemarker/ext/util/IdentityHashMap;
    :catch_3b
    move-exception v0

    .line 496
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v4, Ljava/lang/InternalError;

    invoke-direct {v4}, Ljava/lang/InternalError;-><init>()V

    throw v4
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 10
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 232
    iget-object v3, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 233
    .local v3, "tab":[Lfreemarker/ext/util/IdentityHashMap$Entry;
    if-eqz p1, :cond_21

    .line 235
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    .line 236
    .local v1, "hash":I
    const v6, 0x7fffffff

    and-int/2addr v6, v1

    array-length v7, v3

    rem-int v2, v6, v7

    .line 237
    .local v2, "index":I
    aget-object v0, v3, v2

    .local v0, "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :goto_13
    if-eqz v0, :cond_2c

    .line 238
    iget v6, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->hash:I

    if-ne v6, v1, :cond_1e

    iget-object v6, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->key:Ljava/lang/Object;

    if-ne p1, v6, :cond_1e

    .line 248
    .end local v1    # "hash":I
    .end local v2    # "index":I
    :cond_1d
    :goto_1d
    return v4

    .line 237
    .restart local v1    # "hash":I
    .restart local v2    # "index":I
    :cond_1e
    iget-object v0, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    goto :goto_13

    .line 243
    .end local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    .end local v1    # "hash":I
    .end local v2    # "index":I
    :cond_21
    aget-object v0, v3, v5

    .restart local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :goto_23
    if-eqz v0, :cond_2c

    .line 244
    iget-object v6, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->key:Ljava/lang/Object;

    if-eqz v6, :cond_1d

    .line 243
    iget-object v0, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    goto :goto_23

    :cond_2c
    move v4, v5

    .line 248
    goto :goto_1d
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 8
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x1

    .line 202
    iget-object v3, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 204
    .local v3, "tab":[Lfreemarker/ext/util/IdentityHashMap$Entry;
    if-nez p1, :cond_19

    .line 206
    array-length v1, v3

    .local v1, "i":I
    move v2, v1

    .end local v1    # "i":I
    .local v2, "i":I
    :goto_7
    add-int/lit8 v1, v2, -0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    if-lez v2, :cond_30

    .line 207
    aget-object v0, v3, v1

    .local v0, "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :goto_d
    if-eqz v0, :cond_17

    .line 208
    iget-object v5, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    if-nez v5, :cond_14

    .line 219
    .end local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :cond_13
    :goto_13
    return v4

    .line 207
    .restart local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :cond_14
    iget-object v0, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    goto :goto_d

    :cond_17
    move v2, v1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    goto :goto_7

    .line 213
    .end local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    .end local v2    # "i":I
    :cond_19
    array-length v1, v3

    .restart local v1    # "i":I
    move v2, v1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    :goto_1b
    add-int/lit8 v1, v2, -0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    if-lez v2, :cond_30

    .line 214
    aget-object v0, v3, v1

    .restart local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :goto_21
    if-eqz v0, :cond_2e

    .line 215
    iget-object v5, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    invoke-virtual {p1, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_13

    .line 214
    iget-object v0, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    goto :goto_21

    :cond_2e
    move v2, v1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    goto :goto_1b

    .line 219
    .end local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    .end local v2    # "i":I
    .restart local v1    # "i":I
    :cond_30
    const/4 v4, 0x0

    goto :goto_13
.end method

.method public entrySet()Ljava/util/Set;
    .registers 2

    .prologue
    .line 603
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap;->entrySet:Ljava/util/Set;

    if-nez v0, :cond_b

    .line 605
    new-instance v0, Lfreemarker/ext/util/IdentityHashMap$3;

    invoke-direct {v0, p0}, Lfreemarker/ext/util/IdentityHashMap$3;-><init>(Lfreemarker/ext/util/IdentityHashMap;)V

    iput-object v0, p0, Lfreemarker/ext/util/IdentityHashMap;->entrySet:Ljava/util/Set;

    .line 670
    :cond_b
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap;->entrySet:Ljava/util/Set;

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 264
    iget-object v3, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 266
    .local v3, "tab":[Lfreemarker/ext/util/IdentityHashMap$Entry;
    if-eqz p1, :cond_21

    .line 268
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    .line 269
    .local v1, "hash":I
    const v4, 0x7fffffff

    and-int/2addr v4, v1

    array-length v5, v3

    rem-int v2, v4, v5

    .line 270
    .local v2, "index":I
    aget-object v0, v3, v2

    .local v0, "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :goto_11
    if-eqz v0, :cond_30

    .line 271
    iget v4, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->hash:I

    if-ne v4, v1, :cond_1e

    iget-object v4, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->key:Ljava/lang/Object;

    if-ne p1, v4, :cond_1e

    .line 272
    iget-object v4, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    .line 281
    .end local v1    # "hash":I
    .end local v2    # "index":I
    :goto_1d
    return-object v4

    .line 270
    .restart local v1    # "hash":I
    .restart local v2    # "index":I
    :cond_1e
    iget-object v0, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    goto :goto_11

    .line 276
    .end local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    .end local v1    # "hash":I
    .end local v2    # "index":I
    :cond_21
    const/4 v4, 0x0

    aget-object v0, v3, v4

    .restart local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :goto_24
    if-eqz v0, :cond_30

    .line 277
    iget-object v4, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->key:Ljava/lang/Object;

    if-nez v4, :cond_2d

    .line 278
    iget-object v4, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    goto :goto_1d

    .line 276
    :cond_2d
    iget-object v0, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    goto :goto_24

    .line 281
    :cond_30
    const/4 v4, 0x0

    goto :goto_1d
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 189
    iget v0, p0, Lfreemarker/ext/util/IdentityHashMap;->count:I

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public keySet()Ljava/util/Set;
    .registers 2

    .prologue
    .line 519
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap;->keySet:Ljava/util/Set;

    if-nez v0, :cond_b

    .line 521
    new-instance v0, Lfreemarker/ext/util/IdentityHashMap$1;

    invoke-direct {v0, p0}, Lfreemarker/ext/util/IdentityHashMap$1;-><init>(Lfreemarker/ext/util/IdentityHashMap;)V

    iput-object v0, p0, Lfreemarker/ext/util/IdentityHashMap;->keySet:Ljava/util/Set;

    .line 547
    :cond_b
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap;->keySet:Ljava/util/Set;

    return-object v0
.end method

.method loadFactor()F
    .registers 2

    .prologue
    .line 945
    iget v0, p0, Lfreemarker/ext/util/IdentityHashMap;->loadFactor:F

    return v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    const v7, 0x7fffffff

    .line 330
    iget-object v4, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 331
    .local v4, "tab":[Lfreemarker/ext/util/IdentityHashMap$Entry;
    const/4 v1, 0x0

    .line 332
    .local v1, "hash":I
    const/4 v2, 0x0

    .line 334
    .local v2, "index":I
    if-eqz p1, :cond_26

    .line 336
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    .line 337
    and-int v5, v1, v7

    array-length v6, v4

    rem-int v2, v5, v6

    .line 338
    aget-object v0, v4, v2

    .local v0, "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :goto_14
    if-eqz v0, :cond_37

    .line 340
    iget v5, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->hash:I

    if-ne v5, v1, :cond_23

    iget-object v5, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->key:Ljava/lang/Object;

    if-ne p1, v5, :cond_23

    .line 342
    iget-object v3, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    .line 343
    .local v3, "old":Ljava/lang/Object;
    iput-object p2, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    .line 375
    .end local v3    # "old":Ljava/lang/Object;
    :goto_22
    return-object v3

    .line 338
    :cond_23
    iget-object v0, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    goto :goto_14

    .line 350
    .end local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :cond_26
    const/4 v5, 0x0

    aget-object v0, v4, v5

    .restart local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :goto_29
    if-eqz v0, :cond_37

    .line 352
    iget-object v5, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->key:Ljava/lang/Object;

    if-nez v5, :cond_34

    .line 354
    iget-object v3, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    .line 355
    .restart local v3    # "old":Ljava/lang/Object;
    iput-object p2, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    goto :goto_22

    .line 350
    .end local v3    # "old":Ljava/lang/Object;
    :cond_34
    iget-object v0, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    goto :goto_29

    .line 361
    :cond_37
    iget v5, p0, Lfreemarker/ext/util/IdentityHashMap;->modCount:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lfreemarker/ext/util/IdentityHashMap;->modCount:I

    .line 362
    iget v5, p0, Lfreemarker/ext/util/IdentityHashMap;->count:I

    iget v6, p0, Lfreemarker/ext/util/IdentityHashMap;->threshold:I

    if-lt v5, v6, :cond_4d

    .line 365
    invoke-direct {p0}, Lfreemarker/ext/util/IdentityHashMap;->rehash()V

    .line 367
    iget-object v4, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 368
    and-int v5, v1, v7

    array-length v6, v4

    rem-int v2, v5, v6

    .line 372
    :cond_4d
    new-instance v0, Lfreemarker/ext/util/IdentityHashMap$Entry;

    .end local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    aget-object v5, v4, v2

    invoke-direct {v0, v1, p1, p2, v5}, Lfreemarker/ext/util/IdentityHashMap$Entry;-><init>(ILjava/lang/Object;Ljava/lang/Object;Lfreemarker/ext/util/IdentityHashMap$Entry;)V

    .line 373
    .restart local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    aput-object v0, v4, v2

    .line 374
    iget v5, p0, Lfreemarker/ext/util/IdentityHashMap;->count:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lfreemarker/ext/util/IdentityHashMap;->count:I

    .line 375
    const/4 v3, 0x0

    goto :goto_22
.end method

.method public putAll(Ljava/util/Map;)V
    .registers 6
    .param p1, "t"    # Ljava/util/Map;

    .prologue
    .line 450
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 451
    .local v1, "i":Ljava/util/Iterator;
    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    .line 453
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 454
    .local v0, "e":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lfreemarker/ext/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8

    .line 456
    .end local v0    # "e":Ljava/util/Map$Entry;
    :cond_20
    return-void
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    const/4 v8, 0x0

    const/4 v6, 0x0

    .line 389
    iget-object v5, p0, Lfreemarker/ext/util/IdentityHashMap;->table:[Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 391
    .local v5, "tab":[Lfreemarker/ext/util/IdentityHashMap$Entry;
    if-eqz p1, :cond_3e

    .line 393
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    .line 394
    .local v1, "hash":I
    const v7, 0x7fffffff

    and-int/2addr v7, v1

    array-length v8, v5

    rem-int v2, v7, v8

    .line 396
    .local v2, "index":I
    aget-object v0, v5, v2

    .local v0, "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    const/4 v4, 0x0

    .line 397
    .local v4, "prev":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :goto_14
    if-eqz v0, :cond_67

    .line 400
    iget v7, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->hash:I

    if-ne v7, v1, :cond_3a

    iget-object v7, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->key:Ljava/lang/Object;

    if-ne p1, v7, :cond_3a

    .line 402
    iget v7, p0, Lfreemarker/ext/util/IdentityHashMap;->modCount:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lfreemarker/ext/util/IdentityHashMap;->modCount:I

    .line 403
    if-eqz v4, :cond_35

    .line 404
    iget-object v7, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    iput-object v7, v4, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 408
    :goto_2a
    iget v7, p0, Lfreemarker/ext/util/IdentityHashMap;->count:I

    add-int/lit8 v7, v7, -0x1

    iput v7, p0, Lfreemarker/ext/util/IdentityHashMap;->count:I

    .line 409
    iget-object v3, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    .line 410
    .local v3, "oldValue":Ljava/lang/Object;
    iput-object v6, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    .line 437
    .end local v1    # "hash":I
    .end local v2    # "index":I
    .end local v3    # "oldValue":Ljava/lang/Object;
    :goto_34
    return-object v3

    .line 406
    .restart local v1    # "hash":I
    .restart local v2    # "index":I
    :cond_35
    iget-object v7, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    aput-object v7, v5, v2

    goto :goto_2a

    .line 398
    :cond_3a
    move-object v4, v0

    iget-object v0, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    goto :goto_14

    .line 417
    .end local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    .end local v1    # "hash":I
    .end local v2    # "index":I
    .end local v4    # "prev":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :cond_3e
    aget-object v0, v5, v8

    .restart local v0    # "e":Lfreemarker/ext/util/IdentityHashMap$Entry;
    const/4 v4, 0x0

    .line 418
    .restart local v4    # "prev":Lfreemarker/ext/util/IdentityHashMap$Entry;
    :goto_41
    if-eqz v0, :cond_67

    .line 421
    iget-object v7, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->key:Ljava/lang/Object;

    if-nez v7, :cond_63

    .line 423
    iget v7, p0, Lfreemarker/ext/util/IdentityHashMap;->modCount:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lfreemarker/ext/util/IdentityHashMap;->modCount:I

    .line 424
    if-eqz v4, :cond_5e

    .line 425
    iget-object v7, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    iput-object v7, v4, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    .line 429
    :goto_53
    iget v7, p0, Lfreemarker/ext/util/IdentityHashMap;->count:I

    add-int/lit8 v7, v7, -0x1

    iput v7, p0, Lfreemarker/ext/util/IdentityHashMap;->count:I

    .line 430
    iget-object v3, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    .line 431
    .restart local v3    # "oldValue":Ljava/lang/Object;
    iput-object v6, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    goto :goto_34

    .line 427
    .end local v3    # "oldValue":Ljava/lang/Object;
    :cond_5e
    iget-object v7, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    aput-object v7, v5, v8

    goto :goto_53

    .line 419
    :cond_63
    move-object v4, v0

    iget-object v0, v0, Lfreemarker/ext/util/IdentityHashMap$Entry;->next:Lfreemarker/ext/util/IdentityHashMap$Entry;

    goto :goto_41

    :cond_67
    move-object v3, v6

    .line 437
    goto :goto_34
.end method

.method public size()I
    .registers 2

    .prologue
    .line 179
    iget v0, p0, Lfreemarker/ext/util/IdentityHashMap;->count:I

    return v0
.end method

.method public values()Ljava/util/Collection;
    .registers 2

    .prologue
    .line 563
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap;->values:Ljava/util/Collection;

    if-nez v0, :cond_b

    .line 565
    new-instance v0, Lfreemarker/ext/util/IdentityHashMap$2;

    invoke-direct {v0, p0}, Lfreemarker/ext/util/IdentityHashMap$2;-><init>(Lfreemarker/ext/util/IdentityHashMap;)V

    iput-object v0, p0, Lfreemarker/ext/util/IdentityHashMap;->values:Ljava/util/Collection;

    .line 585
    :cond_b
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap;->values:Ljava/util/Collection;

    return-object v0
.end method
