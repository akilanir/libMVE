.class Lcom/sun/mail/imap/IMAPStore$ConnectionPool;
.super Ljava/lang/Object;
.source "IMAPStore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sun/mail/imap/IMAPStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ConnectionPool"
.end annotation


# static fields
.field private static final ABORTING:I = 0x2

.field private static final IDLE:I = 0x1

.field private static final RUNNING:I


# instance fields
.field private authenticatedConnections:Ljava/util/Vector;

.field private final clientTimeoutInterval:J

.field private folders:Ljava/util/Vector;

.field private idleProtocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

.field private idleState:I

.field private lastTimePruned:J

.field private final logger:Lcom/sun/mail/util/MailLogger;

.field private final poolSize:I

.field private final pruningInterval:J

.field private final separateStoreConnection:Z

.field private final serverTimeoutInterval:J

.field private storeConnectionInUse:Z


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/sun/mail/util/MailLogger;Lkorex/mail/Session;)V
    .registers 15
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "plogger"    # Lcom/sun/mail/util/MailLogger;
    .param p3, "session"    # Lkorex/mail/Session;

    .prologue
    const/4 v10, 0x0

    const/4 v9, -0x1

    .line 336
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 258
    new-instance v5, Ljava/util/Vector;

    invoke-direct {v5}, Ljava/util/Vector;-><init>()V

    iput-object v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;

    .line 264
    iput-boolean v10, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->storeConnectionInUse:Z

    .line 333
    iput v10, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->idleState:I

    .line 337
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iput-wide v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->lastTimePruned:J

    .line 339
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mail."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".connectionpool.debug"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p3, v5, v10}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v1

    .line 341
    .local v1, "debug":Z
    const-string v5, "connectionpool"

    const-string v6, "DEBUG IMAP CP"

    invoke-virtual {p2, v5, v6, v1}, Lcom/sun/mail/util/MailLogger;->getSubLogger(Ljava/lang/String;Ljava/lang/String;Z)Lcom/sun/mail/util/MailLogger;

    move-result-object v5

    iput-object v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;

    .line 345
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mail."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".connectionpoolsize"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p3, v5, v9}, Lcom/sun/mail/util/PropUtil;->getIntSessionProperty(Lkorex/mail/Session;Ljava/lang/String;I)I

    move-result v4

    .line 347
    .local v4, "size":I
    if-lez v4, :cond_17f

    .line 348
    iput v4, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->poolSize:I

    .line 349
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v6, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v5

    if-eqz v5, :cond_82

    .line 350
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "mail.imap.connectionpoolsize: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->poolSize:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 355
    :cond_82
    :goto_82
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mail."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".connectionpooltimeout"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p3, v5, v9}, Lcom/sun/mail/util/PropUtil;->getIntSessionProperty(Lkorex/mail/Session;Ljava/lang/String;I)I

    move-result v0

    .line 357
    .local v0, "connectionPoolTimeout":I
    if-lez v0, :cond_184

    .line 358
    int-to-long v5, v0

    iput-wide v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->clientTimeoutInterval:J

    .line 359
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v6, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v5

    if-eqz v5, :cond_c8

    .line 360
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "mail.imap.connectionpooltimeout: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v7, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->clientTimeoutInterval:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 366
    :cond_c8
    :goto_c8
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mail."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".servertimeout"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p3, v5, v9}, Lcom/sun/mail/util/PropUtil;->getIntSessionProperty(Lkorex/mail/Session;Ljava/lang/String;I)I

    move-result v3

    .line 368
    .local v3, "serverTimeout":I
    if-lez v3, :cond_18b

    .line 369
    int-to-long v5, v3

    iput-wide v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->serverTimeoutInterval:J

    .line 370
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v6, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v5

    if-eqz v5, :cond_10e

    .line 371
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "mail.imap.servertimeout: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v7, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->serverTimeoutInterval:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 377
    :cond_10e
    :goto_10e
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mail."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".pruninginterval"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p3, v5, v9}, Lcom/sun/mail/util/PropUtil;->getIntSessionProperty(Lkorex/mail/Session;Ljava/lang/String;I)I

    move-result v2

    .line 379
    .local v2, "pruning":I
    if-lez v2, :cond_192

    .line 380
    int-to-long v5, v2

    iput-wide v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->pruningInterval:J

    .line 381
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v6, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v5

    if-eqz v5, :cond_154

    .line 382
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "mail.imap.pruninginterval: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v7, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->pruningInterval:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 389
    :cond_154
    :goto_154
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mail."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".separatestoreconnection"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 390
    invoke-static {p3, v5, v10}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->separateStoreConnection:Z

    .line 392
    iget-boolean v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->separateStoreConnection:Z

    if-eqz v5, :cond_17e

    .line 393
    iget-object v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v6, "dedicate a store connection"

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 395
    :cond_17e
    return-void

    .line 352
    .end local v0    # "connectionPoolTimeout":I
    .end local v2    # "pruning":I
    .end local v3    # "serverTimeout":I
    :cond_17f
    const/4 v5, 0x1

    iput v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->poolSize:I

    goto/16 :goto_82

    .line 363
    .restart local v0    # "connectionPoolTimeout":I
    :cond_184
    const-wide/32 v5, 0xafc8

    iput-wide v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->clientTimeoutInterval:J

    goto/16 :goto_c8

    .line 374
    .restart local v3    # "serverTimeout":I
    :cond_18b
    const-wide/32 v5, 0x1b7740

    iput-wide v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->serverTimeoutInterval:J

    goto/16 :goto_10e

    .line 385
    .restart local v2    # "pruning":I
    :cond_192
    const-wide/32 v5, 0xea60

    iput-wide v5, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->pruningInterval:J

    goto :goto_154
