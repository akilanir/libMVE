.class public Lcom/sun/mail/util/QPDecoderStream;
.super Ljava/io/FilterInputStream;
.source "QPDecoderStream.java"


# instance fields
.field protected ba:[B

.field protected spaces:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    const/4 v1, 0x2

    .line 64
    new-instance v0, Ljava/io/PushbackInputStream;

    invoke-direct {v0, p1, v1}, Ljava/io/PushbackInputStream;-><init>(Ljava/io/InputStream;I)V

    invoke-direct {p0, v0}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 55
    new-array v0, v1, [B

    iput-object v0, p0, Lcom/sun/mail/util/QPDecoderStream;->ba:[B

    .line 56
    const/4 v0, 0x0

    iput v0, p0, Lcom/sun/mail/util/QPDecoderStream;->spaces:I

    .line 65
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

    .prologue
    .line 203
    iget-object v0, p0, Lcom/sun/mail/util/QPDecoderStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    return v0
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 190
    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0xd

    const/16 v4, 0x20

    const/16 v8, 0xa

    const/4 v7, 0x0

    const/4 v5, -0x1

    .line 80
    iget v6, p0, Lcom/sun/mail/util/QPDecoderStream;->spaces:I

    if-lez v6, :cond_14

    .line 82
    iget v5, p0, Lcom/sun/mail/util/QPDecoderStream;->spaces:I

    add-int/lit8 v5, v5, -0x1

    iput v5, p0, Lcom/sun/mail/util/QPDecoderStream;->spaces:I

    move v2, v4

    .line 145
    :cond_13
    :goto_13
    return v2

    .line 86
    :cond_14
    iget-object v6, p0, Lcom/sun/mail/util/QPDecoderStream;->in:Ljava/io/InputStream;

    invoke-virtual {v6}, Ljava/io/InputStream;->read()I

    move-result v2

    .line 88
    .local v2, "c":I
    if-ne v2, v4, :cond_3e

    .line 90
    :goto_1c
    iget-object v6, p0, Lcom/sun/mail/util/QPDecoderStream;->in:Ljava/io/InputStream;

    invoke-virtual {v6}, Ljava/io/InputStream;->read()I

    move-result v2

    if-ne v2, v4, :cond_2b

    .line 91
    iget v6, p0, Lcom/sun/mail/util/QPDecoderStream;->spaces:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/sun/mail/util/QPDecoderStream;->spaces:I

    goto :goto_1c

    .line 93
    :cond_2b
    if-eq v2, v9, :cond_31

    if-eq v2, v8, :cond_31

    if-ne v2, v5, :cond_34

    .line 96
    :cond_31
    iput v7, p0, Lcom/sun/mail/util/QPDecoderStream;->spaces:I

    goto :goto_13

    .line 99
    :cond_34
    iget-object v4, p0, Lcom/sun/mail/util/QPDecoderStream;->in:Ljava/io/InputStream;

    check-cast v4, Ljava/io/PushbackInputStream;

    invoke-virtual {v4, v2}, Ljava/io/PushbackInputStream;->unread(I)V

    .line 100
    const/16 v2, 0x20

    goto :goto_13

    .line 104
    :cond_3e
    const/16 v4, 0x3d

    if-ne v2, v4, :cond_13

    .line 106
    iget-object v4, p0, Lcom/sun/mail/util/QPDecoderStream;->in:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 108
    .local v0, "a":I
    if-ne v0, v8, :cond_4f

    .line 114
    invoke-virtual {p0}, Lcom/sun/mail/util/QPDecoderStream;->read()I

    move-result v2

    goto :goto_13

    .line 115
    :cond_4f
    if-ne v0, v9, :cond_65

    .line 117
    iget-object v4, p0, Lcom/sun/mail/util/QPDecoderStream;->in:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 118
    .local v1, "b":I
    if-eq v1, v8, :cond_60

    .line 122
    iget-object v4, p0, Lcom/sun/mail/util/QPDecoderStream;->in:Ljava/io/InputStream;

    check-cast v4, Ljava/io/PushbackInputStream;

    invoke-virtual {v4, v1}, Ljava/io/PushbackInputStream;->unread(I)V

    .line 123
    :cond_60
    invoke-virtual {p0}, Lcom/sun/mail/util/QPDecoderStream;->read()I

    move-result v2

    goto :goto_13

    .line 124
    .end local v1    # "b":I
    :cond_65
    if-ne v0, v5, :cond_69

    move v2, v5

    .line 126
    goto :goto_13

    .line 128
    :cond_69
    iget-object v4, p0, Lcom/sun/mail/util/QPDecoderStream;->ba:[B

    int-to-byte v5, v0

    aput-byte v5, v4, v7

    .line 129
    iget-object v4, p0, Lcom/sun/mail/util/QPDecoderStream;->ba:[B

    const/4 v5, 0x1

    iget-object v6, p0, Lcom/sun/mail/util/QPDecoderStream;->in:Ljava/io/InputStream;

    invoke-virtual {v6}, Ljava/io/InputStream;->read()I

    move-result v6

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    .line 131
    :try_start_7a
    iget-object v4, p0, Lcom/sun/mail/util/QPDecoderStream;->ba:[B

    const/4 v5, 0x0

    const/4 v6, 0x2

    const/16 v7, 0x10

    invoke-static {v4, v5, v6, v7}, Lcom/sun/mail/util/ASCIIUtility;->parseInt([BIII)I
    :try_end_83
    .catch Ljava/lang/NumberFormatException; {:try_start_7a .. :try_end_83} :catch_85

    move-result v2

    goto :goto_13

    .line 132
    :catch_85
    move-exception v3

    .line 140
    .local v3, "nex":Ljava/lang/NumberFormatException;
    iget-object v4, p0, Lcom/sun/mail/util/QPDecoderStream;->in:Ljava/io/InputStream;

    check-cast v4, Ljava/io/PushbackInputStream;

    iget-object v5, p0, Lcom/sun/mail/util/QPDecoderStream;->ba:[B

    invoke-virtual {v4, v5}, Ljava/io/PushbackInputStream;->unread([B)V

    goto :goto_13
.end method

.method public read([BII)I
    .registers 8
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, p3, :cond_d

    .line 165
    invoke-virtual {p0}, Lcom/sun/mail/util/QPDecoderStream;->read()I

    move-result v0

    .local v0, "c":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_e

    .line 166
    if-nez v1, :cond_d

    .line 167
    const/4 v1, -0x1

    .line 172
    .end local v0    # "c":I
    :cond_d
    return v1

    .line 170
    .restart local v0    # "c":I
    :cond_e
    add-int v2, p2, v1

    int-to-byte v3, v0

    aput-byte v3, p1, v2

    .line 164
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public skip(J)J
    .registers 11
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x1

    .line 179
    const-wide/16 v2, 0x0

    .local v2, "skipped":J
    move-wide v0, p1

    .line 180
    .end local p1    # "n":J
    .local v0, "n":J
    :goto_5
    sub-long p1, v0, v6

    .end local v0    # "n":J
    .restart local p1    # "n":J
    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    if-lez v4, :cond_16

    invoke-virtual {p0}, Lcom/sun/mail/util/QPDecoderStream;->read()I

    move-result v4

    if-ltz v4, :cond_16

    .line 181
    add-long/2addr v2, v6

    move-wide v0, p1

    .end local p1    # "n":J
    .restart local v0    # "n":J
    goto :goto_5

    .line 182
    .end local v0    # "n":J
    .restart local p1    # "n":J
    :cond_16
    return-wide v2
.end method
