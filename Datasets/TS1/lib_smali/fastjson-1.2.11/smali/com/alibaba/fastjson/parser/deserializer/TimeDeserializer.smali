.class public Lcom/alibaba/fastjson/parser/deserializer/TimeDeserializer;
.super Ljava/lang/Object;
.source "TimeDeserializer.java"

# interfaces
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# static fields
.field public static final instance:Lcom/alibaba/fastjson/parser/deserializer/TimeDeserializer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 13
    new-instance v0, Lcom/alibaba/fastjson/parser/deserializer/TimeDeserializer;

    invoke-direct {v0}, Lcom/alibaba/fastjson/parser/deserializer/TimeDeserializer;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/parser/deserializer/TimeDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/TimeDeserializer;

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
    .registers 18
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
    .line 17
    iget-object v4, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 19
    .local v4, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0x10

    if-ne v11, v12, :cond_54

    .line 20
    const/4 v11, 0x4

    invoke-interface {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 22
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/4 v12, 0x4

    if-eq v11, v12, :cond_1d

    .line 23
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    const-string v12, "syntax error"

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 26
    :cond_1d
    const/4 v11, 0x2

    invoke-interface {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 28
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/4 v12, 0x2

    if-eq v11, v12, :cond_30

    .line 29
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    const-string v12, "syntax error"

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 32
    :cond_30
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->longValue()J

    move-result-wide v8

    .line 33
    .local v8, "time":J
    const/16 v11, 0xd

    invoke-interface {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 34
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0xd

    if-eq v11, v12, :cond_49

    .line 35
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    const-string v12, "syntax error"

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 37
    :cond_49
    const/16 v11, 0x10

    invoke-interface {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 39
    new-instance v10, Ljava/sql/Time;

    invoke-direct {v10, v8, v9}, Ljava/sql/Time;-><init>(J)V

    .line 79
    .end local v8    # "time":J
    :cond_53
    :goto_53
    return-object v10

    .line 42
    :cond_54
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v10

    .line 44
    .local v10, "val":Ljava/lang/Object;
    if-nez v10, :cond_5c

    .line 45
    const/4 v10, 0x0

    goto :goto_53

    .line 48
    :cond_5c
    instance-of v11, v10, Ljava/sql/Time;

    if-nez v11, :cond_53

    .line 50
    instance-of v11, v10, Ljava/lang/Number;

    if-eqz v11, :cond_71

    .line 51
    new-instance v11, Ljava/sql/Time;

    check-cast v10, Ljava/lang/Number;

    .end local v10    # "val":Ljava/lang/Object;
    invoke-virtual {v10}, Ljava/lang/Number;->longValue()J

    move-result-wide v12

    invoke-direct {v11, v12, v13}, Ljava/sql/Time;-><init>(J)V

    move-object v10, v11

    goto :goto_53

    .line 52
    .restart local v10    # "val":Ljava/lang/Object;
    :cond_71
    instance-of v11, v10, Ljava/lang/String;

    if-eqz v11, :cond_c3

    move-object v7, v10

    .line 53
    check-cast v7, Ljava/lang/String;

    .line 54
    .local v7, "strVal":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v11

    if-nez v11, :cond_80

    .line 55
    const/4 v10, 0x0

    goto :goto_53

    .line 59
    :cond_80
    new-instance v1, Lcom/alibaba/fastjson/parser/JSONScanner;

    invoke-direct {v1, v7}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;)V

    .line 60
    .local v1, "dateLexer":Lcom/alibaba/fastjson/parser/JSONScanner;
    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch()Z

    move-result v11

    if-eqz v11, :cond_9c

    .line 61
    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->getCalendar()Ljava/util/Calendar;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v5

    .line 78
    .local v5, "longVal":J
    :goto_93
    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    .line 79
    new-instance v10, Ljava/sql/Time;

    .end local v10    # "val":Ljava/lang/Object;
    invoke-direct {v10, v5, v6}, Ljava/sql/Time;-><init>(J)V

    goto :goto_53

    .line 63
    .end local v5    # "longVal":J
    .restart local v10    # "val":Ljava/lang/Object;
    :cond_9c
    const/4 v3, 0x1

    .line 64
    .local v3, "isDigit":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_9e
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v11

    if-ge v2, v11, :cond_b1

    .line 65
    invoke-virtual {v7, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 66
    .local v0, "ch":C
    const/16 v11, 0x30

    if-lt v0, v11, :cond_b0

    const/16 v11, 0x39

    if-le v0, v11, :cond_bb

    .line 67
    :cond_b0
    const/4 v3, 0x0

    .line 71
    .end local v0    # "ch":C
    :cond_b1
    if-nez v3, :cond_be

    .line 72
    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    .line 73
    invoke-static {v7}, Ljava/sql/Time;->valueOf(Ljava/lang/String;)Ljava/sql/Time;

    move-result-object v10

    goto :goto_53

    .line 64
    .restart local v0    # "ch":C
    :cond_bb
    add-int/lit8 v2, v2, 0x1

    goto :goto_9e

    .line 76
    .end local v0    # "ch":C
    :cond_be
    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    .restart local v5    # "longVal":J
    goto :goto_93

    .line 82
    .end local v1    # "dateLexer":Lcom/alibaba/fastjson/parser/JSONScanner;
    .end local v2    # "i":I
    .end local v3    # "isDigit":Z
    .end local v5    # "longVal":J
    .end local v7    # "strVal":Ljava/lang/String;
    :cond_c3
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    const-string v12, "parse error"

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11
.end method

.method public getFastMatchToken()I
    .registers 2

    .prologue
    .line 86
    const/4 v0, 0x2

    return v0
.end method
