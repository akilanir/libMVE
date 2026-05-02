.class Lcom/sun/mail/imap/MessageLiteral;
.super Ljava/lang/Object;
.source "IMAPFolder.java"

# interfaces
.implements Lcom/sun/mail/iap/Literal;


# instance fields
.field private buf:[B

.field private msg:Lkorex/mail/Message;

.field private msgSize:I


# direct methods
.method public constructor <init>(Lkorex/mail/Message;I)V
    .registers 6
    .param p1, "msg"    # Lkorex/mail/Message;
    .param p2, "maxsize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3663
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3659
    const/4 v2, -0x1

    iput v2, p0, Lcom/sun/mail/imap/MessageLiteral;->msgSize:I

    .line 3664
    iput-object p1, p0, Lcom/sun/mail/imap/MessageLiteral;->msg:Lkorex/mail/Message;

    .line 3666
    new-instance v0, Lcom/sun/mail/imap/LengthCounter;

    invoke-direct {v0, p2}, Lcom/sun/mail/imap/LengthCounter;-><init>(I)V

    .line 3667
    .local v0, "lc":Lcom/sun/mail/imap/LengthCounter;
    new-instance v1, Lcom/sun/mail/util/CRLFOutputStream;

    invoke-direct {v1, v0}, Lcom/sun/mail/util/CRLFOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 3668
    .local v1, "os":Ljava/io/OutputStream;
    invoke-virtual {p1, v1}, Lkorex/mail/Message;->writeTo(Ljava/io/OutputStream;)V

    .line 3669
    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V

    .line 3670
    invoke-virtual {v0}, Lcom/sun/mail/imap/LengthCounter;->getSize()I

    move-result v2

    iput v2, p0, Lcom/sun/mail/imap/MessageLiteral;->msgSize:I

    .line 3671
    invoke-virtual {v0}, Lcom/sun/mail/imap/LengthCounter;->getBytes()[B

    move-result-object v2

    iput-object v2, p0, Lcom/sun/mail/imap/MessageLiteral;->buf:[B

    .line 3672
    return-void
.end method


# virtual methods
.method public size()I
    .registers 2

    .prologue
    .line 3675
    iget v0, p0, Lcom/sun/mail/imap/MessageLiteral;->msgSize:I

    return v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 7
    .param p1, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3681
    :try_start_0
    iget-object v2, p0, Lcom/sun/mail/imap/MessageLiteral;->buf:[B

    if-eqz v2, :cond_d

    .line 3682
    iget-object v2, p0, Lcom/sun/mail/imap/MessageLiteral;->buf:[B

    const/4 v3, 0x0

    iget v4, p0, Lcom/sun/mail/imap/MessageLiteral;->msgSize:I

    invoke-virtual {p1, v2, v3, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 3692
    :goto_c
    return-void

    .line 3684
    :cond_d
    new-instance v1, Lcom/sun/mail/util/CRLFOutputStream;

    invoke-direct {v1, p1}, Lcom/sun/mail/util/CRLFOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_12
    .catch Lkorex/mail/MessagingException; {:try_start_0 .. :try_end_12} :catch_19

    .line 3685
    .end local p1    # "os":Ljava/io/OutputStream;
    .local v1, "os":Ljava/io/OutputStream;
    :try_start_12
    iget-object v2, p0, Lcom/sun/mail/imap/MessageLiteral;->msg:Lkorex/mail/Message;

    invoke-virtual {v2, v1}, Lkorex/mail/Message;->writeTo(Ljava/io/OutputStream;)V
    :try_end_17
    .catch Lkorex/mail/MessagingException; {:try_start_12 .. :try_end_17} :catch_33

    move-object p1, v1

    .end local v1    # "os":Ljava/io/OutputStream;
    .restart local p1    # "os":Ljava/io/OutputStream;
    goto :goto_c

    .line 3687
    :catch_19
    move-exception v0

    .line 3689
    .local v0, "mex":Lkorex/mail/MessagingException;
    :goto_1a
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "MessagingException while appending message: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 3687
    .end local v0    # "mex":Lkorex/mail/MessagingException;
    .end local p1    # "os":Ljava/io/OutputStream;
    .restart local v1    # "os":Ljava/io/OutputStream;
    :catch_33
    move-exception v0

    move-object p1, v1

    .end local v1    # "os":Ljava/io/OutputStream;
    .restart local p1    # "os":Ljava/io/OutputStream;
    goto :goto_1a
.end method
