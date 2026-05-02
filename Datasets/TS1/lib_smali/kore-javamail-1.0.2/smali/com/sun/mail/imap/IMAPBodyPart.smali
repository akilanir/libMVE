.class public Lcom/sun/mail/imap/IMAPBodyPart;
.super Lkorex/mail/internet/MimeBodyPart;
.source "IMAPBodyPart.java"

# interfaces
.implements Lcom/sun/mail/util/ReadableMime;


# static fields
.field private static final decodeFileName:Z


# instance fields
.field private bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

.field private description:Ljava/lang/String;

.field private headersLoaded:Z

.field private message:Lcom/sun/mail/imap/IMAPMessage;

.field private sectionId:Ljava/lang/String;

.field private type:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 74
    const-string v0, "mail.mime.decodefilename"

    const/4 v1, 0x0

    .line 75
    invoke-static {v0, v1}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/sun/mail/imap/IMAPBodyPart;->decodeFileName:Z

    .line 74
    return-void
.end method

.method protected constructor <init>(Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;Ljava/lang/String;Lcom/sun/mail/imap/IMAPMessage;)V
    .registers 8
    .param p1, "bs"    # Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;
    .param p2, "sid"    # Ljava/lang/String;
    .param p3, "message"    # Lcom/sun/mail/imap/IMAPMessage;

    .prologue
    .line 78
    invoke-direct {p0}, Lkorex/mail/internet/MimeBodyPart;-><init>()V

    .line 72
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/sun/mail/imap/IMAPBodyPart;->headersLoaded:Z

    .line 79
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    .line 80
    iput-object p2, p0, Lcom/sun/mail/imap/IMAPBodyPart;->sectionId:Ljava/lang/String;

    .line 81
    iput-object p3, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    .line 83
    new-instance v0, Lkorex/mail/internet/ContentType;

    iget-object v1, p1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->type:Ljava/lang/String;

    iget-object v2, p1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->subtype:Ljava/lang/String;

    iget-object v3, p1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->cParams:Lkorex/mail/internet/ParameterList;

    invoke-direct {v0, v1, v2, v3}, Lkorex/mail/internet/ContentType;-><init>(Ljava/lang/String;Ljava/lang/String;Lkorex/mail/internet/ParameterList;)V

    .line 84
    .local v0, "ct":Lkorex/mail/internet/ContentType;
    invoke-virtual {v0}, Lkorex/mail/internet/ContentType;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/imap/IMAPBodyPart;->type:Ljava/lang/String;

    .line 85
    return-void
.end method

