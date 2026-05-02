.class abstract Lfreemarker/ext/beans/ClassBasedModelFactory;
.super Ljava/lang/Object;
.source "ClassBasedModelFactory.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModel;


# instance fields
.field private final cache:Ljava/util/Map;

.field private final classIntrospectionsInProgress:Ljava/util/Set;

.field private final isCacheConcurrentMap:Z

.field private final wrapper:Lfreemarker/ext/beans/BeansWrapper;


# direct methods
.method protected constructor <init>(Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 3
    .param p1, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    invoke-static {}, Lfreemarker/core/_ConcurrentMapFactory;->newMaybeConcurrentHashMap()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->cache:Ljava/util/Map;

    .line 74
    iget-object v0, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->cache:Ljava/util/Map;

    invoke-static {v0}, Lfreemarker/core/_ConcurrentMapFactory;->isConcurrent(Ljava/util/Map;)Z

    move-result v0

    iput-boolean v0, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->isCacheConcurrentMap:Z

    .line 76
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->classIntrospectionsInProgress:Ljava/util/Set;

    .line 79
    iput-object p1, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    .line 80
    return-void
.end method

.method private getInternal(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 9
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 95
    iget-boolean v4, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->isCacheConcurrentMap:Z

    if-eqz v4, :cond_f

    .line 96
    iget-object v4, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->cache:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/template/TemplateModel;

    .line 97
    .local v2, "model":Lfreemarker/template/TemplateModel;
    if-eqz v2, :cond_f

    .line 145
    :goto_e
    return-object v2

    .line 100
    .end local v2    # "model":Lfreemarker/template/TemplateModel;
    :cond_f
    iget-object v4, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v4}, Lfreemarker/ext/beans/BeansWrapper;->getSharedClassIntrospectionCacheLock()Ljava/lang/Object;

    move-result-object v3

    .line 101
    .local v3, "sharedLock":Ljava/lang/Object;
    monitor-enter v3

    .line 102
    :try_start_16
    iget-object v4, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->cache:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/template/TemplateModel;

    .line 103
    .restart local v2    # "model":Lfreemarker/template/TemplateModel;
    if-eqz v2, :cond_25

    monitor-exit v3

    goto :goto_e

    .line 121
    .end local v2    # "model":Lfreemarker/template/TemplateModel;
    :catchall_22
    move-exception v4

    monitor-exit v3
    :try_end_24
    .catchall {:try_start_16 .. :try_end_24} :catchall_22

    throw v4

    .line 106
    .restart local v2    # "model":Lfreemarker/template/TemplateModel;
    :cond_25
    :goto_25
    if-nez v2, :cond_55

    :try_start_27
    iget-object v4, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->classIntrospectionsInProgress:Ljava/util/Set;

    invoke-interface {v4, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_2c
    .catchall {:try_start_27 .. :try_end_2c} :catchall_22

    move-result v4

    if-eqz v4, :cond_55

    .line 110
    :try_start_2f
    invoke-virtual {v3}, Ljava/lang/Object;->wait()V

    .line 111
    iget-object v4, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->cache:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "model":Lfreemarker/template/TemplateModel;
    check-cast v2, Lfreemarker/template/TemplateModel;
    :try_end_3a
    .catch Ljava/lang/InterruptedException; {:try_start_2f .. :try_end_3a} :catch_3b
    .catchall {:try_start_2f .. :try_end_3a} :catchall_22

    .restart local v2    # "model":Lfreemarker/template/TemplateModel;
    goto :goto_25

    .line 112
    .end local v2    # "model":Lfreemarker/template/TemplateModel;
    :catch_3b
    move-exception v1

    .line 113
    .local v1, "e":Ljava/lang/InterruptedException;
    :try_start_3c
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Class inrospection data lookup aborded: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 117
    .end local v1    # "e":Ljava/lang/InterruptedException;
    .restart local v2    # "model":Lfreemarker/template/TemplateModel;
    :cond_55
    if-eqz v2, :cond_59

    monitor-exit v3

    goto :goto_e

    .line 120
    :cond_59
    iget-object v4, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->classIntrospectionsInProgress:Ljava/util/Set;

    invoke-interface {v4, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 121
    monitor-exit v3
    :try_end_5f
    .catchall {:try_start_3c .. :try_end_5f} :catchall_22

    .line 123
    :try_start_5f
    invoke-static {p1}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 129
    .local v0, "clazz":Ljava/lang/Class;
    iget-object v4, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v4, v0}, Lfreemarker/ext/beans/BeansWrapper;->getClassIntrospectionData(Ljava/lang/Class;)Ljava/util/Map;

    .line 131
    invoke-virtual {p0, v0}, Lfreemarker/ext/beans/ClassBasedModelFactory;->createModel(Ljava/lang/Class;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    .line 135
    if-eqz v2, :cond_75

    .line 136
    monitor-enter v3
    :try_end_6f
    .catchall {:try_start_5f .. :try_end_6f} :catchall_86

    .line 137
    :try_start_6f
    iget-object v4, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->cache:Ljava/util/Map;

    invoke-interface {v4, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    monitor-exit v3
    :try_end_75
    .catchall {:try_start_6f .. :try_end_75} :catchall_83

    .line 142
    :cond_75
    monitor-enter v3

    .line 143
    :try_start_76
    iget-object v4, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->classIntrospectionsInProgress:Ljava/util/Set;

    invoke-interface {v4, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 144
    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 145
    monitor-exit v3

    goto :goto_e

    :catchall_80
    move-exception v4

    monitor-exit v3
    :try_end_82
    .catchall {:try_start_76 .. :try_end_82} :catchall_80

    throw v4

    .line 138
    :catchall_83
    move-exception v4

    :try_start_84
    monitor-exit v3
    :try_end_85
    .catchall {:try_start_84 .. :try_end_85} :catchall_83

    :try_start_85
    throw v4
    :try_end_86
    .catchall {:try_start_85 .. :try_end_86} :catchall_86

    .line 142
    .end local v0    # "clazz":Ljava/lang/Class;
    :catchall_86
    move-exception v4

    monitor-enter v3

    .line 143
    :try_start_88
    iget-object v5, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->classIntrospectionsInProgress:Ljava/util/Set;

    invoke-interface {v5, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 144
    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 145
    monitor-exit v3
    :try_end_91
    .catchall {:try_start_88 .. :try_end_91} :catchall_92

    throw v4

    :catchall_92
    move-exception v4

    :try_start_93
    monitor-exit v3
    :try_end_94
    .catchall {:try_start_93 .. :try_end_94} :catchall_92

    throw v4
.end method


# virtual methods
.method clearCache()V
    .registers 3

    .prologue
    .line 150
    iget-object v0, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v0}, Lfreemarker/ext/beans/BeansWrapper;->getSharedClassIntrospectionCacheLock()Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 151
    :try_start_7
    iget-object v0, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->cache:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 152
    monitor-exit v1

    .line 153
    return-void

    .line 152
    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_7 .. :try_end_10} :catchall_e

    throw v0
.end method

.method protected abstract createModel(Ljava/lang/Class;)Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation
.end method

.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 84
    :try_start_0
    invoke-direct {p0, p1}, Lfreemarker/ext/beans/ClassBasedModelFactory;->getInternal(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 85
    :catch_5
    move-exception v0

    .line 86
    .local v0, "e":Ljava/lang/Exception;
    instance-of v1, v0, Lfreemarker/template/TemplateModelException;

    if-eqz v1, :cond_d

    .line 87
    check-cast v0, Lfreemarker/template/TemplateModelException;

    .end local v0    # "e":Ljava/lang/Exception;
    throw v0

    .line 89
    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_d
    new-instance v1, Lfreemarker/template/TemplateModelException;

    invoke-direct {v1, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method

.method protected getWrapper()Lfreemarker/ext/beans/BeansWrapper;
    .registers 2

    .prologue
    .line 169
    iget-object v0, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 162
    const/4 v0, 0x0

    return v0
.end method

.method removeFromCache(Ljava/lang/Class;)V
    .registers 5
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 156
    iget-object v0, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v0}, Lfreemarker/ext/beans/BeansWrapper;->getSharedClassIntrospectionCacheLock()Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 157
    :try_start_7
    iget-object v0, p0, Lfreemarker/ext/beans/ClassBasedModelFactory;->cache:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    monitor-exit v1

    .line 159
    return-void

    .line 158
    :catchall_12
    move-exception v0

    monitor-exit v1
    :try_end_14
    .catchall {:try_start_7 .. :try_end_14} :catchall_12

    throw v0
.end method
