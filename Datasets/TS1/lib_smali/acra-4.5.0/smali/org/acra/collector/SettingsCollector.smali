.class final Lorg/acra/collector/SettingsCollector;
.super Ljava/lang/Object;
.source "SettingsCollector.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static collectGlobalSettings(Landroid/content/Context;)Ljava/lang/String;
    .registers 15
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 114
    invoke-static {}, Lorg/acra/collector/Compatibility;->getAPILevel()I

    move-result v10

    const/16 v11, 0x11

    if-ge v10, v11, :cond_b

    .line 115
    const-string v10, ""

    .line 145
    :goto_a
    return-object v10

    .line 118
    :cond_b
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    .local v8, "result":Ljava/lang/StringBuilder;
    :try_start_10
    const-string v10, "android.provider.Settings$Global"

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 121
    .local v3, "globalClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v3}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v6

    .line 122
    .local v6, "keys":[Ljava/lang/reflect/Field;
    const-string v10, "getString"

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Class;

    const/4 v12, 0x0

    const-class v13, Landroid/content/ContentResolver;

    aput-object v13, v11, v12

    const/4 v12, 0x1

    const-class v13, Ljava/lang/String;

    aput-object v13, v11, v12

    invoke-virtual {v3, v10, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 123
    .local v2, "getString":Ljava/lang/reflect/Method;
    move-object v0, v6

    .local v0, "arr$":[Ljava/lang/reflect/Field;
    array-length v7, v0

    .local v7, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_30
    if-ge v4, v7, :cond_87

    aget-object v5, v0, v4

    .line 124
    .local v5, "key":Ljava/lang/reflect/Field;
    const-class v10, Ljava/lang/Deprecated;

    invoke-virtual {v5, v10}, Ljava/lang/reflect/Field;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v10

    if-nez v10, :cond_7c

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v10

    const-class v11, Ljava/lang/String;

    if-ne v10, v11, :cond_7c

    invoke-static {v5}, Lorg/acra/collector/SettingsCollector;->isAuthorized(Ljava/lang/reflect/Field;)Z

    move-result v10

    if-eqz v10, :cond_7c

    .line 125
    const/4 v11, 0x0

    const/4 v10, 0x2

    new-array v12, v10, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v13

    aput-object v13, v12, v10

    const/4 v13, 0x1

    const/4 v10, 0x0

    invoke-virtual {v5, v10}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    aput-object v10, v12, v13

    invoke-virtual {v2, v11, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .line 126
    .local v9, "value":Ljava/lang/Object;
    if-eqz v9, :cond_7c

    .line 127
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_7c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_10 .. :try_end_7c} :catch_7f
    .catch Ljava/lang/IllegalAccessException; {:try_start_10 .. :try_end_7c} :catch_8d
    .catch Ljava/lang/ClassNotFoundException; {:try_start_10 .. :try_end_7c} :catch_96
    .catch Ljava/lang/SecurityException; {:try_start_10 .. :try_end_7c} :catch_9f
    .catch Ljava/lang/NoSuchMethodException; {:try_start_10 .. :try_end_7c} :catch_a8
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_10 .. :try_end_7c} :catch_b1

    .line 123
    .end local v9    # "value":Ljava/lang/Object;
    :cond_7c
    add-int/lit8 v4, v4, 0x1

    goto :goto_30

    .line 131
    .end local v0    # "arr$":[Ljava/lang/reflect/Field;
    .end local v2    # "getString":Ljava/lang/reflect/Method;
    .end local v3    # "globalClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "i$":I
    .end local v5    # "key":Ljava/lang/reflect/Field;
    .end local v6    # "keys":[Ljava/lang/reflect/Field;
    .end local v7    # "len$":I
    :catch_7f
    move-exception v1

    .line 132
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    sget-object v10, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v11, "Error : "

    invoke-static {v10, v11, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 145
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :cond_87
    :goto_87
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_a

    .line 133
    :catch_8d
    move-exception v1

    .line 134
    .local v1, "e":Ljava/lang/IllegalAccessException;
    sget-object v10, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v11, "Error : "

    invoke-static {v10, v11, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_87

    .line 135
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_96
    move-exception v1

    .line 136
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    sget-object v10, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v11, "Error : "

    invoke-static {v10, v11, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_87

    .line 137
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    :catch_9f
    move-exception v1

    .line 138
    .local v1, "e":Ljava/lang/SecurityException;
    sget-object v10, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v11, "Error : "

    invoke-static {v10, v11, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_87

    .line 139
    .end local v1    # "e":Ljava/lang/SecurityException;
    :catch_a8
    move-exception v1

    .line 140
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    sget-object v10, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v11, "Error : "

    invoke-static {v10, v11, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_87

    .line 141
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    :catch_b1
    move-exception v1

    .line 142
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    sget-object v10, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v11, "Error : "

    invoke-static {v10, v11, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_87
.end method

.method public static collectSecureSettings(Landroid/content/Context;)Ljava/lang/String;
    .registers 11
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 84
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 85
    .local v6, "result":Ljava/lang/StringBuilder;
    const-class v8, Landroid/provider/Settings$Secure;

    invoke-virtual {v8}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v4

    .line 86
    .local v4, "keys":[Ljava/lang/reflect/Field;
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/reflect/Field;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_e
    if-ge v2, v5, :cond_65

    aget-object v3, v0, v2

    .line 87
    .local v3, "key":Ljava/lang/reflect/Field;
    const-class v8, Ljava/lang/Deprecated;

    invoke-virtual {v3, v8}, Ljava/lang/reflect/Field;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v8

    if-nez v8, :cond_50

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v8

    const-class v9, Ljava/lang/String;

    if-ne v8, v9, :cond_50

    invoke-static {v3}, Lorg/acra/collector/SettingsCollector;->isAuthorized(Ljava/lang/reflect/Field;)Z

    move-result v8

    if-eqz v8, :cond_50

    .line 89
    :try_start_28
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    const/4 v8, 0x0

    invoke-virtual {v3, v8}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v9, v8}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 90
    .local v7, "value":Ljava/lang/String;
    if-eqz v7, :cond_50

    .line 91
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\n"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_50
    .catch Ljava/lang/IllegalArgumentException; {:try_start_28 .. :try_end_50} :catch_53
    .catch Ljava/lang/IllegalAccessException; {:try_start_28 .. :try_end_50} :catch_5c

    .line 86
    .end local v7    # "value":Ljava/lang/String;
    :cond_50
    :goto_50
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 93
    :catch_53
    move-exception v1

    .line 94
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    sget-object v8, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v9, "Error : "

    invoke-static {v8, v9, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_50

    .line 95
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :catch_5c
    move-exception v1

    .line 96
    .local v1, "e":Ljava/lang/IllegalAccessException;
    sget-object v8, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v9, "Error : "

    invoke-static {v8, v9, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_50

    .line 101
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    .end local v3    # "key":Ljava/lang/reflect/Field;
    :cond_65
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method

.method public static collectSystemSettings(Landroid/content/Context;)Ljava/lang/String;
    .registers 11
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 51
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .local v6, "result":Ljava/lang/StringBuilder;
    const-class v8, Landroid/provider/Settings$System;

    invoke-virtual {v8}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v4

    .line 53
    .local v4, "keys":[Ljava/lang/reflect/Field;
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/reflect/Field;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_e
    if-ge v2, v5, :cond_5f

    aget-object v3, v0, v2

    .line 57
    .local v3, "key":Ljava/lang/reflect/Field;
    const-class v8, Ljava/lang/Deprecated;

    invoke-virtual {v3, v8}, Ljava/lang/reflect/Field;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v8

    if-nez v8, :cond_4a

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v8

    const-class v9, Ljava/lang/String;

    if-ne v8, v9, :cond_4a

    .line 59
    :try_start_22
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    const/4 v8, 0x0

    invoke-virtual {v3, v8}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v9, v8}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 60
    .local v7, "value":Ljava/lang/String;
    if-eqz v7, :cond_4a

    .line 61
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\n"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_4a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_22 .. :try_end_4a} :catch_4d
    .catch Ljava/lang/IllegalAccessException; {:try_start_22 .. :try_end_4a} :catch_56

    .line 53
    .end local v7    # "value":Ljava/lang/String;
    :cond_4a
    :goto_4a
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 63
    :catch_4d
    move-exception v1

    .line 64
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    sget-object v8, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v9, "Error : "

    invoke-static {v8, v9, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4a

    .line 65
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :catch_56
    move-exception v1

    .line 66
    .local v1, "e":Ljava/lang/IllegalAccessException;
    sget-object v8, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v9, "Error : "

    invoke-static {v8, v9, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4a

    .line 71
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    .end local v3    # "key":Ljava/lang/reflect/Field;
    :cond_5f
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method

.method private static isAuthorized(Ljava/lang/reflect/Field;)Z
    .registers 8
    .param p0, "key"    # Ljava/lang/reflect/Field;

    .prologue
    const/4 v4, 0x0

    .line 149
    if-eqz p0, :cond_f

    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "WIFI_AP"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_10

    .line 157
    :cond_f
    :goto_f
    return v4

    .line 152
    :cond_10
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v5

    invoke-virtual {v5}, Lorg/acra/ACRAConfiguration;->excludeMatchingSettingsKeys()[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_1a
    if-ge v1, v2, :cond_2b

    aget-object v3, v0, v1

    .line 153
    .local v3, "regex":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_f

    .line 152
    add-int/lit8 v1, v1, 0x1

    goto :goto_1a

    .line 157
    .end local v3    # "regex":Ljava/lang/String;
    :cond_2b
    const/4 v4, 0x1

    goto :goto_f
.end method
