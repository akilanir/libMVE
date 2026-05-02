.class public Lorg/jivesoftware/smack/SASLAuthentication;
.super Ljava/lang/Object;
.source "SASLAuthentication.java"

# interfaces
.implements Lorg/jivesoftware/smack/UserAuthentication;


# static fields
.field private static implementedMechanisms:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field

.field private static mechanismsPreferences:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;

.field private currentMechanism:Lorg/jivesoftware/smack/sasl/SASLMechanism;

.field private errorCondition:Ljava/lang/String;

.field private resourceBinded:Z

.field private saslFailed:Z

.field private saslNegotiated:Z

.field private serverMechanisms:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private sessionSupported:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 66
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/jivesoftware/smack/SASLAuthentication;->implementedMechanisms:Ljava/util/Map;

    .line 67
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lorg/jivesoftware/smack/SASLAuthentication;->mechanismsPreferences:Ljava/util/List;

    .line 91
    const-string v0, "EXTERNAL"

    const-class v1, Lorg/jivesoftware/smack/sasl/SASLExternalMechanism;

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->registerSASLMechanism(Ljava/lang/String;Ljava/lang/Class;)V

    .line 92
    const-string v0, "GSSAPI"

    const-class v1, Lorg/jivesoftware/smack/sasl/SASLGSSAPIMechanism;

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->registerSASLMechanism(Ljava/lang/String;Ljava/lang/Class;)V

    .line 93
    const-string v0, "DIGEST-MD5"

    const-class v1, Lorg/jivesoftware/smack/sasl/SASLDigestMD5Mechanism;

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->registerSASLMechanism(Ljava/lang/String;Ljava/lang/Class;)V

    .line 94
    const-string v0, "CRAM-MD5"

    const-class v1, Lorg/jivesoftware/smack/sasl/SASLCramMD5Mechanism;

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->registerSASLMechanism(Ljava/lang/String;Ljava/lang/Class;)V

    .line 95
    const-string v0, "PLAIN"

    const-class v1, Lorg/jivesoftware/smack/sasl/SASLPlainMechanism;

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->registerSASLMechanism(Ljava/lang/String;Ljava/lang/Class;)V

    .line 96
    const-string v0, "ANONYMOUS"

    const-class v1, Lorg/jivesoftware/smack/sasl/SASLAnonymous;

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->registerSASLMechanism(Ljava/lang/String;Ljava/lang/Class;)V

    .line 98
    const-string v0, "GSSAPI"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->supportSASLMechanism(Ljava/lang/String;I)V

    .line 99
    const-string v0, "DIGEST-MD5"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->supportSASLMechanism(Ljava/lang/String;I)V

    .line 100
    const-string v0, "CRAM-MD5"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->supportSASLMechanism(Ljava/lang/String;I)V

    .line 101
    const-string v0, "PLAIN"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->supportSASLMechanism(Ljava/lang/String;I)V

    .line 102
    const-string v0, "ANONYMOUS"

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->supportSASLMechanism(Ljava/lang/String;I)V

    .line 104
    return-void
.end method

.method constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .registers 3
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->serverMechanisms:Ljava/util/Collection;

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->currentMechanism:Lorg/jivesoftware/smack/sasl/SASLMechanism;

    .line 180
    iput-object p1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    .line 181
    invoke-virtual {p0}, Lorg/jivesoftware/smack/SASLAuthentication;->init()V

    .line 182
    return-void
.end method

