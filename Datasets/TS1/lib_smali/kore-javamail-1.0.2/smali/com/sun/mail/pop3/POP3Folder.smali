.class public Lcom/sun/mail/pop3/POP3Folder;
.super Lkorex/mail/Folder;
.source "POP3Folder.java"


# instance fields
.field private doneUidl:Z

.field private exists:Z

.field private volatile fileCache:Lcom/sun/mail/pop3/TempFile;

.field logger:Lcom/sun/mail/util/MailLogger;

.field private message_cache:Ljava/util/Vector;

.field private name:Ljava/lang/String;

.field private volatile opened:Z

.field private volatile port:Lcom/sun/mail/pop3/Protocol;

.field private size:I

.field private store:Lcom/sun/mail/pop3/POP3Store;

.field private total:I


# direct methods
.method constructor <init>(Lcom/sun/mail/pop3/POP3Store;Ljava/lang/String;)V
    .registers 7
    .param p1, "store"    # Lcom/sun/mail/pop3/POP3Store;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 85
    invoke-direct {p0, p1}, Lkorex/mail/Folder;-><init>(Lkorex/mail/Store;)V

    .line 76
    iput-boolean v0, p0, Lcom/sun/mail/pop3/POP3Folder;->exists:Z

    .line 77
    iput-boolean v0, p0, Lcom/sun/mail/pop3/POP3Folder;->opened:Z

    .line 79
    iput-boolean v0, p0, Lcom/sun/mail/pop3/POP3Folder;->doneUidl:Z

    .line 80
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/pop3/POP3Folder;->fileCache:Lcom/sun/mail/pop3/TempFile;

    .line 86
    iput-object p2, p0, Lcom/sun/mail/pop3/POP3Folder;->name:Ljava/lang/String;

    .line 87
    iput-object p1, p0, Lcom/sun/mail/pop3/POP3Folder;->store:Lcom/sun/mail/pop3/POP3Store;

    .line 88
    const-string v0, "INBOX"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 89
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/sun/mail/pop3/POP3Folder;->exists:Z

    .line 90
    :cond_1c
    new-instance v0, Lcom/sun/mail/util/MailLogger;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "DEBUG POP3"

    .line 91
    invoke-virtual {p1}, Lcom/sun/mail/pop3/POP3Store;->getSession()Lkorex/mail/Session;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/sun/mail/util/MailLogger;-><init>(Ljava/lang/Class;Ljava/lang/String;Lkorex/mail/Session;)V

    iput-object v0, p0, Lcom/sun/mail/pop3/POP3Folder;->logger:Lcom/sun/mail/util/MailLogger;

    .line 92
    return-void
.end method

.method private checkClosed()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 564
    iget-boolean v0, p0, Lcom/sun/mail/pop3/POP3Folder;->opened:Z

    if-eqz v0, :cond_c

    .line 565
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Folder is Open"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 566
    :cond_c
    return-void
.end method

.method private checkOpen()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 558
    iget-boolean v0, p0, Lcom/sun/mail/pop3/POP3Folder;->opened:Z

    if-nez v0, :cond_c

    .line 559
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Folder is not Open"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 560
    :cond_c
    return-void
.end method

