.class public Lorg/jivesoftware/smack/util/DNSUtil;
.super Ljava/lang/Object;
.source "DNSUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/util/DNSUtil$1;,
        Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;
    }
.end annotation


# static fields
.field private static cache:Ljava/util/Map;

.field private static context:Ljavax/naming/directory/DirContext;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    .line 42
    new-instance v1, Lorg/jivesoftware/smack/util/Cache;

    const/16 v2, 0x64

    const-wide/32 v3, 0x927c0

    invoke-direct {v1, v2, v3, v4}, Lorg/jivesoftware/smack/util/Cache;-><init>(IJ)V

    sput-object v1, Lorg/jivesoftware/smack/util/DNSUtil;->cache:Ljava/util/Map;

    .line 48
    :try_start_c
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    .line 49
    .local v0, "env":Ljava/util/Hashtable;
    const-string v1, "java.naming.factory.initial"

    const-string v2, "com.sun.jndi.dns.DnsContextFactory"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    new-instance v1, Ljavax/naming/directory/InitialDirContext;

    invoke-direct {v1, v0}, Ljavax/naming/directory/InitialDirContext;-><init>(Ljava/util/Hashtable;)V

    sput-object v1, Lorg/jivesoftware/smack/util/DNSUtil;->context:Ljavax/naming/directory/DirContext;
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_1f} :catch_20

    .line 55
    :goto_1f
    return-void

    .line 52
    :catch_20
    move-exception v1

    goto :goto_1f
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 208
    return-void
.end method

