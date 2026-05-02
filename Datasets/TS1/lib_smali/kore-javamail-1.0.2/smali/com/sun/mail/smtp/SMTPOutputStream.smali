.class public Lcom/sun/mail/smtp/SMTPOutputStream;
.super Lcom/sun/mail/util/CRLFOutputStream;
.source "SMTPOutputStream.java"


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 2
    .param p1, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/sun/mail/util/CRLFOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 58
    return-void
.end method


# virtual methods
.method public ensureAtBOL()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    iget-boolean v0, p0, Lcom/sun/mail/smtp/SMTPOutputStream;->atBOL:Z

    if-nez v0, :cond_7

    .line 112
    invoke-super {p0}, Lcom/sun/mail/util/CRLFOutputStream;->writeln()V

    .line 113
    :cond_7
    return-void
.end method

.method public flush()V
    .registers 1

    .prologue
    .line 104
    return-void
.end method

.method public write(I)V
    .registers 5
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x2e

    .line 63
    iget v0, p0, Lcom/sun/mail/smtp/SMTPOutputStream;->lastb:I

    const/16 v1, 0xa

    if-eq v0, v1, :cond_13

    iget v0, p0, Lcom/sun/mail/smtp/SMTPOutputStream;->lastb:I

    const/16 v1, 0xd

    if-eq v0, v1, :cond_13

    iget v0, p0, Lcom/sun/mail/smtp/SMTPOutputStream;->lastb:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1a

    :cond_13
    if-ne p1, v2, :cond_1a

    .line 64
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 67
    :cond_1a
    invoke-super {p0, p1}, Lcom/sun/mail/util/CRLFOutputStream;->write(I)V

    .line 68
    return-void
.end method

.method public write([BII)V
    .registers 11
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x2e

    const/16 v3, 0xa

    .line 74
    iget v4, p0, Lcom/sun/mail/smtp/SMTPOutputStream;->lastb:I

    const/4 v5, -0x1

    if-ne v4, v5, :cond_29

    move v1, v3

    .line 75
    .local v1, "lastc":I
    :goto_a
    move v2, p2

    .line 77
    .local v2, "start":I
    add-int/2addr p3, p2

    .line 78
    move v0, p2

    .local v0, "i":I
    :goto_d
    if-ge v0, p3, :cond_2c

    .line 79
    if-eq v1, v3, :cond_15

    const/16 v4, 0xd

    if-ne v1, v4, :cond_24

    :cond_15
    aget-byte v4, p1, v0

    if-ne v4, v6, :cond_24

    .line 80
    sub-int v4, v0, v2

    invoke-super {p0, p1, v2, v4}, Lcom/sun/mail/util/CRLFOutputStream;->write([BII)V

    .line 81
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v4, v6}, Ljava/io/OutputStream;->write(I)V

    .line 82
    move v2, v0

    .line 84
    :cond_24
    aget-byte v1, p1, v0

    .line 78
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 74
    .end local v0    # "i":I
    .end local v1    # "lastc":I
    .end local v2    # "start":I
    :cond_29
    iget v1, p0, Lcom/sun/mail/smtp/SMTPOutputStream;->lastb:I

    goto :goto_a

    .line 86
    .restart local v0    # "i":I
    .restart local v1    # "lastc":I
    .restart local v2    # "start":I
    :cond_2c
    sub-int v3, p3, v2

    if-lez v3, :cond_35

    .line 87
    sub-int v3, p3, v2

    invoke-super {p0, p1, v2, v3}, Lcom/sun/mail/util/CRLFOutputStream;->write([BII)V

    .line 88
    :cond_35
    return-void
.end method
