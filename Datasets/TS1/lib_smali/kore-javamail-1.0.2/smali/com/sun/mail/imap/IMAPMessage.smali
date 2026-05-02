.class public Lcom/sun/mail/imap/IMAPMessage;
.super Lkorex/mail/internet/MimeMessage;
.source "IMAPMessage.java"

# interfaces
.implements Lcom/sun/mail/util/ReadableMime;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;
    }
.end annotation


# static fields
.field static final EnvelopeCmd:Ljava/lang/String; = "ENVELOPE INTERNALDATE RFC822.SIZE"


# instance fields
.field private volatile bodyLoaded:Z

.field protected bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

.field private description:Ljava/lang/String;

.field protected envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

.field private volatile headersLoaded:Z

.field protected items:Ljava/util/Map;

.field private loadedHeaders:Ljava/util/Hashtable;

.field private volatile modseq:J

.field private peek:Ljava/lang/Boolean;

.field private receivedDate:Ljava/util/Date;

.field protected sectionId:Ljava/lang/String;

.field private size:I

.field private subject:Ljava/lang/String;

.field private type:Ljava/lang/String;

.field private volatile uid:J


# direct methods
.method protected constructor <init>(Lcom/sun/mail/imap/IMAPFolder;I)V
    .registers 7
    .param p1, "folder"    # Lcom/sun/mail/imap/IMAPFolder;
    .param p2, "msgnum"    # I

    .prologue
    const-wide/16 v2, -0x1

    const/4 v1, 0x0

    .line 141
    invoke-direct {p0, p1, p2}, Lkorex/mail/internet/MimeMessage;-><init>(Lkorex/mail/Folder;I)V

    .line 96
    const/4 v0, -0x1

    iput v0, p0, Lcom/sun/mail/imap/IMAPMessage;->size:I

    .line 101
    iput-wide v2, p0, Lcom/sun/mail/imap/IMAPMessage;->uid:J

    .line 104
    iput-wide v2, p0, Lcom/sun/mail/imap/IMAPMessage;->modseq:J

    .line 116
    iput-boolean v1, p0, Lcom/sun/mail/imap/IMAPMessage;->headersLoaded:Z

    .line 119
    iput-boolean v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    .line 129
    new-instance v0, Ljava/util/Hashtable;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/Hashtable;-><init>(I)V

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->loadedHeaders:Ljava/util/Hashtable;

    .line 142
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->flags:Lkorex/mail/Flags;

    .line 143
    return-void
.end method

.method protected constructor <init>(Lkorex/mail/Session;)V
    .registers 6
    .param p1, "session"    # Lkorex/mail/Session;

    .prologue
    const-wide/16 v2, -0x1

    const/4 v1, 0x0

    .line 151
    invoke-direct {p0, p1}, Lkorex/mail/internet/MimeMessage;-><init>(Lkorex/mail/Session;)V

    .line 96
    const/4 v0, -0x1

    iput v0, p0, Lcom/sun/mail/imap/IMAPMessage;->size:I

    .line 101
    iput-wide v2, p0, Lcom/sun/mail/imap/IMAPMessage;->uid:J

    .line 104
    iput-wide v2, p0, Lcom/sun/mail/imap/IMAPMessage;->modseq:J

    .line 116
    iput-boolean v1, p0, Lcom/sun/mail/imap/IMAPMessage;->headersLoaded:Z

    .line 119
    iput-boolean v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    .line 129
    new-instance v0, Ljava/util/Hashtable;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/Hashtable;-><init>(I)V

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->loadedHeaders:Ljava/util/Hashtable;

    .line 152
    return-void
.end method

.method private _getBodyStructure()Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;
    .registers 2

    .prologue
    .line 1608
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    return-object v0
.end method

.method private _getEnvelope()Lcom/sun/mail/imap/protocol/ENVELOPE;
    .registers 2

    .prologue
    .line 1604
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    return-object v0
.end method

.method private _getFlags()Lkorex/mail/Flags;
    .registers 2

    .prologue
    .line 1600
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->flags:Lkorex/mail/Flags;

    return-object v0
.end method

.method private aaclone([Lkorex/mail/internet/InternetAddress;)[Lkorex/mail/internet/InternetAddress;
    .registers 3
    .param p1, "aa"    # [Lkorex/mail/internet/InternetAddress;

    .prologue
    .line 1593
    if-nez p1, :cond_4

    .line 1594
    const/4 v0, 0x0

    .line 1596
    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p1}, [Lkorex/mail/internet/InternetAddress;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkorex/mail/internet/InternetAddress;

    check-cast v0, [Lkorex/mail/internet/InternetAddress;

    goto :goto_3
.end method

.method static synthetic access$000(Lcom/sun/mail/imap/IMAPMessage;)Lcom/sun/mail/imap/protocol/ENVELOPE;
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPMessage;

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->_getEnvelope()Lcom/sun/mail/imap/protocol/ENVELOPE;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/sun/mail/imap/IMAPMessage;)Z
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPMessage;

    .prologue
    .line 80
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    return v0
.end method

.method static synthetic access$200(Lcom/sun/mail/imap/IMAPMessage;)Lkorex/mail/Flags;
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPMessage;

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->_getFlags()Lkorex/mail/Flags;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/sun/mail/imap/IMAPMessage;)Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPMessage;

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->_getBodyStructure()Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/sun/mail/imap/IMAPMessage;)Z
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPMessage;

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->areHeadersLoaded()Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/sun/mail/imap/IMAPMessage;)I
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPMessage;

    .prologue
    .line 80
    iget v0, p0, Lcom/sun/mail/imap/IMAPMessage;->size:I

    return v0
.end method

.method static synthetic access$600(Lcom/sun/mail/imap/IMAPMessage;Ljava/lang/String;)Z
    .registers 3
    .param p0, "x0"    # Lcom/sun/mail/imap/IMAPMessage;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/IMAPMessage;->isHeaderLoaded(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private areHeadersLoaded()Z
    .registers 2

    .prologue
    .line 1551
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPMessage;->headersLoaded:Z

    return v0
.end method

.method private isHeaderLoaded(Ljava/lang/String;)Z
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1565
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPMessage;->headersLoaded:Z

    if-eqz v0, :cond_6

    .line 1566
    const/4 v0, 0x1

    .line 1568
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->loadedHeaders:Ljava/util/Hashtable;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method private declared-synchronized loadBODYSTRUCTURE()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1446
    monitor-enter p0

    :try_start_1
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_2f

    if-eqz v3, :cond_7

    .line 1473
    :goto_5
    monitor-exit p0

    return-void

    .line 1450
    :cond_7
    :try_start_7
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getMessageCacheLock()Ljava/lang/Object;

    move-result-object v4

    monitor-enter v4
    :try_end_c
    .catchall {:try_start_7 .. :try_end_c} :catchall_2f

    .line 1452
    :try_start_c
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v1

    .line 1456
    .local v1, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 1458
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchBodyStructure(I)Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    move-result-object v3

    iput-object v3, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;
    :try_end_1d
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_c .. :try_end_1d} :catch_32
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_c .. :try_end_1d} :catch_3f
    .catchall {:try_start_c .. :try_end_1d} :catchall_2c

    .line 1465
    :try_start_1d
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    if-nez v3, :cond_4d

    .line 1469
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->forceCheckExpunged()V

    .line 1470
    new-instance v3, Lkorex/mail/MessagingException;

    const-string v5, "Unable to load BODYSTRUCTURE"

    invoke-direct {v3, v5}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1472
    .end local v1    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catchall_2c
    move-exception v3

    monitor-exit v4
    :try_end_2e
    .catchall {:try_start_1d .. :try_end_2e} :catchall_2c

    :try_start_2e
    throw v3
    :try_end_2f
    .catchall {:try_start_2e .. :try_end_2f} :catchall_2f

    .line 1446
    :catchall_2f
    move-exception v3

    monitor-exit p0

    throw v3

    .line 1459
    :catch_32
    move-exception v0

    .line 1460
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_33
    new-instance v3, Lkorex/mail/FolderClosedException;

    iget-object v5, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    invoke-virtual {v0}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v5, v6}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v3

    .line 1461
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_3f
    move-exception v2

    .line 1462
    .local v2, "pex":Lcom/sun/mail/iap/ProtocolException;
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->forceCheckExpunged()V

    .line 1463
    new-instance v3, Lkorex/mail/MessagingException;

    invoke-virtual {v2}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3

    .line 1472
    .end local v2    # "pex":Lcom/sun/mail/iap/ProtocolException;
    .restart local v1    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :cond_4d
    monitor-exit v4
    :try_end_4e
    .catchall {:try_start_33 .. :try_end_4e} :catchall_2c

    goto :goto_5
.end method

