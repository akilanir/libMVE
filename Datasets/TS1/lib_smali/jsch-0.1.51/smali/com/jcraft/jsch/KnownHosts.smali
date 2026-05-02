.class public Lcom/jcraft/jsch/KnownHosts;
.super Ljava/lang/Object;
.source "KnownHosts.java"

# interfaces
.implements Lcom/jcraft/jsch/HostKeyRepository;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jcraft/jsch/KnownHosts$HashedHostKey;
    }
.end annotation


# static fields
.field private static final _known_hosts:Ljava/lang/String; = "known_hosts"

.field private static final cr:[B

.field private static final space:[B


# instance fields
.field private hmacsha1:Lcom/jcraft/jsch/MAC;

.field private jsch:Lcom/jcraft/jsch/JSch;

.field private known_hosts:Ljava/lang/String;

.field private pool:Ljava/util/Vector;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 424
    const/4 v0, 0x1

    new-array v0, v0, [B

    const/4 v1, 0x0

    const/16 v2, 0x20

    aput-byte v2, v0, v1

    sput-object v0, Lcom/jcraft/jsch/KnownHosts;->space:[B

    .line 425
    const-string v0, "\n"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/KnownHosts;->cr:[B

    return-void
.end method

.method constructor <init>(Lcom/jcraft/jsch/JSch;)V
    .registers 3
    .param p1, "jsch"    # Lcom/jcraft/jsch/JSch;

    .prologue
    const/4 v0, 0x0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts;->jsch:Lcom/jcraft/jsch/JSch;

    .line 45
    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts;->known_hosts:Ljava/lang/String;

    .line 46
    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    .line 48
    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts;->hmacsha1:Lcom/jcraft/jsch/MAC;

    .line 52
    iput-object p1, p0, Lcom/jcraft/jsch/KnownHosts;->jsch:Lcom/jcraft/jsch/JSch;

    .line 53
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    .line 54
    return-void
.end method

.method static synthetic access$000(Lcom/jcraft/jsch/KnownHosts;)Lcom/jcraft/jsch/MAC;
    .registers 2
    .param p0, "x0"    # Lcom/jcraft/jsch/KnownHosts;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/jcraft/jsch/KnownHosts;->getHMACSHA1()Lcom/jcraft/jsch/MAC;

    move-result-object v0

    return-object v0
.end method

.method private addInvalidLine(Ljava/lang/String;)V
    .registers 5
    .param p1, "line"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 246
    new-instance v0, Lcom/jcraft/jsch/HostKey;

    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, v2}, Lcom/jcraft/jsch/HostKey;-><init>(Ljava/lang/String;I[B)V

    .line 247
    .local v0, "hk":Lcom/jcraft/jsch/HostKey;
    iget-object v1, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 248
    return-void
.end method

.method private deleteSubString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p1, "hosts"    # Ljava/lang/String;
    .param p2, "host"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 469
    const/4 v2, 0x0

    .line 470
    .local v2, "i":I
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    .line 471
    .local v0, "hostlen":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 473
    .local v1, "hostslen":I
    :goto_a
    if-ge v2, v1, :cond_15

    .line 474
    const/16 v4, 0x2c

    invoke-virtual {p1, v4, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 475
    .local v3, "j":I
    const/4 v4, -0x1

    if-ne v3, v4, :cond_27

    .line 482
    .end local v3    # "j":I
    :cond_15
    invoke-virtual {p1, p2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_26

    sub-int v4, v1, v2

    if-ne v4, v0, :cond_26

    .line 483
    if-ne v0, v1, :cond_50

    move v4, v5

    :goto_22
    invoke-virtual {p1, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 485
    .end local p1    # "hosts":Ljava/lang/String;
    :cond_26
    :goto_26
    return-object p1

    .line 476
    .restart local v3    # "j":I
    .restart local p1    # "hosts":Ljava/lang/String;
    :cond_27
    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_34

    .line 477
    add-int/lit8 v2, v3, 0x1

    .line 478
    goto :goto_a

    .line 480
    :cond_34
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, v3, 0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_26

    .line 483
    .end local v3    # "j":I
    :cond_50
    sub-int v4, v1, v0

    add-int/lit8 v4, v4, -0x1

    goto :goto_22
.end method

.method private declared-synchronized getHMACSHA1()Lcom/jcraft/jsch/MAC;
    .registers 6

    .prologue
    .line 489
    monitor-enter p0

    :try_start_1
    iget-object v2, p0, Lcom/jcraft/jsch/KnownHosts;->hmacsha1:Lcom/jcraft/jsch/MAC;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_39

    if-nez v2, :cond_1b

    .line 491
    :try_start_5
    iget-object v2, p0, Lcom/jcraft/jsch/KnownHosts;->jsch:Lcom/jcraft/jsch/JSch;

    const-string v2, "hmac-sha1"

    invoke-static {v2}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 492
    .local v0, "c":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jcraft/jsch/MAC;

    check-cast v2, Lcom/jcraft/jsch/MAC;

    iput-object v2, p0, Lcom/jcraft/jsch/KnownHosts;->hmacsha1:Lcom/jcraft/jsch/MAC;
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_1b} :catch_1f
    .catchall {:try_start_5 .. :try_end_1b} :catchall_39

    .line 498
    .end local v0    # "c":Ljava/lang/Class;
    :cond_1b
    :goto_1b
    :try_start_1b
    iget-object v2, p0, Lcom/jcraft/jsch/KnownHosts;->hmacsha1:Lcom/jcraft/jsch/MAC;
    :try_end_1d
    .catchall {:try_start_1b .. :try_end_1d} :catchall_39

    monitor-exit p0

    return-object v2

    .line 494
    :catch_1f
    move-exception v1

    .line 495
    .local v1, "e":Ljava/lang/Exception;
    :try_start_20
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "hmacsha1: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_38
    .catchall {:try_start_20 .. :try_end_38} :catchall_39

    goto :goto_1b

    .line 489
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_39
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private getType([B)I
    .registers 5
    .param p1, "key"    # [B

    .prologue
    const/16 v2, 0x8

    .line 464
    aget-byte v0, p1, v2

    const/16 v1, 0x64

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    .line 466
    :goto_9
    return v0

    .line 465
    :cond_a
    aget-byte v0, p1, v2

    const/16 v1, 0x72

    if-ne v0, v1, :cond_12

    const/4 v0, 0x2

    goto :goto_9

    .line 466
    :cond_12
    const/4 v0, 0x3

    goto :goto_9
.end method


# virtual methods
.method public add(Lcom/jcraft/jsch/HostKey;Lcom/jcraft/jsch/UserInfo;)V
    .registers 16
    .param p1, "hostkey"    # Lcom/jcraft/jsch/HostKey;
    .param p2, "userinfo"    # Lcom/jcraft/jsch/UserInfo;

    .prologue
    .line 286
    iget v9, p1, Lcom/jcraft/jsch/HostKey;->type:I

    .line 287
    .local v9, "type":I
    invoke-virtual {p1}, Lcom/jcraft/jsch/HostKey;->getHost()Ljava/lang/String;

    move-result-object v6

    .line 288
    .local v6, "host":Ljava/lang/String;
    iget-object v8, p1, Lcom/jcraft/jsch/HostKey;->key:[B

    .line 290
    .local v8, "key":[B
    const/4 v5, 0x0

    .line 291
    .local v5, "hk":Lcom/jcraft/jsch/HostKey;
    iget-object v11, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    monitor-enter v11

    .line 292
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_d
    :try_start_d
    iget-object v10, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v10}, Ljava/util/Vector;->size()I

    move-result v10

    if-ge v7, v10, :cond_2e

    .line 293
    iget-object v10, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v10, v7}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/jcraft/jsch/HostKey;

    move-object v0, v10

    check-cast v0, Lcom/jcraft/jsch/HostKey;

    move-object v5, v0

    .line 294
    invoke-virtual {v5, v6}, Lcom/jcraft/jsch/HostKey;->isMatched(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2b

    iget v10, v5, Lcom/jcraft/jsch/HostKey;->type:I

    if-ne v10, v9, :cond_2b

    .line 292
    :cond_2b
    add-int/lit8 v7, v7, 0x1

    goto :goto_d

    .line 308
    :cond_2e
    monitor-exit v11
    :try_end_2f
    .catchall {:try_start_d .. :try_end_2f} :catchall_c4

    .line 310
    move-object v5, p1

    .line 312
    iget-object v10, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v10, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 314
    invoke-virtual {p0}, Lcom/jcraft/jsch/KnownHosts;->getKnownHostsRepositoryID()Ljava/lang/String;

    move-result-object v1

    .line 315
    .local v1, "bar":Ljava/lang/String;
    if-eqz v1, :cond_c3

    .line 316
    const/4 v3, 0x1

    .line 317
    .local v3, "foo":Z
    new-instance v4, Ljava/io/File;

    invoke-static {v1}, Lcom/jcraft/jsch/Util;->checkTilde(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v4, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 318
    .local v4, "goo":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_be

    .line 319
    const/4 v3, 0x0

    .line 320
    if-eqz p2, :cond_be

    .line 321
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " does not exist.\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "Are you sure you want to create it?"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {p2, v10}, Lcom/jcraft/jsch/UserInfo;->promptYesNo(Ljava/lang/String;)Z

    move-result v3

    .line 324
    invoke-virtual {v4}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    .line 325
    if-eqz v3, :cond_bb

    if-eqz v4, :cond_bb

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_bb

    .line 326
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "The parent directory "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " does not exist.\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "Are you sure you want to create it?"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {p2, v10}, Lcom/jcraft/jsch/UserInfo;->promptYesNo(Ljava/lang/String;)Z

    move-result v3

    .line 329
    if-eqz v3, :cond_bb

    .line 330
    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    move-result v10

    if-nez v10, :cond_c7

    .line 331
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " has not been created."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {p2, v10}, Lcom/jcraft/jsch/UserInfo;->showMessage(Ljava/lang/String;)V

    .line 332
    const/4 v3, 0x0

    .line 339
    :cond_bb
    :goto_bb
    if-nez v4, :cond_be

    const/4 v3, 0x0

    .line 342
    :cond_be
    if-eqz v3, :cond_c3

    .line 344
    :try_start_c0
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/KnownHosts;->sync(Ljava/lang/String;)V
    :try_end_c3
    .catch Ljava/lang/Exception; {:try_start_c0 .. :try_end_c3} :catch_de

    .line 349
    .end local v3    # "foo":Z
    .end local v4    # "goo":Ljava/io/File;
    :cond_c3
    :goto_c3
    return-void

    .line 308
    .end local v1    # "bar":Ljava/lang/String;
    :catchall_c4
    move-exception v10

    :try_start_c5
    monitor-exit v11
    :try_end_c6
    .catchall {:try_start_c5 .. :try_end_c6} :catchall_c4

    throw v10

    .line 335
    .restart local v1    # "bar":Ljava/lang/String;
    .restart local v3    # "foo":Z
    .restart local v4    # "goo":Ljava/io/File;
    :cond_c7
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " has been succesfully created.\nPlease check its access permission."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {p2, v10}, Lcom/jcraft/jsch/UserInfo;->showMessage(Ljava/lang/String;)V

    goto :goto_bb

    .line 346
    :catch_de
    move-exception v2

    .local v2, "e":Ljava/lang/Exception;
    sget-object v10, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "sync known_hosts: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_c3
.end method

.method public check(Ljava/lang/String;[B)I
    .registers 11
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "key"    # [B

    .prologue
    const/4 v7, 0x1

    .line 253
    const/4 v3, 0x1

    .line 254
    .local v3, "result":I
    if-nez p1, :cond_6

    move v5, v3

    .line 282
    :goto_5
    return v5

    .line 258
    :cond_6
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/KnownHosts;->getType([B)I

    move-result v4

    .line 261
    .local v4, "type":I
    iget-object v6, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    monitor-enter v6

    .line 262
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_e
    :try_start_e
    iget-object v5, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v5

    if-ge v2, v5, :cond_3e

    .line 263
    iget-object v5, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v5, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/jcraft/jsch/HostKey;

    move-object v0, v5

    check-cast v0, Lcom/jcraft/jsch/HostKey;

    move-object v1, v0

    .line 264
    .local v1, "hk":Lcom/jcraft/jsch/HostKey;
    invoke-virtual {v1, p1}, Lcom/jcraft/jsch/HostKey;->isMatched(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3b

    iget v5, v1, Lcom/jcraft/jsch/HostKey;->type:I

    if-ne v5, v4, :cond_3b

    .line 265
    iget-object v5, v1, Lcom/jcraft/jsch/HostKey;->key:[B

    invoke-static {v5, p2}, Lcom/jcraft/jsch/Util;->array_equals([B[B)Z

    move-result v5

    if-eqz v5, :cond_3a

    .line 266
    const/4 v5, 0x0

    monitor-exit v6

    goto :goto_5

    .line 273
    .end local v1    # "hk":Lcom/jcraft/jsch/HostKey;
    :catchall_37
    move-exception v5

    monitor-exit v6
    :try_end_39
    .catchall {:try_start_e .. :try_end_39} :catchall_37

    throw v5

    .line 269
    .restart local v1    # "hk":Lcom/jcraft/jsch/HostKey;
    :cond_3a
    const/4 v3, 0x2

    .line 262
    :cond_3b
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 273
    .end local v1    # "hk":Lcom/jcraft/jsch/HostKey;
    :cond_3e
    :try_start_3e
    monitor-exit v6
    :try_end_3f
    .catchall {:try_start_3e .. :try_end_3f} :catchall_37

    .line 275
    if-ne v3, v7, :cond_60

    const-string v5, "["

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_60

    const-string v5, "]:"

    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-le v5, v7, :cond_60

    .line 279
    const-string v5, "]:"

    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {p1, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5, p2}, Lcom/jcraft/jsch/KnownHosts;->check(Ljava/lang/String;[B)I

    move-result v5

    goto :goto_5

    :cond_60
    move v5, v3

    .line 282
    goto :goto_5
.end method

.method createHashedHostKey(Ljava/lang/String;[B)Lcom/jcraft/jsch/HostKey;
    .registers 4
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "key"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 502
    new-instance v0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;

    invoke-direct {v0, p0, p1, p2}, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;-><init>(Lcom/jcraft/jsch/KnownHosts;Ljava/lang/String;[B)V

    .line 503
    .local v0, "hhk":Lcom/jcraft/jsch/KnownHosts$HashedHostKey;
    invoke-virtual {v0}, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hash()V

    .line 504
    return-object v0
.end method

.method dump(Ljava/io/OutputStream;)V
    .registers 12
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 429
    :try_start_0
    iget-object v9, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    monitor-enter v9
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_8b

    .line 430
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_4
    :try_start_4
    iget-object v8, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v8}, Ljava/util/Vector;->size()I

    move-result v8

    if-ge v5, v8, :cond_92

    .line 431
    iget-object v8, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v8, v5}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/jcraft/jsch/HostKey;

    move-object v0, v8

    check-cast v0, Lcom/jcraft/jsch/HostKey;

    move-object v3, v0

    .line 433
    .local v3, "hk":Lcom/jcraft/jsch/HostKey;
    invoke-virtual {v3}, Lcom/jcraft/jsch/HostKey;->getMarker()Ljava/lang/String;

    move-result-object v6

    .line 434
    .local v6, "marker":Ljava/lang/String;
    invoke-virtual {v3}, Lcom/jcraft/jsch/HostKey;->getHost()Ljava/lang/String;

    move-result-object v4

    .line 435
    .local v4, "host":Ljava/lang/String;
    invoke-virtual {v3}, Lcom/jcraft/jsch/HostKey;->getType()Ljava/lang/String;

    move-result-object v7

    .line 436
    .local v7, "type":Ljava/lang/String;
    invoke-virtual {v3}, Lcom/jcraft/jsch/HostKey;->getComment()Ljava/lang/String;

    move-result-object v1

    .line 437
    .local v1, "comment":Ljava/lang/String;
    const-string v8, "UNKNOWN"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3f

    .line 438
    invoke-static {v4}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 439
    sget-object v8, Lcom/jcraft/jsch/KnownHosts;->cr:[B

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 430
    :goto_3c
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 442
    :cond_3f
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_51

    .line 443
    invoke-static {v6}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 444
    sget-object v8, Lcom/jcraft/jsch/KnownHosts;->space:[B

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 446
    :cond_51
    invoke-static {v4}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 447
    sget-object v8, Lcom/jcraft/jsch/KnownHosts;->space:[B

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 448
    invoke-static {v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 449
    sget-object v8, Lcom/jcraft/jsch/KnownHosts;->space:[B

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 450
    invoke-virtual {v3}, Lcom/jcraft/jsch/HostKey;->getKey()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 451
    if-eqz v1, :cond_82

    .line 452
    sget-object v8, Lcom/jcraft/jsch/KnownHosts;->space:[B

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 453
    invoke-static {v1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 455
    :cond_82
    sget-object v8, Lcom/jcraft/jsch/KnownHosts;->cr:[B

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    goto :goto_3c

    .line 457
    .end local v1    # "comment":Ljava/lang/String;
    .end local v3    # "hk":Lcom/jcraft/jsch/HostKey;
    .end local v4    # "host":Ljava/lang/String;
    .end local v6    # "marker":Ljava/lang/String;
    .end local v7    # "type":Ljava/lang/String;
    :catchall_88
    move-exception v8

    monitor-exit v9
    :try_end_8a
    .catchall {:try_start_4 .. :try_end_8a} :catchall_88

    :try_start_8a
    throw v8
    :try_end_8b
    .catch Ljava/lang/Exception; {:try_start_8a .. :try_end_8b} :catch_8b

    .line 459
    .end local v5    # "i":I
    :catch_8b
    move-exception v2

    .line 460
    .local v2, "e":Ljava/lang/Exception;
    sget-object v8, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v8, v2}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 462
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_91
    return-void

    .line 457
    .restart local v5    # "i":I
    :cond_92
    :try_start_92
    monitor-exit v9
    :try_end_93
    .catchall {:try_start_92 .. :try_end_93} :catchall_88

    goto :goto_91
.end method

.method public getHostKey()[Lcom/jcraft/jsch/HostKey;
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 352
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Lcom/jcraft/jsch/KnownHosts;->getHostKey(Ljava/lang/String;Ljava/lang/String;)[Lcom/jcraft/jsch/HostKey;

    move-result-object v0

    return-object v0
.end method

.method public getHostKey(Ljava/lang/String;Ljava/lang/String;)[Lcom/jcraft/jsch/HostKey;
    .registers 13
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x1

    .line 355
    iget-object v7, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    monitor-enter v7

    .line 356
    :try_start_4
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 357
    .local v5, "v":Ljava/util/ArrayList;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_a
    iget-object v6, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v6

    if-ge v3, v6, :cond_3d

    .line 358
    iget-object v6, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v6, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jcraft/jsch/HostKey;

    .line 359
    .local v2, "hk":Lcom/jcraft/jsch/HostKey;
    iget v6, v2, Lcom/jcraft/jsch/HostKey;->type:I

    const/4 v8, 0x3

    if-ne v6, v8, :cond_22

    .line 357
    :cond_1f
    :goto_1f
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    .line 360
    :cond_22
    if-eqz p1, :cond_36

    invoke-virtual {v2, p1}, Lcom/jcraft/jsch/HostKey;->isMatched(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1f

    if-eqz p2, :cond_36

    invoke-virtual {v2}, Lcom/jcraft/jsch/HostKey;->getType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1f

    .line 363
    :cond_36
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1f

    .line 381
    .end local v2    # "hk":Lcom/jcraft/jsch/HostKey;
    .end local v3    # "i":I
    .end local v5    # "v":Ljava/util/ArrayList;
    :catchall_3a
    move-exception v6

    monitor-exit v7
    :try_end_3c
    .catchall {:try_start_4 .. :try_end_3c} :catchall_3a

    throw v6

    .line 366
    .restart local v3    # "i":I
    .restart local v5    # "v":Ljava/util/ArrayList;
    :cond_3d
    :try_start_3d
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-array v1, v6, [Lcom/jcraft/jsch/HostKey;

    .line 367
    .local v1, "foo":[Lcom/jcraft/jsch/HostKey;
    const/4 v3, 0x0

    :goto_44
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v3, v6, :cond_55

    .line 368
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/jcraft/jsch/HostKey;

    aput-object v6, v1, v3

    .line 367
    add-int/lit8 v3, v3, 0x1

    goto :goto_44

    .line 370
    :cond_55
    if-eqz p1, :cond_8b

    const-string v6, "["

    invoke-virtual {p1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_8b

    const-string v6, "]:"

    invoke-virtual {p1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    if-le v6, v9, :cond_8b

    .line 371
    const/4 v6, 0x1

    const-string v8, "]:"

    invoke-virtual {p1, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {p1, v6, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, p2}, Lcom/jcraft/jsch/KnownHosts;->getHostKey(Ljava/lang/String;Ljava/lang/String;)[Lcom/jcraft/jsch/HostKey;

    move-result-object v4

    .line 373
    .local v4, "tmp":[Lcom/jcraft/jsch/HostKey;
    array-length v6, v4

    if-lez v6, :cond_8b

    .line 374
    array-length v6, v1

    array-length v8, v4

    add-int/2addr v6, v8

    new-array v0, v6, [Lcom/jcraft/jsch/HostKey;

    .line 375
    .local v0, "bar":[Lcom/jcraft/jsch/HostKey;
    const/4 v6, 0x0

    const/4 v8, 0x0

    array-length v9, v1

    invoke-static {v1, v6, v0, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 376
    const/4 v6, 0x0

    array-length v8, v1

    array-length v9, v4

    invoke-static {v4, v6, v0, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 377
    move-object v1, v0

    .line 380
    .end local v0    # "bar":[Lcom/jcraft/jsch/HostKey;
    .end local v4    # "tmp":[Lcom/jcraft/jsch/HostKey;
    :cond_8b
    monitor-exit v7
    :try_end_8c
    .catchall {:try_start_3d .. :try_end_8c} :catchall_3a

    return-object v1
.end method

.method getKnownHostsFile()Ljava/lang/String;
    .registers 2

    .prologue
    .line 249
    iget-object v0, p0, Lcom/jcraft/jsch/KnownHosts;->known_hosts:Ljava/lang/String;

    return-object v0
.end method

.method public getKnownHostsRepositoryID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 250
    iget-object v0, p0, Lcom/jcraft/jsch/KnownHosts;->known_hosts:Ljava/lang/String;

    return-object v0
.end method

.method public remove(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 384
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/jcraft/jsch/KnownHosts;->remove(Ljava/lang/String;Ljava/lang/String;[B)V

    .line 385
    return-void
.end method

.method public remove(Ljava/lang/String;Ljava/lang/String;[B)V
    .registers 11
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "key"    # [B

    .prologue
    .line 387
    const/4 v4, 0x0

    .line 388
    .local v4, "sync":Z
    iget-object v6, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    monitor-enter v6

    .line 389
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_5
    :try_start_5
    iget-object v5, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v5

    if-ge v3, v5, :cond_62

    .line 390
    iget-object v5, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v5, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/jcraft/jsch/HostKey;

    move-object v0, v5

    check-cast v0, Lcom/jcraft/jsch/HostKey;

    move-object v1, v0

    .line 391
    .local v1, "hk":Lcom/jcraft/jsch/HostKey;
    if-eqz p1, :cond_37

    invoke-virtual {v1, p1}, Lcom/jcraft/jsch/HostKey;->isMatched(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_55

    if-eqz p2, :cond_37

    invoke-virtual {v1}, Lcom/jcraft/jsch/HostKey;->getType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_55

    if-eqz p3, :cond_37

    iget-object v5, v1, Lcom/jcraft/jsch/HostKey;->key:[B

    invoke-static {p3, v5}, Lcom/jcraft/jsch/Util;->array_equals([B[B)Z

    move-result v5

    if-eqz v5, :cond_55

    .line 395
    :cond_37
    invoke-virtual {v1}, Lcom/jcraft/jsch/HostKey;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 396
    .local v2, "hosts":Ljava/lang/String;
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4f

    instance-of v5, v1, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;

    if-eqz v5, :cond_58

    move-object v0, v1

    check-cast v0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;

    move-object v5, v0

    invoke-virtual {v5}, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->isHashed()Z

    move-result v5

    if-eqz v5, :cond_58

    .line 399
    :cond_4f
    iget-object v5, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v5, v1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 404
    :goto_54
    const/4 v4, 0x1

    .line 389
    .end local v2    # "hosts":Ljava/lang/String;
    :cond_55
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 402
    .restart local v2    # "hosts":Ljava/lang/String;
    :cond_58
    invoke-direct {p0, v2, p1}, Lcom/jcraft/jsch/KnownHosts;->deleteSubString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Lcom/jcraft/jsch/HostKey;->host:Ljava/lang/String;

    goto :goto_54

    .line 407
    .end local v1    # "hk":Lcom/jcraft/jsch/HostKey;
    .end local v2    # "hosts":Ljava/lang/String;
    :catchall_5f
    move-exception v5

    monitor-exit v6
    :try_end_61
    .catchall {:try_start_5 .. :try_end_61} :catchall_5f

    throw v5

    :cond_62
    :try_start_62
    monitor-exit v6
    :try_end_63
    .catchall {:try_start_62 .. :try_end_63} :catchall_5f

    .line 408
    if-eqz v4, :cond_68

    .line 409
    :try_start_65
    invoke-virtual {p0}, Lcom/jcraft/jsch/KnownHosts;->sync()V
    :try_end_68
    .catch Ljava/lang/Exception; {:try_start_65 .. :try_end_68} :catch_69

    .line 411
    :cond_68
    :goto_68
    return-void

    .line 409
    :catch_69
    move-exception v5

    goto :goto_68
.end method

.method setKnownHosts(Ljava/io/InputStream;)V
    .registers 24
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 67
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->removeAllElements()V

    .line 68
    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    .line 71
    .local v20, "sb":Ljava/lang/StringBuffer;
    const/4 v13, 0x0

    .line 73
    .local v13, "error":Z
    move-object/from16 v14, p1

    .line 75
    .local v14, "fis":Ljava/io/InputStream;
    const/16 v18, 0x0

    .line 77
    .local v18, "key":Ljava/lang/String;
    const/16 v3, 0x400

    :try_start_13
    new-array v9, v3, [B

    .line 78
    .local v9, "buf":[B
    const/4 v10, 0x0

    .line 81
    .local v10, "bufl":I
    :goto_16
    const/4 v10, 0x0

    move v11, v10

    .line 83
    .end local v10    # "bufl":I
    .local v11, "bufl":I
    :cond_18
    :goto_18
    invoke-virtual {v14}, Ljava/io/InputStream;->read()I

    move-result v16

    .line 84
    .local v16, "j":I
    const/4 v3, -0x1

    move/from16 v0, v16

    if-ne v0, v3, :cond_3a

    .line 85
    if-nez v11, :cond_46

    .line 227
    if-eqz v13, :cond_249

    .line 228
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    const-string v7, "KnownHosts: invalid format"

    invoke-direct {v3, v7}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_2d} :catch_2d
    .catchall {:try_start_13 .. :try_end_2d} :catchall_35

    .line 231
    .end local v9    # "buf":[B
    .end local v11    # "bufl":I
    .end local v16    # "j":I
    :catch_2d
    move-exception v12

    .line 232
    .local v12, "e":Ljava/lang/Exception;
    :try_start_2e
    instance-of v3, v12, Lcom/jcraft/jsch/JSchException;

    if-eqz v3, :cond_258

    .line 233
    check-cast v12, Lcom/jcraft/jsch/JSchException;

    .end local v12    # "e":Ljava/lang/Exception;
    throw v12
    :try_end_35
    .catchall {:try_start_2e .. :try_end_35} :catchall_35

    .line 239
    :catchall_35
    move-exception v3

    :try_start_36
    invoke-virtual/range {p1 .. p1}, Ljava/io/InputStream;->close()V
    :try_end_39
    .catch Ljava/io/IOException; {:try_start_36 .. :try_end_39} :catch_270

    .line 241
    throw v3

    .line 88
    .restart local v9    # "buf":[B
    .restart local v11    # "bufl":I
    .restart local v16    # "j":I
    :cond_3a
    const/16 v3, 0xd

    move/from16 v0, v16

    if-eq v0, v3, :cond_18

    .line 89
    const/16 v3, 0xa

    move/from16 v0, v16

    if-ne v0, v3, :cond_59

    .line 99
    :cond_46
    const/16 v16, 0x0

    .line 100
    :goto_48
    move/from16 v0, v16

    if-ge v0, v11, :cond_8e

    .line 101
    :try_start_4c
    aget-byte v15, v9, v16

    .line 102
    .local v15, "i":B
    const/16 v3, 0x20

    if-eq v15, v3, :cond_56

    const/16 v3, 0x9

    if-ne v15, v3, :cond_7e

    :cond_56
    add-int/lit8 v16, v16, 0x1

    goto :goto_48

    .line 90
    .end local v15    # "i":B
    :cond_59
    array-length v3, v9

    if-gt v3, v11, :cond_75

    .line 91
    const/16 v3, 0x2800

    if-gt v11, v3, :cond_46

    .line 92
    array-length v3, v9

    mul-int/lit8 v3, v3, 0x2

    new-array v0, v3, [B

    move-object/from16 v19, v0

    .line 93
    .local v19, "newbuf":[B
    const/4 v3, 0x0

    const/4 v7, 0x0

    array-length v0, v9

    move/from16 v21, v0

    move-object/from16 v0, v19

    move/from16 v1, v21

    invoke-static {v9, v3, v0, v7, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 94
    move-object/from16 v9, v19

    .line 96
    .end local v19    # "newbuf":[B
    :cond_75
    add-int/lit8 v10, v11, 0x1

    .end local v11    # "bufl":I
    .restart local v10    # "bufl":I
    move/from16 v0, v16

    int-to-byte v3, v0

    aput-byte v3, v9, v11

    move v11, v10

    .end local v10    # "bufl":I
    .restart local v11    # "bufl":I
    goto :goto_18

    .line 103
    .restart local v15    # "i":B
    :cond_7e
    const/16 v3, 0x23

    if-ne v15, v3, :cond_8e

    .line 104
    const/4 v3, 0x0

    invoke-static {v9, v3, v11}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/jcraft/jsch/KnownHosts;->addInvalidLine(Ljava/lang/String;)V

    move v10, v11

    .line 105
    .end local v11    # "bufl":I
    .restart local v10    # "bufl":I
    goto :goto_16

    .line 109
    .end local v10    # "bufl":I
    .end local v15    # "i":B
    .restart local v11    # "bufl":I
    :cond_8e
    move/from16 v0, v16

    if-lt v0, v11, :cond_9f

    .line 110
    const/4 v3, 0x0

    invoke-static {v9, v3, v11}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/jcraft/jsch/KnownHosts;->addInvalidLine(Ljava/lang/String;)V

    move v10, v11

    .line 111
    .end local v11    # "bufl":I
    .restart local v10    # "bufl":I
    goto/16 :goto_16

    .line 114
    .end local v10    # "bufl":I
    .restart local v11    # "bufl":I
    :cond_9f
    const/4 v3, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->setLength(I)V

    move/from16 v17, v16

    .line 115
    .end local v16    # "j":I
    .local v17, "j":I
    :goto_a7
    move/from16 v0, v17

    if-ge v0, v11, :cond_28a

    .line 116
    add-int/lit8 v16, v17, 0x1

    .end local v17    # "j":I
    .restart local v16    # "j":I
    aget-byte v15, v9, v17

    .line 117
    .restart local v15    # "i":B
    const/16 v3, 0x20

    if-eq v15, v3, :cond_b7

    const/16 v3, 0x9

    if-ne v15, v3, :cond_d2

    .line 120
    .end local v15    # "i":B
    :cond_b7
    :goto_b7
    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 121
    .local v5, "host":Ljava/lang/String;
    move/from16 v0, v16

    if-ge v0, v11, :cond_c5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_db

    .line 122
    :cond_c5
    const/4 v3, 0x0

    invoke-static {v9, v3, v11}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/jcraft/jsch/KnownHosts;->addInvalidLine(Ljava/lang/String;)V

    move v10, v11

    .line 123
    .end local v11    # "bufl":I
    .restart local v10    # "bufl":I
    goto/16 :goto_16

    .line 118
    .end local v5    # "host":Ljava/lang/String;
    .end local v10    # "bufl":I
    .restart local v11    # "bufl":I
    .restart local v15    # "i":B
    :cond_d2
    int-to-char v3, v15

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move/from16 v17, v16

    .end local v16    # "j":I
    .restart local v17    # "j":I
    goto :goto_a7

    .line 126
    .end local v15    # "i":B
    .end local v17    # "j":I
    .restart local v5    # "host":Ljava/lang/String;
    .restart local v16    # "j":I
    :cond_db
    :goto_db
    move/from16 v0, v16

    if-ge v0, v11, :cond_ec

    .line 127
    aget-byte v15, v9, v16

    .line 128
    .restart local v15    # "i":B
    const/16 v3, 0x20

    if-eq v15, v3, :cond_e9

    const/16 v3, 0x9

    if-ne v15, v3, :cond_ec

    :cond_e9
    add-int/lit8 v16, v16, 0x1

    goto :goto_db

    .line 132
    .end local v15    # "i":B
    :cond_ec
    const-string v4, ""

    .line 133
    .local v4, "marker":Ljava/lang/String;
    const/4 v3, 0x0

    invoke-virtual {v5, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v7, 0x40

    if-ne v3, v7, :cond_145

    .line 134
    move-object v4, v5

    .line 136
    const/4 v3, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->setLength(I)V

    move/from16 v17, v16

    .line 137
    .end local v16    # "j":I
    .restart local v17    # "j":I
    :goto_100
    move/from16 v0, v17

    if-ge v0, v11, :cond_286

    .line 138
    add-int/lit8 v16, v17, 0x1

    .end local v17    # "j":I
    .restart local v16    # "j":I
    aget-byte v15, v9, v17

    .line 139
    .restart local v15    # "i":B
    const/16 v3, 0x20

    if-eq v15, v3, :cond_110

    const/16 v3, 0x9

    if-ne v15, v3, :cond_12b

    .line 142
    .end local v15    # "i":B
    :cond_110
    :goto_110
    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 143
    move/from16 v0, v16

    if-ge v0, v11, :cond_11e

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_134

    .line 144
    :cond_11e
    const/4 v3, 0x0

    invoke-static {v9, v3, v11}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/jcraft/jsch/KnownHosts;->addInvalidLine(Ljava/lang/String;)V

    move v10, v11

    .line 145
    .end local v11    # "bufl":I
    .restart local v10    # "bufl":I
    goto/16 :goto_16

    .line 140
    .end local v10    # "bufl":I
    .restart local v11    # "bufl":I
    .restart local v15    # "i":B
    :cond_12b
    int-to-char v3, v15

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move/from16 v17, v16

    .end local v16    # "j":I
    .restart local v17    # "j":I
    goto :goto_100

    .line 148
    .end local v15    # "i":B
    .end local v17    # "j":I
    .restart local v16    # "j":I
    :cond_134
    :goto_134
    move/from16 v0, v16

    if-ge v0, v11, :cond_145

    .line 149
    aget-byte v15, v9, v16

    .line 150
    .restart local v15    # "i":B
    const/16 v3, 0x20

    if-eq v15, v3, :cond_142

    const/16 v3, 0x9

    if-ne v15, v3, :cond_145

    :cond_142
    add-int/lit8 v16, v16, 0x1

    goto :goto_134

    .line 155
    .end local v15    # "i":B
    :cond_145
    const/4 v3, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 156
    const/4 v6, -0x1

    .local v6, "type":I
    move/from16 v17, v16

    .line 157
    .end local v16    # "j":I
    .restart local v17    # "j":I
    :goto_14e
    move/from16 v0, v17

    if-ge v0, v11, :cond_282

    .line 158
    add-int/lit8 v16, v17, 0x1

    .end local v17    # "j":I
    .restart local v16    # "j":I
    aget-byte v15, v9, v17

    .line 159
    .restart local v15    # "i":B
    const/16 v3, 0x20

    if-eq v15, v3, :cond_15e

    const/16 v3, 0x9

    if-ne v15, v3, :cond_17c

    .line 162
    .end local v15    # "i":B
    :cond_15e
    :goto_15e
    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v7, "ssh-dss"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_185

    const/4 v6, 0x1

    .line 165
    :goto_16b
    move/from16 v0, v16

    if-lt v0, v11, :cond_196

    .line 166
    const/4 v3, 0x0

    invoke-static {v9, v3, v11}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/jcraft/jsch/KnownHosts;->addInvalidLine(Ljava/lang/String;)V

    move v10, v11

    .line 167
    .end local v11    # "bufl":I
    .restart local v10    # "bufl":I
    goto/16 :goto_16

    .line 160
    .end local v10    # "bufl":I
    .restart local v11    # "bufl":I
    .restart local v15    # "i":B
    :cond_17c
    int-to-char v3, v15

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move/from16 v17, v16

    .end local v16    # "j":I
    .restart local v17    # "j":I
    goto :goto_14e

    .line 163
    .end local v15    # "i":B
    .end local v17    # "j":I
    .restart local v16    # "j":I
    :cond_185
    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v7, "ssh-rsa"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_193

    const/4 v6, 0x2

    goto :goto_16b

    .line 164
    :cond_193
    move/from16 v16, v11

    goto :goto_16b

    .line 170
    :cond_196
    :goto_196
    move/from16 v0, v16

    if-ge v0, v11, :cond_1a7

    .line 171
    aget-byte v15, v9, v16

    .line 172
    .restart local v15    # "i":B
    const/16 v3, 0x20

    if-eq v15, v3, :cond_1a4

    const/16 v3, 0x9

    if-ne v15, v3, :cond_1a7

    :cond_1a4
    add-int/lit8 v16, v16, 0x1

    goto :goto_196

    .line 176
    .end local v15    # "i":B
    :cond_1a7
    const/4 v3, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->setLength(I)V

    move/from16 v17, v16

    .line 177
    .end local v16    # "j":I
    .restart local v17    # "j":I
    :goto_1af
    move/from16 v0, v17

    if-ge v0, v11, :cond_27e

    .line 178
    add-int/lit8 v16, v17, 0x1

    .end local v17    # "j":I
    .restart local v16    # "j":I
    aget-byte v15, v9, v17

    .line 179
    .restart local v15    # "i":B
    const/16 v3, 0xd

    if-ne v15, v3, :cond_1be

    move/from16 v17, v16

    .end local v16    # "j":I
    .restart local v17    # "j":I
    goto :goto_1af

    .line 180
    .end local v17    # "j":I
    .restart local v16    # "j":I
    :cond_1be
    const/16 v3, 0xa

    if-ne v15, v3, :cond_1d9

    .line 184
    .end local v15    # "i":B
    :cond_1c2
    :goto_1c2
    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    .line 185
    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_1ea

    .line 186
    const/4 v3, 0x0

    invoke-static {v9, v3, v11}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/jcraft/jsch/KnownHosts;->addInvalidLine(Ljava/lang/String;)V

    move v10, v11

    .line 187
    .end local v11    # "bufl":I
    .restart local v10    # "bufl":I
    goto/16 :goto_16

    .line 181
    .end local v10    # "bufl":I
    .restart local v11    # "bufl":I
    .restart local v15    # "i":B
    :cond_1d9
    const/16 v3, 0x20

    if-eq v15, v3, :cond_1c2

    const/16 v3, 0x9

    if-eq v15, v3, :cond_1c2

    .line 182
    int-to-char v3, v15

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move/from16 v17, v16

    .end local v16    # "j":I
    .restart local v17    # "j":I
    goto :goto_1af

    .line 190
    .end local v15    # "i":B
    .end local v17    # "j":I
    .restart local v16    # "j":I
    :cond_1ea
    :goto_1ea
    move/from16 v0, v16

    if-ge v0, v11, :cond_1fb

    .line 191
    aget-byte v15, v9, v16

    .line 192
    .restart local v15    # "i":B
    const/16 v3, 0x20

    if-eq v15, v3, :cond_1f8

    const/16 v3, 0x9

    if-ne v15, v3, :cond_1fb

    :cond_1f8
    add-int/lit8 v16, v16, 0x1

    goto :goto_1ea

    .line 206
    .end local v15    # "i":B
    :cond_1fb
    const/4 v8, 0x0

    .line 207
    .local v8, "comment":Ljava/lang/String;
    move/from16 v0, v16

    if-ge v0, v11, :cond_21f

    .line 208
    const/4 v3, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->setLength(I)V

    move/from16 v17, v16

    .line 209
    .end local v16    # "j":I
    .restart local v17    # "j":I
    :goto_208
    move/from16 v0, v17

    if-ge v0, v11, :cond_27b

    .line 210
    add-int/lit8 v16, v17, 0x1

    .end local v17    # "j":I
    .restart local v16    # "j":I
    aget-byte v15, v9, v17

    .line 211
    .restart local v15    # "i":B
    const/16 v3, 0xd

    if-ne v15, v3, :cond_217

    move/from16 v17, v16

    .end local v16    # "j":I
    .restart local v17    # "j":I
    goto :goto_208

    .line 212
    .end local v17    # "j":I
    .restart local v16    # "j":I
    :cond_217
    const/16 v3, 0xa

    if-ne v15, v3, :cond_240

    .line 215
    .end local v15    # "i":B
    :goto_21b
    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .line 221
    :cond_21f
    const/4 v2, 0x0

    .line 222
    .local v2, "hk":Lcom/jcraft/jsch/HostKey;
    new-instance v2, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;

    .end local v2    # "hk":Lcom/jcraft/jsch/HostKey;
    invoke-static/range {v18 .. v18}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v3

    const/4 v7, 0x0

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v21

    move/from16 v0, v21

    invoke-static {v3, v7, v0}, Lcom/jcraft/jsch/Util;->fromBase64([BII)[B

    move-result-object v7

    move-object/from16 v3, p0

    invoke-direct/range {v2 .. v8}, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;-><init>(Lcom/jcraft/jsch/KnownHosts;Ljava/lang/String;Ljava/lang/String;I[BLjava/lang/String;)V

    .line 225
    .restart local v2    # "hk":Lcom/jcraft/jsch/HostKey;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    move v10, v11

    .line 226
    .end local v11    # "bufl":I
    .restart local v10    # "bufl":I
    goto/16 :goto_16

    .line 213
    .end local v2    # "hk":Lcom/jcraft/jsch/HostKey;
    .end local v10    # "bufl":I
    .restart local v11    # "bufl":I
    .restart local v15    # "i":B
    :cond_240
    int-to-char v3, v15

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;
    :try_end_246
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_246} :catch_2d
    .catchall {:try_start_4c .. :try_end_246} :catchall_35

    move/from16 v17, v16

    .end local v16    # "j":I
    .restart local v17    # "j":I
    goto :goto_208

    .line 239
    .end local v4    # "marker":Ljava/lang/String;
    .end local v5    # "host":Ljava/lang/String;
    .end local v6    # "type":I
    .end local v8    # "comment":Ljava/lang/String;
    .end local v15    # "i":B
    .end local v17    # "j":I
    .restart local v16    # "j":I
    :cond_249
    :try_start_249
    invoke-virtual/range {p1 .. p1}, Ljava/io/InputStream;->close()V
    :try_end_24c
    .catch Ljava/io/IOException; {:try_start_249 .. :try_end_24c} :catch_24d

    .line 244
    return-void

    .line 240
    :catch_24d
    move-exception v12

    .line 241
    .local v12, "e":Ljava/io/IOException;
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v12}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7, v12}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 234
    .end local v9    # "buf":[B
    .end local v11    # "bufl":I
    .end local v16    # "j":I
    .local v12, "e":Ljava/lang/Exception;
    :cond_258
    :try_start_258
    instance-of v3, v12, Ljava/lang/Throwable;

    if-eqz v3, :cond_266

    .line 235
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v12}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7, v12}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 236
    :cond_266
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v12}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_270
    .catchall {:try_start_258 .. :try_end_270} :catchall_35

    .line 240
    .end local v12    # "e":Ljava/lang/Exception;
    :catch_270
    move-exception v12

    .line 241
    .local v12, "e":Ljava/io/IOException;
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v12}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7, v12}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .end local v12    # "e":Ljava/io/IOException;
    .restart local v4    # "marker":Ljava/lang/String;
    .restart local v5    # "host":Ljava/lang/String;
    .restart local v6    # "type":I
    .restart local v8    # "comment":Ljava/lang/String;
    .restart local v9    # "buf":[B
    .restart local v11    # "bufl":I
    .restart local v17    # "j":I
    :cond_27b
    move/from16 v16, v17

    .end local v17    # "j":I
    .restart local v16    # "j":I
    goto :goto_21b

    .end local v8    # "comment":Ljava/lang/String;
    .end local v16    # "j":I
    .restart local v17    # "j":I
    :cond_27e
    move/from16 v16, v17

    .end local v17    # "j":I
    .restart local v16    # "j":I
    goto/16 :goto_1c2

    .end local v16    # "j":I
    .restart local v17    # "j":I
    :cond_282
    move/from16 v16, v17

    .end local v17    # "j":I
    .restart local v16    # "j":I
    goto/16 :goto_15e

    .end local v6    # "type":I
    .end local v16    # "j":I
    .restart local v17    # "j":I
    :cond_286
    move/from16 v16, v17

    .end local v17    # "j":I
    .restart local v16    # "j":I
    goto/16 :goto_110

    .end local v4    # "marker":Ljava/lang/String;
    .end local v5    # "host":Ljava/lang/String;
    .end local v16    # "j":I
    .restart local v17    # "j":I
    :cond_28a
    move/from16 v16, v17

    .end local v17    # "j":I
    .restart local v16    # "j":I
    goto/16 :goto_b7
.end method

.method setKnownHosts(Ljava/lang/String;)V
    .registers 6
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 58
    :try_start_0
    iput-object p1, p0, Lcom/jcraft/jsch/KnownHosts;->known_hosts:Ljava/lang/String;

    .line 59
    new-instance v1, Ljava/io/FileInputStream;

    invoke-static {p1}, Lcom/jcraft/jsch/Util;->checkTilde(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 60
    .local v1, "fis":Ljava/io/FileInputStream;
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/KnownHosts;->setKnownHosts(Ljava/io/InputStream;)V
    :try_end_e
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_e} :catch_f

    .line 65
    return-void

    .line 62
    .end local v1    # "fis":Ljava/io/FileInputStream;
    :catch_f
    move-exception v0

    .line 63
    .local v0, "e":Ljava/io/FileNotFoundException;
    new-instance v2, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected sync()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 414
    iget-object v0, p0, Lcom/jcraft/jsch/KnownHosts;->known_hosts:Ljava/lang/String;

    if-eqz v0, :cond_9

    .line 415
    iget-object v0, p0, Lcom/jcraft/jsch/KnownHosts;->known_hosts:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/KnownHosts;->sync(Ljava/lang/String;)V

    .line 416
    :cond_9
    return-void
.end method

.method protected declared-synchronized sync(Ljava/lang/String;)V
    .registers 4
    .param p1, "foo"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 418
    monitor-enter p0

    if-nez p1, :cond_5

    .line 422
    :goto_3
    monitor-exit p0

    return-void

    .line 419
    :cond_5
    :try_start_5
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-static {p1}, Lcom/jcraft/jsch/Util;->checkTilde(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 420
    .local v0, "fos":Ljava/io/FileOutputStream;
    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/KnownHosts;->dump(Ljava/io/OutputStream;)V

    .line 421
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_14
    .catchall {:try_start_5 .. :try_end_14} :catchall_15

    goto :goto_3

    .line 418
    .end local v0    # "fos":Ljava/io/FileOutputStream;
    :catchall_15
    move-exception v1

    monitor-exit p0

    throw v1
.end method
