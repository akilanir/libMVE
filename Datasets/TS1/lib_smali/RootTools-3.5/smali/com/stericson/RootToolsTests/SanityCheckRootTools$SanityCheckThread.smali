.class Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;
.super Ljava/lang/Thread;
.source "SanityCheckRootTools.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/stericson/RootToolsTests/SanityCheckRootTools;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SanityCheckThread"
.end annotation


# instance fields
.field private mHandler:Landroid/os/Handler;

.field final synthetic this$0:Lcom/stericson/RootToolsTests/SanityCheckRootTools;


# direct methods
.method public constructor <init>(Lcom/stericson/RootToolsTests/SanityCheckRootTools;Landroid/content/Context;Landroid/os/Handler;)V
    .registers 4
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "handler"    # Landroid/os/Handler;

    .prologue
    .line 142
    iput-object p1, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->this$0:Lcom/stericson/RootToolsTests/SanityCheckRootTools;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 143
    iput-object p3, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->mHandler:Landroid/os/Handler;

    .line 144
    return-void
.end method

.method static synthetic access$200(Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;ILjava/lang/String;)V
    .registers 3
    .param p0, "x0"    # Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 139
    invoke-direct {p0, p1, p2}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    return-void
.end method

.method private visualUpdate(ILjava/lang/String;)V
    .registers 6
    .param p1, "action"    # I
    .param p2, "text"    # Ljava/lang/String;

    .prologue
    .line 353
    iget-object v2, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 354
    .local v1, "msg":Landroid/os/Message;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 355
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "action"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 356
    const-string v2, "text"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 357
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 358
    iget-object v2, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 359
    return-void
.end method


