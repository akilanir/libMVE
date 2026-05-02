.class public Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesSuccessResponse;
.super Linfo/metadude/java/library/halfnarp/model/CreateResponse;
.source "CreateTalkPreferencesSuccessResponse.java"


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

.field private uid:Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "uid"
    .end annotation
.end field

.field private updateUrl:Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "update_url"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 9
    invoke-direct {p0}, Linfo/metadude/java/library/halfnarp/model/CreateResponse;-><init>()V

    .line 15
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesSuccessResponse;->additionalProperties:Ljava/util/Map;

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
    .line 52
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesSuccessResponse;->additionalProperties:Ljava/util/Map;

    return-object v0
.end method

.method public getUid()Ljava/lang/String;
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "uid"
    .end annotation

    .prologue
    .line 39
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesSuccessResponse;->uid:Ljava/lang/String;

    return-object v0
.end method

.method public getUpdateUrl()Ljava/lang/String;
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "update_url"
    .end annotation

    .prologue
    .line 23
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesSuccessResponse;->updateUrl:Ljava/lang/String;

    return-object v0
.end method

.method public setAdditionalProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonAnySetter;
    .end annotation

    .prologue
    .line 57
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesSuccessResponse;->additionalProperties:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    return-void
.end method

.method public setUid(Ljava/lang/String;)V
    .registers 2
    .param p1, "uid"    # Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "uid"
    .end annotation

    .prologue
    .line 47
    iput-object p1, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesSuccessResponse;->uid:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public setUpdateUrl(Ljava/lang/String;)V
    .registers 2
    .param p1, "updateUrl"    # Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "update_url"
    .end annotation

    .prologue
    .line 31
    iput-object p1, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesSuccessResponse;->updateUrl:Ljava/lang/String;

    .line 32
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateUrl = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesSuccessResponse;->updateUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "uid = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesSuccessResponse;->uid:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
