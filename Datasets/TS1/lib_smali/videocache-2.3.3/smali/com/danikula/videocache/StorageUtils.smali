.class final Lcom/danikula/videocache/StorageUtils;
.super Ljava/lang/Object;
.source "StorageUtils.java"


# static fields
.field private static final INDIVIDUAL_DIR_NAME:Ljava/lang/String; = "video-cache"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getCacheDirectory(Landroid/content/Context;Z)Ljava/io/File;
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "preferExternal"    # Z

    .prologue
    .line 49
    const/4 v0, 0x0

    .line 52
    .local v0, "appCacheDir":Ljava/io/File;
    :try_start_1
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_4} :catch_5c

    move-result-object v3

    .line 56
    .local v3, "externalStorageState":Ljava/lang/String;
    :goto_5
    if-eqz p1, :cond_13

    const-string v4, "mounted"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13

    .line 57
    invoke-static {p0}, Lcom/danikula/videocache/StorageUtils;->getExternalCacheDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 59
    :cond_13
    if-nez v0, :cond_19

    .line 60
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    .line 62
    :cond_19
    if-nez v0, :cond_5b

    .line 63
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "/data/data/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/cache/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 64
    .local v1, "cacheDirPath":Ljava/lang/String;
    const-string v4, "ProxyCache"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Can\'t define system cache directory! \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "%s\' will be used."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    new-instance v0, Ljava/io/File;

    .end local v0    # "appCacheDir":Ljava/io/File;
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 67
    .end local v1    # "cacheDirPath":Ljava/lang/String;
    .restart local v0    # "appCacheDir":Ljava/io/File;
    :cond_5b
    return-object v0

    .line 53
    .end local v3    # "externalStorageState":Ljava/lang/String;
    :catch_5c
    move-exception v2

    .line 54
    .local v2, "e":Ljava/lang/NullPointerException;
    const-string v3, ""

    .restart local v3    # "externalStorageState":Ljava/lang/String;
    goto :goto_5
.end method

.method private static getExternalCacheDir(Landroid/content/Context;)Ljava/io/File;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 71
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    const-string v4, "Android"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-string v3, "data"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 72
    .local v1, "dataDir":Ljava/io/File;
    new-instance v0, Ljava/io/File;

    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-string v3, "cache"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 73
    .local v0, "appCacheDir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_36

    .line 74
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-nez v2, :cond_36

    .line 75
    const-string v2, "ProxyCache"

    const-string v3, "Unable to create external cache directory"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    const/4 v0, 0x0

    .line 79
    .end local v0    # "appCacheDir":Ljava/io/File;
    :cond_36
    return-object v0
.end method

.method public static getIndividualCacheDirectory(Landroid/content/Context;)Ljava/io/File;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    const/4 v1, 0x1

    invoke-static {p0, v1}, Lcom/danikula/videocache/StorageUtils;->getCacheDirectory(Landroid/content/Context;Z)Ljava/io/File;

    move-result-object v0

    .line 34
    .local v0, "cacheDir":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    const-string v2, "video-cache"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1
.end method
