.class public Lorg/osmdroid/tileprovider/util/ManifestUtil;
.super Ljava/lang/Object;
.source "ManifestUtil.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static retrieveKey(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p0, "aContext"    # Landroid/content/Context;
    .param p1, "aKey"    # Ljava/lang/String;

    .prologue
    .line 20
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 22
    .local v2, "pm":Landroid/content/pm/PackageManager;
    :try_start_4
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x80

    invoke-virtual {v2, v4, v5}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    .line 24
    .local v1, "info":Landroid/content/pm/ApplicationInfo;
    iget-object v4, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-nez v4, :cond_2d

    .line 25
    const-string v4, "OsmDroid"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Key %s not found in manifest"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2a
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_2a} :catch_4e

    .line 37
    .end local v1    # "info":Landroid/content/pm/ApplicationInfo;
    :goto_2a
    const-string v4, ""

    :goto_2c
    return-object v4

    .line 27
    .restart local v1    # "info":Landroid/content/pm/ApplicationInfo;
    :cond_2d
    :try_start_2d
    iget-object v4, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    invoke-virtual {v4, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 28
    .local v3, "value":Ljava/lang/String;
    if-nez v3, :cond_68

    .line 29
    const-string v4, "OsmDroid"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Key %s not found in manifest"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4d
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2d .. :try_end_4d} :catch_4e

    goto :goto_2a

    .line 34
    .end local v1    # "info":Landroid/content/pm/ApplicationInfo;
    .end local v3    # "value":Ljava/lang/String;
    :catch_4e
    move-exception v0

    .line 35
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v4, "OsmDroid"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Key %s not found in manifest"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2a

    .line 31
    .end local v0    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v1    # "info":Landroid/content/pm/ApplicationInfo;
    .restart local v3    # "value":Ljava/lang/String;
    :cond_68
    :try_start_68
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_6b
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_68 .. :try_end_6b} :catch_4e

    move-result-object v4

    goto :goto_2c
.end method
