.class public Leu/chainfire/libsuperuser/Shell$SU;
.super Ljava/lang/Object;
.source "Shell.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Leu/chainfire/libsuperuser/Shell;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SU"
.end annotation


# static fields
.field private static isSELinuxEnforcing:Ljava/lang/Boolean;

.field private static suVersion:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 280
    sput-object v2, Leu/chainfire/libsuperuser/Shell$SU;->isSELinuxEnforcing:Ljava/lang/Boolean;

    .line 281
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object v2, v0, v1

    const/4 v1, 0x1

    aput-object v2, v0, v1

    sput-object v0, Leu/chainfire/libsuperuser/Shell$SU;->suVersion:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 279
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static available()Z
    .registers 2

    .prologue
    .line 330
    sget-object v1, Leu/chainfire/libsuperuser/Shell;->availableTestCommands:[Ljava/lang/String;

    invoke-static {v1}, Leu/chainfire/libsuperuser/Shell$SU;->run([Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 331
    .local v0, "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x1

    invoke-static {v0, v1}, Leu/chainfire/libsuperuser/Shell;->parseAvailableResult(Ljava/util/List;Z)Z

    move-result v1

    return v1
.end method

.method public static declared-synchronized clearCachedResults()V
    .registers 4

    .prologue
    .line 519
    const-class v1, Leu/chainfire/libsuperuser/Shell$SU;

    monitor-enter v1

    const/4 v0, 0x0

    :try_start_4
    sput-object v0, Leu/chainfire/libsuperuser/Shell$SU;->isSELinuxEnforcing:Ljava/lang/Boolean;

    .line 520
    sget-object v0, Leu/chainfire/libsuperuser/Shell$SU;->suVersion:[Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-object v3, v0, v2

    .line 521
    sget-object v0, Leu/chainfire/libsuperuser/Shell$SU;->suVersion:[Ljava/lang/String;

    const/4 v2, 0x1

    const/4 v3, 0x0

    aput-object v3, v0, v2
    :try_end_12
    .catchall {:try_start_4 .. :try_end_12} :catchall_14

    .line 522
    monitor-exit v1

    return-void

    .line 519
    :catchall_14
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized isSELinuxEnforcing()Z
    .registers 8

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 471
    const-class v6, Leu/chainfire/libsuperuser/Shell$SU;

    monitor-enter v6

    :try_start_5
    sget-object v3, Leu/chainfire/libsuperuser/Shell$SU;->isSELinuxEnforcing:Ljava/lang/Boolean;

    if-nez v3, :cond_4a

    .line 472
    const/4 v0, 0x0

    .line 476
    .local v0, "enforcing":Ljava/lang/Boolean;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x11

    if-lt v3, v7, :cond_41

    .line 478
    new-instance v1, Ljava/io/File;

    const-string v3, "/sys/fs/selinux/enforce"

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 479
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z
    :try_end_1a
    .catchall {:try_start_5 .. :try_end_1a} :catchall_5d

    move-result v3

    if-eqz v3, :cond_34

    .line 481
    :try_start_1d
    new-instance v2, Ljava/io/FileInputStream;

    const-string v3, "/sys/fs/selinux/enforce"

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_24} :catch_59
    .catchall {:try_start_1d .. :try_end_24} :catchall_5d

    .line 483
    .local v2, "is":Ljava/io/InputStream;
    :try_start_24
    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v3

    const/16 v7, 0x31

    if-ne v3, v7, :cond_52

    move v3, v4

    :goto_2d
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_30
    .catchall {:try_start_24 .. :try_end_30} :catchall_54

    move-result-object v0

    .line 485
    :try_start_31
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_34} :catch_59
    .catchall {:try_start_31 .. :try_end_34} :catchall_5d

    .line 493
    .end local v2    # "is":Ljava/io/InputStream;
    :cond_34
    :goto_34
    if-nez v0, :cond_41

    .line 494
    :try_start_36
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x13

    if-lt v3, v7, :cond_5b

    move v3, v4

    :goto_3d
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 498
    .end local v1    # "f":Ljava/io/File;
    :cond_41
    if-nez v0, :cond_48

    .line 499
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 502
    :cond_48
    sput-object v0, Leu/chainfire/libsuperuser/Shell$SU;->isSELinuxEnforcing:Ljava/lang/Boolean;

    .line 504
    :cond_4a
    sget-object v3, Leu/chainfire/libsuperuser/Shell$SU;->isSELinuxEnforcing:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_4f
    .catchall {:try_start_36 .. :try_end_4f} :catchall_5d

    move-result v3

    monitor-exit v6

    return v3

    .restart local v1    # "f":Ljava/io/File;
    .restart local v2    # "is":Ljava/io/InputStream;
    :cond_52
    move v3, v5

    .line 483
    goto :goto_2d

    .line 485
    :catchall_54
    move-exception v3

    :try_start_55
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw v3
    :try_end_59
    .catch Ljava/lang/Exception; {:try_start_55 .. :try_end_59} :catch_59
    .catchall {:try_start_55 .. :try_end_59} :catchall_5d

    .line 487
    .end local v2    # "is":Ljava/io/InputStream;
    :catch_59
    move-exception v3

    goto :goto_34

    :cond_5b
    move v3, v5

    .line 494
    goto :goto_3d

    .line 471
    .end local v1    # "f":Ljava/io/File;
    :catchall_5d
    move-exception v3

    monitor-exit v6

    throw v3
.end method

.method public static isSU(Ljava/lang/String;)Z
    .registers 3
    .param p0, "shell"    # Ljava/lang/String;

    .prologue
    .line 400
    const/16 v1, 0x20

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 401
    .local v0, "pos":I
    if-ltz v0, :cond_d

    .line 402
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 406
    :cond_d
    const/16 v1, 0x2f

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 407
    if-ltz v0, :cond_1b

    .line 408
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 411
    :cond_1b
    const-string v1, "su"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public static run(Ljava/lang/String;)Ljava/util/List;
    .registers 5
    .param p0, "command"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 293
    const-string v0, "su"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    aput-object p0, v1, v3

    const/4 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Leu/chainfire/libsuperuser/Shell;->run(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static run(Ljava/util/List;)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 306
    .local p0, "commands":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v1, "su"

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p0, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v1, v0, v2, v3}, Leu/chainfire/libsuperuser/Shell;->run(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static run([Ljava/lang/String;)Ljava/util/List;
    .registers 4
    .param p0, "commands"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 317
    const-string v0, "su"

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {v0, p0, v1, v2}, Leu/chainfire/libsuperuser/Shell;->run(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static shell(ILjava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p0, "uid"    # I
    .param p1, "context"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 425
    const-string v2, "su"

    .line 427
    .local v2, "shell":Ljava/lang/String;
    if-eqz p1, :cond_3b

    invoke-static {}, Leu/chainfire/libsuperuser/Shell$SU;->isSELinuxEnforcing()Z

    move-result v3

    if-eqz v3, :cond_3b

    .line 428
    invoke-static {v6}, Leu/chainfire/libsuperuser/Shell$SU;->version(Z)Ljava/lang/String;

    move-result-object v0

    .line 429
    .local v0, "display":Ljava/lang/String;
    invoke-static {v7}, Leu/chainfire/libsuperuser/Shell$SU;->version(Z)Ljava/lang/String;

    move-result-object v1

    .line 433
    .local v1, "internal":Ljava/lang/String;
    if-eqz v0, :cond_3b

    if-eqz v1, :cond_3b

    const-string v3, "SUPERSU"

    .line 435
    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3b

    .line 436
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v4, 0xbe

    if-lt v3, v4, :cond_3b

    .line 437
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v4, "%s --context %s"

    new-array v5, v8, [Ljava/lang/Object;

    aput-object v2, v5, v6

    aput-object p1, v5, v7

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 443
    .end local v0    # "display":Ljava/lang/String;
    .end local v1    # "internal":Ljava/lang/String;
    :cond_3b
    if-lez p0, :cond_4f

    .line 444
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v4, "%s %d"

    new-array v5, v8, [Ljava/lang/Object;

    aput-object v2, v5, v6

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 447
    :cond_4f
    return-object v2
.end method

.method public static shellMountMaster()Ljava/lang/String;
    .registers 2

    .prologue
    .line 458
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_9

    .line 459
    const-string v0, "su --mount-master"

    .line 461
    :goto_8
    return-object v0

    :cond_9
    const-string v0, "su"

    goto :goto_8
.end method

.method public static declared-synchronized version(Z)Ljava/lang/String;
    .registers 10
    .param p0, "internal"    # Z

    .prologue
    const/4 v4, 0x1

    const/4 v0, 0x0

    .line 356
    const-class v5, Leu/chainfire/libsuperuser/Shell$SU;

    monitor-enter v5

    if-eqz p0, :cond_4b

    .line 357
    .local v0, "idx":I
    :goto_7
    :try_start_7
    sget-object v4, Leu/chainfire/libsuperuser/Shell$SU;->suVersion:[Ljava/lang/String;

    aget-object v4, v4, v0

    if-nez v4, :cond_45

    .line 358
    const/4 v3, 0x0

    .line 360
    .local v3, "version":Ljava/lang/String;
    if-eqz p0, :cond_4d

    const-string v4, "su -V"

    :goto_12
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "exit"

    aput-object v8, v6, v7

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static {v4, v6, v7, v8}, Leu/chainfire/libsuperuser/Shell;->run(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v2

    .line 367
    .local v2, "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v2, :cond_41

    .line 368
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_26
    :goto_26
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_41

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 369
    .local v1, "line":Ljava/lang/String;
    if-nez p0, :cond_50

    .line 370
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const-string v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_26

    .line 371
    move-object v3, v1

    .line 387
    .end local v1    # "line":Ljava/lang/String;
    :cond_41
    :goto_41
    sget-object v4, Leu/chainfire/libsuperuser/Shell$SU;->suVersion:[Ljava/lang/String;

    aput-object v3, v4, v0

    .line 389
    .end local v2    # "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "version":Ljava/lang/String;
    :cond_45
    sget-object v4, Leu/chainfire/libsuperuser/Shell$SU;->suVersion:[Ljava/lang/String;

    aget-object v4, v4, v0
    :try_end_49
    .catchall {:try_start_7 .. :try_end_49} :catchall_5a

    monitor-exit v5

    return-object v4

    .end local v0    # "idx":I
    :cond_4b
    move v0, v4

    .line 356
    goto :goto_7

    .line 360
    .restart local v0    # "idx":I
    .restart local v3    # "version":Ljava/lang/String;
    :cond_4d
    :try_start_4d
    const-string v4, "su -v"
    :try_end_4f
    .catchall {:try_start_4d .. :try_end_4f} :catchall_5a

    goto :goto_12

    .line 376
    .restart local v1    # "line":Ljava/lang/String;
    .restart local v2    # "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_50
    :try_start_50
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_53
    .catch Ljava/lang/NumberFormatException; {:try_start_50 .. :try_end_53} :catch_58
    .catchall {:try_start_50 .. :try_end_53} :catchall_5a

    move-result v6

    if-lez v6, :cond_26

    .line 377
    move-object v3, v1

    goto :goto_41

    .line 380
    :catch_58
    move-exception v6

    goto :goto_26

    .line 356
    .end local v1    # "line":Ljava/lang/String;
    .end local v2    # "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "version":Ljava/lang/String;
    :catchall_5a
    move-exception v4

    monitor-exit v5

    throw v4
.end method
