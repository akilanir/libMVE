.class public final Lorg/spongycastle/util/io/Streams;
.super Ljava/lang/Object;
.source "Streams.java"


# static fields
.field private static BUFFER_SIZE:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 13
    const/16 v0, 0x1000

    sput v0, Lorg/spongycastle/util/io/Streams;->BUFFER_SIZE:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static drain(Ljava/io/InputStream;)V
    .registers 4
    .param p0, "inStr"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 24
    sget v1, Lorg/spongycastle/util/io/Streams;->BUFFER_SIZE:I

    new-array v0, v1, [B

    .line 25
    .local v0, "bs":[B
    :cond_4
    const/4 v1, 0x0

    array-length v2, v0

    invoke-virtual {p0, v0, v1, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    if-gez v1, :cond_4

    .line 28
    return-void
.end method

.method public static pipeAll(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 6
    .param p0, "inStr"    # Ljava/io/InputStream;
    .param p1, "outStr"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 112
    sget v2, Lorg/spongycastle/util/io/Streams;->BUFFER_SIZE:I

    new-array v0, v2, [B

    .line 114
    .local v0, "bs":[B
    :goto_5
    array-length v2, v0

    invoke-virtual {p0, v0, v3, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .local v1, "numRead":I
    if-ltz v1, :cond_10

    .line 116
    invoke-virtual {p1, v0, v3, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_5

    .line 118
    :cond_10
    return-void
.end method

.method public static pipeAllLimited(Ljava/io/InputStream;JLjava/io/OutputStream;)J
    .registers 13
    .param p0, "inStr"    # Ljava/io/InputStream;
    .param p1, "limit"    # J
    .param p3, "outStr"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 131
    const-wide/16 v2, 0x0

    .line 132
    .local v2, "total":J
    sget v4, Lorg/spongycastle/util/io/Streams;->BUFFER_SIZE:I

    new-array v0, v4, [B

    .line 134
    .local v0, "bs":[B
    :goto_7
    array-length v4, v0

    invoke-virtual {p0, v0, v8, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .local v1, "numRead":I
    if-ltz v1, :cond_23

    .line 136
    sub-long v4, p1, v2

    int-to-long v6, v1

    cmp-long v4, v4, v6

    if-gez v4, :cond_1d

    .line 138
    new-instance v4, Lorg/spongycastle/util/io/StreamOverflowException;

    const-string v5, "Data Overflow"

    invoke-direct {v4, v5}, Lorg/spongycastle/util/io/StreamOverflowException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 140
    :cond_1d
    int-to-long v4, v1

    add-long/2addr v2, v4

    .line 141
    invoke-virtual {p3, v0, v8, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_7

    .line 143
    :cond_23
    return-wide v2
.end method

.method public static readAll(Ljava/io/InputStream;)[B
    .registers 3
    .param p0, "inStr"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 41
    .local v0, "buf":Ljava/io/ByteArrayOutputStream;
    invoke-static {p0, v0}, Lorg/spongycastle/util/io/Streams;->pipeAll(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 42
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method public static readAllLimited(Ljava/io/InputStream;I)[B
    .registers 5
    .param p0, "inStr"    # Ljava/io/InputStream;
    .param p1, "limit"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 58
    .local v0, "buf":Ljava/io/ByteArrayOutputStream;
    int-to-long v1, p1

    invoke-static {p0, v1, v2, v0}, Lorg/spongycastle/util/io/Streams;->pipeAllLimited(Ljava/io/InputStream;JLjava/io/OutputStream;)J

    .line 59
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method public static readFully(Ljava/io/InputStream;[B)I
    .registers 4
    .param p0, "inStr"    # Ljava/io/InputStream;
    .param p1, "buf"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    const/4 v0, 0x0

    array-length v1, p1

    invoke-static {p0, p1, v0, v1}, Lorg/spongycastle/util/io/Streams;->readFully(Ljava/io/InputStream;[BII)I

    move-result v0

    return v0
.end method

.method public static readFully(Ljava/io/InputStream;[BII)I
    .registers 8
    .param p0, "inStr"    # Ljava/io/InputStream;
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    const/4 v1, 0x0

    .line 90
    .local v1, "totalRead":I
    :goto_1
    if-ge v1, p3, :cond_d

    .line 92
    add-int v2, p2, v1

    sub-int v3, p3, v1

    invoke-virtual {p0, p1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 93
    .local v0, "numRead":I
    if-gez v0, :cond_e

    .line 99
    .end local v0    # "numRead":I
    :cond_d
    return v1

    .line 97
    .restart local v0    # "numRead":I
    :cond_e
    add-int/2addr v1, v0

    .line 98
    goto :goto_1
.end method
