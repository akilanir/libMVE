.class public Lcom/alibaba/fastjson/serializer/IntegerCodec;
.super Ljava/lang/Object;
.source "IntegerCodec.java"

# interfaces
.implements Lcom/alibaba/fastjson/serializer/ObjectSerializer;
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# static fields
.field public static instance:Lcom/alibaba/fastjson/serializer/IntegerCodec;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 35
    new-instance v0, Lcom/alibaba/fastjson/serializer/IntegerCodec;

    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/IntegerCodec;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/serializer/IntegerCodec;->instance:Lcom/alibaba/fastjson/serializer/IntegerCodec;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13
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
    const/16 v8, 0x10

    .line 65
    iget-object v3, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 67
    .local v3, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v6

    const/16 v7, 0x8

    if-ne v6, v7, :cond_11

    .line 68
    invoke-interface {v3, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 69
    const/4 v2, 0x0

    .line 96
    :cond_10
    :goto_10
    return-object v2

    .line 73
    :cond_11
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v6

    const/4 v7, 0x2

    if-ne v6, v7, :cond_4c

    .line 76
    :try_start_18
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->intValue()I
    :try_end_1b
    .catch Ljava/lang/NumberFormatException; {:try_start_18 .. :try_end_1b} :catch_32

    move-result v4

    .line 80
    .local v4, "val":I
    invoke-interface {v3, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 81
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 92
    .end local v4    # "val":I
    .local v2, "intObj":Ljava/lang/Integer;
    :goto_23
    const-class v6, Ljava/util/concurrent/atomic/AtomicInteger;

    if-ne p2, v6, :cond_10

    .line 93
    new-instance v6, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-direct {v6, v7}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    move-object v2, v6

    goto :goto_10

    .line 77
    .end local v2    # "intObj":Ljava/lang/Integer;
    :catch_32
    move-exception v1

    .line 78
    .local v1, "ex":Ljava/lang/NumberFormatException;
    new-instance v6, Lcom/alibaba/fastjson/JSONException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "int value overflow, field : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 82
    .end local v1    # "ex":Ljava/lang/NumberFormatException;
    :cond_4c
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v6

    const/4 v7, 0x3

    if-ne v6, v7, :cond_63

    .line 83
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->decimalValue()Ljava/math/BigDecimal;

    move-result-object v0

    .line 84
    .local v0, "decimalValue":Ljava/math/BigDecimal;
    invoke-interface {v3, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 85
    invoke-virtual {v0}, Ljava/math/BigDecimal;->intValue()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 86
    .restart local v2    # "intObj":Ljava/lang/Integer;
    goto :goto_23

    .line 87
    .end local v0    # "decimalValue":Ljava/math/BigDecimal;
    .end local v2    # "intObj":Ljava/lang/Integer;
    :cond_63
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v5

    .line 89
    .local v5, "value":Ljava/lang/Object;
    invoke-static {v5}, Lcom/alibaba/fastjson/util/TypeUtils;->castToInt(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v2

    .restart local v2    # "intObj":Ljava/lang/Integer;
    goto :goto_23
.end method

.method public getFastMatchToken()I
    .registers 2

    .prologue
    .line 100
    const/4 v0, 0x2

    return v0
.end method

.method public write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .registers 11
    .param p1, "serializer"    # Lcom/alibaba/fastjson/serializer/JSONSerializer;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "fieldName"    # Ljava/lang/Object;
    .param p4, "fieldType"    # Ljava/lang/reflect/Type;
    .param p5, "features"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 38
    iget-object v1, p1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .local v1, "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    move-object v2, p2

    .line 40
    check-cast v2, Ljava/lang/Number;

    .line 42
    .local v2, "value":Ljava/lang/Number;
    if-nez v2, :cond_d

    .line 43
    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullNumberAsZero:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v1, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull(Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 61
    :cond_c
    :goto_c
    return-void

    .line 47
    :cond_d
    instance-of v3, p2, Ljava/lang/Long;

    if-eqz v3, :cond_2e

    .line 48
    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    invoke-virtual {v1, v3, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    .line 53
    :goto_18
    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v1, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 54
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 55
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v3, Ljava/lang/Byte;

    if-ne v0, v3, :cond_36

    .line 56
    const/16 v3, 0x42

    invoke-virtual {v1, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_c

    .line 50
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2e
    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    goto :goto_18

    .line 57
    .restart local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_36
    const-class v3, Ljava/lang/Short;

    if-ne v0, v3, :cond_c

    .line 58
    const/16 v3, 0x53

    invoke-virtual {v1, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_c
.end method
