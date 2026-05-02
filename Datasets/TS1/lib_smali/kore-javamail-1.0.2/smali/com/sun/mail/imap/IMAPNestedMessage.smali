.class public Lcom/sun/mail/imap/IMAPNestedMessage;
.super Lcom/sun/mail/imap/IMAPMessage;
.source "IMAPNestedMessage.java"


# instance fields
.field private msg:Lcom/sun/mail/imap/IMAPMessage;


# direct methods
.method constructor <init>(Lcom/sun/mail/imap/IMAPMessage;Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;Lcom/sun/mail/imap/protocol/ENVELOPE;Ljava/lang/String;)V
    .registers 6
    .param p1, "m"    # Lcom/sun/mail/imap/IMAPMessage;
    .param p2, "b"    # Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;
    .param p3, "e"    # Lcom/sun/mail/imap/protocol/ENVELOPE;
    .param p4, "sid"    # Ljava/lang/String;

    .prologue
    .line 66
    invoke-virtual {p1}, Lcom/sun/mail/imap/IMAPMessage;->_getSession()Lkorex/mail/Session;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/sun/mail/imap/IMAPMessage;-><init>(Lkorex/mail/Session;)V

    .line 67
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPNestedMessage;->msg:Lcom/sun/mail/imap/IMAPMessage;

    .line 68
    iput-object p2, p0, Lcom/sun/mail/imap/IMAPNestedMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    .line 69
    iput-object p3, p0, Lcom/sun/mail/imap/IMAPNestedMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    .line 70
    iput-object p4, p0, Lcom/sun/mail/imap/IMAPNestedMessage;->sectionId:Ljava/lang/String;

    .line 71
    invoke-virtual {p1}, Lcom/sun/mail/imap/IMAPMessage;->getPeek()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/IMAPNestedMessage;->setPeek(Z)V

    .line 72
    return-void
.end method


# virtual methods
.method protected checkExpunged()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessageRemovedException;
        }
    .end annotation

    .prologue
    .line 111
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPNestedMessage;->msg:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 112
    return-void
.end method

.method protected getFetchBlockSize()I
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPNestedMessage;->msg:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v0}, Lcom/sun/mail/imap/IMAPMessage;->getFetchBlockSize()I

    move-result v0

    return v0
.end method

.method protected getMessageCacheLock()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPNestedMessage;->msg:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v0}, Lcom/sun/mail/imap/IMAPMessage;->getMessageCacheLock()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;,
            Lkorex/mail/FolderClosedException;
        }
    .end annotation

    .prologue
    .line 80
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPNestedMessage;->msg:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v0}, Lcom/sun/mail/imap/IMAPMessage;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v0

    return-object v0
.end method

.method protected getSequenceNumber()I
    .registers 2

    .prologue
    .line 103
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPNestedMessage;->msg:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v0}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v0

    return v0
.end method

.method public getSize()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 141
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPNestedMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget v0, v0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->size:I

    return v0
.end method

.method protected ignoreBodyStructureSize()Z
    .registers 2

    .prologue
    .line 133
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPNestedMessage;->msg:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v0}, Lcom/sun/mail/imap/IMAPMessage;->ignoreBodyStructureSize()Z

    move-result v0

    return v0
.end method

.method public isExpunged()Z
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPNestedMessage;->msg:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v0}, Lcom/sun/mail/imap/IMAPMessage;->isExpunged()Z

    move-result v0

    return v0
.end method

.method protected isREV1()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/FolderClosedException;
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPNestedMessage;->msg:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v0}, Lcom/sun/mail/imap/IMAPMessage;->isREV1()Z

    move-result v0

    return v0
.end method

.method public declared-synchronized setFlags(Lkorex/mail/Flags;Z)V
    .registers 5
    .param p1, "flag"    # Lkorex/mail/Flags;
    .param p2, "set"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 150
    monitor-enter p0

    :try_start_1
    new-instance v0, Lkorex/mail/MethodNotSupportedException;

    const-string v1, "Cannot set flags on this nested message"

    invoke-direct {v0, v1}, Lkorex/mail/MethodNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_9

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method
