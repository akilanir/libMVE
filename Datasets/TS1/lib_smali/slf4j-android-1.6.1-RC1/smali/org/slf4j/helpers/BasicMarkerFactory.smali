.class public Lorg/slf4j/helpers/BasicMarkerFactory;
.super Ljava/lang/Object;
.source "BasicMarkerFactory.java"

# interfaces
.implements Lorg/slf4j/IMarkerFactory;


# instance fields
.field markerMap:Ljava/util/Map;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/slf4j/helpers/BasicMarkerFactory;->markerMap:Ljava/util/Map;

    .line 53
    return-void
.end method


# virtual methods
.method public detachMarker(Ljava/lang/String;)Z
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 86
    if-nez p1, :cond_4

    .line 89
    :cond_3
    :goto_3
    return v0

    :cond_4
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMarkerFactory;->markerMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_3

    const/4 v0, 0x1

    goto :goto_3
.end method

.method public declared-synchronized exists(Ljava/lang/String;)Z
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 79
    monitor-enter p0

    if-nez p1, :cond_6

    .line 80
    const/4 v0, 0x0

    .line 82
    :goto_4
    monitor-exit p0

    return v0

    :cond_6
    :try_start_6
    iget-object v0, p0, Lorg/slf4j/helpers/BasicMarkerFactory;->markerMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z
    :try_end_b
    .catchall {:try_start_6 .. :try_end_b} :catchall_d

    move-result v0

    goto :goto_4

    .line 79
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getDetachedMarker(Ljava/lang/String;)Lorg/slf4j/Marker;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 94
    new-instance v0, Lorg/slf4j/helpers/BasicMarker;

    invoke-direct {v0, p1}, Lorg/slf4j/helpers/BasicMarker;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public declared-synchronized getMarker(Ljava/lang/String;)Lorg/slf4j/Marker;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 63
    monitor-enter p0

    if-nez p1, :cond_e

    .line 64
    :try_start_3
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Marker name cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_b

    .line 63
    :catchall_b
    move-exception v1

    monitor-exit p0

    throw v1

    .line 67
    :cond_e
    :try_start_e
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMarkerFactory;->markerMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/slf4j/Marker;

    .line 68
    .local v0, "marker":Lorg/slf4j/Marker;
    if-nez v0, :cond_22

    .line 69
    new-instance v0, Lorg/slf4j/helpers/BasicMarker;

    .end local v0    # "marker":Lorg/slf4j/Marker;
    invoke-direct {v0, p1}, Lorg/slf4j/helpers/BasicMarker;-><init>(Ljava/lang/String;)V

    .line 70
    .restart local v0    # "marker":Lorg/slf4j/Marker;
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMarkerFactory;->markerMap:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_22
    .catchall {:try_start_e .. :try_end_22} :catchall_b

    .line 72
    :cond_22
    monitor-exit p0

    return-object v0
.end method
