.class public final Lcom/stericson/RootTools/RootTools;
.super Ljava/lang/Object;
.source "RootTools.java"


# static fields
.field public static debugMode:Z

.field public static default_Command_Timeout:I

.field public static handlerEnabled:Z

.field public static lastFoundBinaryPaths:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static rim:Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

.field public static utilPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 61
    const/4 v0, 0x0

    sput-object v0, Lcom/stericson/RootTools/RootTools;->rim:Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    .line 80
    const/4 v0, 0x0

    sput-boolean v0, Lcom/stericson/RootTools/RootTools;->debugMode:Z

    .line 81
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/stericson/RootTools/RootTools;->lastFoundBinaryPaths:Ljava/util/List;

    .line 91
    const/4 v0, 0x1

    sput-boolean v0, Lcom/stericson/RootTools/RootTools;->handlerEnabled:Z

    .line 99
    const/16 v0, 0x4e20

    sput v0, Lcom/stericson/RootTools/RootTools;->default_Command_Timeout:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkUtil(Ljava/lang/String;)Z
    .registers 2
    .param p0, "util"    # Ljava/lang/String;

    .prologue
    .line 119
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->checkUtil(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static closeAllShells()V
    .registers 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->closeAll()V

    .line 129
    return-void
.end method

.method public static closeCustomShell()V
    .registers 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 137
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->closeCustomShell()V

    .line 138
    return-void
.end method

.method public static closeShell(Z)V
    .registers 1
    .param p0, "root"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    if-eqz p0, :cond_6

    .line 148
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->closeRootShell()V

    .line 151
    :goto_5
    return-void

    .line 150
    :cond_6
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->closeShell()V

    goto :goto_5
.end method

.method public static copyFile(Ljava/lang/String;Ljava/lang/String;ZZ)Z
    .registers 5
    .param p0, "source"    # Ljava/lang/String;
    .param p1, "destination"    # Ljava/lang/String;
    .param p2, "remountAsRw"    # Z
    .param p3, "preserveFileAttributes"    # Z

    .prologue
    .line 166
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->copyFile(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v0

    return v0
.end method

.method public static deleteFileOrDirectory(Ljava/lang/String;Z)Z
    .registers 3
    .param p0, "target"    # Ljava/lang/String;
    .param p1, "remountAsRw"    # Z

    .prologue
    .line 177
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->deleteFileOrDirectory(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static exists(Ljava/lang/String;)Z
    .registers 2
    .param p0, "file"    # Ljava/lang/String;

    .prologue
    .line 188
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/stericson/RootTools/RootTools;->exists(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static exists(Ljava/lang/String;Z)Z
    .registers 3
    .param p0, "file"    # Ljava/lang/String;
    .param p1, "isDir"    # Z

    .prologue
    .line 202
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->exists(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static findBinary(Ljava/lang/String;)Z
    .registers 2
    .param p0, "binaryName"    # Ljava/lang/String;

    .prologue
    .line 241
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->findBinary(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static fixUtil(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p0, "util"    # Ljava/lang/String;
    .param p1, "utilPath"    # Ljava/lang/String;

    .prologue
    .line 216
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->fixUtil(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    return-void
.end method

.method public static fixUtils([Ljava/lang/String;)Z
    .registers 2
    .param p0, "utils"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 231
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->fixUtils([Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static getBusyBoxApplets()Ljava/util/List;
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 266
    const-string v0, ""

    invoke-static {v0}, Lcom/stericson/RootTools/RootTools;->getBusyBoxApplets(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static getBusyBoxApplets(Ljava/lang/String;)Ljava/util/List;
    .registers 2
    .param p0, "path"    # Ljava/lang/String;
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
    .line 277
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->getBusyBoxApplets(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static getBusyBoxVersion()Ljava/lang/String;
    .registers 1

    .prologue
    .line 256
    const-string v0, ""

    invoke-static {v0}, Lcom/stericson/RootTools/RootTools;->getBusyBoxVersion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getBusyBoxVersion(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 249
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->getBusyBoxVersion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCustomShell(Ljava/lang/String;)Lcom/stericson/RootTools/execution/Shell;
    .registers 2
    .param p0, "shellPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootTools/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 304
    const/16 v0, 0x2710

    invoke-static {p0, v0}, Lcom/stericson/RootTools/RootTools;->getCustomShell(Ljava/lang/String;I)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v0

    return-object v0
.end method

.method public static getCustomShell(Ljava/lang/String;I)Lcom/stericson/RootTools/execution/Shell;
    .registers 3
    .param p0, "shellPath"    # Ljava/lang/String;
    .param p1, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootTools/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 291
    invoke-static {p0, p1}, Lcom/stericson/RootTools/execution/Shell;->startCustomShell(Ljava/lang/String;I)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v0

    return-object v0
.end method

.method public static getFilePermissionsSymlinks(Ljava/lang/String;)Lcom/stericson/RootTools/containers/Permissions;
    .registers 2
    .param p0, "file"    # Ljava/lang/String;

    .prologue
    .line 314
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->getFilePermissionsSymlinks(Ljava/lang/String;)Lcom/stericson/RootTools/containers/Permissions;

    move-result-object v0

    return-object v0
.end method

.method public static getInode(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "file"    # Ljava/lang/String;

    .prologue
    .line 325
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->getInode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static final getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;
    .registers 1

    .prologue
    .line 68
    sget-object v0, Lcom/stericson/RootTools/RootTools;->rim:Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    if-nez v0, :cond_a

    .line 69
    invoke-static {}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->getInstance()V

    .line 70
    sget-object v0, Lcom/stericson/RootTools/RootTools;->rim:Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    .line 72
    :goto_9
    return-object v0

    :cond_a
    sget-object v0, Lcom/stericson/RootTools/RootTools;->rim:Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    goto :goto_9
.end method

.method public static getMountedAs(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 350
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->getMountedAs(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMounts()Ljava/util/ArrayList;
    .registers 1
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
    .line 338
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->getMounts()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public static getPath()Ljava/util/List;
    .registers 2
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
    .line 359
    const-string v0, "PATH"

    invoke-static {v0}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static getShell(Z)Lcom/stericson/RootTools/execution/Shell;
    .registers 2
    .param p0, "root"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootTools/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 434
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/stericson/RootTools/RootTools;->getShell(ZI)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v0

    return-object v0
.end method

.method public static getShell(ZI)Lcom/stericson/RootTools/execution/Shell;
    .registers 4
    .param p0, "root"    # Z
    .param p1, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootTools/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 421
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->defaultContext:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    const/4 v1, 0x3

    invoke-static {p0, p1, v0, v1}, Lcom/stericson/RootTools/RootTools;->getShell(ZILcom/stericson/RootTools/execution/Shell$ShellContext;I)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v0

    return-object v0
.end method

.method public static getShell(ZILcom/stericson/RootTools/execution/Shell$ShellContext;)Lcom/stericson/RootTools/execution/Shell;
    .registers 4
    .param p0, "root"    # Z
    .param p1, "timeout"    # I
    .param p2, "shellContext"    # Lcom/stericson/RootTools/execution/Shell$ShellContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootTools/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 393
    const/4 v0, 0x3

    invoke-static {p0, p1, p2, v0}, Lcom/stericson/RootTools/RootTools;->getShell(ZILcom/stericson/RootTools/execution/Shell$ShellContext;I)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v0

    return-object v0
.end method

.method public static getShell(ZILcom/stericson/RootTools/execution/Shell$ShellContext;I)Lcom/stericson/RootTools/execution/Shell;
    .registers 5
    .param p0, "root"    # Z
    .param p1, "timeout"    # I
    .param p2, "shellContext"    # Lcom/stericson/RootTools/execution/Shell$ShellContext;
    .param p3, "retry"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootTools/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 375
    if-eqz p0, :cond_7

    .line 376
    invoke-static {p1, p2, p3}, Lcom/stericson/RootTools/execution/Shell;->startRootShell(ILcom/stericson/RootTools/execution/Shell$ShellContext;I)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v0

    .line 378
    :goto_6
    return-object v0

    :cond_7
    invoke-static {p1}, Lcom/stericson/RootTools/execution/Shell;->startShell(I)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v0

    goto :goto_6
.end method

.method public static getShell(ZLcom/stericson/RootTools/execution/Shell$ShellContext;)Lcom/stericson/RootTools/execution/Shell;
    .registers 5
    .param p0, "root"    # Z
    .param p1, "shellContext"    # Lcom/stericson/RootTools/execution/Shell$ShellContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootTools/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 407
    const/4 v0, 0x0

    sget-object v1, Lcom/stericson/RootTools/execution/Shell;->defaultContext:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    const/4 v2, 0x3

    invoke-static {p0, v0, v1, v2}, Lcom/stericson/RootTools/RootTools;->getShell(ZILcom/stericson/RootTools/execution/Shell$ShellContext;I)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v0

    return-object v0
.end method

.method public static getSpace(Ljava/lang/String;)J
    .registers 3
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 446
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->getSpace(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getSymlink(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "file"    # Ljava/lang/String;

    .prologue
    .line 458
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->getSymlink(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSymlinks(Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "path"    # Ljava/lang/String;
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
    .line 472
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->getSymlinks(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public static getWorkingToolbox()Ljava/lang/String;
    .registers 1

    .prologue
    .line 483
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->getWorkingToolbox()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static hasBinary(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "binaryName"    # Ljava/lang/String;

    .prologue
    .line 550
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->isBinaryAvailable(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static hasEnoughSpaceOnSdCard(J)Z
    .registers 3
    .param p0, "updateSize"    # J

    .prologue
    .line 495
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->hasEnoughSpaceOnSdCard(J)Z

    move-result v0

    return v0
.end method

.method public static hasUtil(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3
    .param p0, "util"    # Ljava/lang/String;
    .param p1, "box"    # Ljava/lang/String;

    .prologue
    .line 507
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->hasUtil(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static installBinary(Landroid/content/Context;ILjava/lang/String;)Z
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "sourceId"    # I
    .param p2, "binaryName"    # Ljava/lang/String;

    .prologue
    .line 538
    const-string v0, "700"

    invoke-static {p0, p1, p2, v0}, Lcom/stericson/RootTools/RootTools;->installBinary(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static installBinary(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "sourceId"    # I
    .param p2, "destName"    # Ljava/lang/String;
    .param p3, "mode"    # Ljava/lang/String;

    .prologue
    .line 523
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->installBinary(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isAccessGiven()Z
    .registers 1

    .prologue
    .line 581
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->isAccessGiven()Z

    move-result v0

    return v0
.end method

.method public static isAppletAvailable(Ljava/lang/String;)Z
    .registers 2
    .param p0, "applet"    # Ljava/lang/String;

    .prologue
    .line 573
    const-string v0, ""

    invoke-static {p0, v0}, Lcom/stericson/RootTools/RootTools;->isAppletAvailable(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isAppletAvailable(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3
    .param p0, "applet"    # Ljava/lang/String;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 562
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->isAppletAvailable(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isBusyboxAvailable()Z
    .registers 1

    .prologue
    .line 588
    const-string v0, "busybox"

    invoke-static {v0}, Lcom/stericson/RootTools/RootTools;->findBinary(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isNativeToolsReady(ILandroid/content/Context;)Z
    .registers 3
    .param p0, "nativeToolsId"    # I
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 592
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->isNativeToolsReady(ILandroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public static isProcessRunning(Ljava/lang/String;)Z
    .registers 2
    .param p0, "processName"    # Ljava/lang/String;

    .prologue
    .line 604
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->isProcessRunning(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isRootAvailable()Z
    .registers 1

    .prologue
    .line 611
    const-string v0, "su"

    invoke-static {v0}, Lcom/stericson/RootTools/RootTools;->findBinary(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static islog()Z
    .registers 1

    .prologue
    .line 798
    sget-boolean v0, Lcom/stericson/RootTools/RootTools;->debugMode:Z

    return v0
.end method

.method public static killProcess(Ljava/lang/String;)Z
    .registers 2
    .param p0, "processName"    # Ljava/lang/String;

    .prologue
    .line 622
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->killProcess(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static log(Ljava/lang/String;)V
    .registers 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 740
    const/4 v0, 0x3

    invoke-static {v1, p0, v0, v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Exception;)V

    .line 741
    return-void
.end method

.method public static log(Ljava/lang/String;ILjava/lang/Exception;)V
    .registers 4
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "type"    # I
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 775
    const/4 v0, 0x0

    invoke-static {v0, p0, p1, p2}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Exception;)V

    .line 776
    return-void
.end method

.method public static log(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0, "TAG"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 757
    const/4 v0, 0x3

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Exception;)V

    .line 758
    return-void
.end method

.method public static log(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Exception;)V
    .registers 5
    .param p0, "TAG"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "type"    # I
    .param p3, "e"    # Ljava/lang/Exception;

    .prologue
    .line 817
    if-eqz p1, :cond_15

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    .line 818
    sget-boolean v0, Lcom/stericson/RootTools/RootTools;->debugMode:Z

    if-eqz v0, :cond_15

    .line 819
    if-nez p0, :cond_12

    .line 820
    const-string p0, "RootTools v3.5"

    .line 823
    :cond_12
    packed-switch p2, :pswitch_data_22

    .line 836
    :cond_15
    :goto_15
    return-void

    .line 825
    :pswitch_16
    invoke-static {p0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_15

    .line 828
    :pswitch_1a
    invoke-static {p0, p1, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_15

    .line 831
    :pswitch_1e
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_15

    .line 823
    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_16
        :pswitch_1a
        :pswitch_1e
    .end packed-switch
.end method

.method public static offerBusyBox(Landroid/app/Activity;I)Landroid/content/Intent;
    .registers 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "requestCode"    # I

    .prologue
    .line 643
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->offerBusyBox(Landroid/app/Activity;I)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static offerBusyBox(Landroid/app/Activity;)V
    .registers 2
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 631
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->offerBusyBox(Landroid/app/Activity;)V

    .line 632
    return-void
.end method

.method public static offerSuperUser(Landroid/app/Activity;I)Landroid/content/Intent;
    .registers 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "requestCode"    # I

    .prologue
    .line 664
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->offerSuperUser(Landroid/app/Activity;I)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static offerSuperUser(Landroid/app/Activity;)V
    .registers 2
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 652
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getInternals()Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->offerSuperUser(Landroid/app/Activity;)V

    .line 653
    return-void
.end method

.method public static remount(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4
    .param p0, "file"    # Ljava/lang/String;
    .param p1, "mountType"    # Ljava/lang/String;

    .prologue
    .line 683
    new-instance v0, Lcom/stericson/RootTools/internal/Remounter;

    invoke-direct {v0}, Lcom/stericson/RootTools/internal/Remounter;-><init>()V

    .line 685
    .local v0, "remounter":Lcom/stericson/RootTools/internal/Remounter;
    invoke-virtual {v0, p0, p1}, Lcom/stericson/RootTools/internal/Remounter;->remount(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public static restartAndroid()V
    .registers 1

    .prologue
    .line 696
    const-string v0, "Restart Android"

    invoke-static {v0}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 697
    const-string v0, "zygote"

    invoke-static {v0}, Lcom/stericson/RootTools/RootTools;->killProcess(Ljava/lang/String;)Z

    .line 698
    return-void
.end method

.method public static runBinary(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "binaryName"    # Ljava/lang/String;
    .param p2, "parameter"    # Ljava/lang/String;

    .prologue
    .line 709
    new-instance v0, Lcom/stericson/RootTools/internal/Runner;

    invoke-direct {v0, p0, p1, p2}, Lcom/stericson/RootTools/internal/Runner;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 710
    .local v0, "runner":Lcom/stericson/RootTools/internal/Runner;
    invoke-virtual {v0}, Lcom/stericson/RootTools/internal/Runner;->start()V

    .line 711
    return-void
.end method

.method public static runShellCommand(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Command;)V
    .registers 2
    .param p0, "shell"    # Lcom/stericson/RootTools/execution/Shell;
    .param p1, "command"    # Lcom/stericson/RootTools/execution/Command;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 724
    invoke-virtual {p0, p1}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 725
    return-void
.end method

.method public static setRim(Lcom/stericson/RootTools/internal/RootToolsInternalMethods;)V
    .registers 1
    .param p0, "rim"    # Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    .prologue
    .line 64
    sput-object p0, Lcom/stericson/RootTools/RootTools;->rim:Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    .line 65
    return-void
.end method
