.class Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;
.super Lfreemarker/debug/impl/RmiDebugModelImpl;
.source "RmiDebuggedEnvironmentImpl.java"

# interfaces
.implements Lfreemarker/debug/DebuggedEnvironment;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$1;,
        Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugEnvironmentModel;,
        Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugTemplateModel;,
        Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel;,
        Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurableModel;,
        Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugMapModel;
    }
.end annotation


# static fields
.field private static final idLock:Ljava/lang/Object;

.field private static nextId:J = 0x0L

.field private static remotes:Ljava/util/Set; = null

.field private static final serialVersionUID:J = 0x1L

.field private static final storage:Lfreemarker/cache/CacheStorage;


# instance fields
.field private final id:J

.field private stopped:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 43
    new-instance v0, Lfreemarker/cache/SoftCacheStorage;

    new-instance v1, Lfreemarker/ext/util/IdentityHashMap;

    invoke-direct {v1}, Lfreemarker/ext/util/IdentityHashMap;-><init>()V

    invoke-direct {v0, v1}, Lfreemarker/cache/SoftCacheStorage;-><init>(Ljava/util/Map;)V

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->storage:Lfreemarker/cache/CacheStorage;

    .line 44
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->idLock:Ljava/lang/Object;

    .line 45
    const-wide/16 v0, 0x1

    sput-wide v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->nextId:J

    .line 46
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->remotes:Ljava/util/Set;

    return-void
.end method

.method private constructor <init>(Lfreemarker/core/Environment;)V
    .registers 8
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 54
    new-instance v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugEnvironmentModel;

    invoke-direct {v0, p1}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugEnvironmentModel;-><init>(Lfreemarker/core/Environment;)V

    const/16 v1, 0x800

    invoke-direct {p0, v0, v1}, Lfreemarker/debug/impl/RmiDebugModelImpl;-><init>(Lfreemarker/template/TemplateModel;I)V

    .line 49
    const/4 v0, 0x0

    iput-boolean v0, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->stopped:Z

    .line 55
    sget-object v1, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->idLock:Ljava/lang/Object;

    monitor-enter v1

    .line 57
    :try_start_10
    sget-wide v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->nextId:J

    const-wide/16 v4, 0x1

    add-long/2addr v4, v2

    sput-wide v4, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->nextId:J

    iput-wide v2, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->id:J

    .line 58
    monitor-exit v1

    .line 59
    return-void

    .line 58
    :catchall_1b
    move-exception v0

    monitor-exit v1
    :try_end_1d
    .catchall {:try_start_10 .. :try_end_1d} :catchall_1b

    throw v0
.end method

.method public static cleanup()V
    .registers 3

    .prologue
    .line 368
    sget-object v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->remotes:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 370
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 373
    .local v1, "remoteObject":Ljava/lang/Object;
    :try_start_10
    check-cast v1, Ljava/rmi/Remote;

    .end local v1    # "remoteObject":Ljava/lang/Object;
    const/4 v2, 0x1

    invoke-static {v1, v2}, Ljava/rmi/server/UnicastRemoteObject;->unexportObject(Ljava/rmi/Remote;Z)Z
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_16} :catch_17

    goto :goto_6

    .line 375
    :catch_17
    move-exception v2

    goto :goto_6

    .line 379
    :cond_19
    return-void
.end method

