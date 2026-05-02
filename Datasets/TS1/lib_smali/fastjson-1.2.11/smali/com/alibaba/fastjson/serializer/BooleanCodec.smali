.class public Lcom/alibaba/fastjson/serializer/BooleanCodec;
.super Ljava/lang/Object;
.source "BooleanCodec.java"

# interfaces
.implements Lcom/alibaba/fastjson/serializer/ObjectSerializer;
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# static fields
.field public static final instance:Lcom/alibaba/fastjson/serializer/BooleanCodec;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    new-instance v0, Lcom/alibaba/fastjson/serializer/BooleanCodec;

    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/BooleanCodec;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/serializer/BooleanCodec;->instance:Lcom/alibaba/fastjson/serializer/BooleanCodec;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
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

    .line 53
    iget-object v2, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 56
    .local v2, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v4

    const/4 v5, 0x6

    if-ne v4, v5, :cond_1f

    .line 57
    invoke-interface {v2, v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 58
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 81
    .local v0, "boolObj":Ljava/lang/Boolean;
    :goto_10
    const-class v4, Ljava/util/concurrent/atomic/AtomicBoolean;

    if-ne p2, v4, :cond_1e

    .line 82
    new-instance v4, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    move-object v0, v4

    .line 85
    .end local v0    # "boolObj":Ljava/lang/Boolean;
    :cond_1e
    :goto_1e
    return-object v0

    .line 59
    :cond_1f
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v4

    const/4 v5, 0x7

    if-ne v4, v5, :cond_2c

    .line 60
    invoke-interface {v2, v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 61
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .restart local v0    # "boolObj":Ljava/lang/Boolean;
    goto :goto_10

    .line 62
    .end local v0    # "boolObj":Ljava/lang/Boolean;
    :cond_2c
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_43

    .line 63
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->intValue()I

    move-result v1

    .line 64
    .local v1, "intValue":I
    invoke-interface {v2, v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 66
    const/4 v4, 0x1

    if-ne v1, v4, :cond_40

    .line 67
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .restart local v0    # "boolObj":Ljava/lang/Boolean;
    goto :goto_10

    .line 69
    .end local v0    # "boolObj":Ljava/lang/Boolean;
    :cond_40
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .restart local v0    # "boolObj":Ljava/lang/Boolean;
    goto :goto_10

    .line 72
    .end local v0    # "boolObj":Ljava/lang/Boolean;
    .end local v1    # "intValue":I
    :cond_43
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v3

    .line 74
    .local v3, "value":Ljava/lang/Object;
    if-nez v3, :cond_4b

    .line 75
    const/4 v0, 0x0

    goto :goto_1e

    .line 78
    :cond_4b
    invoke-static {v3}, Lcom/alibaba/fastjson/util/TypeUtils;->castToBoolean(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v0

    .restart local v0    # "boolObj":Ljava/lang/Boolean;
    goto :goto_10
.end method

.method public getFastMatchToken()I
    .registers 2

    .prologue
    .line 89
    const/4 v0, 0x6

    return v0
.end method

.method public write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .registers 9
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
    .line 36
    iget-object v0, p1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .local v0, "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    move-object v1, p2

    .line 38
    check-cast v1, Ljava/lang/Boolean;

    .line 39
    .local v1, "value":Ljava/lang/Boolean;
    if-nez v1, :cond_d

    .line 40
    sget-object v2, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullBooleanAsFalse:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull(Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 49
    :goto_c
    return-void

    .line 44
    :cond_d
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 45
    const-string v2, "true"

    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    goto :goto_c

    .line 47
    :cond_19
    const-string v2, "false"

    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    goto :goto_c
.end method
