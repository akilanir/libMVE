.class public Lezvcard/util/IOUtils;
.super Ljava/lang/Object;
.source "IOUtils.java"


# static fields
.field private static final UTF8:Ljava/nio/charset/Charset;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 52
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lezvcard/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 203
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 205
    return-void
.end method

.method public static closeQuietly(Ljava/io/Closeable;)V
    .registers 2
    .param p0, "closeable"    # Ljava/io/Closeable;

    .prologue
    .line 145
    if-eqz p0, :cond_5

    .line 146
    :try_start_2
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_6

    .line 151
    :cond_5
    :goto_5
    return-void

    .line 148
    :catch_6
    move-exception v0

    goto :goto_5
.end method

.method public static getFileContents(Ljava/io/File;)Ljava/lang/String;
    .registers 2
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lezvcard/util/IOUtils;->getFileContents(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getFileContents(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "file"    # Ljava/io/File;
    .param p1, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lezvcard/util/IOUtils;->toByteArray(Ljava/io/InputStream;Z)[B

    move-result-object v0

    .line 136
    .local v0, "bytes":[B
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v1
.end method

.method public static getFileExtension(Ljava/io/File;)Ljava/lang/String;
    .registers 4
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 60
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    .line 61
    .local v1, "fileName":Ljava/lang/String;
    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 62
    .local v0, "dot":I
    if-ltz v0, :cond_1b

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_1b

    .line 63
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 65
    :goto_1a
    return-object v2

    :cond_1b
    const/4 v2, 0x0

    goto :goto_1a
.end method

.method public static toByteArray(Ljava/io/InputStream;)[B
    .registers 2
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lezvcard/util/IOUtils;->toByteArray(Ljava/io/InputStream;Z)[B

    move-result-object v0

    return-object v0
.end method

.method public static toByteArray(Ljava/io/InputStream;Z)[B
    .registers 6
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "close"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    :try_start_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 88
    .local v1, "out":Ljava/io/ByteArrayOutputStream;
    const/16 v3, 0x1000

    new-array v0, v3, [B

    .line 90
    .local v0, "buffer":[B
    :goto_9
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "read":I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_1c

    .line 91
    const/4 v3, 0x0

    invoke-virtual {v1, v0, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_14
    .catchall {:try_start_0 .. :try_end_14} :catchall_15

    goto :goto_9

    .line 95
    .end local v0    # "buffer":[B
    .end local v1    # "out":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "read":I
    :catchall_15
    move-exception v3

    if-eqz p1, :cond_1b

    .line 96
    invoke-static {p0}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    :cond_1b
    throw v3

    .line 93
    .restart local v0    # "buffer":[B
    .restart local v1    # "out":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "read":I
    :cond_1c
    :try_start_1c
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_1f
    .catchall {:try_start_1c .. :try_end_1f} :catchall_15

    move-result-object v3

    .line 95
    if-eqz p1, :cond_25

    .line 96
    invoke-static {p0}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    :cond_25
    return-object v3
.end method

.method public static toString(Ljava/io/Reader;)Ljava/lang/String;
    .registers 5
    .param p0, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 109
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/16 v3, 0x1000

    new-array v0, v3, [C

    .line 111
    .local v0, "buffer":[C
    :goto_9
    invoke-virtual {p0, v0}, Ljava/io/Reader;->read([C)I

    move-result v1

    .local v1, "read":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_15

    .line 112
    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, v1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    goto :goto_9

    .line 114
    :cond_15
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static utf8Reader(Ljava/io/File;)Ljava/io/Reader;
    .registers 2
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 200
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-static {v0}, Lezvcard/util/IOUtils;->utf8Reader(Ljava/io/InputStream;)Ljava/io/Reader;

    move-result-object v0

    return-object v0
.end method

.method public static utf8Reader(Ljava/io/InputStream;)Ljava/io/Reader;
    .registers 3
    .param p0, "in"    # Ljava/io/InputStream;

    .prologue
    .line 190
    new-instance v0, Ljava/io/InputStreamReader;

    sget-object v1, Lezvcard/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    invoke-direct {v0, p0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    return-object v0
.end method

.method public static utf8Writer(Ljava/io/File;)Ljava/io/Writer;
    .registers 2
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 169
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lezvcard/util/IOUtils;->utf8Writer(Ljava/io/File;Z)Ljava/io/Writer;

    move-result-object v0

    return-object v0
.end method

.method public static utf8Writer(Ljava/io/File;Z)Ljava/io/Writer;
    .registers 3
    .param p0, "file"    # Ljava/io/File;
    .param p1, "append"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 181
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    invoke-static {v0}, Lezvcard/util/IOUtils;->utf8Writer(Ljava/io/OutputStream;)Ljava/io/Writer;

    move-result-object v0

    return-object v0
.end method

.method public static utf8Writer(Ljava/io/OutputStream;)Ljava/io/Writer;
    .registers 3
    .param p0, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 159
    new-instance v0, Ljava/io/OutputStreamWriter;

    sget-object v1, Lezvcard/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    invoke-direct {v0, p0, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    return-object v0
.end method
