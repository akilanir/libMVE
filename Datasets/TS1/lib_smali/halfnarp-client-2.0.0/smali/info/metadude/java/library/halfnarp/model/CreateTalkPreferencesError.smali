.class public Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesError;
.super Ljava/lang/Object;
.source "CreateTalkPreferencesError.java"


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

.field private description:Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "description"
    .end annotation
.end field

.field private location:Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "location"
    .end annotation
.end field

.field private name:Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "name"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesError;->additionalProperties:Ljava/util/Map;

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
    .line 70
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesError;->additionalProperties:Ljava/util/Map;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "description"
    .end annotation

    .prologue
    .line 57
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesError;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getLocation()Ljava/lang/String;
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "location"
    .end annotation

    .prologue
    .line 25
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesError;->location:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "name"
    .end annotation

    .prologue
    .line 41
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesError;->name:Ljava/lang/String;

    return-object v0
.end method

.method public setAdditionalProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonAnySetter;
    .end annotation

    .prologue
    .line 75
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesError;->additionalProperties:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .registers 2
    .param p1, "description"    # Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "description"
    .end annotation

    .prologue
    .line 65
    iput-object p1, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesError;->description:Ljava/lang/String;

    .line 66
    return-void
.end method

.method public setLocation(Ljava/lang/String;)V
    .registers 2
    .param p1, "location"    # Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "location"
    .end annotation

    .prologue
    .line 33
    iput-object p1, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesError;->location:Ljava/lang/String;

    .line 34
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "name"
    .end annotation

    .prologue
    .line 49
    iput-object p1, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesError;->name:Ljava/lang/String;

    .line 50
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 80
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "location = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesError;->location:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "name = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesError;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "description = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesError;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
