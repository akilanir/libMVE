.class public Lfreemarker/ext/beans/BeansModelCache;
.super Lfreemarker/ext/util/ModelCache;
.source "BeansModelCache.java"


# static fields
.field static class$java$lang$Boolean:Ljava/lang/Class;


# instance fields
.field private final classToFactory:Ljava/util/Map;

.field private final classToFactoryIsConcurrent:Z

.field private final mappedClassNames:Ljava/util/Set;

.field private final wrapper:Lfreemarker/ext/beans/BeansWrapper;


# direct methods
.method constructor <init>(Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 3
    .param p1, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 21
    invoke-direct {p0}, Lfreemarker/ext/util/ModelCache;-><init>()V

    .line 14
    invoke-static {}, Lfreemarker/core/_ConcurrentMapFactory;->newMaybeConcurrentHashMap()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/beans/BeansModelCache;->classToFactory:Ljava/util/Map;

    .line 15
    iget-object v0, p0, Lfreemarker/ext/beans/BeansModelCache;->classToFactory:Ljava/util/Map;

    invoke-static {v0}, Lfreemarker/core/_ConcurrentMapFactory;->isConcurrent(Ljava/util/Map;)Z

    move-result v0

    iput-boolean v0, p0, Lfreemarker/ext/beans/BeansModelCache;->classToFactoryIsConcurrent:Z

    .line 17
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/beans/BeansModelCache;->mappedClassNames:Ljava/util/Set;

    .line 22
    iput-object p1, p0, Lfreemarker/ext/beans/BeansModelCache;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    .line 23
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 26
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method protected create(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    .registers 8
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 30
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 32
    .local v2, "clazz":Ljava/lang/Class;
    const/4 v3, 0x0

    .line 34
    .local v3, "factory":Lfreemarker/ext/util/ModelFactory;
    iget-boolean v4, p0, Lfreemarker/ext/beans/BeansModelCache;->classToFactoryIsConcurrent:Z

    if-eqz v4, :cond_11

    .line 35
    iget-object v4, p0, Lfreemarker/ext/beans/BeansModelCache;->classToFactory:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "factory":Lfreemarker/ext/util/ModelFactory;
    check-cast v3, Lfreemarker/ext/util/ModelFactory;

    .line 38
    .restart local v3    # "factory":Lfreemarker/ext/util/ModelFactory;
    :cond_11
    if-nez v3, :cond_49

    .line 39
    iget-object v5, p0, Lfreemarker/ext/beans/BeansModelCache;->classToFactory:Ljava/util/Map;

    monitor-enter v5

    .line 40
    :try_start_16
    iget-object v4, p0, Lfreemarker/ext/beans/BeansModelCache;->classToFactory:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lfreemarker/ext/util/ModelFactory;

    move-object v3, v0

    .line 41
    if-nez v3, :cond_48

    .line 42
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 44
    .local v1, "className":Ljava/lang/String;
    iget-object v4, p0, Lfreemarker/ext/beans/BeansModelCache;->mappedClassNames:Ljava/util/Set;

    invoke-interface {v4, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3d

    .line 45
    iget-object v4, p0, Lfreemarker/ext/beans/BeansModelCache;->classToFactory:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->clear()V

    .line 46
    iget-object v4, p0, Lfreemarker/ext/beans/BeansModelCache;->mappedClassNames:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->clear()V

    .line 47
    iget-object v4, p0, Lfreemarker/ext/beans/BeansModelCache;->mappedClassNames:Ljava/util/Set;

    invoke-interface {v4, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 49
    :cond_3d
    iget-object v4, p0, Lfreemarker/ext/beans/BeansModelCache;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v4, v2}, Lfreemarker/ext/beans/BeansWrapper;->getModelFactory(Ljava/lang/Class;)Lfreemarker/ext/util/ModelFactory;

    move-result-object v3

    .line 50
    iget-object v4, p0, Lfreemarker/ext/beans/BeansModelCache;->classToFactory:Ljava/util/Map;

    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .end local v1    # "className":Ljava/lang/String;
    :cond_48
    monitor-exit v5
    :try_end_49
    .catchall {:try_start_16 .. :try_end_49} :catchall_50

    .line 55
    :cond_49
    iget-object v4, p0, Lfreemarker/ext/beans/BeansModelCache;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-interface {v3, p1, v4}, Lfreemarker/ext/util/ModelFactory;->create(Ljava/lang/Object;Lfreemarker/template/ObjectWrapper;)Lfreemarker/template/TemplateModel;

    move-result-object v4

    return-object v4

    .line 52
    :catchall_50
    move-exception v4

    :try_start_51
    monitor-exit v5
    :try_end_52
    .catchall {:try_start_51 .. :try_end_52} :catchall_50

    throw v4
.end method

.method protected isCacheable(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 26
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    sget-object v0, Lfreemarker/ext/beans/BeansModelCache;->class$java$lang$Boolean:Ljava/lang/Class;

    if-nez v0, :cond_14

    const-string v0, "java.lang.Boolean"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansModelCache;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansModelCache;->class$java$lang$Boolean:Ljava/lang/Class;

    :goto_10
    if-eq v1, v0, :cond_17

    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    sget-object v0, Lfreemarker/ext/beans/BeansModelCache;->class$java$lang$Boolean:Ljava/lang/Class;

    goto :goto_10

    :cond_17
    const/4 v0, 0x0

    goto :goto_13
.end method
