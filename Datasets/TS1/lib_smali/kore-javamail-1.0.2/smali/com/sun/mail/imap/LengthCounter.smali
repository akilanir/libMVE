.class Lcom/sun/mail/imap/LengthCounter;
.super Ljava/io/OutputStream;
.source "IMAPFolder.java"


# instance fields
.field private buf:[B

.field private maxsize:I

.field private size:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "maxsize"    # I

    .prologue
    .line 3705
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 3701
    const/4 v0, 0x0

    iput v0, p0, Lcom/sun/mail/imap/LengthCounter;->size:I

    .line 3706
    const/16 v0, 0x2000

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/sun/mail/imap/LengthCounter;->buf:[B

    .line 3707
    iput p1, p0, Lcom/sun/mail/imap/LengthCounter;->maxsize:I

    .line 3708
    return-void
.end method


# virtual methods
.method public getBytes()[B
    .registers 2

    .prologue
    .line 3759
    iget-object v0, p0, Lcom/sun/mail/imap/LengthCounter;->buf:[B

    return-object v0
.end method

.method public getSize()I
    .registers 2

    .prologue
    .line 3755
    iget v0, p0, Lcom/sun/mail/imap/LengthCounter;->size:I

    return v0
.end method

.method public write(I)V
    .registers 7
    .param p1, "b"    # I

    .prologue
    const/4 v4, 0x0

    .line 3711
    iget v2, p0, Lcom/sun/mail/imap/LengthCounter;->size:I

    add-int/lit8 v1, v2, 0x1

    .line 3712
    .local v1, "newsize":I
    iget-object v2, p0, Lcom/sun/mail/imap/LengthCounter;->buf:[B

    if-eqz v2, :cond_14

    .line 3713
    iget v2, p0, Lcom/sun/mail/imap/LengthCounter;->maxsize:I

    if-le v1, v2, :cond_17

    iget v2, p0, Lcom/sun/mail/imap/LengthCounter;->maxsize:I

    if-ltz v2, :cond_17

    .line 3714
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/sun/mail/imap/LengthCounter;->buf:[B

    .line 3724
    :cond_14
    :goto_14
    iput v1, p0, Lcom/sun/mail/imap/LengthCounter;->size:I

    .line 3725
    return-void

    .line 3715
    :cond_17
    iget-object v2, p0, Lcom/sun/mail/imap/LengthCounter;->buf:[B

    array-length v2, v2

    if-le v1, v2, :cond_38

    .line 3716
    iget-object v2, p0, Lcom/sun/mail/imap/LengthCounter;->buf:[B

    array-length v2, v2

    shl-int/lit8 v2, v2, 0x1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v2

    new-array v0, v2, [B

    .line 3717
    .local v0, "newbuf":[B
    iget-object v2, p0, Lcom/sun/mail/imap/LengthCounter;->buf:[B

    iget v3, p0, Lcom/sun/mail/imap/LengthCounter;->size:I

    invoke-static {v2, v4, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3718
    iput-object v0, p0, Lcom/sun/mail/imap/LengthCounter;->buf:[B

    .line 3719
    iget-object v2, p0, Lcom/sun/mail/imap/LengthCounter;->buf:[B

    iget v3, p0, Lcom/sun/mail/imap/LengthCounter;->size:I

    int-to-byte v4, p1

    aput-byte v4, v2, v3

    goto :goto_14

    .line 3721
    .end local v0    # "newbuf":[B
    :cond_38
    iget-object v2, p0, Lcom/sun/mail/imap/LengthCounter;->buf:[B

    iget v3, p0, Lcom/sun/mail/imap/LengthCounter;->size:I

    int-to-byte v4, p1

    aput-byte v4, v2, v3

    goto :goto_14
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
    .line 3751
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/sun/mail/imap/LengthCounter;->write([BII)V

    .line 3752
    return-void
.end method

.method public write([BII)V
    .registers 9
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    const/4 v4, 0x0

    .line 3728
    if-ltz p2, :cond_11

    array-length v2, p1

    if-gt p2, v2, :cond_11

    if-ltz p3, :cond_11

    add-int v2, p2, p3

    array-length v3, p1

    if-gt v2, v3, :cond_11

    add-int v2, p2, p3

    if-gez v2, :cond_17

    .line 3730
    :cond_11
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v2}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v2

    .line 3731
    :cond_17
    if-nez p3, :cond_1a

    .line 3748
    :goto_19
    return-void

    .line 3734
    :cond_1a
    iget v2, p0, Lcom/sun/mail/imap/LengthCounter;->size:I

    add-int v1, v2, p3

    .line 3735
    .local v1, "newsize":I
    iget-object v2, p0, Lcom/sun/mail/imap/LengthCounter;->buf:[B

    if-eqz v2, :cond_2d

    .line 3736
    iget v2, p0, Lcom/sun/mail/imap/LengthCounter;->maxsize:I

    if-le v1, v2, :cond_30

    iget v2, p0, Lcom/sun/mail/imap/LengthCounter;->maxsize:I

    if-ltz v2, :cond_30

    .line 3737
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/sun/mail/imap/LengthCounter;->buf:[B

    .line 3747
    :cond_2d
    :goto_2d
    iput v1, p0, Lcom/sun/mail/imap/LengthCounter;->size:I

    goto :goto_19

    .line 3738
    :cond_30
    iget-object v2, p0, Lcom/sun/mail/imap/LengthCounter;->buf:[B

    array-length v2, v2

    if-le v1, v2, :cond_51

    .line 3739
    iget-object v2, p0, Lcom/sun/mail/imap/LengthCounter;->buf:[B

    array-length v2, v2

    shl-int/lit8 v2, v2, 0x1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v2

    new-array v0, v2, [B

    .line 3740
    .local v0, "newbuf":[B
    iget-object v2, p0, Lcom/sun/mail/imap/LengthCounter;->buf:[B

    iget v3, p0, Lcom/sun/mail/imap/LengthCounter;->size:I

    invoke-static {v2, v4, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3741
    iput-object v0, p0, Lcom/sun/mail/imap/LengthCounter;->buf:[B

    .line 3742
    iget-object v2, p0, Lcom/sun/mail/imap/LengthCounter;->buf:[B

    iget v3, p0, Lcom/sun/mail/imap/LengthCounter;->size:I

    invoke-static {p1, p2, v2, v3, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2d

    .line 3744
    .end local v0    # "newbuf":[B
    :cond_51
    iget-object v2, p0, Lcom/sun/mail/imap/LengthCounter;->buf:[B

    iget v3, p0, Lcom/sun/mail/imap/LengthCounter;->size:I

    invoke-static {p1, p2, v2, v3, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2d
.end method
