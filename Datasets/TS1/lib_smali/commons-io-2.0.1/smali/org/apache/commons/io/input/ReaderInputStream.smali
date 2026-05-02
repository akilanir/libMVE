.class public Lorg/apache/commons/io/input/ReaderInputStream;
.super Ljava/io/InputStream;
.source "ReaderInputStream.java"


# static fields
.field private static final DEFAULT_BUFFER_SIZE:I = 0x400


# instance fields
.field private final encoder:Ljava/nio/charset/CharsetEncoder;

.field private final encoderIn:Ljava/nio/CharBuffer;

.field private final encoderOut:Ljava/nio/ByteBuffer;

.field private endOfInput:Z

.field private lastCoderResult:Ljava/nio/charset/CoderResult;

.field private final reader:Ljava/io/Reader;


# direct methods
.method public constructor <init>(Ljava/io/Reader;)V
    .registers 3
    .param p1, "reader"    # Ljava/io/Reader;

    .prologue
    .line 153
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/io/input/ReaderInputStream;-><init>(Ljava/io/Reader;Ljava/nio/charset/Charset;)V

    .line 154
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;Ljava/lang/String;)V
    .registers 4
    .param p1, "reader"    # Ljava/io/Reader;
    .param p2, "charsetName"    # Ljava/lang/String;

    .prologue
    .line 143
    const/16 v0, 0x400

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/io/input/ReaderInputStream;-><init>(Ljava/io/Reader;Ljava/lang/String;I)V

    .line 144
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;Ljava/lang/String;I)V
    .registers 5
    .param p1, "reader"    # Ljava/io/Reader;
    .param p2, "charsetName"    # Ljava/lang/String;
    .param p3, "bufferSize"    # I

    .prologue
    .line 132
    invoke-static {p2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-direct {p0, p1, v0, p3}, Lorg/apache/commons/io/input/ReaderInputStream;-><init>(Ljava/io/Reader;Ljava/nio/charset/Charset;I)V

    .line 133
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;Ljava/nio/charset/Charset;)V
    .registers 4
    .param p1, "reader"    # Ljava/io/Reader;
    .param p2, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 121
    const/16 v0, 0x400

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/io/input/ReaderInputStream;-><init>(Ljava/io/Reader;Ljava/nio/charset/Charset;I)V

    .line 122
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;Ljava/nio/charset/Charset;I)V
    .registers 5
    .param p1, "reader"    # Ljava/io/Reader;
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .param p3, "bufferSize"    # I

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 94
    const/16 v0, 0x80

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/io/input/ReaderInputStream;->encoderOut:Ljava/nio/ByteBuffer;

    .line 107
    iput-object p1, p0, Lorg/apache/commons/io/input/ReaderInputStream;->reader:Ljava/io/Reader;

    .line 108
    invoke-virtual {p2}, Ljava/nio/charset/Charset;->newEncoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/io/input/ReaderInputStream;->encoder:Ljava/nio/charset/CharsetEncoder;

    .line 109
    invoke-static {p3}, Ljava/nio/CharBuffer;->allocate(I)Ljava/nio/CharBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/io/input/ReaderInputStream;->encoderIn:Ljava/nio/CharBuffer;

    .line 110
    iget-object v0, p0, Lorg/apache/commons/io/input/ReaderInputStream;->encoderIn:Ljava/nio/CharBuffer;

    invoke-virtual {v0}, Ljava/nio/CharBuffer;->flip()Ljava/nio/Buffer;

    .line 111
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 235
    iget-object v0, p0, Lorg/apache/commons/io/input/ReaderInputStream;->reader:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    .line 236
    return-void
.end method

