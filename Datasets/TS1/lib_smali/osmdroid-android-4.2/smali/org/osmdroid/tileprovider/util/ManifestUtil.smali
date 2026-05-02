.class public Lorg/osmdroid/tileprovider/util/ManifestUtil;
.super Ljava/lang/Object;
.source "ManifestUtil.java"


# static fields
.field private static final logger:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 15
    const-class v0, Lorg/osmdroid/tileprovider/util/ManifestUtil;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lorg/osmdroid/tileprovider/util/ManifestUtil;->logger:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static retrieveKey(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "aContext"    # Landroid/content/Context;
    .param p1, "aKey"    # Ljava/lang/String;

    .prologue
    .line 23
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 25
    .local v2, "pm":Landroid/content/pm/PackageManager;
    :try_start_4
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x80

    invoke-virtual {v2, v4, v5}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    .line 27
    .local v1, "info":Landroid/content/pm/ApplicationInfo;
    iget-object v4, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-nez v4, :cond_1c

    .line 28
    sget-object v4, Lorg/osmdroid/tileprovider/util/ManifestUtil;->logger:Lorg/slf4j/Logger;

    const-string v5, "Key %s not found in manifest"

    invoke-interface {v4, v5, p1}, Lorg/slf4j/Logger;->info(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_19
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_19} :catch_2c

    .line 40
    .end local v1    # "info":Landroid/content/pm/ApplicationInfo;
    :goto_19
    const-string v4, ""

    :goto_1b
    return-object v4

    .line 30
    .restart local v1    # "info":Landroid/content/pm/ApplicationInfo;
    :cond_1c
    :try_start_1c
    iget-object v4, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    invoke-virtual {v4, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 31
    .local v3, "value":Ljava/lang/String;
    if-nez v3, :cond_35

    .line 32
    sget-object v4, Lorg/osmdroid/tileprovider/util/ManifestUtil;->logger:Lorg/slf4j/Logger;

    const-string v5, "Key %s not found in manifest"

    invoke-interface {v4, v5, p1}, Lorg/slf4j/Logger;->info(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2b
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1c .. :try_end_2b} :catch_2c

    goto :goto_19

    .line 37
    .end local v1    # "info":Landroid/content/pm/ApplicationInfo;
    .end local v3    # "value":Ljava/lang/String;
    :catch_2c
    move-exception v0

    .line 38
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v4, Lorg/osmdroid/tileprovider/util/ManifestUtil;->logger:Lorg/slf4j/Logger;

    const-string v5, "Key %s not found in manifest"

    invoke-interface {v4, v5, p1}, Lorg/slf4j/Logger;->info(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_19

    .line 34
    .end local v0    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v1    # "info":Landroid/content/pm/ApplicationInfo;
    .restart local v3    # "value":Ljava/lang/String;
    :cond_35
    :try_start_35
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_38
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_35 .. :try_end_38} :catch_2c

    move-result-object v4

    goto :goto_1b
.end method