.method private getHeaderStream()Ljava/io/InputStream;
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 217
    iget-object v9, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v9}, Lcom/sun/mail/imap/IMAPMessage;->isREV1()Z

    move-result v9

    if-nez v9, :cond_b

    .line 218
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPBodyPart;->loadHeaders()V

    .line 221
    :cond_b
    iget-object v9, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v9}, Lcom/sun/mail/imap/IMAPMessage;->getMessageCacheLock()Ljava/lang/Object;

    move-result-object v10

    monitor-enter v10

    .line 223
    :try_start_12
    iget-object v9, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v9}, Lcom/sun/mail/imap/IMAPMessage;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v6

    .line 226
    .local v6, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    iget-object v9, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v9}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 228
    invoke-virtual {v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isREV1()Z

    move-result v9

    if-eqz v9, :cond_7b

    .line 229
    iget-object v9, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v9}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v8

    .line 230
    .local v8, "seqnum":I
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, p0, Lcom/sun/mail/imap/IMAPBodyPart;->sectionId:Ljava/lang/String;

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, ".MIME"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->peekBody(ILjava/lang/String;)Lcom/sun/mail/imap/protocol/BODY;

    move-result-object v0

    .line 232
    .local v0, "b":Lcom/sun/mail/imap/protocol/BODY;
    if-nez v0, :cond_60

    .line 233
    new-instance v9, Lkorex/mail/MessagingException;

    const-string v11, "Failed to fetch headers"

    invoke-direct {v9, v11}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_4c
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_12 .. :try_end_4c} :catch_4c
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_12 .. :try_end_4c} :catch_6e
    .catchall {:try_start_12 .. :try_end_4c} :catchall_5d

    .line 263
    .end local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    .end local v6    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v8    # "seqnum":I
    :catch_4c
    move-exception v3

    .line 264
    .local v3, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_4d
    new-instance v9, Lkorex/mail/FolderClosedException;

    iget-object v11, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    .line 265
    invoke-virtual {v11}, Lcom/sun/mail/imap/IMAPMessage;->getFolder()Lkorex/mail/Folder;

    move-result-object v11

    invoke-virtual {v3}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v9, v11, v12}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v9

    .line 269
    .end local v3    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_5d
    move-exception v9

    monitor-exit v10
    :try_end_5f
    .catchall {:try_start_4d .. :try_end_5f} :catchall_5d

    throw v9

    .line 235
    .restart local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    .restart local v6    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .restart local v8    # "seqnum":I
    :cond_60
    :try_start_60
    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/BODY;->getByteArrayInputStream()Ljava/io/ByteArrayInputStream;

    move-result-object v1

    .line 236
    .local v1, "bis":Ljava/io/ByteArrayInputStream;
    if-nez v1, :cond_79

    .line 237
    new-instance v9, Lkorex/mail/MessagingException;

    const-string v11, "Failed to fetch headers"

    invoke-direct {v9, v11}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_6e
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_60 .. :try_end_6e} :catch_4c
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_60 .. :try_end_6e} :catch_6e
    .catchall {:try_start_60 .. :try_end_6e} :catchall_5d

    .line 266
    .end local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    .end local v1    # "bis":Ljava/io/ByteArrayInputStream;
    .end local v6    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v8    # "seqnum":I
    :catch_6e
    move-exception v7

    .line 267
    .local v7, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_6f
    new-instance v9, Lkorex/mail/MessagingException;

    invoke-virtual {v7}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v11, v7}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v9

    .line 238
    .end local v7    # "pex":Lcom/sun/mail/iap/ProtocolException;
    .restart local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    .restart local v1    # "bis":Ljava/io/ByteArrayInputStream;
    .restart local v6    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .restart local v8    # "seqnum":I
    :cond_79
    monitor-exit v10
    :try_end_7a
    .catchall {:try_start_6f .. :try_end_7a} :catchall_5d

    .line 261
    .end local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    .end local v1    # "bis":Ljava/io/ByteArrayInputStream;
    .end local v8    # "seqnum":I
    :goto_7a
    return-object v1

    .line 242
    :cond_7b
    :try_start_7b
    new-instance v2, Lcom/sun/mail/util/SharedByteArrayOutputStream;

    const/4 v9, 0x0

    invoke-direct {v2, v9}, Lcom/sun/mail/util/SharedByteArrayOutputStream;-><init>(I)V

    .line 244
    .local v2, "bos":Lcom/sun/mail/util/SharedByteArrayOutputStream;
    new-instance v5, Lcom/sun/mail/util/LineOutputStream;

    invoke-direct {v5, v2}, Lcom/sun/mail/util/LineOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_86
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_7b .. :try_end_86} :catch_4c
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_7b .. :try_end_86} :catch_6e
    .catchall {:try_start_7b .. :try_end_86} :catchall_5d

    .line 248
    .local v5, "los":Lcom/sun/mail/util/LineOutputStream;
    :try_start_86
    invoke-super {p0}, Lkorex/mail/internet/MimeBodyPart;->getAllHeaderLines()Ljava/util/Enumeration;

    move-result-object v4

    .line 249
    .local v4, "hdrLines":Ljava/util/Enumeration;
    :goto_8a
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_a4

    .line 250
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v5, v9}, Lcom/sun/mail/util/LineOutputStream;->writeln(Ljava/lang/String;)V
    :try_end_99
    .catch Ljava/io/IOException; {:try_start_86 .. :try_end_99} :catch_9a
    .catchall {:try_start_86 .. :try_end_99} :catchall_ad

    goto :goto_8a

    .line 254
    .end local v4    # "hdrLines":Ljava/util/Enumeration;
    :catch_9a
    move-exception v9

    .line 258
    :try_start_9b
    invoke-virtual {v5}, Lcom/sun/mail/util/LineOutputStream;->close()V
    :try_end_9e
    .catch Ljava/io/IOException; {:try_start_9b .. :try_end_9e} :catch_b2
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_9b .. :try_end_9e} :catch_4c
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_9b .. :try_end_9e} :catch_6e
    .catchall {:try_start_9b .. :try_end_9e} :catchall_5d

    .line 261
    :goto_9e
    :try_start_9e
    invoke-virtual {v2}, Lcom/sun/mail/util/SharedByteArrayOutputStream;->toStream()Ljava/io/InputStream;
    :try_end_a1
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_9e .. :try_end_a1} :catch_4c
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_9e .. :try_end_a1} :catch_6e
    .catchall {:try_start_9e .. :try_end_a1} :catchall_5d

    move-result-object v1

    :try_start_a2
    monitor-exit v10
    :try_end_a3
    .catchall {:try_start_a2 .. :try_end_a3} :catchall_5d

    goto :goto_7a

    .line 253
    .restart local v4    # "hdrLines":Ljava/util/Enumeration;
    :cond_a4
    :try_start_a4
    invoke-virtual {v5}, Lcom/sun/mail/util/LineOutputStream;->writeln()V
    :try_end_a7
    .catch Ljava/io/IOException; {:try_start_a4 .. :try_end_a7} :catch_9a
    .catchall {:try_start_a4 .. :try_end_a7} :catchall_ad

    .line 258
    :try_start_a7
    invoke-virtual {v5}, Lcom/sun/mail/util/LineOutputStream;->close()V
    :try_end_aa
    .catch Ljava/io/IOException; {:try_start_a7 .. :try_end_aa} :catch_ab
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_a7 .. :try_end_aa} :catch_4c
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_a7 .. :try_end_aa} :catch_6e
    .catchall {:try_start_a7 .. :try_end_aa} :catchall_5d

    goto :goto_9e

    .line 259
    :catch_ab
    move-exception v9

    goto :goto_9e

    .line 257
    .end local v4    # "hdrLines":Ljava/util/Enumeration;
    :catchall_ad
    move-exception v9

    .line 258
    :try_start_ae
    invoke-virtual {v5}, Lcom/sun/mail/util/LineOutputStream;->close()V
    :try_end_b1
    .catch Ljava/io/IOException; {:try_start_ae .. :try_end_b1} :catch_b4
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_ae .. :try_end_b1} :catch_4c
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_ae .. :try_end_b1} :catch_6e
    .catchall {:try_start_ae .. :try_end_b1} :catchall_5d

    .line 259
    :goto_b1
    :try_start_b1
    throw v9
    :try_end_b2
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_b1 .. :try_end_b2} :catch_4c
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_b1 .. :try_end_b2} :catch_6e
    .catchall {:try_start_b1 .. :try_end_b2} :catchall_5d

    :catch_b2
    move-exception v9

    goto :goto_9e

    :catch_b4
    move-exception v11

    goto :goto_b1
