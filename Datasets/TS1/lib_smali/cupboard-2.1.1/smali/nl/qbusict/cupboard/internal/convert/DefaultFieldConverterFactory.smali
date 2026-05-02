.class public Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;
.super Ljava/lang/Object;
.source "DefaultFieldConverterFactory.java"

# interfaces
.implements Lnl/qbusict/cupboard/convert/FieldConverterFactory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;,
        Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$DateConverter;,
        Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$BooleanConverter;,
        Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ByteArrayConverter;,
        Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ByteConverter;,
        Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$LongConverter;,
        Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$DoubleConverter;,
        Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ShortConverter;,
        Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$FloatConverter;,
        Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$IntegerConverter;,
        Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$StringConverter;,
        Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$BigIntegerConverter;,
        Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$BigDecimalConverter;
    }
.end annotation


# static fields
.field private static sTypeConverters:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/reflect/Type;",
            "Lnl/qbusict/cupboard/convert/FieldConverter",
            "<*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 33
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x19

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    .line 36
    sget-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    const-class v1, Ljava/math/BigDecimal;

    new-instance v2, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$BigDecimalConverter;

    invoke-direct {v2, v3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$BigDecimalConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    sget-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    const-class v1, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$BigIntegerConverter;

    new-instance v2, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$BigIntegerConverter;

    invoke-direct {v2, v3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$BigIntegerConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    sget-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    const-class v1, Ljava/lang/String;

    new-instance v2, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$StringConverter;

    invoke-direct {v2, v3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$StringConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    sget-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    new-instance v2, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$IntegerConverter;

    invoke-direct {v2, v3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$IntegerConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    sget-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    const-class v1, Ljava/lang/Integer;

    new-instance v2, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$IntegerConverter;

    invoke-direct {v2, v3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$IntegerConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    sget-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    new-instance v2, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$FloatConverter;

    invoke-direct {v2, v3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$FloatConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    sget-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    const-class v1, Ljava/lang/Float;

    new-instance v2, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$FloatConverter;

    invoke-direct {v2, v3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$FloatConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    sget-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    new-instance v2, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ShortConverter;

    invoke-direct {v2, v3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ShortConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    sget-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    const-class v1, Ljava/lang/Short;

    new-instance v2, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ShortConverter;

    invoke-direct {v2, v3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ShortConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    sget-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    new-instance v2, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$DoubleConverter;

    invoke-direct {v2, v3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$DoubleConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    sget-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    const-class v1, Ljava/lang/Double;

    new-instance v2, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$DoubleConverter;

    invoke-direct {v2, v3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$DoubleConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    sget-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    new-instance v2, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$LongConverter;

    invoke-direct {v2, v3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$LongConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    sget-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    const-class v1, Ljava/lang/Long;

    new-instance v2, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$LongConverter;

    invoke-direct {v2, v3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$LongConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    sget-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    new-instance v2, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ByteConverter;

    invoke-direct {v2, v3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ByteConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    sget-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    const-class v1, Ljava/lang/Byte;

    new-instance v2, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ByteConverter;

    invoke-direct {v2, v3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ByteConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    sget-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    const-class v1, [B

    new-instance v2, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ByteArrayConverter;

    invoke-direct {v2, v3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ByteArrayConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    sget-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    new-instance v2, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$BooleanConverter;

    invoke-direct {v2, v3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$BooleanConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    sget-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    const-class v1, Ljava/lang/Boolean;

    new-instance v2, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$BooleanConverter;

    invoke-direct {v2, v3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$BooleanConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    sget-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    const-class v1, Ljava/util/Date;

    new-instance v2, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$DateConverter;

    invoke-direct {v2, v3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$DateConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 248
    return-void
.end method


# virtual methods
.method public create(Lnl/qbusict/cupboard/Cupboard;Ljava/lang/reflect/Type;)Lnl/qbusict/cupboard/convert/FieldConverter;
    .registers 4
    .param p1, "cupboard"    # Lnl/qbusict/cupboard/Cupboard;
    .param p2, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnl/qbusict/cupboard/Cupboard;",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lnl/qbusict/cupboard/convert/FieldConverter",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 268
    instance-of v0, p2, Ljava/lang/Class;

    if-nez v0, :cond_6

    .line 269
    const/4 v0, 0x0

    .line 271
    :goto_5
    return-object v0

    :cond_6
    sget-object v0, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;->sTypeConverters:Ljava/util/HashMap;

    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnl/qbusict/cupboard/convert/FieldConverter;

    goto :goto_5
.end method