.method private declared-synchronized loadEnvelope()V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1386
    monitor-enter p0

    :try_start_1
    iget-object v10, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_70

    if-eqz v10, :cond_7

    .line 1439
    :cond_5
    monitor-exit p0

    return-void

    .line 1389
    :cond_7
    const/4 v8, 0x0

    .line 1392
    .local v8, "r":[Lcom/sun/mail/iap/Response;
    :try_start_8
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getMessageCacheLock()Ljava/lang/Object;

    move-result-object v11

    monitor-enter v11
    :try_end_d
    .catchall {:try_start_8 .. :try_end_d} :catchall_70

    .line 1394
    :try_start_d
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v6

    .line 1396
    .local v6, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 1398
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v9

    .line 1399
    .local v9, "seqnum":I
    const-string v10, "ENVELOPE INTERNALDATE RFC822.SIZE"

    invoke-virtual {v6, v9, v10}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetch(ILjava/lang/String;)[Lcom/sun/mail/iap/Response;

    move-result-object v8

    .line 1401
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1f
    array-length v10, v8

    if-ge v3, v10, :cond_8c

    .line 1404
    aget-object v10, v8, v3

    if-eqz v10, :cond_36

    aget-object v10, v8, v3

    instance-of v10, v10, Lcom/sun/mail/imap/protocol/FetchResponse;

    if-eqz v10, :cond_36

    aget-object v10, v8, v3

    check-cast v10, Lcom/sun/mail/imap/protocol/FetchResponse;

    .line 1406
    invoke-virtual {v10}, Lcom/sun/mail/imap/protocol/FetchResponse;->getNumber()I

    move-result v10

    if-eq v10, v9, :cond_39

    .line 1401
    :cond_36
    add-int/lit8 v3, v3, 0x1

    goto :goto_1f

    .line 1409
    :cond_39
    aget-object v2, v8, v3

    check-cast v2, Lcom/sun/mail/imap/protocol/FetchResponse;

    .line 1412
    .local v2, "f":Lcom/sun/mail/imap/protocol/FetchResponse;
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/FetchResponse;->getItemCount()I

    move-result v1

    .line 1413
    .local v1, "count":I
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_42
    if-ge v5, v1, :cond_36

    .line 1414
    invoke-virtual {v2, v5}, Lcom/sun/mail/imap/protocol/FetchResponse;->getItem(I)Lcom/sun/mail/imap/protocol/Item;

    move-result-object v4

    .line 1416
    .local v4, "item":Lcom/sun/mail/imap/protocol/Item;
    instance-of v10, v4, Lcom/sun/mail/imap/protocol/ENVELOPE;

    if-eqz v10, :cond_53

    .line 1417
    check-cast v4, Lcom/sun/mail/imap/protocol/ENVELOPE;

    .end local v4    # "item":Lcom/sun/mail/imap/protocol/Item;
    iput-object v4, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    .line 1413
    :cond_50
    :goto_50
    add-int/lit8 v5, v5, 0x1

    goto :goto_42

    .line 1418
    .restart local v4    # "item":Lcom/sun/mail/imap/protocol/Item;
    :cond_53
    instance-of v10, v4, Lcom/sun/mail/imap/protocol/INTERNALDATE;

    if-eqz v10, :cond_73

    .line 1419
    check-cast v4, Lcom/sun/mail/imap/protocol/INTERNALDATE;

    .end local v4    # "item":Lcom/sun/mail/imap/protocol/Item;
    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/INTERNALDATE;->getDate()Ljava/util/Date;

    move-result-object v10

    iput-object v10, p0, Lcom/sun/mail/imap/IMAPMessage;->receivedDate:Ljava/util/Date;
    :try_end_5f
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_d .. :try_end_5f} :catch_60
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_d .. :try_end_5f} :catch_7e
    .catchall {:try_start_d .. :try_end_5f} :catchall_6d

    goto :goto_50

    .line 1428
    .end local v1    # "count":I
    .end local v2    # "f":Lcom/sun/mail/imap/protocol/FetchResponse;
    .end local v3    # "i":I
    .end local v5    # "j":I
    .end local v6    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v9    # "seqnum":I
    :catch_60
    move-exception v0

    .line 1429
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_61
    new-instance v10, Lkorex/mail/FolderClosedException;

    iget-object v12, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    invoke-virtual {v0}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v10, v12, v13}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v10

    .line 1435
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_6d
    move-exception v10

    monitor-exit v11
    :try_end_6f
    .catchall {:try_start_61 .. :try_end_6f} :catchall_6d

    :try_start_6f
    throw v10
    :try_end_70
    .catchall {:try_start_6f .. :try_end_70} :catchall_70

    .line 1386
    .end local v8    # "r":[Lcom/sun/mail/iap/Response;
    :catchall_70
    move-exception v10

    monitor-exit p0

    throw v10

    .line 1420
    .restart local v1    # "count":I
    .restart local v2    # "f":Lcom/sun/mail/imap/protocol/FetchResponse;
    .restart local v3    # "i":I
    .restart local v4    # "item":Lcom/sun/mail/imap/protocol/Item;
    .restart local v5    # "j":I
    .restart local v6    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .restart local v8    # "r":[Lcom/sun/mail/iap/Response;
    .restart local v9    # "seqnum":I
    :cond_73
    :try_start_73
    instance-of v10, v4, Lcom/sun/mail/imap/protocol/RFC822SIZE;

    if-eqz v10, :cond_50

    .line 1421
    check-cast v4, Lcom/sun/mail/imap/protocol/RFC822SIZE;

    .end local v4    # "item":Lcom/sun/mail/imap/protocol/Item;
    iget v10, v4, Lcom/sun/mail/imap/protocol/RFC822SIZE;->size:I

    iput v10, p0, Lcom/sun/mail/imap/IMAPMessage;->size:I
    :try_end_7d
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_73 .. :try_end_7d} :catch_60
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_73 .. :try_end_7d} :catch_7e
    .catchall {:try_start_73 .. :try_end_7d} :catchall_6d

    goto :goto_50

    .line 1430
    .end local v1    # "count":I
    .end local v2    # "f":Lcom/sun/mail/imap/protocol/FetchResponse;
    .end local v3    # "i":I
    .end local v5    # "j":I
    .end local v6    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v9    # "seqnum":I
    :catch_7e
    move-exception v7

    .line 1431
    .local v7, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_7f
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->forceCheckExpunged()V

    .line 1432
    new-instance v10, Lkorex/mail/MessagingException;

    invoke-virtual {v7}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v12, v7}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v10
    :try_end_8c
    .catchall {:try_start_7f .. :try_end_8c} :catchall_6d

    .line 1426
    .end local v7    # "pex":Lcom/sun/mail/iap/ProtocolException;
    .restart local v3    # "i":I
    .restart local v6    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .restart local v9    # "seqnum":I
    :cond_8c
    :try_start_8c
    invoke-virtual {v6, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 1427
    array-length v10, v8

    add-int/lit8 v10, v10, -0x1

    aget-object v10, v8, v10

    invoke-virtual {v6, v10}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V
    :try_end_97
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_8c .. :try_end_97} :catch_60
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_8c .. :try_end_97} :catch_7e
    .catchall {:try_start_8c .. :try_end_97} :catchall_6d

    .line 1435
    :try_start_97
    monitor-exit v11
    :try_end_98
    .catchall {:try_start_97 .. :try_end_98} :catchall_6d

    .line 1437
    :try_start_98
    iget-object v10, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    if-nez v10, :cond_5

    .line 1438
    new-instance v10, Lkorex/mail/MessagingException;

    const-string v11, "Failed to load IMAP envelope"

    invoke-direct {v10, v11}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_a4
    .catchall {:try_start_98 .. :try_end_a4} :catchall_70
.end method

.method private declared-synchronized loadFlags()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1522
    monitor-enter p0

    :try_start_1
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPMessage;->flags:Lkorex/mail/Flags;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_2d

    if-eqz v3, :cond_7

    .line 1545
    :goto_5
    monitor-exit p0

    return-void

    .line 1526
    :cond_7
    :try_start_7
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getMessageCacheLock()Ljava/lang/Object;

    move-result-object v4

    monitor-enter v4
    :try_end_c
    .catchall {:try_start_7 .. :try_end_c} :catchall_2d

    .line 1528
    :try_start_c
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v1

    .line 1532
    .local v1, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 1534
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchFlags(I)Lkorex/mail/Flags;

    move-result-object v3

    iput-object v3, p0, Lcom/sun/mail/imap/IMAPMessage;->flags:Lkorex/mail/Flags;

    .line 1536
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPMessage;->flags:Lkorex/mail/Flags;

    if-nez v3, :cond_28

    .line 1537
    new-instance v3, Lkorex/mail/Flags;

    invoke-direct {v3}, Lkorex/mail/Flags;-><init>()V

    iput-object v3, p0, Lcom/sun/mail/imap/IMAPMessage;->flags:Lkorex/mail/Flags;
    :try_end_28
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_c .. :try_end_28} :catch_30
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_c .. :try_end_28} :catch_3d
    .catchall {:try_start_c .. :try_end_28} :catchall_2a

    .line 1544
    :cond_28
    :try_start_28
    monitor-exit v4

    goto :goto_5

    .end local v1    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catchall_2a
    move-exception v3

    monitor-exit v4
    :try_end_2c
    .catchall {:try_start_28 .. :try_end_2c} :catchall_2a

    :try_start_2c
    throw v3
    :try_end_2d
    .catchall {:try_start_2c .. :try_end_2d} :catchall_2d

    .line 1522
    :catchall_2d
    move-exception v3

    monitor-exit p0

    throw v3

    .line 1538
    :catch_30
    move-exception v0

    .line 1539
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_31
    new-instance v3, Lkorex/mail/FolderClosedException;

    iget-object v5, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    invoke-virtual {v0}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v5, v6}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v3

    .line 1540
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_3d
    move-exception v2

    .line 1541
    .local v2, "pex":Lcom/sun/mail/iap/ProtocolException;
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->forceCheckExpunged()V

    .line 1542
    new-instance v3, Lkorex/mail/MessagingException;

    invoke-virtual {v2}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3
    :try_end_4b
    .catchall {:try_start_31 .. :try_end_4b} :catchall_2a
.end method

.method private declared-synchronized loadHeaders()V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1479
    monitor-enter p0

    :try_start_1
    iget-boolean v6, p0, Lcom/sun/mail/imap/IMAPMessage;->headersLoaded:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_39

    if-eqz v6, :cond_7

    .line 1516
    :goto_5
    monitor-exit p0

    return-void

    .line 1482
    :cond_7
    const/4 v2, 0x0

    .line 1485
    .local v2, "is":Ljava/io/InputStream;
    :try_start_8
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getMessageCacheLock()Ljava/lang/Object;

    move-result-object v7

    monitor-enter v7
    :try_end_d
    .catchall {:try_start_8 .. :try_end_d} :catchall_39

    .line 1487
    :try_start_d
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v3

    .line 1491
    .local v3, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 1493
    invoke-virtual {v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isREV1()Z

    move-result v6

    if-eqz v6, :cond_3c

    .line 1494
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v6

    const-string v8, "HEADER"

    .line 1495
    invoke-direct {p0, v8}, Lcom/sun/mail/imap/IMAPMessage;->toSection(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1494
    invoke-virtual {v3, v6, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->peekBody(ILjava/lang/String;)Lcom/sun/mail/imap/protocol/BODY;

    move-result-object v0

    .line 1496
    .local v0, "b":Lcom/sun/mail/imap/protocol/BODY;
    if-eqz v0, :cond_2e

    .line 1497
    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/BODY;->getByteArrayInputStream()Ljava/io/ByteArrayInputStream;
    :try_end_2d
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_d .. :try_end_2d} :catch_4d
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_d .. :try_end_2d} :catch_5d
    .catchall {:try_start_d .. :try_end_2d} :catchall_5a

    move-result-object v2

    .line 1510
    .end local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    :cond_2e
    :goto_2e
    :try_start_2e
    monitor-exit v7
    :try_end_2f
    .catchall {:try_start_2e .. :try_end_2f} :catchall_5a

    .line 1512
    if-nez v2, :cond_6b

    .line 1513
    :try_start_31
    new-instance v6, Lkorex/mail/MessagingException;

    const-string v7, "Cannot load header"

    invoke-direct {v6, v7}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_39
    .catchall {:try_start_31 .. :try_end_39} :catchall_39

    .line 1479
    .end local v2    # "is":Ljava/io/InputStream;
    .end local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catchall_39
    move-exception v6

    monitor-exit p0

    throw v6

    .line 1499
    .restart local v2    # "is":Ljava/io/InputStream;
    .restart local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :cond_3c
    :try_start_3c
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v6

    const-string v8, "HEADER"

    invoke-virtual {v3, v6, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchRFC822(ILjava/lang/String;)Lcom/sun/mail/imap/protocol/RFC822DATA;

    move-result-object v5

    .line 1501
    .local v5, "rd":Lcom/sun/mail/imap/protocol/RFC822DATA;
    if-eqz v5, :cond_2e

    .line 1502
    invoke-virtual {v5}, Lcom/sun/mail/imap/protocol/RFC822DATA;->getByteArrayInputStream()Ljava/io/ByteArrayInputStream;
    :try_end_4b
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_3c .. :try_end_4b} :catch_4d
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_3c .. :try_end_4b} :catch_5d
    .catchall {:try_start_3c .. :try_end_4b} :catchall_5a

    move-result-object v2

    goto :goto_2e

    .line 1504
    .end local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v5    # "rd":Lcom/sun/mail/imap/protocol/RFC822DATA;
    :catch_4d
    move-exception v1

    .line 1505
    .local v1, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_4e
    new-instance v6, Lkorex/mail/FolderClosedException;

    iget-object v8, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v6, v8, v9}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v6

    .line 1510
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_5a
    move-exception v6

    monitor-exit v7
    :try_end_5c
    .catchall {:try_start_4e .. :try_end_5c} :catchall_5a

    :try_start_5c
    throw v6
    :try_end_5d
    .catchall {:try_start_5c .. :try_end_5d} :catchall_39

    .line 1506
    :catch_5d
    move-exception v4

    .line 1507
    .local v4, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_5e
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->forceCheckExpunged()V

    .line 1508
    new-instance v6, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6
    :try_end_6b
    .catchall {:try_start_5e .. :try_end_6b} :catchall_5a

    .line 1514
    .end local v4    # "pex":Lcom/sun/mail/iap/ProtocolException;
    .restart local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :cond_6b
    :try_start_6b
    new-instance v6, Lkorex/mail/internet/InternetHeaders;

    invoke-direct {v6, v2}, Lkorex/mail/internet/InternetHeaders;-><init>(Ljava/io/InputStream;)V

    iput-object v6, p0, Lcom/sun/mail/imap/IMAPMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    .line 1515
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/sun/mail/imap/IMAPMessage;->headersLoaded:Z
    :try_end_75
    .catchall {:try_start_6b .. :try_end_75} :catchall_39

    goto :goto_5
