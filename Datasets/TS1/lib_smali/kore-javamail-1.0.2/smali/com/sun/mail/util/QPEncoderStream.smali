.class public Lcom/sun/mail/util/QPEncoderStream;
.super Ljava/io/FilterOutputStream;
.source "QPEncoderStream.java"


# static fields
.field private static final hex:[C


# instance fields
.field private bytesPerLine:I

.field private count:I

.field private gotCR:Z

.field private gotSpace:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 174
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_a

    sput-object v0, Lcom/sun/mail/util/QPEncoderStream;->hex:[C

    return-void

    :array_a
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 80
    const/16 v0, 0x4c

    invoke-direct {p0, p1, v0}, Lcom/sun/mail/util/QPEncoderStream;-><init>(Ljava/io/OutputStream;I)V

    .line 81
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;I)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "bytesPerLine"    # I

    .prologue
    const/4 v0, 0x0

    .line 68
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 55
    iput v0, p0, Lcom/sun/mail/util/QPEncoderStream;->count:I

    .line 57
    iput-boolean v0, p0, Lcom/sun/mail/util/QPEncoderStream;->gotSpace:Z

    .line 58
    iput-boolean v0, p0, Lcom/sun/mail/util/QPEncoderStream;->gotCR:Z

    .line 71
    add-int/lit8 v0, p2, -0x1

    iput v0, p0, Lcom/sun/mail/util/QPEncoderStream;->bytesPerLine:I

    .line 72
    return-void
.end method

.method private outputCRLF()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 168
    iget-object v0, p0, Lcom/sun/mail/util/QPEncoderStream;->out:Ljava/io/OutputStream;

    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 169
    iget-object v0, p0, Lcom/sun/mail/util/QPEncoderStream;->out:Ljava/io/OutputStream;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 170
    const/4 v0, 0x0

    iput v0, p0, Lcom/sun/mail/util/QPEncoderStream;->count:I

    .line 171
    return-void
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 160
    iget-boolean v0, p0, Lcom/sun/mail/util/QPEncoderStream;->gotSpace:Z

    if-eqz v0, :cond_d

    .line 161
    const/16 v0, 0x20

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/sun/mail/util/QPEncoderStream;->output(IZ)V

    .line 162
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/sun/mail/util/QPEncoderStream;->gotSpace:Z

    .line 164
    :cond_d
    iget-object v0, p0, Lcom/sun/mail/util/QPEncoderStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 165
    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 152
    iget-object v0, p0, Lcom/sun/mail/util/QPEncoderStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 153
    return-void
.end method

.method protected output(IZ)V
    .registers 8
    .param p1, "c"    # I
    .param p2, "encode"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0xd

    const/16 v3, 0xa

    const/16 v2, 0x3d

    .line 180
    if-eqz p2, :cond_40

    .line 181
    iget v0, p0, Lcom/sun/mail/util/QPEncoderStream;->count:I

    add-int/lit8 v0, v0, 0x3

    iput v0, p0, Lcom/sun/mail/util/QPEncoderStream;->count:I

    iget v1, p0, Lcom/sun/mail/util/QPEncoderStream;->bytesPerLine:I

    if-le v0, v1, :cond_24

    .line 182
    iget-object v0, p0, Lcom/sun/mail/util/QPEncoderStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 183
    iget-object v0, p0, Lcom/sun/mail/util/QPEncoderStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, v4}, Ljava/io/OutputStream;->write(I)V

    .line 184
    iget-object v0, p0, Lcom/sun/mail/util/QPEncoderStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, v3}, Ljava/io/OutputStream;->write(I)V

    .line 185
    const/4 v0, 0x3

    iput v0, p0, Lcom/sun/mail/util/QPEncoderStream;->count:I

    .line 187
    :cond_24
    iget-object v0, p0, Lcom/sun/mail/util/QPEncoderStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 188
    iget-object v0, p0, Lcom/sun/mail/util/QPEncoderStream;->out:Ljava/io/OutputStream;

    sget-object v1, Lcom/sun/mail/util/QPEncoderStream;->hex:[C

    shr-int/lit8 v2, p1, 0x4

    aget-char v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 189
    iget-object v0, p0, Lcom/sun/mail/util/QPEncoderStream;->out:Ljava/io/OutputStream;

    sget-object v1, Lcom/sun/mail/util/QPEncoderStream;->hex:[C

    and-int/lit8 v2, p1, 0xf

    aget-char v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 199
    :goto_3f
    return-void

    .line 191
    :cond_40
    iget v0, p0, Lcom/sun/mail/util/QPEncoderStream;->count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/sun/mail/util/QPEncoderStream;->count:I

    iget v1, p0, Lcom/sun/mail/util/QPEncoderStream;->bytesPerLine:I

    if-le v0, v1, :cond_5c

    .line 192
    iget-object v0, p0, Lcom/sun/mail/util/QPEncoderStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 193
    iget-object v0, p0, Lcom/sun/mail/util/QPEncoderStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, v4}, Ljava/io/OutputStream;->write(I)V

    .line 194
    iget-object v0, p0, Lcom/sun/mail/util/QPEncoderStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, v3}, Ljava/io/OutputStream;->write(I)V

    .line 195
    const/4 v0, 0x1

    iput v0, p0, Lcom/sun/mail/util/QPEncoderStream;->count:I

    .line 197
    :cond_5c
    iget-object v0, p0, Lcom/sun/mail/util/QPEncoderStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    goto :goto_3f
