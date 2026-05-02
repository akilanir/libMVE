.class public Lorg/tukaani/xz/common/EncoderUtil;
.super Lorg/tukaani/xz/common/Util;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/tukaani/xz/common/Util;-><init>()V

    return-void
.end method

.method public static encodeVLI(Ljava/io/OutputStream;J)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v2, 0x80

    :goto_2
    cmp-long v0, p1, v2

    if-ltz v0, :cond_10

    or-long v0, p1, v2

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    const/4 v0, 0x7

    ushr-long/2addr p1, v0

    goto :goto_2

    :cond_10
    long-to-int v0, p1

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    return-void
.end method

.method public static writeCRC32(Ljava/io/OutputStream;[B)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    invoke-virtual {v0, p1}, Ljava/util/zip/CRC32;->update([B)V

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v1

    const/4 v0, 0x0

    :goto_d
    const/4 v3, 0x4

    if-ge v0, v3, :cond_1c

    mul-int/lit8 v3, v0, 0x8

    ushr-long v3, v1, v3

    long-to-int v3, v3

    int-to-byte v3, v3

    invoke-virtual {p0, v3}, Ljava/io/OutputStream;->write(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    :cond_1c
    return-void
.end method
