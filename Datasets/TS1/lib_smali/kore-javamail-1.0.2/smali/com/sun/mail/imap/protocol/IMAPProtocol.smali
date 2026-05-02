.class public Lcom/sun/mail/imap/protocol/IMAPProtocol;
.super Lcom/sun/mail/iap/Protocol;
.source "IMAPProtocol.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final CRLF:[B

.field private static final DONE:[B

.field private static final fetchItems:[Lcom/sun/mail/imap/protocol/FetchItem;


# instance fields
.field private authenticated:Z

.field private authmechs:Ljava/util/List;

.field private ba:Lcom/sun/mail/iap/ByteArray;

.field private capabilities:Ljava/util/Map;

.field private connected:Z

.field protected enabled:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private volatile idleTag:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private noauthdebug:Z

.field private proxyAuthUser:Ljava/lang/String;

.field private rev1:Z

.field private saslAuthenticator:Lcom/sun/mail/imap/protocol/SaslAuthenticator;

.field protected searchCharsets:[Ljava/lang/String;

.field protected searchSequence:Lcom/sun/mail/imap/protocol/SearchSequence;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 79
    const-class v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_21

    const/4 v0, 0x1

    :goto_a
    sput-boolean v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->$assertionsDisabled:Z

    .line 106
    const/4 v0, 0x2

    new-array v0, v0, [B

    fill-array-data v0, :array_24

    sput-object v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->CRLF:[B

    .line 108
    new-array v0, v1, [Lcom/sun/mail/imap/protocol/FetchItem;

    sput-object v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchItems:[Lcom/sun/mail/imap/protocol/FetchItem;

    .line 2703
    const/4 v0, 0x6

    new-array v0, v0, [B

    fill-array-data v0, :array_2a

    sput-object v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->DONE:[B

    return-void

    :cond_21
    move v0, v1

    .line 79
    goto :goto_a

    .line 106
    nop

    :array_24
    .array-data 1
        0xdt
        0xat
    .end array-data

    .line 2703
    nop

    :array_2a
    .array-data 1
        0x44t
        0x4ft
        0x4et
        0x45t
        0xdt
        0xat
    .end array-data
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/io/PrintStream;Ljava/util/Properties;Z)V
    .registers 9
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "out"    # Ljava/io/PrintStream;
    .param p3, "props"    # Ljava/util/Properties;
    .param p4, "debug"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 163
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/sun/mail/iap/Protocol;-><init>(Ljava/io/InputStream;Ljava/io/PrintStream;Ljava/util/Properties;Z)V

    .line 81
    iput-boolean v2, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->connected:Z

    .line 82
    iput-boolean v2, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->rev1:Z

    .line 83
    iput-boolean v1, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noauthdebug:Z

    .line 165
    const-string v0, "imap"

    iput-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->name:Ljava/lang/String;

    .line 166
    const-string v0, "mail.debug.auth"

    .line 167
    invoke-static {p3, v0, v2}, Lcom/sun/mail/util/PropUtil;->getBooleanProperty(Ljava/util/Properties;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_3f

    move v0, v1

    :goto_18
    iput-boolean v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noauthdebug:Z

    .line 169
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->capabilities:Ljava/util/Map;

    if-nez v0, :cond_25

    .line 170
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->capabilities:Ljava/util/Map;

    .line 172
    :cond_25
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->searchCharsets:[Ljava/lang/String;

    .line 173
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->searchCharsets:[Ljava/lang/String;

    const-string v3, "UTF-8"

    aput-object v3, v0, v2

    .line 174
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->searchCharsets:[Ljava/lang/String;

    .line 175
    invoke-static {}, Lkorex/mail/internet/MimeUtility;->getDefaultJavaCharset()Ljava/lang/String;

    move-result-object v2

    .line 174
    invoke-static {v2}, Lkorex/mail/internet/MimeUtility;->mimeCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 178
    iput-boolean v1, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->connected:Z

    .line 179
    return-void

    :cond_3f
    move v0, v2

    .line 167
    goto :goto_18
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ILjava/util/Properties;ZLcom/sun/mail/util/MailLogger;)V
    .registers 16
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "props"    # Ljava/util/Properties;
    .param p5, "isSSL"    # Z
    .param p6, "logger"    # Lcom/sun/mail/util/MailLogger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 122
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mail."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v0, p0

    move-object v1, p2

    move v2, p3

    move-object v3, p4

    move v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/sun/mail/iap/Protocol;-><init>(Ljava/lang/String;ILjava/util/Properties;Ljava/lang/String;ZLcom/sun/mail/util/MailLogger;)V

    .line 81
    iput-boolean v8, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->connected:Z

    .line 82
    iput-boolean v8, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->rev1:Z

    .line 83
    iput-boolean v7, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noauthdebug:Z

    .line 125
    :try_start_24
    iput-object p1, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->name:Ljava/lang/String;

    .line 126
    const-string v0, "mail.debug.auth"

    const/4 v1, 0x0

    .line 127
    invoke-static {p4, v0, v1}, Lcom/sun/mail/util/PropUtil;->getBooleanProperty(Ljava/util/Properties;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_68

    move v0, v7

    :goto_30
    iput-boolean v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noauthdebug:Z

    .line 129
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->capabilities:Ljava/util/Map;

    if-nez v0, :cond_39

    .line 130
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->capability()V

    .line 132
    :cond_39
    const-string v0, "IMAP4rev1"

    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_44

    .line 133
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->rev1:Z

    .line 135
    :cond_44
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->searchCharsets:[Ljava/lang/String;

    .line 136
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->searchCharsets:[Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "UTF-8"

    aput-object v2, v0, v1

    .line 137
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->searchCharsets:[Ljava/lang/String;

    const/4 v1, 0x1

    .line 138
    invoke-static {}, Lkorex/mail/internet/MimeUtility;->getDefaultJavaCharset()Ljava/lang/String;

    move-result-object v2

    .line 137
    invoke-static {v2}, Lkorex/mail/internet/MimeUtility;->mimeCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 141
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->connected:Z
    :try_end_60
    .catchall {:try_start_24 .. :try_end_60} :catchall_6a

    .line 149
    iget-boolean v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->connected:Z

    if-nez v0, :cond_67

    .line 150
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->disconnect()V

    .line 152
    :cond_67
    return-void

    :cond_68
    move v0, v8

    .line 127
    goto :goto_30

    .line 149
    :catchall_6a
    move-exception v0

    iget-boolean v1, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->connected:Z

    if-nez v1, :cond_72

    .line 150
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->disconnect()V

    :cond_72
    throw v0
.end method

.method private createFlagList(Lkorex/mail/Flags;)Ljava/lang/String;
    .registers 11
    .param p1, "flags"    # Lkorex/mail/Flags;

    .prologue
    const/16 v8, 0x20

    .line 1870
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 1871
    .local v4, "sb":Ljava/lang/StringBuffer;
    const-string v7, "("

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1873
    invoke-virtual {p1}, Lkorex/mail/Flags;->getSystemFlags()[Lkorex/mail/Flags$Flag;

    move-result-object v5

    .line 1874
    .local v5, "sf":[Lkorex/mail/Flags$Flag;
    const/4 v1, 0x1

    .line 1875
    .local v1, "first":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_12
    array-length v7, v5

    if-ge v2, v7, :cond_4d

    .line 1877
    aget-object v0, v5, v2

    .line 1878
    .local v0, "f":Lkorex/mail/Flags$Flag;
    sget-object v7, Lkorex/mail/Flags$Flag;->ANSWERED:Lkorex/mail/Flags$Flag;

    if-ne v0, v7, :cond_26

    .line 1879
    const-string v3, "\\Answered"

    .line 1892
    .local v3, "s":Ljava/lang/String;
    :goto_1d
    if-eqz v1, :cond_49

    .line 1893
    const/4 v1, 0x0

    .line 1896
    :goto_20
    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1875
    .end local v3    # "s":Ljava/lang/String;
    :cond_23
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    .line 1880
    :cond_26
    sget-object v7, Lkorex/mail/Flags$Flag;->DELETED:Lkorex/mail/Flags$Flag;

    if-ne v0, v7, :cond_2d

    .line 1881
    const-string v3, "\\Deleted"

    .restart local v3    # "s":Ljava/lang/String;
    goto :goto_1d

    .line 1882
    .end local v3    # "s":Ljava/lang/String;
    :cond_2d
    sget-object v7, Lkorex/mail/Flags$Flag;->DRAFT:Lkorex/mail/Flags$Flag;

    if-ne v0, v7, :cond_34

    .line 1883
    const-string v3, "\\Draft"

    .restart local v3    # "s":Ljava/lang/String;
    goto :goto_1d

    .line 1884
    .end local v3    # "s":Ljava/lang/String;
    :cond_34
    sget-object v7, Lkorex/mail/Flags$Flag;->FLAGGED:Lkorex/mail/Flags$Flag;

    if-ne v0, v7, :cond_3b

    .line 1885
    const-string v3, "\\Flagged"

    .restart local v3    # "s":Ljava/lang/String;
    goto :goto_1d

    .line 1886
    .end local v3    # "s":Ljava/lang/String;
    :cond_3b
    sget-object v7, Lkorex/mail/Flags$Flag;->RECENT:Lkorex/mail/Flags$Flag;

    if-ne v0, v7, :cond_42

    .line 1887
    const-string v3, "\\Recent"

    .restart local v3    # "s":Ljava/lang/String;
    goto :goto_1d

    .line 1888
    .end local v3    # "s":Ljava/lang/String;
    :cond_42
    sget-object v7, Lkorex/mail/Flags$Flag;->SEEN:Lkorex/mail/Flags$Flag;

    if-ne v0, v7, :cond_23

    .line 1889
    const-string v3, "\\Seen"

    .restart local v3    # "s":Ljava/lang/String;
    goto :goto_1d

    .line 1895
    :cond_49
    invoke-virtual {v4, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_20

    .line 1899
    .end local v0    # "f":Lkorex/mail/Flags$Flag;
    .end local v3    # "s":Ljava/lang/String;
    :cond_4d
    invoke-virtual {p1}, Lkorex/mail/Flags;->getUserFlags()[Ljava/lang/String;

    move-result-object v6

    .line 1900
    .local v6, "uf":[Ljava/lang/String;
    const/4 v2, 0x0

    :goto_52
    array-length v7, v6

    if-ge v2, v7, :cond_64

    .line 1901
    if-eqz v1, :cond_60

    .line 1902
    const/4 v1, 0x0

    .line 1905
    :goto_58
    aget-object v7, v6, v2

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1900
    add-int/lit8 v2, v2, 0x1

    goto :goto_52

    .line 1904
    :cond_60
    invoke-virtual {v4, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_58

    .line 1908
    :cond_64
    const-string v7, ")"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1909
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7
.end method

.method private fetch(Ljava/lang/String;Ljava/lang/String;Z)[Lcom/sun/mail/iap/Response;
    .registers 7
    .param p1, "msgSequence"    # Ljava/lang/String;
    .param p2, "what"    # Ljava/lang/String;
    .param p3, "uid"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1749
    if-eqz p3, :cond_2b

    .line 1750
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "UID FETCH "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v0

    .line 1752
    :goto_2a
    return-object v0

    :cond_2b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FETCH "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v0

    goto :goto_2a
.end method

.method private getAppendUID(Lcom/sun/mail/iap/Response;)Lcom/sun/mail/imap/AppendUID;
    .registers 10
    .param p1, "r"    # Lcom/sun/mail/iap/Response;

    .prologue
    const/4 v6, 0x0

    .line 1323
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v7

    if-nez v7, :cond_8

    .line 1337
    :cond_7
    :goto_7
    return-object v6

    .line 1326
    :cond_8
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readByte()B

    move-result v0

    .local v0, "b":B
    if-lez v0, :cond_12

    const/16 v7, 0x5b

    if-ne v0, v7, :cond_8

    .line 1328
    :cond_12
    if-eqz v0, :cond_7

    .line 1331
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readAtom()Ljava/lang/String;

    move-result-object v1

    .line 1332
    .local v1, "s":Ljava/lang/String;
    const-string v7, "APPENDUID"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 1335
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readLong()J

    move-result-wide v4

    .line 1336
    .local v4, "uidvalidity":J
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readLong()J

    move-result-wide v2

    .line 1337
    .local v2, "uid":J
    new-instance v6, Lcom/sun/mail/imap/AppendUID;

    invoke-direct {v6, v4, v5, v2, v3}, Lcom/sun/mail/imap/AppendUID;-><init>(JJ)V

    goto :goto_7
.end method

.method private getCopyUID(Lcom/sun/mail/iap/Response;)Lcom/sun/mail/imap/CopyUID;
    .registers 11
    .param p1, "r"    # Lcom/sun/mail/iap/Response;

    .prologue
    const/4 v6, 0x0

    .line 1813
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v7

    if-nez v7, :cond_8

    .line 1829
    :cond_7
    :goto_7
    return-object v6

    .line 1816
    :cond_8
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readByte()B

    move-result v0

    .local v0, "b":B
    if-lez v0, :cond_12

    const/16 v7, 0x5b

    if-ne v0, v7, :cond_8

    .line 1818
    :cond_12
    if-eqz v0, :cond_7

    .line 1821
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readAtom()Ljava/lang/String;

    move-result-object v2

    .line 1822
    .local v2, "s":Ljava/lang/String;
    const-string v7, "COPYUID"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 1825
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readLong()J

    move-result-wide v4

    .line 1826
    .local v4, "uidvalidity":J
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readAtom()Ljava/lang/String;

    move-result-object v3

    .line 1827
    .local v3, "src":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readAtom()Ljava/lang/String;

    move-result-object v1

    .line 1828
    .local v1, "dst":Ljava/lang/String;
    new-instance v6, Lcom/sun/mail/imap/CopyUID;

    .line 1829
    invoke-static {v3}, Lcom/sun/mail/imap/protocol/UIDSet;->parseUIDSets(Ljava/lang/String;)[Lcom/sun/mail/imap/protocol/UIDSet;

    move-result-object v7

    invoke-static {v1}, Lcom/sun/mail/imap/protocol/UIDSet;->parseUIDSets(Ljava/lang/String;)[Lcom/sun/mail/imap/protocol/UIDSet;

    move-result-object v8

    invoke-direct {v6, v4, v5, v7, v8}, Lcom/sun/mail/imap/CopyUID;-><init>(J[Lcom/sun/mail/imap/protocol/UIDSet;[Lcom/sun/mail/imap/protocol/UIDSet;)V

    goto :goto_7
.end method

.method private issueSearch(Ljava/lang/String;Lkorex/mail/search/SearchTerm;Ljava/lang/String;)[I
    .registers 16
    .param p1, "msgSequence"    # Ljava/lang/String;
    .param p2, "term"    # Lkorex/mail/search/SearchTerm;
    .param p3, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;,
            Lkorex/mail/search/SearchException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2001
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getSearchSequence()Lcom/sun/mail/imap/protocol/SearchSequence;

    move-result-object v11

    if-nez p3, :cond_34

    const/4 v10, 0x0

    :goto_7
    invoke-virtual {v11, p2, v10}, Lcom/sun/mail/imap/protocol/SearchSequence;->generateSequence(Lkorex/mail/search/SearchTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v0

    .line 2005
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-virtual {v0, p1}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 2009
    if-nez p3, :cond_39

    .line 2010
    const-string v10, "SEARCH"

    invoke-virtual {p0, v10, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v6

    .line 2014
    .local v6, "r":[Lcom/sun/mail/iap/Response;
    :goto_16
    array-length v10, v6

    add-int/lit8 v10, v10, -0x1

    aget-object v7, v6, v10

    .line 2015
    .local v7, "response":Lcom/sun/mail/iap/Response;
    const/4 v4, 0x0

    .line 2018
    .local v4, "matches":[I
    invoke-virtual {v7}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v10

    if-eqz v10, :cond_88

    .line 2019
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 2021
    .local v8, "v":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    array-length v3, v6

    .local v3, "len":I
    :goto_29
    if-ge v1, v3, :cond_70

    .line 2022
    aget-object v10, v6, v1

    instance-of v10, v10, Lcom/sun/mail/imap/protocol/IMAPResponse;

    if-nez v10, :cond_51

    .line 2021
    :cond_31
    :goto_31
    add-int/lit8 v1, v1, 0x1

    goto :goto_29

    .line 2003
    .end local v0    # "args":Lcom/sun/mail/iap/Argument;
    .end local v1    # "i":I
    .end local v3    # "len":I
    .end local v4    # "matches":[I
    .end local v6    # "r":[Lcom/sun/mail/iap/Response;
    .end local v7    # "response":Lcom/sun/mail/iap/Response;
    .end local v8    # "v":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_34
    invoke-static {p3}, Lkorex/mail/internet/MimeUtility;->javaCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    goto :goto_7

    .line 2012
    .restart local v0    # "args":Lcom/sun/mail/iap/Argument;
    :cond_39
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "SEARCH CHARSET "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v6

    .restart local v6    # "r":[Lcom/sun/mail/iap/Response;
    goto :goto_16

    .line 2025
    .restart local v1    # "i":I
    .restart local v3    # "len":I
    .restart local v4    # "matches":[I
    .restart local v7    # "response":Lcom/sun/mail/iap/Response;
    .restart local v8    # "v":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_51
    aget-object v2, v6, v1

    check-cast v2, Lcom/sun/mail/imap/protocol/IMAPResponse;

    .line 2027
    .local v2, "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    const-string v10, "SEARCH"

    invoke-virtual {v2, v10}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_31

    .line 2028
    :goto_5d
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readNumber()I

    move-result v5

    .local v5, "num":I
    const/4 v10, -0x1

    if-eq v5, v10, :cond_6c

    .line 2029
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v8, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5d

    .line 2030
    :cond_6c
    const/4 v10, 0x0

    aput-object v10, v6, v1

    goto :goto_31

    .line 2035
    .end local v2    # "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    .end local v5    # "num":I
    :cond_70
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v9

    .line 2036
    .local v9, "vsize":I
    new-array v4, v9, [I

    .line 2037
    const/4 v1, 0x0

    :goto_77
    if-ge v1, v9, :cond_88

    .line 2038
    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    aput v10, v4, v1

    .line 2037
    add-int/lit8 v1, v1, 0x1

    goto :goto_77

    .line 2042
    .end local v1    # "i":I
    .end local v3    # "len":I
    .end local v8    # "v":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v9    # "vsize":I
    :cond_88
    invoke-virtual {p0, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 2043
    invoke-virtual {p0, v7}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 2044
    return-object v4
.end method

.method private parseQuota(Lcom/sun/mail/iap/Response;)Lkorex/mail/Quota;
    .registers 13
    .param p1, "r"    # Lcom/sun/mail/iap/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ParsingException;
        }
    .end annotation

    .prologue
    .line 2348
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readAtomString()Ljava/lang/String;

    move-result-object v7

    .line 2349
    .local v7, "quotaRoot":Ljava/lang/String;
    new-instance v6, Lkorex/mail/Quota;

    invoke-direct {v6, v7}, Lkorex/mail/Quota;-><init>(Ljava/lang/String;)V

    .line 2350
    .local v6, "q":Lkorex/mail/Quota;
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->skipSpaces()V

    .line 2352
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readByte()B

    move-result v9

    const/16 v10, 0x28

    if-eq v9, v10, :cond_1c

    .line 2353
    new-instance v9, Lcom/sun/mail/iap/ParsingException;

    const-string v10, "parse error in QUOTA"

    invoke-direct {v9, v10}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 2355
    :cond_1c
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 2356
    .local v8, "v":Ljava/util/List;, "Ljava/util/List<Lkorex/mail/Quota$Resource;>;"
    :cond_21
    :goto_21
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->peekByte()B

    move-result v9

    const/16 v10, 0x29

    if-eq v9, v10, :cond_40

    .line 2358
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readAtom()Ljava/lang/String;

    move-result-object v1

    .line 2359
    .local v1, "name":Ljava/lang/String;
    if-eqz v1, :cond_21

    .line 2360
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readLong()J

    move-result-wide v2

    .line 2361
    .local v2, "usage":J
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readLong()J

    move-result-wide v4

    .line 2362
    .local v4, "limit":J
    new-instance v0, Lkorex/mail/Quota$Resource;

    invoke-direct/range {v0 .. v5}, Lkorex/mail/Quota$Resource;-><init>(Ljava/lang/String;JJ)V

    .line 2363
    .local v0, "res":Lkorex/mail/Quota$Resource;
    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_21

    .line 2366
    .end local v0    # "res":Lkorex/mail/Quota$Resource;
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "usage":J
    .end local v4    # "limit":J
    :cond_40
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readByte()B

    .line 2367
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v9

    new-array v9, v9, [Lkorex/mail/Quota$Resource;

    invoke-interface {v8, v9}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Lkorex/mail/Quota$Resource;

    iput-object v9, v6, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    .line 2368
    return-object v6
.end method

.method private static resyncArgs(Lcom/sun/mail/imap/ResyncData;)Lcom/sun/mail/iap/Argument;
    .registers 6
    .param p0, "rd"    # Lcom/sun/mail/imap/ResyncData;

    .prologue
    .line 1005
    new-instance v1, Lcom/sun/mail/iap/Argument;

    invoke-direct {v1}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 1006
    .local v1, "cmd":Lcom/sun/mail/iap/Argument;
    const-string v3, "QRESYNC"

    invoke-virtual {v1, v3}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 1007
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 1008
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-virtual {p0}, Lcom/sun/mail/imap/ResyncData;->getUIDValidity()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lcom/sun/mail/iap/Argument;->writeNumber(J)Lcom/sun/mail/iap/Argument;

    .line 1009
    invoke-virtual {p0}, Lcom/sun/mail/imap/ResyncData;->getModSeq()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lcom/sun/mail/iap/Argument;->writeNumber(J)Lcom/sun/mail/iap/Argument;

    .line 1010
    invoke-static {p0}, Lcom/sun/mail/imap/Utility;->getResyncUIDSet(Lcom/sun/mail/imap/ResyncData;)[Lcom/sun/mail/imap/protocol/UIDSet;

    move-result-object v2

    .line 1011
    .local v2, "uids":[Lcom/sun/mail/imap/protocol/UIDSet;
    if-eqz v2, :cond_2a

    .line 1012
    invoke-static {v2}, Lcom/sun/mail/imap/protocol/UIDSet;->toString([Lcom/sun/mail/imap/protocol/UIDSet;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 1013
    :cond_2a
    invoke-virtual {v1, v0}, Lcom/sun/mail/iap/Argument;->writeArgument(Lcom/sun/mail/iap/Argument;)Lcom/sun/mail/iap/Argument;

    .line 1014
    return-object v1
.end method

.method private search(Ljava/lang/String;Lkorex/mail/search/SearchTerm;)[I
    .registers 10
    .param p1, "msgSequence"    # Ljava/lang/String;
    .param p2, "term"    # Lkorex/mail/search/SearchTerm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;,
            Lkorex/mail/search/SearchException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 1947
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getSearchSequence()Lcom/sun/mail/imap/protocol/SearchSequence;

    invoke-static {p2}, Lcom/sun/mail/imap/protocol/SearchSequence;->isAscii(Lkorex/mail/search/SearchTerm;)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 1949
    const/4 v5, 0x0

    :try_start_b
    invoke-direct {p0, p1, p2, v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->issueSearch(Ljava/lang/String;Lkorex/mail/search/SearchTerm;Ljava/lang/String;)[I
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_e} :catch_10

    move-result-object v5

    .line 1967
    :goto_f
    return-object v5

    .line 1950
    :catch_10
    move-exception v5

    .line 1962
    :cond_11
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_12
    iget-object v5, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->searchCharsets:[Ljava/lang/String;

    array-length v5, v5

    if-ge v1, v5, :cond_35

    .line 1963
    iget-object v5, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->searchCharsets:[Ljava/lang/String;

    aget-object v5, v5, v1

    if-nez v5, :cond_20

    .line 1962
    :goto_1d
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    .line 1967
    :cond_20
    :try_start_20
    iget-object v5, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->searchCharsets:[Ljava/lang/String;

    aget-object v5, v5, v1

    invoke-direct {p0, p1, p2, v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->issueSearch(Ljava/lang/String;Lkorex/mail/search/SearchTerm;Ljava/lang/String;)[I
    :try_end_27
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_20 .. :try_end_27} :catch_29
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_27} :catch_2f
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_20 .. :try_end_27} :catch_31
    .catch Lkorex/mail/search/SearchException; {:try_start_20 .. :try_end_27} :catch_33

    move-result-object v5

    goto :goto_f

    .line 1968
    :catch_29
    move-exception v0

    .line 1975
    .local v0, "cfx":Lcom/sun/mail/iap/CommandFailedException;
    iget-object v5, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->searchCharsets:[Ljava/lang/String;

    aput-object v6, v5, v1

    goto :goto_1d

    .line 1977
    .end local v0    # "cfx":Lcom/sun/mail/iap/CommandFailedException;
    :catch_2f
    move-exception v2

    .line 1979
    .local v2, "ioex":Ljava/io/IOException;
    goto :goto_1d

    .line 1980
    .end local v2    # "ioex":Ljava/io/IOException;
    :catch_31
    move-exception v3

    .line 1981
    .local v3, "pex":Lcom/sun/mail/iap/ProtocolException;
    throw v3

    .line 1982
    .end local v3    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :catch_33
    move-exception v4

    .line 1983
    .local v4, "sex":Lkorex/mail/search/SearchException;
    throw v4

    .line 1988
    .end local v4    # "sex":Lkorex/mail/search/SearchException;
    :cond_35
    new-instance v5, Lkorex/mail/search/SearchException;

    const-string v6, "Search failed"

    invoke-direct {v5, v6}, Lkorex/mail/search/SearchException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method private storeFlags(Ljava/lang/String;Lkorex/mail/Flags;Z)V
    .registers 8
    .param p1, "msgset"    # Ljava/lang/String;
    .param p2, "flags"    # Lkorex/mail/Flags;
    .param p3, "set"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 1854
    if-eqz p3, :cond_34

    .line 1855
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "STORE "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " +FLAGS "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1856
    invoke-direct {p0, p2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->createFlagList(Lkorex/mail/Flags;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1855
    invoke-virtual {p0, v1, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v0

    .line 1862
    .local v0, "r":[Lcom/sun/mail/iap/Response;
    :goto_28
    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 1863
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aget-object v1, v0, v1

    invoke-virtual {p0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 1864
    return-void

    .line 1858
    .end local v0    # "r":[Lcom/sun/mail/iap/Response;
    :cond_34
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "STORE "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " -FLAGS "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1859
    invoke-direct {p0, p2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->createFlagList(Lkorex/mail/Flags;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1858
    invoke-virtual {p0, v1, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v0

    .restart local v0    # "r":[Lcom/sun/mail/iap/Response;
    goto :goto_28
.end method


# virtual methods
.method public append(Ljava/lang/String;Lkorex/mail/Flags;Ljava/util/Date;Lcom/sun/mail/iap/Literal;)V
    .registers 11
    .param p1, "mbox"    # Ljava/lang/String;
    .param p2, "f"    # Lkorex/mail/Flags;
    .param p3, "d"    # Ljava/util/Date;
    .param p4, "data"    # Lcom/sun/mail/iap/Literal;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1259
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->appenduid(Ljava/lang/String;Lkorex/mail/Flags;Ljava/util/Date;Lcom/sun/mail/iap/Literal;Z)Lcom/sun/mail/imap/AppendUID;

    .line 1260
    return-void
.end method

.method public appenduid(Ljava/lang/String;Lkorex/mail/Flags;Ljava/util/Date;Lcom/sun/mail/iap/Literal;)Lcom/sun/mail/imap/AppendUID;
    .registers 11
    .param p1, "mbox"    # Ljava/lang/String;
    .param p2, "f"    # Lkorex/mail/Flags;
    .param p3, "d"    # Ljava/util/Date;
    .param p4, "data"    # Lcom/sun/mail/iap/Literal;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1269
    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->appenduid(Ljava/lang/String;Lkorex/mail/Flags;Ljava/util/Date;Lcom/sun/mail/iap/Literal;Z)Lcom/sun/mail/imap/AppendUID;

    move-result-object v0

    return-object v0
.end method

.method public appenduid(Ljava/lang/String;Lkorex/mail/Flags;Ljava/util/Date;Lcom/sun/mail/iap/Literal;Z)Lcom/sun/mail/imap/AppendUID;
    .registers 10
    .param p1, "mbox"    # Ljava/lang/String;
    .param p2, "f"    # Lkorex/mail/Flags;
    .param p3, "d"    # Ljava/util/Date;
    .param p4, "data"    # Lcom/sun/mail/iap/Literal;
    .param p5, "uid"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1275
    invoke-static {p1}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1277
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 1278
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-virtual {v0, p1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 1280
    if-eqz p2, :cond_28

    .line 1282
    sget-object v3, Lkorex/mail/Flags$Flag;->RECENT:Lkorex/mail/Flags$Flag;

    invoke-virtual {p2, v3}, Lkorex/mail/Flags;->contains(Lkorex/mail/Flags$Flag;)Z

    move-result v3

    if-eqz v3, :cond_21

    .line 1283
    new-instance v1, Lkorex/mail/Flags;

    invoke-direct {v1, p2}, Lkorex/mail/Flags;-><init>(Lkorex/mail/Flags;)V

    .line 1284
    .end local p2    # "f":Lkorex/mail/Flags;
    .local v1, "f":Lkorex/mail/Flags;
    sget-object v3, Lkorex/mail/Flags$Flag;->RECENT:Lkorex/mail/Flags$Flag;

    invoke-virtual {v1, v3}, Lkorex/mail/Flags;->remove(Lkorex/mail/Flags$Flag;)V

    move-object p2, v1

    .line 1297
    .end local v1    # "f":Lkorex/mail/Flags;
    .restart local p2    # "f":Lkorex/mail/Flags;
    :cond_21
    invoke-direct {p0, p2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->createFlagList(Lkorex/mail/Flags;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 1299
    :cond_28
    if-eqz p3, :cond_31

    .line 1300
    invoke-static {p3}, Lcom/sun/mail/imap/protocol/INTERNALDATE;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 1302
    :cond_31
    invoke-virtual {v0, p4}, Lcom/sun/mail/iap/Argument;->writeBytes(Lcom/sun/mail/iap/Literal;)Lcom/sun/mail/iap/Argument;

    .line 1304
    const-string v3, "APPEND"

    invoke-virtual {p0, v3, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v2

    .line 1307
    .local v2, "r":[Lcom/sun/mail/iap/Response;
    invoke-virtual {p0, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 1310
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    aget-object v3, v2, v3

    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 1312
    if-eqz p5, :cond_51

    .line 1313
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    aget-object v3, v2, v3

    invoke-direct {p0, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getAppendUID(Lcom/sun/mail/iap/Response;)Lcom/sun/mail/imap/AppendUID;

    move-result-object v3

    .line 1315
    :goto_50
    return-object v3

    :cond_51
    const/4 v3, 0x0

    goto :goto_50
.end method

.method public declared-synchronized authlogin(Ljava/lang/String;Ljava/lang/String;)V
    .registers 18
    .param p1, "u"    # Ljava/lang/String;
    .param p2, "p"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 434
    monitor-enter p0

    :try_start_1
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_98

    .line 435
    .local v11, "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/iap/Response;>;"
    const/4 v10, 0x0

    .line 436
    .local v10, "tag":Ljava/lang/String;
    const/4 v7, 0x0

    .line 437
    .local v7, "r":Lcom/sun/mail/iap/Response;
    const/4 v2, 0x0

    .line 441
    .local v2, "done":Z
    :try_start_9
    iget-boolean v12, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noauthdebug:Z

    if-eqz v12, :cond_1d

    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isTracing()Z

    move-result v12

    if-eqz v12, :cond_1d

    .line 442
    iget-object v12, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v13, "AUTHENTICATE LOGIN command trace suppressed"

    invoke-virtual {v12, v13}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 443
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->suspendTracing()V
    :try_end_1d
    .catchall {:try_start_9 .. :try_end_1d} :catchall_93

    .line 447
    :cond_1d
    :try_start_1d
    const-string v12, "AUTHENTICATE LOGIN"

    const/4 v13, 0x0

    invoke-virtual {p0, v12, v13}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->writeCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)Ljava/lang/String;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_23} :catch_6b
    .catchall {:try_start_1d .. :try_end_23} :catchall_93

    move-result-object v10

    .line 454
    :goto_24
    :try_start_24
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v6

    .line 472
    .local v6, "os":Ljava/io/OutputStream;
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 473
    .local v1, "bos":Ljava/io/ByteArrayOutputStream;
    new-instance v0, Lcom/sun/mail/util/BASE64EncoderStream;

    const v12, 0x7fffffff

    invoke-direct {v0, v1, v12}, Lcom/sun/mail/util/BASE64EncoderStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_35
    .catchall {:try_start_24 .. :try_end_35} :catchall_93

    .line 474
    .local v0, "b64os":Ljava/io/OutputStream;
    const/4 v4, 0x1

    .line 476
    .local v4, "first":Z
    :goto_36
    if-nez v2, :cond_9b

    .line 478
    :try_start_38
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->readResponse()Lcom/sun/mail/iap/Response;

    move-result-object v7

    .line 479
    invoke-virtual {v7}, Lcom/sun/mail/iap/Response;->isContinuation()Z

    move-result v12

    if-eqz v12, :cond_75

    .line 482
    if-eqz v4, :cond_72

    .line 483
    move-object/from16 v9, p1

    .line 484
    .local v9, "s":Ljava/lang/String;
    const/4 v4, 0x0

    .line 489
    :goto_47
    invoke-static {v9}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v12

    invoke-virtual {v0, v12}, Ljava/io/OutputStream;->write([B)V

    .line 490
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 492
    sget-object v12, Lcom/sun/mail/imap/protocol/IMAPProtocol;->CRLF:[B

    invoke-virtual {v1, v12}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 493
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v12

    invoke-virtual {v6, v12}, Ljava/io/OutputStream;->write([B)V

    .line 494
    invoke-virtual {v6}, Ljava/io/OutputStream;->flush()V

    .line 495
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->reset()V
    :try_end_63
    .catch Ljava/lang/Exception; {:try_start_38 .. :try_end_63} :catch_64
    .catchall {:try_start_38 .. :try_end_63} :catchall_93

    goto :goto_36

    .line 503
    .end local v9    # "s":Ljava/lang/String;
    :catch_64
    move-exception v5

    .line 505
    .local v5, "ioex":Ljava/lang/Exception;
    :try_start_65
    invoke-static {v5}, Lcom/sun/mail/iap/Response;->byeResponse(Ljava/lang/Exception;)Lcom/sun/mail/iap/Response;

    move-result-object v7

    .line 506
    const/4 v2, 0x1

    .line 507
    goto :goto_36

    .line 448
    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v1    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v4    # "first":Z
    .end local v5    # "ioex":Ljava/lang/Exception;
    .end local v6    # "os":Ljava/io/OutputStream;
    :catch_6b
    move-exception v3

    .line 450
    .local v3, "ex":Ljava/lang/Exception;
    invoke-static {v3}, Lcom/sun/mail/iap/Response;->byeResponse(Ljava/lang/Exception;)Lcom/sun/mail/iap/Response;
    :try_end_6f
    .catchall {:try_start_65 .. :try_end_6f} :catchall_93

    move-result-object v7

    .line 451
    const/4 v2, 0x1

    goto :goto_24

    .line 486
    .end local v3    # "ex":Ljava/lang/Exception;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    .restart local v1    # "bos":Ljava/io/ByteArrayOutputStream;
    .restart local v4    # "first":Z
    .restart local v6    # "os":Ljava/io/OutputStream;
    :cond_72
    move-object/from16 v9, p2

    .restart local v9    # "s":Ljava/lang/String;
    goto :goto_47

    .line 496
    .end local v9    # "s":Ljava/lang/String;
    :cond_75
    :try_start_75
    invoke-virtual {v7}, Lcom/sun/mail/iap/Response;->isTagged()Z

    move-result v12

    if-eqz v12, :cond_87

    invoke-virtual {v7}, Lcom/sun/mail/iap/Response;->getTag()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_87

    .line 498
    const/4 v2, 0x1

    goto :goto_36

    .line 499
    :cond_87
    invoke-virtual {v7}, Lcom/sun/mail/iap/Response;->isBYE()Z

    move-result v12

    if-eqz v12, :cond_8f

    .line 500
    const/4 v2, 0x1

    goto :goto_36

    .line 502
    :cond_8f
    invoke-interface {v11, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_92
    .catch Ljava/lang/Exception; {:try_start_75 .. :try_end_92} :catch_64
    .catchall {:try_start_75 .. :try_end_92} :catchall_93

    goto :goto_36

    .line 511
    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v1    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v4    # "first":Z
    .end local v6    # "os":Ljava/io/OutputStream;
    :catchall_93
    move-exception v12

    :try_start_94
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->resumeTracing()V

    throw v12
    :try_end_98
    .catchall {:try_start_94 .. :try_end_98} :catchall_98

    .line 434
    .end local v2    # "done":Z
    .end local v7    # "r":Lcom/sun/mail/iap/Response;
    .end local v10    # "tag":Ljava/lang/String;
    .end local v11    # "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/iap/Response;>;"
    :catchall_98
    move-exception v12

    monitor-exit p0

    throw v12

    .line 511
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    .restart local v1    # "bos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "done":Z
    .restart local v4    # "first":Z
    .restart local v6    # "os":Ljava/io/OutputStream;
    .restart local v7    # "r":Lcom/sun/mail/iap/Response;
    .restart local v10    # "tag":Ljava/lang/String;
    .restart local v11    # "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/iap/Response;>;"
    :cond_9b
    :try_start_9b
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->resumeTracing()V

    .line 520
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v12

    new-array v12, v12, [Lcom/sun/mail/iap/Response;

    invoke-interface {v11, v12}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Lcom/sun/mail/iap/Response;

    .line 521
    .local v8, "responses":[Lcom/sun/mail/iap/Response;
    invoke-virtual {p0, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 524
    iget-boolean v12, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noauthdebug:Z

    if-eqz v12, :cond_cf

    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isTracing()Z

    move-result v12

    if-eqz v12, :cond_cf

    .line 525
    iget-object v12, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "AUTHENTICATE LOGIN command result: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 526
    :cond_cf
    invoke-virtual {p0, v7}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 528
    invoke-virtual {p0, v7}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->setCapabilities(Lcom/sun/mail/iap/Response;)V

    .line 530
    const/4 v12, 0x1

    iput-boolean v12, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->authenticated:Z
    :try_end_d8
    .catchall {:try_start_9b .. :try_end_d8} :catchall_98

    .line 531
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized authntlm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 23
    .param p1, "authzid"    # Ljava/lang/String;
    .param p2, "u"    # Ljava/lang/String;
    .param p3, "p"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 657
    monitor-enter p0

    :try_start_1
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    .line 658
    .local v18, "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/iap/Response;>;"
    const/16 v16, 0x0

    .line 659
    .local v16, "tag":Ljava/lang/String;
    const/4 v13, 0x0

    .line 660
    .local v13, "r":Lcom/sun/mail/iap/Response;
    const/4 v7, 0x0

    .line 662
    .local v7, "done":Z
    const/16 v17, 0x0

    .line 663
    .local v17, "type1Msg":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->props:Ljava/util/Properties;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mail."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".auth.ntlm.flags"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Lcom/sun/mail/util/PropUtil;->getIntProperty(Ljava/util/Properties;Ljava/lang/String;I)I

    move-result v10

    .line 665
    .local v10, "flags":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->props:Ljava/util/Properties;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mail."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".auth.ntlm.domain"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 667
    .local v2, "domain":Ljava/lang/String;
    new-instance v1, Lcom/sun/mail/auth/Ntlm;

    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getLocalHost()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    invoke-direct/range {v1 .. v6}, Lcom/sun/mail/auth/Ntlm;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/sun/mail/util/MailLogger;)V
    :try_end_6a
    .catchall {:try_start_1 .. :try_end_6a} :catchall_f1

    .line 671
    .local v1, "ntlm":Lcom/sun/mail/auth/Ntlm;
    :try_start_6a
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noauthdebug:Z

    if-eqz v3, :cond_82

    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isTracing()Z

    move-result v3

    if-eqz v3, :cond_82

    .line 672
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v4, "AUTHENTICATE NTLM command trace suppressed"

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 673
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->suspendTracing()V
    :try_end_82
    .catchall {:try_start_6a .. :try_end_82} :catchall_ec

    .line 677
    :cond_82
    :try_start_82
    const-string v3, "AUTHENTICATE NTLM"

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->writeCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)Ljava/lang/String;
    :try_end_8a
    .catch Ljava/lang/Exception; {:try_start_82 .. :try_end_8a} :catch_ba
    .catchall {:try_start_82 .. :try_end_8a} :catchall_ec

    move-result-object v16

    .line 684
    :goto_8b
    :try_start_8b
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getOutputStream()Ljava/io/OutputStream;
    :try_end_8e
    .catchall {:try_start_8b .. :try_end_8e} :catchall_ec

    move-result-object v12

    .line 685
    .local v12, "os":Ljava/io/OutputStream;
    const/4 v9, 0x1

    .line 687
    .local v9, "first":Z
    :goto_90
    if-nez v7, :cond_f4

    .line 689
    :try_start_92
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->readResponse()Lcom/sun/mail/iap/Response;

    move-result-object v13

    .line 690
    invoke-virtual {v13}, Lcom/sun/mail/iap/Response;->isContinuation()Z

    move-result v3

    if-eqz v3, :cond_ca

    .line 693
    if-eqz v9, :cond_c1

    .line 694
    invoke-virtual {v1, v10}, Lcom/sun/mail/auth/Ntlm;->generateType1Msg(I)Ljava/lang/String;

    move-result-object v15

    .line 695
    .local v15, "s":Ljava/lang/String;
    const/4 v9, 0x0

    .line 700
    :goto_a3
    invoke-static {v15}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v12, v3}, Ljava/io/OutputStream;->write([B)V

    .line 701
    sget-object v3, Lcom/sun/mail/imap/protocol/IMAPProtocol;->CRLF:[B

    invoke-virtual {v12, v3}, Ljava/io/OutputStream;->write([B)V

    .line 702
    invoke-virtual {v12}, Ljava/io/OutputStream;->flush()V
    :try_end_b2
    .catch Ljava/lang/Exception; {:try_start_92 .. :try_end_b2} :catch_b3
    .catchall {:try_start_92 .. :try_end_b2} :catchall_ec

    goto :goto_90

    .line 710
    .end local v15    # "s":Ljava/lang/String;
    :catch_b3
    move-exception v11

    .line 712
    .local v11, "ioex":Ljava/lang/Exception;
    :try_start_b4
    invoke-static {v11}, Lcom/sun/mail/iap/Response;->byeResponse(Ljava/lang/Exception;)Lcom/sun/mail/iap/Response;

    move-result-object v13

    .line 713
    const/4 v7, 0x1

    .line 714
    goto :goto_90

    .line 678
    .end local v9    # "first":Z
    .end local v11    # "ioex":Ljava/lang/Exception;
    .end local v12    # "os":Ljava/io/OutputStream;
    :catch_ba
    move-exception v8

    .line 680
    .local v8, "ex":Ljava/lang/Exception;
    invoke-static {v8}, Lcom/sun/mail/iap/Response;->byeResponse(Ljava/lang/Exception;)Lcom/sun/mail/iap/Response;
    :try_end_be
    .catchall {:try_start_b4 .. :try_end_be} :catchall_ec

    move-result-object v13

    .line 681
    const/4 v7, 0x1

    goto :goto_8b

    .line 697
    .end local v8    # "ex":Ljava/lang/Exception;
    .restart local v9    # "first":Z
    .restart local v12    # "os":Ljava/io/OutputStream;
    :cond_c1
    :try_start_c1
    invoke-virtual {v13}, Lcom/sun/mail/iap/Response;->getRest()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/sun/mail/auth/Ntlm;->generateType3Msg(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .restart local v15    # "s":Ljava/lang/String;
    goto :goto_a3

    .line 703
    .end local v15    # "s":Ljava/lang/String;
    :cond_ca
    invoke-virtual {v13}, Lcom/sun/mail/iap/Response;->isTagged()Z

    move-result v3

    if-eqz v3, :cond_de

    invoke-virtual {v13}, Lcom/sun/mail/iap/Response;->getTag()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_de

    .line 705
    const/4 v7, 0x1

    goto :goto_90

    .line 706
    :cond_de
    invoke-virtual {v13}, Lcom/sun/mail/iap/Response;->isBYE()Z

    move-result v3

    if-eqz v3, :cond_e6

    .line 707
    const/4 v7, 0x1

    goto :goto_90

    .line 709
    :cond_e6
    move-object/from16 v0, v18

    invoke-interface {v0, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_eb
    .catch Ljava/lang/Exception; {:try_start_c1 .. :try_end_eb} :catch_b3
    .catchall {:try_start_c1 .. :try_end_eb} :catchall_ec

    goto :goto_90

    .line 718
    .end local v9    # "first":Z
    .end local v12    # "os":Ljava/io/OutputStream;
    :catchall_ec
    move-exception v3

    :try_start_ed
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->resumeTracing()V

    throw v3
    :try_end_f1
    .catchall {:try_start_ed .. :try_end_f1} :catchall_f1

    .line 657
    .end local v1    # "ntlm":Lcom/sun/mail/auth/Ntlm;
    .end local v2    # "domain":Ljava/lang/String;
    .end local v7    # "done":Z
    .end local v10    # "flags":I
    .end local v13    # "r":Lcom/sun/mail/iap/Response;
    .end local v16    # "tag":Ljava/lang/String;
    .end local v17    # "type1Msg":Ljava/lang/String;
    .end local v18    # "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/iap/Response;>;"
    :catchall_f1
    move-exception v3

    monitor-exit p0

    throw v3

    .line 718
    .restart local v1    # "ntlm":Lcom/sun/mail/auth/Ntlm;
    .restart local v2    # "domain":Ljava/lang/String;
    .restart local v7    # "done":Z
    .restart local v9    # "first":Z
    .restart local v10    # "flags":I
    .restart local v12    # "os":Ljava/io/OutputStream;
    .restart local v13    # "r":Lcom/sun/mail/iap/Response;
    .restart local v16    # "tag":Ljava/lang/String;
    .restart local v17    # "type1Msg":Ljava/lang/String;
    .restart local v18    # "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/iap/Response;>;"
    :cond_f4
    :try_start_f4
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->resumeTracing()V

    .line 728
    invoke-interface/range {v18 .. v18}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Lcom/sun/mail/iap/Response;

    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v14

    check-cast v14, [Lcom/sun/mail/iap/Response;

    .line 729
    .local v14, "responses":[Lcom/sun/mail/iap/Response;
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 732
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noauthdebug:Z

    if-eqz v3, :cond_130

    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isTracing()Z

    move-result v3

    if-eqz v3, :cond_130

    .line 733
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "AUTHENTICATE NTLM command result: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 734
    :cond_130
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 736
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->setCapabilities(Lcom/sun/mail/iap/Response;)V

    .line 738
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->authenticated:Z
    :try_end_13f
    .catchall {:try_start_f4 .. :try_end_13f} :catchall_f1

    .line 739
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized authplain(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 20
    .param p1, "authzid"    # Ljava/lang/String;
    .param p2, "u"    # Ljava/lang/String;
    .param p3, "p"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 548
    monitor-enter p0

    :try_start_1
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_c4

    .line 549
    .local v12, "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/iap/Response;>;"
    const/4 v11, 0x0

    .line 550
    .local v11, "tag":Ljava/lang/String;
    const/4 v8, 0x0

    .line 551
    .local v8, "r":Lcom/sun/mail/iap/Response;
    const/4 v3, 0x0

    .line 555
    .local v3, "done":Z
    :try_start_9
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noauthdebug:Z

    if-eqz v13, :cond_21

    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isTracing()Z

    move-result v13

    if-eqz v13, :cond_21

    .line 556
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v14, "AUTHENTICATE PLAIN command trace suppressed"

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 557
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->suspendTracing()V
    :try_end_21
    .catchall {:try_start_9 .. :try_end_21} :catchall_bf

    .line 561
    :cond_21
    :try_start_21
    const-string v13, "AUTHENTICATE PLAIN"

    const/4 v14, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->writeCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)Ljava/lang/String;
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_29} :catch_96
    .catchall {:try_start_21 .. :try_end_29} :catchall_bf

    move-result-object v11

    .line 568
    :goto_2a
    :try_start_2a
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v7

    .line 586
    .local v7, "os":Ljava/io/OutputStream;
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 587
    .local v2, "bos":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Lcom/sun/mail/util/BASE64EncoderStream;

    const v13, 0x7fffffff

    invoke-direct {v1, v2, v13}, Lcom/sun/mail/util/BASE64EncoderStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_3b
    .catchall {:try_start_2a .. :try_end_3b} :catchall_bf

    .line 589
    .local v1, "b64os":Ljava/io/OutputStream;
    :goto_3b
    if-nez v3, :cond_c7

    .line 591
    :try_start_3d
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->readResponse()Lcom/sun/mail/iap/Response;

    move-result-object v8

    .line 592
    invoke-virtual {v8}, Lcom/sun/mail/iap/Response;->isContinuation()Z

    move-result v13

    if-eqz v13, :cond_a0

    .line 594
    const-string v6, "\u0000"

    .line 595
    .local v6, "nullByte":Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    if-nez p1, :cond_9d

    const-string v13, ""

    :goto_52
    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "\u0000"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "\u0000"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 599
    .local v10, "s":Ljava/lang/String;
    invoke-static {v10}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v13

    invoke-virtual {v1, v13}, Ljava/io/OutputStream;->write([B)V

    .line 600
    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V

    .line 602
    sget-object v13, Lcom/sun/mail/imap/protocol/IMAPProtocol;->CRLF:[B

    invoke-virtual {v2, v13}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 603
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v13

    invoke-virtual {v7, v13}, Ljava/io/OutputStream;->write([B)V

    .line 604
    invoke-virtual {v7}, Ljava/io/OutputStream;->flush()V

    .line 605
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->reset()V
    :try_end_8e
    .catch Ljava/lang/Exception; {:try_start_3d .. :try_end_8e} :catch_8f
    .catchall {:try_start_3d .. :try_end_8e} :catchall_bf

    goto :goto_3b

    .line 613
    .end local v6    # "nullByte":Ljava/lang/String;
    .end local v10    # "s":Ljava/lang/String;
    :catch_8f
    move-exception v5

    .line 615
    .local v5, "ioex":Ljava/lang/Exception;
    :try_start_90
    invoke-static {v5}, Lcom/sun/mail/iap/Response;->byeResponse(Ljava/lang/Exception;)Lcom/sun/mail/iap/Response;

    move-result-object v8

    .line 616
    const/4 v3, 0x1

    .line 617
    goto :goto_3b

    .line 562
    .end local v1    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v5    # "ioex":Ljava/lang/Exception;
    .end local v7    # "os":Ljava/io/OutputStream;
    :catch_96
    move-exception v4

    .line 564
    .local v4, "ex":Ljava/lang/Exception;
    invoke-static {v4}, Lcom/sun/mail/iap/Response;->byeResponse(Ljava/lang/Exception;)Lcom/sun/mail/iap/Response;
    :try_end_9a
    .catchall {:try_start_90 .. :try_end_9a} :catchall_bf

    move-result-object v8

    .line 565
    const/4 v3, 0x1

    goto :goto_2a

    .end local v4    # "ex":Ljava/lang/Exception;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v2    # "bos":Ljava/io/ByteArrayOutputStream;
    .restart local v6    # "nullByte":Ljava/lang/String;
    .restart local v7    # "os":Ljava/io/OutputStream;
    :cond_9d
    move-object/from16 v13, p1

    .line 595
    goto :goto_52

    .line 606
    .end local v6    # "nullByte":Ljava/lang/String;
    :cond_a0
    :try_start_a0
    invoke-virtual {v8}, Lcom/sun/mail/iap/Response;->isTagged()Z

    move-result v13

    if-eqz v13, :cond_b2

    invoke-virtual {v8}, Lcom/sun/mail/iap/Response;->getTag()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_b2

    .line 608
    const/4 v3, 0x1

    goto :goto_3b

    .line 609
    :cond_b2
    invoke-virtual {v8}, Lcom/sun/mail/iap/Response;->isBYE()Z

    move-result v13

    if-eqz v13, :cond_ba

    .line 610
    const/4 v3, 0x1

    goto :goto_3b

    .line 612
    :cond_ba
    invoke-interface {v12, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_bd
    .catch Ljava/lang/Exception; {:try_start_a0 .. :try_end_bd} :catch_8f
    .catchall {:try_start_a0 .. :try_end_bd} :catchall_bf

    goto/16 :goto_3b

    .line 621
    .end local v1    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "os":Ljava/io/OutputStream;
    :catchall_bf
    move-exception v13

    :try_start_c0
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->resumeTracing()V

    throw v13
    :try_end_c4
    .catchall {:try_start_c0 .. :try_end_c4} :catchall_c4

    .line 548
    .end local v3    # "done":Z
    .end local v8    # "r":Lcom/sun/mail/iap/Response;
    .end local v11    # "tag":Ljava/lang/String;
    .end local v12    # "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/iap/Response;>;"
    :catchall_c4
    move-exception v13

    monitor-exit p0

    throw v13

    .line 621
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v2    # "bos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "done":Z
    .restart local v7    # "os":Ljava/io/OutputStream;
    .restart local v8    # "r":Lcom/sun/mail/iap/Response;
    .restart local v11    # "tag":Ljava/lang/String;
    .restart local v12    # "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/iap/Response;>;"
    :cond_c7
    :try_start_c7
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->resumeTracing()V

    .line 630
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v13

    new-array v13, v13, [Lcom/sun/mail/iap/Response;

    invoke-interface {v12, v13}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Lcom/sun/mail/iap/Response;

    .line 631
    .local v9, "responses":[Lcom/sun/mail/iap/Response;
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 634
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noauthdebug:Z

    if-eqz v13, :cond_101

    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isTracing()Z

    move-result v13

    if-eqz v13, :cond_101

    .line 635
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "AUTHENTICATE PLAIN command result: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 636
    :cond_101
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 638
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->setCapabilities(Lcom/sun/mail/iap/Response;)V

    .line 640
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->authenticated:Z
    :try_end_110
    .catchall {:try_start_c7 .. :try_end_110} :catchall_c4

    .line 641
    monitor-exit p0

    return-void
.end method

.method public capability()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 200
    const-string v4, "CAPABILITY"

    const/4 v5, 0x0

    invoke-virtual {p0, v4, v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v3

    .line 202
    .local v3, "r":[Lcom/sun/mail/iap/Response;
    array-length v4, v3

    add-int/lit8 v4, v4, -0x1

    aget-object v4, v3, v4

    invoke-virtual {v4}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v4

    if-nez v4, :cond_21

    .line 203
    new-instance v4, Lcom/sun/mail/iap/ProtocolException;

    array-length v5, v3

    add-int/lit8 v5, v5, -0x1

    aget-object v5, v3, v5

    invoke-virtual {v5}, Lcom/sun/mail/iap/Response;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/sun/mail/iap/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 205
    :cond_21
    new-instance v4, Ljava/util/HashMap;

    const/16 v5, 0xa

    invoke-direct {v4, v5}, Ljava/util/HashMap;-><init>(I)V

    iput-object v4, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->capabilities:Ljava/util/Map;

    .line 206
    new-instance v4, Ljava/util/ArrayList;

    const/4 v5, 0x5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v4, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->authmechs:Ljava/util/List;

    .line 207
    const/4 v0, 0x0

    .local v0, "i":I
    array-length v2, v3

    .local v2, "len":I
    :goto_34
    if-ge v0, v2, :cond_4f

    .line 208
    aget-object v4, v3, v0

    instance-of v4, v4, Lcom/sun/mail/imap/protocol/IMAPResponse;

    if-nez v4, :cond_3f

    .line 207
    :cond_3c
    :goto_3c
    add-int/lit8 v0, v0, 0x1

    goto :goto_34

    .line 211
    :cond_3f
    aget-object v1, v3, v0

    check-cast v1, Lcom/sun/mail/imap/protocol/IMAPResponse;

    .line 217
    .local v1, "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    const-string v4, "CAPABILITY"

    invoke-virtual {v1, v4}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3c

    .line 218
    invoke-virtual {p0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->parseCapabilities(Lcom/sun/mail/iap/Response;)V

    goto :goto_3c

    .line 220
    .end local v1    # "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    :cond_4f
    return-void
.end method

.method public check()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1346
    const-string v0, "CHECK"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->simpleCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)V

    .line 1347
    return-void
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1355
    const-string v0, "CLOSE"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->simpleCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)V

    .line 1356
    return-void
.end method

.method public copy(IILjava/lang/String;)V
    .registers 6
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "mbox"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1765
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p3, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->copyuid(Ljava/lang/String;Ljava/lang/String;Z)Lcom/sun/mail/imap/CopyUID;

    .line 1767
    return-void
.end method

.method public copy([Lcom/sun/mail/imap/protocol/MessageSet;Ljava/lang/String;)V
    .registers 5
    .param p1, "msgsets"    # [Lcom/sun/mail/imap/protocol/MessageSet;
    .param p2, "mbox"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1760
    invoke-static {p1}, Lcom/sun/mail/imap/protocol/MessageSet;->toString([Lcom/sun/mail/imap/protocol/MessageSet;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p2, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->copyuid(Ljava/lang/String;Ljava/lang/String;Z)Lcom/sun/mail/imap/CopyUID;

    .line 1761
    return-void
.end method

.method public copyuid(IILjava/lang/String;)Lcom/sun/mail/imap/CopyUID;
    .registers 6
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "mbox"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1781
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, p3, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->copyuid(Ljava/lang/String;Ljava/lang/String;Z)Lcom/sun/mail/imap/CopyUID;

    move-result-object v0

    return-object v0
.end method

.method public copyuid(Ljava/lang/String;Ljava/lang/String;Z)Lcom/sun/mail/imap/CopyUID;
    .registers 7
    .param p1, "msgSequence"    # Ljava/lang/String;
    .param p2, "mbox"    # Ljava/lang/String;
    .param p3, "uid"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1788
    invoke-static {p2}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1790
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 1791
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-virtual {v0, p1}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 1792
    invoke-virtual {v0, p2}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 1794
    const-string v2, "COPY"

    invoke-virtual {p0, v2, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v1

    .line 1797
    .local v1, "r":[Lcom/sun/mail/iap/Response;
    invoke-virtual {p0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 1800
    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    aget-object v2, v1, v2

    invoke-virtual {p0, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 1802
    if-eqz p3, :cond_2c

    .line 1803
    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    aget-object v2, v1, v2

    invoke-direct {p0, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getCopyUID(Lcom/sun/mail/iap/Response;)Lcom/sun/mail/imap/CopyUID;

    move-result-object v2

    .line 1805
    :goto_2b
    return-object v2

    :cond_2c
    const/4 v2, 0x0

    goto :goto_2b
.end method

.method public copyuid([Lcom/sun/mail/imap/protocol/MessageSet;Ljava/lang/String;)Lcom/sun/mail/imap/CopyUID;
    .registers 5
    .param p1, "msgsets"    # [Lcom/sun/mail/imap/protocol/MessageSet;
    .param p2, "mbox"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1776
    invoke-static {p1}, Lcom/sun/mail/imap/protocol/MessageSet;->toString([Lcom/sun/mail/imap/protocol/MessageSet;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, p2, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->copyuid(Ljava/lang/String;Ljava/lang/String;Z)Lcom/sun/mail/imap/CopyUID;

    move-result-object v0

    return-object v0
.end method

.method public create(Ljava/lang/String;)V
    .registers 4
    .param p1, "mbox"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1120
    invoke-static {p1}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1122
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 1123
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-virtual {v0, p1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 1125
    const-string v1, "CREATE"

    invoke-virtual {p0, v1, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->simpleCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)V

    .line 1126
    return-void
.end method

.method public delete(Ljava/lang/String;)V
    .registers 4
    .param p1, "mbox"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1135
    invoke-static {p1}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1137
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 1138
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-virtual {v0, p1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 1140
    const-string v1, "DELETE"

    invoke-virtual {p0, v1, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->simpleCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)V

    .line 1141
    return-void
.end method

.method public deleteACL(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "mbox"    # Ljava/lang/String;
    .param p2, "user"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 2407
    const-string v3, "ACL"

    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_10

    .line 2408
    new-instance v3, Lcom/sun/mail/iap/BadCommandException;

    const-string v4, "ACL not supported"

    invoke-direct {v3, v4}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 2411
    :cond_10
    invoke-static {p1}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2413
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 2414
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-virtual {v0, p1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 2415
    invoke-virtual {v0, p2}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 2417
    const-string v3, "DELETEACL"

    invoke-virtual {p0, v3, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v1

    .line 2418
    .local v1, "r":[Lcom/sun/mail/iap/Response;
    array-length v3, v1

    add-int/lit8 v3, v3, -0x1

    aget-object v2, v1, v3

    .line 2421
    .local v2, "response":Lcom/sun/mail/iap/Response;
    invoke-virtual {p0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 2422
    invoke-virtual {p0, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 2423
    return-void
.end method

.method public disconnect()V
    .registers 2

    .prologue
    .line 361
    invoke-super {p0}, Lcom/sun/mail/iap/Protocol;->disconnect()V

    .line 362
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->authenticated:Z

    .line 363
    return-void
.end method

.method protected doList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Lcom/sun/mail/imap/protocol/ListInfo;
    .registers 13
    .param p1, "cmd"    # Ljava/lang/String;
    .param p2, "ref"    # Ljava/lang/String;
    .param p3, "pat"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1217
    invoke-static {p2}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1218
    invoke-static {p3}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 1220
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 1221
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-virtual {v0, p2}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 1222
    invoke-virtual {v0, p3}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 1224
    invoke-virtual {p0, p1, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v5

    .line 1226
    .local v5, "r":[Lcom/sun/mail/iap/Response;
    const/4 v4, 0x0

    .line 1227
    .local v4, "linfo":[Lcom/sun/mail/imap/protocol/ListInfo;
    array-length v8, v5

    add-int/lit8 v8, v8, -0x1

    aget-object v6, v5, v8

    .line 1229
    .local v6, "response":Lcom/sun/mail/iap/Response;
    invoke-virtual {v6}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v8

    if-eqz v8, :cond_5e

    .line 1230
    new-instance v7, Ljava/util/ArrayList;

    const/4 v8, 0x1

    invoke-direct {v7, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 1231
    .local v7, "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/protocol/ListInfo;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    array-length v3, v5

    .local v3, "len":I
    :goto_2b
    if-ge v1, v3, :cond_4c

    .line 1232
    aget-object v8, v5, v1

    instance-of v8, v8, Lcom/sun/mail/imap/protocol/IMAPResponse;

    if-nez v8, :cond_36

    .line 1231
    :cond_33
    :goto_33
    add-int/lit8 v1, v1, 0x1

    goto :goto_2b

    .line 1235
    :cond_36
    aget-object v2, v5, v1

    check-cast v2, Lcom/sun/mail/imap/protocol/IMAPResponse;

    .line 1236
    .local v2, "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    invoke-virtual {v2, p1}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_33

    .line 1237
    new-instance v8, Lcom/sun/mail/imap/protocol/ListInfo;

    invoke-direct {v8, v2}, Lcom/sun/mail/imap/protocol/ListInfo;-><init>(Lcom/sun/mail/imap/protocol/IMAPResponse;)V

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1238
    const/4 v8, 0x0

    aput-object v8, v5, v1

    goto :goto_33

    .line 1241
    .end local v2    # "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    :cond_4c
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    if-lez v8, :cond_5e

    .line 1242
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    new-array v8, v8, [Lcom/sun/mail/imap/protocol/ListInfo;

    invoke-interface {v7, v8}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "linfo":[Lcom/sun/mail/imap/protocol/ListInfo;
    check-cast v4, [Lcom/sun/mail/imap/protocol/ListInfo;

    .line 1247
    .end local v1    # "i":I
    .end local v3    # "len":I
    .end local v7    # "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/protocol/ListInfo;>;"
    .restart local v4    # "linfo":[Lcom/sun/mail/imap/protocol/ListInfo;
    :cond_5e
    invoke-virtual {p0, v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 1248
    invoke-virtual {p0, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 1249
    return-object v4
.end method

.method public enable(Ljava/lang/String;)V
    .registers 5
    .param p1, "cap"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1024
    const-string v1, "ENABLE"

    invoke-virtual {p0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_10

    .line 1025
    new-instance v1, Lcom/sun/mail/iap/BadCommandException;

    const-string v2, "ENABLE not supported"

    invoke-direct {v1, v2}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1026
    :cond_10
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 1027
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-virtual {v0, p1}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 1028
    const-string v1, "ENABLE"

    invoke-virtual {p0, v1, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->simpleCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)V

    .line 1029
    iget-object v1, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->enabled:Ljava/util/Set;

    if-nez v1, :cond_28

    .line 1030
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->enabled:Ljava/util/Set;

    .line 1031
    :cond_28
    iget-object v1, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->enabled:Ljava/util/Set;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1032
    return-void
.end method

.method public examine(Ljava/lang/String;)Lcom/sun/mail/imap/protocol/MailboxInfo;
    .registers 3
    .param p1, "mbox"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 957
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->examine(Ljava/lang/String;Lcom/sun/mail/imap/ResyncData;)Lcom/sun/mail/imap/protocol/MailboxInfo;

    move-result-object v0

    return-object v0
.end method

.method public examine(Ljava/lang/String;Lcom/sun/mail/imap/ResyncData;)Lcom/sun/mail/imap/protocol/MailboxInfo;
    .registers 8
    .param p1, "mbox"    # Ljava/lang/String;
    .param p2, "rd"    # Lcom/sun/mail/imap/ResyncData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 970
    invoke-static {p1}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 972
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 973
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-virtual {v0, p1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 975
    if-eqz p2, :cond_30

    .line 976
    sget-object v3, Lcom/sun/mail/imap/ResyncData;->CONDSTORE:Lcom/sun/mail/imap/ResyncData;

    if-ne p2, v3, :cond_4a

    .line 977
    const-string v3, "CONDSTORE"

    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_22

    .line 978
    new-instance v3, Lcom/sun/mail/iap/BadCommandException;

    const-string v4, "CONDSTORE not supported"

    invoke-direct {v3, v4}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 979
    :cond_22
    new-instance v3, Lcom/sun/mail/iap/Argument;

    invoke-direct {v3}, Lcom/sun/mail/iap/Argument;-><init>()V

    const-string v4, "CONDSTORE"

    invoke-virtual {v3, v4}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/sun/mail/iap/Argument;->writeArgument(Lcom/sun/mail/iap/Argument;)Lcom/sun/mail/iap/Argument;

    .line 987
    :cond_30
    :goto_30
    const-string v3, "EXAMINE"

    invoke-virtual {p0, v3, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v2

    .line 991
    .local v2, "r":[Lcom/sun/mail/iap/Response;
    new-instance v1, Lcom/sun/mail/imap/protocol/MailboxInfo;

    invoke-direct {v1, v2}, Lcom/sun/mail/imap/protocol/MailboxInfo;-><init>([Lcom/sun/mail/iap/Response;)V

    .line 992
    .local v1, "minfo":Lcom/sun/mail/imap/protocol/MailboxInfo;
    const/4 v3, 0x1

    iput v3, v1, Lcom/sun/mail/imap/protocol/MailboxInfo;->mode:I

    .line 995
    invoke-virtual {p0, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 997
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    aget-object v3, v2, v3

    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 998
    return-object v1

    .line 981
    .end local v1    # "minfo":Lcom/sun/mail/imap/protocol/MailboxInfo;
    .end local v2    # "r":[Lcom/sun/mail/iap/Response;
    :cond_4a
    const-string v3, "QRESYNC"

    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5a

    .line 982
    new-instance v3, Lcom/sun/mail/iap/BadCommandException;

    const-string v4, "QRESYNC not supported"

    invoke-direct {v3, v4}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 983
    :cond_5a
    invoke-static {p2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->resyncArgs(Lcom/sun/mail/imap/ResyncData;)Lcom/sun/mail/iap/Argument;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/sun/mail/iap/Argument;->writeArgument(Lcom/sun/mail/iap/Argument;)Lcom/sun/mail/iap/Argument;

    goto :goto_30
.end method

.method public expunge()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1364
    const-string v0, "EXPUNGE"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->simpleCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)V

    .line 1365
    return-void
.end method

.method public fetch(IILjava/lang/String;)[Lcom/sun/mail/iap/Response;
    .registers 6
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "what"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1738
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, p3, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetch(Ljava/lang/String;Ljava/lang/String;Z)[Lcom/sun/mail/iap/Response;

    move-result-object v0

    return-object v0
.end method

.method public fetch(ILjava/lang/String;)[Lcom/sun/mail/iap/Response;
    .registers 5
    .param p1, "msg"    # I
    .param p2, "what"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1744
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, p2, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetch(Ljava/lang/String;Ljava/lang/String;Z)[Lcom/sun/mail/iap/Response;

    move-result-object v0

    return-object v0
.end method

.method public fetch([Lcom/sun/mail/imap/protocol/MessageSet;Ljava/lang/String;)[Lcom/sun/mail/iap/Response;
    .registers 5
    .param p1, "msgsets"    # [Lcom/sun/mail/imap/protocol/MessageSet;
    .param p2, "what"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1733
    invoke-static {p1}, Lcom/sun/mail/imap/protocol/MessageSet;->toString([Lcom/sun/mail/imap/protocol/MessageSet;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, p2, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetch(Ljava/lang/String;Ljava/lang/String;Z)[Lcom/sun/mail/iap/Response;

    move-result-object v0

    return-object v0
.end method

.method public fetchBody(ILjava/lang/String;)Lcom/sun/mail/imap/protocol/BODY;
    .registers 4
    .param p1, "msgno"    # I
    .param p2, "section"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1411
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchBody(ILjava/lang/String;Z)Lcom/sun/mail/imap/protocol/BODY;

    move-result-object v0

    return-object v0
.end method

.method public fetchBody(ILjava/lang/String;II)Lcom/sun/mail/imap/protocol/BODY;
    .registers 12
    .param p1, "msgno"    # I
    .param p2, "section"    # Ljava/lang/String;
    .param p3, "start"    # I
    .param p4, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1437
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchBody(ILjava/lang/String;IIZLcom/sun/mail/iap/ByteArray;)Lcom/sun/mail/imap/protocol/BODY;

    move-result-object v0

    return-object v0
.end method

.method public fetchBody(ILjava/lang/String;IILcom/sun/mail/iap/ByteArray;)Lcom/sun/mail/imap/protocol/BODY;
    .registers 13
    .param p1, "msgno"    # I
    .param p2, "section"    # Ljava/lang/String;
    .param p3, "start"    # I
    .param p4, "size"    # I
    .param p5, "ba"    # Lcom/sun/mail/iap/ByteArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1453
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchBody(ILjava/lang/String;IIZLcom/sun/mail/iap/ByteArray;)Lcom/sun/mail/imap/protocol/BODY;

    move-result-object v0

    return-object v0
.end method

.method protected fetchBody(ILjava/lang/String;IIZLcom/sun/mail/iap/ByteArray;)Lcom/sun/mail/imap/protocol/BODY;
    .registers 10
    .param p1, "msgno"    # I
    .param p2, "section"    # Ljava/lang/String;
    .param p3, "start"    # I
    .param p4, "size"    # I
    .param p5, "peek"    # Z
    .param p6, "ba"    # Lcom/sun/mail/iap/ByteArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1458
    iput-object p6, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->ba:Lcom/sun/mail/iap/ByteArray;

    .line 1459
    if-nez p2, :cond_6

    .line 1460
    const-string p2, ""

    .line 1461
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p5, :cond_42

    const-string v1, "BODY.PEEK["

    :goto_f
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]<"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1462
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1463
    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1464
    .local v0, "body":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchSectionBody(ILjava/lang/String;Ljava/lang/String;)Lcom/sun/mail/imap/protocol/BODY;

    move-result-object v1

    return-object v1

    .line 1461
    .end local v0    # "body":Ljava/lang/String;
    :cond_42
    const-string v1, "BODY["

    goto :goto_f
.end method

.method protected fetchBody(ILjava/lang/String;Z)Lcom/sun/mail/imap/protocol/BODY;
    .registers 7
    .param p1, "msgno"    # I
    .param p2, "section"    # Ljava/lang/String;
    .param p3, "peek"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1418
    if-nez p2, :cond_4

    .line 1419
    const-string p2, ""

    .line 1420
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p3, :cond_24

    const-string v1, "BODY.PEEK["

    :goto_d
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1421
    .local v0, "body":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchSectionBody(ILjava/lang/String;Ljava/lang/String;)Lcom/sun/mail/imap/protocol/BODY;

    move-result-object v1

    return-object v1

    .line 1420
    .end local v0    # "body":Ljava/lang/String;
    :cond_24
    const-string v1, "BODY["

    goto :goto_d
.end method

.method public fetchBodyStructure(I)Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;
    .registers 6
    .param p1, "msgno"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1383
    const-string v3, "BODYSTRUCTURE"

    invoke-virtual {p0, p1, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetch(ILjava/lang/String;)[Lcom/sun/mail/iap/Response;

    move-result-object v0

    .line 1384
    .local v0, "r":[Lcom/sun/mail/iap/Response;
    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 1386
    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    aget-object v1, v0, v3

    .line 1387
    .local v1, "response":Lcom/sun/mail/iap/Response;
    invoke-virtual {v1}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 1388
    const-class v2, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    invoke-static {v0, p1, v2}, Lcom/sun/mail/imap/protocol/FetchResponse;->getItem([Lcom/sun/mail/iap/Response;ILjava/lang/Class;)Lcom/sun/mail/imap/protocol/Item;

    move-result-object v2

    check-cast v2, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    .line 1393
    :cond_1d
    :goto_1d
    return-object v2

    .line 1389
    :cond_1e
    invoke-virtual {v1}, Lcom/sun/mail/iap/Response;->isNO()Z

    move-result v3

    if-nez v3, :cond_1d

    .line 1392
    invoke-virtual {p0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    goto :goto_1d
.end method

.method public fetchFlags(I)Lkorex/mail/Flags;
    .registers 8
    .param p1, "msgno"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1542
    const/4 v0, 0x0

    .line 1543
    .local v0, "flags":Lkorex/mail/Flags;
    const-string v5, "FLAGS"

    invoke-virtual {p0, p1, v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetch(ILjava/lang/String;)[Lcom/sun/mail/iap/Response;

    move-result-object v4

    .line 1546
    .local v4, "r":[Lcom/sun/mail/iap/Response;
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v3, v4

    .local v3, "len":I
    :goto_9
    if-ge v2, v3, :cond_33

    .line 1547
    aget-object v5, v4, v2

    if-eqz v5, :cond_1f

    aget-object v5, v4, v2

    instance-of v5, v5, Lcom/sun/mail/imap/protocol/FetchResponse;

    if-eqz v5, :cond_1f

    aget-object v5, v4, v2

    check-cast v5, Lcom/sun/mail/imap/protocol/FetchResponse;

    .line 1549
    invoke-virtual {v5}, Lcom/sun/mail/imap/protocol/FetchResponse;->getNumber()I

    move-result v5

    if-eq v5, p1, :cond_22

    .line 1546
    :cond_1f
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 1552
    :cond_22
    aget-object v1, v4, v2

    check-cast v1, Lcom/sun/mail/imap/protocol/FetchResponse;

    .line 1553
    .local v1, "fr":Lcom/sun/mail/imap/protocol/FetchResponse;
    const-class v5, Lcom/sun/mail/imap/protocol/FLAGS;

    invoke-virtual {v1, v5}, Lcom/sun/mail/imap/protocol/FetchResponse;->getItem(Ljava/lang/Class;)Lcom/sun/mail/imap/protocol/Item;

    move-result-object v0

    .end local v0    # "flags":Lkorex/mail/Flags;
    check-cast v0, Lkorex/mail/Flags;

    .restart local v0    # "flags":Lkorex/mail/Flags;
    if-eqz v0, :cond_1f

    .line 1554
    const/4 v5, 0x0

    aput-object v5, v4, v2

    .line 1560
    .end local v1    # "fr":Lcom/sun/mail/imap/protocol/FetchResponse;
    :cond_33
    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 1561
    array-length v5, v4

    add-int/lit8 v5, v5, -0x1

    aget-object v5, v4, v5

    invoke-virtual {p0, v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 1562
    return-object v0
.end method

.method public fetchMODSEQ(I)Lcom/sun/mail/imap/protocol/MODSEQ;
    .registers 6
    .param p1, "msgno"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1591
    const-string v3, "MODSEQ"

    invoke-virtual {p0, p1, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetch(ILjava/lang/String;)[Lcom/sun/mail/iap/Response;

    move-result-object v0

    .line 1594
    .local v0, "r":[Lcom/sun/mail/iap/Response;
    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 1596
    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    aget-object v1, v0, v3

    .line 1597
    .local v1, "response":Lcom/sun/mail/iap/Response;
    invoke-virtual {v1}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 1598
    const-class v2, Lcom/sun/mail/imap/protocol/MODSEQ;

    invoke-static {v0, p1, v2}, Lcom/sun/mail/imap/protocol/FetchResponse;->getItem([Lcom/sun/mail/iap/Response;ILjava/lang/Class;)Lcom/sun/mail/imap/protocol/Item;

    move-result-object v2

    check-cast v2, Lcom/sun/mail/imap/protocol/MODSEQ;

    .line 1603
    :cond_1d
    :goto_1d
    return-object v2

    .line 1599
    :cond_1e
    invoke-virtual {v1}, Lcom/sun/mail/iap/Response;->isNO()Z

    move-result v3

    if-nez v3, :cond_1d

    .line 1602
    invoke-virtual {p0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    goto :goto_1d
.end method

.method public fetchRFC822(ILjava/lang/String;)Lcom/sun/mail/imap/protocol/RFC822DATA;
    .registers 8
    .param p1, "msgno"    # I
    .param p2, "what"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 1520
    if-nez p2, :cond_20

    const-string v2, "RFC822"

    :goto_5
    invoke-virtual {p0, p1, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetch(ILjava/lang/String;)[Lcom/sun/mail/iap/Response;

    move-result-object v0

    .line 1525
    .local v0, "r":[Lcom/sun/mail/iap/Response;
    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 1527
    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    aget-object v1, v0, v2

    .line 1528
    .local v1, "response":Lcom/sun/mail/iap/Response;
    invoke-virtual {v1}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v2

    if-eqz v2, :cond_34

    .line 1529
    const-class v2, Lcom/sun/mail/imap/protocol/RFC822DATA;

    invoke-static {v0, p1, v2}, Lcom/sun/mail/imap/protocol/FetchResponse;->getItem([Lcom/sun/mail/iap/Response;ILjava/lang/Class;)Lcom/sun/mail/imap/protocol/Item;

    move-result-object v2

    check-cast v2, Lcom/sun/mail/imap/protocol/RFC822DATA;

    .line 1534
    :goto_1f
    return-object v2

    .line 1520
    .end local v0    # "r":[Lcom/sun/mail/iap/Response;
    .end local v1    # "response":Lcom/sun/mail/iap/Response;
    :cond_20
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "RFC822."

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_5

    .line 1530
    .restart local v0    # "r":[Lcom/sun/mail/iap/Response;
    .restart local v1    # "response":Lcom/sun/mail/iap/Response;
    :cond_34
    invoke-virtual {v1}, Lcom/sun/mail/iap/Response;->isNO()Z

    move-result v2

    if-eqz v2, :cond_3c

    move-object v2, v3

    .line 1531
    goto :goto_1f

    .line 1533
    :cond_3c
    invoke-virtual {p0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    move-object v2, v3

    .line 1534
    goto :goto_1f
.end method

.method protected fetchSectionBody(ILjava/lang/String;Ljava/lang/String;)Lcom/sun/mail/imap/protocol/BODY;
    .registers 13
    .param p1, "msgno"    # I
    .param p2, "section"    # Ljava/lang/String;
    .param p3, "body"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 1475
    invoke-virtual {p0, p1, p3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetch(ILjava/lang/String;)[Lcom/sun/mail/iap/Response;

    move-result-object v2

    .line 1476
    .local v2, "r":[Lcom/sun/mail/iap/Response;
    invoke-virtual {p0, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 1478
    array-length v5, v2

    add-int/lit8 v5, v5, -0x1

    aget-object v3, v2, v5

    .line 1479
    .local v3, "response":Lcom/sun/mail/iap/Response;
    invoke-virtual {v3}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v5

    if-eqz v5, :cond_9a

    .line 1480
    const-class v5, Lcom/sun/mail/imap/protocol/BODY;

    invoke-static {v2, p1, v5}, Lcom/sun/mail/imap/protocol/FetchResponse;->getItems([Lcom/sun/mail/iap/Response;ILjava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 1481
    .local v0, "bl":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/protocol/BODY;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_28

    .line 1482
    const/4 v4, 0x0

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/sun/mail/imap/protocol/BODY;

    .line 1498
    .end local v0    # "bl":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/protocol/BODY;>;"
    :cond_27
    :goto_27
    return-object v4

    .line 1483
    .restart local v0    # "bl":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/protocol/BODY;>;"
    :cond_28
    iget-object v5, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v6, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v5

    if-eqz v5, :cond_58

    .line 1484
    iget-object v5, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "got "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " BODY responses for section "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->finest(Ljava/lang/String;)V

    .line 1487
    :cond_58
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_5c
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_27

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sun/mail/imap/protocol/BODY;

    .line 1488
    .local v1, "br":Lcom/sun/mail/imap/protocol/BODY;
    iget-object v6, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v7, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v6

    if-eqz v6, :cond_8e

    .line 1489
    iget-object v6, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "got BODY section "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Lcom/sun/mail/imap/protocol/BODY;->getSection()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->finest(Ljava/lang/String;)V

    .line 1490
    :cond_8e
    invoke-virtual {v1}, Lcom/sun/mail/imap/protocol/BODY;->getSection()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5c

    move-object v4, v1

    .line 1491
    goto :goto_27

    .line 1494
    .end local v0    # "bl":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/protocol/BODY;>;"
    .end local v1    # "br":Lcom/sun/mail/imap/protocol/BODY;
    :cond_9a
    invoke-virtual {v3}, Lcom/sun/mail/iap/Response;->isNO()Z

    move-result v5

    if-nez v5, :cond_27

    .line 1497
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    goto :goto_27
.end method

.method public fetchSequenceNumber(J)Lcom/sun/mail/imap/protocol/UID;
    .registers 11
    .param p1, "uid"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1613
    const/4 v4, 0x0

    .line 1614
    .local v4, "u":Lcom/sun/mail/imap/protocol/UID;
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    const-string v6, "UID"

    const/4 v7, 0x1

    invoke-direct {p0, v5, v6, v7}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetch(Ljava/lang/String;Ljava/lang/String;Z)[Lcom/sun/mail/iap/Response;

    move-result-object v3

    .line 1616
    .local v3, "r":[Lcom/sun/mail/iap/Response;
    const/4 v1, 0x0

    .local v1, "i":I
    array-length v2, v3

    .local v2, "len":I
    :goto_e
    if-ge v1, v2, :cond_31

    .line 1617
    aget-object v5, v3, v1

    if-eqz v5, :cond_1a

    aget-object v5, v3, v1

    instance-of v5, v5, Lcom/sun/mail/imap/protocol/FetchResponse;

    if-nez v5, :cond_1d

    .line 1616
    :cond_1a
    :goto_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 1620
    :cond_1d
    aget-object v0, v3, v1

    check-cast v0, Lcom/sun/mail/imap/protocol/FetchResponse;

    .line 1621
    .local v0, "fr":Lcom/sun/mail/imap/protocol/FetchResponse;
    const-class v5, Lcom/sun/mail/imap/protocol/UID;

    invoke-virtual {v0, v5}, Lcom/sun/mail/imap/protocol/FetchResponse;->getItem(Ljava/lang/Class;)Lcom/sun/mail/imap/protocol/Item;

    move-result-object v4

    .end local v4    # "u":Lcom/sun/mail/imap/protocol/UID;
    check-cast v4, Lcom/sun/mail/imap/protocol/UID;

    .restart local v4    # "u":Lcom/sun/mail/imap/protocol/UID;
    if-eqz v4, :cond_1a

    .line 1622
    iget-wide v5, v4, Lcom/sun/mail/imap/protocol/UID;->uid:J

    cmp-long v5, v5, p1

    if-nez v5, :cond_3d

    .line 1629
    .end local v0    # "fr":Lcom/sun/mail/imap/protocol/FetchResponse;
    :cond_31
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 1630
    array-length v5, v3

    add-int/lit8 v5, v5, -0x1

    aget-object v5, v3, v5

    invoke-virtual {p0, v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 1631
    return-object v4

    .line 1625
    .restart local v0    # "fr":Lcom/sun/mail/imap/protocol/FetchResponse;
    :cond_3d
    const/4 v4, 0x0

    goto :goto_1a
.end method

.method public fetchSequenceNumbers(JJ)[Lcom/sun/mail/imap/protocol/UID;
    .registers 15
    .param p1, "start"    # J
    .param p3, "end"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1641
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-wide/16 v8, -0x1

    cmp-long v6, p3, v8

    if-nez v6, :cond_40

    const-string v6, "*"

    .line 1643
    :goto_1b
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "UID"

    const/4 v8, 0x1

    .line 1641
    invoke-direct {p0, v6, v7, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetch(Ljava/lang/String;Ljava/lang/String;Z)[Lcom/sun/mail/iap/Response;

    move-result-object v3

    .line 1647
    .local v3, "r":[Lcom/sun/mail/iap/Response;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1648
    .local v5, "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/protocol/UID;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    array-length v2, v3

    .local v2, "len":I
    :goto_31
    if-ge v1, v2, :cond_57

    .line 1649
    aget-object v6, v3, v1

    if-eqz v6, :cond_3d

    aget-object v6, v3, v1

    instance-of v6, v6, Lcom/sun/mail/imap/protocol/FetchResponse;

    if-nez v6, :cond_45

    .line 1648
    :cond_3d
    :goto_3d
    add-int/lit8 v1, v1, 0x1

    goto :goto_31

    .line 1643
    .end local v1    # "i":I
    .end local v2    # "len":I
    .end local v3    # "r":[Lcom/sun/mail/iap/Response;
    .end local v5    # "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/protocol/UID;>;"
    :cond_40
    invoke-static {p3, p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    goto :goto_1b

    .line 1652
    .restart local v1    # "i":I
    .restart local v2    # "len":I
    .restart local v3    # "r":[Lcom/sun/mail/iap/Response;
    .restart local v5    # "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/protocol/UID;>;"
    :cond_45
    aget-object v0, v3, v1

    check-cast v0, Lcom/sun/mail/imap/protocol/FetchResponse;

    .line 1653
    .local v0, "fr":Lcom/sun/mail/imap/protocol/FetchResponse;
    const-class v6, Lcom/sun/mail/imap/protocol/UID;

    invoke-virtual {v0, v6}, Lcom/sun/mail/imap/protocol/FetchResponse;->getItem(Ljava/lang/Class;)Lcom/sun/mail/imap/protocol/Item;

    move-result-object v4

    check-cast v4, Lcom/sun/mail/imap/protocol/UID;

    .local v4, "u":Lcom/sun/mail/imap/protocol/UID;
    if-eqz v4, :cond_3d

    .line 1654
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3d

    .line 1657
    .end local v0    # "fr":Lcom/sun/mail/imap/protocol/FetchResponse;
    .end local v4    # "u":Lcom/sun/mail/imap/protocol/UID;
    :cond_57
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 1658
    array-length v6, v3

    add-int/lit8 v6, v6, -0x1

    aget-object v6, v3, v6

    invoke-virtual {p0, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 1660
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    new-array v6, v6, [Lcom/sun/mail/imap/protocol/UID;

    invoke-interface {v5, v6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lcom/sun/mail/imap/protocol/UID;

    return-object v6
.end method

.method public fetchSequenceNumbers([J)[Lcom/sun/mail/imap/protocol/UID;
    .registers 12
    .param p1, "uids"    # [J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1669
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 1670
    .local v4, "sb":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    array-length v7, p1

    if-ge v1, v7, :cond_1c

    .line 1671
    if-lez v1, :cond_10

    .line 1672
    const-string v7, ","

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1673
    :cond_10
    aget-wide v7, p1, v1

    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1670
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 1676
    :cond_1c
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "UID"

    const/4 v9, 0x1

    invoke-direct {p0, v7, v8, v9}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetch(Ljava/lang/String;Ljava/lang/String;Z)[Lcom/sun/mail/iap/Response;

    move-result-object v3

    .line 1679
    .local v3, "r":[Lcom/sun/mail/iap/Response;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 1680
    .local v6, "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/protocol/UID;>;"
    const/4 v1, 0x0

    array-length v2, v3

    .local v2, "len":I
    :goto_2e
    if-ge v1, v2, :cond_4f

    .line 1681
    aget-object v7, v3, v1

    if-eqz v7, :cond_3a

    aget-object v7, v3, v1

    instance-of v7, v7, Lcom/sun/mail/imap/protocol/FetchResponse;

    if-nez v7, :cond_3d

    .line 1680
    :cond_3a
    :goto_3a
    add-int/lit8 v1, v1, 0x1

    goto :goto_2e

    .line 1684
    :cond_3d
    aget-object v0, v3, v1

    check-cast v0, Lcom/sun/mail/imap/protocol/FetchResponse;

    .line 1685
    .local v0, "fr":Lcom/sun/mail/imap/protocol/FetchResponse;
    const-class v7, Lcom/sun/mail/imap/protocol/UID;

    invoke-virtual {v0, v7}, Lcom/sun/mail/imap/protocol/FetchResponse;->getItem(Ljava/lang/Class;)Lcom/sun/mail/imap/protocol/Item;

    move-result-object v5

    check-cast v5, Lcom/sun/mail/imap/protocol/UID;

    .local v5, "u":Lcom/sun/mail/imap/protocol/UID;
    if-eqz v5, :cond_3a

    .line 1686
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3a

    .line 1689
    .end local v0    # "fr":Lcom/sun/mail/imap/protocol/FetchResponse;
    .end local v5    # "u":Lcom/sun/mail/imap/protocol/UID;
    :cond_4f
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 1690
    array-length v7, v3

    add-int/lit8 v7, v7, -0x1

    aget-object v7, v3, v7

    invoke-virtual {p0, v7}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 1692
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    new-array v7, v7, [Lcom/sun/mail/imap/protocol/UID;

    invoke-interface {v6, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Lcom/sun/mail/imap/protocol/UID;

    return-object v7
.end method

.method public fetchUID(I)Lcom/sun/mail/imap/protocol/UID;
    .registers 6
    .param p1, "msgno"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1569
    const-string v3, "UID"

    invoke-virtual {p0, p1, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetch(ILjava/lang/String;)[Lcom/sun/mail/iap/Response;

    move-result-object v0

    .line 1572
    .local v0, "r":[Lcom/sun/mail/iap/Response;
    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 1574
    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    aget-object v1, v0, v3

    .line 1575
    .local v1, "response":Lcom/sun/mail/iap/Response;
    invoke-virtual {v1}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 1576
    const-class v2, Lcom/sun/mail/imap/protocol/UID;

    invoke-static {v0, p1, v2}, Lcom/sun/mail/imap/protocol/FetchResponse;->getItem([Lcom/sun/mail/iap/Response;ILjava/lang/Class;)Lcom/sun/mail/imap/protocol/Item;

    move-result-object v2

    check-cast v2, Lcom/sun/mail/imap/protocol/UID;

    .line 1581
    :cond_1d
    :goto_1d
    return-object v2

    .line 1577
    :cond_1e
    invoke-virtual {v1}, Lcom/sun/mail/iap/Response;->isNO()Z

    move-result v3

    if-nez v3, :cond_1d

    .line 1580
    invoke-virtual {p0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    goto :goto_1d
.end method

.method public getACL(Ljava/lang/String;)[Lcom/sun/mail/imap/ACL;
    .registers 14
    .param p1, "mbox"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 2431
    const-string v10, "ACL"

    invoke-virtual {p0, v10}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_10

    .line 2432
    new-instance v10, Lcom/sun/mail/iap/BadCommandException;

    const-string v11, "ACL not supported"

    invoke-direct {v10, v11}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 2435
    :cond_10
    invoke-static {p1}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2437
    new-instance v1, Lcom/sun/mail/iap/Argument;

    invoke-direct {v1}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 2438
    .local v1, "args":Lcom/sun/mail/iap/Argument;
    invoke-virtual {v1, p1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 2440
    const-string v10, "GETACL"

    invoke-virtual {p0, v10, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v6

    .line 2441
    .local v6, "r":[Lcom/sun/mail/iap/Response;
    array-length v10, v6

    add-int/lit8 v10, v10, -0x1

    aget-object v7, v6, v10

    .line 2444
    .local v7, "response":Lcom/sun/mail/iap/Response;
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 2445
    .local v9, "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/ACL;>;"
    invoke-virtual {v7}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v10

    if-eqz v10, :cond_6d

    .line 2446
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v4, v6

    .local v4, "len":I
    :goto_34
    if-ge v2, v4, :cond_6d

    .line 2447
    aget-object v10, v6, v2

    instance-of v10, v10, Lcom/sun/mail/imap/protocol/IMAPResponse;

    if-nez v10, :cond_3f

    .line 2446
    :cond_3c
    :goto_3c
    add-int/lit8 v2, v2, 0x1

    goto :goto_34

    .line 2450
    :cond_3f
    aget-object v3, v6, v2

    check-cast v3, Lcom/sun/mail/imap/protocol/IMAPResponse;

    .line 2451
    .local v3, "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    const-string v10, "ACL"

    invoke-virtual {v3, v10}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_3c

    .line 2455
    invoke-virtual {v3}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readAtomString()Ljava/lang/String;

    .line 2456
    const/4 v5, 0x0

    .line 2457
    .local v5, "name":Ljava/lang/String;
    :goto_4f
    invoke-virtual {v3}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readAtomString()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_5b

    .line 2458
    invoke-virtual {v3}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readAtomString()Ljava/lang/String;

    move-result-object v8

    .line 2459
    .local v8, "rights":Ljava/lang/String;
    if-nez v8, :cond_5f

    .line 2464
    .end local v8    # "rights":Ljava/lang/String;
    :cond_5b
    const/4 v10, 0x0

    aput-object v10, v6, v2

    goto :goto_3c

    .line 2461
    .restart local v8    # "rights":Ljava/lang/String;
    :cond_5f
    new-instance v0, Lcom/sun/mail/imap/ACL;

    new-instance v10, Lcom/sun/mail/imap/Rights;

    invoke-direct {v10, v8}, Lcom/sun/mail/imap/Rights;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v5, v10}, Lcom/sun/mail/imap/ACL;-><init>(Ljava/lang/String;Lcom/sun/mail/imap/Rights;)V

    .line 2462
    .local v0, "acl":Lcom/sun/mail/imap/ACL;
    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4f

    .line 2470
    .end local v0    # "acl":Lcom/sun/mail/imap/ACL;
    .end local v2    # "i":I
    .end local v3    # "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    .end local v4    # "len":I
    .end local v5    # "name":Ljava/lang/String;
    .end local v8    # "rights":Ljava/lang/String;
    :cond_6d
    invoke-virtual {p0, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 2471
    invoke-virtual {p0, v7}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 2472
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v10

    new-array v10, v10, [Lcom/sun/mail/imap/ACL;

    invoke-interface {v9, v10}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Lcom/sun/mail/imap/ACL;

    return-object v10
.end method

.method public getCapabilities()Ljava/util/Map;
    .registers 2

    .prologue
    .line 351
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->capabilities:Ljava/util/Map;

    return-object v0
.end method

.method public getFetchItems()[Lcom/sun/mail/imap/protocol/FetchItem;
    .registers 2

    .prologue
    .line 190
    sget-object v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchItems:[Lcom/sun/mail/imap/protocol/FetchItem;

    return-object v0
.end method

.method getIMAPOutputStream()Ljava/io/OutputStream;
    .registers 2

    .prologue
    .line 815
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public getProxyAuthUser()Ljava/lang/String;
    .registers 2

    .prologue
    .line 838
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->proxyAuthUser:Ljava/lang/String;

    return-object v0
.end method

.method public getQuota(Ljava/lang/String;)[Lkorex/mail/Quota;
    .registers 12
    .param p1, "root"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 2253
    const-string v8, "QUOTA"

    invoke-virtual {p0, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_10

    .line 2254
    new-instance v8, Lcom/sun/mail/iap/BadCommandException;

    const-string v9, "QUOTA not supported"

    invoke-direct {v8, v9}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 2256
    :cond_10
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 2257
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-virtual {v0, p1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 2259
    const-string v8, "GETQUOTA"

    invoke-virtual {p0, v8, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v5

    .line 2261
    .local v5, "r":[Lcom/sun/mail/iap/Response;
    const/4 v4, 0x0

    .line 2262
    .local v4, "quota":Lkorex/mail/Quota;
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 2263
    .local v7, "v":Ljava/util/List;, "Ljava/util/List<Lkorex/mail/Quota;>;"
    array-length v8, v5

    add-int/lit8 v8, v8, -0x1

    aget-object v6, v5, v8

    .line 2266
    .local v6, "response":Lcom/sun/mail/iap/Response;
    invoke-virtual {v6}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v8

    if-eqz v8, :cond_53

    .line 2267
    const/4 v1, 0x0

    .local v1, "i":I
    array-length v3, v5

    .local v3, "len":I
    :goto_31
    if-ge v1, v3, :cond_53

    .line 2268
    aget-object v8, v5, v1

    instance-of v8, v8, Lcom/sun/mail/imap/protocol/IMAPResponse;

    if-nez v8, :cond_3c

    .line 2267
    :cond_39
    :goto_39
    add-int/lit8 v1, v1, 0x1

    goto :goto_31

    .line 2271
    :cond_3c
    aget-object v2, v5, v1

    check-cast v2, Lcom/sun/mail/imap/protocol/IMAPResponse;

    .line 2272
    .local v2, "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    const-string v8, "QUOTA"

    invoke-virtual {v2, v8}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_39

    .line 2273
    invoke-direct {p0, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->parseQuota(Lcom/sun/mail/iap/Response;)Lkorex/mail/Quota;

    move-result-object v4

    .line 2274
    invoke-interface {v7, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2275
    const/4 v8, 0x0

    aput-object v8, v5, v1

    goto :goto_39

    .line 2281
    .end local v1    # "i":I
    .end local v2    # "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    .end local v3    # "len":I
    :cond_53
    invoke-virtual {p0, v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 2282
    invoke-virtual {p0, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 2283
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    new-array v8, v8, [Lkorex/mail/Quota;

    invoke-interface {v7, v8}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Lkorex/mail/Quota;

    return-object v8
.end method

.method public getQuotaRoot(Ljava/lang/String;)[Lkorex/mail/Quota;
    .registers 24
    .param p1, "mbox"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 2180
    const-string v18, "QUOTA"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v18

    if-nez v18, :cond_14

    .line 2181
    new-instance v18, Lcom/sun/mail/iap/BadCommandException;

    const-string v19, "GETQUOTAROOT not supported"

    invoke-direct/range {v18 .. v19}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 2184
    :cond_14
    invoke-static/range {p1 .. p1}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2186
    new-instance v4, Lcom/sun/mail/iap/Argument;

    invoke-direct {v4}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 2187
    .local v4, "args":Lcom/sun/mail/iap/Argument;
    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 2189
    const-string v18, "GETQUOTAROOT"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v14

    .line 2191
    .local v14, "r":[Lcom/sun/mail/iap/Response;
    array-length v0, v14

    move/from16 v18, v0

    add-int/lit8 v18, v18, -0x1

    aget-object v15, v14, v18

    .line 2193
    .local v15, "response":Lcom/sun/mail/iap/Response;
    new-instance v17, Ljava/util/Hashtable;

    invoke-direct/range {v17 .. v17}, Ljava/util/Hashtable;-><init>()V

    .line 2196
    .local v17, "tab":Ljava/util/Hashtable;
    invoke-virtual {v15}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v18

    if-eqz v18, :cond_110

    .line 2197
    const/4 v6, 0x0

    .local v6, "i":I
    array-length v8, v14

    .local v8, "len":I
    :goto_40
    if-ge v6, v8, :cond_110

    .line 2198
    aget-object v18, v14, v6

    move-object/from16 v0, v18

    instance-of v0, v0, Lcom/sun/mail/imap/protocol/IMAPResponse;

    move/from16 v18, v0

    if-nez v18, :cond_4f

    .line 2197
    :cond_4c
    :goto_4c
    add-int/lit8 v6, v6, 0x1

    goto :goto_40

    .line 2201
    :cond_4f
    aget-object v7, v14, v6

    check-cast v7, Lcom/sun/mail/imap/protocol/IMAPResponse;

    .line 2202
    .local v7, "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    const-string v18, "QUOTAROOT"

    move-object/from16 v0, v18

    invoke-virtual {v7, v0}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_86

    .line 2207
    invoke-virtual {v7}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readAtomString()Ljava/lang/String;

    .line 2209
    const/16 v16, 0x0

    .line 2210
    .local v16, "root":Ljava/lang/String;
    :goto_62
    invoke-virtual {v7}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readAtomString()Ljava/lang/String;

    move-result-object v16

    if-eqz v16, :cond_81

    .line 2211
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v18

    if-lez v18, :cond_81

    .line 2212
    new-instance v18, Lkorex/mail/Quota;

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lkorex/mail/Quota;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_62

    .line 2213
    :cond_81
    const/16 v18, 0x0

    aput-object v18, v14, v6

    goto :goto_4c

    .line 2214
    .end local v16    # "root":Ljava/lang/String;
    :cond_86
    const-string v18, "QUOTA"

    move-object/from16 v0, v18

    invoke-virtual {v7, v0}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_4c

    .line 2215
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->parseQuota(Lcom/sun/mail/iap/Response;)Lkorex/mail/Quota;

    move-result-object v13

    .line 2216
    .local v13, "quota":Lkorex/mail/Quota;
    iget-object v0, v13, Lkorex/mail/Quota;->quotaRoot:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lkorex/mail/Quota;

    .line 2217
    .local v11, "q":Lkorex/mail/Quota;
    if-eqz v11, :cond_ff

    iget-object v0, v11, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    move-object/from16 v18, v0

    if-eqz v18, :cond_ff

    .line 2219
    iget-object v0, v11, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    iget-object v0, v13, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    add-int v9, v18, v19

    .line 2220
    .local v9, "newl":I
    new-array v10, v9, [Lkorex/mail/Quota$Resource;

    .line 2221
    .local v10, "newr":[Lkorex/mail/Quota$Resource;
    iget-object v0, v11, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const/16 v20, 0x0

    iget-object v0, v11, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v21, v0

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-static {v0, v1, v10, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2223
    iget-object v0, v13, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    iget-object v0, v11, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v20, v0

    iget-object v0, v13, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v21, v0

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-static {v0, v1, v10, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2225
    iput-object v10, v13, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    .line 2227
    .end local v9    # "newl":I
    .end local v10    # "newr":[Lkorex/mail/Quota$Resource;
    :cond_ff
    iget-object v0, v13, Lkorex/mail/Quota;->quotaRoot:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v13}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2228
    const/16 v18, 0x0

    aput-object v18, v14, v6

    goto/16 :goto_4c

    .line 2234
    .end local v6    # "i":I
    .end local v7    # "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    .end local v8    # "len":I
    .end local v11    # "q":Lkorex/mail/Quota;
    .end local v13    # "quota":Lkorex/mail/Quota;
    :cond_110
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 2235
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 2237
    invoke-virtual/range {v17 .. v17}, Ljava/util/Hashtable;->size()I

    move-result v18

    move/from16 v0, v18

    new-array v12, v0, [Lkorex/mail/Quota;

    .line 2238
    .local v12, "qa":[Lkorex/mail/Quota;
    invoke-virtual/range {v17 .. v17}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v5

    .line 2239
    .local v5, "e":Ljava/util/Enumeration;
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_127
    invoke-interface {v5}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v18

    if-eqz v18, :cond_138

    .line 2240
    invoke-interface {v5}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lkorex/mail/Quota;

    aput-object v18, v12, v6

    .line 2239
    add-int/lit8 v6, v6, 0x1

    goto :goto_127

    .line 2241
    :cond_138
    return-object v12
.end method

.method protected getResponseBuffer()Lcom/sun/mail/iap/ByteArray;
    .registers 3

    .prologue
    .line 1508
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->ba:Lcom/sun/mail/iap/ByteArray;

    .line 1509
    .local v0, "ret":Lcom/sun/mail/iap/ByteArray;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->ba:Lcom/sun/mail/iap/ByteArray;

    .line 1510
    return-object v0
.end method

.method protected getSearchSequence()Lcom/sun/mail/imap/protocol/SearchSequence;
    .registers 2

    .prologue
    .line 2057
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->searchSequence:Lcom/sun/mail/imap/protocol/SearchSequence;

    if-nez v0, :cond_b

    .line 2058
    new-instance v0, Lcom/sun/mail/imap/protocol/SearchSequence;

    invoke-direct {v0}, Lcom/sun/mail/imap/protocol/SearchSequence;-><init>()V

    iput-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->searchSequence:Lcom/sun/mail/imap/protocol/SearchSequence;

    .line 2059
    :cond_b
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->searchSequence:Lcom/sun/mail/imap/protocol/SearchSequence;

    return-object v0
.end method

.method public hasCapability(Ljava/lang/String;)Z
    .registers 6
    .param p1, "c"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 333
    const-string v1, "*"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_39

    .line 334
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v3}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 335
    iget-object v1, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->capabilities:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 336
    .local v0, "it":Ljava/util/Iterator;
    :cond_23
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_37

    .line 337
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_23

    .line 338
    const/4 v1, 0x1

    .line 342
    .end local v0    # "it":Ljava/util/Iterator;
    :goto_36
    return v1

    .restart local v0    # "it":Ljava/util/Iterator;
    :cond_37
    move v1, v2

    .line 340
    goto :goto_36

    .line 342
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_39
    iget-object v1, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->capabilities:Ljava/util/Map;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_36
.end method

.method public id(Ljava/util/Map;)Ljava/util/Map;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .local p1, "clientParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v6, 0x0

    .line 2734
    const-string v7, "ID"

    invoke-virtual {p0, v7}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_11

    .line 2735
    new-instance v6, Lcom/sun/mail/iap/BadCommandException;

    const-string v7, "ID not supported"

    invoke-direct {v6, v7}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 2737
    :cond_11
    const-string v7, "ID"

    invoke-static {p1}, Lcom/sun/mail/imap/protocol/ID;->getArgumentList(Ljava/util/Map;)Lcom/sun/mail/iap/Argument;

    move-result-object v8

    invoke-virtual {p0, v7, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v4

    .line 2739
    .local v4, "r":[Lcom/sun/mail/iap/Response;
    const/4 v1, 0x0

    .line 2740
    .local v1, "id":Lcom/sun/mail/imap/protocol/ID;
    array-length v7, v4

    add-int/lit8 v7, v7, -0x1

    aget-object v5, v4, v7

    .line 2743
    .local v5, "response":Lcom/sun/mail/iap/Response;
    invoke-virtual {v5}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v7

    if-eqz v7, :cond_4a

    .line 2744
    const/4 v0, 0x0

    .local v0, "i":I
    array-length v3, v4

    .local v3, "len":I
    :goto_29
    if-ge v0, v3, :cond_4a

    .line 2745
    aget-object v7, v4, v0

    instance-of v7, v7, Lcom/sun/mail/imap/protocol/IMAPResponse;

    if-nez v7, :cond_34

    .line 2744
    :cond_31
    :goto_31
    add-int/lit8 v0, v0, 0x1

    goto :goto_29

    .line 2748
    :cond_34
    aget-object v2, v4, v0

    check-cast v2, Lcom/sun/mail/imap/protocol/IMAPResponse;

    .line 2749
    .local v2, "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    const-string v7, "ID"

    invoke-virtual {v2, v7}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_31

    .line 2750
    if-nez v1, :cond_47

    .line 2751
    new-instance v1, Lcom/sun/mail/imap/protocol/ID;

    .end local v1    # "id":Lcom/sun/mail/imap/protocol/ID;
    invoke-direct {v1, v2}, Lcom/sun/mail/imap/protocol/ID;-><init>(Lcom/sun/mail/iap/Response;)V

    .line 2752
    .restart local v1    # "id":Lcom/sun/mail/imap/protocol/ID;
    :cond_47
    aput-object v6, v4, v0

    goto :goto_31

    .line 2758
    .end local v0    # "i":I
    .end local v2    # "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    .end local v3    # "len":I
    :cond_4a
    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 2759
    invoke-virtual {p0, v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 2760
    if-nez v1, :cond_53

    :goto_52
    return-object v6

    :cond_53
    invoke-virtual {v1}, Lcom/sun/mail/imap/protocol/ID;->getServerParams()Ljava/util/Map;

    move-result-object v6

    goto :goto_52
.end method

.method public id(Ljava/lang/String;)V
    .registers 4
    .param p1, "guid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 863
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 864
    .local v0, "gmap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "GUID"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 865
    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->id(Ljava/util/Map;)Ljava/util/Map;

    .line 866
    return-void
.end method

.method public idleAbort()V
    .registers 6

    .prologue
    .line 2716
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    .line 2718
    .local v1, "os":Ljava/io/OutputStream;
    :try_start_4
    sget-object v2, Lcom/sun/mail/imap/protocol/IMAPProtocol;->DONE:[B

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 2719
    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_c} :catch_d

    .line 2724
    :goto_c
    return-void

    .line 2720
    :catch_d
    move-exception v0

    .line 2722
    .local v0, "ex":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v3, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    const-string v4, "Exception aborting IDLE"

    invoke-virtual {v2, v3, v4, v0}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_c
.end method

.method public declared-synchronized idleStart()V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 2592
    monitor-enter p0

    :try_start_1
    const-string v8, "IDLE"

    invoke-virtual {p0, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_14

    .line 2593
    new-instance v8, Lcom/sun/mail/iap/BadCommandException;

    const-string v9, "IDLE not supported"

    invoke-direct {v8, v9}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_11

    .line 2592
    :catchall_11
    move-exception v8

    monitor-exit p0

    throw v8

    .line 2595
    :cond_14
    :try_start_14
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V
    :try_end_19
    .catchall {:try_start_14 .. :try_end_19} :catchall_11

    .line 2596
    .local v7, "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/iap/Response;>;"
    const/4 v0, 0x0

    .line 2597
    .local v0, "done":Z
    const/4 v5, 0x0

    .line 2601
    .local v5, "r":Lcom/sun/mail/iap/Response;
    :try_start_1b
    const-string v8, "IDLE"

    const/4 v9, 0x0

    invoke-virtual {p0, v8, v9}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->writeCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->idleTag:Ljava/lang/String;
    :try_end_24
    .catch Lcom/sun/mail/iap/LiteralException; {:try_start_1b .. :try_end_24} :catch_3b
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_24} :catch_45
    .catchall {:try_start_1b .. :try_end_24} :catchall_11

    .line 2611
    :cond_24
    :goto_24
    if-nez v0, :cond_57

    .line 2613
    :try_start_26
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->readResponse()Lcom/sun/mail/iap/Response;
    :try_end_29
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_29} :catch_4f
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_26 .. :try_end_29} :catch_55
    .catchall {:try_start_26 .. :try_end_29} :catchall_11

    move-result-object v5

    .line 2621
    :goto_2a
    :try_start_2a
    invoke-interface {v7, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2623
    invoke-virtual {v5}, Lcom/sun/mail/iap/Response;->isContinuation()Z

    move-result v8

    if-nez v8, :cond_39

    invoke-virtual {v5}, Lcom/sun/mail/iap/Response;->isBYE()Z

    move-result v8

    if-eqz v8, :cond_24

    .line 2624
    :cond_39
    const/4 v0, 0x1

    goto :goto_24

    .line 2602
    :catch_3b
    move-exception v3

    .line 2603
    .local v3, "lex":Lcom/sun/mail/iap/LiteralException;
    invoke-virtual {v3}, Lcom/sun/mail/iap/LiteralException;->getResponse()Lcom/sun/mail/iap/Response;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2604
    const/4 v0, 0x1

    .line 2609
    goto :goto_24

    .line 2605
    .end local v3    # "lex":Lcom/sun/mail/iap/LiteralException;
    :catch_45
    move-exception v1

    .line 2607
    .local v1, "ex":Ljava/lang/Exception;
    invoke-static {v1}, Lcom/sun/mail/iap/Response;->byeResponse(Ljava/lang/Exception;)Lcom/sun/mail/iap/Response;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2608
    const/4 v0, 0x1

    goto :goto_24

    .line 2614
    .end local v1    # "ex":Ljava/lang/Exception;
    :catch_4f
    move-exception v2

    .line 2616
    .local v2, "ioex":Ljava/io/IOException;
    invoke-static {v2}, Lcom/sun/mail/iap/Response;->byeResponse(Ljava/lang/Exception;)Lcom/sun/mail/iap/Response;

    move-result-object v5

    .line 2619
    goto :goto_2a

    .line 2617
    .end local v2    # "ioex":Ljava/io/IOException;
    :catch_55
    move-exception v4

    .line 2618
    .local v4, "pex":Lcom/sun/mail/iap/ProtocolException;
    goto :goto_24

    .line 2627
    .end local v4    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :cond_57
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    new-array v8, v8, [Lcom/sun/mail/iap/Response;

    invoke-interface {v7, v8}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lcom/sun/mail/iap/Response;

    .line 2628
    .local v6, "responses":[Lcom/sun/mail/iap/Response;
    array-length v8, v6

    add-int/lit8 v8, v8, -0x1

    aget-object v5, v6, v8

    .line 2631
    invoke-virtual {p0, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 2632
    invoke-virtual {v5}, Lcom/sun/mail/iap/Response;->isContinuation()Z

    move-result v8

    if-nez v8, :cond_74

    .line 2633
    invoke-virtual {p0, v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V
    :try_end_74
    .catchall {:try_start_2a .. :try_end_74} :catchall_11

    .line 2634
    :cond_74
    monitor-exit p0

    return-void
.end method

.method public isAuthenticated()Z
    .registers 2

    .prologue
    .line 298
    iget-boolean v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->authenticated:Z

    return v0
.end method

.method public isEnabled(Ljava/lang/String;)Z
    .registers 4
    .param p1, "cap"    # Ljava/lang/String;

    .prologue
    .line 1041
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->enabled:Ljava/util/Set;

    if-nez v0, :cond_6

    .line 1042
    const/4 v0, 0x0

    .line 1044
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->enabled:Ljava/util/Set;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method public isREV1()Z
    .registers 2

    .prologue
    .line 305
    iget-boolean v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->rev1:Z

    return v0
.end method

.method public list(Ljava/lang/String;Ljava/lang/String;)[Lcom/sun/mail/imap/protocol/ListInfo;
    .registers 4
    .param p1, "ref"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1195
    const-string v0, "LIST"

    invoke-virtual {p0, v0, p1, p2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->doList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Lcom/sun/mail/imap/protocol/ListInfo;

    move-result-object v0

    return-object v0
.end method

.method public listRights(Ljava/lang/String;Ljava/lang/String;)[Lcom/sun/mail/imap/Rights;
    .registers 13
    .param p1, "mbox"    # Ljava/lang/String;
    .param p2, "user"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 2482
    const-string v8, "ACL"

    invoke-virtual {p0, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_10

    .line 2483
    new-instance v8, Lcom/sun/mail/iap/BadCommandException;

    const-string v9, "ACL not supported"

    invoke-direct {v8, v9}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 2486
    :cond_10
    invoke-static {p1}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2488
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 2489
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-virtual {v0, p1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 2490
    invoke-virtual {v0, p2}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 2492
    const-string v8, "LISTRIGHTS"

    invoke-virtual {p0, v8, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v4

    .line 2493
    .local v4, "r":[Lcom/sun/mail/iap/Response;
    array-length v8, v4

    add-int/lit8 v8, v8, -0x1

    aget-object v5, v4, v8

    .line 2496
    .local v5, "response":Lcom/sun/mail/iap/Response;
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 2497
    .local v7, "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/Rights;>;"
    invoke-virtual {v5}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v8

    if-eqz v8, :cond_67

    .line 2498
    const/4 v1, 0x0

    .local v1, "i":I
    array-length v3, v4

    .local v3, "len":I
    :goto_37
    if-ge v1, v3, :cond_67

    .line 2499
    aget-object v8, v4, v1

    instance-of v8, v8, Lcom/sun/mail/imap/protocol/IMAPResponse;

    if-nez v8, :cond_42

    .line 2498
    :cond_3f
    :goto_3f
    add-int/lit8 v1, v1, 0x1

    goto :goto_37

    .line 2502
    :cond_42
    aget-object v2, v4, v1

    check-cast v2, Lcom/sun/mail/imap/protocol/IMAPResponse;

    .line 2503
    .local v2, "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    const-string v8, "LISTRIGHTS"

    invoke-virtual {v2, v8}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3f

    .line 2507
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readAtomString()Ljava/lang/String;

    .line 2509
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readAtomString()Ljava/lang/String;

    .line 2511
    :goto_54
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readAtomString()Ljava/lang/String;

    move-result-object v6

    .local v6, "rights":Ljava/lang/String;
    if-eqz v6, :cond_63

    .line 2512
    new-instance v8, Lcom/sun/mail/imap/Rights;

    invoke-direct {v8, v6}, Lcom/sun/mail/imap/Rights;-><init>(Ljava/lang/String;)V

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_54

    .line 2513
    :cond_63
    const/4 v8, 0x0

    aput-object v8, v4, v1

    goto :goto_3f

    .line 2519
    .end local v1    # "i":I
    .end local v2    # "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    .end local v3    # "len":I
    .end local v6    # "rights":Ljava/lang/String;
    :cond_67
    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 2520
    invoke-virtual {p0, v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 2521
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    new-array v8, v8, [Lcom/sun/mail/imap/Rights;

    invoke-interface {v7, v8}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Lcom/sun/mail/imap/Rights;

    return-object v8
.end method

.method public login(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "u"    # Ljava/lang/String;
    .param p2, "p"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 399
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 400
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-virtual {v0, p1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 401
    invoke-virtual {v0, p2}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 403
    const/4 v1, 0x0

    .line 405
    .local v1, "r":[Lcom/sun/mail/iap/Response;
    :try_start_c
    iget-boolean v2, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noauthdebug:Z

    if-eqz v2, :cond_20

    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isTracing()Z

    move-result v2

    if-eqz v2, :cond_20

    .line 406
    iget-object v2, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v3, "LOGIN command trace suppressed"

    invoke-virtual {v2, v3}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 407
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->suspendTracing()V

    .line 409
    :cond_20
    const-string v2, "LOGIN"

    invoke-virtual {p0, v2, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;
    :try_end_25
    .catchall {:try_start_c .. :try_end_25} :catchall_67

    move-result-object v1

    .line 411
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->resumeTracing()V

    .line 415
    invoke-virtual {p0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 418
    iget-boolean v2, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noauthdebug:Z

    if-eqz v2, :cond_53

    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isTracing()Z

    move-result v2

    if-eqz v2, :cond_53

    .line 419
    iget-object v2, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "LOGIN command result: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    array-length v4, v1

    add-int/lit8 v4, v4, -0x1

    aget-object v4, v1, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 420
    :cond_53
    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    aget-object v2, v1, v2

    invoke-virtual {p0, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 422
    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    aget-object v2, v1, v2

    invoke-virtual {p0, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->setCapabilities(Lcom/sun/mail/iap/Response;)V

    .line 424
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->authenticated:Z

    .line 425
    return-void

    .line 411
    :catchall_67
    move-exception v2

    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->resumeTracing()V

    throw v2
.end method

.method public logout()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 382
    :try_start_0
    const-string v1, "LOGOUT"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v0

    .line 384
    .local v0, "r":[Lcom/sun/mail/iap/Response;
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->authenticated:Z

    .line 387
    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V
    :try_end_d
    .catchall {:try_start_0 .. :try_end_d} :catchall_11

    .line 389
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->disconnect()V

    .line 391
    return-void

    .line 389
    .end local v0    # "r":[Lcom/sun/mail/iap/Response;
    :catchall_11
    move-exception v1

    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->disconnect()V

    throw v1
.end method

.method public lsub(Ljava/lang/String;Ljava/lang/String;)[Lcom/sun/mail/imap/protocol/ListInfo;
    .registers 4
    .param p1, "ref"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1205
    const-string v0, "LSUB"

    invoke-virtual {p0, v0, p1, p2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->doList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Lcom/sun/mail/imap/protocol/ListInfo;

    move-result-object v0

    return-object v0
.end method

.method public myRights(Ljava/lang/String;)Lcom/sun/mail/imap/Rights;
    .registers 12
    .param p1, "mbox"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 2530
    const-string v8, "ACL"

    invoke-virtual {p0, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_10

    .line 2531
    new-instance v8, Lcom/sun/mail/iap/BadCommandException;

    const-string v9, "ACL not supported"

    invoke-direct {v8, v9}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 2534
    :cond_10
    invoke-static {p1}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2536
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 2537
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-virtual {v0, p1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 2539
    const-string v8, "MYRIGHTS"

    invoke-virtual {p0, v8, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v4

    .line 2540
    .local v4, "r":[Lcom/sun/mail/iap/Response;
    array-length v8, v4

    add-int/lit8 v8, v8, -0x1

    aget-object v5, v4, v8

    .line 2543
    .local v5, "response":Lcom/sun/mail/iap/Response;
    const/4 v6, 0x0

    .line 2544
    .local v6, "rights":Lcom/sun/mail/imap/Rights;
    invoke-virtual {v5}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v8

    if-eqz v8, :cond_59

    .line 2545
    const/4 v1, 0x0

    .local v1, "i":I
    array-length v3, v4

    .local v3, "len":I
    :goto_30
    if-ge v1, v3, :cond_59

    .line 2546
    aget-object v8, v4, v1

    instance-of v8, v8, Lcom/sun/mail/imap/protocol/IMAPResponse;

    if-nez v8, :cond_3b

    .line 2545
    :cond_38
    :goto_38
    add-int/lit8 v1, v1, 0x1

    goto :goto_30

    .line 2549
    :cond_3b
    aget-object v2, v4, v1

    check-cast v2, Lcom/sun/mail/imap/protocol/IMAPResponse;

    .line 2550
    .local v2, "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    const-string v8, "MYRIGHTS"

    invoke-virtual {v2, v8}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_38

    .line 2553
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readAtomString()Ljava/lang/String;

    .line 2554
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readAtomString()Ljava/lang/String;

    move-result-object v7

    .line 2555
    .local v7, "rs":Ljava/lang/String;
    if-nez v6, :cond_55

    .line 2556
    new-instance v6, Lcom/sun/mail/imap/Rights;

    .end local v6    # "rights":Lcom/sun/mail/imap/Rights;
    invoke-direct {v6, v7}, Lcom/sun/mail/imap/Rights;-><init>(Ljava/lang/String;)V

    .line 2557
    .restart local v6    # "rights":Lcom/sun/mail/imap/Rights;
    :cond_55
    const/4 v8, 0x0

    aput-object v8, v4, v1

    goto :goto_38

    .line 2563
    .end local v1    # "i":I
    .end local v2    # "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    .end local v3    # "len":I
    .end local v7    # "rs":Ljava/lang/String;
    :cond_59
    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 2564
    invoke-virtual {p0, v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 2565
    return-object v6
.end method

.method public namespace()Lcom/sun/mail/imap/protocol/Namespaces;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 2141
    const-string v6, "NAMESPACE"

    invoke-virtual {p0, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_11

    .line 2142
    new-instance v6, Lcom/sun/mail/iap/BadCommandException;

    const-string v7, "NAMESPACE not supported"

    invoke-direct {v6, v7}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 2144
    :cond_11
    const-string v6, "NAMESPACE"

    invoke-virtual {p0, v6, v7}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v4

    .line 2146
    .local v4, "r":[Lcom/sun/mail/iap/Response;
    const/4 v3, 0x0

    .line 2147
    .local v3, "namespace":Lcom/sun/mail/imap/protocol/Namespaces;
    array-length v6, v4

    add-int/lit8 v6, v6, -0x1

    aget-object v5, v4, v6

    .line 2150
    .local v5, "response":Lcom/sun/mail/iap/Response;
    invoke-virtual {v5}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v6

    if-eqz v6, :cond_46

    .line 2151
    const/4 v0, 0x0

    .local v0, "i":I
    array-length v2, v4

    .local v2, "len":I
    :goto_25
    if-ge v0, v2, :cond_46

    .line 2152
    aget-object v6, v4, v0

    instance-of v6, v6, Lcom/sun/mail/imap/protocol/IMAPResponse;

    if-nez v6, :cond_30

    .line 2151
    :cond_2d
    :goto_2d
    add-int/lit8 v0, v0, 0x1

    goto :goto_25

    .line 2155
    :cond_30
    aget-object v1, v4, v0

    check-cast v1, Lcom/sun/mail/imap/protocol/IMAPResponse;

    .line 2156
    .local v1, "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    const-string v6, "NAMESPACE"

    invoke-virtual {v1, v6}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2d

    .line 2157
    if-nez v3, :cond_43

    .line 2158
    new-instance v3, Lcom/sun/mail/imap/protocol/Namespaces;

    .end local v3    # "namespace":Lcom/sun/mail/imap/protocol/Namespaces;
    invoke-direct {v3, v1}, Lcom/sun/mail/imap/protocol/Namespaces;-><init>(Lcom/sun/mail/iap/Response;)V

    .line 2159
    .restart local v3    # "namespace":Lcom/sun/mail/imap/protocol/Namespaces;
    :cond_43
    aput-object v7, v4, v0

    goto :goto_2d

    .line 2165
    .end local v0    # "i":I
    .end local v1    # "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    .end local v2    # "len":I
    :cond_46
    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 2166
    invoke-virtual {p0, v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 2167
    return-object v3
.end method

.method public noop()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 371
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v1, "IMAPProtocol noop"

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 372
    const-string v0, "NOOP"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->simpleCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)V

    .line 373
    return-void
.end method

.method protected parseCapabilities(Lcom/sun/mail/iap/Response;)V
    .registers 8
    .param p1, "r"    # Lcom/sun/mail/iap/Response;

    .prologue
    const/4 v2, 0x0

    const/4 v5, 0x5

    .line 247
    :cond_2
    :goto_2
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readAtom()Ljava/lang/String;

    move-result-object v0

    .local v0, "s":Ljava/lang/String;
    if-eqz v0, :cond_16

    .line 248
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1b

    .line 249
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->peekByte()B

    move-result v1

    const/16 v3, 0x5d

    if-ne v1, v3, :cond_17

    .line 272
    :cond_16
    return-void

    .line 262
    :cond_17
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->skipToken()V

    goto :goto_2

    .line 264
    :cond_1b
    iget-object v1, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->capabilities:Ljava/util/Map;

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v3}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    const/4 v1, 0x1

    const-string v3, "AUTH="

    move v4, v2

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 266
    iget-object v1, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->authmechs:Ljava/util/List;

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 267
    iget-object v1, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v1, v3}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 268
    iget-object v1, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "AUTH: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    goto :goto_2
.end method

.method public peekBody(ILjava/lang/String;)Lcom/sun/mail/imap/protocol/BODY;
    .registers 4
    .param p1, "msgno"    # I
    .param p2, "section"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1403
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchBody(ILjava/lang/String;Z)Lcom/sun/mail/imap/protocol/BODY;

    move-result-object v0

    return-object v0
.end method

.method public peekBody(ILjava/lang/String;II)Lcom/sun/mail/imap/protocol/BODY;
    .registers 12
    .param p1, "msgno"    # I
    .param p2, "section"    # Ljava/lang/String;
    .param p3, "start"    # I
    .param p4, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1429
    const/4 v5, 0x1

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchBody(ILjava/lang/String;IIZLcom/sun/mail/iap/ByteArray;)Lcom/sun/mail/imap/protocol/BODY;

    move-result-object v0

    return-object v0
.end method

.method public peekBody(ILjava/lang/String;IILcom/sun/mail/iap/ByteArray;)Lcom/sun/mail/imap/protocol/BODY;
    .registers 13
    .param p1, "msgno"    # I
    .param p2, "section"    # Ljava/lang/String;
    .param p3, "start"    # I
    .param p4, "size"    # I
    .param p5, "ba"    # Lcom/sun/mail/iap/ByteArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1445
    const/4 v5, 0x1

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchBody(ILjava/lang/String;IIZLcom/sun/mail/iap/ByteArray;)Lcom/sun/mail/imap/protocol/BODY;

    move-result-object v0

    return-object v0
.end method

.method protected processGreeting(Lcom/sun/mail/iap/Response;)V
    .registers 4
    .param p1, "r"    # Lcom/sun/mail/iap/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 278
    invoke-super {p0, p1}, Lcom/sun/mail/iap/Protocol;->processGreeting(Lcom/sun/mail/iap/Response;)V

    .line 279
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v1

    if-eqz v1, :cond_d

    .line 280
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->setCapabilities(Lcom/sun/mail/iap/Response;)V

    .line 291
    :goto_c
    return-void

    .line 284
    :cond_d
    sget-boolean v1, Lcom/sun/mail/imap/protocol/IMAPProtocol;->$assertionsDisabled:Z

    if-nez v1, :cond_1b

    instance-of v1, p1, Lcom/sun/mail/imap/protocol/IMAPResponse;

    if-nez v1, :cond_1b

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    :cond_1b
    move-object v0, p1

    .line 285
    check-cast v0, Lcom/sun/mail/imap/protocol/IMAPResponse;

    .line 286
    .local v0, "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    const-string v1, "PREAUTH"

    invoke-virtual {v0, v1}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 287
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->authenticated:Z

    .line 288
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->setCapabilities(Lcom/sun/mail/iap/Response;)V

    goto :goto_c

    .line 290
    :cond_2d
    new-instance v1, Lcom/sun/mail/iap/ConnectionException;

    invoke-direct {v1, p0, p1}, Lcom/sun/mail/iap/ConnectionException;-><init>(Lcom/sun/mail/iap/Protocol;Lcom/sun/mail/iap/Response;)V

    throw v1
.end method

.method public processIdleResponse(Lcom/sun/mail/iap/Response;)Z
    .registers 8
    .param p1, "r"    # Lcom/sun/mail/iap/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 2683
    new-array v1, v2, [Lcom/sun/mail/iap/Response;

    .line 2684
    .local v1, "responses":[Lcom/sun/mail/iap/Response;
    aput-object p1, v1, v3

    .line 2685
    const/4 v0, 0x0

    .line 2686
    .local v0, "done":Z
    invoke-virtual {p0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 2688
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isBYE()Z

    move-result v4

    if-eqz v4, :cond_11

    .line 2689
    const/4 v0, 0x1

    .line 2692
    :cond_11
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isTagged()Z

    move-result v4

    if-eqz v4, :cond_24

    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->getTag()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->idleTag:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_24

    .line 2693
    const/4 v0, 0x1

    .line 2695
    :cond_24
    if-eqz v0, :cond_29

    .line 2696
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->idleTag:Ljava/lang/String;

    .line 2698
    :cond_29
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 2699
    if-nez v0, :cond_2f

    :goto_2e
    return v2

    :cond_2f
    move v2, v3

    goto :goto_2e
.end method

.method public proxyauth(Ljava/lang/String;)V
    .registers 4
    .param p1, "u"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 824
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 825
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-virtual {v0, p1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 827
    const-string v1, "PROXYAUTH"

    invoke-virtual {p0, v1, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->simpleCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)V

    .line 828
    iput-object p1, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->proxyAuthUser:Ljava/lang/String;

    .line 829
    return-void
.end method

.method public declared-synchronized readIdleResponse()Lcom/sun/mail/iap/Response;
    .registers 6

    .prologue
    .line 2646
    monitor-enter p0

    :try_start_1
    iget-object v4, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->idleTag:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_28

    if-nez v4, :cond_8

    .line 2647
    const/4 v3, 0x0

    .line 2672
    :cond_6
    monitor-exit p0

    return-object v3

    .line 2648
    :cond_8
    const/4 v3, 0x0

    .line 2649
    .local v3, "r":Lcom/sun/mail/iap/Response;
    :goto_9
    if-nez v3, :cond_6

    .line 2651
    :try_start_b
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->readResponse()Lcom/sun/mail/iap/Response;
    :try_end_e
    .catch Ljava/io/InterruptedIOException; {:try_start_b .. :try_end_e} :catch_10
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_e} :catch_1c
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_b .. :try_end_e} :catch_22
    .catchall {:try_start_b .. :try_end_e} :catchall_28

    move-result-object v3

    goto :goto_9

    .line 2652
    :catch_10
    move-exception v0

    .line 2659
    .local v0, "iioex":Ljava/io/InterruptedIOException;
    :try_start_11
    iget v4, v0, Ljava/io/InterruptedIOException;->bytesTransferred:I

    if-nez v4, :cond_17

    .line 2660
    const/4 v3, 0x0

    goto :goto_9

    .line 2663
    :cond_17
    invoke-static {v0}, Lcom/sun/mail/iap/Response;->byeResponse(Ljava/lang/Exception;)Lcom/sun/mail/iap/Response;

    move-result-object v3

    goto :goto_9

    .line 2664
    .end local v0    # "iioex":Ljava/io/InterruptedIOException;
    :catch_1c
    move-exception v1

    .line 2666
    .local v1, "ioex":Ljava/io/IOException;
    invoke-static {v1}, Lcom/sun/mail/iap/Response;->byeResponse(Ljava/lang/Exception;)Lcom/sun/mail/iap/Response;

    move-result-object v3

    .line 2670
    goto :goto_9

    .line 2667
    .end local v1    # "ioex":Ljava/io/IOException;
    :catch_22
    move-exception v2

    .line 2669
    .local v2, "pex":Lcom/sun/mail/iap/ProtocolException;
    invoke-static {v2}, Lcom/sun/mail/iap/Response;->byeResponse(Ljava/lang/Exception;)Lcom/sun/mail/iap/Response;
    :try_end_26
    .catchall {:try_start_11 .. :try_end_26} :catchall_28

    move-result-object v3

    .line 2670
    goto :goto_9

    .line 2646
    .end local v2    # "pex":Lcom/sun/mail/iap/ProtocolException;
    .end local v3    # "r":Lcom/sun/mail/iap/Response;
    :catchall_28
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public readResponse()Lcom/sun/mail/iap/Response;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 321
    new-instance v0, Lcom/sun/mail/imap/protocol/IMAPResponse;

    invoke-direct {v0, p0}, Lcom/sun/mail/imap/protocol/IMAPResponse;-><init>(Lcom/sun/mail/iap/Protocol;)V

    .line 322
    .local v0, "r":Lcom/sun/mail/imap/protocol/IMAPResponse;
    const-string v2, "FETCH"

    invoke-virtual {v0, v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_17

    .line 323
    new-instance v1, Lcom/sun/mail/imap/protocol/FetchResponse;

    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getFetchItems()[Lcom/sun/mail/imap/protocol/FetchItem;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/sun/mail/imap/protocol/FetchResponse;-><init>(Lcom/sun/mail/imap/protocol/IMAPResponse;[Lcom/sun/mail/imap/protocol/FetchItem;)V

    .end local v0    # "r":Lcom/sun/mail/imap/protocol/IMAPResponse;
    .local v1, "r":Lcom/sun/mail/imap/protocol/IMAPResponse;
    move-object v0, v1

    .line 324
    .end local v1    # "r":Lcom/sun/mail/imap/protocol/IMAPResponse;
    .restart local v0    # "r":Lcom/sun/mail/imap/protocol/IMAPResponse;
    :cond_17
    return-object v0
.end method

.method public rename(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "o"    # Ljava/lang/String;
    .param p2, "n"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1150
    invoke-static {p1}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1151
    invoke-static {p2}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1153
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 1154
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-virtual {v0, p1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 1155
    invoke-virtual {v0, p2}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 1157
    const-string v1, "RENAME"

    invoke-virtual {p0, v1, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->simpleCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)V

    .line 1158
    return-void
.end method

.method public sasllogin([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 19
    .param p1, "allowed"    # [Ljava/lang/String;
    .param p2, "realm"    # Ljava/lang/String;
    .param p3, "authzid"    # Ljava/lang/String;
    .param p4, "u"    # Ljava/lang/String;
    .param p5, "p"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 746
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->props:Ljava/util/Properties;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mail."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".sasl.usecanonicalhostname"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v0, v2, v3}, Lcom/sun/mail/util/PropUtil;->getBooleanProperty(Ljava/util/Properties;Ljava/lang/String;Z)Z

    move-result v11

    .line 749
    .local v11, "useCanonicalHostName":Z
    if-eqz v11, :cond_97

    .line 750
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getCanonicalHostName()Ljava/lang/String;

    move-result-object v10

    .line 753
    .local v10, "serviceHost":Ljava/lang/String;
    :goto_2c
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->saslAuthenticator:Lcom/sun/mail/imap/protocol/SaslAuthenticator;

    if-nez v0, :cond_76

    .line 755
    :try_start_30
    const-string v0, "com.sun.mail.imap.protocol.IMAPSaslAuthenticator"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    .line 757
    .local v9, "sac":Ljava/lang/Class;
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v2, 0x0

    const-class v3, Lcom/sun/mail/imap/protocol/IMAPProtocol;

    aput-object v3, v0, v2

    const/4 v2, 0x1

    const-class v3, Ljava/lang/String;

    aput-object v3, v0, v2

    const/4 v2, 0x2

    const-class v3, Ljava/util/Properties;

    aput-object v3, v0, v2

    const/4 v2, 0x3

    const-class v3, Lcom/sun/mail/util/MailLogger;

    aput-object v3, v0, v2

    const/4 v2, 0x4

    const-class v3, Ljava/lang/String;

    aput-object v3, v0, v2

    invoke-virtual {v9, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v6

    .line 764
    .local v6, "c":Ljava/lang/reflect/Constructor;
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v0, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->name:Ljava/lang/String;

    aput-object v3, v0, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->props:Ljava/util/Properties;

    aput-object v3, v0, v2

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    aput-object v3, v0, v2

    const/4 v2, 0x4

    aput-object v10, v0, v2

    invoke-virtual {v6, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sun/mail/imap/protocol/SaslAuthenticator;

    iput-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->saslAuthenticator:Lcom/sun/mail/imap/protocol/SaslAuthenticator;
    :try_end_76
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_76} :catch_9a

    .line 781
    .end local v6    # "c":Ljava/lang/reflect/Constructor;
    .end local v9    # "sac":Ljava/lang/Class;
    :cond_76
    if-eqz p1, :cond_a5

    array-length v0, p1

    if-lez v0, :cond_a5

    .line 783
    new-instance v12, Ljava/util/ArrayList;

    array-length v0, p1

    invoke-direct {v12, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 784
    .local v12, "v":Ljava/util/List;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_82
    array-length v0, p1

    if-ge v8, v0, :cond_a7

    .line 785
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->authmechs:Ljava/util/List;

    aget-object v2, p1, v8

    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_94

    .line 786
    aget-object v0, p1, v8

    invoke-interface {v12, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 784
    :cond_94
    add-int/lit8 v8, v8, 0x1

    goto :goto_82

    .line 752
    .end local v8    # "i":I
    .end local v10    # "serviceHost":Ljava/lang/String;
    .end local v12    # "v":Ljava/util/List;
    :cond_97
    iget-object v10, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->host:Ljava/lang/String;

    .restart local v10    # "serviceHost":Ljava/lang/String;
    goto :goto_2c

    .line 772
    :catch_9a
    move-exception v7

    .line 773
    .local v7, "ex":Ljava/lang/Exception;
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v3, "Can\'t load SASL authenticator"

    invoke-virtual {v0, v2, v3, v7}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 811
    .end local v7    # "ex":Ljava/lang/Exception;
    :goto_a4
    return-void

    .line 789
    :cond_a5
    iget-object v12, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->authmechs:Ljava/util/List;

    .line 791
    .restart local v12    # "v":Ljava/util/List;
    :cond_a7
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {v12, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    move-object v1, v0

    check-cast v1, [Ljava/lang/String;

    .line 795
    .local v1, "mechs":[Ljava/lang/String;
    :try_start_b6
    iget-boolean v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noauthdebug:Z

    if-eqz v0, :cond_ca

    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isTracing()Z

    move-result v0

    if-eqz v0, :cond_ca

    .line 796
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v2, "SASL authentication command trace suppressed"

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 797
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->suspendTracing()V

    .line 800
    :cond_ca
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->saslAuthenticator:Lcom/sun/mail/imap/protocol/SaslAuthenticator;

    move-object v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    invoke-interface/range {v0 .. v5}, Lcom/sun/mail/imap/protocol/SaslAuthenticator;->authenticate([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f1

    .line 801
    iget-boolean v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noauthdebug:Z

    if-eqz v0, :cond_ea

    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isTracing()Z

    move-result v0

    if-eqz v0, :cond_ea

    .line 802
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v2, "SASL authentication succeeded"

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 803
    :cond_ea
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->authenticated:Z
    :try_end_ed
    .catchall {:try_start_b6 .. :try_end_ed} :catchall_103

    .line 809
    :cond_ed
    :goto_ed
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->resumeTracing()V

    goto :goto_a4

    .line 805
    :cond_f1
    :try_start_f1
    iget-boolean v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noauthdebug:Z

    if-eqz v0, :cond_ed

    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isTracing()Z

    move-result v0

    if-eqz v0, :cond_ed

    .line 806
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v2, "SASL authentication failed"

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_102
    .catchall {:try_start_f1 .. :try_end_102} :catchall_103

    goto :goto_ed

    .line 809
    :catchall_103
    move-exception v0

    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->resumeTracing()V

    throw v0
.end method

.method public search(Lkorex/mail/search/SearchTerm;)[I
    .registers 3
    .param p1, "term"    # Lkorex/mail/search/SearchTerm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;,
            Lkorex/mail/search/SearchException;
        }
    .end annotation

    .prologue
    .line 1936
    const-string v0, "ALL"

    invoke-direct {p0, v0, p1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->search(Ljava/lang/String;Lkorex/mail/search/SearchTerm;)[I

    move-result-object v0

    return-object v0
.end method

.method public search([Lcom/sun/mail/imap/protocol/MessageSet;Lkorex/mail/search/SearchTerm;)[I
    .registers 4
    .param p1, "msgsets"    # [Lcom/sun/mail/imap/protocol/MessageSet;
    .param p2, "term"    # Lkorex/mail/search/SearchTerm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;,
            Lkorex/mail/search/SearchException;
        }
    .end annotation

    .prologue
    .line 1923
    invoke-static {p1}, Lcom/sun/mail/imap/protocol/MessageSet;->toString([Lcom/sun/mail/imap/protocol/MessageSet;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->search(Ljava/lang/String;Lkorex/mail/search/SearchTerm;)[I

    move-result-object v0

    return-object v0
.end method

.method public select(Ljava/lang/String;)Lcom/sun/mail/imap/protocol/MailboxInfo;
    .registers 3
    .param p1, "mbox"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 899
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->select(Ljava/lang/String;Lcom/sun/mail/imap/ResyncData;)Lcom/sun/mail/imap/protocol/MailboxInfo;

    move-result-object v0

    return-object v0
.end method

.method public select(Ljava/lang/String;Lcom/sun/mail/imap/ResyncData;)Lcom/sun/mail/imap/protocol/MailboxInfo;
    .registers 9
    .param p1, "mbox"    # Ljava/lang/String;
    .param p2, "rd"    # Lcom/sun/mail/imap/ResyncData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 912
    invoke-static {p1}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 914
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 915
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-virtual {v0, p1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 917
    if-eqz p2, :cond_30

    .line 918
    sget-object v4, Lcom/sun/mail/imap/ResyncData;->CONDSTORE:Lcom/sun/mail/imap/ResyncData;

    if-ne p2, v4, :cond_5d

    .line 919
    const-string v4, "CONDSTORE"

    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_22

    .line 920
    new-instance v4, Lcom/sun/mail/iap/BadCommandException;

    const-string v5, "CONDSTORE not supported"

    invoke-direct {v4, v5}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 921
    :cond_22
    new-instance v4, Lcom/sun/mail/iap/Argument;

    invoke-direct {v4}, Lcom/sun/mail/iap/Argument;-><init>()V

    const-string v5, "CONDSTORE"

    invoke-virtual {v4, v5}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/sun/mail/iap/Argument;->writeArgument(Lcom/sun/mail/iap/Argument;)Lcom/sun/mail/iap/Argument;

    .line 929
    :cond_30
    :goto_30
    const-string v4, "SELECT"

    invoke-virtual {p0, v4, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v2

    .line 933
    .local v2, "r":[Lcom/sun/mail/iap/Response;
    new-instance v1, Lcom/sun/mail/imap/protocol/MailboxInfo;

    invoke-direct {v1, v2}, Lcom/sun/mail/imap/protocol/MailboxInfo;-><init>([Lcom/sun/mail/iap/Response;)V

    .line 936
    .local v1, "minfo":Lcom/sun/mail/imap/protocol/MailboxInfo;
    invoke-virtual {p0, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 938
    array-length v4, v2

    add-int/lit8 v4, v4, -0x1

    aget-object v3, v2, v4

    .line 940
    .local v3, "response":Lcom/sun/mail/iap/Response;
    invoke-virtual {v3}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v4

    if-eqz v4, :cond_59

    .line 941
    invoke-virtual {v3}, Lcom/sun/mail/iap/Response;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "READ-ONLY"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_75

    .line 942
    const/4 v4, 0x1

    iput v4, v1, Lcom/sun/mail/imap/protocol/MailboxInfo;->mode:I

    .line 947
    :cond_59
    :goto_59
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 948
    return-object v1

    .line 923
    .end local v1    # "minfo":Lcom/sun/mail/imap/protocol/MailboxInfo;
    .end local v2    # "r":[Lcom/sun/mail/iap/Response;
    .end local v3    # "response":Lcom/sun/mail/iap/Response;
    :cond_5d
    const-string v4, "QRESYNC"

    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_6d

    .line 924
    new-instance v4, Lcom/sun/mail/iap/BadCommandException;

    const-string v5, "QRESYNC not supported"

    invoke-direct {v4, v5}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 925
    :cond_6d
    invoke-static {p2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->resyncArgs(Lcom/sun/mail/imap/ResyncData;)Lcom/sun/mail/iap/Argument;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/sun/mail/iap/Argument;->writeArgument(Lcom/sun/mail/iap/Argument;)Lcom/sun/mail/iap/Argument;

    goto :goto_30

    .line 944
    .restart local v1    # "minfo":Lcom/sun/mail/imap/protocol/MailboxInfo;
    .restart local v2    # "r":[Lcom/sun/mail/iap/Response;
    .restart local v3    # "response":Lcom/sun/mail/iap/Response;
    :cond_75
    const/4 v4, 0x2

    iput v4, v1, Lcom/sun/mail/imap/protocol/MailboxInfo;->mode:I

    goto :goto_59
.end method

.method public setACL(Ljava/lang/String;CLcom/sun/mail/imap/ACL;)V
    .registers 10
    .param p1, "mbox"    # Ljava/lang/String;
    .param p2, "modifier"    # C
    .param p3, "acl"    # Lcom/sun/mail/imap/ACL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 2379
    const-string v4, "ACL"

    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_10

    .line 2380
    new-instance v4, Lcom/sun/mail/iap/BadCommandException;

    const-string v5, "ACL not supported"

    invoke-direct {v4, v5}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2383
    :cond_10
    invoke-static {p1}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2385
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 2386
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-virtual {v0, p1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 2387
    invoke-virtual {p3}, Lcom/sun/mail/imap/ACL;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 2388
    invoke-virtual {p3}, Lcom/sun/mail/imap/ACL;->getRights()Lcom/sun/mail/imap/Rights;

    move-result-object v4

    invoke-virtual {v4}, Lcom/sun/mail/imap/Rights;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2389
    .local v3, "rights":Ljava/lang/String;
    const/16 v4, 0x2b

    if-eq p2, v4, :cond_33

    const/16 v4, 0x2d

    if-ne p2, v4, :cond_44

    .line 2390
    :cond_33
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2391
    :cond_44
    invoke-virtual {v0, v3}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 2393
    const-string v4, "SETACL"

    invoke-virtual {p0, v4, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v1

    .line 2394
    .local v1, "r":[Lcom/sun/mail/iap/Response;
    array-length v4, v1

    add-int/lit8 v4, v4, -0x1

    aget-object v2, v1, v4

    .line 2397
    .local v2, "response":Lcom/sun/mail/iap/Response;
    invoke-virtual {p0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 2398
    invoke-virtual {p0, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 2399
    return-void
.end method

.method protected setCapabilities(Lcom/sun/mail/iap/Response;)V
    .registers 6
    .param p1, "r"    # Lcom/sun/mail/iap/Response;

    .prologue
    .line 228
    :cond_0
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readByte()B

    move-result v0

    .local v0, "b":B
    if-lez v0, :cond_a

    const/16 v2, 0x5b

    if-ne v0, v2, :cond_0

    .line 230
    :cond_a
    if-nez v0, :cond_d

    .line 239
    :cond_c
    :goto_c
    return-void

    .line 233
    :cond_d
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readAtom()Ljava/lang/String;

    move-result-object v1

    .line 234
    .local v1, "s":Ljava/lang/String;
    const-string v2, "CAPABILITY"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 236
    new-instance v2, Ljava/util/HashMap;

    const/16 v3, 0xa

    invoke-direct {v2, v3}, Ljava/util/HashMap;-><init>(I)V

    iput-object v2, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->capabilities:Ljava/util/Map;

    .line 237
    new-instance v2, Ljava/util/ArrayList;

    const/4 v3, 0x5

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->authmechs:Ljava/util/List;

    .line 238
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->parseCapabilities(Lcom/sun/mail/iap/Response;)V

    goto :goto_c
.end method

.method public setQuota(Lkorex/mail/Quota;)V
    .registers 9
    .param p1, "quota"    # Lkorex/mail/Quota;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 2294
    const-string v5, "QUOTA"

    invoke-virtual {p0, v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_10

    .line 2295
    new-instance v5, Lcom/sun/mail/iap/BadCommandException;

    const-string v6, "QUOTA not supported"

    invoke-direct {v5, v6}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 2297
    :cond_10
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 2298
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    iget-object v5, p1, Lkorex/mail/Quota;->quotaRoot:Ljava/lang/String;

    invoke-virtual {v0, v5}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 2299
    new-instance v2, Lcom/sun/mail/iap/Argument;

    invoke-direct {v2}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 2300
    .local v2, "qargs":Lcom/sun/mail/iap/Argument;
    iget-object v5, p1, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    if-eqz v5, :cond_3e

    .line 2301
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_24
    iget-object v5, p1, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    array-length v5, v5

    if-ge v1, v5, :cond_3e

    .line 2302
    iget-object v5, p1, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    aget-object v5, v5, v1

    iget-object v5, v5, Lkorex/mail/Quota$Resource;->name:Ljava/lang/String;

    invoke-virtual {v2, v5}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 2303
    iget-object v5, p1, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    aget-object v5, v5, v1

    iget-wide v5, v5, Lkorex/mail/Quota$Resource;->limit:J

    invoke-virtual {v2, v5, v6}, Lcom/sun/mail/iap/Argument;->writeNumber(J)Lcom/sun/mail/iap/Argument;

    .line 2301
    add-int/lit8 v1, v1, 0x1

    goto :goto_24

    .line 2306
    .end local v1    # "i":I
    :cond_3e
    invoke-virtual {v0, v2}, Lcom/sun/mail/iap/Argument;->writeArgument(Lcom/sun/mail/iap/Argument;)Lcom/sun/mail/iap/Argument;

    .line 2308
    const-string v5, "SETQUOTA"

    invoke-virtual {p0, v5, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v3

    .line 2309
    .local v3, "r":[Lcom/sun/mail/iap/Response;
    array-length v5, v3

    add-int/lit8 v5, v5, -0x1

    aget-object v4, v3, v5

    .line 2336
    .local v4, "response":Lcom/sun/mail/iap/Response;
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 2337
    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 2341
    return-void
.end method

.method public sort([Lcom/sun/mail/imap/SortTerm;Lkorex/mail/search/SearchTerm;)[I
    .registers 18
    .param p1, "term"    # [Lcom/sun/mail/imap/SortTerm;
    .param p2, "sterm"    # Lkorex/mail/search/SearchTerm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;,
            Lkorex/mail/search/SearchException;
        }
    .end annotation

    .prologue
    .line 2078
    const-string v13, "SORT*"

    invoke-virtual {p0, v13}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_10

    .line 2079
    new-instance v13, Lcom/sun/mail/iap/BadCommandException;

    const-string v14, "SORT not supported"

    invoke-direct {v13, v14}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 2081
    :cond_10
    if-eqz p1, :cond_17

    move-object/from16 v0, p1

    array-length v13, v0

    if-nez v13, :cond_1f

    .line 2082
    :cond_17
    new-instance v13, Lcom/sun/mail/iap/BadCommandException;

    const-string v14, "Must have at least one sort term"

    invoke-direct {v13, v14}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 2084
    :cond_1f
    new-instance v1, Lcom/sun/mail/iap/Argument;

    invoke-direct {v1}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 2085
    .local v1, "args":Lcom/sun/mail/iap/Argument;
    new-instance v10, Lcom/sun/mail/iap/Argument;

    invoke-direct {v10}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 2086
    .local v10, "sargs":Lcom/sun/mail/iap/Argument;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2a
    move-object/from16 v0, p1

    array-length v13, v0

    if-ge v2, v13, :cond_3b

    .line 2087
    aget-object v13, p1, v2

    invoke-virtual {v13}, Lcom/sun/mail/imap/SortTerm;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v10, v13}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 2086
    add-int/lit8 v2, v2, 0x1

    goto :goto_2a

    .line 2088
    :cond_3b
    invoke-virtual {v1, v10}, Lcom/sun/mail/iap/Argument;->writeArgument(Lcom/sun/mail/iap/Argument;)Lcom/sun/mail/iap/Argument;

    .line 2090
    const-string v13, "UTF-8"

    invoke-virtual {v1, v13}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 2091
    if-eqz p2, :cond_83

    .line 2094
    :try_start_45
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getSearchSequence()Lcom/sun/mail/imap/protocol/SearchSequence;

    move-result-object v13

    const-string v14, "UTF-8"

    move-object/from16 v0, p2

    invoke-virtual {v13, v0, v14}, Lcom/sun/mail/imap/protocol/SearchSequence;->generateSequence(Lkorex/mail/search/SearchTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v13

    .line 2093
    invoke-virtual {v1, v13}, Lcom/sun/mail/iap/Argument;->append(Lcom/sun/mail/iap/Argument;)Lcom/sun/mail/iap/Argument;
    :try_end_54
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_54} :catch_78

    .line 2102
    :goto_54
    const-string v13, "SORT"

    invoke-virtual {p0, v13, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v8

    .line 2103
    .local v8, "r":[Lcom/sun/mail/iap/Response;
    array-length v13, v8

    add-int/lit8 v13, v13, -0x1

    aget-object v9, v8, v13

    .line 2104
    .local v9, "response":Lcom/sun/mail/iap/Response;
    const/4 v6, 0x0

    .line 2107
    .local v6, "matches":[I
    invoke-virtual {v9}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v13

    if-eqz v13, :cond_c0

    .line 2108
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 2110
    .local v11, "v":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v2, 0x0

    array-length v5, v8

    .local v5, "len":I
    :goto_6d
    if-ge v2, v5, :cond_a8

    .line 2111
    aget-object v13, v8, v2

    instance-of v13, v13, Lcom/sun/mail/imap/protocol/IMAPResponse;

    if-nez v13, :cond_89

    .line 2110
    :cond_75
    :goto_75
    add-int/lit8 v2, v2, 0x1

    goto :goto_6d

    .line 2095
    .end local v5    # "len":I
    .end local v6    # "matches":[I
    .end local v8    # "r":[Lcom/sun/mail/iap/Response;
    .end local v9    # "response":Lcom/sun/mail/iap/Response;
    .end local v11    # "v":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :catch_78
    move-exception v3

    .line 2097
    .local v3, "ioex":Ljava/io/IOException;
    new-instance v13, Lkorex/mail/search/SearchException;

    invoke-virtual {v3}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Lkorex/mail/search/SearchException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 2100
    .end local v3    # "ioex":Ljava/io/IOException;
    :cond_83
    const-string v13, "ALL"

    invoke-virtual {v1, v13}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_54

    .line 2114
    .restart local v5    # "len":I
    .restart local v6    # "matches":[I
    .restart local v8    # "r":[Lcom/sun/mail/iap/Response;
    .restart local v9    # "response":Lcom/sun/mail/iap/Response;
    .restart local v11    # "v":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_89
    aget-object v4, v8, v2

    check-cast v4, Lcom/sun/mail/imap/protocol/IMAPResponse;

    .line 2115
    .local v4, "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    const-string v13, "SORT"

    invoke-virtual {v4, v13}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_75

    .line 2116
    :goto_95
    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readNumber()I

    move-result v7

    .local v7, "num":I
    const/4 v13, -0x1

    if-eq v7, v13, :cond_a4

    .line 2117
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v11, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_95

    .line 2118
    :cond_a4
    const/4 v13, 0x0

    aput-object v13, v8, v2

    goto :goto_75

    .line 2123
    .end local v4    # "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    .end local v7    # "num":I
    :cond_a8
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v12

    .line 2124
    .local v12, "vsize":I
    new-array v6, v12, [I

    .line 2125
    const/4 v2, 0x0

    :goto_af
    if-ge v2, v12, :cond_c0

    .line 2126
    invoke-interface {v11, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    aput v13, v6, v2

    .line 2125
    add-int/lit8 v2, v2, 0x1

    goto :goto_af

    .line 2130
    .end local v5    # "len":I
    .end local v11    # "v":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v12    # "vsize":I
    :cond_c0
    invoke-virtual {p0, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 2131
    invoke-virtual {p0, v9}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 2132
    return-object v6
.end method

.method public startTLS()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 875
    :try_start_0
    const-string v3, "STARTTLS"

    invoke-super {p0, v3}, Lcom/sun/mail/iap/Protocol;->startTLS(Ljava/lang/String;)V
    :try_end_5
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_0 .. :try_end_5} :catch_6
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_11

    .line 891
    return-void

    .line 876
    :catch_6
    move-exception v1

    .line 877
    .local v1, "pex":Lcom/sun/mail/iap/ProtocolException;
    iget-object v3, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v5, "STARTTLS ProtocolException"

    invoke-virtual {v3, v4, v5, v1}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 881
    throw v1

    .line 882
    .end local v1    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :catch_11
    move-exception v0

    .line 883
    .local v0, "ex":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v5, "STARTTLS Exception"

    invoke-virtual {v3, v4, v5, v0}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 886
    const/4 v3, 0x1

    new-array v2, v3, [Lcom/sun/mail/iap/Response;

    const/4 v3, 0x0

    invoke-static {v0}, Lcom/sun/mail/iap/Response;->byeResponse(Ljava/lang/Exception;)Lcom/sun/mail/iap/Response;

    move-result-object v4

    aput-object v4, v2, v3

    .line 887
    .local v2, "r":[Lcom/sun/mail/iap/Response;
    invoke-virtual {p0, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 888
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->disconnect()V

    .line 889
    new-instance v3, Lcom/sun/mail/iap/ProtocolException;

    const-string v4, "STARTTLS failure"

    invoke-direct {v3, v4, v0}, Lcom/sun/mail/iap/ProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public status(Ljava/lang/String;[Ljava/lang/String;)Lcom/sun/mail/imap/protocol/Status;
    .registers 13
    .param p1, "mbox"    # Ljava/lang/String;
    .param p2, "items"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1066
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isREV1()Z

    move-result v8

    if-nez v8, :cond_16

    const-string v8, "IMAP4SUNVERSION"

    invoke-virtual {p0, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_16

    .line 1069
    new-instance v8, Lcom/sun/mail/iap/BadCommandException;

    const-string v9, "STATUS not supported"

    invoke-direct {v8, v9}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1072
    :cond_16
    invoke-static {p1}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1074
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 1075
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-virtual {v0, p1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 1077
    new-instance v3, Lcom/sun/mail/iap/Argument;

    invoke-direct {v3}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 1078
    .local v3, "itemArgs":Lcom/sun/mail/iap/Argument;
    if-nez p2, :cond_2b

    .line 1079
    sget-object p2, Lcom/sun/mail/imap/protocol/Status;->standardItems:[Ljava/lang/String;

    .line 1081
    :cond_2b
    const/4 v1, 0x0

    .local v1, "i":I
    array-length v4, p2

    .local v4, "len":I
    :goto_2d
    if-ge v1, v4, :cond_37

    .line 1082
    aget-object v8, p2, v1

    invoke-virtual {v3, v8}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 1081
    add-int/lit8 v1, v1, 0x1

    goto :goto_2d

    .line 1083
    :cond_37
    invoke-virtual {v0, v3}, Lcom/sun/mail/iap/Argument;->writeArgument(Lcom/sun/mail/iap/Argument;)Lcom/sun/mail/iap/Argument;

    .line 1085
    const-string v8, "STATUS"

    invoke-virtual {p0, v8, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v5

    .line 1087
    .local v5, "r":[Lcom/sun/mail/iap/Response;
    const/4 v7, 0x0

    .line 1088
    .local v7, "status":Lcom/sun/mail/imap/protocol/Status;
    array-length v8, v5

    add-int/lit8 v8, v8, -0x1

    aget-object v6, v5, v8

    .line 1091
    .local v6, "response":Lcom/sun/mail/iap/Response;
    invoke-virtual {v6}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v8

    if-eqz v8, :cond_79

    .line 1092
    const/4 v1, 0x0

    array-length v4, v5

    :goto_4e
    if-ge v1, v4, :cond_79

    .line 1093
    aget-object v8, v5, v1

    instance-of v8, v8, Lcom/sun/mail/imap/protocol/IMAPResponse;

    if-nez v8, :cond_59

    .line 1092
    :cond_56
    :goto_56
    add-int/lit8 v1, v1, 0x1

    goto :goto_4e

    .line 1096
    :cond_59
    aget-object v2, v5, v1

    check-cast v2, Lcom/sun/mail/imap/protocol/IMAPResponse;

    .line 1097
    .local v2, "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    const-string v8, "STATUS"

    invoke-virtual {v2, v8}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_56

    .line 1098
    if-nez v7, :cond_70

    .line 1099
    new-instance v7, Lcom/sun/mail/imap/protocol/Status;

    .end local v7    # "status":Lcom/sun/mail/imap/protocol/Status;
    invoke-direct {v7, v2}, Lcom/sun/mail/imap/protocol/Status;-><init>(Lcom/sun/mail/iap/Response;)V

    .line 1102
    .restart local v7    # "status":Lcom/sun/mail/imap/protocol/Status;
    :goto_6c
    const/4 v8, 0x0

    aput-object v8, v5, v1

    goto :goto_56

    .line 1101
    :cond_70
    new-instance v8, Lcom/sun/mail/imap/protocol/Status;

    invoke-direct {v8, v2}, Lcom/sun/mail/imap/protocol/Status;-><init>(Lcom/sun/mail/iap/Response;)V

    invoke-static {v7, v8}, Lcom/sun/mail/imap/protocol/Status;->add(Lcom/sun/mail/imap/protocol/Status;Lcom/sun/mail/imap/protocol/Status;)V

    goto :goto_6c

    .line 1108
    .end local v2    # "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    :cond_79
    invoke-virtual {p0, v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 1109
    invoke-virtual {p0, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 1110
    return-object v7
.end method

.method public storeFlags(IILkorex/mail/Flags;Z)V
    .registers 7
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "flags"    # Lkorex/mail/Flags;
    .param p4, "set"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1839
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p3, p4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->storeFlags(Ljava/lang/String;Lkorex/mail/Flags;Z)V

    .line 1841
    return-void
.end method

.method public storeFlags(ILkorex/mail/Flags;Z)V
    .registers 5
    .param p1, "msg"    # I
    .param p2, "flags"    # Lkorex/mail/Flags;
    .param p3, "set"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1848
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->storeFlags(Ljava/lang/String;Lkorex/mail/Flags;Z)V

    .line 1849
    return-void
.end method

.method public storeFlags([Lcom/sun/mail/imap/protocol/MessageSet;Lkorex/mail/Flags;Z)V
    .registers 5
    .param p1, "msgsets"    # [Lcom/sun/mail/imap/protocol/MessageSet;
    .param p2, "flags"    # Lkorex/mail/Flags;
    .param p3, "set"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1834
    invoke-static {p1}, Lcom/sun/mail/imap/protocol/MessageSet;->toString([Lcom/sun/mail/imap/protocol/MessageSet;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->storeFlags(Ljava/lang/String;Lkorex/mail/Flags;Z)V

    .line 1835
    return-void
.end method

.method public subscribe(Ljava/lang/String;)V
    .registers 4
    .param p1, "mbox"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1166
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 1168
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-static {p1}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1169
    invoke-virtual {v0, p1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 1171
    const-string v1, "SUBSCRIBE"

    invoke-virtual {p0, v1, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->simpleCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)V

    .line 1172
    return-void
.end method

.method protected supportsNonSyncLiterals()Z
    .registers 2

    .prologue
    .line 312
    const-string v0, "LITERAL+"

    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public uidexpunge([Lcom/sun/mail/imap/protocol/UIDSet;)V
    .registers 4
    .param p1, "set"    # [Lcom/sun/mail/imap/protocol/UIDSet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1373
    const-string v0, "UIDPLUS"

    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 1374
    new-instance v0, Lcom/sun/mail/iap/BadCommandException;

    const-string v1, "UID EXPUNGE not supported"

    invoke-direct {v0, v1}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1375
    :cond_10
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "UID EXPUNGE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lcom/sun/mail/imap/protocol/UIDSet;->toString([Lcom/sun/mail/imap/protocol/UIDSet;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->simpleCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)V

    .line 1376
    return-void
.end method

.method public uidfetchChangedSince(JJJ)[I
    .registers 19
    .param p1, "start"    # J
    .param p3, "end"    # J
    .param p5, "modseq"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1705
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-wide/16 v10, -0x1

    cmp-long v8, p3, v10

    if-nez v8, :cond_65

    const-string v8, "*"

    .line 1707
    :goto_1b
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1708
    .local v4, "msgSequence":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "UID FETCH "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " (FLAGS) (CHANGEDSINCE "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 1709
    invoke-static/range {p5 .. p6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    .line 1708
    invoke-virtual {p0, v8, v9}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v5

    .line 1711
    .local v5, "r":[Lcom/sun/mail/iap/Response;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 1712
    .local v6, "v":Ljava/util/List;
    const/4 v1, 0x0

    .local v1, "i":I
    array-length v2, v5

    .local v2, "len":I
    :goto_56
    if-ge v1, v2, :cond_7a

    .line 1713
    aget-object v8, v5, v1

    if-eqz v8, :cond_62

    aget-object v8, v5, v1

    instance-of v8, v8, Lcom/sun/mail/imap/protocol/FetchResponse;

    if-nez v8, :cond_6a

    .line 1712
    :cond_62
    :goto_62
    add-int/lit8 v1, v1, 0x1

    goto :goto_56

    .line 1707
    .end local v1    # "i":I
    .end local v2    # "len":I
    .end local v4    # "msgSequence":Ljava/lang/String;
    .end local v5    # "r":[Lcom/sun/mail/iap/Response;
    .end local v6    # "v":Ljava/util/List;
    :cond_65
    invoke-static/range {p3 .. p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    goto :goto_1b

    .line 1716
    .restart local v1    # "i":I
    .restart local v2    # "len":I
    .restart local v4    # "msgSequence":Ljava/lang/String;
    .restart local v5    # "r":[Lcom/sun/mail/iap/Response;
    .restart local v6    # "v":Ljava/util/List;
    :cond_6a
    aget-object v0, v5, v1

    check-cast v0, Lcom/sun/mail/imap/protocol/FetchResponse;

    .line 1717
    .local v0, "fr":Lcom/sun/mail/imap/protocol/FetchResponse;
    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/FetchResponse;->getNumber()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v6, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_62

    .line 1720
    .end local v0    # "fr":Lcom/sun/mail/imap/protocol/FetchResponse;
    :cond_7a
    invoke-virtual {p0, v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 1721
    array-length v8, v5

    add-int/lit8 v8, v8, -0x1

    aget-object v8, v5, v8

    invoke-virtual {p0, v8}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 1724
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    .line 1725
    .local v7, "vsize":I
    new-array v3, v7, [I

    .line 1726
    .local v3, "matches":[I
    const/4 v1, 0x0

    :goto_8c
    if-ge v1, v7, :cond_9d

    .line 1727
    invoke-interface {v6, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    aput v8, v3, v1

    .line 1726
    add-int/lit8 v1, v1, 0x1

    goto :goto_8c

    .line 1728
    :cond_9d
    return-object v3
.end method

.method public unauthenticate()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 848
    const-string v0, "X-UNAUTHENTICATE"

    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 849
    new-instance v0, Lcom/sun/mail/iap/BadCommandException;

    const-string v1, "UNAUTHENTICATE not supported"

    invoke-direct {v0, v1}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 850
    :cond_10
    const-string v0, "UNAUTHENTICATE"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->simpleCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)V

    .line 851
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/sun/mail/imap/protocol/IMAPProtocol;->authenticated:Z

    .line 852
    return-void
.end method

.method public unselect()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1054
    const-string v0, "UNSELECT"

    invoke-virtual {p0, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 1055
    new-instance v0, Lcom/sun/mail/iap/BadCommandException;

    const-string v1, "UNSELECT not supported"

    invoke-direct {v0, v1}, Lcom/sun/mail/iap/BadCommandException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1056
    :cond_10
    const-string v0, "UNSELECT"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->simpleCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)V

    .line 1057
    return-void
.end method

.method public unsubscribe(Ljava/lang/String;)V
    .registers 4
    .param p1, "mbox"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1180
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 1182
    .local v0, "args":Lcom/sun/mail/iap/Argument;
    invoke-static {p1}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1183
    invoke-virtual {v0, p1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 1185
    const-string v1, "UNSUBSCRIBE"

    invoke-virtual {p0, v1, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->simpleCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)V

    .line 1186
    return-void
.end method
