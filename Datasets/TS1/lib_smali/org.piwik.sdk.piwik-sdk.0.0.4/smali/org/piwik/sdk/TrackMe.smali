.class public Lorg/piwik/sdk/TrackMe;
.super Ljava/lang/Object;
.source "TrackMe.java"


# static fields
.field private static final DEFAULT_QUERY_CAPACITY:I = 0xe


# instance fields
.field private final mQueryParams:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mScreenCustomVariable:Lorg/piwik/sdk/CustomVariables;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lorg/piwik/sdk/TrackMe;->mQueryParams:Ljava/util/HashMap;

    .line 23
    new-instance v0, Lorg/piwik/sdk/CustomVariables;

    invoke-direct {v0}, Lorg/piwik/sdk/CustomVariables;-><init>()V

    iput-object v0, p0, Lorg/piwik/sdk/TrackMe;->mScreenCustomVariable:Lorg/piwik/sdk/CustomVariables;

    return-void
.end method


# virtual methods
.method public declared-synchronized build()Ljava/lang/String;
    .registers 3

    monitor-enter p0

    .line 115
    :try_start_1
    sget-object v0, Lorg/piwik/sdk/QueryParams;->SCREEN_SCOPE_CUSTOM_VARIABLES:Lorg/piwik/sdk/QueryParams;

    iget-object v1, p0, Lorg/piwik/sdk/TrackMe;->mScreenCustomVariable:Lorg/piwik/sdk/CustomVariables;

    invoke-virtual {v1}, Lorg/piwik/sdk/CustomVariables;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 116
    iget-object v0, p0, Lorg/piwik/sdk/TrackMe;->mQueryParams:Ljava/util/HashMap;

    invoke-static {v0}, Lorg/piwik/sdk/dispatcher/Dispatcher;->urlEncodeUTF8(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_14

    monitor-exit p0

    return-object v0

    .line 114
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;
    .registers 4
    .param p1, "queryParams"    # Lorg/piwik/sdk/QueryParams;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    .line 120
    :try_start_1
    iget-object v0, p0, Lorg/piwik/sdk/TrackMe;->mQueryParams:Ljava/util/HashMap;

    invoke-virtual {p1}, Lorg/piwik/sdk/QueryParams;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 120
    .end local p1    # "queryParams":Lorg/piwik/sdk/QueryParams;
    :catchall_f
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getScreenCustomVariable()Lorg/piwik/sdk/CustomVariables;
    .registers 2

    monitor-enter p0

    .line 133
    :try_start_1
    iget-object v0, p0, Lorg/piwik/sdk/TrackMe;->mScreenCustomVariable:Lorg/piwik/sdk/CustomVariables;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized has(Lorg/piwik/sdk/QueryParams;)Z
    .registers 4
    .param p1, "queryParams"    # Lorg/piwik/sdk/QueryParams;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    .line 67
    :try_start_1
    iget-object v0, p0, Lorg/piwik/sdk/TrackMe;->mQueryParams:Ljava/util/HashMap;

    invoke-virtual {p1}, Lorg/piwik/sdk/QueryParams;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    monitor-exit p0

    return v0

    .line 67
    .end local p1    # "queryParams":Lorg/piwik/sdk/QueryParams;
    :catchall_d
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected declared-synchronized set(Ljava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # Ljava/lang/String;

    monitor-enter p0

    .line 26
    if-nez p2, :cond_b

    .line 27
    :try_start_3
    iget-object v0, p0, Lorg/piwik/sdk/TrackMe;->mQueryParams:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_16

    .line 25
    .end local p1    # "key":Ljava/lang/String;
    .end local p2    # "value":Ljava/lang/String;
    :catchall_9
    move-exception p1

    goto :goto_18

    .line 28
    .restart local p1    # "key":Ljava/lang/String;
    .restart local p2    # "value":Ljava/lang/String;
    :cond_b
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_16

    .line 29
    iget-object v0, p0, Lorg/piwik/sdk/TrackMe;->mQueryParams:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_9

    .line 30
    :cond_16
    :goto_16
    monitor-exit p0

    return-object p0

    .line 25
    .end local p1    # "key":Ljava/lang/String;
    .end local p2    # "value":Ljava/lang/String;
    :goto_18
    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized set(Lorg/piwik/sdk/QueryParams;F)Lorg/piwik/sdk/TrackMe;
    .registers 4
    .param p1, "key"    # Lorg/piwik/sdk/QueryParams;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # F

    monitor-enter p0

    .line 57
    :try_start_1
    invoke-static {p2}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .line 58
    monitor-exit p0

    return-object p0

    .line 56
    .end local p1    # "key":Lorg/piwik/sdk/QueryParams;
    .end local p2    # "value":F
    :catchall_a
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized set(Lorg/piwik/sdk/QueryParams;I)Lorg/piwik/sdk/TrackMe;
    .registers 4
    .param p1, "key"    # Lorg/piwik/sdk/QueryParams;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # I

    monitor-enter p0

    .line 52
    :try_start_1
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .line 53
    monitor-exit p0

    return-object p0

    .line 51
    .end local p1    # "key":Lorg/piwik/sdk/QueryParams;
    .end local p2    # "value":I
    :catchall_a
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized set(Lorg/piwik/sdk/QueryParams;J)Lorg/piwik/sdk/TrackMe;
    .registers 5
    .param p1, "key"    # Lorg/piwik/sdk/QueryParams;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # J

    monitor-enter p0

    .line 62
    :try_start_1
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .line 63
    monitor-exit p0

    return-object p0

    .line 61
    .end local p1    # "key":Lorg/piwik/sdk/QueryParams;
    .end local p2    # "value":J
    :catchall_a
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;
    .registers 4
    .param p1, "key"    # Lorg/piwik/sdk/QueryParams;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # Ljava/lang/String;

    monitor-enter p0

    .line 47
    :try_start_1
    invoke-virtual {p1}, Lorg/piwik/sdk/QueryParams;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lorg/piwik/sdk/TrackMe;->set(Ljava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .line 48
    monitor-exit p0

    return-object p0

    .line 46
    .end local p1    # "key":Lorg/piwik/sdk/QueryParams;
    .end local p2    # "value":Ljava/lang/String;
    :catchall_a
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setScreenCustomVariable(ILjava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;
    .registers 5
    .param p1, "index"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    monitor-enter p0

    .line 128
    :try_start_1
    iget-object v0, p0, Lorg/piwik/sdk/TrackMe;->mScreenCustomVariable:Lorg/piwik/sdk/CustomVariables;

    invoke-virtual {v0, p1, p2, p3}, Lorg/piwik/sdk/CustomVariables;->put(ILjava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 129
    monitor-exit p0

    return-object p0

    .line 127
    .end local p1    # "index":I
    .end local p2    # "name":Ljava/lang/String;
    .end local p3    # "value":Ljava/lang/String;
    :catchall_8
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized trySet(Lorg/piwik/sdk/QueryParams;F)Lorg/piwik/sdk/TrackMe;
    .registers 4
    .param p1, "key"    # Lorg/piwik/sdk/QueryParams;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # F

    monitor-enter p0

    .line 89
    :try_start_1
    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    monitor-exit p0

    return-object v0

    .line 89
    .end local p1    # "key":Lorg/piwik/sdk/QueryParams;
    .end local p2    # "value":F
    :catchall_b
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized trySet(Lorg/piwik/sdk/QueryParams;I)Lorg/piwik/sdk/TrackMe;
    .registers 4
    .param p1, "key"    # Lorg/piwik/sdk/QueryParams;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # I

    monitor-enter p0

    .line 78
    :try_start_1
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    monitor-exit p0

    return-object v0

    .line 78
    .end local p1    # "key":Lorg/piwik/sdk/QueryParams;
    .end local p2    # "value":I
    :catchall_b
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized trySet(Lorg/piwik/sdk/QueryParams;J)Lorg/piwik/sdk/TrackMe;
    .registers 5
    .param p1, "key"    # Lorg/piwik/sdk/QueryParams;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # J

    monitor-enter p0

    .line 93
    :try_start_1
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    monitor-exit p0

    return-object v0

    .line 93
    .end local p1    # "key":Lorg/piwik/sdk/QueryParams;
    .end local p2    # "value":J
    :catchall_b
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;
    .registers 4
    .param p1, "key"    # Lorg/piwik/sdk/QueryParams;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # Ljava/lang/String;

    monitor-enter p0

    .line 104
    :try_start_1
    invoke-virtual {p0, p1}, Lorg/piwik/sdk/TrackMe;->has(Lorg/piwik/sdk/QueryParams;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 105
    invoke-virtual {p0, p1, p2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 106
    :cond_a
    monitor-exit p0

    return-object p0

    .line 103
    .end local p1    # "key":Lorg/piwik/sdk/QueryParams;
    .end local p2    # "value":Ljava/lang/String;
    :catchall_c
    move-exception p1

    monitor-exit p0

    throw p1
.end method
