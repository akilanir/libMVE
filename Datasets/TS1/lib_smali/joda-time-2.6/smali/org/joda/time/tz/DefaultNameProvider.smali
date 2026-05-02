.class public Lorg/joda/time/tz/DefaultNameProvider;
.super Ljava/lang/Object;
.source "DefaultNameProvider.java"

# interfaces
.implements Lorg/joda/time/tz/NameProvider;


# instance fields
.field private iByLocaleCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/util/Locale;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private iByLocaleCache2:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/util/Locale;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Object;",
            ">;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    invoke-direct {p0}, Lorg/joda/time/tz/DefaultNameProvider;->createCache()Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Lorg/joda/time/tz/DefaultNameProvider;->iByLocaleCache:Ljava/util/HashMap;

    .line 38
    invoke-direct {p0}, Lorg/joda/time/tz/DefaultNameProvider;->createCache()Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Lorg/joda/time/tz/DefaultNameProvider;->iByLocaleCache2:Ljava/util/HashMap;

    .line 41
    return-void
.end method

.method private createCache()Ljava/util/HashMap;
    .registers 3

    .prologue
    .line 156
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    return-object v0
.end method

.method private declared-synchronized getNameSet(Ljava/util/Locale;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .registers 13

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 57
    monitor-enter p0

    if-eqz p1, :cond_9

    if-eqz p2, :cond_9

    if-nez p3, :cond_c

    :cond_9
    move-object v0, v1

    .line 99
    :goto_a
    monitor-exit p0

    return-object v0

    .line 61
    :cond_c
    :try_start_c
    iget-object v0, p0, Lorg/joda/time/tz/DefaultNameProvider;->iByLocaleCache:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 62
    if-nez v0, :cond_e9

    .line 63
    iget-object v3, p0, Lorg/joda/time/tz/DefaultNameProvider;->iByLocaleCache:Ljava/util/HashMap;

    invoke-direct {p0}, Lorg/joda/time/tz/DefaultNameProvider;->createCache()Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v3, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v3, v0

    .line 66
    :goto_20
    invoke-interface {v3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 67
    if-nez v0, :cond_ba

    .line 68
    invoke-direct {p0}, Lorg/joda/time/tz/DefaultNameProvider;->createCache()Ljava/util/HashMap;

    move-result-object v0

    invoke-interface {v3, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-static {v3}, Lorg/joda/time/DateTimeUtils;->getDateFormatSymbols(Ljava/util/Locale;)Ljava/text/DateFormatSymbols;

    move-result-object v3

    invoke-virtual {v3}, Ljava/text/DateFormatSymbols;->getZoneStrings()[[Ljava/lang/String;

    move-result-object v5

    .line 72
    array-length v6, v5

    move v4, v2

    :goto_3b
    if-ge v4, v6, :cond_e6

    aget-object v3, v5, v4

    .line 73
    if-eqz v3, :cond_c4

    array-length v7, v3

    const/4 v8, 0x5

    if-ne v7, v8, :cond_c4

    const/4 v7, 0x0

    aget-object v7, v3, v7

    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_c4

    move-object v4, v3

    .line 78
    :goto_4f
    invoke-static {p1}, Lorg/joda/time/DateTimeUtils;->getDateFormatSymbols(Ljava/util/Locale;)Ljava/text/DateFormatSymbols;

    move-result-object v3

    invoke-virtual {v3}, Ljava/text/DateFormatSymbols;->getZoneStrings()[[Ljava/lang/String;

    move-result-object v5

    .line 80
    array-length v6, v5

    move v3, v2

    :goto_59
    if-ge v3, v6, :cond_6d

    aget-object v2, v5, v3

    .line 81
    if-eqz v2, :cond_c9

    array-length v7, v2

    const/4 v8, 0x5

    if-ne v7, v8, :cond_c9

    const/4 v7, 0x0

    aget-object v7, v2, v7

    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_c9

    move-object v1, v2

    .line 87
    :cond_6d
    if-eqz v4, :cond_ba

    if-eqz v1, :cond_ba

    .line 88
    const/4 v2, 0x2

    aget-object v2, v4, v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x2

    aget-object v6, v1, v6

    aput-object v6, v3, v5

    const/4 v5, 0x1

    const/4 v6, 0x1

    aget-object v6, v1, v6

    aput-object v6, v3, v5

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    const/4 v2, 0x2

    aget-object v2, v4, v2

    const/4 v3, 0x4

    aget-object v3, v4, v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cd

    .line 93
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x4

    aget-object v3, v4, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "-Summer"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x4

    aget-object v5, v1, v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const/4 v5, 0x3

    aget-object v1, v1, v5

    aput-object v1, v3, v4

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    :cond_ba
    :goto_ba
    invoke-interface {v0, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    check-cast v0, [Ljava/lang/String;

    goto/16 :goto_a

    .line 72
    :cond_c4
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    goto/16 :goto_3b

    .line 80
    :cond_c9
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    goto :goto_59

    .line 95
    :cond_cd
    const/4 v2, 0x4

    aget-object v2, v4, v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x4

    aget-object v5, v1, v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const/4 v5, 0x3

    aget-object v1, v1, v5

    aput-object v1, v3, v4

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_e2
    .catchall {:try_start_c .. :try_end_e2} :catchall_e3

    goto :goto_ba

    .line 57
    :catchall_e3
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_e6
    move-object v4, v1

    goto/16 :goto_4f

    :cond_e9
    move-object v3, v0

    goto/16 :goto_20
.end method

.method private declared-synchronized getNameSet(Ljava/util/Locale;Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;
    .registers 14

    .prologue
    const/4 v8, 0x5

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 116
    monitor-enter p0

    if-eqz p1, :cond_a

    if-eqz p2, :cond_a

    if-nez p3, :cond_d

    :cond_a
    move-object v0, v1

    .line 151
    :goto_b
    monitor-exit p0

    return-object v0

    .line 120
    :cond_d
    :try_start_d
    iget-object v0, p0, Lorg/joda/time/tz/DefaultNameProvider;->iByLocaleCache2:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 121
    if-nez v0, :cond_b3

    .line 122
    iget-object v3, p0, Lorg/joda/time/tz/DefaultNameProvider;->iByLocaleCache2:Ljava/util/HashMap;

    invoke-direct {p0}, Lorg/joda/time/tz/DefaultNameProvider;->createCache()Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v3, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v3, v0

    .line 125
    :goto_21
    invoke-interface {v3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 126
    if-nez v0, :cond_98

    .line 127
    invoke-direct {p0}, Lorg/joda/time/tz/DefaultNameProvider;->createCache()Ljava/util/HashMap;

    move-result-object v0

    invoke-interface {v3, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-static {v3}, Lorg/joda/time/DateTimeUtils;->getDateFormatSymbols(Ljava/util/Locale;)Ljava/text/DateFormatSymbols;

    move-result-object v3

    invoke-virtual {v3}, Ljava/text/DateFormatSymbols;->getZoneStrings()[[Ljava/lang/String;

    move-result-object v5

    .line 131
    array-length v6, v5

    move v4, v2

    :goto_3c
    if-ge v4, v6, :cond_b1

    aget-object v3, v5, v4

    .line 132
    if-eqz v3, :cond_a6

    array-length v7, v3

    if-ne v7, v8, :cond_a6

    const/4 v7, 0x0

    aget-object v7, v3, v7

    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a6

    move-object v4, v3

    .line 137
    :goto_4f
    invoke-static {p1}, Lorg/joda/time/DateTimeUtils;->getDateFormatSymbols(Ljava/util/Locale;)Ljava/text/DateFormatSymbols;

    move-result-object v3

    invoke-virtual {v3}, Ljava/text/DateFormatSymbols;->getZoneStrings()[[Ljava/lang/String;

    move-result-object v5

    .line 139
    array-length v6, v5

    move v3, v2

    :goto_59
    if-ge v3, v6, :cond_6c

    aget-object v2, v5, v3

    .line 140
    if-eqz v2, :cond_aa

    array-length v7, v2

    if-ne v7, v8, :cond_aa

    const/4 v7, 0x0

    aget-object v7, v2, v7

    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_aa

    move-object v1, v2

    .line 146
    :cond_6c
    if-eqz v4, :cond_98

    if-eqz v1, :cond_98

    .line 147
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x2

    aget-object v5, v1, v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const/4 v5, 0x1

    aget-object v5, v1, v5

    aput-object v5, v3, v4

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x4

    aget-object v5, v1, v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const/4 v5, 0x3

    aget-object v1, v1, v5

    aput-object v1, v3, v4

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    :cond_98
    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    check-cast v0, [Ljava/lang/String;
    :try_end_a4
    .catchall {:try_start_d .. :try_end_a4} :catchall_ae

    goto/16 :goto_b

    .line 131
    :cond_a6
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    goto :goto_3c

    .line 139
    :cond_aa
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    goto :goto_59

    .line 116
    :catchall_ae
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_b1
    move-object v4, v1

    goto :goto_4f

    :cond_b3
    move-object v3, v0

    goto/16 :goto_21
.end method


# virtual methods
.method public getName(Ljava/util/Locale;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .prologue
    .line 52
    invoke-direct {p0, p1, p2, p3}, Lorg/joda/time/tz/DefaultNameProvider;->getNameSet(Ljava/util/Locale;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 53
    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    const/4 v1, 0x1

    aget-object v0, v0, v1

    goto :goto_7
.end method

.method public getName(Ljava/util/Locale;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 7

    .prologue
    .line 111
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/joda/time/tz/DefaultNameProvider;->getNameSet(Ljava/util/Locale;Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v0

    .line 112
    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    const/4 v1, 0x1

    aget-object v0, v0, v1

    goto :goto_7
.end method

.method public getShortName(Ljava/util/Locale;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .prologue
    .line 47
    invoke-direct {p0, p1, p2, p3}, Lorg/joda/time/tz/DefaultNameProvider;->getNameSet(Ljava/util/Locale;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 48
    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    const/4 v1, 0x0

    aget-object v0, v0, v1

    goto :goto_7
.end method

.method public getShortName(Ljava/util/Locale;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 7

    .prologue
    .line 106
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/joda/time/tz/DefaultNameProvider;->getNameSet(Ljava/util/Locale;Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v0

    .line 107
    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    const/4 v1, 0x0

    aget-object v0, v0, v1

    goto :goto_7
.end method
