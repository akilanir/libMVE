.class public Lch/qos/logback/core/encoder/LayoutWrappingEncoder;
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


# instance fields
.field private charset:Ljava/nio/charset/Charset;

.field private immediateFlush:Z

.field protected layout:Lch/qos/logback/core/Layout;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lch/qos/logback/core/Layout",
            "<TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/encoder/EncoderBase;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->immediateFlush:Z

    return-void
.end method

.method private appendIfNotNull(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .registers 3

    if-eqz p2, :cond_5

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_5
    return-void
.end method

.method private convertToBytes(Ljava/lang/String;)[B
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->charset:Ljava/nio/charset/Charset;

    if-nez v0, :cond_9

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    :goto_8
    return-object v0

    :cond_9
    :try_start_9
    iget-object v0, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_12
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_9 .. :try_end_12} :catch_14

    move-result-object v0

    goto :goto_8

    :catch_14
    move-exception v0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "An existing charset cannot possibly be unsupported."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public close()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->writeFooter()V

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

    iget-object v0, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->layout:Lch/qos/logback/core/Layout;

    invoke-interface {v0, p1}, Lch/qos/logback/core/Layout;->doLayout(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->outputStream:Ljava/io/OutputStream;

    invoke-direct {p0, v0}, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->convertToBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    iget-boolean v0, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->immediateFlush:Z

    if-eqz v0, :cond_18

    iget-object v0, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    :cond_18
    return-void
.end method

.method public getCharset()Ljava/nio/charset/Charset;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->charset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public getLayout()Lch/qos/logback/core/Layout;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lch/qos/logback/core/Layout",
            "<TE;>;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->layout:Lch/qos/logback/core/Layout;

    return-object v0
.end method

.method public init(Ljava/io/OutputStream;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-super {p0, p1}, Lch/qos/logback/core/encoder/EncoderBase;->init(Ljava/io/OutputStream;)V

    invoke-virtual {p0}, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->writeHeader()V

    return-void
.end method

.method public isImmediateFlush()Z
    .registers 2

    iget-boolean v0, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->immediateFlush:Z

    return v0
.end method

.method public isStarted()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public setCharset(Ljava/nio/charset/Charset;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->charset:Ljava/nio/charset/Charset;

    return-void
.end method

.method public setImmediateFlush(Z)V
    .registers 2

    iput-boolean p1, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->immediateFlush:Z

    return-void
.end method

.method public setLayout(Lch/qos/logback/core/Layout;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/Layout",
            "<TE;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->layout:Lch/qos/logback/core/Layout;

    return-void
.end method

.method public start()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->started:Z

    return-void
.end method

.method public stop()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->started:Z

    iget-object v0, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->outputStream:Ljava/io/OutputStream;

    if-eqz v0, :cond_c

    :try_start_7
    iget-object v0, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_c} :catch_d

    :cond_c
    :goto_c
    return-void

    :catch_d
    move-exception v0

    goto :goto_c
.end method

.method writeFooter()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->layout:Lch/qos/logback/core/Layout;

    if-eqz v0, :cond_37

    iget-object v0, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->outputStream:Ljava/io/OutputStream;

    if-eqz v0, :cond_37

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->layout:Lch/qos/logback/core/Layout;

    invoke-interface {v1}, Lch/qos/logback/core/Layout;->getPresentationFooter()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->appendIfNotNull(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    iget-object v1, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->layout:Lch/qos/logback/core/Layout;

    invoke-interface {v1}, Lch/qos/logback/core/Layout;->getFileFooter()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->appendIfNotNull(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_37

    iget-object v1, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->convertToBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    iget-object v0, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    :cond_37
    return-void
.end method

.method writeHeader()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->layout:Lch/qos/logback/core/Layout;

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->outputStream:Ljava/io/OutputStream;

    if-eqz v0, :cond_3c

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->layout:Lch/qos/logback/core/Layout;

    invoke-interface {v1}, Lch/qos/logback/core/Layout;->getFileHeader()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->appendIfNotNull(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    iget-object v1, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->layout:Lch/qos/logback/core/Layout;

    invoke-interface {v1}, Lch/qos/logback/core/Layout;->getPresentationHeader()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->appendIfNotNull(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_3c

    sget-object v1, Lch/qos/logback/core/CoreConstants;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->convertToBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    iget-object v0, p0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    :cond_3c
    return-void
.end method
