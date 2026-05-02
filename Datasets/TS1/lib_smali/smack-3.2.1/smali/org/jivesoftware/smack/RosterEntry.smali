.class public Lorg/jivesoftware/smack/RosterEntry;
.super Ljava/lang/Object;
.source "RosterEntry.java"


# instance fields
.field private final connection:Lorg/jivesoftware/smack/Connection;

.field private name:Ljava/lang/String;

.field private final roster:Lorg/jivesoftware/smack/Roster;

.field private status:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

.field private type:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

.field private user:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;Lorg/jivesoftware/smack/Roster;Lorg/jivesoftware/smack/Connection;)V
    .registers 7
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "type"    # Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    .param p4, "status"    # Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    .param p5, "roster"    # Lorg/jivesoftware/smack/Roster;
    .param p6, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lorg/jivesoftware/smack/RosterEntry;->user:Ljava/lang/String;

    .line 55
    iput-object p2, p0, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    .line 56
    iput-object p3, p0, Lorg/jivesoftware/smack/RosterEntry;->type:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    .line 57
    iput-object p4, p0, Lorg/jivesoftware/smack/RosterEntry;->status:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    .line 58
    iput-object p5, p0, Lorg/jivesoftware/smack/RosterEntry;->roster:Lorg/jivesoftware/smack/Roster;

    .line 59
    iput-object p6, p0, Lorg/jivesoftware/smack/RosterEntry;->connection:Lorg/jivesoftware/smack/Connection;

    .line 60
    return-void
.end method

