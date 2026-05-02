.class public abstract Lch/qos/logback/core/android/CommonPathUtil;
.super Ljava/lang/Object;


# static fields
.field private static final ASSETS_DIRECTORY:Ljava/lang/String; = "assets"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAssetsDirectoryPath()Ljava/lang/String;
    .registers 1

    const-string v0, "assets"

    return-object v0
.end method

.method public static getDatabaseDirectoryPath(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    invoke-static {}, Lch/qos/logback/core/util/EnvUtil;->isAndroidOS()Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    :goto_e
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/data/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/databases"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_2c
    const-string v0, "/data"

    goto :goto_e
.end method

.method public static getExternalStorageDirectoryPath()Ljava/lang/String;
    .registers 1

    invoke-static {}, Lch/qos/logback/core/util/EnvUtil;->isAndroidOS()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    :cond_e
    :goto_e
    return-object v0

    :cond_f
    const-string v0, "EXTERNAL_STORAGE"

    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->getEnv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_e

    const-string v0, "/sdcard"

    goto :goto_e
.end method

.method public static getFilesDirectoryPath(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    invoke-static {}, Lch/qos/logback/core/util/EnvUtil;->isAndroidOS()Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    :goto_e
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/data/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/files"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_2c
    const-string v0, "/data"

    goto :goto_e
.end method

.method public static getMountedExternalStorageDirectoryPath()Ljava/lang/String;
    .registers 3

    invoke-static {}, Lch/qos/logback/core/util/EnvUtil;->isAndroidOS()Z

    move-result v0

    if-eqz v0, :cond_24

    const/4 v0, 0x0

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v1

    const-string v2, "mounted"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1b

    const-string v2, "mounted_ro"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_23

    :cond_1b
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    :cond_23
    :goto_23
    return-object v0

    :cond_24
    const-string v0, "/mnt/sdcard"

    goto :goto_23
.end method
