.class Lcom/mongodb/TaggableReadPreference$SecondaryReadPreference;
.super Lcom/mongodb/TaggableReadPreference;
.source "TaggableReadPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/TaggableReadPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SecondaryReadPreference"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 132
    invoke-direct {p0}, Lcom/mongodb/TaggableReadPreference;-><init>()V

    .line 133
    return-void
.end method

.method varargs constructor <init>(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)V
    .registers 3
    .param p1, "firstTagSet"    # Lcom/mongodb/DBObject;
    .param p2, "remainingTagSets"    # [Lcom/mongodb/DBObject;

    .prologue
    .line 136
    invoke-direct {p0, p1, p2}, Lcom/mongodb/TaggableReadPreference;-><init>(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)V

    .line 137
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 141
    const-string v0, "secondary"

    return-object v0
.end method

.method getServers(Lcom/mongodb/ClusterDescription;)Ljava/util/List;
    .registers 3
    .param p1, "clusterDescription"    # Lcom/mongodb/ClusterDescription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ClusterDescription;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;"
        }
    .end annotation

    .prologue
    .line 146
    invoke-virtual {p1}, Lcom/mongodb/ClusterDescription;->getSecondaries()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method getServersForTags(Lcom/mongodb/ClusterDescription;Lcom/mongodb/Tags;)Ljava/util/List;
    .registers 4
    .param p1, "clusterDescription"    # Lcom/mongodb/ClusterDescription;
    .param p2, "tags"    # Lcom/mongodb/Tags;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ClusterDescription;",
            "Lcom/mongodb/Tags;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;"
        }
    .end annotation

    .prologue
    .line 151
    invoke-virtual {p1, p2}, Lcom/mongodb/ClusterDescription;->getSecondaries(Lcom/mongodb/Tags;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
