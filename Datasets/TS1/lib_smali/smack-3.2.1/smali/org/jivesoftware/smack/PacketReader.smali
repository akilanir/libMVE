.class Lorg/jivesoftware/smack/PacketReader;
.super Ljava/lang/Object;
.source "PacketReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/PacketReader$ListenerNotification;
    }
.end annotation


# instance fields
.field private connection:Lorg/jivesoftware/smack/XMPPConnection;

.field private connectionID:Ljava/lang/String;

.field private connectionSemaphore:Ljava/util/concurrent/Semaphore;

.field private done:Z

.field private listenerExecutor:Ljava/util/concurrent/ExecutorService;

.field private parser:Lorg/xmlpull/v1/XmlPullParser;

.field private readerThread:Ljava/lang/Thread;


# direct methods
.method protected constructor <init>(Lorg/jivesoftware/smack/XMPPConnection;)V
    .registers 3
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->connectionID:Ljava/lang/String;

    .line 56
    iput-object p1, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    .line 57
    invoke-virtual {p0}, Lorg/jivesoftware/smack/PacketReader;->init()V

    .line 58
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smack/PacketReader;Ljava/lang/Thread;)V
    .registers 2
    .param p0, "x0"    # Lorg/jivesoftware/smack/PacketReader;
    .param p1, "x1"    # Ljava/lang/Thread;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/PacketReader;->parsePackets(Ljava/lang/Thread;)V

    return-void
.end method

.method static synthetic access$100(Lorg/jivesoftware/smack/PacketReader;)Lorg/jivesoftware/smack/XMPPConnection;
    .registers 2
    .param p0, "x0"    # Lorg/jivesoftware/smack/PacketReader;

    .prologue
    .line 43
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    return-object v0
.end method

