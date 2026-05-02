.class public Lcom/alibaba/fastjson/parser/DefaultJSONParser;
.super Ljava/lang/Object;
.source "DefaultJSONParser.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;
    }
.end annotation


# static fields
.field public static final NONE:I = 0x0

.field public static final NeedToResolve:I = 0x1

.field public static final TypeNameRedirect:I = 0x2

.field private static final primitiveClasses:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field


# instance fields
.field protected config:Lcom/alibaba/fastjson/parser/ParserConfig;

.field protected context:Lcom/alibaba/fastjson/parser/ParseContext;

.field private contextArray:[Lcom/alibaba/fastjson/parser/ParseContext;

.field private contextArrayIndex:I

.field private dateFormat:Ljava/text/DateFormat;

.field private dateFormatPattern:Ljava/lang/String;

.field private extraProcessors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/parser/deserializer/ExtraProcessor;",
            ">;"
        }
    .end annotation
.end field

.field private extraTypeProviders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/parser/deserializer/ExtraTypeProvider;",
            ">;"
        }
    .end annotation
.end field

.field protected fieldTypeResolver:Lcom/alibaba/fastjson/parser/deserializer/FieldTypeResolver;

.field public final input:Ljava/lang/Object;

.field public final lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

.field public resolveStatus:I

.field private resolveTaskList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;",
            ">;"
        }
    .end annotation
.end field

.field public final symbolTable:Lcom/alibaba/fastjson/parser/SymbolTable;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 81
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->primitiveClasses:Ljava/util/Set;

    .line 106
    sget-object v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->primitiveClasses:Ljava/util/Set;

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 107
    sget-object v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->primitiveClasses:Ljava/util/Set;

    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 108
    sget-object v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->primitiveClasses:Ljava/util/Set;

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 109
    sget-object v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->primitiveClasses:Ljava/util/Set;

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 110
    sget-object v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->primitiveClasses:Ljava/util/Set;

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 111
    sget-object v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->primitiveClasses:Ljava/util/Set;

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 112
    sget-object v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->primitiveClasses:Ljava/util/Set;

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 114
    sget-object v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->primitiveClasses:Ljava/util/Set;

    const-class v1, Ljava/lang/Boolean;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 115
    sget-object v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->primitiveClasses:Ljava/util/Set;

    const-class v1, Ljava/lang/Byte;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 116
    sget-object v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->primitiveClasses:Ljava/util/Set;

    const-class v1, Ljava/lang/Short;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 117
    sget-object v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->primitiveClasses:Ljava/util/Set;

    const-class v1, Ljava/lang/Integer;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 118
    sget-object v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->primitiveClasses:Ljava/util/Set;

    const-class v1, Ljava/lang/Long;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 119
    sget-object v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->primitiveClasses:Ljava/util/Set;

    const-class v1, Ljava/lang/Float;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 120
    sget-object v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->primitiveClasses:Ljava/util/Set;

    const-class v1, Ljava/lang/Double;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 122
    sget-object v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->primitiveClasses:Ljava/util/Set;

    const-class v1, Ljava/math/BigInteger;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 123
    sget-object v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->primitiveClasses:Ljava/util/Set;

    const-class v1, Ljava/math/BigDecimal;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 124
    sget-object v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->primitiveClasses:Ljava/util/Set;

    const-class v1, Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 125
    return-void
.end method

.method public constructor <init>(Lcom/alibaba/fastjson/parser/JSONLexer;)V
    .registers 3
    .param p1, "lexer"    # Lcom/alibaba/fastjson/parser/JSONLexer;

    .prologue
    .line 165
    invoke-static {}, Lcom/alibaba/fastjson/parser/ParserConfig;->getGlobalInstance()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;-><init>(Lcom/alibaba/fastjson/parser/JSONLexer;Lcom/alibaba/fastjson/parser/ParserConfig;)V

    .line 166
    return-void
.end method

