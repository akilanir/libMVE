.class public final Lorg/msgpack/template/Templates;
.super Ljava/lang/Object;
.source "Templates.java"


# static fields
.field public static final TBigDecimal:Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/msgpack/template/Template",
            "<",
            "Ljava/math/BigDecimal;",
            ">;"
        }
    .end annotation
.end field

.field public static final TBigInteger:Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/msgpack/template/Template",
            "<",
            "Ljava/math/BigInteger;",
            ">;"
        }
    .end annotation
.end field

.field public static final TBoolean:Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/msgpack/template/Template",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final TByte:Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/msgpack/template/Template",
            "<",
            "Ljava/lang/Byte;",
            ">;"
        }
    .end annotation
.end field

.field public static final TByteArray:Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/msgpack/template/Template",
            "<[B>;"
        }
    .end annotation
.end field

.field public static final TByteBuffer:Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/msgpack/template/Template",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field public static final TCharacter:Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/msgpack/template/Template",
            "<",
            "Ljava/lang/Character;",
            ">;"
        }
    .end annotation
.end field

.field public static final TDate:Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/msgpack/template/Template",
            "<",
            "Ljava/util/Date;",
            ">;"
        }
    .end annotation
.end field

.field public static final TDouble:Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/msgpack/template/Template",
            "<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field public static final TFloat:Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/msgpack/template/Template",
            "<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public static final TInteger:Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/msgpack/template/Template",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final TLong:Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/msgpack/template/Template",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static final TShort:Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/msgpack/template/Template",
            "<",
            "Ljava/lang/Short;",
            ">;"
        }
    .end annotation
.end field

.field public static final TString:Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/msgpack/template/Template",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final TValue:Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/msgpack/template/Template",
            "<",
            "Lorg/msgpack/type/Value;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 31
    invoke-static {}, Lorg/msgpack/template/ValueTemplate;->getInstance()Lorg/msgpack/template/ValueTemplate;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/Templates;->TValue:Lorg/msgpack/template/Template;

    .line 33
    invoke-static {}, Lorg/msgpack/template/ByteTemplate;->getInstance()Lorg/msgpack/template/ByteTemplate;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/Templates;->TByte:Lorg/msgpack/template/Template;

    .line 35
    invoke-static {}, Lorg/msgpack/template/ShortTemplate;->getInstance()Lorg/msgpack/template/ShortTemplate;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/Templates;->TShort:Lorg/msgpack/template/Template;

    .line 37
    invoke-static {}, Lorg/msgpack/template/IntegerTemplate;->getInstance()Lorg/msgpack/template/IntegerTemplate;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/Templates;->TInteger:Lorg/msgpack/template/Template;

    .line 39
    invoke-static {}, Lorg/msgpack/template/LongTemplate;->getInstance()Lorg/msgpack/template/LongTemplate;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/Templates;->TLong:Lorg/msgpack/template/Template;

    .line 41
    invoke-static {}, Lorg/msgpack/template/CharacterTemplate;->getInstance()Lorg/msgpack/template/CharacterTemplate;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/Templates;->TCharacter:Lorg/msgpack/template/Template;

    .line 43
    invoke-static {}, Lorg/msgpack/template/BigIntegerTemplate;->getInstance()Lorg/msgpack/template/BigIntegerTemplate;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/Templates;->TBigInteger:Lorg/msgpack/template/Template;

    .line 45
    invoke-static {}, Lorg/msgpack/template/BigDecimalTemplate;->getInstance()Lorg/msgpack/template/BigDecimalTemplate;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/Templates;->TBigDecimal:Lorg/msgpack/template/Template;

    .line 47
    invoke-static {}, Lorg/msgpack/template/FloatTemplate;->getInstance()Lorg/msgpack/template/FloatTemplate;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/Templates;->TFloat:Lorg/msgpack/template/Template;

    .line 49
    invoke-static {}, Lorg/msgpack/template/DoubleTemplate;->getInstance()Lorg/msgpack/template/DoubleTemplate;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/Templates;->TDouble:Lorg/msgpack/template/Template;

    .line 51
    invoke-static {}, Lorg/msgpack/template/BooleanTemplate;->getInstance()Lorg/msgpack/template/BooleanTemplate;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/Templates;->TBoolean:Lorg/msgpack/template/Template;

    .line 53
    invoke-static {}, Lorg/msgpack/template/StringTemplate;->getInstance()Lorg/msgpack/template/StringTemplate;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/Templates;->TString:Lorg/msgpack/template/Template;

    .line 55
    invoke-static {}, Lorg/msgpack/template/ByteArrayTemplate;->getInstance()Lorg/msgpack/template/ByteArrayTemplate;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/Templates;->TByteArray:Lorg/msgpack/template/Template;

    .line 57
    invoke-static {}, Lorg/msgpack/template/ByteBufferTemplate;->getInstance()Lorg/msgpack/template/ByteBufferTemplate;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/Templates;->TByteBuffer:Lorg/msgpack/template/Template;

    .line 59
    invoke-static {}, Lorg/msgpack/template/DateTemplate;->getInstance()Lorg/msgpack/template/DateTemplate;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/Templates;->TDate:Lorg/msgpack/template/Template;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static tBigDecimal()Lorg/msgpack/template/Template;
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 117
    sget-object v0, Lorg/msgpack/template/Templates;->TBigDecimal:Lorg/msgpack/template/Template;

    return-object v0
.end method

.method public static tBigInteger()Lorg/msgpack/template/Template;
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 112
    sget-object v0, Lorg/msgpack/template/Templates;->TBigInteger:Lorg/msgpack/template/Template;

    return-object v0
