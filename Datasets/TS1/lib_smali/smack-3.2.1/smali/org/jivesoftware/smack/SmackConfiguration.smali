.class public final Lorg/jivesoftware/smack/SmackConfiguration;
.super Ljava/lang/Object;
.source "SmackConfiguration.java"


# static fields
.field private static final SMACK_VERSION:Ljava/lang/String; = "3.2.1"

.field private static defaultMechs:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static keepAliveInterval:I

.field private static localSocks5ProxyEnabled:Z

.field private static localSocks5ProxyPort:I

.field private static packetCollectorSize:I

.field private static packetReplyTimeout:I


# direct methods
.method static constructor <clinit>()V
    .registers 14

    .prologue
    const/16 v12, 0x1388

    const/4 v13, 0x1

    .line 49
    sput v12, Lorg/jivesoftware/smack/SmackConfiguration;->packetReplyTimeout:I

    .line 50
    const/16 v11, 0x7530

    sput v11, Lorg/jivesoftware/smack/SmackConfiguration;->keepAliveInterval:I

    .line 51
    new-instance v11, Ljava/util/Vector;

    invoke-direct {v11}, Ljava/util/Vector;-><init>()V

    sput-object v11, Lorg/jivesoftware/smack/SmackConfiguration;->defaultMechs:Ljava/util/Vector;

    .line 53
    sput-boolean v13, Lorg/jivesoftware/smack/SmackConfiguration;->localSocks5ProxyEnabled:Z

    .line 54
    const/16 v11, 0x1e62

    sput v11, Lorg/jivesoftware/smack/SmackConfiguration;->localSocks5ProxyPort:I

    .line 55
    sput v12, Lorg/jivesoftware/smack/SmackConfiguration;->packetCollectorSize:I

    .line 70
    :try_start_18
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getClassLoaders()[Ljava/lang/ClassLoader;

    move-result-object v2

    .line 71
    .local v2, "classLoaders":[Ljava/lang/ClassLoader;
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/ClassLoader;
    array-length v7, v0

    .local v7, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_1f
    if-ge v6, v7, :cond_a9

    aget-object v1, v0, v6

    .line 72
    .local v1, "classLoader":Ljava/lang/ClassLoader;
    const-string v11, "META-INF/smack-config.xml"

    invoke-virtual {v1, v11}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v3

    .line 73
    .local v3, "configEnum":Ljava/util/Enumeration;
    :goto_29
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v11

    if-eqz v11, :cond_103

    .line 74
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/net/URL;
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_35} :catch_a5

    .line 75
    .local v10, "url":Ljava/net/URL;
    const/4 v9, 0x0

    .line 77
    .local v9, "systemStream":Ljava/io/InputStream;
    :try_start_36
    invoke-virtual {v10}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v9

    .line 78
    new-instance v8, Lorg/xmlpull/mxp1/MXParser;

    invoke-direct {v8}, Lorg/xmlpull/mxp1/MXParser;-><init>()V

    .line 79
    .local v8, "parser":Lorg/xmlpull/v1/XmlPullParser;
    const-string v11, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    const/4 v12, 0x1

    invoke-interface {v8, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V

    .line 80
    const-string v11, "UTF-8"

    invoke-interface {v8, v9, v11}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 81
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v5

    .line 83
    .local v5, "eventType":I
    :cond_4e
    const/4 v11, 0x2

    if-ne v5, v11, :cond_60

    .line 84
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "className"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6c

    .line 86
    invoke-static {v8}, Lorg/jivesoftware/smack/SmackConfiguration;->parseClassToLoad(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 107
    :cond_60
    :goto_60
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->next()I
    :try_end_63
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_63} :catch_81
    .catchall {:try_start_36 .. :try_end_63} :catchall_a0

    move-result v5

    .line 109
    if-ne v5, v13, :cond_4e

    .line 116
    :try_start_66
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V
    :try_end_69
    .catch Ljava/lang/Exception; {:try_start_66 .. :try_end_69} :catch_6a

    goto :goto_29

    .line 118
    :catch_6a
    move-exception v11

    goto :goto_29

    .line 88
    :cond_6c
    :try_start_6c
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "packetReplyTimeout"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_8b

    .line 89
    sget v11, Lorg/jivesoftware/smack/SmackConfiguration;->packetReplyTimeout:I

    invoke-static {v8, v11}, Lorg/jivesoftware/smack/SmackConfiguration;->parseIntProperty(Lorg/xmlpull/v1/XmlPullParser;I)I

    move-result v11

    sput v11, Lorg/jivesoftware/smack/SmackConfiguration;->packetReplyTimeout:I
    :try_end_80
    .catch Ljava/lang/Exception; {:try_start_6c .. :try_end_80} :catch_81
    .catchall {:try_start_6c .. :try_end_80} :catchall_a0

    goto :goto_60

    .line 111
    .end local v5    # "eventType":I
    .end local v8    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_81
    move-exception v4

    .line 112
    .local v4, "e":Ljava/lang/Exception;
    :try_start_82
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_85
    .catchall {:try_start_82 .. :try_end_85} :catchall_a0

    .line 116
    :try_start_85
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V
    :try_end_88
    .catch Ljava/lang/Exception; {:try_start_85 .. :try_end_88} :catch_89

    goto :goto_29

    .line 118
    :catch_89
    move-exception v11

    goto :goto_29

    .line 91
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v5    # "eventType":I
    .restart local v8    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    :cond_8b
    :try_start_8b
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "keepAliveInterval"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_aa

    .line 92
    sget v11, Lorg/jivesoftware/smack/SmackConfiguration;->keepAliveInterval:I

    invoke-static {v8, v11}, Lorg/jivesoftware/smack/SmackConfiguration;->parseIntProperty(Lorg/xmlpull/v1/XmlPullParser;I)I

    move-result v11

    sput v11, Lorg/jivesoftware/smack/SmackConfiguration;->keepAliveInterval:I
    :try_end_9f
    .catch Ljava/lang/Exception; {:try_start_8b .. :try_end_9f} :catch_81
    .catchall {:try_start_8b .. :try_end_9f} :catchall_a0

    goto :goto_60

    .line 115
    .end local v5    # "eventType":I
    .end local v8    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    :catchall_a0
    move-exception v11

    .line 116
    :try_start_a1
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V
    :try_end_a4
    .catch Ljava/lang/Exception; {:try_start_a1 .. :try_end_a4} :catch_107

    .line 120
    :goto_a4
    :try_start_a4
    throw v11
    :try_end_a5
    .catch Ljava/lang/Exception; {:try_start_a4 .. :try_end_a5} :catch_a5

    .line 125
    .end local v1    # "classLoader":Ljava/lang/ClassLoader;
    .end local v3    # "configEnum":Ljava/util/Enumeration;
    .end local v6    # "i$":I
    .end local v7    # "len$":I
    .end local v9    # "systemStream":Ljava/io/InputStream;
    .end local v10    # "url":Ljava/net/URL;
    :catch_a5
    move-exception v4

    .line 126
    .restart local v4    # "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    .line 128
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_a9
    return-void

    .line 94
    .restart local v1    # "classLoader":Ljava/lang/ClassLoader;
    .restart local v3    # "configEnum":Ljava/util/Enumeration;
    .restart local v5    # "eventType":I
    .restart local v6    # "i$":I
    .restart local v7    # "len$":I
    .restart local v8    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v9    # "systemStream":Ljava/io/InputStream;
    .restart local v10    # "url":Ljava/net/URL;
    :cond_aa
    :try_start_aa
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "mechName"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_c0

    .line 95
    sget-object v11, Lorg/jivesoftware/smack/SmackConfiguration;->defaultMechs:Ljava/util/Vector;

    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_60

    .line 97
    :cond_c0
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "localSocks5ProxyEnabled"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_d7

    .line 98
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v11

    sput-boolean v11, Lorg/jivesoftware/smack/SmackConfiguration;->localSocks5ProxyEnabled:Z

    goto :goto_60

    .line 100
    :cond_d7
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "localSocks5ProxyPort"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_ed

    .line 101
    sget v11, Lorg/jivesoftware/smack/SmackConfiguration;->localSocks5ProxyPort:I

    invoke-static {v8, v11}, Lorg/jivesoftware/smack/SmackConfiguration;->parseIntProperty(Lorg/xmlpull/v1/XmlPullParser;I)I

    move-result v11

    sput v11, Lorg/jivesoftware/smack/SmackConfiguration;->localSocks5ProxyPort:I

    goto/16 :goto_60

    .line 103
    :cond_ed
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "packetCollectorSize"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_60

    .line 104
    sget v11, Lorg/jivesoftware/smack/SmackConfiguration;->packetCollectorSize:I

    invoke-static {v8, v11}, Lorg/jivesoftware/smack/SmackConfiguration;->parseIntProperty(Lorg/xmlpull/v1/XmlPullParser;I)I

    move-result v11

    sput v11, Lorg/jivesoftware/smack/SmackConfiguration;->packetCollectorSize:I
    :try_end_101
    .catch Ljava/lang/Exception; {:try_start_aa .. :try_end_101} :catch_81
    .catchall {:try_start_aa .. :try_end_101} :catchall_a0

    goto/16 :goto_60

    .line 71
    .end local v5    # "eventType":I
    .end local v8    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v9    # "systemStream":Ljava/io/InputStream;
    .end local v10    # "url":Ljava/net/URL;
    :cond_103
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_1f

    .line 118
    .restart local v9    # "systemStream":Ljava/io/InputStream;
    .restart local v10    # "url":Ljava/net/URL;
    :catch_107
    move-exception v12

    goto :goto_a4
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    return-void
.end method

.method public static addSaslMech(Ljava/lang/String;)V
    .registers 2
    .param p0, "mech"    # Ljava/lang/String;

    .prologue
    .line 216
    sget-object v0, Lorg/jivesoftware/smack/SmackConfiguration;->defaultMechs:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 217
    sget-object v0, Lorg/jivesoftware/smack/SmackConfiguration;->defaultMechs:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 219
    :cond_d
    return-void
.end method

.method public static addSaslMechs(Ljava/util/Collection;)V
    .registers 4
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
    .line 227
    .local p0, "mechs":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 228
    .local v1, "mech":Ljava/lang/String;
    invoke-static {v1}, Lorg/jivesoftware/smack/SmackConfiguration;->addSaslMech(Ljava/lang/String;)V

    goto :goto_4

    .line 230
    .end local v1    # "mech":Ljava/lang/String;
    :cond_14
    return-void
.end method

.method private static getClassLoaders()[Ljava/lang/ClassLoader;
    .registers 8

    .prologue
    .line 332
    const/4 v6, 0x2

    new-array v2, v6, [Ljava/lang/ClassLoader;

    .line 333
    .local v2, "classLoaders":[Ljava/lang/ClassLoader;
    const/4 v6, 0x0

    const-class v7, Lorg/jivesoftware/smack/SmackConfiguration;

    invoke-virtual {v7}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    aput-object v7, v2, v6

    .line 334
    const/4 v6, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    aput-object v7, v2, v6

    .line 336
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 337
    .local v5, "loaders":Ljava/util/List;, "Ljava/util/List<Ljava/lang/ClassLoader;>;"
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/ClassLoader;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_1f
    if-ge v3, v4, :cond_2b

    aget-object v1, v0, v3

    .line 338
    .local v1, "classLoader":Ljava/lang/ClassLoader;
    if-eqz v1, :cond_28

    .line 339
    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 337
    :cond_28
    add-int/lit8 v3, v3, 0x1

    goto :goto_1f

    .line 342
    .end local v1    # "classLoader":Ljava/lang/ClassLoader;
    :cond_2b
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    new-array v6, v6, [Ljava/lang/ClassLoader;

    invoke-interface {v5, v6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/ClassLoader;

    return-object v6
.end method

.method public static getKeepAliveInterval()I
    .registers 1

    .prologue
    .line 175
    sget v0, Lorg/jivesoftware/smack/SmackConfiguration;->keepAliveInterval:I

    return v0
.end method

.method public static getLocalSocks5ProxyPort()I
    .registers 1

    .prologue
    .line 289
    sget v0, Lorg/jivesoftware/smack/SmackConfiguration;->localSocks5ProxyPort:I

    return v0
.end method

.method public static getPacketCollectorSize()I
    .registers 1

    .prologue
    .line 197
    sget v0, Lorg/jivesoftware/smack/SmackConfiguration;->packetCollectorSize:I

    return v0
.end method

.method public static getPacketReplyTimeout()I
    .registers 1

    .prologue
    .line 147
    sget v0, Lorg/jivesoftware/smack/SmackConfiguration;->packetReplyTimeout:I

    if-gtz v0, :cond_8

    .line 148
    const/16 v0, 0x1388

    sput v0, Lorg/jivesoftware/smack/SmackConfiguration;->packetReplyTimeout:I

    .line 150
    :cond_8
    sget v0, Lorg/jivesoftware/smack/SmackConfiguration;->packetReplyTimeout:I

    return v0
.end method

.method public static getSaslMechs()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 262
    sget-object v0, Lorg/jivesoftware/smack/SmackConfiguration;->defaultMechs:Ljava/util/Vector;

    return-object v0
.end method

.method public static getVersion()Ljava/lang/String;
    .registers 1

    .prologue
    .line 136
    const-string v0, "3.2.1"

    return-object v0
.end method

.method public static isLocalSocks5ProxyEnabled()Z
    .registers 1

    .prologue
    .line 271
    sget-boolean v0, Lorg/jivesoftware/smack/SmackConfiguration;->localSocks5ProxyEnabled:Z

    return v0
.end method

.method private static parseClassToLoad(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 6
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 303
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v0

    .line 306
    .local v0, "className":Ljava/lang/String;
    :try_start_4
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_7
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4 .. :try_end_7} :catch_8

    .line 312
    :goto_7
    return-void

    .line 308
    :catch_8
    move-exception v1

    .line 309
    .local v1, "cnfe":Ljava/lang/ClassNotFoundException;
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error! A startup class specified in smack-config.xml could not be loaded: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_7
.end method

.method private static parseIntProperty(Lorg/xmlpull/v1/XmlPullParser;I)I
    .registers 4
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "defaultValue"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 318
    :try_start_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_7} :catch_9

    move-result p1

    .line 322
    .end local p1    # "defaultValue":I
    :goto_8
    return p1

    .line 320
    .restart local p1    # "defaultValue":I
    :catch_9
    move-exception v0

    .line 321
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_8
.end method

.method public static removeSaslMech(Ljava/lang/String;)V
    .registers 2
    .param p0, "mech"    # Ljava/lang/String;

    .prologue
    .line 238
    sget-object v0, Lorg/jivesoftware/smack/SmackConfiguration;->defaultMechs:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 239
    sget-object v0, Lorg/jivesoftware/smack/SmackConfiguration;->defaultMechs:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    .line 241
    :cond_d
    return-void
.end method

.method public static removeSaslMechs(Ljava/util/Collection;)V
    .registers 4
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
    .line 249
    .local p0, "mechs":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 250
    .local v1, "mech":Ljava/lang/String;
    invoke-static {v1}, Lorg/jivesoftware/smack/SmackConfiguration;->removeSaslMech(Ljava/lang/String;)V

    goto :goto_4

    .line 252
    .end local v1    # "mech":Ljava/lang/String;
    :cond_14
    return-void
.end method

.method public static setKeepAliveInterval(I)V
    .registers 1
    .param p0, "interval"    # I

    .prologue
    .line 187
    sput p0, Lorg/jivesoftware/smack/SmackConfiguration;->keepAliveInterval:I

    .line 188
    return-void
.end method

.method public static setLocalSocks5ProxyEnabled(Z)V
    .registers 1
    .param p0, "localSocks5ProxyEnabled"    # Z

    .prologue
    .line 280
    sput-boolean p0, Lorg/jivesoftware/smack/SmackConfiguration;->localSocks5ProxyEnabled:Z

    .line 281
    return-void
.end method

.method public static setLocalSocks5ProxyPort(I)V
    .registers 1
    .param p0, "localSocks5ProxyPort"    # I

    .prologue
    .line 299
    sput p0, Lorg/jivesoftware/smack/SmackConfiguration;->localSocks5ProxyPort:I

    .line 300
    return-void
.end method

.method public static setPacketCollectorSize(I)V
    .registers 1
    .param p0, "collectorSize"    # I

    .prologue
    .line 207
    sput p0, Lorg/jivesoftware/smack/SmackConfiguration;->packetCollectorSize:I

    .line 208
    return-void
.end method

.method public static setPacketReplyTimeout(I)V
    .registers 2
    .param p0, "timeout"    # I

    .prologue
    .line 160
    if-gtz p0, :cond_8

    .line 161
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 163
    :cond_8
    sput p0, Lorg/jivesoftware/smack/SmackConfiguration;->packetReplyTimeout:I

    .line 164
    return-void
.end method
