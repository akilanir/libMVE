.class Lorg/apache/commons/compress/archivers/zip/BitStream;
.super Lorg/apache/commons/compress/utils/BitInputStream;
.source "BitStream.java"


# direct methods
.method constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 36
    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/utils/BitInputStream;-><init>(Ljava/io/InputStream;Ljava/nio/ByteOrder;)V

    .line 37
    return-void
.end method


# virtual methods
.method nextBit()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/zip/BitStream;->readBits(I)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method nextBits(I)J
    .registers 4
    .param p1, "n"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    invoke-virtual {p0, p1}, Lorg/apache/commons/compress/archivers/zip/BitStream;->readBits(I)J

    move-result-wide v0

    return-wide v0
.end method

.method nextByte()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/zip/BitStream;->readBits(I)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method
