.class public Lcom/alibaba/fastjson/serializer/CharArrayCodec;
.super Ljava/lang/Object;
.source "CharArrayCodec.java"

# interfaces
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
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

    .line 21
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 22
    .local v0, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v3

    const/4 v4, 0x4

    if-ne v3, v4, :cond_17

    .line 23
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v1

    .line 24
    .local v1, "val":Ljava/lang/String;
    invoke-interface {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 25
    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v3

    .line 37
    .end local v1    # "val":Ljava/lang/String;
    :goto_16
    return-object v3

    .line 28
    :cond_17
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_2e

    .line 29
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->integerValue()Ljava/lang/Number;

    move-result-object v1

    .line 30
    .local v1, "val":Ljava/lang/Number;
    invoke-interface {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 31
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toCharArray()[C

    move-result-object v3

    goto :goto_16

    .line 34
    .end local v1    # "val":Ljava/lang/Number;
    :cond_2e
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v2

    .line 35
    .local v2, "value":Ljava/lang/Object;
    if-nez v2, :cond_36

    const/4 v3, 0x0

    goto :goto_16

    .line 37
    :cond_36
    invoke-static {v2}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toCharArray()[C

    move-result-object v3

    goto :goto_16
.end method


# virtual methods
.method public deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
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
    .line 16
    invoke-static {p1}, Lcom/alibaba/fastjson/serializer/CharArrayCodec;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getFastMatchToken()I
    .registers 2

    .prologue
    .line 41
    const/4 v0, 0x4

    return v0
.end method