.method private checkReadable()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 570
    iget-boolean v0, p0, Lcom/sun/mail/pop3/POP3Folder;->opened:Z

    if-eqz v0, :cond_e

    iget v0, p0, Lcom/sun/mail/pop3/POP3Folder;->mode:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_16

    iget v0, p0, Lcom/sun/mail/pop3/POP3Folder;->mode:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_16

    .line 571
    :cond_e
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Folder is not Readable"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 572
    :cond_16
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
    .line 378
    new-instance v0, Lkorex/mail/MethodNotSupportedException;

    const-string v1, "Append not supported"

    invoke-direct {v0, v1}, Lkorex/mail/MethodNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public declared-synchronized close(Z)V
    .registers 7
    .param p1, "expunge"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 245
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Folder;->checkOpen()V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_a3

    .line 257
    :try_start_4
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->store:Lcom/sun/mail/pop3/POP3Store;

    iget-boolean v3, v3, Lcom/sun/mail/pop3/POP3Store;->rsetBeforeQuit:Z

    if-eqz v3, :cond_f

    .line 258
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->port:Lcom/sun/mail/pop3/Protocol;

    invoke-virtual {v3}, Lcom/sun/mail/pop3/Protocol;->rset()Z

    .line 260
    :cond_f
    if-eqz p1, :cond_65

    iget v3, p0, Lcom/sun/mail/pop3/POP3Folder;->mode:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_65

    .line 262
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_17
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->message_cache:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-ge v0, v3, :cond_65

    .line 263
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->message_cache:Ljava/util/Vector;

    invoke-virtual {v3, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/sun/mail/pop3/POP3Message;

    .local v2, "m":Lcom/sun/mail/pop3/POP3Message;
    if-eqz v2, :cond_38

    .line 264
    sget-object v3, Lkorex/mail/Flags$Flag;->DELETED:Lkorex/mail/Flags$Flag;

    invoke-virtual {v2, v3}, Lcom/sun/mail/pop3/POP3Message;->isSet(Lkorex/mail/Flags$Flag;)Z
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_2e} :catch_44
    .catchall {:try_start_4 .. :try_end_2e} :catchall_a6

    move-result v3

    if-eqz v3, :cond_38

    .line 266
    :try_start_31
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->port:Lcom/sun/mail/pop3/Protocol;

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v3, v4}, Lcom/sun/mail/pop3/Protocol;->dele(I)Z
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_38} :catch_3b
    .catchall {:try_start_31 .. :try_end_38} :catchall_a6

    .line 262
    :cond_38
    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    .line 267
    :catch_3b
    move-exception v1

    .line 268
    .local v1, "ioex":Ljava/io/IOException;
    :try_start_3c
    new-instance v3, Lkorex/mail/MessagingException;

    const-string v4, "Exception deleting messages during close"

    invoke-direct {v3, v4, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3
    :try_end_44
    .catch Ljava/io/IOException; {:try_start_3c .. :try_end_44} :catch_44
    .catchall {:try_start_3c .. :try_end_44} :catchall_a6

    .line 285
    .end local v0    # "i":I
    .end local v1    # "ioex":Ljava/io/IOException;
    .end local v2    # "m":Lcom/sun/mail/pop3/POP3Message;
    :catch_44
    move-exception v3

    .line 288
    const/4 v3, 0x0

    :try_start_46
    iput-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->port:Lcom/sun/mail/pop3/Protocol;

    .line 289
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->store:Lcom/sun/mail/pop3/POP3Store;

    invoke-virtual {v3, p0}, Lcom/sun/mail/pop3/POP3Store;->closePort(Lcom/sun/mail/pop3/POP3Folder;)V

    .line 290
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->message_cache:Ljava/util/Vector;

    .line 291
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/sun/mail/pop3/POP3Folder;->opened:Z

    .line 292
    const/4 v3, 0x3

    invoke-virtual {p0, v3}, Lcom/sun/mail/pop3/POP3Folder;->notifyConnectionListeners(I)V

    .line 293
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->fileCache:Lcom/sun/mail/pop3/TempFile;

    if-eqz v3, :cond_63

    .line 294
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->fileCache:Lcom/sun/mail/pop3/TempFile;

    invoke-virtual {v3}, Lcom/sun/mail/pop3/TempFile;->close()V

    .line 295
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->fileCache:Lcom/sun/mail/pop3/TempFile;
    :try_end_63
    .catchall {:try_start_46 .. :try_end_63} :catchall_a3

    .line 298
    :cond_63
    :goto_63
    monitor-exit p0

    return-void

    .line 279
    :cond_65
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_66
    :try_start_66
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->message_cache:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-ge v0, v3, :cond_7f

    .line 280
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->message_cache:Ljava/util/Vector;

    invoke-virtual {v3, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/sun/mail/pop3/POP3Message;

    .restart local v2    # "m":Lcom/sun/mail/pop3/POP3Message;
    if-eqz v2, :cond_7c

    .line 281
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/sun/mail/pop3/POP3Message;->invalidate(Z)V

    .line 279
    :cond_7c
    add-int/lit8 v0, v0, 0x1

    goto :goto_66

    .line 284
    .end local v2    # "m":Lcom/sun/mail/pop3/POP3Message;
    :cond_7f
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->port:Lcom/sun/mail/pop3/Protocol;

    invoke-virtual {v3}, Lcom/sun/mail/pop3/Protocol;->quit()Z
    :try_end_84
    .catch Ljava/io/IOException; {:try_start_66 .. :try_end_84} :catch_44
    .catchall {:try_start_66 .. :try_end_84} :catchall_a6

    .line 288
    const/4 v3, 0x0

    :try_start_85
    iput-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->port:Lcom/sun/mail/pop3/Protocol;

    .line 289
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->store:Lcom/sun/mail/pop3/POP3Store;

    invoke-virtual {v3, p0}, Lcom/sun/mail/pop3/POP3Store;->closePort(Lcom/sun/mail/pop3/POP3Folder;)V

    .line 290
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->message_cache:Ljava/util/Vector;

    .line 291
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/sun/mail/pop3/POP3Folder;->opened:Z

    .line 292
    const/4 v3, 0x3

    invoke-virtual {p0, v3}, Lcom/sun/mail/pop3/POP3Folder;->notifyConnectionListeners(I)V

    .line 293
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->fileCache:Lcom/sun/mail/pop3/TempFile;

    if-eqz v3, :cond_63

    .line 294
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->fileCache:Lcom/sun/mail/pop3/TempFile;

    invoke-virtual {v3}, Lcom/sun/mail/pop3/TempFile;->close()V

    .line 295
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->fileCache:Lcom/sun/mail/pop3/TempFile;
    :try_end_a2
    .catchall {:try_start_85 .. :try_end_a2} :catchall_a3

    goto :goto_63

    .line 245
    .end local v0    # "i":I
    :catchall_a3
    move-exception v3

    monitor-exit p0

    throw v3

    .line 288
    :catchall_a6
    move-exception v3

    const/4 v4, 0x0

    :try_start_a8
    iput-object v4, p0, Lcom/sun/mail/pop3/POP3Folder;->port:Lcom/sun/mail/pop3/Protocol;

    .line 289
    iget-object v4, p0, Lcom/sun/mail/pop3/POP3Folder;->store:Lcom/sun/mail/pop3/POP3Store;

    invoke-virtual {v4, p0}, Lcom/sun/mail/pop3/POP3Store;->closePort(Lcom/sun/mail/pop3/POP3Folder;)V

    .line 290
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/sun/mail/pop3/POP3Folder;->message_cache:Ljava/util/Vector;

    .line 291
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/sun/mail/pop3/POP3Folder;->opened:Z

    .line 292
    const/4 v4, 0x3

    invoke-virtual {p0, v4}, Lcom/sun/mail/pop3/POP3Folder;->notifyConnectionListeners(I)V

    .line 293
    iget-object v4, p0, Lcom/sun/mail/pop3/POP3Folder;->fileCache:Lcom/sun/mail/pop3/TempFile;

    if-eqz v4, :cond_c5

    .line 294
    iget-object v4, p0, Lcom/sun/mail/pop3/POP3Folder;->fileCache:Lcom/sun/mail/pop3/TempFile;

    invoke-virtual {v4}, Lcom/sun/mail/pop3/TempFile;->close()V

    .line 295
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/sun/mail/pop3/POP3Folder;->fileCache:Lcom/sun/mail/pop3/TempFile;

    :cond_c5
    throw v3
    :try_end_c6
    .catchall {:try_start_a8 .. :try_end_c6} :catchall_a3
.end method

.method public create(I)Z
    .registers 3
    .param p1, "type"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 151
    const/4 v0, 0x0

    return v0
.end method

.method protected createMessage(Lkorex/mail/Folder;I)Lcom/sun/mail/pop3/POP3Message;
    .registers 9
    .param p1, "f"    # Lkorex/mail/Folder;
    .param p2, "msgno"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 356
    const/4 v2, 0x0

    .line 357
    .local v2, "m":Lcom/sun/mail/pop3/POP3Message;
    iget-object v4, p0, Lcom/sun/mail/pop3/POP3Folder;->store:Lcom/sun/mail/pop3/POP3Store;

    iget-object v1, v4, Lcom/sun/mail/pop3/POP3Store;->messageConstructor:Ljava/lang/reflect/Constructor;

    .line 358
    .local v1, "cons":Ljava/lang/reflect/Constructor;
    if-eqz v1, :cond_1c

    .line 360
    const/4 v4, 0x2

    :try_start_8
    new-array v3, v4, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    const/4 v4, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    .line 361
    .local v3, "o":[Ljava/lang/Object;
    invoke-virtual {v1, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lcom/sun/mail/pop3/POP3Message;

    move-object v2, v0
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_1c} :catch_24

    .line 366
    .end local v3    # "o":[Ljava/lang/Object;
    :cond_1c
    :goto_1c
    if-nez v2, :cond_23

    .line 367
    new-instance v2, Lcom/sun/mail/pop3/POP3Message;

    .end local v2    # "m":Lcom/sun/mail/pop3/POP3Message;
    invoke-direct {v2, p0, p2}, Lcom/sun/mail/pop3/POP3Message;-><init>(Lkorex/mail/Folder;I)V

    .line 368
    .restart local v2    # "m":Lcom/sun/mail/pop3/POP3Message;
    :cond_23
    return-object v2

    .line 362
    :catch_24
    move-exception v4

    goto :goto_1c
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
    .line 182
    new-instance v0, Lkorex/mail/MethodNotSupportedException;

    const-string v1, "delete"

    invoke-direct {v0, v1}, Lkorex/mail/MethodNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public exists()Z
    .registers 2

    .prologue
    .line 113
    iget-boolean v0, p0, Lcom/sun/mail/pop3/POP3Folder;->exists:Z

    return v0
.end method

.method public expunge()[Lkorex/mail/Message;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 391
    new-instance v0, Lkorex/mail/MethodNotSupportedException;

    const-string v1, "Expunge not supported"

    invoke-direct {v0, v1}, Lkorex/mail/MethodNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public declared-synchronized fetch([Lkorex/mail/Message;Lkorex/mail/FetchProfile;)V
    .registers 11
    .param p1, "msgs"    # [Lkorex/mail/Message;
    .param p2, "fp"    # Lkorex/mail/FetchProfile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 405
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Folder;->checkReadable()V

    .line 406
    iget-boolean v6, p0, Lcom/sun/mail/pop3/POP3Folder;->doneUidl:Z

    if-nez v6, :cond_5e

    iget-object v6, p0, Lcom/sun/mail/pop3/POP3Folder;->store:Lcom/sun/mail/pop3/POP3Store;

    iget-boolean v6, v6, Lcom/sun/mail/pop3/POP3Store;->supportsUidl:Z

    if-eqz v6, :cond_5e

    sget-object v6, Lkorex/mail/UIDFolder$FetchProfileItem;->UID:Lkorex/mail/UIDFolder$FetchProfileItem;

    .line 407
    invoke-virtual {p2, v6}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v6

    if-eqz v6, :cond_5e

    .line 416
    iget-object v6, p0, Lcom/sun/mail/pop3/POP3Folder;->message_cache:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v6

    new-array v5, v6, [Ljava/lang/String;
    :try_end_1e
    .catchall {:try_start_1 .. :try_end_1e} :catchall_37

    .line 418
    .local v5, "uids":[Ljava/lang/String;
    :try_start_1e
    iget-object v6, p0, Lcom/sun/mail/pop3/POP3Folder;->port:Lcom/sun/mail/pop3/Protocol;

    invoke-virtual {v6, v5}, Lcom/sun/mail/pop3/Protocol;->uidl([Ljava/lang/String;)Z
    :try_end_23
    .catch Ljava/io/EOFException; {:try_start_1e .. :try_end_23} :catch_28
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_23} :catch_3a
    .catchall {:try_start_1e .. :try_end_23} :catchall_37

    move-result v6

    if-nez v6, :cond_43

    .line 447
    .end local v5    # "uids":[Ljava/lang/String;
    :cond_26
    monitor-exit p0

    return-void

    .line 420
    .restart local v5    # "uids":[Ljava/lang/String;
    :catch_28
    move-exception v0

    .line 421
    .local v0, "eex":Ljava/io/EOFException;
    const/4 v6, 0x0

    :try_start_2a
    invoke-virtual {p0, v6}, Lcom/sun/mail/pop3/POP3Folder;->close(Z)V

    .line 422
    new-instance v6, Lkorex/mail/FolderClosedException;

    invoke-virtual {v0}, Ljava/io/EOFException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, p0, v7}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v6
    :try_end_37
    .catchall {:try_start_2a .. :try_end_37} :catchall_37

    .line 405
    .end local v0    # "eex":Ljava/io/EOFException;
    .end local v5    # "uids":[Ljava/lang/String;
    :catchall_37
    move-exception v6

    monitor-exit p0

    throw v6

    .line 423
    .restart local v5    # "uids":[Ljava/lang/String;
    :catch_3a
    move-exception v1

    .line 424
    .local v1, "ex":Ljava/io/IOException;
    :try_start_3b
    new-instance v6, Lkorex/mail/MessagingException;

    const-string v7, "error getting UIDL"

    invoke-direct {v6, v7, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6

    .line 426
    .end local v1    # "ex":Ljava/io/IOException;
    :cond_43
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_44
    array-length v6, v5

    if-ge v2, v6, :cond_5b

    .line 427
    aget-object v6, v5, v2

    if-nez v6, :cond_4e

    .line 426
    :goto_4b
    add-int/lit8 v2, v2, 0x1

    goto :goto_44

    .line 429
    :cond_4e
    add-int/lit8 v6, v2, 0x1

    invoke-virtual {p0, v6}, Lcom/sun/mail/pop3/POP3Folder;->getMessage(I)Lkorex/mail/Message;

    move-result-object v3

    check-cast v3, Lcom/sun/mail/pop3/POP3Message;

    .line 430
    .local v3, "m":Lcom/sun/mail/pop3/POP3Message;
    aget-object v6, v5, v2

    iput-object v6, v3, Lcom/sun/mail/pop3/POP3Message;->uid:Ljava/lang/String;

    goto :goto_4b

    .line 432
    .end local v3    # "m":Lcom/sun/mail/pop3/POP3Message;
    :cond_5b
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/sun/mail/pop3/POP3Folder;->doneUidl:Z

    .line 434
    .end local v2    # "i":I
    .end local v5    # "uids":[Ljava/lang/String;
    :cond_5e
    sget-object v6, Lkorex/mail/FetchProfile$Item;->ENVELOPE:Lkorex/mail/FetchProfile$Item;

    invoke-virtual {p2, v6}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v6

    if-eqz v6, :cond_26

    .line 435
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_67
    array-length v6, p1
    :try_end_68
    .catchall {:try_start_3b .. :try_end_68} :catchall_37

    if-ge v2, v6, :cond_26

    .line 437
    :try_start_6a
    aget-object v4, p1, v2

    check-cast v4, Lcom/sun/mail/pop3/POP3Message;

    .line 439
    .local v4, "msg":Lcom/sun/mail/pop3/POP3Message;
    const-string v6, ""

    invoke-virtual {v4, v6}, Lcom/sun/mail/pop3/POP3Message;->getHeader(Ljava/lang/String;)[Ljava/lang/String;

    .line 441
    invoke-virtual {v4}, Lcom/sun/mail/pop3/POP3Message;->getSize()I
    :try_end_76
    .catch Lkorex/mail/MessageRemovedException; {:try_start_6a .. :try_end_76} :catch_79
    .catchall {:try_start_6a .. :try_end_76} :catchall_37

    .line 435
    .end local v4    # "msg":Lcom/sun/mail/pop3/POP3Message;
    :goto_76
    add-int/lit8 v2, v2, 0x1

    goto :goto_67

    .line 442
    :catch_79
    move-exception v6

    goto :goto_76
.end method

.method protected finalize()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 552
    invoke-super {p0}, Lkorex/mail/Folder;->finalize()V

    .line 553
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/sun/mail/pop3/POP3Folder;->close(Z)V

    .line 554
    return-void
.end method

.method getFileCache()Lcom/sun/mail/pop3/TempFile;
    .registers 2

    .prologue
    .line 605
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Folder;->fileCache:Lcom/sun/mail/pop3/TempFile;

    return-object v0
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
    .line 171
    new-instance v0, Lkorex/mail/MessagingException;

    const-string v1, "not a directory"

    invoke-direct {v0, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getFullName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Folder;->name:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized getMessage(I)Lkorex/mail/Message;
    .registers 5
    .param p1, "msgno"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 342
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Folder;->checkOpen()V

    .line 347
    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Folder;->message_cache:Ljava/util/Vector;

    add-int/lit8 v2, p1, -0x1

    invoke-virtual {v1, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sun/mail/pop3/POP3Message;

    .local v0, "m":Lcom/sun/mail/pop3/POP3Message;
    if-nez v0, :cond_1b

    .line 348
    invoke-virtual {p0, p0, p1}, Lcom/sun/mail/pop3/POP3Folder;->createMessage(Lkorex/mail/Folder;I)Lcom/sun/mail/pop3/POP3Message;

    move-result-object v0

    .line 349
    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Folder;->message_cache:Ljava/util/Vector;

    add-int/lit8 v2, p1, -0x1

    invoke-virtual {v1, v0, v2}, Ljava/util/Vector;->setElementAt(Ljava/lang/Object;I)V
    :try_end_1b
    .catchall {:try_start_1 .. :try_end_1b} :catchall_1d

    .line 351
    :cond_1b
    monitor-exit p0

    return-object v0

    .line 342
    .end local v0    # "m":Lcom/sun/mail/pop3/POP3Message;
    :catchall_1d
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getMessageCount()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 334
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/sun/mail/pop3/POP3Folder;->opened:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_e

    if-nez v0, :cond_8

    .line 335
    const/4 v0, -0x1

    .line 337
    :goto_6
    monitor-exit p0

    return v0

    .line 336
    :cond_8
    :try_start_8
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Folder;->checkReadable()V

    .line 337
    iget v0, p0, Lcom/sun/mail/pop3/POP3Folder;->total:I
    :try_end_d
    .catchall {:try_start_8 .. :try_end_d} :catchall_e

    goto :goto_6

    .line 334
    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Folder;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getParent()Lkorex/mail/Folder;
    .registers 3

    .prologue
    .line 103
    new-instance v0, Lcom/sun/mail/pop3/DefaultFolder;

    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Folder;->store:Lcom/sun/mail/pop3/POP3Store;

    invoke-direct {v0, v1}, Lcom/sun/mail/pop3/DefaultFolder;-><init>(Lcom/sun/mail/pop3/POP3Store;)V

    return-object v0
.end method

.method public getPermanentFlags()Lkorex/mail/Flags;
    .registers 2

    .prologue
    .line 325
    new-instance v0, Lkorex/mail/Flags;

    invoke-direct {v0}, Lkorex/mail/Flags;-><init>()V

    return-object v0
.end method

.method getProtocol()Lcom/sun/mail/pop3/Protocol;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 588
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Folder;->port:Lcom/sun/mail/pop3/Protocol;

    .line 589
    .local v0, "p":Lcom/sun/mail/pop3/Protocol;
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Folder;->checkOpen()V

    .line 591
    return-object v0
.end method

.method public getSeparator()C
    .registers 2

    .prologue
    .line 132
    const/4 v0, 0x0

    return v0
.end method

.method public declared-synchronized getSize()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 485
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Folder;->checkOpen()V

    .line 486
    iget v0, p0, Lcom/sun/mail/pop3/POP3Folder;->size:I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    monitor-exit p0

    return v0

    .line 485
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getSizes()[I
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 500
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Folder;->checkOpen()V

    .line 501
    iget v8, p0, Lcom/sun/mail/pop3/POP3Folder;->total:I

    new-array v6, v8, [I
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_67

    .line 502
    .local v6, "sizes":[I
    const/4 v0, 0x0

    .line 503
    .local v0, "is":Ljava/io/InputStream;
    const/4 v2, 0x0

    .line 505
    .local v2, "lis":Lcom/sun/mail/util/LineInputStream;
    :try_start_a
    iget-object v8, p0, Lcom/sun/mail/pop3/POP3Folder;->port:Lcom/sun/mail/pop3/Protocol;

    invoke-virtual {v8}, Lcom/sun/mail/pop3/Protocol;->list()Ljava/io/InputStream;

    move-result-object v0

    .line 506
    new-instance v3, Lcom/sun/mail/util/LineInputStream;

    invoke-direct {v3, v0}, Lcom/sun/mail/util/LineInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_15} :catch_4d
    .catchall {:try_start_a .. :try_end_15} :catchall_5b

    .line 508
    .end local v2    # "lis":Lcom/sun/mail/util/LineInputStream;
    .local v3, "lis":Lcom/sun/mail/util/LineInputStream;
    :cond_15
    :goto_15
    :try_start_15
    invoke-virtual {v3}, Lcom/sun/mail/util/LineInputStream;->readLine()Ljava/lang/String;
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_18} :catch_75
    .catchall {:try_start_15 .. :try_end_18} :catchall_72

    move-result-object v1

    .local v1, "line":Ljava/lang/String;
    if-eqz v1, :cond_3d

    .line 510
    :try_start_1b
    new-instance v7, Ljava/util/StringTokenizer;

    invoke-direct {v7, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 511
    .local v7, "st":Ljava/util/StringTokenizer;
    invoke-virtual {v7}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 512
    .local v4, "msgnum":I
    invoke-virtual {v7}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 513
    .local v5, "size":I
    if-lez v4, :cond_15

    iget v8, p0, Lcom/sun/mail/pop3/POP3Folder;->total:I

    if-gt v4, v8, :cond_15

    .line 514
    add-int/lit8 v8, v4, -0x1

    aput v5, v6, v8
    :try_end_3a
    .catch Ljava/lang/RuntimeException; {:try_start_1b .. :try_end_3a} :catch_3b
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_3a} :catch_75
    .catchall {:try_start_1b .. :try_end_3a} :catchall_72

    goto :goto_15

    .line 515
    .end local v4    # "msgnum":I
    .end local v5    # "size":I
    .end local v7    # "st":Ljava/util/StringTokenizer;
    :catch_3b
    move-exception v8

    goto :goto_15

    .line 522
    :cond_3d
    if-eqz v3, :cond_42

    .line 523
    :try_start_3f
    invoke-virtual {v3}, Lcom/sun/mail/util/LineInputStream;->close()V
    :try_end_42
    .catch Ljava/io/IOException; {:try_start_3f .. :try_end_42} :catch_6a
    .catchall {:try_start_3f .. :try_end_42} :catchall_67

    .line 526
    :cond_42
    :goto_42
    if-eqz v0, :cond_47

    .line 527
    :try_start_44
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_47
    .catch Ljava/io/IOException; {:try_start_44 .. :try_end_47} :catch_4a
    .catchall {:try_start_44 .. :try_end_47} :catchall_67

    :cond_47
    move-object v2, v3

    .line 530
    .end local v1    # "line":Ljava/lang/String;
    .end local v3    # "lis":Lcom/sun/mail/util/LineInputStream;
    .restart local v2    # "lis":Lcom/sun/mail/util/LineInputStream;
    :cond_48
    :goto_48
    monitor-exit p0

    return-object v6

    .line 528
    .end local v2    # "lis":Lcom/sun/mail/util/LineInputStream;
    .restart local v1    # "line":Ljava/lang/String;
    .restart local v3    # "lis":Lcom/sun/mail/util/LineInputStream;
    :catch_4a
    move-exception v8

    move-object v2, v3

    .line 529
    .end local v3    # "lis":Lcom/sun/mail/util/LineInputStream;
    .restart local v2    # "lis":Lcom/sun/mail/util/LineInputStream;
    goto :goto_48

    .line 518
    .end local v1    # "line":Ljava/lang/String;
    :catch_4d
    move-exception v8

    .line 522
    :goto_4e
    if-eqz v2, :cond_53

    .line 523
    :try_start_50
    invoke-virtual {v2}, Lcom/sun/mail/util/LineInputStream;->close()V
    :try_end_53
    .catch Ljava/io/IOException; {:try_start_50 .. :try_end_53} :catch_6c
    .catchall {:try_start_50 .. :try_end_53} :catchall_67

    .line 526
    :cond_53
    :goto_53
    if-eqz v0, :cond_48

    .line 527
    :try_start_55
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_58
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_58} :catch_59
    .catchall {:try_start_55 .. :try_end_58} :catchall_67

    goto :goto_48

    .line 528
    :catch_59
    move-exception v8

    goto :goto_48

    .line 521
    :catchall_5b
    move-exception v8

    .line 522
    :goto_5c
    if-eqz v2, :cond_61

    .line 523
    :try_start_5e
    invoke-virtual {v2}, Lcom/sun/mail/util/LineInputStream;->close()V
    :try_end_61
    .catch Ljava/io/IOException; {:try_start_5e .. :try_end_61} :catch_6e
    .catchall {:try_start_5e .. :try_end_61} :catchall_67

    .line 526
    :cond_61
    :goto_61
    if-eqz v0, :cond_66

    .line 527
    :try_start_63
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_66
    .catch Ljava/io/IOException; {:try_start_63 .. :try_end_66} :catch_70
    .catchall {:try_start_63 .. :try_end_66} :catchall_67

    .line 528
    :cond_66
    :goto_66
    :try_start_66
    throw v8
    :try_end_67
    .catchall {:try_start_66 .. :try_end_67} :catchall_67

    .line 500
    .end local v0    # "is":Ljava/io/InputStream;
    .end local v2    # "lis":Lcom/sun/mail/util/LineInputStream;
    .end local v6    # "sizes":[I
    :catchall_67
    move-exception v8

    monitor-exit p0

    throw v8

    .line 524
    .restart local v0    # "is":Ljava/io/InputStream;
    .restart local v1    # "line":Ljava/lang/String;
    .restart local v3    # "lis":Lcom/sun/mail/util/LineInputStream;
    .restart local v6    # "sizes":[I
    :catch_6a
    move-exception v8

    goto :goto_42

    .end local v1    # "line":Ljava/lang/String;
    .end local v3    # "lis":Lcom/sun/mail/util/LineInputStream;
    .restart local v2    # "lis":Lcom/sun/mail/util/LineInputStream;
    :catch_6c
    move-exception v8

    goto :goto_53

    :catch_6e
    move-exception v9

    goto :goto_61

    .line 528
    :catch_70
    move-exception v9

    goto :goto_66

    .line 521
    .end local v2    # "lis":Lcom/sun/mail/util/LineInputStream;
    .restart local v3    # "lis":Lcom/sun/mail/util/LineInputStream;
    :catchall_72
    move-exception v8

    move-object v2, v3

    .end local v3    # "lis":Lcom/sun/mail/util/LineInputStream;
    .restart local v2    # "lis":Lcom/sun/mail/util/LineInputStream;
    goto :goto_5c

    .line 518
    .end local v2    # "lis":Lcom/sun/mail/util/LineInputStream;
    .restart local v3    # "lis":Lcom/sun/mail/util/LineInputStream;
    :catch_75
    move-exception v8

    move-object v2, v3

    .end local v3    # "lis":Lcom/sun/mail/util/LineInputStream;
    .restart local v2    # "lis":Lcom/sun/mail/util/LineInputStream;
    goto :goto_4e
.end method

.method public getType()I
    .registers 2

    .prologue
    .line 141
    const/4 v0, 0x1

    return v0
.end method

.method public declared-synchronized getUID(Lkorex/mail/Message;)Ljava/lang/String;
    .registers 8
    .param p1, "msg"    # Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 458
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Folder;->checkOpen()V

    .line 459
    instance-of v4, p1, Lcom/sun/mail/pop3/POP3Message;

    if-nez v4, :cond_13

    .line 460
    new-instance v4, Lkorex/mail/MessagingException;

    const-string v5, "message is not a POP3Message"

    invoke-direct {v4, v5}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_10

    .line 458
    :catchall_10
    move-exception v4

    monitor-exit p0

    throw v4

    .line 461
    :cond_13
    :try_start_13
    move-object v0, p1

    check-cast v0, Lcom/sun/mail/pop3/POP3Message;

    move-object v3, v0
    :try_end_17
    .catchall {:try_start_13 .. :try_end_17} :catchall_10

    .line 463
    .local v3, "m":Lcom/sun/mail/pop3/POP3Message;
    :try_start_17
    iget-object v4, p0, Lcom/sun/mail/pop3/POP3Folder;->store:Lcom/sun/mail/pop3/POP3Store;

    iget-boolean v4, v4, Lcom/sun/mail/pop3/POP3Store;->supportsUidl:Z
    :try_end_1b
    .catch Ljava/io/EOFException; {:try_start_17 .. :try_end_1b} :catch_35
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_1b} :catch_44
    .catchall {:try_start_17 .. :try_end_1b} :catchall_10

    if-nez v4, :cond_20

    .line 464
    const/4 v4, 0x0

    .line 467
    :goto_1e
    monitor-exit p0

    return-object v4

    .line 465
    :cond_20
    :try_start_20
    iget-object v4, v3, Lcom/sun/mail/pop3/POP3Message;->uid:Ljava/lang/String;

    const-string v5, "UNKNOWN"

    if-ne v4, v5, :cond_32

    .line 466
    iget-object v4, p0, Lcom/sun/mail/pop3/POP3Folder;->port:Lcom/sun/mail/pop3/Protocol;

    invoke-virtual {v3}, Lcom/sun/mail/pop3/POP3Message;->getMessageNumber()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/sun/mail/pop3/Protocol;->uidl(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/sun/mail/pop3/POP3Message;->uid:Ljava/lang/String;

    .line 467
    :cond_32
    iget-object v4, v3, Lcom/sun/mail/pop3/POP3Message;->uid:Ljava/lang/String;
    :try_end_34
    .catch Ljava/io/EOFException; {:try_start_20 .. :try_end_34} :catch_35
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_34} :catch_44
    .catchall {:try_start_20 .. :try_end_34} :catchall_10

    goto :goto_1e

    .line 468
    :catch_35
    move-exception v1

    .line 469
    .local v1, "eex":Ljava/io/EOFException;
    const/4 v4, 0x0

    :try_start_37
    invoke-virtual {p0, v4}, Lcom/sun/mail/pop3/POP3Folder;->close(Z)V

    .line 470
    new-instance v4, Lkorex/mail/FolderClosedException;

    invoke-virtual {v1}, Ljava/io/EOFException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, p0, v5}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v4

    .line 471
    .end local v1    # "eex":Ljava/io/EOFException;
    :catch_44
    move-exception v2

    .line 472
    .local v2, "ex":Ljava/io/IOException;
    new-instance v4, Lkorex/mail/MessagingException;

    const-string v5, "error getting UIDL"

    invoke-direct {v4, v5, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v4
    :try_end_4d
    .catchall {:try_start_37 .. :try_end_4d} :catchall_10
.end method

.method public hasNewMessages()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 161
    const/4 v0, 0x0

    return v0
.end method

.method public declared-synchronized isOpen()Z
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 301
    monitor-enter p0

    :try_start_2
    iget-boolean v2, p0, Lcom/sun/mail/pop3/POP3Folder;->opened:Z
    :try_end_4
    .catchall {:try_start_2 .. :try_end_4} :catchall_24

    if-nez v2, :cond_8

    .line 315
    :goto_6
    monitor-exit p0

    return v1

    .line 304
    :cond_8
    :try_start_8
    iget-object v2, p0, Lcom/sun/mail/pop3/POP3Folder;->port:Lcom/sun/mail/pop3/Protocol;

    invoke-virtual {v2}, Lcom/sun/mail/pop3/Protocol;->noop()Z

    move-result v2

    if-nez v2, :cond_20

    .line 305
    new-instance v2, Ljava/io/IOException;

    const-string v3, "NOOP failed"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_18} :catch_18
    .catchall {:try_start_8 .. :try_end_18} :catchall_24

    .line 306
    :catch_18
    move-exception v0

    .line 308
    .local v0, "ioex":Ljava/io/IOException;
    const/4 v2, 0x0

    :try_start_1a
    invoke-virtual {p0, v2}, Lcom/sun/mail/pop3/POP3Folder;->close(Z)V
    :try_end_1d
    .catch Lkorex/mail/MessagingException; {:try_start_1a .. :try_end_1d} :catch_1e
    .catchall {:try_start_1a .. :try_end_1d} :catchall_22

    goto :goto_6

    .line 309
    :catch_1e
    move-exception v2

    goto :goto_6

    .line 315
    .end local v0    # "ioex":Ljava/io/IOException;
    :cond_20
    const/4 v1, 0x1

    goto :goto_6

    .line 312
    .restart local v0    # "ioex":Ljava/io/IOException;
    :catchall_22
    move-exception v2

    goto :goto_6

    .line 301
    .end local v0    # "ioex":Ljava/io/IOException;
    :catchall_24
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public list(Ljava/lang/String;)[Lkorex/mail/Folder;
    .registers 4
    .param p1, "pattern"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 123
    new-instance v0, Lkorex/mail/MessagingException;

    const-string v1, "not a directory"

    invoke-direct {v0, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public declared-synchronized listCommand()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 544
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Folder;->checkOpen()V

    .line 545
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Folder;->port:Lcom/sun/mail/pop3/Protocol;

    invoke-virtual {v0}, Lcom/sun/mail/pop3/Protocol;->list()Ljava/io/InputStream;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_c

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 544
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected notifyMessageChangedListeners(ILkorex/mail/Message;)V
    .registers 3
    .param p1, "type"    # I
    .param p2, "m"    # Lkorex/mail/Message;

    .prologue
    .line 598
    invoke-super {p0, p1, p2}, Lkorex/mail/Folder;->notifyMessageChangedListeners(ILkorex/mail/Message;)V

    .line 599
    return-void
.end method

.method public declared-synchronized open(I)V
    .registers 8
    .param p1, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 204
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Folder;->checkClosed()V

    .line 205
    iget-boolean v3, p0, Lcom/sun/mail/pop3/POP3Folder;->exists:Z

    if-nez v3, :cond_13

    .line 206
    new-instance v3, Lkorex/mail/FolderNotFoundException;

    const-string v4, "folder is not INBOX"

    invoke-direct {v3, p0, v4}, Lkorex/mail/FolderNotFoundException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v3
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_10

    .line 204
    :catchall_10
    move-exception v3

    monitor-exit p0

    throw v3

    .line 209
    :cond_13
    :try_start_13
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->store:Lcom/sun/mail/pop3/POP3Store;

    invoke-virtual {v3, p0}, Lcom/sun/mail/pop3/POP3Store;->getPort(Lcom/sun/mail/pop3/POP3Folder;)Lcom/sun/mail/pop3/Protocol;

    move-result-object v3

    iput-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->port:Lcom/sun/mail/pop3/Protocol;

    .line 210
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->port:Lcom/sun/mail/pop3/Protocol;

    invoke-virtual {v3}, Lcom/sun/mail/pop3/Protocol;->stat()Lcom/sun/mail/pop3/Status;

    move-result-object v2

    .line 211
    .local v2, "s":Lcom/sun/mail/pop3/Status;
    iget v3, v2, Lcom/sun/mail/pop3/Status;->total:I

    iput v3, p0, Lcom/sun/mail/pop3/POP3Folder;->total:I

    .line 212
    iget v3, v2, Lcom/sun/mail/pop3/Status;->size:I

    iput v3, p0, Lcom/sun/mail/pop3/POP3Folder;->size:I

    .line 213
    iput p1, p0, Lcom/sun/mail/pop3/POP3Folder;->mode:I

    .line 214
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->store:Lcom/sun/mail/pop3/POP3Store;

    iget-boolean v3, v3, Lcom/sun/mail/pop3/POP3Store;->useFileCache:Z
    :try_end_2f
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_2f} :catch_63
    .catchall {:try_start_13 .. :try_end_2f} :catchall_10

    if-eqz v3, :cond_3c

    .line 216
    :try_start_31
    new-instance v3, Lcom/sun/mail/pop3/TempFile;

    iget-object v4, p0, Lcom/sun/mail/pop3/POP3Folder;->store:Lcom/sun/mail/pop3/POP3Store;

    iget-object v4, v4, Lcom/sun/mail/pop3/POP3Store;->fileCacheDir:Ljava/io/File;

    invoke-direct {v3, v4}, Lcom/sun/mail/pop3/TempFile;-><init>(Ljava/io/File;)V

    iput-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->fileCache:Lcom/sun/mail/pop3/TempFile;
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_3c} :catch_58
    .catchall {:try_start_31 .. :try_end_3c} :catchall_10

    .line 222
    :cond_3c
    const/4 v3, 0x1

    :try_start_3d
    iput-boolean v3, p0, Lcom/sun/mail/pop3/POP3Folder;->opened:Z
    :try_end_3f
    .catch Ljava/io/IOException; {:try_start_3d .. :try_end_3f} :catch_63
    .catchall {:try_start_3d .. :try_end_3f} :catchall_10

    .line 237
    :try_start_3f
    new-instance v3, Ljava/util/Vector;

    iget v4, p0, Lcom/sun/mail/pop3/POP3Folder;->total:I

    invoke-direct {v3, v4}, Ljava/util/Vector;-><init>(I)V

    iput-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->message_cache:Ljava/util/Vector;

    .line 238
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->message_cache:Ljava/util/Vector;

    iget v4, p0, Lcom/sun/mail/pop3/POP3Folder;->total:I

    invoke-virtual {v3, v4}, Ljava/util/Vector;->setSize(I)V

    .line 239
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/sun/mail/pop3/POP3Folder;->doneUidl:Z

    .line 241
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lcom/sun/mail/pop3/POP3Folder;->notifyConnectionListeners(I)V
    :try_end_56
    .catchall {:try_start_3f .. :try_end_56} :catchall_10

    .line 242
    monitor-exit p0

    return-void

    .line 217
    :catch_58
    move-exception v0

    .line 218
    .local v0, "ex":Ljava/io/IOException;
    :try_start_59
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v5, "failed to create file cache"

    invoke-virtual {v3, v4, v5, v0}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 219
    throw v0
    :try_end_63
    .catch Ljava/io/IOException; {:try_start_59 .. :try_end_63} :catch_63
    .catchall {:try_start_59 .. :try_end_63} :catchall_10

    .line 223
    .end local v0    # "ex":Ljava/io/IOException;
    .end local v2    # "s":Lcom/sun/mail/pop3/Status;
    :catch_63
    move-exception v1

    .line 225
    .local v1, "ioex":Ljava/io/IOException;
    :try_start_64
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->port:Lcom/sun/mail/pop3/Protocol;

    if-eqz v3, :cond_6d

    .line 226
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->port:Lcom/sun/mail/pop3/Protocol;

    invoke-virtual {v3}, Lcom/sun/mail/pop3/Protocol;->quit()Z
    :try_end_6d
    .catch Ljava/io/IOException; {:try_start_64 .. :try_end_6d} :catch_7d
    .catchall {:try_start_64 .. :try_end_6d} :catchall_87

    .line 230
    :cond_6d
    const/4 v3, 0x0

    :try_start_6e
    iput-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->port:Lcom/sun/mail/pop3/Protocol;

    .line 231
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->store:Lcom/sun/mail/pop3/POP3Store;

    invoke-virtual {v3, p0}, Lcom/sun/mail/pop3/POP3Store;->closePort(Lcom/sun/mail/pop3/POP3Folder;)V

    .line 233
    :goto_75
    new-instance v3, Lkorex/mail/MessagingException;

    const-string v4, "Open failed"

    invoke-direct {v3, v4, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3

    .line 227
    :catch_7d
    move-exception v3

    .line 230
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->port:Lcom/sun/mail/pop3/Protocol;

    .line 231
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Folder;->store:Lcom/sun/mail/pop3/POP3Store;

    invoke-virtual {v3, p0}, Lcom/sun/mail/pop3/POP3Store;->closePort(Lcom/sun/mail/pop3/POP3Folder;)V

    goto :goto_75

    .line 230
    :catchall_87
    move-exception v3

    const/4 v4, 0x0

    iput-object v4, p0, Lcom/sun/mail/pop3/POP3Folder;->port:Lcom/sun/mail/pop3/Protocol;

    .line 231
    iget-object v4, p0, Lcom/sun/mail/pop3/POP3Folder;->store:Lcom/sun/mail/pop3/POP3Store;

    invoke-virtual {v4, p0}, Lcom/sun/mail/pop3/POP3Store;->closePort(Lcom/sun/mail/pop3/POP3Folder;)V

    throw v3
    :try_end_91
    .catchall {:try_start_6e .. :try_end_91} :catchall_10
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
    .line 192
    new-instance v0, Lkorex/mail/MethodNotSupportedException;

    const-string v1, "renameTo"

    invoke-direct {v0, v1}, Lkorex/mail/MethodNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
