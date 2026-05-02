.class public Lcom/stericson/RootTools/internal/Remounter;
.super Ljava/lang/Object;
.source "Remounter.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private commandWait(Lcom/stericson/RootTools/execution/Command;)V
    .registers 5
    .param p1, "cmd"    # Lcom/stericson/RootTools/execution/Command;

    .prologue
    .line 167
    monitor-enter p1

    .line 169
    :try_start_1
    invoke-virtual {p1}, Lcom/stericson/RootTools/execution/Command;->isFinished()Z

    move-result v1

    if-nez v1, :cond_c

    .line 170
    const-wide/16 v1, 0x7d0

    invoke-virtual {p1, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_c
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_c} :catch_e
    .catchall {:try_start_1 .. :try_end_c} :catchall_13

    .line 175
    :cond_c
    :goto_c
    :try_start_c
    monitor-exit p1

    .line 176
    return-void

    .line 172
    :catch_e
    move-exception v0

    .line 173
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_c

    .line 175
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_13
    move-exception v1

    monitor-exit p1
    :try_end_15
    .catchall {:try_start_c .. :try_end_15} :catchall_13

    throw v1
.end method

.method private findMountPointRecursive(Ljava/lang/String;)Lcom/stericson/RootTools/containers/Mount;
    .registers 9
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 141
    :try_start_1
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getMounts()Ljava/util/ArrayList;

    move-result-object v3

    .line 143
    .local v3, "mounts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/stericson/RootTools/containers/Mount;>;"
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v4, "path":Ljava/io/File;
    :cond_a
    if-eqz v4, :cond_27

    .line 144
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/stericson/RootTools/containers/Mount;

    .line 145
    .local v2, "mount":Lcom/stericson/RootTools/containers/Mount;
    invoke-virtual {v2}, Lcom/stericson/RootTools/containers/Mount;->getMountPoint()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/io/File;->equals(Ljava/lang/Object;)Z
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_23} :catch_29
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_23} :catch_33

    move-result v6

    if-eqz v6, :cond_10

    .line 163
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "mount":Lcom/stericson/RootTools/containers/Mount;
    .end local v3    # "mounts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/stericson/RootTools/containers/Mount;>;"
    .end local v4    # "path":Ljava/io/File;
    :goto_26
    return-object v2

    .restart local v3    # "mounts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/stericson/RootTools/containers/Mount;>;"
    .restart local v4    # "path":Ljava/io/File;
    :cond_27
    move-object v2, v5

    .line 151
    goto :goto_26

    .line 153
    .end local v3    # "mounts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/stericson/RootTools/containers/Mount;>;"
    .end local v4    # "path":Ljava/io/File;
    :catch_29
    move-exception v0

    .line 154
    .local v0, "e":Ljava/io/IOException;
    sget-boolean v6, Lcom/stericson/RootTools/RootTools;->debugMode:Z

    if-eqz v6, :cond_31

    .line 155
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .end local v0    # "e":Ljava/io/IOException;
    :cond_31
    :goto_31
    move-object v2, v5

    .line 163
    goto :goto_26

    .line 157
    :catch_33
    move-exception v0

    .line 158
    .local v0, "e":Ljava/lang/Exception;
    sget-boolean v6, Lcom/stericson/RootTools/RootTools;->debugMode:Z

    if-eqz v6, :cond_31

    .line 159
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_31
.end method


