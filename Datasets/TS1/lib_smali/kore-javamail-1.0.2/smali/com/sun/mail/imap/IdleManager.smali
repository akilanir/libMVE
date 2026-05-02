.class public Lcom/sun/mail/imap/IdleManager;
.super Ljava/lang/Object;
.source "IdleManager.java"


# instance fields
.field private volatile die:Z

.field private es:Ljava/util/concurrent/Executor;

.field private logger:Lcom/sun/mail/util/MailLogger;

.field private selector:Ljava/nio/channels/Selector;

.field private toAbort:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/sun/mail/imap/IMAPFolder;",
            ">;"
        }
    .end annotation
.end field

.field private toWatch:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/sun/mail/imap/IMAPFolder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lkorex/mail/Session;Ljava/util/concurrent/Executor;)V
    .registers 6
    .param p1, "session"    # Lkorex/mail/Session;
    .param p2, "es"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 136
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/sun/mail/imap/IdleManager;->die:Z

    .line 137
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/sun/mail/imap/IdleManager;->toWatch:Ljava/util/Queue;

    .line 138
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/sun/mail/imap/IdleManager;->toAbort:Ljava/util/Queue;

    .line 149
    new-instance v0, Lcom/sun/mail/util/MailLogger;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "DEBUG IMAP"

    invoke-direct {v0, v1, v2, p1}, Lcom/sun/mail/util/MailLogger;-><init>(Ljava/lang/Class;Ljava/lang/String;Lkorex/mail/Session;)V

    iput-object v0, p0, Lcom/sun/mail/imap/IdleManager;->logger:Lcom/sun/mail/util/MailLogger;

    .line 150
    iput-object p2, p0, Lcom/sun/mail/imap/IdleManager;->es:Ljava/util/concurrent/Executor;

    .line 151
    invoke-static {}, Ljava/nio/channels/Selector;->open()Ljava/nio/channels/Selector;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/imap/IdleManager;->selector:Ljava/nio/channels/Selector;

    .line 152
    new-instance v0, Lcom/sun/mail/imap/IdleManager$1;

    invoke-direct {v0, p0}, Lcom/sun/mail/imap/IdleManager$1;-><init>(Lcom/sun/mail/imap/IdleManager;)V

    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 157
    return-void
.end method

.method static synthetic access$000(Lcom/sun/mail/imap/IdleManager;)V
    .registers 1
    .param p0, "x0"    # Lcom/sun/mail/imap/IdleManager;

    .prologue
    .line 132
    invoke-direct {p0}, Lcom/sun/mail/imap/IdleManager;->select()V

    return-void
.end method

