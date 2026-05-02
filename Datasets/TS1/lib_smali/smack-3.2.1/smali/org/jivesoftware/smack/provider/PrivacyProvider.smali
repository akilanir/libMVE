.class public Lorg/jivesoftware/smack/provider/PrivacyProvider;
.super Ljava/lang/Object;
.source "PrivacyProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    return-void
.end method


# virtual methods
.method public parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .registers 11
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 25
    new-instance v4, Lorg/jivesoftware/smack/packet/Privacy;

    invoke-direct {v4}, Lorg/jivesoftware/smack/packet/Privacy;-><init>()V

    .line 28
    .local v4, "privacy":Lorg/jivesoftware/smack/packet/Privacy;
    new-instance v5, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smack/packet/Privacy;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 29
    const/4 v2, 0x0

    .line 30
    .local v2, "done":Z
    :cond_17
    :goto_17
    if-nez v2, :cond_7d

    .line 31
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    .line 32
    .local v3, "eventType":I
    const/4 v5, 0x2

    if-ne v3, v5, :cond_6c

    .line 33
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "active"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3e

    .line 34
    const-string v5, ""

    const-string v6, "name"

    invoke-interface {p1, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 35
    .local v0, "activeName":Ljava/lang/String;
    if-nez v0, :cond_3a

    .line 36
    invoke-virtual {v4, v8}, Lorg/jivesoftware/smack/packet/Privacy;->setDeclineActiveList(Z)V

    goto :goto_17

    .line 38
    :cond_3a
    invoke-virtual {v4, v0}, Lorg/jivesoftware/smack/packet/Privacy;->setActiveName(Ljava/lang/String;)V

    goto :goto_17

    .line 41
    .end local v0    # "activeName":Ljava/lang/String;
    :cond_3e
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "default"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5c

    .line 42
    const-string v5, ""

    const-string v6, "name"

    invoke-interface {p1, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 43
    .local v1, "defaultName":Ljava/lang/String;
    if-nez v1, :cond_58

    .line 44
    invoke-virtual {v4, v8}, Lorg/jivesoftware/smack/packet/Privacy;->setDeclineDefaultList(Z)V

    goto :goto_17

    .line 46
    :cond_58
    invoke-virtual {v4, v1}, Lorg/jivesoftware/smack/packet/Privacy;->setDefaultName(Ljava/lang/String;)V

    goto :goto_17

    .line 49
    .end local v1    # "defaultName":Ljava/lang/String;
    :cond_5c
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "list"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    .line 50
    invoke-virtual {p0, p1, v4}, Lorg/jivesoftware/smack/provider/PrivacyProvider;->parseList(Lorg/xmlpull/v1/XmlPullParser;Lorg/jivesoftware/smack/packet/Privacy;)V

    goto :goto_17

    .line 53
    :cond_6c
    const/4 v5, 0x3

    if-ne v3, v5, :cond_17

    .line 54
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "query"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    .line 55
    const/4 v2, 0x1

    goto :goto_17

    .line 60
    .end local v3    # "eventType":I
    :cond_7d
    return-object v4
.end method

.method public parseItem(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PrivacyItem;
    .registers 13
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    .line 87
    const/4 v2, 0x0

    .line 89
    .local v2, "done":Z
    const-string v8, ""

    const-string v9, "action"

    invoke-interface {p1, v8, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 90
    .local v0, "actionValue":Ljava/lang/String;
    const-string v8, ""

    const-string v9, "order"

    invoke-interface {p1, v8, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 91
    .local v6, "orderValue":Ljava/lang/String;
    const-string v8, ""

    const-string v9, "type"

    invoke-interface {p1, v8, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 97
    .local v7, "type":Ljava/lang/String;
    const/4 v1, 0x1

    .line 98
    .local v1, "allow":Z
    const-string v8, "allow"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_7e

    .line 99
    const/4 v1, 0x1

    .line 104
    :cond_24
    :goto_24
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 107
    .local v5, "order":I
    new-instance v4, Lorg/jivesoftware/smack/packet/PrivacyItem;

    invoke-direct {v4, v7, v1, v5}, Lorg/jivesoftware/smack/packet/PrivacyItem;-><init>(Ljava/lang/String;ZI)V

    .line 108
    .local v4, "item":Lorg/jivesoftware/smack/packet/PrivacyItem;
    const-string v8, ""

    const-string v9, "value"

    invoke-interface {p1, v8, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Lorg/jivesoftware/smack/packet/PrivacyItem;->setValue(Ljava/lang/String;)V

    .line 110
    :cond_38
    :goto_38
    if-nez v2, :cond_99

    .line 111
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    .line 112
    .local v3, "eventType":I
    const/4 v8, 0x2

    if-ne v3, v8, :cond_88

    .line 113
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "iq"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_50

    .line 114
    invoke-virtual {v4, v10}, Lorg/jivesoftware/smack/packet/PrivacyItem;->setFilterIQ(Z)V

    .line 116
    :cond_50
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "message"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5f

    .line 117
    invoke-virtual {v4, v10}, Lorg/jivesoftware/smack/packet/PrivacyItem;->setFilterMessage(Z)V

    .line 119
    :cond_5f
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "presence-in"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6e

    .line 120
    invoke-virtual {v4, v10}, Lorg/jivesoftware/smack/packet/PrivacyItem;->setFilterPresence_in(Z)V

    .line 122
    :cond_6e
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "presence-out"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_38

    .line 123
    invoke-virtual {v4, v10}, Lorg/jivesoftware/smack/packet/PrivacyItem;->setFilterPresence_out(Z)V

    goto :goto_38

    .line 100
    .end local v3    # "eventType":I
    .end local v4    # "item":Lorg/jivesoftware/smack/packet/PrivacyItem;
    .end local v5    # "order":I
    :cond_7e
    const-string v8, "deny"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_24

    .line 101
    const/4 v1, 0x0

    goto :goto_24

    .line 126
    .restart local v3    # "eventType":I
    .restart local v4    # "item":Lorg/jivesoftware/smack/packet/PrivacyItem;
    .restart local v5    # "order":I
    :cond_88
    const/4 v8, 0x3

    if-ne v3, v8, :cond_38

    .line 127
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "item"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_38

    .line 128
    const/4 v2, 0x1

    goto :goto_38

    .line 132
    .end local v3    # "eventType":I
    :cond_99
    return-object v4
.end method

.method public parseList(Lorg/xmlpull/v1/XmlPullParser;Lorg/jivesoftware/smack/packet/Privacy;)V
    .registers 9
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "privacy"    # Lorg/jivesoftware/smack/packet/Privacy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 65
    const/4 v0, 0x0

    .line 66
    .local v0, "done":Z
    const-string v4, ""

    const-string v5, "name"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 67
    .local v3, "listName":Ljava/lang/String;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 68
    .local v2, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jivesoftware/smack/packet/PrivacyItem;>;"
    :cond_e
    :goto_e
    if-nez v0, :cond_3c

    .line 69
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 70
    .local v1, "eventType":I
    const/4 v4, 0x2

    if-ne v1, v4, :cond_2b

    .line 71
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "item"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 72
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/provider/PrivacyProvider;->parseItem(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PrivacyItem;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_e

    .line 75
    :cond_2b
    const/4 v4, 0x3

    if-ne v1, v4, :cond_e

    .line 76
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "list"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 77
    const/4 v0, 0x1

    goto :goto_e

    .line 82
    .end local v1    # "eventType":I
    :cond_3c
    invoke-virtual {p2, v3, v2}, Lorg/jivesoftware/smack/packet/Privacy;->setPrivacyList(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    .line 83
    return-void
.end method
