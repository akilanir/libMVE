.class public Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;
.super Ljava/lang/Object;
.source "EnumDeserializer.java"

# interfaces
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# instance fields
.field private final enumClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field protected final values:[Ljava/lang/Enum;


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 16
    .local p1, "enumClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;->enumClass:Ljava/lang/Class;

    .line 18
    invoke-virtual {p1}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Enum;

    check-cast v0, [Ljava/lang/Enum;

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;->values:[Ljava/lang/Enum;

    .line 19
    return-void
.end method


# virtual methods
.method public deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13
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
    const/4 v6, 0x0

    .line 29
    :try_start_1
    iget-object v2, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 30
    .local v2, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v4

    .line 31
    .local v4, "token":I
    const/4 v7, 0x2

    if-ne v4, v7, :cond_4a

    .line 32
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->intValue()I

    move-result v1

    .line 33
    .local v1, "intValue":I
    const/16 v6, 0x10

    invoke-interface {v2, v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 35
    if-ltz v1, :cond_1a

    iget-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;->values:[Ljava/lang/Enum;

    array-length v6, v6

    if-le v1, v6, :cond_45

    .line 36
    :cond_1a
    new-instance v6, Lcom/alibaba/fastjson/JSONException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "parse enum "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;->enumClass:Ljava/lang/Class;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " error, value : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_43
    .catch Lcom/alibaba/fastjson/JSONException; {:try_start_1 .. :try_end_43} :catch_43
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_43} :catch_6e

    .line 59
    .end local v1    # "intValue":I
    .end local v2    # "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    .end local v4    # "token":I
    :catch_43
    move-exception v0

    .line 60
    .local v0, "e":Lcom/alibaba/fastjson/JSONException;
    throw v0

    .line 39
    .end local v0    # "e":Lcom/alibaba/fastjson/JSONException;
    .restart local v1    # "intValue":I
    .restart local v2    # "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    .restart local v4    # "token":I
    :cond_45
    :try_start_45
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;->values:[Ljava/lang/Enum;

    aget-object v6, v6, v1

    .line 53
    .end local v1    # "intValue":I
    :cond_49
    :goto_49
    return-object v6

    .line 40
    :cond_4a
    const/4 v7, 0x4

    if-ne v4, v7, :cond_63

    .line 41
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v3

    .line 42
    .local v3, "strVal":Ljava/lang/String;
    const/16 v7, 0x10

    invoke-interface {v2, v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 44
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_49

    .line 48
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;->enumClass:Ljava/lang/Class;

    invoke-static {v6, v3}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v6

    goto :goto_49

    .line 49
    .end local v3    # "strVal":Ljava/lang/String;
    :cond_63
    const/16 v7, 0x8

    if-ne v4, v7, :cond_79

    .line 50
    const/4 v5, 0x0

    .line 51
    .local v5, "value":Ljava/lang/Object;
    const/16 v7, 0x10

    invoke-interface {v2, v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V
    :try_end_6d
    .catch Lcom/alibaba/fastjson/JSONException; {:try_start_45 .. :try_end_6d} :catch_43
    .catch Ljava/lang/Exception; {:try_start_45 .. :try_end_6d} :catch_6e

    goto :goto_49

    .line 61
    .end local v2    # "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    .end local v4    # "token":I
    .end local v5    # "value":Ljava/lang/Object;
    :catch_6e
    move-exception v0

    .line 62
    .local v0, "e":Ljava/lang/Exception;
    new-instance v6, Lcom/alibaba/fastjson/JSONException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 55
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    .restart local v4    # "token":I
    :cond_79
    :try_start_79
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v5

    .line 58
    .restart local v5    # "value":Ljava/lang/Object;
    new-instance v6, Lcom/alibaba/fastjson/JSONException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "parse enum "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;->enumClass:Ljava/lang/Class;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " error, value : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_a6
    .catch Lcom/alibaba/fastjson/JSONException; {:try_start_79 .. :try_end_a6} :catch_43
    .catch Ljava/lang/Exception; {:try_start_79 .. :try_end_a6} :catch_6e
.end method

.method public getFastMatchToken()I
    .registers 2

    .prologue
    .line 67
    const/4 v0, 0x2

    return v0
.end method

.method public valueOf(I)Ljava/lang/Enum;
    .registers 3
    .param p1, "ordinal"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/lang/Enum",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 22
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;->values:[Ljava/lang/Enum;

    aget-object v0, v0, p1

    return-object v0
.end method
