.class public Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory;
.super Ljava/lang/Object;
.source "EnumFieldConverterFactory.java"

# interfaces
.implements Lnl/qbusict/cupboard/convert/FieldConverterFactory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method


# virtual methods
.method public create(Lnl/qbusict/cupboard/Cupboard;Ljava/lang/reflect/Type;)Lnl/qbusict/cupboard/convert/FieldConverter;
    .registers 7
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
    const/4 v2, 0x0

    .line 57
    instance-of v1, p2, Ljava/lang/reflect/ParameterizedType;

    if-eqz v1, :cond_19

    move-object v1, p2

    .line 58
    check-cast v1, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v1}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v1

    const-class v3, Ljava/lang/Enum;

    if-ne v1, v3, :cond_19

    .line 59
    check-cast p2, Ljava/lang/reflect/ParameterizedType;

    .end local p2    # "type":Ljava/lang/reflect/Type;
    invoke-interface {p2}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v1

    const/4 v3, 0x0

    aget-object p2, v1, v3

    .line 62
    .restart local p2    # "type":Ljava/lang/reflect/Type;
    :cond_19
    instance-of v1, p2, Ljava/lang/Class;

    if-nez v1, :cond_1f

    move-object v1, v2

    .line 69
    :goto_1e
    return-object v1

    :cond_1f
    move-object v0, p2

    .line 65
    check-cast v0, Ljava/lang/Class;

    .line 66
    .local v0, "clz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->isEnum()Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 67
    new-instance v1, Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter;

    invoke-direct {v1, v0}, Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter;-><init>(Ljava/lang/Class;)V

    goto :goto_1e

    :cond_2e
    move-object v1, v2

    .line 69
    goto :goto_1e
.end method
