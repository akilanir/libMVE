.class public Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;
.super Ljava/lang/Object;
.source "DefaultFieldBuilder.java"

# interfaces
.implements Lorg/apache/james/mime4j/stream/FieldBuilder;


# static fields
.field private static final FIELD_CHARS:Ljava/util/BitSet;


# instance fields
.field private final buf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

.field private final maxlen:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 34
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1}, Ljava/util/BitSet;-><init>()V

    sput-object v1, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;->FIELD_CHARS:Ljava/util/BitSet;

    .line 37
    const/16 v0, 0x21

    .local v0, "i":I
    :goto_9
    const/16 v1, 0x39

    if-gt v0, v1, :cond_15

    .line 38
    sget-object v1, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;->FIELD_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 37
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 40
    :cond_15
    const/16 v0, 0x3b

    :goto_17
    const/16 v1, 0x7e

    if-gt v0, v1, :cond_23

    .line 41
    sget-object v1, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;->FIELD_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 40
    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    .line 43
    :cond_23
    return-void
.end method

.method public constructor <init>(I)V
    .registers 4
    .param p1, "maxlen"    # I

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    const/16 v1, 0x400

    invoke-direct {v0, v1}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;->buf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    .line 50
    iput p1, p0, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;->maxlen:I

    .line 51
    return-void
.end method


# virtual methods
.method public append(Lorg/apache/james/mime4j/util/ByteArrayBuffer;)V
    .registers 7
    .param p1, "line"    # Lorg/apache/james/mime4j/util/ByteArrayBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/io/MaxHeaderLengthLimitException;
        }
    .end annotation

    .prologue
    .line 58
    if-nez p1, :cond_3

    .line 66
    :goto_2
    return-void

    .line 61
    :cond_3
    invoke-virtual {p1}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->length()I

    move-result v0

    .line 62
    .local v0, "len":I
    iget v1, p0, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;->maxlen:I

    if-lez v1, :cond_1e

    iget-object v1, p0, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;->buf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v1}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->length()I

    move-result v1

    add-int/2addr v1, v0

    iget v2, p0, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;->maxlen:I

    if-lt v1, v2, :cond_1e

    .line 63
    new-instance v1, Lorg/apache/james/mime4j/io/MaxHeaderLengthLimitException;

    const-string v2, "Maximum header length limit exceeded"

    invoke-direct {v1, v2}, Lorg/apache/james/mime4j/io/MaxHeaderLengthLimitException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 65
    :cond_1e
    iget-object v1, p0, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;->buf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {p1}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer()[B

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p1}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->length()I

    move-result v4

    invoke-virtual {v1, v2, v3, v4}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->append([BII)V

    goto :goto_2
.end method

.method public build()Lorg/apache/james/mime4j/stream/RawField;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/MimeException;
        }
    .end annotation

    .prologue
    .line 69
    iget-object v6, p0, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;->buf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v6}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->length()I

    move-result v4

    .line 70
    .local v4, "len":I
    if-lez v4, :cond_24

    .line 71
    iget-object v6, p0, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;->buf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    add-int/lit8 v7, v4, -0x1

    invoke-virtual {v6, v7}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->byteAt(I)B

    move-result v6

    const/16 v7, 0xa

    if-ne v6, v7, :cond_16

    .line 72
    add-int/lit8 v4, v4, -0x1

    .line 74
    :cond_16
    iget-object v6, p0, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;->buf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    add-int/lit8 v7, v4, -0x1

    invoke-virtual {v6, v7}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->byteAt(I)B

    move-result v6

    const/16 v7, 0xd

    if-ne v6, v7, :cond_24

    .line 75
    add-int/lit8 v4, v4, -0x1

    .line 78
    :cond_24
    new-instance v1, Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    iget-object v6, p0, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;->buf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v6}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer()[B

    move-result-object v6

    const/4 v7, 0x0

    invoke-direct {v1, v6, v4, v7}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;-><init>([BIZ)V

    .line 79
    .local v1, "copy":Lorg/apache/james/mime4j/util/ByteArrayBuffer;
    sget-object v6, Lorg/apache/james/mime4j/stream/RawFieldParser;->DEFAULT:Lorg/apache/james/mime4j/stream/RawFieldParser;

    invoke-virtual {v6, v1}, Lorg/apache/james/mime4j/stream/RawFieldParser;->parseField(Lorg/apache/james/mime4j/util/ByteSequence;)Lorg/apache/james/mime4j/stream/RawField;

    move-result-object v2

    .line 80
    .local v2, "field":Lorg/apache/james/mime4j/stream/RawField;
    invoke-virtual {v2}, Lorg/apache/james/mime4j/stream/RawField;->getName()Ljava/lang/String;

    move-result-object v5

    .line 81
    .local v5, "name":Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_3b
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v3, v6, :cond_6d

    .line 82
    invoke-virtual {v5, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 83
    .local v0, "ch":C
    sget-object v6, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;->FIELD_CHARS:Ljava/util/BitSet;

    invoke-virtual {v6, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v6

    if-nez v6, :cond_6a

    .line 84
    new-instance v6, Lorg/apache/james/mime4j/MimeException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "MIME field name contains illegal characters: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Lorg/apache/james/mime4j/stream/RawField;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/james/mime4j/MimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 81
    :cond_6a
    add-int/lit8 v3, v3, 0x1

    goto :goto_3b

    .line 88
    .end local v0    # "ch":C
    :cond_6d
    return-object v2
.end method

.method public getRaw()Lorg/apache/james/mime4j/util/ByteArrayBuffer;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;->buf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    return-object v0
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lorg/apache/james/mime4j/stream/DefaultFieldBuilder;->buf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v0}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->clear()V

    .line 55
    return-void
.end method
