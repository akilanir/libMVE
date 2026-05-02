.class public Lorg/apache/james/mime4j/codec/DecoderUtil;
.super Ljava/lang/Object;
.source "DecoderUtil.java"


# static fields
.field private static final PATTERN_ENCODED_WORD:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 37
    const-string v0, "(.*?)=\\?(.+?)\\?(\\w)\\?(.+?)\\?="

    const/16 v1, 0x20

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/james/mime4j/codec/DecoderUtil;->PATTERN_ENCODED_WORD:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static decodeB(Ljava/lang/String;Ljava/lang/String;Lorg/apache/james/mime4j/codec/DecodeMonitor;)Ljava/lang/String;
    .registers 5
    .param p0, "encodedText"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/lang/String;
    .param p2, "monitor"    # Lorg/apache/james/mime4j/codec/DecodeMonitor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 108
    invoke-static {p0, p2}, Lorg/apache/james/mime4j/codec/DecoderUtil;->decodeBase64(Ljava/lang/String;Lorg/apache/james/mime4j/codec/DecodeMonitor;)[B

    move-result-object v0

    .line 109
    .local v0, "decodedBytes":[B
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v1
.end method

.method private static decodeBase64(Ljava/lang/String;Lorg/apache/james/mime4j/codec/DecodeMonitor;)[B
    .registers 8
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "monitor"    # Lorg/apache/james/mime4j/codec/DecodeMonitor;

    .prologue
    .line 75
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 78
    .local v1, "baos":Ljava/io/ByteArrayOutputStream;
    :try_start_5
    const-string v5, "US-ASCII"

    invoke-virtual {p0, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    .line 80
    .local v2, "bytes":[B
    new-instance v4, Lorg/apache/james/mime4j/codec/Base64InputStream;

    new-instance v5, Ljava/io/ByteArrayInputStream;

    invoke-direct {v5, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v4, v5, p1}, Lorg/apache/james/mime4j/codec/Base64InputStream;-><init>(Ljava/io/InputStream;Lorg/apache/james/mime4j/codec/DecodeMonitor;)V

    .line 83
    .local v4, "is":Lorg/apache/james/mime4j/codec/Base64InputStream;
    const/4 v0, 0x0

    .line 84
    .local v0, "b":I
    :goto_16
    invoke-virtual {v4}, Lorg/apache/james/mime4j/codec/Base64InputStream;->read()I

    move-result v0

    const/4 v5, -0x1

    if-eq v0, v5, :cond_28

    .line 85
    invoke-virtual {v1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_20} :catch_21

    goto :goto_16

    .line 87
    .end local v0    # "b":I
    .end local v2    # "bytes":[B
    .end local v4    # "is":Lorg/apache/james/mime4j/codec/Base64InputStream;
    :catch_21
    move-exception v3

    .line 89
    .local v3, "e":Ljava/io/IOException;
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 92
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v0    # "b":I
    .restart local v2    # "bytes":[B
    .restart local v4    # "is":Lorg/apache/james/mime4j/codec/Base64InputStream;
    :cond_28
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    return-object v5
.end method

.method static decodeEncodedWords(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "body"    # Ljava/lang/String;

    .prologue
    .line 131
    sget-object v0, Lorg/apache/james/mime4j/codec/DecodeMonitor;->SILENT:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    invoke-static {p0, v0}, Lorg/apache/james/mime4j/codec/DecoderUtil;->decodeEncodedWords(Ljava/lang/String;Lorg/apache/james/mime4j/codec/DecodeMonitor;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static decodeEncodedWords(Ljava/lang/String;Lorg/apache/james/mime4j/codec/DecodeMonitor;)Ljava/lang/String;
    .registers 14
    .param p0, "body"    # Ljava/lang/String;
    .param p1, "monitor"    # Lorg/apache/james/mime4j/codec/DecodeMonitor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 145
    const/4 v8, 0x0

    .line 146
    .local v8, "tailIndex":I
    const/4 v3, 0x0

    .line 148
    .local v3, "lastMatchValid":Z
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 150
    .local v6, "sb":Ljava/lang/StringBuilder;
    sget-object v11, Lorg/apache/james/mime4j/codec/DecoderUtil;->PATTERN_ENCODED_WORD:Ljava/util/regex/Pattern;

    invoke-virtual {v11, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    .local v4, "matcher":Ljava/util/regex/Matcher;
    :goto_f
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v11

    if-eqz v11, :cond_4f

    .line 151
    invoke-virtual {v4, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    .line 152
    .local v7, "separator":Ljava/lang/String;
    const/4 v11, 0x2

    invoke-virtual {v4, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    .line 153
    .local v5, "mimeCharset":Ljava/lang/String;
    const/4 v11, 0x3

    invoke-virtual {v4, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 154
    .local v2, "encoding":Ljava/lang/String;
    const/4 v11, 0x4

    invoke-virtual {v4, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    .line 156
    .local v1, "encodedText":Ljava/lang/String;
    const/4 v0, 0x0

    .line 157
    .local v0, "decoded":Ljava/lang/String;
    invoke-static {v5, v2, v1, p1}, Lorg/apache/james/mime4j/codec/DecoderUtil;->tryDecodeEncodedWord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/james/mime4j/codec/DecodeMonitor;)Ljava/lang/String;

    move-result-object v0

    .line 158
    if-nez v0, :cond_3e

    .line 159
    invoke-virtual {v4, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    :goto_36
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->end()I

    move-result v8

    .line 168
    if-eqz v0, :cond_4d

    move v3, v9

    .line 169
    :goto_3d
    goto :goto_f

    .line 161
    :cond_3e
    if-eqz v3, :cond_46

    invoke-static {v7}, Lorg/apache/james/mime4j/util/CharsetUtil;->isWhitespace(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_49

    .line 162
    :cond_46
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    :cond_49
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_36

    :cond_4d
    move v3, v10

    .line 168
    goto :goto_3d

    .line 171
    .end local v0    # "decoded":Ljava/lang/String;
    .end local v1    # "encodedText":Ljava/lang/String;
    .end local v2    # "encoding":Ljava/lang/String;
    .end local v5    # "mimeCharset":Ljava/lang/String;
    .end local v7    # "separator":Ljava/lang/String;
    :cond_4f
    if-nez v8, :cond_52

    .line 175
    .end local p0    # "body":Ljava/lang/String;
    :goto_51
    return-object p0

    .line 174
    .restart local p0    # "body":Ljava/lang/String;
    :cond_52
    invoke-virtual {p0, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_51
.end method

.method static decodeQ(Ljava/lang/String;Ljava/lang/String;Lorg/apache/james/mime4j/codec/DecodeMonitor;)Ljava/lang/String;
    .registers 5
    .param p0, "encodedText"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/lang/String;
    .param p2, "monitor"    # Lorg/apache/james/mime4j/codec/DecodeMonitor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 124
    invoke-static {p0}, Lorg/apache/james/mime4j/codec/DecoderUtil;->replaceUnderscores(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 126
    invoke-static {p0, p2}, Lorg/apache/james/mime4j/codec/DecoderUtil;->decodeQuotedPrintable(Ljava/lang/String;Lorg/apache/james/mime4j/codec/DecodeMonitor;)[B

    move-result-object v0

    .line 127
    .local v0, "decodedBytes":[B
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v1
.end method

.method private static decodeQuotedPrintable(Ljava/lang/String;Lorg/apache/james/mime4j/codec/DecodeMonitor;)[B
    .registers 8
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "monitor"    # Lorg/apache/james/mime4j/codec/DecodeMonitor;

    .prologue
    .line 47
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 50
    .local v1, "baos":Ljava/io/ByteArrayOutputStream;
    :try_start_5
    const-string v5, "US-ASCII"

    invoke-virtual {p0, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    .line 52
    .local v2, "bytes":[B
    new-instance v4, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;

    new-instance v5, Ljava/io/ByteArrayInputStream;

    invoke-direct {v5, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v4, v5, p1}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;-><init>(Ljava/io/InputStream;Lorg/apache/james/mime4j/codec/DecodeMonitor;)V

    .line 55
    .local v4, "is":Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;
    const/4 v0, 0x0

    .line 56
    .local v0, "b":I
    :goto_16
    invoke-virtual {v4}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->read()I

    move-result v0

    const/4 v5, -0x1

    if-eq v0, v5, :cond_28

    .line 57
    invoke-virtual {v1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_20} :catch_21

    goto :goto_16

    .line 59
    .end local v0    # "b":I
    .end local v2    # "bytes":[B
    .end local v4    # "is":Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;
    :catch_21
    move-exception v3

    .line 61
    .local v3, "e":Ljava/io/IOException;
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 64
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v0    # "b":I
    .restart local v2    # "bytes":[B
    .restart local v4    # "is":Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;
    :cond_28
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    return-object v5
.end method

.method private static varargs monitor(Lorg/apache/james/mime4j/codec/DecodeMonitor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .registers 15
    .param p0, "monitor"    # Lorg/apache/james/mime4j/codec/DecodeMonitor;
    .param p1, "mimeCharset"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "encodedText"    # Ljava/lang/String;
    .param p4, "dropDesc"    # Ljava/lang/String;
    .param p5, "strings"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 219
    invoke-virtual {p0}, Lorg/apache/james/mime4j/codec/DecodeMonitor;->isListening()Z

    move-result v7

    if-eqz v7, :cond_3d

    .line 220
    invoke-static {p1, p2, p3}, Lorg/apache/james/mime4j/codec/DecoderUtil;->recombine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 221
    .local v1, "encodedWord":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 222
    .local v6, "text":Ljava/lang/StringBuilder;
    move-object v0, p5

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_12
    if-ge v3, v4, :cond_1c

    aget-object v5, v0, v3

    .line 223
    .local v5, "str":Ljava/lang/String;
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    add-int/lit8 v3, v3, 0x1

    goto :goto_12

    .line 225
    .end local v5    # "str":Ljava/lang/String;
    :cond_1c
    const-string v7, " ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 229
    .local v2, "exceptionDesc":Ljava/lang/String;
    invoke-virtual {p0, v2, p4}, Lorg/apache/james/mime4j/codec/DecodeMonitor;->warn(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3d

    .line 230
    new-instance v7, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 232
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "encodedWord":Ljava/lang/String;
    .end local v2    # "exceptionDesc":Ljava/lang/String;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v6    # "text":Ljava/lang/StringBuilder;
    :cond_3d
    return-void
.end method

.method private static recombine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "mimeCharset"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "encodedText"    # Ljava/lang/String;

    .prologue
    .line 236
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "=?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "?="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static replaceUnderscores(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 243
    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v3, 0x80

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 245
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_22

    .line 246
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 247
    .local v0, "c":C
    const/16 v3, 0x5f

    if-ne v0, v3, :cond_1e

    .line 248
    const-string v3, "=20"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    :goto_1b
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 250
    :cond_1e
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1b

    .line 254
    .end local v0    # "c":C
    :cond_22
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static tryDecodeEncodedWord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/james/mime4j/codec/DecodeMonitor;)Ljava/lang/String;
    .registers 12
    .param p0, "mimeCharset"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "encodedText"    # Ljava/lang/String;
    .param p3, "monitor"    # Lorg/apache/james/mime4j/codec/DecodeMonitor;

    .prologue
    .line 182
    invoke-static {p0}, Lorg/apache/james/mime4j/util/CharsetUtil;->lookup(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v6

    .line 183
    .local v6, "charset":Ljava/nio/charset/Charset;
    if-nez v6, :cond_21

    .line 184
    const-string v4, "leaving word encoded"

    const/4 v0, 0x3

    new-array v5, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "Mime charser \'"

    aput-object v1, v5, v0

    const/4 v0, 0x1

    aput-object p0, v5, v0

    const/4 v0, 0x2

    const-string v1, "\' doesn\'t have a corresponding Java charset"

    aput-object v1, v5, v0

    move-object v0, p3

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v0 .. v5}, Lorg/apache/james/mime4j/codec/DecoderUtil;->monitor(Lorg/apache/james/mime4j/codec/DecodeMonitor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 186
    const/4 v0, 0x0

    .line 213
    :goto_20
    return-object v0

    .line 189
    :cond_21
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_3a

    .line 190
    const-string v4, "leaving word encoded"

    const/4 v0, 0x1

    new-array v5, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "Missing encoded text in encoded word"

    aput-object v1, v5, v0

    move-object v0, p3

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v0 .. v5}, Lorg/apache/james/mime4j/codec/DecoderUtil;->monitor(Lorg/apache/james/mime4j/codec/DecodeMonitor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 192
    const/4 v0, 0x0

    goto :goto_20

    .line 196
    :cond_3a
    :try_start_3a
    const-string v0, "Q"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4b

    .line 197
    invoke-virtual {v6}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0, p3}, Lorg/apache/james/mime4j/codec/DecoderUtil;->decodeQ(Ljava/lang/String;Ljava/lang/String;Lorg/apache/james/mime4j/codec/DecodeMonitor;)Ljava/lang/String;

    move-result-object v0

    goto :goto_20

    .line 198
    :cond_4b
    const-string v0, "B"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5c

    .line 199
    invoke-virtual {v6}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0, p3}, Lorg/apache/james/mime4j/codec/DecoderUtil;->decodeB(Ljava/lang/String;Ljava/lang/String;Lorg/apache/james/mime4j/codec/DecodeMonitor;)Ljava/lang/String;

    move-result-object v0

    goto :goto_20

    .line 201
    :cond_5c
    const-string v4, "leaving word encoded"

    const/4 v0, 0x1

    new-array v5, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "Warning: Unknown encoding in encoded word"

    aput-object v1, v5, v0

    move-object v0, p3

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v0 .. v5}, Lorg/apache/james/mime4j/codec/DecoderUtil;->monitor(Lorg/apache/james/mime4j/codec/DecodeMonitor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_6d
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3a .. :try_end_6d} :catch_6f
    .catch Ljava/lang/RuntimeException; {:try_start_3a .. :try_end_6d} :catch_8f

    .line 203
    const/4 v0, 0x0

    goto :goto_20

    .line 205
    :catch_6f
    move-exception v7

    .line 207
    .local v7, "e":Ljava/io/UnsupportedEncodingException;
    const-string v4, "leaving word encoded"

    const/4 v0, 0x3

    new-array v5, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "Unsupported encoding ("

    aput-object v1, v5, v0

    const/4 v0, 0x1

    invoke-virtual {v7}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v5, v0

    const/4 v0, 0x2

    const-string v1, ") in encoded word"

    aput-object v1, v5, v0

    move-object v0, p3

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v0 .. v5}, Lorg/apache/james/mime4j/codec/DecoderUtil;->monitor(Lorg/apache/james/mime4j/codec/DecodeMonitor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 209
    const/4 v0, 0x0

    goto :goto_20

    .line 210
    .end local v7    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_8f
    move-exception v7

    .line 211
    .local v7, "e":Ljava/lang/RuntimeException;
    const-string v4, "leaving word encoded"

    const/4 v0, 0x3

    new-array v5, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "Could not decode ("

    aput-object v1, v5, v0

    const/4 v0, 0x1

    invoke-virtual {v7}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v5, v0

    const/4 v0, 0x2

    const-string v1, ") encoded word"

    aput-object v1, v5, v0

    move-object v0, p3

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v0 .. v5}, Lorg/apache/james/mime4j/codec/DecoderUtil;->monitor(Lorg/apache/james/mime4j/codec/DecodeMonitor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 213
    const/4 v0, 0x0

    goto/16 :goto_20
.end method