.method private bindResourceAndEstablishSession(Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p1, "resource"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 425
    monitor-enter p0

    .line 426
    :try_start_1
    iget-boolean v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->resourceBinded:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_17

    if-nez v6, :cond_a

    .line 428
    const-wide/16 v6, 0x7530

    :try_start_7
    invoke-virtual {p0, v6, v7}, Ljava/lang/Object;->wait(J)V
    :try_end_a
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_a} :catch_b3
    .catchall {:try_start_7 .. :try_end_a} :catchall_17

    .line 434
    :cond_a
    :goto_a
    :try_start_a
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_a .. :try_end_b} :catchall_17

    .line 436
    iget-boolean v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->resourceBinded:Z

    if-nez v6, :cond_1a

    .line 438
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    const-string v7, "Resource binding not offered by server"

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 434
    :catchall_17
    move-exception v6

    :try_start_18
    monitor-exit p0
    :try_end_19
    .catchall {:try_start_18 .. :try_end_19} :catchall_17

    throw v6

    .line 441
    :cond_1a
    new-instance v1, Lorg/jivesoftware/smack/packet/Bind;

    invoke-direct {v1}, Lorg/jivesoftware/smack/packet/Bind;-><init>()V

    .line 442
    .local v1, "bindResource":Lorg/jivesoftware/smack/packet/Bind;
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smack/packet/Bind;->setResource(Ljava/lang/String;)V

    .line 444
    iget-object v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v7, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Bind;->getPacketID()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v2

    .line 447
    .local v2, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v6, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 449
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v6

    int-to-long v6, v6

    invoke-virtual {v2, v6, v7}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/packet/Bind;

    .line 450
    .local v3, "response":Lorg/jivesoftware/smack/packet/Bind;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 451
    if-nez v3, :cond_4e

    .line 452
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    const-string v7, "No response from the server."

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 455
    :cond_4e
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Bind;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v6

    sget-object v7, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v6, v7, :cond_60

    .line 456
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Bind;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v6

    .line 458
    :cond_60
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Bind;->getJid()Ljava/lang/String;

    move-result-object v5

    .line 460
    .local v5, "userJID":Ljava/lang/String;
    iget-boolean v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->sessionSupported:Z

    if-eqz v6, :cond_ab

    .line 461
    new-instance v4, Lorg/jivesoftware/smack/packet/Session;

    invoke-direct {v4}, Lorg/jivesoftware/smack/packet/Session;-><init>()V

    .line 462
    .local v4, "session":Lorg/jivesoftware/smack/packet/Session;
    iget-object v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v7, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/Session;->getPacketID()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v2

    .line 464
    iget-object v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v6, v4}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 466
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v6

    int-to-long v6, v6

    invoke-virtual {v2, v6, v7}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/IQ;

    .line 467
    .local v0, "ack":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 468
    if-nez v0, :cond_99

    .line 469
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    const-string v7, "No response from the server."

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 472
    :cond_99
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v6

    sget-object v7, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v6, v7, :cond_b6

    .line 473
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v6

    .line 478
    .end local v0    # "ack":Lorg/jivesoftware/smack/packet/IQ;
    .end local v4    # "session":Lorg/jivesoftware/smack/packet/Session;
    :cond_ab
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    const-string v7, "Session establishment not offered by server"

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 430
    .end local v1    # "bindResource":Lorg/jivesoftware/smack/packet/Bind;
    .end local v2    # "collector":Lorg/jivesoftware/smack/PacketCollector;
    .end local v3    # "response":Lorg/jivesoftware/smack/packet/Bind;
    .end local v5    # "userJID":Ljava/lang/String;
    :catch_b3
    move-exception v6

    goto/16 :goto_a

    .line 480
    .restart local v0    # "ack":Lorg/jivesoftware/smack/packet/IQ;
    .restart local v1    # "bindResource":Lorg/jivesoftware/smack/packet/Bind;
    .restart local v2    # "collector":Lorg/jivesoftware/smack/PacketCollector;
    .restart local v3    # "response":Lorg/jivesoftware/smack/packet/Bind;
    .restart local v4    # "session":Lorg/jivesoftware/smack/packet/Session;
    .restart local v5    # "userJID":Ljava/lang/String;
    :cond_b6
    return-object v5
.end method

.method public static getRegisterSASLMechanisms()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation

    .prologue
    .line 171
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 172
    .local v0, "answer":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class;>;"
    sget-object v3, Lorg/jivesoftware/smack/SASLAuthentication;->mechanismsPreferences:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_21

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 173
    .local v2, "mechanismsPreference":Ljava/lang/String;
    sget-object v3, Lorg/jivesoftware/smack/SASLAuthentication;->implementedMechanisms:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 175
    .end local v2    # "mechanismsPreference":Ljava/lang/String;
    :cond_21
    return-object v0
.end method

