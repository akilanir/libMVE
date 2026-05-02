.class Lcom/mongodb/TaggableReadPreference$PrimaryPreferredReadPreference;
.super Lcom/mongodb/TaggableReadPreference$SecondaryReadPreference;
.source "TaggableReadPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/TaggableReadPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PrimaryPreferredReadPreference"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 216
    invoke-direct {p0}, Lcom/mongodb/TaggableReadPreference$SecondaryReadPreference;-><init>()V

    return-void
.end method

.method varargs constructor <init>(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)V
    .registers 3
    .param p1, "firstTagSet"    # Lcom/mongodb/DBObject;
    .param p2, "remainingTagSets"    # [Lcom/mongodb/DBObject;

    .prologue
    .line 219
    invoke-direct {p0, p1, p2}, Lcom/mongodb/TaggableReadPreference$SecondaryReadPreference;-><init>(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)V

    .line 220
    return-void
.end method


# virtual methods
.method choose(Lcom/mongodb/ClusterDescription;)Ljava/util/List;
    .registers 4
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
    .line 229
    invoke-virtual {p1}, Lcom/mongodb/ClusterDescription;->getPrimaries()Ljava/util/List;

    move-result-object v0

    .line 230
    .local v0, "servers":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_b

    .end local v0    # "servers":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    :goto_a
    return-object v0

    .restart local v0    # "servers":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    :cond_b
    invoke-super {p0, p1}, Lcom/mongodb/TaggableReadPreference$SecondaryReadPreference;->choose(Lcom/mongodb/ClusterDescription;)Ljava/util/List;

    move-result-object v0

    goto :goto_a
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 224
    const-string v0, "primaryPreferred"

    return-object v0
.end method
