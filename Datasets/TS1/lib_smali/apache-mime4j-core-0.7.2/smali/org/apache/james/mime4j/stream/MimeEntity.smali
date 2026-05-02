.class Lorg/apache/james/mime4j/stream/MimeEntity;
.super Ljava/lang/Object;
.source "MimeEntity.java"

# interfaces
.implements Lorg/apache/james/mime4j/stream/EntityStateMachine;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/james/mime4j/stream/MimeEntity$1;
    }
.end annotation


# instance fields
.field private body:Lorg/apache/james/mime4j/stream/BodyDescriptor;

.field private final bodyDescBuilder:Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;

.field private final config:Lorg/apache/james/mime4j/stream/MimeConfig;

.field private currentMimePartStream:Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;

.field private dataStream:Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;

.field private endOfHeader:Z

.field private final endState:Lorg/apache/james/mime4j/stream/EntityState;

.field private field:Lorg/apache/james/mime4j/stream/Field;

.field private final fieldBuilder:Lorg/apache/james/mime4j/stream/FieldBuilder;

.field private headerCount:I

.field private final inbuffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

.field private lineCount:I

.field private final lineSource:Lorg/apache/james/mime4j/io/LineNumberSource;

.field private final linebuf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

.field private final monitor:Lorg/apache/james/mime4j/codec/DecodeMonitor;

.field private recursionMode:Lorg/apache/james/mime4j/stream/RecursionMode;

.field private state:Lorg/apache/james/mime4j/stream/EntityState;

