.class public Lcom/mikepenz/aboutlibraries/util/Util;
.super Ljava/lang/Object;
.source "Util.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getApplicationInfo(Landroid/content/Context;)Landroid/content/pm/ApplicationInfo;
    .registers 5
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 28
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 30
    .local v2, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 32
    .local v1, "packageName":Ljava/lang/String;
    const/4 v0, 0x0

    .line 34
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    const/4 v3, 0x0

    :try_start_a
    invoke-virtual {v2, v1, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_d} :catch_f

    move-result-object v0

    .line 37
    :goto_e
    return-object v0

    .line 35
    :catch_f
    move-exception v3

    goto :goto_e
.end method

.method public static getPackageInfo(Landroid/content/Context;)Landroid/content/pm/PackageInfo;
    .registers 5
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 14
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 16
    .local v2, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 18
    .local v1, "packageName":Ljava/lang/String;
    const/4 v0, 0x0

    .line 20
    .local v0, "packageInfo":Landroid/content/pm/PackageInfo;
    const/4 v3, 0x0

    :try_start_a
    invoke-virtual {v2, v1, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_d} :catch_f

    move-result-object v0

    .line 23
    :goto_e
    return-object v0

    .line 21
    :catch_f
    move-exception v3

    goto :goto_e
.end method