.end method

.method private declared-synchronized loadHeaders()V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 378
    monitor-enter p0

    :try_start_1
    iget-boolean v6, p0, Lcom/sun/mail/imap/IMAPBodyPart;->headersLoaded:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_67

    if-eqz v6, :cond_7

    .line 439
    :goto_5
    monitor-exit p0

    return-void

    .line 384
    :cond_7
    :try_start_7
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    if-nez v6, :cond_12

    .line 385
    new-instance v6, Lkorex/mail/internet/InternetHeaders;

    invoke-direct {v6}, Lkorex/mail/internet/InternetHeaders;-><init>()V

    iput-object v6, p0, Lcom/sun/mail/imap/IMAPBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    .line 390
    :cond_12
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v6}, Lcom/sun/mail/imap/IMAPMessage;->getMessageCacheLock()Ljava/lang/Object;

    move-result-object v7

    monitor-enter v7
    :try_end_19
    .catchall {:try_start_7 .. :try_end_19} :catchall_67

    .line 392
    :try_start_19
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v6}, Lcom/sun/mail/imap/IMAPMessage;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v3

    .line 395
    .local v3, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v6}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 397
    invoke-virtual {v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isREV1()Z

    move-result v6

    if-eqz v6, :cond_8e

    .line 398
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v6}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v5

    .line 399
    .local v5, "seqnum":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/sun/mail/imap/IMAPBodyPart;->sectionId:Ljava/lang/String;

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, ".MIME"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->peekBody(ILjava/lang/String;)Lcom/sun/mail/imap/protocol/BODY;

    move-result-object v0

    .line 401
    .local v0, "b":Lcom/sun/mail/imap/protocol/BODY;
    if-nez v0, :cond_6a

    .line 402
    new-instance v6, Lkorex/mail/MessagingException;

    const-string v8, "Failed to fetch headers"

    invoke-direct {v6, v8}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_53
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_19 .. :try_end_53} :catch_53
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_19 .. :try_end_53} :catch_78
    .catchall {:try_start_19 .. :try_end_53} :catchall_64

    .line 431
    .end local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    .end local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v5    # "seqnum":I
    :catch_53
    move-exception v2

    .line 432
    .local v2, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_54
    new-instance v6, Lkorex/mail/FolderClosedException;

    iget-object v8, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    .line 433
    invoke-virtual {v8}, Lcom/sun/mail/imap/IMAPMessage;->getFolder()Lkorex/mail/Folder;

    move-result-object v8

    invoke-virtual {v2}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v6, v8, v9}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v6

    .line 437
    .end local v2    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_64
    move-exception v6

    monitor-exit v7
    :try_end_66
    .catchall {:try_start_54 .. :try_end_66} :catchall_64

    :try_start_66
    throw v6
    :try_end_67
    .catchall {:try_start_66 .. :try_end_67} :catchall_67

    .line 378
    :catchall_67
    move-exception v6

    monitor-exit p0

    throw v6

    .line 404
    .restart local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    .restart local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .restart local v5    # "seqnum":I
    :cond_6a
    :try_start_6a
    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/BODY;->getByteArrayInputStream()Ljava/io/ByteArrayInputStream;

    move-result-object v1

    .line 405
    .local v1, "bis":Ljava/io/ByteArrayInputStream;
    if-nez v1, :cond_83

    .line 406
    new-instance v6, Lkorex/mail/MessagingException;

    const-string v8, "Failed to fetch headers"

    invoke-direct {v6, v8}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_78
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_6a .. :try_end_78} :catch_53
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_6a .. :try_end_78} :catch_78
    .catchall {:try_start_6a .. :try_end_78} :catchall_64

    .line 434
    .end local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    .end local v1    # "bis":Ljava/io/ByteArrayInputStream;
    .end local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v5    # "seqnum":I
    :catch_78
    move-exception v4

    .line 435
    .local v4, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_79
    new-instance v6, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6
    :try_end_83
    .catchall {:try_start_79 .. :try_end_83} :catchall_64

    .line 408
    .end local v4    # "pex":Lcom/sun/mail/iap/ProtocolException;
    .restart local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    .restart local v1    # "bis":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .restart local v5    # "seqnum":I
    :cond_83
    :try_start_83
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v6, v1}, Lkorex/mail/internet/InternetHeaders;->load(Ljava/io/InputStream;)V
    :try_end_88
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_83 .. :try_end_88} :catch_53
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_83 .. :try_end_88} :catch_78
    .catchall {:try_start_83 .. :try_end_88} :catchall_64

    .line 437
    .end local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    .end local v1    # "bis":Ljava/io/ByteArrayInputStream;
    .end local v5    # "seqnum":I
    :cond_88
    :goto_88
    :try_start_88
    monitor-exit v7
    :try_end_89
    .catchall {:try_start_88 .. :try_end_89} :catchall_64

    .line 438
    const/4 v6, 0x1

    :try_start_8a
    iput-boolean v6, p0, Lcom/sun/mail/imap/IMAPBodyPart;->headersLoaded:Z
    :try_end_8c
    .catchall {:try_start_8a .. :try_end_8c} :catchall_67

    goto/16 :goto_5

    .line 417
    :cond_8e
    :try_start_8e
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    const-string v8, "Content-Type"

    iget-object v9, p0, Lcom/sun/mail/imap/IMAPBodyPart;->type:Ljava/lang/String;

    invoke-virtual {v6, v8, v9}, Lkorex/mail/internet/InternetHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 419
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    const-string v8, "Content-Transfer-Encoding"

    iget-object v9, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v9, v9, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->encoding:Ljava/lang/String;

    invoke-virtual {v6, v8, v9}, Lkorex/mail/internet/InternetHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 421
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v6, v6, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->description:Ljava/lang/String;

    if-eqz v6, :cond_b3

    .line 422
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    const-string v8, "Content-Description"

    iget-object v9, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v9, v9, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->description:Ljava/lang/String;

    invoke-virtual {v6, v8, v9}, Lkorex/mail/internet/InternetHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 425
    :cond_b3
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v6, v6, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->id:Ljava/lang/String;

    if-eqz v6, :cond_c4

    .line 426
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    const-string v8, "Content-ID"

    iget-object v9, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v9, v9, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->id:Ljava/lang/String;

    invoke-virtual {v6, v8, v9}, Lkorex/mail/internet/InternetHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 428
    :cond_c4
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v6, v6, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->md5:Ljava/lang/String;

    if-eqz v6, :cond_88

    .line 429
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    const-string v8, "Content-MD5"

    iget-object v9, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v9, v9, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->md5:Ljava/lang/String;

    invoke-virtual {v6, v8, v9}, Lkorex/mail/internet/InternetHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_d5
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_8e .. :try_end_d5} :catch_53
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_8e .. :try_end_d5} :catch_78
    .catchall {:try_start_8e .. :try_end_d5} :catchall_64

    goto :goto_88
