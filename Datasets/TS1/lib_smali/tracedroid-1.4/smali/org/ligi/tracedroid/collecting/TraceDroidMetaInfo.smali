.class public Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;
.super Ljava/lang/Object;
.source "TraceDroidMetaInfo.java"


# static fields
.field private static android_version:Ljava/lang/String;

.field private static app_packagename:Ljava/lang/String;

.field private static app_version:Ljava/lang/String;

.field private static extra:Ljava/lang/String;

.field private static files_path:Ljava/lang/String;

.field private static phone_model:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 9
    const-string v0, "unknown"

    sput-object v0, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->app_version:Ljava/lang/String;

    .line 10
    const-string v0, "unknown"

    sput-object v0, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->app_packagename:Ljava/lang/String;

    .line 11
    const-string v0, "unknown"

    sput-object v0, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->android_version:Ljava/lang/String;

    .line 12
    const-string v0, "unknown"

    sput-object v0, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->phone_model:Ljava/lang/String;

    .line 13
    const-string v0, "unknown"

    sput-object v0, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->files_path:Ljava/lang/String;

    .line 14
    const-string v0, ""

    sput-object v0, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->extra:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAndroidVersion()Ljava/lang/String;
    .registers 1

    .prologue
    .line 36
    sget-object v0, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->android_version:Ljava/lang/String;

    return-object v0
.end method

.method public static getAppPackageName()Ljava/lang/String;
    .registers 1

    .prologue
    .line 52
    sget-object v0, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->app_packagename:Ljava/lang/String;

    return-object v0
.end method

.method public static getAppVersion()Ljava/lang/String;
    .registers 1

    .prologue
    .line 32
    sget-object v0, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->app_version:Ljava/lang/String;

    return-object v0
.end method

.method public static getExtra()Ljava/lang/String;
    .registers 1

    .prologue
    .line 56
    sget-object v0, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->extra:Ljava/lang/String;

    return-object v0
.end method

.method public static getFileSuffix()Ljava/lang/String;
    .registers 1

    .prologue
    .line 48
    const-string v0, ".tracedroid"

    return-object v0
.end method

.method public static getFilesPath()Ljava/lang/String;
    .registers 1

    .prologue
    .line 44
    sget-object v0, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->files_path:Ljava/lang/String;

    return-object v0
.end method

.method public static getPhoneModel()Ljava/lang/String;
    .registers 1

    .prologue
    .line 40
    sget-object v0, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->phone_model:Ljava/lang/String;

    return-object v0
.end method

.method public static getTraceDroidVersion()Ljava/lang/String;
    .registers 1

    .prologue
    .line 60
    const-string v0, "1.1"

    return-object v0
.end method

.method public static init(Landroid/content/Context;)V
    .registers 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sput-object v2, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->phone_model:Ljava/lang/String;

    .line 18
    sget-object v2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    sput-object v2, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->android_version:Ljava/lang/String;

    .line 20
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->files_path:Ljava/lang/String;

    .line 23
    :try_start_12
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 24
    .local v1, "pi":Landroid/content/pm/PackageInfo;
    iget-object v2, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    sput-object v2, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->app_version:Ljava/lang/String;

    .line 25
    iget-object v2, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    sput-object v2, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->app_packagename:Ljava/lang/String;
    :try_end_27
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_12 .. :try_end_27} :catch_28

    .line 29
    .end local v1    # "pi":Landroid/content/pm/PackageInfo;
    :goto_27
    return-void

    .line 26
    :catch_28
    move-exception v0

    .line 27
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->extra:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "No Package found to gather TraceDroidMetaInfo"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->extra:Ljava/lang/String;

    goto :goto_27
.end method