.end method

.method static synthetic access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .prologue
    .line 255
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;

    return-object v0
.end method

.method static synthetic access$100(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Z
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .prologue
    .line 255
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->separateStoreConnection:Z

    return v0
.end method

.method static synthetic access$1000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)I
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .prologue
    .line 255
    iget v0, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->idleState:I

    return v0
.end method

.method static synthetic access$1002(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;I)I
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPStore$ConnectionPool;
    .param p1, "x1"    # I

    .prologue
    .line 255
    iput p1, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->idleState:I

    return p1
.end method

.method static synthetic access$1100(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .prologue
    .line 255
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->idleProtocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    return-object v0
.end method

.method static synthetic access$1102(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;Lcom/sun/mail/imap/protocol/IMAPProtocol;)Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPStore$ConnectionPool;
    .param p1, "x1"    # Lcom/sun/mail/imap/protocol/IMAPProtocol;

    .prologue
    .line 255
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->idleProtocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    return-object p1
.end method

.method static synthetic access$200(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Z
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .prologue
    .line 255
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->storeConnectionInUse:Z

    return v0
.end method

.method static synthetic access$202(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPStore$ConnectionPool;
    .param p1, "x1"    # Z

    .prologue
    .line 255
    iput-boolean p1, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->storeConnectionInUse:Z

    return p1
.end method

.method static synthetic access$300(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)J
    .registers 3
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .prologue
    .line 255
    iget-wide v0, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->serverTimeoutInterval:J

    return-wide v0
.end method

.method static synthetic access$400(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .prologue
    .line 255
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->folders:Ljava/util/Vector;

    return-object v0
.end method

.method static synthetic access$402(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;Ljava/util/Vector;)Ljava/util/Vector;
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPStore$ConnectionPool;
    .param p1, "x1"    # Ljava/util/Vector;

    .prologue
    .line 255
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->folders:Ljava/util/Vector;

    return-object p1
.end method

.method static synthetic access$500(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Lcom/sun/mail/util/MailLogger;
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .prologue
    .line 255
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;

    return-object v0
.end method

.method static synthetic access$600(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)I
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .prologue
    .line 255
    iget v0, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->poolSize:I

    return v0
.end method

.method static synthetic access$700(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)J
    .registers 3
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .prologue
    .line 255
    iget-wide v0, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->lastTimePruned:J

    return-wide v0
.end method

.method static synthetic access$702(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;J)J
    .registers 3
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPStore$ConnectionPool;
    .param p1, "x1"    # J

    .prologue
    .line 255
    iput-wide p1, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->lastTimePruned:J

    return-wide p1
.end method

.method static synthetic access$800(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)J
    .registers 3
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .prologue
    .line 255
    iget-wide v0, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->pruningInterval:J

    return-wide v0
.end method

.method static synthetic access$900(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)J
    .registers 3
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .prologue
    .line 255
    iget-wide v0, p0, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->clientTimeoutInterval:J

    return-wide v0
.end method
