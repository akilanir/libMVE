.class public Lorg/apache/james/mime4j/util/CharsetUtil;
.super Ljava/lang/Object;
.source "CharsetUtil.java"


# static fields
.field public static final CR:I = 0xd

.field public static final CRLF:Ljava/lang/String; = "\r\n"

.field public static final DEFAULT_CHARSET:Ljava/nio/charset/Charset;

.field public static final HT:I = 0x9

.field public static final ISO_8859_1:Ljava/nio/charset/Charset;

.field public static final LF:I = 0xa

.field public static final SP:I = 0x20

.field public static final US_ASCII:Ljava/nio/charset/Charset;

.field public static final UTF_8:Ljava/nio/charset/Charset;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 46
    const-string v0, "US-ASCII"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lorg/apache/james/mime4j/util/CharsetUtil;->US_ASCII:Ljava/nio/charset/Charset;

    .line 48
    const-string v0, "ISO-8859-1"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lorg/apache/james/mime4j/util/CharsetUtil;->ISO_8859_1:Ljava/nio/charset/Charset;

    .line 50
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lorg/apache/james/mime4j/util/CharsetUtil;->UTF_8:Ljava/nio/charset/Charset;

    .line 52
    sget-object v0, Lorg/apache/james/mime4j/util/CharsetUtil;->US_ASCII:Ljava/nio/charset/Charset;

    sput-object v0, Lorg/apache/james/mime4j/util/CharsetUtil;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isASCII(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 64
    const v0, 0xff80

    and-int/2addr v0, p0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static isASCII(Ljava/lang/String;)Z
    .registers 5
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 77
    if-nez p0, :cond_a

    .line 78
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "String may not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 80
    :cond_a
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 81
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    if-ge v0, v1, :cond_20

    .line 82
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lorg/apache/james/mime4j/util/CharsetUtil;->isASCII(C)Z

    move-result v2

    if-nez v2, :cond_1d

    .line 83
    const/4 v2, 0x0

    .line 86
    :goto_1c
    return v2

    .line 81
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 86
    :cond_20
    const/4 v2, 0x1

    goto :goto_1c
.end method

.method public static isWhitespace(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 99
    const/16 v0, 0x20

    if-eq p0, v0, :cond_10

    const/16 v0, 0x9

    if-eq p0, v0, :cond_10

    const/16 v0, 0xd

    if-eq p0, v0, :cond_10

    const/16 v0, 0xa

    if-ne p0, v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public static isWhitespace(Ljava/lang/String;)Z
    .registers 5
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 112
    if-nez p0, :cond_a

    .line 113
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "String may not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 115
    :cond_a
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 116
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    if-ge v0, v1, :cond_20

    .line 117
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lorg/apache/james/mime4j/util/CharsetUtil;->isWhitespace(C)Z

    move-result v2

    if-nez v2, :cond_1d

    .line 118
    const/4 v2, 0x0

    .line 121
    :goto_1c
    return v2

    .line 116
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 121
    :cond_20
    const/4 v2, 0x1

    goto :goto_1c
.end method

.method public static lookup(Ljava/lang/String;)Ljava/nio/charset/Charset;
    .registers 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 134
    if-nez p0, :cond_4

    .line 142
    :goto_3
    return-object v1

    .line 138
    :cond_4
    :try_start_4
    invoke-static {p0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;
    :try_end_7
    .catch Ljava/nio/charset/IllegalCharsetNameException; {:try_start_4 .. :try_end_7} :catch_9
    .catch Ljava/nio/charset/UnsupportedCharsetException; {:try_start_4 .. :try_end_7} :catch_b

    move-result-object v1

    goto :goto_3

    .line 139
    :catch_9
    move-exception v0

    .line 140
    .local v0, "ex":Ljava/nio/charset/IllegalCharsetNameException;
    goto :goto_3

    .line 141
    .end local v0    # "ex":Ljava/nio/charset/IllegalCharsetNameException;
    :catch_b
    move-exception v0

    .line 142
    .local v0, "ex":Ljava/nio/charset/UnsupportedCharsetException;
    goto :goto_3
.end method
