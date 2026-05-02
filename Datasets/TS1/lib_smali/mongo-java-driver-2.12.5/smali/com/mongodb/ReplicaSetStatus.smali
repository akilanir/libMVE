.class public Lcom/mongodb/ReplicaSetStatus;
.super Ljava/lang/Object;
.source "ReplicaSetStatus.java"


# instance fields
.field private final clusterDescription:Lcom/mongodb/ClusterDescription;


# direct methods
.method constructor <init>(Lcom/mongodb/ClusterDescription;)V
    .registers 2
    .param p1, "clusterDescription"    # Lcom/mongodb/ClusterDescription;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/mongodb/ReplicaSetStatus;->clusterDescription:Lcom/mongodb/ClusterDescription;

    .line 32
    return-void
.end method


# virtual methods
.method public getMaster()Lcom/mongodb/ServerAddress;
    .registers 3

    .prologue
    .line 44
    iget-object v1, p0, Lcom/mongodb/ReplicaSetStatus;->clusterDescription:Lcom/mongodb/ClusterDescription;

    invoke-virtual {v1}, Lcom/mongodb/ClusterDescription;->getPrimaries()Ljava/util/List;

    move-result-object v0

    .line 45
    .local v0, "primaries":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_e

    const/4 v1, 0x0

    :goto_d
    return-object v1

    :cond_e
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ServerDescription;

    invoke-virtual {v1}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v1

    goto :goto_d
.end method

.method public getMaxBsonObjectSize()I
    .registers 3

    .prologue
    .line 65
    iget-object v1, p0, Lcom/mongodb/ReplicaSetStatus;->clusterDescription:Lcom/mongodb/ClusterDescription;

    invoke-virtual {v1}, Lcom/mongodb/ClusterDescription;->getPrimaries()Ljava/util/List;

    move-result-object v0

    .line 66
    .local v0, "primaries":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_11

    invoke-static {}, Lcom/mongodb/ServerDescription;->getDefaultMaxDocumentSize()I

    move-result v1

    :goto_10
    return v1

    :cond_11
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ServerDescription;

    invoke-virtual {v1}, Lcom/mongodb/ServerDescription;->getMaxDocumentSize()I

    move-result v1

    goto :goto_10
.end method

.method public getName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 35
    iget-object v1, p0, Lcom/mongodb/ReplicaSetStatus;->clusterDescription:Lcom/mongodb/ClusterDescription;

    invoke-virtual {v1}, Lcom/mongodb/ClusterDescription;->getAnyPrimaryOrSecondary()Ljava/util/List;

    move-result-object v0

    .line 36
    .local v0, "any":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_e

    const/4 v1, 0x0

    :goto_d
    return-object v1

    :cond_e
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ServerDescription;

    invoke-virtual {v1}, Lcom/mongodb/ServerDescription;->getSetName()Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method public isMaster(Lcom/mongodb/ServerAddress;)Z
    .registers 3
    .param p1, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 54
    invoke-virtual {p0}, Lcom/mongodb/ReplicaSetStatus;->getMaster()Lcom/mongodb/ServerAddress;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mongodb/ServerAddress;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ReplicaSetStatus{name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mongodb/ReplicaSetStatus;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", cluster="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ReplicaSetStatus;->clusterDescription:Lcom/mongodb/ClusterDescription;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