.method private processKeys()Z
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    .line 276
    const/4 v2, 0x0

    .line 281
    .local v2, "more":Z
    :cond_2
    :goto_2
    iget-object v6, p0, Lcom/sun/mail/imap/IdleManager;->toAbort:Ljava/util/Queue;

    invoke-interface {v6}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sun/mail/imap/IMAPFolder;

    .local v1, "folder":Lcom/sun/mail/imap/IMAPFolder;
    if-eqz v1, :cond_33

    .line 282
    iget-object v6, p0, Lcom/sun/mail/imap/IdleManager;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v7, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v8, "IdleManager aborting IDLE for folder: {0}"

    invoke-virtual {v6, v7, v8, v1}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 284
    invoke-virtual {v1}, Lcom/sun/mail/imap/IMAPFolder;->getChannel()Ljava/nio/channels/SocketChannel;

    move-result-object v3

    .line 285
    .local v3, "sc":Ljava/nio/channels/SocketChannel;
    if-eqz v3, :cond_2

    .line 287
    iget-object v6, p0, Lcom/sun/mail/imap/IdleManager;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v3, v6}, Ljava/nio/channels/SocketChannel;->keyFor(Ljava/nio/channels/Selector;)Ljava/nio/channels/SelectionKey;

    move-result-object v5

    .line 289
    .local v5, "sk":Ljava/nio/channels/SelectionKey;
    if-eqz v5, :cond_26

    .line 290
    invoke-virtual {v5}, Ljava/nio/channels/SelectionKey;->cancel()V

    .line 292
    :cond_26
    invoke-virtual {v3, v11}, Ljava/nio/channels/SocketChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 293
    invoke-virtual {v1}, Lcom/sun/mail/imap/IMAPFolder;->idleAbort()V

    .line 295
    iget-object v6, p0, Lcom/sun/mail/imap/IdleManager;->toWatch:Ljava/util/Queue;

    invoke-interface {v6, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 296
    const/4 v2, 0x1

    .line 297
    goto :goto_2

    .line 302
    .end local v3    # "sc":Ljava/nio/channels/SocketChannel;
    .end local v5    # "sk":Ljava/nio/channels/SelectionKey;
    :cond_33
    iget-object v6, p0, Lcom/sun/mail/imap/IdleManager;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v6}, Ljava/nio/channels/Selector;->selectedKeys()Ljava/util/Set;

    move-result-object v4

    .line 303
    .local v4, "selectedKeys":Ljava/util/Set;, "Ljava/util/Set<Ljava/nio/channels/SelectionKey;>;"
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3d
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_99

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/nio/channels/SelectionKey;

    .line 304
    .restart local v5    # "sk":Ljava/nio/channels/SelectionKey;
    invoke-interface {v4, v5}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 306
    invoke-virtual {v5}, Ljava/nio/channels/SelectionKey;->cancel()V

    .line 307
    invoke-virtual {v5}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "folder":Lcom/sun/mail/imap/IMAPFolder;
    check-cast v1, Lcom/sun/mail/imap/IMAPFolder;

    .line 308
    .restart local v1    # "folder":Lcom/sun/mail/imap/IMAPFolder;
    iget-object v7, p0, Lcom/sun/mail/imap/IdleManager;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v8, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v9, "IdleManager selected folder: {0}"

    invoke-virtual {v7, v8, v9, v1}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 310
    invoke-virtual {v5}, Ljava/nio/channels/SelectionKey;->channel()Ljava/nio/channels/SelectableChannel;

    move-result-object v3

    .line 312
    .local v3, "sc":Ljava/nio/channels/SelectableChannel;
    invoke-virtual {v3, v11}, Ljava/nio/channels/SelectableChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 314
    const/4 v7, 0x0

    :try_start_66
    invoke-virtual {v1, v7}, Lcom/sun/mail/imap/IMAPFolder;->handleIdle(Z)Z

    move-result v7

    if-eqz v7, :cond_73

    .line 317
    iget-object v7, p0, Lcom/sun/mail/imap/IdleManager;->toWatch:Ljava/util/Queue;

    invoke-interface {v7, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 318
    const/4 v2, 0x1

    goto :goto_3d

    .line 321
    :cond_73
    iget-object v7, p0, Lcom/sun/mail/imap/IdleManager;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v8, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v9, "IdleManager done watching folder {0}"

    invoke-virtual {v7, v8, v9, v1}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_7c
    .catch Lkorex/mail/MessagingException; {:try_start_66 .. :try_end_7c} :catch_7d

    goto :goto_3d

    .line 324
    :catch_7d
    move-exception v0

    .line 326
    .local v0, "ex":Lkorex/mail/MessagingException;
    iget-object v7, p0, Lcom/sun/mail/imap/IdleManager;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v8, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "IdleManager got exception for folder: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9, v0}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3d

    .line 331
    .end local v0    # "ex":Lkorex/mail/MessagingException;
    .end local v3    # "sc":Ljava/nio/channels/SelectableChannel;
    .end local v5    # "sk":Ljava/nio/channels/SelectionKey;
    :cond_99
    return v2
.end method

.method private select()V
    .registers 7

    .prologue
    .line 199
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/sun/mail/imap/IdleManager;->die:Z

    .line 201
    :cond_3
    :try_start_3
    iget-boolean v2, p0, Lcom/sun/mail/imap/IdleManager;->die:Z

    if-nez v2, :cond_3c

    .line 202
    invoke-direct {p0}, Lcom/sun/mail/imap/IdleManager;->watchAll()V

    .line 203
    iget-object v2, p0, Lcom/sun/mail/imap/IdleManager;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v3, "IdleManager waiting..."

    invoke-virtual {v2, v3}, Lcom/sun/mail/util/MailLogger;->finest(Ljava/lang/String;)V

    .line 204
    iget-object v2, p0, Lcom/sun/mail/imap/IdleManager;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v2}, Ljava/nio/channels/Selector;->select()I

    move-result v1

    .line 205
    .local v1, "ns":I
    iget-object v2, p0, Lcom/sun/mail/imap/IdleManager;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v3, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 206
    iget-object v2, p0, Lcom/sun/mail/imap/IdleManager;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v3, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    const-string v4, "IdleManager selected {0} channels"

    .line 207
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 206
    invoke-virtual {v2, v3, v4, v5}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 208
    :cond_2e
    iget-boolean v2, p0, Lcom/sun/mail/imap/IdleManager;->die:Z

    if-nez v2, :cond_3c

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->isInterrupted()Z
    :try_end_39
    .catch Ljava/io/InterruptedIOException; {:try_start_3 .. :try_end_39} :catch_5b
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_39} :catch_75
    .catchall {:try_start_3 .. :try_end_39} :catchall_8f

    move-result v2

    if-eqz v2, :cond_4c

    .line 234
    .end local v1    # "ns":I
    :cond_3c
    :try_start_3c
    invoke-direct {p0}, Lcom/sun/mail/imap/IdleManager;->unwatchAll()V

    .line 235
    iget-object v2, p0, Lcom/sun/mail/imap/IdleManager;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v2}, Ljava/nio/channels/Selector;->close()V
    :try_end_44
    .catch Ljava/io/IOException; {:try_start_3c .. :try_end_44} :catch_a6

    .line 239
    :goto_44
    iget-object v2, p0, Lcom/sun/mail/imap/IdleManager;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v3, "IdleManager exiting"

    invoke-virtual {v2, v3}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 241
    :goto_4b
    return-void

    .line 225
    .restart local v1    # "ns":I
    :cond_4c
    :goto_4c
    :try_start_4c
    invoke-direct {p0}, Lcom/sun/mail/imap/IdleManager;->processKeys()Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/sun/mail/imap/IdleManager;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v2}, Ljava/nio/channels/Selector;->selectNow()I
    :try_end_57
    .catch Ljava/io/InterruptedIOException; {:try_start_4c .. :try_end_57} :catch_5b
    .catch Ljava/io/IOException; {:try_start_4c .. :try_end_57} :catch_75
    .catchall {:try_start_4c .. :try_end_57} :catchall_8f

    move-result v2

    if-lez v2, :cond_3

    goto :goto_4c

    .line 228
    .end local v1    # "ns":I
    :catch_5b
    move-exception v0

    .line 229
    .local v0, "ex":Ljava/io/InterruptedIOException;
    :try_start_5c
    iget-object v2, p0, Lcom/sun/mail/imap/IdleManager;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v4, "IdleManager interrupted"

    invoke-virtual {v2, v3, v4, v0}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_65
    .catchall {:try_start_5c .. :try_end_65} :catchall_8f

    .line 234
    :try_start_65
    invoke-direct {p0}, Lcom/sun/mail/imap/IdleManager;->unwatchAll()V

    .line 235
    iget-object v2, p0, Lcom/sun/mail/imap/IdleManager;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v2}, Ljava/nio/channels/Selector;->close()V
    :try_end_6d
    .catch Ljava/io/IOException; {:try_start_65 .. :try_end_6d} :catch_a4

    .line 239
    :goto_6d
    iget-object v2, p0, Lcom/sun/mail/imap/IdleManager;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v3, "IdleManager exiting"

    invoke-virtual {v2, v3}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    goto :goto_4b

    .line 230
    .end local v0    # "ex":Ljava/io/InterruptedIOException;
    :catch_75
    move-exception v0

    .line 231
    .local v0, "ex":Ljava/io/IOException;
    :try_start_76
    iget-object v2, p0, Lcom/sun/mail/imap/IdleManager;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v4, "IdleManager got exception"

    invoke-virtual {v2, v3, v4, v0}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7f
    .catchall {:try_start_76 .. :try_end_7f} :catchall_8f

    .line 234
    :try_start_7f
    invoke-direct {p0}, Lcom/sun/mail/imap/IdleManager;->unwatchAll()V

    .line 235
    iget-object v2, p0, Lcom/sun/mail/imap/IdleManager;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v2}, Ljava/nio/channels/Selector;->close()V
    :try_end_87
    .catch Ljava/io/IOException; {:try_start_7f .. :try_end_87} :catch_a2

    .line 239
    :goto_87
    iget-object v2, p0, Lcom/sun/mail/imap/IdleManager;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v3, "IdleManager exiting"

    invoke-virtual {v2, v3}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    goto :goto_4b

    .line 233
    .end local v0    # "ex":Ljava/io/IOException;
    :catchall_8f
    move-exception v2

    .line 234
    :try_start_90
    invoke-direct {p0}, Lcom/sun/mail/imap/IdleManager;->unwatchAll()V

    .line 235
    iget-object v3, p0, Lcom/sun/mail/imap/IdleManager;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v3}, Ljava/nio/channels/Selector;->close()V
    :try_end_98
    .catch Ljava/io/IOException; {:try_start_90 .. :try_end_98} :catch_a0

    .line 239
    :goto_98
    iget-object v3, p0, Lcom/sun/mail/imap/IdleManager;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v4, "IdleManager exiting"

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    throw v2

    .line 236
    :catch_a0
    move-exception v3

    goto :goto_98

    .restart local v0    # "ex":Ljava/io/IOException;
    :catch_a2
    move-exception v2

    goto :goto_87

    .local v0, "ex":Ljava/io/InterruptedIOException;
    :catch_a4
    move-exception v2

    goto :goto_6d

    .end local v0    # "ex":Ljava/io/InterruptedIOException;
    :catch_a6
    move-exception v2

    goto :goto_44
