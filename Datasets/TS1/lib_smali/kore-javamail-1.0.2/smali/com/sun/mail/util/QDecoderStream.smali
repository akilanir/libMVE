.class public Lcom/sun/mail/util/QDecoderStream;
.super Lcom/sun/mail/util/QPDecoderStream;
.source "QDecoderStream.java"


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 2
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 59
    invoke-direct {p0, p1}, Lcom/sun/mail/util/QPDecoderStream;-><init>(Ljava/io/InputStream;)V

    .line 60
    return-void
.end method


# virtual methods
.method public read()I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 75
    iget-object v2, p0, Lcom/sun/mail/util/QDecoderStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 77
    .local v0, "c":I
    const/16 v2, 0x5f

    if-ne v0, v2, :cond_e

    .line 78
    const/16 v0, 0x20

    .line 91
    .end local v0    # "c":I
    :cond_d
    :goto_d
    return v0

    .line 79
    .restart local v0    # "c":I
    :cond_e
    const/16 v2, 0x3d

    if-ne v0, v2, :cond_d

    .line 81
    iget-object v2, p0, Lcom/sun/mail/util/QDecoderStream;->ba:[B

    iget-object v3, p0, Lcom/sun/mail/util/QDecoderStream;->in:Ljava/io/InputStream;

    invoke-virtual {v3}, Ljava/io/InputStream;->read()I

    move-result v3

    int-to-byte v3, v3

    aput-byte v3, v2, v4

    .line 82
    iget-object v2, p0, Lcom/sun/mail/util/QDecoderStream;->ba:[B

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/sun/mail/util/QDecoderStream;->in:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->read()I

    move-result v4

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 85
    :try_start_29
    iget-object v2, p0, Lcom/sun/mail/util/QDecoderStream;->ba:[B

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/16 v5, 0x10

    invoke-static {v2, v3, v4, v5}, Lcom/sun/mail/util/ASCIIUtility;->parseInt([BIII)I
    :try_end_32
    .catch Ljava/lang/NumberFormatException; {:try_start_29 .. :try_end_32} :catch_34

    move-result v0

    goto :goto_d

    .line 86
    :catch_34
    move-exception v1

    .line 87
    .local v1, "nex":Ljava/lang/NumberFormatException;
    new-instance v2, Lcom/sun/mail/util/DecodingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "QDecoder: Error in QP stream "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 88
    invoke-virtual {v1}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/sun/mail/util/DecodingException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
