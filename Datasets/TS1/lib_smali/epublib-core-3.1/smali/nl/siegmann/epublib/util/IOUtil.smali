.class public Lnl/siegmann/epublib/util/IOUtil;
.super Ljava/lang/Object;
.source "IOUtil.java"


# static fields
.field public static final IO_COPY_BUFFER_SIZE:I = 0x1000


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static calcNewNrReadSize(II)I
    .registers 3
    .param p0, "nrRead"    # I
    .param p1, "totalNrNread"    # I

    .prologue
    .line 55
    if-gez p1, :cond_3

    .line 61
    .end local p1    # "totalNrNread":I
    :goto_2
    return p1

    .line 58
    .restart local p1    # "totalNrNread":I
    :cond_3
    const v0, 0x7fffffff

    sub-int/2addr v0, p0

    if-le p1, v0, :cond_b

    .line 59
    const/4 p1, -0x1

    goto :goto_2

    .line 61
    :cond_b
    add-int/2addr p1, p0

    goto :goto_2
.end method

.method public static copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I
    .registers 6
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    const/16 v3, 0x1000

    new-array v0, v3, [B

    .line 76
    .local v0, "buffer":[B
    const/4 v1, -0x1

    .line 77
    .local v1, "readSize":I
    const/4 v2, 0x0

    .line 78
    .local v2, "result":I
    :goto_6
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    if-ltz v1, :cond_15

    .line 79
    const/4 v3, 0x0

    invoke-virtual {p1, v0, v3, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 80
    invoke-static {v1, v2}, Lnl/siegmann/epublib/util/IOUtil;->calcNewNrReadSize(II)I

    move-result v2

    goto :goto_6

    .line 82
    :cond_15
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 83
    return v2
.end method

.method public static copy(Ljava/io/Reader;Ljava/io/Writer;)I
    .registers 6
    .param p0, "in"    # Ljava/io/Reader;
    .param p1, "out"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    const/16 v3, 0x1000

    new-array v0, v3, [C

    .line 96
    .local v0, "buffer":[C
    const/4 v1, -0x1

    .line 97
    .local v1, "readSize":I
    const/4 v2, 0x0

    .line 98
    .local v2, "result":I
    :goto_6
    invoke-virtual {p0, v0}, Ljava/io/Reader;->read([C)I

    move-result v1

    if-ltz v1, :cond_15

    .line 99
    const/4 v3, 0x0

    invoke-virtual {p1, v0, v3, v1}, Ljava/io/Writer;->write([CII)V

    .line 100
    invoke-static {v1, v2}, Lnl/siegmann/epublib/util/IOUtil;->calcNewNrReadSize(II)I

    move-result v2

    goto :goto_6

    .line 102
    :cond_15
    invoke-virtual {p1}, Ljava/io/Writer;->flush()V

    .line 103
    return v2
.end method

.method public static toByteArray(Ljava/io/InputStream;)[B
    .registers 3
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 43
    .local v0, "result":Ljava/io/ByteArrayOutputStream;
    invoke-static {p0, v0}, Lnl/siegmann/epublib/util/IOUtil;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I

    .line 44
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->flush()V

    .line 45
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method public static toByteArray(Ljava/io/Reader;Ljava/lang/String;)[B
    .registers 4
    .param p0, "in"    # Ljava/io/Reader;
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 28
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 29
    .local v0, "out":Ljava/io/StringWriter;
    invoke-static {p0, v0}, Lnl/siegmann/epublib/util/IOUtil;->copy(Ljava/io/Reader;Ljava/io/Writer;)I

    .line 30
    invoke-virtual {v0}, Ljava/io/StringWriter;->flush()V

    .line 31
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    return-object v1
.end method
