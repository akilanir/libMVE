.class final Lorg/acra/collector/DeviceFeaturesCollector;
.super Ljava/lang/Object;
.source "DeviceFeaturesCollector.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFeatures(Landroid/content/Context;)Ljava/lang/String;
    .registers 11
    .param p0, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 38
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .local v5, "result":Ljava/lang/StringBuilder;
    :try_start_5
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 41
    .local v4, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual {v4}, Landroid/content/pm/PackageManager;->getSystemAvailableFeatures()[Landroid/content/pm/FeatureInfo;

    move-result-object v3

    .line 42
    .local v3, "features":[Landroid/content/pm/FeatureInfo;
    array-length v7, v3

    const/4 v6, 0x0

    :goto_f
    if-ge v6, v7, :cond_5b

    aget-object v1, v3, v6

    .line 43
    .local v1, "feature":Landroid/content/pm/FeatureInfo;
    iget-object v2, v1, Landroid/content/pm/FeatureInfo;->name:Ljava/lang/String;

    .line 44
    .local v2, "featureName":Ljava/lang/String;
    if-eqz v2, :cond_22

    .line 45
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    :goto_1a
    const/16 v8, 0xa

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 42
    add-int/lit8 v6, v6, 0x1

    goto :goto_f

    .line 47
    :cond_22
    const-string v8, "glEsVersion = "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Landroid/content/pm/FeatureInfo;->getGlEsVersion()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2f
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_2f} :catch_30

    goto :goto_1a

    .line 51
    .end local v1    # "feature":Landroid/content/pm/FeatureInfo;
    .end local v2    # "featureName":Ljava/lang/String;
    .end local v3    # "features":[Landroid/content/pm/FeatureInfo;
    .end local v4    # "pm":Landroid/content/pm/PackageManager;
    :catch_30
    move-exception v0

    .line 52
    .local v0, "e":Ljava/lang/Throwable;
    sget-object v6, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v7, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Couldn\'t retrieve DeviceFeatures for "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8, v0}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 53
    const-string v6, "Could not retrieve data: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_5b
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method