.end method


# virtual methods
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
    .line 332
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPBodyPart is read-only"

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
    .line 357
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPBodyPart is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAllHeaderLines()Ljava/util/Enumeration;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 361
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPBodyPart;->loadHeaders()V

    .line 362
    invoke-super {p0}, Lkorex/mail/internet/MimeBodyPart;->getAllHeaderLines()Ljava/util/Enumeration;

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
    .line 340
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPBodyPart;->loadHeaders()V

    .line 341
    invoke-super {p0}, Lkorex/mail/internet/MimeBodyPart;->getAllHeaders()Ljava/util/Enumeration;

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
    .line 121
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getContentMD5()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 125
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->md5:Ljava/lang/String;

    return-object v0
.end method

.method protected getContentStream()Ljava/io/InputStream;
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v8, -0x1

    .line 174
    const/4 v2, 0x0

    .line 175
    .local v2, "is":Ljava/io/InputStream;
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v7}, Lcom/sun/mail/imap/IMAPMessage;->getPeek()Z

    move-result v5

    .line 178
    .local v5, "pk":Z
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v7}, Lcom/sun/mail/imap/IMAPMessage;->getMessageCacheLock()Ljava/lang/Object;

    move-result-object v9

    monitor-enter v9

    .line 180
    :try_start_f
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v7}, Lcom/sun/mail/imap/IMAPMessage;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v3

    .line 183
    .local v3, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v7}, Lcom/sun/mail/imap/IMAPMessage;->checkExpunged()V

    .line 185
    invoke-virtual {v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isREV1()Z

    move-result v7

    if-eqz v7, :cond_40

    iget-object v7, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v7}, Lcom/sun/mail/imap/IMAPMessage;->getFetchBlockSize()I

    move-result v7

    if-eq v7, v8, :cond_40

    .line 186
    new-instance v7, Lcom/sun/mail/imap/IMAPInputStream;

    iget-object v10, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    iget-object v11, p0, Lcom/sun/mail/imap/IMAPBodyPart;->sectionId:Ljava/lang/String;

    iget-object v12, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    .line 187
    invoke-virtual {v12}, Lcom/sun/mail/imap/IMAPMessage;->ignoreBodyStructureSize()Z

    move-result v12

    if-eqz v12, :cond_3b

    :goto_36
    invoke-direct {v7, v10, v11, v8, v5}, Lcom/sun/mail/imap/IMAPInputStream;-><init>(Lcom/sun/mail/imap/IMAPMessage;Ljava/lang/String;IZ)V
    :try_end_39
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_f .. :try_end_39} :catch_66
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_f .. :try_end_39} :catch_7a
    .catchall {:try_start_f .. :try_end_39} :catchall_77

    :try_start_39
    monitor-exit v9
    :try_end_3a
    .catchall {:try_start_39 .. :try_end_3a} :catchall_77

    .line 210
    :goto_3a
    return-object v7

    .line 187
    :cond_3b
    :try_start_3b
    iget-object v8, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget v8, v8, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->size:I

    goto :goto_36

    .line 191
    :cond_40
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v7}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v6

    .line 193
    .local v6, "seqnum":I
    if-eqz v5, :cond_5f

    .line 194
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPBodyPart;->sectionId:Ljava/lang/String;

    invoke-virtual {v3, v6, v7}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->peekBody(ILjava/lang/String;)Lcom/sun/mail/imap/protocol/BODY;

    move-result-object v0

    .line 197
    .local v0, "b":Lcom/sun/mail/imap/protocol/BODY;
    :goto_4e
    if-eqz v0, :cond_54

    .line 198
    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/BODY;->getByteArrayInputStream()Ljava/io/ByteArrayInputStream;
    :try_end_53
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_3b .. :try_end_53} :catch_66
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_3b .. :try_end_53} :catch_7a
    .catchall {:try_start_3b .. :try_end_53} :catchall_77

    move-result-object v2

    .line 205
    :cond_54
    :try_start_54
    monitor-exit v9
    :try_end_55
    .catchall {:try_start_54 .. :try_end_55} :catchall_77

    .line 207
    if-nez v2, :cond_85

    .line 208
    new-instance v7, Lkorex/mail/MessagingException;

    const-string v8, "No content"

    invoke-direct {v7, v8}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 196
    .end local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    :cond_5f
    :try_start_5f
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPBodyPart;->sectionId:Ljava/lang/String;

    invoke-virtual {v3, v6, v7}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchBody(ILjava/lang/String;)Lcom/sun/mail/imap/protocol/BODY;
    :try_end_64
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_5f .. :try_end_64} :catch_66
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_5f .. :try_end_64} :catch_7a
    .catchall {:try_start_5f .. :try_end_64} :catchall_77

    move-result-object v0

    .restart local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    goto :goto_4e

    .line 199
    .end local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    .end local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v6    # "seqnum":I
    :catch_66
    move-exception v1

    .line 200
    .local v1, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_67
    new-instance v7, Lkorex/mail/FolderClosedException;

    iget-object v8, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    .line 201
    invoke-virtual {v8}, Lcom/sun/mail/imap/IMAPMessage;->getFolder()Lkorex/mail/Folder;

    move-result-object v8

    invoke-virtual {v1}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v7, v8, v10}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v7

    .line 205
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_77
    move-exception v7

    monitor-exit v9
    :try_end_79
    .catchall {:try_start_67 .. :try_end_79} :catchall_77

    throw v7

    .line 202
    :catch_7a
    move-exception v4

    .line 203
    .local v4, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_7b
    new-instance v7, Lkorex/mail/MessagingException;

    invoke-virtual {v4}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v7
    :try_end_85
    .catchall {:try_start_7b .. :try_end_85} :catchall_77

    .end local v4    # "pex":Lcom/sun/mail/iap/ProtocolException;
    .restart local v0    # "b":Lcom/sun/mail/imap/protocol/BODY;
    .restart local v3    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .restart local v6    # "seqnum":I
    :cond_85
    move-object v7, v2

    .line 210
    goto :goto_3a
