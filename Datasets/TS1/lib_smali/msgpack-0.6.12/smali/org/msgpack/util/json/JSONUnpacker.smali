.class public Lorg/msgpack/util/json/JSONUnpacker;
.super Lorg/msgpack/unpacker/Converter;
.source "JSONUnpacker.java"


# instance fields
.field protected in:Ljava/io/Reader;

.field private parser:Lorg/json/simple/parser/JSONParser;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 40
    new-instance v0, Lorg/msgpack/MessagePack;

    invoke-direct {v0}, Lorg/msgpack/MessagePack;-><init>()V

    invoke-direct {p0, v0, p1}, Lorg/msgpack/util/json/JSONUnpacker;-><init>(Lorg/msgpack/MessagePack;Ljava/io/InputStream;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/MessagePack;Ljava/io/InputStream;)V
    .registers 4
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;
    .param p2, "in"    # Ljava/io/InputStream;

    .prologue
    .line 44
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-direct {v0, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {p0, p1, v0}, Lorg/msgpack/util/json/JSONUnpacker;-><init>(Lorg/msgpack/MessagePack;Ljava/io/Reader;)V

    .line 45
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/MessagePack;Ljava/io/InputStream;Ljava/nio/charset/Charset;)V
    .registers 5
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "cs"    # Ljava/nio/charset/Charset;

    .prologue
    .line 48
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-direct {v0, p2, p3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {p0, p1, v0}, Lorg/msgpack/util/json/JSONUnpacker;-><init>(Lorg/msgpack/MessagePack;Ljava/io/Reader;)V

    .line 49
    return-void
.end method

.method constructor <init>(Lorg/msgpack/MessagePack;Ljava/io/Reader;)V
    .registers 4
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;
    .param p2, "in"    # Ljava/io/Reader;

    .prologue
    .line 52
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/msgpack/unpacker/Converter;-><init>(Lorg/msgpack/MessagePack;Lorg/msgpack/type/Value;)V

    .line 53
    iput-object p2, p0, Lorg/msgpack/util/json/JSONUnpacker;->in:Ljava/io/Reader;

    .line 54
    new-instance v0, Lorg/json/simple/parser/JSONParser;

    invoke-direct {v0}, Lorg/json/simple/parser/JSONParser;-><init>()V

    iput-object v0, p0, Lorg/msgpack/util/json/JSONUnpacker;->parser:Lorg/json/simple/parser/JSONParser;

    .line 55
    return-void
.end method

.method private listToValue(Ljava/util/List;)Lorg/msgpack/type/Value;
    .registers 5
    .param p1, "list"    # Ljava/util/List;

    .prologue
    .line 92
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    new-array v0, v2, [Lorg/msgpack/type/Value;

    .line 93
    .local v0, "array":[Lorg/msgpack/type/Value;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    array-length v2, v0

    if-ge v1, v2, :cond_17

    .line 94
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/msgpack/util/json/JSONUnpacker;->objectToValue(Ljava/lang/Object;)Lorg/msgpack/type/Value;

    move-result-object v2

    aput-object v2, v0, v1

    .line 93
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 96
    :cond_17
    const/4 v2, 0x1

    invoke-static {v0, v2}, Lorg/msgpack/type/ValueFactory;->createArrayValue([Lorg/msgpack/type/Value;Z)Lorg/msgpack/type/ArrayValue;

    move-result-object v2

    return-object v2
.end method

.method private mapToValue(Ljava/util/Map;)Lorg/msgpack/type/Value;
    .registers 8
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    .line 101
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v4

    mul-int/lit8 v4, v4, 0x2

    new-array v2, v4, [Lorg/msgpack/type/Value;

    .line 102
    .local v2, "kvs":[Lorg/msgpack/type/Value;
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 103
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_11
    array-length v4, v2

    if-ge v0, v4, :cond_33

    .line 104
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 105
    .local v3, "pair":Ljava/util/Map$Entry;
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/msgpack/util/json/JSONUnpacker;->objectToValue(Ljava/lang/Object;)Lorg/msgpack/type/Value;

    move-result-object v4

    aput-object v4, v2, v0

    .line 106
    add-int/lit8 v4, v0, 0x1

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-direct {p0, v5}, Lorg/msgpack/util/json/JSONUnpacker;->objectToValue(Ljava/lang/Object;)Lorg/msgpack/type/Value;

    move-result-object v5

    aput-object v5, v2, v4

    .line 103
    add-int/lit8 v0, v0, 0x2

    goto :goto_11

    .line 108
    .end local v3    # "pair":Ljava/util/Map$Entry;
    :cond_33
    const/4 v4, 0x1

    invoke-static {v2, v4}, Lorg/msgpack/type/ValueFactory;->createMapValue([Lorg/msgpack/type/Value;Z)Lorg/msgpack/type/MapValue;

    move-result-object v4

    return-object v4
.end method

.method private objectToValue(Ljava/lang/Object;)Lorg/msgpack/type/Value;
    .registers 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 71
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_b

    .line 72
    check-cast p1, Ljava/lang/String;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-static {p1}, Lorg/msgpack/type/ValueFactory;->createRawValue(Ljava/lang/String;)Lorg/msgpack/type/RawValue;

    move-result-object v0

    .line 86
    :goto_a
    return-object v0

    .line 73
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_b
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_1a

    .line 74
    check-cast p1, Ljava/lang/Integer;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Lorg/msgpack/type/ValueFactory;->createIntegerValue(I)Lorg/msgpack/type/IntegerValue;

    move-result-object v0

    goto :goto_a

    .line 75
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_1a
    instance-of v0, p1, Ljava/lang/Long;

    if-eqz v0, :cond_29

    .line 76
    check-cast p1, Ljava/lang/Long;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/msgpack/type/ValueFactory;->createIntegerValue(J)Lorg/msgpack/type/IntegerValue;

    move-result-object v0

    goto :goto_a

    .line 77
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_29
    instance-of v0, p1, Ljava/util/Map;

    if-eqz v0, :cond_34

    .line 78
    check-cast p1, Ljava/util/Map;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-direct {p0, p1}, Lorg/msgpack/util/json/JSONUnpacker;->mapToValue(Ljava/util/Map;)Lorg/msgpack/type/Value;

    move-result-object v0

    goto :goto_a

    .line 79
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_34
    instance-of v0, p1, Ljava/util/List;

    if-eqz v0, :cond_3f

    .line 80
    check-cast p1, Ljava/util/List;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-direct {p0, p1}, Lorg/msgpack/util/json/JSONUnpacker;->listToValue(Ljava/util/List;)Lorg/msgpack/type/Value;

    move-result-object v0

    goto :goto_a

    .line 81
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_3f
    instance-of v0, p1, Ljava/lang/Boolean;

    if-eqz v0, :cond_4e

    .line 82
    check-cast p1, Ljava/lang/Boolean;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-static {v0}, Lorg/msgpack/type/ValueFactory;->createBooleanValue(Z)Lorg/msgpack/type/BooleanValue;

    move-result-object v0

    goto :goto_a

    .line 83
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_4e
    instance-of v0, p1, Ljava/lang/Double;

    if-eqz v0, :cond_5d

    .line 84
    check-cast p1, Ljava/lang/Double;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/msgpack/type/ValueFactory;->createFloatValue(D)Lorg/msgpack/type/FloatValue;

    move-result-object v0

    goto :goto_a

    .line 86
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_5d
    invoke-static {}, Lorg/msgpack/type/ValueFactory;->createNilValue()Lorg/msgpack/type/NilValue;

    move-result-object v0

    goto :goto_a
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 122
    iget-object v0, p0, Lorg/msgpack/util/json/JSONUnpacker;->in:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    .line 123
    invoke-super {p0}, Lorg/msgpack/unpacker/Converter;->close()V

    .line 124
    return-void
.end method

.method public getReadByteCount()I
    .registers 3

    .prologue
    .line 113
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not implemented yet"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected nextValue()Lorg/msgpack/type/Value;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    :try_start_0
    iget-object v2, p0, Lorg/msgpack/util/json/JSONUnpacker;->parser:Lorg/json/simple/parser/JSONParser;

    iget-object v3, p0, Lorg/msgpack/util/json/JSONUnpacker;->in:Ljava/io/Reader;

    invoke-virtual {v2, v3}, Lorg/json/simple/parser/JSONParser;->parse(Ljava/io/Reader;)Ljava/lang/Object;

    move-result-object v1

    .line 61
    .local v1, "obj":Ljava/lang/Object;
    invoke-direct {p0, v1}, Lorg/msgpack/util/json/JSONUnpacker;->objectToValue(Ljava/lang/Object;)Lorg/msgpack/type/Value;
    :try_end_b
    .catch Lorg/json/simple/parser/ParseException; {:try_start_0 .. :try_end_b} :catch_d
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_b} :catch_14

    move-result-object v2

    return-object v2

    .line 62
    .end local v1    # "obj":Ljava/lang/Object;
    :catch_d
    move-exception v0

    .line 63
    .local v0, "e":Lorg/json/simple/parser/ParseException;
    new-instance v2, Ljava/io/IOException;

    invoke-direct {v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 64
    .end local v0    # "e":Lorg/json/simple/parser/ParseException;
    :catch_14
    move-exception v0

    .line 65
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Ljava/io/IOException;

    invoke-direct {v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public resetReadByteCount()V
    .registers 3

    .prologue
    .line 118
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not implemented yet"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
