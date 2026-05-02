.class public Lorg/piwik/sdk/TrackMe;
.super Ljava/lang/Object;
.source "TrackMe.java"


# static fields
.field private static final DEFAULT_QUERY_CAPACITY:I = 0xe


# instance fields
.field private final mQueryParams:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
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

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lorg/piwik/sdk/TrackMe;->mQueryParams:Ljava/util/HashMap;

    .line 21
    new-instance v0, Lorg/piwik/sdk/CustomVariables;

    invoke-direct {v0}, Lorg/piwik/sdk/CustomVariables;-><init>()V

    iput-object v0, p0, Lorg/piwik/sdk/TrackMe;->mScreenCustomVariable:Lorg/piwik/sdk/CustomVariables;

    return-void
.end method


# virtual methods
.method public declared-synchronized build()Ljava/lang/String;
    .registers 3

    .prologue
    .line 108
    monitor-enter p0

    :try_start_1
    sget-object v0, Lorg/piwik/sdk/QueryParams;->SCREEN_SCOPE_CUSTOM_VARIABLES:Lorg/piwik/sdk/QueryParams;

    iget-object v1, p0, Lorg/piwik/sdk/TrackMe;->mScreenCustomVariable:Lorg/piwik/sdk/CustomVariables;

    invoke-virtual {v1}, Lorg/piwik/sdk/CustomVariables;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 109
    iget-object v0, p0, Lorg/piwik/sdk/TrackMe;->mQueryParams:Ljava/util/HashMap;

    invoke-static {v0}, Lorg/piwik/sdk/Dispatcher;->urlEncodeUTF8(Ljava/util/Map;)Ljava/lang/String;
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_14

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 108
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

    .prologue
    .line 113
    monitor-enter p0

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

    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getScreenCustomVariable()Lorg/piwik/sdk/CustomVariables;
    .registers 2

    .prologue
    .line 126
    monitor-enter p0

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

    .prologue
    .line 60
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/piwik/sdk/TrackMe;->mQueryParams:Ljava/util/HashMap;

    invoke-virtual {p1}, Lorg/piwik/sdk/QueryParams;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_d

    move-result v0

    monitor-exit p0

    return v0

    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set(Lorg/piwik/sdk/QueryParams;F)Lorg/piwik/sdk/TrackMe;
    .registers 4
    .param p1, "key"    # Lorg/piwik/sdk/QueryParams;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # F

    .prologue
    .line 50
    monitor-enter p0

    :try_start_1
    invoke-static {p2}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .line 51
    monitor-exit p0

    return-object p0

    .line 50
    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set(Lorg/piwik/sdk/QueryParams;I)Lorg/piwik/sdk/TrackMe;
    .registers 4
    .param p1, "key"    # Lorg/piwik/sdk/QueryParams;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # I

    .prologue
    .line 45
    monitor-enter p0

    :try_start_1
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .line 46
    monitor-exit p0

    return-object p0

    .line 45
    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set(Lorg/piwik/sdk/QueryParams;J)Lorg/piwik/sdk/TrackMe;
    .registers 5
    .param p1, "key"    # Lorg/piwik/sdk/QueryParams;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # J

    .prologue
    .line 55
    monitor-enter p0

    :try_start_1
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .line 56
    monitor-exit p0

    return-object p0

    .line 55
    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;
    .registers 5
    .param p1, "key"    # Lorg/piwik/sdk/QueryParams;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 37
    monitor-enter p0

    if-nez p2, :cond_e

    .line 38
    :try_start_3
    iget-object v0, p0, Lorg/piwik/sdk/TrackMe;->mQueryParams:Ljava/util/HashMap;

    invoke-virtual {p1}, Lorg/piwik/sdk/QueryParams;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_1e

    .line 41
    :cond_c
    :goto_c
    monitor-exit p0

    return-object p0

    .line 39
    :cond_e
    :try_start_e
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_c

    .line 40
    iget-object v0, p0, Lorg/piwik/sdk/TrackMe;->mQueryParams:Ljava/util/HashMap;

    invoke-virtual {p1}, Lorg/piwik/sdk/QueryParams;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1d
    .catchall {:try_start_e .. :try_end_1d} :catchall_1e

    goto :goto_c

    .line 37
    :catchall_1e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setScreenCustomVariable(ILjava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;
    .registers 5
    .param p1, "index"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 121
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/piwik/sdk/TrackMe;->mScreenCustomVariable:Lorg/piwik/sdk/CustomVariables;

    invoke-virtual {v0, p1, p2, p3}, Lorg/piwik/sdk/CustomVariables;->put(ILjava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 122
    monitor-exit p0

    return-object p0

    .line 121
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized trySet(Lorg/piwik/sdk/QueryParams;F)Lorg/piwik/sdk/TrackMe;
    .registers 4
    .param p1, "key"    # Lorg/piwik/sdk/QueryParams;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # F

    .prologue
    .line 82
    monitor-enter p0

    :try_start_1
    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_b

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized trySet(Lorg/piwik/sdk/QueryParams;I)Lorg/piwik/sdk/TrackMe;
    .registers 4
    .param p1, "key"    # Lorg/piwik/sdk/QueryParams;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # I

    .prologue
    .line 71
    monitor-enter p0

    :try_start_1
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_b

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized trySet(Lorg/piwik/sdk/QueryParams;J)Lorg/piwik/sdk/TrackMe;
    .registers 5
    .param p1, "key"    # Lorg/piwik/sdk/QueryParams;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # J

    .prologue
    .line 86
    monitor-enter p0

    :try_start_1
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_b

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;
    .registers 4
    .param p1, "key"    # Lorg/piwik/sdk/QueryParams;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 97
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0, p1}, Lorg/piwik/sdk/TrackMe;->has(Lorg/piwik/sdk/QueryParams;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 98
    invoke-virtual {p0, p1, p2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 99
    :cond_a
    monitor-exit p0

    return-object p0

    .line 97
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method
