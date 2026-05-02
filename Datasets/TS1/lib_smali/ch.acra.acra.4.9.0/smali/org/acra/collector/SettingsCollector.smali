.class final Lorg/acra/collector/SettingsCollector;
.super Ljava/lang/Object;
.source "SettingsCollector.java"


# static fields
.field private static final ERROR:Ljava/lang/String; = "Error: "


# instance fields
.field private final config:Lorg/acra/config/ACRAConfiguration;

.field private final context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "config"    # Lorg/acra/config/ACRAConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lorg/acra/collector/SettingsCollector;->context:Landroid/content/Context;

    .line 50
    iput-object p2, p0, Lorg/acra/collector/SettingsCollector;->config:Lorg/acra/config/ACRAConfiguration;

    .line 51
    return-void
.end method

.method private isAuthorized(Ljava/lang/reflect/Field;)Z
    .registers 6
    .param p1, "key"    # Ljava/lang/reflect/Field;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x0

    .line 149
    if-eqz p1, :cond_f

    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "WIFI_AP"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 157
    :cond_f
    :goto_f
    return v1

    .line 152
    :cond_10
    iget-object v2, p0, Lorg/acra/collector/SettingsCollector;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v2}, Lorg/acra/config/ACRAConfiguration;->excludeMatchingSettingsKeys()Lorg/acra/collections/ImmutableSet;

    move-result-object v2

    invoke-virtual {v2}, Lorg/acra/collections/ImmutableSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_31

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 153
    .local v0, "regex":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1a

    goto :goto_f

    .line 157
    .end local v0    # "regex":Ljava/lang/String;
    :cond_31
    const/4 v1, 0x1

    goto :goto_f
.end method


# virtual methods
.method public collectGlobalSettings()Ljava/lang/String;
    .registers 11
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 123
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x11

    if-ge v5, v6, :cond_9

    .line 124
    const-string v5, ""

    .line 145
    :goto_8
    return-object v5

    .line 127
    :cond_9
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .local v3, "result":Ljava/lang/StringBuilder;
    const-class v5, Landroid/provider/Settings$Global;

    invoke-virtual {v5}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 129
    .local v2, "keys":[Ljava/lang/reflect/Field;
    array-length v7, v2

    const/4 v5, 0x0

    move v6, v5

    :goto_17
    if-ge v6, v7, :cond_80

    aget-object v1, v2, v6

    .line 130
    .local v1, "key":Ljava/lang/reflect/Field;
    const-class v5, Ljava/lang/Deprecated;

    invoke-virtual {v1, v5}, Ljava/lang/reflect/Field;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v5

    if-nez v5, :cond_5b

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v5

    const-class v8, Ljava/lang/String;

    if-ne v5, v8, :cond_5b

    invoke-direct {p0, v1}, Lorg/acra/collector/SettingsCollector;->isAuthorized(Ljava/lang/reflect/Field;)Z

    move-result v5

    if-eqz v5, :cond_5b

    .line 132
    :try_start_31
    iget-object v5, p0, Lorg/acra/collector/SettingsCollector;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v8, v5}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 133
    .local v4, "value":Ljava/lang/String;
    if-eqz v4, :cond_5b

    .line 134
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v8, 0x3d

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v8, 0xa

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_5b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_31 .. :try_end_5b} :catch_5f
    .catch Ljava/lang/SecurityException; {:try_start_31 .. :try_end_5b} :catch_6a
    .catch Ljava/lang/IllegalAccessException; {:try_start_31 .. :try_end_5b} :catch_75

    .line 129
    .end local v4    # "value":Ljava/lang/String;
    :cond_5b
    :goto_5b
    add-int/lit8 v5, v6, 0x1

    move v6, v5

    goto :goto_17

    .line 136
    :catch_5f
    move-exception v0

    .line 137
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    sget-object v5, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v8, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v9, "Error: "

    invoke-interface {v5, v8, v9, v0}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5b

    .line 138
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_6a
    move-exception v0

    .line 139
    .local v0, "e":Ljava/lang/SecurityException;
    sget-object v5, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v8, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v9, "Error: "

    invoke-interface {v5, v8, v9, v0}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5b

    .line 140
    .end local v0    # "e":Ljava/lang/SecurityException;
    :catch_75
    move-exception v0

    .line 141
    .local v0, "e":Ljava/lang/IllegalAccessException;
    sget-object v5, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v8, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v9, "Error: "

    invoke-interface {v5, v8, v9, v0}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5b

    .line 145
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    .end local v1    # "key":Ljava/lang/reflect/Field;
    :cond_80
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_8
.end method

