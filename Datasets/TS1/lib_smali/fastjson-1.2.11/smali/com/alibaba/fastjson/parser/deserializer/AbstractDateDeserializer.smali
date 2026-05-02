.class public abstract Lcom/alibaba/fastjson/parser/deserializer/AbstractDateDeserializer;
.super Ljava/lang/Object;
.source "AbstractDateDeserializer.java"

# interfaces
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract cast(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation
.end method

.method public deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16
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
    .line 18
    iget-object v2, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 21
    .local v2, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v9

    const/4 v10, 0x2

    if-ne v9, v10, :cond_1b

    .line 22
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->longValue()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    .line 23
    .local v8, "val":Ljava/lang/Long;
    const/16 v9, 0x10

    invoke-interface {v2, v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 98
    .end local v8    # "val":Ljava/lang/Long;
    :cond_16
    :goto_16
    invoke-virtual {p0, p1, p2, p3, v8}, Lcom/alibaba/fastjson/parser/deserializer/AbstractDateDeserializer;->cast(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    return-object v9

    .line 24
    :cond_1b
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v9

    const/4 v10, 0x4

    if-ne v9, v10, :cond_4b

    .line 25
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v3

    .line 26
    .local v3, "strVal":Ljava/lang/String;
    move-object v8, v3

    .line 27
    .local v8, "val":Ljava/lang/String;
    const/16 v9, 0x10

    invoke-interface {v2, v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 29
    sget-object v9, Lcom/alibaba/fastjson/parser/Feature;->AllowISO8601DateFormat:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v2, v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v9

    if-eqz v9, :cond_16

    .line 30
    new-instance v0, Lcom/alibaba/fastjson/parser/JSONScanner;

    invoke-direct {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;)V

    .line 31
    .local v0, "iso8601Lexer":Lcom/alibaba/fastjson/parser/JSONScanner;
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch()Z

    move-result v9

    if-eqz v9, :cond_47

    .line 32
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->getCalendar()Ljava/util/Calendar;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v8

    .line 34
    .end local v8    # "val":Ljava/lang/String;
    :cond_47
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    goto :goto_16

    .line 36
    .end local v0    # "iso8601Lexer":Lcom/alibaba/fastjson/parser/JSONScanner;
    .end local v3    # "strVal":Ljava/lang/String;
    :cond_4b
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v9

    const/16 v10, 0x8

    if-ne v9, v10, :cond_58

    .line 37
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 38
    const/4 v8, 0x0

    .local v8, "val":Ljava/lang/Object;
    goto :goto_16

    .line 39
    .end local v8    # "val":Ljava/lang/Object;
    :cond_58
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v9

    const/16 v10, 0xc

    if-ne v9, v10, :cond_dc

    .line 40
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 43
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v9

    const/4 v10, 0x4

    if-ne v9, v10, :cond_b7

    .line 44
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v1

    .line 46
    .local v1, "key":Ljava/lang/String;
    sget-object v9, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    invoke-virtual {v9, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9a

    .line 47
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 48
    const/16 v9, 0x11

    invoke-virtual {p1, v9}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 50
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v7

    .line 51
    .local v7, "typeName":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v9

    invoke-virtual {v9}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDefaultClassLoader()Ljava/lang/ClassLoader;

    move-result-object v9

    invoke-static {v7, v9}, Lcom/alibaba/fastjson/util/TypeUtils;->loadClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v6

    .line 52
    .local v6, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v6, :cond_91

    .line 53
    move-object p2, v6

    .line 56
    :cond_91
    const/4 v9, 0x4

    invoke-virtual {p1, v9}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 57
    const/16 v9, 0x10

    invoke-virtual {p1, v9}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 60
    .end local v6    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "typeName":Ljava/lang/String;
    :cond_9a
    const/4 v9, 0x2

    invoke-interface {v2, v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 66
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v9

    const/4 v10, 0x2

    if-ne v9, v10, :cond_bf

    .line 67
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->longValue()J

    move-result-wide v4

    .line 68
    .local v4, "timeMillis":J
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 73
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    .line 75
    .local v8, "val":Ljava/lang/Long;
    const/16 v9, 0xd

    invoke-virtual {p1, v9}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    goto/16 :goto_16

    .line 62
    .end local v1    # "key":Ljava/lang/String;
    .end local v4    # "timeMillis":J
    .end local v8    # "val":Ljava/lang/Long;
    :cond_b7
    new-instance v9, Lcom/alibaba/fastjson/JSONException;

    const-string v10, "syntax error"

    invoke-direct {v9, v10}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 70
    .restart local v1    # "key":Ljava/lang/String;
    :cond_bf
    new-instance v9, Lcom/alibaba/fastjson/JSONException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "syntax error : "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->tokenName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 76
    .end local v1    # "key":Ljava/lang/String;
    :cond_dc
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getResolveStatus()I

    move-result v9

    const/4 v10, 0x2

    if-ne v9, v10, :cond_122

    .line 77
    const/4 v9, 0x0

    invoke-virtual {p1, v9}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setResolveStatus(I)V

    .line 78
    const/16 v9, 0x10

    invoke-virtual {p1, v9}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 80
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v9

    const/4 v10, 0x4

    if-ne v9, v10, :cond_11a

    .line 81
    const-string v9, "val"

    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_107

    .line 82
    new-instance v9, Lcom/alibaba/fastjson/JSONException;

    const-string v10, "syntax error"

    invoke-direct {v9, v10}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 84
    :cond_107
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 89
    const/16 v9, 0x11

    invoke-virtual {p1, v9}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 91
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v8

    .line 93
    .local v8, "val":Ljava/lang/Object;
    const/16 v9, 0xd

    invoke-virtual {p1, v9}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    goto/16 :goto_16

    .line 86
    .end local v8    # "val":Ljava/lang/Object;
    :cond_11a
    new-instance v9, Lcom/alibaba/fastjson/JSONException;

    const-string v10, "syntax error"

    invoke-direct {v9, v10}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 95
    :cond_122
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v8

    .restart local v8    # "val":Ljava/lang/Object;
    goto/16 :goto_16
.end method