.method public static registerSASLMechanism(Ljava/lang/String;Ljava/lang/Class;)V
    .registers 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "mClass"    # Ljava/lang/Class;

    .prologue
    .line 113
    sget-object v0, Lorg/jivesoftware/smack/SASLAuthentication;->implementedMechanisms:Ljava/util/Map;

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    return-void
.end method

.method public static supportSASLMechanism(Ljava/lang/String;)V
    .registers 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 137
    sget-object v0, Lorg/jivesoftware/smack/SASLAuthentication;->mechanismsPreferences:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 138
    return-void
.end method

.method public static supportSASLMechanism(Ljava/lang/String;I)V
    .registers 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "index"    # I

    .prologue
    .line 151
    sget-object v0, Lorg/jivesoftware/smack/SASLAuthentication;->mechanismsPreferences:Ljava/util/List;

    invoke-interface {v0, p1, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 152
    return-void
.end method

.method public static unregisterSASLMechanism(Ljava/lang/String;)V
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 124
    sget-object v0, Lorg/jivesoftware/smack/SASLAuthentication;->implementedMechanisms:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    sget-object v0, Lorg/jivesoftware/smack/SASLAuthentication;->mechanismsPreferences:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 126
    return-void
.end method

.method public static unsupportSASLMechanism(Ljava/lang/String;)V
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 162
    sget-object v0, Lorg/jivesoftware/smack/SASLAuthentication;->mechanismsPreferences:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 163
    return-void
.end method


# virtual methods
.method public authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 13
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "resource"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 301
    const/4 v5, 0x0

    .line 302
    .local v5, "selectedMechanism":Ljava/lang/String;
    sget-object v6, Lorg/jivesoftware/smack/SASLAuthentication;->mechanismsPreferences:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_24

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 303
    .local v3, "mechanism":Ljava/lang/String;
    sget-object v6, Lorg/jivesoftware/smack/SASLAuthentication;->implementedMechanisms:Ljava/util/Map;

    invoke-interface {v6, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    iget-object v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->serverMechanisms:Ljava/util/Collection;

    invoke-interface {v6, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 305
    move-object v5, v3

    .line 309
    .end local v3    # "mechanism":Ljava/lang/String;
    :cond_24
    if-eqz v5, :cond_d2

    .line 313
    :try_start_26
    sget-object v6, Lorg/jivesoftware/smack/SASLAuthentication;->implementedMechanisms:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    .line 314
    .local v4, "mechanismClass":Ljava/lang/Class;
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Lorg/jivesoftware/smack/SASLAuthentication;

    aput-object v8, v6, v7

    invoke-virtual {v4, v6}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 315
    .local v0, "constructor":Ljava/lang/reflect/Constructor;
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p0, v6, v7

    invoke-virtual {v0, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jivesoftware/smack/sasl/SASLMechanism;

    iput-object v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->currentMechanism:Lorg/jivesoftware/smack/sasl/SASLMechanism;

    .line 319
    iget-object v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->currentMechanism:Lorg/jivesoftware/smack/sasl/SASLMechanism;

    iget-object v7, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, p1, v7, p2}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 322
    monitor-enter p0
    :try_end_54
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_26 .. :try_end_54} :catch_8f
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_54} :catch_94

    .line 323
    :try_start_54
    iget-boolean v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslNegotiated:Z

    if-nez v6, :cond_61

    iget-boolean v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslFailed:Z
    :try_end_5a
    .catchall {:try_start_54 .. :try_end_5a} :catchall_91

    if-nez v6, :cond_61

    .line 325
    const-wide/16 v6, 0x7530

    :try_start_5e
    invoke-virtual {p0, v6, v7}, Ljava/lang/Object;->wait(J)V
    :try_end_61
    .catch Ljava/lang/InterruptedException; {:try_start_5e .. :try_end_61} :catch_de
    .catchall {:try_start_5e .. :try_end_61} :catchall_91

    .line 331
    :cond_61
    :goto_61
    :try_start_61
    monitor-exit p0
    :try_end_62
    .catchall {:try_start_61 .. :try_end_62} :catchall_91

    .line 333
    :try_start_62
    iget-boolean v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslFailed:Z

    if-eqz v6, :cond_bd

    .line 336
    iget-object v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->errorCondition:Ljava/lang/String;

    if-eqz v6, :cond_a4

    .line 337
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "SASL authentication "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " failed: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lorg/jivesoftware/smack/SASLAuthentication;->errorCondition:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_8f
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_62 .. :try_end_8f} :catch_8f
    .catch Ljava/lang/Exception; {:try_start_62 .. :try_end_8f} :catch_94

    .line 356
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;
    .end local v4    # "mechanismClass":Ljava/lang/Class;
    :catch_8f
    move-exception v1

    .line 357
    .local v1, "e":Lorg/jivesoftware/smack/XMPPException;
    throw v1

    .line 331
    .end local v1    # "e":Lorg/jivesoftware/smack/XMPPException;
    .restart local v0    # "constructor":Ljava/lang/reflect/Constructor;
    .restart local v4    # "mechanismClass":Ljava/lang/Class;
    :catchall_91
    move-exception v6

    :try_start_92
    monitor-exit p0
    :try_end_93
    .catchall {:try_start_92 .. :try_end_93} :catchall_91

    :try_start_93
    throw v6
    :try_end_94
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_93 .. :try_end_94} :catch_8f
    .catch Ljava/lang/Exception; {:try_start_93 .. :try_end_94} :catch_94

    .line 359
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;
    .end local v4    # "mechanismClass":Ljava/lang/Class;
    :catch_94
    move-exception v1

    .line 360
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 362
    new-instance v6, Lorg/jivesoftware/smack/NonSASLAuthentication;

    iget-object v7, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/NonSASLAuthentication;-><init>(Lorg/jivesoftware/smack/Connection;)V

    invoke-virtual {v6, p1, p2, p3}, Lorg/jivesoftware/smack/NonSASLAuthentication;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 368
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_a3
    return-object v6

    .line 341
    .restart local v0    # "constructor":Ljava/lang/reflect/Constructor;
    .restart local v4    # "mechanismClass":Ljava/lang/Class;
    :cond_a4
    :try_start_a4
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "SASL authentication failed using mechanism "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 346
    :cond_bd
    iget-boolean v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslNegotiated:Z

    if-eqz v6, :cond_c6

    .line 348
    invoke-direct {p0, p3}, Lorg/jivesoftware/smack/SASLAuthentication;->bindResourceAndEstablishSession(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_a3

    .line 352
    :cond_c6
    new-instance v6, Lorg/jivesoftware/smack/NonSASLAuthentication;

    iget-object v7, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/NonSASLAuthentication;-><init>(Lorg/jivesoftware/smack/Connection;)V

    invoke-virtual {v6, p1, p2, p3}, Lorg/jivesoftware/smack/NonSASLAuthentication;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_d0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_a4 .. :try_end_d0} :catch_8f
    .catch Ljava/lang/Exception; {:try_start_a4 .. :try_end_d0} :catch_94

    move-result-object v6

    goto :goto_a3

    .line 368
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;
    .end local v4    # "mechanismClass":Ljava/lang/Class;
    :cond_d2
    new-instance v6, Lorg/jivesoftware/smack/NonSASLAuthentication;

    iget-object v7, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/NonSASLAuthentication;-><init>(Lorg/jivesoftware/smack/Connection;)V

    invoke-virtual {v6, p1, p2, p3}, Lorg/jivesoftware/smack/NonSASLAuthentication;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_a3

    .line 327
    .restart local v0    # "constructor":Ljava/lang/reflect/Constructor;
    .restart local v4    # "mechanismClass":Ljava/lang/Class;
    :catch_de
    move-exception v6

    goto :goto_61