.method private parseFeatures(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 10
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 372
    const/4 v2, 0x0

    .line 373
    .local v2, "startTLSReceived":Z
    const/4 v3, 0x0

    .line 374
    .local v3, "startTLSRequired":Z
    const/4 v0, 0x0

    .line 375
    .local v0, "done":Z
    :cond_3
    :goto_3
    if-nez v0, :cond_c4

    .line 376
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 378
    .local v1, "eventType":I
    const/4 v4, 0x2

    if-ne v1, v4, :cond_8e

    .line 379
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "starttls"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 380
    const/4 v2, 0x1

    goto :goto_3

    .line 382
    :cond_1a
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "mechanisms"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_34

    .line 386
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->getSASLAuthentication()Lorg/jivesoftware/smack/SASLAuthentication;

    move-result-object v4

    invoke-static {p1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseMechanisms(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Collection;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smack/SASLAuthentication;->setAvailableSASLMethods(Ljava/util/Collection;)V

    goto :goto_3

    .line 389
    :cond_34
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "bind"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4a

    .line 391
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->getSASLAuthentication()Lorg/jivesoftware/smack/SASLAuthentication;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smack/SASLAuthentication;->bindingRequired()V

    goto :goto_3

    .line 393
    :cond_4a
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "session"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_60

    .line 395
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->getSASLAuthentication()Lorg/jivesoftware/smack/SASLAuthentication;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smack/SASLAuthentication;->sessionsSupported()V

    goto :goto_3

    .line 397
    :cond_60
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "compression"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_76

    .line 399
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-static {p1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseCompressionMethods(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Collection;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smack/XMPPConnection;->setAvailableCompressionMethods(Ljava/util/Collection;)V

    goto :goto_3

    .line 401
    :cond_76
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "register"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 402
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->getAccountManager()Lorg/jivesoftware/smack/AccountManager;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smack/AccountManager;->setSupportsAccountCreation(Z)V

    goto/16 :goto_3

    .line 405
    :cond_8e
    const/4 v4, 0x3

    if-ne v1, v4, :cond_3

    .line 406
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "starttls"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a4

    .line 408
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v4, v3}, Lorg/jivesoftware/smack/XMPPConnection;->startTLSReceived(Z)V

    goto/16 :goto_3

    .line 410
    :cond_a4
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "required"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b5

    if-eqz v2, :cond_b5

    .line 411
    const/4 v3, 0x1

    goto/16 :goto_3

    .line 413
    :cond_b5
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "features"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 414
    const/4 v0, 0x1

    goto/16 :goto_3

    .line 422
    .end local v1    # "eventType":I
    :cond_c4
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->isSecureConnection()Z

    move-result v4

    if-nez v4, :cond_eb

    .line 423
    if-nez v2, :cond_eb

    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->getConfiguration()Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getSecurityMode()Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    move-result-object v4

    sget-object v5, Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;->required:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    if-ne v4, v5, :cond_eb

    .line 426
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    const-string v5, "Server does not support security (TLS), but security required by connection configuration."

    new-instance v6, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v7, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->forbidden:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;)V

    invoke-direct {v4, v5, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v4

    .line 433
    :cond_eb
    if-eqz v2, :cond_fb

    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->getConfiguration()Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getSecurityMode()Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    move-result-object v4

    sget-object v5, Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;->disabled:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    if-ne v4, v5, :cond_fe

    .line 436
    :cond_fb
    invoke-direct {p0}, Lorg/jivesoftware/smack/PacketReader;->releaseConnectionIDLock()V

    .line 438
    :cond_fe
    return-void
.end method

.method private parsePackets(Ljava/lang/Thread;)V
    .registers 12
    .param p1, "thread"    # Ljava/lang/Thread;

    .prologue
    .line 222
    :try_start_0
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v2

    .line 224
    .local v2, "eventType":I
    :cond_6
    const/4 v6, 0x2

    if-ne v2, v6, :cond_1e0

    .line 225
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "message"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_32

    .line 226
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-static {v6}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseMessage(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v6

    invoke-direct {p0, v6}, Lorg/jivesoftware/smack/PacketReader;->processPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 325
    :cond_20
    :goto_20
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 326
    iget-boolean v6, p0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    if-nez v6, :cond_31

    const/4 v6, 0x1

    if-eq v2, v6, :cond_31

    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->readerThread:Ljava/lang/Thread;

    if-eq p1, v6, :cond_6

    .line 335
    .end local v2    # "eventType":I
    :cond_31
    :goto_31
    return-void

    .line 228
    .restart local v2    # "eventType":I
    :cond_32
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "iq"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_55

    .line 229
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-static {v6, v7}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseIQ(Lorg/xmlpull/v1/XmlPullParser;Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v6

    invoke-direct {p0, v6}, Lorg/jivesoftware/smack/PacketReader;->processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4b} :catch_4c

    goto :goto_20

    .line 328
    .end local v2    # "eventType":I
    :catch_4c
    move-exception v1

    .line 329
    .local v1, "e":Ljava/lang/Exception;
    iget-boolean v6, p0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    if-nez v6, :cond_31

    .line 332
    invoke-virtual {p0, v1}, Lorg/jivesoftware/smack/PacketReader;->notifyConnectionError(Ljava/lang/Exception;)V

    goto :goto_31

    .line 231
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "eventType":I
    :cond_55
    :try_start_55
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "presence"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6d

    .line 232
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-static {v6}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePresence(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Presence;

    move-result-object v6

    invoke-direct {p0, v6}, Lorg/jivesoftware/smack/PacketReader;->processPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_20

    .line 236
    :cond_6d
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "stream"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_dd

    .line 238
    const-string v6, "jabber:client"

    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const/4 v8, 0x0

    invoke-interface {v7, v8}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_20

    .line 240
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_8b
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v6

    if-ge v4, v6, :cond_20

    .line 241
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v6, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v6

    const-string v7, "id"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_c1

    .line 243
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v6, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->connectionID:Ljava/lang/String;

    .line 244
    const-string v6, "1.0"

    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v8, ""

    const-string v9, "version"

    invoke-interface {v7, v8, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_be

    .line 249
    invoke-direct {p0}, Lorg/jivesoftware/smack/PacketReader;->releaseConnectionIDLock()V

    .line 240
    :cond_be
    :goto_be
    add-int/lit8 v4, v4, 0x1

    goto :goto_8b

    .line 252
    :cond_c1
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v6, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v6

    const-string v7, "from"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_be

    .line 254
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v6, v6, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v7, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setServiceName(Ljava/lang/String;)V

    goto :goto_be

    .line 259
    .end local v4    # "i":I
    :cond_dd
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "error"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_f7

    .line 260
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-static {v7}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseStreamError(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/StreamError;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/StreamError;)V

    throw v6

    .line 262
    :cond_f7
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "features"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_10c

    .line 263
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-direct {p0, v6}, Lorg/jivesoftware/smack/PacketReader;->parseFeatures(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_20

    .line 265
    :cond_10c
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "proceed"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_124

    .line 267
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v6}, Lorg/jivesoftware/smack/XMPPConnection;->proceedTLSReceived()V

    .line 270
    invoke-direct {p0}, Lorg/jivesoftware/smack/PacketReader;->resetParser()V

    goto/16 :goto_20

    .line 272
    :cond_124
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "failure"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_170

    .line 273
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const/4 v7, 0x0

    invoke-interface {v6, v7}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 274
    .local v5, "namespace":Ljava/lang/String;
    const-string v6, "urn:ietf:params:xml:ns:xmpp-tls"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_149

    .line 276
    new-instance v6, Ljava/lang/Exception;

    const-string v7, "TLS negotiation has failed"

    invoke-direct {v6, v7}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v6

    .line 278
    :cond_149
    const-string v6, "http://jabber.org/protocol/compress"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_158

    .line 282
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v6}, Lorg/jivesoftware/smack/XMPPConnection;->streamCompressionDenied()V

    goto/16 :goto_20

    .line 287
    :cond_158
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-static {v6}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseSASLFailure(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/sasl/SASLMechanism$Failure;

    move-result-object v3

    .line 288
    .local v3, "failure":Lorg/jivesoftware/smack/sasl/SASLMechanism$Failure;
    invoke-direct {p0, v3}, Lorg/jivesoftware/smack/PacketReader;->processPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 289
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v6}, Lorg/jivesoftware/smack/XMPPConnection;->getSASLAuthentication()Lorg/jivesoftware/smack/SASLAuthentication;

    move-result-object v6

    invoke-virtual {v3}, Lorg/jivesoftware/smack/sasl/SASLMechanism$Failure;->getCondition()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smack/SASLAuthentication;->authenticationFailed(Ljava/lang/String;)V

    goto/16 :goto_20

    .line 292
    .end local v3    # "failure":Lorg/jivesoftware/smack/sasl/SASLMechanism$Failure;
    .end local v5    # "namespace":Ljava/lang/String;
    :cond_170
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "challenge"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_197

    .line 294
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v0

    .line 295
    .local v0, "challengeData":Ljava/lang/String;
    new-instance v6, Lorg/jivesoftware/smack/sasl/SASLMechanism$Challenge;

    invoke-direct {v6, v0}, Lorg/jivesoftware/smack/sasl/SASLMechanism$Challenge;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v6}, Lorg/jivesoftware/smack/PacketReader;->processPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 296
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v6}, Lorg/jivesoftware/smack/XMPPConnection;->getSASLAuthentication()Lorg/jivesoftware/smack/SASLAuthentication;

    move-result-object v6

    invoke-virtual {v6, v0}, Lorg/jivesoftware/smack/SASLAuthentication;->challengeReceived(Ljava/lang/String;)V

    goto/16 :goto_20

    .line 298
    .end local v0    # "challengeData":Ljava/lang/String;
    :cond_197
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "success"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1c8

    .line 299
    new-instance v6, Lorg/jivesoftware/smack/sasl/SASLMechanism$Success;

    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/sasl/SASLMechanism$Success;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v6}, Lorg/jivesoftware/smack/PacketReader;->processPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 302
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v6, v6, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v6}, Lorg/jivesoftware/smack/PacketWriter;->openStream()V

    .line 305
    invoke-direct {p0}, Lorg/jivesoftware/smack/PacketReader;->resetParser()V

    .line 308
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v6}, Lorg/jivesoftware/smack/XMPPConnection;->getSASLAuthentication()Lorg/jivesoftware/smack/SASLAuthentication;

    move-result-object v6

    invoke-virtual {v6}, Lorg/jivesoftware/smack/SASLAuthentication;->authenticated()V

    goto/16 :goto_20

    .line 310
    :cond_1c8
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "compressed"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_20

    .line 313
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v6}, Lorg/jivesoftware/smack/XMPPConnection;->startStreamCompression()V

    .line 316
    invoke-direct {p0}, Lorg/jivesoftware/smack/PacketReader;->resetParser()V

    goto/16 :goto_20

    .line 319
    :cond_1e0
    const/4 v6, 0x3

    if-ne v2, v6, :cond_20

    .line 320
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "stream"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_20

    .line 322
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v6}, Lorg/jivesoftware/smack/XMPPConnection;->disconnect()V
    :try_end_1f6
    .catch Ljava/lang/Exception; {:try_start_55 .. :try_end_1f6} :catch_4c

    goto/16 :goto_20
