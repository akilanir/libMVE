.class public Lorg/jivesoftware/smack/util/PacketParserUtils;
.super Ljava/lang/Object;
.source "PacketParserUtils.java"


# static fields
.field private static final PROPERTIES_NAMESPACE:Ljava/lang/String; = "http://www.jivesoftware.com/xmlns/xmpp/properties"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static decode(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p0, "type"    # Ljava/lang/Class;
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 854
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "java.lang.String"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 875
    .end local p1    # "value":Ljava/lang/String;
    :goto_c
    return-object p1

    .line 857
    .restart local p1    # "value":Ljava/lang/String;
    :cond_d
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "boolean"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 858
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    goto :goto_c

    .line 860
    :cond_1e
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "int"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 861
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_c

    .line 863
    :cond_2f
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "long"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_40

    .line 864
    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    goto :goto_c

    .line 866
    :cond_40
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "float"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_51

    .line 867
    invoke-static {p1}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object p1

    goto :goto_c

    .line 869
    :cond_51
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "double"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_62

    .line 870
    invoke-static {p1}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object p1

    goto :goto_c

    .line 872
    :cond_62
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "java.lang.Class"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_73

    .line 873
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    goto :goto_c

    .line 875
    :cond_73
    const/4 p1, 0x0

    goto :goto_c
.end method

.method private static getLanguageAttribute(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;
    .registers 5
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    .line 805
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v2

    if-ge v1, v2, :cond_2f

    .line 806
    invoke-interface {p0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v0

    .line 807
    .local v0, "attributeName":Ljava/lang/String;
    const-string v2, "xml:lang"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_27

    const-string v2, "lang"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2c

    const-string v2, "xml"

    invoke-interface {p0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributePrefix(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 810
    :cond_27
    invoke-interface {p0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v2

    .line 813
    .end local v0    # "attributeName":Ljava/lang/String;
    :goto_2b
    return-object v2

    .line 805
    .restart local v0    # "attributeName":Ljava/lang/String;
    :cond_2c
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 813
    .end local v0    # "attributeName":Ljava/lang/String;
    :cond_2f
    const/4 v2, 0x0

    goto :goto_2b
.end method

.method private static parseAuthentication(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Authentication;
    .registers 6
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 361
    new-instance v0, Lorg/jivesoftware/smack/packet/Authentication;

    invoke-direct {v0}, Lorg/jivesoftware/smack/packet/Authentication;-><init>()V

    .line 362
    .local v0, "authentication":Lorg/jivesoftware/smack/packet/Authentication;
    const/4 v1, 0x0

    .line 363
    .local v1, "done":Z
    :cond_6
    :goto_6
    if-nez v1, :cond_70

    .line 364
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 365
    .local v2, "eventType":I
    const/4 v3, 0x2

    if-ne v2, v3, :cond_5f

    .line 366
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "username"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 367
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/packet/Authentication;->setUsername(Ljava/lang/String;)V

    goto :goto_6

    .line 369
    :cond_23
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "password"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_37

    .line 370
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/packet/Authentication;->setPassword(Ljava/lang/String;)V

    goto :goto_6

    .line 372
    :cond_37
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "digest"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4b

    .line 373
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/packet/Authentication;->setDigest(Ljava/lang/String;)V

    goto :goto_6

    .line 375
    :cond_4b
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "resource"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 376
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/packet/Authentication;->setResource(Ljava/lang/String;)V

    goto :goto_6

    .line 379
    :cond_5f
    const/4 v3, 0x3

    if-ne v2, v3, :cond_6

    .line 380
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "query"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 381
    const/4 v1, 0x1

    goto :goto_6

    .line 385
    .end local v2    # "eventType":I
    :cond_70
    return-object v0
.end method

.method public static parseCompressionMethods(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Collection;
    .registers 7
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 534
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 535
    .local v3, "methods":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 536
    .local v0, "done":Z
    :cond_6
    :goto_6
    if-nez v0, :cond_34

    .line 537
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 539
    .local v2, "eventType":I
    const/4 v4, 0x2

    if-ne v2, v4, :cond_23

    .line 540
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 541
    .local v1, "elementName":Ljava/lang/String;
    const-string v4, "method"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 542
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 545
    .end local v1    # "elementName":Ljava/lang/String;
    :cond_23
    const/4 v4, 0x3

    if-ne v2, v4, :cond_6

    .line 546
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "compression"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 547
    const/4 v0, 0x1

    goto :goto_6

    .line 551
    .end local v2    # "eventType":I
    :cond_34
    return-object v3
.end method

.method private static parseContent(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;
    .registers 5
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 163
    const-string v0, ""

    .line 164
    .local v0, "content":Ljava/lang/String;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v1

    .line 165
    .local v1, "parserDepth":I
    :goto_6
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_13

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v2

    if-eq v2, v1, :cond_29

    .line 167
    :cond_13
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 169
    :cond_29
    return-object v0
.end method

.method public static parseError(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/XMPPError;
    .registers 16
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 696
    const-string v9, "urn:ietf:params:xml:ns:xmpp-stanzas"

    .line 697
    .local v9, "errorNamespace":Ljava/lang/String;
    const-string v8, "-1"

    .line 698
    .local v8, "errorCode":Ljava/lang/String;
    const/4 v14, 0x0

    .line 699
    .local v14, "type":Ljava/lang/String;
    const/4 v4, 0x0

    .line 700
    .local v4, "message":Ljava/lang/String;
    const/4 v3, 0x0

    .line 701
    .local v3, "condition":Ljava/lang/String;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 704
    .local v5, "extensions":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/PacketExtension;>;"
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_d
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v0

    if-ge v11, v0, :cond_3e

    .line 705
    invoke-interface {p0, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "code"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 706
    const-string v0, ""

    const-string v1, "code"

    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 708
    :cond_27
    invoke-interface {p0, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "type"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3b

    .line 709
    const-string v0, ""

    const-string v1, "type"

    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 704
    :cond_3b
    add-int/lit8 v11, v11, 0x1

    goto :goto_d

    .line 712
    :cond_3e
    const/4 v6, 0x0

    .line 714
    .local v6, "done":Z
    :cond_3f
    :goto_3f
    if-nez v6, :cond_84

    .line 715
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v10

    .line 716
    .local v10, "eventType":I
    const/4 v0, 0x2

    if-ne v10, v0, :cond_73

    .line 717
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "text"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_59

    .line 718
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    goto :goto_3f

    .line 722
    :cond_59
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    .line 723
    .local v7, "elementName":Ljava/lang/String;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v13

    .line 724
    .local v13, "namespace":Ljava/lang/String;
    const-string v0, "urn:ietf:params:xml:ns:xmpp-stanzas"

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6b

    .line 725
    move-object v3, v7

    goto :goto_3f

    .line 728
    :cond_6b
    invoke-static {v7, v13, p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3f

    .line 732
    .end local v7    # "elementName":Ljava/lang/String;
    .end local v13    # "namespace":Ljava/lang/String;
    :cond_73
    const/4 v0, 0x3

    if-ne v10, v0, :cond_3f

    .line 733
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "error"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3f

    .line 734
    const/4 v6, 0x1

    goto :goto_3f

    .line 739
    .end local v10    # "eventType":I
    :cond_84
    sget-object v2, Lorg/jivesoftware/smack/packet/XMPPError$Type;->CANCEL:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    .line 741
    .local v2, "errorType":Lorg/jivesoftware/smack/packet/XMPPError$Type;
    if-eqz v14, :cond_90

    .line 742
    :try_start_88
    invoke-virtual {v14}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/jivesoftware/smack/packet/XMPPError$Type;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/XMPPError$Type;
    :try_end_8f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_88 .. :try_end_8f} :catch_9a

    move-result-object v2

    .line 749
    :cond_90
    :goto_90
    new-instance v0, Lorg/jivesoftware/smack/packet/XMPPError;

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-direct/range {v0 .. v5}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(ILorg/jivesoftware/smack/packet/XMPPError$Type;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    return-object v0

    .line 745
    :catch_9a
    move-exception v12

    .line 747
    .local v12, "iae":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v12}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_90
.end method

.method public static parseIQ(Lorg/xmlpull/v1/XmlPullParser;Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smack/packet/IQ;
    .registers 15
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 269
    const/4 v6, 0x0

    .line 271
    .local v6, "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    const-string v11, ""

    const-string v12, "id"

    invoke-interface {p0, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 272
    .local v5, "id":Ljava/lang/String;
    const-string v11, ""

    const-string v12, "to"

    invoke-interface {p0, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 273
    .local v9, "to":Ljava/lang/String;
    const-string v11, ""

    const-string v12, "from"

    invoke-interface {p0, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 274
    .local v4, "from":Ljava/lang/String;
    const-string v11, ""

    const-string v12, "type"

    invoke-interface {p0, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lorg/jivesoftware/smack/packet/IQ$Type;->fromString(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v10

    .line 275
    .local v10, "type":Lorg/jivesoftware/smack/packet/IQ$Type;
    const/4 v2, 0x0

    .line 277
    .local v2, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    const/4 v0, 0x0

    .line 278
    .local v0, "done":Z
    :cond_27
    :goto_27
    if-nez v0, :cond_cf

    .line 279
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    .line 281
    .local v3, "eventType":I
    const/4 v11, 0x2

    if-ne v3, v11, :cond_bd

    .line 282
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 283
    .local v1, "elementName":Ljava/lang/String;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v7

    .line 284
    .local v7, "namespace":Ljava/lang/String;
    const-string v11, "error"

    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_45

    .line 285
    invoke-static {p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseError(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v2

    goto :goto_27

    .line 287
    :cond_45
    const-string v11, "query"

    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5a

    const-string v11, "jabber:iq:auth"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5a

    .line 288
    invoke-static {p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseAuthentication(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Authentication;

    move-result-object v6

    goto :goto_27

    .line 290
    :cond_5a
    const-string v11, "query"

    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6f

    const-string v11, "jabber:iq:roster"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6f

    .line 291
    invoke-static {p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseRoster(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/RosterPacket;

    move-result-object v6

    goto :goto_27

    .line 293
    :cond_6f
    const-string v11, "query"

    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_84

    const-string v11, "jabber:iq:register"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_84

    .line 294
    invoke-static {p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseRegistration(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Registration;

    move-result-object v6

    goto :goto_27

    .line 296
    :cond_84
    const-string v11, "bind"

    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_99

    const-string v11, "urn:ietf:params:xml:ns:xmpp-bind"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_99

    .line 298
    invoke-static {p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseResourceBinding(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Bind;

    move-result-object v6

    goto :goto_27

    .line 303
    :cond_99
    invoke-static {}, Lorg/jivesoftware/smack/provider/ProviderManager;->getInstance()Lorg/jivesoftware/smack/provider/ProviderManager;

    move-result-object v11

    invoke-virtual {v11, v1, v7}, Lorg/jivesoftware/smack/provider/ProviderManager;->getIQProvider(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    .line 304
    .local v8, "provider":Ljava/lang/Object;
    if-eqz v8, :cond_27

    .line 305
    instance-of v11, v8, Lorg/jivesoftware/smack/provider/IQProvider;

    if-eqz v11, :cond_af

    .line 306
    check-cast v8, Lorg/jivesoftware/smack/provider/IQProvider;

    .end local v8    # "provider":Ljava/lang/Object;
    invoke-interface {v8, p0}, Lorg/jivesoftware/smack/provider/IQProvider;->parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v6

    goto/16 :goto_27

    .line 308
    .restart local v8    # "provider":Ljava/lang/Object;
    :cond_af
    instance-of v11, v8, Ljava/lang/Class;

    if-eqz v11, :cond_27

    .line 309
    check-cast v8, Ljava/lang/Class;

    .end local v8    # "provider":Ljava/lang/Object;
    invoke-static {v1, v8, p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseWithIntrospection(Ljava/lang/String;Ljava/lang/Class;Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    check-cast v6, Lorg/jivesoftware/smack/packet/IQ;

    .restart local v6    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    goto/16 :goto_27

    .line 315
    .end local v1    # "elementName":Ljava/lang/String;
    .end local v7    # "namespace":Ljava/lang/String;
    :cond_bd
    const/4 v11, 0x3

    if-ne v3, v11, :cond_27

    .line 316
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "iq"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_27

    .line 317
    const/4 v0, 0x1

    goto/16 :goto_27

    .line 322
    .end local v3    # "eventType":I
    :cond_cf
    if-nez v6, :cond_100

    .line 323
    sget-object v11, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-eq v11, v10, :cond_d9

    sget-object v11, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v11, v10, :cond_fb

    .line 327
    :cond_d9
    new-instance v6, Lorg/jivesoftware/smack/util/PacketParserUtils$1;

    .end local v6    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    invoke-direct {v6}, Lorg/jivesoftware/smack/util/PacketParserUtils$1;-><init>()V

    .line 332
    .restart local v6    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v6, v5}, Lorg/jivesoftware/smack/packet/IQ;->setPacketID(Ljava/lang/String;)V

    .line 333
    invoke-virtual {v6, v4}, Lorg/jivesoftware/smack/packet/IQ;->setTo(Ljava/lang/String;)V

    .line 334
    invoke-virtual {v6, v9}, Lorg/jivesoftware/smack/packet/IQ;->setFrom(Ljava/lang/String;)V

    .line 335
    sget-object v11, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v6, v11}, Lorg/jivesoftware/smack/packet/IQ;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 336
    new-instance v11, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v12, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->feature_not_implemented:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    invoke-direct {v11, v12}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;)V

    invoke-virtual {v6, v11}, Lorg/jivesoftware/smack/packet/IQ;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    .line 337
    invoke-virtual {p1, v6}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 338
    const/4 v11, 0x0

    .line 357
    :goto_fa
    return-object v11

    .line 342
    :cond_fb
    new-instance v6, Lorg/jivesoftware/smack/util/PacketParserUtils$2;

    .end local v6    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    invoke-direct {v6}, Lorg/jivesoftware/smack/util/PacketParserUtils$2;-><init>()V

    .line 351
    .restart local v6    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    :cond_100
    invoke-virtual {v6, v5}, Lorg/jivesoftware/smack/packet/IQ;->setPacketID(Ljava/lang/String;)V

    .line 352
    invoke-virtual {v6, v9}, Lorg/jivesoftware/smack/packet/IQ;->setTo(Ljava/lang/String;)V

    .line 353
    invoke-virtual {v6, v4}, Lorg/jivesoftware/smack/packet/IQ;->setFrom(Ljava/lang/String;)V

    .line 354
    invoke-virtual {v6, v10}, Lorg/jivesoftware/smack/packet/IQ;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 355
    invoke-virtual {v6, v2}, Lorg/jivesoftware/smack/packet/IQ;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    move-object v11, v6

    .line 357
    goto :goto_fa
.end method

.method public static parseMechanisms(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Collection;
    .registers 7
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 505
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 506
    .local v3, "mechanisms":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 507
    .local v0, "done":Z
    :cond_6
    :goto_6
    if-nez v0, :cond_34

    .line 508
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 510
    .local v2, "eventType":I
    const/4 v4, 0x2

    if-ne v2, v4, :cond_23

    .line 511
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 512
    .local v1, "elementName":Ljava/lang/String;
    const-string v4, "mechanism"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 513
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 516
    .end local v1    # "elementName":Ljava/lang/String;
    :cond_23
    const/4 v4, 0x3

    if-ne v2, v4, :cond_6

    .line 517
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "mechanisms"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 518
    const/4 v0, 0x1

    goto :goto_6

    .line 522
    .end local v2    # "eventType":I
    :cond_34
    return-object v3
.end method

.method public static parseMessage(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Packet;
    .registers 21
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 64
    new-instance v11, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v11}, Lorg/jivesoftware/smack/packet/Message;-><init>()V

    .line 65
    .local v11, "message":Lorg/jivesoftware/smack/packet/Message;
    const-string v18, ""

    const-string v19, "id"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 66
    .local v9, "id":Ljava/lang/String;
    if-nez v9, :cond_17

    const-string v9, "ID_NOT_AVAILABLE"

    .end local v9    # "id":Ljava/lang/String;
    :cond_17
    invoke-virtual {v11, v9}, Lorg/jivesoftware/smack/packet/Message;->setPacketID(Ljava/lang/String;)V

    .line 67
    const-string v18, ""

    const-string v19, "to"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smack/packet/Message;->setTo(Ljava/lang/String;)V

    .line 68
    const-string v18, ""

    const-string v19, "from"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smack/packet/Message;->setFrom(Ljava/lang/String;)V

    .line 69
    const-string v18, ""

    const-string v19, "type"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lorg/jivesoftware/smack/packet/Message$Type;->fromString(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Message$Type;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smack/packet/Message;->setType(Lorg/jivesoftware/smack/packet/Message$Type;)V

    .line 70
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getLanguageAttribute(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v10

    .line 73
    .local v10, "language":Ljava/lang/String;
    const/4 v4, 0x0

    .line 74
    .local v4, "defaultLanguage":Ljava/lang/String;
    if-eqz v10, :cond_aa

    const-string v18, ""

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_aa

    .line 75
    invoke-virtual {v11, v10}, Lorg/jivesoftware/smack/packet/Message;->setLanguage(Ljava/lang/String;)V

    .line 76
    move-object v4, v10

    .line 85
    :goto_6e
    const/4 v5, 0x0

    .line 86
    .local v5, "done":Z
    const/16 v16, 0x0

    .line 87
    .local v16, "thread":Ljava/lang/String;
    const/4 v14, 0x0

    .line 88
    .local v14, "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_72
    :goto_72
    if-nez v5, :cond_135

    .line 89
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v7

    .line 90
    .local v7, "eventType":I
    const/16 v18, 0x2

    move/from16 v0, v18

    if-ne v7, v0, :cond_120

    .line 91
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    .line 92
    .local v6, "elementName":Ljava/lang/String;
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v13

    .line 93
    .local v13, "namespace":Ljava/lang/String;
    const-string v18, "subject"

    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_af

    .line 94
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getLanguageAttribute(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v17

    .line 95
    .local v17, "xmlLang":Ljava/lang/String;
    if-nez v17, :cond_98

    .line 96
    move-object/from16 v17, v4

    .line 99
    :cond_98
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseContent(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v15

    .line 101
    .local v15, "subject":Ljava/lang/String;
    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smack/packet/Message;->getSubject(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    if-nez v18, :cond_72

    .line 102
    move-object/from16 v0, v17

    invoke-virtual {v11, v0, v15}, Lorg/jivesoftware/smack/packet/Message;->addSubject(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Message$Subject;

    goto :goto_72

    .line 79
    .end local v5    # "done":Z
    .end local v6    # "elementName":Ljava/lang/String;
    .end local v7    # "eventType":I
    .end local v13    # "namespace":Ljava/lang/String;
    .end local v14    # "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v15    # "subject":Ljava/lang/String;
    .end local v16    # "thread":Ljava/lang/String;
    .end local v17    # "xmlLang":Ljava/lang/String;
    :cond_aa
    invoke-static {}, Lorg/jivesoftware/smack/packet/Packet;->getDefaultLanguage()Ljava/lang/String;

    move-result-object v4

    goto :goto_6e

    .line 105
    .restart local v5    # "done":Z
    .restart local v6    # "elementName":Ljava/lang/String;
    .restart local v7    # "eventType":I
    .restart local v13    # "namespace":Ljava/lang/String;
    .restart local v14    # "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v16    # "thread":Ljava/lang/String;
    :cond_af
    const-string v18, "body"

    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_d3

    .line 106
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getLanguageAttribute(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v17

    .line 107
    .restart local v17    # "xmlLang":Ljava/lang/String;
    if-nez v17, :cond_c1

    .line 108
    move-object/from16 v17, v4

    .line 111
    :cond_c1
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseContent(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v3

    .line 113
    .local v3, "body":Ljava/lang/String;
    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smack/packet/Message;->getBody(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    if-nez v18, :cond_72

    .line 114
    move-object/from16 v0, v17

    invoke-virtual {v11, v0, v3}, Lorg/jivesoftware/smack/packet/Message;->addBody(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Message$Body;

    goto :goto_72

    .line 117
    .end local v3    # "body":Ljava/lang/String;
    .end local v17    # "xmlLang":Ljava/lang/String;
    :cond_d3
    const-string v18, "thread"

    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_e4

    .line 118
    if-nez v16, :cond_72

    .line 119
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v16

    goto :goto_72

    .line 122
    :cond_e4
    const-string v18, "error"

    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_f9

    .line 123
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseError(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smack/packet/Message;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    goto/16 :goto_72

    .line 125
    :cond_f9
    const-string v18, "properties"

    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_113

    const-string v18, "http://www.jivesoftware.com/xmlns/xmpp/properties"

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_113

    .line 128
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseProperties(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Map;

    move-result-object v14

    goto/16 :goto_72

    .line 132
    :cond_113
    move-object/from16 v0, p0

    invoke-static {v6, v13, v0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smack/packet/Message;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    goto/16 :goto_72

    .line 136
    .end local v6    # "elementName":Ljava/lang/String;
    .end local v13    # "namespace":Ljava/lang/String;
    :cond_120
    const/16 v18, 0x3

    move/from16 v0, v18

    if-ne v7, v0, :cond_72

    .line 137
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v18

    const-string v19, "message"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_72

    .line 138
    const/4 v5, 0x1

    goto/16 :goto_72

    .line 143
    .end local v7    # "eventType":I
    :cond_135
    move-object/from16 v0, v16

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smack/packet/Message;->setThread(Ljava/lang/String;)V

    .line 145
    if-eqz v14, :cond_15a

    .line 146
    invoke-interface {v14}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_144
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_15a

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 147
    .local v12, "name":Ljava/lang/String;
    invoke-interface {v14, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v11, v12, v0}, Lorg/jivesoftware/smack/packet/Message;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_144

    .line 150
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v12    # "name":Ljava/lang/String;
    :cond_15a
    return-object v11
.end method

.method public static parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;
    .registers 10
    .param p0, "elementName"    # Ljava/lang/String;
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 765
    invoke-static {}, Lorg/jivesoftware/smack/provider/ProviderManager;->getInstance()Lorg/jivesoftware/smack/provider/ProviderManager;

    move-result-object v6

    invoke-virtual {v6, p0, p1}, Lorg/jivesoftware/smack/provider/ProviderManager;->getExtensionProvider(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 766
    .local v4, "provider":Ljava/lang/Object;
    if-eqz v4, :cond_22

    .line 767
    instance-of v6, v4, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;

    if-eqz v6, :cond_15

    .line 768
    check-cast v4, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;

    .end local v4    # "provider":Ljava/lang/Object;
    invoke-interface {v4, p2}, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;->parseExtension(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v6

    .line 801
    :goto_14
    return-object v6

    .line 770
    .restart local v4    # "provider":Ljava/lang/Object;
    :cond_15
    instance-of v6, v4, Ljava/lang/Class;

    if-eqz v6, :cond_22

    .line 771
    check-cast v4, Ljava/lang/Class;

    .end local v4    # "provider":Ljava/lang/Object;
    invoke-static {p0, v4, p2}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseWithIntrospection(Ljava/lang/String;Ljava/lang/Class;Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jivesoftware/smack/packet/PacketExtension;

    goto :goto_14

    .line 776
    .restart local v4    # "provider":Ljava/lang/Object;
    :cond_22
    new-instance v2, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;

    invoke-direct {v2, p0, p1}, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 777
    .local v2, "extension":Lorg/jivesoftware/smack/packet/DefaultPacketExtension;
    const/4 v0, 0x0

    .line 778
    .local v0, "done":Z
    :cond_28
    :goto_28
    if-nez v0, :cond_5f

    .line 779
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 780
    .local v1, "eventType":I
    const/4 v6, 0x2

    if-ne v1, v6, :cond_50

    .line 781
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 783
    .local v3, "name":Ljava/lang/String;
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->isEmptyElementTag()Z

    move-result v6

    if-eqz v6, :cond_41

    .line 784
    const-string v6, ""

    invoke-virtual {v2, v3, v6}, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_28

    .line 788
    :cond_41
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 789
    const/4 v6, 0x4

    if-ne v1, v6, :cond_28

    .line 790
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v5

    .line 791
    .local v5, "value":Ljava/lang/String;
    invoke-virtual {v2, v3, v5}, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_28

    .line 795
    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :cond_50
    const/4 v6, 0x3

    if-ne v1, v6, :cond_28

    .line 796
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_28

    .line 797
    const/4 v0, 0x1

    goto :goto_28

    .end local v1    # "eventType":I
    :cond_5f
    move-object v6, v2

    .line 801
    goto :goto_14
.end method

.method public static parsePresence(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Presence;
    .registers 22
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 180
    sget-object v16, Lorg/jivesoftware/smack/packet/Presence$Type;->available:Lorg/jivesoftware/smack/packet/Presence$Type;

    .line 181
    .local v16, "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    const-string v18, ""

    const-string v19, "type"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 182
    .local v17, "typeString":Ljava/lang/String;
    if-eqz v17, :cond_1e

    const-string v18, ""

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_1e

    .line 184
    :try_start_1a
    invoke-static/range {v17 .. v17}, Lorg/jivesoftware/smack/packet/Presence$Type;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Presence$Type;
    :try_end_1d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1a .. :try_end_1d} :catch_a7

    move-result-object v16

    .line 190
    :cond_1e
    :goto_1e
    new-instance v13, Lorg/jivesoftware/smack/packet/Presence;

    move-object/from16 v0, v16

    invoke-direct {v13, v0}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 191
    .local v13, "presence":Lorg/jivesoftware/smack/packet/Presence;
    const-string v18, ""

    const-string v19, "to"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 192
    const-string v18, ""

    const-string v19, "from"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lorg/jivesoftware/smack/packet/Presence;->setFrom(Ljava/lang/String;)V

    .line 193
    const-string v18, ""

    const-string v19, "id"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 194
    .local v8, "id":Ljava/lang/String;
    if-nez v8, :cond_c6

    const-string v18, "ID_NOT_AVAILABLE"

    :goto_5d
    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lorg/jivesoftware/smack/packet/Presence;->setPacketID(Ljava/lang/String;)V

    .line 196
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getLanguageAttribute(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v9

    .line 197
    .local v9, "language":Ljava/lang/String;
    if-eqz v9, :cond_77

    const-string v18, ""

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_77

    .line 198
    invoke-virtual {v13, v9}, Lorg/jivesoftware/smack/packet/Presence;->setLanguage(Ljava/lang/String;)V

    .line 200
    :cond_77
    if-nez v8, :cond_7b

    const-string v8, "ID_NOT_AVAILABLE"

    .end local v8    # "id":Ljava/lang/String;
    :cond_7b
    invoke-virtual {v13, v8}, Lorg/jivesoftware/smack/packet/Presence;->setPacketID(Ljava/lang/String;)V

    .line 203
    const/4 v3, 0x0

    .line 204
    .local v3, "done":Z
    :cond_7f
    :goto_7f
    if-nez v3, :cond_18d

    .line 205
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v5

    .line 206
    .local v5, "eventType":I
    const/16 v18, 0x2

    move/from16 v0, v18

    if-ne v5, v0, :cond_178

    .line 207
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    .line 208
    .local v4, "elementName":Ljava/lang/String;
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v12

    .line 209
    .local v12, "namespace":Ljava/lang/String;
    const-string v18, "status"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_c9

    .line 210
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lorg/jivesoftware/smack/packet/Presence;->setStatus(Ljava/lang/String;)V

    goto :goto_7f

    .line 186
    .end local v3    # "done":Z
    .end local v4    # "elementName":Ljava/lang/String;
    .end local v5    # "eventType":I
    .end local v9    # "language":Ljava/lang/String;
    .end local v12    # "namespace":Ljava/lang/String;
    .end local v13    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    :catch_a7
    move-exception v7

    .line 187
    .local v7, "iae":Ljava/lang/IllegalArgumentException;
    sget-object v18, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Found invalid presence type "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_1e

    .end local v7    # "iae":Ljava/lang/IllegalArgumentException;
    .restart local v8    # "id":Ljava/lang/String;
    .restart local v13    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    :cond_c6
    move-object/from16 v18, v8

    .line 194
    goto :goto_5d

    .line 212
    .end local v8    # "id":Ljava/lang/String;
    .restart local v3    # "done":Z
    .restart local v4    # "elementName":Ljava/lang/String;
    .restart local v5    # "eventType":I
    .restart local v9    # "language":Ljava/lang/String;
    .restart local v12    # "namespace":Ljava/lang/String;
    :cond_c9
    const-string v18, "priority"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_ea

    .line 214
    :try_start_d3
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    .line 215
    .local v14, "priority":I
    invoke-virtual {v13, v14}, Lorg/jivesoftware/smack/packet/Presence;->setPriority(I)V
    :try_end_de
    .catch Ljava/lang/NumberFormatException; {:try_start_d3 .. :try_end_de} :catch_df
    .catch Ljava/lang/IllegalArgumentException; {:try_start_d3 .. :try_end_de} :catch_e1

    goto :goto_7f

    .line 217
    .end local v14    # "priority":I
    :catch_df
    move-exception v18

    goto :goto_7f

    .line 220
    :catch_e1
    move-exception v7

    .line 222
    .restart local v7    # "iae":Ljava/lang/IllegalArgumentException;
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v13, v0}, Lorg/jivesoftware/smack/packet/Presence;->setPriority(I)V

    goto :goto_7f

    .line 225
    .end local v7    # "iae":Ljava/lang/IllegalArgumentException;
    :cond_ea
    const-string v18, "show"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_120

    .line 226
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v10

    .line 228
    .local v10, "modeText":Ljava/lang/String;
    :try_start_f8
    invoke-static {v10}, Lorg/jivesoftware/smack/packet/Presence$Mode;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Presence$Mode;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lorg/jivesoftware/smack/packet/Presence;->setMode(Lorg/jivesoftware/smack/packet/Presence$Mode;)V
    :try_end_101
    .catch Ljava/lang/IllegalArgumentException; {:try_start_f8 .. :try_end_101} :catch_103

    goto/16 :goto_7f

    .line 230
    :catch_103
    move-exception v7

    .line 231
    .restart local v7    # "iae":Ljava/lang/IllegalArgumentException;
    sget-object v18, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Found invalid presence mode "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_7f

    .line 234
    .end local v7    # "iae":Ljava/lang/IllegalArgumentException;
    .end local v10    # "modeText":Ljava/lang/String;
    :cond_120
    const-string v18, "error"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_135

    .line 235
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseError(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lorg/jivesoftware/smack/packet/Presence;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    goto/16 :goto_7f

    .line 237
    :cond_135
    const-string v18, "properties"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_16b

    const-string v18, "http://www.jivesoftware.com/xmlns/xmpp/properties"

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_16b

    .line 240
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseProperties(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Map;

    move-result-object v15

    .line 242
    .local v15, "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v15}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_155
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_7f

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 243
    .local v11, "name":Ljava/lang/String;
    invoke-interface {v15, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v13, v11, v0}, Lorg/jivesoftware/smack/packet/Presence;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_155

    .line 248
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v11    # "name":Ljava/lang/String;
    .end local v15    # "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_16b
    move-object/from16 v0, p0

    invoke-static {v4, v12, v0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lorg/jivesoftware/smack/packet/Presence;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    goto/16 :goto_7f

    .line 252
    .end local v4    # "elementName":Ljava/lang/String;
    .end local v12    # "namespace":Ljava/lang/String;
    :cond_178
    const/16 v18, 0x3

    move/from16 v0, v18

    if-ne v5, v0, :cond_7f

    .line 253
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v18

    const-string v19, "presence"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_7f

    .line 254
    const/4 v3, 0x1

    goto/16 :goto_7f

    .line 258
    .end local v5    # "eventType":I
    :cond_18d
    return-object v13
.end method

.method public static parseProperties(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Map;
    .registers 16
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v14, 0x3

    const/4 v13, 0x2

    .line 566
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 568
    .local v7, "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_7
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v4

    .line 569
    .local v4, "eventType":I
    if-ne v4, v13, :cond_cd

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "property"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_cd

    .line 571
    const/4 v1, 0x0

    .line 572
    .local v1, "done":Z
    const/4 v6, 0x0

    .line 573
    .local v6, "name":Ljava/lang/String;
    const/4 v8, 0x0

    .line 574
    .local v8, "type":Ljava/lang/String;
    const/4 v10, 0x0

    .line 575
    .local v10, "valueText":Ljava/lang/String;
    const/4 v9, 0x0

    .line 576
    :cond_1e
    :goto_1e
    if-nez v1, :cond_7

    .line 577
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v4

    .line 578
    if-ne v4, v13, :cond_4c

    .line 579
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 580
    .local v3, "elementName":Ljava/lang/String;
    const-string v11, "name"

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_37

    .line 581
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v6

    goto :goto_1e

    .line 583
    :cond_37
    const-string v11, "value"

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1e

    .line 584
    const-string v11, ""

    const-string v12, "type"

    invoke-interface {p0, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 585
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v10

    goto :goto_1e

    .line 588
    .end local v3    # "elementName":Ljava/lang/String;
    :cond_4c
    if-ne v4, v14, :cond_1e

    .line 589
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "property"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1e

    .line 590
    const-string v11, "integer"

    invoke-virtual {v11, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6f

    .line 591
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    .line 618
    :cond_66
    :goto_66
    if-eqz v6, :cond_6d

    if-eqz v9, :cond_6d

    .line 619
    invoke-interface {v7, v6, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 621
    :cond_6d
    const/4 v1, 0x1

    goto :goto_1e

    .line 593
    :cond_6f
    const-string v11, "long"

    invoke-virtual {v11, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_7c

    .line 594
    invoke-static {v10}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v9

    .local v9, "value":Ljava/lang/Long;
    goto :goto_66

    .line 596
    .end local v9    # "value":Ljava/lang/Long;
    :cond_7c
    const-string v11, "float"

    invoke-virtual {v11, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_89

    .line 597
    invoke-static {v10}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v9

    .local v9, "value":Ljava/lang/Float;
    goto :goto_66

    .line 599
    .end local v9    # "value":Ljava/lang/Float;
    :cond_89
    const-string v11, "double"

    invoke-virtual {v11, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_96

    .line 600
    invoke-static {v10}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v9

    .local v9, "value":Ljava/lang/Double;
    goto :goto_66

    .line 602
    .end local v9    # "value":Ljava/lang/Double;
    :cond_96
    const-string v11, "boolean"

    invoke-virtual {v11, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_a3

    .line 603
    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v9

    .local v9, "value":Ljava/lang/Boolean;
    goto :goto_66

    .line 605
    .end local v9    # "value":Ljava/lang/Boolean;
    :cond_a3
    const-string v11, "string"

    invoke-virtual {v11, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_ad

    .line 606
    move-object v9, v10

    .local v9, "value":Ljava/lang/String;
    goto :goto_66

    .line 608
    .end local v9    # "value":Ljava/lang/String;
    :cond_ad
    const-string v11, "java-object"

    invoke-virtual {v11, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_66

    .line 610
    :try_start_b5
    invoke-static {v10}, Lorg/jivesoftware/smack/util/StringUtils;->decodeBase64(Ljava/lang/String;)[B

    move-result-object v0

    .line 611
    .local v0, "bytes":[B
    new-instance v5, Ljava/io/ObjectInputStream;

    new-instance v11, Ljava/io/ByteArrayInputStream;

    invoke-direct {v11, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v5, v11}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 612
    .local v5, "in":Ljava/io/ObjectInputStream;
    invoke-virtual {v5}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;
    :try_end_c6
    .catch Ljava/lang/Exception; {:try_start_b5 .. :try_end_c6} :catch_c8

    move-result-object v9

    .local v9, "value":Ljava/lang/Object;
    goto :goto_66

    .line 614
    .end local v0    # "bytes":[B
    .end local v5    # "in":Ljava/io/ObjectInputStream;
    .end local v9    # "value":Ljava/lang/Object;
    :catch_c8
    move-exception v2

    .line 615
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_66

    .line 626
    .end local v1    # "done":Z
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v6    # "name":Ljava/lang/String;
    .end local v8    # "type":Ljava/lang/String;
    .end local v10    # "valueText":Ljava/lang/String;
    :cond_cd
    if-ne v4, v14, :cond_7

    .line 627
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "properties"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 632
    return-object v7
.end method

.method private static parseRegistration(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Registration;
    .registers 9
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 429
    new-instance v4, Lorg/jivesoftware/smack/packet/Registration;

    invoke-direct {v4}, Lorg/jivesoftware/smack/packet/Registration;-><init>()V

    .line 430
    .local v4, "registration":Lorg/jivesoftware/smack/packet/Registration;
    const/4 v2, 0x0

    .line 431
    .local v2, "fields":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 432
    .local v0, "done":Z
    :cond_7
    :goto_7
    if-nez v0, :cond_65

    .line 433
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 434
    .local v1, "eventType":I
    const/4 v6, 0x2

    if-ne v1, v6, :cond_54

    .line 437
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v6

    const-string v7, "jabber:iq:register"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_44

    .line 438
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 439
    .local v3, "name":Ljava/lang/String;
    const-string v5, ""

    .line 440
    .local v5, "value":Ljava/lang/String;
    if-nez v2, :cond_29

    .line 441
    new-instance v2, Ljava/util/HashMap;

    .end local v2    # "fields":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 444
    .restart local v2    # "fields":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_29
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v6

    const/4 v7, 0x4

    if-ne v6, v7, :cond_34

    .line 445
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v5

    .line 448
    :cond_34
    const-string v6, "instructions"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_40

    .line 449
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_7

    .line 452
    :cond_40
    invoke-virtual {v4, v5}, Lorg/jivesoftware/smack/packet/Registration;->setInstructions(Ljava/lang/String;)V

    goto :goto_7

    .line 457
    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :cond_44
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v6

    invoke-virtual {v4, v6}, Lorg/jivesoftware/smack/packet/Registration;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    goto :goto_7

    .line 464
    :cond_54
    const/4 v6, 0x3

    if-ne v1, v6, :cond_7

    .line 465
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "query"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 466
    const/4 v0, 0x1

    goto :goto_7

    .line 470
    .end local v1    # "eventType":I
    :cond_65
    invoke-virtual {v4, v2}, Lorg/jivesoftware/smack/packet/Registration;->setAttributes(Ljava/util/Map;)V

    .line 471
    return-object v4
.end method

.method private static parseResourceBinding(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Bind;
    .registers 6
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 476
    new-instance v0, Lorg/jivesoftware/smack/packet/Bind;

    invoke-direct {v0}, Lorg/jivesoftware/smack/packet/Bind;-><init>()V

    .line 477
    .local v0, "bind":Lorg/jivesoftware/smack/packet/Bind;
    const/4 v1, 0x0

    .line 478
    .local v1, "done":Z
    :cond_6
    :goto_6
    if-nez v1, :cond_48

    .line 479
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 480
    .local v2, "eventType":I
    const/4 v3, 0x2

    if-ne v2, v3, :cond_37

    .line 481
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "resource"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 482
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/packet/Bind;->setResource(Ljava/lang/String;)V

    goto :goto_6

    .line 484
    :cond_23
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "jid"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 485
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/packet/Bind;->setJid(Ljava/lang/String;)V

    goto :goto_6

    .line 487
    :cond_37
    const/4 v3, 0x3

    if-ne v2, v3, :cond_6

    .line 488
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "bind"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 489
    const/4 v1, 0x1

    goto :goto_6

    .line 494
    .end local v2    # "eventType":I
    :cond_48
    return-object v0
.end method

.method private static parseRoster(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/RosterPacket;
    .registers 14
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 389
    new-instance v7, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v7}, Lorg/jivesoftware/smack/packet/RosterPacket;-><init>()V

    .line 390
    .local v7, "roster":Lorg/jivesoftware/smack/packet/RosterPacket;
    const/4 v1, 0x0

    .line 391
    .local v1, "done":Z
    const/4 v4, 0x0

    .line 392
    .local v4, "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    :cond_7
    :goto_7
    if-nez v1, :cond_97

    .line 393
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 394
    .local v2, "eventType":I
    const/4 v11, 0x2

    if-ne v2, v11, :cond_76

    .line 395
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "item"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_51

    .line 396
    const-string v11, ""

    const-string v12, "jid"

    invoke-interface {p0, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 397
    .local v5, "jid":Ljava/lang/String;
    const-string v11, ""

    const-string v12, "name"

    invoke-interface {p0, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 399
    .local v6, "name":Ljava/lang/String;
    new-instance v4, Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    .end local v4    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    invoke-direct {v4, v5, v6}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 401
    .restart local v4    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    const-string v11, ""

    const-string v12, "ask"

    invoke-interface {p0, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 402
    .local v0, "ask":Ljava/lang/String;
    invoke-static {v0}, Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;->fromString(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    move-result-object v8

    .line 403
    .local v8, "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    invoke-virtual {v4, v8}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setItemStatus(Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;)V

    .line 405
    const-string v11, ""

    const-string v12, "subscription"

    invoke-interface {p0, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 406
    .local v9, "subscription":Ljava/lang/String;
    if-eqz v9, :cond_73

    .end local v9    # "subscription":Ljava/lang/String;
    :goto_4a
    invoke-static {v9}, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-result-object v10

    .line 407
    .local v10, "type":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    invoke-virtual {v4, v10}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setItemType(Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;)V

    .line 409
    .end local v0    # "ask":Ljava/lang/String;
    .end local v5    # "jid":Ljava/lang/String;
    .end local v6    # "name":Ljava/lang/String;
    .end local v8    # "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    .end local v10    # "type":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    :cond_51
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "group"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_7

    if-eqz v4, :cond_7

    .line 410
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    .line 411
    .local v3, "groupName":Ljava/lang/String;
    if-eqz v3, :cond_7

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    if-lez v11, :cond_7

    .line 412
    invoke-virtual {v4, v3}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->addGroupName(Ljava/lang/String;)V

    goto :goto_7

    .line 406
    .end local v3    # "groupName":Ljava/lang/String;
    .restart local v0    # "ask":Ljava/lang/String;
    .restart local v5    # "jid":Ljava/lang/String;
    .restart local v6    # "name":Ljava/lang/String;
    .restart local v8    # "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    .restart local v9    # "subscription":Ljava/lang/String;
    :cond_73
    const-string v9, "none"

    goto :goto_4a

    .line 416
    .end local v0    # "ask":Ljava/lang/String;
    .end local v5    # "jid":Ljava/lang/String;
    .end local v6    # "name":Ljava/lang/String;
    .end local v8    # "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    .end local v9    # "subscription":Ljava/lang/String;
    :cond_76
    const/4 v11, 0x3

    if-ne v2, v11, :cond_7

    .line 417
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "item"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_88

    .line 418
    invoke-virtual {v7, v4}, Lorg/jivesoftware/smack/packet/RosterPacket;->addRosterItem(Lorg/jivesoftware/smack/packet/RosterPacket$Item;)V

    .line 420
    :cond_88
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "query"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 421
    const/4 v1, 0x1

    goto/16 :goto_7

    .line 425
    .end local v2    # "eventType":I
    :cond_97
    return-object v7
.end method

.method public static parseSASLFailure(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/sasl/SASLMechanism$Failure;
    .registers 6
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 643
    const/4 v0, 0x0

    .line 644
    .local v0, "condition":Ljava/lang/String;
    const/4 v1, 0x0

    .line 645
    .local v1, "done":Z
    :cond_2
    :goto_2
    if-nez v1, :cond_2d

    .line 646
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 648
    .local v2, "eventType":I
    const/4 v3, 0x2

    if-ne v2, v3, :cond_1c

    .line 649
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "failure"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 650
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 653
    :cond_1c
    const/4 v3, 0x3

    if-ne v2, v3, :cond_2

    .line 654
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "failure"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 655
    const/4 v1, 0x1

    goto :goto_2

    .line 659
    .end local v2    # "eventType":I
    :cond_2d
    new-instance v3, Lorg/jivesoftware/smack/sasl/SASLMechanism$Failure;

    invoke-direct {v3, v0}, Lorg/jivesoftware/smack/sasl/SASLMechanism$Failure;-><init>(Ljava/lang/String;)V

    return-object v3
.end method

.method public static parseStreamError(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/StreamError;
    .registers 6
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 671
    const/4 v2, 0x0

    .line 672
    .local v2, "streamError":Lorg/jivesoftware/smack/packet/StreamError;
    const/4 v0, 0x0

    .line 673
    .local v0, "done":Z
    :cond_2
    :goto_2
    if-nez v0, :cond_26

    .line 674
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 676
    .local v1, "eventType":I
    const/4 v3, 0x2

    if-ne v1, v3, :cond_15

    .line 677
    new-instance v2, Lorg/jivesoftware/smack/packet/StreamError;

    .end local v2    # "streamError":Lorg/jivesoftware/smack/packet/StreamError;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/packet/StreamError;-><init>(Ljava/lang/String;)V

    .restart local v2    # "streamError":Lorg/jivesoftware/smack/packet/StreamError;
    goto :goto_2

    .line 679
    :cond_15
    const/4 v3, 0x3

    if-ne v1, v3, :cond_2

    .line 680
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "error"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 681
    const/4 v0, 0x1

    goto :goto_2

    .line 685
    .end local v1    # "eventType":I
    :cond_26
    return-object v2
.end method

.method public static parseWithIntrospection(Ljava/lang/String;Ljava/lang/Class;Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/Object;
    .registers 14
    .param p0, "elementName"    # Ljava/lang/String;
    .param p1, "objectClass"    # Ljava/lang/Class;
    .param p2, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 819
    const/4 v1, 0x0

    .line 820
    .local v1, "done":Z
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    .line 821
    .local v4, "object":Ljava/lang/Object;
    :cond_5
    :goto_5
    if-nez v1, :cond_40

    .line 822
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 823
    .local v2, "eventType":I
    const/4 v8, 0x2

    if-ne v2, v8, :cond_31

    .line 824
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 825
    .local v3, "name":Ljava/lang/String;
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v6

    .line 826
    .local v6, "stringValue":Ljava/lang/String;
    new-instance v0, Ljava/beans/PropertyDescriptor;

    invoke-direct {v0, v3, p1}, Ljava/beans/PropertyDescriptor;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 828
    .local v0, "descriptor":Ljava/beans/PropertyDescriptor;
    invoke-virtual {v0}, Ljava/beans/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v5

    .line 831
    .local v5, "propertyType":Ljava/lang/Class;
    invoke-static {v5, v6}, Lorg/jivesoftware/smack/util/PacketParserUtils;->decode(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 833
    .local v7, "value":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/beans/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v8

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v7, v9, v10

    invoke-virtual {v8, v4, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5

    .line 835
    .end local v0    # "descriptor":Ljava/beans/PropertyDescriptor;
    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "propertyType":Ljava/lang/Class;
    .end local v6    # "stringValue":Ljava/lang/String;
    .end local v7    # "value":Ljava/lang/Object;
    :cond_31
    const/4 v8, 0x3

    if-ne v2, v8, :cond_5

    .line 836
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 837
    const/4 v1, 0x1

    goto :goto_5

    .line 841
    .end local v2    # "eventType":I
    :cond_40
    return-object v4
.end method