.end method

.method public authenticate(Ljava/lang/String;Ljava/lang/String;Ljavax/security/auth/callback/CallbackHandler;)Ljava/lang/String;
    .registers 13
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "resource"    # Ljava/lang/String;
    .param p3, "cbh"    # Ljavax/security/auth/callback/CallbackHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 219
    const/4 v5, 0x0

    .line 220
    .local v5, "selectedMechanism":Ljava/lang/String;
    sget-object v6, Lorg/jivesoftware/smack/SASLAuthentication;->mechanismsPreferences:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_24

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 221
    .local v3, "mechanism":Ljava/lang/String;
    sget-object v6, Lorg/jivesoftware/smack/SASLAuthentication;->implementedMechanisms:Ljava/util/Map;

    invoke-interface {v6, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    iget-object v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->serverMechanisms:Ljava/util/Collection;

    invoke-interface {v6, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 223
    move-object v5, v3

    .line 227
    .end local v3    # "mechanism":Ljava/lang/String;
    :cond_24
    if-eqz v5, :cond_c2

    .line 231
    :try_start_26
    sget-object v6, Lorg/jivesoftware/smack/SASLAuthentication;->implementedMechanisms:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    .line 232
    .local v4, "mechanismClass":Ljava/lang/Class;
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Lorg/jivesoftware/smack/SASLAuthentication;

    aput-object v8, v6, v7

    invoke-virtual {v4, v6}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 233
    .local v0, "constructor":Ljava/lang/reflect/Constructor;
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p0, v6, v7

    invoke-virtual {v0, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jivesoftware/smack/sasl/SASLMechanism;

    iput-object v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->currentMechanism:Lorg/jivesoftware/smack/sasl/SASLMechanism;

    .line 237
    iget-object v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->currentMechanism:Lorg/jivesoftware/smack/sasl/SASLMechanism;

    iget-object v7, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7}, Lorg/jivesoftware/smack/Connection;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, p1, v7, p3}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljavax/security/auth/callback/CallbackHandler;)V

    .line 240
    monitor-enter p0
    :try_end_54
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_26 .. :try_end_54} :catch_8f
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_54} :catch_94

    .line 241
    :try_start_54
    iget-boolean v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslNegotiated:Z

    if-nez v6, :cond_61

    iget-boolean v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslFailed:Z
    :try_end_5a
    .catchall {:try_start_54 .. :try_end_5a} :catchall_91

    if-nez v6, :cond_61

    .line 243
    const-wide/16 v6, 0x7530

    :try_start_5e
    invoke-virtual {p0, v6, v7}, Ljava/lang/Object;->wait(J)V
    :try_end_61
    .catch Ljava/lang/InterruptedException; {:try_start_5e .. :try_end_61} :catch_ca
    .catchall {:try_start_5e .. :try_end_61} :catchall_91

    .line 249
    :cond_61
    :goto_61
    :try_start_61
    monitor-exit p0
    :try_end_62
    .catchall {:try_start_61 .. :try_end_62} :catchall_91

    .line 251
    :try_start_62
    iget-boolean v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslFailed:Z

    if-eqz v6, :cond_b9

    .line 254
    iget-object v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->errorCondition:Ljava/lang/String;

    if-eqz v6, :cond_a0

    .line 255
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "SASL authentication "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " failed: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lorg/jivesoftware/smack/SASLAuthentication;->errorCondition:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_8f
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_62 .. :try_end_8f} :catch_8f
    .catch Ljava/lang/Exception; {:try_start_62 .. :try_end_8f} :catch_94

    .line 271
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;
    .end local v4    # "mechanismClass":Ljava/lang/Class;
    :catch_8f
    move-exception v1

    .line 272
    .local v1, "e":Lorg/jivesoftware/smack/XMPPException;
    throw v1

    .line 249
    .end local v1    # "e":Lorg/jivesoftware/smack/XMPPException;
    .restart local v0    # "constructor":Ljava/lang/reflect/Constructor;
    .restart local v4    # "mechanismClass":Ljava/lang/Class;
    :catchall_91
    move-exception v6

    :try_start_92
    monitor-exit p0
    :try_end_93
    .catchall {:try_start_92 .. :try_end_93} :catchall_91

    :try_start_93
    throw v6
    :try_end_94
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_93 .. :try_end_94} :catch_8f
    .catch Ljava/lang/Exception; {:try_start_93 .. :try_end_94} :catch_94

    .line 274
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;
    .end local v4    # "mechanismClass":Ljava/lang/Class;
    :catch_94
    move-exception v1

    .line 275
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 281
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_98
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    const-string v7, "SASL authentication failed"

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 259
    .restart local v0    # "constructor":Ljava/lang/reflect/Constructor;
    .restart local v4    # "mechanismClass":Ljava/lang/Class;
    :cond_a0
    :try_start_a0
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "SASL authentication failed using mechanism "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 264
    :cond_b9
    iget-boolean v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslNegotiated:Z

    if-eqz v6, :cond_98

    .line 266
    invoke-direct {p0, p2}, Lorg/jivesoftware/smack/SASLAuthentication;->bindResourceAndEstablishSession(Ljava/lang/String;)Ljava/lang/String;
    :try_end_c0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_a0 .. :try_end_c0} :catch_8f
    .catch Ljava/lang/Exception; {:try_start_a0 .. :try_end_c0} :catch_94

    move-result-object v6

    return-object v6

    .line 279
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;
    .end local v4    # "mechanismClass":Ljava/lang/Class;
    :cond_c2
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    const-string v7, "SASL Authentication failed. No known authentication mechanisims."

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 245
    .restart local v0    # "constructor":Ljava/lang/reflect/Constructor;
    .restart local v4    # "mechanismClass":Ljava/lang/Class;
    :catch_ca
    move-exception v6

    goto :goto_61