.end method

.method public write(I)V
    .registers 8
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0xd

    const/16 v4, 0xa

    const/16 v3, 0x20

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 113
    and-int/lit16 p1, p1, 0xff

    .line 114
    iget-boolean v0, p0, Lcom/sun/mail/util/QPEncoderStream;->gotSpace:Z

    if-eqz v0, :cond_17

    .line 115
    if-eq p1, v5, :cond_12

    if-ne p1, v4, :cond_1f

    .line 117
    :cond_12
    invoke-virtual {p0, v3, v2}, Lcom/sun/mail/util/QPEncoderStream;->output(IZ)V

    .line 120
    :goto_15
    iput-boolean v1, p0, Lcom/sun/mail/util/QPEncoderStream;->gotSpace:Z

    .line 123
    :cond_17
    if-ne p1, v5, :cond_23

    .line 124
    iput-boolean v2, p0, Lcom/sun/mail/util/QPEncoderStream;->gotCR:Z

    .line 125
    invoke-direct {p0}, Lcom/sun/mail/util/QPEncoderStream;->outputCRLF()V

    .line 144
    :goto_1e
    return-void

    .line 119
    :cond_1f
    invoke-virtual {p0, v3, v1}, Lcom/sun/mail/util/QPEncoderStream;->output(IZ)V

    goto :goto_15

    .line 127
    :cond_23
    if-ne p1, v4, :cond_30

    .line 128
    iget-boolean v0, p0, Lcom/sun/mail/util/QPEncoderStream;->gotCR:Z

    if-eqz v0, :cond_2c

    .line 142
    :goto_29
    iput-boolean v1, p0, Lcom/sun/mail/util/QPEncoderStream;->gotCR:Z

    goto :goto_1e

    .line 133
    :cond_2c
    invoke-direct {p0}, Lcom/sun/mail/util/QPEncoderStream;->outputCRLF()V

    goto :goto_29

    .line 134
    :cond_30
    if-ne p1, v3, :cond_35

    .line 135
    iput-boolean v2, p0, Lcom/sun/mail/util/QPEncoderStream;->gotSpace:Z

    goto :goto_29

    .line 136
    :cond_35
    if-lt p1, v3, :cond_3f

    const/16 v0, 0x7f

    if-ge p1, v0, :cond_3f

    const/16 v0, 0x3d

    if-ne p1, v0, :cond_43

    .line 138
    :cond_3f
    invoke-virtual {p0, p1, v2}, Lcom/sun/mail/util/QPEncoderStream;->output(IZ)V

    goto :goto_29

    .line 140
    :cond_43
    invoke-virtual {p0, p1, v1}, Lcom/sun/mail/util/QPEncoderStream;->output(IZ)V

    goto :goto_29
.end method

.method public write([B)V
    .registers 4
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 104
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/sun/mail/util/QPEncoderStream;->write([BII)V

    .line 105
    return-void
.end method

.method public write([BII)V
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p3, :cond_d

    .line 95
    add-int v1, p2, v0

    aget-byte v1, p1, v1

    invoke-virtual {p0, v1}, Lcom/sun/mail/util/QPEncoderStream;->write(I)V

    .line 94
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 96
    :cond_d
    return-void
.end method
