.class public Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesErrorResponse;
.super Linfo/metadude/java/library/halfnarp/model/CreateResponse;
.source "CreateTalkPreferencesErrorResponse.java"


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

.field private errors:Ljava/util/List;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "errors"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesError;",
            ">;"
        }
    .end annotation
.end field

.field private status:Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "status"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 11
    invoke-direct {p0}, Linfo/metadude/java/library/halfnarp/model/CreateResponse;-><init>()V

    .line 15
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesErrorResponse;->errors:Ljava/util/List;

    .line 17
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesErrorResponse;->additionalProperties:Ljava/util/Map;

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
    .line 54
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesErrorResponse;->additionalProperties:Ljava/util/Map;

    return-object v0
.end method

.method public getErrors()Ljava/util/List;
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "errors"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesError;",
            ">;"
        }
    .end annotation

    .prologue
    .line 41
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesErrorResponse;->errors:Ljava/util/List;

    return-object v0
.end method

.method public getStatus()Ljava/lang/String;
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "status"
    .end annotation

    .prologue
    .line 25
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesErrorResponse;->status:Ljava/lang/String;

    return-object v0
.end method

.method public setAdditionalProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonAnySetter;
    .end annotation

    .prologue
    .line 59
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesErrorResponse;->additionalProperties:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    return-void
.end method

.method public setErrors(Ljava/util/List;)V
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "errors"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesError;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 49
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesError;>;"
    iput-object p1, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesErrorResponse;->errors:Ljava/util/List;

    .line 50
    return-void
.end method

.method public setStatus(Ljava/lang/String;)V
    .registers 2
    .param p1, "status"    # Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "status"
    .end annotation

    .prologue
    .line 33
    iput-object p1, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesErrorResponse;->status:Ljava/lang/String;

    .line 34
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "status = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesErrorResponse;->status:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "errors = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesErrorResponse;->errors:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
