.class public Lorg/tukaani/xz/index/IndexEncoder;
.super Lorg/tukaani/xz/index/IndexBase;


# instance fields
.field private final records:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .registers 3

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "XZ Stream or its Index has grown too big"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/tukaani/xz/index/IndexBase;-><init>(Lorg/tukaani/xz/XZIOException;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/tukaani/xz/index/IndexEncoder;->records:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public add(JJ)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/XZIOException;
        }
    .end annotation

    invoke-super {p0, p1, p2, p3, p4}, Lorg/tukaani/xz/index/IndexBase;->add(JJ)V

    iget-object v0, p0, Lorg/tukaani/xz/index/IndexEncoder;->records:Ljava/util/ArrayList;

    new-instance v1, Lorg/tukaani/xz/index/IndexRecord;

    invoke-direct {v1, p1, p2, p3, p4}, Lorg/tukaani/xz/index/IndexRecord;-><init>(JJ)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public encode(Ljava/io/OutputStream;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    new-instance v2, Ljava/util/zip/CRC32;

    invoke-direct {v2}, Ljava/util/zip/CRC32;-><init>()V

    new-instance v3, Ljava/util/zip/CheckedOutputStream;

    invoke-direct {v3, p1, v2}, Ljava/util/zip/CheckedOutputStream;-><init>(Ljava/io/OutputStream;Ljava/util/zip/Checksum;)V

    invoke-virtual {v3, v1}, Ljava/util/zip/CheckedOutputStream;->write(I)V

    iget-wide v4, p0, Lorg/tukaani/xz/index/IndexEncoder;->recordCount:J

    invoke-static {v3, v4, v5}, Lorg/tukaani/xz/common/EncoderUtil;->encodeVLI(Ljava/io/OutputStream;J)V

    iget-object v0, p0, Lorg/tukaani/xz/index/IndexEncoder;->records:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_19
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_30

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/tukaani/xz/index/IndexRecord;

    iget-wide v5, v0, Lorg/tukaani/xz/index/IndexRecord;->unpadded:J

    invoke-static {v3, v5, v6}, Lorg/tukaani/xz/common/EncoderUtil;->encodeVLI(Ljava/io/OutputStream;J)V

    iget-wide v5, v0, Lorg/tukaani/xz/index/IndexRecord;->uncompressed:J

    invoke-static {v3, v5, v6}, Lorg/tukaani/xz/common/EncoderUtil;->encodeVLI(Ljava/io/OutputStream;J)V

    goto :goto_19

    :cond_30
    invoke-virtual {p0}, Lorg/tukaani/xz/index/IndexEncoder;->getIndexPaddingSize()I

    move-result v0

    :goto_34
    if-lez v0, :cond_3c

    invoke-virtual {v3, v1}, Ljava/util/zip/CheckedOutputStream;->write(I)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_34

    :cond_3c
    invoke-virtual {v2}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v2

    move v0, v1

    :goto_41
    const/4 v1, 0x4

    if-ge v0, v1, :cond_50

    mul-int/lit8 v1, v0, 0x8

    ushr-long v4, v2, v1

    long-to-int v1, v4

    int-to-byte v1, v1

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_41

    :cond_50
    return-void
.end method
