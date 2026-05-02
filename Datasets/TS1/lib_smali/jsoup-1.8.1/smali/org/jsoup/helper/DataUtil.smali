.class public Lorg/jsoup/helper/DataUtil;
.super Ljava/lang/Object;
.source "DataUtil.java"


# static fields
.field private static final bufferSize:I = 0x20000

.field private static final charsetPattern:Ljava/util/regex/Pattern;

.field static final defaultCharset:Ljava/lang/String; = "UTF-8"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 20
    const-string v0, "(?i)\\bcharset=\\s*(?:\"|\')?([^\\s,;\"\']*)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/jsoup/helper/DataUtil;->charsetPattern:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getCharsetFromContentType(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "contentType"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 176
    if-nez p0, :cond_5

    move-object v0, v3

    .line 191
    :cond_4
    :goto_4
    return-object v0

    .line 177
    :cond_5
    sget-object v4, Lorg/jsoup/helper/DataUtil;->charsetPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v4, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 178
    .local v2, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_3c

    .line 179
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 180
    .local v0, "charset":Ljava/lang/String;
    const-string v4, "charset="

    const-string v5, ""

    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 181
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_2a

    move-object v0, v3

    goto :goto_4

    .line 183
    :cond_2a
    :try_start_2a
    invoke-static {v0}, Ljava/nio/charset/Charset;->isSupported(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 184
    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v4}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 185
    invoke-static {v0}, Ljava/nio/charset/Charset;->isSupported(Ljava/lang/String;)Z
    :try_end_39
    .catch Ljava/nio/charset/IllegalCharsetNameException; {:try_start_2a .. :try_end_39} :catch_3e

    move-result v4

    if-nez v4, :cond_4

    .end local v0    # "charset":Ljava/lang/String;
    :cond_3c
    move-object v0, v3

    .line 191
    goto :goto_4

    .line 186
    .restart local v0    # "charset":Ljava/lang/String;
    :catch_3e
    move-exception v1

    .local v1, "e":Ljava/nio/charset/IllegalCharsetNameException;
    move-object v0, v3

    .line 188
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
    .line 35
    invoke-static {p0}, Lorg/jsoup/helper/DataUtil;->readFileToByteBuffer(Ljava/io/File;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 36
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
    .line 48
    invoke-static {p0}, Lorg/jsoup/helper/DataUtil;->readToByteBuffer(Ljava/io/InputStream;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 49
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
    .line 62
    invoke-static {p0}, Lorg/jsoup/helper/DataUtil;->readToByteBuffer(Ljava/io/InputStream;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 63
    .local v0, "byteData":Ljava/nio/ByteBuffer;
    invoke-static {v0, p1, p2, p3}, Lorg/jsoup/helper/DataUtil;->parseByteData(Ljava/nio/ByteBuffer;Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/Parser;)Lorg/jsoup/nodes/Document;

    move-result-object v1

    return-object v1
.end method

.method static parseByteData(Ljava/nio/ByteBuffer;Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/Parser;)Lorg/jsoup/nodes/Document;
    .registers 12
    .param p0, "byteData"    # Ljava/nio/ByteBuffer;
    .param p1, "charsetName"    # Ljava/lang/String;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "parser"    # Lorg/jsoup/parser/Parser;

    .prologue
    .line 71
    const/4 v0, 0x0

    .line 72
    .local v0, "doc":Lorg/jsoup/nodes/Document;
    if-nez p1, :cond_bd

    .line 74
    const-string v5, "UTF-8"

    invoke-static {v5}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 75
    .local v1, "docData":Ljava/lang/String;
    invoke-virtual {p3, v1, p2}, Lorg/jsoup/parser/Parser;->parseInput(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    .line 76
    const-string v5, "meta[http-equiv=content-type], meta[charset]"

    invoke-virtual {v0, v5}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jsoup/select/Elements;->first()Lorg/jsoup/nodes/Element;

    move-result-object v4

    .line 77
    .local v4, "meta":Lorg/jsoup/nodes/Element;
    if-eqz v4, :cond_7c

    .line 79
    const-string v5, "http-equiv"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_b6

    .line 80
    const-string v5, "content"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/jsoup/helper/DataUtil;->getCharsetFromContentType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 81
    .local v3, "foundCharset":Ljava/lang/String;
    if-nez v3, :cond_4f

    const-string v5, "charset"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4f

    .line 83
    :try_start_3d
    const-string v5, "charset"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/nio/charset/Charset;->isSupported(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4f

    .line 84
    const-string v5, "charset"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;
    :try_end_4e
    .catch Ljava/nio/charset/IllegalCharsetNameException; {:try_start_3d .. :try_end_4e} :catch_b3

    move-result-object v3

    .line 94
    :cond_4f
    :goto_4f
    if-eqz v3, :cond_7c

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_7c

    const-string v5, "UTF-8"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_7c

    .line 95
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    const-string v6, "[\"\']"

    const-string v7, ""

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 96
    move-object p1, v3

    .line 97
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 98
    invoke-static {v3}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 99
    const/4 v0, 0x0

    .line 107
    .end local v3    # "foundCharset":Ljava/lang/String;
    .end local v4    # "meta":Lorg/jsoup/nodes/Element;
    :cond_7c
    :goto_7c
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_a5

    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const v6, 0xfeff

    if-ne v5, v6, :cond_a5

    .line 108
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 109
    const-string v5, "UTF-8"

    invoke-static {v5}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 110
    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 111
    const-string p1, "UTF-8"

    .line 112
    const/4 v0, 0x0

    .line 114
    :cond_a5
    if-nez v0, :cond_b2

    .line 115
    invoke-virtual {p3, v1, p2}, Lorg/jsoup/parser/Parser;->parseInput(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    .line 116
    invoke-virtual {v0}, Lorg/jsoup/nodes/Document;->outputSettings()Lorg/jsoup/nodes/Document$OutputSettings;

    move-result-object v5

    invoke-virtual {v5, p1}, Lorg/jsoup/nodes/Document$OutputSettings;->charset(Ljava/lang/String;)Lorg/jsoup/nodes/Document$OutputSettings;

    .line 118
    :cond_b2
    return-object v0

    .line 86
    .restart local v3    # "foundCharset":Ljava/lang/String;
    .restart local v4    # "meta":Lorg/jsoup/nodes/Element;
    :catch_b3
    move-exception v2

    .line 87
    .local v2, "e":Ljava/nio/charset/IllegalCharsetNameException;
    const/4 v3, 0x0

    .line 88
    goto :goto_4f

    .line 91
    .end local v2    # "e":Ljava/nio/charset/IllegalCharsetNameException;
    .end local v3    # "foundCharset":Ljava/lang/String;
    :cond_b6
    const-string v5, "charset"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "foundCharset":Ljava/lang/String;
    goto :goto_4f

    .line 103
    .end local v1    # "docData":Ljava/lang/String;
    .end local v3    # "foundCharset":Ljava/lang/String;
    .end local v4    # "meta":Lorg/jsoup/nodes/Element;
    :cond_bd
    const-string v5, "Must set charset arg to character set of file to parse. Set to null to attempt to detect from HTML"

    invoke-static {p1, v5}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "docData":Ljava/lang/String;
    goto :goto_7c
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
    .line 157
    const/4 v1, 0x0

    .line 159
    .local v1, "randomAccessFile":Ljava/io/RandomAccessFile;
    :try_start_1
    new-instance v2, Ljava/io/RandomAccessFile;

    const-string v3, "r"

    invoke-direct {v2, p0, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_1c

    .line 160
    .end local v1    # "randomAccessFile":Ljava/io/RandomAccessFile;
    .local v2, "randomAccessFile":Ljava/io/RandomAccessFile;
    :try_start_8
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v3

    long-to-int v3, v3

    new-array v0, v3, [B

    .line 161
    .local v0, "bytes":[B
    invoke-virtual {v2, v0}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 162
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;
    :try_end_15
    .catchall {:try_start_8 .. :try_end_15} :catchall_23

    move-result-object v3

    .line 164
    if-eqz v2, :cond_1b

    .line 165
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V

    :cond_1b
    return-object v3

    .line 164
    .end local v0    # "bytes":[B
    .end local v2    # "randomAccessFile":Ljava/io/RandomAccessFile;
    .restart local v1    # "randomAccessFile":Ljava/io/RandomAccessFile;
    :catchall_1c
    move-exception v3

    :goto_1d
    if-eqz v1, :cond_22

    .line 165
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V

    :cond_22
    throw v3

    .line 164
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
    .line 153
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/jsoup/helper/DataUtil;->readToByteBuffer(Ljava/io/InputStream;I)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method static readToByteBuffer(Ljava/io/InputStream;I)Ljava/nio/ByteBuffer;
    .registers 13
    .param p0, "inStream"    # Ljava/io/InputStream;
    .param p1, "maxSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/high16 v10, 0x20000

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 129
    if-ltz p1, :cond_27

    move v6, v7

    :goto_7
    const-string v9, "maxSize must be 0 (unlimited) or larger"

    invoke-static {v6, v9}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 130
    if-lez p1, :cond_29

    move v2, v7

    .line 131
    .local v2, "capped":Z
    :goto_f
    new-array v0, v10, [B

    .line 132
    .local v0, "buffer":[B
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3, v10}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 134
    .local v3, "outStream":Ljava/io/ByteArrayOutputStream;
    move v5, p1

    .line 137
    .local v5, "remaining":I
    :goto_17
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .line 138
    .local v4, "read":I
    const/4 v6, -0x1

    if-ne v4, v6, :cond_2b

    .line 148
    :goto_1e
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    invoke-static {v6}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 149
    .local v1, "byteData":Ljava/nio/ByteBuffer;
    return-object v1

    .end local v0    # "buffer":[B
    .end local v1    # "byteData":Ljava/nio/ByteBuffer;
    .end local v2    # "capped":Z
    .end local v3    # "outStream":Ljava/io/ByteArrayOutputStream;
    .end local v4    # "read":I
    .end local v5    # "remaining":I
    :cond_27
    move v6, v8

    .line 129
    goto :goto_7

    :cond_29
    move v2, v8

    .line 130
    goto :goto_f

    .line 139
    .restart local v0    # "buffer":[B
    .restart local v2    # "capped":Z
    .restart local v3    # "outStream":Ljava/io/ByteArrayOutputStream;
    .restart local v4    # "read":I
    .restart local v5    # "remaining":I
    :cond_2b
    if-eqz v2, :cond_34

    .line 140
    if-le v4, v5, :cond_33

    .line 141
    invoke-virtual {v3, v0, v8, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1e

    .line 144
    :cond_33
    sub-int/2addr v5, v4

    .line 146
    :cond_34
    invoke-virtual {v3, v0, v8, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_17
.end method