.end method

.method private processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .registers 6
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 358
    if-nez p1, :cond_3

    .line 369
    :goto_2
    return-void

    .line 363
    :cond_3
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/XMPPConnection;->getPacketCollectors()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/PacketCollector;

    .line 364
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/PacketCollector;->processPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_d

    .line 368
    .end local v0    # "collector":Lorg/jivesoftware/smack/PacketCollector;
    :cond_1d
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketReader;->listenerExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v3, Lorg/jivesoftware/smack/PacketReader$ListenerNotification;

    invoke-direct {v3, p0, p1}, Lorg/jivesoftware/smack/PacketReader$ListenerNotification;-><init>(Lorg/jivesoftware/smack/PacketReader;Lorg/jivesoftware/smack/packet/Packet;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    goto :goto_2
.end method

.method private releaseConnectionIDLock()V
    .registers 2

    .prologue
    .line 347
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->connectionSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 348
    return-void
.end method

.method private resetParser()V
    .registers 5

    .prologue
    .line 206
    :try_start_0
    new-instance v1, Lorg/xmlpull/mxp1/MXParser;

    invoke-direct {v1}, Lorg/xmlpull/mxp1/MXParser;-><init>()V

    iput-object v1, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    .line 207
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V

    .line 208
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    iget-object v2, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v2, v2, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/Reader;

    invoke-interface {v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V
    :try_end_18
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_18} :catch_19

    .line 213
    :goto_18
    return-void

    .line 210
    :catch_19
    move-exception v0

    .line 211
    .local v0, "xppe":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto :goto_18
.end method


# virtual methods
.method cleanup()V
    .registers 2

    .prologue
    .line 153
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->recvListeners:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 154
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->collectors:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 155
    return-void
.end method

.method protected init()V
    .registers 4

    .prologue
    .line 65
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->connectionID:Ljava/lang/String;

    .line 68
    new-instance v0, Lorg/jivesoftware/smack/PacketReader$1;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/PacketReader$1;-><init>(Lorg/jivesoftware/smack/PacketReader;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->readerThread:Ljava/lang/Thread;

    .line 73
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->readerThread:Ljava/lang/Thread;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Smack Packet Reader ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget v2, v2, Lorg/jivesoftware/smack/XMPPConnection;->connectionCounterValue:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 74
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->readerThread:Ljava/lang/Thread;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 78
    new-instance v0, Lorg/jivesoftware/smack/PacketReader$2;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/PacketReader$2;-><init>(Lorg/jivesoftware/smack/PacketReader;)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->listenerExecutor:Ljava/util/concurrent/ExecutorService;

    .line 88
    invoke-direct {p0}, Lorg/jivesoftware/smack/PacketReader;->resetParser()V

    .line 89
    return-void
.end method

.method notifyConnectionError(Ljava/lang/Exception;)V
    .registers 8
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 164
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    .line 166
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    new-instance v4, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v5, Lorg/jivesoftware/smack/packet/Presence$Type;->unavailable:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/XMPPConnection;->shutdown(Lorg/jivesoftware/smack/packet/Presence;)V

    .line 168
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 170
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/XMPPConnection;->getConnectionListeners()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_31

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/ConnectionListener;

    .line 172
    .local v2, "listener":Lorg/jivesoftware/smack/ConnectionListener;
    :try_start_28
    invoke-interface {v2, p1}, Lorg/jivesoftware/smack/ConnectionListener;->connectionClosedOnError(Ljava/lang/Exception;)V
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_2b} :catch_2c

    goto :goto_1c

    .line 174
    :catch_2c
    move-exception v0

    .line 177
    .local v0, "e2":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1c

    .line 180
    .end local v0    # "e2":Ljava/lang/Exception;
    .end local v2    # "listener":Lorg/jivesoftware/smack/ConnectionListener;
    :cond_31
    return-void
.end method

.method protected notifyReconnection()V
    .registers 5

    .prologue
    .line 187
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/XMPPConnection;->getConnectionListeners()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/ConnectionListener;

    .line 189
    .local v2, "listener":Lorg/jivesoftware/smack/ConnectionListener;
    :try_start_16
    invoke-interface {v2}, Lorg/jivesoftware/smack/ConnectionListener;->reconnectionSuccessful()V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_19} :catch_1a

    goto :goto_a

    .line 191
    :catch_1a
    move-exception v0

    .line 194
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_a

    .line 197
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "listener":Lorg/jivesoftware/smack/ConnectionListener;
    :cond_1f
    return-void