.end method

.method public getContentType()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 105
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPBodyPart;->type:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized getDataHandler()Lkorex/activation/DataHandler;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 289
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPBodyPart;->dh:Lkorex/activation/DataHandler;

    if-nez v0, :cond_21

    .line 290
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->isMulti()Z

    move-result v0

    if-eqz v0, :cond_27

    .line 291
    new-instance v0, Lkorex/activation/DataHandler;

    new-instance v1, Lcom/sun/mail/imap/IMAPMultipartDataSource;

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v2, v2, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->bodies:[Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v3, p0, Lcom/sun/mail/imap/IMAPBodyPart;->sectionId:Ljava/lang/String;

    iget-object v4, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    invoke-direct {v1, p0, v2, v3, v4}, Lcom/sun/mail/imap/IMAPMultipartDataSource;-><init>(Lkorex/mail/internet/MimePart;[Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;Ljava/lang/String;Lcom/sun/mail/imap/IMAPMessage;)V

    invoke-direct {v0, v1}, Lkorex/activation/DataHandler;-><init>(Lkorex/activation/DataSource;)V

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPBodyPart;->dh:Lkorex/activation/DataHandler;

    .line 305
    :cond_21
    :goto_21
    invoke-super {p0}, Lkorex/mail/internet/MimeBodyPart;->getDataHandler()Lkorex/activation/DataHandler;
    :try_end_24
    .catchall {:try_start_1 .. :try_end_24} :catchall_5b

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 295
    :cond_27
    :try_start_27
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->isNested()Z

    move-result v0

    if-eqz v0, :cond_21

    iget-object v0, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v0}, Lcom/sun/mail/imap/IMAPMessage;->isREV1()Z

    move-result v0

    if-eqz v0, :cond_21

    iget-object v0, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    if-eqz v0, :cond_21

    .line 296
    new-instance v0, Lkorex/activation/DataHandler;

    new-instance v1, Lcom/sun/mail/imap/IMAPNestedMessage;

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPBodyPart;->message:Lcom/sun/mail/imap/IMAPMessage;

    iget-object v3, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v3, v3, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->bodies:[Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    iget-object v4, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v4, v4, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    iget-object v5, p0, Lcom/sun/mail/imap/IMAPBodyPart;->sectionId:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/sun/mail/imap/IMAPNestedMessage;-><init>(Lcom/sun/mail/imap/IMAPMessage;Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;Lcom/sun/mail/imap/protocol/ENVELOPE;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPBodyPart;->type:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lkorex/activation/DataHandler;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPBodyPart;->dh:Lkorex/activation/DataHandler;
    :try_end_5a
    .catchall {:try_start_27 .. :try_end_5a} :catchall_5b

    goto :goto_21

    .line 289
    :catchall_5b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getDescription()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 133
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPBodyPart;->description:Ljava/lang/String;

    if-eqz v1, :cond_7

    .line 134
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPBodyPart;->description:Ljava/lang/String;

    .line 145
    :goto_6
    return-object v1

    .line 136
    :cond_7
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v1, v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->description:Ljava/lang/String;

    if-nez v1, :cond_f

    .line 137
    const/4 v1, 0x0

    goto :goto_6

    .line 140
    :cond_f
    :try_start_f
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v1, v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->description:Ljava/lang/String;

    invoke-static {v1}, Lkorex/mail/internet/MimeUtility;->decodeText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/imap/IMAPBodyPart;->description:Ljava/lang/String;
    :try_end_19
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_f .. :try_end_19} :catch_1c

    .line 145
    :goto_19
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPBodyPart;->description:Ljava/lang/String;

    goto :goto_6

    .line 141
    :catch_1c
    move-exception v0

    .line 142
    .local v0, "ex":Ljava/io/UnsupportedEncodingException;
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v1, v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->description:Ljava/lang/String;

    iput-object v1, p0, Lcom/sun/mail/imap/IMAPBodyPart;->description:Ljava/lang/String;

    goto :goto_19
.end method

.method public getDisposition()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 109
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->disposition:Ljava/lang/String;

    return-object v0
.end method

.method public getEncoding()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 117
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method public getFileName()Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 154
    const/4 v1, 0x0

    .line 155
    .local v1, "filename":Ljava/lang/String;
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v2, v2, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->dParams:Lkorex/mail/internet/ParameterList;

    if-eqz v2, :cond_11

    .line 156
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v2, v2, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->dParams:Lkorex/mail/internet/ParameterList;

    const-string v3, "filename"

    invoke-virtual {v2, v3}, Lkorex/mail/internet/ParameterList;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 157
    :cond_11
    if-nez v1, :cond_23

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v2, v2, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->cParams:Lkorex/mail/internet/ParameterList;

    if-eqz v2, :cond_23

    .line 158
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget-object v2, v2, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->cParams:Lkorex/mail/internet/ParameterList;

    const-string v3, "name"

    invoke-virtual {v2, v3}, Lkorex/mail/internet/ParameterList;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 159
    :cond_23
    sget-boolean v2, Lcom/sun/mail/imap/IMAPBodyPart;->decodeFileName:Z

    if-eqz v2, :cond_2d

    if-eqz v1, :cond_2d

    .line 161
    :try_start_29
    invoke-static {v1}, Lkorex/mail/internet/MimeUtility;->decodeText(Ljava/lang/String;)Ljava/lang/String;
    :try_end_2c
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_29 .. :try_end_2c} :catch_2e

    move-result-object v1

    .line 166
    :cond_2d
    return-object v1

    .line 162
    :catch_2e
    move-exception v0

    .line 163
    .local v0, "ex":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Lkorex/mail/MessagingException;

    const-string v3, "Can\'t decode filename"

    invoke-direct {v2, v3, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v2
.end method

.method public getHeader(Ljava/lang/String;)[Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 321
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPBodyPart;->loadHeaders()V

    .line 322
    invoke-super {p0, p1}, Lkorex/mail/internet/MimeBodyPart;->getHeader(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLineCount()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 101
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

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
    .line 367
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPBodyPart;->loadHeaders()V

    .line 368
    invoke-super {p0, p1}, Lkorex/mail/internet/MimeBodyPart;->getMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;

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
    .line 346
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPBodyPart;->loadHeaders()V

    .line 347
    invoke-super {p0, p1}, Lkorex/mail/internet/MimeBodyPart;->getMatchingHeaders([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getMimeStream()Ljava/io/InputStream;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 284
    new-instance v0, Ljava/io/SequenceInputStream;

    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPBodyPart;->getHeaderStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPBodyPart;->getContentStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/SequenceInputStream;-><init>(Ljava/io/InputStream;Ljava/io/InputStream;)V

    return-object v0
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
    .line 373
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPBodyPart;->loadHeaders()V

    .line 374
    invoke-super {p0, p1}, Lkorex/mail/internet/MimeBodyPart;->getNonMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;

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
    .line 352
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPBodyPart;->loadHeaders()V

    .line 353
    invoke-super {p0, p1}, Lkorex/mail/internet/MimeBodyPart;->getNonMatchingHeaders([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getSize()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 97
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPBodyPart;->bs:Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iget v0, v0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->size:I

    return v0
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
    .line 336
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPBodyPart is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setContent(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;
    .param p2, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 313
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPBodyPart is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setContent(Lkorex/mail/Multipart;)V
    .registers 4
    .param p1, "mp"    # Lkorex/mail/Multipart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 317
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPBodyPart is read-only"

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
    .line 129
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPBodyPart is read-only"

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
    .line 309
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPBodyPart is read-only"

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
    .line 150
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPBodyPart is read-only"

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
    .line 113
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPBodyPart is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
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
    .line 170
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPBodyPart is read-only"

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
    .line 327
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "IMAPBodyPart is read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected updateHeaders()V
    .registers 1

    .prologue
    .line 93
    return-void
.end method
