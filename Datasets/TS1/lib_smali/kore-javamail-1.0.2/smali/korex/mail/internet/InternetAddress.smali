.class public Lkorex/mail/internet/InternetAddress;
.super Lkorex/mail/Address;
.source "InternetAddress.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field private static final ignoreBogusGroupName:Z

.field private static final rfc822phrase:Ljava/lang/String;

.field private static final serialVersionUID:J = -0x6830565bb828acb7L

.field private static final specialsNoDot:Ljava/lang/String; = "()<>,;:\\\"[]@"

.field private static final specialsNoDotNoAt:Ljava/lang/String; = "()<>,;:\\\"[]"


# instance fields
.field protected address:Ljava/lang/String;

.field protected encodedPersonal:Ljava/lang/String;

.field protected personal:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 86
    const-string v0, "mail.mime.address.ignorebogusgroupname"

    const/4 v1, 0x1

    .line 87
    invoke-static {v0, v1}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lkorex/mail/internet/InternetAddress;->ignoreBogusGroupName:Z

    .line 340
    const-string v0, "()<>@,;:\\\"\t .[]"

    const/16 v1, 0x20

    .line 341
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x9

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lkorex/mail/internet/InternetAddress;->rfc822phrase:Ljava/lang/String;

    .line 340
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 93
    invoke-direct {p0}, Lkorex/mail/Address;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 6
    .param p1, "address"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/AddressException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 111
    invoke-direct {p0}, Lkorex/mail/Address;-><init>()V

    .line 113
    invoke-static {p1, v3}, Lkorex/mail/internet/InternetAddress;->parse(Ljava/lang/String;Z)[Lkorex/mail/internet/InternetAddress;

    move-result-object v0

    .line 115
    .local v0, "a":[Lkorex/mail/internet/InternetAddress;
    array-length v1, v0

    if-eq v1, v3, :cond_14

    .line 116
    new-instance v1, Lkorex/mail/internet/AddressException;

    const-string v2, "Illegal address"

    invoke-direct {v1, v2, p1}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v1

    .line 124
    :cond_14
    aget-object v1, v0, v2

    iget-object v1, v1, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    iput-object v1, p0, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    .line 125
    aget-object v1, v0, v2

    iget-object v1, v1, Lkorex/mail/internet/InternetAddress;->personal:Ljava/lang/String;

    iput-object v1, p0, Lkorex/mail/internet/InternetAddress;->personal:Ljava/lang/String;

    .line 126
    aget-object v1, v0, v2

    iget-object v1, v1, Lkorex/mail/internet/InternetAddress;->encodedPersonal:Ljava/lang/String;

    iput-object v1, p0, Lkorex/mail/internet/InternetAddress;->encodedPersonal:Ljava/lang/String;

    .line 127
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "personal"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 161
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lkorex/mail/internet/InternetAddress;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "personal"    # Ljava/lang/String;
    .param p3, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 175
    invoke-direct {p0}, Lkorex/mail/Address;-><init>()V

    .line 176
    iput-object p1, p0, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    .line 177
    invoke-virtual {p0, p2, p3}, Lkorex/mail/internet/InternetAddress;->setPersonal(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 5
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "strict"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/AddressException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 141
    invoke-direct {p0, p1}, Lkorex/mail/internet/InternetAddress;-><init>(Ljava/lang/String;)V

    .line 142
    if-eqz p2, :cond_f

    .line 143
    invoke-virtual {p0}, Lkorex/mail/internet/InternetAddress;->isGroup()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 144
    invoke-virtual {p0, v1}, Lkorex/mail/internet/InternetAddress;->getGroup(Z)[Lkorex/mail/internet/InternetAddress;

    .line 148
    :cond_f
    :goto_f
    return-void

    .line 146
    :cond_10
    iget-object v0, p0, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    invoke-static {v0, v1, v1}, Lkorex/mail/internet/InternetAddress;->checkAddress(Ljava/lang/String;ZZ)V

    goto :goto_f
.end method

.method static _getLocalAddress(Lkorex/mail/Session;)Lkorex/mail/internet/InternetAddress;
    .registers 7
    .param p0, "session"    # Lkorex/mail/Session;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;,
            Lkorex/mail/internet/AddressException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 535
    const/4 v2, 0x0

    .local v2, "user":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "host":Ljava/lang/String;
    const/4 v0, 0x0

    .line 536
    .local v0, "address":Ljava/lang/String;
    if-nez p0, :cond_46

    .line 537
    const-string v3, "user.name"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 538
    invoke-static {}, Lkorex/mail/internet/InternetAddress;->getLocalHostName()Ljava/lang/String;

    move-result-object v1

    .line 553
    :cond_f
    :goto_f
    if-nez v0, :cond_42

    if-eqz v2, :cond_42

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_42

    if-eqz v1, :cond_42

    .line 554
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_42

    .line 555
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const-string v5, "()<>,;:\\\"[]@\t "

    invoke-static {v4, v5}, Lkorex/mail/internet/MimeUtility;->quote(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "@"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 558
    :cond_42
    if-nez v0, :cond_83

    .line 559
    const/4 v3, 0x0

    .line 561
    :goto_45
    return-object v3

    .line 540
    :cond_46
    const-string v3, "mail.from"

    invoke-virtual {p0, v3}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 541
    if-nez v0, :cond_f

    .line 542
    const-string v3, "mail.user"

    invoke-virtual {p0, v3}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 543
    if-eqz v2, :cond_5c

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_62

    .line 544
    :cond_5c
    const-string v3, "user.name"

    invoke-virtual {p0, v3}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 545
    :cond_62
    if-eqz v2, :cond_6a

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_70

    .line 546
    :cond_6a
    const-string v3, "user.name"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 547
    :cond_70
    const-string v3, "mail.host"

    invoke-virtual {p0, v3}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 548
    if-eqz v1, :cond_7e

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_f

    .line 549
    :cond_7e
    invoke-static {}, Lkorex/mail/internet/InternetAddress;->getLocalHostName()Ljava/lang/String;

    move-result-object v1

    goto :goto_f

    .line 561
    :cond_83
    new-instance v3, Lkorex/mail/internet/InternetAddress;

    invoke-direct {v3, v0}, Lkorex/mail/internet/InternetAddress;-><init>(Ljava/lang/String;)V

    goto :goto_45
.end method

.method private static checkAddress(Ljava/lang/String;ZZ)V
    .registers 16
    .param p0, "addr"    # Ljava/lang/String;
    .param p1, "routeAddr"    # Z
    .param p2, "validate"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/AddressException;
        }
    .end annotation

    .prologue
    const/16 v12, 0x7f

    const/16 v11, 0x5c

    const/16 v10, 0x20

    const/16 v9, 0x40

    const/16 v8, 0x2e

    .line 1152
    const/4 v5, 0x0

    .line 1154
    .local v5, "start":I
    if-nez p0, :cond_15

    .line 1155
    new-instance v6, Lkorex/mail/internet/AddressException;

    const-string v7, "Address is null"

    invoke-direct {v6, v7}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1156
    :cond_15
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 1157
    .local v4, "len":I
    if-nez v4, :cond_23

    .line 1158
    new-instance v6, Lkorex/mail/internet/AddressException;

    const-string v7, "Empty address"

    invoke-direct {v6, v7, p0}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v6

    .line 1164
    :cond_23
    if-eqz p1, :cond_4d

    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v9, :cond_4d

    .line 1169
    const/4 v5, 0x0

    :goto_2d
    const-string v6, ",:"

    invoke-static {p0, v6, v5}, Lkorex/mail/internet/InternetAddress;->indexOfAny(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    .local v1, "i":I
    if-ltz v1, :cond_4d

    .line 1171
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-eq v6, v9, :cond_43

    .line 1172
    new-instance v6, Lkorex/mail/internet/AddressException;

    const-string v7, "Illegal route-addr"

    invoke-direct {v6, v7, p0}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v6

    .line 1173
    :cond_43
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x3a

    if-ne v6, v7, :cond_63

    .line 1175
    add-int/lit8 v5, v1, 0x1

    .line 1189
    .end local v1    # "i":I
    :cond_4d
    const v0, 0xffff

    .line 1190
    .local v0, "c":C
    const v3, 0xffff

    .line 1191
    .local v3, "lastc":C
    const/4 v2, 0x0

    .line 1192
    .local v2, "inquote":Z
    move v1, v5

    .restart local v1    # "i":I
    :goto_55
    if-ge v1, v4, :cond_bc

    .line 1193
    move v3, v0

    .line 1194
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1197
    if-eq v0, v11, :cond_60

    if-ne v3, v11, :cond_66

    .line 1192
    :cond_60
    :goto_60
    add-int/lit8 v1, v1, 0x1

    goto :goto_55

    .line 1170
    .end local v0    # "c":C
    .end local v2    # "inquote":Z
    .end local v3    # "lastc":C
    :cond_63
    add-int/lit8 v5, v1, 0x1

    goto :goto_2d

    .line 1199
    .restart local v0    # "c":C
    .restart local v2    # "inquote":Z
    .restart local v3    # "lastc":C
    :cond_66
    const/16 v6, 0x22

    if-ne v0, v6, :cond_92

    .line 1200
    if-eqz v2, :cond_84

    .line 1202
    if-eqz p2, :cond_82

    add-int/lit8 v6, v1, 0x1

    if-ge v6, v4, :cond_82

    add-int/lit8 v6, v1, 0x1

    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-eq v6, v9, :cond_82

    .line 1203
    new-instance v6, Lkorex/mail/internet/AddressException;

    const-string v7, "Quote not at end of local address"

    invoke-direct {v6, v7, p0}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v6

    .line 1205
    :cond_82
    const/4 v2, 0x0

    goto :goto_60

    .line 1207
    :cond_84
    if-eqz p2, :cond_90

    if-eqz v1, :cond_90

    .line 1208
    new-instance v6, Lkorex/mail/internet/AddressException;

    const-string v7, "Quote not at start of local address"

    invoke-direct {v6, v7, p0}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v6

    .line 1210
    :cond_90
    const/4 v2, 0x1

    .line 1212
    goto :goto_60

    .line 1214
    :cond_92
    if-nez v2, :cond_60

    .line 1216
    if-ne v0, v9, :cond_a0

    .line 1217
    if-nez v1, :cond_bc

    .line 1218
    new-instance v6, Lkorex/mail/internet/AddressException;

    const-string v7, "Missing local name"

    invoke-direct {v6, v7, p0}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v6

    .line 1221
    :cond_a0
    if-le v0, v10, :cond_a4

    if-lt v0, v12, :cond_ac

    .line 1222
    :cond_a4
    new-instance v6, Lkorex/mail/internet/AddressException;

    const-string v7, "Local address contains control or whitespace"

    invoke-direct {v6, v7, p0}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v6

    .line 1224
    :cond_ac
    const-string v6, "()<>,;:\\\"[]@"

    invoke-virtual {v6, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-ltz v6, :cond_60

    .line 1225
    new-instance v6, Lkorex/mail/internet/AddressException;

    const-string v7, "Local address contains illegal character"

    invoke-direct {v6, v7, p0}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v6

    .line 1228
    :cond_bc
    if-eqz v2, :cond_c6

    .line 1229
    new-instance v6, Lkorex/mail/internet/AddressException;

    const-string v7, "Unterminated quote"

    invoke-direct {v6, v7, p0}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v6

    .line 1243
    :cond_c6
    if-eq v0, v9, :cond_d2

    .line 1244
    if-eqz p2, :cond_f7

    .line 1245
    new-instance v6, Lkorex/mail/internet/AddressException;

    const-string v7, "Missing final \'@domain\'"

    invoke-direct {v6, v7, p0}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v6

    .line 1251
    :cond_d2
    add-int/lit8 v5, v1, 0x1

    .line 1252
    if-lt v5, v4, :cond_de

    .line 1253
    new-instance v6, Lkorex/mail/internet/AddressException;

    const-string v7, "Missing domain"

    invoke-direct {v6, v7, p0}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v6

    .line 1255
    :cond_de
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v8, :cond_ec

    .line 1256
    new-instance v6, Lkorex/mail/internet/AddressException;

    const-string v7, "Domain starts with dot"

    invoke-direct {v6, v7, p0}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v6

    .line 1257
    :cond_ec
    move v1, v5

    :goto_ed
    if-ge v1, v4, :cond_128

    .line 1258
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1259
    const/16 v6, 0x5b

    if-ne v0, v6, :cond_f8

    .line 1287
    :cond_f7
    return-void

    .line 1261
    :cond_f8
    if-le v0, v10, :cond_fc

    if-lt v0, v12, :cond_104

    .line 1262
    :cond_fc
    new-instance v6, Lkorex/mail/internet/AddressException;

    const-string v7, "Domain contains control or whitespace"

    invoke-direct {v6, v7, p0}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v6

    .line 1277
    :cond_104
    invoke-static {v0}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v6

    if-nez v6, :cond_118

    const/16 v6, 0x2d

    if-eq v0, v6, :cond_118

    if-eq v0, v8, :cond_118

    .line 1278
    new-instance v6, Lkorex/mail/internet/AddressException;

    const-string v7, "Domain contains illegal character"

    invoke-direct {v6, v7, p0}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v6

    .line 1280
    :cond_118
    if-ne v0, v8, :cond_124

    if-ne v3, v8, :cond_124

    .line 1281
    new-instance v6, Lkorex/mail/internet/AddressException;

    const-string v7, "Domain contains dot-dot"

    invoke-direct {v6, v7, p0}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v6

    .line 1283
    :cond_124
    move v3, v0

    .line 1257
    add-int/lit8 v1, v1, 0x1

    goto :goto_ed

    .line 1285
    :cond_128
    if-ne v3, v8, :cond_f7

    .line 1286
    new-instance v6, Lkorex/mail/internet/AddressException;

    const-string v7, "Domain ends with dot"

    invoke-direct {v6, v7, p0}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v6
.end method

.method public static getLocalAddress(Lkorex/mail/Session;)Lkorex/mail/internet/InternetAddress;
    .registers 2
    .param p0, "session"    # Lkorex/mail/Session;

    .prologue
    .line 520
    :try_start_0
    invoke-static {p0}, Lkorex/mail/internet/InternetAddress;->_getLocalAddress(Lkorex/mail/Session;)Lkorex/mail/internet/InternetAddress;
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_3} :catch_5
    .catch Lkorex/mail/internet/AddressException; {:try_start_0 .. :try_end_3} :catch_8
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_3} :catch_a

    move-result-object v0

    .line 524
    :goto_4
    return-object v0

    .line 521
    :catch_5
    move-exception v0

    .line 524
    :goto_6
    const/4 v0, 0x0

    goto :goto_4

    .line 522
    :catch_8
    move-exception v0

    goto :goto_6

    .line 523
    :catch_a
    move-exception v0

    goto :goto_6
.end method

.method private static getLocalHostName()Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 569
    const/4 v0, 0x0

    .line 570
    .local v0, "host":Ljava/lang/String;
    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    move-result-object v1

    .line 571
    .local v1, "me":Ljava/net/InetAddress;
    if-eqz v1, :cond_32

    .line 572
    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    move-result-object v0

    .line 573
    if-eqz v0, :cond_32

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_32

    invoke-static {v0}, Lkorex/mail/internet/InternetAddress;->isInetAddressLiteral(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_32

    .line 574
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v3, 0x5b

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x5d

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 576
    :cond_32
    return-object v0
.end method

.method private static indexOfAny(Ljava/lang/String;Ljava/lang/String;)I
    .registers 3
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "any"    # Ljava/lang/String;

    .prologue
    .line 1347
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lkorex/mail/internet/InternetAddress;->indexOfAny(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private static indexOfAny(Ljava/lang/String;Ljava/lang/String;I)I
    .registers 8
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "any"    # Ljava/lang/String;
    .param p2, "start"    # I

    .prologue
    const/4 v3, -0x1

    .line 1352
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 1353
    .local v2, "len":I
    move v1, p2

    .local v1, "i":I
    :goto_6
    if-ge v1, v2, :cond_16

    .line 1354
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(I)I
    :try_end_f
    .catch Ljava/lang/StringIndexOutOfBoundsException; {:try_start_1 .. :try_end_f} :catch_18

    move-result v4

    if-ltz v4, :cond_13

    .line 1359
    .end local v1    # "i":I
    .end local v2    # "len":I
    :goto_12
    return v1

    .line 1353
    .restart local v1    # "i":I
    .restart local v2    # "len":I
    :cond_13
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_16
    move v1, v3

    .line 1357
    goto :goto_12

    .line 1358
    .end local v1    # "i":I
    .end local v2    # "len":I
    :catch_18
    move-exception v0

    .local v0, "e":Ljava/lang/StringIndexOutOfBoundsException;
    move v1, v3

    .line 1359
    goto :goto_12
.end method

.method private static isInetAddressLiteral(Ljava/lang/String;)Z
    .registers 7
    .param p0, "addr"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 590
    const/4 v3, 0x0

    .local v3, "sawHex":Z
    const/4 v2, 0x0

    .line 591
    .local v2, "sawColon":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v1, v5, :cond_35

    .line 592
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 593
    .local v0, "c":C
    const/16 v5, 0x30

    if-lt v0, v5, :cond_19

    const/16 v5, 0x39

    if-gt v0, v5, :cond_19

    .line 591
    :cond_16
    :goto_16
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 595
    :cond_19
    const/16 v5, 0x2e

    if-eq v0, v5, :cond_16

    .line 597
    const/16 v5, 0x61

    if-lt v0, v5, :cond_25

    const/16 v5, 0x7a

    if-le v0, v5, :cond_2d

    :cond_25
    const/16 v5, 0x41

    if-lt v0, v5, :cond_2f

    const/16 v5, 0x5a

    if-gt v0, v5, :cond_2f

    .line 598
    :cond_2d
    const/4 v3, 0x1

    goto :goto_16

    .line 599
    :cond_2f
    const/16 v5, 0x3a

    if-ne v0, v5, :cond_3a

    .line 600
    const/4 v2, 0x1

    goto :goto_16

    .line 604
    .end local v0    # "c":C
    :cond_35
    if-eqz v3, :cond_39

    if-eqz v2, :cond_3a

    :cond_39
    const/4 v4, 0x1

    :cond_3a
    return v4
.end method

.method private isSimple()Z
    .registers 3

    .prologue
    .line 1294
    iget-object v0, p0, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    const-string v1, "()<>,;:\\\"[]"

    invoke-static {v0, v1}, Lkorex/mail/internet/InternetAddress;->indexOfAny(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-gez v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method private static lengthOfFirstSegment(Ljava/lang/String;)I
    .registers 3
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 486
    const-string v1, "\r\n"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .local v0, "pos":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_a

    .line 489
    .end local v0    # "pos":I
    :goto_9
    return v0

    .restart local v0    # "pos":I
    :cond_a
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    goto :goto_9
.end method

.method private static lengthOfLastSegment(Ljava/lang/String;I)I
    .registers 4
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "used"    # I

    .prologue
    .line 499
    const-string v1, "\r\n"

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .local v0, "pos":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_11

    .line 500
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v0

    add-int/lit8 v1, v1, -0x2

    .line 502
    :goto_10
    return v1

    :cond_11
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, p1

    goto :goto_10
.end method

.method public static parse(Ljava/lang/String;)[Lkorex/mail/internet/InternetAddress;
    .registers 2
    .param p0, "addresslist"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/AddressException;
        }
    .end annotation

    .prologue
    .line 617
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lkorex/mail/internet/InternetAddress;->parse(Ljava/lang/String;Z)[Lkorex/mail/internet/InternetAddress;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/lang/String;Z)[Lkorex/mail/internet/InternetAddress;
    .registers 3
    .param p0, "addresslist"    # Ljava/lang/String;
    .param p1, "strict"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/AddressException;
        }
    .end annotation

    .prologue
    .line 640
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lkorex/mail/internet/InternetAddress;->parse(Ljava/lang/String;ZZ)[Lkorex/mail/internet/InternetAddress;

    move-result-object v0

    return-object v0
.end method

.method private static parse(Ljava/lang/String;ZZ)[Lkorex/mail/internet/InternetAddress;
    .registers 36
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "strict"    # Z
    .param p2, "parseHdr"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/AddressException;
        }
    .end annotation

    .prologue
    .line 679
    const/16 v28, -0x1

    .local v28, "start_personal":I
    const/4 v8, -0x1

    .line 680
    .local v8, "end_personal":I
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v15

    .line 681
    .local v15, "length":I
    if-eqz p2, :cond_32

    if-nez p1, :cond_32

    const/4 v11, 0x1

    .line 682
    .local v11, "ignoreErrors":Z
    :goto_c
    const/4 v12, 0x0

    .line 683
    .local v12, "in_group":Z
    const/16 v25, 0x0

    .line 684
    .local v25, "route_addr":Z
    const/16 v23, 0x0

    .line 686
    .local v23, "rfc822":Z
    new-instance v30, Ljava/util/ArrayList;

    invoke-direct/range {v30 .. v30}, Ljava/util/ArrayList;-><init>()V

    .line 689
    .local v30, "v":Ljava/util/List;
    const/4 v7, -0x1

    .local v7, "end":I
    move/from16 v27, v7

    .local v27, "start":I
    const/4 v13, 0x0

    .local v13, "index":I
    :goto_1a
    if-ge v13, v15, :cond_40d

    .line 690
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 692
    .local v6, "c":C
    sparse-switch v6, :sswitch_data_4d6

    .line 1060
    const/16 v31, -0x1

    move/from16 v0, v27

    move/from16 v1, v31

    if-ne v0, v1, :cond_2f

    .line 1061
    move/from16 v27, v13

    .line 689
    :cond_2f
    :goto_2f
    :sswitch_2f
    add-int/lit8 v13, v13, 0x1

    goto :goto_1a

    .line 681
    .end local v6    # "c":C
    .end local v7    # "end":I
    .end local v11    # "ignoreErrors":Z
    .end local v12    # "in_group":Z
    .end local v13    # "index":I
    .end local v23    # "rfc822":Z
    .end local v25    # "route_addr":Z
    .end local v27    # "start":I
    .end local v30    # "v":Ljava/util/List;
    :cond_32
    const/4 v11, 0x0

    goto :goto_c

    .line 696
    .restart local v6    # "c":C
    .restart local v7    # "end":I
    .restart local v11    # "ignoreErrors":Z
    .restart local v12    # "in_group":Z
    .restart local v13    # "index":I
    .restart local v23    # "rfc822":Z
    .restart local v25    # "route_addr":Z
    .restart local v27    # "start":I
    .restart local v30    # "v":Ljava/util/List;
    :sswitch_34
    const/16 v23, 0x1

    .line 697
    if-ltz v27, :cond_3f

    const/16 v31, -0x1

    move/from16 v0, v31

    if-ne v7, v0, :cond_3f

    .line 698
    move v7, v13

    .line 699
    :cond_3f
    move/from16 v21, v13

    .line 700
    .local v21, "pindex":I
    add-int/lit8 v13, v13, 0x1

    const/16 v19, 0x1

    .local v19, "nesting":I
    :goto_45
    if-ge v13, v15, :cond_5e

    if-lez v19, :cond_5e

    .line 702
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 703
    sparse-switch v6, :sswitch_data_50c

    .line 701
    :goto_52
    add-int/lit8 v13, v13, 0x1

    goto :goto_45

    .line 705
    :sswitch_55
    add-int/lit8 v13, v13, 0x1

    .line 706
    goto :goto_52

    .line 708
    :sswitch_58
    add-int/lit8 v19, v19, 0x1

    .line 709
    goto :goto_52

    .line 711
    :sswitch_5b
    add-int/lit8 v19, v19, -0x1

    .line 712
    goto :goto_52

    .line 717
    :cond_5e
    if-lez v19, :cond_73

    .line 718
    if-nez v11, :cond_70

    .line 719
    new-instance v31, Lkorex/mail/internet/AddressException;

    const-string v32, "Missing \')\'"

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    move-object/from16 v2, p0

    invoke-direct {v0, v1, v2, v13}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    throw v31

    .line 722
    :cond_70
    add-int/lit8 v13, v21, 0x1

    .line 723
    goto :goto_2f

    .line 725
    :cond_73
    add-int/lit8 v13, v13, -0x1

    .line 726
    const/16 v31, -0x1

    move/from16 v0, v28

    move/from16 v1, v31

    if-ne v0, v1, :cond_7f

    .line 727
    add-int/lit8 v28, v21, 0x1

    .line 728
    :cond_7f
    const/16 v31, -0x1

    move/from16 v0, v31

    if-ne v8, v0, :cond_2f

    .line 729
    move v8, v13

    goto :goto_2f

    .line 733
    .end local v19    # "nesting":I
    .end local v21    # "pindex":I
    :sswitch_87
    if-nez v11, :cond_97

    .line 734
    new-instance v31, Lkorex/mail/internet/AddressException;

    const-string v32, "Missing \'(\'"

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    move-object/from16 v2, p0

    invoke-direct {v0, v1, v2, v13}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    throw v31

    .line 737
    :cond_97
    const/16 v31, -0x1

    move/from16 v0, v27

    move/from16 v1, v31

    if-ne v0, v1, :cond_2f

    .line 738
    move/from16 v27, v13

    goto :goto_2f

    .line 742
    :sswitch_a2
    const/16 v23, 0x1

    .line 743
    if-eqz v25, :cond_10f

    .line 744
    if-nez v11, :cond_b6

    .line 745
    new-instance v31, Lkorex/mail/internet/AddressException;

    const-string v32, "Extra route-addr"

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    move-object/from16 v2, p0

    invoke-direct {v0, v1, v2, v13}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    throw v31

    .line 749
    :cond_b6
    const/16 v31, -0x1

    move/from16 v0, v27

    move/from16 v1, v31

    if-ne v0, v1, :cond_c7

    .line 750
    const/16 v25, 0x0

    .line 751
    const/16 v23, 0x0

    .line 752
    const/4 v7, -0x1

    move/from16 v27, v7

    .line 753
    goto/16 :goto_2f

    .line 755
    :cond_c7
    if-nez v12, :cond_10f

    .line 757
    const/16 v31, -0x1

    move/from16 v0, v31

    if-ne v7, v0, :cond_d0

    .line 758
    move v7, v13

    .line 759
    :cond_d0
    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-virtual {v0, v1, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 761
    .local v4, "addr":Ljava/lang/String;
    new-instance v17, Lkorex/mail/internet/InternetAddress;

    invoke-direct/range {v17 .. v17}, Lkorex/mail/internet/InternetAddress;-><init>()V

    .line 762
    .local v17, "ma":Lkorex/mail/internet/InternetAddress;
    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Lkorex/mail/internet/InternetAddress;->setAddress(Ljava/lang/String;)V

    .line 763
    if-ltz v28, :cond_fe

    .line 765
    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v31

    .line 766
    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v31

    .line 764
    invoke-static/range {v31 .. v31}, Lkorex/mail/internet/InternetAddress;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v31

    move-object/from16 v1, v17

    iput-object v0, v1, Lkorex/mail/internet/InternetAddress;->encodedPersonal:Ljava/lang/String;

    .line 768
    :cond_fe
    move-object/from16 v0, v30

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 770
    const/16 v25, 0x0

    .line 771
    const/16 v23, 0x0

    .line 772
    const/4 v7, -0x1

    move/from16 v27, v7

    .line 773
    const/4 v8, -0x1

    move/from16 v28, v8

    .line 778
    .end local v4    # "addr":Ljava/lang/String;
    .end local v17    # "ma":Lkorex/mail/internet/InternetAddress;
    :cond_10f
    move/from16 v24, v13

    .line 779
    .local v24, "rindex":I
    const/4 v14, 0x0

    .line 781
    .local v14, "inquote":Z
    add-int/lit8 v13, v13, 0x1

    :goto_114
    if-ge v13, v15, :cond_12d

    .line 782
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 783
    sparse-switch v6, :sswitch_data_51a

    .line 781
    :cond_11f
    :goto_11f
    add-int/lit8 v13, v13, 0x1

    goto :goto_114

    .line 785
    :sswitch_122
    add-int/lit8 v13, v13, 0x1

    .line 786
    goto :goto_11f

    .line 788
    :sswitch_125
    if-nez v14, :cond_129

    const/4 v14, 0x1

    .line 789
    :goto_128
    goto :goto_11f

    .line 788
    :cond_129
    const/4 v14, 0x0

    goto :goto_128

    .line 791
    :sswitch_12b
    if-nez v14, :cond_11f

    .line 800
    :cond_12d
    if-eqz v14, :cond_15a

    .line 801
    if-nez v11, :cond_13f

    .line 802
    new-instance v31, Lkorex/mail/internet/AddressException;

    const-string v32, "Missing \'\"\'"

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    move-object/from16 v2, p0

    invoke-direct {v0, v1, v2, v13}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    throw v31

    .line 806
    :cond_13f
    add-int/lit8 v13, v24, 0x1

    :goto_141
    if-ge v13, v15, :cond_15a

    .line 807
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 808
    const/16 v31, 0x5c

    move/from16 v0, v31

    if-ne v6, v0, :cond_154

    .line 809
    add-int/lit8 v13, v13, 0x1

    .line 806
    :cond_151
    add-int/lit8 v13, v13, 0x1

    goto :goto_141

    .line 810
    :cond_154
    const/16 v31, 0x3e

    move/from16 v0, v31

    if-ne v6, v0, :cond_151

    .line 816
    :cond_15a
    if-lt v13, v15, :cond_17a

    .line 817
    if-nez v11, :cond_16c

    .line 818
    new-instance v31, Lkorex/mail/internet/AddressException;

    const-string v32, "Missing \'>\'"

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    move-object/from16 v2, p0

    invoke-direct {v0, v1, v2, v13}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    throw v31

    .line 821
    :cond_16c
    add-int/lit8 v13, v24, 0x1

    .line 822
    const/16 v31, -0x1

    move/from16 v0, v27

    move/from16 v1, v31

    if-ne v0, v1, :cond_2f

    .line 823
    move/from16 v27, v24

    goto/16 :goto_2f

    .line 827
    :cond_17a
    if-nez v12, :cond_184

    .line 828
    move/from16 v28, v27

    .line 829
    if-ltz v28, :cond_182

    .line 830
    move/from16 v8, v24

    .line 831
    :cond_182
    add-int/lit8 v27, v24, 0x1

    .line 833
    :cond_184
    const/16 v25, 0x1

    .line 834
    move v7, v13

    .line 835
    goto/16 :goto_2f

    .line 838
    .end local v14    # "inquote":Z
    .end local v24    # "rindex":I
    :sswitch_189
    if-nez v11, :cond_199

    .line 839
    new-instance v31, Lkorex/mail/internet/AddressException;

    const-string v32, "Missing \'<\'"

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    move-object/from16 v2, p0

    invoke-direct {v0, v1, v2, v13}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    throw v31

    .line 842
    :cond_199
    const/16 v31, -0x1

    move/from16 v0, v27

    move/from16 v1, v31

    if-ne v0, v1, :cond_2f

    .line 843
    move/from16 v27, v13

    goto/16 :goto_2f

    .line 847
    :sswitch_1a5
    move/from16 v22, v13

    .line 848
    .local v22, "qindex":I
    const/16 v23, 0x1

    .line 849
    const/16 v31, -0x1

    move/from16 v0, v27

    move/from16 v1, v31

    if-ne v0, v1, :cond_1b3

    .line 850
    move/from16 v27, v13

    .line 852
    :cond_1b3
    add-int/lit8 v13, v13, 0x1

    :goto_1b5
    if-ge v13, v15, :cond_1c6

    .line 853
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 854
    sparse-switch v6, :sswitch_data_528

    .line 852
    :goto_1c0
    add-int/lit8 v13, v13, 0x1

    goto :goto_1b5

    .line 856
    :sswitch_1c3
    add-int/lit8 v13, v13, 0x1

    .line 857
    goto :goto_1c0

    .line 864
    :cond_1c6
    :sswitch_1c6
    if-lt v13, v15, :cond_2f

    .line 865
    if-nez v11, :cond_1d8

    .line 866
    new-instance v31, Lkorex/mail/internet/AddressException;

    const-string v32, "Missing \'\"\'"

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    move-object/from16 v2, p0

    invoke-direct {v0, v1, v2, v13}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    throw v31

    .line 869
    :cond_1d8
    add-int/lit8 v13, v22, 0x1

    goto/16 :goto_2f

    .line 874
    .end local v22    # "qindex":I
    :sswitch_1dc
    const/16 v23, 0x1

    .line 875
    move/from16 v16, v13

    .line 877
    .local v16, "lindex":I
    add-int/lit8 v13, v13, 0x1

    :goto_1e2
    if-ge v13, v15, :cond_1f3

    .line 878
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 879
    packed-switch v6, :pswitch_data_532

    .line 877
    :goto_1ed
    add-int/lit8 v13, v13, 0x1

    goto :goto_1e2

    .line 881
    :pswitch_1f0
    add-int/lit8 v13, v13, 0x1

    .line 882
    goto :goto_1ed

    .line 889
    :cond_1f3
    :pswitch_1f3
    if-lt v13, v15, :cond_2f

    .line 890
    if-nez v11, :cond_205

    .line 891
    new-instance v31, Lkorex/mail/internet/AddressException;

    const-string v32, "Missing \']\'"

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    move-object/from16 v2, p0

    invoke-direct {v0, v1, v2, v13}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    throw v31

    .line 894
    :cond_205
    add-int/lit8 v13, v16, 0x1

    goto/16 :goto_2f

    .line 899
    .end local v16    # "lindex":I
    :sswitch_209
    const/16 v31, -0x1

    move/from16 v0, v27

    move/from16 v1, v31

    if-ne v0, v1, :cond_21a

    .line 900
    const/16 v25, 0x0

    .line 901
    const/16 v23, 0x0

    .line 902
    const/4 v7, -0x1

    move/from16 v27, v7

    .line 903
    goto/16 :goto_2f

    .line 905
    :cond_21a
    if-eqz v12, :cond_266

    .line 906
    const/4 v12, 0x0

    .line 913
    if-eqz p2, :cond_239

    if-nez p1, :cond_239

    add-int/lit8 v31, v13, 0x1

    move/from16 v0, v31

    if-ge v0, v15, :cond_239

    add-int/lit8 v31, v13, 0x1

    .line 914
    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v31

    const/16 v32, 0x40

    move/from16 v0, v31

    move/from16 v1, v32

    if-eq v0, v1, :cond_2f

    .line 916
    :cond_239
    new-instance v17, Lkorex/mail/internet/InternetAddress;

    invoke-direct/range {v17 .. v17}, Lkorex/mail/internet/InternetAddress;-><init>()V

    .line 917
    .restart local v17    # "ma":Lkorex/mail/internet/InternetAddress;
    add-int/lit8 v7, v13, 0x1

    .line 918
    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-virtual {v0, v1, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v17

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lkorex/mail/internet/InternetAddress;->setAddress(Ljava/lang/String;)V

    .line 919
    move-object/from16 v0, v30

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 921
    const/16 v25, 0x0

    .line 922
    const/16 v23, 0x0

    .line 923
    const/4 v7, -0x1

    move/from16 v27, v7

    .line 924
    const/4 v8, -0x1

    move/from16 v28, v8

    .line 925
    goto/16 :goto_2f

    .line 927
    .end local v17    # "ma":Lkorex/mail/internet/InternetAddress;
    :cond_266
    if-nez v11, :cond_276

    .line 928
    new-instance v31, Lkorex/mail/internet/AddressException;

    const-string v32, "Illegal semicolon, not in group"

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    move-object/from16 v2, p0

    invoke-direct {v0, v1, v2, v13}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    throw v31

    .line 935
    :cond_276
    :sswitch_276
    const/16 v31, -0x1

    move/from16 v0, v27

    move/from16 v1, v31

    if-ne v0, v1, :cond_287

    .line 936
    const/16 v25, 0x0

    .line 937
    const/16 v23, 0x0

    .line 938
    const/4 v7, -0x1

    move/from16 v27, v7

    .line 939
    goto/16 :goto_2f

    .line 941
    :cond_287
    if-eqz v12, :cond_28d

    .line 942
    const/16 v25, 0x0

    .line 943
    goto/16 :goto_2f

    .line 946
    :cond_28d
    const/16 v31, -0x1

    move/from16 v0, v31

    if-ne v7, v0, :cond_294

    .line 947
    move v7, v13

    .line 949
    :cond_294
    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-virtual {v0, v1, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 950
    .restart local v4    # "addr":Ljava/lang/String;
    const/16 v20, 0x0

    .line 951
    .local v20, "pers":Ljava/lang/String;
    if-eqz v23, :cond_2c2

    if-ltz v28, :cond_2c2

    .line 953
    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v31

    .line 952
    invoke-static/range {v31 .. v31}, Lkorex/mail/internet/InternetAddress;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 954
    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->length()I

    move-result v31

    if-nez v31, :cond_2c2

    .line 955
    const/16 v20, 0x0

    .line 963
    :cond_2c2
    if-eqz p2, :cond_2ee

    if-nez p1, :cond_2ee

    if-eqz v20, :cond_2ee

    const/16 v31, 0x40

    .line 964
    move-object/from16 v0, v20

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v31

    if-ltz v31, :cond_2ee

    const/16 v31, 0x40

    .line 965
    move/from16 v0, v31

    invoke-virtual {v4, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v31

    if-gez v31, :cond_2ee

    const/16 v31, 0x21

    move/from16 v0, v31

    invoke-virtual {v4, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v31

    if-gez v31, :cond_2ee

    .line 966
    move-object/from16 v29, v4

    .line 967
    .local v29, "tmp":Ljava/lang/String;
    move-object/from16 v4, v20

    .line 968
    move-object/from16 v20, v29

    .line 970
    .end local v29    # "tmp":Ljava/lang/String;
    :cond_2ee
    if-nez v23, :cond_2f4

    if-nez p1, :cond_2f4

    if-eqz p2, :cond_324

    .line 971
    :cond_2f4
    if-nez v11, :cond_2ff

    .line 972
    const/16 v31, 0x0

    move/from16 v0, v25

    move/from16 v1, v31

    invoke-static {v4, v0, v1}, Lkorex/mail/internet/InternetAddress;->checkAddress(Ljava/lang/String;ZZ)V

    .line 973
    :cond_2ff
    new-instance v17, Lkorex/mail/internet/InternetAddress;

    invoke-direct/range {v17 .. v17}, Lkorex/mail/internet/InternetAddress;-><init>()V

    .line 974
    .restart local v17    # "ma":Lkorex/mail/internet/InternetAddress;
    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Lkorex/mail/internet/InternetAddress;->setAddress(Ljava/lang/String;)V

    .line 975
    if-eqz v20, :cond_311

    .line 976
    move-object/from16 v0, v20

    move-object/from16 v1, v17

    iput-object v0, v1, Lkorex/mail/internet/InternetAddress;->encodedPersonal:Ljava/lang/String;

    .line 977
    :cond_311
    move-object/from16 v0, v30

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 990
    .end local v17    # "ma":Lkorex/mail/internet/InternetAddress;
    :cond_318
    const/16 v25, 0x0

    .line 991
    const/16 v23, 0x0

    .line 992
    const/4 v7, -0x1

    move/from16 v27, v7

    .line 993
    const/4 v8, -0x1

    move/from16 v28, v8

    .line 994
    goto/16 :goto_2f

    .line 980
    :cond_324
    new-instance v26, Ljava/util/StringTokenizer;

    move-object/from16 v0, v26

    invoke-direct {v0, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 981
    .local v26, "st":Ljava/util/StringTokenizer;
    :goto_32b
    invoke-virtual/range {v26 .. v26}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v31

    if-eqz v31, :cond_318

    .line 982
    invoke-virtual/range {v26 .. v26}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    .line 983
    .local v3, "a":Ljava/lang/String;
    const/16 v31, 0x0

    const/16 v32, 0x0

    move/from16 v0, v31

    move/from16 v1, v32

    invoke-static {v3, v0, v1}, Lkorex/mail/internet/InternetAddress;->checkAddress(Ljava/lang/String;ZZ)V

    .line 984
    new-instance v17, Lkorex/mail/internet/InternetAddress;

    invoke-direct/range {v17 .. v17}, Lkorex/mail/internet/InternetAddress;-><init>()V

    .line 985
    .restart local v17    # "ma":Lkorex/mail/internet/InternetAddress;
    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Lkorex/mail/internet/InternetAddress;->setAddress(Ljava/lang/String;)V

    .line 986
    move-object/from16 v0, v30

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_32b

    .line 997
    .end local v3    # "a":Ljava/lang/String;
    .end local v4    # "addr":Ljava/lang/String;
    .end local v17    # "ma":Lkorex/mail/internet/InternetAddress;
    .end local v20    # "pers":Ljava/lang/String;
    .end local v26    # "st":Ljava/util/StringTokenizer;
    :sswitch_352
    const/16 v23, 0x1

    .line 998
    if-eqz v12, :cond_366

    .line 999
    if-nez v11, :cond_366

    .line 1000
    new-instance v31, Lkorex/mail/internet/AddressException;

    const-string v32, "Nested group"

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    move-object/from16 v2, p0

    invoke-direct {v0, v1, v2, v13}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    throw v31

    .line 1001
    :cond_366
    const/16 v31, -0x1

    move/from16 v0, v27

    move/from16 v1, v31

    if-ne v0, v1, :cond_370

    .line 1002
    move/from16 v27, v13

    .line 1003
    :cond_370
    if-eqz p2, :cond_40a

    if-nez p1, :cond_40a

    .line 1009
    add-int/lit8 v31, v13, 0x1

    move/from16 v0, v31

    if-ge v0, v15, :cond_3b0

    .line 1010
    const-string v5, ")>[]:@\\,."

    .line 1011
    .local v5, "addressSpecials":Ljava/lang/String;
    add-int/lit8 v31, v13, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v18

    .line 1012
    .local v18, "nc":C
    move/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v31

    if-ltz v31, :cond_3b0

    .line 1013
    const/16 v31, 0x40

    move/from16 v0, v18

    move/from16 v1, v31

    if-ne v0, v1, :cond_2f

    .line 1023
    add-int/lit8 v10, v13, 0x2

    .local v10, "i":I
    :goto_398
    if-ge v10, v15, :cond_3a8

    .line 1024
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v18

    .line 1025
    const/16 v31, 0x3b

    move/from16 v0, v18

    move/from16 v1, v31

    if-ne v0, v1, :cond_3fc

    .line 1030
    :cond_3a8
    const/16 v31, 0x3b

    move/from16 v0, v18

    move/from16 v1, v31

    if-eq v0, v1, :cond_2f

    .line 1037
    .end local v5    # "addressSpecials":Ljava/lang/String;
    .end local v10    # "i":I
    .end local v18    # "nc":C
    :cond_3b0
    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-virtual {v0, v1, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 1038
    .local v9, "gname":Ljava/lang/String;
    sget-boolean v31, Lkorex/mail/internet/InternetAddress;->ignoreBogusGroupName:Z

    if-eqz v31, :cond_407

    const-string v31, "mailto"

    .line 1039
    move-object/from16 v0, v31

    invoke-virtual {v9, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v31

    if-nez v31, :cond_3f8

    const-string v31, "From"

    .line 1040
    move-object/from16 v0, v31

    invoke-virtual {v9, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v31

    if-nez v31, :cond_3f8

    const-string v31, "To"

    .line 1041
    move-object/from16 v0, v31

    invoke-virtual {v9, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v31

    if-nez v31, :cond_3f8

    const-string v31, "Cc"

    .line 1042
    move-object/from16 v0, v31

    invoke-virtual {v9, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v31

    if-nez v31, :cond_3f8

    const-string v31, "Subject"

    .line 1043
    move-object/from16 v0, v31

    invoke-virtual {v9, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v31

    if-nez v31, :cond_3f8

    const-string v31, "Re"

    .line 1044
    move-object/from16 v0, v31

    invoke-virtual {v9, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v31

    if-eqz v31, :cond_407

    .line 1045
    :cond_3f8
    const/16 v27, -0x1

    goto/16 :goto_2f

    .line 1027
    .end local v9    # "gname":Ljava/lang/String;
    .restart local v5    # "addressSpecials":Ljava/lang/String;
    .restart local v10    # "i":I
    .restart local v18    # "nc":C
    :cond_3fc
    move/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v31

    if-gez v31, :cond_3a8

    .line 1023
    add-int/lit8 v10, v10, 0x1

    goto :goto_398

    .line 1047
    .end local v5    # "addressSpecials":Ljava/lang/String;
    .end local v10    # "i":I
    .end local v18    # "nc":C
    .restart local v9    # "gname":Ljava/lang/String;
    :cond_407
    const/4 v12, 0x1

    goto/16 :goto_2f

    .line 1049
    .end local v9    # "gname":Ljava/lang/String;
    :cond_40a
    const/4 v12, 0x1

    .line 1050
    goto/16 :goto_2f

    .line 1066
    .end local v6    # "c":C
    :cond_40d
    if-ltz v27, :cond_49a

    .line 1072
    const/16 v31, -0x1

    move/from16 v0, v31

    if-ne v7, v0, :cond_416

    .line 1073
    move v7, v15

    .line 1075
    :cond_416
    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-virtual {v0, v1, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 1076
    .restart local v4    # "addr":Ljava/lang/String;
    const/16 v20, 0x0

    .line 1077
    .restart local v20    # "pers":Ljava/lang/String;
    if-eqz v23, :cond_444

    if-ltz v28, :cond_444

    .line 1079
    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v31

    .line 1078
    invoke-static/range {v31 .. v31}, Lkorex/mail/internet/InternetAddress;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 1080
    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->length()I

    move-result v31

    if-nez v31, :cond_444

    .line 1081
    const/16 v20, 0x0

    .line 1089
    :cond_444
    if-eqz p2, :cond_470

    if-nez p1, :cond_470

    if-eqz v20, :cond_470

    const/16 v31, 0x40

    .line 1090
    move-object/from16 v0, v20

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v31

    if-ltz v31, :cond_470

    const/16 v31, 0x40

    .line 1091
    move/from16 v0, v31

    invoke-virtual {v4, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v31

    if-gez v31, :cond_470

    const/16 v31, 0x21

    move/from16 v0, v31

    invoke-virtual {v4, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v31

    if-gez v31, :cond_470

    .line 1092
    move-object/from16 v29, v4

    .line 1093
    .restart local v29    # "tmp":Ljava/lang/String;
    move-object/from16 v4, v20

    .line 1094
    move-object/from16 v20, v29

    .line 1096
    .end local v29    # "tmp":Ljava/lang/String;
    :cond_470
    if-nez v23, :cond_476

    if-nez p1, :cond_476

    if-eqz p2, :cond_4a8

    .line 1097
    :cond_476
    if-nez v11, :cond_481

    .line 1098
    const/16 v31, 0x0

    move/from16 v0, v25

    move/from16 v1, v31

    invoke-static {v4, v0, v1}, Lkorex/mail/internet/InternetAddress;->checkAddress(Ljava/lang/String;ZZ)V

    .line 1099
    :cond_481
    new-instance v17, Lkorex/mail/internet/InternetAddress;

    invoke-direct/range {v17 .. v17}, Lkorex/mail/internet/InternetAddress;-><init>()V

    .line 1100
    .restart local v17    # "ma":Lkorex/mail/internet/InternetAddress;
    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Lkorex/mail/internet/InternetAddress;->setAddress(Ljava/lang/String;)V

    .line 1101
    if-eqz v20, :cond_493

    .line 1102
    move-object/from16 v0, v20

    move-object/from16 v1, v17

    iput-object v0, v1, Lkorex/mail/internet/InternetAddress;->encodedPersonal:Ljava/lang/String;

    .line 1103
    :cond_493
    move-object/from16 v0, v30

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1117
    .end local v4    # "addr":Ljava/lang/String;
    .end local v17    # "ma":Lkorex/mail/internet/InternetAddress;
    .end local v20    # "pers":Ljava/lang/String;
    :cond_49a
    invoke-interface/range {v30 .. v30}, Ljava/util/List;->size()I

    move-result v31

    move/from16 v0, v31

    new-array v3, v0, [Lkorex/mail/internet/InternetAddress;

    .line 1118
    .local v3, "a":[Lkorex/mail/internet/InternetAddress;
    move-object/from16 v0, v30

    invoke-interface {v0, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 1119
    return-object v3

    .line 1106
    .end local v3    # "a":[Lkorex/mail/internet/InternetAddress;
    .restart local v4    # "addr":Ljava/lang/String;
    .restart local v20    # "pers":Ljava/lang/String;
    :cond_4a8
    new-instance v26, Ljava/util/StringTokenizer;

    move-object/from16 v0, v26

    invoke-direct {v0, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 1107
    .restart local v26    # "st":Ljava/util/StringTokenizer;
    :goto_4af
    invoke-virtual/range {v26 .. v26}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v31

    if-eqz v31, :cond_49a

    .line 1108
    invoke-virtual/range {v26 .. v26}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    .line 1109
    .local v3, "a":Ljava/lang/String;
    const/16 v31, 0x0

    const/16 v32, 0x0

    move/from16 v0, v31

    move/from16 v1, v32

    invoke-static {v3, v0, v1}, Lkorex/mail/internet/InternetAddress;->checkAddress(Ljava/lang/String;ZZ)V

    .line 1110
    new-instance v17, Lkorex/mail/internet/InternetAddress;

    invoke-direct/range {v17 .. v17}, Lkorex/mail/internet/InternetAddress;-><init>()V

    .line 1111
    .restart local v17    # "ma":Lkorex/mail/internet/InternetAddress;
    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Lkorex/mail/internet/InternetAddress;->setAddress(Ljava/lang/String;)V

    .line 1112
    move-object/from16 v0, v30

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4af

    .line 692
    :sswitch_data_4d6
    .sparse-switch
        0x9 -> :sswitch_2f
        0xa -> :sswitch_2f
        0xd -> :sswitch_2f
        0x20 -> :sswitch_2f
        0x22 -> :sswitch_1a5
        0x28 -> :sswitch_34
        0x29 -> :sswitch_87
        0x2c -> :sswitch_276
        0x3a -> :sswitch_352
        0x3b -> :sswitch_209
        0x3c -> :sswitch_a2
        0x3e -> :sswitch_189
        0x5b -> :sswitch_1dc
    .end sparse-switch

    .line 703
    :sswitch_data_50c
    .sparse-switch
        0x28 -> :sswitch_58
        0x29 -> :sswitch_5b
        0x5c -> :sswitch_55
    .end sparse-switch

    .line 783
    :sswitch_data_51a
    .sparse-switch
        0x22 -> :sswitch_125
        0x3e -> :sswitch_12b
        0x5c -> :sswitch_122
    .end sparse-switch

    .line 854
    :sswitch_data_528
    .sparse-switch
        0x22 -> :sswitch_1c6
        0x5c -> :sswitch_1c3
    .end sparse-switch

    .line 879
    :pswitch_data_532
    .packed-switch 0x5c
        :pswitch_1f0
        :pswitch_1f3
    .end packed-switch
.end method

.method public static parseHeader(Ljava/lang/String;Z)[Lkorex/mail/internet/InternetAddress;
    .registers 4
    .param p0, "addresslist"    # Ljava/lang/String;
    .param p1, "strict"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/AddressException;
        }
    .end annotation

    .prologue
    .line 665
    invoke-static {p0}, Lkorex/mail/internet/MimeUtility;->unfold(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Lkorex/mail/internet/InternetAddress;->parse(Ljava/lang/String;ZZ)[Lkorex/mail/internet/InternetAddress;

    move-result-object v0

    return-object v0
.end method

.method private static quotePhrase(Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p0, "phrase"    # Ljava/lang/String;

    .prologue
    const/16 v9, 0x5c

    const/16 v8, 0x22

    .line 344
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 345
    .local v4, "len":I
    const/4 v5, 0x0

    .line 347
    .local v5, "needQuoting":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_a
    if-ge v2, v4, :cond_5a

    .line 348
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 349
    .local v0, "c":C
    if-eq v0, v8, :cond_14

    if-ne v0, v9, :cond_3a

    .line 351
    :cond_14
    new-instance v6, Ljava/lang/StringBuffer;

    add-int/lit8 v7, v4, 0x3

    invoke-direct {v6, v7}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 352
    .local v6, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 353
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1f
    if-ge v3, v4, :cond_32

    .line 354
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 355
    .local v1, "cc":C
    if-eq v1, v8, :cond_29

    if-ne v1, v9, :cond_2c

    .line 357
    :cond_29
    invoke-virtual {v6, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 358
    :cond_2c
    invoke-virtual {v6, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 353
    add-int/lit8 v3, v3, 0x1

    goto :goto_1f

    .line 360
    .end local v1    # "cc":C
    :cond_32
    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 361
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 373
    .end local v0    # "c":C
    .end local v3    # "j":I
    .end local v6    # "sb":Ljava/lang/StringBuffer;
    .end local p0    # "phrase":Ljava/lang/String;
    :cond_39
    :goto_39
    return-object p0

    .line 362
    .restart local v0    # "c":C
    .restart local p0    # "phrase":Ljava/lang/String;
    :cond_3a
    const/16 v7, 0x20

    if-ge v0, v7, :cond_4a

    const/16 v7, 0xd

    if-eq v0, v7, :cond_4a

    const/16 v7, 0xa

    if-eq v0, v7, :cond_4a

    const/16 v7, 0x9

    if-ne v0, v7, :cond_56

    :cond_4a
    const/16 v7, 0x7f

    if-ge v0, v7, :cond_56

    sget-object v7, Lkorex/mail/internet/InternetAddress;->rfc822phrase:Ljava/lang/String;

    .line 363
    invoke-virtual {v7, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-ltz v7, :cond_57

    .line 365
    :cond_56
    const/4 v5, 0x1

    .line 347
    :cond_57
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 368
    .end local v0    # "c":C
    :cond_5a
    if-eqz v5, :cond_39

    .line 369
    new-instance v6, Ljava/lang/StringBuffer;

    add-int/lit8 v7, v4, 0x2

    invoke-direct {v6, v7}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 370
    .restart local v6    # "sb":Ljava/lang/StringBuffer;
    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 371
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_39
.end method

.method public static toString([Lkorex/mail/Address;)Ljava/lang/String;
    .registers 2
    .param p0, "addresses"    # [Lkorex/mail/Address;

    .prologue
    .line 433
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lkorex/mail/internet/InternetAddress;->toString([Lkorex/mail/Address;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toString([Lkorex/mail/Address;I)Ljava/lang/String;
    .registers 8
    .param p0, "addresses"    # [Lkorex/mail/Address;
    .param p1, "used"    # I

    .prologue
    .line 457
    if-eqz p0, :cond_5

    array-length v4, p0

    if-nez v4, :cond_7

    .line 458
    :cond_5
    const/4 v4, 0x0

    .line 478
    :goto_6
    return-object v4

    .line 460
    :cond_7
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 462
    .local v3, "sb":Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    array-length v4, p0

    if-ge v0, v4, :cond_3a

    .line 463
    if-eqz v0, :cond_19

    .line 464
    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 465
    add-int/lit8 p1, p1, 0x2

    .line 468
    :cond_19
    aget-object v4, p0, v0

    invoke-virtual {v4}, Lkorex/mail/Address;->toString()Ljava/lang/String;

    move-result-object v2

    .line 469
    .local v2, "s":Ljava/lang/String;
    invoke-static {v2}, Lkorex/mail/internet/InternetAddress;->lengthOfFirstSegment(Ljava/lang/String;)I

    move-result v1

    .line 470
    .local v1, "len":I
    add-int v4, p1, v1

    const/16 v5, 0x4c

    if-le v4, v5, :cond_30

    .line 471
    const-string v4, "\r\n\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 472
    const/16 p1, 0x8

    .line 474
    :cond_30
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 475
    invoke-static {v2, p1}, Lkorex/mail/internet/InternetAddress;->lengthOfLastSegment(Ljava/lang/String;I)I

    move-result p1

    .line 462
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 478
    .end local v1    # "len":I
    .end local v2    # "s":Ljava/lang/String;
    :cond_3a
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_6
.end method

.method private static unquote(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x5c

    const/4 v4, 0x1

    .line 377
    const-string v3, "\""

    invoke-virtual {p0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_57

    const-string v3, "\""

    invoke-virtual {p0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_57

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v4, :cond_57

    .line 378
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {p0, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 380
    invoke-virtual {p0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-ltz v3, :cond_57

    .line 381
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 382
    .local v2, "sb":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_33
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_53

    .line 383
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 384
    .local v0, "c":C
    if-ne v0, v5, :cond_4d

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ge v1, v3, :cond_4d

    .line 385
    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 386
    :cond_4d
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 382
    add-int/lit8 v1, v1, 0x1

    goto :goto_33

    .line 388
    .end local v0    # "c":C
    :cond_53
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 391
    .end local v1    # "i":I
    .end local v2    # "sb":Ljava/lang/StringBuffer;
    :cond_57
    return-object p0
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 185
    const/4 v1, 0x0

    .line 187
    .local v1, "a":Lkorex/mail/internet/InternetAddress;
    :try_start_1
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lkorex/mail/internet/InternetAddress;

    move-object v1, v0
    :try_end_9
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_9} :catch_a

    .line 189
    :goto_9
    return-object v1

    .line 188
    :catch_a
    move-exception v2

    goto :goto_9
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "a"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 398
    instance-of v3, p1, Lkorex/mail/internet/InternetAddress;

    if-nez v3, :cond_7

    .line 407
    .end local p1    # "a":Ljava/lang/Object;
    :cond_6
    :goto_6
    return v1

    .line 401
    .restart local p1    # "a":Ljava/lang/Object;
    :cond_7
    check-cast p1, Lkorex/mail/internet/InternetAddress;

    .end local p1    # "a":Ljava/lang/Object;
    invoke-virtual {p1}, Lkorex/mail/internet/InternetAddress;->getAddress()Ljava/lang/String;

    move-result-object v0

    .line 402
    .local v0, "s":Ljava/lang/String;
    iget-object v3, p0, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    if-ne v0, v3, :cond_13

    move v1, v2

    .line 403
    goto :goto_6

    .line 404
    :cond_13
    iget-object v3, p0, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    if-eqz v3, :cond_6

    iget-object v3, p0, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    move v1, v2

    .line 405
    goto :goto_6
.end method

.method public getAddress()Ljava/lang/String;
    .registers 2

    .prologue
    .line 256
    iget-object v0, p0, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    return-object v0
.end method

.method public getGroup(Z)[Lkorex/mail/internet/InternetAddress;
    .registers 7
    .param p1, "strict"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/AddressException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 1325
    invoke-virtual {p0}, Lkorex/mail/internet/InternetAddress;->getAddress()Ljava/lang/String;

    move-result-object v0

    .line 1326
    .local v0, "addr":Ljava/lang/String;
    if-nez v0, :cond_8

    .line 1337
    :cond_7
    :goto_7
    return-object v3

    .line 1329
    :cond_8
    const-string v4, ";"

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 1331
    const/16 v4, 0x3a

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 1332
    .local v1, "ix":I
    if-ltz v1, :cond_7

    .line 1335
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 1337
    .local v2, "list":Ljava/lang/String;
    invoke-static {v2, p1}, Lkorex/mail/internet/InternetAddress;->parseHeader(Ljava/lang/String;Z)[Lkorex/mail/internet/InternetAddress;

    move-result-object v3

    goto :goto_7
.end method

.method public getPersonal()Ljava/lang/String;
    .registers 3

    .prologue
    .line 267
    iget-object v1, p0, Lkorex/mail/internet/InternetAddress;->personal:Ljava/lang/String;

    if-eqz v1, :cond_7

    .line 268
    iget-object v1, p0, Lkorex/mail/internet/InternetAddress;->personal:Ljava/lang/String;

    .line 282
    :goto_6
    return-object v1

    .line 270
    :cond_7
    iget-object v1, p0, Lkorex/mail/internet/InternetAddress;->encodedPersonal:Ljava/lang/String;

    if-eqz v1, :cond_1a

    .line 272
    :try_start_b
    iget-object v1, p0, Lkorex/mail/internet/InternetAddress;->encodedPersonal:Ljava/lang/String;

    invoke-static {v1}, Lkorex/mail/internet/MimeUtility;->decodeText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lkorex/mail/internet/InternetAddress;->personal:Ljava/lang/String;

    .line 273
    iget-object v1, p0, Lkorex/mail/internet/InternetAddress;->personal:Ljava/lang/String;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_15} :catch_16

    goto :goto_6

    .line 274
    :catch_16
    move-exception v0

    .line 278
    .local v0, "ex":Ljava/lang/Exception;
    iget-object v1, p0, Lkorex/mail/internet/InternetAddress;->encodedPersonal:Ljava/lang/String;

    goto :goto_6

    .line 282
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_1a
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 197
    const-string v0, "rfc822"

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 414
    iget-object v0, p0, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    if-nez v0, :cond_6

    .line 415
    const/4 v0, 0x0

    .line 417
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_5
.end method

.method public isGroup()Z
    .registers 3

    .prologue
    .line 1308
    iget-object v0, p0, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    const-string v1, ";"

    .line 1309
    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-lez v0, :cond_1a

    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method public setAddress(Ljava/lang/String;)V
    .registers 2
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    .line 206
    iput-object p1, p0, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    .line 207
    return-void
.end method

.method public setPersonal(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 244
    iput-object p1, p0, Lkorex/mail/internet/InternetAddress;->personal:Ljava/lang/String;

    .line 245
    if-eqz p1, :cond_b

    .line 246
    invoke-static {p1}, Lkorex/mail/internet/MimeUtility;->encodeWord(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lkorex/mail/internet/InternetAddress;->encodedPersonal:Ljava/lang/String;

    .line 249
    :goto_a
    return-void

    .line 248
    :cond_b
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/mail/internet/InternetAddress;->encodedPersonal:Ljava/lang/String;

    goto :goto_a
.end method

.method public setPersonal(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 224
    iput-object p1, p0, Lkorex/mail/internet/InternetAddress;->personal:Ljava/lang/String;

    .line 225
    if-eqz p1, :cond_c

    .line 226
    invoke-static {p1, p2, v0}, Lkorex/mail/internet/MimeUtility;->encodeWord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lkorex/mail/internet/InternetAddress;->encodedPersonal:Ljava/lang/String;

    .line 229
    :goto_b
    return-void

    .line 228
    :cond_c
    iput-object v0, p0, Lkorex/mail/internet/InternetAddress;->encodedPersonal:Ljava/lang/String;

    goto :goto_b
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 293
    iget-object v1, p0, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    if-nez v1, :cond_3e

    const-string v0, ""

    .line 294
    .local v0, "a":Ljava/lang/String;
    :goto_6
    iget-object v1, p0, Lkorex/mail/internet/InternetAddress;->encodedPersonal:Ljava/lang/String;

    if-nez v1, :cond_16

    iget-object v1, p0, Lkorex/mail/internet/InternetAddress;->personal:Ljava/lang/String;

    if-eqz v1, :cond_16

    .line 296
    :try_start_e
    iget-object v1, p0, Lkorex/mail/internet/InternetAddress;->personal:Ljava/lang/String;

    invoke-static {v1}, Lkorex/mail/internet/MimeUtility;->encodeWord(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lkorex/mail/internet/InternetAddress;->encodedPersonal:Ljava/lang/String;
    :try_end_16
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_e .. :try_end_16} :catch_67

    .line 299
    :cond_16
    :goto_16
    iget-object v1, p0, Lkorex/mail/internet/InternetAddress;->encodedPersonal:Ljava/lang/String;

    if-eqz v1, :cond_41

    .line 300
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lkorex/mail/internet/InternetAddress;->encodedPersonal:Ljava/lang/String;

    invoke-static {v2}, Lkorex/mail/internet/InternetAddress;->quotePhrase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " <"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 304
    .end local v0    # "a":Ljava/lang/String;
    :cond_3d
    :goto_3d
    return-object v0

    .line 293
    :cond_3e
    iget-object v0, p0, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    goto :goto_6

    .line 301
    .restart local v0    # "a":Ljava/lang/String;
    :cond_41
    invoke-virtual {p0}, Lkorex/mail/internet/InternetAddress;->isGroup()Z

    move-result v1

    if-nez v1, :cond_3d

    invoke-direct {p0}, Lkorex/mail/internet/InternetAddress;->isSimple()Z

    move-result v1

    if-nez v1, :cond_3d

    .line 304
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3d

    .line 297
    :catch_67
    move-exception v1

    goto :goto_16
.end method

.method public toUnicodeString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 315
    invoke-virtual {p0}, Lkorex/mail/internet/InternetAddress;->getPersonal()Ljava/lang/String;

    move-result-object v0

    .line 316
    .local v0, "p":Ljava/lang/String;
    if-eqz v0, :cond_2a

    .line 317
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v0}, Lkorex/mail/internet/InternetAddress;->quotePhrase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " <"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 321
    :goto_29
    return-object v1

    .line 318
    :cond_2a
    invoke-virtual {p0}, Lkorex/mail/internet/InternetAddress;->isGroup()Z

    move-result v1

    if-nez v1, :cond_36

    invoke-direct {p0}, Lkorex/mail/internet/InternetAddress;->isSimple()Z

    move-result v1

    if-eqz v1, :cond_39

    .line 319
    :cond_36
    iget-object v1, p0, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    goto :goto_29

    .line 321
    :cond_39
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lkorex/mail/internet/InternetAddress;->address:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_29
.end method

.method public validate()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/AddressException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 1133
    invoke-virtual {p0}, Lkorex/mail/internet/InternetAddress;->isGroup()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 1134
    invoke-virtual {p0, v1}, Lkorex/mail/internet/InternetAddress;->getGroup(Z)[Lkorex/mail/internet/InternetAddress;

    .line 1137
    :goto_a
    return-void

    .line 1136
    :cond_b
    invoke-virtual {p0}, Lkorex/mail/internet/InternetAddress;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v1, v1}, Lkorex/mail/internet/InternetAddress;->checkAddress(Ljava/lang/String;ZZ)V

    goto :goto_a
.end method