.end method

.method private unwatchAll()V
    .registers 9

    .prologue
    .line 339
    iget-object v4, p0, Lcom/sun/mail/imap/IdleManager;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v4}, Ljava/nio/channels/Selector;->keys()Ljava/util/Set;

    move-result-object v1

    .line 340
    .local v1, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/nio/channels/SelectionKey;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_a
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_33

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/nio/channels/SelectionKey;

    .line 342
    .local v3, "sk":Ljava/nio/channels/SelectionKey;
    invoke-virtual {v3}, Ljava/nio/channels/SelectionKey;->cancel()V

    .line 343
    invoke-virtual {v3}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sun/mail/imap/IMAPFolder;

    .line 344
    .local v0, "folder":Lcom/sun/mail/imap/IMAPFolder;
    iget-object v5, p0, Lcom/sun/mail/imap/IdleManager;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v6, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v7, "IdleManager no longer watching folder: {0}"

    invoke-virtual {v5, v6, v7, v0}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 346
    invoke-virtual {v3}, Ljava/nio/channels/SelectionKey;->channel()Ljava/nio/channels/SelectableChannel;

    move-result-object v2

    .line 349
    .local v2, "sc":Ljava/nio/channels/SelectableChannel;
    const/4 v5, 0x1

    :try_start_2d
    invoke-virtual {v2, v5}, Ljava/nio/channels/SelectableChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;
    :try_end_30
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_30} :catch_31

    goto :goto_a

    .line 350
    :catch_31
    move-exception v5

    goto :goto_a

    .line 354
    .end local v0    # "folder":Lcom/sun/mail/imap/IMAPFolder;
    .end local v2    # "sc":Ljava/nio/channels/SelectableChannel;
    .end local v3    # "sk":Ljava/nio/channels/SelectionKey;
    :cond_33
    return-void
