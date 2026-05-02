.class public Lch/qos/logback/core/encoder/ObjectStreamEncoder;
.super Lch/qos/logback/core/encoder/EncoderBase;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/encoder/EncoderBase",
        "<TE;>;"
    }
.end annotation


# static fields
.field public static final START_PEBBLE:I = 0x6e78f671

.field public static final STOP_PEBBLE:I = 0x262b5373


# instance fields
.field private MAX_BUFFER_SIZE:I

.field bufferList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lch/qos/logback/core/encoder/EncoderBase;-><init>()V

    const/16 v0, 0x64

    iput v0, p0, Lch/qos/logback/core/encoder/ObjectStreamEncoder;->MAX_BUFFER_SIZE:I

    new-instance v0, Ljava/util/ArrayList;

    iget v1, p0, Lch/qos/logback/core/encoder/ObjectStreamEncoder;->MAX_BUFFER_SIZE:I

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lch/qos/logback/core/encoder/ObjectStreamEncoder;->bufferList:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/encoder/ObjectStreamEncoder;->writeBuffer()V

    return-void
.end method

.method public doEncode(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/encoder/ObjectStreamEncoder;->bufferList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lch/qos/logback/core/encoder/ObjectStreamEncoder;->bufferList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget v1, p0, Lch/qos/logback/core/encoder/ObjectStreamEncoder;->MAX_BUFFER_SIZE:I

    if-ne v0, v1, :cond_12

    invoke-virtual {p0}, Lch/qos/logback/core/encoder/ObjectStreamEncoder;->writeBuffer()V

    :cond_12
    return-void
.end method

.method public init(Ljava/io/OutputStream;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-super {p0, p1}, Lch/qos/logback/core/encoder/EncoderBase;->init(Ljava/io/OutputStream;)V

    iget-object v0, p0, Lch/qos/logback/core/encoder/ObjectStreamEncoder;->bufferList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-void
.end method

.method writeBuffer()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v1, 0x2710

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    iget-object v1, p0, Lch/qos/logback/core/encoder/ObjectStreamEncoder;->bufferList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lch/qos/logback/core/encoder/ObjectStreamEncoder;->writeHeader(Ljava/io/ByteArrayOutputStream;I)V

    new-instance v2, Ljava/io/ObjectOutputStream;

    invoke-direct {v2, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    iget-object v3, p0, Lch/qos/logback/core/encoder/ObjectStreamEncoder;->bufferList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_29

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    goto :goto_1b

    :cond_29
    iget-object v3, p0, Lch/qos/logback/core/encoder/ObjectStreamEncoder;->bufferList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->flush()V

    invoke-virtual {p0, v0, v1}, Lch/qos/logback/core/encoder/ObjectStreamEncoder;->writeFooter(Ljava/io/ByteArrayOutputStream;I)V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/encoder/ObjectStreamEncoder;->writeEndPosition([B)V

    iget-object v1, p0, Lch/qos/logback/core/encoder/ObjectStreamEncoder;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    return-void
.end method

.method writeEndPosition([B)V
    .registers 4

    const/16 v0, 0x8

    array-length v1, p1

    sub-int/2addr v1, v0

    invoke-static {p1, v0, v1}, Lch/qos/logback/core/encoder/ByteArrayUtil;->writeInt([BII)V

    return-void
.end method

.method writeFooter(Ljava/io/ByteArrayOutputStream;I)V
    .registers 4

    const v0, 0x262b5373

    invoke-static {p1, v0}, Lch/qos/logback/core/encoder/ByteArrayUtil;->writeInt(Ljava/io/ByteArrayOutputStream;I)V

    xor-int/2addr v0, p2

    invoke-static {p1, v0}, Lch/qos/logback/core/encoder/ByteArrayUtil;->writeInt(Ljava/io/ByteArrayOutputStream;I)V

    return-void
.end method

.method writeHeader(Ljava/io/ByteArrayOutputStream;I)V
    .registers 5

    const v1, 0x6e78f671

    invoke-static {p1, v1}, Lch/qos/logback/core/encoder/ByteArrayUtil;->writeInt(Ljava/io/ByteArrayOutputStream;I)V

    invoke-static {p1, p2}, Lch/qos/logback/core/encoder/ByteArrayUtil;->writeInt(Ljava/io/ByteArrayOutputStream;I)V

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lch/qos/logback/core/encoder/ByteArrayUtil;->writeInt(Ljava/io/ByteArrayOutputStream;I)V

    xor-int v0, v1, p2

    invoke-static {p1, v0}, Lch/qos/logback/core/encoder/ByteArrayUtil;->writeInt(Ljava/io/ByteArrayOutputStream;I)V

    return-void
.end method