.method static toRosterItem(Lorg/jivesoftware/smack/RosterEntry;)Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    .registers 6
    .param p0, "entry"    # Lorg/jivesoftware/smack/RosterEntry;

    .prologue
    .line 229
    new-instance v2, Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    invoke-virtual {p0}, Lorg/jivesoftware/smack/RosterEntry;->getUser()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smack/RosterEntry;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 230
    .local v2, "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/RosterEntry;->getType()Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setItemType(Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;)V

    .line 231
    invoke-virtual {p0}, Lorg/jivesoftware/smack/RosterEntry;->getStatus()Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setItemStatus(Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;)V

    .line 233
    invoke-virtual {p0}, Lorg/jivesoftware/smack/RosterEntry;->getGroups()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_23
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_37

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/RosterGroup;

    .line 234
    .local v0, "group":Lorg/jivesoftware/smack/RosterGroup;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/RosterGroup;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->addGroupName(Ljava/lang/String;)V

    goto :goto_23

    .line 236
    .end local v0    # "group":Lorg/jivesoftware/smack/RosterGroup;
    :cond_37
    return-object v2
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 173
    if-ne p0, p1, :cond_4

    .line 174
    const/4 v0, 0x1

    .line 180
    .end local p1    # "object":Ljava/lang/Object;
    :goto_3
    return v0

    .line 176
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_4
    if-eqz p1, :cond_17

    instance-of v0, p1, Lorg/jivesoftware/smack/RosterEntry;

    if-eqz v0, :cond_17

    .line 177
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->user:Ljava/lang/String;

    check-cast p1, Lorg/jivesoftware/smack/RosterEntry;

    .end local p1    # "object":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jivesoftware/smack/RosterEntry;->getUser()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_3

    .line 180
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_17
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public equalsDeep(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 194
    if-ne p0, p1, :cond_5

    .line 225
    :cond_4
    :goto_4
    return v1

    .line 196
    :cond_5
    if-nez p1, :cond_9

    move v1, v2

    .line 197
    goto :goto_4

    .line 198
    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_15

    move v1, v2

    .line 199
    goto :goto_4

    :cond_15
    move-object v0, p1

    .line 200
    check-cast v0, Lorg/jivesoftware/smack/RosterEntry;

    .line 201
    .local v0, "other":Lorg/jivesoftware/smack/RosterEntry;
    iget-object v3, p0, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    if-nez v3, :cond_22

    .line 202
    iget-object v3, v0, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    if-eqz v3, :cond_2e

    move v1, v2

    .line 203
    goto :goto_4

    .line 205
    :cond_22
    iget-object v3, p0, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    iget-object v4, v0, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2e

    move v1, v2

    .line 206
    goto :goto_4

    .line 207
    :cond_2e
    iget-object v3, p0, Lorg/jivesoftware/smack/RosterEntry;->status:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    if-nez v3, :cond_38

    .line 208
    iget-object v3, v0, Lorg/jivesoftware/smack/RosterEntry;->status:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    if-eqz v3, :cond_44

    move v1, v2

    .line 209
    goto :goto_4

    .line 211
    :cond_38
    iget-object v3, p0, Lorg/jivesoftware/smack/RosterEntry;->status:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    iget-object v4, v0, Lorg/jivesoftware/smack/RosterEntry;->status:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_44

    move v1, v2

    .line 212
    goto :goto_4

    .line 213
    :cond_44
    iget-object v3, p0, Lorg/jivesoftware/smack/RosterEntry;->type:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    if-nez v3, :cond_4e

    .line 214
    iget-object v3, v0, Lorg/jivesoftware/smack/RosterEntry;->type:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    if-eqz v3, :cond_5a

    move v1, v2

    .line 215
    goto :goto_4

    .line 217
    :cond_4e
    iget-object v3, p0, Lorg/jivesoftware/smack/RosterEntry;->type:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    iget-object v4, v0, Lorg/jivesoftware/smack/RosterEntry;->type:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5a

    move v1, v2

    .line 218
    goto :goto_4

    .line 219
    :cond_5a
    iget-object v3, p0, Lorg/jivesoftware/smack/RosterEntry;->user:Ljava/lang/String;

    if-nez v3, :cond_64

    .line 220
    iget-object v3, v0, Lorg/jivesoftware/smack/RosterEntry;->user:Ljava/lang/String;

    if-eqz v3, :cond_4

    move v1, v2

    .line 221
    goto :goto_4

    .line 223
    :cond_64
    iget-object v3, p0, Lorg/jivesoftware/smack/RosterEntry;->user:Ljava/lang/String;

    iget-object v4, v0, Lorg/jivesoftware/smack/RosterEntry;->user:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 224
    goto :goto_4
.end method

.method public getGroups()Ljava/util/Collection;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/RosterGroup;",
            ">;"
        }
    .end annotation

    .prologue
    .line 116
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 119
    .local v2, "results":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/RosterGroup;>;"
    iget-object v3, p0, Lorg/jivesoftware/smack/RosterEntry;->roster:Lorg/jivesoftware/smack/Roster;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/Roster;->getGroups()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_f
    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_25

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/RosterGroup;

    .line 120
    .local v0, "group":Lorg/jivesoftware/smack/RosterGroup;
    invoke-virtual {v0, p0}, Lorg/jivesoftware/smack/RosterGroup;->contains(Lorg/jivesoftware/smack/RosterEntry;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 121
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_f

    .line 124
    .end local v0    # "group":Lorg/jivesoftware/smack/RosterGroup;
    :cond_25
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v3

    return-object v3
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getStatus()Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    .registers 2

    .prologue
    .line 147
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->status:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    return-object v0
.end method

.method public getType()Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->type:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    return-object v0
.end method

.method public getUser()Ljava/lang/String;
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->user:Ljava/lang/String;

    return-object v0
.end method

.method public setName(Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 87
    if-eqz p1, :cond_b

    iget-object v1, p0, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 95
    :goto_a
    return-void

    .line 90
    :cond_b
    iput-object p1, p0, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    .line 91
    new-instance v0, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v0}, Lorg/jivesoftware/smack/packet/RosterPacket;-><init>()V

    .line 92
    .local v0, "packet":Lorg/jivesoftware/smack/packet/RosterPacket;
    sget-object v1, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/RosterPacket;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 93
    invoke-static {p0}, Lorg/jivesoftware/smack/RosterEntry;->toRosterItem(Lorg/jivesoftware/smack/RosterEntry;)Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/RosterPacket;->addRosterItem(Lorg/jivesoftware/smack/packet/RosterPacket$Item;)V

    .line 94
    iget-object v1, p0, Lorg/jivesoftware/smack/RosterEntry;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_a
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    .line 151
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 152
    .local v0, "buf":Ljava/lang/StringBuilder;
    iget-object v4, p0, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    if-eqz v4, :cond_14

    .line 153
    iget-object v4, p0, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    :cond_14
    iget-object v4, p0, Lorg/jivesoftware/smack/RosterEntry;->user:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    invoke-virtual {p0}, Lorg/jivesoftware/smack/RosterEntry;->getGroups()Ljava/util/Collection;

    move-result-object v2

    .line 157
    .local v2, "groups":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/RosterGroup;>;"
    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_57

    .line 158
    const-string v4, " ["

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 160
    .local v3, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smack/RosterGroup;>;"
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/RosterGroup;

    .line 161
    .local v1, "group":Lorg/jivesoftware/smack/RosterGroup;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/RosterGroup;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    :goto_39
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_52

    .line 163
    const-string v4, ", "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "group":Lorg/jivesoftware/smack/RosterGroup;
    check-cast v1, Lorg/jivesoftware/smack/RosterGroup;

    .line 165
    .restart local v1    # "group":Lorg/jivesoftware/smack/RosterGroup;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/RosterGroup;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_39

    .line 167
    :cond_52
    const-string v4, "]"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .end local v1    # "group":Lorg/jivesoftware/smack/RosterGroup;
    .end local v3    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smack/RosterGroup;>;"
    :cond_57
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method updateState(Ljava/lang/String;Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    .param p3, "status"    # Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    .prologue
    .line 105
    iput-object p1, p0, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    .line 106
    iput-object p2, p0, Lorg/jivesoftware/smack/RosterEntry;->type:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    .line 107
    iput-object p3, p0, Lorg/jivesoftware/smack/RosterEntry;->status:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    .line 108
    return-void
.end method
