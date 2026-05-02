.class public abstract Lcom/alibaba/fastjson/JSON;
.super Ljava/lang/Object;
.source "JSON.java"

# interfaces
.implements Lcom/alibaba/fastjson/JSONStreamAware;
.implements Lcom/alibaba/fastjson/JSONAware;


# static fields
.field public static DEFAULT_GENERATE_FEATURE:I = 0x0

.field public static DEFAULT_PARSER_FEATURE:I = 0x0

.field public static DEFAULT_TYPE_KEY:Ljava/lang/String; = null

.field public static DEFFAULT_DATE_FORMAT:Ljava/lang/String; = null

.field public static final VERSION:Ljava/lang/String; = "1.2.11"

.field private static final bytesLocal:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<[B>;"
        }
    .end annotation
.end field

.field private static final charsLocal:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<[C>;"
        }
    .end annotation
.end field

.field public static defaultLocale:Ljava/util/Locale;

.field public static defaultTimeZone:Ljava/util/TimeZone;

.field static final emptyFilters:[Lcom/alibaba/fastjson/serializer/SerializeFilter;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 59
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v1

    sput-object v1, Lcom/alibaba/fastjson/JSON;->defaultTimeZone:Ljava/util/TimeZone;

    .line 60
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    sput-object v1, Lcom/alibaba/fastjson/JSON;->defaultLocale:Ljava/util/Locale;

    .line 62
    const-string v1, "@type"

    sput-object v1, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    .line 66
    const/4 v1, 0x0

    new-array v1, v1, [Lcom/alibaba/fastjson/serializer/SerializeFilter;

    sput-object v1, Lcom/alibaba/fastjson/JSON;->emptyFilters:[Lcom/alibaba/fastjson/serializer/SerializeFilter;

    .line 75
    const/4 v0, 0x0

    .line 76
    .local v0, "features":I
    sget-object v1, Lcom/alibaba/fastjson/parser/Feature;->AutoCloseSource:Lcom/alibaba/fastjson/parser/Feature;

    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/Feature;->getMask()I

    move-result v1

    or-int/2addr v0, v1

    .line 77
    sget-object v1, Lcom/alibaba/fastjson/parser/Feature;->InternFieldNames:Lcom/alibaba/fastjson/parser/Feature;

    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/Feature;->getMask()I

    move-result v1

    or-int/2addr v0, v1

    .line 78
    sget-object v1, Lcom/alibaba/fastjson/parser/Feature;->UseBigDecimal:Lcom/alibaba/fastjson/parser/Feature;

    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/Feature;->getMask()I

    move-result v1

    or-int/2addr v0, v1

    .line 79
    sget-object v1, Lcom/alibaba/fastjson/parser/Feature;->AllowUnQuotedFieldNames:Lcom/alibaba/fastjson/parser/Feature;

    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/Feature;->getMask()I

    move-result v1

    or-int/2addr v0, v1

    .line 80
    sget-object v1, Lcom/alibaba/fastjson/parser/Feature;->AllowSingleQuotes:Lcom/alibaba/fastjson/parser/Feature;

    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/Feature;->getMask()I

    move-result v1

    or-int/2addr v0, v1

    .line 81
    sget-object v1, Lcom/alibaba/fastjson/parser/Feature;->AllowArbitraryCommas:Lcom/alibaba/fastjson/parser/Feature;

    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/Feature;->getMask()I

    move-result v1

    or-int/2addr v0, v1

    .line 82
    sget-object v1, Lcom/alibaba/fastjson/parser/Feature;->SortFeidFastMatch:Lcom/alibaba/fastjson/parser/Feature;

    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/Feature;->getMask()I

    move-result v1

    or-int/2addr v0, v1

    .line 83
    sget-object v1, Lcom/alibaba/fastjson/parser/Feature;->IgnoreNotMatch:Lcom/alibaba/fastjson/parser/Feature;

    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/Feature;->getMask()I

    move-result v1

    or-int/2addr v0, v1

    .line 84
    sput v0, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    .line 87
    const-string v1, "yyyy-MM-dd HH:mm:ss"

    sput-object v1, Lcom/alibaba/fastjson/JSON;->DEFFAULT_DATE_FORMAT:Ljava/lang/String;

    .line 92
    const/4 v0, 0x0

    .line 93
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->QuoteFieldNames:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->getMask()I

    move-result v1

    or-int/2addr v0, v1

    .line 94
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->SkipTransientField:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->getMask()I

    move-result v1

    or-int/2addr v0, v1

    .line 95
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteEnumUsingName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->getMask()I

    move-result v1

    or-int/2addr v0, v1

    .line 96
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->SortField:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->getMask()I

    move-result v1

    or-int/2addr v0, v1

    .line 99
    sput v0, Lcom/alibaba/fastjson/JSON;->DEFAULT_GENERATE_FEATURE:I

    .line 848
    new-instance v1, Ljava/lang/ThreadLocal;

    invoke-direct {v1}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v1, Lcom/alibaba/fastjson/JSON;->bytesLocal:Ljava/lang/ThreadLocal;

    .line 866
    new-instance v1, Ljava/lang/ThreadLocal;

    invoke-direct {v1}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v1, Lcom/alibaba/fastjson/JSON;->charsLocal:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static allocateBytes(I)[B
    .registers 4
    .param p0, "length"    # I

    .prologue
    const/high16 v2, 0x10000

    .line 850
    sget-object v1, Lcom/alibaba/fastjson/JSON;->bytesLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 852
    .local v0, "chars":[B
    if-nez v0, :cond_19

    .line 853
    if-gt p0, v2, :cond_16

    .line 854
    new-array v0, v2, [B

    .line 855
    sget-object v1, Lcom/alibaba/fastjson/JSON;->bytesLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 863
    :cond_15
    :goto_15
    return-object v0

    .line 857
    :cond_16
    new-array v0, p0, [B

    goto :goto_15

    .line 859
    :cond_19
    array-length v1, v0

    if-ge v1, p0, :cond_15

    .line 860
    new-array v0, p0, [B

    goto :goto_15
.end method

.method private static allocateChars(I)[C
    .registers 4
    .param p0, "length"    # I

    .prologue
    const/high16 v2, 0x10000

    .line 868
    sget-object v1, Lcom/alibaba/fastjson/JSON;->charsLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    .line 870
    .local v0, "chars":[C
    if-nez v0, :cond_19

    .line 871
    if-gt p0, v2, :cond_16

    .line 872
    new-array v0, v2, [C

    .line 873
    sget-object v1, Lcom/alibaba/fastjson/JSON;->charsLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 881
    :cond_15
    :goto_15
    return-object v0

    .line 875
    :cond_16
    new-array v0, p0, [C

    goto :goto_15

    .line 877
    :cond_19
    array-length v1, v0

    if-ge v1, p0, :cond_15

    .line 878
    new-array v0, p0, [C

    goto :goto_15
.end method

.method public static parse(Ljava/lang/String;)Ljava/lang/Object;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 103
    sget v0, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    invoke-static {p0, v0}, Lcom/alibaba/fastjson/JSON;->parse(Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/lang/String;I)Ljava/lang/Object;
    .registers 5
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "features"    # I

    .prologue
    .line 107
    if-nez p0, :cond_4

    .line 108
    const/4 v1, 0x0

    .line 118
    :goto_3
    return-object v1

    .line 111
    :cond_4
    new-instance v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;

    invoke-static {}, Lcom/alibaba/fastjson/parser/ParserConfig;->getGlobalInstance()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v2

    invoke-direct {v0, p0, v2, p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;-><init>(Ljava/lang/String;Lcom/alibaba/fastjson/parser/ParserConfig;I)V

    .line 112
    .local v0, "parser":Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v1

    .line 114
    .local v1, "value":Ljava/lang/Object;
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->handleResovleTask(Ljava/lang/Object;)V

    .line 116
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->close()V

    goto :goto_3
.end method

.method public static varargs parse(Ljava/lang/String;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;
    .registers 7
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "features"    # [Lcom/alibaba/fastjson/parser/Feature;

    .prologue
    .line 163
    sget v1, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    .line 164
    .local v1, "featureValues":I
    array-length v3, p1

    const/4 v2, 0x0

    :goto_4
    if-ge v2, v3, :cond_10

    aget-object v0, p1, v2

    .line 165
    .local v0, "feature":Lcom/alibaba/fastjson/parser/Feature;
    const/4 v4, 0x1

    invoke-static {v1, v0, v4}, Lcom/alibaba/fastjson/parser/Feature;->config(ILcom/alibaba/fastjson/parser/Feature;Z)I

    move-result v1

    .line 164
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 168
    .end local v0    # "feature":Lcom/alibaba/fastjson/parser/Feature;
    :cond_10
    invoke-static {p0, v1}, Lcom/alibaba/fastjson/JSON;->parse(Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public static parse([BIILjava/nio/charset/CharsetDecoder;I)Ljava/lang/Object;
    .registers 16
    .param p0, "input"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "charsetDecoder"    # Ljava/nio/charset/CharsetDecoder;
    .param p4, "features"    # I

    .prologue
    .line 141
    invoke-virtual {p3}, Ljava/nio/charset/CharsetDecoder;->reset()Ljava/nio/charset/CharsetDecoder;

    .line 143
    int-to-double v7, p2

    invoke-virtual {p3}, Ljava/nio/charset/CharsetDecoder;->maxCharsPerByte()F

    move-result v9

    float-to-double v9, v9

    mul-double/2addr v7, v9

    double-to-int v5, v7

    .line 144
    .local v5, "scaleLength":I
    invoke-static {v5}, Lcom/alibaba/fastjson/JSON;->allocateChars(I)[C

    move-result-object v2

    .line 146
    .local v2, "chars":[C
    invoke-static {p0, p1, p2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 147
    .local v0, "byteBuf":Ljava/nio/ByteBuffer;
    invoke-static {v2}, Ljava/nio/CharBuffer;->wrap([C)Ljava/nio/CharBuffer;

    move-result-object v1

    .line 148
    .local v1, "charBuf":Ljava/nio/CharBuffer;
    invoke-static {p3, v0, v1}, Lcom/alibaba/fastjson/util/IOUtils;->decode(Ljava/nio/charset/CharsetDecoder;Ljava/nio/ByteBuffer;Ljava/nio/CharBuffer;)V

    .line 150
    invoke-virtual {v1}, Ljava/nio/CharBuffer;->position()I

    move-result v4

    .line 152
    .local v4, "position":I
    new-instance v3, Lcom/alibaba/fastjson/parser/DefaultJSONParser;

    invoke-static {}, Lcom/alibaba/fastjson/parser/ParserConfig;->getGlobalInstance()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v7

    invoke-direct {v3, v2, v4, v7, p4}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;-><init>([CILcom/alibaba/fastjson/parser/ParserConfig;I)V

    .line 153
    .local v3, "parser":Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    invoke-virtual {v3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v6

    .line 155
    .local v6, "value":Ljava/lang/Object;
    invoke-virtual {v3, v6}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->handleResovleTask(Ljava/lang/Object;)V

    .line 157
    invoke-virtual {v3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->close()V

    .line 159
    return-object v6
.end method

.method public static varargs parse([BIILjava/nio/charset/CharsetDecoder;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;
    .registers 10
    .param p0, "input"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "charsetDecoder"    # Ljava/nio/charset/CharsetDecoder;
    .param p4, "features"    # [Lcom/alibaba/fastjson/parser/Feature;

    .prologue
    .line 128
    if-eqz p0, :cond_5

    array-length v2, p0

    if-nez v2, :cond_7

    .line 129
    :cond_5
    const/4 v2, 0x0

    .line 137
    :goto_6
    return-object v2

    .line 132
    :cond_7
    sget v1, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    .line 133
    .local v1, "featureValues":I
    array-length v3, p4

    const/4 v2, 0x0

    :goto_b
    if-ge v2, v3, :cond_17

    aget-object v0, p4, v2

    .line 134
    .local v0, "feature":Lcom/alibaba/fastjson/parser/Feature;
    const/4 v4, 0x1

    invoke-static {v1, v0, v4}, Lcom/alibaba/fastjson/parser/Feature;->config(ILcom/alibaba/fastjson/parser/Feature;Z)I

    move-result v1

    .line 133
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 137
    .end local v0    # "feature":Lcom/alibaba/fastjson/parser/Feature;
    :cond_17
    invoke-static {p0, p1, p2, p3, v1}, Lcom/alibaba/fastjson/JSON;->parse([BIILjava/nio/charset/CharsetDecoder;I)Ljava/lang/Object;

    move-result-object v2

    goto :goto_6
.end method

.method public static varargs parse([B[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;
    .registers 6
    .param p0, "input"    # [B
    .param p1, "features"    # [Lcom/alibaba/fastjson/parser/Feature;

    .prologue
    const/4 v3, 0x0

    .line 122
    array-length v2, p0

    invoke-static {v2}, Lcom/alibaba/fastjson/JSON;->allocateChars(I)[C

    move-result-object v0

    .line 123
    .local v0, "chars":[C
    array-length v2, p0

    invoke-static {p0, v3, v2, v0}, Lcom/alibaba/fastjson/util/IOUtils;->decodeUTF8([BII[C)I

    move-result v1

    .line 124
    .local v1, "len":I
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0, v3, v1}, Ljava/lang/String;-><init>([CII)V

    invoke-static {v2, p1}, Lcom/alibaba/fastjson/JSON;->parse(Ljava/lang/String;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public static parseArray(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONArray;
    .registers 6
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 392
    if-nez p0, :cond_4

    .line 393
    const/4 v0, 0x0

    .line 415
    :goto_3
    return-object v0

    .line 396
    :cond_4
    new-instance v2, Lcom/alibaba/fastjson/parser/DefaultJSONParser;

    invoke-static {}, Lcom/alibaba/fastjson/parser/ParserConfig;->getGlobalInstance()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;-><init>(Ljava/lang/String;Lcom/alibaba/fastjson/parser/ParserConfig;)V

    .line 400
    .local v2, "parser":Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    iget-object v1, v2, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 401
    .local v1, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v3

    const/16 v4, 0x8

    if-ne v3, v4, :cond_1f

    .line 402
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 403
    const/4 v0, 0x0

    .line 413
    .local v0, "array":Lcom/alibaba/fastjson/JSONArray;
    :goto_1b
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->close()V

    goto :goto_3

    .line 404
    .end local v0    # "array":Lcom/alibaba/fastjson/JSONArray;
    :cond_1f
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v3

    const/16 v4, 0x14

    if-ne v3, v4, :cond_29

    .line 405
    const/4 v0, 0x0

    .restart local v0    # "array":Lcom/alibaba/fastjson/JSONArray;
    goto :goto_1b

    .line 407
    .end local v0    # "array":Lcom/alibaba/fastjson/JSONArray;
    :cond_29
    new-instance v0, Lcom/alibaba/fastjson/JSONArray;

    invoke-direct {v0}, Lcom/alibaba/fastjson/JSONArray;-><init>()V

    .line 408
    .restart local v0    # "array":Lcom/alibaba/fastjson/JSONArray;
    invoke-virtual {v2, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseArray(Ljava/util/Collection;)V

    .line 410
    invoke-virtual {v2, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->handleResovleTask(Ljava/lang/Object;)V

    goto :goto_1b
.end method

.method public static parseArray(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/List;
    .registers 7
    .param p0, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 419
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    if-nez p0, :cond_4

    .line 420
    const/4 v1, 0x0

    .line 442
    :goto_3
    return-object v1

    .line 425
    :cond_4
    new-instance v2, Lcom/alibaba/fastjson/parser/DefaultJSONParser;

    invoke-static {}, Lcom/alibaba/fastjson/parser/ParserConfig;->getGlobalInstance()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v4

    invoke-direct {v2, p0, v4}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;-><init>(Ljava/lang/String;Lcom/alibaba/fastjson/parser/ParserConfig;)V

    .line 426
    .local v2, "parser":Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    iget-object v0, v2, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 427
    .local v0, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v3

    .line 428
    .local v3, "token":I
    const/16 v4, 0x8

    if-ne v3, v4, :cond_1f

    .line 429
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 430
    const/4 v1, 0x0

    .line 440
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    :goto_1b
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->close()V

    goto :goto_3

    .line 431
    .end local v1    # "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    :cond_1f
    const/16 v4, 0x14

    if-ne v3, v4, :cond_2b

    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->isBlankInput()Z

    move-result v4

    if-eqz v4, :cond_2b

    .line 432
    const/4 v1, 0x0

    .restart local v1    # "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    goto :goto_1b

    .line 434
    .end local v1    # "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    :cond_2b
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 435
    .restart local v1    # "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-virtual {v2, p1, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseArray(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 437
    invoke-virtual {v2, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->handleResovleTask(Ljava/lang/Object;)V

    goto :goto_1b
.end method

.method public static parseArray(Ljava/lang/String;[Ljava/lang/reflect/Type;)Ljava/util/List;
    .registers 6
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "types"    # [Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/reflect/Type;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 446
    if-nez p0, :cond_4

    .line 447
    const/4 v0, 0x0

    .line 464
    :goto_3
    return-object v0

    .line 452
    :cond_4
    new-instance v2, Lcom/alibaba/fastjson/parser/DefaultJSONParser;

    invoke-static {}, Lcom/alibaba/fastjson/parser/ParserConfig;->getGlobalInstance()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;-><init>(Ljava/lang/String;Lcom/alibaba/fastjson/parser/ParserConfig;)V

    .line 453
    .local v2, "parser":Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    invoke-virtual {v2, p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseArray([Ljava/lang/reflect/Type;)[Ljava/lang/Object;

    move-result-object v1

    .line 454
    .local v1, "objectArray":[Ljava/lang/Object;
    if-nez v1, :cond_1b

    .line 455
    const/4 v0, 0x0

    .line 460
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :goto_14
    invoke-virtual {v2, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->handleResovleTask(Ljava/lang/Object;)V

    .line 462
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->close()V

    goto :goto_3

    .line 457
    .end local v0    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :cond_1b
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .restart local v0    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    goto :goto_14
.end method

.method public static parseObject(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONObject;
    .registers 3
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 176
    invoke-static {p0}, Lcom/alibaba/fastjson/JSON;->parse(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 177
    .local v0, "obj":Ljava/lang/Object;
    instance-of v1, v0, Lcom/alibaba/fastjson/JSONObject;

    if-eqz v1, :cond_b

    .line 178
    check-cast v0, Lcom/alibaba/fastjson/JSONObject;

    .line 181
    .end local v0    # "obj":Ljava/lang/Object;
    :goto_a
    return-object v0

    .restart local v0    # "obj":Ljava/lang/Object;
    :cond_b
    invoke-static {v0}, Lcom/alibaba/fastjson/JSON;->toJSON(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/alibaba/fastjson/JSONObject;

    move-object v0, v1

    goto :goto_a
.end method

.method public static varargs parseObject(Ljava/lang/String;[Lcom/alibaba/fastjson/parser/Feature;)Lcom/alibaba/fastjson/JSONObject;
    .registers 3
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "features"    # [Lcom/alibaba/fastjson/parser/Feature;

    .prologue
    .line 172
    invoke-static {p0, p1}, Lcom/alibaba/fastjson/JSON;->parse(Ljava/lang/String;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/JSONObject;

    return-object v0
.end method

.method public static varargs parseObject(Ljava/io/InputStream;Ljava/lang/reflect/Type;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;
    .registers 4
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .param p2, "features"    # [Lcom/alibaba/fastjson/parser/Feature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "Ljava/lang/reflect/Type;",
            "[",
            "Lcom/alibaba/fastjson/parser/Feature;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 354
    sget-object v0, Lcom/alibaba/fastjson/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    invoke-static {p0, v0, p1, p2}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/io/InputStream;Ljava/nio/charset/Charset;Ljava/lang/reflect/Type;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static varargs parseObject(Ljava/io/InputStream;Ljava/nio/charset/Charset;Ljava/lang/reflect/Type;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;
    .registers 12
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .param p2, "type"    # Ljava/lang/reflect/Type;
    .param p3, "features"    # [Lcom/alibaba/fastjson/parser/Feature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "Ljava/nio/charset/Charset;",
            "Ljava/lang/reflect/Type;",
            "[",
            "Lcom/alibaba/fastjson/parser/Feature;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 365
    if-nez p1, :cond_5

    .line 366
    sget-object p1, Lcom/alibaba/fastjson/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    .line 369
    :cond_5
    const/high16 v3, 0x10000

    invoke-static {v3}, Lcom/alibaba/fastjson/JSON;->allocateBytes(I)[B

    move-result-object v0

    .line 370
    .local v0, "bytes":[B
    const/4 v2, 0x0

    .line 372
    .local v2, "offset":I
    :cond_c
    :goto_c
    array-length v3, v0

    sub-int/2addr v3, v2

    invoke-virtual {p0, v0, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v7

    .line 373
    .local v7, "readCount":I
    const/4 v3, -0x1

    if-ne v7, v3, :cond_1d

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    .line 384
    invoke-static/range {v0 .. v5}, Lcom/alibaba/fastjson/JSON;->parseObject([BIILjava/nio/charset/Charset;Ljava/lang/reflect/Type;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 376
    :cond_1d
    add-int/2addr v2, v7

    .line 377
    array-length v3, v0

    if-ne v2, v3, :cond_c

    .line 378
    array-length v3, v0

    mul-int/lit8 v3, v3, 0x3

    div-int/lit8 v3, v3, 0x2

    new-array v6, v3, [B

    .line 379
    .local v6, "newBytes":[B
    array-length v3, v0

    invoke-static {v0, v1, v6, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 380
    move-object v0, v6

    goto :goto_c
.end method

.method public static varargs parseObject(Ljava/lang/String;Lcom/alibaba/fastjson/TypeReference;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;
    .registers 6
    .param p0, "text"    # Ljava/lang/String;
    .param p2, "features"    # [Lcom/alibaba/fastjson/parser/Feature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/alibaba/fastjson/TypeReference",
            "<TT;>;[",
            "Lcom/alibaba/fastjson/parser/Feature;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 186
    .local p1, "type":Lcom/alibaba/fastjson/TypeReference;, "Lcom/alibaba/fastjson/TypeReference<TT;>;"
    iget-object v0, p1, Lcom/alibaba/fastjson/TypeReference;->type:Ljava/lang/reflect/Type;

    sget-object v1, Lcom/alibaba/fastjson/parser/ParserConfig;->global:Lcom/alibaba/fastjson/parser/ParserConfig;

    sget v2, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    invoke-static {p0, v0, v1, v2, p2}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;I[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static parseObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .param p0, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 388
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/alibaba/fastjson/parser/Feature;

    invoke-static {p0, p1, v0}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;Ljava/lang/Class;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static varargs parseObject(Ljava/lang/String;Ljava/lang/Class;Lcom/alibaba/fastjson/parser/deserializer/ParseProcess;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;
    .registers 10
    .param p0, "text"    # Ljava/lang/String;
    .param p2, "processor"    # Lcom/alibaba/fastjson/parser/deserializer/ParseProcess;
    .param p3, "features"    # [Lcom/alibaba/fastjson/parser/Feature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lcom/alibaba/fastjson/parser/deserializer/ParseProcess;",
            "[",
            "Lcom/alibaba/fastjson/parser/Feature;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 196
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    sget-object v2, Lcom/alibaba/fastjson/parser/ParserConfig;->global:Lcom/alibaba/fastjson/parser/ParserConfig;

    sget v4, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/parser/deserializer/ParseProcess;I[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static varargs parseObject(Ljava/lang/String;Ljava/lang/Class;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;
    .registers 9
    .param p0, "text"    # Ljava/lang/String;
    .param p2, "features"    # [Lcom/alibaba/fastjson/parser/Feature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;[",
            "Lcom/alibaba/fastjson/parser/Feature;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 191
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    sget-object v2, Lcom/alibaba/fastjson/parser/ParserConfig;->global:Lcom/alibaba/fastjson/parser/ParserConfig;

    const/4 v3, 0x0

    sget v4, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    move-object v0, p0

    move-object v1, p1

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/parser/deserializer/ParseProcess;I[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static varargs parseObject(Ljava/lang/String;Ljava/lang/reflect/Type;I[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;
    .registers 10
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "clazz"    # Ljava/lang/reflect/Type;
    .param p2, "featureValues"    # I
    .param p3, "features"    # [Lcom/alibaba/fastjson/parser/Feature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Type;",
            "I[",
            "Lcom/alibaba/fastjson/parser/Feature;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 212
    if-nez p0, :cond_4

    .line 213
    const/4 v2, 0x0

    .line 227
    :goto_3
    return-object v2

    .line 216
    :cond_4
    array-length v4, p3

    const/4 v3, 0x0

    :goto_6
    if-ge v3, v4, :cond_12

    aget-object v0, p3, v3

    .line 217
    .local v0, "feature":Lcom/alibaba/fastjson/parser/Feature;
    const/4 v5, 0x1

    invoke-static {p2, v0, v5}, Lcom/alibaba/fastjson/parser/Feature;->config(ILcom/alibaba/fastjson/parser/Feature;Z)I

    move-result p2

    .line 216
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 220
    .end local v0    # "feature":Lcom/alibaba/fastjson/parser/Feature;
    :cond_12
    new-instance v1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;

    invoke-static {}, Lcom/alibaba/fastjson/parser/ParserConfig;->getGlobalInstance()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v3

    invoke-direct {v1, p0, v3, p2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;-><init>(Ljava/lang/String;Lcom/alibaba/fastjson/parser/ParserConfig;I)V

    .line 221
    .local v1, "parser":Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    invoke-virtual {v1, p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseObject(Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v2

    .line 223
    .local v2, "value":Ljava/lang/Object;, "TT;"
    invoke-virtual {v1, v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->handleResovleTask(Ljava/lang/Object;)V

    .line 225
    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->close()V

    goto :goto_3
.end method

.method public static varargs parseObject(Ljava/lang/String;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;I[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;
    .registers 11
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "clazz"    # Ljava/lang/reflect/Type;
    .param p2, "config"    # Lcom/alibaba/fastjson/parser/ParserConfig;
    .param p3, "featureValues"    # I
    .param p4, "features"    # [Lcom/alibaba/fastjson/parser/Feature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Type;",
            "Lcom/alibaba/fastjson/parser/ParserConfig;",
            "I[",
            "Lcom/alibaba/fastjson/parser/Feature;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 239
    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v4, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/parser/deserializer/ParseProcess;I[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static varargs parseObject(Ljava/lang/String;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/parser/deserializer/ParseProcess;I[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;
    .registers 12
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "clazz"    # Ljava/lang/reflect/Type;
    .param p2, "config"    # Lcom/alibaba/fastjson/parser/ParserConfig;
    .param p3, "processor"    # Lcom/alibaba/fastjson/parser/deserializer/ParseProcess;
    .param p4, "featureValues"    # I
    .param p5, "features"    # [Lcom/alibaba/fastjson/parser/Feature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Type;",
            "Lcom/alibaba/fastjson/parser/ParserConfig;",
            "Lcom/alibaba/fastjson/parser/deserializer/ParseProcess;",
            "I[",
            "Lcom/alibaba/fastjson/parser/Feature;",
            ")TT;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 245
    if-nez p0, :cond_4

    .line 277
    .end local p3    # "processor":Lcom/alibaba/fastjson/parser/deserializer/ParseProcess;
    :goto_3
    return-object v2

    .line 249
    .restart local p3    # "processor":Lcom/alibaba/fastjson/parser/deserializer/ParseProcess;
    :cond_4
    if-eqz p5, :cond_12

    .line 250
    array-length v4, p5

    const/4 v3, 0x0

    :goto_8
    if-ge v3, v4, :cond_12

    aget-object v0, p5, v3

    .line 251
    .local v0, "feature":Lcom/alibaba/fastjson/parser/Feature;
    iget v5, v0, Lcom/alibaba/fastjson/parser/Feature;->mask:I

    or-int/2addr p4, v5

    .line 250
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 255
    .end local v0    # "feature":Lcom/alibaba/fastjson/parser/Feature;
    :cond_12
    new-instance v1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;

    invoke-direct {v1, p0, p2, p4}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;-><init>(Ljava/lang/String;Lcom/alibaba/fastjson/parser/ParserConfig;I)V

    .line 257
    .local v1, "parser":Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    if-eqz p3, :cond_3e

    .line 258
    instance-of v3, p3, Lcom/alibaba/fastjson/parser/deserializer/ExtraTypeProvider;

    if-eqz v3, :cond_27

    .line 259
    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getExtraTypeProviders()Ljava/util/List;

    move-result-object v4

    move-object v3, p3

    check-cast v3, Lcom/alibaba/fastjson/parser/deserializer/ExtraTypeProvider;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 262
    :cond_27
    instance-of v3, p3, Lcom/alibaba/fastjson/parser/deserializer/ExtraProcessor;

    if-eqz v3, :cond_35

    .line 263
    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getExtraProcessors()Ljava/util/List;

    move-result-object v4

    move-object v3, p3

    check-cast v3, Lcom/alibaba/fastjson/parser/deserializer/ExtraProcessor;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 266
    :cond_35
    instance-of v3, p3, Lcom/alibaba/fastjson/parser/deserializer/FieldTypeResolver;

    if-eqz v3, :cond_3e

    .line 267
    check-cast p3, Lcom/alibaba/fastjson/parser/deserializer/FieldTypeResolver;

    .end local p3    # "processor":Lcom/alibaba/fastjson/parser/deserializer/ParseProcess;
    invoke-virtual {v1, p3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setFieldTypeResolver(Lcom/alibaba/fastjson/parser/deserializer/FieldTypeResolver;)V

    .line 271
    :cond_3e
    invoke-virtual {v1, p1, v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseObject(Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 273
    .local v2, "value":Ljava/lang/Object;, "TT;"
    invoke-virtual {v1, v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->handleResovleTask(Ljava/lang/Object;)V

    .line 275
    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->close()V

    goto :goto_3
.end method

.method public static varargs parseObject(Ljava/lang/String;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;
    .registers 10
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "clazz"    # Ljava/lang/reflect/Type;
    .param p2, "config"    # Lcom/alibaba/fastjson/parser/ParserConfig;
    .param p3, "features"    # [Lcom/alibaba/fastjson/parser/Feature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Type;",
            "Lcom/alibaba/fastjson/parser/ParserConfig;",
            "[",
            "Lcom/alibaba/fastjson/parser/Feature;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 234
    const/4 v3, 0x0

    sget v4, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/parser/deserializer/ParseProcess;I[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static varargs parseObject(Ljava/lang/String;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/deserializer/ParseProcess;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;
    .registers 10
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "clazz"    # Ljava/lang/reflect/Type;
    .param p2, "processor"    # Lcom/alibaba/fastjson/parser/deserializer/ParseProcess;
    .param p3, "features"    # [Lcom/alibaba/fastjson/parser/Feature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Type;",
            "Lcom/alibaba/fastjson/parser/deserializer/ParseProcess;",
            "[",
            "Lcom/alibaba/fastjson/parser/Feature;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 207
    sget-object v2, Lcom/alibaba/fastjson/parser/ParserConfig;->global:Lcom/alibaba/fastjson/parser/ParserConfig;

    sget v4, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/parser/deserializer/ParseProcess;I[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static varargs parseObject(Ljava/lang/String;Ljava/lang/reflect/Type;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;
    .registers 5
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "clazz"    # Ljava/lang/reflect/Type;
    .param p2, "features"    # [Lcom/alibaba/fastjson/parser/Feature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Type;",
            "[",
            "Lcom/alibaba/fastjson/parser/Feature;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 202
    sget-object v0, Lcom/alibaba/fastjson/parser/ParserConfig;->global:Lcom/alibaba/fastjson/parser/ParserConfig;

    sget v1, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    invoke-static {p0, p1, v0, v1, p2}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;I[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static varargs parseObject([BIILjava/nio/charset/Charset;Ljava/lang/reflect/Type;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;
    .registers 10
    .param p0, "bytes"    # [B
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "charset"    # Ljava/nio/charset/Charset;
    .param p4, "clazz"    # Ljava/lang/reflect/Type;
    .param p5, "features"    # [Lcom/alibaba/fastjson/parser/Feature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([BII",
            "Ljava/nio/charset/Charset;",
            "Ljava/lang/reflect/Type;",
            "[",
            "Lcom/alibaba/fastjson/parser/Feature;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 290
    if-nez p3, :cond_4

    .line 291
    sget-object p3, Lcom/alibaba/fastjson/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    .line 295
    :cond_4
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    if-ne p3, v3, :cond_1c

    .line 296
    array-length v3, p0

    invoke-static {v3}, Lcom/alibaba/fastjson/JSON;->allocateChars(I)[C

    move-result-object v0

    .line 297
    .local v0, "chars":[C
    invoke-static {p0, p1, p2, v0}, Lcom/alibaba/fastjson/util/IOUtils;->decodeUTF8([BII[C)I

    move-result v1

    .line 298
    .local v1, "chars_len":I
    new-instance v2, Ljava/lang/String;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v3, v1}, Ljava/lang/String;-><init>([CII)V

    .line 302
    .end local v0    # "chars":[C
    .end local v1    # "chars_len":I
    .local v2, "strVal":Ljava/lang/String;
    :goto_17
    invoke-static {v2, p4, p5}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;Ljava/lang/reflect/Type;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;

    move-result-object v3

    return-object v3

    .line 300
    .end local v2    # "strVal":Ljava/lang/String;
    :cond_1c
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p0, p1, p2, p3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .restart local v2    # "strVal":Ljava/lang/String;
    goto :goto_17
.end method

.method public static varargs parseObject([BIILjava/nio/charset/CharsetDecoder;Ljava/lang/reflect/Type;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;
    .registers 15
    .param p0, "input"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "charsetDecoder"    # Ljava/nio/charset/CharsetDecoder;
    .param p4, "clazz"    # Ljava/lang/reflect/Type;
    .param p5, "features"    # [Lcom/alibaba/fastjson/parser/Feature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([BII",
            "Ljava/nio/charset/CharsetDecoder;",
            "Ljava/lang/reflect/Type;",
            "[",
            "Lcom/alibaba/fastjson/parser/Feature;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 312
    invoke-virtual {p3}, Ljava/nio/charset/CharsetDecoder;->reset()Ljava/nio/charset/CharsetDecoder;

    .line 314
    int-to-double v5, p2

    invoke-virtual {p3}, Ljava/nio/charset/CharsetDecoder;->maxCharsPerByte()F

    move-result v7

    float-to-double v7, v7

    mul-double/2addr v5, v7

    double-to-int v4, v5

    .line 315
    .local v4, "scaleLength":I
    invoke-static {v4}, Lcom/alibaba/fastjson/JSON;->allocateChars(I)[C

    move-result-object v2

    .line 317
    .local v2, "chars":[C
    invoke-static {p0, p1, p2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 318
    .local v0, "byteBuf":Ljava/nio/ByteBuffer;
    invoke-static {v2}, Ljava/nio/CharBuffer;->wrap([C)Ljava/nio/CharBuffer;

    move-result-object v1

    .line 319
    .local v1, "charByte":Ljava/nio/CharBuffer;
    invoke-static {p3, v0, v1}, Lcom/alibaba/fastjson/util/IOUtils;->decode(Ljava/nio/charset/CharsetDecoder;Ljava/nio/ByteBuffer;Ljava/nio/CharBuffer;)V

    .line 321
    invoke-virtual {v1}, Ljava/nio/CharBuffer;->position()I

    move-result v3

    .line 323
    .local v3, "position":I
    invoke-static {v2, v3, p4, p5}, Lcom/alibaba/fastjson/JSON;->parseObject([CILjava/lang/reflect/Type;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;

    move-result-object v5

    return-object v5
.end method

.method public static varargs parseObject([BLjava/lang/reflect/Type;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;
    .registers 9
    .param p0, "bytes"    # [B
    .param p1, "clazz"    # Ljava/lang/reflect/Type;
    .param p2, "features"    # [Lcom/alibaba/fastjson/parser/Feature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([B",
            "Ljava/lang/reflect/Type;",
            "[",
            "Lcom/alibaba/fastjson/parser/Feature;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 282
    const/4 v1, 0x0

    array-length v2, p0

    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    move-object v0, p0

    move-object v4, p1

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Lcom/alibaba/fastjson/JSON;->parseObject([BIILjava/nio/charset/Charset;Ljava/lang/reflect/Type;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static varargs parseObject([CILjava/lang/reflect/Type;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;
    .registers 11
    .param p0, "input"    # [C
    .param p1, "length"    # I
    .param p2, "clazz"    # Ljava/lang/reflect/Type;
    .param p3, "features"    # [Lcom/alibaba/fastjson/parser/Feature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([CI",
            "Ljava/lang/reflect/Type;",
            "[",
            "Lcom/alibaba/fastjson/parser/Feature;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 328
    if-eqz p0, :cond_5

    array-length v4, p0

    if-nez v4, :cond_7

    .line 329
    :cond_5
    const/4 v3, 0x0

    .line 344
    :goto_6
    return-object v3

    .line 332
    :cond_7
    sget v1, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    .line 333
    .local v1, "featureValues":I
    array-length v5, p3

    const/4 v4, 0x0

    :goto_b
    if-ge v4, v5, :cond_17

    aget-object v0, p3, v4

    .line 334
    .local v0, "feature":Lcom/alibaba/fastjson/parser/Feature;
    const/4 v6, 0x1

    invoke-static {v1, v0, v6}, Lcom/alibaba/fastjson/parser/Feature;->config(ILcom/alibaba/fastjson/parser/Feature;Z)I

    move-result v1

    .line 333
    add-int/lit8 v4, v4, 0x1

    goto :goto_b

    .line 337
    .end local v0    # "feature":Lcom/alibaba/fastjson/parser/Feature;
    :cond_17
    new-instance v2, Lcom/alibaba/fastjson/parser/DefaultJSONParser;

    invoke-static {}, Lcom/alibaba/fastjson/parser/ParserConfig;->getGlobalInstance()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v4

    invoke-direct {v2, p0, p1, v4, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;-><init>([CILcom/alibaba/fastjson/parser/ParserConfig;I)V

    .line 338
    .local v2, "parser":Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    invoke-virtual {v2, p2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseObject(Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v3

    .line 340
    .local v3, "value":Ljava/lang/Object;, "TT;"
    invoke-virtual {v2, v3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->handleResovleTask(Ljava/lang/Object;)V

    .line 342
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->close()V

    goto :goto_6
.end method

.method public static toJSON(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p0, "javaObject"    # Ljava/lang/Object;

    .prologue
    .line 744
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->globalInstance:Lcom/alibaba/fastjson/serializer/SerializeConfig;

    invoke-static {p0, v0}, Lcom/alibaba/fastjson/JSON;->toJSON(Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static toJSON(Ljava/lang/Object;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;
    .registers 3
    .param p0, "javaObject"    # Ljava/lang/Object;
    .param p1, "parserConfig"    # Lcom/alibaba/fastjson/parser/ParserConfig;

    .prologue
    .line 751
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->globalInstance:Lcom/alibaba/fastjson/serializer/SerializeConfig;

    invoke-static {p0, v0}, Lcom/alibaba/fastjson/JSON;->toJSON(Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static toJSON(Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;)Ljava/lang/Object;
    .registers 24
    .param p0, "javaObject"    # Ljava/lang/Object;
    .param p1, "config"    # Lcom/alibaba/fastjson/serializer/SerializeConfig;

    .prologue
    .line 756
    if-nez p0, :cond_5

    .line 757
    const/16 p0, 0x0

    .line 832
    .end local p0    # "javaObject":Ljava/lang/Object;
    :cond_4
    :goto_4
    return-object p0

    .line 760
    .restart local p0    # "javaObject":Ljava/lang/Object;
    :cond_5
    move-object/from16 v0, p0

    instance-of v0, v0, Lcom/alibaba/fastjson/JSON;

    move/from16 v19, v0

    if-nez v19, :cond_4

    .line 764
    move-object/from16 v0, p0

    instance-of v0, v0, Ljava/util/Map;

    move/from16 v19, v0

    if-eqz v19, :cond_4f

    move-object/from16 v16, p0

    .line 765
    check-cast v16, Ljava/util/Map;

    .line 767
    .local v16, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    new-instance v11, Lcom/alibaba/fastjson/JSONObject;

    invoke-interface/range {v16 .. v16}, Ljava/util/Map;->size()I

    move-result v19

    move/from16 v0, v19

    invoke-direct {v11, v0}, Lcom/alibaba/fastjson/JSONObject;-><init>(I)V

    .line 769
    .local v11, "json":Lcom/alibaba/fastjson/JSONObject;
    invoke-interface/range {v16 .. v16}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_2c
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_4c

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 770
    .local v6, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Object;Ljava/lang/Object;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v14

    .line 771
    .local v14, "key":Ljava/lang/Object;
    invoke-static {v14}, Lcom/alibaba/fastjson/util/TypeUtils;->castToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    .line 772
    .local v12, "jsonKey":Ljava/lang/String;
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lcom/alibaba/fastjson/JSON;->toJSON(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    .line 773
    .local v13, "jsonValue":Ljava/lang/Object;
    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2c

    .end local v6    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Object;Ljava/lang/Object;>;"
    .end local v12    # "jsonKey":Ljava/lang/String;
    .end local v13    # "jsonValue":Ljava/lang/Object;
    .end local v14    # "key":Ljava/lang/Object;
    :cond_4c
    move-object/from16 p0, v11

    .line 776
    goto :goto_4

    .line 779
    .end local v11    # "json":Lcom/alibaba/fastjson/JSONObject;
    .end local v16    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    :cond_4f
    move-object/from16 v0, p0

    instance-of v0, v0, Ljava/util/Collection;

    move/from16 v19, v0

    if-eqz v19, :cond_7f

    move-object/from16 v4, p0

    .line 780
    check-cast v4, Ljava/util/Collection;

    .line 782
    .local v4, "collection":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    new-instance v2, Lcom/alibaba/fastjson/JSONArray;

    invoke-interface {v4}, Ljava/util/Collection;->size()I

    move-result v19

    move/from16 v0, v19

    invoke-direct {v2, v0}, Lcom/alibaba/fastjson/JSONArray;-><init>(I)V

    .line 784
    .local v2, "array":Lcom/alibaba/fastjson/JSONArray;
    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_6a
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_7c

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    .line 785
    .local v9, "item":Ljava/lang/Object;
    invoke-static {v9}, Lcom/alibaba/fastjson/JSON;->toJSON(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    .line 786
    .restart local v13    # "jsonValue":Ljava/lang/Object;
    invoke-virtual {v2, v13}, Lcom/alibaba/fastjson/JSONArray;->add(Ljava/lang/Object;)Z

    goto :goto_6a

    .end local v9    # "item":Ljava/lang/Object;
    .end local v13    # "jsonValue":Ljava/lang/Object;
    :cond_7c
    move-object/from16 p0, v2

    .line 789
    goto :goto_4

    .line 792
    .end local v2    # "array":Lcom/alibaba/fastjson/JSONArray;
    .end local v4    # "collection":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    :cond_7f
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 794
    .local v3, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v3}, Ljava/lang/Class;->isEnum()Z

    move-result v19

    if-eqz v19, :cond_91

    .line 795
    check-cast p0, Ljava/lang/Enum;

    .end local p0    # "javaObject":Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_4

    .line 798
    .restart local p0    # "javaObject":Ljava/lang/Object;
    :cond_91
    invoke-virtual {v3}, Ljava/lang/Class;->isArray()Z

    move-result v19

    if-eqz v19, :cond_b7

    .line 799
    invoke-static/range {p0 .. p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v15

    .line 801
    .local v15, "len":I
    new-instance v2, Lcom/alibaba/fastjson/JSONArray;

    invoke-direct {v2, v15}, Lcom/alibaba/fastjson/JSONArray;-><init>(I)V

    .line 803
    .restart local v2    # "array":Lcom/alibaba/fastjson/JSONArray;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_a1
    if-ge v8, v15, :cond_b3

    .line 804
    move-object/from16 v0, p0

    invoke-static {v0, v8}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v9

    .line 805
    .restart local v9    # "item":Ljava/lang/Object;
    invoke-static {v9}, Lcom/alibaba/fastjson/JSON;->toJSON(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    .line 806
    .restart local v13    # "jsonValue":Ljava/lang/Object;
    invoke-virtual {v2, v13}, Lcom/alibaba/fastjson/JSONArray;->add(Ljava/lang/Object;)Z

    .line 803
    add-int/lit8 v8, v8, 0x1

    goto :goto_a1

    .end local v9    # "item":Ljava/lang/Object;
    .end local v13    # "jsonValue":Ljava/lang/Object;
    :cond_b3
    move-object/from16 p0, v2

    .line 809
    goto/16 :goto_4

    .line 812
    .end local v2    # "array":Lcom/alibaba/fastjson/JSONArray;
    .end local v8    # "i":I
    .end local v15    # "len":I
    :cond_b7
    invoke-static {v3}, Lcom/alibaba/fastjson/parser/ParserConfig;->isPrimitive(Ljava/lang/Class;)Z

    move-result v19

    if-nez v19, :cond_4

    .line 816
    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->getObjectWriter(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    move-result-object v17

    .line 817
    .local v17, "serializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    move-object/from16 v0, v17

    instance-of v0, v0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;

    move/from16 v19, v0

    if-eqz v19, :cond_115

    move-object/from16 v10, v17

    .line 818
    check-cast v10, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;

    .line 820
    .local v10, "javaBeanSerializer":Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;
    new-instance v11, Lcom/alibaba/fastjson/JSONObject;

    invoke-direct {v11}, Lcom/alibaba/fastjson/JSONObject;-><init>()V

    .line 822
    .restart local v11    # "json":Lcom/alibaba/fastjson/JSONObject;
    :try_start_d4
    move-object/from16 v0, p0

    invoke-virtual {v10, v0}, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->getFieldValuesMap(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v18

    .line 823
    .local v18, "values":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface/range {v18 .. v18}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :goto_e2
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_111

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .line 824
    .local v7, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lcom/alibaba/fastjson/JSON;->toJSON(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v11, v0, v1}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_103
    .catch Ljava/lang/Exception; {:try_start_d4 .. :try_end_103} :catch_104

    goto :goto_e2

    .line 826
    .end local v7    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v18    # "values":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :catch_104
    move-exception v5

    .line 827
    .local v5, "e":Ljava/lang/Exception;
    new-instance v19, Lcom/alibaba/fastjson/JSONException;

    const-string v20, "toJSON error"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v0, v1, v5}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v19

    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v18    # "values":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_111
    move-object/from16 p0, v11

    .line 829
    goto/16 :goto_4

    .line 832
    .end local v10    # "javaBeanSerializer":Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;
    .end local v11    # "json":Lcom/alibaba/fastjson/JSONObject;
    .end local v18    # "values":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_115
    const/16 p0, 0x0

    goto/16 :goto_4
.end method

.method public static varargs toJSONBytes(Ljava/lang/Object;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)[B
    .registers 4
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "defaultFeatures"    # I
    .param p2, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 515
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->globalInstance:Lcom/alibaba/fastjson/serializer/SerializeConfig;

    invoke-static {p0, v0, p1, p2}, Lcom/alibaba/fastjson/JSON;->toJSONBytes(Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)[B

    move-result-object v0

    return-object v0
.end method

.method public static varargs toJSONBytes(Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)[B
    .registers 7
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "config"    # Lcom/alibaba/fastjson/serializer/SerializeConfig;
    .param p2, "defaultFeatures"    # I
    .param p3, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 585
    new-instance v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;

    const/4 v2, 0x0

    invoke-direct {v0, v2, p2, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>(Ljava/io/Writer;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 588
    .local v0, "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    :try_start_6
    new-instance v1, Lcom/alibaba/fastjson/serializer/JSONSerializer;

    invoke-direct {v1, v0, p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;-><init>(Lcom/alibaba/fastjson/serializer/SerializeWriter;Lcom/alibaba/fastjson/serializer/SerializeConfig;)V

    .line 589
    .local v1, "serializer":Lcom/alibaba/fastjson/serializer/JSONSerializer;
    invoke-virtual {v1, p0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    .line 590
    sget-object v2, Lcom/alibaba/fastjson/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->toBytes(Ljava/nio/charset/Charset;)[B
    :try_end_13
    .catchall {:try_start_6 .. :try_end_13} :catchall_18

    move-result-object v2

    .line 592
    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->close()V

    return-object v2

    .end local v1    # "serializer":Lcom/alibaba/fastjson/serializer/JSONSerializer;
    :catchall_18
    move-exception v2

    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->close()V

    throw v2
.end method

.method public static varargs toJSONBytes(Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)[B
    .registers 4
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "config"    # Lcom/alibaba/fastjson/serializer/SerializeConfig;
    .param p2, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 578
    sget v0, Lcom/alibaba/fastjson/JSON;->DEFAULT_GENERATE_FEATURE:I

    invoke-static {p0, p1, v0, p2}, Lcom/alibaba/fastjson/JSON;->toJSONBytes(Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)[B

    move-result-object v0

    return-object v0
.end method

.method public static varargs toJSONBytes(Ljava/lang/Object;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)[B
    .registers 3
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 508
    sget v0, Lcom/alibaba/fastjson/JSON;->DEFAULT_GENERATE_FEATURE:I

    invoke-static {p0, v0, p1}, Lcom/alibaba/fastjson/JSON;->toJSONBytes(Ljava/lang/Object;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)[B

    move-result-object v0

    return-object v0
.end method

.method public static toJSONString(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p0, "object"    # Ljava/lang/Object;

    .prologue
    .line 469
    sget-object v0, Lcom/alibaba/fastjson/JSON;->emptyFilters:[Lcom/alibaba/fastjson/serializer/SerializeFilter;

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-static {p0, v0, v1}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;[Lcom/alibaba/fastjson/serializer/SerializeFilter;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static varargs toJSONString(Ljava/lang/Object;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)Ljava/lang/String;
    .registers 6
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "defaultFeatures"    # I
    .param p2, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 480
    new-instance v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;

    const/4 v2, 0x0

    check-cast v2, Ljava/io/Writer;

    invoke-direct {v0, v2, p1, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>(Ljava/io/Writer;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 483
    .local v0, "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    :try_start_8
    new-instance v1, Lcom/alibaba/fastjson/serializer/JSONSerializer;

    invoke-direct {v1, v0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;-><init>(Lcom/alibaba/fastjson/serializer/SerializeWriter;)V

    .line 484
    .local v1, "serializer":Lcom/alibaba/fastjson/serializer/JSONSerializer;
    invoke-virtual {v1, p0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    .line 485
    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->toString()Ljava/lang/String;
    :try_end_13
    .catchall {:try_start_8 .. :try_end_13} :catchall_18

    move-result-object v2

    .line 487
    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->close()V

    return-object v2

    .end local v1    # "serializer":Lcom/alibaba/fastjson/serializer/JSONSerializer;
    :catchall_18
    move-exception v2

    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->close()V

    throw v2
.end method

.method public static varargs toJSONString(Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;Lcom/alibaba/fastjson/serializer/SerializeFilter;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)Ljava/lang/String;
    .registers 10
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "config"    # Lcom/alibaba/fastjson/serializer/SerializeConfig;
    .param p2, "filter"    # Lcom/alibaba/fastjson/serializer/SerializeFilter;
    .param p3, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 526
    const/4 v0, 0x1

    new-array v2, v0, [Lcom/alibaba/fastjson/serializer/SerializeFilter;

    const/4 v0, 0x0

    aput-object p2, v2, v0

    const/4 v3, 0x0

    sget v4, Lcom/alibaba/fastjson/JSON;->DEFAULT_GENERATE_FEATURE:I

    move-object v0, p0

    move-object v1, p1

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;[Lcom/alibaba/fastjson/serializer/SerializeFilter;Ljava/lang/String;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static varargs toJSONString(Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;[Lcom/alibaba/fastjson/serializer/SerializeFilter;Ljava/lang/String;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)Ljava/lang/String;
    .registers 11
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "config"    # Lcom/alibaba/fastjson/serializer/SerializeConfig;
    .param p2, "filters"    # [Lcom/alibaba/fastjson/serializer/SerializeFilter;
    .param p3, "dateFormat"    # Ljava/lang/String;
    .param p4, "defaultFeatures"    # I
    .param p5, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 546
    new-instance v1, Lcom/alibaba/fastjson/serializer/SerializeWriter;

    const/4 v3, 0x0

    invoke-direct {v1, v3, p4, p5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>(Ljava/io/Writer;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 549
    .local v1, "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    :try_start_6
    new-instance v2, Lcom/alibaba/fastjson/serializer/JSONSerializer;

    invoke-direct {v2, v1, p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;-><init>(Lcom/alibaba/fastjson/serializer/SerializeWriter;Lcom/alibaba/fastjson/serializer/SerializeConfig;)V

    .line 551
    .local v2, "serializer":Lcom/alibaba/fastjson/serializer/JSONSerializer;
    if-eqz p3, :cond_1c

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_1c

    .line 552
    invoke-virtual {v2, p3}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->setDateFormat(Ljava/lang/String;)V

    .line 553
    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteDateUseDateFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->config(Lcom/alibaba/fastjson/serializer/SerializerFeature;Z)V

    .line 556
    :cond_1c
    if-eqz p2, :cond_2a

    .line 557
    array-length v4, p2

    const/4 v3, 0x0

    :goto_20
    if-ge v3, v4, :cond_2a

    aget-object v0, p2, v3

    .line 558
    .local v0, "filter":Lcom/alibaba/fastjson/serializer/SerializeFilter;
    invoke-virtual {v2, v0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->addFilter(Lcom/alibaba/fastjson/serializer/SerializeFilter;)V

    .line 557
    add-int/lit8 v3, v3, 0x1

    goto :goto_20

    .line 562
    .end local v0    # "filter":Lcom/alibaba/fastjson/serializer/SerializeFilter;
    :cond_2a
    invoke-virtual {v2, p0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    .line 564
    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->toString()Ljava/lang/String;
    :try_end_30
    .catchall {:try_start_6 .. :try_end_30} :catchall_35

    move-result-object v3

    .line 566
    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->close()V

    return-object v3

    .end local v2    # "serializer":Lcom/alibaba/fastjson/serializer/JSONSerializer;
    :catchall_35
    move-exception v3

    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->close()V

    throw v3
.end method

.method public static varargs toJSONString(Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;[Lcom/alibaba/fastjson/serializer/SerializeFilter;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)Ljava/lang/String;
    .registers 10
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "config"    # Lcom/alibaba/fastjson/serializer/SerializeConfig;
    .param p2, "filters"    # [Lcom/alibaba/fastjson/serializer/SerializeFilter;
    .param p3, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 533
    const/4 v3, 0x0

    sget v4, Lcom/alibaba/fastjson/JSON;->DEFAULT_GENERATE_FEATURE:I

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;[Lcom/alibaba/fastjson/serializer/SerializeFilter;Ljava/lang/String;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static varargs toJSONString(Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)Ljava/lang/String;
    .registers 4
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "config"    # Lcom/alibaba/fastjson/serializer/SerializeConfig;
    .param p2, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 519
    const/4 v0, 0x0

    check-cast v0, Lcom/alibaba/fastjson/serializer/SerializeFilter;

    invoke-static {p0, p1, v0, p2}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;Lcom/alibaba/fastjson/serializer/SerializeFilter;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static varargs toJSONString(Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeFilter;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)Ljava/lang/String;
    .registers 9
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "filter"    # Lcom/alibaba/fastjson/serializer/SerializeFilter;
    .param p2, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 500
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializeConfig;->globalInstance:Lcom/alibaba/fastjson/serializer/SerializeConfig;

    const/4 v0, 0x1

    new-array v2, v0, [Lcom/alibaba/fastjson/serializer/SerializeFilter;

    const/4 v0, 0x0

    aput-object p1, v2, v0

    const/4 v3, 0x0

    sget v4, Lcom/alibaba/fastjson/JSON;->DEFAULT_GENERATE_FEATURE:I

    move-object v0, p0

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;[Lcom/alibaba/fastjson/serializer/SerializeFilter;Ljava/lang/String;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toJSONString(Ljava/lang/Object;Z)Ljava/lang/String;
    .registers 5
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "prettyFormat"    # Z

    .prologue
    .line 597
    if-nez p1, :cond_7

    .line 598
    invoke-static {p0}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 601
    :goto_6
    return-object v0

    :cond_7
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    const/4 v1, 0x0

    sget-object v2, Lcom/alibaba/fastjson/serializer/SerializerFeature;->PrettyFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    aput-object v2, v0, v1

    invoke-static {p0, v0}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public static varargs toJSONString(Ljava/lang/Object;[Lcom/alibaba/fastjson/serializer/SerializeFilter;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)Ljava/lang/String;
    .registers 9
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "filters"    # [Lcom/alibaba/fastjson/serializer/SerializeFilter;
    .param p2, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 504
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializeConfig;->globalInstance:Lcom/alibaba/fastjson/serializer/SerializeConfig;

    const/4 v3, 0x0

    sget v4, Lcom/alibaba/fastjson/JSON;->DEFAULT_GENERATE_FEATURE:I

    move-object v0, p0

    move-object v2, p1

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;[Lcom/alibaba/fastjson/serializer/SerializeFilter;Ljava/lang/String;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static varargs toJSONString(Ljava/lang/Object;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)Ljava/lang/String;
    .registers 3
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 473
    sget v0, Lcom/alibaba/fastjson/JSON;->DEFAULT_GENERATE_FEATURE:I

    invoke-static {p0, v0, p1}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static varargs toJSONStringWithDateFormat(Ljava/lang/Object;Ljava/lang/String;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)Ljava/lang/String;
    .registers 9
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "dateFormat"    # Ljava/lang/String;
    .param p2, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 496
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializeConfig;->globalInstance:Lcom/alibaba/fastjson/serializer/SerializeConfig;

    const/4 v2, 0x0

    sget v4, Lcom/alibaba/fastjson/JSON;->DEFAULT_GENERATE_FEATURE:I

    move-object v0, p0

    move-object v3, p1

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;[Lcom/alibaba/fastjson/serializer/SerializeFilter;Ljava/lang/String;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static varargs toJSONStringZ(Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)Ljava/lang/String;
    .registers 9
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "mapping"    # Lcom/alibaba/fastjson/serializer/SerializeConfig;
    .param p2, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 574
    sget-object v2, Lcom/alibaba/fastjson/JSON;->emptyFilters:[Lcom/alibaba/fastjson/serializer/SerializeFilter;

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;[Lcom/alibaba/fastjson/serializer/SerializeFilter;Ljava/lang/String;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toJavaObject(Lcom/alibaba/fastjson/JSON;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .param p0, "json"    # Lcom/alibaba/fastjson/JSON;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/alibaba/fastjson/JSON;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 836
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {}, Lcom/alibaba/fastjson/parser/ParserConfig;->getGlobalInstance()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/alibaba/fastjson/util/TypeUtils;->cast(Ljava/lang/Object;Ljava/lang/Class;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static final varargs writeJSONString(Ljava/io/OutputStream;Ljava/lang/Object;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)I
    .registers 12
    .param p0, "os"    # Ljava/io/OutputStream;
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "defaultFeatures"    # I
    .param p3, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 657
    sget-object v1, Lcom/alibaba/fastjson/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializeConfig;->globalInstance:Lcom/alibaba/fastjson/serializer/SerializeConfig;

    move-object v0, p0

    move-object v2, p1

    move-object v5, v4

    move v6, p2

    move-object v7, p3

    invoke-static/range {v0 .. v7}, Lcom/alibaba/fastjson/JSON;->writeJSONString(Ljava/io/OutputStream;Ljava/nio/charset/Charset;Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;[Lcom/alibaba/fastjson/serializer/SerializeFilter;Ljava/lang/String;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v0

    return v0
.end method

.method public static final varargs writeJSONString(Ljava/io/OutputStream;Ljava/lang/Object;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)I
    .registers 4
    .param p0, "os"    # Ljava/io/OutputStream;
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 647
    sget v0, Lcom/alibaba/fastjson/JSON;->DEFAULT_GENERATE_FEATURE:I

    invoke-static {p0, p1, v0, p2}, Lcom/alibaba/fastjson/JSON;->writeJSONString(Ljava/io/OutputStream;Ljava/lang/Object;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v0

    return v0
.end method

.method public static final varargs writeJSONString(Ljava/io/OutputStream;Ljava/nio/charset/Charset;Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;[Lcom/alibaba/fastjson/serializer/SerializeFilter;Ljava/lang/String;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)I
    .registers 14
    .param p0, "os"    # Ljava/io/OutputStream;
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "config"    # Lcom/alibaba/fastjson/serializer/SerializeConfig;
    .param p4, "filters"    # [Lcom/alibaba/fastjson/serializer/SerializeFilter;
    .param p5, "dateFormat"    # Ljava/lang/String;
    .param p6, "defaultFeatures"    # I
    .param p7, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 689
    new-instance v3, Lcom/alibaba/fastjson/serializer/SerializeWriter;

    const/4 v4, 0x0

    invoke-direct {v3, v4, p6, p7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>(Ljava/io/Writer;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 692
    .local v3, "writer":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    :try_start_6
    new-instance v2, Lcom/alibaba/fastjson/serializer/JSONSerializer;

    invoke-direct {v2, v3, p3}, Lcom/alibaba/fastjson/serializer/JSONSerializer;-><init>(Lcom/alibaba/fastjson/serializer/SerializeWriter;Lcom/alibaba/fastjson/serializer/SerializeConfig;)V

    .line 694
    .local v2, "serializer":Lcom/alibaba/fastjson/serializer/JSONSerializer;
    if-eqz p5, :cond_1c

    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_1c

    .line 695
    invoke-virtual {v2, p5}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->setDateFormat(Ljava/lang/String;)V

    .line 696
    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteDateUseDateFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    const/4 v5, 0x1

    invoke-virtual {v2, v4, v5}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->config(Lcom/alibaba/fastjson/serializer/SerializerFeature;Z)V

    .line 699
    :cond_1c
    if-eqz p4, :cond_2a

    .line 700
    array-length v5, p4

    const/4 v4, 0x0

    :goto_20
    if-ge v4, v5, :cond_2a

    aget-object v0, p4, v4

    .line 701
    .local v0, "filter":Lcom/alibaba/fastjson/serializer/SerializeFilter;
    invoke-virtual {v2, v0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->addFilter(Lcom/alibaba/fastjson/serializer/SerializeFilter;)V

    .line 700
    add-int/lit8 v4, v4, 0x1

    goto :goto_20

    .line 705
    .end local v0    # "filter":Lcom/alibaba/fastjson/serializer/SerializeFilter;
    :cond_2a
    invoke-virtual {v2, p2}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    .line 707
    invoke-virtual {v3, p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeToEx(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)I
    :try_end_30
    .catchall {:try_start_6 .. :try_end_30} :catchall_35

    move-result v1

    .line 710
    .local v1, "len":I
    invoke-virtual {v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->close()V

    return v1

    .end local v1    # "len":I
    .end local v2    # "serializer":Lcom/alibaba/fastjson/serializer/JSONSerializer;
    :catchall_35
    move-exception v4

    invoke-virtual {v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->close()V

    throw v4
.end method

.method public static final varargs writeJSONString(Ljava/io/OutputStream;Ljava/nio/charset/Charset;Ljava/lang/Object;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)I
    .registers 12
    .param p0, "os"    # Ljava/io/OutputStream;
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 671
    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializeConfig;->globalInstance:Lcom/alibaba/fastjson/serializer/SerializeConfig;

    sget v6, Lcom/alibaba/fastjson/JSON;->DEFAULT_GENERATE_FEATURE:I

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, v4

    move-object v7, p3

    invoke-static/range {v0 .. v7}, Lcom/alibaba/fastjson/JSON;->writeJSONString(Ljava/io/OutputStream;Ljava/nio/charset/Charset;Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;[Lcom/alibaba/fastjson/serializer/SerializeFilter;Ljava/lang/String;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v0

    return v0
.end method

.method public static varargs writeJSONString(Ljava/io/Writer;Ljava/lang/Object;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)V
    .registers 7
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "defaultFeatures"    # I
    .param p3, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 626
    new-instance v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-direct {v0, p0, p2, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>(Ljava/io/Writer;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 629
    .local v0, "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    :try_start_5
    new-instance v1, Lcom/alibaba/fastjson/serializer/JSONSerializer;

    invoke-direct {v1, v0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;-><init>(Lcom/alibaba/fastjson/serializer/SerializeWriter;)V

    .line 630
    .local v1, "serializer":Lcom/alibaba/fastjson/serializer/JSONSerializer;
    invoke-virtual {v1, p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V
    :try_end_d
    .catchall {:try_start_5 .. :try_end_d} :catchall_11

    .line 632
    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->close()V

    .line 634
    return-void

    .line 632
    .end local v1    # "serializer":Lcom/alibaba/fastjson/serializer/JSONSerializer;
    :catchall_11
    move-exception v2

    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->close()V

    throw v2
.end method

.method public static varargs writeJSONString(Ljava/io/Writer;Ljava/lang/Object;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)V
    .registers 4
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 619
    sget v0, Lcom/alibaba/fastjson/JSON;->DEFAULT_GENERATE_FEATURE:I

    invoke-static {p0, p1, v0, p2}, Lcom/alibaba/fastjson/JSON;->writeJSONString(Ljava/io/Writer;Ljava/lang/Object;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 620
    return-void
.end method

.method public static varargs writeJSONStringTo(Ljava/lang/Object;Ljava/io/Writer;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)V
    .registers 3
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "writer"    # Ljava/io/Writer;
    .param p2, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 608
    invoke-static {p1, p0, p2}, Lcom/alibaba/fastjson/JSON;->writeJSONString(Ljava/io/Writer;Ljava/lang/Object;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 609
    return-void
.end method


# virtual methods
.method public toJSONString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 721
    new-instance v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>()V

    .line 723
    .local v0, "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    :try_start_5
    new-instance v1, Lcom/alibaba/fastjson/serializer/JSONSerializer;

    invoke-direct {v1, v0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;-><init>(Lcom/alibaba/fastjson/serializer/SerializeWriter;)V

    invoke-virtual {v1, p0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    .line 724
    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->toString()Ljava/lang/String;
    :try_end_10
    .catchall {:try_start_5 .. :try_end_10} :catchall_15

    move-result-object v1

    .line 726
    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->close()V

    return-object v1

    :catchall_15
    move-exception v1

    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->close()V

    throw v1
.end method

.method public toJavaObject(Ljava/lang/Class;)Ljava/lang/Object;
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
    .line 843
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {}, Lcom/alibaba/fastjson/parser/ParserConfig;->getGlobalInstance()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/alibaba/fastjson/util/TypeUtils;->cast(Ljava/lang/Object;Ljava/lang/Class;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 717
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSON;->toJSONString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeJSONString(Ljava/lang/Appendable;)V
    .registers 6
    .param p1, "appendable"    # Ljava/lang/Appendable;

    .prologue
    .line 731
    new-instance v1, Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-direct {v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>()V

    .line 733
    .local v1, "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    :try_start_5
    new-instance v2, Lcom/alibaba/fastjson/serializer/JSONSerializer;

    invoke-direct {v2, v1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;-><init>(Lcom/alibaba/fastjson/serializer/SerializeWriter;)V

    invoke-virtual {v2, p0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    .line 734
    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_14} :catch_18
    .catchall {:try_start_5 .. :try_end_14} :catchall_23

    .line 738
    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->close()V

    .line 740
    return-void

    .line 735
    :catch_18
    move-exception v0

    .line 736
    .local v0, "e":Ljava/io/IOException;
    :try_start_19
    new-instance v2, Lcom/alibaba/fastjson/JSONException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_23
    .catchall {:try_start_19 .. :try_end_23} :catchall_23

    .line 738
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_23
    move-exception v2

    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->close()V

    throw v2
.end method
