.class public Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers;
.super Ljava/lang/Object;
.source "NumberDeserializers.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$1;,
        Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$BigDecimalDeserializer;,
        Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$BigIntegerDeserializer;,
        Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$NumberDeserializer;,
        Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$DoubleDeserializer;,
        Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$FloatDeserializer;,
        Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$LongDeserializer;,
        Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$IntegerDeserializer;,
        Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$CharacterDeserializer;,
        Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$ShortDeserializer;,
        Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$ByteDeserializer;,
        Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$BooleanDeserializer;,
        Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$PrimitiveOrWrapperDeserializer;
    }
.end annotation


# static fields
.field private static final _classNames:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    .line 26
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    sput-object v5, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers;->_classNames:Ljava/util/HashSet;

    .line 29
    const/16 v5, 0xb

    new-array v4, v5, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Ljava/lang/Boolean;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Ljava/lang/Byte;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-class v6, Ljava/lang/Short;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-class v6, Ljava/lang/Character;

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-class v6, Ljava/lang/Integer;

    aput-object v6, v4, v5

    const/4 v5, 0x5

    const-class v6, Ljava/lang/Long;

    aput-object v6, v4, v5

    const/4 v5, 0x6

    const-class v6, Ljava/lang/Float;

    aput-object v6, v4, v5

    const/4 v5, 0x7

    const-class v6, Ljava/lang/Double;

    aput-object v6, v4, v5

    const/16 v5, 0x8

    const-class v6, Ljava/lang/Number;

    aput-object v6, v4, v5

    const/16 v5, 0x9

    const-class v6, Ljava/math/BigDecimal;

    aput-object v6, v4, v5

    const/16 v5, 0xa

    const-class v6, Ljava/math/BigInteger;

    aput-object v6, v4, v5

    .line 41
    .local v4, "numberTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_48
    if-ge v2, v3, :cond_58

    aget-object v1, v0, v2

    .line 42
    .local v1, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v5, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers;->_classNames:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 41
    add-int/lit8 v2, v2, 0x1

    goto :goto_48

    .line 44
    .end local v1    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_58
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 562
    return-void
.end method

.method public static find(Ljava/lang/Class;Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonDeserializer;
    .registers 5
    .param p1, "clsName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "rawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_3e

    .line 48
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_d

    .line 49
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$IntegerDeserializer;->primitiveInstance:Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$IntegerDeserializer;

    .line 108
    :goto_c
    return-object v0

    .line 51
    :cond_d
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_14

    .line 52
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$BooleanDeserializer;->primitiveInstance:Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$BooleanDeserializer;

    goto :goto_c

    .line 54
    :cond_14
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_1b

    .line 55
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$LongDeserializer;->primitiveInstance:Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$LongDeserializer;

    goto :goto_c

    .line 57
    :cond_1b
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_22

    .line 58
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$DoubleDeserializer;->primitiveInstance:Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$DoubleDeserializer;

    goto :goto_c

    .line 60
    :cond_22
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_29

    .line 61
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$CharacterDeserializer;->primitiveInstance:Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$CharacterDeserializer;

    goto :goto_c

    .line 63
    :cond_29
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_30

    .line 64
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$ByteDeserializer;->primitiveInstance:Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$ByteDeserializer;

    goto :goto_c

    .line 66
    :cond_30
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_37

    .line 67
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$ShortDeserializer;->primitiveInstance:Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$ShortDeserializer;

    goto :goto_c

    .line 69
    :cond_37
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_97

    .line 70
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$FloatDeserializer;->primitiveInstance:Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$FloatDeserializer;

    goto :goto_c

    .line 72
    :cond_3e
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers;->_classNames:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_94

    .line 74
    const-class v0, Ljava/lang/Integer;

    if-ne p0, v0, :cond_4d

    .line 75
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$IntegerDeserializer;->wrapperInstance:Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$IntegerDeserializer;

    goto :goto_c

    .line 77
    :cond_4d
    const-class v0, Ljava/lang/Boolean;

    if-ne p0, v0, :cond_54

    .line 78
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$BooleanDeserializer;->wrapperInstance:Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$BooleanDeserializer;

    goto :goto_c

    .line 80
    :cond_54
    const-class v0, Ljava/lang/Long;

    if-ne p0, v0, :cond_5b

    .line 81
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$LongDeserializer;->wrapperInstance:Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$LongDeserializer;

    goto :goto_c

    .line 83
    :cond_5b
    const-class v0, Ljava/lang/Double;

    if-ne p0, v0, :cond_62

    .line 84
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$DoubleDeserializer;->wrapperInstance:Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$DoubleDeserializer;

    goto :goto_c

    .line 86
    :cond_62
    const-class v0, Ljava/lang/Character;

    if-ne p0, v0, :cond_69

    .line 87
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$CharacterDeserializer;->wrapperInstance:Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$CharacterDeserializer;

    goto :goto_c

    .line 89
    :cond_69
    const-class v0, Ljava/lang/Byte;

    if-ne p0, v0, :cond_70

    .line 90
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$ByteDeserializer;->wrapperInstance:Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$ByteDeserializer;

    goto :goto_c

    .line 92
    :cond_70
    const-class v0, Ljava/lang/Short;

    if-ne p0, v0, :cond_77

    .line 93
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$ShortDeserializer;->wrapperInstance:Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$ShortDeserializer;

    goto :goto_c

    .line 95
    :cond_77
    const-class v0, Ljava/lang/Float;

    if-ne p0, v0, :cond_7e

    .line 96
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$FloatDeserializer;->wrapperInstance:Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$FloatDeserializer;

    goto :goto_c

    .line 98
    :cond_7e
    const-class v0, Ljava/lang/Number;

    if-ne p0, v0, :cond_85

    .line 99
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$NumberDeserializer;->instance:Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$NumberDeserializer;

    goto :goto_c

    .line 101
    :cond_85
    const-class v0, Ljava/math/BigDecimal;

    if-ne p0, v0, :cond_8c

    .line 102
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$BigDecimalDeserializer;->instance:Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$BigDecimalDeserializer;

    goto :goto_c

    .line 104
    :cond_8c
    const-class v0, Ljava/math/BigInteger;

    if-ne p0, v0, :cond_97

    .line 105
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$BigIntegerDeserializer;->instance:Lcom/fasterxml/jackson/databind/deser/std/NumberDeserializers$BigIntegerDeserializer;

    goto/16 :goto_c

    .line 108
    :cond_94
    const/4 v0, 0x0

    goto/16 :goto_c

    .line 111
    :cond_97
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Internal error: can\'t find deserializer for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
