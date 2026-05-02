.class public Lorg/jivesoftware/smack/packet/DefaultPacketExtension;
.super Ljava/lang/Object;
.source "DefaultPacketExtension.java"

# interfaces
.implements Lorg/jivesoftware/smack/packet/PacketExtension;


# instance fields
.field private elementName:Ljava/lang/String;

.field private map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private namespace:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "elementName"    # Ljava/lang/String;
    .param p2, "namespace"    # Ljava/lang/String;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->elementName:Ljava/lang/String;

    .line 61
    iput-object p2, p0, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->namespace:Ljava/lang/String;

    .line 62
    return-void
.end method


# virtual methods
.method public getElementName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->elementName:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized getNames()Ljava/util/Collection;
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
    .line 102
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->map:Ljava/util/Map;

    if-nez v0, :cond_b

    .line 103
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_1b

    move-result-object v0

    .line 105
    :goto_9
    monitor-exit p0

    return-object v0

    :cond_b
    :try_start_b
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p0, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->map:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;
    :try_end_19
    .catchall {:try_start_b .. :try_end_19} :catchall_1b

    move-result-object v0

    goto :goto_9

    .line 102
    :catchall_1b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getNamespace()Ljava/lang/String;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->namespace:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized getValue(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 115
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->map:Ljava/util/Map;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_11

    if-nez v0, :cond_8

    .line 116
    const/4 v0, 0x0

    .line 118
    :goto_6
    monitor-exit p0

    return-object v0

    :cond_8
    :try_start_8
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_10
    .catchall {:try_start_8 .. :try_end_10} :catchall_11

    goto :goto_6

    .line 115
    :catchall_11
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setValue(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 128
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->map:Ljava/util/Map;

    if-nez v0, :cond_c

    .line 129
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->map:Ljava/util/Map;

    .line 131
    :cond_c
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->map:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_13

    .line 132
    monitor-exit p0

    return-void

    .line 128
    :catchall_13
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public toXML()Ljava/lang/String;
    .registers 7

    .prologue
    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 84
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string v4, "<"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->elementName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " xmlns=\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->namespace:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\">"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->getNames()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_2a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 86
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 87
    .local v3, "value":Ljava/lang/String;
    const-string v4, "<"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ">"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    const-string v4, "</"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ">"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2a

    .line 91
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_5c
    const-string v4, "</"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->elementName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ">"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method