# virtual methods
.method public run()V
    .registers 23

    .prologue
    .line 147
    const/4 v3, 0x1

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 161
    const/4 v3, 0x4

    const-string v4, "Testing getPath"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 162
    const/4 v3, 0x3

    const-string v4, "[ getPath ]\n"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 165
    :try_start_17
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->getPath()Ljava/util/List;

    move-result-object v15

    .line 167
    .local v15, "paths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "i$":Ljava/util/Iterator;
    :goto_1f
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_49

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    .line 169
    .local v14, "path":Ljava/lang/String;
    const/4 v3, 0x3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " k\n\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_44} :catch_45

    goto :goto_1f

    .line 172
    .end local v13    # "i$":Ljava/util/Iterator;
    .end local v14    # "path":Ljava/lang/String;
    .end local v15    # "paths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_45
    move-exception v9

    .line 173
    .local v9, "e":Ljava/lang/Exception;
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V

    .line 176
    .end local v9    # "e":Ljava/lang/Exception;
    :cond_49
    const/4 v3, 0x4

    const-string v4, "Testing A ton of commands"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 177
    const/4 v3, 0x3

    const-string v4, "[ Ton of Commands ]\n"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 179
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_5a
    const/16 v3, 0x64

    if-ge v12, v3, :cond_66

    .line 180
    const-string v3, "/system/xbin/busybox"

    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->exists(Ljava/lang/String;)Z

    .line 179
    add-int/lit8 v12, v12, 0x1

    goto :goto_5a

    .line 183
    :cond_66
    const/4 v3, 0x4

    const-string v4, "Testing Find Binary"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 184
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->isRootAvailable()Z

    move-result v17

    .line 185
    .local v17, "result":Z
    const/4 v3, 0x3

    const-string v4, "[ Checking Root ]\n"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 186
    const/4 v3, 0x3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " k\n\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 188
    const/4 v3, 0x4

    const-string v4, "Testing file exists"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 189
    const/4 v3, 0x3

    const-string v4, "[ Checking Exists() ]\n"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 190
    const/4 v3, 0x3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "/system/sbin/["

    invoke-static {v5}, Lcom/stericson/RootTools/RootTools;->exists(Ljava/lang/String;)Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " k\n\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 192
    const/4 v3, 0x4

    const-string v4, "Testing Is Access Given"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 193
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->isAccessGiven()Z

    move-result v17

    .line 194
    const/4 v3, 0x3

    const-string v4, "[ Checking for Access to Root ]\n"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 195
    const/4 v3, 0x3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " k\n\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 197
    const/4 v3, 0x4

    const-string v4, "Testing Remount"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 198
    const-string v3, "/system"

    const-string v4, "rw"

    invoke-static {v3, v4}, Lcom/stericson/RootTools/RootTools;->remount(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v17

    .line 199
    const/4 v3, 0x3

    const-string v4, "[ Remounting System as RW ]\n"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 200
    const/4 v3, 0x3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " k\n\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 202
    const/4 v3, 0x4

    const-string v4, "Testing CheckUtil"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 203
    const/4 v3, 0x3

    const-string v4, "[ Checking busybox is setup ]\n"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 204
    const/4 v3, 0x3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "busybox"

    invoke-static {v5}, Lcom/stericson/RootTools/RootTools;->checkUtil(Ljava/lang/String;)Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " k\n\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 206
    const/4 v3, 0x4

    const-string v4, "Testing getBusyBoxVersion"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 207
    const/4 v3, 0x3

    const-string v4, "[ Checking busybox version ]\n"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 208
    const/4 v3, 0x3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "/system/bin/"

    invoke-static {v5}, Lcom/stericson/RootTools/RootTools;->getBusyBoxVersion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " k\n\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 211
    const/4 v3, 0x4

    :try_start_185
    const-string v4, "Testing fixUtils"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 212
    const/4 v3, 0x3

    const-string v4, "[ Checking Utils ]\n"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 213
    const/4 v3, 0x3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x6

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "ls"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "rm"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "ln"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string v7, "dd"

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const-string v7, "chmod"

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const-string v7, "mount"

    aput-object v7, v5, v6

    invoke-static {v5}, Lcom/stericson/RootTools/RootTools;->fixUtils([Ljava/lang/String;)Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " k\n\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V
    :try_end_1d2
    .catch Ljava/lang/Exception; {:try_start_185 .. :try_end_1d2} :catch_3dc

    .line 220
    :goto_1d2
    const/4 v3, 0x4

    :try_start_1d3
    const-string v4, "Testing getSymlink"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 221
    const/4 v3, 0x3

    const-string v4, "[ Checking [[ for symlink ]\n"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 222
    const/4 v3, 0x3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "/system/bin/[["

    invoke-static {v5}, Lcom/stericson/RootTools/RootTools;->getSymlink(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " k\n\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V
    :try_end_201
    .catch Ljava/lang/Exception; {:try_start_1d3 .. :try_end_201} :catch_3e2

    .line 228
    :goto_201
    const/4 v3, 0x4

    const-string v4, "Testing getInode"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 229
    const/4 v3, 0x3

    const-string v4, "[ Checking Inodes ]\n"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 230
    const/4 v3, 0x3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "/system/bin/busybox"

    invoke-static {v5}, Lcom/stericson/RootTools/RootTools;->getInode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " k\n\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 232
    const/4 v3, 0x4

    const-string v4, "Testing GetBusyBoxapplets"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 235
    const/4 v3, 0x3

    :try_start_239
    const-string v4, "[ Getting all available Busybox applets ]\n"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 236
    const-string v3, "/data/data/stericson.busybox.donate/files/bb"

    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->getBusyBoxApplets(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .restart local v13    # "i$":Ljava/util/Iterator;
    :goto_24a
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_274

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 237
    .local v8, "applet":Ljava/lang/String;
    const/4 v3, 0x3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " k\n\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V
    :try_end_26f
    .catch Ljava/lang/Exception; {:try_start_239 .. :try_end_26f} :catch_270

    goto :goto_24a

    .line 240
    .end local v8    # "applet":Ljava/lang/String;
    .end local v13    # "i$":Ljava/util/Iterator;
    :catch_270
    move-exception v10

    .line 242
    .local v10, "e1":Ljava/lang/Exception;
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    .line 245
    .end local v10    # "e1":Ljava/lang/Exception;
    :cond_274
    const/4 v3, 0x4

    const-string v4, "Testing getFilePermissionsSymlinks"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 246
    const-string v3, "/system/bin/busybox"

    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->getFilePermissionsSymlinks(Ljava/lang/String;)Lcom/stericson/RootTools/containers/Permissions;

    move-result-object v16

    .line 247
    .local v16, "permissions":Lcom/stericson/RootTools/containers/Permissions;
    const/4 v3, 0x3

    const-string v4, "[ Checking busybox permissions and symlink ]\n"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 249
    if-eqz v16, :cond_3e8

    .line 250
    const/4 v3, 0x3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Symlink: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v16 .. v16}, Lcom/stericson/RootTools/containers/Permissions;->getSymlink()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " k\n\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 251
    const/4 v3, 0x3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Group Permissions: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v16 .. v16}, Lcom/stericson/RootTools/containers/Permissions;->getGroupPermissions()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " k\n\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 252
    const/4 v3, 0x3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Owner Permissions: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v16 .. v16}, Lcom/stericson/RootTools/containers/Permissions;->getOtherPermissions()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " k\n\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 253
    const/4 v3, 0x3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Permissions: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v16 .. v16}, Lcom/stericson/RootTools/containers/Permissions;->getPermissions()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " k\n\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 254
    const/4 v3, 0x3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Type: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v16 .. v16}, Lcom/stericson/RootTools/containers/Permissions;->getType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " k\n\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 255
    const/4 v3, 0x3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "User Permissions: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v16 .. v16}, Lcom/stericson/RootTools/containers/Permissions;->getUserPermissions()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " k\n\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 260
    :goto_35e
    const/4 v3, 0x4

    const-string v4, "JAVA"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 261
    const/4 v3, 0x3

    const-string v4, "[ Running some Java code ]\n"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 265
    const/4 v3, 0x1

    :try_start_36f
    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->getShell(Z)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v18

    .line 266
    .local v18, "shell":Lcom/stericson/RootTools/execution/Shell;
    new-instance v2, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread$1;

    const/16 v4, 0x2b

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->this$0:Lcom/stericson/RootToolsTests/SanityCheckRootTools;

    const/4 v3, 0x1

    new-array v7, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v21, "com.stericson.RootToolsTests.NativeJavaClass"

    aput-object v21, v7, v3

    move-object/from16 v3, p0

    invoke-direct/range {v2 .. v7}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread$1;-><init>(Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;IZLandroid/content/Context;[Ljava/lang/String;)V

    .line 278
    .local v2, "cmd":Lcom/stericson/RootTools/execution/JavaCommandCapture;
    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;
    :try_end_38e
    .catch Ljava/lang/Exception; {:try_start_36f .. :try_end_38e} :catch_3f2

    .line 286
    .end local v2    # "cmd":Lcom/stericson/RootTools/execution/JavaCommandCapture;
    .end local v18    # "shell":Lcom/stericson/RootTools/execution/Shell;
    :goto_38e
    const/4 v3, 0x4

    const-string v4, "Testing df"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 287
    const-string v3, "/data"

    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->getSpace(Ljava/lang/String;)J

    move-result-wide v19

    .line 288
    .local v19, "spaceValue":J
    const/4 v3, 0x3

    const-string v4, "[ Checking /data partition size]\n"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 289
    const/4 v3, 0x3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-wide/from16 v0, v19

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "k\n\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    .line 292
    const/4 v3, 0x1

    :try_start_3c0
    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->getShell(Z)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v18

    .line 294
    .restart local v18    # "shell":Lcom/stericson/RootTools/execution/Shell;
    new-instance v2, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread$2;

    const/16 v3, 0x2a

    const/4 v4, 0x0

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "find /"

    aput-object v7, v5, v6

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v3, v4, v5}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread$2;-><init>(Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;IZ[Ljava/lang/String;)V

    .line 344
    .local v2, "cmd":Lcom/stericson/RootTools/execution/CommandCapture;
    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;
    :try_end_3db
    .catch Ljava/lang/Exception; {:try_start_3c0 .. :try_end_3db} :catch_3f7

    .line 350
    .end local v2    # "cmd":Lcom/stericson/RootTools/execution/CommandCapture;
    .end local v18    # "shell":Lcom/stericson/RootTools/execution/Shell;
    :goto_3db
    return-void

    .line 214
    .end local v16    # "permissions":Lcom/stericson/RootTools/containers/Permissions;
    .end local v19    # "spaceValue":J
    :catch_3dc
    move-exception v11

    .line 216
    .local v11, "e2":Ljava/lang/Exception;
    invoke-virtual {v11}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1d2

    .line 223
    .end local v11    # "e2":Ljava/lang/Exception;
    :catch_3e2
    move-exception v11

    .line 225
    .restart local v11    # "e2":Ljava/lang/Exception;
    invoke-virtual {v11}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_201

    .line 257
    .end local v11    # "e2":Ljava/lang/Exception;
    .restart local v16    # "permissions":Lcom/stericson/RootTools/containers/Permissions;
    :cond_3e8
    const/4 v3, 0x3

    const-string v4, "Permissions == null k\n\n"

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V

    goto/16 :goto_35e

    .line 280
    :catch_3f2
    move-exception v9

    .line 283
    .restart local v9    # "e":Ljava/lang/Exception;
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_38e

    .line 346
    .end local v9    # "e":Ljava/lang/Exception;
    .restart local v19    # "spaceValue":J
    :catch_3f7
    move-exception v9

    .line 347
    .restart local v9    # "e":Ljava/lang/Exception;
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3db
.end method