.method public constructor <init>(Lcom/alibaba/fastjson/parser/JSONLexer;Lcom/alibaba/fastjson/parser/ParserConfig;)V
    .registers 4
    .param p1, "lexer"    # Lcom/alibaba/fastjson/parser/JSONLexer;
    .param p2, "config"    # Lcom/alibaba/fastjson/parser/ParserConfig;

    .prologue
    .line 169
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;-><init>(Ljava/lang/Object;Lcom/alibaba/fastjson/parser/JSONLexer;Lcom/alibaba/fastjson/parser/ParserConfig;)V

    .line 170
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Lcom/alibaba/fastjson/parser/JSONLexer;Lcom/alibaba/fastjson/parser/ParserConfig;)V
    .registers 8
    .param p1, "input"    # Ljava/lang/Object;
    .param p2, "lexer"    # Lcom/alibaba/fastjson/parser/JSONLexer;
    .param p3, "config"    # Lcom/alibaba/fastjson/parser/ParserConfig;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    sget-object v1, Lcom/alibaba/fastjson/JSON;->DEFFAULT_DATE_FORMAT:Ljava/lang/String;

    iput-object v1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->dateFormatPattern:Ljava/lang/String;

    .line 91
    iput v3, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->contextArrayIndex:I

    .line 99
    iput v3, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveStatus:I

    .line 101
    iput-object v2, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->extraTypeProviders:Ljava/util/List;

    .line 102
    iput-object v2, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->extraProcessors:Ljava/util/List;

    .line 103
    iput-object v2, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->fieldTypeResolver:Lcom/alibaba/fastjson/parser/deserializer/FieldTypeResolver;

    .line 173
    iput-object p2, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 174
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->input:Ljava/lang/Object;

    .line 175
    iput-object p3, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->config:Lcom/alibaba/fastjson/parser/ParserConfig;

    .line 176
    iget-object v1, p3, Lcom/alibaba/fastjson/parser/ParserConfig;->symbolTable:Lcom/alibaba/fastjson/parser/SymbolTable;

    iput-object v1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->symbolTable:Lcom/alibaba/fastjson/parser/SymbolTable;

    .line 178
    invoke-interface {p2}, Lcom/alibaba/fastjson/parser/JSONLexer;->getCurrent()C

    move-result v0

    .line 179
    .local v0, "ch":I
    const/16 v1, 0x7b

    if-ne v0, v1, :cond_2f

    .line 180
    invoke-interface {p2}, Lcom/alibaba/fastjson/parser/JSONLexer;->next()C

    .line 181
    check-cast p2, Lcom/alibaba/fastjson/parser/JSONLexerBase;

    .end local p2    # "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    const/16 v1, 0xc

    iput v1, p2, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 188
    :goto_2e
    return-void

    .line 182
    .restart local p2    # "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    :cond_2f
    const/16 v1, 0x5b

    if-ne v0, v1, :cond_3d

    .line 183
    invoke-interface {p2}, Lcom/alibaba/fastjson/parser/JSONLexer;->next()C

    .line 184
    check-cast p2, Lcom/alibaba/fastjson/parser/JSONLexerBase;

    .end local p2    # "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    const/16 v1, 0xe

    iput v1, p2, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_2e

    .line 186
    .restart local p2    # "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    :cond_3d
    invoke-interface {p2}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    goto :goto_2e
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 149
    invoke-static {}, Lcom/alibaba/fastjson/parser/ParserConfig;->getGlobalInstance()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v0

    sget v1, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    invoke-direct {p0, p1, v0, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;-><init>(Ljava/lang/String;Lcom/alibaba/fastjson/parser/ParserConfig;I)V

    .line 150
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/alibaba/fastjson/parser/ParserConfig;)V
    .registers 5
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "config"    # Lcom/alibaba/fastjson/parser/ParserConfig;

    .prologue
    .line 153
    new-instance v0, Lcom/alibaba/fastjson/parser/JSONScanner;

    sget v1, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    invoke-direct {v0, p1, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;I)V

    invoke-direct {p0, p1, v0, p2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;-><init>(Ljava/lang/Object;Lcom/alibaba/fastjson/parser/JSONLexer;Lcom/alibaba/fastjson/parser/ParserConfig;)V

    .line 154
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/alibaba/fastjson/parser/ParserConfig;I)V
    .registers 5
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "config"    # Lcom/alibaba/fastjson/parser/ParserConfig;
    .param p3, "features"    # I

    .prologue
    .line 157
    new-instance v0, Lcom/alibaba/fastjson/parser/JSONScanner;

    invoke-direct {v0, p1, p3}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;I)V

    invoke-direct {p0, p1, v0, p2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;-><init>(Ljava/lang/Object;Lcom/alibaba/fastjson/parser/JSONLexer;Lcom/alibaba/fastjson/parser/ParserConfig;)V

    .line 158
    return-void
.end method

.method public constructor <init>([CILcom/alibaba/fastjson/parser/ParserConfig;I)V
    .registers 6
    .param p1, "input"    # [C
    .param p2, "length"    # I
    .param p3, "config"    # Lcom/alibaba/fastjson/parser/ParserConfig;
    .param p4, "features"    # I

    .prologue
    .line 161
    new-instance v0, Lcom/alibaba/fastjson/parser/JSONScanner;

    invoke-direct {v0, p1, p2, p4}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>([CII)V

    invoke-direct {p0, p1, v0, p3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;-><init>(Ljava/lang/Object;Lcom/alibaba/fastjson/parser/JSONLexer;Lcom/alibaba/fastjson/parser/ParserConfig;)V

    .line 162
    return-void
.end method

.method private addContext(Lcom/alibaba/fastjson/parser/ParseContext;)V
    .registers 8
    .param p1, "context"    # Lcom/alibaba/fastjson/parser/ParseContext;

    .prologue
    const/4 v5, 0x0

    .line 1248
    iget v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->contextArrayIndex:I

    add-int/lit8 v3, v0, 0x1

    iput v3, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->contextArrayIndex:I

    .line 1249
    .local v0, "i":I
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->contextArray:[Lcom/alibaba/fastjson/parser/ParseContext;

    if-nez v3, :cond_16

    .line 1250
    const/16 v3, 0x8

    new-array v3, v3, [Lcom/alibaba/fastjson/parser/ParseContext;

    iput-object v3, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->contextArray:[Lcom/alibaba/fastjson/parser/ParseContext;

    .line 1257
    :cond_11
    :goto_11
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->contextArray:[Lcom/alibaba/fastjson/parser/ParseContext;

    aput-object p1, v3, v0

    .line 1258
    return-void

    .line 1251
    :cond_16
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->contextArray:[Lcom/alibaba/fastjson/parser/ParseContext;

    array-length v3, v3

    if-lt v0, v3, :cond_11

    .line 1252
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->contextArray:[Lcom/alibaba/fastjson/parser/ParseContext;

    array-length v3, v3

    mul-int/lit8 v3, v3, 0x3

    div-int/lit8 v2, v3, 0x2

    .line 1253
    .local v2, "newLen":I
    new-array v1, v2, [Lcom/alibaba/fastjson/parser/ParseContext;

    .line 1254
    .local v1, "newArray":[Lcom/alibaba/fastjson/parser/ParseContext;
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->contextArray:[Lcom/alibaba/fastjson/parser/ParseContext;

    iget-object v4, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->contextArray:[Lcom/alibaba/fastjson/parser/ParseContext;

    array-length v4, v4

    invoke-static {v3, v5, v1, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1255
    iput-object v1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->contextArray:[Lcom/alibaba/fastjson/parser/ParseContext;

    goto :goto_11
.end method


# virtual methods
.method public final accept(I)V
    .registers 6
    .param p1, "token"    # I

    .prologue
    .line 1371
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 1372
    .local v0, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v1

    if-ne v1, p1, :cond_c

    .line 1373
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 1378
    return-void

    .line 1375
    :cond_c
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "syntax error, expect "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Lcom/alibaba/fastjson/parser/JSONToken;->name(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", actual "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1376
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v3

    invoke-static {v3}, Lcom/alibaba/fastjson/parser/JSONToken;->name(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final accept(II)V
    .registers 5
    .param p1, "token"    # I
    .param p2, "nextExpectToken"    # I

    .prologue
    .line 1381
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 1382
    .local v0, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v1

    if-ne v1, p1, :cond_c

    .line 1383
    invoke-interface {v0, p2}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 1387
    :goto_b
    return-void

    .line 1385
    :cond_c
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->throwException(I)V

    goto :goto_b
.end method

.method public acceptType(Ljava/lang/String;)V
    .registers 5
    .param p1, "typeName"    # Ljava/lang/String;

    .prologue
    .line 976
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 978
    .local v0, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon()V

    .line 980
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v1

    const/4 v2, 0x4

    if-eq v1, v2, :cond_14

    .line 981
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    const-string v2, "type not match error"

    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 984
    :cond_14
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 985
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 986
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v1

    const/16 v2, 0x10

    if-ne v1, v2, :cond_2c

    .line 987
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 992
    :cond_2c
    return-void

    .line 990
    :cond_2d
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    const-string v2, "type not match error"

    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public addResolveTask(Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;)V
    .registers 4
    .param p1, "task"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;

    .prologue
    .line 1179
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveTaskList:Ljava/util/List;

    if-nez v0, :cond_c

    .line 1180
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveTaskList:Ljava/util/List;

    .line 1182
    :cond_c
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveTaskList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1183
    return-void
.end method

.method public checkListResolve(Ljava/util/Collection;)V
    .registers 8
    .param p1, "array"    # Ljava/util/Collection;

    .prologue
    const/4 v5, 0x0

    .line 1014
    iget v3, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveStatus:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_25

    .line 1015
    instance-of v3, p1, Ljava/util/List;

    if-eqz v3, :cond_26

    .line 1016
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, "index":I
    move-object v1, p1

    .line 1017
    check-cast v1, Ljava/util/List;

    .line 1018
    .local v1, "list":Ljava/util/List;
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getLastResolveTask()Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;

    move-result-object v2

    .line 1019
    .local v2, "task":Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;
    new-instance v3, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;

    invoke-direct {v3, p0, v1, v0}, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;-><init>(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/util/List;I)V

    iput-object v3, v2, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;->fieldDeserializer:Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 1020
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->context:Lcom/alibaba/fastjson/parser/ParseContext;

    iput-object v3, v2, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;->ownerContext:Lcom/alibaba/fastjson/parser/ParseContext;

    .line 1021
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setResolveStatus(I)V

    .line 1029
    .end local v0    # "index":I
    .end local v1    # "list":Ljava/util/List;
    .end local v2    # "task":Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;
    :cond_25
    :goto_25
    return-void

    .line 1023
    :cond_26
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getLastResolveTask()Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;

    move-result-object v2

    .line 1024
    .restart local v2    # "task":Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;
    new-instance v3, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;

    invoke-direct {v3, p1}, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;-><init>(Ljava/util/Collection;)V

    iput-object v3, v2, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;->fieldDeserializer:Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 1025
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->context:Lcom/alibaba/fastjson/parser/ParseContext;

    iput-object v3, v2, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;->ownerContext:Lcom/alibaba/fastjson/parser/ParseContext;

    .line 1026
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setResolveStatus(I)V

    goto :goto_25
.end method

.method public checkMapResolve(Ljava/util/Map;Ljava/lang/Object;)V
    .registers 7
    .param p1, "object"    # Ljava/util/Map;
    .param p2, "fieldName"    # Ljava/lang/Object;

    .prologue
    .line 1033
    iget v2, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveStatus:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_18

    .line 1034
    new-instance v0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;

    invoke-direct {v0, p1, p2}, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;-><init>(Ljava/util/Map;Ljava/lang/Object;)V

    .line 1035
    .local v0, "fieldResolver":Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getLastResolveTask()Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;

    move-result-object v1

    .line 1036
    .local v1, "task":Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;
    iput-object v0, v1, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;->fieldDeserializer:Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 1037
    iget-object v2, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->context:Lcom/alibaba/fastjson/parser/ParseContext;

    iput-object v2, v1, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;->ownerContext:Lcom/alibaba/fastjson/parser/ParseContext;

    .line 1038
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setResolveStatus(I)V

    .line 1040
    .end local v0    # "fieldResolver":Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;
    .end local v1    # "task":Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;
    :cond_18
    return-void
.end method

.method public close()V
    .registers 5

    .prologue
    .line 1395
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 1398
    .local v0, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    :try_start_2
    sget-object v1, Lcom/alibaba/fastjson/parser/Feature;->AutoCloseSource:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v1

    if-eqz v1, :cond_38

    .line 1399
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v1

    const/16 v2, 0x14

    if-eq v1, v2, :cond_38

    .line 1400
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "not close json text, token : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v3

    invoke-static {v3}, Lcom/alibaba/fastjson/parser/JSONToken;->name(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_33
    .catchall {:try_start_2 .. :try_end_33} :catchall_33

    .line 1404
    :catchall_33
    move-exception v1

    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->close()V

    throw v1

    :cond_38
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->close()V

    .line 1406
    return-void
.end method

.method public config(Lcom/alibaba/fastjson/parser/Feature;Z)V
    .registers 4
    .param p1, "feature"    # Lcom/alibaba/fastjson/parser/Feature;
    .param p2, "state"    # Z

    .prologue
    .line 1359
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v0, p1, p2}, Lcom/alibaba/fastjson/parser/JSONLexer;->config(Lcom/alibaba/fastjson/parser/Feature;Z)V

    .line 1360
    return-void
.end method

.method public getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;
    .registers 2

    .prologue
    .line 565
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->config:Lcom/alibaba/fastjson/parser/ParserConfig;

    return-object v0
.end method

.method public getContext()Lcom/alibaba/fastjson/parser/ParseContext;
    .registers 2

    .prologue
    .line 1168
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->context:Lcom/alibaba/fastjson/parser/ParseContext;

    return-object v0
.end method

.method public getDateFomartPattern()Ljava/lang/String;
    .registers 2

    .prologue
    .line 128
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->dateFormatPattern:Ljava/lang/String;

    return-object v0
.end method

.method public getDateFormat()Ljava/text/DateFormat;
    .registers 4

    .prologue
    .line 132
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->dateFormat:Ljava/text/DateFormat;

    if-nez v0, :cond_1e

    .line 133
    new-instance v0, Ljava/text/SimpleDateFormat;

    iget-object v1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->dateFormatPattern:Ljava/lang/String;

    iget-object v2, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->getLocale()Ljava/util/Locale;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->dateFormat:Ljava/text/DateFormat;

    .line 134
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->dateFormat:Ljava/text/DateFormat;

    iget-object v1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 136
    :cond_1e
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->dateFormat:Ljava/text/DateFormat;

    return-object v0
.end method

.method public getExtraProcessors()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/parser/deserializer/ExtraProcessor;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1190
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->extraProcessors:Ljava/util/List;

    if-nez v0, :cond_c

    .line 1191
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->extraProcessors:Ljava/util/List;

    .line 1193
    :cond_c
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->extraProcessors:Ljava/util/List;

    return-object v0
.end method

.method public getExtraTypeProviders()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/parser/deserializer/ExtraTypeProvider;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1197
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->extraTypeProviders:Ljava/util/List;

    if-nez v0, :cond_c

    .line 1198
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->extraTypeProviders:Ljava/util/List;

    .line 1200
    :cond_c
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->extraTypeProviders:Ljava/util/List;

    return-object v0
.end method

.method public getFieldTypeResolver()Lcom/alibaba/fastjson/parser/deserializer/FieldTypeResolver;
    .registers 2

    .prologue
    .line 1204
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->fieldTypeResolver:Lcom/alibaba/fastjson/parser/deserializer/FieldTypeResolver;

    return-object v0
.end method

.method public getInput()Ljava/lang/String;
    .registers 3

    .prologue
    .line 195
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->input:Ljava/lang/Object;

    instance-of v0, v0, [C

    if-eqz v0, :cond_13

    .line 196
    new-instance v1, Ljava/lang/String;

    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->input:Ljava/lang/Object;

    check-cast v0, [C

    check-cast v0, [C

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([C)V

    move-object v0, v1

    .line 198
    :goto_12
    return-object v0

    :cond_13
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->input:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_12
.end method

.method public getLastResolveTask()Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;
    .registers 3

    .prologue
    .line 1186
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveTaskList:Ljava/util/List;

    iget-object v1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveTaskList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;

    return-object v0
.end method

.method public getLexer()Lcom/alibaba/fastjson/parser/JSONLexer;
    .registers 2

    .prologue
    .line 1367
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    return-object v0
.end method

.method public getObject(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 1003
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->contextArrayIndex:I

    if-ge v0, v1, :cond_1d

    .line 1004
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->contextArray:[Lcom/alibaba/fastjson/parser/ParseContext;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/ParseContext;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 1005
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->contextArray:[Lcom/alibaba/fastjson/parser/ParseContext;

    aget-object v1, v1, v0

    iget-object v1, v1, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 1009
    :goto_19
    return-object v1

    .line 1003
    :cond_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1009
    :cond_1d
    const/4 v1, 0x0

    goto :goto_19
.end method

.method public getResolveStatus()I
    .registers 2

    .prologue
    .line 995
    iget v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveStatus:I

    return v0
.end method

.method public getResolveTaskList()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1172
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveTaskList:Ljava/util/List;

    if-nez v0, :cond_c

    .line 1173
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveTaskList:Ljava/util/List;

    .line 1175
    :cond_c
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveTaskList:Ljava/util/List;

    return-object v0
.end method

.method public getSymbolTable()Lcom/alibaba/fastjson/parser/SymbolTable;
    .registers 2

    .prologue
    .line 191
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->symbolTable:Lcom/alibaba/fastjson/parser/SymbolTable;

    return-object v0
.end method

.method public handleResovleTask(Ljava/lang/Object;)V
    .registers 10
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 1409
    iget-object v7, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveTaskList:Ljava/util/List;

    if-nez v7, :cond_5

    .line 1436
    :cond_4
    return-void

    .line 1413
    :cond_5
    iget-object v7, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveTaskList:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v5

    .line 1414
    .local v5, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    if-ge v1, v5, :cond_4

    .line 1415
    iget-object v7, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveTaskList:Ljava/util/List;

    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;

    .line 1416
    .local v6, "task":Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;
    iget-object v3, v6, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;->referenceValue:Ljava/lang/String;

    .line 1418
    .local v3, "ref":Ljava/lang/String;
    const/4 v2, 0x0

    .line 1419
    .local v2, "object":Ljava/lang/Object;
    iget-object v7, v6, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;->ownerContext:Lcom/alibaba/fastjson/parser/ParseContext;

    if-eqz v7, :cond_21

    .line 1420
    iget-object v7, v6, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;->ownerContext:Lcom/alibaba/fastjson/parser/ParseContext;

    iget-object v2, v7, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 1424
    .end local v2    # "object":Ljava/lang/Object;
    :cond_21
    const-string v7, "$"

    invoke-virtual {v3, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_37

    .line 1425
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 1430
    .local v4, "refValue":Ljava/lang/Object;
    :goto_2d
    iget-object v0, v6, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;->fieldDeserializer:Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 1432
    .local v0, "fieldDeser":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    if-eqz v0, :cond_34

    .line 1433
    invoke-virtual {v0, v2, v4}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1414
    :cond_34
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 1427
    .end local v0    # "fieldDeser":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    .end local v4    # "refValue":Ljava/lang/Object;
    :cond_37
    iget-object v7, v6, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;->context:Lcom/alibaba/fastjson/parser/ParseContext;

    iget-object v4, v7, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .restart local v4    # "refValue":Ljava/lang/Object;
    goto :goto_2d
.end method

.method public isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z
    .registers 3
    .param p1, "feature"    # Lcom/alibaba/fastjson/parser/Feature;

    .prologue
    .line 1363
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v0, p1}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v0

    return v0
.end method

.method public parse()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 1261
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16
    .param p1, "fieldName"    # Ljava/lang/Object;

    .prologue
    const/16 v13, 0x12

    const/16 v12, 0xa

    const/4 v5, 0x0

    .line 1274
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 1275
    .local v3, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    packed-switch v11, :pswitch_data_120

    .line 1354
    :pswitch_e
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "syntax error, "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->info()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 1277
    :pswitch_2b
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 1278
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 1279
    .local v5, "set":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Object;>;"
    invoke-virtual {p0, v5, p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseArray(Ljava/util/Collection;Ljava/lang/Object;)V

    .line 1349
    .end local v5    # "set":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Object;>;"
    :cond_36
    :goto_36
    return-object v5

    .line 1282
    :pswitch_37
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 1283
    new-instance v9, Ljava/util/TreeSet;

    invoke-direct {v9}, Ljava/util/TreeSet;-><init>()V

    .line 1284
    .local v9, "treeSet":Ljava/util/TreeSet;, "Ljava/util/TreeSet<Ljava/lang/Object;>;"
    invoke-virtual {p0, v9, p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseArray(Ljava/util/Collection;Ljava/lang/Object;)V

    move-object v5, v9

    .line 1285
    goto :goto_36

    .line 1287
    .end local v9    # "treeSet":Ljava/util/TreeSet;, "Ljava/util/TreeSet<Ljava/lang/Object;>;"
    :pswitch_44
    new-instance v0, Lcom/alibaba/fastjson/JSONArray;

    invoke-direct {v0}, Lcom/alibaba/fastjson/JSONArray;-><init>()V

    .line 1288
    .local v0, "array":Lcom/alibaba/fastjson/JSONArray;
    invoke-virtual {p0, v0, p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseArray(Ljava/util/Collection;Ljava/lang/Object;)V

    .line 1289
    sget-object v11, Lcom/alibaba/fastjson/parser/Feature;->UseObjectArray:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v3, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v11

    if-eqz v11, :cond_59

    .line 1290
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONArray;->toArray()[Ljava/lang/Object;

    move-result-object v5

    goto :goto_36

    :cond_59
    move-object v5, v0

    .line 1292
    goto :goto_36

    .line 1294
    .end local v0    # "array":Lcom/alibaba/fastjson/JSONArray;
    :pswitch_5b
    new-instance v4, Lcom/alibaba/fastjson/JSONObject;

    sget-object v11, Lcom/alibaba/fastjson/parser/Feature;->OrderedField:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v3, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v11

    invoke-direct {v4, v11}, Lcom/alibaba/fastjson/JSONObject;-><init>(Z)V

    .line 1295
    .local v4, "object":Lcom/alibaba/fastjson/JSONObject;
    invoke-virtual {p0, v4, p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseObject(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    goto :goto_36

    .line 1297
    .end local v4    # "object":Lcom/alibaba/fastjson/JSONObject;
    :pswitch_6b
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->integerValue()Ljava/lang/Number;

    move-result-object v1

    .line 1298
    .local v1, "intValue":Ljava/lang/Number;
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    move-object v5, v1

    .line 1299
    goto :goto_36

    .line 1301
    .end local v1    # "intValue":Ljava/lang/Number;
    :pswitch_74
    sget-object v11, Lcom/alibaba/fastjson/parser/Feature;->UseBigDecimal:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v3, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v11

    invoke-interface {v3, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->decimalValue(Z)Ljava/lang/Number;

    move-result-object v10

    .line 1302
    .local v10, "value":Ljava/lang/Number;
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    move-object v5, v10

    .line 1303
    goto :goto_36

    .line 1305
    .end local v10    # "value":Ljava/lang/Number;
    :pswitch_83
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v6

    .line 1306
    .local v6, "stringLiteral":Ljava/lang/String;
    const/16 v11, 0x10

    invoke-interface {v3, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 1308
    sget-object v11, Lcom/alibaba/fastjson/parser/Feature;->AllowISO8601DateFormat:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v3, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v11

    if-eqz v11, :cond_ae

    .line 1309
    new-instance v2, Lcom/alibaba/fastjson/parser/JSONScanner;

    invoke-direct {v2, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;)V

    .line 1311
    .local v2, "iso8601Lexer":Lcom/alibaba/fastjson/parser/JSONScanner;
    :try_start_99
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch()Z

    move-result v11

    if-eqz v11, :cond_ab

    .line 1312
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->getCalendar()Ljava/util/Calendar;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/Calendar;->getTime()Ljava/util/Date;
    :try_end_a6
    .catchall {:try_start_99 .. :try_end_a6} :catchall_b0

    move-result-object v5

    .line 1315
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    goto :goto_36

    :cond_ab
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    .end local v2    # "iso8601Lexer":Lcom/alibaba/fastjson/parser/JSONScanner;
    :cond_ae
    move-object v5, v6

    .line 1319
    goto :goto_36

    .line 1315
    .restart local v2    # "iso8601Lexer":Lcom/alibaba/fastjson/parser/JSONScanner;
    :catchall_b0
    move-exception v11

    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    throw v11

    .line 1321
    .end local v2    # "iso8601Lexer":Lcom/alibaba/fastjson/parser/JSONScanner;
    .end local v6    # "stringLiteral":Ljava/lang/String;
    :pswitch_b5
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    goto/16 :goto_36

    .line 1324
    :pswitch_ba
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    goto/16 :goto_36

    .line 1327
    :pswitch_bf
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 1328
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto/16 :goto_36

    .line 1330
    :pswitch_c6
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 1331
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto/16 :goto_36

    .line 1333
    :pswitch_cd
    invoke-interface {v3, v13}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 1335
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    if-eq v11, v13, :cond_de

    .line 1336
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    const-string v12, "syntax error"

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 1338
    :cond_de
    invoke-interface {v3, v12}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 1340
    invoke-virtual {p0, v12}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 1341
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->integerValue()Ljava/lang/Number;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Number;->longValue()J

    move-result-wide v7

    .line 1342
    .local v7, "time":J
    const/4 v11, 0x2

    invoke-virtual {p0, v11}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 1344
    const/16 v11, 0xb

    invoke-virtual {p0, v11}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 1346
    new-instance v5, Ljava/util/Date;

    invoke-direct {v5, v7, v8}, Ljava/util/Date;-><init>(J)V

    goto/16 :goto_36

    .line 1348
    .end local v7    # "time":J
    :pswitch_fc
    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->isBlankInput()Z

    move-result v11

    if-nez v11, :cond_36

    .line 1351
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "unterminated json string, "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-interface {v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->info()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 1275
    nop

    :pswitch_data_120
    .packed-switch 0x2
        :pswitch_6b
        :pswitch_74
        :pswitch_83
        :pswitch_e
        :pswitch_bf
        :pswitch_c6
        :pswitch_b5
        :pswitch_cd
        :pswitch_e
        :pswitch_e
        :pswitch_5b
        :pswitch_e
        :pswitch_44
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_fc
        :pswitch_2b
        :pswitch_37
        :pswitch_ba
    .end packed-switch
.end method

.method public parseArray(Ljava/lang/Class;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 616
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 617
    .local v0, "array":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-virtual {p0, p1, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseArray(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 618
    return-object v0
.end method

.method public parseArray(Ljava/lang/Class;Ljava/util/Collection;)V
    .registers 3
    .param p2, "array"    # Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/Collection;",
            ")V"
        }
    .end annotation

    .prologue
    .line 622
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1, p2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseArray(Ljava/lang/reflect/Type;Ljava/util/Collection;)V

    .line 623
    return-void
.end method

.method public parseArray(Ljava/lang/reflect/Type;Ljava/util/Collection;)V
    .registers 4
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .param p2, "array"    # Ljava/util/Collection;

    .prologue
    .line 627
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseArray(Ljava/lang/reflect/Type;Ljava/util/Collection;Ljava/lang/Object;)V

    .line 628
    return-void
.end method

.method public parseArray(Ljava/lang/reflect/Type;Ljava/util/Collection;Ljava/lang/Object;)V
    .registers 15
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .param p2, "array"    # Ljava/util/Collection;
    .param p3, "fieldName"    # Ljava/lang/Object;

    .prologue
    const/4 v10, 0x4

    const/16 v9, 0x10

    .line 632
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v6

    const/16 v7, 0x15

    if-eq v6, v7, :cond_17

    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v6

    const/16 v7, 0x16

    if-ne v6, v7, :cond_1c

    .line 633
    :cond_17
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 636
    :cond_1c
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v6

    const/16 v7, 0xe

    if-eq v6, v7, :cond_59

    .line 637
    new-instance v6, Lcom/alibaba/fastjson/JSONException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "exepct \'[\', but "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v8

    invoke-static {v8}, Lcom/alibaba/fastjson/parser/JSONToken;->name(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->info()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 640
    :cond_59
    const/4 v1, 0x0

    .line 641
    .local v1, "deserializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne v6, p1, :cond_89

    .line 642
    sget-object v1, Lcom/alibaba/fastjson/serializer/IntegerCodec;->instance:Lcom/alibaba/fastjson/serializer/IntegerCodec;

    .line 643
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    const/4 v7, 0x2

    invoke-interface {v6, v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 652
    :goto_66
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->context:Lcom/alibaba/fastjson/parser/ParseContext;

    .line 653
    .local v0, "context":Lcom/alibaba/fastjson/parser/ParseContext;
    invoke-virtual {p0, p2, p3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Ljava/lang/Object;Ljava/lang/Object;)Lcom/alibaba/fastjson/parser/ParseContext;

    .line 655
    const/4 v2, 0x0

    .line 656
    .local v2, "i":I
    :goto_6c
    :try_start_6c
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    sget-object v7, Lcom/alibaba/fastjson/parser/Feature;->AllowArbitraryCommas:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v6, v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v6

    if-eqz v6, :cond_a5

    .line 657
    :goto_76
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v6

    if-ne v6, v9, :cond_a5

    .line 658
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V
    :try_end_83
    .catchall {:try_start_6c .. :try_end_83} :catchall_84

    goto :goto_76

    .line 703
    :catchall_84
    move-exception v6

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    throw v6

    .line 644
    .end local v0    # "context":Lcom/alibaba/fastjson/parser/ParseContext;
    .end local v2    # "i":I
    :cond_89
    const-class v6, Ljava/lang/String;

    if-ne v6, p1, :cond_95

    .line 645
    sget-object v1, Lcom/alibaba/fastjson/serializer/StringCodec;->instance:Lcom/alibaba/fastjson/serializer/StringCodec;

    .line 646
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v6, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    goto :goto_66

    .line 648
    :cond_95
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->config:Lcom/alibaba/fastjson/parser/ParserConfig;

    invoke-virtual {v6, p1}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v1

    .line 649
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->getFastMatchToken()I

    move-result v7

    invoke-interface {v6, v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    goto :goto_66

    .line 663
    .restart local v0    # "context":Lcom/alibaba/fastjson/parser/ParseContext;
    .restart local v2    # "i":I
    :cond_a5
    :try_start_a5
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I
    :try_end_aa
    .catchall {:try_start_a5 .. :try_end_aa} :catchall_84

    move-result v6

    const/16 v7, 0xf

    if-ne v6, v7, :cond_b8

    .line 703
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    .line 706
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v6, v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 707
    return-void

    .line 667
    :cond_b8
    :try_start_b8
    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne v6, p1, :cond_db

    .line 668
    sget-object v6, Lcom/alibaba/fastjson/serializer/IntegerCodec;->instance:Lcom/alibaba/fastjson/serializer/IntegerCodec;

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {v6, p0, v7, v8}, Lcom/alibaba/fastjson/serializer/IntegerCodec;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 669
    .local v4, "val":Ljava/lang/Object;
    invoke-interface {p2, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 697
    .end local v4    # "val":Ljava/lang/Object;
    :goto_c7
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v6

    if-ne v6, v9, :cond_d8

    .line 698
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->getFastMatchToken()I

    move-result v7

    invoke-interface {v6, v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 655
    :cond_d8
    add-int/lit8 v2, v2, 0x1

    goto :goto_6c

    .line 670
    :cond_db
    const-class v6, Ljava/lang/String;

    if-ne v6, p1, :cond_105

    .line 672
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v6

    if-ne v6, v10, :cond_f8

    .line 673
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v5

    .line 674
    .local v5, "value":Ljava/lang/String;
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    const/16 v7, 0x10

    invoke-interface {v6, v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 684
    :goto_f4
    invoke-interface {p2, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_c7

    .line 676
    .end local v5    # "value":Ljava/lang/String;
    :cond_f8
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v3

    .line 677
    .local v3, "obj":Ljava/lang/Object;
    if-nez v3, :cond_100

    .line 678
    const/4 v5, 0x0

    .restart local v5    # "value":Ljava/lang/String;
    goto :goto_f4

    .line 680
    .end local v5    # "value":Ljava/lang/String;
    :cond_100
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .restart local v5    # "value":Ljava/lang/String;
    goto :goto_f4

    .line 687
    .end local v3    # "obj":Ljava/lang/Object;
    .end local v5    # "value":Ljava/lang/String;
    :cond_105
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v6

    const/16 v7, 0x8

    if-ne v6, v7, :cond_11c

    .line 688
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 689
    const/4 v4, 0x0

    .line 693
    :goto_115
    invoke-interface {p2, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 694
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->checkListResolve(Ljava/util/Collection;)V

    goto :goto_c7

    .line 691
    :cond_11c
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v1, p0, p1, v6}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_123
    .catchall {:try_start_b8 .. :try_end_123} :catchall_84

    move-result-object v4

    .restart local v4    # "val":Ljava/lang/Object;
    goto :goto_115
.end method

.method public final parseArray(Ljava/util/Collection;)V
    .registers 3
    .param p1, "array"    # Ljava/util/Collection;

    .prologue
    .line 1055
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseArray(Ljava/util/Collection;Ljava/lang/Object;)V

    .line 1056
    return-void
.end method

.method public final parseArray(Ljava/util/Collection;Ljava/lang/Object;)V
    .registers 15
    .param p1, "array"    # Ljava/util/Collection;
    .param p2, "fieldName"    # Ljava/lang/Object;

    .prologue
    const/4 v11, 0x4

    const/16 v10, 0x10

    .line 1060
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 1062
    .local v4, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v8

    const/16 v9, 0x15

    if-eq v8, v9, :cond_15

    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v8

    const/16 v9, 0x16

    if-ne v8, v9, :cond_18

    .line 1063
    :cond_15
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 1066
    :cond_18
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v8

    const/16 v9, 0xe

    if-eq v8, v9, :cond_4f

    .line 1067
    new-instance v8, Lcom/alibaba/fastjson/JSONException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "syntax error, expect [, actual "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v10

    invoke-static {v10}, Lcom/alibaba/fastjson/parser/JSONToken;->name(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", pos "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 1068
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->pos()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1071
    :cond_4f
    invoke-interface {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 1073
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->context:Lcom/alibaba/fastjson/parser/ParseContext;

    .line 1074
    .local v0, "context":Lcom/alibaba/fastjson/parser/ParseContext;
    invoke-virtual {p0, p1, p2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Ljava/lang/Object;Ljava/lang/Object;)Lcom/alibaba/fastjson/parser/ParseContext;

    .line 1076
    const/4 v1, 0x0

    .line 1077
    .local v1, "i":I
    :goto_58
    :try_start_58
    sget-object v8, Lcom/alibaba/fastjson/parser/Feature;->AllowArbitraryCommas:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v4, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v8

    if-eqz v8, :cond_6f

    .line 1078
    :goto_60
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v8

    if-ne v8, v10, :cond_6f

    .line 1079
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V
    :try_end_69
    .catchall {:try_start_58 .. :try_end_69} :catchall_6a

    goto :goto_60

    .line 1163
    :catchall_6a
    move-exception v8

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    throw v8

    .line 1085
    :cond_6f
    :try_start_6f
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v8

    packed-switch v8, :pswitch_data_13e

    .line 1150
    :pswitch_76
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v7

    .line 1154
    :goto_7a
    invoke-interface {p1, v7}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 1155
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->checkListResolve(Ljava/util/Collection;)V

    .line 1157
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v8

    if-ne v8, v10, :cond_8a

    .line 1158
    const/4 v8, 0x4

    invoke-interface {v4, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 1076
    :cond_8a
    add-int/lit8 v1, v1, 0x1

    goto :goto_58

    .line 1087
    :pswitch_8d
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->integerValue()Ljava/lang/Number;

    move-result-object v7

    .line 1088
    .local v7, "value":Ljava/lang/Number;
    const/16 v8, 0x10

    invoke-interface {v4, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    goto :goto_7a

    .line 1091
    .end local v7    # "value":Ljava/lang/Number;
    :pswitch_97
    sget-object v8, Lcom/alibaba/fastjson/parser/Feature;->UseBigDecimal:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v4, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v8

    if-eqz v8, :cond_aa

    .line 1092
    const/4 v8, 0x1

    invoke-interface {v4, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->decimalValue(Z)Ljava/lang/Number;

    move-result-object v7

    .line 1096
    .restart local v7    # "value":Ljava/lang/Number;
    :goto_a4
    const/16 v8, 0x10

    invoke-interface {v4, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    goto :goto_7a

    .line 1094
    .end local v7    # "value":Ljava/lang/Number;
    :cond_aa
    const/4 v8, 0x0

    invoke-interface {v4, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->decimalValue(Z)Ljava/lang/Number;

    move-result-object v7

    .restart local v7    # "value":Ljava/lang/Number;
    goto :goto_a4

    .line 1099
    .end local v7    # "value":Ljava/lang/Number;
    :pswitch_b0
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v6

    .line 1100
    .local v6, "stringLiteral":Ljava/lang/String;
    const/16 v8, 0x10

    invoke-interface {v4, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 1102
    sget-object v8, Lcom/alibaba/fastjson/parser/Feature;->AllowISO8601DateFormat:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v4, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v8

    if-eqz v8, :cond_da

    .line 1103
    new-instance v2, Lcom/alibaba/fastjson/parser/JSONScanner;

    invoke-direct {v2, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;)V

    .line 1104
    .local v2, "iso8601Lexer":Lcom/alibaba/fastjson/parser/JSONScanner;
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch()Z

    move-result v8

    if-eqz v8, :cond_d8

    .line 1105
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->getCalendar()Ljava/util/Calendar;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v7

    .line 1109
    :goto_d4
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    goto :goto_7a

    .line 1107
    :cond_d8
    move-object v7, v6

    .local v7, "value":Ljava/lang/String;
    goto :goto_d4

    .line 1111
    .end local v2    # "iso8601Lexer":Lcom/alibaba/fastjson/parser/JSONScanner;
    .end local v7    # "value":Ljava/lang/String;
    :cond_da
    move-object v7, v6

    .line 1114
    .restart local v7    # "value":Ljava/lang/String;
    goto :goto_7a

    .line 1116
    .end local v6    # "stringLiteral":Ljava/lang/String;
    .end local v7    # "value":Ljava/lang/String;
    :pswitch_dc
    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 1117
    .local v7, "value":Ljava/lang/Boolean;
    const/16 v8, 0x10

    invoke-interface {v4, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    goto :goto_7a

    .line 1120
    .end local v7    # "value":Ljava/lang/Boolean;
    :pswitch_e4
    sget-object v7, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 1121
    .restart local v7    # "value":Ljava/lang/Boolean;
    const/16 v8, 0x10

    invoke-interface {v4, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    goto :goto_7a

    .line 1124
    .end local v7    # "value":Ljava/lang/Boolean;
    :pswitch_ec
    new-instance v5, Lcom/alibaba/fastjson/JSONObject;

    sget-object v8, Lcom/alibaba/fastjson/parser/Feature;->OrderedField:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v4, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v8

    invoke-direct {v5, v8}, Lcom/alibaba/fastjson/JSONObject;-><init>(Z)V

    .line 1125
    .local v5, "object":Lcom/alibaba/fastjson/JSONObject;
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {p0, v5, v8}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseObject(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 1126
    .local v7, "value":Ljava/lang/Object;
    goto/16 :goto_7a

    .line 1128
    .end local v5    # "object":Lcom/alibaba/fastjson/JSONObject;
    .end local v7    # "value":Ljava/lang/Object;
    :pswitch_101
    new-instance v3, Lcom/alibaba/fastjson/JSONArray;

    invoke-direct {v3}, Lcom/alibaba/fastjson/JSONArray;-><init>()V

    .line 1129
    .local v3, "items":Ljava/util/Collection;
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {p0, v3, v8}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseArray(Ljava/util/Collection;Ljava/lang/Object;)V

    .line 1130
    sget-object v8, Lcom/alibaba/fastjson/parser/Feature;->UseObjectArray:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v4, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v8

    if-eqz v8, :cond_11b

    .line 1131
    invoke-interface {v3}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object v7

    .local v7, "value":[Ljava/lang/Object;
    goto/16 :goto_7a

    .line 1133
    .end local v7    # "value":[Ljava/lang/Object;
    :cond_11b
    move-object v7, v3

    .line 1135
    .local v7, "value":Ljava/util/Collection;
    goto/16 :goto_7a

    .line 1137
    .end local v3    # "items":Ljava/util/Collection;
    .end local v7    # "value":Ljava/util/Collection;
    :pswitch_11e
    const/4 v7, 0x0

    .line 1138
    .local v7, "value":Ljava/lang/Object;
    const/4 v8, 0x4

    invoke-interface {v4, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    goto/16 :goto_7a

    .line 1141
    .end local v7    # "value":Ljava/lang/Object;
    :pswitch_125
    const/4 v7, 0x0

    .line 1142
    .restart local v7    # "value":Ljava/lang/Object;
    const/4 v8, 0x4

    invoke-interface {v4, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    goto/16 :goto_7a

    .line 1145
    .end local v7    # "value":Ljava/lang/Object;
    :pswitch_12c
    const/16 v8, 0x10

    invoke-interface {v4, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V
    :try_end_131
    .catchall {:try_start_6f .. :try_end_131} :catchall_6a

    .line 1163
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    .line 1146
    return-void

    .line 1148
    :pswitch_135
    :try_start_135
    new-instance v8, Lcom/alibaba/fastjson/JSONException;

    const-string v9, "unclosed jsonArray"

    invoke-direct {v8, v9}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_13d
    .catchall {:try_start_135 .. :try_end_13d} :catchall_6a

    .line 1085
    nop

    :pswitch_data_13e
    .packed-switch 0x2
        :pswitch_8d
        :pswitch_97
        :pswitch_b0
        :pswitch_76
        :pswitch_dc
        :pswitch_e4
        :pswitch_11e
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_ec
        :pswitch_76
        :pswitch_101
        :pswitch_12c
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_135
        :pswitch_76
        :pswitch_76
        :pswitch_125
    .end packed-switch
.end method

.method public parseArray([Ljava/lang/reflect/Type;)[Ljava/lang/Object;
    .registers 16
    .param p1, "types"    # [Ljava/lang/reflect/Type;

    .prologue
    .line 710
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0x8

    if-ne v11, v12, :cond_13

    .line 711
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    const/16 v12, 0x10

    invoke-interface {v11, v12}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 712
    const/4 v7, 0x0

    .line 820
    :goto_12
    return-object v7

    .line 715
    :cond_13
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0xe

    if-eq v11, v12, :cond_3c

    .line 716
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "syntax error : "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v13}, Lcom/alibaba/fastjson/parser/JSONLexer;->tokenName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 719
    :cond_3c
    array-length v11, p1

    new-array v7, v11, [Ljava/lang/Object;

    .line 720
    .local v7, "list":[Ljava/lang/Object;
    array-length v11, p1

    if-nez v11, :cond_66

    .line 721
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    const/16 v12, 0xf

    invoke-interface {v11, v12}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 723
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0xf

    if-eq v11, v12, :cond_5b

    .line 724
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    const-string v12, "syntax error"

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 727
    :cond_5b
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    const/16 v12, 0x10

    invoke-interface {v11, v12}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 728
    const/4 v11, 0x0

    new-array v7, v11, [Ljava/lang/Object;

    goto :goto_12

    .line 731
    :cond_66
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    const/4 v12, 0x2

    invoke-interface {v11, v12}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 733
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_6d
    array-length v11, p1

    if-ge v4, v11, :cond_8e

    .line 736
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0x8

    if-ne v11, v12, :cond_a0

    .line 737
    const/4 v9, 0x0

    .line 738
    .local v9, "value":Ljava/lang/Object;
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    const/16 v12, 0x10

    invoke-interface {v11, v12}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 797
    .end local v9    # "value":Ljava/lang/Object;
    :goto_82
    aput-object v9, v7, v4

    .line 799
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0xf

    if-ne v11, v12, :cond_18b

    .line 814
    :cond_8e
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0xf

    if-eq v11, v12, :cond_1cf

    .line 815
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    const-string v12, "syntax error"

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 740
    :cond_a0
    aget-object v8, p1, v4

    .line 741
    .local v8, "type":Ljava/lang/reflect/Type;
    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq v8, v11, :cond_aa

    const-class v11, Ljava/lang/Integer;

    if-ne v8, v11, :cond_d0

    .line 742
    :cond_aa
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/4 v12, 0x2

    if-ne v11, v12, :cond_c5

    .line 743
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->intValue()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    .line 744
    .local v9, "value":Ljava/lang/Integer;
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    const/16 v12, 0x10

    invoke-interface {v11, v12}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    goto :goto_82

    .line 746
    .end local v9    # "value":Ljava/lang/Integer;
    :cond_c5
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v9

    .line 747
    .local v9, "value":Ljava/lang/Object;
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->config:Lcom/alibaba/fastjson/parser/ParserConfig;

    invoke-static {v9, v8, v11}, Lcom/alibaba/fastjson/util/TypeUtils;->cast(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    move-result-object v9

    goto :goto_82

    .line 749
    .end local v9    # "value":Ljava/lang/Object;
    :cond_d0
    const-class v11, Ljava/lang/String;

    if-ne v8, v11, :cond_f6

    .line 750
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/4 v12, 0x4

    if-ne v11, v12, :cond_eb

    .line 751
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v9

    .line 752
    .local v9, "value":Ljava/lang/String;
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    const/16 v12, 0x10

    invoke-interface {v11, v12}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    goto :goto_82

    .line 754
    .end local v9    # "value":Ljava/lang/String;
    :cond_eb
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v9

    .line 755
    .local v9, "value":Ljava/lang/Object;
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->config:Lcom/alibaba/fastjson/parser/ParserConfig;

    invoke-static {v9, v8, v11}, Lcom/alibaba/fastjson/util/TypeUtils;->cast(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    move-result-object v9

    goto :goto_82

    .line 758
    .end local v9    # "value":Ljava/lang/Object;
    :cond_f6
    const/4 v5, 0x0

    .line 759
    .local v5, "isArray":Z
    const/4 v1, 0x0

    .line 760
    .local v1, "componentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    array-length v11, p1

    add-int/lit8 v11, v11, -0x1

    if-ne v4, v11, :cond_10c

    .line 761
    instance-of v11, v8, Ljava/lang/Class;

    if-eqz v11, :cond_10c

    move-object v0, v8

    .line 762
    check-cast v0, Ljava/lang/Class;

    .line 763
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v5

    .line 764
    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    .line 769
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_10c
    if-eqz v5, :cond_17e

    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0xe

    if-eq v11, v12, :cond_17e

    .line 770
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 772
    .local v10, "varList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->config:Lcom/alibaba/fastjson/parser/ParserConfig;

    invoke-virtual {v11, v1}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v2

    .line 773
    .local v2, "derializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->getFastMatchToken()I

    move-result v3

    .line 775
    .local v3, "fastMatch":I
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0xf

    if-eq v11, v12, :cond_153

    .line 777
    :goto_131
    const/4 v11, 0x0

    invoke-interface {v2, p0, v8, v11}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 778
    .local v6, "item":Ljava/lang/Object;
    invoke-interface {v10, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 780
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0x10

    if-ne v11, v12, :cond_149

    .line 781
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v11, v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    goto :goto_131

    .line 782
    :cond_149
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0xf

    if-ne v11, v12, :cond_15b

    .line 790
    .end local v6    # "item":Ljava/lang/Object;
    :cond_153
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->config:Lcom/alibaba/fastjson/parser/ParserConfig;

    invoke-static {v10, v8, v11}, Lcom/alibaba/fastjson/util/TypeUtils;->cast(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    move-result-object v9

    .line 791
    .restart local v9    # "value":Ljava/lang/Object;
    goto/16 :goto_82

    .line 785
    .end local v9    # "value":Ljava/lang/Object;
    .restart local v6    # "item":Ljava/lang/Object;
    :cond_15b
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "syntax error :"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v13}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v13

    invoke-static {v13}, Lcom/alibaba/fastjson/parser/JSONToken;->name(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 792
    .end local v2    # "derializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    .end local v3    # "fastMatch":I
    .end local v6    # "item":Ljava/lang/Object;
    .end local v10    # "varList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :cond_17e
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->config:Lcom/alibaba/fastjson/parser/ParserConfig;

    invoke-virtual {v11, v8}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v2

    .line 793
    .restart local v2    # "derializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    const/4 v11, 0x0

    invoke-interface {v2, p0, v8, v11}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .restart local v9    # "value":Ljava/lang/Object;
    goto/16 :goto_82

    .line 803
    .end local v1    # "componentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "derializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    .end local v5    # "isArray":Z
    .end local v8    # "type":Ljava/lang/reflect/Type;
    .end local v9    # "value":Ljava/lang/Object;
    :cond_18b
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v11

    const/16 v12, 0x10

    if-eq v11, v12, :cond_1b8

    .line 804
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "syntax error :"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v13}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v13

    invoke-static {v13}, Lcom/alibaba/fastjson/parser/JSONToken;->name(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 807
    :cond_1b8
    array-length v11, p1

    add-int/lit8 v11, v11, -0x1

    if-ne v4, v11, :cond_1c8

    .line 808
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    const/16 v12, 0xf

    invoke-interface {v11, v12}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 733
    :goto_1c4
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_6d

    .line 810
    :cond_1c8
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    const/4 v12, 0x2

    invoke-interface {v11, v12}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    goto :goto_1c4

    .line 818
    :cond_1cf
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    const/16 v12, 0x10

    invoke-interface {v11, v12}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    goto/16 :goto_12
.end method

.method public parseArrayWithType(Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .registers 15
    .param p1, "collectionType"    # Ljava/lang/reflect/Type;

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 905
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v9

    const/16 v10, 0x8

    if-ne v9, v10, :cond_13

    .line 906
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 907
    const/4 v2, 0x0

    .line 969
    :goto_12
    return-object v2

    :cond_13
    move-object v9, p1

    .line 910
    check-cast v9, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v9}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v1

    .line 912
    .local v1, "actualTypes":[Ljava/lang/reflect/Type;
    array-length v9, v1

    if-eq v9, v12, :cond_36

    .line 913
    new-instance v9, Lcom/alibaba/fastjson/JSONException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "not support type "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 916
    :cond_36
    aget-object v0, v1, v11

    .line 918
    .local v0, "actualTypeArgument":Ljava/lang/reflect/Type;
    instance-of v9, v0, Ljava/lang/Class;

    if-eqz v9, :cond_47

    .line 919
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 920
    .local v2, "array":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    check-cast v0, Ljava/lang/Class;

    .end local v0    # "actualTypeArgument":Ljava/lang/reflect/Type;
    invoke-virtual {p0, v0, v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseArray(Ljava/lang/Class;Ljava/util/Collection;)V

    goto :goto_12

    .line 924
    .end local v2    # "array":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .restart local v0    # "actualTypeArgument":Ljava/lang/reflect/Type;
    :cond_47
    instance-of v9, v0, Ljava/lang/reflect/WildcardType;

    if-eqz v9, :cond_8c

    move-object v8, v0

    .line 925
    check-cast v8, Ljava/lang/reflect/WildcardType;

    .line 928
    .local v8, "wildcardType":Ljava/lang/reflect/WildcardType;
    invoke-interface {v8}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v9

    aget-object v7, v9, v11

    .line 931
    .local v7, "upperBoundType":Ljava/lang/reflect/Type;
    const-class v9, Ljava/lang/Object;

    invoke-virtual {v9, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_81

    .line 932
    invoke-interface {v8}, Ljava/lang/reflect/WildcardType;->getLowerBounds()[Ljava/lang/reflect/Type;

    move-result-object v9

    array-length v9, v9

    if-nez v9, :cond_68

    .line 934
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v2

    goto :goto_12

    .line 936
    :cond_68
    new-instance v9, Lcom/alibaba/fastjson/JSONException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "not support type : "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 940
    :cond_81
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 941
    .restart local v2    # "array":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    check-cast v7, Ljava/lang/Class;

    .end local v7    # "upperBoundType":Ljava/lang/reflect/Type;
    invoke-virtual {p0, v7, v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseArray(Ljava/lang/Class;Ljava/util/Collection;)V

    goto :goto_12

    .line 948
    .end local v2    # "array":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .end local v8    # "wildcardType":Ljava/lang/reflect/WildcardType;
    :cond_8c
    instance-of v9, v0, Ljava/lang/reflect/TypeVariable;

    if-eqz v9, :cond_c5

    move-object v6, v0

    .line 949
    check-cast v6, Ljava/lang/reflect/TypeVariable;

    .line 950
    .local v6, "typeVariable":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    invoke-interface {v6}, Ljava/lang/reflect/TypeVariable;->getBounds()[Ljava/lang/reflect/Type;

    move-result-object v4

    .line 952
    .local v4, "bounds":[Ljava/lang/reflect/Type;
    array-length v9, v4

    if-eq v9, v12, :cond_b3

    .line 953
    new-instance v9, Lcom/alibaba/fastjson/JSONException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "not support : "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 956
    :cond_b3
    aget-object v3, v4, v11

    .line 957
    .local v3, "boundType":Ljava/lang/reflect/Type;
    instance-of v9, v3, Ljava/lang/Class;

    if-eqz v9, :cond_c5

    .line 958
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 959
    .restart local v2    # "array":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    check-cast v3, Ljava/lang/Class;

    .end local v3    # "boundType":Ljava/lang/reflect/Type;
    invoke-virtual {p0, v3, v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseArray(Ljava/lang/Class;Ljava/util/Collection;)V

    goto/16 :goto_12

    .line 964
    .end local v2    # "array":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .end local v4    # "bounds":[Ljava/lang/reflect/Type;
    .end local v6    # "typeVariable":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    :cond_c5
    instance-of v9, v0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v9, :cond_d6

    move-object v5, v0

    .line 965
    check-cast v5, Ljava/lang/reflect/ParameterizedType;

    .line 967
    .local v5, "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 968
    .restart local v2    # "array":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-virtual {p0, v5, v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseArray(Ljava/lang/reflect/Type;Ljava/util/Collection;)V

    goto/16 :goto_12

    .line 972
    .end local v2    # "array":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .end local v5    # "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    :cond_d6
    new-instance v9, Lcom/alibaba/fastjson/JSONException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "TODO : "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v9
.end method

.method public parseExtra(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 11
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 1452
    iget-object v2, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 1453
    .local v2, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon()V

    .line 1454
    const/4 v4, 0x0

    .line 1456
    .local v4, "type":Ljava/lang/reflect/Type;
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->extraTypeProviders:Ljava/util/List;

    if-eqz v6, :cond_21

    .line 1457
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->extraTypeProviders:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_10
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_21

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/alibaba/fastjson/parser/deserializer/ExtraTypeProvider;

    .line 1458
    .local v1, "extraProvider":Lcom/alibaba/fastjson/parser/deserializer/ExtraTypeProvider;
    invoke-interface {v1, p1, p2}, Lcom/alibaba/fastjson/parser/deserializer/ExtraTypeProvider;->getExtraType(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Type;

    move-result-object v4

    .line 1459
    goto :goto_10

    .line 1461
    .end local v1    # "extraProvider":Lcom/alibaba/fastjson/parser/deserializer/ExtraTypeProvider;
    :cond_21
    if-nez v4, :cond_32

    .line 1462
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v5

    .line 1465
    .local v5, "value":Ljava/lang/Object;
    :goto_27
    instance-of v6, p1, Lcom/alibaba/fastjson/parser/deserializer/ExtraProcessable;

    if-eqz v6, :cond_37

    move-object v0, p1

    .line 1466
    check-cast v0, Lcom/alibaba/fastjson/parser/deserializer/ExtraProcessable;

    .line 1467
    .local v0, "extraProcessable":Lcom/alibaba/fastjson/parser/deserializer/ExtraProcessable;
    invoke-interface {v0, p2, v5}, Lcom/alibaba/fastjson/parser/deserializer/ExtraProcessable;->processExtra(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1476
    .end local v0    # "extraProcessable":Lcom/alibaba/fastjson/parser/deserializer/ExtraProcessable;
    :cond_31
    return-void

    .line 1463
    .end local v5    # "value":Ljava/lang/Object;
    :cond_32
    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseObject(Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v5

    goto :goto_27

    .line 1471
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_37
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->extraProcessors:Ljava/util/List;

    if-eqz v6, :cond_31

    .line 1472
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->extraProcessors:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_41
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_31

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/alibaba/fastjson/parser/deserializer/ExtraProcessor;

    .line 1473
    .local v3, "process":Lcom/alibaba/fastjson/parser/deserializer/ExtraProcessor;
    invoke-interface {v3, p1, p2, v5}, Lcom/alibaba/fastjson/parser/deserializer/ExtraProcessor;->processExtra(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_41
.end method

.method public parseKey()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 1265
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v1

    const/16 v2, 0x12

    if-ne v1, v2, :cond_18

    .line 1266
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v0

    .line 1267
    .local v0, "value":Ljava/lang/String;
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    const/16 v2, 0x10

    invoke-interface {v1, v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 1270
    .end local v0    # "value":Ljava/lang/String;
    :goto_17
    return-object v0

    :cond_18
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_17
.end method

.method public parseObject()Lcom/alibaba/fastjson/JSONObject;
    .registers 4

    .prologue
    .line 1048
    new-instance v0, Lcom/alibaba/fastjson/JSONObject;

    iget-object v1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    sget-object v2, Lcom/alibaba/fastjson/parser/Feature;->OrderedField:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v1, v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v1

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONObject;-><init>(Z)V

    .line 1049
    .local v0, "object":Lcom/alibaba/fastjson/JSONObject;
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseObject(Ljava/util/Map;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "object":Lcom/alibaba/fastjson/JSONObject;
    check-cast v0, Lcom/alibaba/fastjson/JSONObject;

    .line 1050
    .restart local v0    # "object":Lcom/alibaba/fastjson/JSONObject;
    return-object v0
.end method

.method public parseObject(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 575
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseObject(Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parseObject(Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .registers 3
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/reflect/Type;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 579
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseObject(Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parseObject(Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .param p2, "fieldName"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 584
    iget-object v5, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v5}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v4

    .line 585
    .local v4, "token":I
    const/16 v5, 0x8

    if-ne v4, v5, :cond_11

    .line 586
    iget-object v5, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v5}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 587
    const/4 v0, 0x0

    .line 607
    :goto_10
    return-object v0

    .line 590
    :cond_11
    const/4 v5, 0x4

    if-ne v4, v5, :cond_38

    .line 591
    const-class v5, [B

    if-ne p1, v5, :cond_24

    .line 592
    iget-object v5, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v5}, Lcom/alibaba/fastjson/parser/JSONLexer;->bytesValue()[B

    move-result-object v0

    .line 593
    .local v0, "bytes":[B
    iget-object v5, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v5}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    goto :goto_10

    .line 597
    .end local v0    # "bytes":[B
    :cond_24
    const-class v5, [C

    if-ne p1, v5, :cond_38

    .line 598
    iget-object v5, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v5}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v3

    .line 599
    .local v3, "strVal":Ljava/lang/String;
    iget-object v5, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v5}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 600
    invoke-virtual {v3}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    goto :goto_10

    .line 604
    .end local v3    # "strVal":Ljava/lang/String;
    :cond_38
    iget-object v5, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->config:Lcom/alibaba/fastjson/parser/ParserConfig;

    invoke-virtual {v5, p1}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v1

    .line 607
    .local v1, "derializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    :try_start_3e
    invoke-interface {v1, p0, p1, p2}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_41
    .catch Lcom/alibaba/fastjson/JSONException; {:try_start_3e .. :try_end_41} :catch_43
    .catch Ljava/lang/Throwable; {:try_start_3e .. :try_end_41} :catch_45

    move-result-object v0

    goto :goto_10

    .line 608
    :catch_43
    move-exception v2

    .line 609
    .local v2, "e":Lcom/alibaba/fastjson/JSONException;
    throw v2

    .line 610
    .end local v2    # "e":Lcom/alibaba/fastjson/JSONException;
    :catch_45
    move-exception v2

    .line 611
    .local v2, "e":Ljava/lang/Throwable;
    new-instance v5, Lcom/alibaba/fastjson/JSONException;

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v2}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method

.method public parseObject(Ljava/util/Map;)Ljava/lang/Object;
    .registers 3
    .param p1, "object"    # Ljava/util/Map;

    .prologue
    .line 1044
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseObject(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final parseObject(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 39
    .param p1, "object"    # Ljava/util/Map;
    .param p2, "fieldName"    # Ljava/lang/Object;

    .prologue
    .line 203
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    move-object/from16 v17, v0

    .line 205
    .local v17, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v33

    const/16 v34, 0x8

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_18

    .line 206
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 207
    const/16 p1, 0x0

    .line 559
    .end local p1    # "object":Ljava/util/Map;
    :goto_17
    return-object p1

    .line 210
    .restart local p1    # "object":Ljava/util/Map;
    :cond_18
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v33

    const/16 v34, 0xd

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_28

    .line 211
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    goto :goto_17

    .line 215
    :cond_28
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v33

    const/16 v34, 0xc

    move/from16 v0, v33

    move/from16 v1, v34

    if-eq v0, v1, :cond_6b

    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v33

    const/16 v34, 0x10

    move/from16 v0, v33

    move/from16 v1, v34

    if-eq v0, v1, :cond_6b

    .line 216
    new-instance v33, Lcom/alibaba/fastjson/JSONException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "syntax error, expect {, actual "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->tokenName()Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ", "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->info()Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 219
    :cond_6b
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->context:Lcom/alibaba/fastjson/parser/ParseContext;

    .line 221
    .local v5, "context":Lcom/alibaba/fastjson/parser/ParseContext;
    const/16 v27, 0x0

    .line 223
    .local v27, "setContextFlag":Z
    :cond_71
    :goto_71
    :try_start_71
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->skipWhitespace()V

    .line 224
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->getCurrent()C

    move-result v3

    .line 225
    .local v3, "ch":C
    sget-object v33, Lcom/alibaba/fastjson/parser/Feature;->AllowArbitraryCommas:Lcom/alibaba/fastjson/parser/Feature;

    move-object/from16 v0, v17

    move-object/from16 v1, v33

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v33

    if-eqz v33, :cond_95

    .line 226
    :goto_84
    const/16 v33, 0x2c

    move/from16 v0, v33

    if-ne v3, v0, :cond_95

    .line 227
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->next()C

    .line 228
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->skipWhitespace()V

    .line 229
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->getCurrent()C

    move-result v3

    goto :goto_84

    .line 233
    :cond_95
    const/4 v14, 0x0

    .line 235
    .local v14, "isObjectKey":Z
    const/16 v33, 0x22

    move/from16 v0, v33

    if-ne v3, v0, :cond_ed

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->symbolTable:Lcom/alibaba/fastjson/parser/SymbolTable;

    move-object/from16 v33, v0

    const/16 v34, 0x22

    move-object/from16 v0, v17

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanSymbol(Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/String;

    move-result-object v16

    .line 237
    .local v16, "key":Ljava/lang/String;
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->skipWhitespace()V

    .line 238
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->getCurrent()C

    move-result v3

    .line 239
    const/16 v33, 0x3a

    move/from16 v0, v33

    if-eq v3, v0, :cond_201

    .line 240
    new-instance v33, Lcom/alibaba/fastjson/JSONException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "expect \':\' at "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->pos()I

    move-result v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ", name "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v33
    :try_end_e6
    .catchall {:try_start_71 .. :try_end_e6} :catchall_e6

    .line 559
    .end local v3    # "ch":C
    .end local v14    # "isObjectKey":Z
    .end local v16    # "key":Ljava/lang/String;
    .end local p1    # "object":Ljava/util/Map;
    :catchall_e6
    move-exception v33

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    throw v33

    .line 242
    .restart local v3    # "ch":C
    .restart local v14    # "isObjectKey":Z
    .restart local p1    # "object":Ljava/util/Map;
    :cond_ed
    const/16 v33, 0x7d

    move/from16 v0, v33

    if-ne v3, v0, :cond_103

    .line 243
    :try_start_f3
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->next()C

    .line 244
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->resetStringPosition()V

    .line 245
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V
    :try_end_fc
    .catchall {:try_start_f3 .. :try_end_fc} :catchall_e6

    .line 559
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    goto/16 :goto_17

    .line 247
    :cond_103
    const/16 v33, 0x27

    move/from16 v0, v33

    if-ne v3, v0, :cond_159

    .line 248
    :try_start_109
    sget-object v33, Lcom/alibaba/fastjson/parser/Feature;->AllowSingleQuotes:Lcom/alibaba/fastjson/parser/Feature;

    move-object/from16 v0, v17

    move-object/from16 v1, v33

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v33

    if-nez v33, :cond_11d

    .line 249
    new-instance v33, Lcom/alibaba/fastjson/JSONException;

    const-string v34, "syntax error"

    invoke-direct/range {v33 .. v34}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 252
    :cond_11d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->symbolTable:Lcom/alibaba/fastjson/parser/SymbolTable;

    move-object/from16 v33, v0

    const/16 v34, 0x27

    move-object/from16 v0, v17

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanSymbol(Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/String;

    move-result-object v16

    .line 253
    .restart local v16    # "key":Ljava/lang/String;
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->skipWhitespace()V

    .line 254
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->getCurrent()C

    move-result v3

    .line 255
    const/16 v33, 0x3a

    move/from16 v0, v33

    if-eq v3, v0, :cond_201

    .line 256
    new-instance v33, Lcom/alibaba/fastjson/JSONException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "expect \':\' at "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->pos()I

    move-result v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 258
    .end local v16    # "key":Ljava/lang/String;
    :cond_159
    const/16 v33, 0x1a

    move/from16 v0, v33

    if-ne v3, v0, :cond_167

    .line 259
    new-instance v33, Lcom/alibaba/fastjson/JSONException;

    const-string v34, "syntax error"

    invoke-direct/range {v33 .. v34}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 260
    :cond_167
    const/16 v33, 0x2c

    move/from16 v0, v33

    if-ne v3, v0, :cond_175

    .line 261
    new-instance v33, Lcom/alibaba/fastjson/JSONException;

    const-string v34, "syntax error"

    invoke-direct/range {v33 .. v34}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 262
    :cond_175
    const/16 v33, 0x30

    move/from16 v0, v33

    if-lt v3, v0, :cond_181

    const/16 v33, 0x39

    move/from16 v0, v33

    if-le v3, v0, :cond_187

    :cond_181
    const/16 v33, 0x2d

    move/from16 v0, v33

    if-ne v3, v0, :cond_1ed

    .line 263
    :cond_187
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->resetStringPosition()V

    .line 264
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanNumber()V
    :try_end_18d
    .catchall {:try_start_109 .. :try_end_18d} :catchall_e6

    .line 266
    :try_start_18d
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v33

    const/16 v34, 0x2

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_1c4

    .line 267
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->integerValue()Ljava/lang/Number;
    :try_end_19c
    .catch Ljava/lang/NumberFormatException; {:try_start_18d .. :try_end_19c} :catch_1cf
    .catchall {:try_start_18d .. :try_end_19c} :catchall_e6

    move-result-object v16

    .line 274
    .local v16, "key":Ljava/lang/Number;
    :goto_19d
    :try_start_19d
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->getCurrent()C

    move-result v3

    .line 275
    const/16 v33, 0x3a

    move/from16 v0, v33

    if-eq v3, v0, :cond_201

    .line 276
    new-instance v33, Lcom/alibaba/fastjson/JSONException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "parse number key error"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->info()Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v33
    :try_end_1c4
    .catchall {:try_start_19d .. :try_end_1c4} :catchall_e6

    .line 269
    .end local v16    # "key":Ljava/lang/Number;
    :cond_1c4
    const/16 v33, 0x1

    :try_start_1c6
    move-object/from16 v0, v17

    move/from16 v1, v33

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->decimalValue(Z)Ljava/lang/Number;
    :try_end_1cd
    .catch Ljava/lang/NumberFormatException; {:try_start_1c6 .. :try_end_1cd} :catch_1cf
    .catchall {:try_start_1c6 .. :try_end_1cd} :catchall_e6

    move-result-object v16

    .restart local v16    # "key":Ljava/lang/Number;
    goto :goto_19d

    .line 271
    .end local v16    # "key":Ljava/lang/Number;
    :catch_1cf
    move-exception v9

    .line 272
    .local v9, "e":Ljava/lang/NumberFormatException;
    :try_start_1d0
    new-instance v33, Lcom/alibaba/fastjson/JSONException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "parse number key error"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->info()Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 278
    .end local v9    # "e":Ljava/lang/NumberFormatException;
    :cond_1ed
    const/16 v33, 0x7b

    move/from16 v0, v33

    if-eq v3, v0, :cond_1f9

    const/16 v33, 0x5b

    move/from16 v0, v33

    if-ne v3, v0, :cond_257

    .line 279
    :cond_1f9
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 280
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v16

    .line 281
    .local v16, "key":Ljava/lang/Object;
    const/4 v14, 0x1

    .line 295
    .end local v16    # "key":Ljava/lang/Object;
    :cond_201
    if-nez v14, :cond_209

    .line 296
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->next()C

    .line 297
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->skipWhitespace()V

    .line 300
    :cond_209
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->getCurrent()C

    move-result v3

    .line 302
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->resetStringPosition()V

    .line 304
    sget-object v33, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    move-object/from16 v0, v16

    move-object/from16 v1, v33

    if-ne v0, v1, :cond_37c

    sget-object v33, Lcom/alibaba/fastjson/parser/Feature;->DisableSpecialKeyDetect:Lcom/alibaba/fastjson/parser/Feature;

    move-object/from16 v0, v17

    move-object/from16 v1, v33

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v33

    if-nez v33, :cond_37c

    .line 305
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->symbolTable:Lcom/alibaba/fastjson/parser/SymbolTable;

    move-object/from16 v33, v0

    const/16 v34, 0x22

    move-object/from16 v0, v17

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanSymbol(Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/String;

    move-result-object v31

    .line 306
    .local v31, "typeName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->config:Lcom/alibaba/fastjson/parser/ParserConfig;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDefaultClassLoader()Ljava/lang/ClassLoader;

    move-result-object v33

    move-object/from16 v0, v31

    move-object/from16 v1, v33

    invoke-static {v0, v1}, Lcom/alibaba/fastjson/util/TypeUtils;->loadClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v4

    .line 308
    .local v4, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v4, :cond_2af

    .line 309
    sget-object v33, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    move-object/from16 v2, v31

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_71

    .line 283
    .end local v4    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v31    # "typeName":Ljava/lang/String;
    :cond_257
    sget-object v33, Lcom/alibaba/fastjson/parser/Feature;->AllowUnQuotedFieldNames:Lcom/alibaba/fastjson/parser/Feature;

    move-object/from16 v0, v17

    move-object/from16 v1, v33

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v33

    if-nez v33, :cond_26b

    .line 284
    new-instance v33, Lcom/alibaba/fastjson/JSONException;

    const-string v34, "syntax error"

    invoke-direct/range {v33 .. v34}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 287
    :cond_26b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->symbolTable:Lcom/alibaba/fastjson/parser/SymbolTable;

    move-object/from16 v33, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v33

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanSymbolUnQuoted(Lcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;

    move-result-object v16

    .line 288
    .local v16, "key":Ljava/lang/String;
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->skipWhitespace()V

    .line 289
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->getCurrent()C

    move-result v3

    .line 290
    const/16 v33, 0x3a

    move/from16 v0, v33

    if-eq v3, v0, :cond_201

    .line 291
    new-instance v33, Lcom/alibaba/fastjson/JSONException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "expect \':\' at "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->pos()I

    move-result v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ", actual "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 313
    .end local v16    # "key":Ljava/lang/String;
    .restart local v4    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v31    # "typeName":Ljava/lang/String;
    :cond_2af
    const/16 v33, 0x10

    move-object/from16 v0, v17

    move/from16 v1, v33

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 314
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v33

    const/16 v34, 0xd

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_321

    .line 315
    const/16 v33, 0x10

    move-object/from16 v0, v17

    move/from16 v1, v33

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V
    :try_end_2cd
    .catchall {:try_start_1d0 .. :try_end_2cd} :catchall_e6

    .line 317
    const/4 v13, 0x0

    .line 318
    .local v13, "instance":Ljava/lang/Object;
    :try_start_2ce
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->config:Lcom/alibaba/fastjson/parser/ParserConfig;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v8

    .line 319
    .local v8, "deserializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    instance-of v0, v8, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    move/from16 v33, v0

    if-eqz v33, :cond_2e8

    .line 320
    check-cast v8, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    .end local v8    # "deserializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    move-object/from16 v0, p0

    invoke-virtual {v8, v0, v4}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->createInstance(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v13

    .line 323
    .end local v13    # "instance":Ljava/lang/Object;
    :cond_2e8
    if-nez v13, :cond_2f5

    .line 324
    const-class v33, Ljava/lang/Cloneable;

    move-object/from16 v0, v33

    if-ne v4, v0, :cond_2fe

    .line 325
    new-instance v13, Ljava/util/HashMap;

    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V
    :try_end_2f5
    .catch Ljava/lang/Exception; {:try_start_2ce .. :try_end_2f5} :catch_314
    .catchall {:try_start_2ce .. :try_end_2f5} :catchall_e6

    .line 559
    :cond_2f5
    :goto_2f5
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    move-object/from16 p1, v13

    goto/16 :goto_17

    .line 326
    :cond_2fe
    :try_start_2fe
    const-string v33, "java.util.Collections$EmptyMap"

    move-object/from16 v0, v33

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_30f

    .line 327
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v13

    .local v13, "instance":Ljava/util/Map;
    goto :goto_2f5

    .line 329
    .end local v13    # "instance":Ljava/util/Map;
    :cond_30f
    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;
    :try_end_312
    .catch Ljava/lang/Exception; {:try_start_2fe .. :try_end_312} :catch_314
    .catchall {:try_start_2fe .. :try_end_312} :catchall_e6

    move-result-object v13

    .local v13, "instance":Ljava/lang/Object;
    goto :goto_2f5

    .line 334
    .end local v13    # "instance":Ljava/lang/Object;
    :catch_314
    move-exception v9

    .line 335
    .local v9, "e":Ljava/lang/Exception;
    :try_start_315
    new-instance v33, Lcom/alibaba/fastjson/JSONException;

    const-string v34, "create instance error"

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    invoke-direct {v0, v1, v9}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v33

    .line 339
    .end local v9    # "e":Ljava/lang/Exception;
    :cond_321
    const/16 v33, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setResolveStatus(I)V

    .line 341
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->context:Lcom/alibaba/fastjson/parser/ParseContext;

    move-object/from16 v33, v0

    if-eqz v33, :cond_33d

    move-object/from16 v0, p2

    instance-of v0, v0, Ljava/lang/Integer;

    move/from16 v33, v0

    if-nez v33, :cond_33d

    .line 342
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->popContext()V

    .line 345
    :cond_33d
    invoke-interface/range {p1 .. p1}, Ljava/util/Map;->size()I

    move-result v33

    if-lez v33, :cond_361

    .line 346
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->config:Lcom/alibaba/fastjson/parser/ParserConfig;

    move-object/from16 v33, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-static {v0, v4, v1}, Lcom/alibaba/fastjson/util/TypeUtils;->cast(Ljava/lang/Object;Ljava/lang/Class;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    move-result-object v19

    .line 347
    .local v19, "newObj":Ljava/lang/Object;
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseObject(Ljava/lang/Object;)V
    :try_end_358
    .catchall {:try_start_315 .. :try_end_358} :catchall_e6

    .line 559
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    move-object/from16 p1, v19

    goto/16 :goto_17

    .line 351
    .end local v19    # "newObj":Ljava/lang/Object;
    :cond_361
    :try_start_361
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->config:Lcom/alibaba/fastjson/parser/ParserConfig;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v8

    .line 352
    .restart local v8    # "deserializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-interface {v8, v0, v4, v1}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_374
    .catchall {:try_start_361 .. :try_end_374} :catchall_e6

    move-result-object p1

    .line 559
    .end local p1    # "object":Ljava/util/Map;
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    goto/16 :goto_17

    .line 355
    .end local v4    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v8    # "deserializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    .end local v31    # "typeName":Ljava/lang/String;
    .restart local p1    # "object":Ljava/util/Map;
    :cond_37c
    :try_start_37c
    const-string v33, "$ref"

    move-object/from16 v0, v16

    move-object/from16 v1, v33

    if-ne v0, v1, :cond_4df

    sget-object v33, Lcom/alibaba/fastjson/parser/Feature;->DisableSpecialKeyDetect:Lcom/alibaba/fastjson/parser/Feature;

    move-object/from16 v0, v17

    move-object/from16 v1, v33

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v33

    if-nez v33, :cond_4df

    .line 356
    const/16 v33, 0x4

    move-object/from16 v0, v17

    move/from16 v1, v33

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 357
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v33

    const/16 v34, 0x4

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_4be

    .line 358
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v23

    .line 359
    .local v23, "ref":Ljava/lang/String;
    const/16 v33, 0xd

    move-object/from16 v0, v17

    move/from16 v1, v33

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 361
    const/16 v24, 0x0

    .line 362
    .local v24, "refValue":Ljava/lang/Object;
    const-string v33, "@"

    move-object/from16 v0, v33

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_411

    .line 363
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->context:Lcom/alibaba/fastjson/parser/ParseContext;

    move-object/from16 v33, v0

    if-eqz v33, :cond_4aa

    .line 364
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->context:Lcom/alibaba/fastjson/parser/ParseContext;

    move-object/from16 v29, v0

    .line 365
    .local v29, "thisContext":Lcom/alibaba/fastjson/parser/ParseContext;
    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    move-object/from16 v30, v0

    .line 366
    .local v30, "thisObj":Ljava/lang/Object;
    move-object/from16 v0, v30

    instance-of v0, v0, [Ljava/lang/Object;

    move/from16 v33, v0

    if-nez v33, :cond_3e4

    move-object/from16 v0, v30

    instance-of v0, v0, Ljava/util/Collection;

    move/from16 v33, v0

    if-eqz v33, :cond_3fc

    .line 367
    :cond_3e4
    move-object/from16 v24, v30

    .end local v24    # "refValue":Ljava/lang/Object;
    :cond_3e6
    :goto_3e6
    move-object/from16 p1, v24

    .line 396
    .end local v29    # "thisContext":Lcom/alibaba/fastjson/parser/ParseContext;
    .end local v30    # "thisObj":Ljava/lang/Object;
    .end local p1    # "object":Ljava/util/Map;
    :goto_3e8
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v33

    const/16 v34, 0xd

    move/from16 v0, v33

    move/from16 v1, v34

    if-eq v0, v1, :cond_4ae

    .line 397
    new-instance v33, Lcom/alibaba/fastjson/JSONException;

    const-string v34, "syntax error"

    invoke-direct/range {v33 .. v34}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 368
    .restart local v24    # "refValue":Ljava/lang/Object;
    .restart local v29    # "thisContext":Lcom/alibaba/fastjson/parser/ParseContext;
    .restart local v30    # "thisObj":Ljava/lang/Object;
    .restart local p1    # "object":Ljava/util/Map;
    :cond_3fc
    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/ParseContext;->parent:Lcom/alibaba/fastjson/parser/ParseContext;

    move-object/from16 v33, v0

    if-eqz v33, :cond_3e6

    .line 369
    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/ParseContext;->parent:Lcom/alibaba/fastjson/parser/ParseContext;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    move-object/from16 v24, v0

    goto :goto_3e6

    .line 372
    .end local v29    # "thisContext":Lcom/alibaba/fastjson/parser/ParseContext;
    .end local v30    # "thisObj":Ljava/lang/Object;
    :cond_411
    const-string v33, ".."

    move-object/from16 v0, v33

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_446

    .line 373
    iget-object v0, v5, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    move-object/from16 v33, v0

    if-eqz v33, :cond_42a

    .line 374
    iget-object v0, v5, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    move-object/from16 v24, v0

    move-object/from16 p1, v24

    goto :goto_3e8

    .line 376
    :cond_42a
    new-instance v33, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;

    move-object/from16 v0, v33

    move-object/from16 v1, v23

    invoke-direct {v0, v5, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;-><init>(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/String;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->addResolveTask(Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;)V

    .line 377
    const/16 v33, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setResolveStatus(I)V

    move-object/from16 p1, v24

    goto :goto_3e8

    .line 379
    :cond_446
    const-string v33, "$"

    move-object/from16 v0, v33

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_491

    .line 380
    move-object/from16 v26, v5

    .line 381
    .local v26, "rootContext":Lcom/alibaba/fastjson/parser/ParseContext;
    :goto_454
    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/ParseContext;->parent:Lcom/alibaba/fastjson/parser/ParseContext;

    move-object/from16 v33, v0

    if-eqz v33, :cond_463

    .line 382
    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/ParseContext;->parent:Lcom/alibaba/fastjson/parser/ParseContext;

    move-object/from16 v26, v0

    goto :goto_454

    .line 385
    :cond_463
    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    move-object/from16 v33, v0

    if-eqz v33, :cond_475

    .line 386
    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    move-object/from16 v24, v0

    .end local v24    # "refValue":Ljava/lang/Object;
    :goto_471
    move-object/from16 p1, v24

    .line 391
    goto/16 :goto_3e8

    .line 388
    .restart local v24    # "refValue":Ljava/lang/Object;
    :cond_475
    new-instance v33, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;

    move-object/from16 v0, v33

    move-object/from16 v1, v26

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;-><init>(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/String;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->addResolveTask(Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;)V

    .line 389
    const/16 v33, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setResolveStatus(I)V

    goto :goto_471

    .line 392
    .end local v26    # "rootContext":Lcom/alibaba/fastjson/parser/ParseContext;
    :cond_491
    new-instance v33, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;

    move-object/from16 v0, v33

    move-object/from16 v1, v23

    invoke-direct {v0, v5, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;-><init>(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/String;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->addResolveTask(Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;)V

    .line 393
    const/16 v33, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setResolveStatus(I)V

    :cond_4aa
    move-object/from16 p1, v24

    goto/16 :goto_3e8

    .line 399
    .end local v24    # "refValue":Ljava/lang/Object;
    .end local p1    # "object":Ljava/util/Map;
    :cond_4ae
    const/16 v33, 0x10

    move-object/from16 v0, v17

    move/from16 v1, v33

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V
    :try_end_4b7
    .catchall {:try_start_37c .. :try_end_4b7} :catchall_e6

    .line 559
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    goto/16 :goto_17

    .line 403
    .end local v23    # "ref":Ljava/lang/String;
    .restart local p1    # "object":Ljava/util/Map;
    :cond_4be
    :try_start_4be
    new-instance v33, Lcom/alibaba/fastjson/JSONException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "illegal ref, "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v35

    invoke-static/range {v35 .. v35}, Lcom/alibaba/fastjson/parser/JSONToken;->name(I)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 407
    :cond_4df
    if-nez v27, :cond_4ea

    .line 408
    invoke-virtual/range {p0 .. p2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Ljava/lang/Object;Ljava/lang/Object;)Lcom/alibaba/fastjson/parser/ParseContext;

    move-result-object v6

    .line 409
    .local v6, "contextR":Lcom/alibaba/fastjson/parser/ParseContext;
    if-nez v5, :cond_4e8

    .line 410
    move-object v5, v6

    .line 412
    :cond_4e8
    const/16 v27, 0x1

    .line 415
    .end local v6    # "contextR":Lcom/alibaba/fastjson/parser/ParseContext;
    :cond_4ea
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v33

    const-class v34, Lcom/alibaba/fastjson/JSONObject;

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    if-ne v0, v1, :cond_4fa

    .line 416
    if-nez v16, :cond_548

    const-string v16, "null"

    .line 420
    :cond_4fa
    :goto_4fa
    const/16 v33, 0x22

    move/from16 v0, v33

    if-ne v3, v0, :cond_54d

    .line 421
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanString()V

    .line 422
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v28

    .line 423
    .local v28, "strValue":Ljava/lang/String;
    move-object/from16 v32, v28

    .line 425
    .local v32, "value":Ljava/lang/String;
    sget-object v33, Lcom/alibaba/fastjson/parser/Feature;->AllowISO8601DateFormat:Lcom/alibaba/fastjson/parser/Feature;

    move-object/from16 v0, v17

    move-object/from16 v1, v33

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v33

    if-eqz v33, :cond_52d

    .line 426
    new-instance v15, Lcom/alibaba/fastjson/parser/JSONScanner;

    move-object/from16 v0, v28

    invoke-direct {v15, v0}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;)V

    .line 427
    .local v15, "iso8601Lexer":Lcom/alibaba/fastjson/parser/JSONScanner;
    invoke-virtual {v15}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch()Z

    move-result v33

    if-eqz v33, :cond_52a

    .line 428
    invoke-virtual {v15}, Lcom/alibaba/fastjson/parser/JSONScanner;->getCalendar()Ljava/util/Calendar;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v32

    .line 430
    .end local v32    # "value":Ljava/lang/String;
    :cond_52a
    invoke-virtual {v15}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    .line 433
    .end local v15    # "iso8601Lexer":Lcom/alibaba/fastjson/parser/JSONScanner;
    :cond_52d
    move-object/from16 v0, p1

    move-object/from16 v1, v16

    move-object/from16 v2, v32

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 539
    .end local v28    # "strValue":Ljava/lang/String;
    :goto_536
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->skipWhitespace()V

    .line 540
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->getCurrent()C

    move-result v3

    .line 541
    const/16 v33, 0x2c

    move/from16 v0, v33

    if-ne v3, v0, :cond_76a

    .line 542
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->next()C

    goto/16 :goto_71

    .line 416
    :cond_548
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v16

    goto :goto_4fa

    .line 434
    :cond_54d
    const/16 v33, 0x30

    move/from16 v0, v33

    if-lt v3, v0, :cond_559

    const/16 v33, 0x39

    move/from16 v0, v33

    if-le v3, v0, :cond_55f

    :cond_559
    const/16 v33, 0x2d

    move/from16 v0, v33

    if-ne v3, v0, :cond_58f

    .line 435
    :cond_55f
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanNumber()V

    .line 436
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v33

    const/16 v34, 0x2

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_57c

    .line 437
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->integerValue()Ljava/lang/Number;

    move-result-object v32

    .line 442
    .local v32, "value":Ljava/lang/Number;
    :goto_572
    move-object/from16 v0, p1

    move-object/from16 v1, v16

    move-object/from16 v2, v32

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_536

    .line 439
    .end local v32    # "value":Ljava/lang/Number;
    :cond_57c
    sget-object v33, Lcom/alibaba/fastjson/parser/Feature;->UseBigDecimal:Lcom/alibaba/fastjson/parser/Feature;

    move-object/from16 v0, v17

    move-object/from16 v1, v33

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v33

    move-object/from16 v0, v17

    move/from16 v1, v33

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->decimalValue(Z)Ljava/lang/Number;

    move-result-object v32

    .restart local v32    # "value":Ljava/lang/Number;
    goto :goto_572

    .line 443
    .end local v32    # "value":Ljava/lang/Number;
    :cond_58f
    const/16 v33, 0x5b

    move/from16 v0, v33

    if-ne v3, v0, :cond_5ec

    .line 444
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 445
    new-instance v18, Lcom/alibaba/fastjson/JSONArray;

    invoke-direct/range {v18 .. v18}, Lcom/alibaba/fastjson/JSONArray;-><init>()V

    .line 446
    .local v18, "list":Lcom/alibaba/fastjson/JSONArray;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseArray(Ljava/util/Collection;Ljava/lang/Object;)V

    .line 448
    sget-object v33, Lcom/alibaba/fastjson/parser/Feature;->UseObjectArray:Lcom/alibaba/fastjson/parser/Feature;

    move-object/from16 v0, v17

    move-object/from16 v1, v33

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v33

    if-eqz v33, :cond_5d5

    .line 449
    invoke-virtual/range {v18 .. v18}, Lcom/alibaba/fastjson/JSONArray;->toArray()[Ljava/lang/Object;

    move-result-object v32

    .line 453
    :goto_5b6
    move-object/from16 v0, p1

    move-object/from16 v1, v16

    move-object/from16 v2, v32

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 455
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v33

    const/16 v34, 0xd

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_5d8

    .line 456
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V
    :try_end_5ce
    .catchall {:try_start_4be .. :try_end_5ce} :catchall_e6

    .line 559
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    goto/16 :goto_17

    .line 451
    :cond_5d5
    move-object/from16 v32, v18

    .local v32, "value":Lcom/alibaba/fastjson/JSONArray;
    goto :goto_5b6

    .line 458
    .end local v32    # "value":Lcom/alibaba/fastjson/JSONArray;
    :cond_5d8
    :try_start_5d8
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v33

    const/16 v34, 0x10

    move/from16 v0, v33

    move/from16 v1, v34

    if-eq v0, v1, :cond_71

    .line 461
    new-instance v33, Lcom/alibaba/fastjson/JSONException;

    const-string v34, "syntax error"

    invoke-direct/range {v33 .. v34}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 463
    .end local v18    # "list":Lcom/alibaba/fastjson/JSONArray;
    :cond_5ec
    const/16 v33, 0x7b

    move/from16 v0, v33

    if-ne v3, v0, :cond_6fd

    .line 464
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 466
    if-eqz p2, :cond_6bb

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v33

    const-class v34, Ljava/lang/Integer;

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    if-ne v0, v1, :cond_6bb

    const/16 v22, 0x1

    .line 468
    .local v22, "parentIsArray":Z
    :goto_605
    new-instance v12, Lcom/alibaba/fastjson/JSONObject;

    sget-object v33, Lcom/alibaba/fastjson/parser/Feature;->OrderedField:Lcom/alibaba/fastjson/parser/Feature;

    move-object/from16 v0, v17

    move-object/from16 v1, v33

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v33

    move/from16 v0, v33

    invoke-direct {v12, v0}, Lcom/alibaba/fastjson/JSONObject;-><init>(Z)V

    .line 469
    .local v12, "input":Lcom/alibaba/fastjson/JSONObject;
    const/4 v7, 0x0

    .line 471
    .local v7, "ctxLocal":Lcom/alibaba/fastjson/parser/ParseContext;
    if-nez v22, :cond_621

    .line 472
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v5, v12, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/Object;Ljava/lang/Object;)Lcom/alibaba/fastjson/parser/ParseContext;

    move-result-object v7

    .line 475
    :cond_621
    const/16 v20, 0x0

    .line 476
    .local v20, "obj":Ljava/lang/Object;
    const/16 v21, 0x0

    .line 477
    .local v21, "objParsed":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->fieldTypeResolver:Lcom/alibaba/fastjson/parser/deserializer/FieldTypeResolver;

    move-object/from16 v33, v0

    if-eqz v33, :cond_65b

    .line 478
    if-eqz v16, :cond_6bf

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v25

    .line 479
    .local v25, "resolveFieldName":Ljava/lang/String;
    :goto_633
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->fieldTypeResolver:Lcom/alibaba/fastjson/parser/deserializer/FieldTypeResolver;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    move-object/from16 v1, p1

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/parser/deserializer/FieldTypeResolver;->resolve(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Type;

    move-result-object v11

    .line 480
    .local v11, "fieldType":Ljava/lang/reflect/Type;
    if-eqz v11, :cond_65b

    .line 481
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->config:Lcom/alibaba/fastjson/parser/ParserConfig;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    invoke-virtual {v0, v11}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v10

    .line 482
    .local v10, "fieldDeser":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-interface {v10, v0, v11, v1}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    .line 483
    const/16 v21, 0x1

    .line 486
    .end local v10    # "fieldDeser":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    .end local v11    # "fieldType":Ljava/lang/reflect/Type;
    .end local v20    # "obj":Ljava/lang/Object;
    .end local v25    # "resolveFieldName":Ljava/lang/String;
    :cond_65b
    if-nez v21, :cond_665

    .line 487
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v12, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseObject(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    .line 490
    :cond_665
    if-eqz v7, :cond_66f

    move-object/from16 v0, v20

    if-eq v12, v0, :cond_66f

    .line 491
    move-object/from16 v0, p1

    iput-object v0, v7, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 494
    :cond_66f
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->checkMapResolve(Ljava/util/Map;Ljava/lang/Object;)V

    .line 496
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v33

    const-class v34, Lcom/alibaba/fastjson/JSONObject;

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    if-ne v0, v1, :cond_6c3

    .line 497
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 502
    :goto_695
    if-eqz v22, :cond_6a0

    .line 504
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Ljava/lang/Object;Ljava/lang/Object;)Lcom/alibaba/fastjson/parser/ParseContext;

    .line 507
    :cond_6a0
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v33

    const/16 v34, 0xd

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_6cd

    .line 508
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 510
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V
    :try_end_6b4
    .catchall {:try_start_5d8 .. :try_end_6b4} :catchall_e6

    .line 559
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    goto/16 :goto_17

    .line 466
    .end local v7    # "ctxLocal":Lcom/alibaba/fastjson/parser/ParseContext;
    .end local v12    # "input":Lcom/alibaba/fastjson/JSONObject;
    .end local v21    # "objParsed":Z
    .end local v22    # "parentIsArray":Z
    :cond_6bb
    const/16 v22, 0x0

    goto/16 :goto_605

    .line 478
    .restart local v7    # "ctxLocal":Lcom/alibaba/fastjson/parser/ParseContext;
    .restart local v12    # "input":Lcom/alibaba/fastjson/JSONObject;
    .restart local v20    # "obj":Ljava/lang/Object;
    .restart local v21    # "objParsed":Z
    .restart local v22    # "parentIsArray":Z
    :cond_6bf
    const/16 v25, 0x0

    goto/16 :goto_633

    .line 499
    .end local v20    # "obj":Ljava/lang/Object;
    :cond_6c3
    :try_start_6c3
    move-object/from16 v0, p1

    move-object/from16 v1, v16

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_695

    .line 512
    :cond_6cd
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v33

    const/16 v34, 0x10

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_6e0

    .line 513
    if-eqz v22, :cond_71

    .line 514
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->popContext()V

    goto/16 :goto_71

    .line 518
    :cond_6e0
    new-instance v33, Lcom/alibaba/fastjson/JSONException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "syntax error, "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->tokenName()Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 521
    .end local v7    # "ctxLocal":Lcom/alibaba/fastjson/parser/ParseContext;
    .end local v12    # "input":Lcom/alibaba/fastjson/JSONObject;
    .end local v21    # "objParsed":Z
    .end local v22    # "parentIsArray":Z
    :cond_6fd
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 522
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v32

    .line 524
    .local v32, "value":Ljava/lang/Object;
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v33

    const-class v34, Lcom/alibaba/fastjson/JSONObject;

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    if-ne v0, v1, :cond_714

    .line 525
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v16

    .line 527
    :cond_714
    move-object/from16 v0, p1

    move-object/from16 v1, v16

    move-object/from16 v2, v32

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 529
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v33

    const/16 v34, 0xd

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_733

    .line 530
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V
    :try_end_72c
    .catchall {:try_start_6c3 .. :try_end_72c} :catchall_e6

    .line 559
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    goto/16 :goto_17

    .line 532
    :cond_733
    :try_start_733
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v33

    const/16 v34, 0x10

    move/from16 v0, v33

    move/from16 v1, v34

    if-eq v0, v1, :cond_71

    .line 535
    new-instance v33, Lcom/alibaba/fastjson/JSONException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "syntax error, position at "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->pos()I

    move-result v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ", name "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 544
    .end local v32    # "value":Ljava/lang/Object;
    :cond_76a
    const/16 v33, 0x7d

    move/from16 v0, v33

    if-ne v3, v0, :cond_789

    .line 545
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->next()C

    .line 546
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->resetStringPosition()V

    .line 547
    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 550
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Ljava/lang/Object;Ljava/lang/Object;)Lcom/alibaba/fastjson/parser/ParseContext;
    :try_end_782
    .catchall {:try_start_733 .. :try_end_782} :catchall_e6

    .line 559
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    goto/16 :goto_17

    .line 554
    :cond_789
    :try_start_789
    new-instance v33, Lcom/alibaba/fastjson/JSONException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "syntax error, position at "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-interface/range {v17 .. v17}, Lcom/alibaba/fastjson/parser/JSONLexer;->pos()I

    move-result v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ", name "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v33
    :try_end_7b4
    .catchall {:try_start_789 .. :try_end_7b4} :catchall_e6
.end method

.method public parseObject(Ljava/lang/Object;)V
    .registers 14
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 824
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 825
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    .line 826
    .local v0, "beanDeser":Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->config:Lcom/alibaba/fastjson/parser/ParserConfig;

    invoke-virtual {v9, v1}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v2

    .line 827
    .local v2, "deserizer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    instance-of v9, v2, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    if-eqz v9, :cond_12

    move-object v0, v2

    .line 828
    check-cast v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    .line 831
    :cond_12
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v9

    const/16 v10, 0xc

    if-eq v9, v10, :cond_59

    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v9

    const/16 v10, 0x10

    if-eq v9, v10, :cond_59

    .line 832
    new-instance v9, Lcom/alibaba/fastjson/JSONException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "syntax error, expect {, actual "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v11}, Lcom/alibaba/fastjson/parser/JSONLexer;->tokenName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 844
    .local v8, "key":Ljava/lang/String;
    :cond_45
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v9

    const/16 v10, 0x10

    if-ne v9, v10, :cond_75

    .line 845
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    sget-object v10, Lcom/alibaba/fastjson/parser/Feature;->AllowArbitraryCommas:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v9, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v9

    if-eqz v9, :cond_75

    .line 837
    .end local v8    # "key":Ljava/lang/String;
    :cond_59
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    iget-object v10, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->symbolTable:Lcom/alibaba/fastjson/parser/SymbolTable;

    invoke-interface {v9, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanSymbol(Lcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;

    move-result-object v8

    .line 839
    .restart local v8    # "key":Ljava/lang/String;
    if-nez v8, :cond_75

    .line 840
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v9

    const/16 v10, 0xd

    if-ne v9, v10, :cond_45

    .line 841
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    const/16 v10, 0x10

    invoke-interface {v9, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 902
    :goto_74
    return-void

    .line 851
    :cond_75
    const/4 v4, 0x0

    .line 852
    .local v4, "fieldDeser":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    if-eqz v0, :cond_7c

    .line 853
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->getFieldDeserializer(Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    move-result-object v4

    .line 856
    :cond_7c
    if-nez v4, :cond_c7

    .line 857
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    sget-object v10, Lcom/alibaba/fastjson/parser/Feature;->IgnoreNotMatch:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v9, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v9

    if-nez v9, :cond_af

    .line 858
    new-instance v9, Lcom/alibaba/fastjson/JSONException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "setter not found, class "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", property "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 861
    :cond_af
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon()V

    .line 862
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    .line 864
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v9

    const/16 v10, 0xd

    if-ne v9, v10, :cond_59

    .line 865
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    goto :goto_74

    .line 871
    :cond_c7
    iget-object v9, v4, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v3, v9, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 872
    .local v3, "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v9, v4, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v5, v9, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    .line 874
    .local v5, "fieldType":Ljava/lang/reflect/Type;
    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne v3, v9, :cond_100

    .line 875
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    const/4 v10, 0x2

    invoke-interface {v9, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 876
    sget-object v9, Lcom/alibaba/fastjson/serializer/IntegerCodec;->instance:Lcom/alibaba/fastjson/serializer/IntegerCodec;

    const/4 v10, 0x0

    invoke-virtual {v9, p0, v5, v10}, Lcom/alibaba/fastjson/serializer/IntegerCodec;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 890
    .local v6, "fieldValue":Ljava/lang/Object;
    :goto_e0
    invoke-virtual {v4, p1, v6}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 893
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v9

    const/16 v10, 0x10

    if-eq v9, v10, :cond_59

    .line 897
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v9

    const/16 v10, 0xd

    if-ne v9, v10, :cond_59

    .line 898
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    const/16 v10, 0x10

    invoke-interface {v9, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    goto/16 :goto_74

    .line 877
    .end local v6    # "fieldValue":Ljava/lang/Object;
    :cond_100
    const-class v9, Ljava/lang/String;

    if-ne v3, v9, :cond_10f

    .line 878
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    const/4 v10, 0x4

    invoke-interface {v9, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 879
    invoke-static {p0}, Lcom/alibaba/fastjson/serializer/StringCodec;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;)Ljava/lang/Object;

    move-result-object v6

    .restart local v6    # "fieldValue":Ljava/lang/Object;
    goto :goto_e0

    .line 880
    .end local v6    # "fieldValue":Ljava/lang/Object;
    :cond_10f
    sget-object v9, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne v3, v9, :cond_121

    .line 881
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    const/4 v10, 0x2

    invoke-interface {v9, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 882
    sget-object v9, Lcom/alibaba/fastjson/serializer/LongCodec;->instance:Lcom/alibaba/fastjson/serializer/LongCodec;

    const/4 v10, 0x0

    invoke-virtual {v9, p0, v5, v10}, Lcom/alibaba/fastjson/serializer/LongCodec;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .restart local v6    # "fieldValue":Ljava/lang/Object;
    goto :goto_e0

    .line 884
    .end local v6    # "fieldValue":Ljava/lang/Object;
    :cond_121
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->config:Lcom/alibaba/fastjson/parser/ParserConfig;

    invoke-virtual {v9, v3, v5}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v7

    .line 886
    .local v7, "fieldValueDeserializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    invoke-interface {v7}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->getFastMatchToken()I

    move-result v10

    invoke-interface {v9, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 887
    const/4 v9, 0x0

    invoke-interface {v7, p0, v5, v9}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .restart local v6    # "fieldValue":Ljava/lang/Object;
    goto :goto_e0
.end method

.method public popContext()V
    .registers 4

    .prologue
    .line 1219
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    sget-object v1, Lcom/alibaba/fastjson/parser/Feature;->DisableCircularReferenceDetect:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 1226
    :goto_a
    return-void

    .line 1223
    :cond_b
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->context:Lcom/alibaba/fastjson/parser/ParseContext;

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/ParseContext;->parent:Lcom/alibaba/fastjson/parser/ParseContext;

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->context:Lcom/alibaba/fastjson/parser/ParseContext;

    .line 1224
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->contextArray:[Lcom/alibaba/fastjson/parser/ParseContext;

    iget v1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->contextArrayIndex:I

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    aput-object v2, v0, v1

    .line 1225
    iget v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->contextArrayIndex:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->contextArrayIndex:I

    goto :goto_a
.end method

.method public setConfig(Lcom/alibaba/fastjson/parser/ParserConfig;)V
    .registers 2
    .param p1, "config"    # Lcom/alibaba/fastjson/parser/ParserConfig;

    .prologue
    .line 569
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->config:Lcom/alibaba/fastjson/parser/ParserConfig;

    .line 570
    return-void
.end method

.method public setContext(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/Object;Ljava/lang/Object;)Lcom/alibaba/fastjson/parser/ParseContext;
    .registers 6
    .param p1, "parent"    # Lcom/alibaba/fastjson/parser/ParseContext;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "fieldName"    # Ljava/lang/Object;

    .prologue
    .line 1237
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    sget-object v1, Lcom/alibaba/fastjson/parser/Feature;->DisableCircularReferenceDetect:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 1238
    const/4 v0, 0x0

    .line 1244
    :goto_b
    return-object v0

    .line 1241
    :cond_c
    new-instance v0, Lcom/alibaba/fastjson/parser/ParseContext;

    invoke-direct {v0, p1, p2, p3}, Lcom/alibaba/fastjson/parser/ParseContext;-><init>(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->context:Lcom/alibaba/fastjson/parser/ParseContext;

    .line 1242
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->context:Lcom/alibaba/fastjson/parser/ParseContext;

    invoke-direct {p0, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->addContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    .line 1244
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->context:Lcom/alibaba/fastjson/parser/ParseContext;

    goto :goto_b
.end method

.method public setContext(Ljava/lang/Object;Ljava/lang/Object;)Lcom/alibaba/fastjson/parser/ParseContext;
    .registers 5
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "fieldName"    # Ljava/lang/Object;

    .prologue
    .line 1229
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    sget-object v1, Lcom/alibaba/fastjson/parser/Feature;->DisableCircularReferenceDetect:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 1230
    const/4 v0, 0x0

    .line 1233
    :goto_b
    return-object v0

    :cond_c
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->context:Lcom/alibaba/fastjson/parser/ParseContext;

    invoke-virtual {p0, v0, p1, p2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/Object;Ljava/lang/Object;)Lcom/alibaba/fastjson/parser/ParseContext;

    move-result-object v0

    goto :goto_b
.end method

.method public setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V
    .registers 4
    .param p1, "context"    # Lcom/alibaba/fastjson/parser/ParseContext;

    .prologue
    .line 1212
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    sget-object v1, Lcom/alibaba/fastjson/parser/Feature;->DisableCircularReferenceDetect:Lcom/alibaba/fastjson/parser/Feature;

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 1216
    :goto_a
    return-void

    .line 1215
    :cond_b
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->context:Lcom/alibaba/fastjson/parser/ParseContext;

    goto :goto_a
.end method

.method public setDateFomrat(Ljava/text/DateFormat;)V
    .registers 2
    .param p1, "dateFormat"    # Ljava/text/DateFormat;

    .prologue
    .line 145
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->dateFormat:Ljava/text/DateFormat;

    .line 146
    return-void
.end method

.method public setDateFormat(Ljava/lang/String;)V
    .registers 3
    .param p1, "dateFormat"    # Ljava/lang/String;

    .prologue
    .line 140
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->dateFormatPattern:Ljava/lang/String;

    .line 141
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->dateFormat:Ljava/text/DateFormat;

    .line 142
    return-void
.end method

.method public setFieldTypeResolver(Lcom/alibaba/fastjson/parser/deserializer/FieldTypeResolver;)V
    .registers 2
    .param p1, "fieldTypeResolver"    # Lcom/alibaba/fastjson/parser/deserializer/FieldTypeResolver;

    .prologue
    .line 1208
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->fieldTypeResolver:Lcom/alibaba/fastjson/parser/deserializer/FieldTypeResolver;

    .line 1209
    return-void
.end method

.method public setResolveStatus(I)V
    .registers 2
    .param p1, "resolveStatus"    # I

    .prologue
    .line 999
    iput p1, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveStatus:I

    .line 1000
    return-void
.end method

.method public throwException(I)V
    .registers 5
    .param p1, "token"    # I

    .prologue
    .line 1390
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "syntax error, expect "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lcom/alibaba/fastjson/parser/JSONToken;->name(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", actual "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 1391
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v2

    invoke-static {v2}, Lcom/alibaba/fastjson/parser/JSONToken;->name(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
