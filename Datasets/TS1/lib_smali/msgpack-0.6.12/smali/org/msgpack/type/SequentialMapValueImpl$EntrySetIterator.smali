.class Lorg/msgpack/type/SequentialMapValueImpl$EntrySetIterator;
.super Ljava/lang/Object;
.source "SequentialMapValueImpl.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/msgpack/type/SequentialMapValueImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EntrySetIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Ljava/util/Map$Entry",
        "<",
        "Lorg/msgpack/type/Value;",
        "Lorg/msgpack/type/Value;",
        ">;>;"
    }
.end annotation


# static fields
.field private static final hasDefaultImmutableEntry:Z


# instance fields
.field private array:[Lorg/msgpack/type/Value;

.field private pos:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 95
    const/4 v1, 0x1

    .line 97
    .local v1, "hasIt":Z
    :try_start_1
    const-string v2, "java.util.AbstractMap.SimpleImmutableEntry"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_6
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_6} :catch_9
    .catchall {:try_start_1 .. :try_end_6} :catchall_e

    .line 101
    sput-boolean v1, Lorg/msgpack/type/SequentialMapValueImpl$EntrySetIterator;->hasDefaultImmutableEntry:Z

    .line 103
    :goto_8
    return-void

    .line 98
    :catch_9
    move-exception v0

    .line 99
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    const/4 v1, 0x0

    .line 101
    sput-boolean v1, Lorg/msgpack/type/SequentialMapValueImpl$EntrySetIterator;->hasDefaultImmutableEntry:Z

    goto :goto_8

    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :catchall_e
    move-exception v2

    sput-boolean v1, Lorg/msgpack/type/SequentialMapValueImpl$EntrySetIterator;->hasDefaultImmutableEntry:Z

    throw v2
.end method

.method constructor <init>([Lorg/msgpack/type/Value;)V
    .registers 3
    .param p1, "array"    # [Lorg/msgpack/type/Value;

    .prologue
    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    iput-object p1, p0, Lorg/msgpack/type/SequentialMapValueImpl$EntrySetIterator;->array:[Lorg/msgpack/type/Value;

    .line 107
    const/4 v0, 0x0

    iput v0, p0, Lorg/msgpack/type/SequentialMapValueImpl$EntrySetIterator;->pos:I

    .line 108
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 3

    .prologue
    .line 112
    iget v0, p0, Lorg/msgpack/type/SequentialMapValueImpl$EntrySetIterator;->pos:I

    iget-object v1, p0, Lorg/msgpack/type/SequentialMapValueImpl$EntrySetIterator;->array:[Lorg/msgpack/type/Value;

    array-length v1, v1

    if-ge v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 89
    invoke-virtual {p0}, Lorg/msgpack/type/SequentialMapValueImpl$EntrySetIterator;->next()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/util/Map$Entry;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<",
            "Lorg/msgpack/type/Value;",
            "Lorg/msgpack/type/Value;",
            ">;"
        }
    .end annotation

    .prologue
    .line 117
    iget v3, p0, Lorg/msgpack/type/SequentialMapValueImpl$EntrySetIterator;->pos:I

    iget-object v4, p0, Lorg/msgpack/type/SequentialMapValueImpl$EntrySetIterator;->array:[Lorg/msgpack/type/Value;

    array-length v4, v4

    if-lt v3, v4, :cond_d

    .line 118
    new-instance v3, Ljava/util/NoSuchElementException;

    invoke-direct {v3}, Ljava/util/NoSuchElementException;-><init>()V

    throw v3

    .line 121
    :cond_d
    iget-object v3, p0, Lorg/msgpack/type/SequentialMapValueImpl$EntrySetIterator;->array:[Lorg/msgpack/type/Value;

    iget v4, p0, Lorg/msgpack/type/SequentialMapValueImpl$EntrySetIterator;->pos:I

    aget-object v0, v3, v4

    .line 122
    .local v0, "key":Lorg/msgpack/type/Value;
    iget-object v3, p0, Lorg/msgpack/type/SequentialMapValueImpl$EntrySetIterator;->array:[Lorg/msgpack/type/Value;

    iget v4, p0, Lorg/msgpack/type/SequentialMapValueImpl$EntrySetIterator;->pos:I

    add-int/lit8 v4, v4, 0x1

    aget-object v2, v3, v4

    .line 130
    .local v2, "value":Lorg/msgpack/type/Value;
    sget-boolean v3, Lorg/msgpack/type/SequentialMapValueImpl$EntrySetIterator;->hasDefaultImmutableEntry:Z

    if-eqz v3, :cond_2d

    new-instance v1, Ljava/util/AbstractMap$SimpleImmutableEntry;

    invoke-direct {v1, v0, v2}, Ljava/util/AbstractMap$SimpleImmutableEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_24
    check-cast v1, Ljava/util/Map$Entry;

    .line 134
    .local v1, "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/msgpack/type/Value;Lorg/msgpack/type/Value;>;"
    iget v3, p0, Lorg/msgpack/type/SequentialMapValueImpl$EntrySetIterator;->pos:I

    add-int/lit8 v3, v3, 0x2

    iput v3, p0, Lorg/msgpack/type/SequentialMapValueImpl$EntrySetIterator;->pos:I

    .line 135
    return-object v1

    .line 130
    .end local v1    # "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/msgpack/type/Value;Lorg/msgpack/type/Value;>;"
    :cond_2d
    new-instance v1, Lorg/msgpack/util/android/PortedImmutableEntry;

    invoke-direct {v1, v0, v2}, Lorg/msgpack/util/android/PortedImmutableEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_24
.end method

.method public remove()V
    .registers 2

    .prologue
    .line 140
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
