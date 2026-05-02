.class public final Lorg/jsoup/helper/DataUtil;
.super Ljava/lang/Object;
.source "DataUtil.java"


# static fields
.field private static final UNICODE_BOM:I = 0xfeff

.field static final boundaryLength:I = 0x20

.field private static final bufferSize:I = 0x20000

.field private static final charsetPattern:Ljava/util/regex/Pattern;

.field static final defaultCharset:Ljava/lang/String; = "UTF-8"

.field private static final mimeBoundaryChars:[C


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 21
    const-string v0, "(?i)\\bcharset=\\s*(?:\"|\')?([^\\s,;\"\']*)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/jsoup/helper/DataUtil;->charsetPattern:Ljava/util/regex/Pattern;

    .line 25
    const-string v0, "-_1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    .line 26
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/jsoup/helper/DataUtil;->mimeBoundaryChars:[C

    .line 25
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static crossStreams(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 5
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    const/high16 v2, 0x20000

    new-array v0, v2, [B

    .line 80
    .local v0, "buffer":[B
    :goto_4
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "len":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_10

    .line 81
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_4

    .line 83
    :cond_10
    return-void
.end method

.method static emptyByteBuffer()Ljava/nio/ByteBuffer;
    .registers 1

    .prologue
    .line 197
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method static getCharsetFromContentType(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "contentType"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 207
    if-nez p0, :cond_5

    move-object v0, v3

    .line 222
    :cond_4
    :goto_4
    return-object v0

    .line 208
    :cond_5
    sget-object v4, Lorg/jsoup/helper/DataUtil;->charsetPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v4, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 209
    .local v2, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_3c

    .line 210
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 211
    .local v0, "charset":Ljava/lang/String;
    const-string v4, "charset="

    const-string v5, ""

    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 212
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_2a

    move-object v0, v3

    goto :goto_4

    .line 214
    :cond_2a
    :try_start_2a
    invoke-static {v0}, Ljava/nio/charset/Charset;->isSupported(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 215
    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v4}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 216
    invoke-static {v0}, Ljava/nio/charset/Charset;->isSupported(Ljava/lang/String;)Z
    :try_end_39
    .catch Ljava/nio/charset/IllegalCharsetNameException; {:try_start_2a .. :try_end_39} :catch_3e

    move-result v4

    if-nez v4, :cond_4

    .end local v0    # "charset":Ljava/lang/String;
    :cond_3c
    move-object v0, v3

    .line 222
    goto :goto_4

    .line 217
    .restart local v0    # "charset":Ljava/lang/String;
    :catch_3e
    move-exception v1

    .local v1, "e":Ljava/nio/charset/IllegalCharsetNameException;
    move-object v0, v3

    .line 219
    goto :goto_4
.end method

.method public static load(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;
    .registers 5
    .param p0, "in"    # Ljava/io/File;
    .param p1, "charsetName"    # Ljava/lang/String;
    .param p2, "baseUri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    invoke-static {p0}, Lorg/jsoup/helper/DataUtil;->readFileToByteBuffer(Ljava/io/File;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 41
    .local v0, "byteData":Ljava/nio/ByteBuffer;
    invoke-static {}, Lorg/jsoup/parser/Parser;->htmlParser()Lorg/jsoup/parser/Parser;

    move-result-object v1

    invoke-static {v0, p1, p2, v1}, Lorg/jsoup/helper/DataUtil;->parseByteData(Ljava/nio/ByteBuffer;Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/Parser;)Lorg/jsoup/nodes/Document;

    move-result-object v1

    return-object v1
.end method

.method public static load(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;
    .registers 5
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "charsetName"    # Ljava/lang/String;
    .param p2, "baseUri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    invoke-static {p0}, Lorg/jsoup/helper/DataUtil;->readToByteBuffer(Ljava/io/InputStream;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 54
    .local v0, "byteData":Ljava/nio/ByteBuffer;
    invoke-static {}, Lorg/jsoup/parser/Parser;->htmlParser()Lorg/jsoup/parser/Parser;

    move-result-object v1

    invoke-static {v0, p1, p2, v1}, Lorg/jsoup/helper/DataUtil;->parseByteData(Ljava/nio/ByteBuffer;Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/Parser;)Lorg/jsoup/nodes/Document;

    move-result-object v1

    return-object v1
.end method

.method public static load(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/Parser;)Lorg/jsoup/nodes/Document;
    .registers 6
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "charsetName"    # Ljava/lang/String;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "parser"    # Lorg/jsoup/parser/Parser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    invoke-static {p0}, Lorg/jsoup/helper/DataUtil;->readToByteBuffer(Ljava/io/InputStream;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 68
    .local v0, "byteData":Ljava/nio/ByteBuffer;
    invoke-static {v0, p1, p2, p3}, Lorg/jsoup/helper/DataUtil;->parseByteData(Ljava/nio/ByteBuffer;Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/Parser;)Lorg/jsoup/nodes/Document;

    move-result-object v1

    return-object v1
.end method

.method static mimeBoundary()Ljava/lang/String;
    .registers 6

    .prologue
    const/16 v5, 0x20

    .line 229
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 230
    .local v1, "mime":Ljava/lang/StringBuilder;
    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    .line 231
    .local v2, "rand":Ljava/util/Random;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    if-ge v0, v5, :cond_20

    .line 232
    sget-object v3, Lorg/jsoup/helper/DataUtil;->mimeBoundaryChars:[C

    sget-object v4, Lorg/jsoup/helper/DataUtil;->mimeBoundaryChars:[C

    array-length v4, v4

    invoke-virtual {v2, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    aget-char v3, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 231
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 234
    :cond_20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method static parseByteData(Ljava/nio/ByteBuffer;Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/Parser;)Lorg/jsoup/nodes/Document;
    .registers 13
    .param p0, "byteData"    # Ljava/nio/ByteBuffer;
    .param p1, "charsetName"    # Ljava/lang/String;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "parser"    # Lorg/jsoup/parser/Parser;

    .prologue
    .line 90
    const/4 v1, 0x0

    .line 93
    .local v1, "doc":Lorg/jsoup/nodes/Document;
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->mark()Ljava/nio/Buffer;

    .line 94
    const/4 v6, 0x4

    new-array v0, v6, [B

    .line 95
    .local v0, "bom":[B
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v6

    array-length v7, v0

    if-lt v6, v7, :cond_14

    .line 96
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 97
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 99
    :cond_14
    const/4 v6, 0x0

    aget-byte v6, v0, v6

    if-nez v6, :cond_2a

    const/4 v6, 0x1

    aget-byte v6, v0, v6

    if-nez v6, :cond_2a

    const/4 v6, 0x2

    aget-byte v6, v0, v6

    const/4 v7, -0x2

    if-ne v6, v7, :cond_2a

    const/4 v6, 0x3

    aget-byte v6, v0, v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_40

    :cond_2a
    const/4 v6, 0x0

    aget-byte v6, v0, v6

    const/4 v7, -0x1

    if-ne v6, v7, :cond_cc

    const/4 v6, 0x1

    aget-byte v6, v0, v6

    const/4 v7, -0x2

    if-ne v6, v7, :cond_cc

    const/4 v6, 0x2

    aget-byte v6, v0, v6

    if-nez v6, :cond_cc

    const/4 v6, 0x3

    aget-byte v6, v0, v6

    if-nez v6, :cond_cc

    .line 101
    :cond_40
    const-string p1, "UTF-32"

    .line 110
    :cond_42
    :goto_42
    if-nez p1, :cond_108

    .line 112
    const-string v6, "UTF-8"

    invoke-static {v6}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 113
    .local v2, "docData":Ljava/lang/String;
    invoke-virtual {p3, v2, p2}, Lorg/jsoup/parser/Parser;->parseInput(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v1

    .line 114
    const-string v6, "meta[http-equiv=content-type], meta[charset]"

    invoke-virtual {v1, v6}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v6

    invoke-virtual {v6}, Lorg/jsoup/select/Elements;->first()Lorg/jsoup/nodes/Element;

    move-result-object v5

    .line 115
    .local v5, "meta":Lorg/jsoup/nodes/Element;
    if-eqz v5, :cond_be

    .line 116
    const/4 v4, 0x0

    .line 117
    .local v4, "foundCharset":Ljava/lang/String;
    const-string v6, "http-equiv"

    invoke-virtual {v5, v6}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_75

    .line 118
    const-string v6, "content"

    invoke-virtual {v5, v6}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/jsoup/helper/DataUtil;->getCharsetFromContentType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 120
    :cond_75
    if-nez v4, :cond_91

    const-string v6, "charset"

    invoke-virtual {v5, v6}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_91

    .line 122
    :try_start_7f
    const-string v6, "charset"

    invoke-virtual {v5, v6}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/nio/charset/Charset;->isSupported(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_91

    .line 123
    const-string v6, "charset"

    invoke-virtual {v5, v6}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;
    :try_end_90
    .catch Ljava/nio/charset/IllegalCharsetNameException; {:try_start_7f .. :try_end_90} :catch_105

    move-result-object v4

    .line 130
    :cond_91
    :goto_91
    if-eqz v4, :cond_be

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_be

    const-string v6, "UTF-8"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_be

    .line 131
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const-string v7, "[\"\']"

    const-string v8, ""

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 132
    move-object p1, v4

    .line 133
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 134
    invoke-static {v4}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 135
    const/4 v1, 0x0

    .line 142
    .end local v4    # "foundCharset":Ljava/lang/String;
    .end local v5    # "meta":Lorg/jsoup/nodes/Element;
    :cond_be
    :goto_be
    if-nez v1, :cond_cb

    .line 143
    invoke-virtual {p3, v2, p2}, Lorg/jsoup/parser/Parser;->parseInput(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v1

    .line 144
    invoke-virtual {v1}, Lorg/jsoup/nodes/Document;->outputSettings()Lorg/jsoup/nodes/Document$OutputSettings;

    move-result-object v6

    invoke-virtual {v6, p1}, Lorg/jsoup/nodes/Document$OutputSettings;->charset(Ljava/lang/String;)Lorg/jsoup/nodes/Document$OutputSettings;

    .line 146
    :cond_cb
    return-object v1

    .line 102
    .end local v2    # "docData":Ljava/lang/String;
    :cond_cc
    const/4 v6, 0x0

    aget-byte v6, v0, v6

    const/4 v7, -0x2

    if-ne v6, v7, :cond_d8

    const/4 v6, 0x1

    aget-byte v6, v0, v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_e4

    :cond_d8
    const/4 v6, 0x0

    aget-byte v6, v0, v6

    const/4 v7, -0x1

    if-ne v6, v7, :cond_e8

    const/4 v6, 0x1

    aget-byte v6, v0, v6

    const/4 v7, -0x2

    if-ne v6, v7, :cond_e8

    .line 104
    :cond_e4
    const-string p1, "UTF-16"

    goto/16 :goto_42

    .line 105
    :cond_e8
    const/4 v6, 0x0

    aget-byte v6, v0, v6

    const/16 v7, -0x11

    if-ne v6, v7, :cond_42

    const/4 v6, 0x1

    aget-byte v6, v0, v6

    const/16 v7, -0x45

    if-ne v6, v7, :cond_42

    const/4 v6, 0x2

    aget-byte v6, v0, v6

    const/16 v7, -0x41

    if-ne v6, v7, :cond_42

    .line 106
    const-string p1, "UTF-8"

    .line 107
    const/4 v6, 0x3

    invoke-virtual {p0, v6}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto/16 :goto_42

    .line 125
    .restart local v2    # "docData":Ljava/lang/String;
    .restart local v4    # "foundCharset":Ljava/lang/String;
    .restart local v5    # "meta":Lorg/jsoup/nodes/Element;
    :catch_105
    move-exception v3

    .line 126
    .local v3, "e":Ljava/nio/charset/IllegalCharsetNameException;
    const/4 v4, 0x0

    goto :goto_91

    .line 139
    .end local v2    # "docData":Ljava/lang/String;
    .end local v3    # "e":Ljava/nio/charset/IllegalCharsetNameException;
    .end local v4    # "foundCharset":Ljava/lang/String;
    .end local v5    # "meta":Lorg/jsoup/nodes/Element;
    :cond_108
    const-string v6, "Must set charset arg to character set of file to parse. Set to null to attempt to detect from HTML"

    invoke-static {p1, v6}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "docData":Ljava/lang/String;
    goto :goto_be
.end method

.method static readFileToByteBuffer(Ljava/io/File;)Ljava/nio/ByteBuffer;
    .registers 6
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 184
    const/4 v1, 0x0

    .line 186
    .local v1, "randomAccessFile":Ljava/io/RandomAccessFile;
    :try_start_1
    new-instance v2, Ljava/io/RandomAccessFile;

    const-string v3, "r"

    invoke-direct {v2, p0, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_1c

    .line 187
    .end local v1    # "randomAccessFile":Ljava/io/RandomAccessFile;
    .local v2, "randomAccessFile":Ljava/io/RandomAccessFile;
    :try_start_8
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v3

    long-to-int v3, v3

    new-array v0, v3, [B

    .line 188
    .local v0, "bytes":[B
    invoke-virtual {v2, v0}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 189
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;
    :try_end_15
    .catchall {:try_start_8 .. :try_end_15} :catchall_23

    move-result-object v3

    .line 191
    if-eqz v2, :cond_1b

    .line 192
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V

    :cond_1b
    return-object v3

    .line 191
    .end local v0    # "bytes":[B
    .end local v2    # "randomAccessFile":Ljava/io/RandomAccessFile;
    .restart local v1    # "randomAccessFile":Ljava/io/RandomAccessFile;
    :catchall_1c
    move-exception v3

    :goto_1d
    if-eqz v1, :cond_22

    .line 192
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V

    :cond_22
    throw v3

    .line 191
    .end local v1    # "randomAccessFile":Ljava/io/RandomAccessFile;
    .restart local v2    # "randomAccessFile":Ljava/io/RandomAccessFile;
    :catchall_23
    move-exception v3

    move-object v1, v2

    .end local v2    # "randomAccessFile":Ljava/io/RandomAccessFile;
    .restart local v1    # "randomAccessFile":Ljava/io/RandomAccessFile;
    goto :goto_1d
.end method

.method static readToByteBuffer(Ljava/io/InputStream;)Ljava/nio/ByteBuffer;
    .registers 2
    .param p0, "inStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 180
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/jsoup/helper/DataUtil;->readToByteBuffer(Ljava/io/InputStream;I)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method static readToByteBuffer(Ljava/io/InputStream;I)Ljava/nio/ByteBuffer;
    .registers 12
    .param p0, "inStream"    # Ljava/io/InputStream;
    .param p1, "maxSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/high16 v9, 0x20000

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 157
    if-ltz p1, :cond_27

    move v5, v6

    :goto_7
    const-string v8, "maxSize must be 0 (unlimited) or larger"

    invoke-static {v5, v8}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 158
    if-lez p1, :cond_29

    move v1, v6

    .line 159
    .local v1, "capped":Z
    :goto_f
    new-array v0, v9, [B

    .line 160
    .local v0, "buffer":[B
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2, v9}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 162
    .local v2, "outStream":Ljava/io/ByteArrayOutputStream;
    move v4, p1

    .line 165
    .local v4, "remaining":I
    :goto_17
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .line 166
    .local v3, "read":I
    const/4 v5, -0x1

    if-ne v3, v5, :cond_2b

    .line 176
    :goto_1e
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-static {v5}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v5

    return-object v5

    .end local v0    # "buffer":[B
    .end local v1    # "capped":Z
    .end local v2    # "outStream":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "read":I
    .end local v4    # "remaining":I
    :cond_27
    move v5, v7

    .line 157
    goto :goto_7

    :cond_29
    move v1, v7

    .line 158
    goto :goto_f

    .line 167
    .restart local v0    # "buffer":[B
    .restart local v1    # "capped":Z
    .restart local v2    # "outStream":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "read":I
    .restart local v4    # "remaining":I
    :cond_2b
    if-eqz v1, :cond_34

    .line 168
    if-le v3, v4, :cond_33

    .line 169
    invoke-virtual {v2, v0, v7, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1e

    .line 172
    :cond_33
    sub-int/2addr v4, v3

    .line 174
    :cond_34
    invoke-virtual {v2, v0, v7, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_17
.end method