.end method

.method public authenticateAnonymously()Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 385
    :try_start_0
    new-instance v1, Lorg/jivesoftware/smack/sasl/SASLAnonymous;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smack/sasl/SASLAnonymous;-><init>(Lorg/jivesoftware/smack/SASLAuthentication;)V

    iput-object v1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->currentMechanism:Lorg/jivesoftware/smack/sasl/SASLMechanism;

    .line 386
    iget-object v1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->currentMechanism:Lorg/jivesoftware/smack/sasl/SASLMechanism;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const-string v4, ""

    invoke-virtual {v1, v2, v3, v4}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 389
    monitor-enter p0
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_11} :catch_42

    .line 390
    :try_start_11
    iget-boolean v1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslNegotiated:Z

    if-nez v1, :cond_1e

    iget-boolean v1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslFailed:Z
    :try_end_17
    .catchall {:try_start_11 .. :try_end_17} :catchall_4f

    if-nez v1, :cond_1e

    .line 392
    const-wide/16 v1, 0x1388

    :try_start_1b
    invoke-virtual {p0, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_1e
    .catch Ljava/lang/InterruptedException; {:try_start_1b .. :try_end_1e} :catch_70
    .catchall {:try_start_1b .. :try_end_1e} :catchall_4f

    .line 398
    :cond_1e
    :goto_1e
    :try_start_1e
    monitor-exit p0
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_4f

    .line 400
    :try_start_1f
    iget-boolean v1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslFailed:Z

    if-eqz v1, :cond_5a

    .line 403
    iget-object v1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->errorCondition:Ljava/lang/String;

    if-eqz v1, :cond_52

    .line 404
    new-instance v1, Lorg/jivesoftware/smack/XMPPException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SASL authentication failed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smack/SASLAuthentication;->errorCondition:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_42
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_42} :catch_42

    .line 418
    :catch_42
    move-exception v0

    .line 419
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/jivesoftware/smack/NonSASLAuthentication;

    iget-object v2, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/NonSASLAuthentication;-><init>(Lorg/jivesoftware/smack/Connection;)V

    invoke-virtual {v1}, Lorg/jivesoftware/smack/NonSASLAuthentication;->authenticateAnonymously()Ljava/lang/String;

    move-result-object v1

    .end local v0    # "e":Ljava/io/IOException;
    :goto_4e
    return-object v1

    .line 398
    :catchall_4f
    move-exception v1

    :try_start_50
    monitor-exit p0
    :try_end_51
    .catchall {:try_start_50 .. :try_end_51} :catchall_4f

    :try_start_51
    throw v1

    .line 407
    :cond_52
    new-instance v1, Lorg/jivesoftware/smack/XMPPException;

    const-string v2, "SASL authentication failed"

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 411
    :cond_5a
    iget-boolean v1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslNegotiated:Z

    if-eqz v1, :cond_64

    .line 413
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->bindResourceAndEstablishSession(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_4e

    .line 416
    :cond_64
    new-instance v1, Lorg/jivesoftware/smack/NonSASLAuthentication;

    iget-object v2, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/NonSASLAuthentication;-><init>(Lorg/jivesoftware/smack/Connection;)V

    invoke-virtual {v1}, Lorg/jivesoftware/smack/NonSASLAuthentication;->authenticateAnonymously()Ljava/lang/String;
    :try_end_6e
    .catch Ljava/io/IOException; {:try_start_51 .. :try_end_6e} :catch_42

    move-result-object v1

    goto :goto_4e

    .line 394
    :catch_70
    move-exception v1

    goto :goto_1e
.end method

.method authenticated()V
    .registers 2

    .prologue
    .line 522
    monitor-enter p0

    .line 523
    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslNegotiated:Z

    .line 525
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 526
    monitor-exit p0

    .line 527
    return-void

    .line 526
    :catchall_9
    move-exception v0

    monitor-exit p0
    :try_end_b
    .catchall {:try_start_2 .. :try_end_b} :catchall_9

    throw v0
.end method

.method authenticationFailed()V
    .registers 2

    .prologue
    .line 536
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/SASLAuthentication;->authenticationFailed(Ljava/lang/String;)V

    .line 537
    return-void
.end method

.method authenticationFailed(Ljava/lang/String;)V
    .registers 3
    .param p1, "condition"    # Ljava/lang/String;

    .prologue
    .line 546
    monitor-enter p0

    .line 547
    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslFailed:Z

    .line 548
    iput-object p1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->errorCondition:Ljava/lang/String;

    .line 550
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 551
    monitor-exit p0

    .line 552
    return-void

    .line 551
    :catchall_b
    move-exception v0

    monitor-exit p0
    :try_end_d
    .catchall {:try_start_2 .. :try_end_d} :catchall_b

    throw v0
.end method

.method bindingRequired()V
    .registers 2

    .prologue
    .line 559
    monitor-enter p0

    .line 560
    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->resourceBinded:Z

    .line 562
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 563
    monitor-exit p0

    .line 564
    return-void

    .line 563
    :catchall_9
    move-exception v0

    monitor-exit p0
    :try_end_b
    .catchall {:try_start_2 .. :try_end_b} :catchall_9

    throw v0
.end method

.method challengeReceived(Ljava/lang/String;)V
    .registers 3
    .param p1, "challenge"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 514
    iget-object v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->currentMechanism:Lorg/jivesoftware/smack/sasl/SASLMechanism;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->challengeReceived(Ljava/lang/String;)V

    .line 515
    return-void
.end method

.method public hasAnonymousAuthentication()Z
    .registers 3

    .prologue
    .line 190
    iget-object v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->serverMechanisms:Ljava/util/Collection;

    const-string v1, "ANONYMOUS"

    invoke-interface {v0, v1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public hasNonAnonymousAuthentication()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 199
    iget-object v1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->serverMechanisms:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_18

    iget-object v1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->serverMechanisms:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v1

    if-ne v1, v0, :cond_17

    invoke-virtual {p0}, Lorg/jivesoftware/smack/SASLAuthentication;->hasAnonymousAuthentication()Z

    move-result v1

    if-nez v1, :cond_18

    :cond_17
    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method

.method protected init()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 585
    iput-boolean v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslNegotiated:Z

    .line 586
    iput-boolean v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslFailed:Z

    .line 587
    iput-boolean v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->resourceBinded:Z

    .line 588
    iput-boolean v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->sessionSupported:Z

    .line 589
    return-void
.end method

.method public isAuthenticated()Z
    .registers 2

    .prologue
    .line 501
    iget-boolean v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslNegotiated:Z

    return v0
.end method

.method public send(Lorg/jivesoftware/smack/packet/Packet;)V
    .registers 3
    .param p1, "stanza"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 567
    iget-object v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 568
    return-void
.end method

.method sessionsSupported()V
    .registers 2

    .prologue
    .line 576
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->sessionSupported:Z

    .line 577
    return-void
.end method

.method setAvailableSASLMethods(Ljava/util/Collection;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 492
    .local p1, "mechanisms":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    iput-object p1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->serverMechanisms:Ljava/util/Collection;

    .line 493
    return-void
.end method