.end method

.method private setHeaderLoaded(Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1575
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->loadedHeaders:Ljava/util/Hashtable;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1576
    return-void
.end method

.method private setHeadersLoaded(Z)V
    .registers 2
    .param p1, "loaded"    # Z

    .prologue
    .line 1558
    iput-boolean p1, p0, Lcom/sun/mail/imap/IMAPMessage;->headersLoaded:Z

    .line 1559
    return-void
.end method

.method private toSection(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "what"    # Ljava/lang/String;

    .prologue
    .line 1583
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->sectionId:Ljava/lang/String;

    if-nez v0, :cond_5

    .line 1586
    .end local p1    # "what":Ljava/lang/String;
    :goto_4
    return-object p1

    .restart local p1    # "what":Ljava/lang/String;
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->sectionId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_4
.end method


# virtual methods
.method _getModSeq()J
    .registers 3

    .prologue
    .line 264
    iget-wide v0, p0, Lcom/sun/mail/imap/IMAPMessage;->modseq:J

    return-wide v0
.end method

.method _getSession()Lkorex/mail/Session;
    .registers 2

    .prologue
    .line 1628
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->session:Lkorex/mail/Session;

    return-object v0
.end method

.method _setFlags(Lkorex/mail/Flags;)V
    .registers 2
    .param p1, "flags"    # Lkorex/mail/Flags;

    .prologue
    .line 1621
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPMessage;->flags:Lkorex/mail/Flags;

    .line 1622
    return-void
.end method

.method public addFrom([Lkorex/mail/Address;)V
    .registers 4
    .param p1, "addresses"    # [Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 343
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPMessage is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 931
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPMessage is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addHeaderLine(Ljava/lang/String;)V
    .registers 4
    .param p1, "line"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 969
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPMessage is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addRecipients(Lkorex/mail/Message$RecipientType;[Lkorex/mail/Address;)V
    .registers 5
    .param p1, "type"    # Lkorex/mail/Message$RecipientType;
    .param p2, "addresses"    # [Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 392
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPMessage is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected checkExpunged()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessageRemovedException;
        }
    .end annotation

    .prologue
    .line 278
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPMessage;->expunged:Z

    if-eqz v0, :cond_a

    .line 279
    new-instance v0, Lkorex/mail/MessageRemovedException;

    invoke-direct {v0}, Lkorex/mail/MessageRemovedException;-><init>()V

    throw v0

    .line 280
    :cond_a
    return-void
.end method

.method protected fetchItem(Lcom/sun/mail/imap/protocol/FetchItem;)Ljava/lang/Object;
    .registers 15
    .param p1, "fitem"    # Lcom/sun/mail/imap/protocol/FetchItem;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1324
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getMessageCacheLock()Ljava/lang/Object;

    move-result-object v10

    monitor-enter v10

    .line 1325
    const/4 v7, 0x0

    .line 1328
    .local v7, "robj":Ljava/lang/Object;
    :try_start_6
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v4

    .line 1330
    .local v4, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 1332
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v8

    .line 1333
    .local v8, "seqnum":I
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchItem;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetch(ILjava/lang/String;)[Lcom/sun/mail/iap/Response;

    move-result-object v6

    .line 1335
    .local v6, "r":[Lcom/sun/mail/iap/Response;
    const/4 v2, 0x0

    .end local v7    # "robj":Ljava/lang/Object;
    .local v2, "i":I
    :goto_1a
    array-length v9, v6

    if-ge v2, v9, :cond_48

    .line 1338
    aget-object v9, v6, v2

    if-eqz v9, :cond_31

    aget-object v9, v6, v2

    instance-of v9, v9, Lcom/sun/mail/imap/protocol/FetchResponse;

    if-eqz v9, :cond_31

    aget-object v9, v6, v2

    check-cast v9, Lcom/sun/mail/imap/protocol/FetchResponse;

    .line 1340
    invoke-virtual {v9}, Lcom/sun/mail/imap/protocol/FetchResponse;->getNumber()I

    move-result v9

    if-eq v9, v8, :cond_34

    .line 1335
    :cond_31
    :goto_31
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 1343
    :cond_34
    aget-object v1, v6, v2

    check-cast v1, Lcom/sun/mail/imap/protocol/FetchResponse;

    .line 1344
    .local v1, "f":Lcom/sun/mail/imap/protocol/FetchResponse;
    invoke-virtual {v1}, Lcom/sun/mail/imap/protocol/FetchResponse;->getExtensionItems()Ljava/util/Map;

    move-result-object v9

    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchItem;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v9, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 1345
    .local v3, "o":Ljava/lang/Object;
    if-eqz v3, :cond_31

    .line 1346
    move-object v7, v3

    .restart local v7    # "robj":Ljava/lang/Object;
    goto :goto_31

    .line 1350
    .end local v1    # "f":Lcom/sun/mail/imap/protocol/FetchResponse;
    .end local v3    # "o":Ljava/lang/Object;
    .end local v7    # "robj":Ljava/lang/Object;
    :cond_48
    invoke-virtual {v4, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 1351
    array-length v9, v6

    add-int/lit8 v9, v9, -0x1

    aget-object v9, v6, v9

    invoke-virtual {v4, v9}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V
    :try_end_53
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_6 .. :try_end_53} :catch_55
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_6 .. :try_end_53} :catch_65
    .catchall {:try_start_6 .. :try_end_53} :catchall_62

    .line 1358
    :try_start_53
    monitor-exit v10

    return-object v7

    .line 1352
    .end local v2    # "i":I
    .end local v4    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v6    # "r":[Lcom/sun/mail/iap/Response;
    .end local v8    # "seqnum":I
    :catch_55
    move-exception v0

    .line 1353
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    new-instance v9, Lkorex/mail/FolderClosedException;

    iget-object v11, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    invoke-virtual {v0}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v9, v11, v12}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v9

    .line 1360
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_62
    move-exception v9

    monitor-exit v10
    :try_end_64
    .catchall {:try_start_53 .. :try_end_64} :catchall_62

    throw v9

    .line 1354
    :catch_65
    move-exception v5

    .line 1355
    .local v5, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_66
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->forceCheckExpunged()V

    .line 1356
    new-instance v9, Lkorex/mail/MessagingException;

    invoke-virtual {v5}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v11, v5}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v9
    :try_end_73
    .catchall {:try_start_66 .. :try_end_73} :catchall_62
.end method

.method protected forceCheckExpunged()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessageRemovedException;,
            Lkorex/mail/FolderClosedException;
        }
    .end annotation

    .prologue
    .line 291
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getMessageCacheLock()Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 293
    :try_start_5
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v1

    invoke-virtual {v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noop()V
    :try_end_c
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_5 .. :try_end_c} :catch_17
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_5 .. :try_end_c} :catch_28
    .catchall {:try_start_5 .. :try_end_c} :catchall_24

    .line 299
    :goto_c
    :try_start_c
    monitor-exit v2
    :try_end_d
    .catchall {:try_start_c .. :try_end_d} :catchall_24

    .line 300
    iget-boolean v1, p0, Lcom/sun/mail/imap/IMAPMessage;->expunged:Z

    if-eqz v1, :cond_27

    .line 301
    new-instance v1, Lkorex/mail/MessageRemovedException;

    invoke-direct {v1}, Lkorex/mail/MessageRemovedException;-><init>()V

    throw v1

    .line 294
    :catch_17
    move-exception v0

    .line 295
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_18
    new-instance v1, Lkorex/mail/FolderClosedException;

    iget-object v3, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    invoke-virtual {v0}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v1

    .line 299
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_24
    move-exception v1

    monitor-exit v2
    :try_end_26
    .catchall {:try_start_18 .. :try_end_26} :catchall_24

    throw v1

    .line 302
    :cond_27
    return-void

    .line 296
    :catch_28
    move-exception v1

    goto :goto_c
.end method

.method public getAllHeaderLines()Ljava/util/Enumeration;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 976
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 977
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadHeaders()V

    .line 978
    invoke-super {p0}, Lkorex/mail/internet/MimeMessage;->getAllHeaderLines()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getAllHeaders()Ljava/util/Enumeration;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 943
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 944
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadHeaders()V

    .line 945
    invoke-super {p0}, Lkorex/mail/internet/MimeMessage;->getAllHeaders()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getContentID()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 595
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 596
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    if-eqz v0, :cond_c

    .line 597
    invoke-super {p0}, Lkorex/mail/internet/MimeMessage;->getContentID()Ljava/lang/String;

    move-result-object v0

    .line 599
    :goto_b
    return-object v0

    .line 598
    :cond_c
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadBODYSTRUCTURE()V

    .line 599
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->id:Ljava/lang/String;

    goto :goto_b
.end method

