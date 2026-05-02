.class public abstract Lkorex/mail/Message;
.super Ljava/lang/Object;
.source "Message.java"

# interfaces
.implements Lkorex/mail/Part;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkorex/mail/Message$RecipientType;
    }
.end annotation


# instance fields
.field protected expunged:Z

.field protected folder:Lkorex/mail/Folder;

.field protected msgnum:I

.field protected session:Lkorex/mail/Session;


# direct methods
.method protected constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput v0, p0, Lkorex/mail/Message;->msgnum:I

    .line 95
    iput-boolean v0, p0, Lkorex/mail/Message;->expunged:Z

    .line 100
    iput-object v1, p0, Lkorex/mail/Message;->folder:Lkorex/mail/Folder;

    .line 105
    iput-object v1, p0, Lkorex/mail/Message;->session:Lkorex/mail/Session;

    .line 110
    return-void
.end method

.method protected constructor <init>(Lkorex/mail/Folder;I)V
    .registers 5
    .param p1, "folder"    # Lkorex/mail/Folder;
    .param p2, "msgnum"    # I

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput v0, p0, Lkorex/mail/Message;->msgnum:I

    .line 95
    iput-boolean v0, p0, Lkorex/mail/Message;->expunged:Z

    .line 100
    iput-object v1, p0, Lkorex/mail/Message;->folder:Lkorex/mail/Folder;

    .line 105
    iput-object v1, p0, Lkorex/mail/Message;->session:Lkorex/mail/Session;

    .line 120
    iput-object p1, p0, Lkorex/mail/Message;->folder:Lkorex/mail/Folder;

    .line 121
    iput p2, p0, Lkorex/mail/Message;->msgnum:I

    .line 122
    iget-object v0, p1, Lkorex/mail/Folder;->store:Lkorex/mail/Store;

    iget-object v0, v0, Lkorex/mail/Store;->session:Lkorex/mail/Session;

    iput-object v0, p0, Lkorex/mail/Message;->session:Lkorex/mail/Session;

    .line 123
    return-void
.end method

.method protected constructor <init>(Lkorex/mail/Session;)V
    .registers 4
    .param p1, "session"    # Lkorex/mail/Session;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput v0, p0, Lkorex/mail/Message;->msgnum:I

    .line 95
    iput-boolean v0, p0, Lkorex/mail/Message;->expunged:Z

    .line 100
    iput-object v1, p0, Lkorex/mail/Message;->folder:Lkorex/mail/Folder;

    .line 105
    iput-object v1, p0, Lkorex/mail/Message;->session:Lkorex/mail/Session;

    .line 132
    iput-object p1, p0, Lkorex/mail/Message;->session:Lkorex/mail/Session;

    .line 133
    return-void
.end method