.method public read()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 224
    const/4 v2, 0x1

    new-array v0, v2, [B

    .line 225
    .local v0, "b":[B
    invoke-virtual {p0, v0}, Lorg/apache/commons/io/input/ReaderInputStream;->read([B)I

    move-result v2

    if-ne v2, v1, :cond_b

    :goto_a
    return v1

    :cond_b
    const/4 v1, 0x0

    aget-byte v1, v0, v1

    and-int/lit16 v1, v1, 0xff

    goto :goto_a
.end method

.method public read([B)I
    .registers 4
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 212
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/io/input/ReaderInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .registers 12
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    .line 168
    const/4 v2, 0x0

    .line 169
    .local v2, "read":I
    :cond_2
    :goto_2
    if-lez p3, :cond_7a

    .line 170
    iget-object v4, p0, Lorg/apache/commons/io/input/ReaderInputStream;->encoderOut:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    if-lez v4, :cond_29

    .line 171
    iget-object v4, p0, Lorg/apache/commons/io/input/ReaderInputStream;->encoderOut:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 172
    iget-object v4, p0, Lorg/apache/commons/io/input/ReaderInputStream;->encoderOut:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    invoke-static {v4, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 173
    .local v0, "c":I
    iget-object v4, p0, Lorg/apache/commons/io/input/ReaderInputStream;->encoderOut:Ljava/nio/ByteBuffer;

    invoke-virtual {v4, p1, p2, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 174
    add-int/2addr p2, v0

    .line 175
    sub-int/2addr p3, v0

    .line 176
    add-int/2addr v2, v0

    .line 177
    iget-object v4, p0, Lorg/apache/commons/io/input/ReaderInputStream;->encoderOut:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->compact()Ljava/nio/ByteBuffer;

    goto :goto_2

    .line 179
    .end local v0    # "c":I
    :cond_29
    iget-boolean v4, p0, Lorg/apache/commons/io/input/ReaderInputStream;->endOfInput:Z

    if-nez v4, :cond_60

    iget-object v4, p0, Lorg/apache/commons/io/input/ReaderInputStream;->lastCoderResult:Ljava/nio/charset/CoderResult;

    if-eqz v4, :cond_39

    iget-object v4, p0, Lorg/apache/commons/io/input/ReaderInputStream;->lastCoderResult:Ljava/nio/charset/CoderResult;

    invoke-virtual {v4}, Ljava/nio/charset/CoderResult;->isUnderflow()Z

    move-result v4

    if-eqz v4, :cond_60

    .line 180
    :cond_39
    iget-object v4, p0, Lorg/apache/commons/io/input/ReaderInputStream;->encoderIn:Ljava/nio/CharBuffer;

    invoke-virtual {v4}, Ljava/nio/CharBuffer;->compact()Ljava/nio/CharBuffer;

    .line 181
    iget-object v4, p0, Lorg/apache/commons/io/input/ReaderInputStream;->encoderIn:Ljava/nio/CharBuffer;

    invoke-virtual {v4}, Ljava/nio/CharBuffer;->position()I

    move-result v1

    .line 185
    .local v1, "position":I
    iget-object v4, p0, Lorg/apache/commons/io/input/ReaderInputStream;->reader:Ljava/io/Reader;

    iget-object v5, p0, Lorg/apache/commons/io/input/ReaderInputStream;->encoderIn:Ljava/nio/CharBuffer;

    invoke-virtual {v5}, Ljava/nio/CharBuffer;->array()[C

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/io/input/ReaderInputStream;->encoderIn:Ljava/nio/CharBuffer;

    invoke-virtual {v6}, Ljava/nio/CharBuffer;->remaining()I

    move-result v6

    invoke-virtual {v4, v5, v1, v6}, Ljava/io/Reader;->read([CII)I

    move-result v0

    .line 186
    .restart local v0    # "c":I
    if-ne v0, v3, :cond_82

    .line 187
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/apache/commons/io/input/ReaderInputStream;->endOfInput:Z

    .line 191
    :goto_5b
    iget-object v4, p0, Lorg/apache/commons/io/input/ReaderInputStream;->encoderIn:Ljava/nio/CharBuffer;

    invoke-virtual {v4}, Ljava/nio/CharBuffer;->flip()Ljava/nio/Buffer;

    .line 193
    .end local v0    # "c":I
    .end local v1    # "position":I
    :cond_60
    iget-object v4, p0, Lorg/apache/commons/io/input/ReaderInputStream;->encoder:Ljava/nio/charset/CharsetEncoder;

    iget-object v5, p0, Lorg/apache/commons/io/input/ReaderInputStream;->encoderIn:Ljava/nio/CharBuffer;

    iget-object v6, p0, Lorg/apache/commons/io/input/ReaderInputStream;->encoderOut:Ljava/nio/ByteBuffer;

    iget-boolean v7, p0, Lorg/apache/commons/io/input/ReaderInputStream;->endOfInput:Z

    invoke-virtual {v4, v5, v6, v7}, Ljava/nio/charset/CharsetEncoder;->encode(Ljava/nio/CharBuffer;Ljava/nio/ByteBuffer;Z)Ljava/nio/charset/CoderResult;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/io/input/ReaderInputStream;->lastCoderResult:Ljava/nio/charset/CoderResult;

    .line 194
    iget-boolean v4, p0, Lorg/apache/commons/io/input/ReaderInputStream;->endOfInput:Z

    if-eqz v4, :cond_2

    iget-object v4, p0, Lorg/apache/commons/io/input/ReaderInputStream;->encoderOut:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    if-nez v4, :cond_2

    .line 199
    :cond_7a
    if-nez v2, :cond_81

    iget-boolean v4, p0, Lorg/apache/commons/io/input/ReaderInputStream;->endOfInput:Z

    if-eqz v4, :cond_81

    move v2, v3

    .end local v2    # "read":I
    :cond_81
    return v2

    .line 189
    .restart local v0    # "c":I
    .restart local v1    # "position":I
    .restart local v2    # "read":I
    :cond_82
    iget-object v4, p0, Lorg/apache/commons/io/input/ReaderInputStream;->encoderIn:Ljava/nio/CharBuffer;

    add-int v5, v1, v0

    invoke-virtual {v4, v5}, Ljava/nio/CharBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_5b
.end method
