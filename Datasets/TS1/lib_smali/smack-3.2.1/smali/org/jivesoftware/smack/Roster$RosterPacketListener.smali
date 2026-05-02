.class Lorg/jivesoftware/smack/Roster$RosterPacketListener;
.super Ljava/lang/Object;
.source "Roster.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/Roster;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RosterPacketListener"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smack/Roster;


# direct methods
.method private constructor <init>(Lorg/jivesoftware/smack/Roster;)V
    .registers 2

    .prologue
    .line 814
    iput-object p1, p0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/jivesoftware/smack/Roster;Lorg/jivesoftware/smack/Roster$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/jivesoftware/smack/Roster;
    .param p2, "x1"    # Lorg/jivesoftware/smack/Roster$1;

    .prologue
    .line 814
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/Roster$RosterPacketListener;-><init>(Lorg/jivesoftware/smack/Roster;)V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .registers 25
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 819
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 820
    .local v8, "addedEntries":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    new-instance v22, Ljava/util/ArrayList;

    invoke-direct/range {v22 .. v22}, Ljava/util/ArrayList;-><init>()V

    .line 821
    .local v22, "updatedEntries":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .local v10, "deletedEntries":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    move-object/from16 v21, p1

    .line 823
    check-cast v21, Lorg/jivesoftware/smack/packet/RosterPacket;

    .line 824
    .local v21, "rosterPacket":Lorg/jivesoftware/smack/packet/RosterPacket;
    invoke-virtual/range {v21 .. v21}, Lorg/jivesoftware/smack/packet/RosterPacket;->getRosterItems()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_1b
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_241

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    .line 825
    .local v15, "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    new-instance v1, Lorg/jivesoftware/smack/RosterEntry;

    invoke-virtual {v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getUser()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getItemType()Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-result-object v4

    invoke-virtual {v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getItemStatus()Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;
    invoke-static {v7}, Lorg/jivesoftware/smack/Roster;->access$300(Lorg/jivesoftware/smack/Roster;)Lorg/jivesoftware/smack/Connection;

    move-result-object v7

    invoke-direct/range {v1 .. v7}, Lorg/jivesoftware/smack/RosterEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;Lorg/jivesoftware/smack/Roster;Lorg/jivesoftware/smack/Connection;)V

    .line 829
    .local v1, "entry":Lorg/jivesoftware/smack/RosterEntry;
    sget-object v2, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->remove:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    invoke-virtual {v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getItemType()Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f4

    .line 831
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->entries:Ljava/util/Map;
    invoke-static {v2}, Lorg/jivesoftware/smack/Roster;->access$600(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getUser()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_75

    .line 832
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->entries:Ljava/util/Map;
    invoke-static {v2}, Lorg/jivesoftware/smack/Roster;->access$600(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getUser()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 835
    :cond_75
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->unfiledEntries:Ljava/util/List;
    invoke-static {v2}, Lorg/jivesoftware/smack/Roster;->access$900(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8e

    .line 836
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->unfiledEntries:Ljava/util/List;
    invoke-static {v2}, Lorg/jivesoftware/smack/Roster;->access$900(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 840
    :cond_8e
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getUser()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/jivesoftware/smack/util/StringUtils;->parseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getUser()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/jivesoftware/smack/util/StringUtils;->parseServer(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 842
    .local v16, "key":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;
    invoke-static {v2}, Lorg/jivesoftware/smack/Roster;->access$500(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-interface {v2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 844
    invoke-virtual {v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getUser()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v10, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 878
    .end local v16    # "key":Ljava/lang/String;
    :cond_c9
    :goto_c9
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 879
    .local v9, "currentGroupNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/Roster;->getGroups()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, "i$":Ljava/util/Iterator;
    :cond_da
    :goto_da
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_185

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/jivesoftware/smack/RosterGroup;

    .line 880
    .local v11, "group":Lorg/jivesoftware/smack/RosterGroup;
    invoke-virtual {v11, v1}, Lorg/jivesoftware/smack/RosterGroup;->contains(Lorg/jivesoftware/smack/RosterEntry;)Z

    move-result v2

    if-eqz v2, :cond_da

    .line 881
    invoke-virtual {v11}, Lorg/jivesoftware/smack/RosterGroup;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v9, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_da

    .line 848
    .end local v9    # "currentGroupNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v11    # "group":Lorg/jivesoftware/smack/RosterGroup;
    .end local v14    # "i$":Ljava/util/Iterator;
    :cond_f4
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->entries:Ljava/util/Map;
    invoke-static {v2}, Lorg/jivesoftware/smack/Roster;->access$600(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getUser()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_132

    .line 849
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->entries:Ljava/util/Map;
    invoke-static {v2}, Lorg/jivesoftware/smack/Roster;->access$600(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getUser()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 851
    invoke-virtual {v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getUser()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v8, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 866
    :cond_11c
    :goto_11c
    invoke-virtual {v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getGroupNames()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_16a

    .line 867
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->unfiledEntries:Ljava/util/List;
    invoke-static {v2}, Lorg/jivesoftware/smack/Roster;->access$900(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_c9

    .line 855
    :cond_132
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->entries:Ljava/util/Map;
    invoke-static {v2}, Lorg/jivesoftware/smack/Roster;->access$600(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getUser()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/jivesoftware/smack/RosterEntry;

    .line 857
    .local v19, "oldEntry":Lorg/jivesoftware/smack/RosterEntry;
    invoke-static/range {v19 .. v19}, Lorg/jivesoftware/smack/RosterEntry;->toRosterItem(Lorg/jivesoftware/smack/RosterEntry;)Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    move-result-object v20

    .line 859
    .local v20, "oldItem":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    if-eqz v19, :cond_160

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/RosterEntry;->equalsDeep(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_160

    invoke-virtual {v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getGroupNames()Ljava/util/Set;

    move-result-object v2

    invoke-virtual/range {v20 .. v20}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getGroupNames()Ljava/util/Set;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_11c

    .line 861
    :cond_160
    invoke-virtual {v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getUser()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v22

    invoke-interface {v0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_11c

    .line 871
    .end local v19    # "oldEntry":Lorg/jivesoftware/smack/RosterEntry;
    .end local v20    # "oldItem":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    :cond_16a
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->unfiledEntries:Ljava/util/List;
    invoke-static {v2}, Lorg/jivesoftware/smack/Roster;->access$900(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c9

    .line 872
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->unfiledEntries:Ljava/util/List;
    invoke-static {v2}, Lorg/jivesoftware/smack/Roster;->access$900(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_c9

    .line 886
    .restart local v9    # "currentGroupNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v14    # "i$":Ljava/util/Iterator;
    :cond_185
    sget-object v2, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->remove:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    invoke-virtual {v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getItemType()Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1e6

    .line 888
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    .line 889
    .local v18, "newGroupNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getGroupNames()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_19e
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d0

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 891
    .local v12, "groupName":Ljava/lang/String;
    move-object/from16 v0, v18

    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 894
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-virtual {v2, v12}, Lorg/jivesoftware/smack/Roster;->getGroup(Ljava/lang/String;)Lorg/jivesoftware/smack/RosterGroup;

    move-result-object v11

    .line 895
    .restart local v11    # "group":Lorg/jivesoftware/smack/RosterGroup;
    if-nez v11, :cond_1cc

    .line 896
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-virtual {v2, v12}, Lorg/jivesoftware/smack/Roster;->createGroup(Ljava/lang/String;)Lorg/jivesoftware/smack/RosterGroup;

    move-result-object v11

    .line 897
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->groups:Ljava/util/Map;
    invoke-static {v2}, Lorg/jivesoftware/smack/Roster;->access$1000(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v12, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 900
    :cond_1cc
    invoke-virtual {v11, v1}, Lorg/jivesoftware/smack/RosterGroup;->addEntryLocal(Lorg/jivesoftware/smack/RosterEntry;)V

    goto :goto_19e

    .line 906
    .end local v11    # "group":Lorg/jivesoftware/smack/RosterGroup;
    .end local v12    # "groupName":Ljava/lang/String;
    :cond_1d0
    invoke-interface/range {v18 .. v18}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_1d4
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e6

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    .line 907
    .local v17, "newGroupName":Ljava/lang/String;
    move-object/from16 v0, v17

    invoke-interface {v9, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_1d4

    .line 913
    .end local v17    # "newGroupName":Ljava/lang/String;
    .end local v18    # "newGroupNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1e6
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_1ea
    :goto_1ea
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_213

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 914
    .restart local v12    # "groupName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-virtual {v2, v12}, Lorg/jivesoftware/smack/Roster;->getGroup(Ljava/lang/String;)Lorg/jivesoftware/smack/RosterGroup;

    move-result-object v11

    .line 915
    .restart local v11    # "group":Lorg/jivesoftware/smack/RosterGroup;
    invoke-virtual {v11, v1}, Lorg/jivesoftware/smack/RosterGroup;->removeEntryLocal(Lorg/jivesoftware/smack/RosterEntry;)V

    .line 916
    invoke-virtual {v11}, Lorg/jivesoftware/smack/RosterGroup;->getEntryCount()I

    move-result v2

    if-nez v2, :cond_1ea

    .line 917
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->groups:Ljava/util/Map;
    invoke-static {v2}, Lorg/jivesoftware/smack/Roster;->access$1000(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v12}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1ea

    .line 924
    .end local v11    # "group":Lorg/jivesoftware/smack/RosterGroup;
    .end local v12    # "groupName":Ljava/lang/String;
    :cond_213
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/Roster;->getGroups()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_21f
    :goto_21f
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/jivesoftware/smack/RosterGroup;

    .line 925
    .restart local v11    # "group":Lorg/jivesoftware/smack/RosterGroup;
    invoke-virtual {v11}, Lorg/jivesoftware/smack/RosterGroup;->getEntryCount()I

    move-result v2

    if-nez v2, :cond_21f

    .line 926
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->groups:Ljava/util/Map;
    invoke-static {v2}, Lorg/jivesoftware/smack/Roster;->access$1000(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v11}, Lorg/jivesoftware/smack/RosterGroup;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_21f

    .line 932
    .end local v1    # "entry":Lorg/jivesoftware/smack/RosterEntry;
    .end local v9    # "currentGroupNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v11    # "group":Lorg/jivesoftware/smack/RosterGroup;
    .end local v14    # "i$":Ljava/util/Iterator;
    .end local v15    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    :cond_241
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    monitor-enter v3

    .line 933
    :try_start_246
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    const/4 v4, 0x1

    iput-boolean v4, v2, Lorg/jivesoftware/smack/Roster;->rosterInitialized:Z

    .line 934
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 935
    monitor-exit v3
    :try_end_255
    .catchall {:try_start_246 .. :try_end_255} :catchall_25f

    .line 938
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object/from16 v0, v22

    # invokes: Lorg/jivesoftware/smack/Roster;->fireRosterChangedEvent(Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;)V
    invoke-static {v2, v8, v0, v10}, Lorg/jivesoftware/smack/Roster;->access$1100(Lorg/jivesoftware/smack/Roster;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;)V

    .line 939
    return-void

    .line 935
    :catchall_25f
    move-exception v2

    :try_start_260
    monitor-exit v3
    :try_end_261
    .catchall {:try_start_260 .. :try_end_261} :catchall_25f

    throw v2
.end method
