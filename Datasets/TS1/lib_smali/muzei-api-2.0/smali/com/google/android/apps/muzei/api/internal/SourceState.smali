.class public Lcom/google/android/apps/muzei/api/internal/SourceState;
.super Ljava/lang/Object;
.source "SourceState.java"


# instance fields
.field private mCurrentArtwork:Lcom/google/android/apps/muzei/api/Artwork;

.field private mDescription:Ljava/lang/String;

.field private mUserCommands:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/apps/muzei/api/UserCommand;",
            ">;"
        }
    .end annotation
.end field

.field private mWantsNetworkAvailable:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mUserCommands:Ljava/util/List;

    return-void
.end method

.method public static fromBundle(Landroid/os/Bundle;)Lcom/google/android/apps/muzei/api/internal/SourceState;
    .registers 10
    .param p0, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 114
    new-instance v6, Lcom/google/android/apps/muzei/api/internal/SourceState;

    invoke-direct {v6}, Lcom/google/android/apps/muzei/api/internal/SourceState;-><init>()V

    .line 115
    .local v6, "state":Lcom/google/android/apps/muzei/api/internal/SourceState;
    const-string v7, "currentArtwork"

    invoke-virtual {p0, v7}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    .line 116
    .local v1, "artworkBundle":Landroid/os/Bundle;
    if-eqz v1, :cond_13

    .line 117
    invoke-static {v1}, Lcom/google/android/apps/muzei/api/Artwork;->fromBundle(Landroid/os/Bundle;)Lcom/google/android/apps/muzei/api/Artwork;

    move-result-object v7

    iput-object v7, v6, Lcom/google/android/apps/muzei/api/internal/SourceState;->mCurrentArtwork:Lcom/google/android/apps/muzei/api/Artwork;

    .line 119
    :cond_13
    const-string v7, "description"

    invoke-virtual {p0, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lcom/google/android/apps/muzei/api/internal/SourceState;->mDescription:Ljava/lang/String;

    .line 120
    const-string v7, "wantsNetworkAvailable"

    invoke-virtual {p0, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v7

    iput-boolean v7, v6, Lcom/google/android/apps/muzei/api/internal/SourceState;->mWantsNetworkAvailable:Z

    .line 121
    const-string v7, "userCommands"

    invoke-virtual {p0, v7}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 122
    .local v2, "commandsSerialized":[Ljava/lang/String;
    if-eqz v2, :cond_41

    array-length v7, v2

    if-lez v7, :cond_41

    .line 123
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_31
    if-ge v3, v4, :cond_41

    aget-object v5, v0, v3

    .line 124
    .local v5, "s":Ljava/lang/String;
    iget-object v7, v6, Lcom/google/android/apps/muzei/api/internal/SourceState;->mUserCommands:Ljava/util/List;

    invoke-static {v5}, Lcom/google/android/apps/muzei/api/UserCommand;->deserialize(Ljava/lang/String;)Lcom/google/android/apps/muzei/api/UserCommand;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    add-int/lit8 v3, v3, 0x1

    goto :goto_31

    .line 127
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "s":Ljava/lang/String;
    :cond_41
    return-object v6
.end method

.method public static fromJson(Lorg/json/JSONObject;)Lcom/google/android/apps/muzei/api/internal/SourceState;
    .registers 2
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 163
    new-instance v0, Lcom/google/android/apps/muzei/api/internal/SourceState;

    invoke-direct {v0}, Lcom/google/android/apps/muzei/api/internal/SourceState;-><init>()V

    .line 164
    .local v0, "state":Lcom/google/android/apps/muzei/api/internal/SourceState;
    invoke-virtual {v0, p0}, Lcom/google/android/apps/muzei/api/internal/SourceState;->readJson(Lorg/json/JSONObject;)V

    .line 165
    return-object v0
.end method


# virtual methods
.method public getCurrentArtwork()Lcom/google/android/apps/muzei/api/Artwork;
    .registers 2

    .prologue
    .line 42
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mCurrentArtwork:Lcom/google/android/apps/muzei/api/Artwork;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 46
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mDescription:Ljava/lang/String;

    return-object v0
.end method

.method public getNumUserCommands()I
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mUserCommands:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getUserCommandAt(I)Lcom/google/android/apps/muzei/api/UserCommand;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 58
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mUserCommands:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/apps/muzei/api/UserCommand;

    return-object v0
.end method

.method public getWantsNetworkAvailable()Z
    .registers 2

    .prologue
    .line 50
    iget-boolean v0, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mWantsNetworkAvailable:Z

    return v0
.end method

.method public readJson(Lorg/json/JSONObject;)V
    .registers 8
    .param p1, "jsonObject"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 146
    const-string v4, "currentArtwork"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 147
    .local v0, "artworkJsonObject":Lorg/json/JSONObject;
    if-eqz v0, :cond_e

    .line 148
    invoke-static {v0}, Lcom/google/android/apps/muzei/api/Artwork;->fromJson(Lorg/json/JSONObject;)Lcom/google/android/apps/muzei/api/Artwork;

    move-result-object v4

    iput-object v4, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mCurrentArtwork:Lcom/google/android/apps/muzei/api/Artwork;

    .line 150
    :cond_e
    const-string v4, "description"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mDescription:Ljava/lang/String;

    .line 151
    const-string v4, "wantsNetworkAvailable"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v4

    iput-boolean v4, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mWantsNetworkAvailable:Z

    .line 152
    iget-object v4, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mUserCommands:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 153
    const-string v4, "userCommands"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 154
    .local v1, "commandsSerialized":Lorg/json/JSONArray;
    if-eqz v1, :cond_48

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lez v4, :cond_48

    .line 155
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    .line 156
    .local v3, "length":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_36
    if-ge v2, v3, :cond_48

    .line 157
    iget-object v4, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mUserCommands:Ljava/util/List;

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/apps/muzei/api/UserCommand;->deserialize(Ljava/lang/String;)Lcom/google/android/apps/muzei/api/UserCommand;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    add-int/lit8 v2, v2, 0x1

    goto :goto_36

    .line 160
    .end local v2    # "i":I
    .end local v3    # "length":I
    :cond_48
    return-void
.end method

.method public setCurrentArtwork(Lcom/google/android/apps/muzei/api/Artwork;)V
    .registers 2
    .param p1, "artwork"    # Lcom/google/android/apps/muzei/api/Artwork;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mCurrentArtwork:Lcom/google/android/apps/muzei/api/Artwork;

    .line 63
    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .registers 2
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mDescription:Ljava/lang/String;

    .line 67
    return-void
.end method

.method public setUserCommands(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/apps/muzei/api/UserCommand;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 90
    .local p1, "userCommands":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/apps/muzei/api/UserCommand;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mUserCommands:Ljava/util/List;

    .line 91
    if-eqz p1, :cond_1f

    .line 92
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/apps/muzei/api/UserCommand;

    .line 93
    .local v0, "command":Lcom/google/android/apps/muzei/api/UserCommand;
    iget-object v2, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mUserCommands:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 96
    .end local v0    # "command":Lcom/google/android/apps/muzei/api/UserCommand;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_1f
    return-void
.end method

.method public varargs setUserCommands([I)V
    .registers 8
    .param p1, "userCommands"    # [I

    .prologue
    .line 74
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mUserCommands:Ljava/util/List;

    .line 75
    if-eqz p1, :cond_1d

    .line 76
    move-object v0, p1

    .local v0, "arr$":[I
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_c
    if-ge v2, v3, :cond_1d

    aget v1, v0, v2

    .line 77
    .local v1, "command":I
    iget-object v4, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mUserCommands:Ljava/util/List;

    new-instance v5, Lcom/google/android/apps/muzei/api/UserCommand;

    invoke-direct {v5, v1}, Lcom/google/android/apps/muzei/api/UserCommand;-><init>(I)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 80
    .end local v0    # "arr$":[I
    .end local v1    # "command":I
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_1d
    return-void
.end method

.method public varargs setUserCommands([Lcom/google/android/apps/muzei/api/UserCommand;)V
    .registers 3
    .param p1, "userCommands"    # [Lcom/google/android/apps/muzei/api/UserCommand;

    .prologue
    .line 83
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mUserCommands:Ljava/util/List;

    .line 84
    if-eqz p1, :cond_e

    .line 85
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mUserCommands:Ljava/util/List;

    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 87
    :cond_e
    return-void
.end method

.method public setWantsNetworkAvailable(Z)V
    .registers 2
    .param p1, "wantsNetworkAvailable"    # Z

    .prologue
    .line 70
    iput-boolean p1, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mWantsNetworkAvailable:Z

    .line 71
    return-void
.end method

.method public toBundle()Landroid/os/Bundle;
    .registers 6

    .prologue
    .line 99
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 100
    .local v0, "bundle":Landroid/os/Bundle;
    iget-object v3, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mCurrentArtwork:Lcom/google/android/apps/muzei/api/Artwork;

    if-eqz v3, :cond_14

    .line 101
    const-string v3, "currentArtwork"

    iget-object v4, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mCurrentArtwork:Lcom/google/android/apps/muzei/api/Artwork;

    invoke-virtual {v4}, Lcom/google/android/apps/muzei/api/Artwork;->toBundle()Landroid/os/Bundle;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 103
    :cond_14
    const-string v3, "description"

    iget-object v4, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mDescription:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    const-string v3, "wantsNetworkAvailable"

    iget-boolean v4, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mWantsNetworkAvailable:Z

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 105
    iget-object v3, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mUserCommands:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    new-array v1, v3, [Ljava/lang/String;

    .line 106
    .local v1, "commandsSerialized":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2b
    array-length v3, v1

    if-ge v2, v3, :cond_3f

    .line 107
    iget-object v3, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mUserCommands:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/apps/muzei/api/UserCommand;

    invoke-virtual {v3}, Lcom/google/android/apps/muzei/api/UserCommand;->serialize()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 106
    add-int/lit8 v2, v2, 0x1

    goto :goto_2b

    .line 109
    :cond_3f
    const-string v3, "userCommands"

    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 110
    return-object v0
.end method

.method public toJson()Lorg/json/JSONObject;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 131
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 132
    .local v3, "jsonObject":Lorg/json/JSONObject;
    iget-object v4, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mCurrentArtwork:Lcom/google/android/apps/muzei/api/Artwork;

    if-eqz v4, :cond_14

    .line 133
    const-string v4, "currentArtwork"

    iget-object v5, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mCurrentArtwork:Lcom/google/android/apps/muzei/api/Artwork;

    invoke-virtual {v5}, Lcom/google/android/apps/muzei/api/Artwork;->toJson()Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 135
    :cond_14
    const-string v4, "description"

    iget-object v5, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mDescription:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 136
    const-string v4, "wantsNetworkAvailable"

    iget-boolean v5, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mWantsNetworkAvailable:Z

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 137
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 138
    .local v1, "commandsSerialized":Lorg/json/JSONArray;
    iget-object v4, p0, Lcom/google/android/apps/muzei/api/internal/SourceState;->mUserCommands:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_2d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_41

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/apps/muzei/api/UserCommand;

    .line 139
    .local v0, "command":Lcom/google/android/apps/muzei/api/UserCommand;
    invoke-virtual {v0}, Lcom/google/android/apps/muzei/api/UserCommand;->serialize()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_2d

    .line 141
    .end local v0    # "command":Lcom/google/android/apps/muzei/api/UserCommand;
    :cond_41
    const-string v4, "userCommands"

    invoke-virtual {v3, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 142
    return-object v3
.end method
