.class public Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;
.super Ljava/lang/Object;
.source "JavaBeanDeserializer.java"

# interfaces
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# instance fields
.field public final beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

.field protected final clazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private final fieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

.field protected final sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;


# direct methods
.method public constructor <init>(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;)V
    .registers 3
    .param p1, "config"    # Lcom/alibaba/fastjson/parser/ParserConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/parser/ParserConfig;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p1, p2, p2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;-><init>(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;Ljava/lang/reflect/Type;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;Ljava/lang/reflect/Type;)V
    .registers 9
    .param p1, "config"    # Lcom/alibaba/fastjson/parser/ParserConfig;
    .param p3, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/parser/ParserConfig;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ")V"
        }
    .end annotation

    .prologue
    .line 39
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p2, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->clazz:Ljava/lang/Class;

    .line 41
    invoke-static {p2, p3}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->build(Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/util/JavaBeanInfo;

    move-result-object v4

    iput-object v4, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 43
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v4, v4, Lcom/alibaba/fastjson/util/JavaBeanInfo;->sortedFields:[Lcom/alibaba/fastjson/util/FieldInfo;

    array-length v4, v4

    new-array v4, v4, [Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    iput-object v4, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 44
    const/4 v2, 0x0

    .local v2, "i":I
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v4, v4, Lcom/alibaba/fastjson/util/JavaBeanInfo;->sortedFields:[Lcom/alibaba/fastjson/util/FieldInfo;

    array-length v3, v4

    .local v3, "size":I
    :goto_1a
    if-ge v2, v3, :cond_2f

    .line 45
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v4, v4, Lcom/alibaba/fastjson/util/JavaBeanInfo;->sortedFields:[Lcom/alibaba/fastjson/util/FieldInfo;

    aget-object v1, v4, v2

    .line 46
    .local v1, "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    invoke-virtual {p1, p1, v4, v1}, Lcom/alibaba/fastjson/parser/ParserConfig;->createFieldDeserializer(Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/util/JavaBeanInfo;Lcom/alibaba/fastjson/util/FieldInfo;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    move-result-object v0

    .line 48
    .local v0, "fieldDeserializer":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    aput-object v0, v4, v2

    .line 44
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 51
    .end local v0    # "fieldDeserializer":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    .end local v1    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    :cond_2f
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v4, v4, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    array-length v4, v4

    new-array v4, v4, [Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    iput-object v4, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->fieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 52
    const/4 v2, 0x0

    iget-object v4, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v4, v4, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    array-length v3, v4

    :goto_3e
    if-ge v2, v3, :cond_53

    .line 53
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v4, v4, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    aget-object v1, v4, v2

    .line 54
    .restart local v1    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    iget-object v4, v1, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->getFieldDeserializer(Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    move-result-object v0

    .line 55
    .restart local v0    # "fieldDeserializer":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->fieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    aput-object v0, v4, v2

    .line 52
    add-int/lit8 v2, v2, 0x1

    goto :goto_3e

    .line 57
    .end local v0    # "fieldDeserializer":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    .end local v1    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    :cond_53
    return-void
.end method

.method protected static parseArray(Ljava/util/Collection;Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)V
    .registers 14
    .param p0, "collection"    # Ljava/util/Collection;
    .param p1, "deser"    # Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    .param p2, "parser"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    .param p3, "type"    # Ljava/lang/reflect/Type;
    .param p4, "fieldName"    # Ljava/lang/Object;

    .prologue
    const/16 v8, 0x5b

    const/16 v7, 0x10

    const/16 v6, 0xe

    .line 748
    iget-object v3, p2, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    check-cast v3, Lcom/alibaba/fastjson/parser/JSONLexerBase;

    .line 749
    .local v3, "lexer":Lcom/alibaba/fastjson/parser/JSONLexerBase;
    invoke-virtual {v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v4

    .line 750
    .local v4, "token":I
    const/16 v5, 0x8

    if-ne v4, v5, :cond_19

    .line 751
    invoke-virtual {v3, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    .line 752
    invoke-virtual {v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v4

    .line 755
    :cond_19
    if-eq v4, v6, :cond_1e

    .line 756
    invoke-virtual {p2, v4}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->throwException(I)V

    .line 758
    :cond_1e
    invoke-virtual {v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->getCurrent()C

    move-result v0

    .line 759
    .local v0, "ch":C
    if-ne v0, v8, :cond_4b

    .line 760
    invoke-virtual {v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 761
    invoke-virtual {v3, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->setToken(I)V

    .line 766
    :goto_2a
    const/4 v1, 0x0

    .line 768
    .local v1, "index":I
    :goto_2b
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {p1, p2, p3, v5}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 769
    .local v2, "item":Ljava/lang/Object;
    invoke-interface {p0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 770
    add-int/lit8 v1, v1, 0x1

    .line 771
    invoke-virtual {v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v5

    if-ne v5, v7, :cond_53

    .line 772
    invoke-virtual {v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->getCurrent()C

    move-result v0

    .line 773
    if-ne v0, v8, :cond_4f

    .line 774
    invoke-virtual {v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 775
    invoke-virtual {v3, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->setToken(I)V

    goto :goto_2b

    .line 763
    .end local v1    # "index":I
    .end local v2    # "item":Ljava/lang/Object;
    :cond_4b
    invoke-virtual {v3, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    goto :goto_2a

    .line 777
    .restart local v1    # "index":I
    .restart local v2    # "item":Ljava/lang/Object;
    :cond_4f
    invoke-virtual {v3, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    goto :goto_2b

    .line 784
    :cond_53
    invoke-virtual {v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v4

    .line 785
    const/16 v5, 0xf

    if-eq v4, v5, :cond_5e

    .line 786
    invoke-virtual {p2, v4}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->throwException(I)V

    .line 789
    :cond_5e
    invoke-virtual {v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->getCurrent()C

    move-result v0

    .line 790
    const/16 v5, 0x2c

    if-ne v0, v5, :cond_6d

    .line 791
    invoke-virtual {v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 792
    invoke-virtual {v3, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->setToken(I)V

    .line 797
    :goto_6c
    return-void

    .line 794
    :cond_6d
    invoke-virtual {v3, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    goto :goto_6c
.end method


# virtual methods
.method protected check(Lcom/alibaba/fastjson/parser/JSONLexer;I)V
    .registers 5
    .param p1, "lexer"    # Lcom/alibaba/fastjson/parser/JSONLexer;
    .param p2, "token"    # I

    .prologue
    .line 199
    invoke-interface {p1}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v0

    if-eq v0, p2, :cond_e

    .line 200
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "syntax error"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 202
    :cond_e
    return-void
.end method

.method public createInstance(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .registers 18
    .param p1, "parser"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    .param p2, "type"    # Ljava/lang/reflect/Type;

    .prologue
    .line 87
    move-object/from16 v0, p2

    instance-of v10, v0, Ljava/lang/Class;

    if-eqz v10, :cond_2a

    .line 88
    iget-object v10, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->clazz:Ljava/lang/Class;

    invoke-virtual {v10}, Ljava/lang/Class;->isInterface()Z

    move-result v10

    if-eqz v10, :cond_2a

    move-object/from16 v1, p2

    .line 89
    check-cast v1, Ljava/lang/Class;

    .line 90
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    .line 91
    .local v6, "loader":Ljava/lang/ClassLoader;
    new-instance v7, Lcom/alibaba/fastjson/JSONObject;

    invoke-direct {v7}, Lcom/alibaba/fastjson/JSONObject;-><init>()V

    .line 92
    .local v7, "obj":Lcom/alibaba/fastjson/JSONObject;
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Class;

    const/4 v11, 0x0

    aput-object v1, v10, v11

    invoke-static {v6, v10, v7}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v9

    .line 127
    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v6    # "loader":Ljava/lang/ClassLoader;
    .end local v7    # "obj":Lcom/alibaba/fastjson/JSONObject;
    :goto_29
    return-object v9

    .line 97
    :cond_2a
    iget-object v10, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v10, v10, Lcom/alibaba/fastjson/util/JavaBeanInfo;->defaultConstructor:Ljava/lang/reflect/Constructor;

    if-nez v10, :cond_32

    .line 98
    const/4 v9, 0x0

    goto :goto_29

    .line 103
    :cond_32
    :try_start_32
    iget-object v10, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v2, v10, Lcom/alibaba/fastjson/util/JavaBeanInfo;->defaultConstructor:Ljava/lang/reflect/Constructor;

    .line 104
    .local v2, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    iget-object v10, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget v10, v10, Lcom/alibaba/fastjson/util/JavaBeanInfo;->defaultConstructorParameterSize:I

    if-nez v10, :cond_69

    .line 105
    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {v2, v10}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_42} :catch_7a

    move-result-object v8

    .line 114
    .local v8, "object":Ljava/lang/Object;
    :goto_43
    if-eqz p1, :cond_ba

    move-object/from16 v0, p1

    iget-object v10, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    sget-object v11, Lcom/alibaba/fastjson/parser/Feature;->InitStringFieldAsEmpty:Lcom/alibaba/fastjson/parser/Feature;

    .line 115
    invoke-interface {v10, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v10

    if-eqz v10, :cond_ba

    .line 116
    iget-object v10, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v11, v10, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    array-length v12, v11

    const/4 v10, 0x0

    :goto_57
    if-ge v10, v12, :cond_ba

    aget-object v5, v11, v10

    .line 117
    .local v5, "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    iget-object v13, v5, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    const-class v14, Ljava/lang/String;

    if-ne v13, v14, :cond_66

    .line 119
    :try_start_61
    const-string v13, ""

    invoke-virtual {v5, v8, v13}, Lcom/alibaba/fastjson/util/FieldInfo;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_66
    .catch Ljava/lang/Exception; {:try_start_61 .. :try_end_66} :catch_9a

    .line 116
    :cond_66
    add-int/lit8 v10, v10, 0x1

    goto :goto_57

    .line 107
    .end local v5    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    .end local v8    # "object":Ljava/lang/Object;
    :cond_69
    :try_start_69
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getContext()Lcom/alibaba/fastjson/parser/ParseContext;

    move-result-object v3

    .line 108
    .local v3, "context":Lcom/alibaba/fastjson/parser/ParseContext;
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    iget-object v12, v3, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    aput-object v12, v10, v11

    invoke-virtual {v2, v10}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_78
    .catch Ljava/lang/Exception; {:try_start_69 .. :try_end_78} :catch_7a

    move-result-object v8

    .restart local v8    # "object":Ljava/lang/Object;
    goto :goto_43

    .line 110
    .end local v2    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v3    # "context":Lcom/alibaba/fastjson/parser/ParseContext;
    .end local v8    # "object":Ljava/lang/Object;
    :catch_7a
    move-exception v4

    .line 111
    .local v4, "e":Ljava/lang/Exception;
    new-instance v10, Lcom/alibaba/fastjson/JSONException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "create instance error, class "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->clazz:Ljava/lang/Class;

    invoke-virtual {v12}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v4}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 120
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v2    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .restart local v5    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    .restart local v8    # "object":Ljava/lang/Object;
    :catch_9a
    move-exception v4

    .line 121
    .restart local v4    # "e":Ljava/lang/Exception;
    new-instance v10, Lcom/alibaba/fastjson/JSONException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "create instance error, class "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->clazz:Ljava/lang/Class;

    invoke-virtual {v12}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v4}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .end local v4    # "e":Ljava/lang/Exception;
    .end local v5    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    :cond_ba
    move-object v9, v8

    .line 127
    goto/16 :goto_29
.end method

.method public createInstance(Ljava/util/Map;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;
    .registers 23
    .param p2, "config"    # Lcom/alibaba/fastjson/parser/ParserConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/alibaba/fastjson/parser/ParserConfig;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 650
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v12, 0x0

    .line 652
    .local v12, "object":Ljava/lang/Object;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructor:Ljava/lang/reflect/Constructor;

    move-object/from16 v17, v0

    if-nez v17, :cond_9f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->buildMethod:Ljava/lang/reflect/Method;

    move-object/from16 v17, v0

    if-nez v17, :cond_9f

    .line 653
    const/16 v17, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->clazz:Ljava/lang/Class;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->createInstance(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v12

    .line 655
    invoke-interface/range {p1 .. p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :cond_37
    :goto_37
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_e2

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 656
    .local v4, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 657
    .local v10, "key":Ljava/lang/String;
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v16

    .line 659
    .local v16, "value":Ljava/lang/Object;
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->getFieldDeserializer(Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    move-result-object v6

    .line 660
    .local v6, "fieldDeser":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    if-eqz v6, :cond_37

    .line 664
    iget-object v0, v6, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v11, v0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    .line 665
    .local v11, "method":Ljava/lang/reflect/Method;
    if-eqz v11, :cond_81

    .line 666
    invoke-virtual {v11}, Ljava/lang/reflect/Method;->getGenericParameterTypes()[Ljava/lang/reflect/Type;

    move-result-object v18

    const/16 v19, 0x0

    aget-object v13, v18, v19

    .line 667
    .local v13, "paramType":Ljava/lang/reflect/Type;
    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-static {v0, v13, v1}, Lcom/alibaba/fastjson/util/TypeUtils;->cast(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    move-result-object v16

    .line 668
    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v16, v18, v19

    move-object/from16 v0, v18

    invoke-virtual {v11, v12, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_37

    .line 670
    .end local v13    # "paramType":Ljava/lang/reflect/Type;
    :cond_81
    iget-object v0, v6, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v5, v0, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    .line 671
    .local v5, "field":Ljava/lang/reflect/Field;
    iget-object v0, v6, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v13, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    .line 672
    .restart local v13    # "paramType":Ljava/lang/reflect/Type;
    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-static {v0, v13, v1}, Lcom/alibaba/fastjson/util/TypeUtils;->cast(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    move-result-object v16

    .line 673
    move-object/from16 v0, v16

    invoke-virtual {v5, v12, v0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_37

    .line 680
    .end local v4    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v5    # "field":Ljava/lang/reflect/Field;
    .end local v6    # "fieldDeser":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    .end local v10    # "key":Ljava/lang/String;
    .end local v11    # "method":Ljava/lang/reflect/Method;
    .end local v13    # "paramType":Ljava/lang/reflect/Type;
    .end local v16    # "value":Ljava/lang/Object;
    :cond_9f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v8, v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 681
    .local v8, "fieldInfoList":[Lcom/alibaba/fastjson/util/FieldInfo;
    array-length v15, v8

    .line 682
    .local v15, "size":I
    new-array v14, v15, [Ljava/lang/Object;

    .line 683
    .local v14, "params":[Ljava/lang/Object;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_ad
    if-ge v9, v15, :cond_c2

    .line 684
    aget-object v7, v8, v9

    .line 685
    .local v7, "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    iget-object v0, v7, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    aput-object v17, v14, v9

    .line 683
    add-int/lit8 v9, v9, 0x1

    goto :goto_ad

    .line 688
    .end local v7    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    :cond_c2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructor:Ljava/lang/reflect/Constructor;

    move-object/from16 v17, v0

    if-eqz v17, :cond_111

    .line 690
    :try_start_d0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructor:Ljava/lang/reflect/Constructor;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_e1
    .catch Ljava/lang/Exception; {:try_start_d0 .. :try_end_e1} :catch_e3

    move-result-object v12

    .line 703
    .end local v8    # "fieldInfoList":[Lcom/alibaba/fastjson/util/FieldInfo;
    .end local v9    # "i":I
    .end local v12    # "object":Ljava/lang/Object;
    .end local v14    # "params":[Ljava/lang/Object;
    .end local v15    # "size":I
    :cond_e2
    :goto_e2
    return-object v12

    .line 691
    .restart local v8    # "fieldInfoList":[Lcom/alibaba/fastjson/util/FieldInfo;
    .restart local v9    # "i":I
    .restart local v12    # "object":Ljava/lang/Object;
    .restart local v14    # "params":[Ljava/lang/Object;
    .restart local v15    # "size":I
    :catch_e3
    move-exception v3

    .line 692
    .local v3, "e":Ljava/lang/Exception;
    new-instance v17, Lcom/alibaba/fastjson/JSONException;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "create instance error, "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructor:Ljava/lang/reflect/Constructor;

    move-object/from16 v19, v0

    .line 693
    invoke-virtual/range {v19 .. v19}, Ljava/lang/reflect/Constructor;->toGenericString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v3}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v17

    .line 695
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_111
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->factoryMethod:Ljava/lang/reflect/Method;

    move-object/from16 v17, v0

    if-eqz v17, :cond_e2

    .line 697
    :try_start_11f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->factoryMethod:Ljava/lang/reflect/Method;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v14}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_134
    .catch Ljava/lang/Exception; {:try_start_11f .. :try_end_134} :catch_136

    move-result-object v12

    goto :goto_e2

    .line 698
    :catch_136
    move-exception v3

    .line 699
    .restart local v3    # "e":Ljava/lang/Exception;
    new-instance v17, Lcom/alibaba/fastjson/JSONException;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "create factory method error, "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->factoryMethod:Ljava/lang/reflect/Method;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/reflect/Method;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v3}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v17
.end method

.method public deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
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
    .line 131
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 47
    .param p1, "parser"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    .param p2, "type"    # Ljava/lang/reflect/Type;
    .param p3, "fieldName"    # Ljava/lang/Object;
    .param p4, "object"    # Ljava/lang/Object;
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

    .prologue
    .line 210
    const-class v4, Lcom/alibaba/fastjson/JSON;

    move-object/from16 v0, p2

    if-eq v0, v4, :cond_c

    const-class v4, Lcom/alibaba/fastjson/JSONObject;

    move-object/from16 v0, p2

    if-ne v0, v4, :cond_11

    .line 211
    :cond_c
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v12

    .line 568
    :goto_10
    return-object v12

    .line 214
    :cond_11
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    move-object/from16 v28, v0

    check-cast v28, Lcom/alibaba/fastjson/parser/JSONLexerBase;

    .line 216
    .local v28, "lexer":Lcom/alibaba/fastjson/parser/JSONLexerBase;
    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v38

    .line 217
    .local v38, "token":I
    const/16 v4, 0x8

    move/from16 v0, v38

    if-ne v0, v4, :cond_2c

    .line 218
    const/16 v4, 0x10

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    .line 219
    const/4 v12, 0x0

    goto :goto_10

    .line 222
    :cond_2c
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getContext()Lcom/alibaba/fastjson/parser/ParseContext;

    move-result-object v15

    .line 223
    .local v15, "context":Lcom/alibaba/fastjson/parser/ParseContext;
    if-eqz p4, :cond_36

    if-eqz v15, :cond_36

    .line 224
    iget-object v15, v15, Lcom/alibaba/fastjson/parser/ParseContext;->parent:Lcom/alibaba/fastjson/parser/ParseContext;

    .line 226
    :cond_36
    const/4 v13, 0x0

    .line 229
    .local v13, "childContext":Lcom/alibaba/fastjson/parser/ParseContext;
    const/4 v9, 0x0

    .line 231
    .local v9, "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/16 v4, 0xd

    move/from16 v0, v38

    if-ne v0, v4, :cond_59

    .line 232
    const/16 v4, 0x10

    :try_start_40
    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    .line 233
    if-nez p4, :cond_4b

    .line 234
    invoke-virtual/range {p0 .. p2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->createInstance(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;)Ljava/lang/Object;
    :try_end_4a
    .catchall {:try_start_40 .. :try_end_4a} :catchall_109

    move-result-object p4

    .line 565
    :cond_4b
    if-eqz v13, :cond_51

    .line 566
    move-object/from16 v0, p4

    iput-object v0, v13, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 568
    :cond_51
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    move-object/from16 v12, p4

    goto :goto_10

    .line 239
    :cond_59
    const/16 v4, 0xe

    move/from16 v0, v38

    if-ne v0, v4, :cond_8d

    .line 240
    :try_start_5f
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget v4, v4, Lcom/alibaba/fastjson/util/JavaBeanInfo;->parserFeatures:I

    sget-object v5, Lcom/alibaba/fastjson/parser/Feature;->SupportArrayToBean:Lcom/alibaba/fastjson/parser/Feature;

    iget v5, v5, Lcom/alibaba/fastjson/parser/Feature;->mask:I

    and-int/2addr v4, v5

    if-nez v4, :cond_76

    sget-object v4, Lcom/alibaba/fastjson/parser/Feature;->SupportArrayToBean:Lcom/alibaba/fastjson/parser/Feature;

    .line 241
    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v4

    if-eqz v4, :cond_8a

    :cond_76
    const/16 v27, 0x1

    .line 242
    .local v27, "isSupportArrayToBean":Z
    :goto_78
    if-eqz v27, :cond_8d

    .line 243
    invoke-virtual/range {p0 .. p4}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->deserialzeArrayMapping(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7d
    .catchall {:try_start_5f .. :try_end_7d} :catchall_109

    move-result-object v12

    .line 565
    if-eqz v13, :cond_84

    .line 566
    move-object/from16 v0, p4

    iput-object v0, v13, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 568
    :cond_84
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    goto :goto_10

    .line 241
    .end local v27    # "isSupportArrayToBean":Z
    :cond_8a
    const/16 v27, 0x0

    goto :goto_78

    .line 247
    :cond_8d
    const/16 v4, 0xc

    move/from16 v0, v38

    if-eq v0, v4, :cond_116

    const/16 v4, 0x10

    move/from16 v0, v38

    if-eq v0, v4, :cond_116

    .line 248
    :try_start_99
    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isBlankInput()Z
    :try_end_9c
    .catchall {:try_start_99 .. :try_end_9c} :catchall_109

    move-result v4

    if-eqz v4, :cond_ad

    .line 249
    const/4 v12, 0x0

    .line 565
    if-eqz v13, :cond_a6

    .line 566
    move-object/from16 v0, p4

    iput-object v0, v13, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 568
    :cond_a6
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    goto/16 :goto_10

    .line 252
    :cond_ad
    const/4 v4, 0x4

    move/from16 v0, v38

    if-ne v0, v4, :cond_cd

    .line 253
    :try_start_b2
    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringVal()Ljava/lang/String;

    move-result-object v37

    .line 254
    .local v37, "strVal":Ljava/lang/String;
    invoke-virtual/range {v37 .. v37}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_cd

    .line 255
    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V
    :try_end_bf
    .catchall {:try_start_b2 .. :try_end_bf} :catchall_109

    .line 256
    const/4 v12, 0x0

    .line 565
    if-eqz v13, :cond_c6

    .line 566
    move-object/from16 v0, p4

    iput-object v0, v13, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 568
    :cond_c6
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    goto/16 :goto_10

    .line 260
    .end local v37    # "strVal":Ljava/lang/String;
    :cond_cd
    :try_start_cd
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "syntax error, expect {, actual "

    .line 261
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    .line 262
    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->tokenName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, ", pos "

    .line 263
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    .line 264
    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->pos()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    .line 266
    .local v10, "buf":Ljava/lang/StringBuffer;
    move-object/from16 v0, p3

    instance-of v4, v0, Ljava/lang/String;

    if-eqz v4, :cond_ff

    .line 267
    const-string v4, ", fieldName "

    .line 268
    invoke-virtual {v10, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    .line 269
    move-object/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 272
    :cond_ff
    new-instance v4, Lcom/alibaba/fastjson/JSONException;

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_109
    .catchall {:try_start_cd .. :try_end_109} :catchall_109

    .line 565
    .end local v10    # "buf":Ljava/lang/StringBuffer;
    :catchall_109
    move-exception v4

    :goto_10a
    if-eqz v13, :cond_110

    .line 566
    move-object/from16 v0, p4

    iput-object v0, v13, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 568
    :cond_110
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    throw v4

    .line 275
    :cond_116
    :try_start_116
    move-object/from16 v0, p1

    iget v4, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveStatus:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_122

    .line 276
    const/4 v4, 0x0

    move-object/from16 v0, p1

    iput v4, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveStatus:I
    :try_end_122
    .catchall {:try_start_116 .. :try_end_122} :catchall_109

    .line 279
    :cond_122
    const/16 v21, 0x0

    .local v21, "fieldIndex":I
    move-object/from16 v25, v9

    .line 280
    .end local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .local v25, "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_126
    const/4 v6, 0x0

    .line 281
    .local v6, "key":Ljava/lang/String;
    const/16 v20, 0x0

    .line 282
    .local v20, "fieldDeser":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    const/16 v22, 0x0

    .line 283
    .local v22, "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    const/16 v19, 0x0

    .line 284
    .local v19, "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_12d
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    array-length v4, v4

    move/from16 v0, v21

    if-ge v0, v4, :cond_148

    .line 285
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    aget-object v20, v4, v21

    .line 286
    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    move-object/from16 v22, v0

    .line 287
    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    move-object/from16 v19, v0

    .line 290
    :cond_148
    const/16 v30, 0x0

    .line 291
    .local v30, "matchField":Z
    const/16 v41, 0x0

    .line 293
    .local v41, "valueParsed":Z
    const/16 v24, 0x0

    .line 294
    .local v24, "fieldValue":Ljava/lang/Object;
    if-eqz v20, :cond_178

    .line 295
    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/alibaba/fastjson/util/FieldInfo;->name_chars:[C

    move-object/from16 v31, v0

    .line 296
    .local v31, "name_chars":[C
    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    if-eq v0, v4, :cond_162

    const-class v4, Ljava/lang/Integer;

    move-object/from16 v0, v19

    if-ne v0, v4, :cond_1cb

    .line 297
    :cond_162
    move-object/from16 v0, v28

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFieldInt([C)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    .line 299
    .local v24, "fieldValue":Ljava/lang/Integer;
    move-object/from16 v0, v28

    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    if-lez v4, :cond_1bc

    .line 300
    const/16 v30, 0x1

    .line 301
    const/16 v41, 0x1

    .line 370
    .end local v24    # "fieldValue":Ljava/lang/Integer;
    .end local v31    # "name_chars":[C
    :cond_178
    :goto_178
    if-nez v30, :cond_486

    .line 371
    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->symbolTable:Lcom/alibaba/fastjson/parser/SymbolTable;

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanSymbol(Lcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;

    move-result-object v6

    .line 373
    if-nez v6, :cond_30a

    .line 374
    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v38

    .line 375
    const/16 v4, 0xd

    move/from16 v0, v38

    if-ne v0, v4, :cond_2f6

    .line 376
    const/16 v4, 0x10

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V
    :try_end_197
    .catchall {:try_start_12d .. :try_end_197} :catchall_346

    move-object/from16 v9, v25

    .line 517
    .end local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_199
    if-nez p4, :cond_59d

    .line 518
    if-nez v9, :cond_55f

    .line 519
    :try_start_19d
    invoke-virtual/range {p0 .. p2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->createInstance(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object p4

    .line 520
    if-nez v13, :cond_1ad

    .line 521
    move-object/from16 v0, p1

    move-object/from16 v1, p4

    move-object/from16 v2, p3

    invoke-virtual {v0, v15, v1, v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/Object;Ljava/lang/Object;)Lcom/alibaba/fastjson/parser/ParseContext;
    :try_end_1ac
    .catchall {:try_start_19d .. :try_end_1ac} :catchall_109

    move-result-object v13

    .line 565
    :cond_1ad
    if-eqz v13, :cond_1b3

    .line 566
    move-object/from16 v0, p4

    iput-object v0, v13, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 568
    :cond_1b3
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    move-object/from16 v12, p4

    goto/16 :goto_10

    .line 302
    .end local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v24    # "fieldValue":Ljava/lang/Integer;
    .restart local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v31    # "name_chars":[C
    :cond_1bc
    :try_start_1bc
    move-object/from16 v0, v28

    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    const/4 v5, -0x2

    if-ne v4, v5, :cond_178

    move-object/from16 v9, v25

    .line 279
    .end local v24    # "fieldValue":Ljava/lang/Integer;
    .end local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v31    # "name_chars":[C
    .restart local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1c5
    :goto_1c5
    add-int/lit8 v21, v21, 0x1

    move-object/from16 v25, v9

    .end local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    goto/16 :goto_126

    .line 305
    .local v24, "fieldValue":Ljava/lang/Object;
    .restart local v31    # "name_chars":[C
    :cond_1cb
    sget-object v4, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    if-eq v0, v4, :cond_1d7

    const-class v4, Ljava/lang/Long;

    move-object/from16 v0, v19

    if-ne v0, v4, :cond_1f8

    .line 306
    :cond_1d7
    move-object/from16 v0, v28

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFieldLong([C)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v24

    .line 308
    .local v24, "fieldValue":Ljava/lang/Long;
    move-object/from16 v0, v28

    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    if-lez v4, :cond_1ee

    .line 309
    const/16 v30, 0x1

    .line 310
    const/16 v41, 0x1

    goto :goto_178

    .line 311
    :cond_1ee
    move-object/from16 v0, v28

    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    const/4 v5, -0x2

    if-ne v4, v5, :cond_178

    move-object/from16 v9, v25

    .line 312
    .end local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    goto :goto_1c5

    .line 314
    .end local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .local v24, "fieldValue":Ljava/lang/Object;
    .restart local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1f8
    const-class v4, Ljava/lang/String;

    move-object/from16 v0, v19

    if-ne v0, v4, :cond_21c

    .line 315
    move-object/from16 v0, v28

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFieldString([C)Ljava/lang/String;

    move-result-object v24

    .line 317
    .local v24, "fieldValue":Ljava/lang/String;
    move-object/from16 v0, v28

    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    if-lez v4, :cond_212

    .line 318
    const/16 v30, 0x1

    .line 319
    const/16 v41, 0x1

    goto/16 :goto_178

    .line 320
    :cond_212
    move-object/from16 v0, v28

    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    const/4 v5, -0x2

    if-ne v4, v5, :cond_178

    move-object/from16 v9, v25

    .line 321
    .end local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    goto :goto_1c5

    .line 323
    .end local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .local v24, "fieldValue":Ljava/lang/Object;
    .restart local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_21c
    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    if-eq v0, v4, :cond_228

    const-class v4, Ljava/lang/Boolean;

    move-object/from16 v0, v19

    if-ne v0, v4, :cond_24b

    .line 324
    :cond_228
    move-object/from16 v0, v28

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFieldBoolean([C)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v24

    .line 326
    .local v24, "fieldValue":Ljava/lang/Boolean;
    move-object/from16 v0, v28

    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    if-lez v4, :cond_240

    .line 327
    const/16 v30, 0x1

    .line 328
    const/16 v41, 0x1

    goto/16 :goto_178

    .line 329
    :cond_240
    move-object/from16 v0, v28

    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    const/4 v5, -0x2

    if-ne v4, v5, :cond_178

    move-object/from16 v9, v25

    .line 330
    .end local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    goto/16 :goto_1c5

    .line 332
    .end local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .local v24, "fieldValue":Ljava/lang/Object;
    .restart local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_24b
    sget-object v4, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    if-eq v0, v4, :cond_257

    const-class v4, Ljava/lang/Float;

    move-object/from16 v0, v19

    if-ne v0, v4, :cond_27a

    .line 333
    :cond_257
    move-object/from16 v0, v28

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFieldFloat([C)F

    move-result v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v24

    .line 335
    .local v24, "fieldValue":Ljava/lang/Float;
    move-object/from16 v0, v28

    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    if-lez v4, :cond_26f

    .line 336
    const/16 v30, 0x1

    .line 337
    const/16 v41, 0x1

    goto/16 :goto_178

    .line 338
    :cond_26f
    move-object/from16 v0, v28

    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    const/4 v5, -0x2

    if-ne v4, v5, :cond_178

    move-object/from16 v9, v25

    .line 339
    .end local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    goto/16 :goto_1c5

    .line 341
    .end local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .local v24, "fieldValue":Ljava/lang/Object;
    .restart local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_27a
    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    if-eq v0, v4, :cond_286

    const-class v4, Ljava/lang/Double;

    move-object/from16 v0, v19

    if-ne v0, v4, :cond_2a9

    .line 342
    :cond_286
    move-object/from16 v0, v28

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFieldDouble([C)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v24

    .line 344
    .local v24, "fieldValue":Ljava/lang/Double;
    move-object/from16 v0, v28

    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    if-lez v4, :cond_29e

    .line 345
    const/16 v30, 0x1

    .line 346
    const/16 v41, 0x1

    goto/16 :goto_178

    .line 347
    :cond_29e
    move-object/from16 v0, v28

    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    const/4 v5, -0x2

    if-ne v4, v5, :cond_178

    move-object/from16 v9, v25

    .line 348
    .end local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    goto/16 :goto_1c5

    .line 350
    .end local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .local v24, "fieldValue":Ljava/lang/Object;
    .restart local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_2a9
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->isEnum()Z

    move-result v4

    if-eqz v4, :cond_2e8

    .line 351
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v4

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v4

    instance-of v4, v4, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;

    if-eqz v4, :cond_2e8

    .line 353
    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->symbolTable:Lcom/alibaba/fastjson/parser/SymbolTable;

    move-object/from16 v0, v28

    move-object/from16 v1, v31

    invoke-virtual {v0, v1, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFieldSymbol([CLcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;

    move-result-object v18

    .line 355
    .local v18, "enumName":Ljava/lang/String;
    move-object/from16 v0, v28

    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    if-lez v4, :cond_2dd

    .line 356
    const/16 v30, 0x1

    .line 357
    const/16 v41, 0x1

    .line 359
    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v24

    .local v24, "fieldValue":Ljava/lang/Enum;
    goto/16 :goto_178

    .line 360
    .local v24, "fieldValue":Ljava/lang/Object;
    :cond_2dd
    move-object/from16 v0, v28

    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    const/4 v5, -0x2

    if-ne v4, v5, :cond_178

    move-object/from16 v9, v25

    .line 361
    .end local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    goto/16 :goto_1c5

    .line 363
    .end local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v18    # "enumName":Ljava/lang/String;
    .restart local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_2e8
    move-object/from16 v0, v28

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchField([C)Z

    move-result v4

    if-eqz v4, :cond_63f

    .line 364
    const/16 v30, 0x1

    goto/16 :goto_178

    .line 379
    .end local v24    # "fieldValue":Ljava/lang/Object;
    .end local v31    # "name_chars":[C
    :cond_2f6
    const/16 v4, 0x10

    move/from16 v0, v38

    if-ne v0, v4, :cond_30a

    .line 380
    sget-object v4, Lcom/alibaba/fastjson/parser/Feature;->AllowArbitraryCommas:Lcom/alibaba/fastjson/parser/Feature;

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v4

    if-eqz v4, :cond_30a

    move-object/from16 v9, v25

    .line 381
    .end local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    goto/16 :goto_1c5

    .line 386
    .end local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_30a
    const-string v4, "$ref"

    if-ne v4, v6, :cond_404

    .line 387
    const/4 v4, 0x4

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextTokenWithColon(I)V

    .line 388
    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v38

    .line 389
    const/4 v4, 0x4

    move/from16 v0, v38

    if-ne v0, v4, :cond_3c8

    .line 390
    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringVal()Ljava/lang/String;

    move-result-object v34

    .line 391
    .local v34, "ref":Ljava/lang/String;
    const-string v4, "@"

    move-object/from16 v0, v34

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_34b

    .line 392
    iget-object v0, v15, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    move-object/from16 p4, v0

    .line 421
    :goto_32f
    const/16 v4, 0xd

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    .line 422
    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v4

    const/16 v5, 0xd

    if-eq v4, v5, :cond_3e5

    .line 423
    new-instance v4, Lcom/alibaba/fastjson/JSONException;

    const-string v5, "illegal ref"

    invoke-direct {v4, v5}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 565
    .end local v30    # "matchField":Z
    .end local v34    # "ref":Ljava/lang/String;
    .end local v41    # "valueParsed":Z
    :catchall_346
    move-exception v4

    move-object/from16 v9, v25

    .end local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    goto/16 :goto_10a

    .line 393
    .end local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v30    # "matchField":Z
    .restart local v34    # "ref":Ljava/lang/String;
    .restart local v41    # "valueParsed":Z
    :cond_34b
    const-string v4, ".."

    move-object/from16 v0, v34

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_37a

    .line 394
    iget-object v0, v15, Lcom/alibaba/fastjson/parser/ParseContext;->parent:Lcom/alibaba/fastjson/parser/ParseContext;

    move-object/from16 v33, v0

    .line 395
    .local v33, "parentContext":Lcom/alibaba/fastjson/parser/ParseContext;
    move-object/from16 v0, v33

    iget-object v4, v0, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    if-eqz v4, :cond_366

    .line 396
    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    move-object/from16 p4, v0

    goto :goto_32f

    .line 398
    :cond_366
    new-instance v4, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    invoke-direct {v4, v0, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;-><init>(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->addResolveTask(Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;)V

    .line 399
    const/4 v4, 0x1

    move-object/from16 v0, p1

    iput v4, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveStatus:I

    goto :goto_32f

    .line 401
    .end local v33    # "parentContext":Lcom/alibaba/fastjson/parser/ParseContext;
    :cond_37a
    const-string v4, "$"

    move-object/from16 v0, v34

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3b5

    .line 402
    move-object/from16 v35, v15

    .line 403
    .local v35, "rootContext":Lcom/alibaba/fastjson/parser/ParseContext;
    :goto_386
    move-object/from16 v0, v35

    iget-object v4, v0, Lcom/alibaba/fastjson/parser/ParseContext;->parent:Lcom/alibaba/fastjson/parser/ParseContext;

    if-eqz v4, :cond_393

    .line 404
    move-object/from16 v0, v35

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/ParseContext;->parent:Lcom/alibaba/fastjson/parser/ParseContext;

    move-object/from16 v35, v0

    goto :goto_386

    .line 407
    :cond_393
    move-object/from16 v0, v35

    iget-object v4, v0, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    if-eqz v4, :cond_3a0

    .line 408
    move-object/from16 v0, v35

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    move-object/from16 p4, v0

    goto :goto_32f

    .line 410
    :cond_3a0
    new-instance v4, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;

    move-object/from16 v0, v35

    move-object/from16 v1, v34

    invoke-direct {v4, v0, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;-><init>(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->addResolveTask(Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;)V

    .line 411
    const/4 v4, 0x1

    move-object/from16 v0, p1

    iput v4, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveStatus:I

    goto/16 :goto_32f

    .line 414
    .end local v35    # "rootContext":Lcom/alibaba/fastjson/parser/ParseContext;
    :cond_3b5
    new-instance v4, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;

    move-object/from16 v0, v34

    invoke-direct {v4, v15, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;-><init>(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->addResolveTask(Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;)V

    .line 415
    const/4 v4, 0x1

    move-object/from16 v0, p1

    iput v4, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveStatus:I

    goto/16 :goto_32f

    .line 418
    .end local v34    # "ref":Ljava/lang/String;
    :cond_3c8
    new-instance v4, Lcom/alibaba/fastjson/JSONException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "illegal ref, "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static/range {v38 .. v38}, Lcom/alibaba/fastjson/parser/JSONToken;->name(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 425
    .restart local v34    # "ref":Ljava/lang/String;
    :cond_3e5
    const/16 v4, 0x10

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    .line 427
    move-object/from16 v0, p1

    move-object/from16 v1, p4

    move-object/from16 v2, p3

    invoke-virtual {v0, v15, v1, v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/Object;Ljava/lang/Object;)Lcom/alibaba/fastjson/parser/ParseContext;
    :try_end_3f5
    .catchall {:try_start_1bc .. :try_end_3f5} :catchall_346

    .line 565
    if-eqz v13, :cond_3fb

    .line 566
    move-object/from16 v0, p4

    iput-object v0, v13, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 568
    :cond_3fb
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    move-object/from16 v12, p4

    goto/16 :goto_10

    .line 432
    .end local v34    # "ref":Ljava/lang/String;
    :cond_404
    :try_start_404
    sget-object v4, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    if-ne v4, v6, :cond_486

    .line 433
    const/4 v4, 0x4

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextTokenWithColon(I)V

    .line 434
    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v4

    const/4 v5, 0x4

    if-ne v4, v5, :cond_47e

    .line 435
    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringVal()Ljava/lang/String;

    move-result-object v39

    .line 436
    .local v39, "typeName":Ljava/lang/String;
    const/16 v4, 0x10

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    .line 438
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v4, v4, Lcom/alibaba/fastjson/util/JavaBeanInfo;->typeName:Ljava/lang/String;

    move-object/from16 v0, v39

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_43d

    .line 439
    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v4

    const/16 v5, 0xd

    if-ne v4, v5, :cond_63f

    .line 440
    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V

    move-object/from16 v9, v25

    .line 441
    .end local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    goto/16 :goto_199

    .line 446
    .end local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_43d
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v14

    .line 447
    .local v14, "config":Lcom/alibaba/fastjson/parser/ParserConfig;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    move-object/from16 v0, p0

    move-object/from16 v1, v39

    invoke-virtual {v0, v14, v4, v1}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->getSeeAlso(Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/util/JavaBeanInfo;Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    move-result-object v16

    .line 448
    .local v16, "deserizer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    const/16 v40, 0x0

    .line 449
    .local v40, "userType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v16, :cond_465

    .line 450
    invoke-virtual {v14}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDefaultClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    move-object/from16 v0, v39

    invoke-static {v0, v4}, Lcom/alibaba/fastjson/util/TypeUtils;->loadClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v40

    .line 451
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v4

    move-object/from16 v0, v40

    invoke-virtual {v4, v0}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v16

    .line 454
    :cond_465
    move-object/from16 v0, v16

    move-object/from16 v1, p1

    move-object/from16 v2, v40

    move-object/from16 v3, p3

    invoke-interface {v0, v1, v2, v3}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_470
    .catchall {:try_start_404 .. :try_end_470} :catchall_346

    move-result-object v12

    .line 565
    if-eqz v13, :cond_477

    .line 566
    move-object/from16 v0, p4

    iput-object v0, v13, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 568
    :cond_477
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    goto/16 :goto_10

    .line 456
    .end local v14    # "config":Lcom/alibaba/fastjson/parser/ParserConfig;
    .end local v16    # "deserizer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    .end local v39    # "typeName":Ljava/lang/String;
    .end local v40    # "userType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_47e
    :try_start_47e
    new-instance v4, Lcom/alibaba/fastjson/JSONException;

    const-string v5, "syntax error"

    invoke-direct {v4, v5}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 461
    :cond_486
    if-nez p4, :cond_63b

    if-nez v25, :cond_63b

    .line 462
    invoke-virtual/range {p0 .. p2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->createInstance(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object p4

    .line 463
    if-nez p4, :cond_637

    .line 464
    new-instance v9, Ljava/util/HashMap;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->fieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    array-length v4, v4

    invoke-direct {v9, v4}, Ljava/util/HashMap;-><init>(I)V
    :try_end_49a
    .catchall {:try_start_47e .. :try_end_49a} :catchall_346

    .line 466
    .end local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_49a
    :try_start_49a
    move-object/from16 v0, p1

    move-object/from16 v1, p4

    move-object/from16 v2, p3

    invoke-virtual {v0, v15, v1, v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/Object;Ljava/lang/Object;)Lcom/alibaba/fastjson/parser/ParseContext;

    move-result-object v13

    .line 469
    :goto_4a4
    if-eqz v30, :cond_514

    .line 470
    if-nez v41, :cond_4cc

    .line 471
    move-object/from16 v0, v20

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3, v9}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->parseField(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/Object;Ljava/lang/reflect/Type;Ljava/util/Map;)V

    .line 503
    :cond_4b3
    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v4

    const/16 v5, 0x10

    if-eq v4, v5, :cond_1c5

    .line 507
    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v4

    const/16 v5, 0xd

    if-ne v4, v5, :cond_52f

    .line 508
    const/16 v4, 0x10

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    goto/16 :goto_199

    .line 473
    :cond_4cc
    if-nez p4, :cond_4e0

    .line 474
    move-object/from16 v0, v22

    iget-object v4, v0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    move-object/from16 v0, v24

    invoke-interface {v9, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 487
    :cond_4d7
    :goto_4d7
    move-object/from16 v0, v28

    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    const/4 v5, 0x4

    if-ne v4, v5, :cond_4b3

    goto/16 :goto_199

    .line 475
    :cond_4e0
    if-nez v24, :cond_50a

    .line 476
    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    if-eq v0, v4, :cond_4d7

    sget-object v4, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    if-eq v0, v4, :cond_4d7

    sget-object v4, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    if-eq v0, v4, :cond_4d7

    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    if-eq v0, v4, :cond_4d7

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    if-eq v0, v4, :cond_4d7

    .line 482
    move-object/from16 v0, v20

    move-object/from16 v1, p4

    move-object/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_4d7

    .line 485
    :cond_50a
    move-object/from16 v0, v20

    move-object/from16 v1, p4

    move-object/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_4d7

    :cond_514
    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v7, p4

    move-object/from16 v8, p2

    .line 492
    invoke-virtual/range {v4 .. v9}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->parseField(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/reflect/Type;Ljava/util/Map;)Z

    move-result v29

    .line 493
    .local v29, "match":Z
    if-nez v29, :cond_4b3

    .line 494
    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v4

    const/16 v5, 0xd

    if-ne v4, v5, :cond_1c5

    .line 495
    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V

    goto/16 :goto_199

    .line 512
    .end local v29    # "match":Z
    :cond_52f
    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v4

    const/16 v5, 0x12

    if-eq v4, v5, :cond_53e

    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1c5

    .line 513
    :cond_53e
    new-instance v4, Lcom/alibaba/fastjson/JSONException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "syntax error, unexpect token "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v7

    invoke-static {v7}, Lcom/alibaba/fastjson/parser/JSONToken;->name(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 526
    :cond_55f
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v0, v4, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    move-object/from16 v23, v0

    .line 527
    .local v23, "fieldInfoList":[Lcom/alibaba/fastjson/util/FieldInfo;
    move-object/from16 v0, v23

    array-length v0, v0

    move/from16 v36, v0

    .line 528
    .local v36, "size":I
    move/from16 v0, v36

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v32, v0

    .line 529
    .local v32, "params":[Ljava/lang/Object;
    const/16 v26, 0x0

    .local v26, "i":I
    :goto_574
    move/from16 v0, v26

    move/from16 v1, v36

    if-ge v0, v1, :cond_589

    .line 530
    aget-object v22, v23, v26

    .line 531
    move-object/from16 v0, v22

    iget-object v4, v0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-interface {v9, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    aput-object v4, v32, v26

    .line 529
    add-int/lit8 v26, v26, 0x1

    goto :goto_574

    .line 534
    :cond_589
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v4, v4, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructor:Ljava/lang/reflect/Constructor;
    :try_end_58f
    .catchall {:try_start_49a .. :try_end_58f} :catchall_109

    if-eqz v4, :cond_5da

    .line 536
    :try_start_591
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v4, v4, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructor:Ljava/lang/reflect/Constructor;

    move-object/from16 v0, v32

    invoke-virtual {v4, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_59c
    .catch Ljava/lang/Exception; {:try_start_591 .. :try_end_59c} :catch_5b4
    .catchall {:try_start_591 .. :try_end_59c} :catchall_109

    move-result-object p4

    .line 550
    .end local v23    # "fieldInfoList":[Lcom/alibaba/fastjson/util/FieldInfo;
    .end local v26    # "i":I
    .end local v32    # "params":[Ljava/lang/Object;
    .end local v36    # "size":I
    :cond_59d
    :goto_59d
    :try_start_59d
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v11, v4, Lcom/alibaba/fastjson/util/JavaBeanInfo;->buildMethod:Ljava/lang/reflect/Method;
    :try_end_5a3
    .catchall {:try_start_59d .. :try_end_5a3} :catchall_109

    .line 551
    .local v11, "buildMethod":Ljava/lang/reflect/Method;
    if-nez v11, :cond_616

    .line 565
    if-eqz v13, :cond_5ab

    .line 566
    move-object/from16 v0, p4

    iput-object v0, v13, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 568
    :cond_5ab
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    move-object/from16 v12, p4

    goto/16 :goto_10

    .line 537
    .end local v11    # "buildMethod":Ljava/lang/reflect/Method;
    .restart local v23    # "fieldInfoList":[Lcom/alibaba/fastjson/util/FieldInfo;
    .restart local v26    # "i":I
    .restart local v32    # "params":[Ljava/lang/Object;
    .restart local v36    # "size":I
    :catch_5b4
    move-exception v17

    .line 538
    .local v17, "e":Ljava/lang/Exception;
    :try_start_5b5
    new-instance v4, Lcom/alibaba/fastjson/JSONException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "create instance error, "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v7, v7, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructor:Ljava/lang/reflect/Constructor;

    .line 539
    invoke-virtual {v7}, Ljava/lang/reflect/Constructor;->toGenericString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v17

    invoke-direct {v4, v5, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 541
    .end local v17    # "e":Ljava/lang/Exception;
    :cond_5da
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v4, v4, Lcom/alibaba/fastjson/util/JavaBeanInfo;->factoryMethod:Ljava/lang/reflect/Method;
    :try_end_5e0
    .catchall {:try_start_5b5 .. :try_end_5e0} :catchall_109

    if-eqz v4, :cond_59d

    .line 543
    :try_start_5e2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v4, v4, Lcom/alibaba/fastjson/util/JavaBeanInfo;->factoryMethod:Ljava/lang/reflect/Method;

    const/4 v5, 0x0

    move-object/from16 v0, v32

    invoke-virtual {v4, v5, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5ee
    .catch Ljava/lang/Exception; {:try_start_5e2 .. :try_end_5ee} :catch_5f0
    .catchall {:try_start_5e2 .. :try_end_5ee} :catchall_109

    move-result-object p4

    goto :goto_59d

    .line 544
    :catch_5f0
    move-exception v17

    .line 545
    .restart local v17    # "e":Ljava/lang/Exception;
    :try_start_5f1
    new-instance v4, Lcom/alibaba/fastjson/JSONException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "create factory method error, "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v7, v7, Lcom/alibaba/fastjson/util/JavaBeanInfo;->factoryMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v17

    invoke-direct {v4, v5, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
    :try_end_616
    .catchall {:try_start_5f1 .. :try_end_616} :catchall_109

    .line 558
    .end local v17    # "e":Ljava/lang/Exception;
    .end local v23    # "fieldInfoList":[Lcom/alibaba/fastjson/util/FieldInfo;
    .end local v26    # "i":I
    .end local v32    # "params":[Ljava/lang/Object;
    .end local v36    # "size":I
    .restart local v11    # "buildMethod":Ljava/lang/reflect/Method;
    :cond_616
    const/4 v4, 0x0

    :try_start_617
    new-array v4, v4, [Ljava/lang/Object;

    move-object/from16 v0, p4

    invoke-virtual {v11, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_61e
    .catch Ljava/lang/Exception; {:try_start_617 .. :try_end_61e} :catch_62c
    .catchall {:try_start_617 .. :try_end_61e} :catchall_109

    move-result-object v12

    .line 565
    .local v12, "builtObj":Ljava/lang/Object;
    if-eqz v13, :cond_625

    .line 566
    move-object/from16 v0, p4

    iput-object v0, v13, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 568
    :cond_625
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    goto/16 :goto_10

    .line 559
    .end local v12    # "builtObj":Ljava/lang/Object;
    :catch_62c
    move-exception v17

    .line 560
    .restart local v17    # "e":Ljava/lang/Exception;
    :try_start_62d
    new-instance v4, Lcom/alibaba/fastjson/JSONException;

    const-string v5, "build object error"

    move-object/from16 v0, v17

    invoke-direct {v4, v5, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
    :try_end_637
    .catchall {:try_start_62d .. :try_end_637} :catchall_109

    .end local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v11    # "buildMethod":Ljava/lang/reflect/Method;
    .end local v17    # "e":Ljava/lang/Exception;
    .restart local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_637
    move-object/from16 v9, v25

    .end local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    goto/16 :goto_49a

    .end local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_63b
    move-object/from16 v9, v25

    .end local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    goto/16 :goto_4a4

    .end local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_63f
    move-object/from16 v9, v25

    .end local v25    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v9    # "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    goto/16 :goto_1c5
.end method

.method public deserialzeArrayMapping(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 21
    .param p1, "parser"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    .param p2, "type"    # Ljava/lang/reflect/Type;
    .param p3, "fieldName"    # Ljava/lang/Object;
    .param p4, "object"    # Ljava/lang/Object;
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

    .prologue
    .line 136
    move-object/from16 v0, p1

    iget-object v6, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 137
    .local v6, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v14

    const/16 v15, 0xe

    if-eq v14, v15, :cond_14

    .line 138
    new-instance v14, Lcom/alibaba/fastjson/JSONException;

    const-string v15, "error"

    invoke-direct {v14, v15}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 141
    :cond_14
    invoke-virtual/range {p0 .. p2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->createInstance(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object p4

    .line 143
    const/4 v5, 0x0

    .local v5, "i":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    array-length v11, v14

    .local v11, "size":I
    :goto_1e
    if-ge v5, v11, :cond_118

    .line 144
    add-int/lit8 v14, v11, -0x1

    if-ne v5, v14, :cond_40

    const/16 v10, 0x5d

    .line 145
    .local v10, "seperator":C
    :goto_26
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    aget-object v4, v14, v5

    .line 146
    .local v4, "fieldDeser":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    iget-object v14, v4, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v3, v14, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 147
    .local v3, "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v14, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne v3, v14, :cond_43

    .line 148
    invoke-interface {v6, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanInt(C)I

    move-result v12

    .line 149
    .local v12, "value":I
    move-object/from16 v0, p4

    invoke-virtual {v4, v0, v12}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;I)V

    .line 143
    .end local v12    # "value":I
    :goto_3d
    add-int/lit8 v5, v5, 0x1

    goto :goto_1e

    .line 144
    .end local v3    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "fieldDeser":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    .end local v10    # "seperator":C
    :cond_40
    const/16 v10, 0x2c

    goto :goto_26

    .line 150
    .restart local v3    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v4    # "fieldDeser":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    .restart local v10    # "seperator":C
    :cond_43
    const-class v14, Ljava/lang/String;

    if-ne v3, v14, :cond_51

    .line 151
    invoke-interface {v6, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanString(C)Ljava/lang/String;

    move-result-object v12

    .line 152
    .local v12, "value":Ljava/lang/String;
    move-object/from16 v0, p4

    invoke-virtual {v4, v0, v12}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_3d

    .line 153
    .end local v12    # "value":Ljava/lang/String;
    :cond_51
    sget-object v14, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne v3, v14, :cond_5f

    .line 154
    invoke-interface {v6, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanLong(C)J

    move-result-wide v12

    .line 155
    .local v12, "value":J
    move-object/from16 v0, p4

    invoke-virtual {v4, v0, v12, v13}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;J)V

    goto :goto_3d

    .line 156
    .end local v12    # "value":J
    :cond_5f
    invoke-virtual {v3}, Ljava/lang/Class;->isEnum()Z

    move-result v14

    if-eqz v14, :cond_a4

    .line 157
    invoke-interface {v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->getCurrent()C

    move-result v1

    .line 160
    .local v1, "ch":C
    const/16 v14, 0x22

    if-eq v1, v14, :cond_71

    const/16 v14, 0x6e

    if-ne v1, v14, :cond_7f

    .line 161
    :cond_71
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getSymbolTable()Lcom/alibaba/fastjson/parser/SymbolTable;

    move-result-object v14

    invoke-interface {v6, v3, v14, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanEnum(Ljava/lang/Class;Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/Enum;

    move-result-object v12

    .line 171
    .local v12, "value":Ljava/lang/Enum;
    :goto_79
    move-object/from16 v0, p4

    invoke-virtual {v4, v0, v12}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_3d

    .line 162
    .end local v12    # "value":Ljava/lang/Enum;
    :cond_7f
    const/16 v14, 0x30

    if-lt v1, v14, :cond_9d

    const/16 v14, 0x39

    if-gt v1, v14, :cond_9d

    .line 163
    invoke-interface {v6, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanInt(C)I

    move-result v9

    .local v9, "ordinal":I
    move-object v14, v4

    .line 165
    check-cast v14, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;

    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v15

    invoke-virtual {v14, v15}, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;->getFieldValueDeserilizer(Lcom/alibaba/fastjson/parser/ParserConfig;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v2

    check-cast v2, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;

    .line 166
    .local v2, "enumDeser":Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;
    invoke-virtual {v2, v9}, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;->valueOf(I)Ljava/lang/Enum;

    move-result-object v12

    .line 167
    .restart local v12    # "value":Ljava/lang/Enum;
    goto :goto_79

    .line 168
    .end local v2    # "enumDeser":Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;
    .end local v9    # "ordinal":I
    .end local v12    # "value":Ljava/lang/Enum;
    :cond_9d
    move-object/from16 v0, p0

    invoke-virtual {v0, v6, v10}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->scanEnum(Lcom/alibaba/fastjson/parser/JSONLexer;C)Ljava/lang/Enum;

    move-result-object v12

    .restart local v12    # "value":Ljava/lang/Enum;
    goto :goto_79

    .line 172
    .end local v1    # "ch":C
    .end local v12    # "value":Ljava/lang/Enum;
    :cond_a4
    sget-object v14, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne v3, v14, :cond_b2

    .line 173
    invoke-interface {v6, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanBoolean(C)Z

    move-result v12

    .line 174
    .local v12, "value":Z
    move-object/from16 v0, p4

    invoke-virtual {v4, v0, v12}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Z)V

    goto :goto_3d

    .line 175
    .end local v12    # "value":Z
    :cond_b2
    sget-object v14, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne v3, v14, :cond_c5

    .line 176
    invoke-interface {v6, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanFloat(C)F

    move-result v12

    .line 177
    .local v12, "value":F
    invoke-static {v12}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v14

    move-object/from16 v0, p4

    invoke-virtual {v4, v0, v14}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_3d

    .line 178
    .end local v12    # "value":F
    :cond_c5
    sget-object v14, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne v3, v14, :cond_d8

    .line 179
    invoke-interface {v6, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanDouble(C)D

    move-result-wide v12

    .line 180
    .local v12, "value":D
    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v14

    move-object/from16 v0, p4

    invoke-virtual {v4, v0, v14}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_3d

    .line 181
    .end local v12    # "value":D
    :cond_d8
    const-class v14, Ljava/util/Date;

    if-ne v3, v14, :cond_f4

    invoke-interface {v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->getCurrent()C

    move-result v14

    const/16 v15, 0x31

    if-ne v14, v15, :cond_f4

    .line 182
    invoke-interface {v6, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanLong(C)J

    move-result-wide v7

    .line 183
    .local v7, "longValue":J
    new-instance v14, Ljava/util/Date;

    invoke-direct {v14, v7, v8}, Ljava/util/Date;-><init>(J)V

    move-object/from16 v0, p4

    invoke-virtual {v4, v0, v14}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_3d

    .line 185
    .end local v7    # "longValue":J
    :cond_f4
    const/16 v14, 0xe

    invoke-interface {v6, v14}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 186
    iget-object v14, v4, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v14, v14, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseObject(Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v12

    .line 187
    .local v12, "value":Ljava/lang/Object;
    move-object/from16 v0, p4

    invoke-virtual {v4, v0, v12}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 189
    const/16 v14, 0x5d

    if-ne v10, v14, :cond_115

    const/16 v14, 0xf

    :goto_10e
    move-object/from16 v0, p0

    invoke-virtual {v0, v6, v14}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->check(Lcom/alibaba/fastjson/parser/JSONLexer;I)V

    goto/16 :goto_3d

    :cond_115
    const/16 v14, 0x10

    goto :goto_10e

    .line 193
    .end local v3    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "fieldDeser":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    .end local v10    # "seperator":C
    .end local v12    # "value":Ljava/lang/Object;
    :cond_118
    const/16 v14, 0x10

    invoke-interface {v6, v14}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 195
    return-object p4
.end method

.method public getFastMatchToken()I
    .registers 2

    .prologue
    .line 643
    const/16 v0, 0xc

    return v0
.end method

.method public getFieldDeserializer(Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    .registers 9
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 60
    if-nez p1, :cond_4

    .line 83
    :cond_3
    :goto_3
    return-object v5

    .line 64
    :cond_4
    const/4 v3, 0x0

    .line 65
    .local v3, "low":I
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    array-length v6, v6

    add-int/lit8 v2, v6, -0x1

    .line 67
    .local v2, "high":I
    :goto_a
    if-gt v3, v2, :cond_3

    .line 68
    add-int v6, v3, v2

    ushr-int/lit8 v4, v6, 0x1

    .line 70
    .local v4, "mid":I
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    aget-object v6, v6, v4

    iget-object v6, v6, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v1, v6, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 72
    .local v1, "fieldName":Ljava/lang/String;
    invoke-virtual {v1, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 74
    .local v0, "cmp":I
    if-gez v0, :cond_21

    .line 75
    add-int/lit8 v3, v4, 0x1

    goto :goto_a

    .line 76
    :cond_21
    if-lez v0, :cond_26

    .line 77
    add-int/lit8 v2, v4, -0x1

    goto :goto_a

    .line 79
    :cond_26
    iget-object v5, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    aget-object v5, v5, v4

    goto :goto_3
.end method

.method public getFieldType(I)Ljava/lang/reflect/Type;
    .registers 3
    .param p1, "ordinal"    # I

    .prologue
    .line 707
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v0, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    return-object v0
.end method

.method protected getSeeAlso(Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/util/JavaBeanInfo;Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;
    .registers 14
    .param p1, "config"    # Lcom/alibaba/fastjson/parser/ParserConfig;
    .param p2, "beanInfo"    # Lcom/alibaba/fastjson/util/JavaBeanInfo;
    .param p3, "typeName"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 717
    iget-object v6, p2, Lcom/alibaba/fastjson/util/JavaBeanInfo;->jsonType:Lcom/alibaba/fastjson/annotation/JSONType;

    if-nez v6, :cond_7

    move-object v2, v5

    .line 738
    :cond_6
    :goto_6
    return-object v2

    .line 721
    :cond_7
    iget-object v6, p2, Lcom/alibaba/fastjson/util/JavaBeanInfo;->jsonType:Lcom/alibaba/fastjson/annotation/JSONType;

    invoke-interface {v6}, Lcom/alibaba/fastjson/annotation/JSONType;->seeAlso()[Ljava/lang/Class;

    move-result-object v7

    array-length v8, v7

    const/4 v6, 0x0

    :goto_f
    if-ge v6, v8, :cond_33

    aget-object v0, v7, v6

    .line 722
    .local v0, "seeAlsoClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1, v0}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v1

    .line 723
    .local v1, "seeAlsoDeser":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    instance-of v9, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    if-eqz v9, :cond_30

    move-object v2, v1

    .line 724
    check-cast v2, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    .line 726
    .local v2, "seeAlsoJavaBeanDeser":Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;
    iget-object v3, v2, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 727
    .local v3, "subBeanInfo":Lcom/alibaba/fastjson/util/JavaBeanInfo;
    iget-object v9, v3, Lcom/alibaba/fastjson/util/JavaBeanInfo;->typeName:Ljava/lang/String;

    invoke-virtual {v9, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_6

    .line 731
    invoke-virtual {p0, p1, v3, p3}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->getSeeAlso(Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/util/JavaBeanInfo;Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    move-result-object v4

    .line 732
    .local v4, "subSeeAlso":Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;
    if-eqz v4, :cond_30

    move-object v2, v4

    .line 733
    goto :goto_6

    .line 721
    .end local v2    # "seeAlsoJavaBeanDeser":Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;
    .end local v3    # "subBeanInfo":Lcom/alibaba/fastjson/util/JavaBeanInfo;
    .end local v4    # "subSeeAlso":Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;
    :cond_30
    add-int/lit8 v6, v6, 0x1

    goto :goto_f

    .end local v0    # "seeAlsoClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "seeAlsoDeser":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    :cond_33
    move-object v2, v5

    .line 738
    goto :goto_6
.end method

.method public parseField(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/reflect/Type;Ljava/util/Map;)Z
    .registers 11
    .param p1, "parser"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "object"    # Ljava/lang/Object;
    .param p4, "objectType"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/lang/reflect/Type;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 574
    .local p5, "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v1, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 576
    .local v1, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->smartMatch(Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    move-result-object v0

    .line 578
    .local v0, "fieldDeserializer":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    if-nez v0, :cond_3e

    .line 579
    sget-object v2, Lcom/alibaba/fastjson/parser/Feature;->IgnoreNotMatch:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v1, v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v2

    if-nez v2, :cond_39

    .line 580
    new-instance v2, Lcom/alibaba/fastjson/JSONException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setter not found, class "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->clazz:Ljava/lang/Class;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", property "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 583
    :cond_39
    invoke-virtual {p1, p3, p2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseExtra(Ljava/lang/Object;Ljava/lang/String;)V

    .line 585
    const/4 v2, 0x0

    .line 592
    :goto_3d
    return v2

    .line 588
    :cond_3e
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->getFastMatchToken()I

    move-result v2

    invoke-interface {v1, v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 590
    invoke-virtual {v0, p1, p3, p4, p5}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->parseField(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/Object;Ljava/lang/reflect/Type;Ljava/util/Map;)V

    .line 592
    const/4 v2, 0x1

    goto :goto_3d
.end method

.method protected parseRest(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "parser"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    .param p2, "type"    # Ljava/lang/reflect/Type;
    .param p3, "fieldName"    # Ljava/lang/Object;
    .param p4, "instance"    # Ljava/lang/Object;

    .prologue
    .line 711
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 713
    .local v0, "value":Ljava/lang/Object;
    return-object v0
.end method

.method protected scanEnum(Lcom/alibaba/fastjson/parser/JSONLexer;C)Ljava/lang/Enum;
    .registers 6
    .param p1, "lexer"    # Lcom/alibaba/fastjson/parser/JSONLexer;
    .param p2, "seperator"    # C
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/parser/JSONLexer;",
            "C)",
            "Ljava/lang/Enum",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 205
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "illegal enum. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Lcom/alibaba/fastjson/parser/JSONLexer;->info()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public smartMatch(Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    .registers 14
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 596
    if-nez p1, :cond_5

    .line 597
    const/4 v2, 0x0

    .line 639
    :cond_4
    :goto_4
    return-object v2

    .line 600
    :cond_5
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->getFieldDeserializer(Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    move-result-object v2

    .line 602
    .local v2, "fieldDeserializer":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    if-nez v2, :cond_26

    .line 603
    const-string v8, "is"

    invoke-virtual {p1, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    .line 605
    .local v6, "startsWithIs":Z
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    array-length v10, v9

    move v8, v7

    :goto_15
    if-ge v8, v10, :cond_26

    aget-object v1, v9, v8

    .line 606
    .local v1, "fieldDeser":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    iget-object v3, v1, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    .line 607
    .local v3, "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    iget-object v0, v3, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 608
    .local v0, "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v4, v3, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 610
    .local v4, "fieldName":Ljava/lang/String;
    invoke-virtual {v4, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_52

    .line 611
    move-object v2, v1

    .line 624
    .end local v0    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "fieldDeser":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    .end local v3    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    .end local v4    # "fieldName":Ljava/lang/String;
    .end local v6    # "startsWithIs":Z
    :cond_26
    :goto_26
    if-nez v2, :cond_4

    .line 625
    const/16 v8, 0x5f

    invoke-virtual {p1, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    const/4 v9, -0x1

    if-eq v8, v9, :cond_4

    .line 626
    const-string v8, "_"

    const-string v9, ""

    invoke-virtual {p1, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 627
    .local v5, "key2":Ljava/lang/String;
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->getFieldDeserializer(Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    move-result-object v2

    .line 629
    if-nez v2, :cond_4

    .line 630
    iget-object v8, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    array-length v9, v8

    :goto_42
    if-ge v7, v9, :cond_4

    aget-object v1, v8, v7

    .line 631
    .restart local v1    # "fieldDeser":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    iget-object v10, v1, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v10, v10, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v10, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_6c

    .line 632
    move-object v2, v1

    .line 633
    goto :goto_4

    .line 615
    .end local v5    # "key2":Ljava/lang/String;
    .restart local v0    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v3    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    .restart local v4    # "fieldName":Ljava/lang/String;
    .restart local v6    # "startsWithIs":Z
    :cond_52
    if-eqz v6, :cond_69

    sget-object v11, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq v0, v11, :cond_5c

    const-class v11, Ljava/lang/Boolean;

    if-ne v0, v11, :cond_69

    :cond_5c
    const/4 v11, 0x2

    .line 617
    invoke-virtual {p1, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v4, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_69

    .line 618
    move-object v2, v1

    .line 619
    goto :goto_26

    .line 605
    :cond_69
    add-int/lit8 v8, v8, 0x1

    goto :goto_15

    .line 630
    .end local v0    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    .end local v4    # "fieldName":Ljava/lang/String;
    .end local v6    # "startsWithIs":Z
    .restart local v5    # "key2":Ljava/lang/String;
    :cond_6c
    add-int/lit8 v7, v7, 0x1

    goto :goto_42
.end method