.end method

.method public static tBoolean()Lorg/msgpack/template/Template;
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 132
    sget-object v0, Lorg/msgpack/template/Templates;->TBoolean:Lorg/msgpack/template/Template;

    return-object v0
.end method

.method public static tByte()Lorg/msgpack/template/Template;
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 87
    sget-object v0, Lorg/msgpack/template/Templates;->TByte:Lorg/msgpack/template/Template;

    return-object v0
.end method

.method public static tByteArray()Lorg/msgpack/template/Template;
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 142
    sget-object v0, Lorg/msgpack/template/Templates;->TByteArray:Lorg/msgpack/template/Template;

    return-object v0
.end method

.method public static tByteBuffer()Lorg/msgpack/template/Template;
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 147
    sget-object v0, Lorg/msgpack/template/Templates;->TByteBuffer:Lorg/msgpack/template/Template;

    return-object v0
.end method

.method public static tCharacter()Lorg/msgpack/template/Template;
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 107
    sget-object v0, Lorg/msgpack/template/Templates;->TCharacter:Lorg/msgpack/template/Template;

    return-object v0
.end method

.method public static tCollection(Lorg/msgpack/template/Template;)Lorg/msgpack/template/Template;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/msgpack/template/Template",
            "<TE;>;)",
            "Lorg/msgpack/template/Template",
            "<",
            "Ljava/util/Collection",
            "<TE;>;>;"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "elementTemplate":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TE;>;"
    new-instance v0, Lorg/msgpack/template/CollectionTemplate;

    invoke-direct {v0, p0}, Lorg/msgpack/template/CollectionTemplate;-><init>(Lorg/msgpack/template/Template;)V

    return-object v0
.end method

.method public static tDate()Lorg/msgpack/template/Template;
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 152
    sget-object v0, Lorg/msgpack/template/Templates;->TDate:Lorg/msgpack/template/Template;

    return-object v0
.end method

.method public static tDouble()Lorg/msgpack/template/Template;
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 127
    sget-object v0, Lorg/msgpack/template/Templates;->TDouble:Lorg/msgpack/template/Template;

    return-object v0
.end method

.method public static tFloat()Lorg/msgpack/template/Template;
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 122
    sget-object v0, Lorg/msgpack/template/Templates;->TFloat:Lorg/msgpack/template/Template;

    return-object v0
.end method

.method public static tInteger()Lorg/msgpack/template/Template;
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 97
    sget-object v0, Lorg/msgpack/template/Templates;->TInteger:Lorg/msgpack/template/Template;

    return-object v0
.end method

.method public static tList(Lorg/msgpack/template/Template;)Lorg/msgpack/template/Template;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/msgpack/template/Template",
            "<TE;>;)",
            "Lorg/msgpack/template/Template",
            "<",
            "Ljava/util/List",
            "<TE;>;>;"
        }
    .end annotation

    .prologue
    .line 66
    .local p0, "elementTemplate":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TE;>;"
    new-instance v0, Lorg/msgpack/template/ListTemplate;

    invoke-direct {v0, p0}, Lorg/msgpack/template/ListTemplate;-><init>(Lorg/msgpack/template/Template;)V

    return-object v0
.end method

.method public static tLong()Lorg/msgpack/template/Template;
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 102
    sget-object v0, Lorg/msgpack/template/Templates;->TLong:Lorg/msgpack/template/Template;

    return-object v0
.end method

.method public static tMap(Lorg/msgpack/template/Template;Lorg/msgpack/template/Template;)Lorg/msgpack/template/Template;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/msgpack/template/Template",
            "<TK;>;",
            "Lorg/msgpack/template/Template",
            "<TV;>;)",
            "Lorg/msgpack/template/Template",
            "<",
            "Ljava/util/Map",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 70
    .local p0, "keyTemplate":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TK;>;"
    .local p1, "valueTemplate":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TV;>;"
    new-instance v0, Lorg/msgpack/template/MapTemplate;

    invoke-direct {v0, p0, p1}, Lorg/msgpack/template/MapTemplate;-><init>(Lorg/msgpack/template/Template;Lorg/msgpack/template/Template;)V

    return-object v0
.end method

.method public static tNotNullable(Lorg/msgpack/template/Template;)Lorg/msgpack/template/Template;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/msgpack/template/Template",
            "<TT;>;)",
            "Lorg/msgpack/template/Template",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "innerTemplate":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    new-instance v0, Lorg/msgpack/template/NotNullableTemplate;

    invoke-direct {v0, p0}, Lorg/msgpack/template/NotNullableTemplate;-><init>(Lorg/msgpack/template/Template;)V

    return-object v0
.end method

.method public static tOrdinalEnum(Ljava/lang/Class;)Lorg/msgpack/template/Template;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Enum;",
            ">(",
            "Ljava/lang/Class",
            "<TE;>;)",
            "Lorg/msgpack/template/Template",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 78
    .local p0, "enumClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    new-instance v0, Lorg/msgpack/template/OrdinalEnumTemplate;

    invoke-direct {v0, p0}, Lorg/msgpack/template/OrdinalEnumTemplate;-><init>(Ljava/lang/Class;)V

    return-object v0
.end method

.method public static tShort()Lorg/msgpack/template/Template;
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 92
    sget-object v0, Lorg/msgpack/template/Templates;->TShort:Lorg/msgpack/template/Template;

    return-object v0
.end method

.method public static tString()Lorg/msgpack/template/Template;
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 137
    sget-object v0, Lorg/msgpack/template/Templates;->TString:Lorg/msgpack/template/Template;

    return-object v0
.end method
