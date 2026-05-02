.class public Lcom/alibaba/fastjson/parser/deserializer/ThrowableDeserializer;
.super Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;
.source "ThrowableDeserializer.java"


# direct methods
.method public constructor <init>(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;)V
    .registers 3
    .param p1, "mapping"    # Lcom/alibaba/fastjson/parser/ParserConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/parser/ParserConfig;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 20
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p1, p2, p2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;-><init>(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;Ljava/lang/reflect/Type;)V

    .line 21
    return-void
.end method

.method private createException(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/Class;)Ljava/lang/Throwable;
    .registers 14
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Throwable;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 126
    .local p3, "exClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x0

    .line 127
    .local v2, "defaultConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/4 v3, 0x0

    .line 128
    .local v3, "messageConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/4 v0, 0x0

    .line 129
    .local v0, "causeConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual {p3}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v6

    array-length v7, v6

    const/4 v5, 0x0

    :goto_9
    if-ge v5, v7, :cond_39

    aget-object v1, v6, v5

    .line 130
    .local v1, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual {v1}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    .line 131
    .local v4, "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v8, v4

    if-nez v8, :cond_18

    .line 132
    move-object v2, v1

    .line 129
    :cond_15
    :goto_15
    add-int/lit8 v5, v5, 0x1

    goto :goto_9

    .line 136
    :cond_18
    array-length v8, v4

    const/4 v9, 0x1

    if-ne v8, v9, :cond_25

    const/4 v8, 0x0

    aget-object v8, v4, v8

    const-class v9, Ljava/lang/String;

    if-ne v8, v9, :cond_25

    .line 137
    move-object v3, v1

    .line 138
    goto :goto_15

    .line 141
    :cond_25
    array-length v8, v4

    const/4 v9, 0x2

    if-ne v8, v9, :cond_15

    const/4 v8, 0x0

    aget-object v8, v4, v8

    const-class v9, Ljava/lang/String;

    if-ne v8, v9, :cond_15

    const/4 v8, 0x1

    aget-object v8, v4, v8

    const-class v9, Ljava/lang/Throwable;

    if-ne v8, v9, :cond_15

    .line 142
    move-object v0, v1

    .line 143
    goto :goto_15

    .line 147
    .end local v1    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v4    # "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_39
    if-eqz v0, :cond_4b

    .line 148
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    invoke-virtual {v0, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Throwable;

    .line 159
    :goto_4a
    return-object v5

    .line 151
    :cond_4b
    if-eqz v3, :cond_5a

    .line 152
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-virtual {v3, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Throwable;

    goto :goto_4a

    .line 155
    :cond_5a
    if-eqz v2, :cond_66

    .line 156
    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v2, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Throwable;

    goto :goto_4a

    .line 159
    :cond_66
    const/4 v5, 0x0

    goto :goto_4a
.end method


# virtual methods
.method public deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 19
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
    .line 25
    move-object/from16 v0, p1

    iget-object v9, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 27
    .local v9, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v13

    const/16 v14, 0x8

    if-ne v13, v14, :cond_11

    .line 28
    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 29
    const/4 v4, 0x0

    .line 122
    :cond_10
    :goto_10
    return-object v4

    .line 32
    :cond_11
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getResolveStatus()I

    move-result v13

    const/4 v14, 0x2

    if-ne v13, v14, :cond_61

    .line 33
    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setResolveStatus(I)V

    .line 40
    :cond_1e
    const/4 v1, 0x0

    .line 41
    .local v1, "cause":Ljava/lang/Throwable;
    const/4 v6, 0x0

    .line 43
    .local v6, "exClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p2, :cond_35

    move-object/from16 v0, p2

    instance-of v13, v0, Ljava/lang/Class;

    if-eqz v13, :cond_35

    move-object/from16 v2, p2

    .line 44
    check-cast v2, Ljava/lang/Class;

    .line 45
    .local v2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v13, Ljava/lang/Throwable;

    invoke-virtual {v13, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v13

    if-eqz v13, :cond_35

    .line 46
    move-object v6, v2

    .line 50
    .end local v2    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_35
    const/4 v10, 0x0

    .line 51
    .local v10, "message":Ljava/lang/String;
    const/4 v12, 0x0

    .line 52
    .local v12, "stackTrace":[Ljava/lang/StackTraceElement;
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 56
    .local v11, "otherValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_3c
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getSymbolTable()Lcom/alibaba/fastjson/parser/SymbolTable;

    move-result-object v13

    invoke-interface {v9, v13}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanSymbol(Lcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;

    move-result-object v8

    .line 58
    .local v8, "key":Ljava/lang/String;
    if-nez v8, :cond_81

    .line 59
    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v13

    const/16 v14, 0xd

    if-ne v13, v14, :cond_71

    .line 60
    const/16 v13, 0x10

    invoke-interface {v9, v13}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 104
    :goto_53
    const/4 v4, 0x0

    .line 105
    .local v4, "ex":Ljava/lang/Throwable;
    if-nez v6, :cond_117

    .line 106
    new-instance v4, Ljava/lang/Exception;

    .end local v4    # "ex":Ljava/lang/Throwable;
    invoke-direct {v4, v10, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 118
    .restart local v4    # "ex":Ljava/lang/Throwable;
    :cond_5b
    :goto_5b
    if-eqz v12, :cond_10

    .line 119
    invoke-virtual {v4, v12}, Ljava/lang/Throwable;->setStackTrace([Ljava/lang/StackTraceElement;)V

    goto :goto_10

    .line 35
    .end local v1    # "cause":Ljava/lang/Throwable;
    .end local v4    # "ex":Ljava/lang/Throwable;
    .end local v6    # "exClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v8    # "key":Ljava/lang/String;
    .end local v10    # "message":Ljava/lang/String;
    .end local v11    # "otherValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v12    # "stackTrace":[Ljava/lang/StackTraceElement;
    :cond_61
    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v13

    const/16 v14, 0xc

    if-eq v13, v14, :cond_1e

    .line 36
    new-instance v13, Lcom/alibaba/fastjson/JSONException;

    const-string v14, "syntax error"

    invoke-direct {v13, v14}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 63
    .restart local v1    # "cause":Ljava/lang/Throwable;
    .restart local v6    # "exClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v8    # "key":Ljava/lang/String;
    .restart local v10    # "message":Ljava/lang/String;
    .restart local v11    # "otherValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v12    # "stackTrace":[Ljava/lang/StackTraceElement;
    :cond_71
    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v13

    const/16 v14, 0x10

    if-ne v13, v14, :cond_81

    .line 64
    sget-object v13, Lcom/alibaba/fastjson/parser/Feature;->AllowArbitraryCommas:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v9, v13}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v13

    if-nez v13, :cond_3c

    .line 70
    :cond_81
    const/4 v13, 0x4

    invoke-interface {v9, v13}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 72
    sget-object v13, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    invoke-virtual {v13, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_bf

    .line 73
    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v13

    const/4 v14, 0x4

    if-ne v13, v14, :cond_b7

    .line 74
    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v7

    .line 75
    .local v7, "exClassName":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v13

    invoke-virtual {v13}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDefaultClassLoader()Ljava/lang/ClassLoader;

    move-result-object v13

    invoke-static {v7, v13}, Lcom/alibaba/fastjson/util/TypeUtils;->loadClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v6

    .line 79
    const/16 v13, 0x10

    invoke-interface {v9, v13}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 98
    .end local v7    # "exClassName":Ljava/lang/String;
    :goto_a9
    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v13

    const/16 v14, 0xd

    if-ne v13, v14, :cond_3c

    .line 99
    const/16 v13, 0x10

    invoke-interface {v9, v13}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    goto :goto_53

    .line 77
    :cond_b7
    new-instance v13, Lcom/alibaba/fastjson/JSONException;

    const-string v14, "syntax error"

    invoke-direct {v13, v14}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 80
    :cond_bf
    const-string v13, "message"

    invoke-virtual {v13, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_e8

    .line 81
    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v13

    const/16 v14, 0x8

    if-ne v13, v14, :cond_d4

    .line 82
    const/4 v10, 0x0

    .line 88
    :goto_d0
    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    goto :goto_a9

    .line 83
    :cond_d4
    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v13

    const/4 v14, 0x4

    if-ne v13, v14, :cond_e0

    .line 84
    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v10

    goto :goto_d0

    .line 86
    :cond_e0
    new-instance v13, Lcom/alibaba/fastjson/JSONException;

    const-string v14, "syntax error"

    invoke-direct {v13, v14}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 89
    :cond_e8
    const-string v13, "cause"

    invoke-virtual {v13, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_fc

    .line 90
    const/4 v13, 0x0

    const-string v14, "cause"

    move-object/from16 v0, p1

    invoke-virtual {p0, v0, v13, v14}, Lcom/alibaba/fastjson/parser/deserializer/ThrowableDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "cause":Ljava/lang/Throwable;
    check-cast v1, Ljava/lang/Throwable;

    .restart local v1    # "cause":Ljava/lang/Throwable;
    goto :goto_a9

    .line 91
    :cond_fc
    const-string v13, "stackTrace"

    invoke-virtual {v13, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_10f

    .line 92
    const-class v13, [Ljava/lang/StackTraceElement;

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseObject(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v12

    .end local v12    # "stackTrace":[Ljava/lang/StackTraceElement;
    check-cast v12, [Ljava/lang/StackTraceElement;

    .restart local v12    # "stackTrace":[Ljava/lang/StackTraceElement;
    goto :goto_a9

    .line 95
    :cond_10f
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v13

    invoke-interface {v11, v8, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_a9

    .line 109
    .restart local v4    # "ex":Ljava/lang/Throwable;
    :cond_117
    :try_start_117
    invoke-direct {p0, v10, v1, v6}, Lcom/alibaba/fastjson/parser/deserializer/ThrowableDeserializer;->createException(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/Class;)Ljava/lang/Throwable;

    move-result-object v4

    .line 110
    if-nez v4, :cond_5b

    .line 111
    new-instance v5, Ljava/lang/Exception;

    invoke-direct {v5, v10, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_122
    .catch Ljava/lang/Exception; {:try_start_117 .. :try_end_122} :catch_125

    .end local v4    # "ex":Ljava/lang/Throwable;
    .local v5, "ex":Ljava/lang/Throwable;
    move-object v4, v5

    .end local v5    # "ex":Ljava/lang/Throwable;
    .restart local v4    # "ex":Ljava/lang/Throwable;
    goto/16 :goto_5b

    .line 113
    :catch_125
    move-exception v3

    .line 114
    .local v3, "e":Ljava/lang/Exception;
    new-instance v13, Lcom/alibaba/fastjson/JSONException;

    const-string v14, "create instance error"

    invoke-direct {v13, v14, v3}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v13
.end method

.method public getFastMatchToken()I
    .registers 2

    .prologue
    .line 163
    const/16 v0, 0xc

    return v0
.end method
