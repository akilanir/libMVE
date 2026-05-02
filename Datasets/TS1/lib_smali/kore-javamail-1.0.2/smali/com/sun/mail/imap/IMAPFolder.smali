.class public Lcom/sun/mail/imap/IMAPFolder;
.super Lkorex/mail/Folder;
.source "IMAPFolder.java"

# interfaces
.implements Lkorex/mail/UIDFolder;
.implements Lcom/sun/mail/iap/ResponseHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;,
        Lcom/sun/mail/imap/IMAPFolder$FetchProfileItem;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final ABORTING:I = 0x2

.field private static final IDLE:I = 0x1

.field private static final RUNNING:I = 0x0

.field protected static final UNKNOWN_SEPARATOR:C = '\uffff'


# instance fields
.field protected volatile attributes:[Ljava/lang/String;

.field protected availableFlags:Lkorex/mail/Flags;

.field private cachedStatus:Lcom/sun/mail/imap/protocol/Status;

.field private cachedStatusTime:J

.field private connectionPoolLogger:Lcom/sun/mail/util/MailLogger;

.field private doExpungeNotification:Z

.field protected volatile exists:Z

.field protected fullName:Ljava/lang/String;

.field private hasMessageCountListener:Z

.field private volatile highestmodseq:J

.field private volatile idleManager:Lcom/sun/mail/imap/IdleManager;

.field private idleState:I

.field protected isNamespace:Z

.field protected logger:Lcom/sun/mail/util/MailLogger;

.field protected messageCache:Lcom/sun/mail/imap/MessageCache;

.field protected final messageCacheLock:Ljava/lang/Object;

.field protected name:Ljava/lang/String;

.field private volatile opened:Z

.field protected permanentFlags:Lkorex/mail/Flags;

.field protected volatile protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

.field private realTotal:I

.field private reallyClosed:Z

.field private volatile recent:I

.field protected separator:C

.field private volatile total:I

.field protected type:I

.field protected uidTable:Ljava/util/Hashtable;

.field private uidnext:J

.field private uidvalidity:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 178
    const-class v0, Lcom/sun/mail/imap/IMAPFolder;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/sun/mail/imap/IMAPFolder;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected constructor <init>(Lcom/sun/mail/imap/protocol/ListInfo;Lcom/sun/mail/imap/IMAPStore;)V
    .registers 6
    .param p1, "li"    # Lcom/sun/mail/imap/protocol/ListInfo;
    .param p2, "store"    # Lcom/sun/mail/imap/IMAPStore;

    .prologue
    .line 410
    iget-object v0, p1, Lcom/sun/mail/imap/protocol/ListInfo;->name:Ljava/lang/String;

    iget-char v1, p1, Lcom/sun/mail/imap/protocol/ListInfo;->separator:C

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, p2, v2}, Lcom/sun/mail/imap/IMAPFolder;-><init>(Ljava/lang/String;CLcom/sun/mail/imap/IMAPStore;Ljava/lang/Boolean;)V

    .line 412
    iget-boolean v0, p1, Lcom/sun/mail/imap/protocol/ListInfo;->hasInferiors:Z

    if-eqz v0, :cond_12

    .line 413
    iget v0, p0, Lcom/sun/mail/imap/IMAPFolder;->type:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/sun/mail/imap/IMAPFolder;->type:I

    .line 414
    :cond_12
    iget-boolean v0, p1, Lcom/sun/mail/imap/protocol/ListInfo;->canOpen:Z

    if-eqz v0, :cond_1c

    .line 415
    iget v0, p0, Lcom/sun/mail/imap/IMAPFolder;->type:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/sun/mail/imap/IMAPFolder;->type:I

    .line 416
    :cond_1c
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/sun/mail/imap/IMAPFolder;->exists:Z

    .line 417
    iget-object v0, p1, Lcom/sun/mail/imap/protocol/ListInfo;->attrs:[Ljava/lang/String;

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->attributes:[Ljava/lang/String;

    .line 418
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;CLcom/sun/mail/imap/IMAPStore;Ljava/lang/Boolean;)V
    .registers 12
    .param p1, "fullName"    # Ljava/lang/String;
    .param p2, "separator"    # C
    .param p3, "store"    # Lcom/sun/mail/imap/IMAPStore;
    .param p4, "isNamespace"    # Ljava/lang/Boolean;

    .prologue
    const-wide/16 v3, -0x1

    const/4 v6, 0x1

    const/4 v2, -0x1

    const/4 v5, 0x0

    .line 369
    invoke-direct {p0, p3}, Lkorex/mail/Folder;-><init>(Lkorex/mail/Store;)V

    .line 187
    iput-boolean v5, p0, Lcom/sun/mail/imap/IMAPFolder;->isNamespace:Z

    .line 193
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    .line 205
    iput-boolean v5, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    .line 217
    iput-boolean v6, p0, Lcom/sun/mail/imap/IMAPFolder;->reallyClosed:Z

    .line 269
    iput v5, p0, Lcom/sun/mail/imap/IMAPFolder;->idleState:I

    .line 272
    iput v2, p0, Lcom/sun/mail/imap/IMAPFolder;->total:I

    .line 274
    iput v2, p0, Lcom/sun/mail/imap/IMAPFolder;->recent:I

    .line 275
    iput v2, p0, Lcom/sun/mail/imap/IMAPFolder;->realTotal:I

    .line 277
    iput-wide v3, p0, Lcom/sun/mail/imap/IMAPFolder;->uidvalidity:J

    .line 278
    iput-wide v3, p0, Lcom/sun/mail/imap/IMAPFolder;->uidnext:J

    .line 279
    iput-wide v3, p0, Lcom/sun/mail/imap/IMAPFolder;->highestmodseq:J

    .line 280
    iput-boolean v6, p0, Lcom/sun/mail/imap/IMAPFolder;->doExpungeNotification:Z

    .line 282
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->cachedStatus:Lcom/sun/mail/imap/protocol/Status;

    .line 283
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/sun/mail/imap/IMAPFolder;->cachedStatusTime:J

    .line 285
    iput-boolean v5, p0, Lcom/sun/mail/imap/IMAPFolder;->hasMessageCountListener:Z

    .line 370
    if-nez p1, :cond_38

    .line 371
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "Folder name is null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 372
    :cond_38
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    .line 373
    iput-char p2, p0, Lcom/sun/mail/imap/IMAPFolder;->separator:C

    .line 374
    new-instance v1, Lcom/sun/mail/util/MailLogger;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "DEBUG IMAP"

    .line 375
    invoke-virtual {p3}, Lcom/sun/mail/imap/IMAPStore;->getSession()Lkorex/mail/Session;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/sun/mail/util/MailLogger;-><init>(Ljava/lang/Class;Ljava/lang/String;Lkorex/mail/Session;)V

    iput-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->logger:Lcom/sun/mail/util/MailLogger;

    .line 376
    invoke-virtual {p3}, Lcom/sun/mail/imap/IMAPStore;->getConnectionPoolLogger()Lcom/sun/mail/util/MailLogger;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->connectionPoolLogger:Lcom/sun/mail/util/MailLogger;

    .line 389
    iput-boolean v5, p0, Lcom/sun/mail/imap/IMAPFolder;->isNamespace:Z

    .line 390
    const v1, 0xffff

    if-eq p2, v1, :cond_78

    if-eqz p2, :cond_78

    .line 391
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v1, p2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 392
    .local v0, "i":I
    if-lez v0, :cond_78

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_78

    .line 393
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v1, v5, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    .line 394
    iput-boolean v6, p0, Lcom/sun/mail/imap/IMAPFolder;->isNamespace:Z

    .line 399
    .end local v0    # "i":I
    :cond_78
    if-eqz p4, :cond_80

    .line 400
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, p0, Lcom/sun/mail/imap/IMAPFolder;->isNamespace:Z

    .line 401
    :cond_80
    return-void
.end method

.method static synthetic access$000(Lcom/sun/mail/imap/IMAPFolder;)I
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPFolder;

    .prologue
    .line 178
    iget v0, p0, Lcom/sun/mail/imap/IMAPFolder;->idleState:I

    return v0
.end method

.method static synthetic access$002(Lcom/sun/mail/imap/IMAPFolder;I)I
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPFolder;
    .param p1, "x1"    # I

    .prologue
    .line 178
    iput p1, p0, Lcom/sun/mail/imap/IMAPFolder;->idleState:I

    return p1
.end method

.method private checkFlags(Lkorex/mail/Flags;)V
    .registers 5
    .param p1, "flags"    # Lkorex/mail/Flags;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 499
    sget-boolean v0, Lcom/sun/mail/imap/IMAPFolder;->$assertionsDisabled:Z

    if-nez v0, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 500
    :cond_10
    iget v0, p0, Lcom/sun/mail/imap/IMAPFolder;->mode:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_30

    .line 501
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot change flags on READ_ONLY folder: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 510
    :cond_30
    return-void
.end method

.method private cleanup(Z)V
    .registers 5
    .param p1, "returnToPool"    # Z

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 1498
    sget-boolean v0, Lcom/sun/mail/imap/IMAPFolder;->$assertionsDisabled:Z

    if-nez v0, :cond_14

    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 1499
    :cond_14
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/IMAPFolder;->releaseProtocol(Z)V

    .line 1500
    iput-object v2, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCache:Lcom/sun/mail/imap/MessageCache;

    .line 1501
    iput-object v2, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    .line 1502
    iput-boolean v1, p0, Lcom/sun/mail/imap/IMAPFolder;->exists:Z

    .line 1503
    iput-object v2, p0, Lcom/sun/mail/imap/IMAPFolder;->attributes:[Ljava/lang/String;

    .line 1504
    iput-boolean v1, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    .line 1505
    iput v1, p0, Lcom/sun/mail/imap/IMAPFolder;->idleState:I

    .line 1506
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/IMAPFolder;->notifyConnectionListeners(I)V

    .line 1507
    return-void
.end method

.method private close(ZZ)V
    .registers 13
    .param p1, "expunge"    # Z
    .param p2, "force"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1401
    sget-boolean v5, Lcom/sun/mail/imap/IMAPFolder;->$assertionsDisabled:Z

    if-nez v5, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_10

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 1402
    :cond_10
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v6

    .line 1409
    :try_start_13
    iget-boolean v5, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    if-nez v5, :cond_26

    iget-boolean v5, p0, Lcom/sun/mail/imap/IMAPFolder;->reallyClosed:Z

    if-eqz v5, :cond_26

    .line 1410
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v7, "This operation is not allowed on a closed folder"

    invoke-direct {v5, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1489
    :catchall_23
    move-exception v5

    monitor-exit v6
    :try_end_25
    .catchall {:try_start_13 .. :try_end_25} :catchall_23

    throw v5

    .line 1414
    :cond_26
    const/4 v5, 0x1

    :try_start_27
    iput-boolean v5, p0, Lcom/sun/mail/imap/IMAPFolder;->reallyClosed:Z

    .line 1420
    iget-boolean v5, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    if-nez v5, :cond_2f

    .line 1421
    monitor-exit v6
    :try_end_2e
    .catchall {:try_start_27 .. :try_end_2e} :catchall_23

    .line 1490
    :goto_2e
    return-void

    .line 1423
    :cond_2f
    const/4 v3, 0x1

    .line 1425
    .local v3, "reuseProtocol":Z
    :try_start_30
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->waitIfIdle()V

    .line 1426
    if-eqz p2, :cond_52

    .line 1427
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v7, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v8, "forcing folder {0} to close"

    iget-object v9, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v5, v7, v8, v9}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1429
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    if-eqz v5, :cond_49

    .line 1430
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->disconnect()V
    :try_end_49
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_30 .. :try_end_49} :catch_78
    .catchall {:try_start_30 .. :try_end_49} :catchall_83

    .line 1486
    :cond_49
    :goto_49
    :try_start_49
    iget-boolean v5, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    if-eqz v5, :cond_50

    .line 1487
    invoke-direct {p0, v3}, Lcom/sun/mail/imap/IMAPFolder;->cleanup(Z)V

    .line 1489
    :cond_50
    monitor-exit v6
    :try_end_51
    .catchall {:try_start_49 .. :try_end_51} :catchall_23

    goto :goto_2e

    .line 1431
    :cond_52
    :try_start_52
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v5, Lcom/sun/mail/imap/IMAPStore;

    invoke-virtual {v5}, Lcom/sun/mail/imap/IMAPStore;->isConnectionPoolFull()Z

    move-result v5

    if-eqz v5, :cond_8c

    .line 1433
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v7, "pool is full, not adding an Authenticated connection"

    invoke-virtual {v5, v7}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1437
    if-eqz p1, :cond_6e

    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    if-eqz v5, :cond_6e

    .line 1438
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->close()V

    .line 1440
    :cond_6e
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    if-eqz v5, :cond_49

    .line 1441
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logout()V
    :try_end_77
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_52 .. :try_end_77} :catch_78
    .catchall {:try_start_52 .. :try_end_77} :catchall_83

    goto :goto_49

    .line 1482
    :catch_78
    move-exception v1

    .line 1483
    .local v1, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_79
    new-instance v5, Lkorex/mail/MessagingException;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v5
    :try_end_83
    .catchall {:try_start_79 .. :try_end_83} :catchall_83

    .line 1486
    .end local v1    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :catchall_83
    move-exception v5

    :try_start_84
    iget-boolean v7, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    if-eqz v7, :cond_8b

    .line 1487
    invoke-direct {p0, v3}, Lcom/sun/mail/imap/IMAPFolder;->cleanup(Z)V

    :cond_8b
    throw v5
    :try_end_8c
    .catchall {:try_start_84 .. :try_end_8c} :catchall_23

    .line 1446
    :cond_8c
    if-nez p1, :cond_c5

    :try_start_8e
    iget v5, p0, Lcom/sun/mail/imap/IMAPFolder;->mode:I
    :try_end_90
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_8e .. :try_end_90} :catch_78
    .catchall {:try_start_8e .. :try_end_90} :catchall_83

    const/4 v7, 0x2

    if-ne v5, v7, :cond_c5

    .line 1448
    :try_start_93
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    if-eqz v5, :cond_aa

    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    const-string v7, "UNSELECT"

    .line 1449
    invoke-virtual {v5, v7}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_aa

    .line 1450
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->unselect()V

    goto :goto_49

    .line 1474
    :catch_a7
    move-exception v2

    .line 1475
    .local v2, "pex2":Lcom/sun/mail/iap/ProtocolException;
    const/4 v3, 0x0

    .line 1476
    goto :goto_49

    .line 1460
    .end local v2    # "pex2":Lcom/sun/mail/iap/ProtocolException;
    :cond_aa
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :try_end_ac
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_93 .. :try_end_ac} :catch_a7
    .catchall {:try_start_93 .. :try_end_ac} :catchall_83

    if-eqz v5, :cond_49

    .line 1461
    const/4 v4, 0x1

    .line 1463
    .local v4, "selected":Z
    :try_start_af
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    iget-object v7, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v5, v7}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->examine(Ljava/lang/String;)Lcom/sun/mail/imap/protocol/MailboxInfo;
    :try_end_b6
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_af .. :try_end_b6} :catch_c2
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_af .. :try_end_b6} :catch_a7
    .catchall {:try_start_af .. :try_end_b6} :catchall_83

    .line 1470
    :goto_b6
    if-eqz v4, :cond_49

    :try_start_b8
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    if-eqz v5, :cond_49

    .line 1471
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->close()V
    :try_end_c1
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_b8 .. :try_end_c1} :catch_a7
    .catchall {:try_start_b8 .. :try_end_c1} :catchall_83

    goto :goto_49

    .line 1465
    :catch_c2
    move-exception v0

    .line 1468
    .local v0, "ex":Lcom/sun/mail/iap/CommandFailedException;
    const/4 v4, 0x0

    goto :goto_b6

    .line 1478
    .end local v0    # "ex":Lcom/sun/mail/iap/CommandFailedException;
    .end local v4    # "selected":Z
    :cond_c5
    :try_start_c5
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    if-eqz v5, :cond_49

    .line 1479
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->close()V
    :try_end_ce
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_c5 .. :try_end_ce} :catch_78
    .catchall {:try_start_c5 .. :try_end_ce} :catchall_83

    goto/16 :goto_49
.end method

