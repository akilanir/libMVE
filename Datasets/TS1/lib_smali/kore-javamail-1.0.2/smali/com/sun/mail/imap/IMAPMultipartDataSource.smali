.class public Lcom/sun/mail/imap/IMAPMultipartDataSource;
.super Lkorex/mail/internet/MimePartDataSource;
.source "IMAPMultipartDataSource.java"

# interfaces
.implements Lkorex/mail/MultipartDataSource;


# instance fields
.field private parts:Ljava/util/Vector;


# direct methods
.method protected constructor <init>(Lkorex/mail/internet/MimePart;[Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;Ljava/lang/String;Lcom/sun/mail/imap/IMAPMessage;)V
    .registers 11
    .param p1, "part"    # Lkorex/mail/internet/MimePart;
    .param p2, "bs"    # [Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;
    .param p3, "sectionId"    # Ljava/lang/String;
    .param p4, "msg"    # Lcom/sun/mail/imap/IMAPMessage;

    .prologue
    .line 67
    invoke-direct {p0, p1}, Lkorex/mail/internet/MimePartDataSource;-><init>(Lkorex/mail/internet/MimePart;)V

    .line 69
    new-instance v1, Ljava/util/Vector;

    array-length v2, p2

    invoke-direct {v1, v2}, Ljava/util/Vector;-><init>(I)V

    iput-object v1, p0, Lcom/sun/mail/imap/IMAPMultipartDataSource;->parts:Ljava/util/Vector;

    .line 70
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_c
    array-length v1, p2

    if-ge v0, v1, :cond_44

    .line 71
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPMultipartDataSource;->parts:Ljava/util/Vector;

    new-instance v3, Lcom/sun/mail/imap/IMAPBodyPart;

    aget-object v4, p2, v0

    if-nez p3, :cond_26

    add-int/lit8 v1, v0, 0x1

    .line 74
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    .line 75
    :goto_1d
    invoke-direct {v3, v4, v1, p4}, Lcom/sun/mail/imap/IMAPBodyPart;-><init>(Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;Ljava/lang/String;Lcom/sun/mail/imap/IMAPMessage;)V

    .line 71
    invoke-virtual {v2, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 70
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 74
    :cond_26
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, "."

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    add-int/lit8 v5, v0, 0x1

    .line 75
    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1d

    .line 78
    :cond_44
    return-void
.end method


# virtual methods
.method public getBodyPart(I)Lkorex/mail/BodyPart;
    .registers 3
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 85
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMultipartDataSource;->parts:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkorex/mail/BodyPart;

    return-object v0
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMultipartDataSource;->parts:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    return v0
.end method
