.class public Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;
.super Ljava/lang/Object;
.source "BasicHeaderValueParser.java"

# interfaces
.implements Lcz/msebera/android/httpclient/message/HeaderValueParser;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field private static final ALL_DELIMITERS:[C

.field public static final DEFAULT:Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private static final ELEM_DELIMITER:C = ','

.field public static final INSTANCE:Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;

.field private static final PARAM_DELIMITER:C = ';'


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 61
    new-instance v0, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;-><init>()V

    sput-object v0, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->DEFAULT:Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;

    .line 63
    new-instance v0, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;-><init>()V

    sput-object v0, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;

    .line 67
    const/4 v0, 0x2

    new-array v0, v0, [C

    fill-array-data v0, :array_18

    sput-object v0, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->ALL_DELIMITERS:[C

    return-void

    nop

    :array_18
    .array-data 2
        0x3bs
        0x2cs
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    return-void
.end method

.method private static isOneOf(C[C)Z
    .registers 6
    .param p0, "ch"    # C
    .param p1, "chs"    # [C

    .prologue
    const/4 v1, 0x0

    .line 249
    if-eqz p1, :cond_c

    .line 250
    array-length v3, p1

    move v2, v1

    :goto_5
    if-ge v2, v3, :cond_c

    aget-char v0, p1, v2

    .line 251
    .local v0, "ch2":C
    if-ne p0, v0, :cond_d

    .line 252
    const/4 v1, 0x1

    .line 256
    .end local v0    # "ch2":C
    :cond_c
    return v1

    .line 250
    .restart local v0    # "ch2":C
    :cond_d
    add-int/lit8 v2, v2, 0x1

    goto :goto_5
.end method

.method public static parseElements(Ljava/lang/String;Lcz/msebera/android/httpclient/message/HeaderValueParser;)[Lcz/msebera/android/httpclient/HeaderElement;
    .registers 6
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "parser"    # Lcz/msebera/android/httpclient/message/HeaderValueParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/ParseException;
        }
    .end annotation

    .prologue
    .line 87
    const-string v2, "Value"

    invoke-static {p0, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 89
    new-instance v0, Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-direct {v0, v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;-><init>(I)V

    .line 90
    .local v0, "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    invoke-virtual {v0, p0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 91
    new-instance v1, Lcz/msebera/android/httpclient/message/ParserCursor;

    const/4 v2, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-direct {v1, v2, v3}, Lcz/msebera/android/httpclient/message/ParserCursor;-><init>(II)V

    .line 92
    .local v1, "cursor":Lcz/msebera/android/httpclient/message/ParserCursor;
    if-eqz p1, :cond_22

    .line 93
    .end local p1    # "parser":Lcz/msebera/android/httpclient/message/HeaderValueParser;
    :goto_1d
    invoke-interface {p1, v0, v1}, Lcz/msebera/android/httpclient/message/HeaderValueParser;->parseElements(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/message/ParserCursor;)[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v2

    return-object v2

    .line 92
    .restart local p1    # "parser":Lcz/msebera/android/httpclient/message/HeaderValueParser;
    :cond_22
    sget-object p1, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;

    goto :goto_1d
.end method

.method public static parseHeaderElement(Ljava/lang/String;Lcz/msebera/android/httpclient/message/HeaderValueParser;)Lcz/msebera/android/httpclient/HeaderElement;
    .registers 6
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "parser"    # Lcz/msebera/android/httpclient/message/HeaderValueParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/ParseException;
        }
    .end annotation

    .prologue
    .line 124
    const-string v2, "Value"

    invoke-static {p0, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 126
    new-instance v0, Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-direct {v0, v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;-><init>(I)V

    .line 127
    .local v0, "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    invoke-virtual {v0, p0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 128
    new-instance v1, Lcz/msebera/android/httpclient/message/ParserCursor;

    const/4 v2, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-direct {v1, v2, v3}, Lcz/msebera/android/httpclient/message/ParserCursor;-><init>(II)V

    .line 129
    .local v1, "cursor":Lcz/msebera/android/httpclient/message/ParserCursor;
    if-eqz p1, :cond_22

    .line 130
    .end local p1    # "parser":Lcz/msebera/android/httpclient/message/HeaderValueParser;
    :goto_1d
    invoke-interface {p1, v0, v1}, Lcz/msebera/android/httpclient/message/HeaderValueParser;->parseHeaderElement(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/message/ParserCursor;)Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v2

    return-object v2

    .line 129
    .restart local p1    # "parser":Lcz/msebera/android/httpclient/message/HeaderValueParser;
    :cond_22
    sget-object p1, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;

    goto :goto_1d
.end method

.method public static parseNameValuePair(Ljava/lang/String;Lcz/msebera/android/httpclient/message/HeaderValueParser;)Lcz/msebera/android/httpclient/NameValuePair;
    .registers 6
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "parser"    # Lcz/msebera/android/httpclient/message/HeaderValueParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/ParseException;
        }
    .end annotation

    .prologue
    .line 232
    const-string v2, "Value"

    invoke-static {p0, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 234
    new-instance v0, Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-direct {v0, v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;-><init>(I)V

    .line 235
    .local v0, "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    invoke-virtual {v0, p0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 236
    new-instance v1, Lcz/msebera/android/httpclient/message/ParserCursor;

    const/4 v2, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-direct {v1, v2, v3}, Lcz/msebera/android/httpclient/message/ParserCursor;-><init>(II)V

    .line 237
    .local v1, "cursor":Lcz/msebera/android/httpclient/message/ParserCursor;
    if-eqz p1, :cond_22

    .line 238
    .end local p1    # "parser":Lcz/msebera/android/httpclient/message/HeaderValueParser;
    :goto_1d
    invoke-interface {p1, v0, v1}, Lcz/msebera/android/httpclient/message/HeaderValueParser;->parseNameValuePair(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/message/ParserCursor;)Lcz/msebera/android/httpclient/NameValuePair;

    move-result-object v2

    return-object v2

    .line 237
    .restart local p1    # "parser":Lcz/msebera/android/httpclient/message/HeaderValueParser;
    :cond_22
    sget-object p1, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;

    goto :goto_1d
.end method

.method public static parseParameters(Ljava/lang/String;Lcz/msebera/android/httpclient/message/HeaderValueParser;)[Lcz/msebera/android/httpclient/NameValuePair;
    .registers 6
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "parser"    # Lcz/msebera/android/httpclient/message/HeaderValueParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/ParseException;
        }
    .end annotation

    .prologue
    .line 176
    const-string v2, "Value"

    invoke-static {p0, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 178
    new-instance v0, Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-direct {v0, v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;-><init>(I)V

    .line 179
    .local v0, "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    invoke-virtual {v0, p0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 180
    new-instance v1, Lcz/msebera/android/httpclient/message/ParserCursor;

    const/4 v2, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-direct {v1, v2, v3}, Lcz/msebera/android/httpclient/message/ParserCursor;-><init>(II)V

    .line 181
    .local v1, "cursor":Lcz/msebera/android/httpclient/message/ParserCursor;
    if-eqz p1, :cond_22

    .line 182
    .end local p1    # "parser":Lcz/msebera/android/httpclient/message/HeaderValueParser;
    :goto_1d
    invoke-interface {p1, v0, v1}, Lcz/msebera/android/httpclient/message/HeaderValueParser;->parseParameters(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/message/ParserCursor;)[Lcz/msebera/android/httpclient/NameValuePair;

    move-result-object v2

    return-object v2

    .line 181
    .restart local p1    # "parser":Lcz/msebera/android/httpclient/message/HeaderValueParser;
    :cond_22
    sget-object p1, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;

    goto :goto_1d
.end method


# virtual methods
.method protected createHeaderElement(Ljava/lang/String;Ljava/lang/String;[Lcz/msebera/android/httpclient/NameValuePair;)Lcz/msebera/android/httpclient/HeaderElement;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "params"    # [Lcz/msebera/android/httpclient/NameValuePair;

    .prologue
    .line 161
    new-instance v0, Lcz/msebera/android/httpclient/message/BasicHeaderElement;

    invoke-direct {v0, p1, p2, p3}, Lcz/msebera/android/httpclient/message/BasicHeaderElement;-><init>(Ljava/lang/String;Ljava/lang/String;[Lcz/msebera/android/httpclient/NameValuePair;)V

    return-object v0
.end method

.method protected createNameValuePair(Ljava/lang/String;Ljava/lang/String;)Lcz/msebera/android/httpclient/NameValuePair;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 355
    new-instance v0, Lcz/msebera/android/httpclient/message/BasicNameValuePair;

    invoke-direct {v0, p1, p2}, Lcz/msebera/android/httpclient/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public parseElements(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/message/ParserCursor;)[Lcz/msebera/android/httpclient/HeaderElement;
    .registers 6
    .param p1, "buffer"    # Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .param p2, "cursor"    # Lcz/msebera/android/httpclient/message/ParserCursor;

    .prologue
    .line 100
    const-string v2, "Char array buffer"

    invoke-static {p1, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 101
    const-string v2, "Parser cursor"

    invoke-static {p2, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 102
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 103
    .local v1, "elements":Ljava/util/List;, "Ljava/util/List<Lcz/msebera/android/httpclient/HeaderElement;>;"
    :cond_f
    :goto_f
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/message/ParserCursor;->atEnd()Z

    move-result v2

    if-nez v2, :cond_2d

    .line 104
    invoke-virtual {p0, p1, p2}, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->parseHeaderElement(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/message/ParserCursor;)Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v0

    .line 105
    .local v0, "element":Lcz/msebera/android/httpclient/HeaderElement;
    invoke-interface {v0}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_29

    invoke-interface {v0}, Lcz/msebera/android/httpclient/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_f

    .line 106
    :cond_29
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_f

    .line 109
    .end local v0    # "element":Lcz/msebera/android/httpclient/HeaderElement;
    :cond_2d
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Lcz/msebera/android/httpclient/HeaderElement;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcz/msebera/android/httpclient/HeaderElement;

    return-object v2
.end method

.method public parseHeaderElement(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/message/ParserCursor;)Lcz/msebera/android/httpclient/HeaderElement;
    .registers 8
    .param p1, "buffer"    # Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .param p2, "cursor"    # Lcz/msebera/android/httpclient/message/ParserCursor;

    .prologue
    .line 137
    const-string v3, "Char array buffer"

    invoke-static {p1, v3}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 138
    const-string v3, "Parser cursor"

    invoke-static {p2, v3}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 139
    invoke-virtual {p0, p1, p2}, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->parseNameValuePair(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/message/ParserCursor;)Lcz/msebera/android/httpclient/NameValuePair;

    move-result-object v1

    .line 140
    .local v1, "nvp":Lcz/msebera/android/httpclient/NameValuePair;
    const/4 v2, 0x0

    .line 141
    .local v2, "params":[Lcz/msebera/android/httpclient/NameValuePair;
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/message/ParserCursor;->atEnd()Z

    move-result v3

    if-nez v3, :cond_27

    .line 142
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/message/ParserCursor;->getPos()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {p1, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->charAt(I)C

    move-result v0

    .line 143
    .local v0, "ch":C
    const/16 v3, 0x2c

    if-eq v0, v3, :cond_27

    .line 144
    invoke-virtual {p0, p1, p2}, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->parseParameters(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/message/ParserCursor;)[Lcz/msebera/android/httpclient/NameValuePair;

    move-result-object v2

    .line 147
    .end local v0    # "ch":C
    :cond_27
    invoke-interface {v1}, Lcz/msebera/android/httpclient/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1}, Lcz/msebera/android/httpclient/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4, v2}, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->createHeaderElement(Ljava/lang/String;Ljava/lang/String;[Lcz/msebera/android/httpclient/NameValuePair;)Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v3

    return-object v3
.end method

.method public parseNameValuePair(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/message/ParserCursor;)Lcz/msebera/android/httpclient/NameValuePair;
    .registers 4
    .param p1, "buffer"    # Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .param p2, "cursor"    # Lcz/msebera/android/httpclient/message/ParserCursor;

    .prologue
    .line 245
    sget-object v0, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->ALL_DELIMITERS:[C

    invoke-virtual {p0, p1, p2, v0}, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->parseNameValuePair(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/message/ParserCursor;[C)Lcz/msebera/android/httpclient/NameValuePair;

    move-result-object v0

    return-object v0
.end method

.method public parseNameValuePair(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/message/ParserCursor;[C)Lcz/msebera/android/httpclient/NameValuePair;
    .registers 18
    .param p1, "buffer"    # Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .param p2, "cursor"    # Lcz/msebera/android/httpclient/message/ParserCursor;
    .param p3, "delimiters"    # [C

    .prologue
    .line 262
    const-string v12, "Char array buffer"

    invoke-static {p1, v12}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 263
    const-string v12, "Parser cursor"

    move-object/from16 v0, p2

    invoke-static {v0, v12}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 265
    const/4 v10, 0x0

    .line 267
    .local v10, "terminated":Z
    invoke-virtual/range {p2 .. p2}, Lcz/msebera/android/httpclient/message/ParserCursor;->getPos()I

    move-result v8

    .line 268
    .local v8, "pos":I
    invoke-virtual/range {p2 .. p2}, Lcz/msebera/android/httpclient/message/ParserCursor;->getPos()I

    move-result v5

    .line 269
    .local v5, "indexFrom":I
    invoke-virtual/range {p2 .. p2}, Lcz/msebera/android/httpclient/message/ParserCursor;->getUpperBound()I

    move-result v6

    .line 273
    .local v6, "indexTo":I
    :goto_19
    if-ge v8, v6, :cond_23

    .line 274
    invoke-virtual {p1, v8}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->charAt(I)C

    move-result v1

    .line 275
    .local v1, "ch":C
    const/16 v12, 0x3d

    if-ne v1, v12, :cond_37

    .line 285
    .end local v1    # "ch":C
    :cond_23
    :goto_23
    if-ne v8, v6, :cond_44

    .line 286
    const/4 v10, 0x1

    .line 287
    invoke-virtual {p1, v5, v6}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->substringTrimmed(II)Ljava/lang/String;

    move-result-object v7

    .line 293
    .local v7, "name":Ljava/lang/String;
    :goto_2a
    if-eqz v10, :cond_4b

    .line 294
    move-object/from16 v0, p2

    invoke-virtual {v0, v8}, Lcz/msebera/android/httpclient/message/ParserCursor;->updatePos(I)V

    .line 295
    const/4 v12, 0x0

    invoke-virtual {p0, v7, v12}, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->createNameValuePair(Ljava/lang/String;Ljava/lang/String;)Lcz/msebera/android/httpclient/NameValuePair;

    move-result-object v12

    .line 342
    :goto_36
    return-object v12

    .line 278
    .end local v7    # "name":Ljava/lang/String;
    .restart local v1    # "ch":C
    :cond_37
    move-object/from16 v0, p3

    invoke-static {v1, v0}, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->isOneOf(C[C)Z

    move-result v12

    if-eqz v12, :cond_41

    .line 279
    const/4 v10, 0x1

    .line 280
    goto :goto_23

    .line 282
    :cond_41
    add-int/lit8 v8, v8, 0x1

    .line 283
    goto :goto_19

    .line 289
    .end local v1    # "ch":C
    :cond_44
    invoke-virtual {p1, v5, v8}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->substringTrimmed(II)Ljava/lang/String;

    move-result-object v7

    .line 290
    .restart local v7    # "name":Ljava/lang/String;
    add-int/lit8 v8, v8, 0x1

    goto :goto_2a

    .line 300
    :cond_4b
    move v3, v8

    .line 302
    .local v3, "i1":I
    const/4 v9, 0x0

    .line 303
    .local v9, "qouted":Z
    const/4 v2, 0x0

    .line 304
    .local v2, "escaped":Z
    :goto_4e
    if-ge v8, v6, :cond_6a

    .line 305
    invoke-virtual {p1, v8}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->charAt(I)C

    move-result v1

    .line 306
    .restart local v1    # "ch":C
    const/16 v12, 0x22

    if-ne v1, v12, :cond_5d

    if-nez v2, :cond_5d

    .line 307
    if-nez v9, :cond_7a

    const/4 v9, 0x1

    .line 309
    :cond_5d
    :goto_5d
    if-nez v9, :cond_7c

    if-nez v2, :cond_7c

    move-object/from16 v0, p3

    invoke-static {v1, v0}, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->isOneOf(C[C)Z

    move-result v12

    if-eqz v12, :cond_7c

    .line 310
    const/4 v10, 0x1

    .line 321
    .end local v1    # "ch":C
    :cond_6a
    move v4, v8

    .line 323
    .local v4, "i2":I
    :goto_6b
    if-ge v3, v4, :cond_8c

    invoke-virtual {p1, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->charAt(I)C

    move-result v12

    invoke-static {v12}, Lcz/msebera/android/httpclient/protocol/HTTP;->isWhitespace(C)Z

    move-result v12

    if-eqz v12, :cond_8c

    .line 324
    add-int/lit8 v3, v3, 0x1

    goto :goto_6b

    .line 307
    .end local v4    # "i2":I
    .restart local v1    # "ch":C
    :cond_7a
    const/4 v9, 0x0

    goto :goto_5d

    .line 313
    :cond_7c
    if-eqz v2, :cond_82

    .line 314
    const/4 v2, 0x0

    .line 318
    :goto_7f
    add-int/lit8 v8, v8, 0x1

    .line 319
    goto :goto_4e

    .line 316
    :cond_82
    if-eqz v9, :cond_8a

    const/16 v12, 0x5c

    if-ne v1, v12, :cond_8a

    const/4 v2, 0x1

    :goto_89
    goto :goto_7f

    :cond_8a
    const/4 v2, 0x0

    goto :goto_89

    .line 327
    .end local v1    # "ch":C
    .restart local v4    # "i2":I
    :cond_8c
    :goto_8c
    if-le v4, v3, :cond_9d

    add-int/lit8 v12, v4, -0x1

    invoke-virtual {p1, v12}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->charAt(I)C

    move-result v12

    invoke-static {v12}, Lcz/msebera/android/httpclient/protocol/HTTP;->isWhitespace(C)Z

    move-result v12

    if-eqz v12, :cond_9d

    .line 328
    add-int/lit8 v4, v4, -0x1

    goto :goto_8c

    .line 331
    :cond_9d
    sub-int v12, v4, v3

    const/4 v13, 0x2

    if-lt v12, v13, :cond_b8

    .line 332
    invoke-virtual {p1, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->charAt(I)C

    move-result v12

    const/16 v13, 0x22

    if-ne v12, v13, :cond_b8

    add-int/lit8 v12, v4, -0x1

    .line 333
    invoke-virtual {p1, v12}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->charAt(I)C

    move-result v12

    const/16 v13, 0x22

    if-ne v12, v13, :cond_b8

    .line 334
    add-int/lit8 v3, v3, 0x1

    .line 335
    add-int/lit8 v4, v4, -0x1

    .line 337
    :cond_b8
    invoke-virtual {p1, v3, v4}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->substring(II)Ljava/lang/String;

    move-result-object v11

    .line 338
    .local v11, "value":Ljava/lang/String;
    if-eqz v10, :cond_c0

    .line 339
    add-int/lit8 v8, v8, 0x1

    .line 341
    :cond_c0
    move-object/from16 v0, p2

    invoke-virtual {v0, v8}, Lcz/msebera/android/httpclient/message/ParserCursor;->updatePos(I)V

    .line 342
    invoke-virtual {p0, v7, v11}, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->createNameValuePair(Ljava/lang/String;Ljava/lang/String;)Lcz/msebera/android/httpclient/NameValuePair;

    move-result-object v12

    goto/16 :goto_36
.end method

.method public parseParameters(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/message/ParserCursor;)[Lcz/msebera/android/httpclient/NameValuePair;
    .registers 9
    .param p1, "buffer"    # Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .param p2, "cursor"    # Lcz/msebera/android/httpclient/message/ParserCursor;

    .prologue
    .line 190
    const-string v5, "Char array buffer"

    invoke-static {p1, v5}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 191
    const-string v5, "Parser cursor"

    invoke-static {p2, v5}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 192
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/message/ParserCursor;->getPos()I

    move-result v4

    .line 193
    .local v4, "pos":I
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/message/ParserCursor;->getUpperBound()I

    move-result v1

    .line 195
    .local v1, "indexTo":I
    :goto_12
    if-ge v4, v1, :cond_21

    .line 196
    invoke-virtual {p1, v4}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->charAt(I)C

    move-result v0

    .line 197
    .local v0, "ch":C
    invoke-static {v0}, Lcz/msebera/android/httpclient/protocol/HTTP;->isWhitespace(C)Z

    move-result v5

    if-eqz v5, :cond_21

    .line 198
    add-int/lit8 v4, v4, 0x1

    .line 202
    goto :goto_12

    .line 203
    .end local v0    # "ch":C
    :cond_21
    invoke-virtual {p2, v4}, Lcz/msebera/android/httpclient/message/ParserCursor;->updatePos(I)V

    .line 204
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/message/ParserCursor;->atEnd()Z

    move-result v5

    if-eqz v5, :cond_2e

    .line 205
    const/4 v5, 0x0

    new-array v5, v5, [Lcz/msebera/android/httpclient/NameValuePair;

    .line 218
    :goto_2d
    return-object v5

    .line 208
    :cond_2e
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 209
    .local v3, "params":Ljava/util/List;, "Ljava/util/List<Lcz/msebera/android/httpclient/NameValuePair;>;"
    :cond_33
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/message/ParserCursor;->atEnd()Z

    move-result v5

    if-nez v5, :cond_4e

    .line 210
    invoke-virtual {p0, p1, p2}, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->parseNameValuePair(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/message/ParserCursor;)Lcz/msebera/android/httpclient/NameValuePair;

    move-result-object v2

    .line 211
    .local v2, "param":Lcz/msebera/android/httpclient/NameValuePair;
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 212
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/message/ParserCursor;->getPos()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {p1, v5}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->charAt(I)C

    move-result v0

    .line 213
    .restart local v0    # "ch":C
    const/16 v5, 0x2c

    if-ne v0, v5, :cond_33

    .line 218
    .end local v0    # "ch":C
    .end local v2    # "param":Lcz/msebera/android/httpclient/NameValuePair;
    :cond_4e
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Lcz/msebera/android/httpclient/NameValuePair;

    invoke-interface {v3, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lcz/msebera/android/httpclient/NameValuePair;

    goto :goto_2d
.end method
