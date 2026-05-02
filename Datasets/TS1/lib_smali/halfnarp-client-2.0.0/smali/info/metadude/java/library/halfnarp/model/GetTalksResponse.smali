.class public Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;
.super Ljava/lang/Object;
.source "GetTalksResponse.java"


# annotations
.annotation runtime Lcom/fasterxml/jackson/annotation/JsonInclude;
    value = .enum Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->NON_NULL:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;
.end annotation


# instance fields
.field private _abstract:Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "abstract"
    .end annotation
.end field

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

.field private duration:I
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "duration"
    .end annotation
.end field

.field private eventId:I
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "event_id"
    .end annotation
.end field

.field private roomId:I
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "room_id"
    .end annotation
.end field

.field private roomName:Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "room_name"
    .end annotation
.end field

.field private speakers:Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "speakers"
    .end annotation
.end field

.field private startTime:Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "start_time"
    .end annotation
.end field

.field private title:Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "title"
    .end annotation
.end field

.field private trackId:I
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "track_id"
    .end annotation
.end field

.field private trackName:Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "track_name"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->additionalProperties:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public getAbstract()Ljava/lang/String;
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "abstract"
    .end annotation

    .prologue
    .line 167
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->_abstract:Ljava/lang/String;

    return-object v0
.end method

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
    .line 196
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->additionalProperties:Ljava/util/Map;

    return-object v0
.end method

.method public getDuration()I
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "duration"
    .end annotation

    .prologue
    .line 135
    iget v0, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->duration:I

    return v0
.end method

.method public getEventId()I
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "event_id"
    .end annotation

    .prologue
    .line 39
    iget v0, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->eventId:I

    return v0
.end method

.method public getRoomId()I
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "room_id"
    .end annotation

    .prologue
    .line 87
    iget v0, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->roomId:I

    return v0
.end method

.method public getRoomName()Ljava/lang/String;
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "room_name"
    .end annotation

    .prologue
    .line 103
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->roomName:Ljava/lang/String;

    return-object v0
.end method

.method public getSpeakers()Ljava/lang/String;
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "speakers"
    .end annotation

    .prologue
    .line 183
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->speakers:Ljava/lang/String;

    return-object v0
.end method

.method public getStartTime()Ljava/lang/String;
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "start_time"
    .end annotation

    .prologue
    .line 119
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->startTime:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "title"
    .end annotation

    .prologue
    .line 151
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getTrackId()I
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "track_id"
    .end annotation

    .prologue
    .line 55
    iget v0, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->trackId:I

    return v0
.end method

.method public getTrackName()Ljava/lang/String;
    .registers 2
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "track_name"
    .end annotation

    .prologue
    .line 71
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->trackName:Ljava/lang/String;

    return-object v0
.end method

.method public setAbstract(Ljava/lang/String;)V
    .registers 2
    .param p1, "_abstract"    # Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "abstract"
    .end annotation

    .prologue
    .line 175
    iput-object p1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->_abstract:Ljava/lang/String;

    .line 176
    return-void
.end method

.method public setAdditionalProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonAnySetter;
    .end annotation

    .prologue
    .line 201
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->additionalProperties:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    return-void
.end method

.method public setDuration(I)V
    .registers 2
    .param p1, "duration"    # I
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "duration"
    .end annotation

    .prologue
    .line 143
    iput p1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->duration:I

    .line 144
    return-void
.end method

.method public setEventId(I)V
    .registers 2
    .param p1, "eventId"    # I
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "event_id"
    .end annotation

    .prologue
    .line 47
    iput p1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->eventId:I

    .line 48
    return-void
.end method

.method public setRoomId(I)V
    .registers 2
    .param p1, "roomId"    # I
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "room_id"
    .end annotation

    .prologue
    .line 95
    iput p1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->roomId:I

    .line 96
    return-void
.end method

.method public setRoomName(Ljava/lang/String;)V
    .registers 2
    .param p1, "roomName"    # Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "room_name"
    .end annotation

    .prologue
    .line 111
    iput-object p1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->roomName:Ljava/lang/String;

    .line 112
    return-void
.end method

.method public setSpeakers(Ljava/lang/String;)V
    .registers 2
    .param p1, "speakers"    # Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "speakers"
    .end annotation

    .prologue
    .line 191
    iput-object p1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->speakers:Ljava/lang/String;

    .line 192
    return-void
.end method

.method public setStartTime(Ljava/lang/String;)V
    .registers 2
    .param p1, "startTime"    # Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "start_time"
    .end annotation

    .prologue
    .line 127
    iput-object p1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->startTime:Ljava/lang/String;

    .line 128
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "title"
    .end annotation

    .prologue
    .line 159
    iput-object p1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->title:Ljava/lang/String;

    .line 160
    return-void
.end method

.method public setTrackId(I)V
    .registers 2
    .param p1, "trackId"    # I
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "track_id"
    .end annotation

    .prologue
    .line 63
    iput p1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->trackId:I

    .line 64
    return-void
.end method

.method public setTrackName(Ljava/lang/String;)V
    .registers 2
    .param p1, "trackName"    # Ljava/lang/String;
    .annotation runtime Lcom/fasterxml/jackson/annotation/JsonProperty;
        value = "track_name"
    .end annotation

    .prologue
    .line 79
    iput-object p1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->trackName:Ljava/lang/String;

    .line 80
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 206
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "eventId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->eventId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "trackId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->trackId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "trackName = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->trackName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "roomId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->roomId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "roomName = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->roomName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "startTime = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->startTime:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "duration = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->duration:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "title = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_abstract = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->_abstract:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "speakers = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;->speakers:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