.method public collectSecureSettings()Ljava/lang/String;
    .registers 11
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 94
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .local v3, "result":Ljava/lang/StringBuilder;
    const-class v5, Landroid/provider/Settings$Secure;

    invoke-virtual {v5}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 96
    .local v2, "keys":[Ljava/lang/reflect/Field;
    array-length v7, v2

    const/4 v5, 0x0

    move v6, v5

    :goto_e
    if-ge v6, v7, :cond_6c

    aget-object v1, v2, v6

    .line 97
    .local v1, "key":Ljava/lang/reflect/Field;
    const-class v5, Ljava/lang/Deprecated;

    invoke-virtual {v1, v5}, Ljava/lang/reflect/Field;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v5

    if-nez v5, :cond_52

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v5

    const-class v8, Ljava/lang/String;

    if-ne v5, v8, :cond_52

    invoke-direct {p0, v1}, Lorg/acra/collector/SettingsCollector;->isAuthorized(Ljava/lang/reflect/Field;)Z

    move-result v5

    if-eqz v5, :cond_52

    .line 99
    :try_start_28
    iget-object v5, p0, Lorg/acra/collector/SettingsCollector;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v8, v5}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 100
    .local v4, "value":Ljava/lang/String;
    if-eqz v4, :cond_52

    .line 101
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v8, 0x3d

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v8, 0xa

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_52
    .catch Ljava/lang/IllegalArgumentException; {:try_start_28 .. :try_end_52} :catch_56
    .catch Ljava/lang/IllegalAccessException; {:try_start_28 .. :try_end_52} :catch_61

    .line 96
    .end local v4    # "value":Ljava/lang/String;
    :cond_52
    :goto_52
    add-int/lit8 v5, v6, 0x1

    move v6, v5

    goto :goto_e

    .line 103
    :catch_56
    move-exception v0

    .line 104
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    sget-object v5, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v8, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v9, "Error: "

    invoke-interface {v5, v8, v9, v0}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_52

    .line 105
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_61
    move-exception v0

    .line 106
    .local v0, "e":Ljava/lang/IllegalAccessException;
    sget-object v5, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v8, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v9, "Error: "

    invoke-interface {v5, v8, v9, v0}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_52

    .line 111
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    .end local v1    # "key":Ljava/lang/reflect/Field;
    :cond_6c
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public collectSystemSettings()Ljava/lang/String;
    .registers 11
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 62
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .local v3, "result":Ljava/lang/StringBuilder;
    const-class v5, Landroid/provider/Settings$System;

    invoke-virtual {v5}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 64
    .local v2, "keys":[Ljava/lang/reflect/Field;
    array-length v7, v2

    const/4 v5, 0x0

    move v6, v5

    :goto_e
    if-ge v6, v7, :cond_66

    aget-object v1, v2, v6

    .line 68
    .local v1, "key":Ljava/lang/reflect/Field;
    const-class v5, Ljava/lang/Deprecated;

    invoke-virtual {v1, v5}, Ljava/lang/reflect/Field;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v5

    if-nez v5, :cond_4c

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v5

    const-class v8, Ljava/lang/String;

    if-ne v5, v8, :cond_4c

    .line 70
    :try_start_22
    iget-object v5, p0, Lorg/acra/collector/SettingsCollector;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v8, v5}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 71
    .local v4, "value":Ljava/lang/String;
    if-eqz v4, :cond_4c

    .line 72
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v8, 0x3d

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v8, 0xa

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_4c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_22 .. :try_end_4c} :catch_50
    .catch Ljava/lang/IllegalAccessException; {:try_start_22 .. :try_end_4c} :catch_5b

    .line 64
    .end local v4    # "value":Ljava/lang/String;
    :cond_4c
    :goto_4c
    add-int/lit8 v5, v6, 0x1

    move v6, v5

    goto :goto_e

    .line 74
    :catch_50
    move-exception v0

    .line 75
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    sget-object v5, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v8, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v9, "Error: "

    invoke-interface {v5, v8, v9, v0}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4c

    .line 76
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_5b
    move-exception v0

    .line 77
    .local v0, "e":Ljava/lang/IllegalAccessException;
    sget-object v5, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v8, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v9, "Error: "

    invoke-interface {v5, v8, v9, v0}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4c

    .line 82
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    .end local v1    # "key":Ljava/lang/reflect/Field;
    :cond_66
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method
