.class public Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;
.super Ljava/lang/Object;
.source "NumberDeserializer.java"

# interfaces
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# static fields
.field public static final instance:Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 13
    new-instance v0, Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;

    invoke-direct {v0}, Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11
    .param p1, "parser"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    .param p2, "clazz"    # Ljava/lang/reflect/Type;
    .param p3, "fieldName"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    const/16 v6, 0x10

    .line 17
    iget-object v0, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 18
    .local v0, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_61

    .line 19
    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-eq p2, v4, :cond_13

    const-class v4, Ljava/lang/Double;

    if-ne p2, v4, :cond_23

    .line 20
    :cond_13
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->numberString()Ljava/lang/String;

    move-result-object v1

    .line 21
    .local v1, "val":Ljava/lang/String;
    invoke-interface {v0, v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 22
    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .line 81
    .end local v1    # "val":Ljava/lang/String;
    :cond_22
    :goto_22
    return-object v1

    .line 25
    :cond_23
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->longValue()J

    move-result-wide v1

    .line 26
    .local v1, "val":J
    invoke-interface {v0, v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 28
    sget-object v4, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-eq p2, v4, :cond_32

    const-class v4, Ljava/lang/Short;

    if-ne p2, v4, :cond_39

    .line 29
    :cond_32
    long-to-int v4, v1

    int-to-short v4, v4

    invoke-static {v4}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    goto :goto_22

    .line 32
    :cond_39
    sget-object v4, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-eq p2, v4, :cond_41

    const-class v4, Ljava/lang/Byte;

    if-ne p2, v4, :cond_48

    .line 33
    :cond_41
    long-to-int v4, v1

    int-to-byte v4, v4

    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v1

    goto :goto_22

    .line 36
    :cond_48
    const-wide/32 v4, -0x80000000

    cmp-long v4, v1, v4

    if-ltz v4, :cond_5c

    const-wide/32 v4, 0x7fffffff

    cmp-long v4, v1, v4

    if-gtz v4, :cond_5c

    .line 37
    long-to-int v4, v1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_22

    .line 39
    :cond_5c
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    goto :goto_22

    .line 42
    .end local v1    # "val":J
    :cond_61
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v4

    const/4 v5, 0x3

    if-ne v4, v5, :cond_aa

    .line 43
    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-eq p2, v4, :cond_70

    const-class v4, Ljava/lang/Double;

    if-ne p2, v4, :cond_80

    .line 44
    :cond_70
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->numberString()Ljava/lang/String;

    move-result-object v1

    .line 45
    .local v1, "val":Ljava/lang/String;
    invoke-interface {v0, v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 46
    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    goto :goto_22

    .line 49
    .end local v1    # "val":Ljava/lang/String;
    :cond_80
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->decimalValue()Ljava/math/BigDecimal;

    move-result-object v1

    .line 50
    .local v1, "val":Ljava/math/BigDecimal;
    invoke-interface {v0, v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 52
    sget-object v4, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-eq p2, v4, :cond_8f

    const-class v4, Ljava/lang/Short;

    if-ne p2, v4, :cond_98

    .line 53
    :cond_8f
    invoke-virtual {v1}, Ljava/math/BigDecimal;->shortValue()S

    move-result v4

    invoke-static {v4}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    goto :goto_22

    .line 56
    :cond_98
    sget-object v4, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-eq p2, v4, :cond_a0

    const-class v4, Ljava/lang/Byte;

    if-ne p2, v4, :cond_22

    .line 57
    :cond_a0
    invoke-virtual {v1}, Ljava/math/BigDecimal;->byteValue()B

    move-result v4

    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v1

    goto/16 :goto_22

    .line 63
    .end local v1    # "val":Ljava/math/BigDecimal;
    :cond_aa
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v3

    .line 65
    .local v3, "value":Ljava/lang/Object;
    if-nez v3, :cond_b3

    .line 66
    const/4 v1, 0x0

    goto/16 :goto_22

    .line 69
    :cond_b3
    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-eq p2, v4, :cond_bb

    const-class v4, Ljava/lang/Double;

    if-ne p2, v4, :cond_c1

    .line 70
    :cond_bb
    invoke-static {v3}, Lcom/alibaba/fastjson/util/TypeUtils;->castToDouble(Ljava/lang/Object;)Ljava/lang/Double;

    move-result-object v1

    goto/16 :goto_22

    .line 73
    :cond_c1
    sget-object v4, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-eq p2, v4, :cond_c9

    const-class v4, Ljava/lang/Short;

    if-ne p2, v4, :cond_cf

    .line 74
    :cond_c9
    invoke-static {v3}, Lcom/alibaba/fastjson/util/TypeUtils;->castToShort(Ljava/lang/Object;)Ljava/lang/Short;

    move-result-object v1

    goto/16 :goto_22

    .line 77
    :cond_cf
    sget-object v4, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-eq p2, v4, :cond_d7

    const-class v4, Ljava/lang/Byte;

    if-ne p2, v4, :cond_dd

    .line 78
    :cond_d7
    invoke-static {v3}, Lcom/alibaba/fastjson/util/TypeUtils;->castToByte(Ljava/lang/Object;)Ljava/lang/Byte;

    move-result-object v1

    goto/16 :goto_22

    .line 81
    :cond_dd
    invoke-static {v3}, Lcom/alibaba/fastjson/util/TypeUtils;->castToBigDecimal(Ljava/lang/Object;)Ljava/math/BigDecimal;

    move-result-object v1

    goto/16 :goto_22
.end method

.method public getFastMatchToken()I
    .registers 2

    .prologue
    .line 85
    const/4 v0, 0x2

    return v0
.end method
