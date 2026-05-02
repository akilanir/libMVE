.class public abstract Lorg/jivesoftware/smack/packet/Packet;
.super Ljava/lang/Object;
.source "Packet.java"


# static fields
.field protected static final DEFAULT_LANGUAGE:Ljava/lang/String;

.field private static DEFAULT_XML_NS:Ljava/lang/String; = null

.field public static final ID_NOT_AVAILABLE:Ljava/lang/String; = "ID_NOT_AVAILABLE"

.field private static id:J

.field private static prefix:Ljava/lang/String;


# instance fields
.field private error:Lorg/jivesoftware/smack/packet/XMPPError;

.field private from:Ljava/lang/String;

.field private final packetExtensions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/packet/PacketExtension;",
            ">;"
        }
    .end annotation
.end field

.field private packetID:Ljava/lang/String;

.field private final properties:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private to:Ljava/lang/String;

.field private xmlns:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 45
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smack/packet/Packet;->DEFAULT_LANGUAGE:Ljava/lang/String;

    .line 48
    const/4 v0, 0x0

    sput-object v0, Lorg/jivesoftware/smack/packet/Packet;->DEFAULT_XML_NS:Ljava/lang/String;

    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x5

    invoke-static {v1}, Lorg/jivesoftware/smack/util/StringUtils;->randomString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smack/packet/Packet;->prefix:Ljava/lang/String;

    .line 66
    const-wide/16 v0, 0x0

    sput-wide v0, Lorg/jivesoftware/smack/packet/Packet;->id:J

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    sget-object v0, Lorg/jivesoftware/smack/packet/Packet;->DEFAULT_XML_NS:Ljava/lang/String;

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->xmlns:Ljava/lang/String;

    .line 84
    iput-object v1, p0, Lorg/jivesoftware/smack/packet/Packet;->packetID:Ljava/lang/String;

    .line 85
    iput-object v1, p0, Lorg/jivesoftware/smack/packet/Packet;->to:Ljava/lang/String;

    .line 86
    iput-object v1, p0, Lorg/jivesoftware/smack/packet/Packet;->from:Ljava/lang/String;

    .line 87
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->packetExtensions:Ljava/util/List;

    .line 90
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    .line 91
    iput-object v1, p0, Lorg/jivesoftware/smack/packet/Packet;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    return-void
.end method

.method public static getDefaultLanguage()Ljava/lang/String;
    .registers 1

    .prologue
    .line 425
    sget-object v0, Lorg/jivesoftware/smack/packet/Packet;->DEFAULT_LANGUAGE:Ljava/lang/String;

    return-object v0
.end method

.method public static declared-synchronized nextID()Ljava/lang/String;
    .registers 6

    .prologue
    .line 77
    const-class v1, Lorg/jivesoftware/smack/packet/Packet;

    monitor-enter v1

    :try_start_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lorg/jivesoftware/smack/packet/Packet;->prefix:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-wide v2, Lorg/jivesoftware/smack/packet/Packet;->id:J

    const-wide/16 v4, 0x1

    add-long/2addr v4, v2

    sput-wide v4, Lorg/jivesoftware/smack/packet/Packet;->id:J

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_20
    .catchall {:try_start_3 .. :try_end_20} :catchall_23

    move-result-object v0

    monitor-exit v1

    return-object v0

    :catchall_23
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static setDefaultXmlns(Ljava/lang/String;)V
    .registers 1
    .param p0, "defaultXmlns"    # Ljava/lang/String;

    .prologue
    .line 81
    sput-object p0, Lorg/jivesoftware/smack/packet/Packet;->DEFAULT_XML_NS:Ljava/lang/String;

    .line 82
    return-void
.end method


# virtual methods
.method public addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V
    .registers 3
    .param p1, "extension"    # Lorg/jivesoftware/smack/packet/PacketExtension;

    .prologue
    .line 255
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->packetExtensions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 256
    return-void
.end method