.field private tmpbuf:[B


# direct methods
.method constructor <init>(Lorg/apache/james/mime4j/io/LineNumberSource;Ljava/io/InputStream;Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;)V
    .registers 13
    .param p1, "lineSource"    # Lorg/apache/james/mime4j/io/LineNumberSource;
    .param p2, "instream"    # Ljava/io/InputStream;
    .param p3, "bodyDescBuilder"    # Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;

    .prologue
    .line 137
    new-instance v3, Lorg/apache/james/mime4j/stream/MimeConfig;

    invoke-direct {v3}, Lorg/apache/james/mime4j/stream/MimeConfig;-><init>()V

    sget-object v4, Lorg/apache/james/mime4j/stream/EntityState;->T_START_MESSAGE:Lorg/apache/james/mime4j/stream/EntityState;

    sget-object v5, Lorg/apache/james/mime4j/stream/EntityState;->T_END_MESSAGE:Lorg/apache/james/mime4j/stream/EntityState;

    sget-object v6, Lorg/apache/james/mime4j/codec/DecodeMonitor;->SILENT:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    new-instance v7, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;

    const/4 v0, -0x1

    invoke-direct {v7, v0}, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;-><init>(I)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v8, p3

    invoke-direct/range {v0 .. v8}, Lorg/apache/james/mime4j/stream/MimeEntity;-><init>(Lorg/apache/james/mime4j/io/LineNumberSource;Ljava/io/InputStream;Lorg/apache/james/mime4j/stream/MimeConfig;Lorg/apache/james/mime4j/stream/EntityState;Lorg/apache/james/mime4j/stream/EntityState;Lorg/apache/james/mime4j/codec/DecodeMonitor;Lorg/apache/james/mime4j/stream/FieldBuilder;Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;)V

    .line 142
    return-void
.end method

.method constructor <init>(Lorg/apache/james/mime4j/io/LineNumberSource;Ljava/io/InputStream;Lorg/apache/james/mime4j/stream/FieldBuilder;Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;)V
    .registers 14
    .param p1, "lineSource"    # Lorg/apache/james/mime4j/io/LineNumberSource;
    .param p2, "instream"    # Ljava/io/InputStream;
    .param p3, "fieldBuilder"    # Lorg/apache/james/mime4j/stream/FieldBuilder;
    .param p4, "bodyDescBuilder"    # Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;

    .prologue
    .line 126
    new-instance v3, Lorg/apache/james/mime4j/stream/MimeConfig;

    invoke-direct {v3}, Lorg/apache/james/mime4j/stream/MimeConfig;-><init>()V

    sget-object v4, Lorg/apache/james/mime4j/stream/EntityState;->T_START_MESSAGE:Lorg/apache/james/mime4j/stream/EntityState;

    sget-object v5, Lorg/apache/james/mime4j/stream/EntityState;->T_END_MESSAGE:Lorg/apache/james/mime4j/stream/EntityState;

    sget-object v6, Lorg/apache/james/mime4j/codec/DecodeMonitor;->SILENT:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v7, p3

    move-object v8, p4

    invoke-direct/range {v0 .. v8}, Lorg/apache/james/mime4j/stream/MimeEntity;-><init>(Lorg/apache/james/mime4j/io/LineNumberSource;Ljava/io/InputStream;Lorg/apache/james/mime4j/stream/MimeConfig;Lorg/apache/james/mime4j/stream/EntityState;Lorg/apache/james/mime4j/stream/EntityState;Lorg/apache/james/mime4j/codec/DecodeMonitor;Lorg/apache/james/mime4j/stream/FieldBuilder;Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;)V

    .line 131
    return-void
.end method

.method constructor <init>(Lorg/apache/james/mime4j/io/LineNumberSource;Ljava/io/InputStream;Lorg/apache/james/mime4j/stream/MimeConfig;Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;)V
    .registers 14
    .param p1, "lineSource"    # Lorg/apache/james/mime4j/io/LineNumberSource;
    .param p2, "instream"    # Ljava/io/InputStream;
    .param p3, "config"    # Lorg/apache/james/mime4j/stream/MimeConfig;
    .param p4, "bodyDescBuilder"    # Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;

    .prologue
    .line 114
    sget-object v4, Lorg/apache/james/mime4j/stream/EntityState;->T_START_MESSAGE:Lorg/apache/james/mime4j/stream/EntityState;

    sget-object v5, Lorg/apache/james/mime4j/stream/EntityState;->T_END_MESSAGE:Lorg/apache/james/mime4j/stream/EntityState;

    invoke-virtual {p3}, Lorg/apache/james/mime4j/stream/MimeConfig;->isStrictParsing()Z

    move-result v0

    if-eqz v0, :cond_1e

    sget-object v6, Lorg/apache/james/mime4j/codec/DecodeMonitor;->STRICT:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    :goto_c
    new-instance v7, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;

    invoke-virtual {p3}, Lorg/apache/james/mime4j/stream/MimeConfig;->getMaxHeaderLen()I

    move-result v0

    invoke-direct {v7, v0}, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;-><init>(I)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v8, p4

    invoke-direct/range {v0 .. v8}, Lorg/apache/james/mime4j/stream/MimeEntity;-><init>(Lorg/apache/james/mime4j/io/LineNumberSource;Ljava/io/InputStream;Lorg/apache/james/mime4j/stream/MimeConfig;Lorg/apache/james/mime4j/stream/EntityState;Lorg/apache/james/mime4j/stream/EntityState;Lorg/apache/james/mime4j/codec/DecodeMonitor;Lorg/apache/james/mime4j/stream/FieldBuilder;Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;)V

    .line 119
    return-void

    .line 114
    :cond_1e
    sget-object v6, Lorg/apache/james/mime4j/codec/DecodeMonitor;->SILENT:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    goto :goto_c
.end method

.method constructor <init>(Lorg/apache/james/mime4j/io/LineNumberSource;Ljava/io/InputStream;Lorg/apache/james/mime4j/stream/MimeConfig;Lorg/apache/james/mime4j/stream/EntityState;Lorg/apache/james/mime4j/stream/EntityState;Lorg/apache/james/mime4j/codec/DecodeMonitor;Lorg/apache/james/mime4j/stream/FieldBuilder;Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;)V
    .registers 12
    .param p1, "lineSource"    # Lorg/apache/james/mime4j/io/LineNumberSource;
    .param p2, "instream"    # Ljava/io/InputStream;
    .param p3, "config"    # Lorg/apache/james/mime4j/stream/MimeConfig;
    .param p4, "startState"    # Lorg/apache/james/mime4j/stream/EntityState;
    .param p5, "endState"    # Lorg/apache/james/mime4j/stream/EntityState;
    .param p6, "monitor"    # Lorg/apache/james/mime4j/codec/DecodeMonitor;
    .param p7, "fieldBuilder"    # Lorg/apache/james/mime4j/stream/FieldBuilder;
    .param p8, "bodyDescBuilder"    # Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;

    .prologue
    const/4 v2, 0x0

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput-object p3, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->config:Lorg/apache/james/mime4j/stream/MimeConfig;

    .line 77
    iput-object p4, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    .line 78
    iput-object p5, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->endState:Lorg/apache/james/mime4j/stream/EntityState;

    .line 79
    iput-object p6, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->monitor:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    .line 80
    iput-object p7, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->fieldBuilder:Lorg/apache/james/mime4j/stream/FieldBuilder;

    .line 81
    iput-object p8, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->bodyDescBuilder:Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;

    .line 82
    new-instance v0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->linebuf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    .line 83
    iput v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->lineCount:I

    .line 84
    iput-boolean v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->endOfHeader:Z

    .line 85
    iput v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->headerCount:I

    .line 86
    iput-object p1, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->lineSource:Lorg/apache/james/mime4j/io/LineNumberSource;

    .line 87
    new-instance v0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    const/16 v1, 0x1000

    invoke-virtual {p3}, Lorg/apache/james/mime4j/stream/MimeConfig;->getMaxLineLen()I

    move-result v2

    invoke-direct {v0, p2, v1, v2}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;-><init>(Ljava/io/InputStream;II)V

    iput-object v0, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->inbuffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    .line 91
    new-instance v0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;

    iget-object v1, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->inbuffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {p3}, Lorg/apache/james/mime4j/stream/MimeConfig;->getMaxLineLen()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;-><init>(Ljava/io/InputStream;I)V

    iput-object v0, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->dataStream:Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;

    .line 94
    return-void
.end method

.method constructor <init>(Lorg/apache/james/mime4j/io/LineNumberSource;Ljava/io/InputStream;Lorg/apache/james/mime4j/stream/MimeConfig;Lorg/apache/james/mime4j/stream/EntityState;Lorg/apache/james/mime4j/stream/EntityState;Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;)V
    .registers 16
    .param p1, "lineSource"    # Lorg/apache/james/mime4j/io/LineNumberSource;
    .param p2, "instream"    # Ljava/io/InputStream;
    .param p3, "config"    # Lorg/apache/james/mime4j/stream/MimeConfig;
    .param p4, "startState"    # Lorg/apache/james/mime4j/stream/EntityState;
    .param p5, "endState"    # Lorg/apache/james/mime4j/stream/EntityState;
    .param p6, "bodyDescBuilder"    # Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;

    .prologue
    .line 103
    invoke-virtual {p3}, Lorg/apache/james/mime4j/stream/MimeConfig;->isStrictParsing()Z

    move-result v0

    if-eqz v0, :cond_1c

    sget-object v6, Lorg/apache/james/mime4j/codec/DecodeMonitor;->STRICT:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    :goto_8
    new-instance v7, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;

    invoke-virtual {p3}, Lorg/apache/james/mime4j/stream/MimeConfig;->getMaxHeaderLen()I

    move-result v0

    invoke-direct {v7, v0}, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;-><init>(I)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v8, p6

    invoke-direct/range {v0 .. v8}, Lorg/apache/james/mime4j/stream/MimeEntity;-><init>(Lorg/apache/james/mime4j/io/LineNumberSource;Ljava/io/InputStream;Lorg/apache/james/mime4j/stream/MimeConfig;Lorg/apache/james/mime4j/stream/EntityState;Lorg/apache/james/mime4j/stream/EntityState;Lorg/apache/james/mime4j/codec/DecodeMonitor;Lorg/apache/james/mime4j/stream/FieldBuilder;Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;)V

    .line 107
    return-void

    .line 103
    :cond_1c
    sget-object v6, Lorg/apache/james/mime4j/codec/DecodeMonitor;->SILENT:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    goto :goto_8
.end method

.method private advanceToBoundary()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 385
    iget-object v1, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->dataStream:Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;

    invoke-virtual {v1}, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->eof()Z

    move-result v1

    if-nez v1, :cond_1f

    .line 386
    iget-object v1, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->tmpbuf:[B

    if-nez v1, :cond_12

    .line 387
    const/16 v1, 0x800

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->tmpbuf:[B

    .line 389
    :cond_12
    invoke-direct {p0}, Lorg/apache/james/mime4j/stream/MimeEntity;->getLimitedContentStream()Ljava/io/InputStream;

    move-result-object v0

    .line 390
    .local v0, "instream":Ljava/io/InputStream;
    :cond_16
    iget-object v1, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->tmpbuf:[B

    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_16

    .line 393
    .end local v0    # "instream":Ljava/io/InputStream;
    :cond_1f
    return-void
.end method

.method private clearMimePartStream()V
    .registers 4

    .prologue
    .line 378
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->currentMimePartStream:Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;

    .line 379
    new-instance v0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;

    iget-object v1, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->inbuffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->config:Lorg/apache/james/mime4j/stream/MimeConfig;

    invoke-virtual {v2}, Lorg/apache/james/mime4j/stream/MimeConfig;->getMaxLineLen()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;-><init>(Ljava/io/InputStream;I)V

    iput-object v0, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->dataStream:Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;

    .line 382
    return-void
.end method

.method private createMimePartStream()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/MimeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 364
    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->body:Lorg/apache/james/mime4j/stream/BodyDescriptor;

    invoke-interface {v2}, Lorg/apache/james/mime4j/stream/BodyDescriptor;->getBoundary()Ljava/lang/String;

    move-result-object v0

    .line 366
    .local v0, "boundary":Ljava/lang/String;
    :try_start_6
    new-instance v2, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;

    iget-object v3, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->inbuffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    iget-object v4, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->config:Lorg/apache/james/mime4j/stream/MimeConfig;

    invoke-virtual {v4}, Lorg/apache/james/mime4j/stream/MimeConfig;->isStrictParsing()Z

    move-result v4

    invoke-direct {v2, v3, v0, v4}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;-><init>(Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;Ljava/lang/String;Z)V

    iput-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->currentMimePartStream:Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;
    :try_end_15
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6 .. :try_end_15} :catch_25

    .line 372
    new-instance v2, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;

    iget-object v3, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->currentMimePartStream:Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;

    iget-object v4, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->config:Lorg/apache/james/mime4j/stream/MimeConfig;

    invoke-virtual {v4}, Lorg/apache/james/mime4j/stream/MimeConfig;->getMaxLineLen()I

    move-result v4

    invoke-direct {v2, v3, v4}, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;-><init>(Ljava/io/InputStream;I)V

    iput-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->dataStream:Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;

    .line 375
    return-void

    .line 368
    :catch_25
    move-exception v1

    .line 370
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Lorg/apache/james/mime4j/MimeException;

    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lorg/apache/james/mime4j/MimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private decodedStream(Ljava/io/InputStream;)Ljava/io/InputStream;
    .registers 5
    .param p1, "instream"    # Ljava/io/InputStream;

    .prologue
    .line 404
    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->body:Lorg/apache/james/mime4j/stream/BodyDescriptor;

    invoke-interface {v2}, Lorg/apache/james/mime4j/stream/BodyDescriptor;->getTransferEncoding()Ljava/lang/String;

    move-result-object v1

    .line 405
    .local v1, "transferEncoding":Ljava/lang/String;
    invoke-static {v1}, Lorg/apache/james/mime4j/util/MimeUtil;->isBase64Encoding(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_15

    .line 406
    new-instance v0, Lorg/apache/james/mime4j/codec/Base64InputStream;

    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->monitor:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    invoke-direct {v0, p1, v2}, Lorg/apache/james/mime4j/codec/Base64InputStream;-><init>(Ljava/io/InputStream;Lorg/apache/james/mime4j/codec/DecodeMonitor;)V

    .end local p1    # "instream":Ljava/io/InputStream;
    .local v0, "instream":Ljava/io/InputStream;
    move-object p1, v0

    .line 410
    .end local v0    # "instream":Ljava/io/InputStream;
    .restart local p1    # "instream":Ljava/io/InputStream;
    :cond_14
    :goto_14
    return-object p1

    .line 407
    :cond_15
    invoke-static {v1}, Lorg/apache/james/mime4j/util/MimeUtil;->isQuotedPrintableEncoded(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 408
    new-instance v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;

    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->monitor:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    invoke-direct {v0, p1, v2}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;-><init>(Ljava/io/InputStream;Lorg/apache/james/mime4j/codec/DecodeMonitor;)V

    .end local p1    # "instream":Ljava/io/InputStream;
    .restart local v0    # "instream":Ljava/io/InputStream;
    move-object p1, v0

    .end local v0    # "instream":Ljava/io/InputStream;
    .restart local p1    # "instream":Ljava/io/InputStream;
    goto :goto_14
.end method

.method private getDataStream()Lorg/apache/james/mime4j/io/LineReaderInputStream;
    .registers 2

    .prologue
    .line 168
    iget-object v0, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->dataStream:Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;

    return-object v0
.end method

.method private getLimitedContentStream()Ljava/io/InputStream;
    .registers 5

    .prologue
    .line 437
    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->config:Lorg/apache/james/mime4j/stream/MimeConfig;

    invoke-virtual {v2}, Lorg/apache/james/mime4j/stream/MimeConfig;->getMaxContentLen()J

    move-result-wide v0

    .line 438
    .local v0, "maxContentLimit":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-ltz v2, :cond_14

    .line 439
    new-instance v2, Lorg/apache/james/mime4j/io/LimitedInputStream;

    iget-object v3, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->dataStream:Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;

    invoke-direct {v2, v3, v0, v1}, Lorg/apache/james/mime4j/io/LimitedInputStream;-><init>(Ljava/io/InputStream;J)V

    .line 441
    :goto_13
    return-object v2

    :cond_14
    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->dataStream:Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;

    goto :goto_13
.end method

.method private getLineNumber()I
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->lineSource:Lorg/apache/james/mime4j/io/LineNumberSource;

    if-nez v0, :cond_6

    .line 162
    const/4 v0, -0x1

    .line 164
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->lineSource:Lorg/apache/james/mime4j/io/LineNumberSource;

    invoke-interface {v0}, Lorg/apache/james/mime4j/io/LineNumberSource;->getLineNumber()I

    move-result v0

    goto :goto_5
.end method

.method private nextMessage()Lorg/apache/james/mime4j/stream/EntityStateMachine;
    .registers 4

    .prologue
    .line 398
    iget-object v1, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->currentMimePartStream:Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;

    if-eqz v1, :cond_13

    iget-object v0, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->currentMimePartStream:Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;

    .line 399
    .local v0, "instream":Ljava/io/InputStream;
    :goto_6
    invoke-direct {p0, v0}, Lorg/apache/james/mime4j/stream/MimeEntity;->decodedStream(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v0

    .line 400
    sget-object v1, Lorg/apache/james/mime4j/stream/EntityState;->T_START_MESSAGE:Lorg/apache/james/mime4j/stream/EntityState;

    sget-object v2, Lorg/apache/james/mime4j/stream/EntityState;->T_END_MESSAGE:Lorg/apache/james/mime4j/stream/EntityState;

    invoke-direct {p0, v1, v2, v0}, Lorg/apache/james/mime4j/stream/MimeEntity;->nextMimeEntity(Lorg/apache/james/mime4j/stream/EntityState;Lorg/apache/james/mime4j/stream/EntityState;Ljava/io/InputStream;)Lorg/apache/james/mime4j/stream/EntityStateMachine;

    move-result-object v1

    return-object v1

    .line 398
    .end local v0    # "instream":Ljava/io/InputStream;
    :cond_13
    iget-object v0, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->inbuffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    goto :goto_6
.end method

.method private nextMimeEntity()Lorg/apache/james/mime4j/stream/EntityStateMachine;
    .registers 4

    .prologue
    .line 414
    sget-object v0, Lorg/apache/james/mime4j/stream/EntityState;->T_START_BODYPART:Lorg/apache/james/mime4j/stream/EntityState;

    sget-object v1, Lorg/apache/james/mime4j/stream/EntityState;->T_END_BODYPART:Lorg/apache/james/mime4j/stream/EntityState;

    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->currentMimePartStream:Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/james/mime4j/stream/MimeEntity;->nextMimeEntity(Lorg/apache/james/mime4j/stream/EntityState;Lorg/apache/james/mime4j/stream/EntityState;Ljava/io/InputStream;)Lorg/apache/james/mime4j/stream/EntityStateMachine;

    move-result-object v0

    return-object v0
.end method

.method private nextMimeEntity(Lorg/apache/james/mime4j/stream/EntityState;Lorg/apache/james/mime4j/stream/EntityState;Ljava/io/InputStream;)Lorg/apache/james/mime4j/stream/EntityStateMachine;
    .registers 14
    .param p1, "startState"    # Lorg/apache/james/mime4j/stream/EntityState;
    .param p2, "endState"    # Lorg/apache/james/mime4j/stream/EntityState;
    .param p3, "instream"    # Ljava/io/InputStream;

    .prologue
    .line 418
    iget-object v1, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->recursionMode:Lorg/apache/james/mime4j/stream/RecursionMode;

    sget-object v2, Lorg/apache/james/mime4j/stream/RecursionMode;->M_RAW:Lorg/apache/james/mime4j/stream/RecursionMode;

    if-ne v1, v2, :cond_c

    .line 419
    new-instance v9, Lorg/apache/james/mime4j/stream/RawEntity;

    invoke-direct {v9, p3}, Lorg/apache/james/mime4j/stream/RawEntity;-><init>(Ljava/io/InputStream;)V

    .line 432
    :goto_b
    return-object v9

    .line 422
    :cond_c
    new-instance v0, Lorg/apache/james/mime4j/stream/MimeEntity;

    iget-object v1, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->lineSource:Lorg/apache/james/mime4j/io/LineNumberSource;

    iget-object v3, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->config:Lorg/apache/james/mime4j/stream/MimeConfig;

    iget-object v6, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->monitor:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    iget-object v7, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->fieldBuilder:Lorg/apache/james/mime4j/stream/FieldBuilder;

    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->bodyDescBuilder:Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;

    invoke-interface {v2}, Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;->newChild()Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;

    move-result-object v8

    move-object v2, p3

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v8}, Lorg/apache/james/mime4j/stream/MimeEntity;-><init>(Lorg/apache/james/mime4j/io/LineNumberSource;Ljava/io/InputStream;Lorg/apache/james/mime4j/stream/MimeConfig;Lorg/apache/james/mime4j/stream/EntityState;Lorg/apache/james/mime4j/stream/EntityState;Lorg/apache/james/mime4j/codec/DecodeMonitor;Lorg/apache/james/mime4j/stream/FieldBuilder;Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;)V

    .line 431
    .local v0, "mimeentity":Lorg/apache/james/mime4j/stream/MimeEntity;
    iget-object v1, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->recursionMode:Lorg/apache/james/mime4j/stream/RecursionMode;

    invoke-virtual {v0, v1}, Lorg/apache/james/mime4j/stream/MimeEntity;->setRecursionMode(Lorg/apache/james/mime4j/stream/RecursionMode;)V

    move-object v9, v0

    .line 432
    goto :goto_b
.end method

.method private readRawField()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/james/mime4j/MimeException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 203
    iget-boolean v4, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->endOfHeader:Z

    if-eqz v4, :cond_b

    .line 204
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    throw v4

    .line 205
    :cond_b
    invoke-direct {p0}, Lorg/apache/james/mime4j/stream/MimeEntity;->getDataStream()Lorg/apache/james/mime4j/io/LineReaderInputStream;

    move-result-object v2

    .line 210
    .local v2, "instream":Lorg/apache/james/mime4j/io/LineReaderInputStream;
    :cond_f
    :try_start_f
    iget-object v4, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->linebuf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v4}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->length()I

    move-result v3

    .line 211
    .local v3, "len":I
    if-lez v3, :cond_1e

    .line 212
    iget-object v4, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->fieldBuilder:Lorg/apache/james/mime4j/stream/FieldBuilder;

    iget-object v5, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->linebuf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-interface {v4, v5}, Lorg/apache/james/mime4j/stream/FieldBuilder;->append(Lorg/apache/james/mime4j/util/ByteArrayBuffer;)V

    .line 214
    :cond_1e
    iget-object v4, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->linebuf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v4}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->clear()V

    .line 215
    iget-object v4, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->linebuf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v2, v4}, Lorg/apache/james/mime4j/io/LineReaderInputStream;->readLine(Lorg/apache/james/mime4j/util/ByteArrayBuffer;)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_35

    .line 216
    sget-object v4, Lorg/apache/james/mime4j/stream/Event;->HEADERS_PREMATURE_END:Lorg/apache/james/mime4j/stream/Event;

    invoke-virtual {p0, v4}, Lorg/apache/james/mime4j/stream/MimeEntity;->monitor(Lorg/apache/james/mime4j/stream/Event;)V

    .line 217
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->endOfHeader:Z

    .line 244
    :goto_34
    return-void

    .line 220
    :cond_35
    iget-object v4, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->linebuf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v4}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->length()I

    move-result v3

    .line 221
    if-lez v3, :cond_4b

    iget-object v4, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->linebuf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    add-int/lit8 v5, v3, -0x1

    invoke-virtual {v4, v5}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->byteAt(I)B

    move-result v4

    const/16 v5, 0xa

    if-ne v4, v5, :cond_4b

    .line 222
    add-int/lit8 v3, v3, -0x1

    .line 224
    :cond_4b
    if-lez v3, :cond_5b

    iget-object v4, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->linebuf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    add-int/lit8 v5, v3, -0x1

    invoke-virtual {v4, v5}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->byteAt(I)B

    move-result v4

    const/16 v5, 0xd

    if-ne v4, v5, :cond_5b

    .line 225
    add-int/lit8 v3, v3, -0x1

    .line 227
    :cond_5b
    if-nez v3, :cond_68

    .line 229
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->endOfHeader:Z
    :try_end_60
    .catch Lorg/apache/james/mime4j/io/MaxLineLimitException; {:try_start_f .. :try_end_60} :catch_61

    goto :goto_34

    .line 241
    .end local v3    # "len":I
    :catch_61
    move-exception v1

    .line 242
    .local v1, "e":Lorg/apache/james/mime4j/io/MaxLineLimitException;
    new-instance v4, Lorg/apache/james/mime4j/MimeException;

    invoke-direct {v4, v1}, Lorg/apache/james/mime4j/MimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 232
    .end local v1    # "e":Lorg/apache/james/mime4j/io/MaxLineLimitException;
    .restart local v3    # "len":I
    :cond_68
    :try_start_68
    iget v4, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->lineCount:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->lineCount:I

    .line 233
    iget v4, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->lineCount:I

    if-le v4, v6, :cond_f

    .line 234
    iget-object v4, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->linebuf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->byteAt(I)B
    :try_end_78
    .catch Lorg/apache/james/mime4j/io/MaxLineLimitException; {:try_start_68 .. :try_end_78} :catch_61

    move-result v0

    .line 235
    .local v0, "ch":I
    const/16 v4, 0x20

    if-eq v0, v4, :cond_f

    const/16 v4, 0x9

    if-eq v0, v4, :cond_f

    goto :goto_34
.end method

.method public static final stateToString(Lorg/apache/james/mime4j/stream/EntityState;)Ljava/lang/String;
    .registers 4
    .param p0, "state"    # Lorg/apache/james/mime4j/stream/EntityState;

    .prologue
    .line 519
    sget-object v1, Lorg/apache/james/mime4j/stream/MimeEntity$1;->$SwitchMap$org$apache$james$mime4j$stream$EntityState:[I

    invoke-virtual {p0}, Lorg/apache/james/mime4j/stream/EntityState;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_38

    .line 563
    const-string v0, "Unknown"

    .line 566
    .local v0, "result":Ljava/lang/String;
    :goto_d
    return-object v0

    .line 521
    .end local v0    # "result":Ljava/lang/String;
    :pswitch_e
    const-string v0, "End of stream"

    .line 522
    .restart local v0    # "result":Ljava/lang/String;
    goto :goto_d

    .line 524
    .end local v0    # "result":Ljava/lang/String;
    :pswitch_11
    const-string v0, "Start message"

    .line 525
    .restart local v0    # "result":Ljava/lang/String;
    goto :goto_d

    .line 527
    .end local v0    # "result":Ljava/lang/String;
    :pswitch_14
    const-string v0, "End message"

    .line 528
    .restart local v0    # "result":Ljava/lang/String;
    goto :goto_d

    .line 530
    .end local v0    # "result":Ljava/lang/String;
    :pswitch_17
    const-string v0, "Raw entity"

    .line 531
    .restart local v0    # "result":Ljava/lang/String;
    goto :goto_d

    .line 533
    .end local v0    # "result":Ljava/lang/String;
    :pswitch_1a
    const-string v0, "Start header"

    .line 534
    .restart local v0    # "result":Ljava/lang/String;
    goto :goto_d

    .line 536
    .end local v0    # "result":Ljava/lang/String;
    :pswitch_1d
    const-string v0, "Field"

    .line 537
    .restart local v0    # "result":Ljava/lang/String;
    goto :goto_d

    .line 539
    .end local v0    # "result":Ljava/lang/String;
    :pswitch_20
    const-string v0, "End header"

    .line 540
    .restart local v0    # "result":Ljava/lang/String;
    goto :goto_d

    .line 542
    .end local v0    # "result":Ljava/lang/String;
    :pswitch_23
    const-string v0, "Start multipart"

    .line 543
    .restart local v0    # "result":Ljava/lang/String;
    goto :goto_d

    .line 545
    .end local v0    # "result":Ljava/lang/String;
    :pswitch_26
    const-string v0, "End multipart"

    .line 546
    .restart local v0    # "result":Ljava/lang/String;
    goto :goto_d

    .line 548
    .end local v0    # "result":Ljava/lang/String;
    :pswitch_29
    const-string v0, "Preamble"

    .line 549
    .restart local v0    # "result":Ljava/lang/String;
    goto :goto_d

    .line 551
    .end local v0    # "result":Ljava/lang/String;
    :pswitch_2c
    const-string v0, "Epilogue"

    .line 552
    .restart local v0    # "result":Ljava/lang/String;
    goto :goto_d

    .line 554
    .end local v0    # "result":Ljava/lang/String;
    :pswitch_2f
    const-string v0, "Start bodypart"

    .line 555
    .restart local v0    # "result":Ljava/lang/String;
    goto :goto_d

    .line 557
    .end local v0    # "result":Ljava/lang/String;
    :pswitch_32
    const-string v0, "End bodypart"

    .line 558
    .restart local v0    # "result":Ljava/lang/String;
    goto :goto_d

    .line 560
    .end local v0    # "result":Ljava/lang/String;
    :pswitch_35
    const-string v0, "Body"

    .line 561
    .restart local v0    # "result":Ljava/lang/String;
    goto :goto_d

    .line 519
    :pswitch_data_38
    .packed-switch 0x1
        :pswitch_11
        :pswitch_2f
        :pswitch_1a
        :pswitch_1d
        :pswitch_20
        :pswitch_23
        :pswitch_29
        :pswitch_2c
        :pswitch_35
        :pswitch_26
        :pswitch_e
        :pswitch_14
        :pswitch_17
        :pswitch_32
    .end packed-switch
.end method


# virtual methods
.method public advance()Lorg/apache/james/mime4j/stream/EntityStateMachine;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/james/mime4j/MimeException;
        }
    .end annotation

    .prologue
    .line 286
    sget-object v2, Lorg/apache/james/mime4j/stream/MimeEntity$1;->$SwitchMap$org$apache$james$mime4j$stream$EntityState:[I

    iget-object v3, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    invoke-virtual {v3}, Lorg/apache/james/mime4j/stream/EntityState;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_fc

    .line 354
    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    iget-object v3, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->endState:Lorg/apache/james/mime4j/stream/EntityState;

    if-ne v2, v3, :cond_dd

    .line 355
    sget-object v2, Lorg/apache/james/mime4j/stream/EntityState;->T_END_OF_STREAM:Lorg/apache/james/mime4j/stream/EntityState;

    iput-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    .line 360
    :cond_17
    :goto_17
    const/4 v2, 0x0

    :goto_18
    return-object v2

    .line 288
    :pswitch_19
    sget-object v2, Lorg/apache/james/mime4j/stream/EntityState;->T_START_HEADER:Lorg/apache/james/mime4j/stream/EntityState;

    iput-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    goto :goto_17

    .line 291
    :pswitch_1e
    sget-object v2, Lorg/apache/james/mime4j/stream/EntityState;->T_START_HEADER:Lorg/apache/james/mime4j/stream/EntityState;

    iput-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    goto :goto_17

    .line 294
    :pswitch_23
    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->bodyDescBuilder:Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;

    invoke-interface {v2}, Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;->reset()V

    .line 296
    :pswitch_28
    invoke-virtual {p0}, Lorg/apache/james/mime4j/stream/MimeEntity;->nextField()Z

    move-result v2

    if-eqz v2, :cond_33

    sget-object v2, Lorg/apache/james/mime4j/stream/EntityState;->T_FIELD:Lorg/apache/james/mime4j/stream/EntityState;

    :goto_30
    iput-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    goto :goto_17

    :cond_33
    sget-object v2, Lorg/apache/james/mime4j/stream/EntityState;->T_END_HEADER:Lorg/apache/james/mime4j/stream/EntityState;

    goto :goto_30

    .line 299
    :pswitch_36
    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->bodyDescBuilder:Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;

    invoke-interface {v2}, Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;->build()Lorg/apache/james/mime4j/stream/BodyDescriptor;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->body:Lorg/apache/james/mime4j/stream/BodyDescriptor;

    .line 300
    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->body:Lorg/apache/james/mime4j/stream/BodyDescriptor;

    invoke-interface {v2}, Lorg/apache/james/mime4j/stream/BodyDescriptor;->getMimeType()Ljava/lang/String;

    move-result-object v1

    .line 301
    .local v1, "mimeType":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->recursionMode:Lorg/apache/james/mime4j/stream/RecursionMode;

    sget-object v3, Lorg/apache/james/mime4j/stream/RecursionMode;->M_FLAT:Lorg/apache/james/mime4j/stream/RecursionMode;

    if-ne v2, v3, :cond_4f

    .line 302
    sget-object v2, Lorg/apache/james/mime4j/stream/EntityState;->T_BODY:Lorg/apache/james/mime4j/stream/EntityState;

    iput-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    goto :goto_17

    .line 303
    :cond_4f
    invoke-static {v1}, Lorg/apache/james/mime4j/util/MimeUtil;->isMultipart(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5d

    .line 304
    sget-object v2, Lorg/apache/james/mime4j/stream/EntityState;->T_START_MULTIPART:Lorg/apache/james/mime4j/stream/EntityState;

    iput-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    .line 305
    invoke-direct {p0}, Lorg/apache/james/mime4j/stream/MimeEntity;->clearMimePartStream()V

    goto :goto_17

    .line 306
    :cond_5d
    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->recursionMode:Lorg/apache/james/mime4j/stream/RecursionMode;

    sget-object v3, Lorg/apache/james/mime4j/stream/RecursionMode;->M_NO_RECURSE:Lorg/apache/james/mime4j/stream/RecursionMode;

    if-eq v2, v3, :cond_72

    invoke-static {v1}, Lorg/apache/james/mime4j/util/MimeUtil;->isMessage(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_72

    .line 308
    sget-object v2, Lorg/apache/james/mime4j/stream/EntityState;->T_BODY:Lorg/apache/james/mime4j/stream/EntityState;

    iput-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    .line 309
    invoke-direct {p0}, Lorg/apache/james/mime4j/stream/MimeEntity;->nextMessage()Lorg/apache/james/mime4j/stream/EntityStateMachine;

    move-result-object v2

    goto :goto_18

    .line 311
    :cond_72
    sget-object v2, Lorg/apache/james/mime4j/stream/EntityState;->T_BODY:Lorg/apache/james/mime4j/stream/EntityState;

    iput-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    goto :goto_17

    .line 315
    .end local v1    # "mimeType":Ljava/lang/String;
    :pswitch_77
    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->dataStream:Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;

    invoke-virtual {v2}, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->isUsed()Z

    move-result v2

    if-eqz v2, :cond_87

    .line 316
    invoke-direct {p0}, Lorg/apache/james/mime4j/stream/MimeEntity;->advanceToBoundary()V

    .line 317
    sget-object v2, Lorg/apache/james/mime4j/stream/EntityState;->T_END_MULTIPART:Lorg/apache/james/mime4j/stream/EntityState;

    iput-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    goto :goto_17

    .line 320
    :cond_87
    invoke-direct {p0}, Lorg/apache/james/mime4j/stream/MimeEntity;->createMimePartStream()V

    .line 321
    sget-object v2, Lorg/apache/james/mime4j/stream/EntityState;->T_PREAMBLE:Lorg/apache/james/mime4j/stream/EntityState;

    iput-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    .line 323
    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->currentMimePartStream:Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;

    invoke-virtual {v2}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->isEmptyStream()Z

    move-result v0

    .line 324
    .local v0, "empty":Z
    if-eqz v0, :cond_17

    .line 331
    .end local v0    # "empty":Z
    :pswitch_96
    invoke-direct {p0}, Lorg/apache/james/mime4j/stream/MimeEntity;->advanceToBoundary()V

    .line 332
    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->currentMimePartStream:Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;

    invoke-virtual {v2}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->eof()Z

    move-result v2

    if-eqz v2, :cond_c3

    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->currentMimePartStream:Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;

    invoke-virtual {v2}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->isLastPart()Z

    move-result v2

    if-nez v2, :cond_c3

    .line 333
    sget-object v2, Lorg/apache/james/mime4j/stream/Event;->MIME_BODY_PREMATURE_END:Lorg/apache/james/mime4j/stream/Event;

    invoke-virtual {p0, v2}, Lorg/apache/james/mime4j/stream/MimeEntity;->monitor(Lorg/apache/james/mime4j/stream/Event;)V

    .line 341
    :cond_ae
    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->currentMimePartStream:Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;

    invoke-virtual {v2}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->isFullyConsumed()Z

    move-result v0

    .line 342
    .restart local v0    # "empty":Z
    invoke-direct {p0}, Lorg/apache/james/mime4j/stream/MimeEntity;->clearMimePartStream()V

    .line 343
    sget-object v2, Lorg/apache/james/mime4j/stream/EntityState;->T_EPILOGUE:Lorg/apache/james/mime4j/stream/EntityState;

    iput-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    .line 344
    if-eqz v0, :cond_17

    .line 347
    .end local v0    # "empty":Z
    :pswitch_bd
    sget-object v2, Lorg/apache/james/mime4j/stream/EntityState;->T_END_MULTIPART:Lorg/apache/james/mime4j/stream/EntityState;

    iput-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    goto/16 :goto_17

    .line 335
    :cond_c3
    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->currentMimePartStream:Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;

    invoke-virtual {v2}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->isLastPart()Z

    move-result v2

    if-nez v2, :cond_ae

    .line 336
    invoke-direct {p0}, Lorg/apache/james/mime4j/stream/MimeEntity;->clearMimePartStream()V

    .line 337
    invoke-direct {p0}, Lorg/apache/james/mime4j/stream/MimeEntity;->createMimePartStream()V

    .line 338
    invoke-direct {p0}, Lorg/apache/james/mime4j/stream/MimeEntity;->nextMimeEntity()Lorg/apache/james/mime4j/stream/EntityStateMachine;

    move-result-object v2

    goto/16 :goto_18

    .line 351
    :pswitch_d7
    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->endState:Lorg/apache/james/mime4j/stream/EntityState;

    iput-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    goto/16 :goto_17

    .line 358
    :cond_dd
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid state: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    invoke-static {v4}, Lorg/apache/james/mime4j/stream/MimeEntity;->stateToString(Lorg/apache/james/mime4j/stream/EntityState;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 286
    :pswitch_data_fc
    .packed-switch 0x1
        :pswitch_19
        :pswitch_1e
        :pswitch_23
        :pswitch_28
        :pswitch_36
        :pswitch_77
        :pswitch_96
        :pswitch_bd
        :pswitch_d7
        :pswitch_d7
    .end packed-switch
.end method

.method public getBodyDescriptor()Lorg/apache/james/mime4j/stream/BodyDescriptor;
    .registers 4

    .prologue
    .line 457
    sget-object v0, Lorg/apache/james/mime4j/stream/MimeEntity$1;->$SwitchMap$org$apache$james$mime4j$stream$EntityState:[I

    invoke-virtual {p0}, Lorg/apache/james/mime4j/stream/MimeEntity;->getState()Lorg/apache/james/mime4j/stream/EntityState;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/james/mime4j/stream/EntityState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_32

    .line 465
    :pswitch_f
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid state :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    invoke-static {v2}, Lorg/apache/james/mime4j/stream/MimeEntity;->stateToString(Lorg/apache/james/mime4j/stream/EntityState;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 463
    :pswitch_2e
    iget-object v0, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->body:Lorg/apache/james/mime4j/stream/BodyDescriptor;

    return-object v0

    .line 457
    nop

    :pswitch_data_32
    .packed-switch 0x6
        :pswitch_2e
        :pswitch_2e
        :pswitch_2e
        :pswitch_2e
        :pswitch_f
        :pswitch_2e
    .end packed-switch
.end method

.method public getContentStream()Ljava/io/InputStream;
    .registers 4

    .prologue
    .line 488
    sget-object v0, Lorg/apache/james/mime4j/stream/MimeEntity$1;->$SwitchMap$org$apache$james$mime4j$stream$EntityState:[I

    iget-object v1, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    invoke-virtual {v1}, Lorg/apache/james/mime4j/stream/EntityState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_32

    .line 495
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    invoke-static {v2}, Lorg/apache/james/mime4j/stream/MimeEntity;->stateToString(Lorg/apache/james/mime4j/stream/EntityState;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 493
    :pswitch_2c
    invoke-direct {p0}, Lorg/apache/james/mime4j/stream/MimeEntity;->getLimitedContentStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0

    .line 488
    nop

    :pswitch_data_32
    .packed-switch 0x6
        :pswitch_2c
        :pswitch_2c
        :pswitch_2c
        :pswitch_2c
    .end packed-switch
.end method

.method public getDecodedContentStream()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 503
    invoke-virtual {p0}, Lorg/apache/james/mime4j/stream/MimeEntity;->getContentStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/james/mime4j/stream/MimeEntity;->decodedStream(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getField()Lorg/apache/james/mime4j/stream/Field;
    .registers 4

    .prologue
    .line 476
    sget-object v0, Lorg/apache/james/mime4j/stream/MimeEntity$1;->$SwitchMap$org$apache$james$mime4j$stream$EntityState:[I

    invoke-virtual {p0}, Lorg/apache/james/mime4j/stream/MimeEntity;->getState()Lorg/apache/james/mime4j/stream/EntityState;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/james/mime4j/stream/EntityState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_32

    .line 480
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid state :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    invoke-static {v2}, Lorg/apache/james/mime4j/stream/MimeEntity;->stateToString(Lorg/apache/james/mime4j/stream/EntityState;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 478
    :pswitch_2e
    iget-object v0, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->field:Lorg/apache/james/mime4j/stream/Field;

    return-object v0

    .line 476
    nop

    :pswitch_data_32
    .packed-switch 0x4
        :pswitch_2e
    .end packed-switch
.end method

.method public getRecursionMode()Lorg/apache/james/mime4j/stream/RecursionMode;
    .registers 2

    .prologue
    .line 149
    iget-object v0, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->recursionMode:Lorg/apache/james/mime4j/stream/RecursionMode;

    return-object v0
.end method

.method public getState()Lorg/apache/james/mime4j/stream/EntityState;
    .registers 2

    .prologue
    .line 145
    iget-object v0, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    return-object v0
.end method

.method protected message(Lorg/apache/james/mime4j/stream/Event;)Ljava/lang/String;
    .registers 6
    .param p1, "event"    # Lorg/apache/james/mime4j/stream/Event;

    .prologue
    .line 180
    if-nez p1, :cond_b

    .line 181
    const-string v1, "Event is unexpectedly null."

    .line 186
    .local v1, "message":Ljava/lang/String;
    :goto_4
    invoke-direct {p0}, Lorg/apache/james/mime4j/stream/MimeEntity;->getLineNumber()I

    move-result v0

    .line 187
    .local v0, "lineNumber":I
    if-gtz v0, :cond_10

    .line 190
    .end local v1    # "message":Ljava/lang/String;
    :goto_a
    return-object v1

    .line 183
    .end local v0    # "lineNumber":I
    :cond_b
    invoke-virtual {p1}, Lorg/apache/james/mime4j/stream/Event;->toString()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "message":Ljava/lang/String;
    goto :goto_4

    .line 190
    .restart local v0    # "lineNumber":I
    :cond_10
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_a
.end method

.method protected monitor(Lorg/apache/james/mime4j/stream/Event;)V
    .registers 5
    .param p1, "event"    # Lorg/apache/james/mime4j/stream/Event;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/MimeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 194
    iget-object v1, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->monitor:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    invoke-virtual {v1}, Lorg/apache/james/mime4j/codec/DecodeMonitor;->isListening()Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 195
    invoke-virtual {p0, p1}, Lorg/apache/james/mime4j/stream/MimeEntity;->message(Lorg/apache/james/mime4j/stream/Event;)Ljava/lang/String;

    move-result-object v0

    .line 196
    .local v0, "message":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->monitor:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    const-string v2, "ignoring"

    invoke-virtual {v1, v0, v2}, Lorg/apache/james/mime4j/codec/DecodeMonitor;->warn(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 197
    new-instance v1, Lorg/apache/james/mime4j/stream/MimeParseEventException;

    invoke-direct {v1, p1}, Lorg/apache/james/mime4j/stream/MimeParseEventException;-><init>(Lorg/apache/james/mime4j/stream/Event;)V

    throw v1

    .line 200
    .end local v0    # "message":Ljava/lang/String;
    :cond_1c
    return-void
.end method

.method protected nextField()Z
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/MimeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 247
    iget-object v7, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->config:Lorg/apache/james/mime4j/stream/MimeConfig;

    invoke-virtual {v7}, Lorg/apache/james/mime4j/stream/MimeConfig;->getMaxHeaderCount()I

    move-result v3

    .line 250
    .local v3, "maxHeaderCount":I
    :cond_7
    iget-boolean v7, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->endOfHeader:Z

    if-eqz v7, :cond_c

    .line 279
    :cond_b
    :goto_b
    return v6

    .line 253
    :cond_c
    if-lez v3, :cond_1a

    iget v7, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->headerCount:I

    if-lt v7, v3, :cond_1a

    .line 254
    new-instance v6, Lorg/apache/james/mime4j/io/MaxHeaderLimitException;

    const-string v7, "Maximum header limit exceeded"

    invoke-direct {v6, v7}, Lorg/apache/james/mime4j/io/MaxHeaderLimitException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 256
    :cond_1a
    iget v7, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->headerCount:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->headerCount:I

    .line 257
    iget-object v7, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->fieldBuilder:Lorg/apache/james/mime4j/stream/FieldBuilder;

    invoke-interface {v7}, Lorg/apache/james/mime4j/stream/FieldBuilder;->reset()V

    .line 258
    invoke-direct {p0}, Lorg/apache/james/mime4j/stream/MimeEntity;->readRawField()V

    .line 260
    :try_start_28
    iget-object v7, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->fieldBuilder:Lorg/apache/james/mime4j/stream/FieldBuilder;

    invoke-interface {v7}, Lorg/apache/james/mime4j/stream/FieldBuilder;->build()Lorg/apache/james/mime4j/stream/RawField;

    move-result-object v5

    .line 261
    .local v5, "rawfield":Lorg/apache/james/mime4j/stream/RawField;
    if-eqz v5, :cond_7

    .line 264
    invoke-virtual {v5}, Lorg/apache/james/mime4j/stream/RawField;->getDelimiterIdx()I

    move-result v7

    invoke-virtual {v5}, Lorg/apache/james/mime4j/stream/RawField;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-eq v7, v8, :cond_43

    .line 265
    sget-object v7, Lorg/apache/james/mime4j/stream/Event;->OBSOLETE_HEADER:Lorg/apache/james/mime4j/stream/Event;

    invoke-virtual {p0, v7}, Lorg/apache/james/mime4j/stream/MimeEntity;->monitor(Lorg/apache/james/mime4j/stream/Event;)V

    .line 267
    :cond_43
    iget-object v7, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->bodyDescBuilder:Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;

    invoke-interface {v7, v5}, Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;->addField(Lorg/apache/james/mime4j/stream/RawField;)Lorg/apache/james/mime4j/stream/Field;

    move-result-object v4

    .line 268
    .local v4, "parsedField":Lorg/apache/james/mime4j/stream/Field;
    if-eqz v4, :cond_4f

    .end local v4    # "parsedField":Lorg/apache/james/mime4j/stream/Field;
    :goto_4b
    iput-object v4, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->field:Lorg/apache/james/mime4j/stream/Field;
    :try_end_4d
    .catch Lorg/apache/james/mime4j/MimeException; {:try_start_28 .. :try_end_4d} :catch_51

    .line 269
    const/4 v6, 0x1

    goto :goto_b

    .restart local v4    # "parsedField":Lorg/apache/james/mime4j/stream/Field;
    :cond_4f
    move-object v4, v5

    .line 268
    goto :goto_4b

    .line 270
    .end local v4    # "parsedField":Lorg/apache/james/mime4j/stream/Field;
    .end local v5    # "rawfield":Lorg/apache/james/mime4j/stream/RawField;
    :catch_51
    move-exception v1

    .line 271
    .local v1, "e":Lorg/apache/james/mime4j/MimeException;
    sget-object v7, Lorg/apache/james/mime4j/stream/Event;->INVALID_HEADER:Lorg/apache/james/mime4j/stream/Event;

    invoke-virtual {p0, v7}, Lorg/apache/james/mime4j/stream/MimeEntity;->monitor(Lorg/apache/james/mime4j/stream/Event;)V

    .line 272
    iget-object v7, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->config:Lorg/apache/james/mime4j/stream/MimeConfig;

    invoke-virtual {v7}, Lorg/apache/james/mime4j/stream/MimeConfig;->isMalformedHeaderStartsBody()Z

    move-result v7

    if-eqz v7, :cond_7

    .line 273
    invoke-direct {p0}, Lorg/apache/james/mime4j/stream/MimeEntity;->getDataStream()Lorg/apache/james/mime4j/io/LineReaderInputStream;

    move-result-object v2

    .line 274
    .local v2, "instream":Lorg/apache/james/mime4j/io/LineReaderInputStream;
    iget-object v7, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->fieldBuilder:Lorg/apache/james/mime4j/stream/FieldBuilder;

    invoke-interface {v7}, Lorg/apache/james/mime4j/stream/FieldBuilder;->getRaw()Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    move-result-object v0

    .line 276
    .local v0, "buf":Lorg/apache/james/mime4j/util/ByteArrayBuffer;
    if-eqz v0, :cond_71

    invoke-virtual {v2, v0}, Lorg/apache/james/mime4j/io/LineReaderInputStream;->unread(Lorg/apache/james/mime4j/util/ByteArrayBuffer;)Z

    move-result v7

    if-nez v7, :cond_b

    .line 277
    :cond_71
    new-instance v6, Lorg/apache/james/mime4j/stream/MimeParseEventException;

    sget-object v7, Lorg/apache/james/mime4j/stream/Event;->INVALID_HEADER:Lorg/apache/james/mime4j/stream/Event;

    invoke-direct {v6, v7}, Lorg/apache/james/mime4j/stream/MimeParseEventException;-><init>(Lorg/apache/james/mime4j/stream/Event;)V

    throw v6
.end method

.method public setRecursionMode(Lorg/apache/james/mime4j/stream/RecursionMode;)V
    .registers 2
    .param p1, "recursionMode"    # Lorg/apache/james/mime4j/stream/RecursionMode;

    .prologue
    .line 153
    iput-object p1, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->recursionMode:Lorg/apache/james/mime4j/stream/RecursionMode;

    .line 154
    return-void
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 157
    iget-object v0, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->inbuffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->truncate()V

    .line 158
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 508
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    invoke-static {v1}, Lorg/apache/james/mime4j/stream/MimeEntity;->stateToString(Lorg/apache/james/mime4j/stream/EntityState;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->body:Lorg/apache/james/mime4j/stream/BodyDescriptor;

    invoke-interface {v1}, Lorg/apache/james/mime4j/stream/BodyDescriptor;->getMimeType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/james/mime4j/stream/MimeEntity;->body:Lorg/apache/james/mime4j/stream/BodyDescriptor;

    invoke-interface {v1}, Lorg/apache/james/mime4j/stream/BodyDescriptor;->getBoundary()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