.method static declared-synchronized getCachedWrapperFor(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p0, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 65
    const-class v4, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;

    monitor-enter v4

    :try_start_3
    sget-object v3, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->storage:Lfreemarker/cache/CacheStorage;

    invoke-interface {v3, p0}, Lfreemarker/cache/CacheStorage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 66
    .local v2, "value":Ljava/lang/Object;
    if-nez v2, :cond_1e

    .line 68
    instance-of v3, p0, Lfreemarker/template/TemplateModel;

    if-eqz v3, :cond_39

    .line 71
    instance-of v3, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel;

    if-eqz v3, :cond_30

    .line 73
    const/16 v1, 0x2000

    .line 83
    .local v1, "extraTypes":I
    :goto_15
    new-instance v2, Lfreemarker/debug/impl/RmiDebugModelImpl;

    .end local v2    # "value":Ljava/lang/Object;
    move-object v0, p0

    check-cast v0, Lfreemarker/template/TemplateModel;

    move-object v3, v0

    invoke-direct {v2, v3, v1}, Lfreemarker/debug/impl/RmiDebugModelImpl;-><init>(Lfreemarker/template/TemplateModel;I)V

    .line 98
    .end local v1    # "extraTypes":I
    :cond_1e
    :goto_1e
    if-eqz v2, :cond_25

    .line 100
    sget-object v3, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->storage:Lfreemarker/cache/CacheStorage;

    invoke-interface {v3, p0, v2}, Lfreemarker/cache/CacheStorage;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 102
    :cond_25
    instance-of v3, v2, Ljava/rmi/Remote;

    if-eqz v3, :cond_2e

    .line 104
    sget-object v3, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->remotes:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_2e
    .catchall {:try_start_3 .. :try_end_2e} :catchall_63

    .line 106
    :cond_2e
    monitor-exit v4

    return-object v2

    .line 75
    .restart local v2    # "value":Ljava/lang/Object;
    :cond_30
    :try_start_30
    instance-of v3, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugTemplateModel;

    if-eqz v3, :cond_37

    .line 77
    const/16 v1, 0x1000

    .restart local v1    # "extraTypes":I
    goto :goto_15

    .line 81
    .end local v1    # "extraTypes":I
    :cond_37
    const/4 v1, 0x0

    .restart local v1    # "extraTypes":I
    goto :goto_15

    .line 85
    .end local v1    # "extraTypes":I
    :cond_39
    instance-of v3, p0, Lfreemarker/core/Environment;

    if-eqz v3, :cond_47

    .line 87
    new-instance v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;

    .end local v2    # "value":Ljava/lang/Object;
    move-object v0, p0

    check-cast v0, Lfreemarker/core/Environment;

    move-object v3, v0

    invoke-direct {v2, v3}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;-><init>(Lfreemarker/core/Environment;)V

    .local v2, "value":Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;
    goto :goto_1e

    .line 89
    .local v2, "value":Ljava/lang/Object;
    :cond_47
    instance-of v3, p0, Lfreemarker/template/Template;

    if-eqz v3, :cond_55

    .line 91
    new-instance v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugTemplateModel;

    .end local v2    # "value":Ljava/lang/Object;
    move-object v0, p0

    check-cast v0, Lfreemarker/template/Template;

    move-object v3, v0

    invoke-direct {v2, v3}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugTemplateModel;-><init>(Lfreemarker/template/Template;)V

    .local v2, "value":Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugTemplateModel;
    goto :goto_1e

    .line 93
    .local v2, "value":Ljava/lang/Object;
    :cond_55
    instance-of v3, p0, Lfreemarker/template/Configuration;

    if-eqz v3, :cond_1e

    .line 95
    new-instance v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel;

    .end local v2    # "value":Ljava/lang/Object;
    move-object v0, p0

    check-cast v0, Lfreemarker/template/Configuration;

    move-object v3, v0

    invoke-direct {v2, v3}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel;-><init>(Lfreemarker/template/Configuration;)V
    :try_end_62
    .catchall {:try_start_30 .. :try_end_62} :catchall_63

    .local v2, "value":Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel;
    goto :goto_1e

    .line 65
    .end local v2    # "value":Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel;
    :catchall_63
    move-exception v3

    monitor-exit v4

    throw v3
.end method


# virtual methods
.method public getId()J
    .registers 3

    .prologue
    .line 125
    iget-wide v0, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->id:J

    return-wide v0
.end method

.method isStopped()Z
    .registers 2

    .prologue
    .line 130
    iget-boolean v0, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->stopped:Z

    return v0
.end method

.method public resume()V
    .registers 2

    .prologue
    .line 111
    monitor-enter p0

    .line 113
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 114
    monitor-exit p0

    .line 115
    return-void

    .line 114
    :catchall_6
    move-exception v0

    monitor-exit p0
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_6

    throw v0
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 119
    const/4 v0, 0x1

    iput-boolean v0, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->stopped:Z

    .line 120
    invoke-virtual {p0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->resume()V

    .line 121
    return-void
.end method