.end method

.method public shutdown()V
    .registers 5

    .prologue
    .line 131
    iget-boolean v3, p0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    if-nez v3, :cond_23

    .line 132
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/XMPPConnection;->getConnectionListeners()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_23

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/ConnectionListener;

    .line 134
    .local v2, "listener":Lorg/jivesoftware/smack/ConnectionListener;
    :try_start_1a
    invoke-interface {v2}, Lorg/jivesoftware/smack/ConnectionListener;->connectionClosed()V
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1d} :catch_1e

    goto :goto_e

    .line 136
    :catch_1e
    move-exception v0

    .line 139
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_e

    .line 143
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "listener":Lorg/jivesoftware/smack/ConnectionListener;
    :cond_23
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    .line 146
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketReader;->listenerExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v3}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 147
    return-void
.end method

.method public startup()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 100
    new-instance v1, Ljava/util/concurrent/Semaphore;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v1, p0, Lorg/jivesoftware/smack/PacketReader;->connectionSemaphore:Ljava/util/concurrent/Semaphore;

    .line 102
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketReader;->readerThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 106
    :try_start_d
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketReader;->connectionSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 112
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v0

    .line 113
    .local v0, "waitTime":I
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketReader;->connectionSemaphore:Ljava/util/concurrent/Semaphore;

    mul-int/lit8 v2, v0, 0x3

    int-to-long v2, v2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_20
    .catch Ljava/lang/InterruptedException; {:try_start_d .. :try_end_20} :catch_33

    .line 118
    .end local v0    # "waitTime":I
    :goto_20
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketReader;->connectionID:Ljava/lang/String;

    if-nez v1, :cond_2c

    .line 119
    new-instance v1, Lorg/jivesoftware/smack/XMPPException;

    const-string v2, "Connection failed. No response from server."

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 122
    :cond_2c
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v2, p0, Lorg/jivesoftware/smack/PacketReader;->connectionID:Ljava/lang/String;

    iput-object v2, v1, Lorg/jivesoftware/smack/XMPPConnection;->connectionID:Ljava/lang/String;

    .line 124
    return-void

    .line 115
    :catch_33
    move-exception v1

    goto :goto_20
.end method