# virtual methods
.method public abstract addFrom([Lkorex/mail/Address;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public addRecipient(Lkorex/mail/Message$RecipientType;Lkorex/mail/Address;)V
    .registers 5
    .param p1, "type"    # Lkorex/mail/Message$RecipientType;
    .param p2, "address"    # Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 414
    const/4 v1, 0x1

    new-array v0, v1, [Lkorex/mail/Address;

    .line 415
    .local v0, "a":[Lkorex/mail/Address;
    const/4 v1, 0x0

    aput-object p2, v0, v1

    .line 416
    invoke-virtual {p0, p1, v0}, Lkorex/mail/Message;->addRecipients(Lkorex/mail/Message$RecipientType;[Lkorex/mail/Address;)V

    .line 417
    return-void
.end method

.method public abstract addRecipients(Lkorex/mail/Message$RecipientType;[Lkorex/mail/Address;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public getAllRecipients()[Lkorex/mail/Address;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 321
    sget-object v6, Lkorex/mail/Message$RecipientType;->TO:Lkorex/mail/Message$RecipientType;

    invoke-virtual {p0, v6}, Lkorex/mail/Message;->getRecipients(Lkorex/mail/Message$RecipientType;)[Lkorex/mail/Address;

    move-result-object v5

    .line 322
    .local v5, "to":[Lkorex/mail/Address;
    sget-object v6, Lkorex/mail/Message$RecipientType;->CC:Lkorex/mail/Message$RecipientType;

    invoke-virtual {p0, v6}, Lkorex/mail/Message;->getRecipients(Lkorex/mail/Message$RecipientType;)[Lkorex/mail/Address;

    move-result-object v2

    .line 323
    .local v2, "cc":[Lkorex/mail/Address;
    sget-object v6, Lkorex/mail/Message$RecipientType;->BCC:Lkorex/mail/Message$RecipientType;

    invoke-virtual {p0, v6}, Lkorex/mail/Message;->getRecipients(Lkorex/mail/Message$RecipientType;)[Lkorex/mail/Address;

    move-result-object v1

    .line 325
    .local v1, "bcc":[Lkorex/mail/Address;
    if-nez v2, :cond_18

    if-nez v1, :cond_18

    .line 346
    .end local v5    # "to":[Lkorex/mail/Address;
    :goto_17
    return-object v5

    .line 328
    .restart local v5    # "to":[Lkorex/mail/Address;
    :cond_18
    if-eqz v5, :cond_40

    array-length v6, v5

    move v8, v6

    :goto_1c
    if-eqz v2, :cond_42

    array-length v6, v2

    :goto_1f
    add-int/2addr v8, v6

    if-eqz v1, :cond_44

    array-length v6, v1

    :goto_23
    add-int v3, v8, v6

    .line 332
    .local v3, "numRecip":I
    new-array v0, v3, [Lkorex/mail/Address;

    .line 333
    .local v0, "addresses":[Lkorex/mail/Address;
    const/4 v4, 0x0

    .line 334
    .local v4, "pos":I
    if-eqz v5, :cond_30

    .line 335
    array-length v6, v5

    invoke-static {v5, v7, v0, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 336
    array-length v6, v5

    add-int/2addr v4, v6

    .line 338
    :cond_30
    if-eqz v2, :cond_38

    .line 339
    array-length v6, v2

    invoke-static {v2, v7, v0, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 340
    array-length v6, v2

    add-int/2addr v4, v6

    .line 342
    :cond_38
    if-eqz v1, :cond_3e

    .line 343
    array-length v6, v1

    invoke-static {v1, v7, v0, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_3e
    move-object v5, v0

    .line 346
    goto :goto_17

    .end local v0    # "addresses":[Lkorex/mail/Address;
    .end local v3    # "numRecip":I
    .end local v4    # "pos":I
    :cond_40
    move v8, v7

    .line 328
    goto :goto_1c

    :cond_42
    move v6, v7

    goto :goto_1f

    :cond_44
    move v6, v7

    goto :goto_23
.end method

.method public abstract getFlags()Lkorex/mail/Flags;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public getFolder()Lkorex/mail/Folder;
    .registers 2

    .prologue
    .line 632
    iget-object v0, p0, Lkorex/mail/Message;->folder:Lkorex/mail/Folder;

    return-object v0
.end method

.method public abstract getFrom()[Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public getMessageNumber()I
    .registers 2

    .prologue
    .line 611
    iget v0, p0, Lkorex/mail/Message;->msgnum:I

    return v0
.end method

.method public abstract getReceivedDate()Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract getRecipients(Lkorex/mail/Message$RecipientType;)[Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public getReplyTo()[Lkorex/mail/Address;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 436
    invoke-virtual {p0}, Lkorex/mail/Message;->getFrom()[Lkorex/mail/Address;

    move-result-object v0

    return-object v0
.end method

.method public abstract getSentDate()Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public getSession()Lkorex/mail/Session;
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lkorex/mail/Message;->session:Lkorex/mail/Session;

    return-object v0
.end method

.method public abstract getSubject()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public isExpunged()Z
    .registers 2

    .prologue
    .line 654
    iget-boolean v0, p0, Lkorex/mail/Message;->expunged:Z

    return v0
.end method

.method public isSet(Lkorex/mail/Flags$Flag;)Z
    .registers 3
    .param p1, "flag"    # Lkorex/mail/Flags$Flag;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 547
    invoke-virtual {p0}, Lkorex/mail/Message;->getFlags()Lkorex/mail/Flags;

    move-result-object v0

    invoke-virtual {v0, p1}, Lkorex/mail/Flags;->contains(Lkorex/mail/Flags$Flag;)Z

    move-result v0

    return v0
.end method

.method public match(Lkorex/mail/search/SearchTerm;)Z
    .registers 3
    .param p1, "term"    # Lkorex/mail/search/SearchTerm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 724
    invoke-virtual {p1, p0}, Lkorex/mail/search/SearchTerm;->match(Lkorex/mail/Message;)Z

    move-result v0

    return v0
.end method

.method public abstract reply(Z)Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract saveChanges()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method protected setExpunged(Z)V
    .registers 2
    .param p1, "expunged"    # Z

    .prologue
    .line 664
    iput-boolean p1, p0, Lkorex/mail/Message;->expunged:Z

    .line 665
    return-void
.end method

.method public setFlag(Lkorex/mail/Flags$Flag;Z)V
    .registers 4
    .param p1, "flag"    # Lkorex/mail/Flags$Flag;
    .param p2, "set"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 593
    new-instance v0, Lkorex/mail/Flags;

    invoke-direct {v0, p1}, Lkorex/mail/Flags;-><init>(Lkorex/mail/Flags$Flag;)V

    .line 594
    .local v0, "f":Lkorex/mail/Flags;
    invoke-virtual {p0, v0, p2}, Lkorex/mail/Message;->setFlags(Lkorex/mail/Flags;Z)V

    .line 595
    return-void
.end method

.method public abstract setFlags(Lkorex/mail/Flags;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract setFrom()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract setFrom(Lkorex/mail/Address;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method protected setMessageNumber(I)V
    .registers 2
    .param p1, "msgnum"    # I

    .prologue
    .line 621
    iput p1, p0, Lkorex/mail/Message;->msgnum:I

    .line 622
    return-void
.end method

.method public setRecipient(Lkorex/mail/Message$RecipientType;Lkorex/mail/Address;)V
    .registers 5
    .param p1, "type"    # Lkorex/mail/Message$RecipientType;
    .param p2, "address"    # Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 380
    const/4 v1, 0x1

    new-array v0, v1, [Lkorex/mail/Address;

    .line 381
    .local v0, "a":[Lkorex/mail/Address;
    const/4 v1, 0x0

    aput-object p2, v0, v1

    .line 382
    invoke-virtual {p0, p1, v0}, Lkorex/mail/Message;->setRecipients(Lkorex/mail/Message$RecipientType;[Lkorex/mail/Address;)V

    .line 383
    return-void
.end method

.method public abstract setRecipients(Lkorex/mail/Message$RecipientType;[Lkorex/mail/Address;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public setReplyTo([Lkorex/mail/Address;)V
    .registers 4
    .param p1, "addresses"    # [Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 460
    new-instance v0, Lkorex/mail/MethodNotSupportedException;

    const-string v1, "setReplyTo not supported"

    invoke-direct {v0, v1}, Lkorex/mail/MethodNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public abstract setSentDate(Ljava/util/Date;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract setSubject(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method
