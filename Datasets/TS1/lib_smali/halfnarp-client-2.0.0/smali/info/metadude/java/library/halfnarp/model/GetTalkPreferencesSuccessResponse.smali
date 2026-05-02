.class public Linfo/metadude/java/library/halfnarp/model/GetTalkPreferencesSuccessResponse;
.super Linfo/metadude/java/library/halfnarp/model/GetTalkPreferencesResponse;
.source "GetTalkPreferencesSuccessResponse.java"


# annotations
.annotation runtime Lcom/fasterxml/jackson/annotation/JsonInclude;
    value = .enum Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->NON_NULL:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;
.end annotation


# instance fields
.field private additionalProperties:Ljava/util/Map;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonIgnore;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private talkIds:Ljava/util/List;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "talk_ids"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private uid:Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "uid"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 15
    invoke-direct {p0}, Linfo/metadude/java/library/halfnarp/model/GetTalkPreferencesResponse;-><init>()V

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Linfo/metadude/java/library/halfnarp/model/GetTalkPreferencesSuccessResponse;->talkIds:Ljava/util/List;

    .line 21
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Linfo/metadude/java/library/halfnarp/model/GetTalkPreferencesSuccessResponse;->additionalProperties:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public getAdditionalProperties()Ljava/util/Map;
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonAnyGetter;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 58
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/GetTalkPreferencesSuccessResponse;->additionalProperties:Ljava/util/Map;

    return-object v0
.end method

.method public getTalkIds()Ljava/util/List;
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "talk_ids"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 29
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/GetTalkPreferencesSuccessResponse;->talkIds:Ljava/util/List;

    return-object v0
.end method

.method public getUid()Ljava/lang/String;
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "uid"
    .end annotation

    .prologue
    .line 45
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/GetTalkPreferencesSuccessResponse;->uid:Ljava/lang/String;

    return-object v0
.end method

.method public setAdditionalProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonAnySetter;
    .end annotation

    .prologue
    .line 63
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/GetTalkPreferencesSuccessResponse;->additionalProperties:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    return-void
.end method

.method public setTalkIds(Ljava/util/List;)V
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "talk_ids"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 37
    .local p1, "talkIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iput-object p1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalkPreferencesSuccessResponse;->talkIds:Ljava/util/List;

    .line 38
    return-void
.end method

.method public setUid(Ljava/lang/String;)V
    .registers 2
    .param p1, "uid"    # Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "uid"
    .end annotation

    .prologue
    .line 53
    iput-object p1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalkPreferencesSuccessResponse;->uid:Ljava/lang/String;

    .line 54
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "talk_ids = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalkPreferencesSuccessResponse;->talkIds:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", uid = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalkPreferencesSuccessResponse;->uid:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
