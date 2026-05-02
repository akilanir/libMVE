.class public final Lcom/stericson/RootTools/internal/RootToolsInternalMethods;
.super Ljava/lang/Object;
.source "RootToolsInternalMethods.java"


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V
    .registers 7
    .param p1, "shell"    # Lcom/stericson/RootTools/execution/Shell;
    .param p2, "cmd"    # Lcom/stericson/RootTools/execution/Command;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1463
    :cond_0
    :goto_0
    invoke-virtual {p2}, Lcom/stericson/RootTools/execution/Command;->isFinished()Z

    move-result v1

    if-nez v1, :cond_d2

    .line 1465
    const-string v1, "RootTools v3.5"

    invoke-virtual {p1, p2}, Lcom/stericson/RootTools/execution/Shell;->getCommandQueuePositionString(Lcom/stericson/RootTools/execution/Command;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 1467
    monitor-enter p2

    .line 1469
    :try_start_10
    invoke-virtual {p2}, Lcom/stericson/RootTools/execution/Command;->isFinished()Z

    move-result v1

    if-nez v1, :cond_1b

    .line 1470
    const-wide/16 v1, 0x7d0

    invoke-virtual {p2, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_1b
    .catch Ljava/lang/InterruptedException; {:try_start_10 .. :try_end_1b} :catch_60
    .catchall {:try_start_10 .. :try_end_1b} :catchall_65

    .line 1475
    :cond_1b
    :goto_1b
    :try_start_1b
    monitor-exit p2
    :try_end_1c
    .catchall {:try_start_1b .. :try_end_1c} :catchall_65

    .line 1477
    invoke-virtual {p2}, Lcom/stericson/RootTools/execution/Command;->isExecuting()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p2}, Lcom/stericson/RootTools/execution/Command;->isFinished()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1478
    iget-boolean v1, p1, Lcom/stericson/RootTools/execution/Shell;->isExecuting:Z

    if-nez v1, :cond_68

    iget-boolean v1, p1, Lcom/stericson/RootTools/execution/Shell;->isReading:Z

    if-nez v1, :cond_68

    .line 1479
    const-string v1, "RootTools v3.5"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Waiting for a command to be executed in a shell that is not executing and not reading! \n\n Command: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Lcom/stericson/RootTools/execution/Command;->getCommand()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1480
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    .line 1481
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Exception;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 1482
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 1472
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_60
    move-exception v0

    .line 1473
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_61
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1b

    .line 1475
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_65
    move-exception v1

    monitor-exit p2
    :try_end_67
    .catchall {:try_start_61 .. :try_end_67} :catchall_65

    throw v1

    .line 1483
    :cond_68
    iget-boolean v1, p1, Lcom/stericson/RootTools/execution/Shell;->isExecuting:Z

    if-eqz v1, :cond_a1

    iget-boolean v1, p1, Lcom/stericson/RootTools/execution/Shell;->isReading:Z

    if-nez v1, :cond_a1

    .line 1484
    const-string v1, "RootTools v3.5"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Waiting for a command to be executed in a shell that is executing but not reading! \n\n Command: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Lcom/stericson/RootTools/execution/Command;->getCommand()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1485
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    .line 1486
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Exception;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 1487
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 1489
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_a1
    const-string v1, "RootTools v3.5"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Waiting for a command to be executed in a shell that is not reading! \n\n Command: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Lcom/stericson/RootTools/execution/Command;->getCommand()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1490
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    .line 1491
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Exception;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 1492
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 1497
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_d2
    return-void
.end method

.method public static getInstance()V
    .registers 1

    .prologue
    .line 65
    new-instance v0, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    invoke-direct {v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;-><init>()V

    invoke-static {v0}, Lcom/stericson/RootTools/RootTools;->setRim(Lcom/stericson/RootTools/internal/RootToolsInternalMethods;)V

    .line 66
    return-void
.end method


# virtual methods
.method public checkUtil(Ljava/lang/String;)Z
    .registers 10
    .param p1, "util"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    .line 306
    invoke-static {p1}, Lcom/stericson/RootTools/RootTools;->findBinary(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_94

    .line 308
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 309
    .local v0, "binaryPaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v6, Lcom/stericson/RootTools/RootTools;->lastFoundBinaryPaths:Ljava/util/List;

    invoke-interface {v0, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 311
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_15
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_94

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 312
    .local v2, "path":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/stericson/RootTools/RootTools;->getFilePermissionsSymlinks(Ljava/lang/String;)Lcom/stericson/RootTools/containers/Permissions;

    move-result-object v4

    .line 315
    .local v4, "permissions":Lcom/stericson/RootTools/containers/Permissions;
    if-eqz v4, :cond_15

    .line 318
    invoke-virtual {v4}, Lcom/stericson/RootTools/containers/Permissions;->getPermissions()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    const/4 v7, 0x3

    if-le v6, v7, :cond_8b

    .line 319
    invoke-virtual {v4}, Lcom/stericson/RootTools/containers/Permissions;->getPermissions()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 323
    .local v3, "permission":Ljava/lang/String;
    :goto_59
    const-string v6, "755"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_71

    const-string v6, "777"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_71

    const-string v6, "775"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_15

    .line 325
    :cond_71
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    sput-object v6, Lcom/stericson/RootTools/RootTools;->utilPath:Ljava/lang/String;

    .line 332
    .end local v0    # "binaryPaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "path":Ljava/lang/String;
    .end local v3    # "permission":Ljava/lang/String;
    .end local v4    # "permissions":Lcom/stericson/RootTools/containers/Permissions;
    :goto_8a
    return v5

    .line 321
    .restart local v0    # "binaryPaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "path":Ljava/lang/String;
    .restart local v4    # "permissions":Lcom/stericson/RootTools/containers/Permissions;
    :cond_8b
    invoke-virtual {v4}, Lcom/stericson/RootTools/containers/Permissions;->getPermissions()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "permission":Ljava/lang/String;
    goto :goto_59

    .line 332
    .end local v0    # "binaryPaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "path":Ljava/lang/String;
    .end local v3    # "permission":Ljava/lang/String;
    .end local v4    # "permissions":Lcom/stericson/RootTools/containers/Permissions;
    :cond_94
    const/4 v5, 0x0

    goto :goto_8a
.end method

.method public copyFile(Ljava/lang/String;Ljava/lang/String;ZZ)Z
    .registers 17
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "destination"    # Ljava/lang/String;
    .param p3, "remountAsRw"    # Z
    .param p4, "preserveFileAttributes"    # Z

    .prologue
    .line 206
    const/4 v0, 0x0

    .line 207
    .local v0, "command":Lcom/stericson/RootTools/execution/CommandCapture;
    const/4 v5, 0x1

    .line 211
    .local v5, "result":Z
    if-eqz p3, :cond_9

    .line 212
    :try_start_4
    const-string v6, "RW"

    invoke-static {p2, v6}, Lcom/stericson/RootTools/RootTools;->remount(Ljava/lang/String;Ljava/lang/String;)Z

    .line 216
    :cond_9
    const-string v6, "cp"

    invoke-virtual {p0, v6}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->checkUtil(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_ae

    .line 217
    const-string v6, "cp command is available!"

    invoke-static {v6}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 219
    if-eqz p4, :cond_6b

    .line 220
    new-instance v1, Lcom/stericson/RootTools/execution/CommandCapture;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "cp -fp "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-direct {v1, v6, v7, v8}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_42} :catch_1c9

    .line 221
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .local v1, "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :try_start_42
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v6

    invoke-virtual {v6, v1}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 222
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v6

    invoke-direct {p0, v6, v1}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V

    .line 225
    invoke-virtual {v1}, Lcom/stericson/RootTools/execution/CommandCapture;->getExitCode()I
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_53} :catch_1d6

    move-result v6

    if-nez v6, :cond_69

    const/4 v5, 0x1

    :goto_57
    move-object v0, v1

    .line 281
    .end local v1    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :goto_58
    if-eqz p3, :cond_5f

    .line 282
    :try_start_5a
    const-string v6, "RO"

    invoke-static {p2, v6}, Lcom/stericson/RootTools/RootTools;->remount(Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_5f
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_5f} :catch_1c9

    .line 289
    :cond_5f
    :goto_5f
    if-eqz v0, :cond_68

    .line 291
    invoke-virtual {v0}, Lcom/stericson/RootTools/execution/CommandCapture;->getExitCode()I

    move-result v6

    if-nez v6, :cond_1d3

    const/4 v5, 0x1

    .line 294
    :cond_68
    :goto_68
    return v5

    .line 225
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v1    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :cond_69
    const/4 v5, 0x0

    goto :goto_57

    .line 228
    .end local v1    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :cond_6b
    :try_start_6b
    new-instance v1, Lcom/stericson/RootTools/execution/CommandCapture;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "cp -f "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-direct {v1, v6, v7, v8}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V
    :try_end_95
    .catch Ljava/lang/Exception; {:try_start_6b .. :try_end_95} :catch_1c9

    .line 229
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v1    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :try_start_95
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v6

    invoke-virtual {v6, v1}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 230
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v6

    invoke-direct {p0, v6, v1}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V

    .line 233
    invoke-virtual {v1}, Lcom/stericson/RootTools/execution/CommandCapture;->getExitCode()I
    :try_end_a6
    .catch Ljava/lang/Exception; {:try_start_95 .. :try_end_a6} :catch_1d6

    move-result v6

    if-nez v6, :cond_ac

    const/4 v5, 0x1

    :goto_aa
    move-object v0, v1

    .end local v1    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    goto :goto_58

    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v1    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :cond_ac
    const/4 v5, 0x0

    goto :goto_aa

    .line 237
    .end local v1    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :cond_ae
    :try_start_ae
    const-string v6, "busybox"

    invoke-virtual {p0, v6}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->checkUtil(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_13d

    const-string v6, "cp"

    const-string v7, "busybox"

    invoke-virtual {p0, v6, v7}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->hasUtil(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_13d

    .line 238
    const-string v6, "busybox cp command is available!"

    invoke-static {v6}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 240
    if-eqz p4, :cond_102

    .line 241
    new-instance v1, Lcom/stericson/RootTools/execution/CommandCapture;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "busybox cp -fp "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-direct {v1, v6, v7, v8}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V
    :try_end_f1
    .catch Ljava/lang/Exception; {:try_start_ae .. :try_end_f1} :catch_1c9

    .line 242
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v1    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :try_start_f1
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v6

    invoke-virtual {v6, v1}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 243
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v6

    invoke-direct {p0, v6, v1}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V
    :try_end_ff
    .catch Ljava/lang/Exception; {:try_start_f1 .. :try_end_ff} :catch_1d6

    move-object v0, v1

    .end local v1    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    goto/16 :goto_58

    .line 246
    :cond_102
    :try_start_102
    new-instance v1, Lcom/stericson/RootTools/execution/CommandCapture;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "busybox cp -f "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-direct {v1, v6, v7, v8}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V
    :try_end_12c
    .catch Ljava/lang/Exception; {:try_start_102 .. :try_end_12c} :catch_1c9

    .line 247
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v1    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :try_start_12c
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v6

    invoke-virtual {v6, v1}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 248
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v6

    invoke-direct {p0, v6, v1}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V
    :try_end_13a
    .catch Ljava/lang/Exception; {:try_start_12c .. :try_end_13a} :catch_1d6

    move-object v0, v1

    .end local v1    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    goto/16 :goto_58

    .line 253
    :cond_13d
    :try_start_13d
    const-string v6, "cat"

    invoke-virtual {p0, v6}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->checkUtil(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1d0

    .line 254
    const-string v6, "cp is not available, use cat!"

    invoke-static {v6}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 256
    const/4 v3, -0x1

    .line 257
    .local v3, "filePermission":I
    if-eqz p4, :cond_155

    .line 259
    invoke-virtual {p0, p1}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->getFilePermissionsSymlinks(Ljava/lang/String;)Lcom/stericson/RootTools/containers/Permissions;

    move-result-object v4

    .line 260
    .local v4, "permissions":Lcom/stericson/RootTools/containers/Permissions;
    invoke-virtual {v4}, Lcom/stericson/RootTools/containers/Permissions;->getPermissions()I

    move-result v3

    .line 264
    .end local v4    # "permissions":Lcom/stericson/RootTools/containers/Permissions;
    :cond_155
    new-instance v1, Lcom/stericson/RootTools/execution/CommandCapture;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "cat "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " > "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-direct {v1, v6, v7, v8}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V
    :try_end_17f
    .catch Ljava/lang/Exception; {:try_start_13d .. :try_end_17f} :catch_1c9

    .line 265
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v1    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :try_start_17f
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v6

    invoke-virtual {v6, v1}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 266
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v6

    invoke-direct {p0, v6, v1}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V

    .line 268
    if-eqz p4, :cond_1d9

    .line 270
    new-instance v0, Lcom/stericson/RootTools/execution/CommandCapture;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "chmod "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-direct {v0, v6, v7, v8}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V
    :try_end_1b9
    .catch Ljava/lang/Exception; {:try_start_17f .. :try_end_1b9} :catch_1d6

    .line 271
    .end local v1    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :try_start_1b9
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v6

    invoke-virtual {v6, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 272
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v6

    invoke-direct {p0, v6, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V
    :try_end_1c7
    .catch Ljava/lang/Exception; {:try_start_1b9 .. :try_end_1c7} :catch_1c9

    goto/16 :goto_58

    .line 284
    .end local v3    # "filePermission":I
    :catch_1c9
    move-exception v2

    .line 285
    .local v2, "e":Ljava/lang/Exception;
    :goto_1ca
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 286
    const/4 v5, 0x0

    goto/16 :goto_5f

    .line 275
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_1d0
    const/4 v5, 0x0

    goto/16 :goto_58

    .line 291
    :cond_1d3
    const/4 v5, 0x0

    goto/16 :goto_68

    .line 284
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v1    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :catch_1d6
    move-exception v2

    move-object v0, v1

    .end local v1    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    goto :goto_1ca

    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v1    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v3    # "filePermission":I
    :cond_1d9
    move-object v0, v1

    .end local v1    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    goto/16 :goto_58
.end method

.method public deleteFileOrDirectory(Ljava/lang/String;Z)Z
    .registers 12
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "remountAsRw"    # Z

    .prologue
    .line 344
    const/4 v2, 0x1

    .line 348
    .local v2, "result":Z
    if-eqz p2, :cond_8

    .line 349
    :try_start_3
    const-string v3, "RW"

    invoke-static {p1, v3}, Lcom/stericson/RootTools/RootTools;->remount(Ljava/lang/String;Ljava/lang/String;)Z

    .line 352
    :cond_8
    const-string v3, "rm"

    const-string v4, "toolbox"

    invoke-virtual {p0, v3, v4}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->hasUtil(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_59

    .line 353
    const-string v3, "rm command is available!"

    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 355
    new-instance v0, Lcom/stericson/RootTools/execution/CommandCapture;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "rm -r "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-direct {v0, v3, v4, v5}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V

    .line 356
    .local v0, "command":Lcom/stericson/RootTools/execution/CommandCapture;
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 357
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v3

    invoke-direct {p0, v3, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V

    .line 359
    invoke-virtual {v0}, Lcom/stericson/RootTools/execution/CommandCapture;->getExitCode()I

    move-result v3

    if-eqz v3, :cond_51

    .line 360
    const-string v3, "target not exist or unable to delete file"

    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 361
    const/4 v2, 0x0

    .line 379
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :cond_51
    :goto_51
    if-eqz p2, :cond_58

    .line 380
    const-string v3, "RO"

    invoke-static {p1, v3}, Lcom/stericson/RootTools/RootTools;->remount(Ljava/lang/String;Ljava/lang/String;)Z

    .line 387
    :cond_58
    :goto_58
    return v2

    .line 364
    :cond_59
    const-string v3, "busybox"

    invoke-virtual {p0, v3}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->checkUtil(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_51

    const-string v3, "rm"

    const-string v4, "busybox"

    invoke-virtual {p0, v3, v4}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->hasUtil(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_51

    .line 365
    const-string v3, "busybox rm command is available!"

    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 367
    new-instance v0, Lcom/stericson/RootTools/execution/CommandCapture;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "busybox rm -rf "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-direct {v0, v3, v4, v5}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V

    .line 368
    .restart local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 369
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v3

    invoke-direct {p0, v3, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V

    .line 371
    invoke-virtual {v0}, Lcom/stericson/RootTools/execution/CommandCapture;->getExitCode()I

    move-result v3

    if-eqz v3, :cond_51

    .line 372
    const-string v3, "target not exist or unable to delete file"

    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V
    :try_end_a9
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_a9} :catch_ab

    .line 373
    const/4 v2, 0x0

    goto :goto_51

    .line 382
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :catch_ab
    move-exception v1

    .line 383
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 384
    const/4 v2, 0x0

    goto :goto_58
.end method

.method public exists(Ljava/lang/String;)Z
    .registers 3
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    .line 398
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->exists(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public exists(Ljava/lang/String;Z)Z
    .registers 15
    .param p1, "file"    # Ljava/lang/String;
    .param p2, "isDir"    # Z

    .prologue
    const/4 v11, 0x1

    const/4 v2, 0x0

    .line 412
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 414
    .local v5, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ls "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz p2, :cond_64

    const-string v1, "-d "

    :goto_16
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 416
    .local v6, "cmdToExecute":Ljava/lang/String;
    new-instance v0, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$1;

    new-array v4, v11, [Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v2

    move-object v1, p0

    move v3, v2

    invoke-direct/range {v0 .. v5}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$1;-><init>(Lcom/stericson/RootTools/internal/RootToolsInternalMethods;IZ[Ljava/lang/String;Ljava/util/List;)V

    .line 426
    .local v0, "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :try_start_3a
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 427
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_48} :catch_67

    .line 433
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :cond_4c
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_69

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 434
    .local v10, "line":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4c

    move v2, v11

    .line 463
    .end local v9    # "i$":Ljava/util/Iterator;
    .end local v10    # "line":Ljava/lang/String;
    :cond_63
    :goto_63
    return v2

    .line 414
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .end local v6    # "cmdToExecute":Ljava/lang/String;
    :cond_64
    const-string v1, " "

    goto :goto_16

    .line 429
    .restart local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v6    # "cmdToExecute":Ljava/lang/String;
    :catch_67
    move-exception v7

    .line 430
    .local v7, "e":Ljava/lang/Exception;
    goto :goto_63

    .line 440
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v9    # "i$":Ljava/util/Iterator;
    :cond_69
    const/4 v1, 0x0

    :try_start_6a
    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->closeShell(Z)V
    :try_end_6d
    .catch Ljava/lang/Exception; {:try_start_6a .. :try_end_6d} :catch_a4

    .line 443
    :goto_6d
    invoke-interface {v5}, Ljava/util/List;->clear()V

    .line 446
    :try_start_70
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 447
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V
    :try_end_7e
    .catch Ljava/lang/Exception; {:try_start_70 .. :try_end_7e} :catch_a2

    .line 454
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 455
    .local v8, "final_result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v8, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 457
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_8a
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_63

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 458
    .restart local v10    # "line":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8a

    move v2, v11

    .line 459
    goto :goto_63

    .line 449
    .end local v8    # "final_result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v10    # "line":Ljava/lang/String;
    :catch_a2
    move-exception v7

    .line 450
    .restart local v7    # "e":Ljava/lang/Exception;
    goto :goto_63

    .line 441
    .end local v7    # "e":Ljava/lang/Exception;
    :catch_a4
    move-exception v1

    goto :goto_6d
.end method

.method public findBinary(Ljava/lang/String;)Z
    .registers 20
    .param p1, "binaryName"    # Ljava/lang/String;

    .prologue
    .line 543
    const/4 v11, 0x0

    .line 544
    .local v11, "found":Z
    sget-object v2, Lcom/stericson/RootTools/RootTools;->lastFoundBinaryPaths:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 546
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 547
    .local v7, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/16 v2, 0x8

    new-array v15, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "/sbin/"

    aput-object v3, v15, v2

    const/4 v2, 0x1

    const-string v3, "/system/bin/"

    aput-object v3, v15, v2

    const/4 v2, 0x2

    const-string v3, "/system/xbin/"

    aput-object v3, v15, v2

    const/4 v2, 0x3

    const-string v3, "/data/local/xbin/"

    aput-object v3, v15, v2

    const/4 v2, 0x4

    const-string v3, "/data/local/bin/"

    aput-object v3, v15, v2

    const/4 v2, 0x5

    const-string v3, "/system/sd/xbin/"

    aput-object v3, v15, v2

    const/4 v2, 0x6

    const-string v3, "/system/bin/failsafe/"

    aput-object v3, v15, v2

    const/4 v2, 0x7

    const-string v3, "/data/local/"

    aput-object v3, v15, v2

    .line 550
    .local v15, "places":[Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Checking for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 554
    move-object v9, v15

    .local v9, "arr$":[Ljava/lang/String;
    :try_start_50
    array-length v13, v9

    .local v13, "len$":I
    const/4 v12, 0x0

    .local v12, "i$":I
    :goto_52
    if-ge v12, v13, :cond_97

    aget-object v8, v9, v12

    .line 555
    .local v8, "path":Ljava/lang/String;
    new-instance v1, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$2;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v2, 0x1

    new-array v5, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "stat "

    move-object/from16 v0, v17

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v2

    move-object/from16 v2, p0

    move-object/from16 v6, p1

    invoke-direct/range {v1 .. v8}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$2;-><init>(Lcom/stericson/RootTools/internal/RootToolsInternalMethods;IZ[Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)V

    .line 568
    .local v1, "cc":Lcom/stericson/RootTools/execution/CommandCapture;
    const/4 v2, 0x0

    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->getShell(Z)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 569
    const/4 v2, 0x0

    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->getShell(Z)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v1}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V

    .line 554
    add-int/lit8 v12, v12, 0x1

    goto :goto_52

    .line 573
    .end local v1    # "cc":Lcom/stericson/RootTools/execution/CommandCapture;
    .end local v8    # "path":Ljava/lang/String;
    :cond_97
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z
    :try_end_9a
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_9a} :catch_f0

    move-result v2

    if-nez v2, :cond_ee

    const/4 v11, 0x1

    .line 578
    .end local v12    # "i$":I
    .end local v13    # "len$":I
    :goto_9e
    if-nez v11, :cond_129

    .line 579
    const-string v2, "Trying second method"

    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 581
    move-object v9, v15

    array-length v13, v9

    .restart local v13    # "len$":I
    const/4 v12, 0x0

    .restart local v12    # "i$":I
    :goto_a8
    if-ge v12, v13, :cond_129

    aget-object v16, v9, v12

    .line 582
    .local v16, "where":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->exists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_10a

    .line 583
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " was found here: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 584
    move-object/from16 v0, v16

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 585
    const/4 v11, 0x1

    .line 581
    :goto_eb
    add-int/lit8 v12, v12, 0x1

    goto :goto_a8

    .line 573
    .end local v16    # "where":Ljava/lang/String;
    :cond_ee
    const/4 v11, 0x0

    goto :goto_9e

    .line 574
    .end local v12    # "i$":I
    .end local v13    # "len$":I
    :catch_f0
    move-exception v10

    .line 575
    .local v10, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " was not found, more information MAY be available with Debugging on."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    goto :goto_9e

    .line 587
    .end local v10    # "e":Ljava/lang/Exception;
    .restart local v12    # "i$":I
    .restart local v13    # "len$":I
    .restart local v16    # "where":Ljava/lang/String;
    :cond_10a
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " was NOT found here: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    goto :goto_eb

    .line 592
    .end local v12    # "i$":I
    .end local v13    # "len$":I
    .end local v16    # "where":Ljava/lang/String;
    :cond_129
    if-nez v11, :cond_1bc

    .line 593
    const-string v2, "Trying third method"

    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 596
    :try_start_130
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getPath()Ljava/util/List;

    move-result-object v14

    .line 598
    .local v14, "paths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v14, :cond_1bc

    .line 599
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .local v12, "i$":Ljava/util/Iterator;
    :goto_13a
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1bc

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 600
    .restart local v8    # "path":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->exists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_186

    .line 601
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " was found here: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 602
    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 603
    const/4 v11, 0x1

    goto :goto_13a

    .line 605
    :cond_186
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " was NOT found here: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V
    :try_end_1a2
    .catch Ljava/lang/Exception; {:try_start_130 .. :try_end_1a2} :catch_1a3

    goto :goto_13a

    .line 609
    .end local v8    # "path":Ljava/lang/String;
    .end local v12    # "i$":Ljava/util/Iterator;
    .end local v14    # "paths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_1a3
    move-exception v10

    .line 610
    .restart local v10    # "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " was not found, more information MAY be available with Debugging on."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 614
    .end local v10    # "e":Ljava/lang/Exception;
    :cond_1bc
    invoke-static {v7}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 616
    sget-object v2, Lcom/stericson/RootTools/RootTools;->lastFoundBinaryPaths:Ljava/util/List;

    invoke-interface {v2, v7}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 618
    return v11
.end method

.method public fixUtil(Ljava/lang/String;Ljava/lang/String;)V
    .registers 13
    .param p1, "util"    # Ljava/lang/String;
    .param p2, "utilPath"    # Ljava/lang/String;

    .prologue
    .line 479
    :try_start_0
    const-string v4, "/system"

    const-string v5, "rw"

    invoke-static {v4, v5}, Lcom/stericson/RootTools/RootTools;->remount(Ljava/lang/String;Ljava/lang/String;)Z

    .line 481
    invoke-static {p1}, Lcom/stericson/RootTools/RootTools;->findBinary(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_bc

    .line 482
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 483
    .local v3, "paths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v4, Lcom/stericson/RootTools/RootTools;->lastFoundBinaryPaths:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 484
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_66

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 485
    .local v2, "path":Ljava/lang/String;
    new-instance v0, Lcom/stericson/RootTools/execution/CommandCapture;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " rm "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-direct {v0, v4, v5, v6}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V

    .line 486
    .local v0, "command":Lcom/stericson/RootTools/execution/CommandCapture;
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 487
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v4

    invoke-direct {p0, v4, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V

    goto :goto_1b

    .line 498
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "path":Ljava/lang/String;
    .end local v3    # "paths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_64
    move-exception v4

    .line 500
    :goto_65
    return-void

    .line 491
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v3    # "paths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_66
    new-instance v0, Lcom/stericson/RootTools/execution/CommandCapture;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " ln -s "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " /system/bin/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " chmod 0755 /system/bin/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-direct {v0, v4, v5, v6}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V

    .line 492
    .restart local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 493
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v4

    invoke-direct {p0, v4, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V

    .line 497
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v3    # "paths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_bc
    const-string v4, "/system"

    const-string v5, "ro"

    invoke-static {v4, v5}, Lcom/stericson/RootTools/RootTools;->remount(Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_c3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c3} :catch_64

    goto :goto_65
.end method

.method public fixUtils([Ljava/lang/String;)Z
    .registers 7
    .param p1, "utils"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 515
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_3
    if-ge v1, v2, :cond_3d

    aget-object v3, v0, v1

    .line 516
    .local v3, "util":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->checkUtil(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_22

    .line 517
    const-string v4, "busybox"

    invoke-virtual {p0, v4}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->checkUtil(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_25

    .line 518
    const-string v4, "busybox"

    invoke-virtual {p0, v3, v4}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->hasUtil(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_22

    .line 519
    sget-object v4, Lcom/stericson/RootTools/RootTools;->utilPath:Ljava/lang/String;

    invoke-virtual {p0, v3, v4}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->fixUtil(Ljava/lang/String;Ljava/lang/String;)V

    .line 515
    :cond_22
    :goto_22
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 522
    :cond_25
    const-string v4, "toolbox"

    invoke-virtual {p0, v4}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->checkUtil(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3b

    .line 523
    const-string v4, "toolbox"

    invoke-virtual {p0, v3, v4}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->hasUtil(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_22

    .line 524
    sget-object v4, Lcom/stericson/RootTools/RootTools;->utilPath:Ljava/lang/String;

    invoke-virtual {p0, v3, v4}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->fixUtil(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_22

    .line 527
    :cond_3b
    const/4 v4, 0x0

    .line 533
    .end local v3    # "util":Ljava/lang/String;
    :goto_3c
    return v4

    :cond_3d
    const/4 v4, 0x1

    goto :goto_3c
.end method

.method public getBusyBoxApplets(Ljava/lang/String;)Ljava/util/List;
    .registers 9
    .param p1, "path"    # Ljava/lang/String;
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 630
    if-eqz p1, :cond_6d

    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_6d

    const-string v1, ""

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6d

    .line 631
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 637
    :cond_26
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 639
    .local v5, "results":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$3;

    const/4 v2, 0x3

    const/4 v1, 0x1

    new-array v4, v1, [Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v6, "busybox --list"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v3

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$3;-><init>(Lcom/stericson/RootTools/internal/RootToolsInternalMethods;IZ[Ljava/lang/String;Ljava/util/List;)V

    .line 652
    .local v0, "command":Lcom/stericson/RootTools/execution/CommandCapture;
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 653
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V

    .line 655
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v1

    if-gtz v1, :cond_6c

    .line 657
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 658
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V

    .line 661
    :cond_6c
    return-object v5

    .line 632
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .end local v5    # "results":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_6d
    if-nez p1, :cond_26

    .line 634
    new-instance v1, Ljava/lang/Exception;

    const-string v2, "Path is null, please specifiy a path"

    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getBusyBoxVersion(Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 669
    const-string v2, ""

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_23

    const-string v2, "/"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_23

    .line 670
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 673
    :cond_23
    const-string v2, ""

    sput-object v2, Lcom/stericson/RootTools/internal/InternalVariables;->busyboxVersion:Ljava/lang/String;

    .line 676
    :try_start_27
    new-instance v0, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$4;

    const/4 v2, 0x4

    const/4 v3, 0x0

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "busybox"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-direct {v0, p0, v2, v3, v4}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$4;-><init>(Lcom/stericson/RootTools/internal/RootToolsInternalMethods;IZ[Ljava/lang/String;)V

    .line 689
    .local v0, "command":Lcom/stericson/RootTools/execution/CommandCapture;
    const-string v2, "Getting BusyBox Version without root"

    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 690
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 691
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v2

    invoke-direct {p0, v2, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V

    .line 693
    sget-object v2, Lcom/stericson/RootTools/internal/InternalVariables;->busyboxVersion:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-gtz v2, :cond_75

    .line 696
    const-string v2, "Getting BusyBox Version with root"

    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 697
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 698
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v2

    invoke-direct {p0, v2, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V
    :try_end_75
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_75} :catch_78

    .line 706
    :cond_75
    sget-object v2, Lcom/stericson/RootTools/internal/InternalVariables;->busyboxVersion:Ljava/lang/String;

    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :goto_77
    return-object v2

    .line 701
    :catch_78
    move-exception v1

    .line 702
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "BusyBox was not found, more information MAY be available with Debugging on."

    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 703
    const-string v2, ""

    goto :goto_77
.end method

.method public getConvertedSpace(Ljava/lang/String;)J
    .registers 10
    .param p1, "spaceStr"    # Ljava/lang/String;

    .prologue
    .line 714
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    .line 716
    .local v3, "multiplier":D
    :try_start_2
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    .line 717
    .local v5, "sb":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_8
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v2, v6, :cond_26

    .line 718
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 719
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isDigit(C)Z

    move-result v6

    if-nez v6, :cond_44

    const/16 v6, 0x2e

    if-eq v0, v6, :cond_44

    .line 720
    const/16 v6, 0x6d

    if-eq v0, v6, :cond_24

    const/16 v6, 0x4d

    if-ne v0, v6, :cond_39

    .line 721
    :cond_24
    const-wide/high16 v3, 0x4090000000000000L    # 1024.0

    .line 729
    .end local v0    # "c":C
    :cond_26
    :goto_26
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    mul-double/2addr v6, v3

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-long v6, v6

    .line 731
    .end local v2    # "i":I
    .end local v5    # "sb":Ljava/lang/StringBuffer;
    :goto_38
    return-wide v6

    .line 722
    .restart local v0    # "c":C
    .restart local v2    # "i":I
    .restart local v5    # "sb":Ljava/lang/StringBuffer;
    :cond_39
    const/16 v6, 0x67

    if-eq v0, v6, :cond_41

    const/16 v6, 0x47

    if-ne v0, v6, :cond_26

    .line 723
    :cond_41
    const-wide/high16 v3, 0x4130000000000000L    # 1048576.0

    goto :goto_26

    .line 727
    :cond_44
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_4b} :catch_4e

    .line 717
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 730
    .end local v0    # "c":C
    .end local v2    # "i":I
    .end local v5    # "sb":Ljava/lang/StringBuffer;
    :catch_4e
    move-exception v1

    .line 731
    .local v1, "e":Ljava/lang/Exception;
    const-wide/16 v6, -0x1

    goto :goto_38
.end method

.method public getFilePermissionsSymlinks(Ljava/lang/String;)Lcom/stericson/RootTools/containers/Permissions;
    .registers 11
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 835
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Checking permissions for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 836
    invoke-static {p1}, Lcom/stericson/RootTools/RootTools;->exists(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_a5

    .line 837
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " was found."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 840
    :try_start_33
    new-instance v0, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$7;

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "ls -l "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "busybox ls -l "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "/system/bin/failsafe/toolbox ls -l "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x3

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "toolbox ls -l "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-direct {v0, p0, v3, v4, v5}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$7;-><init>(Lcom/stericson/RootTools/internal/RootToolsInternalMethods;IZ[Ljava/lang/String;)V

    .line 876
    .local v0, "command":Lcom/stericson/RootTools/execution/CommandCapture;
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 877
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v3

    invoke-direct {p0, v3, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V

    .line 879
    sget-object v2, Lcom/stericson/RootTools/internal/InternalVariables;->permissions:Lcom/stericson/RootTools/containers/Permissions;
    :try_end_a5
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_a5} :catch_a6

    .line 887
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :cond_a5
    :goto_a5
    return-object v2

    .line 881
    :catch_a6
    move-exception v1

    .line 882
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    goto :goto_a5
.end method

.method public getInode(Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    .line 744
    :try_start_0
    new-instance v0, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$5;

    const/4 v2, 0x5

    const/4 v3, 0x0

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "/data/local/ls -i "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-direct {v0, p0, v2, v3, v4}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$5;-><init>(Lcom/stericson/RootTools/internal/RootToolsInternalMethods;IZ[Ljava/lang/String;)V

    .line 755
    .local v0, "command":Lcom/stericson/RootTools/execution/CommandCapture;
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 756
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v2

    invoke-direct {p0, v2, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V

    .line 758
    sget-object v2, Lcom/stericson/RootTools/internal/InternalVariables;->inode:Ljava/lang/String;
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_30} :catch_31

    .line 760
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :goto_30
    return-object v2

    .line 759
    :catch_31
    move-exception v1

    .line 760
    .local v1, "ignore":Ljava/lang/Exception;
    const-string v2, ""

    goto :goto_30
.end method

.method public getMountedAs(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 956
    invoke-virtual {p0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->getMounts()Ljava/util/ArrayList;

    move-result-object v3

    sput-object v3, Lcom/stericson/RootTools/internal/InternalVariables;->mounts:Ljava/util/ArrayList;

    .line 958
    sget-object v3, Lcom/stericson/RootTools/internal/InternalVariables;->mounts:Ljava/util/ArrayList;

    if-eqz v3, :cond_83

    .line 959
    sget-object v3, Lcom/stericson/RootTools/internal/InternalVariables;->mounts:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/stericson/RootTools/containers/Mount;

    .line 961
    .local v1, "mount":Lcom/stericson/RootTools/containers/Mount;
    invoke-virtual {v1}, Lcom/stericson/RootTools/containers/Mount;->getMountPoint()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 963
    .local v2, "mp":Ljava/lang/String;
    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_42

    .line 964
    const-string v3, "/"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 965
    invoke-virtual {v1}, Lcom/stericson/RootTools/containers/Mount;->getFlags()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v3

    aget-object v3, v3, v5

    check-cast v3, Ljava/lang/String;

    .line 974
    :goto_41
    return-object v3

    .line 972
    :cond_42
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_61

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 973
    :cond_61
    invoke-virtual {v1}, Lcom/stericson/RootTools/containers/Mount;->getFlags()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v3

    aget-object v3, v3, v5

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 974
    invoke-virtual {v1}, Lcom/stericson/RootTools/containers/Mount;->getFlags()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v3

    aget-object v3, v3, v5

    check-cast v3, Ljava/lang/String;

    goto :goto_41

    .line 978
    .end local v1    # "mount":Lcom/stericson/RootTools/containers/Mount;
    .end local v2    # "mp":Ljava/lang/String;
    :cond_7d
    new-instance v3, Ljava/lang/Exception;

    invoke-direct {v3}, Ljava/lang/Exception;-><init>()V

    throw v3

    .line 980
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_83
    new-instance v3, Ljava/lang/Exception;

    invoke-direct {v3}, Ljava/lang/Exception;-><init>()V

    throw v3
.end method

.method public getMounts()Ljava/util/ArrayList;
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/stericson/RootTools/containers/Mount;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v9, 0x2

    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 901
    invoke-static {v12}, Lcom/stericson/RootTools/RootTools;->getShell(Z)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v8

    .line 903
    .local v8, "shell":Lcom/stericson/RootTools/execution/Shell;
    new-instance v0, Lcom/stericson/RootTools/execution/CommandCapture;

    new-array v9, v9, [Ljava/lang/String;

    const-string v10, "cat /proc/mounts > /data/local/RootToolsMounts"

    aput-object v10, v9, v11

    const-string v10, "chmod 0777 /data/local/RootToolsMounts"

    aput-object v10, v9, v12

    invoke-direct {v0, v11, v11, v9}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V

    .line 907
    .local v0, "cmd":Lcom/stericson/RootTools/execution/CommandCapture;
    invoke-virtual {v8, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 908
    invoke-direct {p0, v8, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V

    .line 910
    const/4 v5, 0x0

    .line 911
    .local v5, "lnr":Ljava/io/LineNumberReader;
    const/4 v2, 0x0

    .line 914
    .local v2, "fr":Ljava/io/FileReader;
    :try_start_1e
    new-instance v3, Ljava/io/FileReader;

    const-string v9, "/data/local/RootToolsMounts"

    invoke-direct {v3, v9}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V
    :try_end_25
    .catchall {:try_start_1e .. :try_end_25} :catchall_84

    .line 915
    .end local v2    # "fr":Ljava/io/FileReader;
    .local v3, "fr":Ljava/io/FileReader;
    :try_start_25
    new-instance v6, Ljava/io/LineNumberReader;

    invoke-direct {v6, v3}, Ljava/io/LineNumberReader;-><init>(Ljava/io/Reader;)V
    :try_end_2a
    .catchall {:try_start_25 .. :try_end_2a} :catchall_86

    .line 917
    .end local v5    # "lnr":Ljava/io/LineNumberReader;
    .local v6, "lnr":Ljava/io/LineNumberReader;
    :try_start_2a
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 918
    .local v7, "mounts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/stericson/RootTools/containers/Mount;>;"
    :goto_2f
    invoke-virtual {v6}, Ljava/io/LineNumberReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .local v4, "line":Ljava/lang/String;
    if-eqz v4, :cond_67

    .line 920
    invoke-static {v4}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 922
    const-string v9, " "

    invoke-virtual {v4, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 923
    .local v1, "fields":[Ljava/lang/String;
    new-instance v9, Lcom/stericson/RootTools/containers/Mount;

    new-instance v10, Ljava/io/File;

    const/4 v11, 0x0

    aget-object v11, v1, v11

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v11, Ljava/io/File;

    const/4 v12, 0x1

    aget-object v12, v1, v12

    invoke-direct {v11, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v12, 0x2

    aget-object v12, v1, v12

    const/4 v13, 0x3

    aget-object v13, v1, v13

    invoke-direct {v9, v10, v11, v12, v13}, Lcom/stericson/RootTools/containers/Mount;-><init>(Ljava/io/File;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_5c
    .catchall {:try_start_2a .. :try_end_5c} :catchall_5d

    goto :goto_2f

    .line 937
    .end local v1    # "fields":[Ljava/lang/String;
    .end local v4    # "line":Ljava/lang/String;
    .end local v7    # "mounts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/stericson/RootTools/containers/Mount;>;"
    :catchall_5d
    move-exception v9

    move-object v2, v3

    .end local v3    # "fr":Ljava/io/FileReader;
    .restart local v2    # "fr":Ljava/io/FileReader;
    move-object v5, v6

    .line 938
    .end local v6    # "lnr":Ljava/io/LineNumberReader;
    .restart local v5    # "lnr":Ljava/io/LineNumberReader;
    :goto_60
    :try_start_60
    invoke-virtual {v2}, Ljava/io/FileReader;->close()V
    :try_end_63
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_63} :catch_80

    .line 942
    :goto_63
    :try_start_63
    invoke-virtual {v5}, Ljava/io/LineNumberReader;->close()V
    :try_end_66
    .catch Ljava/lang/Exception; {:try_start_63 .. :try_end_66} :catch_82

    .line 943
    :goto_66
    throw v9

    .line 929
    .end local v2    # "fr":Ljava/io/FileReader;
    .end local v5    # "lnr":Ljava/io/LineNumberReader;
    .restart local v3    # "fr":Ljava/io/FileReader;
    .restart local v4    # "line":Ljava/lang/String;
    .restart local v6    # "lnr":Ljava/io/LineNumberReader;
    .restart local v7    # "mounts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/stericson/RootTools/containers/Mount;>;"
    :cond_67
    :try_start_67
    sput-object v7, Lcom/stericson/RootTools/internal/InternalVariables;->mounts:Ljava/util/ArrayList;

    .line 931
    sget-object v9, Lcom/stericson/RootTools/internal/InternalVariables;->mounts:Ljava/util/ArrayList;

    if-eqz v9, :cond_76

    .line 932
    sget-object v9, Lcom/stericson/RootTools/internal/InternalVariables;->mounts:Ljava/util/ArrayList;
    :try_end_6f
    .catchall {:try_start_67 .. :try_end_6f} :catchall_5d

    .line 938
    :try_start_6f
    invoke-virtual {v3}, Ljava/io/FileReader;->close()V
    :try_end_72
    .catch Ljava/lang/Exception; {:try_start_6f .. :try_end_72} :catch_7c

    .line 942
    :goto_72
    :try_start_72
    invoke-virtual {v6}, Ljava/io/LineNumberReader;->close()V
    :try_end_75
    .catch Ljava/lang/Exception; {:try_start_72 .. :try_end_75} :catch_7e

    .line 943
    :goto_75
    return-object v9

    .line 934
    :cond_76
    :try_start_76
    new-instance v9, Ljava/lang/Exception;

    invoke-direct {v9}, Ljava/lang/Exception;-><init>()V

    throw v9
    :try_end_7c
    .catchall {:try_start_76 .. :try_end_7c} :catchall_5d

    .line 939
    :catch_7c
    move-exception v10

    goto :goto_72

    .line 943
    :catch_7e
    move-exception v10

    goto :goto_75

    .line 939
    .end local v3    # "fr":Ljava/io/FileReader;
    .end local v4    # "line":Ljava/lang/String;
    .end local v6    # "lnr":Ljava/io/LineNumberReader;
    .end local v7    # "mounts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/stericson/RootTools/containers/Mount;>;"
    .restart local v2    # "fr":Ljava/io/FileReader;
    .restart local v5    # "lnr":Ljava/io/LineNumberReader;
    :catch_80
    move-exception v10

    goto :goto_63

    .line 943
    :catch_82
    move-exception v10

    goto :goto_66

    .line 937
    :catchall_84
    move-exception v9

    goto :goto_60

    .end local v2    # "fr":Ljava/io/FileReader;
    .restart local v3    # "fr":Ljava/io/FileReader;
    :catchall_86
    move-exception v9

    move-object v2, v3

    .end local v3    # "fr":Ljava/io/FileReader;
    .restart local v2    # "fr":Ljava/io/FileReader;
    goto :goto_60
.end method

.method public getPermissions(Ljava/lang/String;)Lcom/stericson/RootTools/containers/Permissions;
    .registers 13
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x4

    const/4 v9, 0x2

    const/16 v8, 0x2d

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 104
    const-string v4, " "

    invoke-virtual {p1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 105
    .local v1, "lineArray":[Ljava/lang/String;
    aget-object v3, v1, v6

    .line 107
    .local v3, "rawPermissions":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0xa

    if-ne v4, v5, :cond_c5

    invoke-virtual {v3, v6}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v4, v8, :cond_2c

    invoke-virtual {v3, v6}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x64

    if-eq v4, v5, :cond_2c

    invoke-virtual {v3, v6}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x6c

    if-ne v4, v5, :cond_c5

    :cond_2c
    invoke-virtual {v3, v7}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v4, v8, :cond_3a

    invoke-virtual {v3, v7}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x72

    if-ne v4, v5, :cond_c5

    :cond_3a
    invoke-virtual {v3, v9}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v4, v8, :cond_48

    invoke-virtual {v3, v9}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x77

    if-ne v4, v5, :cond_c5

    .line 113
    :cond_48
    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 115
    new-instance v2, Lcom/stericson/RootTools/containers/Permissions;

    invoke-direct {v2}, Lcom/stericson/RootTools/containers/Permissions;-><init>()V

    .line 117
    .local v2, "permissions":Lcom/stericson/RootTools/containers/Permissions;
    invoke-virtual {v3, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/stericson/RootTools/containers/Permissions;->setType(Ljava/lang/String;)V

    .line 119
    invoke-virtual {v2}, Lcom/stericson/RootTools/containers/Permissions;->getType()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 121
    invoke-virtual {v3, v7, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/stericson/RootTools/containers/Permissions;->setUserPermissions(Ljava/lang/String;)V

    .line 123
    invoke-virtual {v2}, Lcom/stericson/RootTools/containers/Permissions;->getUserPermissions()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 125
    const/4 v4, 0x7

    invoke-virtual {v3, v10, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/stericson/RootTools/containers/Permissions;->setGroupPermissions(Ljava/lang/String;)V

    .line 127
    invoke-virtual {v2}, Lcom/stericson/RootTools/containers/Permissions;->getGroupPermissions()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 129
    const/4 v4, 0x7

    const/16 v5, 0xa

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/stericson/RootTools/containers/Permissions;->setOtherPermissions(Ljava/lang/String;)V

    .line 131
    invoke-virtual {v2}, Lcom/stericson/RootTools/containers/Permissions;->getOtherPermissions()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 133
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 134
    .local v0, "finalPermissions":Ljava/lang/StringBuilder;
    invoke-virtual {p0, v3}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->parseSpecialPermissions(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 135
    invoke-virtual {v2}, Lcom/stericson/RootTools/containers/Permissions;->getUserPermissions()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->parsePermissions(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 136
    invoke-virtual {v2}, Lcom/stericson/RootTools/containers/Permissions;->getGroupPermissions()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->parsePermissions(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    invoke-virtual {v2}, Lcom/stericson/RootTools/containers/Permissions;->getOtherPermissions()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->parsePermissions(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 139
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/stericson/RootTools/containers/Permissions;->setPermissions(I)V

    .line 144
    .end local v0    # "finalPermissions":Ljava/lang/StringBuilder;
    .end local v2    # "permissions":Lcom/stericson/RootTools/containers/Permissions;
    :goto_c4
    return-object v2

    :cond_c5
    const/4 v2, 0x0

    goto :goto_c4
.end method

.method public getSpace(Ljava/lang/String;)J
    .registers 16
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 993
    sput-object p1, Lcom/stericson/RootTools/internal/InternalVariables;->getSpaceFor:Ljava/lang/String;

    .line 994
    const/4 v3, 0x0

    .line 995
    .local v3, "found":Z
    const-string v8, "Looking for Space"

    invoke-static {v8}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 997
    :try_start_8
    new-instance v1, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$8;

    const/4 v8, 0x6

    const/4 v9, 0x0

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/String;

    const/4 v11, 0x0

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "df "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-direct {v1, p0, v8, v9, v10}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$8;-><init>(Lcom/stericson/RootTools/internal/RootToolsInternalMethods;IZ[Ljava/lang/String;)V

    .line 1008
    .local v1, "command":Lcom/stericson/RootTools/execution/CommandCapture;
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v8

    invoke-virtual {v8, v1}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 1009
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v8

    invoke-direct {p0, v8, v1}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_36} :catch_ac

    .line 1013
    .end local v1    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :goto_36
    sget-object v8, Lcom/stericson/RootTools/internal/InternalVariables;->space:[Ljava/lang/String;

    if-eqz v8, :cond_a4

    .line 1014
    const-string v8, "First Method"

    invoke-static {v8}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 1016
    sget-object v0, Lcom/stericson/RootTools/internal/InternalVariables;->space:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_43
    if-ge v4, v5, :cond_5d

    aget-object v6, v0, v4

    .line 1018
    .local v6, "spaceSearch":Ljava/lang/String;
    invoke-static {v6}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 1020
    if-eqz v3, :cond_51

    .line 1021
    invoke-virtual {p0, v6}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->getConvertedSpace(Ljava/lang/String;)J

    move-result-wide v8

    .line 1049
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    .end local v6    # "spaceSearch":Ljava/lang/String;
    :goto_50
    return-wide v8

    .line 1022
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v4    # "i$":I
    .restart local v5    # "len$":I
    .restart local v6    # "spaceSearch":Ljava/lang/String;
    :cond_51
    const-string v8, "used,"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5a

    .line 1023
    const/4 v3, 0x1

    .line 1016
    :cond_5a
    add-int/lit8 v4, v4, 0x1

    goto :goto_43

    .line 1028
    .end local v6    # "spaceSearch":Ljava/lang/String;
    :cond_5d
    const/4 v2, 0x0

    .local v2, "count":I
    const/4 v7, 0x3

    .line 1030
    .local v7, "targetCount":I
    const-string v8, "Second Method"

    invoke-static {v8}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 1032
    sget-object v8, Lcom/stericson/RootTools/internal/InternalVariables;->space:[Ljava/lang/String;

    const/4 v9, 0x0

    aget-object v8, v8, v9

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    const/4 v9, 0x5

    if-gt v8, v9, :cond_71

    .line 1033
    const/4 v7, 0x2

    .line 1036
    :cond_71
    sget-object v0, Lcom/stericson/RootTools/internal/InternalVariables;->space:[Ljava/lang/String;

    array-length v5, v0

    const/4 v4, 0x0

    :goto_75
    if-ge v4, v5, :cond_a4

    aget-object v6, v0, v4

    .line 1038
    .restart local v6    # "spaceSearch":Ljava/lang/String;
    invoke-static {v6}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 1039
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_a1

    .line 1040
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "Valid"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 1041
    if-ne v2, v7, :cond_9f

    .line 1042
    invoke-virtual {p0, v6}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->getConvertedSpace(Ljava/lang/String;)J

    move-result-wide v8

    goto :goto_50

    .line 1044
    :cond_9f
    add-int/lit8 v2, v2, 0x1

    .line 1036
    :cond_a1
    add-int/lit8 v4, v4, 0x1

    goto :goto_75

    .line 1048
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "count":I
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    .end local v6    # "spaceSearch":Ljava/lang/String;
    .end local v7    # "targetCount":I
    :cond_a4
    const-string v8, "Returning -1, space could not be determined."

    invoke-static {v8}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 1049
    const-wide/16 v8, -0x1

    goto :goto_50

    .line 1011
    :catch_ac
    move-exception v8

    goto :goto_36
.end method

.method public getSymLinks()Ljava/util/ArrayList;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/stericson/RootTools/containers/Symlink;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    const/4 v4, 0x0

    .line 71
    .local v4, "lnr":Ljava/io/LineNumberReader;
    const/4 v1, 0x0

    .line 75
    .local v1, "fr":Ljava/io/FileReader;
    :try_start_2
    new-instance v2, Ljava/io/FileReader;

    const-string v7, "/data/local/symlinks.txt"

    invoke-direct {v2, v7}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V
    :try_end_9
    .catchall {:try_start_2 .. :try_end_9} :catchall_58

    .line 76
    .end local v1    # "fr":Ljava/io/FileReader;
    .local v2, "fr":Ljava/io/FileReader;
    :try_start_9
    new-instance v5, Ljava/io/LineNumberReader;

    invoke-direct {v5, v2}, Ljava/io/LineNumberReader;-><init>(Ljava/io/Reader;)V
    :try_end_e
    .catchall {:try_start_9 .. :try_end_e} :catchall_5a

    .line 79
    .end local v4    # "lnr":Ljava/io/LineNumberReader;
    .local v5, "lnr":Ljava/io/LineNumberReader;
    :try_start_e
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 81
    .local v6, "symlink":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/stericson/RootTools/containers/Symlink;>;"
    :goto_13
    invoke-virtual {v5}, Ljava/io/LineNumberReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .local v3, "line":Ljava/lang/String;
    if-eqz v3, :cond_49

    .line 83
    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 85
    const-string v7, " "

    invoke-virtual {v3, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 86
    .local v0, "fields":[Ljava/lang/String;
    new-instance v7, Lcom/stericson/RootTools/containers/Symlink;

    new-instance v8, Ljava/io/File;

    array-length v9, v0

    add-int/lit8 v9, v9, -0x3

    aget-object v9, v0, v9

    invoke-direct {v8, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v9, Ljava/io/File;

    array-length v10, v0

    add-int/lit8 v10, v10, -0x1

    aget-object v10, v0, v10

    invoke-direct {v9, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v7, v8, v9}, Lcom/stericson/RootTools/containers/Symlink;-><init>(Ljava/io/File;Ljava/io/File;)V

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_3e
    .catchall {:try_start_e .. :try_end_3e} :catchall_3f

    goto :goto_13

    .line 92
    .end local v0    # "fields":[Ljava/lang/String;
    .end local v3    # "line":Ljava/lang/String;
    .end local v6    # "symlink":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/stericson/RootTools/containers/Symlink;>;"
    :catchall_3f
    move-exception v7

    move-object v1, v2

    .end local v2    # "fr":Ljava/io/FileReader;
    .restart local v1    # "fr":Ljava/io/FileReader;
    move-object v4, v5

    .line 93
    .end local v5    # "lnr":Ljava/io/LineNumberReader;
    .restart local v4    # "lnr":Ljava/io/LineNumberReader;
    :goto_42
    :try_start_42
    invoke-virtual {v1}, Ljava/io/FileReader;->close()V
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_45} :catch_54

    .line 97
    :goto_45
    :try_start_45
    invoke-virtual {v4}, Ljava/io/LineNumberReader;->close()V
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_45 .. :try_end_48} :catch_56

    .line 98
    :goto_48
    throw v7

    .line 93
    .end local v1    # "fr":Ljava/io/FileReader;
    .end local v4    # "lnr":Ljava/io/LineNumberReader;
    .restart local v2    # "fr":Ljava/io/FileReader;
    .restart local v3    # "line":Ljava/lang/String;
    .restart local v5    # "lnr":Ljava/io/LineNumberReader;
    .restart local v6    # "symlink":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/stericson/RootTools/containers/Symlink;>;"
    :cond_49
    :try_start_49
    invoke-virtual {v2}, Ljava/io/FileReader;->close()V
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_49 .. :try_end_4c} :catch_50

    .line 97
    :goto_4c
    :try_start_4c
    invoke-virtual {v5}, Ljava/io/LineNumberReader;->close()V
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_4f} :catch_52

    .line 98
    :goto_4f
    return-object v6

    .line 94
    :catch_50
    move-exception v7

    goto :goto_4c

    .line 98
    :catch_52
    move-exception v7

    goto :goto_4f

    .line 94
    .end local v2    # "fr":Ljava/io/FileReader;
    .end local v3    # "line":Ljava/lang/String;
    .end local v5    # "lnr":Ljava/io/LineNumberReader;
    .end local v6    # "symlink":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/stericson/RootTools/containers/Symlink;>;"
    .restart local v1    # "fr":Ljava/io/FileReader;
    .restart local v4    # "lnr":Ljava/io/LineNumberReader;
    :catch_54
    move-exception v8

    goto :goto_45

    .line 98
    :catch_56
    move-exception v8

    goto :goto_48

    .line 92
    :catchall_58
    move-exception v7

    goto :goto_42

    .end local v1    # "fr":Ljava/io/FileReader;
    .restart local v2    # "fr":Ljava/io/FileReader;
    :catchall_5a
    move-exception v7

    move-object v1, v2

    .end local v2    # "fr":Ljava/io/FileReader;
    .restart local v1    # "fr":Ljava/io/FileReader;
    goto :goto_42
.end method

.method public getSymlink(Ljava/lang/String;)Ljava/lang/String;
    .registers 13
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    .line 1061
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Looking for Symlink for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 1064
    :try_start_16
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1066
    .local v5, "results":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$9;

    const/4 v2, 0x7

    const/4 v3, 0x0

    const/4 v1, 0x1

    new-array v4, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "ls -l "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v4, v1

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$9;-><init>(Lcom/stericson/RootTools/internal/RootToolsInternalMethods;IZ[Ljava/lang/String;Ljava/util/List;)V

    .line 1077
    .local v0, "command":Lcom/stericson/RootTools/execution/CommandCapture;
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 1078
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V

    .line 1080
    const/4 v1, 0x0

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 1081
    .local v8, "symlink":[Ljava/lang/String;
    array-length v1, v8

    const/4 v2, 0x2

    if-le v1, v2, :cond_d1

    array-length v1, v8

    add-int/lit8 v1, v1, -0x2

    aget-object v1, v8, v1

    const-string v2, "->"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d1

    .line 1082
    const-string v1, "Symlink found."

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 1086
    array-length v1, v8

    add-int/lit8 v1, v1, -0x1

    aget-object v1, v8, v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c3

    array-length v1, v8

    add-int/lit8 v1, v1, -0x1

    aget-object v1, v8, v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_c3

    .line 1088
    array-length v1, v8

    add-int/lit8 v1, v1, -0x1

    aget-object v1, v8, v1

    invoke-virtual {p0, v1}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->findBinary(Ljava/lang/String;)Z

    .line 1089
    sget-object v1, Lcom/stericson/RootTools/RootTools;->lastFoundBinaryPaths:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_bd

    .line 1091
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/stericson/RootTools/RootTools;->lastFoundBinaryPaths:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, v8

    add-int/lit8 v2, v2, -0x1

    aget-object v2, v8, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 1108
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .end local v5    # "results":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v8    # "symlink":[Ljava/lang/String;
    :goto_bc
    return-object v7

    .line 1094
    .restart local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v5    # "results":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v8    # "symlink":[Ljava/lang/String;
    :cond_bd
    array-length v1, v8

    add-int/lit8 v1, v1, -0x1

    aget-object v7, v8, v1

    .local v7, "final_symlink":Ljava/lang/String;
    goto :goto_bc

    .line 1097
    .end local v7    # "final_symlink":Ljava/lang/String;
    :cond_c3
    array-length v1, v8

    add-int/lit8 v1, v1, -0x1

    aget-object v7, v8, v1
    :try_end_c8
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_c8} :catch_c9

    .restart local v7    # "final_symlink":Ljava/lang/String;
    goto :goto_bc

    .line 1102
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .end local v5    # "results":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v7    # "final_symlink":Ljava/lang/String;
    .end local v8    # "symlink":[Ljava/lang/String;
    :catch_c9
    move-exception v6

    .line 1103
    .local v6, "e":Ljava/lang/Exception;
    sget-boolean v1, Lcom/stericson/RootTools/RootTools;->debugMode:Z

    if-eqz v1, :cond_d1

    .line 1104
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .line 1107
    .end local v6    # "e":Ljava/lang/Exception;
    :cond_d1
    const-string v1, "Symlink not found"

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 1108
    const-string v7, ""

    goto :goto_bc
.end method

.method public getSymlinks(Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 7
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/stericson/RootTools/containers/Symlink;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1124
    const-string v1, "find"

    invoke-virtual {p0, v1}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->checkUtil(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_10

    .line 1125
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1}, Ljava/lang/Exception;-><init>()V

    throw v1

    .line 1128
    :cond_10
    new-instance v0, Lcom/stericson/RootTools/execution/CommandCapture;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "dd if=/dev/zero of=/data/local/symlinks.txt bs=1024 count=1"

    aput-object v2, v1, v4

    const-string v2, "chmod 0777 /data/local/symlinks.txt"

    aput-object v2, v1, v3

    invoke-direct {v0, v4, v4, v1}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V

    .line 1129
    .local v0, "command":Lcom/stericson/RootTools/execution/CommandCapture;
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 1130
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V

    .line 1132
    new-instance v0, Lcom/stericson/RootTools/execution/CommandCapture;

    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    new-array v1, v3, [Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "find "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " -type l -exec ls -l {} \\; > /data/local/symlinks.txt"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-direct {v0, v4, v4, v1}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V

    .line 1133
    .restart local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 1134
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V

    .line 1136
    invoke-virtual {p0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->getSymLinks()Ljava/util/ArrayList;

    move-result-object v1

    sput-object v1, Lcom/stericson/RootTools/internal/InternalVariables;->symlinks:Ljava/util/ArrayList;

    .line 1137
    sget-object v1, Lcom/stericson/RootTools/internal/InternalVariables;->symlinks:Ljava/util/ArrayList;

    if-eqz v1, :cond_6b

    .line 1138
    sget-object v1, Lcom/stericson/RootTools/internal/InternalVariables;->symlinks:Ljava/util/ArrayList;

    return-object v1

    .line 1140
    :cond_6b
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1}, Ljava/lang/Exception;-><init>()V

    throw v1
.end method

.method public getWorkingToolbox()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1152
    const-string v0, "busybox"

    invoke-static {v0}, Lcom/stericson/RootTools/RootTools;->checkUtil(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 1153
    const-string v0, "busybox"

    .line 1157
    :goto_a
    return-object v0

    .line 1154
    :cond_b
    const-string v0, "toolbox"

    invoke-static {v0}, Lcom/stericson/RootTools/RootTools;->checkUtil(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 1155
    const-string v0, "toolbox"

    goto :goto_a

    .line 1157
    :cond_16
    const-string v0, ""

    goto :goto_a
.end method

.method public hasEnoughSpaceOnSdCard(J)Z
    .registers 13
    .param p1, "updateSize"    # J

    .prologue
    const/4 v7, 0x0

    .line 1170
    const-string v8, "Checking SDcard size and that it is mounted as RW"

    invoke-static {v8}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 1171
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v6

    .line 1172
    .local v6, "status":Ljava/lang/String;
    const-string v8, "mounted"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_13

    .line 1179
    :cond_12
    :goto_12
    return v7

    .line 1175
    :cond_13
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    .line 1176
    .local v4, "path":Ljava/io/File;
    new-instance v5, Landroid/os/StatFs;

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v5, v8}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 1177
    .local v5, "stat":Landroid/os/StatFs;
    invoke-virtual {v5}, Landroid/os/StatFs;->getBlockSize()I

    move-result v8

    int-to-long v2, v8

    .line 1178
    .local v2, "blockSize":J
    invoke-virtual {v5}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v8

    int-to-long v0, v8

    .line 1179
    .local v0, "availableBlocks":J
    mul-long v8, v0, v2

    cmp-long v8, p1, v8

    if-gez v8, :cond_12

    const/4 v7, 0x1

    goto :goto_12
.end method

.method public hasUtil(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 13
    .param p1, "util"    # Ljava/lang/String;
    .param p2, "box"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 1191
    sput-boolean v8, Lcom/stericson/RootTools/internal/InternalVariables;->found:Z

    .line 1194
    const-string v1, "toolbox"

    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_16

    const-string v1, "busybox"

    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_16

    move v1, v8

    .line 1229
    :goto_15
    return v1

    .line 1200
    :cond_16
    :try_start_16
    new-instance v0, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$10;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v1, 0x1

    new-array v4, v1, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v1, "toolbox"

    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_77

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v6, " "

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_3d
    aput-object v1, v4, v5

    move-object v1, p0

    move-object v5, p2

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$10;-><init>(Lcom/stericson/RootTools/internal/RootToolsInternalMethods;IZ[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1217
    .local v0, "command":Lcom/stericson/RootTools/execution/CommandCapture;
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->getShell(Z)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 1218
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->getShell(Z)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V

    .line 1220
    sget-boolean v1, Lcom/stericson/RootTools/internal/InternalVariables;->found:Z

    if-eqz v1, :cond_8b

    .line 1221
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Box contains "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " util!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    move v1, v9

    .line 1222
    goto :goto_15

    .line 1200
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :cond_77
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v6, " --list"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_3d

    .line 1224
    .restart local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :cond_8b
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Box does not contain "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " util!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V
    :try_end_a7
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_a7} :catch_aa

    move v1, v8

    .line 1225
    goto/16 :goto_15

    .line 1227
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :catch_aa
    move-exception v7

    .line 1228
    .local v7, "e":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    move v1, v8

    .line 1229
    goto/16 :goto_15
.end method

.method public installBinary(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;)Z
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "sourceId"    # I
    .param p3, "destName"    # Ljava/lang/String;
    .param p4, "mode"    # Ljava/lang/String;

    .prologue
    .line 1249
    :try_start_0
    new-instance v1, Lcom/stericson/RootTools/internal/Installer;

    invoke-direct {v1, p1}, Lcom/stericson/RootTools/internal/Installer;-><init>(Landroid/content/Context;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_a

    .line 1257
    .local v1, "installer":Lcom/stericson/RootTools/internal/Installer;
    invoke-virtual {v1, p2, p3, p4}, Lcom/stericson/RootTools/internal/Installer;->installBinary(ILjava/lang/String;Ljava/lang/String;)Z

    move-result v2

    .end local v1    # "installer":Lcom/stericson/RootTools/internal/Installer;
    :goto_9
    return v2

    .line 1250
    :catch_a
    move-exception v0

    .line 1251
    .local v0, "ex":Ljava/io/IOException;
    sget-boolean v2, Lcom/stericson/RootTools/RootTools;->debugMode:Z

    if-eqz v2, :cond_12

    .line 1252
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 1254
    :cond_12
    const/4 v2, 0x0

    goto :goto_9
.end method

.method public isAccessGiven()Z
    .registers 9

    .prologue
    const/4 v2, 0x0

    .line 770
    :try_start_1
    const-string v3, "Checking for Root access"

    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 771
    const/4 v3, 0x0

    sput-boolean v3, Lcom/stericson/RootTools/internal/InternalVariables;->accessGiven:Z

    .line 773
    new-instance v0, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$6;

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "id"

    aput-object v7, v5, v6

    invoke-direct {v0, p0, v3, v4, v5}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$6;-><init>(Lcom/stericson/RootTools/internal/RootToolsInternalMethods;IZ[Ljava/lang/String;)V

    .line 793
    .local v0, "command":Lcom/stericson/RootTools/execution/CommandCapture;
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 794
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v3

    invoke-direct {p0, v3, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V

    .line 796
    sget-boolean v2, Lcom/stericson/RootTools/internal/InternalVariables;->accessGiven:Z
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_28} :catch_29

    .line 800
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :goto_28
    return v2

    .line 798
    :catch_29
    move-exception v1

    .line 799
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_28
.end method

.method public isAppletAvailable(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 8
    .param p1, "applet"    # Ljava/lang/String;
    .param p2, "binaryPath"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 1292
    :try_start_1
    invoke-virtual {p0, p2}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->getBusyBoxApplets(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1293
    .local v0, "aplet":Ljava/lang/String;
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_18} :catch_1d

    move-result v4

    if-eqz v4, :cond_9

    .line 1294
    const/4 v3, 0x1

    .line 1300
    .end local v0    # "aplet":Ljava/lang/String;
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_1c
    :goto_1c
    return v3

    .line 1298
    :catch_1d
    move-exception v1

    .line 1299
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    goto :goto_1c
.end method

.method public isBinaryAvailable(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "binaryName"    # Ljava/lang/String;

    .prologue
    .line 1272
    :try_start_0
    new-instance v1, Lcom/stericson/RootTools/internal/Installer;

    invoke-direct {v1, p1}, Lcom/stericson/RootTools/internal/Installer;-><init>(Landroid/content/Context;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_a

    .line 1280
    .local v1, "installer":Lcom/stericson/RootTools/internal/Installer;
    invoke-virtual {v1, p2}, Lcom/stericson/RootTools/internal/Installer;->isBinaryInstalled(Ljava/lang/String;)Z

    move-result v2

    .end local v1    # "installer":Lcom/stericson/RootTools/internal/Installer;
    :goto_9
    return v2

    .line 1273
    :catch_a
    move-exception v0

    .line 1274
    .local v0, "ex":Ljava/io/IOException;
    sget-boolean v2, Lcom/stericson/RootTools/RootTools;->debugMode:Z

    if-eqz v2, :cond_12

    .line 1275
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 1277
    :cond_12
    const/4 v2, 0x0

    goto :goto_9
.end method

.method public isNativeToolsReady(ILandroid/content/Context;)Z
    .registers 7
    .param p1, "nativeToolsId"    # I
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 805
    const-string v3, "Preparing Native Tools"

    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 806
    sput-boolean v2, Lcom/stericson/RootTools/internal/InternalVariables;->nativeToolsReady:Z

    .line 810
    :try_start_8
    new-instance v1, Lcom/stericson/RootTools/internal/Installer;

    invoke-direct {v1, p2}, Lcom/stericson/RootTools/internal/Installer;-><init>(Landroid/content/Context;)V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_d} :catch_1b

    .line 818
    .local v1, "installer":Lcom/stericson/RootTools/internal/Installer;
    const-string v2, "nativetools"

    invoke-virtual {v1, v2}, Lcom/stericson/RootTools/internal/Installer;->isBinaryInstalled(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_24

    .line 819
    const/4 v2, 0x1

    sput-boolean v2, Lcom/stericson/RootTools/internal/InternalVariables;->nativeToolsReady:Z

    .line 824
    :goto_18
    sget-boolean v2, Lcom/stericson/RootTools/internal/InternalVariables;->nativeToolsReady:Z

    .end local v1    # "installer":Lcom/stericson/RootTools/internal/Installer;
    :cond_1a
    :goto_1a
    return v2

    .line 811
    :catch_1b
    move-exception v0

    .line 812
    .local v0, "ex":Ljava/io/IOException;
    sget-boolean v3, Lcom/stericson/RootTools/RootTools;->debugMode:Z

    if-eqz v3, :cond_1a

    .line 813
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1a

    .line 821
    .end local v0    # "ex":Ljava/io/IOException;
    .restart local v1    # "installer":Lcom/stericson/RootTools/internal/Installer;
    :cond_24
    const-string v2, "nativetools"

    const-string v3, "700"

    invoke-virtual {v1, p1, v2, v3}, Lcom/stericson/RootTools/internal/Installer;->installBinary(ILjava/lang/String;Ljava/lang/String;)Z

    move-result v2

    sput-boolean v2, Lcom/stericson/RootTools/internal/InternalVariables;->nativeToolsReady:Z

    goto :goto_18
.end method

.method public isProcessRunning(Ljava/lang/String;)Z
    .registers 9
    .param p1, "processName"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 1313
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Checks if process is running: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 1315
    sput-boolean v3, Lcom/stericson/RootTools/internal/InternalVariables;->processRunning:Z

    .line 1318
    :try_start_19
    new-instance v0, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$11;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v1, 0x1

    new-array v4, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v5, "ps"

    aput-object v5, v4, v1

    move-object v1, p0

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$11;-><init>(Lcom/stericson/RootTools/internal/RootToolsInternalMethods;IZ[Ljava/lang/String;Ljava/lang/String;)V

    .line 1326
    .local v0, "command":Lcom/stericson/RootTools/execution/CommandCapture;
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->getShell(Z)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 1327
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->getShell(Z)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_3a} :catch_3d

    .line 1333
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :goto_3a
    sget-boolean v1, Lcom/stericson/RootTools/internal/InternalVariables;->processRunning:Z

    return v1

    .line 1329
    :catch_3d
    move-exception v6

    .line 1330
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    goto :goto_3a
.end method

.method public killProcess(Ljava/lang/String;)Z
    .registers 14
    .param p1, "processName"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 1343
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Killing process "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 1345
    const-string v1, ""

    sput-object v1, Lcom/stericson/RootTools/internal/InternalVariables;->pid_list:Ljava/lang/String;

    .line 1348
    sput-boolean v9, Lcom/stericson/RootTools/internal/InternalVariables;->processRunning:Z

    .line 1352
    :try_start_1e
    new-instance v0, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$12;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v1, 0x1

    new-array v4, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v5, "ps"

    aput-object v5, v4, v1

    move-object v1, p0

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$12;-><init>(Lcom/stericson/RootTools/internal/RootToolsInternalMethods;IZ[Ljava/lang/String;Ljava/lang/String;)V

    .line 1376
    .local v0, "command":Lcom/stericson/RootTools/execution/CommandCapture;
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->getShell(Z)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 1377
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->getShell(Z)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V

    .line 1380
    sget-object v8, Lcom/stericson/RootTools/internal/InternalVariables;->pid_list:Ljava/lang/String;

    .line 1383
    .local v8, "pids":Ljava/lang/String;
    const-string v1, ""

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_46} :catch_87

    move-result v1

    if-nez v1, :cond_85

    .line 1386
    :try_start_49
    new-instance v6, Lcom/stericson/RootTools/execution/CommandCapture;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "kill -9 "

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {v6, v1, v2, v3}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V
    :try_end_69
    .catch Ljava/lang/Exception; {:try_start_49 .. :try_end_69} :catch_7b

    .line 1387
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .local v6, "command":Lcom/stericson/RootTools/execution/CommandCapture;
    const/4 v1, 0x1

    :try_start_6a
    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->getShell(Z)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-virtual {v1, v6}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 1388
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->getShell(Z)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v1

    invoke-direct {p0, v1, v6}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->commandWait(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V
    :try_end_79
    .catch Ljava/lang/Exception; {:try_start_6a .. :try_end_79} :catch_90

    move v1, v9

    .line 1402
    .end local v6    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .end local v8    # "pids":Ljava/lang/String;
    :goto_7a
    return v1

    .line 1391
    .restart local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v8    # "pids":Ljava/lang/String;
    :catch_7b
    move-exception v7

    .line 1392
    .local v7, "e":Ljava/lang/Exception;
    :goto_7c
    :try_start_7c
    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V
    :try_end_83
    .catch Ljava/lang/Exception; {:try_start_7c .. :try_end_83} :catch_87

    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .end local v8    # "pids":Ljava/lang/String;
    :goto_83
    move v1, v10

    .line 1402
    goto :goto_7a

    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v8    # "pids":Ljava/lang/String;
    :cond_85
    move v1, v9

    .line 1396
    goto :goto_7a

    .line 1398
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .end local v8    # "pids":Ljava/lang/String;
    :catch_87
    move-exception v7

    .line 1399
    .restart local v7    # "e":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    goto :goto_83

    .line 1391
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v6    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v8    # "pids":Ljava/lang/String;
    :catch_90
    move-exception v7

    move-object v0, v6

    .end local v6    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .restart local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    goto :goto_7c
.end method

.method public offerBusyBox(Landroid/app/Activity;I)Landroid/content/Intent;
    .registers 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "requestCode"    # I

    .prologue
    .line 1426
    const-string v1, "Launching Market for BusyBox"

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 1427
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    const-string v2, "market://details?id=stericson.busybox"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1429
    .local v0, "i":Landroid/content/Intent;
    invoke-virtual {p1, v0, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1430
    return-object v0
.end method

.method public offerBusyBox(Landroid/app/Activity;)V
    .registers 5
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 1411
    const-string v1, "Launching Market for BusyBox"

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 1412
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    const-string v2, "market://details?id=stericson.busybox"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1414
    .local v0, "i":Landroid/content/Intent;
    invoke-virtual {p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 1415
    return-void
.end method

.method public offerSuperUser(Landroid/app/Activity;I)Landroid/content/Intent;
    .registers 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "requestCode"    # I

    .prologue
    .line 1454
    const-string v1, "Launching Market for SuperUser"

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 1455
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    const-string v2, "market://details?id=com.noshufou.android.su"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1457
    .local v0, "i":Landroid/content/Intent;
    invoke-virtual {p1, v0, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1458
    return-object v0
.end method

.method public offerSuperUser(Landroid/app/Activity;)V
    .registers 5
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 1439
    const-string v1, "Launching Market for SuperUser"

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 1440
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    const-string v2, "market://details?id=com.noshufou.android.su"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1442
    .local v0, "i":Landroid/content/Intent;
    invoke-virtual {p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 1443
    return-void
.end method

.method public parsePermissions(Ljava/lang/String;)I
    .registers 8
    .param p1, "permission"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 149
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x72

    if-ne v1, v2, :cond_b1

    .line 150
    const/4 v0, 0x4

    .line 154
    .local v0, "tmp":I
    :goto_c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "permission "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 155
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "character "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 157
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x77

    if-ne v1, v2, :cond_b4

    .line 158
    add-int/lit8 v0, v0, 0x2

    .line 162
    :goto_46
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "permission "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 163
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "character "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 165
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x78

    if-ne v1, v2, :cond_b7

    .line 166
    add-int/lit8 v0, v0, 0x1

    .line 170
    :goto_80
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "permission "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 171
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "character "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 173
    return v0

    .line 152
    .end local v0    # "tmp":I
    :cond_b1
    const/4 v0, 0x0

    .restart local v0    # "tmp":I
    goto/16 :goto_c

    .line 160
    :cond_b4
    add-int/lit8 v0, v0, 0x0

    goto :goto_46

    .line 168
    :cond_b7
    add-int/lit8 v0, v0, 0x0

    goto :goto_80
.end method

.method public parseSpecialPermissions(Ljava/lang/String;)I
    .registers 5
    .param p1, "permission"    # Ljava/lang/String;

    .prologue
    const/16 v2, 0x73

    .line 177
    const/4 v0, 0x0

    .line 178
    .local v0, "tmp":I
    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v1, v2, :cond_c

    .line 179
    add-int/lit8 v0, v0, 0x4

    .line 181
    :cond_c
    const/4 v1, 0x5

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v1, v2, :cond_15

    .line 182
    add-int/lit8 v0, v0, 0x2

    .line 184
    :cond_15
    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x74

    if-ne v1, v2, :cond_21

    .line 185
    add-int/lit8 v0, v0, 0x1

    .line 187
    :cond_21
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "special permissions "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 189
    return v0
.end method
