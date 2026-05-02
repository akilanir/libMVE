.class final Lcom/mongodb/JMXConnectionPoolListener$ClusterIdServerAddressPair;
.super Ljava/lang/Object;
.source "JMXConnectionPoolListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/JMXConnectionPoolListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ClusterIdServerAddressPair"
.end annotation


# instance fields
.field private final clusterId:Ljava/lang/String;

.field private final serverAddress:Lcom/mongodb/ServerAddress;


# direct methods
.method private constructor <init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;)V
    .registers 3
    .param p1, "clusterId"    # Ljava/lang/String;
    .param p2, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 135
    iput-object p1, p0, Lcom/mongodb/JMXConnectionPoolListener$ClusterIdServerAddressPair;->clusterId:Ljava/lang/String;

    .line 136
    iput-object p2, p0, Lcom/mongodb/JMXConnectionPoolListener$ClusterIdServerAddressPair;->serverAddress:Lcom/mongodb/ServerAddress;

    .line 137
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;Lcom/mongodb/JMXConnectionPoolListener$1;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lcom/mongodb/ServerAddress;
    .param p3, "x2"    # Lcom/mongodb/JMXConnectionPoolListener$1;

    .prologue
    .line 130
    invoke-direct {p0, p1, p2}, Lcom/mongodb/JMXConnectionPoolListener$ClusterIdServerAddressPair;-><init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 141
    if-ne p0, p1, :cond_5

    .line 158
    :cond_4
    :goto_4
    return v1

    .line 144
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    .line 145
    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 148
    check-cast v0, Lcom/mongodb/JMXConnectionPoolListener$ClusterIdServerAddressPair;

    .line 150
    .local v0, "that":Lcom/mongodb/JMXConnectionPoolListener$ClusterIdServerAddressPair;
    iget-object v3, p0, Lcom/mongodb/JMXConnectionPoolListener$ClusterIdServerAddressPair;->clusterId:Ljava/lang/String;

    iget-object v4, v0, Lcom/mongodb/JMXConnectionPoolListener$ClusterIdServerAddressPair;->clusterId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_22

    move v1, v2

    .line 151
    goto :goto_4

    .line 154
    :cond_22
    iget-object v3, p0, Lcom/mongodb/JMXConnectionPoolListener$ClusterIdServerAddressPair;->serverAddress:Lcom/mongodb/ServerAddress;

    iget-object v4, v0, Lcom/mongodb/JMXConnectionPoolListener$ClusterIdServerAddressPair;->serverAddress:Lcom/mongodb/ServerAddress;

    invoke-virtual {v3, v4}, Lcom/mongodb/ServerAddress;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 155
    goto :goto_4
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 163
    iget-object v1, p0, Lcom/mongodb/JMXConnectionPoolListener$ClusterIdServerAddressPair;->clusterId:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 164
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/JMXConnectionPoolListener$ClusterIdServerAddressPair;->serverAddress:Lcom/mongodb/ServerAddress;

    invoke-virtual {v2}, Lcom/mongodb/ServerAddress;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 165
    return v0
.end method
