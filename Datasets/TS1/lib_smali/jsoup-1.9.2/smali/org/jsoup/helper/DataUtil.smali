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
    .line 27
    const-string v0, "(?i)\\bcharset=\\s*(?:\"|\')?([^\\s,;\"\']*)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/jsoup/helper/DataUtil;->charsetPattern:Ljava/util/regex/Pattern;

    .line 31
    const-string v0, "-_1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    .line 32
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/jsoup/helper/DataUtil;->mimeBoundaryChars:[C

    .line 31
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 35
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
    .line 84
    const/high16 v2, 0x20000

    new-array v0, v2, [B

    .line 86
    .local v0, "buffer":[B
    :goto_4
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "len":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_10

    .line 87
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_4

    .line 89
    :cond_10
    return-void
.end method

.method private static detectCharsetFromBom(Ljava/nio/ByteBuffer;Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p0, "byteData"    # Ljava/nio/ByteBuffer;
    .param p1, "charsetName"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x2

    const/4 v6, -0x1

    const/4 v5, -0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 236
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->mark()Ljava/nio/Buffer;

    .line 237
    const/4 v1, 0x4

    new-array v0, v1, [B

    .line 238
    .local v0, "bom":[B
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    array-length v2, v0

    if-lt v1, v2, :cond_18

    .line 239
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 240
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 242
    :cond_18
    aget-byte v1, v0, v3

    if-nez v1, :cond_29

    aget-byte v1, v0, v4

    if-nez v1, :cond_29

    aget-byte v1, v0, v7

    if-ne v1, v5, :cond_29

    const/4 v1, 0x3

    aget-byte v1, v0, v1

    if-eq v1, v6, :cond_3a

    :cond_29
    aget-byte v1, v0, v3

    if-ne v1, v6, :cond_3d

    aget-byte v1, v0, v4

    if-ne v1, v5, :cond_3d

    aget-byte v1, v0, v7

    if-nez v1, :cond_3d

    const/4 v1, 0x3

    aget-byte v1, v0, v1

    if-nez v1, :cond_3d

    .line 244
    :cond_3a
    const-string p1, "UTF-32"

    .line 252
    :cond_3c
    :goto_3c
    return-object p1

    .line 245
    :cond_3d
    aget-byte v1, v0, v3

    if-ne v1, v5, :cond_45

    aget-byte v1, v0, v4

    if-eq v1, v6, :cond_4d

    :cond_45
    aget-byte v1, v0, v3

    if-ne v1, v6, :cond_50

    aget-byte v1, v0, v4

    if-ne v1, v5, :cond_50

    .line 247
    :cond_4d
    const-string p1, "UTF-16"

    goto :goto_3c

    .line 248
    :cond_50
    aget-byte v1, v0, v3

    const/16 v2, -0x11

    if-ne v1, v2, :cond_3c

    aget-byte v1, v0, v4

    const/16 v2, -0x45

    if-ne v1, v2, :cond_3c

    aget-byte v1, v0, v7

    const/16 v2, -0x41

    if-ne v1, v2, :cond_3c

    .line 249
    const-string p1, "UTF-8"

    .line 250
    const/4 v1, 0x3

    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_3c
.end method

.method static emptyByteBuffer()Ljava/nio/ByteBuffer;
    .registers 1

    .prologue
    .line 190
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method static getCharsetFromContentType(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "contentType"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 200
    if-nez p0, :cond_4

    .line 207
    :cond_3
    :goto_3
    return-object v2

    .line 201
    :cond_4
    sget-object v3, Lorg/jsoup/helper/DataUtil;->charsetPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v3, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 202
    .local v1, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 203
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 204
    .local v0, "charset":Ljava/lang/String;
    const-string v2, "charset="

    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 205
    invoke-static {v0}, Lorg/jsoup/helper/DataUtil;->validateCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_3
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
    .line 46
    invoke-static {p0}, Lorg/jsoup/helper/DataUtil;->readFileToByteBuffer(Ljava/io/File;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 47
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
    .line 59
    invoke-static {p0}, Lorg/jsoup/helper/DataUtil;->readToByteBuffer(Ljava/io/InputStream;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 60
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
    .line 73
    invoke-static {p0}, Lorg/jsoup/helper/DataUtil;->readToByteBuffer(Ljava/io/InputStream;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 74
    .local v0, "byteData":Ljava/nio/ByteBuffer;
    invoke-static {v0, p1, p2, p3}, Lorg/jsoup/helper/DataUtil;->parseByteData(Ljava/nio/ByteBuffer;Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/Parser;)Lorg/jsoup/nodes/Document;

    move-result-object v1

    return-object v1
.end method

.method static mimeBoundary()Ljava/lang/String;
    .registers 6

    .prologue
    const/16 v5, 0x20

    .line 227
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 228
    .local v1, "mime":Ljava/lang/StringBuilder;
    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    .line 229
    .local v2, "rand":Ljava/util/Random;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    if-ge v0, v5, :cond_20

    .line 230
    sget-object v3, Lorg/jsoup/helper/DataUtil;->mimeBoundaryChars:[C

    sget-object v4, Lorg/jsoup/helper/DataUtil;->mimeBoundaryChars:[C

    array-length v4, v4

    invoke-virtual {v2, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    aget-char v3, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 229
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 232
    :cond_20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method static parseByteData(Ljava/nio/ByteBuffer;Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/Parser;)Lorg/jsoup/nodes/Document;
    .registers 12
    .param p0, "byteData"    # Ljava/nio/ByteBuffer;
    .param p1, "charsetName"    # Ljava/lang/String;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "parser"    # Lorg/jsoup/parser/Parser;

    .prologue
    const/4 v6, 0x0

    .line 96
    const/4 v0, 0x0

    .line 99
    .local v0, "doc":Lorg/jsoup/nodes/Document;
    invoke-static {p0, p1}, Lorg/jsoup/helper/DataUtil;->detectCharsetFromBom(Ljava/nio/ByteBuffer;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 101
    if-nez p1, :cond_a4

    .line 103
    const-string v5, "UTF-8"

    invoke-static {v5}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 104
    .local v1, "docData":Ljava/lang/String;
    invoke-virtual {p3, v1, p2}, Lorg/jsoup/parser/Parser;->parseInput(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    .line 105
    const-string v5, "meta[http-equiv=content-type], meta[charset]"

    invoke-virtual {v0, v5}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jsoup/select/Elements;->first()Lorg/jsoup/nodes/Element;

    move-result-object v3

    .line 106
    .local v3, "meta":Lorg/jsoup/nodes/Element;
    const/4 v2, 0x0

    .line 107
    .local v2, "foundCharset":Ljava/lang/String;
    if-eqz v3, :cond_49

    .line 108
    const-string v5, "http-equiv"

    invoke-virtual {v3, v5}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_39

    .line 109
    const-string v5, "content"

    invoke-virtual {v3, v5}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/jsoup/helper/DataUtil;->getCharsetFromContentType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 111
    :cond_39
    if-nez v2, :cond_49

    const-string v5, "charset"

    invoke-virtual {v3, v5}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_49

    .line 112
    const-string v5, "charset"

    invoke-virtual {v3, v5}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 116
    :cond_49
    if-nez v2, :cond_6b

    invoke-virtual {v0, v6}, Lorg/jsoup/nodes/Document;->childNode(I)Lorg/jsoup/nodes/Node;

    move-result-object v5

    instance-of v5, v5, Lorg/jsoup/nodes/XmlDeclaration;

    if-eqz v5, :cond_6b

    .line 117
    invoke-virtual {v0, v6}, Lorg/jsoup/nodes/Document;->childNode(I)Lorg/jsoup/nodes/Node;

    move-result-object v4

    check-cast v4, Lorg/jsoup/nodes/XmlDeclaration;

    .line 118
    .local v4, "prolog":Lorg/jsoup/nodes/XmlDeclaration;
    invoke-virtual {v4}, Lorg/jsoup/nodes/XmlDeclaration;->name()Ljava/lang/String;

    move-result-object v5

    const-string v6, "xml"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6b

    .line 119
    const-string v5, "encoding"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/XmlDeclaration;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 122
    .end local v4    # "prolog":Lorg/jsoup/nodes/XmlDeclaration;
    :cond_6b
    invoke-static {v2}, Lorg/jsoup/helper/DataUtil;->validateCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 124
    if-eqz v2, :cond_96

    const-string v5, "UTF-8"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_96

    .line 125
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    const-string v6, "[\"\']"

    const-string v7, ""

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 126
    move-object p1, v2

    .line 127
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 128
    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 129
    const/4 v0, 0x0

    .line 135
    .end local v2    # "foundCharset":Ljava/lang/String;
    .end local v3    # "meta":Lorg/jsoup/nodes/Element;
    :cond_96
    :goto_96
    if-nez v0, :cond_a3

    .line 136
    invoke-virtual {p3, v1, p2}, Lorg/jsoup/parser/Parser;->parseInput(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    .line 137
    invoke-virtual {v0}, Lorg/jsoup/nodes/Document;->outputSettings()Lorg/jsoup/nodes/Document$OutputSettings;

    move-result-object v5

    invoke-virtual {v5, p1}, Lorg/jsoup/nodes/Document$OutputSettings;->charset(Ljava/lang/String;)Lorg/jsoup/nodes/Document$OutputSettings;

    .line 139
    :cond_a3
    return-object v0

    .line 132
    .end local v1    # "docData":Ljava/lang/String;
    :cond_a4
    const-string v5, "Must set charset arg to character set of file to parse. Set to null to attempt to detect from HTML"

    invoke-static {p1, v5}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "docData":Ljava/lang/String;
    goto :goto_96
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
    .line 177
    const/4 v1, 0x0

    .line 179
    .local v1, "randomAccessFile":Ljava/io/RandomAccessFile;
    :try_start_1
    new-instance v2, Ljava/io/RandomAccessFile;

    const-string v3, "r"

    invoke-direct {v2, p0, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_1c

    .line 180
    .end local v1    # "randomAccessFile":Ljava/io/RandomAccessFile;
    .local v2, "randomAccessFile":Ljava/io/RandomAccessFile;
    :try_start_8
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v3

    long-to-int v3, v3

    new-array v0, v3, [B

    .line 181
    .local v0, "bytes":[B
    invoke-virtual {v2, v0}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 182
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;
    :try_end_15
    .catchall {:try_start_8 .. :try_end_15} :catchall_23

    move-result-object v3

    .line 184
    if-eqz v2, :cond_1b

    .line 185
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V

    :cond_1b
    return-object v3

    .line 184
    .end local v0    # "bytes":[B
    .end local v2    # "randomAccessFile":Ljava/io/RandomAccessFile;
    .restart local v1    # "randomAccessFile":Ljava/io/RandomAccessFile;
    :catchall_1c
    move-exception v3

    :goto_1d
    if-eqz v1, :cond_22

    .line 185
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V

    :cond_22
    throw v3

    .line 184
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
    .line 173
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

    .line 150
    if-ltz p1, :cond_27

    move v5, v6

    :goto_7
    const-string v8, "maxSize must be 0 (unlimited) or larger"

    invoke-static {v5, v8}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 151
    if-lez p1, :cond_29

    move v1, v6

    .line 152
    .local v1, "capped":Z
    :goto_f
    new-array v0, v9, [B

    .line 153
    .local v0, "buffer":[B
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2, v9}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 155
    .local v2, "outStream":Ljava/io/ByteArrayOutputStream;
    move v4, p1

    .line 158
    .local v4, "remaining":I
    :goto_17
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .line 159
    .local v3, "read":I
    const/4 v5, -0x1

    if-ne v3, v5, :cond_2b

    .line 169
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

    .line 150
    goto :goto_7

    :cond_29
    move v1, v7

    .line 151
    goto :goto_f

    .line 160
    .restart local v0    # "buffer":[B
    .restart local v1    # "capped":Z
    .restart local v2    # "outStream":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "read":I
    .restart local v4    # "remaining":I
    :cond_2b
    if-eqz v1, :cond_34

    .line 161
    if-le v3, v4, :cond_33

    .line 162
    invoke-virtual {v2, v0, v7, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1e

    .line 165
    :cond_33
    sub-int/2addr v4, v3

    .line 167
    :cond_34
    invoke-virtual {v2, v0, v7, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_17
.end method

.method private static validateCharset(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "cs"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 211
    if-eqz p0, :cond_9

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_b

    :cond_9
    move-object p0, v0

    .line 220
    .end local p0    # "cs":Ljava/lang/String;
    :cond_a
    :goto_a
    return-object p0

    .line 212
    .restart local p0    # "cs":Ljava/lang/String;
    :cond_b
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, "[\"\']"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 214
    :try_start_17
    invoke-static {p0}, Ljava/nio/charset/Charset;->isSupported(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_a

    .line 215
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 216
    invoke-static {p0}, Ljava/nio/charset/Charset;->isSupported(Ljava/lang/String;)Z
    :try_end_26
    .catch Ljava/nio/charset/IllegalCharsetNameException; {:try_start_17 .. :try_end_26} :catch_2b

    move-result v1

    if-nez v1, :cond_a

    :goto_29
    move-object p0, v0

    .line 220
    goto :goto_a

    .line 217
    :catch_2b
    move-exception v1

    goto :goto_29
.end method