.method public declared-synchronized deleteProperty(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 303
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_d

    if-nez v0, :cond_7

    .line 307
    :goto_5
    monitor-exit p0

    return-void

    .line 306
    :cond_7
    :try_start_7
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_c
    .catchall {:try_start_7 .. :try_end_c} :catchall_d

    goto :goto_5

    .line 303
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 429
    if-ne p0, p1, :cond_6

    move v2, v1

    .line 445
    :cond_5
    :goto_5
    return v2

    .line 430
    :cond_6
    if-eqz p1, :cond_5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-ne v3, v4, :cond_5

    move-object v0, p1

    .line 432
    check-cast v0, Lorg/jivesoftware/smack/packet/Packet;

    .line 434
    .local v0, "packet":Lorg/jivesoftware/smack/packet/Packet;
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Packet;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    if-eqz v3, :cond_76

    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Packet;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    iget-object v4, v0, Lorg/jivesoftware/smack/packet/Packet;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 435
    :cond_23
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Packet;->from:Ljava/lang/String;

    if-eqz v3, :cond_7b

    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Packet;->from:Ljava/lang/String;

    iget-object v4, v0, Lorg/jivesoftware/smack/packet/Packet;->from:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 436
    :cond_31
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Packet;->packetExtensions:Ljava/util/List;

    iget-object v4, v0, Lorg/jivesoftware/smack/packet/Packet;->packetExtensions:Ljava/util/List;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 437
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Packet;->packetID:Ljava/lang/String;

    if-eqz v3, :cond_80

    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Packet;->packetID:Ljava/lang/String;

    iget-object v4, v0, Lorg/jivesoftware/smack/packet/Packet;->packetID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 440
    :cond_49
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    if-eqz v3, :cond_85

    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    iget-object v4, v0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 444
    :cond_57
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Packet;->to:Ljava/lang/String;

    if-eqz v3, :cond_8b

    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Packet;->to:Ljava/lang/String;

    iget-object v4, v0, Lorg/jivesoftware/smack/packet/Packet;->to:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 445
    :cond_65
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Packet;->xmlns:Ljava/lang/String;

    if-eqz v3, :cond_91

    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Packet;->xmlns:Ljava/lang/String;

    iget-object v4, v0, Lorg/jivesoftware/smack/packet/Packet;->xmlns:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_74

    :cond_73
    move v1, v2

    :cond_74
    :goto_74
    move v2, v1

    goto :goto_5

    .line 434
    :cond_76
    iget-object v3, v0, Lorg/jivesoftware/smack/packet/Packet;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    if-eqz v3, :cond_23

    goto :goto_5

    .line 435
    :cond_7b
    iget-object v3, v0, Lorg/jivesoftware/smack/packet/Packet;->from:Ljava/lang/String;

    if-eqz v3, :cond_31

    goto :goto_5

    .line 437
    :cond_80
    iget-object v3, v0, Lorg/jivesoftware/smack/packet/Packet;->packetID:Ljava/lang/String;

    if-eqz v3, :cond_49

    goto :goto_5

    .line 440
    :cond_85
    iget-object v3, v0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    if-eqz v3, :cond_57

    goto/16 :goto_5

    .line 444
    :cond_8b
    iget-object v3, v0, Lorg/jivesoftware/smack/packet/Packet;->to:Ljava/lang/String;

    if-eqz v3, :cond_65

    goto/16 :goto_5

    .line 445
    :cond_91
    iget-object v3, v0, Lorg/jivesoftware/smack/packet/Packet;->xmlns:Ljava/lang/String;

    if-nez v3, :cond_73

    goto :goto_74
.end method

.method public getError()Lorg/jivesoftware/smack/packet/XMPPError;
    .registers 2

    .prologue
    .line 186
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    return-object v0
.end method

.method public getExtension(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;
    .registers 3
    .param p1, "namespace"    # Ljava/lang/String;

    .prologue
    .line 217
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smack/packet/Packet;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v0

    return-object v0
.end method

.method public getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;
    .registers 7
    .param p1, "elementName"    # Ljava/lang/String;
    .param p2, "namespace"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 236
    if-nez p2, :cond_5

    move-object v0, v2

    .line 246
    :goto_4
    return-object v0

    .line 239
    :cond_5
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Packet;->packetExtensions:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/PacketExtension;

    .line 240
    .local v0, "ext":Lorg/jivesoftware/smack/packet/PacketExtension;
    if-eqz p1, :cond_23

    invoke-interface {v0}, Lorg/jivesoftware/smack/packet/PacketExtension;->getElementName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    :cond_23
    invoke-interface {v0}, Lorg/jivesoftware/smack/packet/PacketExtension;->getNamespace()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    goto :goto_4

    .end local v0    # "ext":Lorg/jivesoftware/smack/packet/PacketExtension;
    :cond_2e
    move-object v0, v2

    .line 246
    goto :goto_4
.end method

.method public declared-synchronized getExtensions()Ljava/util/Collection;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/packet/PacketExtension;",
            ">;"
        }
    .end annotation

    .prologue
    .line 204
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->packetExtensions:Ljava/util/List;

    if-nez v0, :cond_b

    .line 205
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_17

    move-result-object v0

    .line 207
    :goto_9
    monitor-exit p0

    return-object v0

    :cond_b
    :try_start_b
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/jivesoftware/smack/packet/Packet;->packetExtensions:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;
    :try_end_15
    .catchall {:try_start_b .. :try_end_15} :catchall_17

    move-result-object v0

    goto :goto_9

    .line 204
    :catchall_17
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized getExtensionsXML()Ljava/lang/String;
    .registers 14

    .prologue
    .line 338
    monitor-enter p0

    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 340
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Packet;->getExtensions()Ljava/util/Collection;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_e
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_25

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jivesoftware/smack/packet/PacketExtension;

    .line 341
    .local v5, "extension":Lorg/jivesoftware/smack/packet/PacketExtension;
    invoke-interface {v5}, Lorg/jivesoftware/smack/packet/PacketExtension;->toXML()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_21
    .catchall {:try_start_1 .. :try_end_21} :catchall_22

    goto :goto_e

    .line 338
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    .end local v5    # "extension":Lorg/jivesoftware/smack/packet/PacketExtension;
    .end local v6    # "i$":Ljava/util/Iterator;
    :catchall_22
    move-exception v11

    monitor-exit p0

    throw v11

    .line 344
    .restart local v0    # "buf":Ljava/lang/StringBuilder;
    .restart local v6    # "i$":Ljava/util/Iterator;
    :cond_25
    :try_start_25
    iget-object v11, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    if-eqz v11, :cond_144

    iget-object v11, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    invoke-interface {v11}, Ljava/util/Map;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_144

    .line 345
    const-string v11, "<properties xmlns=\"http://www.jivesoftware.com/xmlns/xmpp/properties\">"

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Packet;->getPropertyNames()Ljava/util/Collection;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3e
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_13f

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 348
    .local v7, "name":Ljava/lang/String;
    invoke-virtual {p0, v7}, Lorg/jivesoftware/smack/packet/Packet;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    .line 349
    .local v10, "value":Ljava/lang/Object;
    const-string v11, "<property>"

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    const-string v11, "<name>"

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {v7}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "</name>"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    const-string v11, "<value type=\""

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    instance-of v11, v10, Ljava/lang/Integer;

    if-eqz v11, :cond_84

    .line 353
    const-string v11, "integer\">"

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "</value>"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 408
    .end local v10    # "value":Ljava/lang/Object;
    :cond_7e
    :goto_7e
    const-string v11, "</property>"

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3e

    .line 355
    .restart local v10    # "value":Ljava/lang/Object;
    :cond_84
    instance-of v11, v10, Ljava/lang/Long;

    if-eqz v11, :cond_98

    .line 356
    const-string v11, "long\">"

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "</value>"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_7e

    .line 358
    :cond_98
    instance-of v11, v10, Ljava/lang/Float;

    if-eqz v11, :cond_ac

    .line 359
    const-string v11, "float\">"

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "</value>"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_7e

    .line 361
    :cond_ac
    instance-of v11, v10, Ljava/lang/Double;

    if-eqz v11, :cond_c0

    .line 362
    const-string v11, "double\">"

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "</value>"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_7e

    .line 364
    :cond_c0
    instance-of v11, v10, Ljava/lang/Boolean;

    if-eqz v11, :cond_d4

    .line 365
    const-string v11, "boolean\">"

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "</value>"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_7e

    .line 367
    :cond_d4
    instance-of v11, v10, Ljava/lang/String;

    if-eqz v11, :cond_ec

    .line 368
    const-string v11, "string\">"

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 369
    check-cast v10, Ljava/lang/String;

    .end local v10    # "value":Ljava/lang/Object;
    invoke-static {v10}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 370
    const-string v11, "</value>"

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_eb
    .catchall {:try_start_25 .. :try_end_eb} :catchall_22

    goto :goto_7e

    .line 376
    .restart local v10    # "value":Ljava/lang/Object;
    :cond_ec
    const/4 v1, 0x0

    .line 377
    .local v1, "byteStream":Ljava/io/ByteArrayOutputStream;
    const/4 v8, 0x0

    .line 379
    .local v8, "out":Ljava/io/ObjectOutputStream;
    :try_start_ee
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_f3
    .catch Ljava/lang/Exception; {:try_start_ee .. :try_end_f3} :catch_120
    .catchall {:try_start_ee .. :try_end_f3} :catchall_133

    .line 380
    .end local v1    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .local v2, "byteStream":Ljava/io/ByteArrayOutputStream;
    :try_start_f3
    new-instance v9, Ljava/io/ObjectOutputStream;

    invoke-direct {v9, v2}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_f8
    .catch Ljava/lang/Exception; {:try_start_f3 .. :try_end_f8} :catch_159
    .catchall {:try_start_f3 .. :try_end_f8} :catchall_152

    .line 381
    .end local v8    # "out":Ljava/io/ObjectOutputStream;
    .local v9, "out":Ljava/io/ObjectOutputStream;
    :try_start_f8
    invoke-virtual {v9, v10}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 382
    const-string v11, "java-object\">"

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 383
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v11

    invoke-static {v11}, Lorg/jivesoftware/smack/util/StringUtils;->encodeBase64([B)Ljava/lang/String;

    move-result-object v4

    .line 384
    .local v4, "encodedVal":Ljava/lang/String;
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "</value>"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_111
    .catch Ljava/lang/Exception; {:try_start_f8 .. :try_end_111} :catch_15c
    .catchall {:try_start_f8 .. :try_end_111} :catchall_155

    .line 390
    if-eqz v9, :cond_116

    .line 392
    :try_start_113
    invoke-virtual {v9}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_116
    .catch Ljava/lang/Exception; {:try_start_113 .. :try_end_116} :catch_14a
    .catchall {:try_start_113 .. :try_end_116} :catchall_22

    .line 398
    :cond_116
    :goto_116
    if-eqz v2, :cond_7e

    .line 400
    :try_start_118
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_11b
    .catch Ljava/lang/Exception; {:try_start_118 .. :try_end_11b} :catch_11d
    .catchall {:try_start_118 .. :try_end_11b} :catchall_22

    goto/16 :goto_7e

    .line 402
    :catch_11d
    move-exception v11

    goto/16 :goto_7e

    .line 386
    .end local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .end local v4    # "encodedVal":Ljava/lang/String;
    .end local v9    # "out":Ljava/io/ObjectOutputStream;
    .restart local v1    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v8    # "out":Ljava/io/ObjectOutputStream;
    :catch_120
    move-exception v3

    .line 387
    .local v3, "e":Ljava/lang/Exception;
    :goto_121
    :try_start_121
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_124
    .catchall {:try_start_121 .. :try_end_124} :catchall_133

    .line 390
    if-eqz v8, :cond_129

    .line 392
    :try_start_126
    invoke-virtual {v8}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_129
    .catch Ljava/lang/Exception; {:try_start_126 .. :try_end_129} :catch_14c
    .catchall {:try_start_126 .. :try_end_129} :catchall_22

    .line 398
    :cond_129
    :goto_129
    if-eqz v1, :cond_7e

    .line 400
    :try_start_12b
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_12e
    .catch Ljava/lang/Exception; {:try_start_12b .. :try_end_12e} :catch_130
    .catchall {:try_start_12b .. :try_end_12e} :catchall_22

    goto/16 :goto_7e

    .line 402
    :catch_130
    move-exception v11

    goto/16 :goto_7e

    .line 390
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_133
    move-exception v11

    :goto_134
    if-eqz v8, :cond_139

    .line 392
    :try_start_136
    invoke-virtual {v8}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_139
    .catch Ljava/lang/Exception; {:try_start_136 .. :try_end_139} :catch_14e
    .catchall {:try_start_136 .. :try_end_139} :catchall_22

    .line 398
    :cond_139
    :goto_139
    if-eqz v1, :cond_13e

    .line 400
    :try_start_13b
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_13e
    .catch Ljava/lang/Exception; {:try_start_13b .. :try_end_13e} :catch_150
    .catchall {:try_start_13b .. :try_end_13e} :catchall_22

    .line 404
    :cond_13e
    :goto_13e
    :try_start_13e
    throw v11

    .line 410
    .end local v1    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "name":Ljava/lang/String;
    .end local v8    # "out":Ljava/io/ObjectOutputStream;
    .end local v10    # "value":Ljava/lang/Object;
    :cond_13f
    const-string v11, "</properties>"

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    :cond_144
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_147
    .catchall {:try_start_13e .. :try_end_147} :catchall_22

    move-result-object v11

    monitor-exit p0

    return-object v11

    .line 394
    .restart local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v4    # "encodedVal":Ljava/lang/String;
    .restart local v7    # "name":Ljava/lang/String;
    .restart local v9    # "out":Ljava/io/ObjectOutputStream;
    .restart local v10    # "value":Ljava/lang/Object;
    :catch_14a
    move-exception v11

    goto :goto_116

    .end local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .end local v4    # "encodedVal":Ljava/lang/String;
    .end local v9    # "out":Ljava/io/ObjectOutputStream;
    .restart local v1    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "e":Ljava/lang/Exception;
    .restart local v8    # "out":Ljava/io/ObjectOutputStream;
    :catch_14c
    move-exception v11

    goto :goto_129

    .end local v3    # "e":Ljava/lang/Exception;
    :catch_14e
    move-exception v12

    goto :goto_139

    .line 402
    :catch_150
    move-exception v12

    goto :goto_13e

    .line 390
    .end local v1    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    :catchall_152
    move-exception v11

    move-object v1, v2

    .end local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "byteStream":Ljava/io/ByteArrayOutputStream;
    goto :goto_134

    .end local v1    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .end local v8    # "out":Ljava/io/ObjectOutputStream;
    .restart local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v9    # "out":Ljava/io/ObjectOutputStream;
    :catchall_155
    move-exception v11

    move-object v8, v9

    .end local v9    # "out":Ljava/io/ObjectOutputStream;
    .restart local v8    # "out":Ljava/io/ObjectOutputStream;
    move-object v1, v2

    .end local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "byteStream":Ljava/io/ByteArrayOutputStream;
    goto :goto_134

    .line 386
    .end local v1    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    :catch_159
    move-exception v3

    move-object v1, v2

    .end local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "byteStream":Ljava/io/ByteArrayOutputStream;
    goto :goto_121

    .end local v1    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .end local v8    # "out":Ljava/io/ObjectOutputStream;
    .restart local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v9    # "out":Ljava/io/ObjectOutputStream;
    :catch_15c
    move-exception v3

    move-object v8, v9

    .end local v9    # "out":Ljava/io/ObjectOutputStream;
    .restart local v8    # "out":Ljava/io/ObjectOutputStream;
    move-object v1, v2

    .end local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "byteStream":Ljava/io/ByteArrayOutputStream;
    goto :goto_121
.end method

.method public getFrom()Ljava/lang/String;
    .registers 2

    .prologue
    .line 165
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->from:Ljava/lang/String;

    return-object v0
.end method

.method public getPacketID()Ljava/lang/String;
    .registers 3

    .prologue
    .line 100
    const-string v0, "ID_NOT_AVAILABLE"

    iget-object v1, p0, Lorg/jivesoftware/smack/packet/Packet;->packetID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 101
    const/4 v0, 0x0

    .line 107
    :goto_b
    return-object v0

    .line 104
    :cond_c
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->packetID:Ljava/lang/String;

    if-nez v0, :cond_16

    .line 105
    invoke-static {}, Lorg/jivesoftware/smack/packet/Packet;->nextID()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->packetID:Ljava/lang/String;

    .line 107
    :cond_16
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->packetID:Ljava/lang/String;

    goto :goto_b
.end method

.method public declared-synchronized getProperty(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 277
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_f

    if-nez v0, :cond_8

    .line 278
    const/4 v0, 0x0

    .line 280
    :goto_6
    monitor-exit p0

    return-object v0

    :cond_8
    :try_start_8
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_d
    .catchall {:try_start_8 .. :try_end_d} :catchall_f

    move-result-object v0

    goto :goto_6

    .line 277
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getPropertyNames()Ljava/util/Collection;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 315
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    if-nez v0, :cond_b

    .line 316
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_1b

    move-result-object v0

    .line 318
    :goto_9
    monitor-exit p0

    return-object v0

    :cond_b
    :try_start_b
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;
    :try_end_19
    .catchall {:try_start_b .. :try_end_19} :catchall_1b

    move-result-object v0

    goto :goto_9

    .line 315
    :catchall_1b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getTo()Ljava/lang/String;
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->to:Ljava/lang/String;

    return-object v0
.end method

.method public getXmlns()Ljava/lang/String;
    .registers 2

    .prologue
    .line 416
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->xmlns:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 450
    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Packet;->xmlns:Ljava/lang/String;

    if-eqz v2, :cond_58

    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Packet;->xmlns:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 451
    .local v0, "result":I
    :goto_b
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Packet;->packetID:Ljava/lang/String;

    if-eqz v2, :cond_5a

    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Packet;->packetID:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_17
    add-int v0, v3, v2

    .line 452
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Packet;->to:Ljava/lang/String;

    if-eqz v2, :cond_5c

    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Packet;->to:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_25
    add-int v0, v3, v2

    .line 453
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Packet;->from:Ljava/lang/String;

    if-eqz v2, :cond_5e

    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Packet;->from:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_33
    add-int v0, v3, v2

    .line 454
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Packet;->packetExtensions:Ljava/util/List;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int v0, v2, v3

    .line 455
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int v0, v2, v3

    .line 456
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Packet;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    if-eqz v3, :cond_55

    iget-object v1, p0, Lorg/jivesoftware/smack/packet/Packet;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :cond_55
    add-int v0, v2, v1

    .line 457
    return v0

    .end local v0    # "result":I
    :cond_58
    move v0, v1

    .line 450
    goto :goto_b

    .restart local v0    # "result":I
    :cond_5a
    move v2, v1

    .line 451
    goto :goto_17

    :cond_5c
    move v2, v1

    .line 452
    goto :goto_25

    :cond_5e
    move v2, v1

    .line 453
    goto :goto_33
.end method

.method public removeExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V
    .registers 3
    .param p1, "extension"    # Lorg/jivesoftware/smack/packet/PacketExtension;

    .prologue
    .line 264
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->packetExtensions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 265
    return-void
.end method

.method public setError(Lorg/jivesoftware/smack/packet/XMPPError;)V
    .registers 2
    .param p1, "error"    # Lorg/jivesoftware/smack/packet/XMPPError;

    .prologue
    .line 195
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Packet;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    .line 196
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .registers 2
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 176
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Packet;->from:Ljava/lang/String;

    .line 177
    return-void
.end method

.method public setPacketID(Ljava/lang/String;)V
    .registers 2
    .param p1, "packetID"    # Ljava/lang/String;

    .prologue
    .line 117
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Packet;->packetID:Ljava/lang/String;

    .line 118
    return-void
.end method

.method public declared-synchronized setProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 291
    monitor-enter p0

    :try_start_1
    instance-of v0, p2, Ljava/io/Serializable;

    if-nez v0, :cond_10

    .line 292
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Value must be serialiazble"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    .line 291
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0

    .line 294
    :cond_10
    :try_start_10
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_15
    .catchall {:try_start_10 .. :try_end_15} :catchall_d

    .line 295
    monitor-exit p0

    return-void
.end method

.method public setTo(Ljava/lang/String;)V
    .registers 2
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 146
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Packet;->to:Ljava/lang/String;

    .line 147
    return-void
.end method

.method public abstract toXML()Ljava/lang/String;
.end method