.method public static resolveXMPPDomain(Ljava/lang/String;)Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;
    .registers 25
    .param p0, "domain"    # Ljava/lang/String;

    .prologue
    .line 82
    sget-object v18, Lorg/jivesoftware/smack/util/DNSUtil;->context:Ljavax/naming/directory/DirContext;

    if-nez v18, :cond_14

    .line 83
    new-instance v3, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;

    const/16 v18, 0x1466

    const/16 v19, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v3, v0, v1, v2}, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;-><init>(Ljava/lang/String;ILorg/jivesoftware/smack/util/DNSUtil$1;)V

    .line 139
    :cond_13
    :goto_13
    return-object v3

    .line 85
    :cond_14
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "c"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 87
    .local v10, "key":Ljava/lang/String;
    sget-object v18, Lorg/jivesoftware/smack/util/DNSUtil;->cache:Ljava/util/Map;

    move-object/from16 v0, v18

    invoke-interface {v0, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_41

    .line 88
    sget-object v18, Lorg/jivesoftware/smack/util/DNSUtil;->cache:Ljava/util/Map;

    move-object/from16 v0, v18

    invoke-interface {v0, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;

    .line 89
    .local v3, "address":Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;
    if-nez v3, :cond_13

    .line 93
    .end local v3    # "address":Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;
    :cond_41
    move-object/from16 v4, p0

    .line 94
    .local v4, "bestHost":Ljava/lang/String;
    const/16 v5, 0x1466

    .line 95
    .local v5, "bestPort":I
    const/4 v6, 0x0

    .line 96
    .local v6, "bestPriority":I
    const/4 v7, 0x0

    .line 98
    .local v7, "bestWeight":I
    :try_start_47
    sget-object v18, Lorg/jivesoftware/smack/util/DNSUtil;->context:Ljavax/naming/directory/DirContext;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "_xmpp-client._tcp."

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    const-string v22, "SRV"

    aput-object v22, v20, v21

    invoke-interface/range {v18 .. v20}, Ljavax/naming/directory/DirContext;->getAttributes(Ljava/lang/String;[Ljava/lang/String;)Ljavax/naming/directory/Attributes;

    move-result-object v8

    .line 99
    .local v8, "dnsLookup":Ljavax/naming/directory/Attributes;
    const-string v18, "SRV"

    move-object/from16 v0, v18

    invoke-interface {v8, v0}, Ljavax/naming/directory/Attributes;->get(Ljava/lang/String;)Ljavax/naming/directory/Attribute;

    move-result-object v13

    .line 100
    .local v13, "srvAttribute":Ljavax/naming/directory/Attribute;
    invoke-interface {v13}, Ljavax/naming/directory/Attribute;->getAll()Ljavax/naming/NamingEnumeration;

    move-result-object v16

    .line 101
    .local v16, "srvRecords":Ljavax/naming/NamingEnumeration;
    :cond_7e
    :goto_7e
    invoke-interface/range {v16 .. v16}, Ljavax/naming/NamingEnumeration;->hasMore()Z

    move-result v18

    if-eqz v18, :cond_e7

    .line 102
    invoke-interface/range {v16 .. v16}, Ljavax/naming/NamingEnumeration;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    .line 103
    .local v14, "srvRecord":Ljava/lang/String;
    const-string v18, " "

    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 104
    .local v15, "srvRecordEntries":[Ljava/lang/String;
    array-length v0, v15

    move/from16 v18, v0

    add-int/lit8 v18, v18, -0x4

    aget-object v18, v15, v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    .line 105
    .local v12, "priority":I
    array-length v0, v15

    move/from16 v18, v0

    add-int/lit8 v18, v18, -0x2

    aget-object v18, v15, v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    .line 106
    .local v11, "port":I
    array-length v0, v15

    move/from16 v18, v0

    add-int/lit8 v18, v18, -0x3

    aget-object v18, v15, v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    .line 107
    .local v17, "weight":I
    array-length v0, v15

    move/from16 v18, v0

    add-int/lit8 v18, v18, -0x1

    aget-object v9, v15, v18

    .line 110
    .local v9, "host":Ljava/lang/String;
    move/from16 v0, v17

    int-to-double v0, v0

    move-wide/from16 v18, v0

    invoke-static {}, Ljava/lang/Math;->random()D
    :try_end_c2
    .catch Ljava/lang/Exception; {:try_start_47 .. :try_end_c2} :catch_e6

    move-result-wide v20

    move/from16 v0, v17

    int-to-double v0, v0

    move-wide/from16 v22, v0

    mul-double v20, v20, v22

    mul-double v18, v18, v20

    move-wide/from16 v0, v18

    double-to-int v0, v0

    move/from16 v17, v0

    .line 112
    if-eqz v6, :cond_d5

    if-ge v12, v6, :cond_db

    .line 114
    :cond_d5
    move v6, v12

    .line 115
    move/from16 v7, v17

    .line 116
    move-object v4, v9

    .line 117
    move v5, v11

    goto :goto_7e

    .line 118
    :cond_db
    if-ne v12, v6, :cond_7e

    .line 121
    move/from16 v0, v17

    if-le v0, v7, :cond_7e

    .line 122
    move/from16 v7, v17

    .line 123
    move-object v4, v9

    .line 124
    move v5, v11

    goto :goto_7e

    .line 129
    .end local v8    # "dnsLookup":Ljavax/naming/directory/Attributes;
    .end local v9    # "host":Ljava/lang/String;
    .end local v11    # "port":I
    .end local v12    # "priority":I
    .end local v13    # "srvAttribute":Ljavax/naming/directory/Attribute;
    .end local v14    # "srvRecord":Ljava/lang/String;
    .end local v15    # "srvRecordEntries":[Ljava/lang/String;
    .end local v16    # "srvRecords":Ljavax/naming/NamingEnumeration;
    .end local v17    # "weight":I
    :catch_e6
    move-exception v18

    .line 133
    :cond_e7
    const-string v18, "."

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_101

    .line 134
    const/16 v18, 0x0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v19

    add-int/lit8 v19, v19, -0x1

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v4, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 136
    :cond_101
    new-instance v3, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;

    const/16 v18, 0x0

    move-object/from16 v0, v18

    invoke-direct {v3, v4, v5, v0}, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;-><init>(Ljava/lang/String;ILorg/jivesoftware/smack/util/DNSUtil$1;)V

    .line 138
    .restart local v3    # "address":Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;
    sget-object v18, Lorg/jivesoftware/smack/util/DNSUtil;->cache:Ljava/util/Map;

    move-object/from16 v0, v18

    invoke-interface {v0, v10, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_13
.end method

.method public static resolveXMPPServerDomain(Ljava/lang/String;)Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;
    .registers 16
    .param p0, "domain"    # Ljava/lang/String;

    .prologue
    const/4 v14, 0x0

    const/4 v13, 0x0

    .line 160
    sget-object v8, Lorg/jivesoftware/smack/util/DNSUtil;->context:Ljavax/naming/directory/DirContext;

    if-nez v8, :cond_e

    .line 161
    new-instance v0, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;

    const/16 v8, 0x1495

    invoke-direct {v0, p0, v8, v14}, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;-><init>(Ljava/lang/String;ILorg/jivesoftware/smack/util/DNSUtil$1;)V

    .line 202
    :cond_d
    :goto_d
    return-object v0

    .line 163
    :cond_e
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "s"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 165
    .local v4, "key":Ljava/lang/String;
    sget-object v8, Lorg/jivesoftware/smack/util/DNSUtil;->cache:Ljava/util/Map;

    invoke-interface {v8, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_33

    .line 166
    sget-object v8, Lorg/jivesoftware/smack/util/DNSUtil;->cache:Ljava/util/Map;

    invoke-interface {v8, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;

    .line 167
    .local v0, "address":Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;
    if-nez v0, :cond_d

    .line 171
    .end local v0    # "address":Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;
    :cond_33
    move-object v3, p0

    .line 172
    .local v3, "host":Ljava/lang/String;
    const/16 v5, 0x1495

    .line 174
    .local v5, "port":I
    :try_start_36
    sget-object v8, Lorg/jivesoftware/smack/util/DNSUtil;->context:Ljavax/naming/directory/DirContext;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "_xmpp-server._tcp."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/String;

    const/4 v11, 0x0

    const-string v12, "SRV"

    aput-object v12, v10, v11

    invoke-interface {v8, v9, v10}, Ljavax/naming/directory/DirContext;->getAttributes(Ljava/lang/String;[Ljava/lang/String;)Ljavax/naming/directory/Attributes;

    move-result-object v1

    .line 176
    .local v1, "dnsLookup":Ljavax/naming/directory/Attributes;
    const-string v8, "SRV"

    invoke-interface {v1, v8}, Ljavax/naming/directory/Attributes;->get(Ljava/lang/String;)Ljavax/naming/directory/Attribute;

    move-result-object v8

    invoke-interface {v8}, Ljavax/naming/directory/Attribute;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 177
    .local v6, "srvRecord":Ljava/lang/String;
    const-string v8, " "

    invoke-virtual {v6, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 178
    .local v7, "srvRecordEntries":[Ljava/lang/String;
    array-length v8, v7

    add-int/lit8 v8, v8, -0x2

    aget-object v8, v7, v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 179
    array-length v8, v7

    add-int/lit8 v8, v8, -0x1

    aget-object v3, v7, v8
    :try_end_77
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_77} :catch_95

    .line 196
    .end local v1    # "dnsLookup":Ljavax/naming/directory/Attributes;
    .end local v6    # "srvRecord":Ljava/lang/String;
    .end local v7    # "srvRecordEntries":[Ljava/lang/String;
    :goto_77
    const-string v8, "."

    invoke-virtual {v3, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_89

    .line 197
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v3, v13, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 199
    :cond_89
    new-instance v0, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;

    invoke-direct {v0, v3, v5, v14}, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;-><init>(Ljava/lang/String;ILorg/jivesoftware/smack/util/DNSUtil$1;)V

    .line 201
    .restart local v0    # "address":Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;
    sget-object v8, Lorg/jivesoftware/smack/util/DNSUtil;->cache:Ljava/util/Map;

    invoke-interface {v8, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_d

    .line 181
    .end local v0    # "address":Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;
    :catch_95
    move-exception v2

    .line 184
    .local v2, "e":Ljava/lang/Exception;
    :try_start_96
    sget-object v8, Lorg/jivesoftware/smack/util/DNSUtil;->context:Ljavax/naming/directory/DirContext;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "_jabber._tcp."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/String;

    const/4 v11, 0x0

    const-string v12, "SRV"

    aput-object v12, v10, v11

    invoke-interface {v8, v9, v10}, Ljavax/naming/directory/DirContext;->getAttributes(Ljava/lang/String;[Ljava/lang/String;)Ljavax/naming/directory/Attributes;

    move-result-object v1

    .line 186
    .restart local v1    # "dnsLookup":Ljavax/naming/directory/Attributes;
    const-string v8, "SRV"

    invoke-interface {v1, v8}, Ljavax/naming/directory/Attributes;->get(Ljava/lang/String;)Ljavax/naming/directory/Attribute;

    move-result-object v8

    invoke-interface {v8}, Ljavax/naming/directory/Attribute;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 187
    .restart local v6    # "srvRecord":Ljava/lang/String;
    const-string v8, " "

    invoke-virtual {v6, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 188
    .restart local v7    # "srvRecordEntries":[Ljava/lang/String;
    array-length v8, v7

    add-int/lit8 v8, v8, -0x2

    aget-object v8, v7, v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 189
    array-length v8, v7

    add-int/lit8 v8, v8, -0x1

    aget-object v3, v7, v8
    :try_end_d7
    .catch Ljava/lang/Exception; {:try_start_96 .. :try_end_d7} :catch_d8

    goto :goto_77

    .line 191
    .end local v1    # "dnsLookup":Ljavax/naming/directory/Attributes;
    .end local v6    # "srvRecord":Ljava/lang/String;
    .end local v7    # "srvRecordEntries":[Ljava/lang/String;
    :catch_d8
    move-exception v8

    goto :goto_77
.end method
