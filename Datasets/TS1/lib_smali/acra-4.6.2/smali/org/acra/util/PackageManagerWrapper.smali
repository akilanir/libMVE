.class public final Lorg/acra/util/PackageManagerWrapper;
.super Ljava/lang/Object;
.source "PackageManagerWrapper.java"


# instance fields
.field private final context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lorg/acra/util/PackageManagerWrapper;->context:Landroid/content/Context;

    .line 33
    return-void
.end method


# virtual methods
.method public getPackageInfo()Landroid/content/pm/PackageInfo;
    .registers 8

    .prologue
    const/4 v2, 0x0

    .line 58
    iget-object v3, p0, Lorg/acra/util/PackageManagerWrapper;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 59
    .local v1, "pm":Landroid/content/pm/PackageManager;
    if-nez v1, :cond_a

    .line 71
    :goto_9
    return-object v2

    .line 64
    :cond_a
    :try_start_a
    iget-object v3, p0, Lorg/acra/util/PackageManagerWrapper;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_14
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_a .. :try_end_14} :catch_16
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_14} :catch_38

    move-result-object v2

    goto :goto_9

    .line 65
    :catch_16
    move-exception v0

    .line 66
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to find PackageInfo for current App : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/acra/util/PackageManagerWrapper;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lorg/acra/log/ACRALog;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    .line 68
    .end local v0    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_38
    move-exception v0

    .line 71
    .local v0, "e":Ljava/lang/RuntimeException;
    goto :goto_9
.end method

.method public hasPermission(Ljava/lang/String;)Z
    .registers 6
    .param p1, "permission"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 40
    iget-object v3, p0, Lorg/acra/util/PackageManagerWrapper;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 41
    .local v1, "pm":Landroid/content/pm/PackageManager;
    if-nez v1, :cond_a

    .line 50
    :cond_9
    :goto_9
    return v2

    .line 46
    :cond_a
    :try_start_a
    iget-object v3, p0, Lorg/acra/util/PackageManagerWrapper;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, p1, v3}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_13
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_13} :catch_18

    move-result v3

    if-nez v3, :cond_9

    const/4 v2, 0x1

    goto :goto_9

    .line 47
    :catch_18
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/RuntimeException;
    goto :goto_9
.end method
