.class public Lorg/spongycastle/jcajce/io/CipherInputStream;
.super Ljava/io/FilterInputStream;
.source "CipherInputStream.java"


# instance fields
.field private buf:[B

.field private bufOff:I

.field private final cipher:Ljavax/crypto/Cipher;

.field private finalized:Z

.field private final inputBuffer:[B

.field private maxBuf:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Ljavax/crypto/Cipher;)V
    .registers 4
    .param p1, "input"    # Ljava/io/InputStream;
    .param p2, "cipher"    # Ljavax/crypto/Cipher;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 32
    const/16 v0, 0x200

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->inputBuffer:[B

    .line 33
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->finalized:Z

    .line 44
    iput-object p2, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->cipher:Ljavax/crypto/Cipher;

    .line 45
    return-void
.end method

.method private finaliseCipher()[B
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/io/InvalidCipherTextIOException;
        }
    .end annotation

    .prologue
    .line 93
    const/4 v1, 0x1

    :try_start_1
    iput-boolean v1, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->finalized:Z

    .line 94
    iget-object v1, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->cipher:Ljavax/crypto/Cipher;

    invoke-virtual {v1}, Ljavax/crypto/Cipher;->doFinal()[B
    :try_end_8
    .catch Ljava/security/GeneralSecurityException; {:try_start_1 .. :try_end_8} :catch_a

    move-result-object v1

    return-object v1

    .line 96
    :catch_a
    move-exception v0

    .line 98
    .local v0, "e":Ljava/security/GeneralSecurityException;
    new-instance v1, Lorg/spongycastle/crypto/io/InvalidCipherTextIOException;

    const-string v2, "Error finalising cipher"

    invoke-direct {v1, v2, v0}, Lorg/spongycastle/crypto/io/InvalidCipherTextIOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private nextChunk()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v1, -0x1

    .line 56
    iget-boolean v2, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->finalized:Z

    if-eqz v2, :cond_7

    .line 85
    :cond_6
    :goto_6
    return v1

    .line 61
    :cond_7
    iput v4, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->bufOff:I

    .line 62
    iput v4, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->maxBuf:I

    .line 65
    :cond_b
    :goto_b
    iget v2, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->maxBuf:I

    if-nez v2, :cond_44

    .line 67
    iget-object v2, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->in:Ljava/io/InputStream;

    iget-object v3, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->inputBuffer:[B

    invoke-virtual {v2, v3}, Ljava/io/InputStream;->read([B)I

    move-result v0

    .line 68
    .local v0, "read":I
    if-ne v0, v1, :cond_30

    .line 70
    invoke-direct {p0}, Lorg/spongycastle/jcajce/io/CipherInputStream;->finaliseCipher()[B

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->buf:[B

    .line 71
    iget-object v2, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->buf:[B

    if-eqz v2, :cond_6

    iget-object v2, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->buf:[B

    array-length v2, v2

    if-eqz v2, :cond_6

    .line 75
    iget-object v1, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->buf:[B

    array-length v1, v1

    iput v1, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->maxBuf:I

    .line 76
    iget v1, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->maxBuf:I

    goto :goto_6

    .line 79
    :cond_30
    iget-object v2, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->cipher:Ljavax/crypto/Cipher;

    iget-object v3, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->inputBuffer:[B

    invoke-virtual {v2, v3, v4, v0}, Ljavax/crypto/Cipher;->update([BII)[B

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->buf:[B

    .line 80
    iget-object v2, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->buf:[B

    if-eqz v2, :cond_b

    .line 82
    iget-object v2, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->buf:[B

    array-length v2, v2

    iput v2, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->maxBuf:I

    goto :goto_b

    .line 85
    .end local v0    # "read":I
    :cond_44
    iget v1, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->maxBuf:I

    goto :goto_6
.end method


# virtual methods
.method public available()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 174
    iget v0, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->maxBuf:I

    iget v1, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->bufOff:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    :try_start_0
    iget-object v0, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_0 .. :try_end_5} :catchall_12

    .line 194
    iget-boolean v0, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->finalized:Z

    if-nez v0, :cond_c

    .line 198
    invoke-direct {p0}, Lorg/spongycastle/jcajce/io/CipherInputStream;->finaliseCipher()[B

    .line 201
    :cond_c
    const/4 v0, 0x0

    iput v0, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->bufOff:I

    iput v0, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->maxBuf:I

    .line 202
    return-void

    .line 194
    :catchall_12
    move-exception v0

    iget-boolean v1, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->finalized:Z

    if-nez v1, :cond_1a

    .line 198
    invoke-direct {p0}, Lorg/spongycastle/jcajce/io/CipherInputStream;->finaliseCipher()[B

    :cond_1a
    throw v0
.end method

.method public mark(I)V
    .registers 2
    .param p1, "readlimit"    # I

    .prologue
    .line 206
    return-void
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 215
    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    iget v0, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->bufOff:I

    iget v1, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->maxBuf:I

    if-lt v0, v1, :cond_e

    .line 117
    invoke-direct {p0}, Lorg/spongycastle/jcajce/io/CipherInputStream;->nextChunk()I

    move-result v0

    if-gez v0, :cond_e

    .line 119
    const/4 v0, -0x1

    .line 123
    :goto_d
    return v0

    :cond_e
    iget-object v0, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->buf:[B

    iget v1, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->bufOff:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->bufOff:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    goto :goto_d
.end method

.method public read([BII)I
    .registers 7
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 144
    iget v1, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->bufOff:I

    iget v2, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->maxBuf:I

    if-lt v1, v2, :cond_e

    .line 146
    invoke-direct {p0}, Lorg/spongycastle/jcajce/io/CipherInputStream;->nextChunk()I

    move-result v1

    if-gez v1, :cond_e

    .line 148
    const/4 v0, -0x1

    .line 155
    :goto_d
    return v0

    .line 152
    :cond_e
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/io/CipherInputStream;->available()I

    move-result v1

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 153
    .local v0, "toSupply":I
    iget-object v1, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->buf:[B

    iget v2, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->bufOff:I

    invoke-static {v1, v2, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 154
    iget v1, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->bufOff:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->bufOff:I

    goto :goto_d
.end method

.method public reset()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 211
    return-void
.end method

.method public skip(J)J
    .registers 7
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v1, 0x0

    .line 161
    cmp-long v3, p1, v1

    if-gtz v3, :cond_7

    .line 168
    :goto_6
    return-wide v1

    .line 166
    :cond_7
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/io/CipherInputStream;->available()I

    move-result v1

    int-to-long v1, v1

    invoke-static {p1, p2, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int v0, v1

    .line 167
    .local v0, "skip":I
    iget v1, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->bufOff:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/spongycastle/jcajce/io/CipherInputStream;->bufOff:I

    .line 168
    int-to-long v1, v0

    goto :goto_6
.end method
