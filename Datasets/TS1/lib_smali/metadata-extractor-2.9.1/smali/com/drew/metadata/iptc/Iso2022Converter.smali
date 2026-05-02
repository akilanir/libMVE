.class public final Lcom/drew/metadata/iptc/Iso2022Converter;
.super Ljava/lang/Object;
.source "Iso2022Converter.java"


# static fields
.field private static final DOT:I = 0xe280a2

.field private static final ESC:B = 0x1bt

.field private static final ISO_8859_1:Ljava/lang/String; = "ISO-8859-1"

.field private static final LATIN_CAPITAL_A:B = 0x41t

.field private static final LATIN_CAPITAL_G:B = 0x47t

.field private static final PERCENT_SIGN:B = 0x25t

.field private static final UTF_8:Ljava/lang/String; = "UTF-8"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertISO2022CharsetToJavaCharset([B)Ljava/lang/String;
    .registers 8
    .param p0, "bytes"    # [B
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/16 v6, 0x1b

    const/4 v5, 0x3

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x2

    .line 51
    array-length v0, p0

    if-le v0, v2, :cond_1c

    aget-byte v0, p0, v3

    if-ne v0, v6, :cond_1c

    aget-byte v0, p0, v4

    const/16 v1, 0x25

    if-ne v0, v1, :cond_1c

    aget-byte v0, p0, v2

    const/16 v1, 0x47

    if-ne v0, v1, :cond_1c

    .line 52
    const-string v0, "UTF-8"

    .line 57
    :goto_1b
    return-object v0

    .line 54
    :cond_1c
    array-length v0, p0

    if-le v0, v5, :cond_44

    aget-byte v0, p0, v3

    if-ne v0, v6, :cond_44

    aget-byte v0, p0, v5

    and-int/lit16 v0, v0, 0xff

    aget-byte v1, p0, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    aget-byte v1, p0, v4

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    const v1, 0xe280a2

    if-ne v0, v1, :cond_44

    const/4 v0, 0x4

    aget-byte v0, p0, v0

    const/16 v1, 0x41

    if-ne v0, v1, :cond_44

    .line 55
    const-string v0, "ISO-8859-1"

    goto :goto_1b

    .line 57
    :cond_44
    const/4 v0, 0x0

    goto :goto_1b
.end method

.method static guessEncoding([B)Ljava/lang/String;
    .registers 9
    .param p0, "bytes"    # [B
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 83
    const/4 v6, 0x3

    new-array v3, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "UTF-8"

    aput-object v7, v3, v6

    const/4 v6, 0x1

    const-string v7, "file.encoding"

    invoke-static {v7}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v6

    const/4 v6, 0x2

    const-string v7, "ISO-8859-1"

    aput-object v7, v3, v6

    .line 85
    .local v3, "encodings":[Ljava/lang/String;
    move-object v0, v3

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_19
    if-ge v4, v5, :cond_31

    aget-object v2, v0, v4

    .line 87
    .local v2, "encoding":Ljava/lang/String;
    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v6

    invoke-virtual {v6}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v1

    .line 90
    .local v1, "cs":Ljava/nio/charset/CharsetDecoder;
    :try_start_25
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;
    :try_end_2c
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_25 .. :try_end_2c} :catch_2d

    .line 98
    .end local v1    # "cs":Ljava/nio/charset/CharsetDecoder;
    .end local v2    # "encoding":Ljava/lang/String;
    :goto_2c
    return-object v2

    .line 92
    .restart local v1    # "cs":Ljava/nio/charset/CharsetDecoder;
    .restart local v2    # "encoding":Ljava/lang/String;
    :catch_2d
    move-exception v6

    .line 85
    add-int/lit8 v4, v4, 0x1

    goto :goto_19

    .line 98
    .end local v1    # "cs":Ljava/nio/charset/CharsetDecoder;
    .end local v2    # "encoding":Ljava/lang/String;
    :cond_31
    const/4 v2, 0x0

    goto :goto_2c
.end method