.end method

.method private watchAll()V
    .registers 7

    .prologue
    .line 253
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/sun/mail/imap/IdleManager;->toWatch:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sun/mail/imap/IMAPFolder;

    .local v1, "folder":Lcom/sun/mail/imap/IMAPFolder;
    if-eqz v1, :cond_2f

    .line 254
    iget-object v3, p0, Lcom/sun/mail/imap/IdleManager;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    const-string v5, "IdleManager adding {0} to selector"

    invoke-virtual {v3, v4, v5, v1}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 256
    invoke-virtual {v1}, Lcom/sun/mail/imap/IMAPFolder;->getChannel()Ljava/nio/channels/SocketChannel;

    move-result-object v2

    .line 257
    .local v2, "sc":Ljava/nio/channels/SocketChannel;
    if-eqz v2, :cond_0

    .line 261
    const/4 v3, 0x0

    :try_start_1a
    invoke-virtual {v2, v3}, Ljava/nio/channels/SocketChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 262
    iget-object v3, p0, Lcom/sun/mail/imap/IdleManager;->selector:Ljava/nio/channels/Selector;

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4, v1}, Ljava/nio/channels/SocketChannel;->register(Ljava/nio/channels/Selector;ILjava/lang/Object;)Ljava/nio/channels/SelectionKey;
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_23} :catch_24

    goto :goto_0

    .line 263
    :catch_24
    move-exception v0

    .line 265
    .local v0, "ex":Ljava/io/IOException;
    iget-object v3, p0, Lcom/sun/mail/imap/IdleManager;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    const-string v5, "IdleManager can\'t register folder"

    invoke-virtual {v3, v4, v5, v0}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 269
    .end local v0    # "ex":Ljava/io/IOException;
    .end local v2    # "sc":Ljava/nio/channels/SocketChannel;
    :cond_2f
    return-void
