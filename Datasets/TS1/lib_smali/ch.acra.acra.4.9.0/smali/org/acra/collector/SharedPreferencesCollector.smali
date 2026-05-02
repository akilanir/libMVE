.class final Lorg/acra/collector/SharedPreferencesCollector;
.super Ljava/lang/Object;
.source "SharedPreferencesCollector.java"


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
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lorg/acra/collector/SharedPreferencesCollector;->context:Landroid/content/Context;

    .line 44
    iput-object p2, p0, Lorg/acra/collector/SharedPreferencesCollector;->config:Lorg/acra/config/ACRAConfiguration;

    .line 45
    return-void
.end method

.method private filteredKey(Ljava/lang/String;)Z
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 107
    iget-object v1, p0, Lorg/acra/collector/SharedPreferencesCollector;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v1}, Lorg/acra/config/ACRAConfiguration;->excludeMatchingSharedPreferencesKeys()Lorg/acra/collections/ImmutableSet;

    move-result-object v1

    invoke-virtual {v1}, Lorg/acra/collections/ImmutableSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 108
    .local v0, "regex":Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 109
    const/4 v1, 0x1

    .line 112
    .end local v0    # "regex":Ljava/lang/String;
    :goto_1d
    return v1

    :cond_1e
    const/4 v1, 0x0

    goto :goto_1d
.end method


# virtual methods
.method public collect()Ljava/lang/String;
    .registers 15
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 58
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .local v5, "result":Ljava/lang/StringBuilder;
    new-instance v7, Ljava/util/TreeMap;

    invoke-direct {v7}, Ljava/util/TreeMap;-><init>()V

    .line 62
    .local v7, "sharedPrefs":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroid/content/SharedPreferences;>;"
    const-string v8, "default"

    iget-object v9, p0, Lorg/acra/collector/SharedPreferencesCollector;->context:Landroid/content/Context;

    invoke-static {v9}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v9

    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    iget-object v8, p0, Lorg/acra/collector/SharedPreferencesCollector;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v8}, Lorg/acra/config/ACRAConfiguration;->additionalSharedPreferences()Lorg/acra/collections/ImmutableSet;

    move-result-object v8

    invoke-virtual {v8}, Lorg/acra/collections/ImmutableSet;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1f
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_36

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 66
    .local v6, "sharedPrefId":Ljava/lang/String;
    iget-object v9, p0, Lorg/acra/collector/SharedPreferencesCollector;->context:Landroid/content/Context;

    const/4 v10, 0x0

    invoke-virtual {v9, v6, v10}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v9

    invoke-interface {v7, v6, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 70
    .end local v6    # "sharedPrefId":Ljava/lang/String;
    :cond_36
    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_3e
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_fb

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 71
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroid/content/SharedPreferences;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 72
    .restart local v6    # "sharedPrefId":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/SharedPreferences;

    .line 74
    .local v4, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v4}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v1

    .line 77
    .local v1, "prefEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_70

    .line 78
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/16 v10, 0x3d

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, "empty\n"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3e

    .line 83
    :cond_70
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_78
    :goto_78
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_f4

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 84
    .local v2, "prefEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;*>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-direct {p0, v8}, Lorg/acra/collector/SharedPreferencesCollector;->filteredKey(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_c5

    .line 85
    sget-boolean v8, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v8, :cond_78

    sget-object v11, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v12, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Filtered out sharedPreference="

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v13, "  key="

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v13, " due to filtering rule"

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v11, v12, v8}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_78

    .line 87
    :cond_c5
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    .line 88
    .local v3, "prefValue":Ljava/lang/Object;
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/16 v11, 0x2e

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/16 v11, 0x3d

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 89
    if-nez v3, :cond_ef

    const-string v8, "null"

    :goto_e6
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    const/16 v8, 0xa

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_78

    .line 89
    :cond_ef
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_e6

    .line 93
    .end local v2    # "prefEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;*>;"
    .end local v3    # "prefValue":Ljava/lang/Object;
    :cond_f4
    const/16 v8, 0xa

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_3e

    .line 96
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroid/content/SharedPreferences;>;"
    .end local v1    # "prefEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    .end local v4    # "prefs":Landroid/content/SharedPreferences;
    .end local v6    # "sharedPrefId":Ljava/lang/String;
    :cond_fb
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method
