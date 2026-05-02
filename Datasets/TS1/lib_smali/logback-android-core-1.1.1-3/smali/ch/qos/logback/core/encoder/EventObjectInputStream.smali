.class public Lch/qos/logback/core/encoder/EventObjectInputStream;
.super Ljava/io/InputStream;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/io/InputStream;"
    }
.end annotation


# instance fields
.field buffer:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TE;>;"
        }
    .end annotation
.end field

.field index:I

.field ncis:Lch/qos/logback/core/encoder/NonClosableInputStream;


# direct methods
.method constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/encoder/EventObjectInputStream;->buffer:Ljava/util/List;

    const/4 v0, 0x0

    iput v0, p0, Lch/qos/logback/core/encoder/EventObjectInputStream;->index:I

    new-instance v0, Lch/qos/logback/core/encoder/NonClosableInputStream;

    invoke-direct {v0, p1}, Lch/qos/logback/core/encoder/NonClosableInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lch/qos/logback/core/encoder/EventObjectInputStream;->ncis:Lch/qos/logback/core/encoder/NonClosableInputStream;

    return-void
.end method

.method private internalReset()V
    .registers 2

    const/4 v0, 0x0

    iput v0, p0, Lch/qos/logback/core/encoder/EventObjectInputStream;->index:I

    iget-object v0, p0, Lch/qos/logback/core/encoder/EventObjectInputStream;->buffer:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-void
.end method


# virtual methods
.method public available()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/encoder/EventObjectInputStream;->ncis:Lch/qos/logback/core/encoder/NonClosableInputStream;

    invoke-virtual {v0}, Lch/qos/logback/core/encoder/NonClosableInputStream;->available()I

    move-result v0

    return v0
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/encoder/EventObjectInputStream;->ncis:Lch/qos/logback/core/encoder/NonClosableInputStream;

    invoke-virtual {v0}, Lch/qos/logback/core/encoder/NonClosableInputStream;->realClose()V

    return-void
.end method

.method getFromBuffer()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    iget v0, p0, Lch/qos/logback/core/encoder/EventObjectInputStream;->index:I

    iget-object v1, p0, Lch/qos/logback/core/encoder/EventObjectInputStream;->buffer:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_c

    const/4 v0, 0x0

    :goto_b
    return-object v0

    :cond_c
    iget-object v0, p0, Lch/qos/logback/core/encoder/EventObjectInputStream;->buffer:Ljava/util/List;

    iget v1, p0, Lch/qos/logback/core/encoder/EventObjectInputStream;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lch/qos/logback/core/encoder/EventObjectInputStream;->index:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_b
.end method

.method public read()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Only the readEvent method is supported."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readEvent()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/encoder/EventObjectInputStream;->getFromBuffer()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_7

    :goto_6
    return-object v0

    :cond_7
    invoke-direct {p0}, Lch/qos/logback/core/encoder/EventObjectInputStream;->internalReset()V

    invoke-virtual {p0}, Lch/qos/logback/core/encoder/EventObjectInputStream;->readHeader()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_13

    const/4 v0, 0x0

    goto :goto_6

    :cond_13
    invoke-virtual {p0, v0}, Lch/qos/logback/core/encoder/EventObjectInputStream;->readPayload(I)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/encoder/EventObjectInputStream;->readFooter(I)V

    invoke-virtual {p0}, Lch/qos/logback/core/encoder/EventObjectInputStream;->getFromBuffer()Ljava/lang/Object;

    move-result-object v0

    goto :goto_6
.end method

.method readEvents(Ljava/io/ObjectInputStream;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/ObjectInputStream;",
            ")TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    :try_start_1
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;
    :try_end_4
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_4} :catch_b

    move-result-object v0

    :try_start_5
    iget-object v1, p0, Lch/qos/logback/core/encoder/EventObjectInputStream;->buffer:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_5 .. :try_end_a} :catch_13

    :goto_a
    return-object v0

    :catch_b
    move-exception v0

    move-object v2, v0

    move-object v0, v1

    move-object v1, v2

    :goto_f
    invoke-virtual {v1}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    goto :goto_a

    :catch_13
    move-exception v1

    goto :goto_f
.end method

.method readFooter(I)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const v3, 0x262b5373

    const/16 v0, 0x8

    new-array v0, v0, [B

    iget-object v1, p0, Lch/qos/logback/core/encoder/EventObjectInputStream;->ncis:Lch/qos/logback/core/encoder/NonClosableInputStream;

    invoke-virtual {v1, v0}, Lch/qos/logback/core/encoder/NonClosableInputStream;->read([B)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_18

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Looks like a corrupt stream"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_18
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lch/qos/logback/core/encoder/ByteArrayUtil;->readInt([BI)I

    move-result v1

    if-eq v1, v3, :cond_27

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Looks like a corrupt stream"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_27
    const/4 v1, 0x4

    invoke-static {v0, v1}, Lch/qos/logback/core/encoder/ByteArrayUtil;->readInt([BI)I

    move-result v0

    xor-int v1, v3, p1

    if-eq v0, v1, :cond_38

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Invalid checksum"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_38
    return-void
.end method

.method readHeader()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const v3, 0x6e78f671

    const/4 v0, -0x1

    const/16 v1, 0x10

    new-array v1, v1, [B

    iget-object v2, p0, Lch/qos/logback/core/encoder/EventObjectInputStream;->ncis:Lch/qos/logback/core/encoder/NonClosableInputStream;

    invoke-virtual {v2, v1}, Lch/qos/logback/core/encoder/NonClosableInputStream;->read([B)I

    move-result v2

    if-ne v2, v0, :cond_11

    :cond_10
    return v0

    :cond_11
    const/4 v0, 0x0

    invoke-static {v1, v0}, Lch/qos/logback/core/encoder/ByteArrayUtil;->readInt([BI)I

    move-result v0

    if-eq v0, v3, :cond_20

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Does not look like data created by ObjectStreamEncoder"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_20
    const/4 v0, 0x4

    invoke-static {v1, v0}, Lch/qos/logback/core/encoder/ByteArrayUtil;->readInt([BI)I

    move-result v0

    const/16 v2, 0xc

    invoke-static {v1, v2}, Lch/qos/logback/core/encoder/ByteArrayUtil;->readInt([BI)I

    move-result v1

    xor-int v2, v3, v0

    if-eq v1, v2, :cond_10

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Invalid checksum"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method readPayload(I)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v2, Ljava/io/ObjectInputStream;

    iget-object v0, p0, Lch/qos/logback/core/encoder/EventObjectInputStream;->ncis:Lch/qos/logback/core/encoder/NonClosableInputStream;

    invoke-direct {v2, v0}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    const/4 v0, 0x0

    :goto_d
    if-ge v0, p1, :cond_19

    invoke-virtual {p0, v2}, Lch/qos/logback/core/encoder/EventObjectInputStream;->readEvents(Ljava/io/ObjectInputStream;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    :cond_19
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->close()V

    return-void
.end method