.end method


# virtual methods
.method declared-synchronized requestAbort(Lcom/sun/mail/imap/IMAPFolder;)V
    .registers 3
    .param p1, "folder"    # Lcom/sun/mail/imap/IMAPFolder;

    .prologue
    .line 190
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/imap/IdleManager;->toAbort:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 191
    iget-object v0, p0, Lcom/sun/mail/imap/IdleManager;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 192
    monitor-exit p0

    return-void

    .line 190
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stop()V
    .registers 3

    .prologue
    .line 360
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lcom/sun/mail/imap/IdleManager;->die:Z

    .line 361
    iget-object v0, p0, Lcom/sun/mail/imap/IdleManager;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v1, "IdleManager stopping"

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->finest(Ljava/lang/String;)V

    .line 362
    iget-object v0, p0, Lcom/sun/mail/imap/IdleManager;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;
    :try_end_10
    .catchall {:try_start_2 .. :try_end_10} :catchall_12

    .line 363
    monitor-exit p0

    return-void

    .line 360
    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized watch(Lkorex/mail/Folder;)V
    .registers 8
    .param p1, "folder"    # Lkorex/mail/Folder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 169
    monitor-enter p0

    :try_start_1
    instance-of v3, p1, Lcom/sun/mail/imap/IMAPFolder;

    if-nez v3, :cond_10

    .line 170
    new-instance v3, Lkorex/mail/MessagingException;

    const-string v4, "Can only watch IMAP folders"

    invoke-direct {v3, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    .line 169
    :catchall_d
    move-exception v3

    monitor-exit p0

    throw v3

    .line 171
    :cond_10
    :try_start_10
    move-object v0, p1

    check-cast v0, Lcom/sun/mail/imap/IMAPFolder;

    move-object v1, v0

    .line 172
    .local v1, "ifolder":Lcom/sun/mail/imap/IMAPFolder;
    invoke-virtual {v1}, Lcom/sun/mail/imap/IMAPFolder;->getChannel()Ljava/nio/channels/SocketChannel;

    move-result-object v2

    .line 173
    .local v2, "sc":Ljava/nio/channels/SocketChannel;
    if-nez v2, :cond_22

    .line 174
    new-instance v3, Lkorex/mail/MessagingException;

    const-string v4, "Folder is not using SocketChannels"

    invoke-direct {v3, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 175
    :cond_22
    iget-object v3, p0, Lcom/sun/mail/imap/IdleManager;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    const-string v5, "IdleManager watching {0}"

    invoke-virtual {v3, v4, v5, v1}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 176
    invoke-virtual {v1, p0}, Lcom/sun/mail/imap/IMAPFolder;->startIdle(Lcom/sun/mail/imap/IdleManager;)V

    .line 177
    iget-object v3, p0, Lcom/sun/mail/imap/IdleManager;->toWatch:Ljava/util/Queue;

    invoke-interface {v3, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 178
    iget-object v3, p0, Lcom/sun/mail/imap/IdleManager;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v3}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;
    :try_end_38
    .catchall {:try_start_10 .. :try_end_38} :catchall_d

    .line 179
    monitor-exit p0

    return-void
.end method