# virtual methods
.method public remount(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 16
    .param p1, "file"    # Ljava/lang/String;
    .param p2, "mountType"    # Ljava/lang/String;

    .prologue
    .line 61
    const-string v7, "/"

    invoke-virtual {p1, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1b

    const-string v7, "/"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1b

    .line 62
    const/4 v7, 0x0

    const-string v8, "/"

    invoke-virtual {p1, v8}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {p1, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 65
    :cond_1b
    const/4 v2, 0x0

    .line 67
    .local v2, "foundMount":Z
    :cond_1c
    :goto_1c
    if-nez v2, :cond_68

    .line 69
    :try_start_1e
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getMounts()Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_26
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/stericson/RootTools/containers/Mount;

    .line 70
    .local v5, "mount":Lcom/stericson/RootTools/containers/Mount;
    invoke-virtual {v5}, Lcom/stericson/RootTools/containers/Mount;->getMountPoint()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 72
    invoke-virtual {v5}, Lcom/stericson/RootTools/containers/Mount;->getMountPoint()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_48} :catch_58

    move-result v7

    if-eqz v7, :cond_26

    .line 73
    const/4 v2, 0x1

    .line 83
    .end local v5    # "mount":Lcom/stericson/RootTools/containers/Mount;
    :cond_4c
    if-nez v2, :cond_1c

    .line 85
    :try_start_4e
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->getParent()Ljava/lang/String;
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_4e .. :try_end_56} :catch_62

    move-result-object p1

    goto :goto_1c

    .line 77
    .end local v3    # "i$":Ljava/util/Iterator;
    :catch_58
    move-exception v1

    .line 78
    .local v1, "e":Ljava/lang/Exception;
    sget-boolean v7, Lcom/stericson/RootTools/RootTools;->debugMode:Z

    if-eqz v7, :cond_60

    .line 79
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 81
    :cond_60
    const/4 v7, 0x0

    .line 136
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_61
    return v7

    .line 86
    .restart local v3    # "i$":Ljava/util/Iterator;
    :catch_62
    move-exception v1

    .line 87
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 88
    const/4 v7, 0x0

    goto :goto_61

    .line 93
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_68
    invoke-direct {p0, p1}, Lcom/stericson/RootTools/internal/Remounter;->findMountPointRecursive(Ljava/lang/String;)Lcom/stericson/RootTools/containers/Mount;

    move-result-object v6

    .line 95
    .local v6, "mountPoint":Lcom/stericson/RootTools/containers/Mount;
    if-eqz v6, :cond_22d

    .line 97
    const-string v7, "RootTools v3.5"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Remounting "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v6}, Lcom/stericson/RootTools/containers/Mount;->getMountPoint()Ljava/io/File;

    move-result-object v9

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " as "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    invoke-virtual {v6}, Lcom/stericson/RootTools/containers/Mount;->getFlags()Ljava/util/Set;

    move-result-object v7

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    .line 100
    .local v4, "isMountMode":Z
    if-nez v4, :cond_1ba

    .line 103
    :try_start_aa
    new-instance v0, Lcom/stericson/RootTools/execution/CommandCapture;

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "busybox mount -o remount,"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v6}, Lcom/stericson/RootTools/containers/Mount;->getDevice()Ljava/io/File;

    move-result-object v12

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v6}, Lcom/stericson/RootTools/containers/Mount;->getMountPoint()Ljava/io/File;

    move-result-object v12

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "toolbox mount -o remount,"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v6}, Lcom/stericson/RootTools/containers/Mount;->getDevice()Ljava/io/File;

    move-result-object v12

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v6}, Lcom/stericson/RootTools/containers/Mount;->getMountPoint()Ljava/io/File;

    move-result-object v12

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x2

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "mount -o remount,"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v6}, Lcom/stericson/RootTools/containers/Mount;->getDevice()Ljava/io/File;

    move-result-object v12

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v6}, Lcom/stericson/RootTools/containers/Mount;->getMountPoint()Ljava/io/File;

    move-result-object v12

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x3

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "/system/bin/toolbox mount -o remount,"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v6}, Lcom/stericson/RootTools/containers/Mount;->getDevice()Ljava/io/File;

    move-result-object v12

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v6}, Lcom/stericson/RootTools/containers/Mount;->getMountPoint()Ljava/io/File;

    move-result-object v12

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-direct {v0, v7, v8, v9}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V

    .line 110
    .local v0, "command":Lcom/stericson/RootTools/execution/CommandCapture;
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v7

    invoke-virtual {v7, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 111
    invoke-direct {p0, v0}, Lcom/stericson/RootTools/internal/Remounter;->commandWait(Lcom/stericson/RootTools/execution/Command;)V
    :try_end_1b6
    .catch Ljava/lang/Exception; {:try_start_aa .. :try_end_1b6} :catch_24e

    .line 115
    .end local v0    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    :goto_1b6
    invoke-direct {p0, p1}, Lcom/stericson/RootTools/internal/Remounter;->findMountPointRecursive(Ljava/lang/String;)Lcom/stericson/RootTools/containers/Mount;

    move-result-object v6

    .line 118
    :cond_1ba
    if-eqz v6, :cond_20a

    .line 119
    const-string v7, "RootTools v3.5"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Lcom/stericson/RootTools/containers/Mount;->getFlags()Ljava/util/Set;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " AND "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    invoke-virtual {v6}, Lcom/stericson/RootTools/containers/Mount;->getFlags()Ljava/util/Set;

    move-result-object v7

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1fc

    .line 121
    invoke-virtual {v6}, Lcom/stericson/RootTools/containers/Mount;->getFlags()Ljava/util/Set;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 122
    const/4 v7, 0x1

    goto/16 :goto_61

    .line 124
    :cond_1fc
    invoke-virtual {v6}, Lcom/stericson/RootTools/containers/Mount;->getFlags()Ljava/util/Set;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 125
    const/4 v7, 0x0

    goto/16 :goto_61

    .line 129
    :cond_20a
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mount is null, file was: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " mountType was: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 136
    .end local v4    # "isMountMode":Z
    :goto_22a
    const/4 v7, 0x0

    goto/16 :goto_61

    .line 133
    :cond_22d
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mount is null, file was: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " mountType was: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    goto :goto_22a

    .line 113
    .restart local v4    # "isMountMode":Z
    :catch_24e
    move-exception v7

    goto/16 :goto_1b6
.end method
