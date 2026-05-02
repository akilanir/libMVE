.class Lorg/jivesoftware/smack/Roster$PresencePacketListener;
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
    name = "PresencePacketListener"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smack/Roster;


# direct methods
.method private constructor <init>(Lorg/jivesoftware/smack/Roster;)V
    .registers 2

    .prologue
    .line 699
    iput-object p1, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/jivesoftware/smack/Roster;Lorg/jivesoftware/smack/Roster$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/jivesoftware/smack/Roster;
    .param p2, "x1"    # Lorg/jivesoftware/smack/Roster$1;

    .prologue
    .line 699
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/Roster$PresencePacketListener;-><init>(Lorg/jivesoftware/smack/Roster;)V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .registers 10
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 702
    move-object v3, p1

    check-cast v3, Lorg/jivesoftware/smack/packet/Presence;

    .line 703
    .local v3, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v1

    .line 704
    .local v1, "from":Ljava/lang/String;
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # invokes: Lorg/jivesoftware/smack/Roster;->getPresenceMapKey(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v6, v1}, Lorg/jivesoftware/smack/Roster;->access$400(Lorg/jivesoftware/smack/Roster;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 709
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v6

    sget-object v7, Lorg/jivesoftware/smack/packet/Presence$Type;->available:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-ne v6, v7, :cond_5c

    .line 712
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;
    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$500(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_4f

    .line 713
    new-instance v5, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v5}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 714
    .local v5, "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;
    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$500(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 721
    :goto_2f
    const-string v6, ""

    invoke-interface {v5, v6}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 723
    invoke-static {v1}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 725
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->entries:Ljava/util/Map;
    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$600(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/RosterEntry;

    .line 726
    .local v0, "entry":Lorg/jivesoftware/smack/RosterEntry;
    if-eqz v0, :cond_4e

    .line 727
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # invokes: Lorg/jivesoftware/smack/Roster;->fireRosterPresenceEvent(Lorg/jivesoftware/smack/packet/Presence;)V
    invoke-static {v6, v3}, Lorg/jivesoftware/smack/Roster;->access$700(Lorg/jivesoftware/smack/Roster;Lorg/jivesoftware/smack/packet/Presence;)V

    .line 808
    .end local v0    # "entry":Lorg/jivesoftware/smack/RosterEntry;
    .end local v5    # "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    :cond_4e
    :goto_4e
    return-void

    .line 717
    :cond_4f
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;
    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$500(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    .restart local v5    # "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    goto :goto_2f

    .line 731
    .end local v5    # "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    :cond_5c
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v6

    sget-object v7, Lorg/jivesoftware/smack/packet/Presence$Type;->unavailable:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-ne v6, v7, :cond_d0

    .line 734
    const-string v6, ""

    invoke-static {v1}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_b0

    .line 737
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;
    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$500(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_a3

    .line 738
    new-instance v5, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v5}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 739
    .restart local v5    # "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;
    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$500(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 744
    :goto_8a
    const-string v6, ""

    invoke-interface {v5, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 754
    .end local v5    # "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    :cond_8f
    :goto_8f
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->entries:Ljava/util/Map;
    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$600(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/RosterEntry;

    .line 755
    .restart local v0    # "entry":Lorg/jivesoftware/smack/RosterEntry;
    if-eqz v0, :cond_4e

    .line 756
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # invokes: Lorg/jivesoftware/smack/Roster;->fireRosterPresenceEvent(Lorg/jivesoftware/smack/packet/Presence;)V
    invoke-static {v6, v3}, Lorg/jivesoftware/smack/Roster;->access$700(Lorg/jivesoftware/smack/Roster;Lorg/jivesoftware/smack/packet/Presence;)V

    goto :goto_4e

    .line 742
    .end local v0    # "entry":Lorg/jivesoftware/smack/RosterEntry;
    :cond_a3
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;
    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$500(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    .restart local v5    # "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    goto :goto_8a

    .line 747
    .end local v5    # "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    :cond_b0
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;
    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$500(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_8f

    .line 748
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;
    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$500(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    .line 751
    .restart local v5    # "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    invoke-static {v1}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8f

    .line 759
    .end local v5    # "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    :cond_d0
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v6

    sget-object v7, Lorg/jivesoftware/smack/packet/Presence$Type;->subscribe:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-ne v6, v7, :cond_11e

    .line 760
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->subscriptionMode:Lorg/jivesoftware/smack/Roster$SubscriptionMode;
    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$800(Lorg/jivesoftware/smack/Roster;)Lorg/jivesoftware/smack/Roster$SubscriptionMode;

    move-result-object v6

    sget-object v7, Lorg/jivesoftware/smack/Roster$SubscriptionMode;->accept_all:Lorg/jivesoftware/smack/Roster$SubscriptionMode;

    if-ne v6, v7, :cond_fb

    .line 762
    new-instance v4, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v6, Lorg/jivesoftware/smack/packet/Presence$Type;->subscribed:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v4, v6}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 763
    .local v4, "response":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 764
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;
    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$300(Lorg/jivesoftware/smack/Roster;)Lorg/jivesoftware/smack/Connection;

    move-result-object v6

    invoke-virtual {v6, v4}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto/16 :goto_4e

    .line 766
    .end local v4    # "response":Lorg/jivesoftware/smack/packet/Presence;
    :cond_fb
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->subscriptionMode:Lorg/jivesoftware/smack/Roster$SubscriptionMode;
    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$800(Lorg/jivesoftware/smack/Roster;)Lorg/jivesoftware/smack/Roster$SubscriptionMode;

    move-result-object v6

    sget-object v7, Lorg/jivesoftware/smack/Roster$SubscriptionMode;->reject_all:Lorg/jivesoftware/smack/Roster$SubscriptionMode;

    if-ne v6, v7, :cond_4e

    .line 768
    new-instance v4, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v6, Lorg/jivesoftware/smack/packet/Presence$Type;->unsubscribed:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v4, v6}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 769
    .restart local v4    # "response":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 770
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;
    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$300(Lorg/jivesoftware/smack/Roster;)Lorg/jivesoftware/smack/Connection;

    move-result-object v6

    invoke-virtual {v6, v4}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto/16 :goto_4e

    .line 774
    .end local v4    # "response":Lorg/jivesoftware/smack/packet/Presence;
    :cond_11e
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v6

    sget-object v7, Lorg/jivesoftware/smack/packet/Presence$Type;->unsubscribe:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-ne v6, v7, :cond_149

    .line 775
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->subscriptionMode:Lorg/jivesoftware/smack/Roster$SubscriptionMode;
    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$800(Lorg/jivesoftware/smack/Roster;)Lorg/jivesoftware/smack/Roster$SubscriptionMode;

    move-result-object v6

    sget-object v7, Lorg/jivesoftware/smack/Roster$SubscriptionMode;->manual:Lorg/jivesoftware/smack/Roster$SubscriptionMode;

    if-eq v6, v7, :cond_4e

    .line 779
    new-instance v4, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v6, Lorg/jivesoftware/smack/packet/Presence$Type;->unsubscribed:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v4, v6}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 780
    .restart local v4    # "response":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 781
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;
    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$300(Lorg/jivesoftware/smack/Roster;)Lorg/jivesoftware/smack/Connection;

    move-result-object v6

    invoke-virtual {v6, v4}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto/16 :goto_4e

    .line 787
    .end local v4    # "response":Lorg/jivesoftware/smack/packet/Presence;
    :cond_149
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v6

    sget-object v7, Lorg/jivesoftware/smack/packet/Presence$Type;->error:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-ne v6, v7, :cond_4e

    const-string v6, ""

    invoke-static {v1}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4e

    .line 791
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;
    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$500(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_191

    .line 792
    new-instance v5, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v5}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 793
    .restart local v5    # "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;
    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$500(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 801
    :goto_177
    const-string v6, ""

    invoke-interface {v5, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 803
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->entries:Ljava/util/Map;
    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$600(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/RosterEntry;

    .line 804
    .restart local v0    # "entry":Lorg/jivesoftware/smack/RosterEntry;
    if-eqz v0, :cond_4e

    .line 805
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # invokes: Lorg/jivesoftware/smack/Roster;->fireRosterPresenceEvent(Lorg/jivesoftware/smack/packet/Presence;)V
    invoke-static {v6, v3}, Lorg/jivesoftware/smack/Roster;->access$700(Lorg/jivesoftware/smack/Roster;Lorg/jivesoftware/smack/packet/Presence;)V

    goto/16 :goto_4e

    .line 796
    .end local v0    # "entry":Lorg/jivesoftware/smack/RosterEntry;
    .end local v5    # "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    :cond_191
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    # getter for: Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;
    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$500(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    .line 798
    .restart local v5    # "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    invoke-interface {v5}, Ljava/util/Map;->clear()V

    goto :goto_177
.end method
