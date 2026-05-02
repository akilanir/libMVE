.class public Lcom/sun/mail/imap/MessageCache;
.super Ljava/lang/Object;
.source "MessageCache.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final SLOP:I = 0x40


# instance fields
.field private folder:Lcom/sun/mail/imap/IMAPFolder;

.field private logger:Lcom/sun/mail/util/MailLogger;

.field private messages:[Lcom/sun/mail/imap/IMAPMessage;

.field private seqnums:[I

.field private size:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 59
    const-class v0, Lcom/sun/mail/imap/MessageCache;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/sun/mail/imap/MessageCache;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>(IZ)V
    .registers 9
    .param p1, "size"    # I
    .param p2, "debug"    # Z

    .prologue
    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/imap/MessageCache;->folder:Lcom/sun/mail/imap/IMAPFolder;

    .line 114
    new-instance v0, Lcom/sun/mail/util/MailLogger;

    .line 115
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "messagecache"

    const-string v3, "DEBUG IMAP MC"

    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/sun/mail/util/MailLogger;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;ZLjava/io/PrintStream;)V

    iput-object v0, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    .line 117
    iget-object v0, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_3a

    .line 118
    iget-object v0, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "create DEBUG cache of size "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 119
    :cond_3a
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/sun/mail/imap/MessageCache;->ensureCapacity(II)V

    .line 120
    return-void
.end method

.method constructor <init>(Lcom/sun/mail/imap/IMAPFolder;Lcom/sun/mail/imap/IMAPStore;I)V
    .registers 8
    .param p1, "folder"    # Lcom/sun/mail/imap/IMAPFolder;
    .param p2, "store"    # Lcom/sun/mail/imap/IMAPStore;
    .param p3, "size"    # I

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    iput-object p1, p0, Lcom/sun/mail/imap/MessageCache;->folder:Lcom/sun/mail/imap/IMAPFolder;

    .line 102
    iget-object v0, p1, Lcom/sun/mail/imap/IMAPFolder;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v1, "messagecache"

    const-string v2, "DEBUG IMAP MC"

    .line 103
    invoke-virtual {p2}, Lcom/sun/mail/imap/IMAPStore;->getMessageCacheDebug()Z

    move-result v3

    .line 102
    invoke-virtual {v0, v1, v2, v3}, Lcom/sun/mail/util/MailLogger;->getSubLogger(Ljava/lang/String;Ljava/lang/String;Z)Lcom/sun/mail/util/MailLogger;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    .line 104
    iget-object v0, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 105
    iget-object v0, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "create cache of size "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 106
    :cond_37
    const/4 v0, 0x1

    invoke-direct {p0, p3, v0}, Lcom/sun/mail/imap/MessageCache;->ensureCapacity(II)V

    .line 107
    return-void
.end method

.method private ensureCapacity(II)V
    .registers 12
    .param p1, "newsize"    # I
    .param p2, "newSeqNum"    # I

    .prologue
    const/4 v8, 0x0

    .line 381
    iget-object v5, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    if-nez v5, :cond_e

    .line 382
    add-int/lit8 v5, p1, 0x40

    new-array v5, v5, [Lcom/sun/mail/imap/IMAPMessage;

    iput-object v5, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    .line 409
    :cond_b
    :goto_b
    iput p1, p0, Lcom/sun/mail/imap/MessageCache;->size:I

    .line 410
    return-void

    .line 383
    :cond_e
    iget-object v5, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    array-length v5, v5

    if-ge v5, p1, :cond_96

    .line 384
    iget-object v5, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v6, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v5

    if-eqz v5, :cond_35

    .line 385
    iget-object v5, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "expand capacity to "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 386
    :cond_35
    add-int/lit8 v5, p1, 0x40

    new-array v3, v5, [Lcom/sun/mail/imap/IMAPMessage;

    .line 387
    .local v3, "newm":[Lcom/sun/mail/imap/IMAPMessage;
    iget-object v5, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    iget-object v6, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    array-length v6, v6

    invoke-static {v5, v8, v3, v8, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 388
    iput-object v3, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    .line 389
    iget-object v5, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    if-eqz v5, :cond_b

    .line 390
    add-int/lit8 v5, p1, 0x40

    new-array v4, v5, [I

    .line 391
    .local v4, "news":[I
    iget-object v5, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    iget-object v6, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    array-length v6, v6

    invoke-static {v5, v8, v4, v8, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 392
    iget v0, p0, Lcom/sun/mail/imap/MessageCache;->size:I

    .local v0, "i":I
    :goto_55
    array-length v5, v4

    if-ge v0, v5, :cond_60

    .line 393
    add-int/lit8 v2, p2, 0x1

    .end local p2    # "newSeqNum":I
    .local v2, "newSeqNum":I
    aput p2, v4, v0

    .line 392
    add-int/lit8 v0, v0, 0x1

    move p2, v2

    .end local v2    # "newSeqNum":I
    .restart local p2    # "newSeqNum":I
    goto :goto_55

    .line 394
    :cond_60
    iput-object v4, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    .line 395
    iget-object v5, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v6, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 396
    iget-object v5, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "message "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " has sequence number "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    add-int/lit8 v8, p1, -0x1

    aget v7, v7, v8

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    goto/16 :goto_b

    .line 399
    .end local v0    # "i":I
    .end local v3    # "newm":[Lcom/sun/mail/imap/IMAPMessage;
    .end local v4    # "news":[I
    :cond_96
    iget v5, p0, Lcom/sun/mail/imap/MessageCache;->size:I

    if-ge p1, v5, :cond_b

    .line 401
    iget-object v5, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v6, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v5

    if-eqz v5, :cond_bc

    .line 402
    iget-object v5, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "shrink capacity to "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 403
    :cond_bc
    add-int/lit8 v1, p1, 0x1

    .local v1, "msgnum":I
    :goto_be
    iget v5, p0, Lcom/sun/mail/imap/MessageCache;->size:I

    if-gt v1, v5, :cond_b

    .line 404
    iget-object v5, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    add-int/lit8 v6, v1, -0x1

    const/4 v7, 0x0

    aput-object v7, v5, v6

    .line 405
    iget-object v5, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    if-eqz v5, :cond_d4

    .line 406
    iget-object v5, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    add-int/lit8 v6, v1, -0x1

    const/4 v7, -0x1

    aput v7, v5, v6

    .line 403
    :cond_d4
    add-int/lit8 v1, v1, 0x1

    goto :goto_be
.end method

.method private msgnumOf(I)I
    .registers 7
    .param p1, "seqnum"    # I

    .prologue
    const/4 v1, -0x1

    .line 430
    iget-object v2, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    if-nez v2, :cond_6

    .line 443
    .end local p1    # "seqnum":I
    :goto_5
    return p1

    .line 432
    .restart local p1    # "seqnum":I
    :cond_6
    const/4 v2, 0x1

    if-ge p1, v2, :cond_2d

    .line 433
    iget-object v2, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 434
    iget-object v2, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bad seqnum "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    :cond_2b
    move p1, v1

    .line 435
    goto :goto_5

    .line 437
    :cond_2d
    move v0, p1

    .local v0, "msgnum":I
    :goto_2e
    iget v2, p0, Lcom/sun/mail/imap/MessageCache;->size:I

    if-gt v0, v2, :cond_44

    .line 438
    iget-object v2, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    add-int/lit8 v3, v0, -0x1

    aget v2, v2, v3

    if-ne v2, p1, :cond_3c

    move p1, v0

    .line 439
    goto :goto_5

    .line 440
    :cond_3c
    iget-object v2, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    add-int/lit8 v3, v0, -0x1

    aget v2, v2, v3

    if-le v2, p1, :cond_46

    :cond_44
    move p1, v1

    .line 443
    goto :goto_5

    .line 437
    :cond_46
    add-int/lit8 v0, v0, 0x1

    goto :goto_2e
.end method

.method private shrink(II)V
    .registers 11
    .param p1, "newend"    # I
    .param p2, "oldend"    # I

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 336
    add-int/lit8 v3, p1, -0x1

    iput v3, p0, Lcom/sun/mail/imap/MessageCache;->size:I

    .line 337
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 338
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "size now "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/sun/mail/imap/MessageCache;->size:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 339
    :cond_2a
    iget v3, p0, Lcom/sun/mail/imap/MessageCache;->size:I

    if-nez v3, :cond_33

    .line 340
    iput-object v7, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    .line 341
    iput-object v7, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    .line 363
    :cond_32
    :goto_32
    return-void

    .line 342
    :cond_33
    iget v3, p0, Lcom/sun/mail/imap/MessageCache;->size:I

    const/16 v4, 0x40

    if-le v3, v4, :cond_6c

    iget v3, p0, Lcom/sun/mail/imap/MessageCache;->size:I

    iget-object v4, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    array-length v4, v4

    div-int/lit8 v4, v4, 0x2

    if-ge v3, v4, :cond_6c

    .line 344
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v4, "reallocate array"

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 345
    iget v3, p0, Lcom/sun/mail/imap/MessageCache;->size:I

    add-int/lit8 v3, v3, 0x40

    new-array v1, v3, [Lcom/sun/mail/imap/IMAPMessage;

    .line 346
    .local v1, "newm":[Lcom/sun/mail/imap/IMAPMessage;
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    iget v4, p0, Lcom/sun/mail/imap/MessageCache;->size:I

    invoke-static {v3, v6, v1, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 347
    iput-object v1, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    .line 348
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    if-eqz v3, :cond_32

    .line 349
    iget v3, p0, Lcom/sun/mail/imap/MessageCache;->size:I

    add-int/lit8 v3, v3, 0x40

    new-array v2, v3, [I

    .line 350
    .local v2, "news":[I
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    iget v4, p0, Lcom/sun/mail/imap/MessageCache;->size:I

    invoke-static {v3, v6, v2, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 351
    iput-object v2, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    goto :goto_32

    .line 354
    .end local v1    # "newm":[Lcom/sun/mail/imap/IMAPMessage;
    .end local v2    # "news":[I
    :cond_6c
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v3

    if-eqz v3, :cond_98

    .line 355
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "clean "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 357
    :cond_98
    move v0, p1

    .local v0, "msgnum":I
    :goto_99
    if-ge v0, p2, :cond_32

    .line 358
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    add-int/lit8 v4, v0, -0x1

    aput-object v7, v3, v4

    .line 359
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    if-eqz v3, :cond_ab

    .line 360
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    add-int/lit8 v4, v0, -0x1

    aput v6, v3, v4

    .line 357
    :cond_ab
    add-int/lit8 v0, v0, 0x1

    goto :goto_99
.end method


# virtual methods
.method public addMessages(II)V
    .registers 6
    .param p1, "count"    # I
    .param p2, "newSeqNum"    # I

    .prologue
    .line 370
    iget-object v0, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_28

    .line 371
    iget-object v0, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "add "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " messages"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 373
    :cond_28
    iget v0, p0, Lcom/sun/mail/imap/MessageCache;->size:I

    add-int/2addr v0, p1

    invoke-direct {p0, v0, p2}, Lcom/sun/mail/imap/MessageCache;->ensureCapacity(II)V

    .line 374
    return-void
.end method

.method public expungeMessage(I)V
    .registers 10
    .param p1, "seqnum"    # I

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 172
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/MessageCache;->msgnumOf(I)I

    move-result v2

    .line 173
    .local v2, "msgnum":I
    if-gez v2, :cond_2b

    .line 174
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 175
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "expunge no seqnum "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 200
    :cond_2a
    return-void

    .line 178
    :cond_2b
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    add-int/lit8 v4, v2, -0x1

    aget-object v1, v3, v4

    .line 179
    .local v1, "msg":Lcom/sun/mail/imap/IMAPMessage;
    if-eqz v1, :cond_58

    .line 180
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v3

    if-eqz v3, :cond_55

    .line 181
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "expunge existing "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 182
    :cond_55
    invoke-virtual {v1, v7}, Lcom/sun/mail/imap/IMAPMessage;->setExpunged(Z)V

    .line 184
    :cond_58
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    if-nez v3, :cond_8e

    .line 185
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v4, "create seqnums array"

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 186
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    array-length v3, v3

    new-array v3, v3, [I

    iput-object v3, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    .line 187
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_6b
    if-ge v0, v2, :cond_76

    .line 188
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    add-int/lit8 v4, v0, -0x1

    aput v0, v3, v4

    .line 187
    add-int/lit8 v0, v0, 0x1

    goto :goto_6b

    .line 189
    :cond_76
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    add-int/lit8 v4, v2, -0x1

    aput v6, v3, v4

    .line 190
    add-int/lit8 v0, v2, 0x1

    :goto_7e
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    array-length v3, v3

    if-gt v0, v3, :cond_2a

    .line 191
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    add-int/lit8 v4, v0, -0x1

    add-int/lit8 v5, v0, -0x1

    aput v5, v3, v4

    .line 190
    add-int/lit8 v0, v0, 0x1

    goto :goto_7e

    .line 193
    .end local v0    # "i":I
    :cond_8e
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    add-int/lit8 v4, v2, -0x1

    aput v6, v3, v4

    .line 194
    add-int/lit8 v0, v2, 0x1

    .restart local v0    # "i":I
    :goto_96
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    array-length v3, v3

    if-gt v0, v3, :cond_2a

    .line 195
    sget-boolean v3, Lcom/sun/mail/imap/MessageCache;->$assertionsDisabled:Z

    if-nez v3, :cond_ad

    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    add-int/lit8 v4, v0, -0x1

    aget v3, v3, v4

    if-ne v3, v7, :cond_ad

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 196
    :cond_ad
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    add-int/lit8 v4, v0, -0x1

    aget v3, v3, v4

    if-lez v3, :cond_bf

    .line 197
    iget-object v3, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    add-int/lit8 v4, v0, -0x1

    aget v5, v3, v4

    add-int/lit8 v5, v5, -0x1

    aput v5, v3, v4

    .line 194
    :cond_bf
    add-int/lit8 v0, v0, 0x1

    goto :goto_96
.end method

.method public getMessage(I)Lcom/sun/mail/imap/IMAPMessage;
    .registers 7
    .param p1, "msgnum"    # I

    .prologue
    const/4 v4, 0x1

    .line 135
    if-lt p1, v4, :cond_7

    iget v1, p0, Lcom/sun/mail/imap/MessageCache;->size:I

    if-le p1, v1, :cond_32

    .line 136
    :cond_7
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "message number ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") out of bounds ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/sun/mail/imap/MessageCache;->size:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 138
    :cond_32
    iget-object v1, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    add-int/lit8 v2, p1, -0x1

    aget-object v0, v1, v2

    .line 139
    .local v0, "msg":Lcom/sun/mail/imap/IMAPMessage;
    if-nez v0, :cond_78

    .line 140
    iget-object v1, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v1, v2}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_5c

    .line 141
    iget-object v1, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "create message number "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 142
    :cond_5c
    iget-object v1, p0, Lcom/sun/mail/imap/MessageCache;->folder:Lcom/sun/mail/imap/IMAPFolder;

    invoke-virtual {v1, p1}, Lcom/sun/mail/imap/IMAPFolder;->newIMAPMessage(I)Lcom/sun/mail/imap/IMAPMessage;

    move-result-object v0

    .line 143
    iget-object v1, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    add-int/lit8 v2, p1, -0x1

    aput-object v0, v1, v2

    .line 145
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/MessageCache;->seqnumOf(I)I

    move-result v1

    if-gtz v1, :cond_78

    .line 146
    iget-object v1, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v2, "it\'s expunged!"

    invoke-virtual {v1, v2}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 147
    invoke-virtual {v0, v4}, Lcom/sun/mail/imap/IMAPMessage;->setExpunged(Z)V

    .line 150
    :cond_78
    return-object v0
.end method

.method public getMessageBySeqnum(I)Lcom/sun/mail/imap/IMAPMessage;
    .registers 6
    .param p1, "seqnum"    # I

    .prologue
    .line 159
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/MessageCache;->msgnumOf(I)I

    move-result v0

    .line 160
    .local v0, "msgnum":I
    if-gez v0, :cond_2a

    .line 161
    iget-object v1, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v1, v2}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_28

    .line 162
    iget-object v1, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "no message seqnum "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 163
    :cond_28
    const/4 v1, 0x0

    .line 165
    :goto_29
    return-object v1

    :cond_2a
    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/MessageCache;->getMessage(I)Lcom/sun/mail/imap/IMAPMessage;

    move-result-object v1

    goto :goto_29
.end method

.method public removeExpungedMessages()[Lcom/sun/mail/imap/IMAPMessage;
    .registers 10

    .prologue
    .line 207
    iget-object v5, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v6, "remove expunged messages"

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 208
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 218
    .local v1, "mlist":Ljava/util/List;
    const/4 v3, 0x1

    .line 219
    .local v3, "oldnum":I
    const/4 v2, 0x1

    .line 220
    .local v2, "newnum":I
    :goto_e
    iget v5, p0, Lcom/sun/mail/imap/MessageCache;->size:I

    if-gt v3, v5, :cond_44

    .line 222
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/MessageCache;->seqnumOf(I)I

    move-result v5

    if-gtz v5, :cond_22

    .line 223
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/MessageCache;->getMessage(I)Lcom/sun/mail/imap/IMAPMessage;

    move-result-object v0

    .line 224
    .local v0, "m":Lcom/sun/mail/imap/IMAPMessage;
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 235
    .end local v0    # "m":Lcom/sun/mail/imap/IMAPMessage;
    :goto_1f
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 227
    :cond_22
    if-eq v2, v3, :cond_41

    .line 229
    iget-object v5, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    add-int/lit8 v6, v2, -0x1

    iget-object v7, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    add-int/lit8 v8, v3, -0x1

    aget-object v7, v7, v8

    aput-object v7, v5, v6

    .line 230
    iget-object v5, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    add-int/lit8 v6, v2, -0x1

    aget-object v5, v5, v6

    if-eqz v5, :cond_41

    .line 231
    iget-object v5, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    add-int/lit8 v6, v2, -0x1

    aget-object v5, v5, v6

    invoke-virtual {v5, v2}, Lcom/sun/mail/imap/IMAPMessage;->setMessageNumber(I)V

    .line 233
    :cond_41
    add-int/lit8 v2, v2, 0x1

    goto :goto_1f

    .line 237
    :cond_44
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    .line 238
    invoke-direct {p0, v2, v3}, Lcom/sun/mail/imap/MessageCache;->shrink(II)V

    .line 240
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    new-array v4, v5, [Lcom/sun/mail/imap/IMAPMessage;

    .line 241
    .local v4, "rmsgs":[Lcom/sun/mail/imap/IMAPMessage;
    iget-object v5, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v6, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v5

    if-eqz v5, :cond_73

    .line 242
    iget-object v5, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "return "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    array-length v7, v4

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 243
    :cond_73
    invoke-interface {v1, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 244
    return-object v4
.end method

.method public removeExpungedMessages([Lkorex/mail/Message;)[Lcom/sun/mail/imap/IMAPMessage;
    .registers 15
    .param p1, "msgs"    # [Lkorex/mail/Message;

    .prologue
    .line 254
    iget-object v9, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v10, "remove expunged messages"

    invoke-virtual {v9, v10}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 255
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 262
    .local v3, "mlist":Ljava/util/List;
    array-length v9, p1

    new-array v4, v9, [I

    .line 263
    .local v4, "mnum":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    array-length v9, p1

    if-ge v0, v9, :cond_1e

    .line 264
    aget-object v9, p1, v0

    invoke-virtual {v9}, Lkorex/mail/Message;->getMessageNumber()I

    move-result v9

    aput v9, v4, v0

    .line 263
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 265
    :cond_1e
    invoke-static {v4}, Ljava/util/Arrays;->sort([I)V

    .line 281
    const/4 v7, 0x1

    .line 282
    .local v7, "oldnum":I
    const/4 v6, 0x1

    .line 283
    .local v6, "newnum":I
    const/4 v5, 0x0

    .line 284
    .local v5, "mnumi":I
    const/4 v1, 0x0

    .line 285
    .local v1, "keepSeqnums":Z
    :goto_25
    iget v9, p0, Lcom/sun/mail/imap/MessageCache;->size:I

    if-gt v7, v9, :cond_88

    .line 291
    array-length v9, v4

    if-ge v5, v9, :cond_47

    aget v9, v4, v5

    if-ne v7, v9, :cond_47

    .line 293
    invoke-virtual {p0, v7}, Lcom/sun/mail/imap/MessageCache;->seqnumOf(I)I

    move-result v9

    if-gtz v9, :cond_47

    .line 294
    invoke-virtual {p0, v7}, Lcom/sun/mail/imap/MessageCache;->getMessage(I)Lcom/sun/mail/imap/IMAPMessage;

    move-result-object v2

    .line 295
    .local v2, "m":Lcom/sun/mail/imap/IMAPMessage;
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 301
    :goto_3d
    array-length v9, v4

    if-ge v5, v9, :cond_85

    aget v9, v4, v5

    if-gt v9, v7, :cond_85

    .line 302
    add-int/lit8 v5, v5, 0x1

    goto :goto_3d

    .line 305
    .end local v2    # "m":Lcom/sun/mail/imap/IMAPMessage;
    :cond_47
    if-eq v6, v7, :cond_76

    .line 307
    iget-object v9, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    add-int/lit8 v10, v6, -0x1

    iget-object v11, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    add-int/lit8 v12, v7, -0x1

    aget-object v11, v11, v12

    aput-object v11, v9, v10

    .line 308
    iget-object v9, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    add-int/lit8 v10, v6, -0x1

    aget-object v9, v9, v10

    if-eqz v9, :cond_66

    .line 309
    iget-object v9, p0, Lcom/sun/mail/imap/MessageCache;->messages:[Lcom/sun/mail/imap/IMAPMessage;

    add-int/lit8 v10, v6, -0x1

    aget-object v9, v9, v10

    invoke-virtual {v9, v6}, Lcom/sun/mail/imap/IMAPMessage;->setMessageNumber(I)V

    .line 310
    :cond_66
    iget-object v9, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    if-eqz v9, :cond_76

    .line 311
    iget-object v9, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    add-int/lit8 v10, v6, -0x1

    iget-object v11, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    add-int/lit8 v12, v7, -0x1

    aget v11, v11, v12

    aput v11, v9, v10

    .line 313
    :cond_76
    iget-object v9, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    if-eqz v9, :cond_83

    iget-object v9, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    add-int/lit8 v10, v6, -0x1

    aget v9, v9, v10

    if-eq v9, v6, :cond_83

    .line 314
    const/4 v1, 0x1

    .line 315
    :cond_83
    add-int/lit8 v6, v6, 0x1

    .line 317
    :cond_85
    add-int/lit8 v7, v7, 0x1

    goto :goto_25

    .line 320
    :cond_88
    if-nez v1, :cond_8d

    .line 321
    const/4 v9, 0x0

    iput-object v9, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    .line 322
    :cond_8d
    invoke-direct {p0, v6, v7}, Lcom/sun/mail/imap/MessageCache;->shrink(II)V

    .line 324
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v9

    new-array v8, v9, [Lcom/sun/mail/imap/IMAPMessage;

    .line 325
    .local v8, "rmsgs":[Lcom/sun/mail/imap/IMAPMessage;
    iget-object v9, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v10, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v9, v10}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v9

    if-eqz v9, :cond_b9

    .line 326
    iget-object v9, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "return "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    array-length v11, v8

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 327
    :cond_b9
    invoke-interface {v3, v8}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 328
    return-object v8
.end method

.method public seqnumOf(I)I
    .registers 6
    .param p1, "msgnum"    # I

    .prologue
    .line 416
    iget-object v0, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    if-nez v0, :cond_5

    .line 422
    .end local p1    # "msgnum":I
    :goto_4
    return p1

    .line 419
    .restart local p1    # "msgnum":I
    :cond_5
    iget-object v0, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 420
    iget-object v0, p0, Lcom/sun/mail/imap/MessageCache;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "msgnum "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is seqnum "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    add-int/lit8 v3, p1, -0x1

    aget v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 422
    :cond_37
    iget-object v0, p0, Lcom/sun/mail/imap/MessageCache;->seqnums:[I

    add-int/lit8 v1, p1, -0x1

    aget p1, v0, v1

    goto :goto_4
.end method

.method public size()I
    .registers 2

    .prologue
    .line 126
    iget v0, p0, Lcom/sun/mail/imap/MessageCache;->size:I

    return v0
.end method
