.class public Lcom/sun/mail/imap/DefaultFolder;
.super Lcom/sun/mail/imap/IMAPFolder;
.source "DefaultFolder.java"


# direct methods
.method protected constructor <init>(Lcom/sun/mail/imap/IMAPStore;)V
    .registers 5
    .param p1, "store"    # Lcom/sun/mail/imap/IMAPStore;

    .prologue
    .line 60
    const-string v0, ""

    const v1, 0xffff

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, p1, v2}, Lcom/sun/mail/imap/IMAPFolder;-><init>(Ljava/lang/String;CLcom/sun/mail/imap/IMAPStore;Ljava/lang/Boolean;)V

    .line 61
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/sun/mail/imap/DefaultFolder;->exists:Z

    .line 62
    const/4 v0, 0x2

    iput v0, p0, Lcom/sun/mail/imap/DefaultFolder;->type:I

    .line 63
    return-void
.end method


# virtual methods
.method public appendMessages([Lkorex/mail/Message;)V
    .registers 4
    .param p1, "msgs"    # [Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 132
    new-instance v0, Lkorex/mail/MethodNotSupportedException;

    const-string v1, "Cannot append to Default Folder"

    invoke-direct {v0, v1}, Lkorex/mail/MethodNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public delete(Z)Z
    .registers 4
    .param p1, "recurse"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 122
    new-instance v0, Lkorex/mail/MethodNotSupportedException;

    const-string v1, "Cannot delete Default Folder"

    invoke-direct {v0, v1}, Lkorex/mail/MethodNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public expunge()[Lkorex/mail/Message;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 137
    new-instance v0, Lkorex/mail/MethodNotSupportedException;

    const-string v1, "Cannot expunge Default Folder"

    invoke-direct {v0, v1}, Lkorex/mail/MethodNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getFolder(Ljava/lang/String;)Lkorex/mail/Folder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 117
    iget-object v0, p0, Lcom/sun/mail/imap/DefaultFolder;->store:Lkorex/mail/Store;

    check-cast v0, Lcom/sun/mail/imap/IMAPStore;

    const v1, 0xffff

    invoke-virtual {v0, p1, v1}, Lcom/sun/mail/imap/IMAPStore;->newIMAPFolder(Ljava/lang/String;C)Lcom/sun/mail/imap/IMAPFolder;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 66
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/imap/DefaultFolder;->fullName:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getParent()Lkorex/mail/Folder;
    .registers 2

    .prologue
    .line 70
    const/4 v0, 0x0

    return-object v0
.end method

.method public hasNewMessages()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 113
    const/4 v0, 0x0

    return v0
.end method

.method public declared-synchronized list(Ljava/lang/String;)[Lkorex/mail/Folder;
    .registers 8
    .param p1, "pattern"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 75
    monitor-enter p0

    const/4 v3, 0x0

    .line 77
    .local v3, "li":[Lcom/sun/mail/imap/protocol/ListInfo;
    :try_start_2
    new-instance v4, Lcom/sun/mail/imap/DefaultFolder$1;

    invoke-direct {v4, p0, p1}, Lcom/sun/mail/imap/DefaultFolder$1;-><init>(Lcom/sun/mail/imap/DefaultFolder;Ljava/lang/String;)V

    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/DefaultFolder;->doCommand(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lcom/sun/mail/imap/protocol/ListInfo;

    move-object v0, v4

    check-cast v0, [Lcom/sun/mail/imap/protocol/ListInfo;

    move-object v3, v0

    .line 83
    if-nez v3, :cond_18

    .line 84
    const/4 v4, 0x0

    new-array v1, v4, [Lkorex/mail/Folder;
    :try_end_16
    .catchall {:try_start_2 .. :try_end_16} :catchall_2e

    .line 89
    :cond_16
    monitor-exit p0

    return-object v1

    .line 86
    :cond_18
    :try_start_18
    array-length v4, v3

    new-array v1, v4, [Lcom/sun/mail/imap/IMAPFolder;

    .line 87
    .local v1, "folders":[Lcom/sun/mail/imap/IMAPFolder;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1c
    array-length v4, v1

    if-ge v2, v4, :cond_16

    .line 88
    iget-object v4, p0, Lcom/sun/mail/imap/DefaultFolder;->store:Lkorex/mail/Store;

    check-cast v4, Lcom/sun/mail/imap/IMAPStore;

    aget-object v5, v3, v2

    invoke-virtual {v4, v5}, Lcom/sun/mail/imap/IMAPStore;->newIMAPFolder(Lcom/sun/mail/imap/protocol/ListInfo;)Lcom/sun/mail/imap/IMAPFolder;

    move-result-object v4

    aput-object v4, v1, v2
    :try_end_2b
    .catchall {:try_start_18 .. :try_end_2b} :catchall_2e

    .line 87
    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    .line 75
    .end local v1    # "folders":[Lcom/sun/mail/imap/IMAPFolder;
    .end local v2    # "i":I
    :catchall_2e
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized listSubscribed(Ljava/lang/String;)[Lkorex/mail/Folder;
    .registers 8
    .param p1, "pattern"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 94
    monitor-enter p0

    const/4 v3, 0x0

    .line 96
    .local v3, "li":[Lcom/sun/mail/imap/protocol/ListInfo;
    :try_start_2
    new-instance v4, Lcom/sun/mail/imap/DefaultFolder$2;

    invoke-direct {v4, p0, p1}, Lcom/sun/mail/imap/DefaultFolder$2;-><init>(Lcom/sun/mail/imap/DefaultFolder;Ljava/lang/String;)V

    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/DefaultFolder;->doCommand(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lcom/sun/mail/imap/protocol/ListInfo;

    move-object v0, v4

    check-cast v0, [Lcom/sun/mail/imap/protocol/ListInfo;

    move-object v3, v0

    .line 102
    if-nez v3, :cond_18

    .line 103
    const/4 v4, 0x0

    new-array v1, v4, [Lkorex/mail/Folder;
    :try_end_16
    .catchall {:try_start_2 .. :try_end_16} :catchall_2e

    .line 108
    :cond_16
    monitor-exit p0

    return-object v1

    .line 105
    :cond_18
    :try_start_18
    array-length v4, v3

    new-array v1, v4, [Lcom/sun/mail/imap/IMAPFolder;

    .line 106
    .local v1, "folders":[Lcom/sun/mail/imap/IMAPFolder;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1c
    array-length v4, v1

    if-ge v2, v4, :cond_16

    .line 107
    iget-object v4, p0, Lcom/sun/mail/imap/DefaultFolder;->store:Lkorex/mail/Store;

    check-cast v4, Lcom/sun/mail/imap/IMAPStore;

    aget-object v5, v3, v2

    invoke-virtual {v4, v5}, Lcom/sun/mail/imap/IMAPStore;->newIMAPFolder(Lcom/sun/mail/imap/protocol/ListInfo;)Lcom/sun/mail/imap/IMAPFolder;

    move-result-object v4

    aput-object v4, v1, v2
    :try_end_2b
    .catchall {:try_start_18 .. :try_end_2b} :catchall_2e

    .line 106
    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    .line 94
    .end local v1    # "folders":[Lcom/sun/mail/imap/IMAPFolder;
    .end local v2    # "i":I
    :catchall_2e
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public renameTo(Lkorex/mail/Folder;)Z
    .registers 4
    .param p1, "f"    # Lkorex/mail/Folder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 127
    new-instance v0, Lkorex/mail/MethodNotSupportedException;

    const-string v1, "Cannot rename Default Folder"

    invoke-direct {v0, v1}, Lkorex/mail/MethodNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