.method private createHeaderCommand([Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "hdrs"    # [Ljava/lang/String;

    .prologue
    .line 1309
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isREV1()Z

    move-result v2

    if-eqz v2, :cond_22

    .line 1310
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "BODY.PEEK[HEADER.FIELDS ("

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 1314
    .local v1, "sb":Ljava/lang/StringBuffer;
    :goto_f
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    array-length v2, p1

    if-ge v0, v2, :cond_2a

    .line 1315
    if-lez v0, :cond_1a

    .line 1316
    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1317
    :cond_1a
    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1314
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 1312
    .end local v0    # "i":I
    .end local v1    # "sb":Ljava/lang/StringBuffer;
    :cond_22
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "RFC822.HEADER.LINES ("

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .restart local v1    # "sb":Ljava/lang/StringBuffer;
    goto :goto_f

    .line 1320
    .restart local v0    # "i":I
    :cond_2a
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isREV1()Z

    move-result v2

    if-eqz v2, :cond_3c

    .line 1321
    const-string v2, ")]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1325
    :goto_37
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1323
    :cond_3c
    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_37
.end method

.method private createMessagesForUIDs([J)[Lkorex/mail/Message;
    .registers 9
    .param p1, "uids"    # [J

    .prologue
    .line 2564
    array-length v4, p1

    new-array v3, v4, [Lcom/sun/mail/imap/IMAPMessage;

    .line 2565
    .local v3, "msgs":[Lcom/sun/mail/imap/IMAPMessage;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v4, p1

    if-ge v0, v4, :cond_31

    .line 2566
    const/4 v2, 0x0

    .line 2567
    .local v2, "m":Lcom/sun/mail/imap/IMAPMessage;
    iget-object v4, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    if-eqz v4, :cond_1a

    .line 2568
    iget-object v4, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    aget-wide v5, p1, v0

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "m":Lcom/sun/mail/imap/IMAPMessage;
    check-cast v2, Lcom/sun/mail/imap/IMAPMessage;

    .line 2569
    .restart local v2    # "m":Lcom/sun/mail/imap/IMAPMessage;
    :cond_1a
    if-nez v2, :cond_2a

    .line 2571
    const/4 v4, -0x1

    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/IMAPFolder;->newIMAPMessage(I)Lcom/sun/mail/imap/IMAPMessage;

    move-result-object v2

    .line 2572
    aget-wide v4, p1, v0

    invoke-virtual {v2, v4, v5}, Lcom/sun/mail/imap/IMAPMessage;->setUID(J)V

    .line 2573
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lcom/sun/mail/imap/IMAPMessage;->setExpunged(Z)V

    .line 2575
    :cond_2a
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    aput-object v2, v3, v0

    .line 2565
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_4

    .line 2577
    .end local v2    # "m":Lcom/sun/mail/imap/IMAPMessage;
    :cond_31
    return-object v3
.end method

.method private declared-synchronized doList(Ljava/lang/String;Z)[Lkorex/mail/Folder;
    .registers 13
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "subscribed"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 628
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkExists()V

    .line 631
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPFolder;->attributes:[Ljava/lang/String;

    if-eqz v7, :cond_13

    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPFolder;->isDirectory()Z

    move-result v7

    if-nez v7, :cond_13

    .line 632
    const/4 v7, 0x0

    new-array v2, v7, [Lkorex/mail/Folder;
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_68

    .line 670
    :cond_11
    :goto_11
    monitor-exit p0

    return-object v2

    .line 634
    :cond_13
    :try_start_13
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getSeparator()C

    move-result v1

    .line 636
    .local v1, "c":C
    new-instance v7, Lcom/sun/mail/imap/IMAPFolder$2;

    invoke-direct {v7, p0, p2, v1, p1}, Lcom/sun/mail/imap/IMAPFolder$2;-><init>(Lcom/sun/mail/imap/IMAPFolder;ZCLjava/lang/String;)V

    invoke-virtual {p0, v7}, Lcom/sun/mail/imap/IMAPFolder;->doCommandIgnoreFailure(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Lcom/sun/mail/imap/protocol/ListInfo;

    move-object v0, v7

    check-cast v0, [Lcom/sun/mail/imap/protocol/ListInfo;

    move-object v4, v0

    .line 647
    .local v4, "li":[Lcom/sun/mail/imap/protocol/ListInfo;
    if-nez v4, :cond_2c

    .line 648
    const/4 v7, 0x0

    new-array v2, v7, [Lkorex/mail/Folder;

    goto :goto_11

    .line 661
    :cond_2c
    const/4 v6, 0x0

    .line 663
    .local v6, "start":I
    array-length v7, v4

    if-lez v7, :cond_4f

    const/4 v7, 0x0

    aget-object v7, v4, v7

    iget-object v7, v7, Lcom/sun/mail/imap/protocol/ListInfo;->name:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4f

    .line 664
    const/4 v6, 0x1

    .line 666
    :cond_4f
    array-length v7, v4

    sub-int/2addr v7, v6

    new-array v2, v7, [Lcom/sun/mail/imap/IMAPFolder;

    .line 667
    .local v2, "folders":[Lcom/sun/mail/imap/IMAPFolder;
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v5, Lcom/sun/mail/imap/IMAPStore;

    .line 668
    .local v5, "st":Lcom/sun/mail/imap/IMAPStore;
    move v3, v6

    .local v3, "i":I
    :goto_58
    array-length v7, v4

    if-ge v3, v7, :cond_11

    .line 669
    sub-int v7, v3, v6

    aget-object v8, v4, v3

    invoke-virtual {v5, v8}, Lcom/sun/mail/imap/IMAPStore;->newIMAPFolder(Lcom/sun/mail/imap/protocol/ListInfo;)Lcom/sun/mail/imap/IMAPFolder;

    move-result-object v8

    aput-object v8, v2, v7
    :try_end_65
    .catchall {:try_start_13 .. :try_end_65} :catchall_68

    .line 668
    add-int/lit8 v3, v3, 0x1

    goto :goto_58

    .line 628
    .end local v1    # "c":C
    .end local v2    # "folders":[Lcom/sun/mail/imap/IMAPFolder;
    .end local v3    # "i":I
    .end local v4    # "li":[Lcom/sun/mail/imap/protocol/ListInfo;
    .end local v5    # "st":Lcom/sun/mail/imap/IMAPStore;
    .end local v6    # "start":I
    :catchall_68
    move-exception v7

    monitor-exit p0

    throw v7
.end method

.method private findName([Lcom/sun/mail/imap/protocol/ListInfo;Ljava/lang/String;)I
    .registers 5
    .param p1, "li"    # [Lcom/sun/mail/imap/protocol/ListInfo;
    .param p2, "lname"    # Ljava/lang/String;

    .prologue
    .line 599
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_e

    .line 600
    aget-object v1, p1, v0

    iget-object v1, v1, Lcom/sun/mail/imap/protocol/ListInfo;->name:Ljava/lang/String;

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 603
    :cond_e
    array-length v1, p1

    if-lt v0, v1, :cond_12

    .line 607
    const/4 v0, 0x0

    .line 609
    :cond_12
    return v0

    .line 599
    :cond_13
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private getStatus()Lcom/sun/mail/imap/protocol/Status;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1706
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v3, Lcom/sun/mail/imap/IMAPStore;

    invoke-virtual {v3}, Lcom/sun/mail/imap/IMAPStore;->getStatusCacheTimeout()I

    move-result v2

    .line 1709
    .local v2, "statusCacheTimeout":I
    if-lez v2, :cond_1d

    iget-object v3, p0, Lcom/sun/mail/imap/IMAPFolder;->cachedStatus:Lcom/sun/mail/imap/protocol/Status;

    if-eqz v3, :cond_1d

    .line 1710
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/sun/mail/imap/IMAPFolder;->cachedStatusTime:J

    sub-long/2addr v3, v5

    int-to-long v5, v2

    cmp-long v3, v3, v5

    if-gez v3, :cond_1d

    .line 1711
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->cachedStatus:Lcom/sun/mail/imap/protocol/Status;

    .line 1725
    :goto_1c
    return-object v1

    .line 1713
    :cond_1d
    const/4 v0, 0x0

    .line 1716
    .local v0, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :try_start_1e
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v0

    .line 1717
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->status(Ljava/lang/String;[Ljava/lang/String;)Lcom/sun/mail/imap/protocol/Status;

    move-result-object v1

    .line 1719
    .local v1, "s":Lcom/sun/mail/imap/protocol/Status;
    if-lez v2, :cond_33

    .line 1720
    iput-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->cachedStatus:Lcom/sun/mail/imap/protocol/Status;

    .line 1721
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/sun/mail/imap/IMAPFolder;->cachedStatusTime:J
    :try_end_33
    .catchall {:try_start_1e .. :try_end_33} :catchall_37

    .line 1725
    :cond_33
    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/IMAPFolder;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    goto :goto_1c

    .end local v1    # "s":Lcom/sun/mail/imap/protocol/Status;
    :catchall_37
    move-exception v3

    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/IMAPFolder;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    throw v3
.end method

.method private isDirectory()Z
    .registers 2

    .prologue
    .line 3646
    iget v0, p0, Lcom/sun/mail/imap/IMAPFolder;->type:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private processFetchResponse(Lcom/sun/mail/imap/protocol/FetchResponse;)Lkorex/mail/Message;
    .registers 11
    .param p1, "fr"    # Lcom/sun/mail/imap/protocol/FetchResponse;

    .prologue
    .line 3271
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->getNumber()I

    move-result v5

    invoke-virtual {p0, v5}, Lcom/sun/mail/imap/IMAPFolder;->getMessageBySeqNumber(I)Lcom/sun/mail/imap/IMAPMessage;

    move-result-object v2

    .line 3272
    .local v2, "msg":Lcom/sun/mail/imap/IMAPMessage;
    if-eqz v2, :cond_66

    .line 3273
    const/4 v3, 0x0

    .line 3275
    .local v3, "notify":Z
    const-class v5, Lcom/sun/mail/imap/protocol/UID;

    invoke-virtual {p1, v5}, Lcom/sun/mail/imap/protocol/FetchResponse;->getItem(Ljava/lang/Class;)Lcom/sun/mail/imap/protocol/Item;

    move-result-object v4

    check-cast v4, Lcom/sun/mail/imap/protocol/UID;

    .line 3276
    .local v4, "uid":Lcom/sun/mail/imap/protocol/UID;
    if-eqz v4, :cond_3b

    invoke-virtual {v2}, Lcom/sun/mail/imap/IMAPMessage;->getUID()J

    move-result-wide v5

    iget-wide v7, v4, Lcom/sun/mail/imap/protocol/UID;->uid:J

    cmp-long v5, v5, v7

    if-eqz v5, :cond_3b

    .line 3277
    iget-wide v5, v4, Lcom/sun/mail/imap/protocol/UID;->uid:J

    invoke-virtual {v2, v5, v6}, Lcom/sun/mail/imap/IMAPMessage;->setUID(J)V

    .line 3278
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    if-nez v5, :cond_2f

    .line 3279
    new-instance v5, Ljava/util/Hashtable;

    invoke-direct {v5}, Ljava/util/Hashtable;-><init>()V

    iput-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    .line 3280
    :cond_2f
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    iget-wide v6, v4, Lcom/sun/mail/imap/protocol/UID;->uid:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v5, v6, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3281
    const/4 v3, 0x1

    .line 3284
    :cond_3b
    const-class v5, Lcom/sun/mail/imap/protocol/MODSEQ;

    invoke-virtual {p1, v5}, Lcom/sun/mail/imap/protocol/FetchResponse;->getItem(Ljava/lang/Class;)Lcom/sun/mail/imap/protocol/Item;

    move-result-object v1

    check-cast v1, Lcom/sun/mail/imap/protocol/MODSEQ;

    .line 3285
    .local v1, "modseq":Lcom/sun/mail/imap/protocol/MODSEQ;
    if-eqz v1, :cond_55

    invoke-virtual {v2}, Lcom/sun/mail/imap/IMAPMessage;->_getModSeq()J

    move-result-wide v5

    iget-wide v7, v1, Lcom/sun/mail/imap/protocol/MODSEQ;->modseq:J

    cmp-long v5, v5, v7

    if-eqz v5, :cond_55

    .line 3286
    iget-wide v5, v1, Lcom/sun/mail/imap/protocol/MODSEQ;->modseq:J

    invoke-virtual {v2, v5, v6}, Lcom/sun/mail/imap/IMAPMessage;->setModSeq(J)V

    .line 3293
    const/4 v3, 0x1

    .line 3297
    :cond_55
    const-class v5, Lcom/sun/mail/imap/protocol/FLAGS;

    invoke-virtual {p1, v5}, Lcom/sun/mail/imap/protocol/FetchResponse;->getItem(Ljava/lang/Class;)Lcom/sun/mail/imap/protocol/Item;

    move-result-object v0

    check-cast v0, Lcom/sun/mail/imap/protocol/FLAGS;

    .line 3298
    .local v0, "flags":Lcom/sun/mail/imap/protocol/FLAGS;
    if-eqz v0, :cond_63

    .line 3299
    invoke-virtual {v2, v0}, Lcom/sun/mail/imap/IMAPMessage;->_setFlags(Lkorex/mail/Flags;)V

    .line 3300
    const/4 v3, 0x1

    .line 3303
    :cond_63
    if-nez v3, :cond_66

    .line 3304
    const/4 v2, 0x0

    .line 3306
    .end local v0    # "flags":Lcom/sun/mail/imap/protocol/FLAGS;
    .end local v1    # "modseq":Lcom/sun/mail/imap/protocol/MODSEQ;
    .end local v3    # "notify":Z
    .end local v4    # "uid":Lcom/sun/mail/imap/protocol/UID;
    :cond_66
    return-object v2
.end method

.method private setACL(Lcom/sun/mail/imap/ACL;C)V
    .registers 5
    .param p1, "acl"    # Lcom/sun/mail/imap/ACL;
    .param p2, "mod"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2828
    const-string v0, "ACL not supported"

    new-instance v1, Lcom/sun/mail/imap/IMAPFolder$18;

    invoke-direct {v1, p0, p2, p1}, Lcom/sun/mail/imap/IMAPFolder$18;-><init>(Lcom/sun/mail/imap/IMAPFolder;CLcom/sun/mail/imap/ACL;)V

    invoke-virtual {p0, v0, v1}, Lcom/sun/mail/imap/IMAPFolder;->doOptionalCommand(Ljava/lang/String;Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    .line 2836
    return-void
.end method


# virtual methods
.method public addACL(Lcom/sun/mail/imap/ACL;)V
    .registers 3
    .param p1, "acl"    # Lcom/sun/mail/imap/ACL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2733
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/sun/mail/imap/IMAPFolder;->setACL(Lcom/sun/mail/imap/ACL;C)V

    .line 2734
    return-void
.end method

.method public declared-synchronized addMessageCountListener(Lkorex/mail/event/MessageCountListener;)V
    .registers 3
    .param p1, "l"    # Lkorex/mail/event/MessageCountListener;

    .prologue
    .line 2294
    monitor-enter p0

    :try_start_1
    invoke-super {p0, p1}, Lkorex/mail/Folder;->addMessageCountListener(Lkorex/mail/event/MessageCountListener;)V

    .line 2295
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/sun/mail/imap/IMAPFolder;->hasMessageCountListener:Z
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_9

    .line 2296
    monitor-exit p0

    return-void

    .line 2294
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addMessages([Lkorex/mail/Message;)[Lkorex/mail/Message;
    .registers 10
    .param p1, "msgs"    # [Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1866
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkOpened()V

    .line 1867
    array-length v4, p1

    new-array v2, v4, [Lkorex/mail/internet/MimeMessage;

    .line 1868
    .local v2, "rmsgs":[Lkorex/mail/Message;
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/IMAPFolder;->appendUIDMessages([Lkorex/mail/Message;)[Lcom/sun/mail/imap/AppendUID;

    move-result-object v3

    .line 1869
    .local v3, "uids":[Lcom/sun/mail/imap/AppendUID;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    array-length v4, v3

    if-ge v1, v4, :cond_26

    .line 1870
    aget-object v0, v3, v1

    .line 1871
    .local v0, "auid":Lcom/sun/mail/imap/AppendUID;
    if-eqz v0, :cond_23

    .line 1872
    iget-wide v4, v0, Lcom/sun/mail/imap/AppendUID;->uidvalidity:J

    iget-wide v6, p0, Lcom/sun/mail/imap/IMAPFolder;->uidvalidity:J
    :try_end_17
    .catchall {:try_start_1 .. :try_end_17} :catchall_28

    cmp-long v4, v4, v6

    if-nez v4, :cond_23

    .line 1874
    :try_start_1b
    iget-wide v4, v0, Lcom/sun/mail/imap/AppendUID;->uid:J

    invoke-virtual {p0, v4, v5}, Lcom/sun/mail/imap/IMAPFolder;->getMessageByUID(J)Lkorex/mail/Message;

    move-result-object v4

    aput-object v4, v2, v1
    :try_end_23
    .catch Lkorex/mail/MessagingException; {:try_start_1b .. :try_end_23} :catch_2b
    .catchall {:try_start_1b .. :try_end_23} :catchall_28

    .line 1869
    :cond_23
    :goto_23
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 1881
    .end local v0    # "auid":Lcom/sun/mail/imap/AppendUID;
    :cond_26
    monitor-exit p0

    return-object v2

    .line 1866
    .end local v1    # "i":I
    .end local v2    # "rmsgs":[Lkorex/mail/Message;
    .end local v3    # "uids":[Lcom/sun/mail/imap/AppendUID;
    :catchall_28
    move-exception v4

    monitor-exit p0

    throw v4

    .line 1875
    .restart local v0    # "auid":Lcom/sun/mail/imap/AppendUID;
    .restart local v1    # "i":I
    .restart local v2    # "rmsgs":[Lkorex/mail/Message;
    .restart local v3    # "uids":[Lcom/sun/mail/imap/AppendUID;
    :catch_2b
    move-exception v4

    goto :goto_23
.end method

.method public addRights(Lcom/sun/mail/imap/ACL;)V
    .registers 3
    .param p1, "acl"    # Lcom/sun/mail/imap/ACL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2765
    const/16 v0, 0x2b

    invoke-direct {p0, p1, v0}, Lcom/sun/mail/imap/IMAPFolder;->setACL(Lcom/sun/mail/imap/ACL;C)V

    .line 2766
    return-void
.end method

.method public declared-synchronized appendMessages([Lkorex/mail/Message;)V
    .registers 13
    .param p1, "msgs"    # [Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1745
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkExists()V

    .line 1752
    iget-object v9, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v9, Lcom/sun/mail/imap/IMAPStore;

    invoke-virtual {v9}, Lcom/sun/mail/imap/IMAPStore;->getAppendBufferSize()I

    move-result v6

    .line 1754
    .local v6, "maxsize":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_d
    array-length v9, p1

    if-ge v4, v9, :cond_48

    .line 1755
    aget-object v5, p1, v4

    .line 1756
    .local v5, "m":Lkorex/mail/Message;
    invoke-virtual {v5}, Lkorex/mail/Message;->getReceivedDate()Ljava/util/Date;

    move-result-object v0

    .line 1757
    .local v0, "d":Ljava/util/Date;
    if-nez v0, :cond_1c

    .line 1758
    invoke-virtual {v5}, Lkorex/mail/Message;->getSentDate()Ljava/util/Date;

    move-result-object v0

    .line 1759
    :cond_1c
    move-object v1, v0

    .line 1760
    .local v1, "dd":Ljava/util/Date;
    invoke-virtual {v5}, Lkorex/mail/Message;->getFlags()Lkorex/mail/Flags;
    :try_end_20
    .catchall {:try_start_1 .. :try_end_20} :catchall_43

    move-result-object v3

    .line 1765
    .local v3, "f":Lkorex/mail/Flags;
    :try_start_21
    new-instance v7, Lcom/sun/mail/imap/MessageLiteral;

    .line 1766
    invoke-virtual {v5}, Lkorex/mail/Message;->getSize()I

    move-result v9

    if-le v9, v6, :cond_38

    const/4 v9, 0x0

    :goto_2a
    invoke-direct {v7, v5, v9}, Lcom/sun/mail/imap/MessageLiteral;-><init>(Lkorex/mail/Message;I)V
    :try_end_2d
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_2d} :catch_3a
    .catch Lkorex/mail/MessageRemovedException; {:try_start_21 .. :try_end_2d} :catch_46
    .catchall {:try_start_21 .. :try_end_2d} :catchall_43

    .line 1774
    .local v7, "mos":Lcom/sun/mail/imap/MessageLiteral;
    :try_start_2d
    new-instance v9, Lcom/sun/mail/imap/IMAPFolder$10;

    invoke-direct {v9, p0, v3, v1, v7}, Lcom/sun/mail/imap/IMAPFolder$10;-><init>(Lcom/sun/mail/imap/IMAPFolder;Lkorex/mail/Flags;Ljava/util/Date;Lcom/sun/mail/imap/MessageLiteral;)V

    invoke-virtual {p0, v9}, Lcom/sun/mail/imap/IMAPFolder;->doCommand(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    .line 1754
    .end local v7    # "mos":Lcom/sun/mail/imap/MessageLiteral;
    :goto_35
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    :cond_38
    move v9, v6

    .line 1766
    goto :goto_2a

    .line 1767
    :catch_3a
    move-exception v2

    .line 1768
    .local v2, "ex":Ljava/io/IOException;
    new-instance v9, Lkorex/mail/MessagingException;

    const-string v10, "IOException while appending messages"

    invoke-direct {v9, v10, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v9
    :try_end_43
    .catchall {:try_start_2d .. :try_end_43} :catchall_43

    .line 1745
    .end local v0    # "d":Ljava/util/Date;
    .end local v1    # "dd":Ljava/util/Date;
    .end local v2    # "ex":Ljava/io/IOException;
    .end local v3    # "f":Lkorex/mail/Flags;
    .end local v4    # "i":I
    .end local v5    # "m":Lkorex/mail/Message;
    .end local v6    # "maxsize":I
    :catchall_43
    move-exception v9

    monitor-exit p0

    throw v9

    .line 1770
    .restart local v0    # "d":Ljava/util/Date;
    .restart local v1    # "dd":Ljava/util/Date;
    .restart local v3    # "f":Lkorex/mail/Flags;
    .restart local v4    # "i":I
    .restart local v5    # "m":Lkorex/mail/Message;
    .restart local v6    # "maxsize":I
    :catch_46
    move-exception v8

    .line 1771
    .local v8, "mrex":Lkorex/mail/MessageRemovedException;
    goto :goto_35

    .line 1782
    .end local v0    # "d":Ljava/util/Date;
    .end local v1    # "dd":Ljava/util/Date;
    .end local v3    # "f":Lkorex/mail/Flags;
    .end local v5    # "m":Lkorex/mail/Message;
    .end local v8    # "mrex":Lkorex/mail/MessageRemovedException;
    :cond_48
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized appendUIDMessages([Lkorex/mail/Message;)[Lcom/sun/mail/imap/AppendUID;
    .registers 15
    .param p1, "msgs"    # [Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1804
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkExists()V

    .line 1811
    iget-object v11, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v11, Lcom/sun/mail/imap/IMAPStore;

    invoke-virtual {v11}, Lcom/sun/mail/imap/IMAPStore;->getAppendBufferSize()I

    move-result v7

    .line 1813
    .local v7, "maxsize":I
    array-length v11, p1

    new-array v10, v11, [Lcom/sun/mail/imap/AppendUID;

    .line 1814
    .local v10, "uids":[Lcom/sun/mail/imap/AppendUID;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_10
    array-length v11, p1

    if-ge v5, v11, :cond_50

    .line 1815
    aget-object v6, p1, v5
    :try_end_15
    .catchall {:try_start_1 .. :try_end_15} :catchall_4b

    .line 1820
    .local v6, "m":Lkorex/mail/Message;
    :try_start_15
    new-instance v8, Lcom/sun/mail/imap/MessageLiteral;

    .line 1821
    invoke-virtual {v6}, Lkorex/mail/Message;->getSize()I

    move-result v11

    if-le v11, v7, :cond_40

    const/4 v11, 0x0

    :goto_1e
    invoke-direct {v8, v6, v11}, Lcom/sun/mail/imap/MessageLiteral;-><init>(Lkorex/mail/Message;I)V
    :try_end_21
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_21} :catch_42
    .catch Lkorex/mail/MessageRemovedException; {:try_start_15 .. :try_end_21} :catch_4e
    .catchall {:try_start_15 .. :try_end_21} :catchall_4b

    .line 1829
    .local v8, "mos":Lcom/sun/mail/imap/MessageLiteral;
    :try_start_21
    invoke-virtual {v6}, Lkorex/mail/Message;->getReceivedDate()Ljava/util/Date;

    move-result-object v1

    .line 1830
    .local v1, "d":Ljava/util/Date;
    if-nez v1, :cond_2b

    .line 1831
    invoke-virtual {v6}, Lkorex/mail/Message;->getSentDate()Ljava/util/Date;

    move-result-object v1

    .line 1832
    :cond_2b
    move-object v2, v1

    .line 1833
    .local v2, "dd":Ljava/util/Date;
    invoke-virtual {v6}, Lkorex/mail/Message;->getFlags()Lkorex/mail/Flags;

    move-result-object v4

    .line 1834
    .local v4, "f":Lkorex/mail/Flags;
    new-instance v11, Lcom/sun/mail/imap/IMAPFolder$11;

    invoke-direct {v11, p0, v4, v2, v8}, Lcom/sun/mail/imap/IMAPFolder$11;-><init>(Lcom/sun/mail/imap/IMAPFolder;Lkorex/mail/Flags;Ljava/util/Date;Lcom/sun/mail/imap/MessageLiteral;)V

    invoke-virtual {p0, v11}, Lcom/sun/mail/imap/IMAPFolder;->doCommand(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sun/mail/imap/AppendUID;

    .line 1840
    .local v0, "auid":Lcom/sun/mail/imap/AppendUID;
    aput-object v0, v10, v5

    .line 1814
    .end local v0    # "auid":Lcom/sun/mail/imap/AppendUID;
    .end local v1    # "d":Ljava/util/Date;
    .end local v2    # "dd":Ljava/util/Date;
    .end local v4    # "f":Lkorex/mail/Flags;
    .end local v8    # "mos":Lcom/sun/mail/imap/MessageLiteral;
    :goto_3d
    add-int/lit8 v5, v5, 0x1

    goto :goto_10

    :cond_40
    move v11, v7

    .line 1821
    goto :goto_1e

    .line 1822
    :catch_42
    move-exception v3

    .line 1823
    .local v3, "ex":Ljava/io/IOException;
    new-instance v11, Lkorex/mail/MessagingException;

    const-string v12, "IOException while appending messages"

    invoke-direct {v11, v12, v3}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v11
    :try_end_4b
    .catchall {:try_start_21 .. :try_end_4b} :catchall_4b

    .line 1804
    .end local v3    # "ex":Ljava/io/IOException;
    .end local v5    # "i":I
    .end local v6    # "m":Lkorex/mail/Message;
    .end local v7    # "maxsize":I
    .end local v10    # "uids":[Lcom/sun/mail/imap/AppendUID;
    :catchall_4b
    move-exception v11

    monitor-exit p0

    throw v11

    .line 1825
    .restart local v5    # "i":I
    .restart local v6    # "m":Lkorex/mail/Message;
    .restart local v7    # "maxsize":I
    .restart local v10    # "uids":[Lcom/sun/mail/imap/AppendUID;
    :catch_4e
    move-exception v9

    .line 1826
    .local v9, "mrex":Lkorex/mail/MessageRemovedException;
    goto :goto_3d

    .line 1842
    .end local v6    # "m":Lkorex/mail/Message;
    .end local v9    # "mrex":Lkorex/mail/MessageRemovedException;
    :cond_50
    monitor-exit p0

    return-object v10
.end method

.method protected checkClosed()V
    .registers 3

    .prologue
    .line 439
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    if-eqz v0, :cond_c

    .line 440
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "This operation is not allowed on an open folder"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 443
    :cond_c
    return-void
.end method

.method protected checkExists()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 429
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPFolder;->exists:Z

    if-nez v0, :cond_25

    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->exists()Z

    move-result v0

    if-nez v0, :cond_25

    .line 430
    new-instance v0, Lkorex/mail/FolderNotFoundException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not found"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lkorex/mail/FolderNotFoundException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v0

    .line 432
    :cond_25
    return-void
.end method

.method protected checkOpened()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/FolderClosedException;
        }
    .end annotation

    .prologue
    .line 450
    sget-boolean v0, Lcom/sun/mail/imap/IMAPFolder;->$assertionsDisabled:Z

    if-nez v0, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 451
    :cond_10
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    if-nez v0, :cond_28

    .line 452
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPFolder;->reallyClosed:Z

    if-eqz v0, :cond_20

    .line 453
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "This operation is not allowed on a closed folder"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 457
    :cond_20
    new-instance v0, Lkorex/mail/FolderClosedException;

    const-string v1, "Lost folder connection to server"

    invoke-direct {v0, p0, v1}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v0

    .line 461
    :cond_28
    return-void
.end method

.method protected checkRange(I)V
    .registers 7
    .param p1, "msgno"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 470
    const/4 v2, 0x1

    if-ge p1, v2, :cond_b

    .line 471
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    const-string v3, "message number < 1"

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 473
    :cond_b
    iget v2, p0, Lcom/sun/mail/imap/IMAPFolder;->total:I

    if-gt p1, v2, :cond_10

    .line 492
    :cond_f
    return-void

    .line 479
    :cond_10
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v3

    .line 481
    const/4 v2, 0x0

    :try_start_14
    invoke-virtual {p0, v2}, Lcom/sun/mail/imap/IMAPFolder;->keepConnectionAlive(Z)V
    :try_end_17
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_14 .. :try_end_17} :catch_3b
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_14 .. :try_end_17} :catch_49
    .catchall {:try_start_14 .. :try_end_17} :catchall_46

    .line 488
    :try_start_17
    monitor-exit v3
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_46

    .line 490
    iget v2, p0, Lcom/sun/mail/imap/IMAPFolder;->total:I

    if-le p1, v2, :cond_f

    .line 491
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " > "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/sun/mail/imap/IMAPFolder;->total:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 482
    :catch_3b
    move-exception v0

    .line 484
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_3c
    new-instance v2, Lkorex/mail/FolderClosedException;

    invoke-virtual {v0}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, p0, v4}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v2

    .line 488
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_46
    move-exception v2

    monitor-exit v3
    :try_end_48
    .catchall {:try_start_3c .. :try_end_48} :catchall_46

    throw v2

    .line 485
    :catch_49
    move-exception v1

    .line 486
    .local v1, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_4a
    new-instance v2, Lkorex/mail/MessagingException;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v2
    :try_end_54
    .catchall {:try_start_4a .. :try_end_54} :catchall_46
.end method

.method public declared-synchronized close(Z)V
    .registers 3
    .param p1, "expunge"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1384
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    invoke-direct {p0, p1, v0}, Lcom/sun/mail/imap/IMAPFolder;->close(ZZ)V
    :try_end_5
    .catchall {:try_start_2 .. :try_end_5} :catchall_7

    .line 1385
    monitor-exit p0

    return-void

    .line 1384
    :catchall_7
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized copyMessages([Lkorex/mail/Message;Lkorex/mail/Folder;)V
    .registers 12
    .param p1, "msgs"    # [Lkorex/mail/Message;
    .param p2, "folder"    # Lkorex/mail/Folder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1890
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkOpened()V

    .line 1892
    array-length v5, p1
    :try_end_5
    .catchall {:try_start_1 .. :try_end_5} :catchall_55

    if-nez v5, :cond_9

    .line 1921
    :goto_7
    monitor-exit p0

    return-void

    .line 1896
    :cond_9
    :try_start_9
    invoke-virtual {p2}, Lkorex/mail/Folder;->getStore()Lkorex/mail/Store;

    move-result-object v5

    iget-object v6, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    if-ne v5, v6, :cond_81

    .line 1897
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v6
    :try_end_14
    .catchall {:try_start_9 .. :try_end_14} :catchall_55

    .line 1899
    :try_start_14
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v3

    .line 1900
    .local v3, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    const/4 v5, 0x0

    invoke-static {p1, v5}, Lcom/sun/mail/imap/Utility;->toMessageSet([Lkorex/mail/Message;Lcom/sun/mail/imap/Utility$Condition;)[Lcom/sun/mail/imap/protocol/MessageSet;

    move-result-object v2

    .line 1901
    .local v2, "ms":[Lcom/sun/mail/imap/protocol/MessageSet;
    if-nez v2, :cond_58

    .line 1902
    new-instance v5, Lkorex/mail/MessageRemovedException;

    const-string v7, "Messages have been removed"

    invoke-direct {v5, v7}, Lkorex/mail/MessageRemovedException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_27
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_14 .. :try_end_27} :catch_27
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_14 .. :try_end_27} :catch_6b
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_14 .. :try_end_27} :catch_76
    .catchall {:try_start_14 .. :try_end_27} :catchall_52

    .line 1905
    .end local v2    # "ms":[Lcom/sun/mail/imap/protocol/MessageSet;
    .end local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catch_27
    move-exception v1

    .line 1906
    .local v1, "cfx":Lcom/sun/mail/iap/CommandFailedException;
    :try_start_28
    invoke-virtual {v1}, Lcom/sun/mail/iap/CommandFailedException;->getMessage()Ljava/lang/String;

    move-result-object v5

    const-string v7, "TRYCREATE"

    invoke-virtual {v5, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v7, -0x1

    if-eq v5, v7, :cond_61

    .line 1907
    new-instance v5, Lkorex/mail/FolderNotFoundException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 1909
    invoke-virtual {p2}, Lkorex/mail/Folder;->getFullName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " does not exist"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, p2, v7}, Lkorex/mail/FolderNotFoundException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v5

    .line 1918
    .end local v1    # "cfx":Lcom/sun/mail/iap/CommandFailedException;
    :catchall_52
    move-exception v5

    monitor-exit v6
    :try_end_54
    .catchall {:try_start_28 .. :try_end_54} :catchall_52

    :try_start_54
    throw v5
    :try_end_55
    .catchall {:try_start_54 .. :try_end_55} :catchall_55

    .line 1890
    :catchall_55
    move-exception v5

    monitor-exit p0

    throw v5

    .line 1904
    .restart local v2    # "ms":[Lcom/sun/mail/imap/protocol/MessageSet;
    .restart local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :cond_58
    :try_start_58
    invoke-virtual {p2}, Lkorex/mail/Folder;->getFullName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v2, v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->copy([Lcom/sun/mail/imap/protocol/MessageSet;Ljava/lang/String;)V
    :try_end_5f
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_58 .. :try_end_5f} :catch_27
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_58 .. :try_end_5f} :catch_6b
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_58 .. :try_end_5f} :catch_76
    .catchall {:try_start_58 .. :try_end_5f} :catchall_52

    .line 1918
    :try_start_5f
    monitor-exit v6

    goto :goto_7

    .line 1912
    .end local v2    # "ms":[Lcom/sun/mail/imap/protocol/MessageSet;
    .end local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .restart local v1    # "cfx":Lcom/sun/mail/iap/CommandFailedException;
    :cond_61
    new-instance v5, Lkorex/mail/MessagingException;

    invoke-virtual {v1}, Lcom/sun/mail/iap/CommandFailedException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v5

    .line 1913
    .end local v1    # "cfx":Lcom/sun/mail/iap/CommandFailedException;
    :catch_6b
    move-exception v0

    .line 1914
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    new-instance v5, Lkorex/mail/FolderClosedException;

    invoke-virtual {v0}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, p0, v7}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v5

    .line 1915
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_76
    move-exception v4

    .line 1916
    .local v4, "pex":Lcom/sun/mail/iap/ProtocolException;
    new-instance v5, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v5
    :try_end_81
    .catchall {:try_start_5f .. :try_end_81} :catchall_52

    .line 1920
    .end local v4    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :cond_81
    :try_start_81
    invoke-super {p0, p1, p2}, Lkorex/mail/Folder;->copyMessages([Lkorex/mail/Message;Lkorex/mail/Folder;)V
    :try_end_84
    .catchall {:try_start_81 .. :try_end_84} :catchall_55

    goto :goto_7
.end method

.method public declared-synchronized copyUIDMessages([Lkorex/mail/Message;Lkorex/mail/Folder;)[Lcom/sun/mail/imap/AppendUID;
    .registers 26
    .param p1, "msgs"    # [Lkorex/mail/Message;
    .param p2, "folder"    # Lkorex/mail/Folder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1945
    monitor-enter p0

    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/IMAPFolder;->checkOpened()V

    .line 1947
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v17, v0
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_7e

    if-nez v17, :cond_e

    .line 1948
    const/4 v14, 0x0

    .line 2019
    :goto_c
    monitor-exit p0

    return-object v14

    .line 1951
    :cond_e
    :try_start_e
    invoke-virtual/range {p2 .. p2}, Lkorex/mail/Folder;->getStore()Lkorex/mail/Store;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    move-object/from16 v18, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    if-ne v0, v1, :cond_14f

    .line 1952
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    move-object/from16 v18, v0

    monitor-enter v18
    :try_end_25
    .catchall {:try_start_e .. :try_end_25} :catchall_7e

    .line 1954
    :try_start_25
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/IMAPFolder;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v12

    .line 1956
    .local v12, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    const/16 v17, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lcom/sun/mail/imap/Utility;->toMessageSet([Lkorex/mail/Message;Lcom/sun/mail/imap/Utility$Condition;)[Lcom/sun/mail/imap/protocol/MessageSet;

    move-result-object v11

    .line 1957
    .local v11, "ms":[Lcom/sun/mail/imap/protocol/MessageSet;
    if-nez v11, :cond_81

    .line 1958
    new-instance v17, Lkorex/mail/MessageRemovedException;

    const-string v19, "Messages have been removed"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lkorex/mail/MessageRemovedException;-><init>(Ljava/lang/String;)V

    throw v17
    :try_end_41
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_25 .. :try_end_41} :catch_41
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_25 .. :try_end_41} :catch_12f
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_25 .. :try_end_41} :catch_140
    .catchall {:try_start_25 .. :try_end_41} :catchall_7b

    .line 2020
    .end local v11    # "ms":[Lcom/sun/mail/imap/protocol/MessageSet;
    .end local v12    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catch_41
    move-exception v6

    .line 2021
    .local v6, "cfx":Lcom/sun/mail/iap/CommandFailedException;
    :try_start_42
    invoke-virtual {v6}, Lcom/sun/mail/iap/CommandFailedException;->getMessage()Ljava/lang/String;

    move-result-object v17

    const-string v19, "TRYCREATE"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v17

    const/16 v19, -0x1

    move/from16 v0, v17

    move/from16 v1, v19

    if-eq v0, v1, :cond_121

    .line 2022
    new-instance v17, Lkorex/mail/FolderNotFoundException;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    .line 2024
    invoke-virtual/range {p2 .. p2}, Lkorex/mail/Folder;->getFullName()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " does not exist"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lkorex/mail/FolderNotFoundException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v17

    .line 2033
    .end local v6    # "cfx":Lcom/sun/mail/iap/CommandFailedException;
    :catchall_7b
    move-exception v17

    monitor-exit v18
    :try_end_7d
    .catchall {:try_start_42 .. :try_end_7d} :catchall_7b

    :try_start_7d
    throw v17
    :try_end_7e
    .catchall {:try_start_7d .. :try_end_7e} :catchall_7e

    .line 1945
    :catchall_7e
    move-exception v17

    monitor-exit p0

    throw v17

    .line 1960
    .restart local v11    # "ms":[Lcom/sun/mail/imap/protocol/MessageSet;
    .restart local v12    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :cond_81
    :try_start_81
    invoke-virtual/range {p2 .. p2}, Lkorex/mail/Folder;->getFullName()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v12, v11, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->copyuid([Lcom/sun/mail/imap/protocol/MessageSet;Ljava/lang/String;)Lcom/sun/mail/imap/CopyUID;

    move-result-object v7

    .line 1987
    .local v7, "cuid":Lcom/sun/mail/imap/CopyUID;
    iget-object v0, v7, Lcom/sun/mail/imap/CopyUID;->src:[Lcom/sun/mail/imap/protocol/UIDSet;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/sun/mail/imap/protocol/UIDSet;->toArray([Lcom/sun/mail/imap/protocol/UIDSet;)[J

    move-result-object v16

    .line 1988
    .local v16, "srcuids":[J
    iget-object v0, v7, Lcom/sun/mail/imap/CopyUID;->dst:[Lcom/sun/mail/imap/protocol/UIDSet;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/sun/mail/imap/protocol/UIDSet;->toArray([Lcom/sun/mail/imap/protocol/UIDSet;)[J

    move-result-object v8

    .line 1991
    .local v8, "dstuids":[J
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/sun/mail/imap/IMAPFolder;->getMessagesByUID([J)[Lkorex/mail/Message;

    move-result-object v15

    .line 1992
    .local v15, "srcmsgs":[Lkorex/mail/Message;
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    new-array v14, v0, [Lcom/sun/mail/imap/AppendUID;

    .line 1993
    .local v14, "result":[Lcom/sun/mail/imap/AppendUID;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_ad
    array-length v0, v15

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v9, v0, :cond_e4

    .line 1994
    move v10, v9

    .line 1996
    .local v10, "j":I
    :cond_b5
    aget-object v17, p1, v10

    aget-object v19, v15, v9

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_d5

    .line 1997
    new-instance v17, Lcom/sun/mail/imap/AppendUID;

    iget-wide v0, v7, Lcom/sun/mail/imap/CopyUID;->uidvalidity:J

    move-wide/from16 v19, v0

    aget-wide v21, v8, v9

    move-object/from16 v0, v17

    move-wide/from16 v1, v19

    move-wide/from16 v3, v21

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/sun/mail/imap/AppendUID;-><init>(JJ)V

    aput-object v17, v14, v10

    .line 1993
    :goto_d2
    add-int/lit8 v9, v9, 0x1

    goto :goto_ad

    .line 2001
    :cond_d5
    add-int/lit8 v10, v10, 0x1

    .line 2002
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    if-lt v10, v0, :cond_e1

    .line 2003
    const/4 v10, 0x0

    .line 2004
    :cond_e1
    if-ne v10, v9, :cond_b5

    goto :goto_d2

    .line 2006
    .end local v10    # "j":I
    :cond_e4
    const/4 v9, 0x0

    :goto_e5
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v9, v0, :cond_11e

    .line 2007
    move v10, v9

    .line 2009
    .restart local v10    # "j":I
    :cond_ef
    aget-object v17, p1, v9

    aget-object v19, v15, v10

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_10f

    .line 2010
    new-instance v17, Lcom/sun/mail/imap/AppendUID;

    iget-wide v0, v7, Lcom/sun/mail/imap/CopyUID;->uidvalidity:J

    move-wide/from16 v19, v0

    aget-wide v21, v8, v10

    move-object/from16 v0, v17

    move-wide/from16 v1, v19

    move-wide/from16 v3, v21

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/sun/mail/imap/AppendUID;-><init>(JJ)V

    aput-object v17, v14, v9

    .line 2006
    :goto_10c
    add-int/lit8 v9, v9, 0x1

    goto :goto_e5

    .line 2014
    :cond_10f
    add-int/lit8 v10, v10, 0x1

    .line 2015
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v17, v0
    :try_end_116
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_81 .. :try_end_116} :catch_41
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_81 .. :try_end_116} :catch_12f
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_81 .. :try_end_116} :catch_140
    .catchall {:try_start_81 .. :try_end_116} :catchall_7b

    move/from16 v0, v17

    if-lt v10, v0, :cond_11b

    .line 2016
    const/4 v10, 0x0

    .line 2017
    :cond_11b
    if-ne v10, v9, :cond_ef

    goto :goto_10c

    .line 2019
    .end local v10    # "j":I
    :cond_11e
    :try_start_11e
    monitor-exit v18

    goto/16 :goto_c

    .line 2027
    .end local v7    # "cuid":Lcom/sun/mail/imap/CopyUID;
    .end local v8    # "dstuids":[J
    .end local v9    # "i":I
    .end local v11    # "ms":[Lcom/sun/mail/imap/protocol/MessageSet;
    .end local v12    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v14    # "result":[Lcom/sun/mail/imap/AppendUID;
    .end local v15    # "srcmsgs":[Lkorex/mail/Message;
    .end local v16    # "srcuids":[J
    .restart local v6    # "cfx":Lcom/sun/mail/iap/CommandFailedException;
    :cond_121
    new-instance v17, Lkorex/mail/MessagingException;

    invoke-virtual {v6}, Lcom/sun/mail/iap/CommandFailedException;->getMessage()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v6}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v17

    .line 2028
    .end local v6    # "cfx":Lcom/sun/mail/iap/CommandFailedException;
    :catch_12f
    move-exception v5

    .line 2029
    .local v5, "cex":Lcom/sun/mail/iap/ConnectionException;
    new-instance v17, Lkorex/mail/FolderClosedException;

    invoke-virtual {v5}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v17

    .line 2030
    .end local v5    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_140
    move-exception v13

    .line 2031
    .local v13, "pex":Lcom/sun/mail/iap/ProtocolException;
    new-instance v17, Lkorex/mail/MessagingException;

    invoke-virtual {v13}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v13}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v17
    :try_end_14f
    .catchall {:try_start_11e .. :try_end_14f} :catchall_7b

    .line 2035
    .end local v13    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :cond_14f
    :try_start_14f
    new-instance v17, Lkorex/mail/MessagingException;

    const-string v18, "can\'t copyUIDMessages to a different store"

    invoke-direct/range {v17 .. v18}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v17
    :try_end_157
    .catchall {:try_start_14f .. :try_end_157} :catchall_7e
.end method

.method public declared-synchronized create(I)Z
    .registers 7
    .param p1, "type"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 765
    monitor-enter p0

    const/4 v0, 0x0

    .line 766
    .local v0, "c":C
    and-int/lit8 v4, p1, 0x1

    if-nez v4, :cond_a

    .line 767
    :try_start_6
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getSeparator()C

    move-result v0

    .line 768
    :cond_a
    move v3, v0

    .line 769
    .local v3, "sep":C
    new-instance v4, Lcom/sun/mail/imap/IMAPFolder$6;

    invoke-direct {v4, p0, p1, v3}, Lcom/sun/mail/imap/IMAPFolder$6;-><init>(Lcom/sun/mail/imap/IMAPFolder;IC)V

    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/IMAPFolder;->doCommandIgnoreFailure(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;
    :try_end_13
    .catchall {:try_start_6 .. :try_end_13} :catchall_24

    move-result-object v1

    .line 797
    .local v1, "ret":Ljava/lang/Object;
    if-nez v1, :cond_19

    .line 798
    const/4 v2, 0x0

    .line 806
    :cond_17
    :goto_17
    monitor-exit p0

    return v2

    .line 803
    :cond_19
    :try_start_19
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->exists()Z

    move-result v2

    .line 804
    .local v2, "retb":Z
    if-eqz v2, :cond_17

    .line 805
    const/4 v4, 0x1

    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/IMAPFolder;->notifyFolderListeners(I)V
    :try_end_23
    .catchall {:try_start_19 .. :try_end_23} :catchall_24

    goto :goto_17

    .line 765
    .end local v1    # "ret":Ljava/lang/Object;
    .end local v2    # "retb":Z
    .end local v3    # "sep":C
    :catchall_24
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized delete(Z)Z
    .registers 7
    .param p1, "recurse"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 889
    monitor-enter p0

    :try_start_2
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkClosed()V

    .line 891
    if-eqz p1, :cond_17

    .line 893
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->list()[Lkorex/mail/Folder;

    move-result-object v0

    .line 894
    .local v0, "f":[Lkorex/mail/Folder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    array-length v4, v0

    if-ge v1, v4, :cond_17

    .line 895
    aget-object v4, v0, v1

    invoke-virtual {v4, p1}, Lkorex/mail/Folder;->delete(Z)Z

    .line 894
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 900
    .end local v0    # "f":[Lkorex/mail/Folder;
    .end local v1    # "i":I
    :cond_17
    new-instance v4, Lcom/sun/mail/imap/IMAPFolder$8;

    invoke-direct {v4, p0}, Lcom/sun/mail/imap/IMAPFolder$8;-><init>(Lcom/sun/mail/imap/IMAPFolder;)V

    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/IMAPFolder;->doCommandIgnoreFailure(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;
    :try_end_1f
    .catchall {:try_start_2 .. :try_end_1f} :catchall_30

    move-result-object v2

    .line 907
    .local v2, "ret":Ljava/lang/Object;
    if-nez v2, :cond_24

    .line 917
    :goto_22
    monitor-exit p0

    return v3

    .line 912
    :cond_24
    const/4 v3, 0x0

    :try_start_25
    iput-boolean v3, p0, Lcom/sun/mail/imap/IMAPFolder;->exists:Z

    .line 913
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/sun/mail/imap/IMAPFolder;->attributes:[Ljava/lang/String;

    .line 916
    const/4 v3, 0x2

    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/IMAPFolder;->notifyFolderListeners(I)V
    :try_end_2e
    .catchall {:try_start_25 .. :try_end_2e} :catchall_30

    .line 917
    const/4 v3, 0x1

    goto :goto_22

    .line 889
    .end local v2    # "ret":Ljava/lang/Object;
    :catchall_30
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public doCommand(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;
    .registers 6
    .param p1, "cmd"    # Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 3495
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/IMAPFolder;->doProtocolCommand(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;
    :try_end_3
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_0 .. :try_end_3} :catch_5
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_0 .. :try_end_3} :catch_b

    move-result-object v2

    .line 3502
    :goto_4
    return-object v2

    .line 3496
    :catch_5
    move-exception v0

    .line 3498
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/IMAPFolder;->throwClosedException(Lcom/sun/mail/iap/ConnectionException;)V

    .line 3502
    const/4 v2, 0x0

    goto :goto_4

    .line 3499
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_b
    move-exception v1

    .line 3500
    .local v1, "pex":Lcom/sun/mail/iap/ProtocolException;
    new-instance v2, Lkorex/mail/MessagingException;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v2
.end method

.method public doCommandIgnoreFailure(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;
    .registers 7
    .param p1, "cmd"    # Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 3523
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/IMAPFolder;->doProtocolCommand(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;
    :try_end_4
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_1 .. :try_end_4} :catch_6
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_1 .. :try_end_4} :catch_8
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_1 .. :try_end_4} :catch_d

    move-result-object v3

    .line 3532
    :goto_5
    return-object v3

    .line 3524
    :catch_6
    move-exception v1

    .line 3525
    .local v1, "cfx":Lcom/sun/mail/iap/CommandFailedException;
    goto :goto_5

    .line 3526
    .end local v1    # "cfx":Lcom/sun/mail/iap/CommandFailedException;
    :catch_8
    move-exception v0

    .line 3528
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/IMAPFolder;->throwClosedException(Lcom/sun/mail/iap/ConnectionException;)V

    goto :goto_5

    .line 3529
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_d
    move-exception v2

    .line 3530
    .local v2, "pex":Lcom/sun/mail/iap/ProtocolException;
    new-instance v3, Lkorex/mail/MessagingException;

    invoke-virtual {v2}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3
.end method

.method public doOptionalCommand(Ljava/lang/String;Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;
    .registers 8
    .param p1, "err"    # Ljava/lang/String;
    .param p2, "cmd"    # Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 3508
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/sun/mail/imap/IMAPFolder;->doProtocolCommand(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;
    :try_end_3
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_0 .. :try_end_3} :catch_5
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_0 .. :try_end_3} :catch_c
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_0 .. :try_end_3} :catch_12

    move-result-object v3

    .line 3517
    :goto_4
    return-object v3

    .line 3509
    :catch_5
    move-exception v0

    .line 3510
    .local v0, "bex":Lcom/sun/mail/iap/BadCommandException;
    new-instance v3, Lkorex/mail/MessagingException;

    invoke-direct {v3, p1, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3

    .line 3511
    .end local v0    # "bex":Lcom/sun/mail/iap/BadCommandException;
    :catch_c
    move-exception v1

    .line 3513
    .local v1, "cex":Lcom/sun/mail/iap/ConnectionException;
    invoke-virtual {p0, v1}, Lcom/sun/mail/imap/IMAPFolder;->throwClosedException(Lcom/sun/mail/iap/ConnectionException;)V

    .line 3517
    const/4 v3, 0x0

    goto :goto_4

    .line 3514
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_12
    move-exception v2

    .line 3515
    .local v2, "pex":Lcom/sun/mail/iap/ProtocolException;
    new-instance v3, Lkorex/mail/MessagingException;

    invoke-virtual {v2}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3
.end method

.method protected doProtocolCommand(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;
    .registers 5
    .param p1, "cmd"    # Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 3537
    monitor-enter p0

    .line 3543
    :try_start_1
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    if-eqz v1, :cond_19

    .line 3544
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v2
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_16

    .line 3545
    :try_start_8
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v1

    invoke-interface {p1, v1}, Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;->doCommand(Lcom/sun/mail/imap/protocol/IMAPProtocol;)Ljava/lang/Object;

    move-result-object v1

    monitor-exit v2
    :try_end_11
    .catchall {:try_start_8 .. :try_end_11} :catchall_13

    :try_start_11
    monitor-exit p0
    :try_end_12
    .catchall {:try_start_11 .. :try_end_12} :catchall_16

    .line 3557
    :goto_12
    return-object v1

    .line 3546
    :catchall_13
    move-exception v1

    :try_start_14
    monitor-exit v2
    :try_end_15
    .catchall {:try_start_14 .. :try_end_15} :catchall_13

    :try_start_15
    throw v1

    .line 3548
    :catchall_16
    move-exception v1

    monitor-exit p0
    :try_end_18
    .catchall {:try_start_15 .. :try_end_18} :catchall_16

    throw v1

    :cond_19
    :try_start_19
    monitor-exit p0
    :try_end_1a
    .catchall {:try_start_19 .. :try_end_1a} :catchall_16

    .line 3551
    const/4 v0, 0x0

    .line 3554
    .local v0, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :try_start_1b
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v0

    .line 3555
    invoke-interface {p1, v0}, Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;->doCommand(Lcom/sun/mail/imap/protocol/IMAPProtocol;)Ljava/lang/Object;
    :try_end_22
    .catchall {:try_start_1b .. :try_end_22} :catchall_27

    move-result-object v1

    .line 3557
    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/IMAPFolder;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    goto :goto_12

    :catchall_27
    move-exception v1

    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/IMAPFolder;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    throw v1
.end method

.method public declared-synchronized exists()Z
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 554
    monitor-enter p0

    const/4 v3, 0x0

    .line 556
    .local v3, "li":[Lcom/sun/mail/imap/protocol/ListInfo;
    :try_start_2
    iget-boolean v5, p0, Lcom/sun/mail/imap/IMAPFolder;->isNamespace:Z

    if-eqz v5, :cond_8b

    iget-char v5, p0, Lcom/sun/mail/imap/IMAPFolder;->separator:C

    if-eqz v5, :cond_8b

    .line 557
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-char v6, p0, Lcom/sun/mail/imap/IMAPFolder;->separator:C

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 561
    .local v4, "lname":Ljava/lang/String;
    :goto_1f
    new-instance v5, Lcom/sun/mail/imap/IMAPFolder$1;

    invoke-direct {v5, p0, v4}, Lcom/sun/mail/imap/IMAPFolder$1;-><init>(Lcom/sun/mail/imap/IMAPFolder;Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Lcom/sun/mail/imap/IMAPFolder;->doCommand(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lcom/sun/mail/imap/protocol/ListInfo;

    move-object v0, v5

    check-cast v0, [Lcom/sun/mail/imap/protocol/ListInfo;

    move-object v3, v0

    .line 567
    if-eqz v3, :cond_8e

    .line 568
    invoke-direct {p0, v3, v4}, Lcom/sun/mail/imap/IMAPFolder;->findName([Lcom/sun/mail/imap/protocol/ListInfo;Ljava/lang/String;)I

    move-result v1

    .line 569
    .local v1, "i":I
    aget-object v5, v3, v1

    iget-object v5, v5, Lcom/sun/mail/imap/protocol/ListInfo;->name:Ljava/lang/String;

    iput-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    .line 570
    aget-object v5, v3, v1

    iget-char v5, v5, Lcom/sun/mail/imap/protocol/ListInfo;->separator:C

    iput-char v5, p0, Lcom/sun/mail/imap/IMAPFolder;->separator:C

    .line 571
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v2

    .line 572
    .local v2, "len":I
    iget-char v5, p0, Lcom/sun/mail/imap/IMAPFolder;->separator:C

    if-eqz v5, :cond_63

    if-lez v2, :cond_63

    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    add-int/lit8 v6, v2, -0x1

    .line 573
    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v5

    iget-char v6, p0, Lcom/sun/mail/imap/IMAPFolder;->separator:C

    if-ne v5, v6, :cond_63

    .line 574
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    const/4 v6, 0x0

    add-int/lit8 v7, v2, -0x1

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    .line 576
    :cond_63
    const/4 v5, 0x0

    iput v5, p0, Lcom/sun/mail/imap/IMAPFolder;->type:I

    .line 577
    aget-object v5, v3, v1

    iget-boolean v5, v5, Lcom/sun/mail/imap/protocol/ListInfo;->hasInferiors:Z

    if-eqz v5, :cond_72

    .line 578
    iget v5, p0, Lcom/sun/mail/imap/IMAPFolder;->type:I

    or-int/lit8 v5, v5, 0x2

    iput v5, p0, Lcom/sun/mail/imap/IMAPFolder;->type:I

    .line 579
    :cond_72
    aget-object v5, v3, v1

    iget-boolean v5, v5, Lcom/sun/mail/imap/protocol/ListInfo;->canOpen:Z

    if-eqz v5, :cond_7e

    .line 580
    iget v5, p0, Lcom/sun/mail/imap/IMAPFolder;->type:I

    or-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/sun/mail/imap/IMAPFolder;->type:I

    .line 581
    :cond_7e
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/sun/mail/imap/IMAPFolder;->exists:Z

    .line 582
    aget-object v5, v3, v1

    iget-object v5, v5, Lcom/sun/mail/imap/protocol/ListInfo;->attrs:[Ljava/lang/String;

    iput-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->attributes:[Ljava/lang/String;

    .line 588
    .end local v1    # "i":I
    .end local v2    # "len":I
    :goto_87
    iget-boolean v5, p0, Lcom/sun/mail/imap/IMAPFolder;->exists:Z
    :try_end_89
    .catchall {:try_start_2 .. :try_end_89} :catchall_96

    monitor-exit p0

    return v5

    .line 559
    .end local v4    # "lname":Ljava/lang/String;
    :cond_8b
    :try_start_8b
    iget-object v4, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    .restart local v4    # "lname":Ljava/lang/String;
    goto :goto_1f

    .line 584
    :cond_8e
    iget-boolean v5, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    iput-boolean v5, p0, Lcom/sun/mail/imap/IMAPFolder;->exists:Z

    .line 585
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->attributes:[Ljava/lang/String;
    :try_end_95
    .catchall {:try_start_8b .. :try_end_95} :catchall_96

    goto :goto_87

    .line 554
    .end local v4    # "lname":Ljava/lang/String;
    :catchall_96
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method public declared-synchronized expunge()[Lkorex/mail/Message;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2043
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/IMAPFolder;->expunge([Lkorex/mail/Message;)[Lkorex/mail/Message;
    :try_end_5
    .catchall {:try_start_2 .. :try_end_5} :catchall_8

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized expunge([Lkorex/mail/Message;)[Lkorex/mail/Message;
    .registers 16
    .param p1, "msgs"    # [Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2058
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkOpened()V

    .line 2060
    if-eqz p1, :cond_13

    .line 2062
    new-instance v2, Lkorex/mail/FetchProfile;

    invoke-direct {v2}, Lkorex/mail/FetchProfile;-><init>()V

    .line 2063
    .local v2, "fp":Lkorex/mail/FetchProfile;
    sget-object v10, Lkorex/mail/UIDFolder$FetchProfileItem;->UID:Lkorex/mail/UIDFolder$FetchProfileItem;

    invoke-virtual {v2, v10}, Lkorex/mail/FetchProfile;->add(Lkorex/mail/FetchProfile$Item;)V

    .line 2064
    invoke-virtual {p0, p1, v2}, Lcom/sun/mail/imap/IMAPFolder;->fetch([Lkorex/mail/Message;Lkorex/mail/FetchProfile;)V

    .line 2068
    .end local v2    # "fp":Lkorex/mail/FetchProfile;
    :cond_13
    iget-object v11, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v11
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_7e

    .line 2069
    const/4 v10, 0x0

    :try_start_17
    iput-boolean v10, p0, Lcom/sun/mail/imap/IMAPFolder;->doExpungeNotification:Z
    :try_end_19
    .catchall {:try_start_17 .. :try_end_19} :catchall_7b

    .line 2071
    :try_start_19
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v5

    .line 2072
    .local v5, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    if-eqz p1, :cond_51

    .line 2073
    invoke-static {p1}, Lcom/sun/mail/imap/Utility;->toUIDSet([Lkorex/mail/Message;)[Lcom/sun/mail/imap/protocol/UIDSet;

    move-result-object v10

    invoke-virtual {v5, v10}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->uidexpunge([Lcom/sun/mail/imap/protocol/UIDSet;)V
    :try_end_26
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_19 .. :try_end_26} :catch_55
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_19 .. :try_end_26} :catch_8b
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_19 .. :try_end_26} :catch_96
    .catchall {:try_start_19 .. :try_end_26} :catchall_76

    .line 2089
    :goto_26
    const/4 v10, 0x1

    :try_start_27
    iput-boolean v10, p0, Lcom/sun/mail/imap/IMAPFolder;->doExpungeNotification:Z

    .line 2093
    if-eqz p1, :cond_a1

    .line 2094
    iget-object v10, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCache:Lcom/sun/mail/imap/MessageCache;

    invoke-virtual {v10, p1}, Lcom/sun/mail/imap/MessageCache;->removeExpungedMessages([Lkorex/mail/Message;)[Lcom/sun/mail/imap/IMAPMessage;

    move-result-object v7

    .line 2097
    .local v7, "rmsgs":[Lcom/sun/mail/imap/IMAPMessage;
    :goto_31
    iget-object v10, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    if-eqz v10, :cond_a8

    .line 2098
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_36
    array-length v10, v7

    if-ge v3, v10, :cond_a8

    .line 2099
    aget-object v4, v7, v3

    .line 2101
    .local v4, "m":Lcom/sun/mail/imap/IMAPMessage;
    invoke-virtual {v4}, Lcom/sun/mail/imap/IMAPMessage;->getUID()J

    move-result-wide v8

    .line 2102
    .local v8, "uid":J
    const-wide/16 v12, -0x1

    cmp-long v10, v8, v12

    if-eqz v10, :cond_4e

    .line 2103
    iget-object v10, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    invoke-virtual {v10, v12}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4e
    .catchall {:try_start_27 .. :try_end_4e} :catchall_7b

    .line 2098
    :cond_4e
    add-int/lit8 v3, v3, 0x1

    goto :goto_36

    .line 2075
    .end local v3    # "i":I
    .end local v4    # "m":Lcom/sun/mail/imap/IMAPMessage;
    .end local v7    # "rmsgs":[Lcom/sun/mail/imap/IMAPMessage;
    .end local v8    # "uid":J
    :cond_51
    :try_start_51
    invoke-virtual {v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->expunge()V
    :try_end_54
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_51 .. :try_end_54} :catch_55
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_51 .. :try_end_54} :catch_8b
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_51 .. :try_end_54} :catch_96
    .catchall {:try_start_51 .. :try_end_54} :catchall_76

    goto :goto_26

    .line 2076
    .end local v5    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catch_55
    move-exception v1

    .line 2078
    .local v1, "cfx":Lcom/sun/mail/iap/CommandFailedException;
    :try_start_56
    iget v10, p0, Lcom/sun/mail/imap/IMAPFolder;->mode:I

    const/4 v12, 0x2

    if-eq v10, v12, :cond_81

    .line 2079
    new-instance v10, Ljava/lang/IllegalStateException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Cannot expunge READ_ONLY folder: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v12}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_76
    .catchall {:try_start_56 .. :try_end_76} :catchall_76

    .line 2089
    .end local v1    # "cfx":Lcom/sun/mail/iap/CommandFailedException;
    :catchall_76
    move-exception v10

    const/4 v12, 0x1

    :try_start_78
    iput-boolean v12, p0, Lcom/sun/mail/imap/IMAPFolder;->doExpungeNotification:Z

    throw v10

    .line 2109
    :catchall_7b
    move-exception v10

    monitor-exit v11
    :try_end_7d
    .catchall {:try_start_78 .. :try_end_7d} :catchall_7b

    :try_start_7d
    throw v10
    :try_end_7e
    .catchall {:try_start_7d .. :try_end_7e} :catchall_7e

    .line 2058
    :catchall_7e
    move-exception v10

    monitor-exit p0

    throw v10

    .line 2082
    .restart local v1    # "cfx":Lcom/sun/mail/iap/CommandFailedException;
    :cond_81
    :try_start_81
    new-instance v10, Lkorex/mail/MessagingException;

    invoke-virtual {v1}, Lcom/sun/mail/iap/CommandFailedException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v12, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v10

    .line 2083
    .end local v1    # "cfx":Lcom/sun/mail/iap/CommandFailedException;
    :catch_8b
    move-exception v0

    .line 2084
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    new-instance v10, Lkorex/mail/FolderClosedException;

    invoke-virtual {v0}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, p0, v12}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v10

    .line 2085
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_96
    move-exception v6

    .line 2087
    .local v6, "pex":Lcom/sun/mail/iap/ProtocolException;
    new-instance v10, Lkorex/mail/MessagingException;

    invoke-virtual {v6}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v12, v6}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v10
    :try_end_a1
    .catchall {:try_start_81 .. :try_end_a1} :catchall_76

    .line 2096
    .end local v6    # "pex":Lcom/sun/mail/iap/ProtocolException;
    .restart local v5    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :cond_a1
    :try_start_a1
    iget-object v10, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCache:Lcom/sun/mail/imap/MessageCache;

    invoke-virtual {v10}, Lcom/sun/mail/imap/MessageCache;->removeExpungedMessages()[Lcom/sun/mail/imap/IMAPMessage;

    move-result-object v7

    .restart local v7    # "rmsgs":[Lcom/sun/mail/imap/IMAPMessage;
    goto :goto_31

    .line 2108
    :cond_a8
    iget-object v10, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCache:Lcom/sun/mail/imap/MessageCache;

    invoke-virtual {v10}, Lcom/sun/mail/imap/MessageCache;->size()I

    move-result v10

    iput v10, p0, Lcom/sun/mail/imap/IMAPFolder;->total:I

    .line 2109
    monitor-exit v11
    :try_end_b1
    .catchall {:try_start_a1 .. :try_end_b1} :catchall_7b

    .line 2112
    :try_start_b1
    array-length v10, v7

    if-lez v10, :cond_b8

    .line 2113
    const/4 v10, 0x1

    invoke-virtual {p0, v10, v7}, Lcom/sun/mail/imap/IMAPFolder;->notifyMessageRemovedListeners(Z[Lkorex/mail/Message;)V
    :try_end_b8
    .catchall {:try_start_b1 .. :try_end_b8} :catchall_7e

    .line 2114
    :cond_b8
    monitor-exit p0

    return-object v7
.end method

.method public declared-synchronized fetch([Lkorex/mail/Message;Lkorex/mail/FetchProfile;)V
    .registers 29
    .param p1, "msgs"    # [Lkorex/mail/Message;
    .param p2, "fp"    # Lkorex/mail/FetchProfile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1131
    monitor-enter p0

    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/IMAPFolder;->checkOpened()V

    .line 1133
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    .line 1134
    .local v5, "command":Ljava/lang/StringBuffer;
    const/4 v9, 0x1

    .line 1135
    .local v9, "first":Z
    const/4 v3, 0x0

    .line 1137
    .local v3, "allHeaders":Z
    sget-object v23, Lkorex/mail/FetchProfile$Item;->ENVELOPE:Lkorex/mail/FetchProfile$Item;

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v23

    if-eqz v23, :cond_21

    .line 1138
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/IMAPFolder;->getEnvelopeCommand()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1139
    const/4 v9, 0x0

    .line 1141
    :cond_21
    sget-object v23, Lkorex/mail/FetchProfile$Item;->FLAGS:Lkorex/mail/FetchProfile$Item;

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v23

    if-eqz v23, :cond_37

    .line 1142
    if-eqz v9, :cond_128

    const-string v23, "FLAGS"

    :goto_31
    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1143
    const/4 v9, 0x0

    .line 1145
    :cond_37
    sget-object v23, Lkorex/mail/FetchProfile$Item;->CONTENT_INFO:Lkorex/mail/FetchProfile$Item;

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v23

    if-eqz v23, :cond_4d

    .line 1146
    if-eqz v9, :cond_12c

    const-string v23, "BODYSTRUCTURE"

    :goto_47
    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1147
    const/4 v9, 0x0

    .line 1149
    :cond_4d
    sget-object v23, Lkorex/mail/UIDFolder$FetchProfileItem;->UID:Lkorex/mail/UIDFolder$FetchProfileItem;

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v23

    if-eqz v23, :cond_63

    .line 1150
    if-eqz v9, :cond_130

    const-string v23, "UID"

    :goto_5d
    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1151
    const/4 v9, 0x0

    .line 1153
    :cond_63
    sget-object v23, Lcom/sun/mail/imap/IMAPFolder$FetchProfileItem;->HEADERS:Lcom/sun/mail/imap/IMAPFolder$FetchProfileItem;

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v23

    if-eqz v23, :cond_86

    .line 1154
    const/4 v3, 0x1

    .line 1155
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isREV1()Z

    move-result v23

    if-eqz v23, :cond_138

    .line 1156
    if-eqz v9, :cond_134

    const-string v23, "BODY.PEEK[HEADER]"

    :goto_80
    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1160
    :goto_85
    const/4 v9, 0x0

    .line 1162
    :cond_86
    sget-object v23, Lcom/sun/mail/imap/IMAPFolder$FetchProfileItem;->MESSAGE:Lcom/sun/mail/imap/IMAPFolder$FetchProfileItem;

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v23

    if-eqz v23, :cond_a9

    .line 1163
    const/4 v3, 0x1

    .line 1164
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isREV1()Z

    move-result v23

    if-eqz v23, :cond_14d

    .line 1165
    if-eqz v9, :cond_149

    const-string v23, "BODY.PEEK[]"

    :goto_a3
    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1168
    :goto_a8
    const/4 v9, 0x0

    .line 1170
    :cond_a9
    sget-object v23, Lkorex/mail/FetchProfile$Item;->SIZE:Lkorex/mail/FetchProfile$Item;

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v23

    if-nez v23, :cond_c1

    sget-object v23, Lcom/sun/mail/imap/IMAPFolder$FetchProfileItem;->SIZE:Lcom/sun/mail/imap/IMAPFolder$FetchProfileItem;

    .line 1171
    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v23

    if-eqz v23, :cond_cb

    .line 1172
    :cond_c1
    if-eqz v9, :cond_15b

    const-string v23, "RFC822.SIZE"

    :goto_c5
    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1173
    const/4 v9, 0x0

    .line 1177
    :cond_cb
    const/4 v11, 0x0

    .line 1178
    .local v11, "hdrs":[Ljava/lang/String;
    if-nez v3, :cond_eb

    .line 1179
    invoke-virtual/range {p2 .. p2}, Lkorex/mail/FetchProfile;->getHeaderNames()[Ljava/lang/String;

    move-result-object v11

    .line 1180
    array-length v0, v11

    move/from16 v23, v0

    if-lez v23, :cond_eb

    .line 1181
    if-nez v9, :cond_e0

    .line 1182
    const-string v23, " "

    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1183
    :cond_e0
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lcom/sun/mail/imap/IMAPFolder;->createHeaderCommand([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1190
    :cond_eb
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getFetchItems()[Lcom/sun/mail/imap/protocol/FetchItem;

    move-result-object v10

    .line 1191
    .local v10, "fitems":[Lcom/sun/mail/imap/protocol/FetchItem;
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_f6
    array-length v0, v10

    move/from16 v23, v0

    move/from16 v0, v23

    if-ge v12, v0, :cond_15f

    .line 1192
    aget-object v23, v10, v12

    invoke-virtual/range {v23 .. v23}, Lcom/sun/mail/imap/protocol/FetchItem;->getFetchProfileItem()Lkorex/mail/FetchProfile$Item;

    move-result-object v23

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v23

    if-eqz v23, :cond_125

    .line 1193
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->length()I

    move-result v23

    if-eqz v23, :cond_11a

    .line 1194
    const-string v23, " "

    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1195
    :cond_11a
    aget-object v23, v10, v12

    invoke-virtual/range {v23 .. v23}, Lcom/sun/mail/imap/protocol/FetchItem;->getName()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1191
    :cond_125
    add-int/lit8 v12, v12, 0x1

    goto :goto_f6

    .line 1142
    .end local v10    # "fitems":[Lcom/sun/mail/imap/protocol/FetchItem;
    .end local v11    # "hdrs":[Ljava/lang/String;
    .end local v12    # "i":I
    :cond_128
    const-string v23, " FLAGS"

    goto/16 :goto_31

    .line 1146
    :cond_12c
    const-string v23, " BODYSTRUCTURE"

    goto/16 :goto_47

    .line 1150
    :cond_130
    const-string v23, " UID"

    goto/16 :goto_5d

    .line 1156
    :cond_134
    const-string v23, " BODY.PEEK[HEADER]"

    goto/16 :goto_80

    .line 1159
    :cond_138
    if-eqz v9, :cond_146

    const-string v23, "RFC822.HEADER"

    :goto_13c
    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_141
    .catchall {:try_start_1 .. :try_end_141} :catchall_143

    goto/16 :goto_85

    .line 1131
    .end local v3    # "allHeaders":Z
    .end local v5    # "command":Ljava/lang/StringBuffer;
    .end local v9    # "first":Z
    :catchall_143
    move-exception v23

    monitor-exit p0

    throw v23

    .line 1159
    .restart local v3    # "allHeaders":Z
    .restart local v5    # "command":Ljava/lang/StringBuffer;
    .restart local v9    # "first":Z
    :cond_146
    :try_start_146
    const-string v23, " RFC822.HEADER"

    goto :goto_13c

    .line 1165
    :cond_149
    const-string v23, " BODY.PEEK[]"

    goto/16 :goto_a3

    .line 1167
    :cond_14d
    if-eqz v9, :cond_158

    const-string v23, "RFC822"

    :goto_151
    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_a8

    :cond_158
    const-string v23, " RFC822"

    goto :goto_151

    .line 1172
    :cond_15b
    const-string v23, " RFC822.SIZE"

    goto/16 :goto_c5

    .line 1199
    .restart local v10    # "fitems":[Lcom/sun/mail/imap/protocol/FetchItem;
    .restart local v11    # "hdrs":[Ljava/lang/String;
    .restart local v12    # "i":I
    :cond_15f
    new-instance v6, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;

    move-object/from16 v0, p2

    invoke-direct {v6, v0, v10}, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;-><init>(Lkorex/mail/FetchProfile;[Lcom/sun/mail/imap/protocol/FetchItem;)V

    .line 1203
    .local v6, "condition":Lcom/sun/mail/imap/Utility$Condition;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    move-object/from16 v24, v0

    monitor-enter v24
    :try_end_16d
    .catchall {:try_start_146 .. :try_end_16d} :catchall_143

    .line 1207
    :try_start_16d
    move-object/from16 v0, p1

    invoke-static {v0, v6}, Lcom/sun/mail/imap/Utility;->toMessageSet([Lkorex/mail/Message;Lcom/sun/mail/imap/Utility$Condition;)[Lcom/sun/mail/imap/protocol/MessageSet;

    move-result-object v16

    .line 1209
    .local v16, "msgsets":[Lcom/sun/mail/imap/protocol/MessageSet;
    if-nez v16, :cond_178

    .line 1211
    monitor-exit v24
    :try_end_176
    .catchall {:try_start_16d .. :try_end_176} :catchall_195

    .line 1274
    :goto_176
    monitor-exit p0

    return-void

    .line 1213
    :cond_178
    const/16 v18, 0x0

    .line 1214
    .local v18, "r":[Lcom/sun/mail/iap/Response;
    :try_start_17a
    new-instance v22, Ljava/util/Vector;

    invoke-direct/range {v22 .. v22}, Ljava/util/Vector;-><init>()V
    :try_end_17f
    .catchall {:try_start_17a .. :try_end_17f} :catchall_195

    .line 1217
    .local v22, "v":Ljava/util/Vector;
    :try_start_17f
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/IMAPFolder;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v23

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetch([Lcom/sun/mail/imap/protocol/MessageSet;Ljava/lang/String;)[Lcom/sun/mail/iap/Response;
    :try_end_190
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_17f .. :try_end_190} :catch_198
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_17f .. :try_end_190} :catch_247
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_17f .. :try_end_190} :catch_1a9
    .catchall {:try_start_17f .. :try_end_190} :catchall_195

    move-result-object v18

    .line 1226
    :goto_191
    if-nez v18, :cond_1ba

    .line 1227
    :try_start_193
    monitor-exit v24

    goto :goto_176

    .line 1273
    .end local v16    # "msgsets":[Lcom/sun/mail/imap/protocol/MessageSet;
    .end local v18    # "r":[Lcom/sun/mail/iap/Response;
    .end local v22    # "v":Ljava/util/Vector;
    :catchall_195
    move-exception v23

    monitor-exit v24
    :try_end_197
    .catchall {:try_start_193 .. :try_end_197} :catchall_195

    :try_start_197
    throw v23
    :try_end_198
    .catchall {:try_start_197 .. :try_end_198} :catchall_143

    .line 1218
    .restart local v16    # "msgsets":[Lcom/sun/mail/imap/protocol/MessageSet;
    .restart local v18    # "r":[Lcom/sun/mail/iap/Response;
    .restart local v22    # "v":Ljava/util/Vector;
    :catch_198
    move-exception v4

    .line 1219
    .local v4, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_199
    new-instance v23, Lkorex/mail/FolderClosedException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v23

    .line 1222
    .end local v4    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_1a9
    move-exception v17

    .line 1223
    .local v17, "pex":Lcom/sun/mail/iap/ProtocolException;
    new-instance v23, Lkorex/mail/MessagingException;

    invoke-virtual/range {v17 .. v17}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v23

    .line 1229
    .end local v17    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :cond_1ba
    const/4 v12, 0x0

    :goto_1bb
    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v23, v0

    move/from16 v0, v23

    if-ge v12, v0, :cond_22a

    .line 1230
    aget-object v23, v18, v12

    if-nez v23, :cond_1cb

    .line 1229
    :cond_1c8
    :goto_1c8
    add-int/lit8 v12, v12, 0x1

    goto :goto_1bb

    .line 1232
    :cond_1cb
    aget-object v23, v18, v12

    move-object/from16 v0, v23

    instance-of v0, v0, Lcom/sun/mail/imap/protocol/FetchResponse;

    move/from16 v23, v0

    if-nez v23, :cond_1db

    .line 1233
    aget-object v23, v18, v12

    invoke-virtual/range {v22 .. v23}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_1c8

    .line 1238
    :cond_1db
    aget-object v8, v18, v12

    check-cast v8, Lcom/sun/mail/imap/protocol/FetchResponse;

    .line 1240
    .local v8, "f":Lcom/sun/mail/imap/protocol/FetchResponse;
    invoke-virtual {v8}, Lcom/sun/mail/imap/protocol/FetchResponse;->getNumber()I

    move-result v23

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/sun/mail/imap/IMAPFolder;->getMessageBySeqNumber(I)Lcom/sun/mail/imap/IMAPMessage;

    move-result-object v15

    .line 1242
    .local v15, "msg":Lcom/sun/mail/imap/IMAPMessage;
    invoke-virtual {v8}, Lcom/sun/mail/imap/protocol/FetchResponse;->getItemCount()I

    move-result v7

    .line 1243
    .local v7, "count":I
    const/16 v21, 0x0

    .line 1245
    .local v21, "unsolicitedFlags":Z
    const/4 v14, 0x0

    .local v14, "j":I
    :goto_1f2
    if-ge v14, v7, :cond_217

    .line 1246
    invoke-virtual {v8, v14}, Lcom/sun/mail/imap/protocol/FetchResponse;->getItem(I)Lcom/sun/mail/imap/protocol/Item;

    move-result-object v13

    .line 1248
    .local v13, "item":Lcom/sun/mail/imap/protocol/Item;
    instance-of v0, v13, Lkorex/mail/Flags;

    move/from16 v23, v0

    if-eqz v23, :cond_211

    sget-object v23, Lkorex/mail/FetchProfile$Item;->FLAGS:Lkorex/mail/FetchProfile$Item;

    .line 1249
    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v23

    if-eqz v23, :cond_20c

    if-nez v15, :cond_211

    .line 1252
    :cond_20c
    const/16 v21, 0x1

    .line 1245
    :cond_20e
    :goto_20e
    add-int/lit8 v14, v14, 0x1

    goto :goto_1f2

    .line 1253
    :cond_211
    if-eqz v15, :cond_20e

    .line 1254
    invoke-virtual {v15, v13, v11, v3}, Lcom/sun/mail/imap/IMAPMessage;->handleFetchItem(Lcom/sun/mail/imap/protocol/Item;[Ljava/lang/String;Z)Z

    goto :goto_20e

    .line 1256
    .end local v13    # "item":Lcom/sun/mail/imap/protocol/Item;
    :cond_217
    if-eqz v15, :cond_222

    .line 1257
    invoke-virtual {v8}, Lcom/sun/mail/imap/protocol/FetchResponse;->getExtensionItems()Ljava/util/Map;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v15, v0}, Lcom/sun/mail/imap/IMAPMessage;->handleExtensionFetchItems(Ljava/util/Map;)V

    .line 1261
    :cond_222
    if-eqz v21, :cond_1c8

    .line 1262
    move-object/from16 v0, v22

    invoke-virtual {v0, v8}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_1c8

    .line 1266
    .end local v7    # "count":I
    .end local v8    # "f":Lcom/sun/mail/imap/protocol/FetchResponse;
    .end local v14    # "j":I
    .end local v15    # "msg":Lcom/sun/mail/imap/IMAPMessage;
    .end local v21    # "unsolicitedFlags":Z
    :cond_22a
    invoke-virtual/range {v22 .. v22}, Ljava/util/Vector;->size()I

    move-result v20

    .line 1267
    .local v20, "size":I
    if-eqz v20, :cond_244

    .line 1268
    move/from16 v0, v20

    new-array v0, v0, [Lcom/sun/mail/iap/Response;

    move-object/from16 v19, v0

    .line 1269
    .local v19, "responses":[Lcom/sun/mail/iap/Response;
    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 1270
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/sun/mail/imap/IMAPFolder;->handleResponses([Lcom/sun/mail/iap/Response;)V

    .line 1273
    .end local v19    # "responses":[Lcom/sun/mail/iap/Response;
    :cond_244
    monitor-exit v24
    :try_end_245
    .catchall {:try_start_199 .. :try_end_245} :catchall_195

    goto/16 :goto_176

    .line 1220
    .end local v20    # "size":I
    :catch_247
    move-exception v23

    goto/16 :goto_191
.end method

.method public declared-synchronized forceClose()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1393
    monitor-enter p0

    const/4 v0, 0x0

    const/4 v1, 0x1

    :try_start_3
    invoke-direct {p0, v0, v1}, Lcom/sun/mail/imap/IMAPFolder;->close(ZZ)V
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_8

    .line 1394
    monitor-exit p0

    return-void

    .line 1393
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getACL()[Lcom/sun/mail/imap/ACL;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2715
    const-string v0, "ACL not supported"

    new-instance v1, Lcom/sun/mail/imap/IMAPFolder$14;

    invoke-direct {v1, p0}, Lcom/sun/mail/imap/IMAPFolder$14;-><init>(Lcom/sun/mail/imap/IMAPFolder;)V

    invoke-virtual {p0, v0, v1}, Lcom/sun/mail/imap/IMAPFolder;->doOptionalCommand(Ljava/lang/String;Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sun/mail/imap/ACL;

    check-cast v0, [Lcom/sun/mail/imap/ACL;

    return-object v0
.end method

.method public declared-synchronized getAttributes()[Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2847
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkExists()V

    .line 2848
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->attributes:[Ljava/lang/String;

    if-nez v0, :cond_b

    .line 2849
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->exists()Z

    .line 2850
    :cond_b
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->attributes:[Ljava/lang/String;

    if-nez v0, :cond_14

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_1f

    .line 2851
    :goto_12
    monitor-exit p0

    return-object v0

    .line 2850
    :cond_14
    :try_start_14
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->attributes:[Ljava/lang/String;

    .line 2851
    invoke-virtual {v0}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    check-cast v0, [Ljava/lang/String;
    :try_end_1e
    .catchall {:try_start_14 .. :try_end_1e} :catchall_1f

    goto :goto_12

    .line 2847
    :catchall_1f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method getChannel()Ljava/nio/channels/SocketChannel;
    .registers 2

    .prologue
    .line 3065
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getChannel()Ljava/nio/channels/SocketChannel;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public declared-synchronized getDeletedMessageCount()I
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1677
    monitor-enter p0

    :try_start_1
    iget-boolean v4, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    if-nez v4, :cond_b

    .line 1678
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkExists()V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_37

    .line 1680
    const/4 v4, -0x1

    .line 1690
    :goto_9
    monitor-exit p0

    return v4

    .line 1685
    :cond_b
    :try_start_b
    new-instance v1, Lkorex/mail/Flags;

    invoke-direct {v1}, Lkorex/mail/Flags;-><init>()V

    .line 1686
    .local v1, "f":Lkorex/mail/Flags;
    sget-object v4, Lkorex/mail/Flags$Flag;->DELETED:Lkorex/mail/Flags$Flag;

    invoke-virtual {v1, v4}, Lkorex/mail/Flags;->add(Lkorex/mail/Flags$Flag;)V
    :try_end_15
    .catchall {:try_start_b .. :try_end_15} :catchall_37

    .line 1688
    :try_start_15
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v5
    :try_end_18
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_15 .. :try_end_18} :catch_2c
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_15 .. :try_end_18} :catch_3a
    .catchall {:try_start_15 .. :try_end_18} :catchall_37

    .line 1689
    :try_start_18
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v4

    new-instance v6, Lkorex/mail/search/FlagTerm;

    const/4 v7, 0x1

    invoke-direct {v6, v1, v7}, Lkorex/mail/search/FlagTerm;-><init>(Lkorex/mail/Flags;Z)V

    invoke-virtual {v4, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->search(Lkorex/mail/search/SearchTerm;)[I

    move-result-object v2

    .line 1690
    .local v2, "matches":[I
    array-length v4, v2

    monitor-exit v5

    goto :goto_9

    .line 1691
    .end local v2    # "matches":[I
    :catchall_29
    move-exception v4

    monitor-exit v5
    :try_end_2b
    .catchall {:try_start_18 .. :try_end_2b} :catchall_29

    :try_start_2b
    throw v4
    :try_end_2c
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_2b .. :try_end_2c} :catch_2c
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_2b .. :try_end_2c} :catch_3a
    .catchall {:try_start_2b .. :try_end_2c} :catchall_37

    .line 1692
    :catch_2c
    move-exception v0

    .line 1693
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_2d
    new-instance v4, Lkorex/mail/FolderClosedException;

    invoke-virtual {v0}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, p0, v5}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v4
    :try_end_37
    .catchall {:try_start_2d .. :try_end_37} :catchall_37

    .line 1677
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    .end local v1    # "f":Lkorex/mail/Flags;
    :catchall_37
    move-exception v4

    monitor-exit p0

    throw v4

    .line 1694
    .restart local v1    # "f":Lkorex/mail/Flags;
    :catch_3a
    move-exception v3

    .line 1696
    .local v3, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_3b
    new-instance v4, Lkorex/mail/MessagingException;

    invoke-virtual {v3}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v3}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v4
    :try_end_45
    .catchall {:try_start_3b .. :try_end_45} :catchall_37
.end method

.method protected getEnvelopeCommand()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1286
    const-string v0, "ENVELOPE INTERNALDATE RFC822.SIZE"

    return-object v0
.end method

.method public declared-synchronized getFolder(Ljava/lang/String;)Lkorex/mail/Folder;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 877
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->attributes:[Ljava/lang/String;

    if-eqz v1, :cond_16

    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPFolder;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_16

    .line 878
    new-instance v1, Lkorex/mail/MessagingException;

    const-string v2, "Cannot contain subfolders"

    invoke-direct {v1, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_13
    .catchall {:try_start_1 .. :try_end_13} :catchall_13

    .line 877
    :catchall_13
    move-exception v1

    monitor-exit p0

    throw v1

    .line 880
    :cond_16
    :try_start_16
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getSeparator()C

    move-result v0

    .line 881
    .local v0, "c":C
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v1, Lcom/sun/mail/imap/IMAPStore;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/sun/mail/imap/IMAPStore;->newIMAPFolder(Ljava/lang/String;C)Lcom/sun/mail/imap/IMAPFolder;
    :try_end_38
    .catchall {:try_start_16 .. :try_end_38} :catchall_13

    move-result-object v1

    monitor-exit p0

    return-object v1
.end method

.method public declared-synchronized getFullName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 533
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getHighestModSeq()J
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2589
    monitor-enter p0

    :try_start_1
    iget-boolean v6, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    if-eqz v6, :cond_9

    .line 2590
    iget-wide v6, p0, Lcom/sun/mail/imap/IMAPFolder;->highestmodseq:J
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_2d

    .line 2613
    :goto_7
    monitor-exit p0

    return-wide v6

    .line 2592
    :cond_9
    const/4 v3, 0x0

    .line 2593
    .local v3, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    const/4 v5, 0x0

    .line 2596
    .local v5, "status":Lcom/sun/mail/imap/protocol/Status;
    :try_start_b
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v3

    .line 2597
    const-string v6, "CONDSTORE"

    invoke-virtual {v3, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_30

    .line 2598
    new-instance v6, Lcom/sun/mail/iap/BadCommandException;

    const-string v7, "CONDSTORE not supported"

    invoke-direct {v6, v7}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_1f
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_b .. :try_end_1f} :catch_1f
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_b .. :try_end_1f} :catch_44
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_b .. :try_end_1f} :catch_4c
    .catchall {:try_start_b .. :try_end_1f} :catchall_28

    .line 2601
    :catch_1f
    move-exception v0

    .line 2603
    .local v0, "bex":Lcom/sun/mail/iap/BadCommandException;
    :try_start_20
    new-instance v6, Lkorex/mail/MessagingException;

    const-string v7, "Cannot obtain HIGHESTMODSEQ"

    invoke-direct {v6, v7, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6
    :try_end_28
    .catchall {:try_start_20 .. :try_end_28} :catchall_28

    .line 2610
    .end local v0    # "bex":Lcom/sun/mail/iap/BadCommandException;
    :catchall_28
    move-exception v6

    :try_start_29
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/IMAPFolder;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    throw v6
    :try_end_2d
    .catchall {:try_start_29 .. :try_end_2d} :catchall_2d

    .line 2589
    .end local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v5    # "status":Lcom/sun/mail/imap/protocol/Status;
    :catchall_2d
    move-exception v6

    monitor-exit p0

    throw v6

    .line 2599
    .restart local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .restart local v5    # "status":Lcom/sun/mail/imap/protocol/Status;
    :cond_30
    const/4 v6, 0x1

    :try_start_31
    new-array v2, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "HIGHESTMODSEQ"

    aput-object v7, v2, v6

    .line 2600
    .local v2, "item":[Ljava/lang/String;
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v3, v6, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->status(Ljava/lang/String;[Ljava/lang/String;)Lcom/sun/mail/imap/protocol/Status;
    :try_end_3d
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_31 .. :try_end_3d} :catch_1f
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_31 .. :try_end_3d} :catch_44
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_31 .. :try_end_3d} :catch_4c
    .catchall {:try_start_31 .. :try_end_3d} :catchall_28

    move-result-object v5

    .line 2610
    :try_start_3e
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/IMAPFolder;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    .line 2613
    .end local v2    # "item":[Ljava/lang/String;
    :goto_41
    iget-wide v6, v5, Lcom/sun/mail/imap/protocol/Status;->highestmodseq:J
    :try_end_43
    .catchall {:try_start_3e .. :try_end_43} :catchall_2d

    goto :goto_7

    .line 2604
    :catch_44
    move-exception v1

    .line 2606
    .local v1, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_45
    invoke-virtual {p0, v1}, Lcom/sun/mail/imap/IMAPFolder;->throwClosedException(Lcom/sun/mail/iap/ConnectionException;)V
    :try_end_48
    .catchall {:try_start_45 .. :try_end_48} :catchall_28

    .line 2610
    :try_start_48
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/IMAPFolder;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V
    :try_end_4b
    .catchall {:try_start_48 .. :try_end_4b} :catchall_2d

    goto :goto_41

    .line 2607
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_4c
    move-exception v4

    .line 2608
    .local v4, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_4d
    new-instance v6, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6
    :try_end_57
    .catchall {:try_start_4d .. :try_end_57} :catchall_28
.end method

.method public declared-synchronized getMessage(I)Lkorex/mail/Message;
    .registers 3
    .param p1, "msgnum"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1734
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkOpened()V

    .line 1735
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/IMAPFolder;->checkRange(I)V

    .line 1737
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCache:Lcom/sun/mail/imap/MessageCache;

    invoke-virtual {v0, p1}, Lcom/sun/mail/imap/MessageCache;->getMessage(I)Lcom/sun/mail/imap/IMAPMessage;
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_f

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 1734
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected getMessageBySeqNumber(I)Lcom/sun/mail/imap/IMAPMessage;
    .registers 3
    .param p1, "seqnum"    # I

    .prologue
    .line 3642
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCache:Lcom/sun/mail/imap/MessageCache;

    invoke-virtual {v0, p1}, Lcom/sun/mail/imap/MessageCache;->getMessageBySeqnum(I)Lcom/sun/mail/imap/IMAPMessage;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getMessageByUID(J)Lkorex/mail/Message;
    .registers 14
    .param p1, "uid"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2382
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkOpened()V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_5a

    .line 2384
    const/4 v3, 0x0

    .line 2387
    .local v3, "m":Lcom/sun/mail/imap/IMAPMessage;
    :try_start_5
    iget-object v8, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v8
    :try_end_8
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_5 .. :try_end_8} :catch_4f
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_5 .. :try_end_8} :catch_5d
    .catchall {:try_start_5 .. :try_end_8} :catchall_5a

    .line 2388
    :try_start_8
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    .line 2390
    .local v2, "l":Ljava/lang/Long;
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    if-eqz v7, :cond_20

    .line 2392
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    invoke-virtual {v7, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    move-object v0, v7

    check-cast v0, Lcom/sun/mail/imap/IMAPMessage;

    move-object v3, v0

    .line 2393
    if-eqz v3, :cond_27

    .line 2394
    monitor-exit v8
    :try_end_1d
    .catchall {:try_start_8 .. :try_end_1d} :catchall_4c

    move-object v4, v3

    .line 2417
    .end local v3    # "m":Lcom/sun/mail/imap/IMAPMessage;
    .local v4, "m":Lcom/sun/mail/imap/IMAPMessage;
    :goto_1e
    monitor-exit p0

    return-object v4

    .line 2396
    .end local v4    # "m":Lcom/sun/mail/imap/IMAPMessage;
    .restart local v3    # "m":Lcom/sun/mail/imap/IMAPMessage;
    :cond_20
    :try_start_20
    new-instance v7, Ljava/util/Hashtable;

    invoke-direct {v7}, Ljava/util/Hashtable;-><init>()V

    iput-object v7, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    .line 2400
    :cond_27
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v7

    invoke-virtual {v7, p1, p2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchSequenceNumber(J)Lcom/sun/mail/imap/protocol/UID;

    move-result-object v6

    .line 2402
    .local v6, "u":Lcom/sun/mail/imap/protocol/UID;
    if-eqz v6, :cond_49

    iget v7, v6, Lcom/sun/mail/imap/protocol/UID;->seqnum:I

    iget v9, p0, Lcom/sun/mail/imap/IMAPFolder;->total:I

    if-gt v7, v9, :cond_49

    .line 2403
    iget v7, v6, Lcom/sun/mail/imap/protocol/UID;->seqnum:I

    invoke-virtual {p0, v7}, Lcom/sun/mail/imap/IMAPFolder;->getMessageBySeqNumber(I)Lcom/sun/mail/imap/IMAPMessage;

    move-result-object v3

    .line 2404
    if-eqz v3, :cond_49

    .line 2405
    iget-wide v9, v6, Lcom/sun/mail/imap/protocol/UID;->uid:J

    invoke-virtual {v3, v9, v10}, Lcom/sun/mail/imap/IMAPMessage;->setUID(J)V

    .line 2407
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    invoke-virtual {v7, v2, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2410
    :cond_49
    monitor-exit v8

    move-object v4, v3

    .line 2417
    .end local v3    # "m":Lcom/sun/mail/imap/IMAPMessage;
    .restart local v4    # "m":Lcom/sun/mail/imap/IMAPMessage;
    goto :goto_1e

    .line 2410
    .end local v2    # "l":Ljava/lang/Long;
    .end local v4    # "m":Lcom/sun/mail/imap/IMAPMessage;
    .end local v6    # "u":Lcom/sun/mail/imap/protocol/UID;
    .restart local v3    # "m":Lcom/sun/mail/imap/IMAPMessage;
    :catchall_4c
    move-exception v7

    monitor-exit v8
    :try_end_4e
    .catchall {:try_start_20 .. :try_end_4e} :catchall_4c

    :try_start_4e
    throw v7
    :try_end_4f
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_4e .. :try_end_4f} :catch_4f
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_4e .. :try_end_4f} :catch_5d
    .catchall {:try_start_4e .. :try_end_4f} :catchall_5a

    .line 2411
    :catch_4f
    move-exception v1

    .line 2412
    .local v1, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_50
    new-instance v7, Lkorex/mail/FolderClosedException;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, p0, v8}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v7
    :try_end_5a
    .catchall {:try_start_50 .. :try_end_5a} :catchall_5a

    .line 2382
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    .end local v3    # "m":Lcom/sun/mail/imap/IMAPMessage;
    :catchall_5a
    move-exception v7

    monitor-exit p0

    throw v7

    .line 2413
    .restart local v3    # "m":Lcom/sun/mail/imap/IMAPMessage;
    :catch_5d
    move-exception v5

    .line 2414
    .local v5, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_5e
    new-instance v7, Lkorex/mail/MessagingException;

    invoke-virtual {v5}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v5}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v7
    :try_end_68
    .catchall {:try_start_5e .. :try_end_68} :catchall_5a
.end method

.method public declared-synchronized getMessageCount()I
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1538
    monitor-enter p0

    :try_start_1
    iget-boolean v6, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    if-nez v6, :cond_50

    .line 1539
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkExists()V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_25

    .line 1543
    :try_start_8
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPFolder;->getStatus()Lcom/sun/mail/imap/protocol/Status;

    move-result-object v5

    .line 1544
    .local v5, "status":Lcom/sun/mail/imap/protocol/Status;
    iget v6, v5, Lcom/sun/mail/imap/protocol/Status;->total:I
    :try_end_e
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_8 .. :try_end_e} :catch_10
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_8 .. :try_end_e} :catch_38
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_8 .. :try_end_e} :catch_45
    .catchall {:try_start_8 .. :try_end_e} :catchall_25

    .line 1573
    .end local v5    # "status":Lcom/sun/mail/imap/protocol/Status;
    :goto_e
    monitor-exit p0

    return v6

    .line 1545
    :catch_10
    move-exception v0

    .line 1548
    .local v0, "bex":Lcom/sun/mail/iap/BadCommandException;
    const/4 v3, 0x0

    .line 1551
    .local v3, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :try_start_12
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v3

    .line 1552
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->examine(Ljava/lang/String;)Lcom/sun/mail/imap/protocol/MailboxInfo;

    move-result-object v2

    .line 1553
    .local v2, "minfo":Lcom/sun/mail/imap/protocol/MailboxInfo;
    invoke-virtual {v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->close()V

    .line 1554
    iget v6, v2, Lcom/sun/mail/imap/protocol/MailboxInfo;->total:I
    :try_end_21
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_12 .. :try_end_21} :catch_28
    .catchall {:try_start_12 .. :try_end_21} :catchall_33

    .line 1559
    :try_start_21
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/IMAPFolder;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V
    :try_end_24
    .catchall {:try_start_21 .. :try_end_24} :catchall_25

    goto :goto_e

    .line 1538
    .end local v0    # "bex":Lcom/sun/mail/iap/BadCommandException;
    .end local v2    # "minfo":Lcom/sun/mail/imap/protocol/MailboxInfo;
    .end local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catchall_25
    move-exception v6

    monitor-exit p0

    throw v6

    .line 1555
    .restart local v0    # "bex":Lcom/sun/mail/iap/BadCommandException;
    .restart local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catch_28
    move-exception v4

    .line 1557
    .local v4, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_29
    new-instance v6, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6
    :try_end_33
    .catchall {:try_start_29 .. :try_end_33} :catchall_33

    .line 1559
    .end local v4    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :catchall_33
    move-exception v6

    :try_start_34
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/IMAPFolder;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    throw v6

    .line 1561
    .end local v0    # "bex":Lcom/sun/mail/iap/BadCommandException;
    .end local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catch_38
    move-exception v1

    .line 1562
    .local v1, "cex":Lcom/sun/mail/iap/ConnectionException;
    new-instance v6, Lkorex/mail/StoreClosedException;

    iget-object v7, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lkorex/mail/StoreClosedException;-><init>(Lkorex/mail/Store;Ljava/lang/String;)V

    throw v6

    .line 1563
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_45
    move-exception v4

    .line 1564
    .restart local v4    # "pex":Lcom/sun/mail/iap/ProtocolException;
    new-instance v6, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6

    .line 1569
    .end local v4    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :cond_50
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v7
    :try_end_53
    .catchall {:try_start_34 .. :try_end_53} :catchall_25

    .line 1572
    const/4 v6, 0x1

    :try_start_54
    invoke-virtual {p0, v6}, Lcom/sun/mail/imap/IMAPFolder;->keepConnectionAlive(Z)V

    .line 1573
    iget v6, p0, Lcom/sun/mail/imap/IMAPFolder;->total:I
    :try_end_59
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_54 .. :try_end_59} :catch_5e
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_54 .. :try_end_59} :catch_69
    .catchall {:try_start_54 .. :try_end_59} :catchall_5b

    :try_start_59
    monitor-exit v7

    goto :goto_e

    .line 1579
    :catchall_5b
    move-exception v6

    monitor-exit v7
    :try_end_5d
    .catchall {:try_start_59 .. :try_end_5d} :catchall_5b

    :try_start_5d
    throw v6
    :try_end_5e
    .catchall {:try_start_5d .. :try_end_5e} :catchall_25

    .line 1574
    :catch_5e
    move-exception v1

    .line 1575
    .restart local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_5f
    new-instance v6, Lkorex/mail/FolderClosedException;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, p0, v8}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v6

    .line 1576
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_69
    move-exception v4

    .line 1577
    .restart local v4    # "pex":Lcom/sun/mail/iap/ProtocolException;
    new-instance v6, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6
    :try_end_74
    .catchall {:try_start_5f .. :try_end_74} :catchall_5b
.end method

.method public declared-synchronized getMessagesByUID(JJ)[Lkorex/mail/Message;
    .registers 15
    .param p1, "start"    # J
    .param p3, "end"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2427
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkOpened()V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_55

    .line 2432
    :try_start_4
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v7
    :try_end_7
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_4 .. :try_end_7} :catch_4a
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_4 .. :try_end_7} :catch_58
    .catchall {:try_start_4 .. :try_end_7} :catchall_55

    .line 2433
    :try_start_7
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    if-nez v6, :cond_12

    .line 2434
    new-instance v6, Ljava/util/Hashtable;

    invoke-direct {v6}, Ljava/util/Hashtable;-><init>()V

    iput-object v6, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    .line 2437
    :cond_12
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v6

    invoke-virtual {v6, p1, p2, p3, p4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchSequenceNumbers(JJ)[Lcom/sun/mail/imap/protocol/UID;

    move-result-object v5

    .line 2439
    .local v5, "ua":[Lcom/sun/mail/imap/protocol/UID;
    array-length v6, v5

    new-array v3, v6, [Lkorex/mail/Message;

    .line 2442
    .local v3, "msgs":[Lkorex/mail/Message;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1e
    array-length v6, v5

    if-ge v1, v6, :cond_44

    .line 2443
    aget-object v6, v5, v1

    iget v6, v6, Lcom/sun/mail/imap/protocol/UID;->seqnum:I

    invoke-virtual {p0, v6}, Lcom/sun/mail/imap/IMAPFolder;->getMessageBySeqNumber(I)Lcom/sun/mail/imap/IMAPMessage;

    move-result-object v2

    .line 2444
    .local v2, "m":Lcom/sun/mail/imap/IMAPMessage;
    if-eqz v2, :cond_41

    .line 2445
    aget-object v6, v5, v1

    iget-wide v8, v6, Lcom/sun/mail/imap/protocol/UID;->uid:J

    invoke-virtual {v2, v8, v9}, Lcom/sun/mail/imap/IMAPMessage;->setUID(J)V

    .line 2446
    aput-object v2, v3, v1

    .line 2447
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    aget-object v8, v5, v1

    iget-wide v8, v8, Lcom/sun/mail/imap/protocol/UID;->uid:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v6, v8, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2442
    :cond_41
    add-int/lit8 v1, v1, 0x1

    goto :goto_1e

    .line 2450
    .end local v2    # "m":Lcom/sun/mail/imap/IMAPMessage;
    :cond_44
    monitor-exit v7
    :try_end_45
    .catchall {:try_start_7 .. :try_end_45} :catchall_47

    .line 2457
    monitor-exit p0

    return-object v3

    .line 2450
    .end local v1    # "i":I
    .end local v3    # "msgs":[Lkorex/mail/Message;
    .end local v5    # "ua":[Lcom/sun/mail/imap/protocol/UID;
    :catchall_47
    move-exception v6

    :try_start_48
    monitor-exit v7
    :try_end_49
    .catchall {:try_start_48 .. :try_end_49} :catchall_47

    :try_start_49
    throw v6
    :try_end_4a
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_49 .. :try_end_4a} :catch_4a
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_49 .. :try_end_4a} :catch_58
    .catchall {:try_start_49 .. :try_end_4a} :catchall_55

    .line 2451
    :catch_4a
    move-exception v0

    .line 2452
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_4b
    new-instance v6, Lkorex/mail/FolderClosedException;

    invoke-virtual {v0}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, p0, v7}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v6
    :try_end_55
    .catchall {:try_start_4b .. :try_end_55} :catchall_55

    .line 2427
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_55
    move-exception v6

    monitor-exit p0

    throw v6

    .line 2453
    :catch_58
    move-exception v4

    .line 2454
    .local v4, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_59
    new-instance v6, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6
    :try_end_63
    .catchall {:try_start_59 .. :try_end_63} :catchall_55
.end method

.method public declared-synchronized getMessagesByUID([J)[Lkorex/mail/Message;
    .registers 16
    .param p1, "uids"    # [J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2469
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkOpened()V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_a3

    .line 2472
    :try_start_4
    iget-object v11, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v11
    :try_end_7
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_4 .. :try_end_7} :catch_98
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_4 .. :try_end_7} :catch_a6
    .catchall {:try_start_4 .. :try_end_7} :catchall_a3

    .line 2473
    move-object v7, p1

    .line 2474
    .local v7, "unavailUids":[J
    :try_start_8
    iget-object v10, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    if-eqz v10, :cond_41

    .line 2475
    new-instance v8, Ljava/util/Vector;

    invoke-direct {v8}, Ljava/util/Vector;-><init>()V

    .line 2477
    .local v8, "v":Ljava/util/Vector;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_12
    array-length v10, p1

    if-ge v1, v10, :cond_29

    .line 2478
    iget-object v10, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    aget-wide v12, p1, v1

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    .local v2, "l":Ljava/lang/Long;
    invoke-virtual {v10, v2}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_26

    .line 2480
    invoke-virtual {v8, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 2477
    :cond_26
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    .line 2483
    .end local v2    # "l":Ljava/lang/Long;
    :cond_29
    invoke-virtual {v8}, Ljava/util/Vector;->size()I

    move-result v9

    .line 2484
    .local v9, "vsize":I
    new-array v7, v9, [J

    .line 2485
    const/4 v1, 0x0

    :goto_30
    if-ge v1, v9, :cond_48

    .line 2486
    invoke-virtual {v8, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Long;

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    aput-wide v12, v7, v1

    .line 2485
    add-int/lit8 v1, v1, 0x1

    goto :goto_30

    .line 2488
    .end local v1    # "i":I
    .end local v8    # "v":Ljava/util/Vector;
    .end local v9    # "vsize":I
    :cond_41
    new-instance v10, Ljava/util/Hashtable;

    invoke-direct {v10}, Ljava/util/Hashtable;-><init>()V

    iput-object v10, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    .line 2490
    :cond_48
    array-length v10, v7

    if-lez v10, :cond_78

    .line 2492
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v10

    invoke-virtual {v10, v7}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchSequenceNumbers([J)[Lcom/sun/mail/imap/protocol/UID;

    move-result-object v6

    .line 2494
    .local v6, "ua":[Lcom/sun/mail/imap/protocol/UID;
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_54
    array-length v10, v6

    if-ge v1, v10, :cond_78

    .line 2495
    aget-object v10, v6, v1

    iget v10, v10, Lcom/sun/mail/imap/protocol/UID;->seqnum:I

    invoke-virtual {p0, v10}, Lcom/sun/mail/imap/IMAPFolder;->getMessageBySeqNumber(I)Lcom/sun/mail/imap/IMAPMessage;

    move-result-object v3

    .line 2496
    .local v3, "m":Lcom/sun/mail/imap/IMAPMessage;
    if-eqz v3, :cond_75

    .line 2497
    aget-object v10, v6, v1

    iget-wide v12, v10, Lcom/sun/mail/imap/protocol/UID;->uid:J

    invoke-virtual {v3, v12, v13}, Lcom/sun/mail/imap/IMAPMessage;->setUID(J)V

    .line 2498
    iget-object v10, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    aget-object v12, v6, v1

    iget-wide v12, v12, Lcom/sun/mail/imap/protocol/UID;->uid:J

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    invoke-virtual {v10, v12, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2494
    :cond_75
    add-int/lit8 v1, v1, 0x1

    goto :goto_54

    .line 2504
    .end local v1    # "i":I
    .end local v3    # "m":Lcom/sun/mail/imap/IMAPMessage;
    .end local v6    # "ua":[Lcom/sun/mail/imap/protocol/UID;
    :cond_78
    array-length v10, p1

    new-array v4, v10, [Lkorex/mail/Message;

    .line 2505
    .local v4, "msgs":[Lkorex/mail/Message;
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_7c
    array-length v10, p1

    if-ge v1, v10, :cond_92

    .line 2506
    iget-object v10, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    aget-wide v12, p1, v1

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    invoke-virtual {v10, v12}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lkorex/mail/Message;

    aput-object v10, v4, v1

    .line 2505
    add-int/lit8 v1, v1, 0x1

    goto :goto_7c

    .line 2507
    :cond_92
    monitor-exit v11
    :try_end_93
    .catchall {:try_start_8 .. :try_end_93} :catchall_95

    monitor-exit p0

    return-object v4

    .line 2508
    .end local v1    # "i":I
    .end local v4    # "msgs":[Lkorex/mail/Message;
    :catchall_95
    move-exception v10

    :try_start_96
    monitor-exit v11
    :try_end_97
    .catchall {:try_start_96 .. :try_end_97} :catchall_95

    :try_start_97
    throw v10
    :try_end_98
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_97 .. :try_end_98} :catch_98
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_97 .. :try_end_98} :catch_a6
    .catchall {:try_start_97 .. :try_end_98} :catchall_a3

    .line 2509
    .end local v7    # "unavailUids":[J
    :catch_98
    move-exception v0

    .line 2510
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_99
    new-instance v10, Lkorex/mail/FolderClosedException;

    invoke-virtual {v0}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, p0, v11}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v10
    :try_end_a3
    .catchall {:try_start_99 .. :try_end_a3} :catchall_a3

    .line 2469
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_a3
    move-exception v10

    monitor-exit p0

    throw v10

    .line 2511
    :catch_a6
    move-exception v5

    .line 2512
    .local v5, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_a7
    new-instance v10, Lkorex/mail/MessagingException;

    invoke-virtual {v5}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v5}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v10
    :try_end_b1
    .catchall {:try_start_a7 .. :try_end_b1} :catchall_a3
.end method

.method public declared-synchronized getMessagesByUIDChangedSince(JJJ)[Lkorex/mail/Message;
    .registers 20
    .param p1, "start"    # J
    .param p3, "end"    # J
    .param p5, "modseq"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2633
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkOpened()V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_29

    .line 2638
    :try_start_4
    iget-object v12, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v12
    :try_end_7
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_4 .. :try_end_7} :catch_1e
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_4 .. :try_end_7} :catch_4a
    .catchall {:try_start_4 .. :try_end_7} :catchall_29

    .line 2639
    :try_start_7
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v0

    .line 2640
    .local v0, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    const-string v1, "CONDSTORE"

    invoke-virtual {v0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2c

    .line 2641
    new-instance v1, Lcom/sun/mail/iap/BadCommandException;

    const-string v2, "CONDSTORE not supported"

    invoke-direct {v1, v2}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2649
    .end local v0    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catchall_1b
    move-exception v1

    monitor-exit v12
    :try_end_1d
    .catchall {:try_start_7 .. :try_end_1d} :catchall_1b

    :try_start_1d
    throw v1
    :try_end_1e
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_1d .. :try_end_1e} :catch_1e
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_1d .. :try_end_1e} :catch_4a
    .catchall {:try_start_1d .. :try_end_1e} :catchall_29

    .line 2650
    :catch_1e
    move-exception v7

    .line 2651
    .local v7, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_1f
    new-instance v1, Lkorex/mail/FolderClosedException;

    invoke-virtual {v7}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v1
    :try_end_29
    .catchall {:try_start_1f .. :try_end_29} :catchall_29

    .line 2633
    .end local v7    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_29
    move-exception v1

    monitor-exit p0

    throw v1

    .restart local v0    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :cond_2c
    move-wide v1, p1

    move-wide/from16 v3, p3

    move-wide/from16 v5, p5

    .line 2644
    :try_start_31
    invoke-virtual/range {v0 .. v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->uidfetchChangedSince(JJJ)[I

    move-result-object v10

    .line 2646
    .local v10, "nums":[I
    array-length v1, v10

    new-array v9, v1, [Lkorex/mail/Message;

    .line 2647
    .local v9, "msgs":[Lkorex/mail/Message;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_39
    array-length v1, v10

    if-ge v8, v1, :cond_47

    .line 2648
    aget v1, v10, v8

    invoke-virtual {p0, v1}, Lcom/sun/mail/imap/IMAPFolder;->getMessageBySeqNumber(I)Lcom/sun/mail/imap/IMAPMessage;

    move-result-object v1

    aput-object v1, v9, v8

    .line 2647
    add-int/lit8 v8, v8, 0x1

    goto :goto_39

    .line 2649
    :cond_47
    monitor-exit v12
    :try_end_48
    .catchall {:try_start_31 .. :try_end_48} :catchall_1b

    .line 2656
    monitor-exit p0

    return-object v9

    .line 2652
    .end local v0    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v8    # "i":I
    .end local v9    # "msgs":[Lkorex/mail/Message;
    .end local v10    # "nums":[I
    :catch_4a
    move-exception v11

    .line 2653
    .local v11, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_4b
    new-instance v1, Lkorex/mail/MessagingException;

    invoke-virtual {v11}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v11}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
    :try_end_55
    .catchall {:try_start_4b .. :try_end_55} :catchall_29
.end method

.method public declared-synchronized getName()Ljava/lang/String;
    .registers 4

    .prologue
    .line 519
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->name:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_1d

    if-nez v0, :cond_19

    .line 521
    :try_start_5
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    .line 522
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getSeparator()C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    .line 521
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->name:Ljava/lang/String;
    :try_end_19
    .catch Lkorex/mail/MessagingException; {:try_start_5 .. :try_end_19} :catch_20
    .catchall {:try_start_5 .. :try_end_19} :catchall_1d

    .line 526
    :cond_19
    :goto_19
    :try_start_19
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->name:Ljava/lang/String;
    :try_end_1b
    .catchall {:try_start_19 .. :try_end_1b} :catchall_1d

    monitor-exit p0

    return-object v0

    .line 519
    :catchall_1d
    move-exception v0

    monitor-exit p0

    throw v0

    .line 524
    :catch_20
    move-exception v0

    goto :goto_19
.end method

.method public declared-synchronized getNewMessageCount()I
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1587
    monitor-enter p0

    :try_start_1
    iget-boolean v6, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    if-nez v6, :cond_50

    .line 1588
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkExists()V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_25

    .line 1592
    :try_start_8
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPFolder;->getStatus()Lcom/sun/mail/imap/protocol/Status;

    move-result-object v5

    .line 1593
    .local v5, "status":Lcom/sun/mail/imap/protocol/Status;
    iget v6, v5, Lcom/sun/mail/imap/protocol/Status;->recent:I
    :try_end_e
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_8 .. :try_end_e} :catch_10
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_8 .. :try_end_e} :catch_38
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_8 .. :try_end_e} :catch_45
    .catchall {:try_start_8 .. :try_end_e} :catchall_25

    .line 1622
    .end local v5    # "status":Lcom/sun/mail/imap/protocol/Status;
    :goto_e
    monitor-exit p0

    return v6

    .line 1594
    :catch_10
    move-exception v0

    .line 1597
    .local v0, "bex":Lcom/sun/mail/iap/BadCommandException;
    const/4 v3, 0x0

    .line 1600
    .local v3, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :try_start_12
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v3

    .line 1601
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->examine(Ljava/lang/String;)Lcom/sun/mail/imap/protocol/MailboxInfo;

    move-result-object v2

    .line 1602
    .local v2, "minfo":Lcom/sun/mail/imap/protocol/MailboxInfo;
    invoke-virtual {v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->close()V

    .line 1603
    iget v6, v2, Lcom/sun/mail/imap/protocol/MailboxInfo;->recent:I
    :try_end_21
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_12 .. :try_end_21} :catch_28
    .catchall {:try_start_12 .. :try_end_21} :catchall_33

    .line 1608
    :try_start_21
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/IMAPFolder;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V
    :try_end_24
    .catchall {:try_start_21 .. :try_end_24} :catchall_25

    goto :goto_e

    .line 1587
    .end local v0    # "bex":Lcom/sun/mail/iap/BadCommandException;
    .end local v2    # "minfo":Lcom/sun/mail/imap/protocol/MailboxInfo;
    .end local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catchall_25
    move-exception v6

    monitor-exit p0

    throw v6

    .line 1604
    .restart local v0    # "bex":Lcom/sun/mail/iap/BadCommandException;
    .restart local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catch_28
    move-exception v4

    .line 1606
    .local v4, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_29
    new-instance v6, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6
    :try_end_33
    .catchall {:try_start_29 .. :try_end_33} :catchall_33

    .line 1608
    .end local v4    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :catchall_33
    move-exception v6

    :try_start_34
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/IMAPFolder;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    throw v6

    .line 1610
    .end local v0    # "bex":Lcom/sun/mail/iap/BadCommandException;
    .end local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catch_38
    move-exception v1

    .line 1611
    .local v1, "cex":Lcom/sun/mail/iap/ConnectionException;
    new-instance v6, Lkorex/mail/StoreClosedException;

    iget-object v7, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lkorex/mail/StoreClosedException;-><init>(Lkorex/mail/Store;Ljava/lang/String;)V

    throw v6

    .line 1612
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_45
    move-exception v4

    .line 1613
    .restart local v4    # "pex":Lcom/sun/mail/iap/ProtocolException;
    new-instance v6, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6

    .line 1618
    .end local v4    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :cond_50
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v7
    :try_end_53
    .catchall {:try_start_34 .. :try_end_53} :catchall_25

    .line 1621
    const/4 v6, 0x1

    :try_start_54
    invoke-virtual {p0, v6}, Lcom/sun/mail/imap/IMAPFolder;->keepConnectionAlive(Z)V

    .line 1622
    iget v6, p0, Lcom/sun/mail/imap/IMAPFolder;->recent:I
    :try_end_59
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_54 .. :try_end_59} :catch_5e
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_54 .. :try_end_59} :catch_69
    .catchall {:try_start_54 .. :try_end_59} :catchall_5b

    :try_start_59
    monitor-exit v7

    goto :goto_e

    .line 1628
    :catchall_5b
    move-exception v6

    monitor-exit v7
    :try_end_5d
    .catchall {:try_start_59 .. :try_end_5d} :catchall_5b

    :try_start_5d
    throw v6
    :try_end_5e
    .catchall {:try_start_5d .. :try_end_5e} :catchall_25

    .line 1623
    :catch_5e
    move-exception v1

    .line 1624
    .restart local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_5f
    new-instance v6, Lkorex/mail/FolderClosedException;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, p0, v8}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v6

    .line 1625
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_69
    move-exception v4

    .line 1626
    .restart local v4    # "pex":Lcom/sun/mail/iap/ProtocolException;
    new-instance v6, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6
    :try_end_74
    .catchall {:try_start_5f .. :try_end_74} :catchall_5b
.end method

.method public declared-synchronized getParent()Lkorex/mail/Folder;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 540
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getSeparator()C

    move-result v0

    .line 542
    .local v0, "c":C
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .local v1, "index":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_1f

    .line 543
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v2, Lcom/sun/mail/imap/IMAPStore;

    iget-object v3, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    const/4 v4, 0x0

    .line 544
    invoke-virtual {v3, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 543
    invoke-virtual {v2, v3, v0}, Lcom/sun/mail/imap/IMAPStore;->newIMAPFolder(Ljava/lang/String;C)Lcom/sun/mail/imap/IMAPFolder;
    :try_end_1c
    .catchall {:try_start_1 .. :try_end_1c} :catchall_2a

    move-result-object v2

    .line 546
    :goto_1d
    monitor-exit p0

    return-object v2

    :cond_1f
    :try_start_1f
    new-instance v3, Lcom/sun/mail/imap/DefaultFolder;

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v2, Lcom/sun/mail/imap/IMAPStore;

    invoke-direct {v3, v2}, Lcom/sun/mail/imap/DefaultFolder;-><init>(Lcom/sun/mail/imap/IMAPStore;)V
    :try_end_28
    .catchall {:try_start_1f .. :try_end_28} :catchall_2a

    move-object v2, v3

    goto :goto_1d

    .line 540
    .end local v0    # "c":C
    .end local v1    # "index":I
    :catchall_2a
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized getPermanentFlags()Lkorex/mail/Flags;
    .registers 2

    .prologue
    .line 1529
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->permanentFlags:Lkorex/mail/Flags;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_13

    if-nez v0, :cond_8

    .line 1530
    const/4 v0, 0x0

    .line 1531
    :goto_6
    monitor-exit p0

    return-object v0

    :cond_8
    :try_start_8
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->permanentFlags:Lkorex/mail/Flags;

    invoke-virtual {v0}, Lkorex/mail/Flags;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkorex/mail/Flags;

    check-cast v0, Lkorex/mail/Flags;
    :try_end_12
    .catchall {:try_start_8 .. :try_end_12} :catchall_13

    goto :goto_6

    .line 1529
    :catchall_13
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 3382
    sget-boolean v0, Lcom/sun/mail/imap/IMAPFolder;->$assertionsDisabled:Z

    if-nez v0, :cond_12

    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 3383
    :cond_12
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->waitIfIdle()V

    .line 3384
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    return-object v0
.end method

.method public getQuota()[Lkorex/mail/Quota;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2677
    const-string v0, "QUOTA not supported"

    new-instance v1, Lcom/sun/mail/imap/IMAPFolder$12;

    invoke-direct {v1, p0}, Lcom/sun/mail/imap/IMAPFolder$12;-><init>(Lcom/sun/mail/imap/IMAPFolder;)V

    invoke-virtual {p0, v0, v1}, Lcom/sun/mail/imap/IMAPFolder;->doOptionalCommand(Ljava/lang/String;Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkorex/mail/Quota;

    check-cast v0, [Lkorex/mail/Quota;

    return-object v0
.end method

.method public declared-synchronized getSeparator()C
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 677
    monitor-enter p0

    :try_start_1
    iget-char v2, p0, Lcom/sun/mail/imap/IMAPFolder;->separator:C

    const v3, 0xffff

    if-ne v2, v3, :cond_21

    .line 678
    const/4 v1, 0x0

    .line 680
    .local v1, "li":[Lcom/sun/mail/imap/protocol/ListInfo;
    new-instance v2, Lcom/sun/mail/imap/IMAPFolder$3;

    invoke-direct {v2, p0}, Lcom/sun/mail/imap/IMAPFolder$3;-><init>(Lcom/sun/mail/imap/IMAPFolder;)V

    invoke-virtual {p0, v2}, Lcom/sun/mail/imap/IMAPFolder;->doCommand(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/sun/mail/imap/protocol/ListInfo;

    move-object v0, v2

    check-cast v0, [Lcom/sun/mail/imap/protocol/ListInfo;

    move-object v1, v0

    .line 693
    if-eqz v1, :cond_25

    .line 694
    const/4 v2, 0x0

    aget-object v2, v1, v2

    iget-char v2, v2, Lcom/sun/mail/imap/protocol/ListInfo;->separator:C

    iput-char v2, p0, Lcom/sun/mail/imap/IMAPFolder;->separator:C

    .line 698
    .end local v1    # "li":[Lcom/sun/mail/imap/protocol/ListInfo;
    :cond_21
    :goto_21
    iget-char v2, p0, Lcom/sun/mail/imap/IMAPFolder;->separator:C
    :try_end_23
    .catchall {:try_start_1 .. :try_end_23} :catchall_2a

    monitor-exit p0

    return v2

    .line 696
    .restart local v1    # "li":[Lcom/sun/mail/imap/protocol/ListInfo;
    :cond_25
    const/16 v2, 0x2f

    :try_start_27
    iput-char v2, p0, Lcom/sun/mail/imap/IMAPFolder;->separator:C
    :try_end_29
    .catchall {:try_start_27 .. :try_end_29} :catchall_2a

    goto :goto_21

    .line 677
    .end local v1    # "li":[Lcom/sun/mail/imap/protocol/ListInfo;
    :catchall_2a
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized getSortedMessages([Lcom/sun/mail/imap/SortTerm;)[Lkorex/mail/Message;
    .registers 3
    .param p1, "term"    # [Lcom/sun/mail/imap/SortTerm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2236
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    invoke-virtual {p0, p1, v0}, Lcom/sun/mail/imap/IMAPFolder;->getSortedMessages([Lcom/sun/mail/imap/SortTerm;Lkorex/mail/search/SearchTerm;)[Lkorex/mail/Message;
    :try_end_5
    .catchall {:try_start_2 .. :try_end_5} :catchall_8

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getSortedMessages([Lcom/sun/mail/imap/SortTerm;Lkorex/mail/search/SearchTerm;)[Lkorex/mail/Message;
    .registers 12
    .param p1, "term"    # [Lcom/sun/mail/imap/SortTerm;
    .param p2, "sterm"    # Lkorex/mail/search/SearchTerm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2256
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkOpened()V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_35

    .line 2259
    const/4 v3, 0x0

    .line 2261
    .local v3, "matchMsgs":[Lkorex/mail/Message;
    :try_start_5
    iget-object v8, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v8
    :try_end_8
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_5 .. :try_end_8} :catch_2a
    .catch Lkorex/mail/search/SearchException; {:try_start_5 .. :try_end_8} :catch_38
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_5 .. :try_end_8} :catch_43
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_5 .. :try_end_8} :catch_4e
    .catchall {:try_start_5 .. :try_end_8} :catchall_35

    .line 2262
    :try_start_8
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v7

    invoke-virtual {v7, p1, p2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->sort([Lcom/sun/mail/imap/SortTerm;Lkorex/mail/search/SearchTerm;)[I

    move-result-object v4

    .line 2263
    .local v4, "matches":[I
    if-eqz v4, :cond_24

    .line 2264
    array-length v7, v4

    new-array v3, v7, [Lcom/sun/mail/imap/IMAPMessage;

    .line 2266
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_16
    array-length v7, v4

    if-ge v2, v7, :cond_24

    .line 2267
    aget v7, v4, v2

    invoke-virtual {p0, v7}, Lcom/sun/mail/imap/IMAPFolder;->getMessageBySeqNumber(I)Lcom/sun/mail/imap/IMAPMessage;

    move-result-object v7

    aput-object v7, v3, v2

    .line 2266
    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    .line 2269
    .end local v2    # "i":I
    :cond_24
    monitor-exit v8
    :try_end_25
    .catchall {:try_start_8 .. :try_end_25} :catchall_27

    .line 2270
    monitor-exit p0

    return-object v3

    .line 2269
    .end local v4    # "matches":[I
    :catchall_27
    move-exception v7

    :try_start_28
    monitor-exit v8
    :try_end_29
    .catchall {:try_start_28 .. :try_end_29} :catchall_27

    :try_start_29
    throw v7
    :try_end_2a
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_29 .. :try_end_2a} :catch_2a
    .catch Lkorex/mail/search/SearchException; {:try_start_29 .. :try_end_2a} :catch_38
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_29 .. :try_end_2a} :catch_43
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_29 .. :try_end_2a} :catch_4e
    .catchall {:try_start_29 .. :try_end_2a} :catchall_35

    .line 2272
    :catch_2a
    move-exception v1

    .line 2274
    .local v1, "cfx":Lcom/sun/mail/iap/CommandFailedException;
    :try_start_2b
    new-instance v7, Lkorex/mail/MessagingException;

    invoke-virtual {v1}, Lcom/sun/mail/iap/CommandFailedException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v7
    :try_end_35
    .catchall {:try_start_2b .. :try_end_35} :catchall_35

    .line 2256
    .end local v1    # "cfx":Lcom/sun/mail/iap/CommandFailedException;
    .end local v3    # "matchMsgs":[Lkorex/mail/Message;
    :catchall_35
    move-exception v7

    monitor-exit p0

    throw v7

    .line 2275
    .restart local v3    # "matchMsgs":[Lkorex/mail/Message;
    :catch_38
    move-exception v6

    .line 2277
    .local v6, "sex":Lkorex/mail/search/SearchException;
    :try_start_39
    new-instance v7, Lkorex/mail/MessagingException;

    invoke-virtual {v6}, Lkorex/mail/search/SearchException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v6}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v7

    .line 2278
    .end local v6    # "sex":Lkorex/mail/search/SearchException;
    :catch_43
    move-exception v0

    .line 2279
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    new-instance v7, Lkorex/mail/FolderClosedException;

    invoke-virtual {v0}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, p0, v8}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v7

    .line 2280
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_4e
    move-exception v5

    .line 2282
    .local v5, "pex":Lcom/sun/mail/iap/ProtocolException;
    new-instance v7, Lkorex/mail/MessagingException;

    invoke-virtual {v5}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v5}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v7
    :try_end_59
    .catchall {:try_start_39 .. :try_end_59} :catchall_35
.end method

.method public getStatusItem(Ljava/lang/String;)J
    .registers 11
    .param p1, "item"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, -0x1

    .line 3106
    iget-boolean v8, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    if-nez v8, :cond_22

    .line 3107
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkExists()V

    .line 3109
    const/4 v3, 0x0

    .line 3110
    .local v3, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    const/4 v5, 0x0

    .line 3112
    .local v5, "status":Lcom/sun/mail/imap/protocol/Status;
    :try_start_b
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v3

    .line 3113
    const/4 v8, 0x1

    new-array v2, v8, [Ljava/lang/String;

    const/4 v8, 0x0

    aput-object p1, v2, v8

    .line 3114
    .local v2, "items":[Ljava/lang/String;
    iget-object v8, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v3, v8, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->status(Ljava/lang/String;[Ljava/lang/String;)Lcom/sun/mail/imap/protocol/Status;

    move-result-object v5

    .line 3115
    invoke-virtual {v5, p1}, Lcom/sun/mail/imap/protocol/Status;->getItem(Ljava/lang/String;)J
    :try_end_1e
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_b .. :try_end_1e} :catch_23
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_b .. :try_end_1e} :catch_28
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_b .. :try_end_1e} :catch_3a
    .catchall {:try_start_b .. :try_end_1e} :catchall_35

    move-result-wide v6

    .line 3126
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/IMAPFolder;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    .line 3129
    .end local v2    # "items":[Ljava/lang/String;
    .end local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v5    # "status":Lcom/sun/mail/imap/protocol/Status;
    :cond_22
    :goto_22
    return-wide v6

    .line 3116
    .restart local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .restart local v5    # "status":Lcom/sun/mail/imap/protocol/Status;
    :catch_23
    move-exception v0

    .line 3126
    .local v0, "bex":Lcom/sun/mail/iap/BadCommandException;
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/IMAPFolder;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    goto :goto_22

    .line 3121
    .end local v0    # "bex":Lcom/sun/mail/iap/BadCommandException;
    :catch_28
    move-exception v1

    .line 3122
    .local v1, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_29
    new-instance v6, Lkorex/mail/StoreClosedException;

    iget-object v7, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lkorex/mail/StoreClosedException;-><init>(Lkorex/mail/Store;Ljava/lang/String;)V

    throw v6
    :try_end_35
    .catchall {:try_start_29 .. :try_end_35} :catchall_35

    .line 3126
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_35
    move-exception v6

    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/IMAPFolder;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    throw v6

    .line 3123
    :catch_3a
    move-exception v4

    .line 3124
    .local v4, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_3b
    new-instance v6, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6
    :try_end_45
    .catchall {:try_start_3b .. :try_end_45} :catchall_35
.end method

.method protected declared-synchronized getStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 3345
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->connectionPoolLogger:Lcom/sun/mail/util/MailLogger;

    const-string v1, "getStoreProtocol() borrowing a connection"

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 3346
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v0, Lcom/sun/mail/imap/IMAPStore;

    invoke-virtual {v0}, Lcom/sun/mail/imap/IMAPStore;->getFolderStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_12

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 3345
    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getType()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 705
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    if-eqz v0, :cond_10

    .line 707
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->attributes:[Ljava/lang/String;

    if-nez v0, :cond_c

    .line 708
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->exists()Z

    .line 712
    :cond_c
    :goto_c
    iget v0, p0, Lcom/sun/mail/imap/IMAPFolder;->type:I
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_14

    monitor-exit p0

    return v0

    .line 710
    :cond_10
    :try_start_10
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkExists()V
    :try_end_13
    .catchall {:try_start_10 .. :try_end_13} :catchall_14

    goto :goto_c

    .line 705
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getUID(Lkorex/mail/Message;)J
    .registers 15
    .param p1, "message"    # Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2521
    monitor-enter p0

    :try_start_1
    invoke-virtual {p1}, Lkorex/mail/Message;->getFolder()Lkorex/mail/Folder;

    move-result-object v10

    if-eq v10, p0, :cond_12

    .line 2522
    new-instance v10, Ljava/util/NoSuchElementException;

    const-string v11, "Message does not belong to this folder"

    invoke-direct {v10, v11}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_f

    .line 2521
    :catchall_f
    move-exception v10

    monitor-exit p0

    throw v10

    .line 2525
    :cond_12
    :try_start_12
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkOpened()V

    .line 2527
    instance-of v10, p1, Lcom/sun/mail/imap/IMAPMessage;

    if-nez v10, :cond_21

    .line 2528
    new-instance v10, Lkorex/mail/MessagingException;

    const-string v11, "message is not an IMAPMessage"

    invoke-direct {v10, v11}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 2529
    :cond_21
    move-object v0, p1

    check-cast v0, Lcom/sun/mail/imap/IMAPMessage;

    move-object v2, v0

    .line 2532
    .local v2, "m":Lcom/sun/mail/imap/IMAPMessage;
    invoke-virtual {v2}, Lcom/sun/mail/imap/IMAPMessage;->getUID()J
    :try_end_28
    .catchall {:try_start_12 .. :try_end_28} :catchall_f

    move-result-wide v6

    .local v6, "uid":J
    const-wide/16 v10, -0x1

    cmp-long v10, v6, v10

    if-eqz v10, :cond_32

    move-wide v8, v6

    .line 2557
    .end local v6    # "uid":J
    .local v8, "uid":J
    :goto_30
    monitor-exit p0

    return-wide v8

    .line 2535
    .end local v8    # "uid":J
    .restart local v6    # "uid":J
    :cond_32
    :try_start_32
    iget-object v11, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v11
    :try_end_35
    .catchall {:try_start_32 .. :try_end_35} :catchall_f

    .line 2537
    :try_start_35
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v3

    .line 2538
    .local v3, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    invoke-virtual {v2}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 2539
    invoke-virtual {v2}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v10

    invoke-virtual {v3, v10}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchUID(I)Lcom/sun/mail/imap/protocol/UID;

    move-result-object v5

    .line 2541
    .local v5, "u":Lcom/sun/mail/imap/protocol/UID;
    if-eqz v5, :cond_5f

    .line 2542
    iget-wide v6, v5, Lcom/sun/mail/imap/protocol/UID;->uid:J

    .line 2543
    invoke-virtual {v2, v6, v7}, Lcom/sun/mail/imap/IMAPMessage;->setUID(J)V

    .line 2546
    iget-object v10, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    if-nez v10, :cond_56

    .line 2547
    new-instance v10, Ljava/util/Hashtable;

    invoke-direct {v10}, Ljava/util/Hashtable;-><init>()V

    iput-object v10, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    .line 2548
    :cond_56
    iget-object v10, p0, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    invoke-virtual {v10, v12, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5f
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_35 .. :try_end_5f} :catch_62
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_35 .. :try_end_5f} :catch_70
    .catchall {:try_start_35 .. :try_end_5f} :catchall_6d

    .line 2555
    :cond_5f
    :try_start_5f
    monitor-exit v11

    move-wide v8, v6

    .line 2557
    .end local v6    # "uid":J
    .restart local v8    # "uid":J
    goto :goto_30

    .line 2550
    .end local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v5    # "u":Lcom/sun/mail/imap/protocol/UID;
    .end local v8    # "uid":J
    .restart local v6    # "uid":J
    :catch_62
    move-exception v1

    .line 2551
    .local v1, "cex":Lcom/sun/mail/iap/ConnectionException;
    new-instance v10, Lkorex/mail/FolderClosedException;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, p0, v12}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v10

    .line 2555
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_6d
    move-exception v10

    monitor-exit v11
    :try_end_6f
    .catchall {:try_start_5f .. :try_end_6f} :catchall_6d

    :try_start_6f
    throw v10
    :try_end_70
    .catchall {:try_start_6f .. :try_end_70} :catchall_f

    .line 2552
    :catch_70
    move-exception v4

    .line 2553
    .local v4, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_71
    new-instance v10, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v12, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v10
    :try_end_7b
    .catchall {:try_start_71 .. :try_end_7b} :catchall_6d
.end method

.method public declared-synchronized getUIDNext()J
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2351
    monitor-enter p0

    :try_start_1
    iget-boolean v6, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    if-eqz v6, :cond_9

    .line 2352
    iget-wide v6, p0, Lcom/sun/mail/imap/IMAPFolder;->uidnext:J
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_31

    .line 2373
    :goto_7
    monitor-exit p0

    return-wide v6

    .line 2354
    :cond_9
    const/4 v3, 0x0

    .line 2355
    .local v3, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    const/4 v5, 0x0

    .line 2358
    .local v5, "status":Lcom/sun/mail/imap/protocol/Status;
    :try_start_b
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v3

    .line 2359
    const/4 v6, 0x1

    new-array v2, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "UIDNEXT"

    aput-object v7, v2, v6

    .line 2360
    .local v2, "item":[Ljava/lang/String;
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v3, v6, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->status(Ljava/lang/String;[Ljava/lang/String;)Lcom/sun/mail/imap/protocol/Status;
    :try_end_1c
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_b .. :try_end_1c} :catch_23
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_b .. :try_end_1c} :catch_34
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_b .. :try_end_1c} :catch_3c
    .catchall {:try_start_b .. :try_end_1c} :catchall_2c

    move-result-object v5

    .line 2370
    :try_start_1d
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/IMAPFolder;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    .line 2373
    .end local v2    # "item":[Ljava/lang/String;
    :goto_20
    iget-wide v6, v5, Lcom/sun/mail/imap/protocol/Status;->uidnext:J
    :try_end_22
    .catchall {:try_start_1d .. :try_end_22} :catchall_31

    goto :goto_7

    .line 2361
    :catch_23
    move-exception v0

    .line 2363
    .local v0, "bex":Lcom/sun/mail/iap/BadCommandException;
    :try_start_24
    new-instance v6, Lkorex/mail/MessagingException;

    const-string v7, "Cannot obtain UIDNext"

    invoke-direct {v6, v7, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6
    :try_end_2c
    .catchall {:try_start_24 .. :try_end_2c} :catchall_2c

    .line 2370
    .end local v0    # "bex":Lcom/sun/mail/iap/BadCommandException;
    :catchall_2c
    move-exception v6

    :try_start_2d
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/IMAPFolder;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    throw v6
    :try_end_31
    .catchall {:try_start_2d .. :try_end_31} :catchall_31

    .line 2351
    .end local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v5    # "status":Lcom/sun/mail/imap/protocol/Status;
    :catchall_31
    move-exception v6

    monitor-exit p0

    throw v6

    .line 2364
    .restart local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .restart local v5    # "status":Lcom/sun/mail/imap/protocol/Status;
    :catch_34
    move-exception v1

    .line 2366
    .local v1, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_35
    invoke-virtual {p0, v1}, Lcom/sun/mail/imap/IMAPFolder;->throwClosedException(Lcom/sun/mail/iap/ConnectionException;)V
    :try_end_38
    .catchall {:try_start_35 .. :try_end_38} :catchall_2c

    .line 2370
    :try_start_38
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/IMAPFolder;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V
    :try_end_3b
    .catchall {:try_start_38 .. :try_end_3b} :catchall_31

    goto :goto_20

    .line 2367
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_3c
    move-exception v4

    .line 2368
    .local v4, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_3d
    new-instance v6, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6
    :try_end_47
    .catchall {:try_start_3d .. :try_end_47} :catchall_2c
.end method

.method public declared-synchronized getUIDValidity()J
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2306
    monitor-enter p0

    :try_start_1
    iget-boolean v6, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    if-eqz v6, :cond_9

    .line 2307
    iget-wide v6, p0, Lcom/sun/mail/imap/IMAPFolder;->uidvalidity:J
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_31

    .line 2328
    :goto_7
    monitor-exit p0

    return-wide v6

    .line 2309
    :cond_9
    const/4 v3, 0x0

    .line 2310
    .local v3, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    const/4 v5, 0x0

    .line 2313
    .local v5, "status":Lcom/sun/mail/imap/protocol/Status;
    :try_start_b
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v3

    .line 2314
    const/4 v6, 0x1

    new-array v2, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "UIDVALIDITY"

    aput-object v7, v2, v6

    .line 2315
    .local v2, "item":[Ljava/lang/String;
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v3, v6, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->status(Ljava/lang/String;[Ljava/lang/String;)Lcom/sun/mail/imap/protocol/Status;
    :try_end_1c
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_b .. :try_end_1c} :catch_23
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_b .. :try_end_1c} :catch_34
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_b .. :try_end_1c} :catch_3c
    .catchall {:try_start_b .. :try_end_1c} :catchall_2c

    move-result-object v5

    .line 2325
    :try_start_1d
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/IMAPFolder;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    .line 2328
    .end local v2    # "item":[Ljava/lang/String;
    :goto_20
    iget-wide v6, v5, Lcom/sun/mail/imap/protocol/Status;->uidvalidity:J
    :try_end_22
    .catchall {:try_start_1d .. :try_end_22} :catchall_31

    goto :goto_7

    .line 2316
    :catch_23
    move-exception v0

    .line 2318
    .local v0, "bex":Lcom/sun/mail/iap/BadCommandException;
    :try_start_24
    new-instance v6, Lkorex/mail/MessagingException;

    const-string v7, "Cannot obtain UIDValidity"

    invoke-direct {v6, v7, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6
    :try_end_2c
    .catchall {:try_start_24 .. :try_end_2c} :catchall_2c

    .line 2325
    .end local v0    # "bex":Lcom/sun/mail/iap/BadCommandException;
    :catchall_2c
    move-exception v6

    :try_start_2d
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/IMAPFolder;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    throw v6
    :try_end_31
    .catchall {:try_start_2d .. :try_end_31} :catchall_31

    .line 2306
    .end local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v5    # "status":Lcom/sun/mail/imap/protocol/Status;
    :catchall_31
    move-exception v6

    monitor-exit p0

    throw v6

    .line 2319
    .restart local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .restart local v5    # "status":Lcom/sun/mail/imap/protocol/Status;
    :catch_34
    move-exception v1

    .line 2321
    .local v1, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_35
    invoke-virtual {p0, v1}, Lcom/sun/mail/imap/IMAPFolder;->throwClosedException(Lcom/sun/mail/iap/ConnectionException;)V
    :try_end_38
    .catchall {:try_start_35 .. :try_end_38} :catchall_2c

    .line 2325
    :try_start_38
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/IMAPFolder;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V
    :try_end_3b
    .catchall {:try_start_38 .. :try_end_3b} :catchall_31

    goto :goto_20

    .line 2322
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_3c
    move-exception v4

    .line 2323
    .local v4, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_3d
    new-instance v6, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6
    :try_end_47
    .catchall {:try_start_3d .. :try_end_47} :catchall_2c
.end method

.method public declared-synchronized getUnreadMessageCount()I
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1636
    monitor-enter p0

    :try_start_1
    iget-boolean v6, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    if-nez v6, :cond_2e

    .line 1637
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkExists()V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_20

    .line 1641
    :try_start_8
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPFolder;->getStatus()Lcom/sun/mail/imap/protocol/Status;

    move-result-object v5

    .line 1642
    .local v5, "status":Lcom/sun/mail/imap/protocol/Status;
    iget v6, v5, Lcom/sun/mail/imap/protocol/Status;->unseen:I
    :try_end_e
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_8 .. :try_end_e} :catch_10
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_8 .. :try_end_e} :catch_13
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_8 .. :try_end_e} :catch_23
    .catchall {:try_start_8 .. :try_end_e} :catchall_20

    .line 1662
    .end local v5    # "status":Lcom/sun/mail/imap/protocol/Status;
    :goto_e
    monitor-exit p0

    return v6

    .line 1643
    :catch_10
    move-exception v0

    .line 1647
    .local v0, "bex":Lcom/sun/mail/iap/BadCommandException;
    const/4 v6, -0x1

    goto :goto_e

    .line 1648
    .end local v0    # "bex":Lcom/sun/mail/iap/BadCommandException;
    :catch_13
    move-exception v1

    .line 1649
    .local v1, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_14
    new-instance v6, Lkorex/mail/StoreClosedException;

    iget-object v7, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lkorex/mail/StoreClosedException;-><init>(Lkorex/mail/Store;Ljava/lang/String;)V

    throw v6
    :try_end_20
    .catchall {:try_start_14 .. :try_end_20} :catchall_20

    .line 1636
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_20
    move-exception v6

    monitor-exit p0

    throw v6

    .line 1650
    :catch_23
    move-exception v4

    .line 1651
    .local v4, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_24
    new-instance v6, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6

    .line 1657
    .end local v4    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :cond_2e
    new-instance v2, Lkorex/mail/Flags;

    invoke-direct {v2}, Lkorex/mail/Flags;-><init>()V

    .line 1658
    .local v2, "f":Lkorex/mail/Flags;
    sget-object v6, Lkorex/mail/Flags$Flag;->SEEN:Lkorex/mail/Flags$Flag;

    invoke-virtual {v2, v6}, Lkorex/mail/Flags;->add(Lkorex/mail/Flags$Flag;)V
    :try_end_38
    .catchall {:try_start_24 .. :try_end_38} :catchall_20

    .line 1660
    :try_start_38
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v7
    :try_end_3b
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_38 .. :try_end_3b} :catch_4f
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_38 .. :try_end_3b} :catch_5a
    .catchall {:try_start_38 .. :try_end_3b} :catchall_20

    .line 1661
    :try_start_3b
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v6

    new-instance v8, Lkorex/mail/search/FlagTerm;

    const/4 v9, 0x0

    invoke-direct {v8, v2, v9}, Lkorex/mail/search/FlagTerm;-><init>(Lkorex/mail/Flags;Z)V

    invoke-virtual {v6, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->search(Lkorex/mail/search/SearchTerm;)[I

    move-result-object v3

    .line 1662
    .local v3, "matches":[I
    array-length v6, v3

    monitor-exit v7

    goto :goto_e

    .line 1663
    .end local v3    # "matches":[I
    :catchall_4c
    move-exception v6

    monitor-exit v7
    :try_end_4e
    .catchall {:try_start_3b .. :try_end_4e} :catchall_4c

    :try_start_4e
    throw v6
    :try_end_4f
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_4e .. :try_end_4f} :catch_4f
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_4e .. :try_end_4f} :catch_5a
    .catchall {:try_start_4e .. :try_end_4f} :catchall_20

    .line 1664
    :catch_4f
    move-exception v1

    .line 1665
    .restart local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_50
    new-instance v6, Lkorex/mail/FolderClosedException;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, p0, v7}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v6

    .line 1666
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_5a
    move-exception v4

    .line 1668
    .restart local v4    # "pex":Lcom/sun/mail/iap/ProtocolException;
    new-instance v6, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6
    :try_end_65
    .catchall {:try_start_50 .. :try_end_65} :catchall_20
.end method

.method handleIdle(Z)Z
    .registers 9
    .param p1, "once"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 2997
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->readIdleResponse()Lcom/sun/mail/iap/Response;

    move-result-object v2

    .line 2999
    .local v2, "r":Lcom/sun/mail/iap/Response;
    :try_start_8
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v5
    :try_end_b
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_8 .. :try_end_b} :catch_30
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_8 .. :try_end_b} :catch_46

    .line 3001
    if-eqz v2, :cond_19

    :try_start_d
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    if-eqz v6, :cond_19

    iget-object v6, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    .line 3002
    invoke-virtual {v6, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->processIdleResponse(Lcom/sun/mail/iap/Response;)Z

    move-result v6

    if-nez v6, :cond_36

    .line 3003
    :cond_19
    const/4 v6, 0x0

    iput v6, p0, Lcom/sun/mail/imap/IMAPFolder;->idleState:I

    .line 3004
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    invoke-virtual {v6}, Ljava/lang/Object;->notifyAll()V
    :try_end_21
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_d .. :try_end_21} :catch_23
    .catchall {:try_start_d .. :try_end_21} :catchall_2d

    .line 3005
    :try_start_21
    monitor-exit v5

    .line 3025
    :goto_22
    return v3

    .line 3007
    :catch_23
    move-exception v1

    .line 3008
    .local v1, "pex":Lcom/sun/mail/iap/ProtocolException;
    const/4 v3, 0x0

    iput v3, p0, Lcom/sun/mail/imap/IMAPFolder;->idleState:I

    .line 3009
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 3010
    throw v1

    .line 3018
    .end local v1    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :catchall_2d
    move-exception v3

    monitor-exit v5
    :try_end_2f
    .catchall {:try_start_21 .. :try_end_2f} :catchall_2d

    :try_start_2f
    throw v3
    :try_end_30
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_2f .. :try_end_30} :catch_30
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_2f .. :try_end_30} :catch_46

    .line 3019
    :catch_30
    move-exception v0

    .line 3021
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/IMAPFolder;->throwClosedException(Lcom/sun/mail/iap/ConnectionException;)V

    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :goto_34
    move v3, v4

    .line 3025
    goto :goto_22

    .line 3012
    :cond_36
    if-eqz p1, :cond_44

    .line 3013
    :try_start_38
    iget v3, p0, Lcom/sun/mail/imap/IMAPFolder;->idleState:I

    if-ne v3, v4, :cond_44

    .line 3014
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->idleAbort()V

    .line 3015
    const/4 v3, 0x2

    iput v3, p0, Lcom/sun/mail/imap/IMAPFolder;->idleState:I

    .line 3018
    :cond_44
    monitor-exit v5
    :try_end_45
    .catchall {:try_start_38 .. :try_end_45} :catchall_2d

    goto :goto_34

    .line 3022
    :catch_46
    move-exception v1

    .line 3023
    .restart local v1    # "pex":Lcom/sun/mail/iap/ProtocolException;
    new-instance v3, Lkorex/mail/MessagingException;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3
.end method

.method public handleResponse(Lcom/sun/mail/iap/Response;)V
    .registers 20
    .param p1, "r"    # Lcom/sun/mail/iap/Response;

    .prologue
    .line 3145
    sget-boolean v14, Lcom/sun/mail/imap/IMAPFolder;->$assertionsDisabled:Z

    if-nez v14, :cond_14

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    invoke-static {v14}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_14

    new-instance v14, Ljava/lang/AssertionError;

    invoke-direct {v14}, Ljava/lang/AssertionError;-><init>()V

    throw v14

    .line 3150
    :cond_14
    invoke-virtual/range {p1 .. p1}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v14

    if-nez v14, :cond_2c

    invoke-virtual/range {p1 .. p1}, Lcom/sun/mail/iap/Response;->isNO()Z

    move-result v14

    if-nez v14, :cond_2c

    invoke-virtual/range {p1 .. p1}, Lcom/sun/mail/iap/Response;->isBAD()Z

    move-result v14

    if-nez v14, :cond_2c

    invoke-virtual/range {p1 .. p1}, Lcom/sun/mail/iap/Response;->isBYE()Z

    move-result v14

    if-eqz v14, :cond_37

    .line 3151
    :cond_2c
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v14, Lcom/sun/mail/imap/IMAPStore;

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Lcom/sun/mail/imap/IMAPStore;->handleResponseCode(Lcom/sun/mail/iap/Response;)V

    .line 3157
    :cond_37
    invoke-virtual/range {p1 .. p1}, Lcom/sun/mail/iap/Response;->isBYE()Z

    move-result v14

    if-eqz v14, :cond_4a

    .line 3158
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    if-eqz v14, :cond_49

    .line 3159
    const/4 v14, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/sun/mail/imap/IMAPFolder;->cleanup(Z)V

    .line 3262
    :cond_49
    :goto_49
    return-void

    .line 3161
    :cond_4a
    invoke-virtual/range {p1 .. p1}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v14

    if-eqz v14, :cond_73

    .line 3163
    invoke-virtual/range {p1 .. p1}, Lcom/sun/mail/iap/Response;->skipSpaces()V

    .line 3164
    invoke-virtual/range {p1 .. p1}, Lcom/sun/mail/iap/Response;->readByte()B

    move-result v14

    const/16 v15, 0x5b

    if-ne v14, v15, :cond_6f

    .line 3165
    invoke-virtual/range {p1 .. p1}, Lcom/sun/mail/iap/Response;->readAtom()Ljava/lang/String;

    move-result-object v10

    .line 3166
    .local v10, "s":Ljava/lang/String;
    const-string v14, "HIGHESTMODSEQ"

    invoke-virtual {v10, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_6f

    .line 3167
    invoke-virtual/range {p1 .. p1}, Lcom/sun/mail/iap/Response;->readLong()J

    move-result-wide v14

    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/sun/mail/imap/IMAPFolder;->highestmodseq:J

    .line 3169
    .end local v10    # "s":Ljava/lang/String;
    :cond_6f
    invoke-virtual/range {p1 .. p1}, Lcom/sun/mail/iap/Response;->reset()V

    goto :goto_49

    .line 3171
    :cond_73
    invoke-virtual/range {p1 .. p1}, Lcom/sun/mail/iap/Response;->isUnTagged()Z

    move-result v14

    if-eqz v14, :cond_49

    .line 3176
    move-object/from16 v0, p1

    instance-of v14, v0, Lcom/sun/mail/imap/protocol/IMAPResponse;

    if-nez v14, :cond_9e

    .line 3179
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/sun/mail/imap/IMAPFolder;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "UNEXPECTED RESPONSE : "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual/range {p1 .. p1}, Lcom/sun/mail/iap/Response;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    goto :goto_49

    :cond_9e
    move-object/from16 v4, p1

    .line 3183
    check-cast v4, Lcom/sun/mail/imap/protocol/IMAPResponse;

    .line 3185
    .local v4, "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    const-string v14, "EXISTS"

    invoke-virtual {v4, v14}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_fe

    .line 3186
    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/IMAPResponse;->getNumber()I

    move-result v2

    .line 3187
    .local v2, "exists":I
    move-object/from16 v0, p0

    iget v14, v0, Lcom/sun/mail/imap/IMAPFolder;->realTotal:I

    if-le v2, v14, :cond_49

    .line 3191
    move-object/from16 v0, p0

    iget v14, v0, Lcom/sun/mail/imap/IMAPFolder;->realTotal:I

    sub-int v1, v2, v14

    .line 3192
    .local v1, "count":I
    new-array v8, v1, [Lkorex/mail/Message;

    .line 3195
    .local v8, "msgs":[Lkorex/mail/Message;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/sun/mail/imap/IMAPFolder;->messageCache:Lcom/sun/mail/imap/MessageCache;

    move-object/from16 v0, p0

    iget v15, v0, Lcom/sun/mail/imap/IMAPFolder;->realTotal:I

    add-int/lit8 v15, v15, 0x1

    invoke-virtual {v14, v1, v15}, Lcom/sun/mail/imap/MessageCache;->addMessages(II)V

    .line 3196
    move-object/from16 v0, p0

    iget v9, v0, Lcom/sun/mail/imap/IMAPFolder;->total:I

    .line 3197
    .local v9, "oldtotal":I
    move-object/from16 v0, p0

    iget v14, v0, Lcom/sun/mail/imap/IMAPFolder;->realTotal:I

    add-int/2addr v14, v1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/sun/mail/imap/IMAPFolder;->realTotal:I

    .line 3198
    move-object/from16 v0, p0

    iget v14, v0, Lcom/sun/mail/imap/IMAPFolder;->total:I

    add-int/2addr v14, v1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/sun/mail/imap/IMAPFolder;->total:I

    .line 3201
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/sun/mail/imap/IMAPFolder;->hasMessageCountListener:Z

    if-eqz v14, :cond_49

    .line 3202
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_e6
    if-ge v3, v1, :cond_f7

    .line 3203
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/sun/mail/imap/IMAPFolder;->messageCache:Lcom/sun/mail/imap/MessageCache;

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v14, v9}, Lcom/sun/mail/imap/MessageCache;->getMessage(I)Lcom/sun/mail/imap/IMAPMessage;

    move-result-object v14

    aput-object v14, v8, v3

    .line 3202
    add-int/lit8 v3, v3, 0x1

    goto :goto_e6

    .line 3206
    :cond_f7
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/sun/mail/imap/IMAPFolder;->notifyMessageAddedListeners([Lkorex/mail/Message;)V

    goto/16 :goto_49

    .line 3209
    .end local v1    # "count":I
    .end local v2    # "exists":I
    .end local v3    # "i":I
    .end local v8    # "msgs":[Lkorex/mail/Message;
    .end local v9    # "oldtotal":I
    :cond_fe
    const-string v14, "EXPUNGE"

    invoke-virtual {v4, v14}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_13e

    .line 3212
    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/IMAPResponse;->getNumber()I

    move-result v11

    .line 3213
    .local v11, "seqnum":I
    const/4 v8, 0x0

    .line 3214
    .restart local v8    # "msgs":[Lkorex/mail/Message;
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/sun/mail/imap/IMAPFolder;->doExpungeNotification:Z

    if-eqz v14, :cond_123

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/sun/mail/imap/IMAPFolder;->hasMessageCountListener:Z

    if-eqz v14, :cond_123

    .line 3217
    const/4 v14, 0x1

    new-array v8, v14, [Lkorex/mail/Message;

    .end local v8    # "msgs":[Lkorex/mail/Message;
    const/4 v14, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/sun/mail/imap/IMAPFolder;->getMessageBySeqNumber(I)Lcom/sun/mail/imap/IMAPMessage;

    move-result-object v15

    aput-object v15, v8, v14

    .line 3220
    .restart local v8    # "msgs":[Lkorex/mail/Message;
    :cond_123
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/sun/mail/imap/IMAPFolder;->messageCache:Lcom/sun/mail/imap/MessageCache;

    invoke-virtual {v14, v11}, Lcom/sun/mail/imap/MessageCache;->expungeMessage(I)V

    .line 3223
    move-object/from16 v0, p0

    iget v14, v0, Lcom/sun/mail/imap/IMAPFolder;->realTotal:I

    add-int/lit8 v14, v14, -0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/sun/mail/imap/IMAPFolder;->realTotal:I

    .line 3225
    if-eqz v8, :cond_49

    .line 3226
    const/4 v14, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v8}, Lcom/sun/mail/imap/IMAPFolder;->notifyMessageRemovedListeners(Z[Lkorex/mail/Message;)V

    goto/16 :goto_49

    .line 3228
    .end local v8    # "msgs":[Lkorex/mail/Message;
    .end local v11    # "seqnum":I
    :cond_13e
    const-string v14, "VANISHED"

    invoke-virtual {v4, v14}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_19e

    .line 3234
    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readAtomStringList()[Ljava/lang/String;

    move-result-object v10

    .line 3235
    .local v10, "s":[Ljava/lang/String;
    if-nez v10, :cond_49

    .line 3236
    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readAtom()Ljava/lang/String;

    move-result-object v12

    .line 3237
    .local v12, "uids":Ljava/lang/String;
    invoke-static {v12}, Lcom/sun/mail/imap/protocol/UIDSet;->parseUIDSets(Ljava/lang/String;)[Lcom/sun/mail/imap/protocol/UIDSet;

    move-result-object v13

    .line 3239
    .local v13, "uidset":[Lcom/sun/mail/imap/protocol/UIDSet;
    move-object/from16 v0, p0

    iget v14, v0, Lcom/sun/mail/imap/IMAPFolder;->realTotal:I

    int-to-long v14, v14

    invoke-static {v13}, Lcom/sun/mail/imap/protocol/UIDSet;->size([Lcom/sun/mail/imap/protocol/UIDSet;)J

    move-result-wide v16

    sub-long v14, v14, v16

    long-to-int v14, v14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/sun/mail/imap/IMAPFolder;->realTotal:I

    .line 3240
    invoke-static {v13}, Lcom/sun/mail/imap/protocol/UIDSet;->toArray([Lcom/sun/mail/imap/protocol/UIDSet;)[J

    move-result-object v5

    .line 3241
    .local v5, "luid":[J
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/sun/mail/imap/IMAPFolder;->createMessagesForUIDs([J)[Lkorex/mail/Message;

    move-result-object v8

    .line 3242
    .restart local v8    # "msgs":[Lkorex/mail/Message;
    array-length v15, v8

    const/4 v14, 0x0

    :goto_170
    if-ge v14, v15, :cond_18a

    aget-object v6, v8, v14

    .line 3243
    .local v6, "m":Lkorex/mail/Message;
    invoke-virtual {v6}, Lkorex/mail/Message;->getMessageNumber()I

    move-result v16

    if-lez v16, :cond_187

    .line 3244
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/imap/IMAPFolder;->messageCache:Lcom/sun/mail/imap/MessageCache;

    move-object/from16 v16, v0

    invoke-virtual {v6}, Lkorex/mail/Message;->getMessageNumber()I

    move-result v17

    invoke-virtual/range {v16 .. v17}, Lcom/sun/mail/imap/MessageCache;->expungeMessage(I)V

    .line 3242
    :cond_187
    add-int/lit8 v14, v14, 0x1

    goto :goto_170

    .line 3246
    .end local v6    # "m":Lkorex/mail/Message;
    :cond_18a
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/sun/mail/imap/IMAPFolder;->doExpungeNotification:Z

    if-eqz v14, :cond_49

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/sun/mail/imap/IMAPFolder;->hasMessageCountListener:Z

    if-eqz v14, :cond_49

    .line 3247
    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v8}, Lcom/sun/mail/imap/IMAPFolder;->notifyMessageRemovedListeners(Z[Lkorex/mail/Message;)V

    goto/16 :goto_49

    .line 3251
    .end local v5    # "luid":[J
    .end local v8    # "msgs":[Lkorex/mail/Message;
    .end local v10    # "s":[Ljava/lang/String;
    .end local v12    # "uids":Ljava/lang/String;
    .end local v13    # "uidset":[Lcom/sun/mail/imap/protocol/UIDSet;
    :cond_19e
    const-string v14, "FETCH"

    invoke-virtual {v4, v14}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_1c8

    .line 3252
    sget-boolean v14, Lcom/sun/mail/imap/IMAPFolder;->$assertionsDisabled:Z

    if-nez v14, :cond_1b6

    instance-of v14, v4, Lcom/sun/mail/imap/protocol/FetchResponse;

    if-nez v14, :cond_1b6

    new-instance v14, Ljava/lang/AssertionError;

    const-string v15, "!ir instanceof FetchResponse"

    invoke-direct {v14, v15}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v14

    .line 3253
    :cond_1b6
    check-cast v4, Lcom/sun/mail/imap/protocol/FetchResponse;

    .end local v4    # "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/sun/mail/imap/IMAPFolder;->processFetchResponse(Lcom/sun/mail/imap/protocol/FetchResponse;)Lkorex/mail/Message;

    move-result-object v7

    .line 3254
    .local v7, "msg":Lkorex/mail/Message;
    if-eqz v7, :cond_49

    .line 3255
    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v7}, Lcom/sun/mail/imap/IMAPFolder;->notifyMessageChangedListeners(ILkorex/mail/Message;)V

    goto/16 :goto_49

    .line 3258
    .end local v7    # "msg":Lkorex/mail/Message;
    .restart local v4    # "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    :cond_1c8
    const-string v14, "RECENT"

    invoke-virtual {v4, v14}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_49

    .line 3260
    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/IMAPResponse;->getNumber()I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/sun/mail/imap/IMAPFolder;->recent:I

    goto/16 :goto_49
.end method

.method handleResponses([Lcom/sun/mail/iap/Response;)V
    .registers 4
    .param p1, "r"    # [Lcom/sun/mail/iap/Response;

    .prologue
    .line 3316
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_10

    .line 3317
    aget-object v1, p1, v0

    if-eqz v1, :cond_d

    .line 3318
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lcom/sun/mail/imap/IMAPFolder;->handleResponse(Lcom/sun/mail/iap/Response;)V

    .line 3316
    :cond_d
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 3320
    :cond_10
    return-void
.end method

.method public declared-synchronized hasNewMessages()Z
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 813
    monitor-enter p0

    :try_start_3
    iget-boolean v8, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    if-eqz v8, :cond_34

    .line 815
    iget-object v11, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v11
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_24

    .line 818
    const/4 v8, 0x1

    :try_start_b
    invoke-virtual {p0, v8}, Lcom/sun/mail/imap/IMAPFolder;->keepConnectionAlive(Z)V
    :try_end_e
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_b .. :try_end_e} :catch_16
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_b .. :try_end_e} :catch_27
    .catchall {:try_start_b .. :try_end_e} :catchall_21

    .line 824
    :try_start_e
    iget v8, p0, Lcom/sun/mail/imap/IMAPFolder;->recent:I

    if-lez v8, :cond_32

    move v8, v9

    :goto_13
    monitor-exit v11
    :try_end_14
    .catchall {:try_start_e .. :try_end_14} :catchall_21

    .line 862
    :goto_14
    monitor-exit p0

    return v8

    .line 819
    :catch_16
    move-exception v2

    .line 820
    .local v2, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_17
    new-instance v8, Lkorex/mail/FolderClosedException;

    invoke-virtual {v2}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, p0, v9}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v8

    .line 825
    .end local v2    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_21
    move-exception v8

    monitor-exit v11
    :try_end_23
    .catchall {:try_start_17 .. :try_end_23} :catchall_21

    :try_start_23
    throw v8
    :try_end_24
    .catchall {:try_start_23 .. :try_end_24} :catchall_24

    .line 813
    :catchall_24
    move-exception v8

    monitor-exit p0

    throw v8

    .line 821
    :catch_27
    move-exception v6

    .line 822
    .local v6, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_28
    new-instance v8, Lkorex/mail/MessagingException;

    invoke-virtual {v6}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v6}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v8
    :try_end_32
    .catchall {:try_start_28 .. :try_end_32} :catchall_21

    .end local v6    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :cond_32
    move v8, v10

    .line 824
    goto :goto_13

    .line 831
    :cond_34
    const/4 v4, 0x0

    .line 833
    .local v4, "li":[Lcom/sun/mail/imap/protocol/ListInfo;
    :try_start_35
    iget-boolean v8, p0, Lcom/sun/mail/imap/IMAPFolder;->isNamespace:Z

    if-eqz v8, :cond_7e

    iget-char v8, p0, Lcom/sun/mail/imap/IMAPFolder;->separator:C

    if-eqz v8, :cond_7e

    .line 834
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-char v11, p0, Lcom/sun/mail/imap/IMAPFolder;->separator:C

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 837
    .local v5, "lname":Ljava/lang/String;
    :goto_52
    new-instance v8, Lcom/sun/mail/imap/IMAPFolder$7;

    invoke-direct {v8, p0, v5}, Lcom/sun/mail/imap/IMAPFolder$7;-><init>(Lcom/sun/mail/imap/IMAPFolder;Ljava/lang/String;)V

    invoke-virtual {p0, v8}, Lcom/sun/mail/imap/IMAPFolder;->doCommandIgnoreFailure(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Lcom/sun/mail/imap/protocol/ListInfo;

    move-object v0, v8

    check-cast v0, [Lcom/sun/mail/imap/protocol/ListInfo;

    move-object v4, v0

    .line 844
    if-nez v4, :cond_81

    .line 845
    new-instance v8, Lkorex/mail/FolderNotFoundException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v10, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " not found"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, p0, v9}, Lkorex/mail/FolderNotFoundException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v8

    .line 836
    .end local v5    # "lname":Ljava/lang/String;
    :cond_7e
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    .restart local v5    # "lname":Ljava/lang/String;
    goto :goto_52

    .line 847
    :cond_81
    invoke-direct {p0, v4, v5}, Lcom/sun/mail/imap/IMAPFolder;->findName([Lcom/sun/mail/imap/protocol/ListInfo;Ljava/lang/String;)I

    move-result v3

    .line 848
    .local v3, "i":I
    aget-object v8, v4, v3

    iget v8, v8, Lcom/sun/mail/imap/protocol/ListInfo;->changeState:I

    if-ne v8, v9, :cond_8d

    move v8, v9

    .line 849
    goto :goto_14

    .line 850
    :cond_8d
    aget-object v8, v4, v3

    iget v8, v8, Lcom/sun/mail/imap/protocol/ListInfo;->changeState:I
    :try_end_91
    .catchall {:try_start_35 .. :try_end_91} :catchall_24

    const/4 v11, 0x2

    if-ne v8, v11, :cond_97

    move v8, v10

    .line 851
    goto/16 :goto_14

    .line 855
    :cond_97
    :try_start_97
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPFolder;->getStatus()Lcom/sun/mail/imap/protocol/Status;

    move-result-object v7

    .line 856
    .local v7, "status":Lcom/sun/mail/imap/protocol/Status;
    iget v8, v7, Lcom/sun/mail/imap/protocol/Status;->recent:I
    :try_end_9d
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_97 .. :try_end_9d} :catch_a5
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_97 .. :try_end_9d} :catch_a9
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_97 .. :try_end_9d} :catch_b6
    .catchall {:try_start_97 .. :try_end_9d} :catchall_24

    if-lez v8, :cond_a2

    move v8, v9

    .line 857
    goto/16 :goto_14

    :cond_a2
    move v8, v10

    .line 859
    goto/16 :goto_14

    .line 860
    .end local v7    # "status":Lcom/sun/mail/imap/protocol/Status;
    :catch_a5
    move-exception v1

    .local v1, "bex":Lcom/sun/mail/iap/BadCommandException;
    move v8, v10

    .line 862
    goto/16 :goto_14

    .line 863
    .end local v1    # "bex":Lcom/sun/mail/iap/BadCommandException;
    :catch_a9
    move-exception v2

    .line 864
    .restart local v2    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_aa
    new-instance v8, Lkorex/mail/StoreClosedException;

    iget-object v9, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    invoke-virtual {v2}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Lkorex/mail/StoreClosedException;-><init>(Lkorex/mail/Store;Ljava/lang/String;)V

    throw v8

    .line 865
    .end local v2    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_b6
    move-exception v6

    .line 866
    .restart local v6    # "pex":Lcom/sun/mail/iap/ProtocolException;
    new-instance v8, Lkorex/mail/MessagingException;

    invoke-virtual {v6}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v6}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v8
    :try_end_c1
    .catchall {:try_start_aa .. :try_end_c1} :catchall_24
.end method

.method public id(Ljava/util/Map;)Ljava/util/Map;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 3083
    .local p1, "clientParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkOpened()V

    .line 3084
    const-string v0, "ID not supported"

    new-instance v1, Lcom/sun/mail/imap/IMAPFolder$20;

    invoke-direct {v1, p0, p1}, Lcom/sun/mail/imap/IMAPFolder$20;-><init>(Lcom/sun/mail/imap/IMAPFolder;Ljava/util/Map;)V

    invoke-virtual {p0, v0, v1}, Lcom/sun/mail/imap/IMAPFolder;->doOptionalCommand(Ljava/lang/String;Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    return-object v0
.end method

.method public idle()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2878
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/IMAPFolder;->idle(Z)V

    .line 2879
    return-void
.end method

.method public idle(Z)V
    .registers 5
    .param p1, "once"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2894
    monitor-enter p0

    .line 2903
    :try_start_1
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    if-eqz v1, :cond_18

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getChannel()Ljava/nio/channels/SocketChannel;

    move-result-object v1

    if-eqz v1, :cond_18

    .line 2904
    new-instance v1, Lkorex/mail/MessagingException;

    const-string v2, "idle method not supported with SocketChannels"

    invoke-direct {v1, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2906
    :catchall_15
    move-exception v1

    monitor-exit p0
    :try_end_17
    .catchall {:try_start_1 .. :try_end_17} :catchall_15

    throw v1

    :cond_18
    :try_start_18
    monitor-exit p0
    :try_end_19
    .catchall {:try_start_18 .. :try_end_19} :catchall_15

    .line 2907
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/sun/mail/imap/IMAPFolder;->startIdle(Lcom/sun/mail/imap/IdleManager;)V

    .line 2925
    :cond_1d
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/IMAPFolder;->handleIdle(Z)Z

    move-result v1

    if-nez v1, :cond_1d

    .line 2934
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v1, Lcom/sun/mail/imap/IMAPStore;

    invoke-virtual {v1}, Lcom/sun/mail/imap/IMAPStore;->getMinIdleTime()I

    move-result v0

    .line 2935
    .local v0, "minidle":I
    if-lez v0, :cond_31

    .line 2937
    int-to-long v1, v0

    :try_start_2e
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_31
    .catch Ljava/lang/InterruptedException; {:try_start_2e .. :try_end_31} :catch_32

    .line 2940
    :cond_31
    :goto_31
    return-void

    .line 2938
    :catch_32
    move-exception v1

    goto :goto_31
.end method

.method idleAbort()V
    .registers 2

    .prologue
    .line 3055
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->idleManager:Lcom/sun/mail/imap/IdleManager;

    .line 3056
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    if-eqz v0, :cond_c

    .line 3057
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->idleAbort()V

    .line 3058
    :cond_c
    return-void
.end method

.method public declared-synchronized isOpen()Z
    .registers 3

    .prologue
    .line 1513
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v1
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_14

    .line 1515
    :try_start_4
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z
    :try_end_6
    .catchall {:try_start_4 .. :try_end_6} :catchall_11

    if-eqz v0, :cond_c

    .line 1517
    const/4 v0, 0x0

    :try_start_9
    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/IMAPFolder;->keepConnectionAlive(Z)V
    :try_end_c
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_9 .. :try_end_c} :catch_17
    .catchall {:try_start_9 .. :try_end_c} :catchall_11

    .line 1520
    :cond_c
    :goto_c
    :try_start_c
    monitor-exit v1
    :try_end_d
    .catchall {:try_start_c .. :try_end_d} :catchall_11

    .line 1522
    :try_start_d
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z
    :try_end_f
    .catchall {:try_start_d .. :try_end_f} :catchall_14

    monitor-exit p0

    return v0

    .line 1520
    :catchall_11
    move-exception v0

    :try_start_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_12 .. :try_end_13} :catchall_11

    :try_start_13
    throw v0
    :try_end_14
    .catchall {:try_start_13 .. :try_end_14} :catchall_14

    .line 1513
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0

    .line 1518
    :catch_17
    move-exception v0

    goto :goto_c
.end method

.method public declared-synchronized isSubscribed()Z
    .registers 7

    .prologue
    .line 719
    monitor-enter p0

    const/4 v2, 0x0

    .line 721
    .local v2, "li":[Lcom/sun/mail/imap/protocol/ListInfo;
    :try_start_2
    iget-boolean v4, p0, Lcom/sun/mail/imap/IMAPFolder;->isNamespace:Z

    if-eqz v4, :cond_3a

    iget-char v4, p0, Lcom/sun/mail/imap/IMAPFolder;->separator:C

    if-eqz v4, :cond_3a

    .line 722
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-char v5, p0, Lcom/sun/mail/imap/IMAPFolder;->separator:C

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1e
    .catchall {:try_start_2 .. :try_end_1e} :catchall_3f

    move-result-object v3

    .line 727
    .local v3, "lname":Ljava/lang/String;
    :goto_1f
    :try_start_1f
    new-instance v4, Lcom/sun/mail/imap/IMAPFolder$4;

    invoke-direct {v4, p0, v3}, Lcom/sun/mail/imap/IMAPFolder$4;-><init>(Lcom/sun/mail/imap/IMAPFolder;Ljava/lang/String;)V

    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/IMAPFolder;->doProtocolCommand(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lcom/sun/mail/imap/protocol/ListInfo;

    move-object v0, v4

    check-cast v0, [Lcom/sun/mail/imap/protocol/ListInfo;

    move-object v2, v0
    :try_end_2e
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_1f .. :try_end_2e} :catch_42
    .catchall {:try_start_1f .. :try_end_2e} :catchall_3f

    .line 736
    :goto_2e
    if-eqz v2, :cond_3d

    .line 737
    :try_start_30
    invoke-direct {p0, v2, v3}, Lcom/sun/mail/imap/IMAPFolder;->findName([Lcom/sun/mail/imap/protocol/ListInfo;Ljava/lang/String;)I

    move-result v1

    .line 738
    .local v1, "i":I
    aget-object v4, v2, v1

    iget-boolean v4, v4, Lcom/sun/mail/imap/protocol/ListInfo;->canOpen:Z
    :try_end_38
    .catchall {:try_start_30 .. :try_end_38} :catchall_3f

    .line 740
    .end local v1    # "i":I
    :goto_38
    monitor-exit p0

    return v4

    .line 724
    .end local v3    # "lname":Ljava/lang/String;
    :cond_3a
    :try_start_3a
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;
    :try_end_3c
    .catchall {:try_start_3a .. :try_end_3c} :catchall_3f

    .restart local v3    # "lname":Ljava/lang/String;
    goto :goto_1f

    .line 740
    :cond_3d
    const/4 v4, 0x0

    goto :goto_38

    .line 719
    .end local v3    # "lname":Ljava/lang/String;
    :catchall_3f
    move-exception v4

    monitor-exit p0

    throw v4

    .line 733
    .restart local v3    # "lname":Ljava/lang/String;
    :catch_42
    move-exception v4

    goto :goto_2e
.end method

.method protected keepConnectionAlive(Z)V
    .registers 9
    .param p1, "keepStoreAlive"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    const-wide/16 v5, 0x3e8

    .line 3613
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-object v3, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getTimestamp()J

    move-result-wide v3

    sub-long/2addr v1, v3

    cmp-long v1, v1, v5

    if-lez v1, :cond_1d

    .line 3614
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->waitIfIdle()V

    .line 3615
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    if-eqz v1, :cond_1d

    .line 3616
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noop()V

    .line 3619
    :cond_1d
    if-eqz p1, :cond_49

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v1, Lcom/sun/mail/imap/IMAPStore;

    invoke-virtual {v1}, Lcom/sun/mail/imap/IMAPStore;->hasSeparateStoreConnection()Z

    move-result v1

    if-eqz v1, :cond_49

    .line 3620
    const/4 v0, 0x0

    .line 3622
    .local v0, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :try_start_2a
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v1, Lcom/sun/mail/imap/IMAPStore;

    invoke-virtual {v1}, Lcom/sun/mail/imap/IMAPStore;->getFolderStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v0

    .line 3623
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getTimestamp()J

    move-result-wide v3

    sub-long/2addr v1, v3

    cmp-long v1, v1, v5

    if-lez v1, :cond_42

    .line 3624
    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noop()V
    :try_end_42
    .catchall {:try_start_2a .. :try_end_42} :catchall_4a

    .line 3626
    :cond_42
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v1, Lcom/sun/mail/imap/IMAPStore;

    invoke-virtual {v1, v0}, Lcom/sun/mail/imap/IMAPStore;->releaseFolderStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    .line 3629
    .end local v0    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :cond_49
    return-void

    .line 3626
    .restart local v0    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catchall_4a
    move-exception v1

    move-object v2, v1

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v1, Lcom/sun/mail/imap/IMAPStore;

    invoke-virtual {v1, v0}, Lcom/sun/mail/imap/IMAPStore;->releaseFolderStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    throw v2
.end method

.method public list(Ljava/lang/String;)[Lkorex/mail/Folder;
    .registers 3
    .param p1, "pattern"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 616
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/sun/mail/imap/IMAPFolder;->doList(Ljava/lang/String;Z)[Lkorex/mail/Folder;

    move-result-object v0

    return-object v0
.end method

.method public listRights(Ljava/lang/String;)[Lcom/sun/mail/imap/Rights;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2800
    const-string v0, "ACL not supported"

    new-instance v1, Lcom/sun/mail/imap/IMAPFolder$16;

    invoke-direct {v1, p0, p1}, Lcom/sun/mail/imap/IMAPFolder$16;-><init>(Lcom/sun/mail/imap/IMAPFolder;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/sun/mail/imap/IMAPFolder;->doOptionalCommand(Ljava/lang/String;Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sun/mail/imap/Rights;

    check-cast v0, [Lcom/sun/mail/imap/Rights;

    return-object v0
.end method

.method public listSubscribed(Ljava/lang/String;)[Lkorex/mail/Folder;
    .registers 3
    .param p1, "pattern"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 623
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/sun/mail/imap/IMAPFolder;->doList(Ljava/lang/String;Z)[Lkorex/mail/Folder;

    move-result-object v0

    return-object v0
.end method

.method public myRights()Lcom/sun/mail/imap/Rights;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2817
    const-string v0, "ACL not supported"

    new-instance v1, Lcom/sun/mail/imap/IMAPFolder$17;

    invoke-direct {v1, p0}, Lcom/sun/mail/imap/IMAPFolder$17;-><init>(Lcom/sun/mail/imap/IMAPFolder;)V

    invoke-virtual {p0, v0, v1}, Lcom/sun/mail/imap/IMAPFolder;->doOptionalCommand(Ljava/lang/String;Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sun/mail/imap/Rights;

    return-object v0
.end method

.method protected newIMAPMessage(I)Lcom/sun/mail/imap/IMAPMessage;
    .registers 3
    .param p1, "msgnum"    # I

    .prologue
    .line 1299
    new-instance v0, Lcom/sun/mail/imap/IMAPMessage;

    invoke-direct {v0, p0, p1}, Lcom/sun/mail/imap/IMAPMessage;-><init>(Lcom/sun/mail/imap/IMAPFolder;I)V

    return-object v0
.end method

.method public declared-synchronized open(ILcom/sun/mail/imap/ResyncData;)Ljava/util/List;
    .registers 19
    .param p1, "mode"    # I
    .param p2, "rd"    # Lcom/sun/mail/imap/ResyncData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/sun/mail/imap/ResyncData;",
            ")",
            "Ljava/util/List",
            "<",
            "Lkorex/mail/event/MailEvent;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 966
    monitor-enter p0

    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/IMAPFolder;->checkClosed()V

    .line 968
    const/4 v4, 0x0

    .line 970
    .local v4, "mi":Lcom/sun/mail/imap/protocol/MailboxInfo;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v12, Lcom/sun/mail/imap/IMAPStore;

    move-object/from16 v0, p0

    invoke-virtual {v12, v0}, Lcom/sun/mail/imap/IMAPStore;->getProtocol(Lcom/sun/mail/imap/IMAPFolder;)Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v12

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    .line 972
    const/4 v6, 0x0

    .line 973
    .local v6, "openEvents":Ljava/util/List;, "Ljava/util/List<Lkorex/mail/event/MailEvent;>;"
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v13
    :try_end_1b
    .catchall {:try_start_1 .. :try_end_1b} :catchall_137

    .line 981
    :try_start_1b
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-object/from16 v0, p0

    invoke-virtual {v12, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->addResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V
    :try_end_24
    .catchall {:try_start_1b .. :try_end_24} :catchall_170

    .line 990
    if-eqz p2, :cond_59

    .line 991
    :try_start_26
    sget-object v12, Lcom/sun/mail/imap/ResyncData;->CONDSTORE:Lcom/sun/mail/imap/ResyncData;

    move-object/from16 v0, p2

    if-ne v0, v12, :cond_172

    .line 992
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    const-string v14, "CONDSTORE"

    invoke-virtual {v12, v14}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isEnabled(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_59

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    const-string v14, "QRESYNC"

    .line 993
    invoke-virtual {v12, v14}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isEnabled(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_59

    .line 994
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    const-string v14, "CONDSTORE"

    invoke-virtual {v12, v14}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_13a

    .line 995
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    const-string v14, "CONDSTORE"

    invoke-virtual {v12, v14}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->enable(Ljava/lang/String;)V

    .line 1005
    :cond_59
    :goto_59
    const/4 v12, 0x1

    move/from16 v0, p1

    if-ne v0, v12, :cond_1a1

    .line 1006
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v12, v14, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->examine(Ljava/lang/String;Lcom/sun/mail/imap/ResyncData;)Lcom/sun/mail/imap/protocol/MailboxInfo;
    :try_end_6b
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_26 .. :try_end_6b} :catch_145
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_26 .. :try_end_6b} :catch_189
    .catchall {:try_start_26 .. :try_end_6b} :catchall_170

    move-result-object v4

    .line 1046
    :goto_6c
    :try_start_6c
    iget v12, v4, Lcom/sun/mail/imap/protocol/MailboxInfo;->mode:I

    move/from16 v0, p1

    if-eq v12, v0, :cond_88

    .line 1047
    const/4 v12, 0x2

    move/from16 v0, p1

    if-ne v0, v12, :cond_1dd

    iget v12, v4, Lcom/sun/mail/imap/protocol/MailboxInfo;->mode:I

    const/4 v14, 0x1

    if-ne v12, v14, :cond_1dd

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v12, Lcom/sun/mail/imap/IMAPStore;

    .line 1048
    invoke-virtual {v12}, Lcom/sun/mail/imap/IMAPStore;->allowReadOnlySelect()Z

    move-result v12

    if-eqz v12, :cond_1dd

    .line 1073
    :cond_88
    const/4 v12, 0x1

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/sun/mail/imap/IMAPFolder;->opened:Z

    .line 1074
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/sun/mail/imap/IMAPFolder;->reallyClosed:Z

    .line 1075
    iget v12, v4, Lcom/sun/mail/imap/protocol/MailboxInfo;->mode:I

    move-object/from16 v0, p0

    iput v12, v0, Lcom/sun/mail/imap/IMAPFolder;->mode:I

    .line 1076
    iget-object v12, v4, Lcom/sun/mail/imap/protocol/MailboxInfo;->availableFlags:Lkorex/mail/Flags;

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/sun/mail/imap/IMAPFolder;->availableFlags:Lkorex/mail/Flags;

    .line 1077
    iget-object v12, v4, Lcom/sun/mail/imap/protocol/MailboxInfo;->permanentFlags:Lkorex/mail/Flags;

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/sun/mail/imap/IMAPFolder;->permanentFlags:Lkorex/mail/Flags;

    .line 1078
    iget v12, v4, Lcom/sun/mail/imap/protocol/MailboxInfo;->total:I

    move-object/from16 v0, p0

    iput v12, v0, Lcom/sun/mail/imap/IMAPFolder;->realTotal:I

    move-object/from16 v0, p0

    iput v12, v0, Lcom/sun/mail/imap/IMAPFolder;->total:I

    .line 1079
    iget v12, v4, Lcom/sun/mail/imap/protocol/MailboxInfo;->recent:I

    move-object/from16 v0, p0

    iput v12, v0, Lcom/sun/mail/imap/IMAPFolder;->recent:I

    .line 1080
    iget-wide v14, v4, Lcom/sun/mail/imap/protocol/MailboxInfo;->uidvalidity:J

    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/sun/mail/imap/IMAPFolder;->uidvalidity:J

    .line 1081
    iget-wide v14, v4, Lcom/sun/mail/imap/protocol/MailboxInfo;->uidnext:J

    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/sun/mail/imap/IMAPFolder;->uidnext:J

    .line 1082
    iget-wide v14, v4, Lcom/sun/mail/imap/protocol/MailboxInfo;->highestmodseq:J

    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/sun/mail/imap/IMAPFolder;->highestmodseq:J

    .line 1085
    new-instance v14, Lcom/sun/mail/imap/MessageCache;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v12, Lcom/sun/mail/imap/IMAPStore;

    move-object/from16 v0, p0

    iget v15, v0, Lcom/sun/mail/imap/IMAPFolder;->total:I

    move-object/from16 v0, p0

    invoke-direct {v14, v0, v12, v15}, Lcom/sun/mail/imap/MessageCache;-><init>(Lcom/sun/mail/imap/IMAPFolder;Lcom/sun/mail/imap/IMAPStore;I)V

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/sun/mail/imap/IMAPFolder;->messageCache:Lcom/sun/mail/imap/MessageCache;

    .line 1088
    iget-object v12, v4, Lcom/sun/mail/imap/protocol/MailboxInfo;->responses:Ljava/util/List;

    if-eqz v12, :cond_257

    .line 1089
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V
    :try_end_e4
    .catchall {:try_start_6c .. :try_end_e4} :catchall_170

    .line 1090
    .end local v6    # "openEvents":Ljava/util/List;, "Ljava/util/List<Lkorex/mail/event/MailEvent;>;"
    .local v7, "openEvents":Ljava/util/List;, "Ljava/util/List<Lkorex/mail/event/MailEvent;>;"
    :try_start_e4
    iget-object v12, v4, Lcom/sun/mail/imap/protocol/MailboxInfo;->responses:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_ea
    :goto_ea
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_256

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/sun/mail/imap/protocol/IMAPResponse;

    .line 1091
    .local v2, "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    const-string v14, "VANISHED"

    invoke-virtual {v2, v14}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_227

    .line 1093
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readAtomStringList()[Ljava/lang/String;

    move-result-object v9

    .line 1095
    .local v9, "s":[Ljava/lang/String;
    if-eqz v9, :cond_ea

    array-length v14, v9

    const/4 v15, 0x1

    if-ne v14, v15, :cond_ea

    const/4 v14, 0x0

    aget-object v14, v9, v14

    const-string v15, "EARLIER"

    .line 1096
    invoke-virtual {v14, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_ea

    .line 1098
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readAtom()Ljava/lang/String;

    move-result-object v10

    .line 1099
    .local v10, "uids":Ljava/lang/String;
    invoke-static {v10}, Lcom/sun/mail/imap/protocol/UIDSet;->parseUIDSets(Ljava/lang/String;)[Lcom/sun/mail/imap/protocol/UIDSet;

    move-result-object v11

    .line 1100
    .local v11, "uidset":[Lcom/sun/mail/imap/protocol/UIDSet;
    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/sun/mail/imap/IMAPFolder;->uidnext:J

    invoke-static {v11, v14, v15}, Lcom/sun/mail/imap/protocol/UIDSet;->toArray([Lcom/sun/mail/imap/protocol/UIDSet;J)[J

    move-result-object v3

    .line 1101
    .local v3, "luid":[J
    if-eqz v3, :cond_ea

    array-length v14, v3

    if-lez v14, :cond_ea

    .line 1102
    new-instance v14, Lcom/sun/mail/imap/MessageVanishedEvent;

    move-object/from16 v0, p0

    invoke-direct {v14, v0, v3}, Lcom/sun/mail/imap/MessageVanishedEvent;-><init>(Lkorex/mail/Folder;[J)V

    invoke-interface {v7, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_132
    .catchall {:try_start_e4 .. :try_end_132} :catchall_133

    goto :goto_ea

    .line 1114
    .end local v2    # "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    .end local v3    # "luid":[J
    .end local v9    # "s":[Ljava/lang/String;
    .end local v10    # "uids":Ljava/lang/String;
    .end local v11    # "uidset":[Lcom/sun/mail/imap/protocol/UIDSet;
    :catchall_133
    move-exception v12

    move-object v6, v7

    .end local v7    # "openEvents":Ljava/util/List;, "Ljava/util/List<Lkorex/mail/event/MailEvent;>;"
    .restart local v6    # "openEvents":Ljava/util/List;, "Ljava/util/List<Lkorex/mail/event/MailEvent;>;"
    :goto_135
    :try_start_135
    monitor-exit v13
    :try_end_136
    .catchall {:try_start_135 .. :try_end_136} :catchall_170

    :try_start_136
    throw v12
    :try_end_137
    .catchall {:try_start_136 .. :try_end_137} :catchall_137

    .line 966
    .end local v4    # "mi":Lcom/sun/mail/imap/protocol/MailboxInfo;
    .end local v6    # "openEvents":Ljava/util/List;, "Ljava/util/List<Lkorex/mail/event/MailEvent;>;"
    :catchall_137
    move-exception v12

    monitor-exit p0

    throw v12

    .line 997
    .restart local v4    # "mi":Lcom/sun/mail/imap/protocol/MailboxInfo;
    .restart local v6    # "openEvents":Ljava/util/List;, "Ljava/util/List<Lkorex/mail/event/MailEvent;>;"
    :cond_13a
    :try_start_13a
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    const-string v14, "QRESYNC"

    invoke-virtual {v12, v14}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->enable(Ljava/lang/String;)V
    :try_end_143
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_13a .. :try_end_143} :catch_145
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_13a .. :try_end_143} :catch_189
    .catchall {:try_start_13a .. :try_end_143} :catchall_170

    goto/16 :goto_59

    .line 1009
    :catch_145
    move-exception v1

    .line 1018
    .local v1, "cex":Lcom/sun/mail/iap/CommandFailedException;
    :try_start_146
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/IMAPFolder;->checkExists()V

    .line 1020
    move-object/from16 v0, p0

    iget v12, v0, Lcom/sun/mail/imap/IMAPFolder;->type:I

    and-int/lit8 v12, v12, 0x1

    if-nez v12, :cond_1b1

    .line 1021
    new-instance v12, Lkorex/mail/MessagingException;

    const-string v14, "folder cannot contain messages"

    invoke-direct {v12, v14}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v12
    :try_end_159
    .catchall {:try_start_146 .. :try_end_159} :catchall_159

    .line 1027
    :catchall_159
    move-exception v12

    const/4 v14, 0x0

    :try_start_15b
    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/sun/mail/imap/IMAPFolder;->exists:Z

    .line 1028
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/sun/mail/imap/IMAPFolder;->attributes:[Ljava/lang/String;

    .line 1029
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput v14, v0, Lcom/sun/mail/imap/IMAPFolder;->type:I

    .line 1031
    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/sun/mail/imap/IMAPFolder;->releaseProtocol(Z)V

    throw v12
    :try_end_170
    .catchall {:try_start_15b .. :try_end_170} :catchall_170

    .line 1114
    .end local v1    # "cex":Lcom/sun/mail/iap/CommandFailedException;
    :catchall_170
    move-exception v12

    goto :goto_135

    .line 1000
    :cond_172
    :try_start_172
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    const-string v14, "QRESYNC"

    invoke-virtual {v12, v14}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isEnabled(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_59

    .line 1001
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    const-string v14, "QRESYNC"

    invoke-virtual {v12, v14}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->enable(Ljava/lang/String;)V
    :try_end_187
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_172 .. :try_end_187} :catch_145
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_172 .. :try_end_187} :catch_189
    .catchall {:try_start_172 .. :try_end_187} :catchall_170

    goto/16 :goto_59

    .line 1034
    :catch_189
    move-exception v8

    .line 1037
    .local v8, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_18a
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v12}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logout()V
    :try_end_191
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_18a .. :try_end_191} :catch_1bb
    .catchall {:try_start_18a .. :try_end_191} :catchall_1cc

    .line 1041
    const/4 v12, 0x0

    :try_start_192
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/sun/mail/imap/IMAPFolder;->releaseProtocol(Z)V

    .line 1042
    new-instance v12, Lkorex/mail/MessagingException;

    invoke-virtual {v8}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v14, v8}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v12
    :try_end_1a1
    .catchall {:try_start_192 .. :try_end_1a1} :catchall_170

    .line 1008
    .end local v8    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :cond_1a1
    :try_start_1a1
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v12, v14, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->select(Ljava/lang/String;Lcom/sun/mail/imap/ResyncData;)Lcom/sun/mail/imap/protocol/MailboxInfo;
    :try_end_1ae
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_1a1 .. :try_end_1ae} :catch_145
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_1a1 .. :try_end_1ae} :catch_189
    .catchall {:try_start_1a1 .. :try_end_1ae} :catchall_170

    move-result-object v4

    goto/16 :goto_6c

    .line 1023
    .restart local v1    # "cex":Lcom/sun/mail/iap/CommandFailedException;
    :cond_1b1
    :try_start_1b1
    new-instance v12, Lkorex/mail/MessagingException;

    invoke-virtual {v1}, Lcom/sun/mail/iap/CommandFailedException;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v14, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v12
    :try_end_1bb
    .catchall {:try_start_1b1 .. :try_end_1bb} :catchall_159

    .line 1038
    .end local v1    # "cex":Lcom/sun/mail/iap/CommandFailedException;
    .restart local v8    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :catch_1bb
    move-exception v12

    .line 1041
    const/4 v12, 0x0

    :try_start_1bd
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/sun/mail/imap/IMAPFolder;->releaseProtocol(Z)V

    .line 1042
    new-instance v12, Lkorex/mail/MessagingException;

    invoke-virtual {v8}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v14, v8}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v12

    .line 1041
    :catchall_1cc
    move-exception v12

    const/4 v12, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/sun/mail/imap/IMAPFolder;->releaseProtocol(Z)V

    .line 1042
    new-instance v12, Lkorex/mail/MessagingException;

    invoke-virtual {v8}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v14, v8}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v12
    :try_end_1dd
    .catchall {:try_start_1bd .. :try_end_1dd} :catchall_170

    .line 1053
    .end local v8    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :cond_1dd
    :try_start_1dd
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v12}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->close()V

    .line 1054
    const/4 v12, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/sun/mail/imap/IMAPFolder;->releaseProtocol(Z)V
    :try_end_1ea
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_1dd .. :try_end_1ea} :catch_1f4
    .catchall {:try_start_1dd .. :try_end_1ea} :catchall_214

    .line 1065
    :try_start_1ea
    new-instance v12, Lkorex/mail/ReadOnlyFolderException;

    const-string v14, "Cannot open in desired mode"

    move-object/from16 v0, p0

    invoke-direct {v12, v0, v14}, Lkorex/mail/ReadOnlyFolderException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v12
    :try_end_1f4
    .catchall {:try_start_1ea .. :try_end_1f4} :catchall_170

    .line 1055
    :catch_1f4
    move-exception v8

    .line 1058
    .restart local v8    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_1f5
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v12}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logout()V
    :try_end_1fc
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_1f5 .. :try_end_1fc} :catch_20c
    .catchall {:try_start_1f5 .. :try_end_1fc} :catchall_21f

    .line 1062
    const/4 v12, 0x0

    :try_start_1fd
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/sun/mail/imap/IMAPFolder;->releaseProtocol(Z)V
    :try_end_202
    .catchall {:try_start_1fd .. :try_end_202} :catchall_214

    .line 1065
    :goto_202
    :try_start_202
    new-instance v12, Lkorex/mail/ReadOnlyFolderException;

    const-string v14, "Cannot open in desired mode"

    move-object/from16 v0, p0

    invoke-direct {v12, v0, v14}, Lkorex/mail/ReadOnlyFolderException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v12
    :try_end_20c
    .catchall {:try_start_202 .. :try_end_20c} :catchall_170

    .line 1059
    :catch_20c
    move-exception v12

    .line 1062
    const/4 v12, 0x0

    :try_start_20e
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/sun/mail/imap/IMAPFolder;->releaseProtocol(Z)V
    :try_end_213
    .catchall {:try_start_20e .. :try_end_213} :catchall_214

    goto :goto_202

    .line 1065
    .end local v8    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :catchall_214
    move-exception v12

    :try_start_215
    new-instance v12, Lkorex/mail/ReadOnlyFolderException;

    const-string v14, "Cannot open in desired mode"

    move-object/from16 v0, p0

    invoke-direct {v12, v0, v14}, Lkorex/mail/ReadOnlyFolderException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v12
    :try_end_21f
    .catchall {:try_start_215 .. :try_end_21f} :catchall_170

    .line 1062
    .restart local v8    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :catchall_21f
    move-exception v12

    const/4 v14, 0x0

    :try_start_221
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/sun/mail/imap/IMAPFolder;->releaseProtocol(Z)V

    throw v12
    :try_end_227
    .catchall {:try_start_221 .. :try_end_227} :catchall_214

    .line 1104
    .end local v6    # "openEvents":Ljava/util/List;, "Ljava/util/List<Lkorex/mail/event/MailEvent;>;"
    .end local v8    # "pex":Lcom/sun/mail/iap/ProtocolException;
    .restart local v2    # "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    .restart local v7    # "openEvents":Ljava/util/List;, "Ljava/util/List<Lkorex/mail/event/MailEvent;>;"
    :cond_227
    :try_start_227
    const-string v14, "FETCH"

    invoke-virtual {v2, v14}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_ea

    .line 1105
    sget-boolean v14, Lcom/sun/mail/imap/IMAPFolder;->$assertionsDisabled:Z

    if-nez v14, :cond_23f

    instance-of v14, v2, Lcom/sun/mail/imap/protocol/FetchResponse;

    if-nez v14, :cond_23f

    new-instance v12, Ljava/lang/AssertionError;

    const-string v14, "!ir instanceof FetchResponse"

    invoke-direct {v12, v14}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v12

    .line 1107
    :cond_23f
    check-cast v2, Lcom/sun/mail/imap/protocol/FetchResponse;

    .end local v2    # "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/sun/mail/imap/IMAPFolder;->processFetchResponse(Lcom/sun/mail/imap/protocol/FetchResponse;)Lkorex/mail/Message;

    move-result-object v5

    .line 1108
    .local v5, "msg":Lkorex/mail/Message;
    if-eqz v5, :cond_ea

    .line 1109
    new-instance v14, Lkorex/mail/event/MessageChangedEvent;

    const/4 v15, 0x1

    move-object/from16 v0, p0

    invoke-direct {v14, v0, v15, v5}, Lkorex/mail/event/MessageChangedEvent;-><init>(Ljava/lang/Object;ILkorex/mail/Message;)V

    invoke-interface {v7, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_254
    .catchall {:try_start_227 .. :try_end_254} :catchall_133

    goto/16 :goto_ea

    .end local v5    # "msg":Lkorex/mail/Message;
    :cond_256
    move-object v6, v7

    .line 1114
    .end local v7    # "openEvents":Ljava/util/List;, "Ljava/util/List<Lkorex/mail/event/MailEvent;>;"
    .restart local v6    # "openEvents":Ljava/util/List;, "Ljava/util/List<Lkorex/mail/event/MailEvent;>;"
    :cond_257
    :try_start_257
    monitor-exit v13
    :try_end_258
    .catchall {:try_start_257 .. :try_end_258} :catchall_170

    .line 1116
    const/4 v12, 0x1

    :try_start_259
    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/sun/mail/imap/IMAPFolder;->exists:Z

    .line 1117
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/sun/mail/imap/IMAPFolder;->attributes:[Ljava/lang/String;

    .line 1118
    const/4 v12, 0x1

    move-object/from16 v0, p0

    iput v12, v0, Lcom/sun/mail/imap/IMAPFolder;->type:I

    .line 1121
    const/4 v12, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/sun/mail/imap/IMAPFolder;->notifyConnectionListeners(I)V
    :try_end_26d
    .catchall {:try_start_259 .. :try_end_26d} :catchall_137

    .line 1123
    monitor-exit p0

    return-object v6
.end method

.method public declared-synchronized open(I)V
    .registers 3
    .param p1, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 951
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    invoke-virtual {p0, p1, v0}, Lcom/sun/mail/imap/IMAPFolder;->open(ILcom/sun/mail/imap/ResyncData;)Ljava/util/List;
    :try_end_5
    .catchall {:try_start_2 .. :try_end_5} :catchall_7

    .line 952
    monitor-exit p0

    return-void

    .line 951
    :catchall_7
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected releaseProtocol(Z)V
    .registers 5
    .param p1, "returnToPool"    # Z

    .prologue
    const/4 v2, 0x0

    .line 3586
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    if-eqz v0, :cond_17

    .line 3587
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v0, p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->removeResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 3589
    if-eqz p1, :cond_18

    .line 3590
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v0, Lcom/sun/mail/imap/IMAPStore;

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v0, p0, v1}, Lcom/sun/mail/imap/IMAPStore;->releaseProtocol(Lcom/sun/mail/imap/IMAPFolder;Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    .line 3595
    :goto_15
    iput-object v2, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    .line 3597
    :cond_17
    return-void

    .line 3592
    :cond_18
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->disconnect()V

    .line 3593
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v0, Lcom/sun/mail/imap/IMAPStore;

    invoke-virtual {v0, p0, v2}, Lcom/sun/mail/imap/IMAPStore;->releaseProtocol(Lcom/sun/mail/imap/IMAPFolder;Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    goto :goto_15
.end method

.method protected declared-synchronized releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V
    .registers 4
    .param p1, "p"    # Lcom/sun/mail/imap/protocol/IMAPProtocol;

    .prologue
    .line 3569
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    if-eq p1, v0, :cond_e

    .line 3570
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v0, Lcom/sun/mail/imap/IMAPStore;

    invoke-virtual {v0, p1}, Lcom/sun/mail/imap/IMAPStore;->releaseFolderStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_16

    .line 3575
    :goto_c
    monitor-exit p0

    return-void

    .line 3573
    :cond_e
    :try_start_e
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v1, "releasing our protocol as store protocol?"

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_15
    .catchall {:try_start_e .. :try_end_15} :catchall_16

    goto :goto_c

    .line 3569
    :catchall_16
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public removeACL(Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2745
    const-string v0, "ACL not supported"

    new-instance v1, Lcom/sun/mail/imap/IMAPFolder$15;

    invoke-direct {v1, p0, p1}, Lcom/sun/mail/imap/IMAPFolder$15;-><init>(Lcom/sun/mail/imap/IMAPFolder;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/sun/mail/imap/IMAPFolder;->doOptionalCommand(Ljava/lang/String;Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    .line 2753
    return-void
.end method

.method public removeRights(Lcom/sun/mail/imap/ACL;)V
    .registers 3
    .param p1, "acl"    # Lcom/sun/mail/imap/ACL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2777
    const/16 v0, 0x2d

    invoke-direct {p0, p1, v0}, Lcom/sun/mail/imap/IMAPFolder;->setACL(Lcom/sun/mail/imap/ACL;C)V

    .line 2778
    return-void
.end method

.method public declared-synchronized renameTo(Lkorex/mail/Folder;)Z
    .registers 6
    .param p1, "f"    # Lkorex/mail/Folder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 925
    monitor-enter p0

    :try_start_2
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkClosed()V

    .line 926
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkExists()V

    .line 927
    invoke-virtual {p1}, Lkorex/mail/Folder;->getStore()Lkorex/mail/Store;

    move-result-object v2

    iget-object v3, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    if-eq v2, v3, :cond_1b

    .line 928
    new-instance v1, Lkorex/mail/MessagingException;

    const-string v2, "Can\'t rename across Stores"

    invoke-direct {v1, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_18
    .catchall {:try_start_2 .. :try_end_18} :catchall_18

    .line 925
    :catchall_18
    move-exception v1

    monitor-exit p0

    throw v1

    .line 931
    :cond_1b
    :try_start_1b
    new-instance v2, Lcom/sun/mail/imap/IMAPFolder$9;

    invoke-direct {v2, p0, p1}, Lcom/sun/mail/imap/IMAPFolder$9;-><init>(Lcom/sun/mail/imap/IMAPFolder;Lkorex/mail/Folder;)V

    invoke-virtual {p0, v2}, Lcom/sun/mail/imap/IMAPFolder;->doCommandIgnoreFailure(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;
    :try_end_23
    .catchall {:try_start_1b .. :try_end_23} :catchall_18

    move-result-object v0

    .line 938
    .local v0, "ret":Ljava/lang/Object;
    if-nez v0, :cond_28

    .line 944
    :goto_26
    monitor-exit p0

    return v1

    .line 941
    :cond_28
    const/4 v1, 0x0

    :try_start_29
    iput-boolean v1, p0, Lcom/sun/mail/imap/IMAPFolder;->exists:Z

    .line 942
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->attributes:[Ljava/lang/String;

    .line 943
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/IMAPFolder;->notifyFolderRenamedListeners(Lkorex/mail/Folder;)V
    :try_end_31
    .catchall {:try_start_29 .. :try_end_31} :catchall_18

    .line 944
    const/4 v1, 0x1

    goto :goto_26
.end method

.method public declared-synchronized search(Lkorex/mail/search/SearchTerm;)[Lkorex/mail/Message;
    .registers 14
    .param p1, "term"    # Lkorex/mail/search/SearchTerm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2133
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkOpened()V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_7b

    .line 2136
    const/4 v3, 0x0

    .line 2138
    .local v3, "matchMsgs":[Lkorex/mail/Message;
    :try_start_5
    iget-object v9, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v9
    :try_end_8
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_5 .. :try_end_8} :catch_66
    .catch Lkorex/mail/search/SearchException; {:try_start_5 .. :try_end_8} :catch_6f
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_5 .. :try_end_8} :catch_83
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_5 .. :try_end_8} :catch_8e
    .catchall {:try_start_5 .. :try_end_8} :catchall_7b

    .line 2139
    :try_start_8
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v8

    invoke-virtual {v8, p1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->search(Lkorex/mail/search/SearchTerm;)[I

    move-result-object v4

    .line 2140
    .local v4, "matches":[I
    if-eqz v4, :cond_6d

    .line 2141
    array-length v8, v4

    new-array v3, v8, [Lcom/sun/mail/imap/IMAPMessage;

    .line 2142
    iget-object v8, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCache:Lcom/sun/mail/imap/MessageCache;

    invoke-virtual {v8}, Lcom/sun/mail/imap/MessageCache;->size()I

    move-result v7

    .line 2144
    .local v7, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1c
    array-length v8, v4

    if-ge v2, v8, :cond_6d

    .line 2148
    aget v8, v4, v2

    if-le v8, v7, :cond_5a

    .line 2149
    iget-object v8, p0, Lcom/sun/mail/imap/IMAPFolder;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v10, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v8, v10}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v8

    if-eqz v8, :cond_57

    .line 2150
    iget-object v8, p0, Lcom/sun/mail/imap/IMAPFolder;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "ignoring message number "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    aget v11, v4, v2

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " in search results, "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "outside range "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 2144
    :cond_57
    :goto_57
    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    .line 2154
    :cond_5a
    aget v8, v4, v2

    invoke-virtual {p0, v8}, Lcom/sun/mail/imap/IMAPFolder;->getMessageBySeqNumber(I)Lcom/sun/mail/imap/IMAPMessage;

    move-result-object v8

    aput-object v8, v3, v2

    goto :goto_57

    .line 2157
    .end local v2    # "i":I
    .end local v4    # "matches":[I
    .end local v7    # "size":I
    :catchall_63
    move-exception v8

    monitor-exit v9
    :try_end_65
    .catchall {:try_start_8 .. :try_end_65} :catchall_63

    :try_start_65
    throw v8
    :try_end_66
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_65 .. :try_end_66} :catch_66
    .catch Lkorex/mail/search/SearchException; {:try_start_65 .. :try_end_66} :catch_6f
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_65 .. :try_end_66} :catch_83
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_65 .. :try_end_66} :catch_8e
    .catchall {:try_start_65 .. :try_end_66} :catchall_7b

    .line 2160
    :catch_66
    move-exception v1

    .line 2162
    .local v1, "cfx":Lcom/sun/mail/iap/CommandFailedException;
    :try_start_67
    invoke-super {p0, p1}, Lkorex/mail/Folder;->search(Lkorex/mail/search/SearchTerm;)[Lkorex/mail/Message;
    :try_end_6a
    .catchall {:try_start_67 .. :try_end_6a} :catchall_7b

    move-result-object v3

    .line 2167
    .end local v1    # "cfx":Lcom/sun/mail/iap/CommandFailedException;
    .end local v3    # "matchMsgs":[Lkorex/mail/Message;
    :goto_6b
    monitor-exit p0

    return-object v3

    .line 2157
    .restart local v3    # "matchMsgs":[Lkorex/mail/Message;
    .restart local v4    # "matches":[I
    :cond_6d
    :try_start_6d
    monitor-exit v9
    :try_end_6e
    .catchall {:try_start_6d .. :try_end_6e} :catchall_63

    goto :goto_6b

    .line 2163
    .end local v4    # "matches":[I
    :catch_6f
    move-exception v6

    .line 2165
    .local v6, "sex":Lkorex/mail/search/SearchException;
    :try_start_70
    iget-object v8, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    check-cast v8, Lcom/sun/mail/imap/IMAPStore;

    invoke-virtual {v8}, Lcom/sun/mail/imap/IMAPStore;->throwSearchException()Z

    move-result v8

    if-eqz v8, :cond_7e

    .line 2166
    throw v6
    :try_end_7b
    .catchall {:try_start_70 .. :try_end_7b} :catchall_7b

    .line 2133
    .end local v3    # "matchMsgs":[Lkorex/mail/Message;
    .end local v6    # "sex":Lkorex/mail/search/SearchException;
    :catchall_7b
    move-exception v8

    monitor-exit p0

    throw v8

    .line 2167
    .restart local v3    # "matchMsgs":[Lkorex/mail/Message;
    .restart local v6    # "sex":Lkorex/mail/search/SearchException;
    :cond_7e
    :try_start_7e
    invoke-super {p0, p1}, Lkorex/mail/Folder;->search(Lkorex/mail/search/SearchTerm;)[Lkorex/mail/Message;

    move-result-object v3

    goto :goto_6b

    .line 2168
    .end local v6    # "sex":Lkorex/mail/search/SearchException;
    :catch_83
    move-exception v0

    .line 2169
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    new-instance v8, Lkorex/mail/FolderClosedException;

    invoke-virtual {v0}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, p0, v9}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v8

    .line 2170
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_8e
    move-exception v5

    .line 2172
    .local v5, "pex":Lcom/sun/mail/iap/ProtocolException;
    new-instance v8, Lkorex/mail/MessagingException;

    invoke-virtual {v5}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v5}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v8
    :try_end_99
    .catchall {:try_start_7e .. :try_end_99} :catchall_7b
.end method

.method public declared-synchronized search(Lkorex/mail/search/SearchTerm;[Lkorex/mail/Message;)[Lkorex/mail/Message;
    .registers 15
    .param p1, "term"    # Lkorex/mail/search/SearchTerm;
    .param p2, "msgs"    # [Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2183
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkOpened()V

    .line 2185
    array-length v9, p2
    :try_end_5
    .catchall {:try_start_1 .. :try_end_5} :catchall_55

    if-nez v9, :cond_9

    .line 2212
    .end local p2    # "msgs":[Lkorex/mail/Message;
    :goto_7
    monitor-exit p0

    return-object p2

    .line 2190
    .restart local p2    # "msgs":[Lkorex/mail/Message;
    :cond_9
    const/4 v3, 0x0

    .line 2192
    .local v3, "matchMsgs":[Lkorex/mail/Message;
    :try_start_a
    iget-object v10, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v10
    :try_end_d
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_a .. :try_end_d} :catch_23
    .catch Lkorex/mail/search/SearchException; {:try_start_a .. :try_end_d} :catch_44
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_a .. :try_end_d} :catch_4a
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_a .. :try_end_d} :catch_58
    .catchall {:try_start_a .. :try_end_d} :catchall_55

    .line 2193
    :try_start_d
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v6

    .line 2194
    .local v6, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    const/4 v9, 0x0

    invoke-static {p2, v9}, Lcom/sun/mail/imap/Utility;->toMessageSet([Lkorex/mail/Message;Lcom/sun/mail/imap/Utility$Condition;)[Lcom/sun/mail/imap/protocol/MessageSet;

    move-result-object v5

    .line 2195
    .local v5, "ms":[Lcom/sun/mail/imap/protocol/MessageSet;
    if-nez v5, :cond_29

    .line 2196
    new-instance v9, Lkorex/mail/MessageRemovedException;

    const-string v11, "Messages have been removed"

    invoke-direct {v9, v11}, Lkorex/mail/MessageRemovedException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 2204
    .end local v5    # "ms":[Lcom/sun/mail/imap/protocol/MessageSet;
    .end local v6    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catchall_20
    move-exception v9

    monitor-exit v10
    :try_end_22
    .catchall {:try_start_d .. :try_end_22} :catchall_20

    :try_start_22
    throw v9
    :try_end_23
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_22 .. :try_end_23} :catch_23
    .catch Lkorex/mail/search/SearchException; {:try_start_22 .. :try_end_23} :catch_44
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_22 .. :try_end_23} :catch_4a
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_22 .. :try_end_23} :catch_58
    .catchall {:try_start_22 .. :try_end_23} :catchall_55

    .line 2207
    :catch_23
    move-exception v1

    .line 2209
    .local v1, "cfx":Lcom/sun/mail/iap/CommandFailedException;
    :try_start_24
    invoke-super {p0, p1, p2}, Lkorex/mail/Folder;->search(Lkorex/mail/search/SearchTerm;[Lkorex/mail/Message;)[Lkorex/mail/Message;
    :try_end_27
    .catchall {:try_start_24 .. :try_end_27} :catchall_55

    move-result-object p2

    goto :goto_7

    .line 2198
    .end local v1    # "cfx":Lcom/sun/mail/iap/CommandFailedException;
    .restart local v5    # "ms":[Lcom/sun/mail/imap/protocol/MessageSet;
    .restart local v6    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :cond_29
    :try_start_29
    invoke-virtual {v6, v5, p1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->search([Lcom/sun/mail/imap/protocol/MessageSet;Lkorex/mail/search/SearchTerm;)[I

    move-result-object v4

    .line 2199
    .local v4, "matches":[I
    if-eqz v4, :cond_41

    .line 2200
    array-length v9, v4

    new-array v3, v9, [Lcom/sun/mail/imap/IMAPMessage;

    .line 2201
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_33
    array-length v9, v4

    if-ge v2, v9, :cond_41

    .line 2202
    aget v9, v4, v2

    invoke-virtual {p0, v9}, Lcom/sun/mail/imap/IMAPFolder;->getMessageBySeqNumber(I)Lcom/sun/mail/imap/IMAPMessage;

    move-result-object v9

    aput-object v9, v3, v2

    .line 2201
    add-int/lit8 v2, v2, 0x1

    goto :goto_33

    .line 2204
    .end local v2    # "i":I
    :cond_41
    monitor-exit v10
    :try_end_42
    .catchall {:try_start_29 .. :try_end_42} :catchall_20

    move-object p2, v3

    .line 2205
    goto :goto_7

    .line 2210
    .end local v4    # "matches":[I
    .end local v5    # "ms":[Lcom/sun/mail/imap/protocol/MessageSet;
    .end local v6    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catch_44
    move-exception v8

    .line 2212
    .local v8, "sex":Lkorex/mail/search/SearchException;
    :try_start_45
    invoke-super {p0, p1, p2}, Lkorex/mail/Folder;->search(Lkorex/mail/search/SearchTerm;[Lkorex/mail/Message;)[Lkorex/mail/Message;

    move-result-object p2

    goto :goto_7

    .line 2213
    .end local v8    # "sex":Lkorex/mail/search/SearchException;
    :catch_4a
    move-exception v0

    .line 2214
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    new-instance v9, Lkorex/mail/FolderClosedException;

    invoke-virtual {v0}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, p0, v10}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v9
    :try_end_55
    .catchall {:try_start_45 .. :try_end_55} :catchall_55

    .line 2183
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    .end local v3    # "matchMsgs":[Lkorex/mail/Message;
    :catchall_55
    move-exception v9

    monitor-exit p0

    throw v9

    .line 2215
    .restart local v3    # "matchMsgs":[Lkorex/mail/Message;
    :catch_58
    move-exception v7

    .line 2217
    .local v7, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_59
    new-instance v9, Lkorex/mail/MessagingException;

    invoke-virtual {v7}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v7}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v9
    :try_end_63
    .catchall {:try_start_59 .. :try_end_63} :catchall_55
.end method

.method public declared-synchronized setFlags(IILkorex/mail/Flags;Z)V
    .registers 10
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "flag"    # Lkorex/mail/Flags;
    .param p4, "value"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1360
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkOpened()V

    .line 1361
    sub-int v4, p2, p1

    add-int/lit8 v4, v4, 0x1

    new-array v2, v4, [Lkorex/mail/Message;

    .line 1362
    .local v2, "msgs":[Lkorex/mail/Message;
    const/4 v0, 0x0

    .line 1363
    .local v0, "i":I
    move v3, p1

    .local v3, "n":I
    move v1, v0

    .end local v0    # "i":I
    .local v1, "i":I
    :goto_d
    if-gt v3, p2, :cond_1b

    .line 1364
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/IMAPFolder;->getMessage(I)Lkorex/mail/Message;

    move-result-object v4

    aput-object v4, v2, v1

    .line 1363
    add-int/lit8 v3, v3, 0x1

    move v1, v0

    .end local v0    # "i":I
    .restart local v1    # "i":I
    goto :goto_d

    .line 1365
    :cond_1b
    invoke-virtual {p0, v2, p3, p4}, Lcom/sun/mail/imap/IMAPFolder;->setFlags([Lkorex/mail/Message;Lkorex/mail/Flags;Z)V
    :try_end_1e
    .catchall {:try_start_1 .. :try_end_1e} :catchall_20

    .line 1366
    monitor-exit p0

    return-void

    .line 1360
    .end local v1    # "i":I
    .end local v2    # "msgs":[Lkorex/mail/Message;
    .end local v3    # "n":I
    :catchall_20
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized setFlags([ILkorex/mail/Flags;Z)V
    .registers 7
    .param p1, "msgnums"    # [I
    .param p2, "flag"    # Lkorex/mail/Flags;
    .param p3, "value"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1373
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkOpened()V

    .line 1374
    array-length v2, p1

    new-array v1, v2, [Lkorex/mail/Message;

    .line 1375
    .local v1, "msgs":[Lkorex/mail/Message;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    array-length v2, p1

    if-ge v0, v2, :cond_16

    .line 1376
    aget v2, p1, v0

    invoke-virtual {p0, v2}, Lcom/sun/mail/imap/IMAPFolder;->getMessage(I)Lkorex/mail/Message;

    move-result-object v2

    aput-object v2, v1, v0

    .line 1375
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 1377
    :cond_16
    invoke-virtual {p0, v1, p2, p3}, Lcom/sun/mail/imap/IMAPFolder;->setFlags([Lkorex/mail/Message;Lkorex/mail/Flags;Z)V
    :try_end_19
    .catchall {:try_start_1 .. :try_end_19} :catchall_1b

    .line 1378
    monitor-exit p0

    return-void

    .line 1373
    .end local v0    # "i":I
    .end local v1    # "msgs":[Lkorex/mail/Message;
    :catchall_1b
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized setFlags([Lkorex/mail/Message;Lkorex/mail/Flags;Z)V
    .registers 11
    .param p1, "msgs"    # [Lkorex/mail/Message;
    .param p2, "flag"    # Lkorex/mail/Flags;
    .param p3, "value"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1333
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkOpened()V

    .line 1334
    invoke-direct {p0, p2}, Lcom/sun/mail/imap/IMAPFolder;->checkFlags(Lkorex/mail/Flags;)V

    .line 1336
    array-length v4, p1
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_30

    if-nez v4, :cond_c

    .line 1353
    :goto_a
    monitor-exit p0

    return-void

    .line 1339
    :cond_c
    :try_start_c
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    monitor-enter v5
    :try_end_f
    .catchall {:try_start_c .. :try_end_f} :catchall_30

    .line 1341
    :try_start_f
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v2

    .line 1342
    .local v2, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    const/4 v4, 0x0

    invoke-static {p1, v4}, Lcom/sun/mail/imap/Utility;->toMessageSet([Lkorex/mail/Message;Lcom/sun/mail/imap/Utility$Condition;)[Lcom/sun/mail/imap/protocol/MessageSet;

    move-result-object v1

    .line 1343
    .local v1, "ms":[Lcom/sun/mail/imap/protocol/MessageSet;
    if-nez v1, :cond_33

    .line 1344
    new-instance v4, Lkorex/mail/MessageRemovedException;

    const-string v6, "Messages have been removed"

    invoke-direct {v4, v6}, Lkorex/mail/MessageRemovedException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_22
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_f .. :try_end_22} :catch_22
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_f .. :try_end_22} :catch_38
    .catchall {:try_start_f .. :try_end_22} :catchall_2d

    .line 1347
    .end local v1    # "ms":[Lcom/sun/mail/imap/protocol/MessageSet;
    .end local v2    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catch_22
    move-exception v0

    .line 1348
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_23
    new-instance v4, Lkorex/mail/FolderClosedException;

    invoke-virtual {v0}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, p0, v6}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v4

    .line 1352
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_2d
    move-exception v4

    monitor-exit v5
    :try_end_2f
    .catchall {:try_start_23 .. :try_end_2f} :catchall_2d

    :try_start_2f
    throw v4
    :try_end_30
    .catchall {:try_start_2f .. :try_end_30} :catchall_30

    .line 1333
    :catchall_30
    move-exception v4

    monitor-exit p0

    throw v4

    .line 1346
    .restart local v1    # "ms":[Lcom/sun/mail/imap/protocol/MessageSet;
    .restart local v2    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :cond_33
    :try_start_33
    invoke-virtual {v2, v1, p2, p3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->storeFlags([Lcom/sun/mail/imap/protocol/MessageSet;Lkorex/mail/Flags;Z)V
    :try_end_36
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_33 .. :try_end_36} :catch_22
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_33 .. :try_end_36} :catch_38
    .catchall {:try_start_33 .. :try_end_36} :catchall_2d

    .line 1352
    :try_start_36
    monitor-exit v5

    goto :goto_a

    .line 1349
    .end local v1    # "ms":[Lcom/sun/mail/imap/protocol/MessageSet;
    .end local v2    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catch_38
    move-exception v3

    .line 1350
    .local v3, "pex":Lcom/sun/mail/iap/ProtocolException;
    new-instance v4, Lkorex/mail/MessagingException;

    invoke-virtual {v3}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6, v3}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v4
    :try_end_43
    .catchall {:try_start_36 .. :try_end_43} :catchall_2d
.end method

.method public setQuota(Lkorex/mail/Quota;)V
    .registers 4
    .param p1, "quota"    # Lkorex/mail/Quota;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2697
    const-string v0, "QUOTA not supported"

    new-instance v1, Lcom/sun/mail/imap/IMAPFolder$13;

    invoke-direct {v1, p0, p1}, Lcom/sun/mail/imap/IMAPFolder$13;-><init>(Lcom/sun/mail/imap/IMAPFolder;Lkorex/mail/Quota;)V

    invoke-virtual {p0, v0, v1}, Lcom/sun/mail/imap/IMAPFolder;->doOptionalCommand(Ljava/lang/String;Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    .line 2705
    return-void
.end method

.method public declared-synchronized setSubscribed(Z)V
    .registers 3
    .param p1, "subscribe"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 748
    monitor-enter p0

    :try_start_1
    new-instance v0, Lcom/sun/mail/imap/IMAPFolder$5;

    invoke-direct {v0, p0, p1}, Lcom/sun/mail/imap/IMAPFolder$5;-><init>(Lcom/sun/mail/imap/IMAPFolder;Z)V

    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/IMAPFolder;->doCommandIgnoreFailure(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    .line 757
    monitor-exit p0

    return-void

    .line 748
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method startIdle(Lcom/sun/mail/imap/IdleManager;)V
    .registers 5
    .param p1, "im"    # Lcom/sun/mail/imap/IdleManager;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2955
    sget-boolean v1, Lcom/sun/mail/imap/IMAPFolder;->$assertionsDisabled:Z

    if-nez v1, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 2956
    :cond_10
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPFolder;->idleManager:Lcom/sun/mail/imap/IdleManager;

    .line 2957
    monitor-enter p0

    .line 2958
    :try_start_13
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPFolder;->checkOpened()V

    .line 2959
    const-string v1, "IDLE not supported"

    new-instance v2, Lcom/sun/mail/imap/IMAPFolder$19;

    invoke-direct {v2, p0}, Lcom/sun/mail/imap/IMAPFolder$19;-><init>(Lcom/sun/mail/imap/IMAPFolder;)V

    invoke-virtual {p0, v1, v2}, Lcom/sun/mail/imap/IMAPFolder;->doOptionalCommand(Ljava/lang/String;Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 2979
    .local v0, "started":Ljava/lang/Boolean;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_2b

    .line 2980
    monitor-exit p0

    .line 2982
    :goto_2a
    return-void

    .line 2981
    :cond_2b
    monitor-exit p0

    goto :goto_2a

    .end local v0    # "started":Ljava/lang/Boolean;
    :catchall_2d
    move-exception v1

    monitor-exit p0
    :try_end_2f
    .catchall {:try_start_13 .. :try_end_2f} :catchall_2d

    throw v1
.end method

.method protected declared-synchronized throwClosedException(Lcom/sun/mail/iap/ConnectionException;)V
    .registers 5
    .param p1, "cex"    # Lcom/sun/mail/iap/ConnectionException;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/FolderClosedException;,
            Lkorex/mail/StoreClosedException;
        }
    .end annotation

    .prologue
    .line 3365
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    if-eqz v0, :cond_d

    invoke-virtual {p1}, Lcom/sun/mail/iap/ConnectionException;->getProtocol()Lcom/sun/mail/iap/Protocol;

    move-result-object v0

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    if-eq v0, v1, :cond_15

    :cond_d
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    if-nez v0, :cond_22

    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPFolder;->reallyClosed:Z

    if-nez v0, :cond_22

    .line 3367
    :cond_15
    new-instance v0, Lkorex/mail/FolderClosedException;

    invoke-virtual {p1}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v0
    :try_end_1f
    .catchall {:try_start_1 .. :try_end_1f} :catchall_1f

    .line 3365
    :catchall_1f
    move-exception v0

    monitor-exit p0

    throw v0

    .line 3369
    :cond_22
    :try_start_22
    new-instance v0, Lkorex/mail/StoreClosedException;

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->store:Lkorex/mail/Store;

    invoke-virtual {p1}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lkorex/mail/StoreClosedException;-><init>(Lkorex/mail/Store;Ljava/lang/String;)V

    throw v0
    :try_end_2e
    .catchall {:try_start_22 .. :try_end_2e} :catchall_1f
.end method

.method waitIfIdle()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 3034
    sget-boolean v1, Lcom/sun/mail/imap/IMAPFolder;->$assertionsDisabled:Z

    if-nez v1, :cond_12

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 3035
    :cond_12
    :goto_12
    iget v1, p0, Lcom/sun/mail/imap/IMAPFolder;->idleState:I

    if-eqz v1, :cond_33

    .line 3036
    iget v1, p0, Lcom/sun/mail/imap/IMAPFolder;->idleState:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_25

    .line 3037
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder;->idleManager:Lcom/sun/mail/imap/IdleManager;

    .line 3038
    .local v0, "im":Lcom/sun/mail/imap/IdleManager;
    if-eqz v0, :cond_2d

    .line 3039
    invoke-virtual {v0, p0}, Lcom/sun/mail/imap/IdleManager;->requestAbort(Lcom/sun/mail/imap/IMAPFolder;)V

    .line 3042
    :goto_22
    const/4 v1, 0x2

    iput v1, p0, Lcom/sun/mail/imap/IMAPFolder;->idleState:I

    .line 3046
    .end local v0    # "im":Lcom/sun/mail/imap/IdleManager;
    :cond_25
    :try_start_25
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_2a
    .catch Ljava/lang/InterruptedException; {:try_start_25 .. :try_end_2a} :catch_2b

    goto :goto_12

    .line 3047
    :catch_2b
    move-exception v1

    goto :goto_12

    .line 3041
    .restart local v0    # "im":Lcom/sun/mail/imap/IdleManager;
    :cond_2d
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->idleAbort()V

    goto :goto_22

    .line 3049
    .end local v0    # "im":Lcom/sun/mail/imap/IdleManager;
    :cond_33
    return-void
.end method
