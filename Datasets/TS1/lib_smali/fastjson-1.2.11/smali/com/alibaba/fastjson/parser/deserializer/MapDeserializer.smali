.class public Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;
.super Ljava/lang/Object;
.source "MapDeserializer.java"

# interfaces
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# static fields
.field public static instance:Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    new-instance v0, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;

    invoke-direct {v0}, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseMap(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/util/Map;Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 19
    .param p0, "parser"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    .param p2, "keyType"    # Ljava/lang/reflect/Type;
    .param p3, "valueType"    # Ljava/lang/reflect/Type;
    .param p4, "fieldName"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 200
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 202
    .local v4, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0xc

    if-eq v11, v12, :cond_2f

    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0x10

    if-eq v11, v12, :cond_2f

    .line 203
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "syntax error, expect {, actual "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->tokenName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 206
    :cond_2f
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v11

    move-object/from16 v0, p2

    invoke-virtual {v11, v0}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v3

    .line 207
    .local v3, "keyDeserializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v11

    move-object/from16 v0, p3

    invoke-virtual {v11, v0}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v10

    .line 208
    .local v10, "valueDeserializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->getFastMatchToken()I

    move-result v11

    invoke-interface {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 210
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getContext()Lcom/alibaba/fastjson/parser/ParseContext;

    move-result-object v1

    .line 213
    .local v1, "context":Lcom/alibaba/fastjson/parser/ParseContext;
    :cond_4e
    :goto_4e
    :try_start_4e
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0xd

    if-ne v11, v12, :cond_5f

    .line 214
    const/16 v11, 0x10

    invoke-interface {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V
    :try_end_5b
    .catchall {:try_start_4e .. :try_end_5b} :catchall_a5

    .line 288
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    .line 291
    .end local p1    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    :goto_5e
    return-object p1

    .line 218
    .restart local p1    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    :cond_5f
    :try_start_5f
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/4 v12, 0x4

    if-ne v11, v12, :cond_f6

    .line 219
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->isRef()Z

    move-result v11

    if-eqz v11, :cond_f6

    sget-object v11, Lcom/alibaba/fastjson/parser/Feature;->DisableSpecialKeyDetect:Lcom/alibaba/fastjson/parser/Feature;

    .line 220
    invoke-interface {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v11

    if-nez v11, :cond_f6

    .line 222
    const/4 v5, 0x0

    .line 224
    .local v5, "object":Ljava/lang/Object;
    const/4 v11, 0x4

    invoke-interface {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 225
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/4 v12, 0x4

    if-ne v11, v12, :cond_ca

    .line 226
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v7

    .line 227
    .local v7, "ref":Ljava/lang/String;
    const-string v11, ".."

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_aa

    .line 228
    iget-object v6, v1, Lcom/alibaba/fastjson/parser/ParseContext;->parent:Lcom/alibaba/fastjson/parser/ParseContext;

    .line 229
    .local v6, "parentContext":Lcom/alibaba/fastjson/parser/ParseContext;
    iget-object v5, v6, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 245
    .end local v5    # "object":Ljava/lang/Object;
    .end local v6    # "parentContext":Lcom/alibaba/fastjson/parser/ParseContext;
    :goto_90
    const/16 v11, 0xd

    invoke-interface {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 246
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0xd

    if-eq v11, v12, :cond_eb

    .line 247
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    const-string v12, "illegal ref"

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11
    :try_end_a5
    .catchall {:try_start_5f .. :try_end_a5} :catchall_a5

    .line 288
    .end local v7    # "ref":Ljava/lang/String;
    :catchall_a5
    move-exception v11

    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    throw v11

    .line 230
    .restart local v5    # "object":Ljava/lang/Object;
    .restart local v7    # "ref":Ljava/lang/String;
    :cond_aa
    :try_start_aa
    const-string v11, "$"

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_bd

    .line 231
    move-object v8, v1

    .line 232
    .local v8, "rootContext":Lcom/alibaba/fastjson/parser/ParseContext;
    :goto_b3
    iget-object v11, v8, Lcom/alibaba/fastjson/parser/ParseContext;->parent:Lcom/alibaba/fastjson/parser/ParseContext;

    if-eqz v11, :cond_ba

    .line 233
    iget-object v8, v8, Lcom/alibaba/fastjson/parser/ParseContext;->parent:Lcom/alibaba/fastjson/parser/ParseContext;

    goto :goto_b3

    .line 236
    :cond_ba
    iget-object v5, v8, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 237
    goto :goto_90

    .line 238
    .end local v8    # "rootContext":Lcom/alibaba/fastjson/parser/ParseContext;
    :cond_bd
    new-instance v11, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;

    invoke-direct {v11, v1, v7}, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;-><init>(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/String;)V

    invoke-virtual {p0, v11}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->addResolveTask(Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;)V

    .line 239
    const/4 v11, 0x1

    invoke-virtual {p0, v11}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setResolveStatus(I)V

    goto :goto_90

    .line 242
    .end local v7    # "ref":Ljava/lang/String;
    :cond_ca
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "illegal ref, "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v13

    invoke-static {v13}, Lcom/alibaba/fastjson/parser/JSONToken;->name(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 249
    .end local v5    # "object":Ljava/lang/Object;
    .restart local v7    # "ref":Ljava/lang/String;
    :cond_eb
    const/16 v11, 0x10

    invoke-interface {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V
    :try_end_f0
    .catchall {:try_start_aa .. :try_end_f0} :catchall_a5

    .line 288
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    move-object p1, v5

    goto/16 :goto_5e

    .line 257
    .end local v7    # "ref":Ljava/lang/String;
    :cond_f6
    :try_start_f6
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v11

    if-nez v11, :cond_137

    .line 258
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/4 v12, 0x4

    if-ne v11, v12, :cond_137

    sget-object v11, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    .line 259
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_137

    sget-object v11, Lcom/alibaba/fastjson/parser/Feature;->DisableSpecialKeyDetect:Lcom/alibaba/fastjson/parser/Feature;

    .line 260
    invoke-interface {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v11

    if-nez v11, :cond_137

    .line 261
    const/4 v11, 0x4

    invoke-interface {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 262
    const/16 v11, 0x10

    invoke-interface {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 263
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0xd

    if-ne v11, v12, :cond_130

    .line 264
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V
    :try_end_12b
    .catchall {:try_start_f6 .. :try_end_12b} :catchall_a5

    .line 288
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    goto/16 :goto_5e

    .line 267
    :cond_130
    :try_start_130
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->getFastMatchToken()I

    move-result v11

    invoke-interface {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 270
    :cond_137
    const/4 v11, 0x0

    move-object/from16 v0, p2

    invoke-interface {v3, p0, v0, v11}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 272
    .local v2, "key":Ljava/lang/Object;
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0x11

    if-eq v11, v12, :cond_163

    .line 273
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "syntax error, expect :, actual "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 276
    :cond_163
    invoke-interface {v10}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->getFastMatchToken()I

    move-result v11

    invoke-interface {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 278
    move-object/from16 v0, p3

    invoke-interface {v10, p0, v0, v2}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .line 279
    .local v9, "value":Ljava/lang/Object;
    invoke-virtual {p0, p1, v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->checkMapResolve(Ljava/util/Map;Ljava/lang/Object;)V

    .line 281
    invoke-interface {p1, v2, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0x10

    if-ne v11, v12, :cond_4e

    .line 284
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->getFastMatchToken()I

    move-result v11

    invoke-interface {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V
    :try_end_185
    .catchall {:try_start_130 .. :try_end_185} :catchall_a5

    goto/16 :goto_4e
.end method

.method public static parseMap(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/util/Map;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/util/Map;
    .registers 18
    .param p0, "parser"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    .param p2, "valueType"    # Ljava/lang/reflect/Type;
    .param p3, "fieldName"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Map;"
        }
    .end annotation

    .prologue
    .line 74
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v7, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 76
    .local v7, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0xc

    if-eq v11, v12, :cond_27

    .line 77
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "syntax error, expect {, actual "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 80
    :cond_27
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getContext()Lcom/alibaba/fastjson/parser/ParseContext;

    move-result-object v3

    .line 82
    .local v3, "context":Lcom/alibaba/fastjson/parser/ParseContext;
    const/4 v5, 0x0

    .line 83
    .local v5, "i":I
    :goto_2c
    :try_start_2c
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->skipWhitespace()V

    .line 84
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->getCurrent()C

    move-result v1

    .line 85
    .local v1, "ch":C
    sget-object v11, Lcom/alibaba/fastjson/parser/Feature;->AllowArbitraryCommas:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v7, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v11

    if-eqz v11, :cond_4a

    .line 86
    :goto_3b
    const/16 v11, 0x2c

    if-ne v1, v11, :cond_4a

    .line 87
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->next()C

    .line 88
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->skipWhitespace()V

    .line 89
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->getCurrent()C

    move-result v1

    goto :goto_3b

    .line 94
    :cond_4a
    const/16 v11, 0x22

    if-ne v1, v11, :cond_85

    .line 95
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getSymbolTable()Lcom/alibaba/fastjson/parser/SymbolTable;

    move-result-object v11

    const/16 v12, 0x22

    invoke-interface {v7, v11, v12}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanSymbol(Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/String;

    move-result-object v6

    .line 96
    .local v6, "key":Ljava/lang/String;
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->skipWhitespace()V

    .line 97
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->getCurrent()C

    move-result v1

    .line 98
    const/16 v11, 0x3a

    if-eq v1, v11, :cond_128

    .line 99
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "expect \':\' at "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->pos()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11
    :try_end_80
    .catchall {:try_start_2c .. :try_end_80} :catchall_80

    .line 193
    .end local v1    # "ch":C
    .end local v6    # "key":Ljava/lang/String;
    :catchall_80
    move-exception v11

    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    throw v11

    .line 101
    .restart local v1    # "ch":C
    :cond_85
    const/16 v11, 0x7d

    if-ne v1, v11, :cond_98

    .line 102
    :try_start_89
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->next()C

    .line 103
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->resetStringPosition()V

    .line 104
    const/16 v11, 0x10

    invoke-interface {v7, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V
    :try_end_94
    .catchall {:try_start_89 .. :try_end_94} :catchall_80

    .line 193
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    .end local p1    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_97
    return-object p1

    .line 106
    .restart local p1    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_98
    const/16 v11, 0x27

    if-ne v1, v11, :cond_de

    .line 107
    :try_start_9c
    sget-object v11, Lcom/alibaba/fastjson/parser/Feature;->AllowSingleQuotes:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v7, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v11

    if-nez v11, :cond_ac

    .line 108
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    const-string v12, "syntax error"

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 111
    :cond_ac
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getSymbolTable()Lcom/alibaba/fastjson/parser/SymbolTable;

    move-result-object v11

    const/16 v12, 0x27

    invoke-interface {v7, v11, v12}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanSymbol(Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/String;

    move-result-object v6

    .line 112
    .restart local v6    # "key":Ljava/lang/String;
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->skipWhitespace()V

    .line 113
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->getCurrent()C

    move-result v1

    .line 114
    const/16 v11, 0x3a

    if-eq v1, v11, :cond_128

    .line 115
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "expect \':\' at "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->pos()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 118
    .end local v6    # "key":Ljava/lang/String;
    :cond_de
    sget-object v11, Lcom/alibaba/fastjson/parser/Feature;->AllowUnQuotedFieldNames:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v7, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v11

    if-nez v11, :cond_ee

    .line 119
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    const-string v12, "syntax error"

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 122
    :cond_ee
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getSymbolTable()Lcom/alibaba/fastjson/parser/SymbolTable;

    move-result-object v11

    invoke-interface {v7, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanSymbolUnQuoted(Lcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;

    move-result-object v6

    .line 123
    .restart local v6    # "key":Ljava/lang/String;
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->skipWhitespace()V

    .line 124
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->getCurrent()C

    move-result v1

    .line 125
    const/16 v11, 0x3a

    if-eq v1, v11, :cond_128

    .line 126
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "expect \':\' at "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->pos()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", actual "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 130
    :cond_128
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->next()C

    .line 131
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->skipWhitespace()V

    .line 132
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->getCurrent()C

    move-result v1

    .line 134
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->resetStringPosition()V

    .line 136
    sget-object v11, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    if-ne v6, v11, :cond_1a0

    sget-object v11, Lcom/alibaba/fastjson/parser/Feature;->DisableSpecialKeyDetect:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v7, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v11

    if-nez v11, :cond_1a0

    .line 137
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getSymbolTable()Lcom/alibaba/fastjson/parser/SymbolTable;

    move-result-object v11

    const/16 v12, 0x22

    invoke-interface {v7, v11, v12}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanSymbol(Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/String;

    move-result-object v9

    .line 138
    .local v9, "typeName":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v11

    invoke-virtual {v11}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDefaultClassLoader()Ljava/lang/ClassLoader;

    move-result-object v11

    invoke-static {v9, v11}, Lcom/alibaba/fastjson/util/TypeUtils;->loadClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v2

    .line 140
    .local v2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v11, Ljava/util/Map;

    invoke-virtual {v11, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v11

    if-eqz v11, :cond_176

    .line 141
    const/16 v11, 0x10

    invoke-interface {v7, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 142
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0xd

    if-ne v11, v12, :cond_1e4

    .line 143
    const/16 v11, 0x10

    invoke-interface {v7, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V
    :try_end_171
    .catchall {:try_start_9c .. :try_end_171} :catchall_80

    .line 193
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    goto/16 :goto_97

    .line 149
    :cond_176
    :try_start_176
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v11

    invoke-virtual {v11, v2}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v4

    .line 151
    .local v4, "deserializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    const/16 v11, 0x10

    invoke-interface {v7, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 153
    const/4 v11, 0x2

    invoke-virtual {p0, v11}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setResolveStatus(I)V

    .line 155
    if-eqz v3, :cond_192

    move-object/from16 v0, p3

    instance-of v11, v0, Ljava/lang/Integer;

    if-nez v11, :cond_192

    .line 156
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->popContext()V

    .line 159
    :cond_192
    move-object/from16 v0, p3

    invoke-interface {v4, p0, v2, v0}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/Map;
    :try_end_19a
    .catchall {:try_start_176 .. :try_end_19a} :catchall_80

    .line 193
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    move-object p1, v11

    goto/16 :goto_97

    .line 163
    .end local v2    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "deserializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    .end local v9    # "typeName":Ljava/lang/String;
    :cond_1a0
    :try_start_1a0
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 165
    if-eqz v5, :cond_1a8

    .line 166
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    .line 169
    :cond_1a8
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0x8

    if-ne v11, v12, :cond_1d1

    .line 170
    const/4 v10, 0x0

    .line 171
    .local v10, "value":Ljava/lang/Object;
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 176
    .end local v10    # "value":Ljava/lang/Object;
    :goto_1b4
    invoke-interface {p1, v6, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    invoke-virtual {p0, p1, v6}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->checkMapResolve(Ljava/util/Map;Ljava/lang/Object;)V

    .line 179
    invoke-virtual {p0, v3, v10, v6}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/Object;Ljava/lang/Object;)Lcom/alibaba/fastjson/parser/ParseContext;

    .line 180
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    .line 182
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I
    :try_end_1c3
    .catchall {:try_start_1a0 .. :try_end_1c3} :catchall_80

    move-result v8

    .line 183
    .local v8, "tok":I
    const/16 v11, 0x14

    if-eq v8, v11, :cond_1cc

    const/16 v11, 0xf

    if-ne v8, v11, :cond_1d8

    .line 193
    :cond_1cc
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    goto/16 :goto_97

    .line 173
    .end local v8    # "tok":I
    :cond_1d1
    :try_start_1d1
    move-object/from16 v0, p2

    invoke-virtual {p0, v0, v6}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseObject(Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .restart local v10    # "value":Ljava/lang/Object;
    goto :goto_1b4

    .line 187
    .end local v10    # "value":Ljava/lang/Object;
    .restart local v8    # "tok":I
    :cond_1d8
    const/16 v11, 0xd

    if-ne v8, v11, :cond_1e4

    .line 188
    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V
    :try_end_1df
    .catchall {:try_start_1d1 .. :try_end_1df} :catchall_80

    .line 193
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    goto/16 :goto_97

    .line 82
    .end local v8    # "tok":I
    :cond_1e4
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_2c
.end method


# virtual methods
.method protected createMap(Ljava/lang/reflect/Type;)Ljava/util/Map;
    .registers 8
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 296
    const-class v3, Ljava/util/Properties;

    if-ne p1, v3, :cond_a

    .line 297
    new-instance v3, Ljava/util/Properties;

    invoke-direct {v3}, Ljava/util/Properties;-><init>()V

    .line 336
    :goto_9
    return-object v3

    .line 300
    :cond_a
    const-class v3, Ljava/util/Hashtable;

    if-ne p1, v3, :cond_14

    .line 301
    new-instance v3, Ljava/util/Hashtable;

    invoke-direct {v3}, Ljava/util/Hashtable;-><init>()V

    goto :goto_9

    .line 304
    :cond_14
    const-class v3, Ljava/util/IdentityHashMap;

    if-ne p1, v3, :cond_1e

    .line 305
    new-instance v3, Ljava/util/IdentityHashMap;

    invoke-direct {v3}, Ljava/util/IdentityHashMap;-><init>()V

    goto :goto_9

    .line 308
    :cond_1e
    const-class v3, Ljava/util/SortedMap;

    if-eq p1, v3, :cond_26

    const-class v3, Ljava/util/TreeMap;

    if-ne p1, v3, :cond_2c

    .line 309
    :cond_26
    new-instance v3, Ljava/util/TreeMap;

    invoke-direct {v3}, Ljava/util/TreeMap;-><init>()V

    goto :goto_9

    .line 312
    :cond_2c
    const-class v3, Ljava/util/concurrent/ConcurrentMap;

    if-eq p1, v3, :cond_34

    const-class v3, Ljava/util/concurrent/ConcurrentHashMap;

    if-ne p1, v3, :cond_3a

    .line 313
    :cond_34
    new-instance v3, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    goto :goto_9

    .line 316
    :cond_3a
    const-class v3, Ljava/util/Map;

    if-eq p1, v3, :cond_42

    const-class v3, Ljava/util/HashMap;

    if-ne p1, v3, :cond_48

    .line 317
    :cond_42
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    goto :goto_9

    .line 320
    :cond_48
    const-class v3, Ljava/util/LinkedHashMap;

    if-ne p1, v3, :cond_52

    .line 321
    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    goto :goto_9

    .line 324
    :cond_52
    instance-of v3, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v3, :cond_62

    move-object v2, p1

    .line 325
    check-cast v2, Ljava/lang/reflect/ParameterizedType;

    .line 327
    .local v2, "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v2}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->createMap(Ljava/lang/reflect/Type;)Ljava/util/Map;

    move-result-object v3

    goto :goto_9

    .end local v2    # "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    :cond_62
    move-object v0, p1

    .line 330
    check-cast v0, Ljava/lang/Class;

    .line 331
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->isInterface()Z

    move-result v3

    if-eqz v3, :cond_84

    .line 332
    new-instance v3, Lcom/alibaba/fastjson/JSONException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "unsupport type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 336
    :cond_84
    :try_start_84
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;
    :try_end_8a
    .catch Ljava/lang/Exception; {:try_start_84 .. :try_end_8a} :catch_8c

    goto/16 :goto_9

    .line 337
    :catch_8c
    move-exception v1

    .line 338
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Lcom/alibaba/fastjson/JSONException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "unsupport type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9
    .param p1, "parser"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    .param p2, "type"    # Ljava/lang/reflect/Type;
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
    .line 33
    const-class v3, Lcom/alibaba/fastjson/JSONObject;

    if-ne p2, v3, :cond_f

    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getFieldTypeResolver()Lcom/alibaba/fastjson/parser/deserializer/FieldTypeResolver;

    move-result-object v3

    if-nez v3, :cond_f

    .line 34
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseObject()Lcom/alibaba/fastjson/JSONObject;

    move-result-object v3

    .line 51
    :goto_e
    return-object v3

    .line 37
    :cond_f
    iget-object v1, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 38
    .local v1, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v3

    const/16 v4, 0x8

    if-ne v3, v4, :cond_20

    .line 39
    const/16 v3, 0x10

    invoke-interface {v1, v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 40
    const/4 v3, 0x0

    goto :goto_e

    .line 43
    :cond_20
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->createMap(Ljava/lang/reflect/Type;)Ljava/util/Map;

    move-result-object v2

    .line 45
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getContext()Lcom/alibaba/fastjson/parser/ParseContext;

    move-result-object v0

    .line 48
    .local v0, "context":Lcom/alibaba/fastjson/parser/ParseContext;
    :try_start_28
    invoke-virtual {p1, v0, v2, p3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/Object;Ljava/lang/Object;)Lcom/alibaba/fastjson/parser/ParseContext;

    .line 49
    invoke-virtual {p0, p1, p2, p3, v2}, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/util/Map;)Ljava/lang/Object;
    :try_end_2e
    .catchall {:try_start_28 .. :try_end_2e} :catchall_33

    move-result-object v3

    .line 51
    invoke-virtual {p1, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    goto :goto_e

    :catchall_33
    move-exception v3

    invoke-virtual {p1, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    throw v3
.end method

.method protected deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/util/Map;)Ljava/lang/Object;
    .registers 10
    .param p1, "parser"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    .param p2, "type"    # Ljava/lang/reflect/Type;
    .param p3, "fieldName"    # Ljava/lang/Object;
    .param p4, "map"    # Ljava/util/Map;

    .prologue
    .line 57
    instance-of v3, p2, Ljava/lang/reflect/ParameterizedType;

    if-eqz v3, :cond_23

    move-object v1, p2

    .line 58
    check-cast v1, Ljava/lang/reflect/ParameterizedType;

    .line 59
    .local v1, "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v3

    const/4 v4, 0x0

    aget-object v0, v3, v4

    .line 60
    .local v0, "keyType":Ljava/lang/reflect/Type;
    invoke-interface {v1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v3

    const/4 v4, 0x1

    aget-object v2, v3, v4

    .line 62
    .local v2, "valueType":Ljava/lang/reflect/Type;
    const-class v3, Ljava/lang/String;

    if-ne v3, v0, :cond_1e

    .line 63
    invoke-static {p1, p4, v2, p3}, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->parseMap(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/util/Map;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v3

    .line 68
    .end local v0    # "keyType":Ljava/lang/reflect/Type;
    .end local v1    # "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    .end local v2    # "valueType":Ljava/lang/reflect/Type;
    :goto_1d
    return-object v3

    .line 65
    .restart local v0    # "keyType":Ljava/lang/reflect/Type;
    .restart local v1    # "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    .restart local v2    # "valueType":Ljava/lang/reflect/Type;
    :cond_1e
    invoke-static {p1, p4, v0, v2, p3}, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->parseMap(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/util/Map;Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_1d

    .line 68
    .end local v0    # "keyType":Ljava/lang/reflect/Type;
    .end local v1    # "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    .end local v2    # "valueType":Ljava/lang/reflect/Type;
    :cond_23
    invoke-virtual {p1, p4, p3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseObject(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_1d
.end method

.method public getFastMatchToken()I
    .registers 2

    .prologue
    .line 344
    const/16 v0, 0xc

    return v0
.end method
