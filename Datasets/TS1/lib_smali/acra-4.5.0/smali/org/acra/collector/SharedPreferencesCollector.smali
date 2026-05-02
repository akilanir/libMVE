.class final Lorg/acra/collector/SharedPreferencesCollector;
.super Ljava/lang/Object;
.source "SharedPreferencesCollector.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static collect(Landroid/content/Context;)Ljava/lang/String;
    .registers 15
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 49
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .local v8, "result":Ljava/lang/StringBuilder;
    new-instance v10, Ljava/util/TreeMap;

    invoke-direct {v10}, Ljava/util/TreeMap;-><init>()V

    .line 51
    .local v10, "shrdPrefs":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroid/content/SharedPreferences;>;"
    const-string v12, "default"

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v13

    invoke-interface {v10, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v12

    invoke-virtual {v12}, Lorg/acra/ACRAConfiguration;->additionalSharedPreferences()[Ljava/lang/String;

    move-result-object v11

    .line 53
    .local v11, "shrdPrefsIds":[Ljava/lang/String;
    if-eqz v11, :cond_2f

    .line 54
    move-object v0, v11

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_20
    if-ge v1, v5, :cond_2f

    aget-object v9, v0, v1

    .line 55
    .local v9, "shrdPrefId":Ljava/lang/String;
    const/4 v12, 0x0

    invoke-virtual {p0, v9, v12}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v12

    invoke-interface {v10, v9, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    add-int/lit8 v1, v1, 0x1

    goto :goto_20

    .line 59
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "i$":I
    .end local v5    # "len$":I
    .end local v9    # "shrdPrefId":Ljava/lang/String;
    :cond_2f
    invoke-interface {v10}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_37
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_d3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 60
    .local v7, "prefsId":Ljava/lang/String;
    invoke-interface {v10, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/SharedPreferences;

    .line 61
    .local v6, "prefs":Landroid/content/SharedPreferences;
    if-eqz v6, :cond_cd

    .line 62
    invoke-interface {v6}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v4

    .line 63
    .local v4, "kv":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    if-eqz v4, :cond_b7

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v12

    if-lez v12, :cond_b7

    .line 64
    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_5f
    :goto_5f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_c6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 65
    .local v3, "key":Ljava/lang/String;
    invoke-static {v3}, Lorg/acra/collector/SharedPreferencesCollector;->filteredKey(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_5f

    .line 66
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    if-eqz v12, :cond_9d

    .line 67
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const/16 v13, 0x2e

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const/16 v13, 0x3d

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_5f

    .line 69
    :cond_9d
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const/16 v13, 0x2e

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const/16 v13, 0x3d

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "null\n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_5f

    .line 74
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "key":Ljava/lang/String;
    :cond_b7
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const/16 v13, 0x3d

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "empty\n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .end local v4    # "kv":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    :cond_c6
    :goto_c6
    const/16 v12, 0xa

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_37

    .line 77
    :cond_cd
    const-string v12, "null\n"

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_c6

    .line 82
    .end local v6    # "prefs":Landroid/content/SharedPreferences;
    .end local v7    # "prefsId":Ljava/lang/String;
    :cond_d3
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    return-object v12
.end method

.method private static filteredKey(Ljava/lang/String;)Z
    .registers 6
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 94
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v4

    invoke-virtual {v4}, Lorg/acra/ACRAConfiguration;->excludeMatchingSharedPreferencesKeys()[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_a
    if-ge v1, v2, :cond_19

    aget-object v3, v0, v1

    .line 95
    .local v3, "regex":Ljava/lang/String;
    invoke-virtual {p0, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_16

    .line 96
    const/4 v4, 0x1

    .line 99
    .end local v3    # "regex":Ljava/lang/String;
    :goto_15
    return v4

    .line 94
    .restart local v3    # "regex":Ljava/lang/String;
    :cond_16
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 99
    .end local v3    # "regex":Ljava/lang/String;
    :cond_19
    const/4 v4, 0x0

    goto :goto_15
.end method