.method public getContentLanguage()[Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 514
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 515
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    if-eqz v0, :cond_c

    .line 516
    invoke-super {p0}, Lkorex/mail/internet/MimeMessage;->getContentLanguage()[Ljava/lang/String;

    move-result-object v0

    .line 521
    :goto_b
    return-object v0

    .line 517
    :cond_c
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadBODYSTRUCTURE()V

    .line 518
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->language:[Ljava/lang/String;

    if-eqz v0, :cond_22

    .line 519
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->language:[Ljava/lang/String;

    invoke-virtual {v0}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    check-cast v0, [Ljava/lang/String;

    goto :goto_b

    .line 521
    :cond_22
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public getContentMD5()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 610
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 611
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    if-eqz v0, :cond_c

    .line 612
    invoke-super {p0}, Lkorex/mail/internet/MimeMessage;->getContentMD5()Ljava/lang/String;

    move-result-object v0

    .line 614
    :goto_b
    return-object v0

    .line 613
    :cond_c
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadBODYSTRUCTURE()V

    .line 614
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->md5:Ljava/lang/String;

    goto :goto_b
.end method

.method protected getContentStream()Ljava/io/InputStream;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v8, -0x1

    .line 693
    iget-boolean v7, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    if-eqz v7, :cond_a

    .line 694
    invoke-super {p0}, Lkorex/mail/internet/MimeMessage;->getContentStream()Ljava/io/InputStream;

    move-result-object v2

    .line 736
    :cond_9
    :goto_9
    return-object v2

    .line 695
    :cond_a
    const/4 v2, 0x0

    .line 696
    .local v2, "is":Ljava/io/InputStream;
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getPeek()Z

    move-result v5

    .line 699
    .local v5, "pk":Z
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getMessageCacheLock()Ljava/lang/Object;

    move-result-object v9

    monitor-enter v9

    .line 701
    :try_start_14
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v3

    .line 705
    .local v3, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 707
    invoke-virtual {v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isREV1()Z

    move-result v7

    if-eqz v7, :cond_43

    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getFetchBlockSize()I

    move-result v7

    if-eq v7, v8, :cond_43

    .line 708
    new-instance v7, Lcom/sun/mail/imap/IMAPInputStream;

    const-string v10, "TEXT"

    invoke-direct {p0, v10}, Lcom/sun/mail/imap/IMAPMessage;->toSection(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iget-object v11, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    if-eqz v11, :cond_3d

    .line 709
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->ignoreBodyStructureSize()Z

    move-result v11

    if-nez v11, :cond_3d

    iget-object v8, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget v8, v8, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->size:I

    :cond_3d
    invoke-direct {v7, p0, v10, v8, v5}, Lcom/sun/mail/imap/IMAPInputStream;-><init>(Lcom/sun/mail/imap/IMAPMessage;Ljava/lang/String;IZ)V
    :try_end_40
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_14 .. :try_end_40} :catch_8a
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_14 .. :try_end_40} :catch_9a
    .catchall {:try_start_14 .. :try_end_40} :catchall_97

    :try_start_40
    monitor-exit v9
    :try_end_41
    .catchall {:try_start_40 .. :try_end_41} :catchall_97

    move-object v2, v7

    goto :goto_9

    .line 712
    :cond_43
    :try_start_43
    invoke-virtual {v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isREV1()Z

    move-result v7

    if-eqz v7, :cond_79

    .line 714
    if-eqz v5, :cond_6a

    .line 715
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v7

    const-string v8, "TEXT"

    invoke-direct {p0, v8}, Lcom/sun/mail/imap/IMAPMessage;->toSection(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->peekBody(ILjava/lang/String;)Lcom/sun/mail/imap/protocol/BODY;

    move-result-object v0

    .line 718
    .local v0, "b":Lcom/sun/mail/imap/protocol/BODY;
    :goto_59
    if-eqz v0, :cond_5f

    .line 719
    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/BODY;->getByteArrayInputStream()Ljava/io/ByteArrayInputStream;
    :try_end_5e
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_43 .. :try_end_5e} :catch_8a
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_43 .. :try_end_5e} :catch_9a
    .catchall {:try_start_43 .. :try_end_5e} :catchall_97

    move-result-object v2

    .line 731
    .end local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    :cond_5f
    :goto_5f
    :try_start_5f
    monitor-exit v9
    :try_end_60
    .catchall {:try_start_5f .. :try_end_60} :catchall_97

    .line 733
    if-nez v2, :cond_9

    .line 734
    new-instance v7, Lkorex/mail/MessagingException;

    const-string v8, "No content"

    invoke-direct {v7, v8}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 717
    :cond_6a
    :try_start_6a
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v7

    const-string v8, "TEXT"

    invoke-direct {p0, v8}, Lcom/sun/mail/imap/IMAPMessage;->toSection(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchBody(ILjava/lang/String;)Lcom/sun/mail/imap/protocol/BODY;

    move-result-object v0

    .restart local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    goto :goto_59

    .line 721
    .end local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    :cond_79
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v7

    const-string v8, "TEXT"

    invoke-virtual {v3, v7, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchRFC822(ILjava/lang/String;)Lcom/sun/mail/imap/protocol/RFC822DATA;

    move-result-object v6

    .line 722
    .local v6, "rd":Lcom/sun/mail/imap/protocol/RFC822DATA;
    if-eqz v6, :cond_5f

    .line 723
    invoke-virtual {v6}, Lcom/sun/mail/imap/protocol/RFC822DATA;->getByteArrayInputStream()Ljava/io/ByteArrayInputStream;
    :try_end_88
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_6a .. :try_end_88} :catch_8a
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_6a .. :try_end_88} :catch_9a
    .catchall {:try_start_6a .. :try_end_88} :catchall_97

    move-result-object v2

    goto :goto_5f

    .line 725
    .end local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v6    # "rd":Lcom/sun/mail/imap/protocol/RFC822DATA;
    :catch_8a
    move-exception v1

    .line 726
    .local v1, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_8b
    new-instance v7, Lkorex/mail/FolderClosedException;

    iget-object v8, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v7, v8, v10}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v7

    .line 731
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_97
    move-exception v7

    monitor-exit v9
    :try_end_99
    .catchall {:try_start_8b .. :try_end_99} :catchall_97

    throw v7

    .line 727
    :catch_9a
    move-exception v4

    .line 728
    .local v4, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_9b
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->forceCheckExpunged()V

    .line 729
    new-instance v7, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v7
    :try_end_a8
    .catchall {:try_start_9b .. :try_end_a8} :catchall_97
.end method

.method public declared-synchronized getContentType()Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 551
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 552
    iget-boolean v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    if-eqz v1, :cond_e

    .line 553
    invoke-super {p0}, Lkorex/mail/internet/MimeMessage;->getContentType()Ljava/lang/String;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_2f

    move-result-object v1

    .line 562
    :goto_c
    monitor-exit p0

    return-object v1

    .line 556
    :cond_e
    :try_start_e
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->type:Ljava/lang/String;

    if-nez v1, :cond_2c

    .line 557
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadBODYSTRUCTURE()V

    .line 559
    new-instance v0, Lkorex/mail/internet/ContentType;

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v1, v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->type:Ljava/lang/String;

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v2, v2, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->subtype:Ljava/lang/String;

    iget-object v3, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v3, v3, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->cParams:Lkorex/mail/internet/ParameterList;

    invoke-direct {v0, v1, v2, v3}, Lkorex/mail/internet/ContentType;-><init>(Ljava/lang/String;Ljava/lang/String;Lkorex/mail/internet/ParameterList;)V

    .line 560
    .local v0, "ct":Lkorex/mail/internet/ContentType;
    invoke-virtual {v0}, Lkorex/mail/internet/ContentType;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->type:Ljava/lang/String;

    .line 562
    .end local v0    # "ct":Lkorex/mail/internet/ContentType;
    :cond_2c
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->type:Ljava/lang/String;
    :try_end_2e
    .catchall {:try_start_e .. :try_end_2e} :catchall_2f

    goto :goto_c

    .line 551
    :catchall_2f
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getDataHandler()Lkorex/activation/DataHandler;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 744
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 746
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->dh:Lkorex/activation/DataHandler;

    if-nez v1, :cond_44

    iget-boolean v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    if-nez v1, :cond_44

    .line 747
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadBODYSTRUCTURE()V

    .line 748
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->type:Ljava/lang/String;

    if-nez v1, :cond_2a

    .line 750
    new-instance v0, Lkorex/mail/internet/ContentType;

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v1, v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->type:Ljava/lang/String;

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v2, v2, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->subtype:Ljava/lang/String;

    iget-object v3, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v3, v3, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->cParams:Lkorex/mail/internet/ParameterList;

    invoke-direct {v0, v1, v2, v3}, Lkorex/mail/internet/ContentType;-><init>(Ljava/lang/String;Ljava/lang/String;Lkorex/mail/internet/ParameterList;)V

    .line 752
    .local v0, "ct":Lkorex/mail/internet/ContentType;
    invoke-virtual {v0}, Lkorex/mail/internet/ContentType;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->type:Ljava/lang/String;

    .line 758
    .end local v0    # "ct":Lkorex/mail/internet/ContentType;
    :cond_2a
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    invoke-virtual {v1}, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->isMulti()Z

    move-result v1

    if-eqz v1, :cond_4a

    .line 759
    new-instance v1, Lkorex/activation/DataHandler;

    new-instance v2, Lcom/sun/mail/imap/IMAPMultipartDataSource;

    iget-object v3, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v3, v3, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->bodies:[Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v4, p0, Lcom/sun/mail/imap/IMAPMessage;->sectionId:Ljava/lang/String;

    invoke-direct {v2, p0, v3, v4, p0}, Lcom/sun/mail/imap/IMAPMultipartDataSource;-><init>(Lkorex/mail/internet/MimePart;[Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;Ljava/lang/String;Lcom/sun/mail/imap/IMAPMessage;)V

    invoke-direct {v1, v2}, Lkorex/activation/DataHandler;-><init>(Lkorex/activation/DataSource;)V

    iput-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->dh:Lkorex/activation/DataHandler;

    .line 777
    :cond_44
    :goto_44
    invoke-super {p0}, Lkorex/mail/internet/MimeMessage;->getDataHandler()Lkorex/activation/DataHandler;
    :try_end_47
    .catchall {:try_start_1 .. :try_end_47} :catchall_7e

    move-result-object v1

    monitor-exit p0

    return-object v1

    .line 763
    :cond_4a
    :try_start_4a
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    invoke-virtual {v1}, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->isNested()Z

    move-result v1

    if-eqz v1, :cond_44

    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->isREV1()Z

    move-result v1

    if-eqz v1, :cond_44

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v1, v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    if-eqz v1, :cond_44

    .line 768
    new-instance v2, Lkorex/activation/DataHandler;

    new-instance v3, Lcom/sun/mail/imap/IMAPNestedMessage;

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v1, v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->bodies:[Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    const/4 v4, 0x0

    aget-object v4, v1, v4

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v5, v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->sectionId:Ljava/lang/String;

    if-nez v1, :cond_81

    const-string v1, "1"

    :goto_73
    invoke-direct {v3, p0, v4, v5, v1}, Lcom/sun/mail/imap/IMAPNestedMessage;-><init>(Lcom/sun/mail/imap/IMAPMessage;Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;Lcom/sun/mail/imap/protocol/ENVELOPE;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->type:Ljava/lang/String;

    invoke-direct {v2, v3, v1}, Lkorex/activation/DataHandler;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/sun/mail/imap/IMAPMessage;->dh:Lkorex/activation/DataHandler;
    :try_end_7d
    .catchall {:try_start_4a .. :try_end_7d} :catchall_7e

    goto :goto_44

    .line 744
    :catchall_7e
    move-exception v1

    monitor-exit p0

    throw v1

    .line 768
    :cond_81
    :try_start_81
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/sun/mail/imap/IMAPMessage;->sectionId:Ljava/lang/String;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v6, ".1"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_95
    .catchall {:try_start_81 .. :try_end_95} :catchall_7e

    move-result-object v1

    goto :goto_73
.end method

.method public getDescription()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 625
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 626
    iget-boolean v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    if-eqz v1, :cond_c

    .line 627
    invoke-super {p0}, Lkorex/mail/internet/MimeMessage;->getDescription()Ljava/lang/String;

    move-result-object v1

    .line 642
    :goto_b
    return-object v1

    .line 629
    :cond_c
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->description:Ljava/lang/String;

    if-eqz v1, :cond_13

    .line 630
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->description:Ljava/lang/String;

    goto :goto_b

    .line 632
    :cond_13
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadBODYSTRUCTURE()V

    .line 633
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v1, v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->description:Ljava/lang/String;

    if-nez v1, :cond_1e

    .line 634
    const/4 v1, 0x0

    goto :goto_b

    .line 637
    :cond_1e
    :try_start_1e
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v1, v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->description:Ljava/lang/String;

    invoke-static {v1}, Lkorex/mail/internet/MimeUtility;->decodeText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->description:Ljava/lang/String;
    :try_end_28
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1e .. :try_end_28} :catch_2b

    .line 642
    :goto_28
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->description:Ljava/lang/String;

    goto :goto_b

    .line 638
    :catch_2b
    move-exception v0

    .line 639
    .local v0, "ex":Ljava/io/UnsupportedEncodingException;
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v1, v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->description:Ljava/lang/String;

    iput-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->description:Ljava/lang/String;

    goto :goto_28
.end method

.method public getDisposition()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 569
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 570
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    if-eqz v0, :cond_c

    .line 571
    invoke-super {p0}, Lkorex/mail/internet/MimeMessage;->getDisposition()Ljava/lang/String;

    move-result-object v0

    .line 573
    :goto_b
    return-object v0

    .line 572
    :cond_c
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadBODYSTRUCTURE()V

    .line 573
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->disposition:Ljava/lang/String;

    goto :goto_b
.end method

.method public getEncoding()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 584
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 585
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    if-eqz v0, :cond_c

    .line 586
    invoke-super {p0}, Lkorex/mail/internet/MimeMessage;->getEncoding()Ljava/lang/String;

    move-result-object v0

    .line 588
    :goto_b
    return-object v0

    .line 587
    :cond_c
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadBODYSTRUCTURE()V

    .line 588
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->encoding:Ljava/lang/String;

    goto :goto_b
.end method

.method protected getFetchBlockSize()I
    .registers 2

    .prologue
    .line 307
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    invoke-virtual {v0}, Lkorex/mail/Folder;->getStore()Lkorex/mail/Store;

    move-result-object v0

    check-cast v0, Lcom/sun/mail/imap/IMAPStore;

    invoke-virtual {v0}, Lcom/sun/mail/imap/IMAPStore;->getFetchBlockSize()I

    move-result v0

    return v0
.end method

.method public getFileName()Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 667
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 668
    iget-boolean v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    if-eqz v1, :cond_c

    .line 669
    invoke-super {p0}, Lkorex/mail/internet/MimeMessage;->getFileName()Ljava/lang/String;

    move-result-object v0

    .line 678
    :cond_b
    :goto_b
    return-object v0

    .line 671
    :cond_c
    const/4 v0, 0x0

    .line 672
    .local v0, "filename":Ljava/lang/String;
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadBODYSTRUCTURE()V

    .line 674
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v1, v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->dParams:Lkorex/mail/internet/ParameterList;

    if-eqz v1, :cond_20

    .line 675
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v1, v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->dParams:Lkorex/mail/internet/ParameterList;

    const-string v2, "filename"

    invoke-virtual {v1, v2}, Lkorex/mail/internet/ParameterList;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 676
    :cond_20
    if-nez v0, :cond_b

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v1, v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->cParams:Lkorex/mail/internet/ParameterList;

    if-eqz v1, :cond_b

    .line 677
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v1, v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->cParams:Lkorex/mail/internet/ParameterList;

    const-string v2, "name"

    invoke-virtual {v1, v2}, Lkorex/mail/internet/ParameterList;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_b
.end method

.method public declared-synchronized getFlags()Lkorex/mail/Flags;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1005
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 1006
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadFlags()V

    .line 1007
    invoke-super {p0}, Lkorex/mail/internet/MimeMessage;->getFlags()Lkorex/mail/Flags;
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_d

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 1005
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getFrom()[Lkorex/mail/Address;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 320
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 321
    iget-boolean v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    if-eqz v1, :cond_c

    .line 322
    invoke-super {p0}, Lkorex/mail/internet/MimeMessage;->getFrom()[Lkorex/mail/Address;

    move-result-object v1

    .line 335
    :goto_b
    return-object v1

    .line 323
    :cond_c
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadEnvelope()V

    .line 324
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    iget-object v0, v1, Lcom/sun/mail/imap/protocol/ENVELOPE;->from:[Lkorex/mail/internet/InternetAddress;

    .line 333
    .local v0, "a":[Lkorex/mail/internet/InternetAddress;
    if-eqz v0, :cond_18

    array-length v1, v0

    if-nez v1, :cond_1c

    .line 334
    :cond_18
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    iget-object v0, v1, Lcom/sun/mail/imap/protocol/ENVELOPE;->sender:[Lkorex/mail/internet/InternetAddress;

    .line 335
    :cond_1c
    invoke-direct {p0, v0}, Lcom/sun/mail/imap/IMAPMessage;->aaclone([Lkorex/mail/internet/InternetAddress;)[Lkorex/mail/internet/InternetAddress;

    move-result-object v1

    goto :goto_b
.end method

.method public getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "delimiter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 916
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 919
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/IMAPMessage;->getHeader(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_b

    .line 920
    const/4 v0, 0x0

    .line 921
    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1, p2}, Lkorex/mail/internet/InternetHeaders;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method public getHeader(Ljava/lang/String;)[Ljava/lang/String;
    .registers 12
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 861
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 863
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/IMAPMessage;->isHeaderLoaded(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_10

    .line 864
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v6, p1}, Lkorex/mail/internet/InternetHeaders;->getHeader(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 908
    :goto_f
    return-object v6

    .line 867
    :cond_10
    const/4 v2, 0x0

    .line 870
    .local v2, "is":Ljava/io/InputStream;
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getMessageCacheLock()Ljava/lang/Object;

    move-result-object v7

    monitor-enter v7

    .line 872
    :try_start_16
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v3

    .line 876
    .local v3, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 878
    invoke-virtual {v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isREV1()Z

    move-result v6

    if-eqz v6, :cond_53

    .line 879
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v6

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "HEADER.FIELDS ("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 880
    invoke-direct {p0, v8}, Lcom/sun/mail/imap/IMAPMessage;->toSection(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 879
    invoke-virtual {v3, v6, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->peekBody(ILjava/lang/String;)Lcom/sun/mail/imap/protocol/BODY;

    move-result-object v0

    .line 882
    .local v0, "b":Lcom/sun/mail/imap/protocol/BODY;
    if-eqz v0, :cond_4e

    .line 883
    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/BODY;->getByteArrayInputStream()Ljava/io/ByteArrayInputStream;
    :try_end_4d
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_16 .. :try_end_4d} :catch_7b
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_16 .. :try_end_4d} :catch_8b
    .catchall {:try_start_16 .. :try_end_4d} :catchall_88

    move-result-object v2

    .line 896
    .end local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    :cond_4e
    :goto_4e
    :try_start_4e
    monitor-exit v7
    :try_end_4f
    .catchall {:try_start_4e .. :try_end_4f} :catchall_88

    .line 900
    if-nez v2, :cond_99

    .line 901
    const/4 v6, 0x0

    goto :goto_f

    .line 885
    :cond_53
    :try_start_53
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v6

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "HEADER.LINES ("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v6, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchRFC822(ILjava/lang/String;)Lcom/sun/mail/imap/protocol/RFC822DATA;

    move-result-object v5

    .line 887
    .local v5, "rd":Lcom/sun/mail/imap/protocol/RFC822DATA;
    if-eqz v5, :cond_4e

    .line 888
    invoke-virtual {v5}, Lcom/sun/mail/imap/protocol/RFC822DATA;->getByteArrayInputStream()Ljava/io/ByteArrayInputStream;
    :try_end_79
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_53 .. :try_end_79} :catch_7b
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_53 .. :try_end_79} :catch_8b
    .catchall {:try_start_53 .. :try_end_79} :catchall_88

    move-result-object v2

    goto :goto_4e

    .line 890
    .end local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v5    # "rd":Lcom/sun/mail/imap/protocol/RFC822DATA;
    :catch_7b
    move-exception v1

    .line 891
    .local v1, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_7c
    new-instance v6, Lkorex/mail/FolderClosedException;

    iget-object v8, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v6, v8, v9}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v6

    .line 896
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_88
    move-exception v6

    monitor-exit v7
    :try_end_8a
    .catchall {:try_start_7c .. :try_end_8a} :catchall_88

    throw v6

    .line 892
    :catch_8b
    move-exception v4

    .line 893
    .local v4, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_8c
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->forceCheckExpunged()V

    .line 894
    new-instance v6, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6
    :try_end_99
    .catchall {:try_start_8c .. :try_end_99} :catchall_88

    .line 903
    .end local v4    # "pex":Lcom/sun/mail/iap/ProtocolException;
    .restart local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :cond_99
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    if-nez v6, :cond_a4

    .line 904
    new-instance v6, Lkorex/mail/internet/InternetHeaders;

    invoke-direct {v6}, Lkorex/mail/internet/InternetHeaders;-><init>()V

    iput-object v6, p0, Lcom/sun/mail/imap/IMAPMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    .line 905
    :cond_a4
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v6, v2}, Lkorex/mail/internet/InternetHeaders;->load(Ljava/io/InputStream;)V

    .line 906
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/IMAPMessage;->setHeaderLoaded(Ljava/lang/String;)V

    .line 908
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v6, p1}, Lkorex/mail/internet/InternetHeaders;->getHeader(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_f
.end method

.method public getInReplyTo()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 537
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 538
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    if-eqz v0, :cond_10

    .line 539
    const-string v0, "In-Reply-To"

    const-string v1, " "

    invoke-super {p0, v0, v1}, Lkorex/mail/internet/MimeMessage;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 541
    :goto_f
    return-object v0

    .line 540
    :cond_10
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadEnvelope()V

    .line 541
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/ENVELOPE;->inReplyTo:Ljava/lang/String;

    goto :goto_f
.end method

.method public declared-synchronized getItem(Lcom/sun/mail/imap/protocol/FetchItem;)Ljava/lang/Object;
    .registers 5
    .param p1, "fitem"    # Lcom/sun/mail/imap/protocol/FetchItem;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1376
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->items:Ljava/util/Map;

    if-nez v1, :cond_e

    const/4 v0, 0x0

    .line 1377
    .local v0, "item":Ljava/lang/Object;
    :goto_6
    if-nez v0, :cond_c

    .line 1378
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/IMAPMessage;->fetchItem(Lcom/sun/mail/imap/protocol/FetchItem;)Ljava/lang/Object;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_19

    move-result-object v0

    .line 1379
    :cond_c
    monitor-exit p0

    return-object v0

    .line 1376
    .end local v0    # "item":Ljava/lang/Object;
    :cond_e
    :try_start_e
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->items:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchItem;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_17
    .catchall {:try_start_e .. :try_end_17} :catchall_19

    move-result-object v0

    goto :goto_6

    :catchall_19
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public getLineCount()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 504
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 506
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadBODYSTRUCTURE()V

    .line 507
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget v0, v0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->lines:I

    return v0
.end method

.method public getMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;
    .registers 3
    .param p1, "names"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 986
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 987
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadHeaders()V

    .line 988
    invoke-super {p0, p1}, Lkorex/mail/internet/MimeMessage;->getMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getMatchingHeaders([Ljava/lang/String;)Ljava/util/Enumeration;
    .registers 3
    .param p1, "names"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 953
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 954
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadHeaders()V

    .line 955
    invoke-super {p0, p1}, Lkorex/mail/internet/MimeMessage;->getMatchingHeaders([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method protected getMessageCacheLock()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 195
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    check-cast v0, Lcom/sun/mail/imap/IMAPFolder;

    iget-object v0, v0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    return-object v0
.end method

.method public getMessageID()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 654
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 655
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    if-eqz v0, :cond_c

    .line 656
    invoke-super {p0}, Lkorex/mail/internet/MimeMessage;->getMessageID()Ljava/lang/String;

    move-result-object v0

    .line 658
    :goto_b
    return-object v0

    .line 657
    :cond_c
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadEnvelope()V

    .line 658
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/ENVELOPE;->messageId:Ljava/lang/String;

    goto :goto_b
.end method

.method public getMimeStream()Ljava/io/InputStream;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v9, -0x1

    .line 793
    const/4 v2, 0x0

    .line 794
    .local v2, "is":Ljava/io/InputStream;
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getPeek()Z

    move-result v5

    .line 797
    .local v5, "pk":Z
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getMessageCacheLock()Ljava/lang/Object;

    move-result-object v8

    monitor-enter v8

    .line 799
    :try_start_b
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v3

    .line 801
    .local v3, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 803
    invoke-virtual {v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isREV1()Z

    move-result v7

    if-eqz v7, :cond_28

    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getFetchBlockSize()I

    move-result v7

    if-eq v7, v9, :cond_28

    .line 804
    new-instance v7, Lcom/sun/mail/imap/IMAPInputStream;

    iget-object v9, p0, Lcom/sun/mail/imap/IMAPMessage;->sectionId:Ljava/lang/String;

    const/4 v10, -0x1

    invoke-direct {v7, p0, v9, v10, v5}, Lcom/sun/mail/imap/IMAPInputStream;-><init>(Lcom/sun/mail/imap/IMAPMessage;Ljava/lang/String;IZ)V
    :try_end_26
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_b .. :try_end_26} :catch_69
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_b .. :try_end_26} :catch_79
    .catchall {:try_start_b .. :try_end_26} :catchall_76

    :try_start_26
    monitor-exit v8
    :try_end_27
    .catchall {:try_start_26 .. :try_end_27} :catchall_76

    .line 833
    :goto_27
    return-object v7

    .line 806
    :cond_28
    :try_start_28
    invoke-virtual {v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isREV1()Z

    move-result v7

    if-eqz v7, :cond_59

    .line 808
    if-eqz v5, :cond_4e

    .line 809
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v7

    iget-object v9, p0, Lcom/sun/mail/imap/IMAPMessage;->sectionId:Ljava/lang/String;

    invoke-virtual {v3, v7, v9}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->peekBody(ILjava/lang/String;)Lcom/sun/mail/imap/protocol/BODY;

    move-result-object v0

    .line 812
    .local v0, "b":Lcom/sun/mail/imap/protocol/BODY;
    :goto_3a
    if-eqz v0, :cond_40

    .line 813
    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/BODY;->getByteArrayInputStream()Ljava/io/ByteArrayInputStream;
    :try_end_3f
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_28 .. :try_end_3f} :catch_69
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_28 .. :try_end_3f} :catch_79
    .catchall {:try_start_28 .. :try_end_3f} :catchall_76

    move-result-object v2

    .line 825
    .end local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    :cond_40
    :goto_40
    :try_start_40
    monitor-exit v8
    :try_end_41
    .catchall {:try_start_40 .. :try_end_41} :catchall_76

    .line 827
    if-nez v2, :cond_87

    .line 828
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->forceCheckExpunged()V

    .line 831
    new-instance v7, Lkorex/mail/MessagingException;

    const-string v8, "No content"

    invoke-direct {v7, v8}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 811
    :cond_4e
    :try_start_4e
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v7

    iget-object v9, p0, Lcom/sun/mail/imap/IMAPMessage;->sectionId:Ljava/lang/String;

    invoke-virtual {v3, v7, v9}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchBody(ILjava/lang/String;)Lcom/sun/mail/imap/protocol/BODY;

    move-result-object v0

    .restart local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    goto :goto_3a

    .line 815
    .end local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    :cond_59
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v7

    const/4 v9, 0x0

    invoke-virtual {v3, v7, v9}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchRFC822(ILjava/lang/String;)Lcom/sun/mail/imap/protocol/RFC822DATA;

    move-result-object v6

    .line 816
    .local v6, "rd":Lcom/sun/mail/imap/protocol/RFC822DATA;
    if-eqz v6, :cond_40

    .line 817
    invoke-virtual {v6}, Lcom/sun/mail/imap/protocol/RFC822DATA;->getByteArrayInputStream()Ljava/io/ByteArrayInputStream;
    :try_end_67
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_4e .. :try_end_67} :catch_69
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_4e .. :try_end_67} :catch_79
    .catchall {:try_start_4e .. :try_end_67} :catchall_76

    move-result-object v2

    goto :goto_40

    .line 819
    .end local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v6    # "rd":Lcom/sun/mail/imap/protocol/RFC822DATA;
    :catch_69
    move-exception v1

    .line 820
    .local v1, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_6a
    new-instance v7, Lkorex/mail/FolderClosedException;

    iget-object v9, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v7, v9, v10}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v7

    .line 825
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_76
    move-exception v7

    monitor-exit v8
    :try_end_78
    .catchall {:try_start_6a .. :try_end_78} :catchall_76

    throw v7

    .line 821
    :catch_79
    move-exception v4

    .line 822
    .local v4, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_7a
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->forceCheckExpunged()V

    .line 823
    new-instance v7, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, v9, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v7
    :try_end_87
    .catchall {:try_start_7a .. :try_end_87} :catchall_76

    .end local v4    # "pex":Lcom/sun/mail/iap/ProtocolException;
    .restart local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :cond_87
    move-object v7, v2

    .line 833
    goto :goto_27
.end method

.method public declared-synchronized getModSeq()J
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 243
    monitor-enter p0

    :try_start_1
    iget-wide v4, p0, Lcom/sun/mail/imap/IMAPMessage;->modseq:J

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-eqz v4, :cond_d

    .line 244
    iget-wide v4, p0, Lcom/sun/mail/imap/IMAPMessage;->modseq:J
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_3b

    .line 260
    :goto_b
    monitor-exit p0

    return-wide v4

    .line 246
    :cond_d
    :try_start_d
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getMessageCacheLock()Ljava/lang/Object;

    move-result-object v5

    monitor-enter v5
    :try_end_12
    .catchall {:try_start_d .. :try_end_12} :catchall_3b

    .line 248
    :try_start_12
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v2

    .line 249
    .local v2, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 250
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchMODSEQ(I)Lcom/sun/mail/imap/protocol/MODSEQ;

    move-result-object v1

    .line 252
    .local v1, "ms":Lcom/sun/mail/imap/protocol/MODSEQ;
    if-eqz v1, :cond_27

    .line 253
    iget-wide v6, v1, Lcom/sun/mail/imap/protocol/MODSEQ;->modseq:J

    iput-wide v6, p0, Lcom/sun/mail/imap/IMAPMessage;->modseq:J
    :try_end_27
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_12 .. :try_end_27} :catch_2b
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_12 .. :try_end_27} :catch_3e
    .catchall {:try_start_12 .. :try_end_27} :catchall_38

    .line 259
    :cond_27
    :try_start_27
    monitor-exit v5
    :try_end_28
    .catchall {:try_start_27 .. :try_end_28} :catchall_38

    .line 260
    :try_start_28
    iget-wide v4, p0, Lcom/sun/mail/imap/IMAPMessage;->modseq:J
    :try_end_2a
    .catchall {:try_start_28 .. :try_end_2a} :catchall_3b

    goto :goto_b

    .line 254
    .end local v1    # "ms":Lcom/sun/mail/imap/protocol/MODSEQ;
    .end local v2    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catch_2b
    move-exception v0

    .line 255
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_2c
    new-instance v4, Lkorex/mail/FolderClosedException;

    iget-object v6, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    invoke-virtual {v0}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v6, v7}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v4

    .line 259
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_38
    move-exception v4

    monitor-exit v5
    :try_end_3a
    .catchall {:try_start_2c .. :try_end_3a} :catchall_38

    :try_start_3a
    throw v4
    :try_end_3b
    .catchall {:try_start_3a .. :try_end_3b} :catchall_3b

    .line 243
    :catchall_3b
    move-exception v4

    monitor-exit p0

    throw v4

    .line 256
    :catch_3e
    move-exception v3

    .line 257
    .local v3, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_3f
    new-instance v4, Lkorex/mail/MessagingException;

    invoke-virtual {v3}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6, v3}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v4
    :try_end_49
    .catchall {:try_start_3f .. :try_end_49} :catchall_38
.end method

.method public getNonMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;
    .registers 3
    .param p1, "names"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 996
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 997
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadHeaders()V

    .line 998
    invoke-super {p0, p1}, Lkorex/mail/internet/MimeMessage;->getNonMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getNonMatchingHeaders([Ljava/lang/String;)Ljava/util/Enumeration;
    .registers 3
    .param p1, "names"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 963
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 964
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadHeaders()V

    .line 965
    invoke-super {p0, p1}, Lkorex/mail/internet/MimeMessage;->getNonMatchingHeaders([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getPeek()Z
    .registers 2

    .prologue
    .line 1059
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->peek:Ljava/lang/Boolean;

    if-nez v0, :cond_13

    .line 1060
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    invoke-virtual {v0}, Lkorex/mail/Folder;->getStore()Lkorex/mail/Store;

    move-result-object v0

    check-cast v0, Lcom/sun/mail/imap/IMAPStore;

    invoke-virtual {v0}, Lcom/sun/mail/imap/IMAPStore;->getPeek()Z
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_1a

    move-result v0

    .line 1062
    :goto_11
    monitor-exit p0

    return v0

    :cond_13
    :try_start_13
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->peek:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_18
    .catchall {:try_start_13 .. :try_end_18} :catchall_1a

    move-result v0

    goto :goto_11

    .line 1059
    :catchall_1a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;,
            Lkorex/mail/FolderClosedException;
        }
    .end annotation

    .prologue
    .line 167
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    check-cast v1, Lcom/sun/mail/imap/IMAPFolder;

    invoke-virtual {v1}, Lcom/sun/mail/imap/IMAPFolder;->waitIfIdle()V

    .line 168
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    check-cast v1, Lcom/sun/mail/imap/IMAPFolder;

    iget-object v0, v1, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    .line 169
    .local v0, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    if-nez v0, :cond_17

    .line 170
    new-instance v1, Lkorex/mail/FolderClosedException;

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    invoke-direct {v1, v2}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;)V

    throw v1

    .line 172
    :cond_17
    return-object v0
.end method

.method public getReceivedDate()Ljava/util/Date;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 473
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 475
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadEnvelope()V

    .line 476
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->receivedDate:Ljava/util/Date;

    if-nez v0, :cond_c

    .line 477
    const/4 v0, 0x0

    .line 479
    :goto_b
    return-object v0

    :cond_c
    new-instance v0, Ljava/util/Date;

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->receivedDate:Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    goto :goto_b
.end method

.method public getRecipients(Lkorex/mail/Message$RecipientType;)[Lkorex/mail/Address;
    .registers 3
    .param p1, "type"    # Lkorex/mail/Message$RecipientType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 370
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 371
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    if-eqz v0, :cond_c

    .line 372
    invoke-super {p0, p1}, Lkorex/mail/internet/MimeMessage;->getRecipients(Lkorex/mail/Message$RecipientType;)[Lkorex/mail/Address;

    move-result-object v0

    .line 382
    :goto_b
    return-object v0

    .line 373
    :cond_c
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadEnvelope()V

    .line 375
    sget-object v0, Lkorex/mail/Message$RecipientType;->TO:Lkorex/mail/Message$RecipientType;

    if-ne p1, v0, :cond_1c

    .line 376
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/ENVELOPE;->to:[Lkorex/mail/internet/InternetAddress;

    invoke-direct {p0, v0}, Lcom/sun/mail/imap/IMAPMessage;->aaclone([Lkorex/mail/internet/InternetAddress;)[Lkorex/mail/internet/InternetAddress;

    move-result-object v0

    goto :goto_b

    .line 377
    :cond_1c
    sget-object v0, Lkorex/mail/Message$RecipientType;->CC:Lkorex/mail/Message$RecipientType;

    if-ne p1, v0, :cond_29

    .line 378
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/ENVELOPE;->cc:[Lkorex/mail/internet/InternetAddress;

    invoke-direct {p0, v0}, Lcom/sun/mail/imap/IMAPMessage;->aaclone([Lkorex/mail/internet/InternetAddress;)[Lkorex/mail/internet/InternetAddress;

    move-result-object v0

    goto :goto_b

    .line 379
    :cond_29
    sget-object v0, Lkorex/mail/Message$RecipientType;->BCC:Lkorex/mail/Message$RecipientType;

    if-ne p1, v0, :cond_36

    .line 380
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/ENVELOPE;->bcc:[Lkorex/mail/internet/InternetAddress;

    invoke-direct {p0, v0}, Lcom/sun/mail/imap/IMAPMessage;->aaclone([Lkorex/mail/internet/InternetAddress;)[Lkorex/mail/internet/InternetAddress;

    move-result-object v0

    goto :goto_b

    .line 382
    :cond_36
    invoke-super {p0, p1}, Lkorex/mail/internet/MimeMessage;->getRecipients(Lkorex/mail/Message$RecipientType;)[Lkorex/mail/Address;

    move-result-object v0

    goto :goto_b
.end method

.method public getReplyTo()[Lkorex/mail/Address;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 399
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 400
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    if-eqz v0, :cond_c

    .line 401
    invoke-super {p0}, Lkorex/mail/internet/MimeMessage;->getReplyTo()[Lkorex/mail/Address;

    move-result-object v0

    .line 411
    :goto_b
    return-object v0

    .line 402
    :cond_c
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadEnvelope()V

    .line 409
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/ENVELOPE;->replyTo:[Lkorex/mail/internet/InternetAddress;

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/ENVELOPE;->replyTo:[Lkorex/mail/internet/InternetAddress;

    array-length v0, v0

    if-nez v0, :cond_21

    .line 410
    :cond_1c
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getFrom()[Lkorex/mail/Address;

    move-result-object v0

    goto :goto_b

    .line 411
    :cond_21
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/ENVELOPE;->replyTo:[Lkorex/mail/internet/InternetAddress;

    invoke-direct {p0, v0}, Lcom/sun/mail/imap/IMAPMessage;->aaclone([Lkorex/mail/internet/InternetAddress;)[Lkorex/mail/internet/InternetAddress;

    move-result-object v0

    goto :goto_b
.end method

.method public getSender()Lkorex/mail/Address;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 350
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 351
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    if-eqz v0, :cond_c

    .line 352
    invoke-super {p0}, Lkorex/mail/internet/MimeMessage;->getSender()Lkorex/mail/Address;

    move-result-object v0

    .line 357
    :goto_b
    return-object v0

    .line 353
    :cond_c
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadEnvelope()V

    .line 354
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/ENVELOPE;->sender:[Lkorex/mail/internet/InternetAddress;

    if-eqz v0, :cond_24

    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/ENVELOPE;->sender:[Lkorex/mail/internet/InternetAddress;

    array-length v0, v0

    if-lez v0, :cond_24

    .line 355
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/ENVELOPE;->sender:[Lkorex/mail/internet/InternetAddress;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    goto :goto_b

    .line 357
    :cond_24
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public getSentDate()Ljava/util/Date;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 455
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 456
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    if-eqz v0, :cond_c

    .line 457
    invoke-super {p0}, Lkorex/mail/internet/MimeMessage;->getSentDate()Ljava/util/Date;

    move-result-object v0

    .line 462
    :goto_b
    return-object v0

    .line 458
    :cond_c
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadEnvelope()V

    .line 459
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/ENVELOPE;->date:Ljava/util/Date;

    if-nez v0, :cond_17

    .line 460
    const/4 v0, 0x0

    goto :goto_b

    .line 462
    :cond_17
    new-instance v0, Ljava/util/Date;

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    iget-object v1, v1, Lcom/sun/mail/imap/protocol/ENVELOPE;->date:Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    goto :goto_b
.end method

.method protected getSequenceNumber()I
    .registers 3

    .prologue
    .line 207
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    check-cast v0, Lcom/sun/mail/imap/IMAPFolder;

    iget-object v0, v0, Lcom/sun/mail/imap/IMAPFolder;->messageCache:Lcom/sun/mail/imap/MessageCache;

    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getMessageNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/sun/mail/imap/MessageCache;->seqnumOf(I)I

    move-result v0

    return v0
.end method

.method public getSize()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 489
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 491
    iget v0, p0, Lcom/sun/mail/imap/IMAPMessage;->size:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_b

    .line 492
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadEnvelope()V

    .line 493
    :cond_b
    iget v0, p0, Lcom/sun/mail/imap/IMAPMessage;->size:I

    return v0
.end method

.method public getSubject()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 422
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 423
    iget-boolean v1, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    if-eqz v1, :cond_c

    .line 424
    invoke-super {p0}, Lkorex/mail/internet/MimeMessage;->getSubject()Ljava/lang/String;

    move-result-object v1

    .line 443
    :goto_b
    return-object v1

    .line 426
    :cond_c
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->subject:Ljava/lang/String;

    if-eqz v1, :cond_13

    .line 427
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->subject:Ljava/lang/String;

    goto :goto_b

    .line 429
    :cond_13
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadEnvelope()V

    .line 430
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    iget-object v1, v1, Lcom/sun/mail/imap/protocol/ENVELOPE;->subject:Ljava/lang/String;

    if-nez v1, :cond_1e

    .line 431
    const/4 v1, 0x0

    goto :goto_b

    .line 437
    :cond_1e
    :try_start_1e
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    iget-object v1, v1, Lcom/sun/mail/imap/protocol/ENVELOPE;->subject:Ljava/lang/String;

    .line 438
    invoke-static {v1}, Lkorex/mail/internet/MimeUtility;->unfold(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lkorex/mail/internet/MimeUtility;->decodeText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->subject:Ljava/lang/String;
    :try_end_2c
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1e .. :try_end_2c} :catch_2f

    .line 443
    :goto_2c
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->subject:Ljava/lang/String;

    goto :goto_b

    .line 439
    :catch_2f
    move-exception v0

    .line 440
    .local v0, "ex":Ljava/io/UnsupportedEncodingException;
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    iget-object v1, v1, Lcom/sun/mail/imap/protocol/ENVELOPE;->subject:Ljava/lang/String;

    iput-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->subject:Ljava/lang/String;

    goto :goto_2c
.end method

.method protected getUID()J
    .registers 3

    .prologue
    .line 226
    iget-wide v0, p0, Lcom/sun/mail/imap/IMAPMessage;->uid:J

    return-wide v0
.end method

.method protected handleExtensionFetchItems(Ljava/util/Map;)V
    .registers 3
    .param p1, "extensionItems"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1303
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->items:Ljava/util/Map;

    if-nez v0, :cond_7

    .line 1304
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPMessage;->items:Ljava/util/Map;

    .line 1307
    :goto_6
    return-void

    .line 1306
    :cond_7
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->items:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    goto :goto_6
.end method

.method protected handleFetchItem(Lcom/sun/mail/imap/protocol/Item;[Ljava/lang/String;Z)Z
    .registers 15
    .param p1, "item"    # Lcom/sun/mail/imap/protocol/Item;
    .param p2, "hdrs"    # [Ljava/lang/String;
    .param p3, "allHeaders"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 1191
    instance-of v7, p1, Lkorex/mail/Flags;

    if-eqz v7, :cond_b

    .line 1192
    check-cast p1, Lkorex/mail/Flags;

    .end local p1    # "item":Lcom/sun/mail/imap/protocol/Item;
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPMessage;->flags:Lkorex/mail/Flags;

    :cond_9
    :goto_9
    move v7, v8

    .line 1286
    :goto_a
    return v7

    .line 1194
    .restart local p1    # "item":Lcom/sun/mail/imap/protocol/Item;
    :cond_b
    instance-of v7, p1, Lcom/sun/mail/imap/protocol/ENVELOPE;

    if-eqz v7, :cond_14

    .line 1195
    check-cast p1, Lcom/sun/mail/imap/protocol/ENVELOPE;

    .end local p1    # "item":Lcom/sun/mail/imap/protocol/Item;
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    goto :goto_9

    .line 1196
    .restart local p1    # "item":Lcom/sun/mail/imap/protocol/Item;
    :cond_14
    instance-of v7, p1, Lcom/sun/mail/imap/protocol/INTERNALDATE;

    if-eqz v7, :cond_21

    .line 1197
    check-cast p1, Lcom/sun/mail/imap/protocol/INTERNALDATE;

    .end local p1    # "item":Lcom/sun/mail/imap/protocol/Item;
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/INTERNALDATE;->getDate()Ljava/util/Date;

    move-result-object v7

    iput-object v7, p0, Lcom/sun/mail/imap/IMAPMessage;->receivedDate:Ljava/util/Date;

    goto :goto_9

    .line 1198
    .restart local p1    # "item":Lcom/sun/mail/imap/protocol/Item;
    :cond_21
    instance-of v7, p1, Lcom/sun/mail/imap/protocol/RFC822SIZE;

    if-eqz v7, :cond_2c

    .line 1199
    check-cast p1, Lcom/sun/mail/imap/protocol/RFC822SIZE;

    .end local p1    # "item":Lcom/sun/mail/imap/protocol/Item;
    iget v7, p1, Lcom/sun/mail/imap/protocol/RFC822SIZE;->size:I

    iput v7, p0, Lcom/sun/mail/imap/IMAPMessage;->size:I

    goto :goto_9

    .line 1202
    .restart local p1    # "item":Lcom/sun/mail/imap/protocol/Item;
    :cond_2c
    instance-of v7, p1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    if-eqz v7, :cond_35

    .line 1203
    check-cast p1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    .end local p1    # "item":Lcom/sun/mail/imap/protocol/Item;
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    goto :goto_9

    .line 1205
    .restart local p1    # "item":Lcom/sun/mail/imap/protocol/Item;
    :cond_35
    instance-of v7, p1, Lcom/sun/mail/imap/protocol/UID;

    if-eqz v7, :cond_63

    move-object v6, p1

    .line 1206
    check-cast v6, Lcom/sun/mail/imap/protocol/UID;

    .line 1207
    .local v6, "u":Lcom/sun/mail/imap/protocol/UID;
    iget-wide v9, v6, Lcom/sun/mail/imap/protocol/UID;->uid:J

    iput-wide v9, p0, Lcom/sun/mail/imap/IMAPMessage;->uid:J

    .line 1209
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    check-cast v7, Lcom/sun/mail/imap/IMAPFolder;

    iget-object v7, v7, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    if-nez v7, :cond_53

    .line 1210
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    check-cast v7, Lcom/sun/mail/imap/IMAPFolder;

    new-instance v9, Ljava/util/Hashtable;

    invoke-direct {v9}, Ljava/util/Hashtable;-><init>()V

    iput-object v9, v7, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    .line 1211
    :cond_53
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    check-cast v7, Lcom/sun/mail/imap/IMAPFolder;

    iget-object v7, v7, Lcom/sun/mail/imap/IMAPFolder;->uidTable:Ljava/util/Hashtable;

    iget-wide v9, v6, Lcom/sun/mail/imap/protocol/UID;->uid:J

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v7, v9, p0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_9

    .line 1215
    .end local v6    # "u":Lcom/sun/mail/imap/protocol/UID;
    :cond_63
    instance-of v7, p1, Lcom/sun/mail/imap/protocol/RFC822DATA;

    if-nez v7, :cond_6b

    instance-of v7, p1, Lcom/sun/mail/imap/protocol/BODY;

    if-eqz v7, :cond_e9

    .line 1219
    :cond_6b
    instance-of v7, p1, Lcom/sun/mail/imap/protocol/RFC822DATA;

    if-eqz v7, :cond_8e

    move-object v7, p1

    .line 1220
    check-cast v7, Lcom/sun/mail/imap/protocol/RFC822DATA;

    .line 1221
    invoke-virtual {v7}, Lcom/sun/mail/imap/protocol/RFC822DATA;->getByteArrayInputStream()Ljava/io/ByteArrayInputStream;

    move-result-object v3

    .line 1222
    .local v3, "headerStream":Ljava/io/InputStream;
    check-cast p1, Lcom/sun/mail/imap/protocol/RFC822DATA;

    .end local p1    # "item":Lcom/sun/mail/imap/protocol/Item;
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/RFC822DATA;->isHeader()Z

    move-result v4

    .line 1229
    .local v4, "isHeader":Z
    :goto_7c
    if-nez v4, :cond_9c

    .line 1234
    :try_start_7e
    invoke-virtual {v3}, Ljava/io/InputStream;->available()I

    move-result v7

    iput v7, p0, Lcom/sun/mail/imap/IMAPMessage;->size:I
    :try_end_84
    .catch Ljava/io/IOException; {:try_start_7e .. :try_end_84} :catch_ec

    .line 1238
    :goto_84
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/IMAPMessage;->parse(Ljava/io/InputStream;)V

    .line 1239
    iput-boolean v8, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    .line 1240
    invoke-direct {p0, v8}, Lcom/sun/mail/imap/IMAPMessage;->setHeadersLoaded(Z)V

    goto/16 :goto_9

    .end local v3    # "headerStream":Ljava/io/InputStream;
    .end local v4    # "isHeader":Z
    .restart local p1    # "item":Lcom/sun/mail/imap/protocol/Item;
    :cond_8e
    move-object v7, p1

    .line 1224
    check-cast v7, Lcom/sun/mail/imap/protocol/BODY;

    .line 1225
    invoke-virtual {v7}, Lcom/sun/mail/imap/protocol/BODY;->getByteArrayInputStream()Ljava/io/ByteArrayInputStream;

    move-result-object v3

    .line 1226
    .restart local v3    # "headerStream":Ljava/io/InputStream;
    check-cast p1, Lcom/sun/mail/imap/protocol/BODY;

    .end local p1    # "item":Lcom/sun/mail/imap/protocol/Item;
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/BODY;->isHeader()Z

    move-result v4

    .restart local v4    # "isHeader":Z
    goto :goto_7c

    .line 1243
    :cond_9c
    new-instance v1, Lkorex/mail/internet/InternetHeaders;

    invoke-direct {v1}, Lkorex/mail/internet/InternetHeaders;-><init>()V

    .line 1247
    .local v1, "h":Lkorex/mail/internet/InternetHeaders;
    if-eqz v3, :cond_a6

    .line 1248
    invoke-virtual {v1, v3}, Lkorex/mail/internet/InternetHeaders;->load(Ljava/io/InputStream;)V

    .line 1249
    :cond_a6
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    if-eqz v7, :cond_ac

    if-eqz p3, :cond_b5

    .line 1250
    :cond_ac
    iput-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    .line 1276
    :cond_ae
    if-eqz p3, :cond_dd

    .line 1277
    invoke-direct {p0, v8}, Lcom/sun/mail/imap/IMAPMessage;->setHeadersLoaded(Z)V

    goto/16 :goto_9

    .line 1266
    :cond_b5
    invoke-virtual {v1}, Lkorex/mail/internet/InternetHeaders;->getAllHeaders()Ljava/util/Enumeration;

    move-result-object v0

    .line 1267
    .local v0, "e":Ljava/util/Enumeration;
    :cond_b9
    :goto_b9
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_ae

    .line 1268
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkorex/mail/Header;

    .line 1269
    .local v2, "he":Lkorex/mail/Header;
    invoke-virtual {v2}, Lkorex/mail/Header;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/sun/mail/imap/IMAPMessage;->isHeaderLoaded(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_b9

    .line 1270
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    .line 1271
    invoke-virtual {v2}, Lkorex/mail/Header;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2}, Lkorex/mail/Header;->getValue()Ljava/lang/String;

    move-result-object v10

    .line 1270
    invoke-virtual {v7, v9, v10}, Lkorex/mail/internet/InternetHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_b9

    .line 1280
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v2    # "he":Lkorex/mail/Header;
    :cond_dd
    const/4 v5, 0x0

    .local v5, "k":I
    :goto_de
    array-length v7, p2

    if-ge v5, v7, :cond_9

    .line 1281
    aget-object v7, p2, v5

    invoke-direct {p0, v7}, Lcom/sun/mail/imap/IMAPMessage;->setHeaderLoaded(Ljava/lang/String;)V

    .line 1280
    add-int/lit8 v5, v5, 0x1

    goto :goto_de

    .line 1285
    .end local v1    # "h":Lkorex/mail/internet/InternetHeaders;
    .end local v3    # "headerStream":Ljava/io/InputStream;
    .end local v4    # "isHeader":Z
    .end local v5    # "k":I
    .restart local p1    # "item":Lcom/sun/mail/imap/protocol/Item;
    :cond_e9
    const/4 v7, 0x0

    goto/16 :goto_a

    .line 1235
    .end local p1    # "item":Lcom/sun/mail/imap/protocol/Item;
    .restart local v3    # "headerStream":Ljava/io/InputStream;
    .restart local v4    # "isHeader":Z
    :catch_ec
    move-exception v7

    goto :goto_84
.end method

.method protected ignoreBodyStructureSize()Z
    .registers 2

    .prologue
    .line 313
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    invoke-virtual {v0}, Lkorex/mail/Folder;->getStore()Lkorex/mail/Store;

    move-result-object v0

    check-cast v0, Lcom/sun/mail/imap/IMAPStore;

    invoke-virtual {v0}, Lcom/sun/mail/imap/IMAPStore;->ignoreBodyStructureSize()Z

    move-result v0

    return v0
.end method

.method public declared-synchronized invalidateHeaders()V
    .registers 2

    .prologue
    .line 1073
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    iput-boolean v0, p0, Lcom/sun/mail/imap/IMAPMessage;->headersLoaded:Z

    .line 1074
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->loadedHeaders:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->clear()V

    .line 1075
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    .line 1076
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    .line 1077
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    .line 1078
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->receivedDate:Ljava/util/Date;

    .line 1079
    const/4 v0, -0x1

    iput v0, p0, Lcom/sun/mail/imap/IMAPMessage;->size:I

    .line 1080
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->type:Ljava/lang/String;

    .line 1081
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->subject:Ljava/lang/String;

    .line 1082
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->description:Ljava/lang/String;

    .line 1083
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->flags:Lkorex/mail/Flags;

    .line 1084
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->content:[B

    .line 1085
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->contentStream:Ljava/io/InputStream;

    .line 1086
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z
    :try_end_2d
    .catchall {:try_start_2 .. :try_end_2d} :catchall_2f

    .line 1087
    monitor-exit p0

    return-void

    .line 1073
    :catchall_2f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected isREV1()Z
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/FolderClosedException;
        }
    .end annotation

    .prologue
    .line 181
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    check-cast v1, Lcom/sun/mail/imap/IMAPFolder;

    iget-object v0, v1, Lcom/sun/mail/imap/IMAPFolder;->protocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    .line 182
    .local v0, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    if-nez v0, :cond_10

    .line 183
    new-instance v1, Lkorex/mail/FolderClosedException;

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    invoke-direct {v1, v2}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;)V

    throw v1

    .line 185
    :cond_10
    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isREV1()Z

    move-result v1

    return v1
.end method

.method public declared-synchronized isSet(Lkorex/mail/Flags$Flag;)Z
    .registers 3
    .param p1, "flag"    # Lkorex/mail/Flags$Flag;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1015
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 1016
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPMessage;->loadFlags()V

    .line 1017
    invoke-super {p0, p1}, Lkorex/mail/internet/MimeMessage;->isSet(Lkorex/mail/Flags$Flag;)Z
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_d

    move-result v0

    monitor-exit p0

    return v0

    .line 1015
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public removeHeader(Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 936
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPMessage is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setContentID(Ljava/lang/String;)V
    .registers 4
    .param p1, "cid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 603
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPMessage is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setContentLanguage([Ljava/lang/String;)V
    .registers 4
    .param p1, "languages"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 526
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPMessage is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setContentMD5(Ljava/lang/String;)V
    .registers 4
    .param p1, "md5"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 618
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPMessage is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setDataHandler(Lkorex/activation/DataHandler;)V
    .registers 4
    .param p1, "content"    # Lkorex/activation/DataHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 782
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPMessage is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setDescription(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 647
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPMessage is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setDisposition(Ljava/lang/String;)V
    .registers 4
    .param p1, "disposition"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 577
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPMessage is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected setExpunged(Z)V
    .registers 2
    .param p1, "set"    # Z

    .prologue
    .line 273
    invoke-super {p0, p1}, Lkorex/mail/internet/MimeMessage;->setExpunged(Z)V

    .line 274
    return-void
.end method

.method public setFileName(Ljava/lang/String;)V
    .registers 4
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 682
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPMessage is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public declared-synchronized setFlags(Lkorex/mail/Flags;Z)V
    .registers 10
    .param p1, "flag"    # Lkorex/mail/Flags;
    .param p2, "set"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1026
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getMessageCacheLock()Ljava/lang/Object;

    move-result-object v4

    monitor-enter v4
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_27

    .line 1028
    :try_start_6
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v1

    .line 1029
    .local v1, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 1030
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v3

    invoke-virtual {v1, v3, p1, p2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->storeFlags(ILkorex/mail/Flags;Z)V
    :try_end_14
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_6 .. :try_end_14} :catch_17
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_6 .. :try_end_14} :catch_2a
    .catchall {:try_start_6 .. :try_end_14} :catchall_24

    .line 1036
    :try_start_14
    monitor-exit v4
    :try_end_15
    .catchall {:try_start_14 .. :try_end_15} :catchall_24

    .line 1037
    monitor-exit p0

    return-void

    .line 1031
    .end local v1    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catch_17
    move-exception v0

    .line 1032
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_18
    new-instance v3, Lkorex/mail/FolderClosedException;

    iget-object v5, p0, Lcom/sun/mail/imap/IMAPMessage;->folder:Lkorex/mail/Folder;

    invoke-virtual {v0}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v5, v6}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v3

    .line 1036
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_24
    move-exception v3

    monitor-exit v4
    :try_end_26
    .catchall {:try_start_18 .. :try_end_26} :catchall_24

    :try_start_26
    throw v3
    :try_end_27
    .catchall {:try_start_26 .. :try_end_27} :catchall_27

    .line 1026
    :catchall_27
    move-exception v3

    monitor-exit p0

    throw v3

    .line 1033
    :catch_2a
    move-exception v2

    .line 1034
    .local v2, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_2b
    new-instance v3, Lkorex/mail/MessagingException;

    invoke-virtual {v2}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3
    :try_end_35
    .catchall {:try_start_2b .. :try_end_35} :catchall_24
.end method

.method public setFrom(Lkorex/mail/Address;)V
    .registers 4
    .param p1, "address"    # Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 339
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPMessage is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 926
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPMessage is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected setMessageNumber(I)V
    .registers 2
    .param p1, "msgnum"    # I

    .prologue
    .line 215
    invoke-super {p0, p1}, Lkorex/mail/internet/MimeMessage;->setMessageNumber(I)V

    .line 216
    return-void
.end method

.method setModSeq(J)V
    .registers 3
    .param p1, "modseq"    # J

    .prologue
    .line 268
    iput-wide p1, p0, Lcom/sun/mail/imap/IMAPMessage;->modseq:J

    .line 269
    return-void
.end method

.method public declared-synchronized setPeek(Z)V
    .registers 3
    .param p1, "peek"    # Z

    .prologue
    .line 1048
    monitor-enter p0

    :try_start_1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPMessage;->peek:Ljava/lang/Boolean;
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_9

    .line 1049
    monitor-exit p0

    return-void

    .line 1048
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setRecipients(Lkorex/mail/Message$RecipientType;[Lkorex/mail/Address;)V
    .registers 5
    .param p1, "type"    # Lkorex/mail/Message$RecipientType;
    .param p2, "addresses"    # [Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 387
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPMessage is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
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
    .line 415
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPMessage is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSender(Lkorex/mail/Address;)V
    .registers 4
    .param p1, "address"    # Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 362
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPMessage is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSentDate(Ljava/util/Date;)V
    .registers 4
    .param p1, "d"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 466
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPMessage is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSubject(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "subject"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 448
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPMessage is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected setUID(J)V
    .registers 3
    .param p1, "uid"    # J

    .prologue
    .line 230
    iput-wide p1, p0, Lcom/sun/mail/imap/IMAPMessage;->uid:J

    .line 231
    return-void
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 6
    .param p1, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 841
    iget-boolean v3, p0, Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z

    if-eqz v3, :cond_8

    .line 842
    invoke-super {p0, p1}, Lkorex/mail/internet/MimeMessage;->writeTo(Ljava/io/OutputStream;)V

    .line 855
    :goto_7
    return-void

    .line 845
    :cond_8
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPMessage;->getMimeStream()Ljava/io/InputStream;

    move-result-object v2

    .line 848
    .local v2, "is":Ljava/io/InputStream;
    const/16 v3, 0x4000

    :try_start_e
    new-array v0, v3, [B

    .line 850
    .local v0, "bytes":[B
    :goto_10
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "count":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_21

    .line 851
    const/4 v3, 0x0

    invoke-virtual {p1, v0, v3, v1}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1b
    .catchall {:try_start_e .. :try_end_1b} :catchall_1c

    goto :goto_10

    .line 853
    .end local v0    # "bytes":[B
    .end local v1    # "count":I
    :catchall_1c
    move-exception v3

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw v3

    .restart local v0    # "bytes":[B
    .restart local v1    # "count":I
    :cond_21
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    goto :goto_7
.end method
