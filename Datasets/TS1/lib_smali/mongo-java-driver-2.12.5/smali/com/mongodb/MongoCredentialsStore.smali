.class Lcom/mongodb/MongoCredentialsStore;
.super Ljava/lang/Object;
.source "MongoCredentialsStore.java"


# annotations
.annotation runtime Lorg/bson/util/annotations/ThreadSafe;
.end annotation


# instance fields
.field private volatile allDatabasesWithCredentials:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final credentialsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/mongodb/MongoCredential;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mongodb/MongoCredentialsStore;->credentialsMap:Ljava/util/Map;

    .line 41
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/mongodb/MongoCredentialsStore;->allDatabasesWithCredentials:Ljava/util/Set;

    .line 47
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/MongoCredential;)V
    .registers 3
    .param p1, "credentials"    # Lcom/mongodb/MongoCredential;

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mongodb/MongoCredentialsStore;->credentialsMap:Ljava/util/Map;

    .line 41
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/mongodb/MongoCredentialsStore;->allDatabasesWithCredentials:Ljava/util/Set;

    .line 55
    if-nez p1, :cond_14

    .line 59
    :goto_13
    return-void

    .line 58
    :cond_14
    invoke-virtual {p0, p1}, Lcom/mongodb/MongoCredentialsStore;->add(Lcom/mongodb/MongoCredential;)V

    goto :goto_13
.end method

.method public constructor <init>(Ljava/lang/Iterable;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/mongodb/MongoCredential;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 66
    .local p1, "credentialsList":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/mongodb/MongoCredential;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/mongodb/MongoCredentialsStore;->credentialsMap:Ljava/util/Map;

    .line 41
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lcom/mongodb/MongoCredentialsStore;->allDatabasesWithCredentials:Ljava/util/Set;

    .line 67
    if-nez p1, :cond_14

    .line 73
    :cond_13
    return-void

    .line 70
    :cond_14
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_18
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_13

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/MongoCredential;

    .line 71
    .local v0, "cur":Lcom/mongodb/MongoCredential;
    invoke-virtual {p0, v0}, Lcom/mongodb/MongoCredentialsStore;->add(Lcom/mongodb/MongoCredential;)V

    goto :goto_18
.end method


# virtual methods
.method declared-synchronized add(Lcom/mongodb/MongoCredential;)V
    .registers 5
    .param p1, "credentials"    # Lcom/mongodb/MongoCredential;

    .prologue
    .line 82
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/mongodb/MongoCredentialsStore;->credentialsMap:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/mongodb/MongoCredential;->getSource()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/MongoCredential;

    .line 84
    .local v0, "existingCredentials":Lcom/mongodb/MongoCredential;
    if-eqz v0, :cond_22

    .line 85
    invoke-virtual {v0, p1}, Lcom/mongodb/MongoCredential;->equals(Ljava/lang/Object;)Z
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_1f

    move-result v1

    if-eqz v1, :cond_17

    .line 94
    :goto_15
    monitor-exit p0

    return-void

    .line 88
    :cond_17
    :try_start_17
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Can\'t add more than one credentials for the same database"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1f
    .catchall {:try_start_17 .. :try_end_1f} :catchall_1f

    .line 82
    .end local v0    # "existingCredentials":Lcom/mongodb/MongoCredential;
    :catchall_1f
    move-exception v1

    monitor-exit p0

    throw v1

    .line 91
    .restart local v0    # "existingCredentials":Lcom/mongodb/MongoCredential;
    :cond_22
    :try_start_22
    iget-object v1, p0, Lcom/mongodb/MongoCredentialsStore;->credentialsMap:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/mongodb/MongoCredential;->getSource()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    new-instance v1, Ljava/util/HashSet;

    iget-object v2, p0, Lcom/mongodb/MongoCredentialsStore;->allDatabasesWithCredentials:Ljava/util/Set;

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iput-object v1, p0, Lcom/mongodb/MongoCredentialsStore;->allDatabasesWithCredentials:Ljava/util/Set;

    .line 93
    iget-object v1, p0, Lcom/mongodb/MongoCredentialsStore;->allDatabasesWithCredentials:Ljava/util/Set;

    invoke-virtual {p1}, Lcom/mongodb/MongoCredential;->getSource()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_3d
    .catchall {:try_start_22 .. :try_end_3d} :catchall_1f

    goto :goto_15
.end method

.method public declared-synchronized asList()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/MongoCredential;",
            ">;"
        }
    .end annotation

    .prologue
    .line 120
    monitor-enter p0

    :try_start_1
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/mongodb/MongoCredentialsStore;->credentialsMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_e

    monitor-exit p0

    return-object v0

    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized equals(Ljava/lang/Object;)Z
    .registers 8
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 125
    monitor-enter p0

    if-ne p0, p1, :cond_7

    .line 132
    :cond_5
    :goto_5
    monitor-exit p0

    return v2

    .line 126
    :cond_7
    if-eqz p1, :cond_13

    :try_start_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    if-eq v4, v5, :cond_15

    :cond_13
    move v2, v3

    goto :goto_5

    .line 128
    :cond_15
    move-object v0, p1

    check-cast v0, Lcom/mongodb/MongoCredentialsStore;

    move-object v1, v0

    .line 130
    .local v1, "that":Lcom/mongodb/MongoCredentialsStore;
    iget-object v4, p0, Lcom/mongodb/MongoCredentialsStore;->credentialsMap:Ljava/util/Map;

    iget-object v5, v1, Lcom/mongodb/MongoCredentialsStore;->credentialsMap:Ljava/util/Map;

    invoke-interface {v4, v5}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z
    :try_end_20
    .catchall {:try_start_9 .. :try_end_20} :catchall_25

    move-result v4

    if-nez v4, :cond_5

    move v2, v3

    goto :goto_5

    .line 125
    .end local v1    # "that":Lcom/mongodb/MongoCredentialsStore;
    :catchall_25
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized get(Ljava/lang/String;)Lcom/mongodb/MongoCredential;
    .registers 3
    .param p1, "database"    # Ljava/lang/String;

    .prologue
    .line 112
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/mongodb/MongoCredentialsStore;->credentialsMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/MongoCredential;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    monitor-exit p0

    return-object v0

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getDatabases()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 102
    iget-object v0, p0, Lcom/mongodb/MongoCredentialsStore;->allDatabasesWithCredentials:Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized hashCode()I
    .registers 2

    .prologue
    .line 137
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/mongodb/MongoCredentialsStore;->credentialsMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->hashCode()I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 142
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{credentials="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoCredentialsStore;->credentialsMap:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
