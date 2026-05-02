.class public Lcom/alibaba/fastjson/serializer/StringCodec;
.super Ljava/lang/Object;
.source "StringCodec.java"

# interfaces
.implements Lcom/alibaba/fastjson/serializer/ObjectSerializer;
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# static fields
.field public static instance:Lcom/alibaba/fastjson/serializer/StringCodec;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 31
    new-instance v0, Lcom/alibaba/fastjson/serializer/StringCodec;

    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/StringCodec;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/serializer/StringCodec;->instance:Lcom/alibaba/fastjson/serializer/StringCodec;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;)Ljava/lang/Object;
    .registers 7
    .param p0, "parser"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            ")TT;"
        }
    .end annotation

    .prologue
    const/16 v5, 0x10

    .line 92
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getLexer()Lcom/alibaba/fastjson/parser/JSONLexer;

    move-result-object v0

    .line 93
    .local v0, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v3

    const/4 v4, 0x4

    if-ne v3, v4, :cond_15

    .line 94
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v1

    .line 95
    .local v1, "val":Ljava/lang/String;
    invoke-interface {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 111
    .end local v1    # "val":Ljava/lang/String;
    :goto_14
    return-object v1

    .line 99
    :cond_15
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_24

    .line 100
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->numberString()Ljava/lang/String;

    move-result-object v1

    .line 101
    .restart local v1    # "val":Ljava/lang/String;
    invoke-interface {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    goto :goto_14

    .line 105
    .end local v1    # "val":Ljava/lang/String;
    :cond_24
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v2

    .line 107
    .local v2, "value":Ljava/lang/Object;
    if-nez v2, :cond_2c

    .line 108
    const/4 v1, 0x0

    goto :goto_14

    .line 111
    :cond_2c
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_14
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
    const/4 v3, 0x0

    const/16 v6, 0x10

    const/4 v5, 0x4

    .line 51
    const-class v4, Ljava/lang/StringBuffer;

    if-ne p2, v4, :cond_2d

    .line 52
    iget-object v0, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 53
    .local v0, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v4

    if-ne v4, v5, :cond_1d

    .line 54
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v1

    .line 55
    .local v1, "val":Ljava/lang/String;
    invoke-interface {v0, v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 57
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 87
    .end local v0    # "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    .end local v1    # "val":Ljava/lang/String;
    :cond_1c
    :goto_1c
    return-object v3

    .line 60
    .restart local v0    # "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    :cond_1d
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v2

    .line 62
    .local v2, "value":Ljava/lang/Object;
    if-eqz v2, :cond_1c

    .line 66
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    goto :goto_1c

    .line 69
    .end local v0    # "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    .end local v2    # "value":Ljava/lang/Object;
    :cond_2d
    const-class v4, Ljava/lang/StringBuilder;

    if-ne p2, v4, :cond_56

    .line 70
    iget-object v0, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 71
    .restart local v0    # "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v4

    if-ne v4, v5, :cond_46

    .line 72
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v1

    .line 73
    .restart local v1    # "val":Ljava/lang/String;
    invoke-interface {v0, v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 75
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_1c

    .line 78
    .end local v1    # "val":Ljava/lang/String;
    :cond_46
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v2

    .line 80
    .restart local v2    # "value":Ljava/lang/Object;
    if-eqz v2, :cond_1c

    .line 84
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_1c

    .line 87
    .end local v0    # "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    .end local v2    # "value":Ljava/lang/Object;
    :cond_56
    invoke-static {p1}, Lcom/alibaba/fastjson/serializer/StringCodec;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_1c
.end method

.method public getFastMatchToken()I
    .registers 2

    .prologue
    .line 115
    const/4 v0, 0x4

    return v0
.end method

.method public write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .registers 6
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
    .line 35
    check-cast p2, Ljava/lang/String;

    .end local p2    # "object":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/alibaba/fastjson/serializer/StringCodec;->write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/String;)V

    .line 36
    return-void
.end method

.method public write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/String;)V
    .registers 5
    .param p1, "serializer"    # Lcom/alibaba/fastjson/serializer/JSONSerializer;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 39
    iget-object v0, p1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 41
    .local v0, "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    if-nez p2, :cond_a

    .line 42
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullStringAsEmpty:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull(Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 47
    :goto_9
    return-void

    .line 46
    :cond_a
    invoke-virtual {v0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    goto :goto_9
.end method
