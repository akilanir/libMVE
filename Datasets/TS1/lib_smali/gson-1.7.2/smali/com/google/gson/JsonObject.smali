.class public final Lcom/google/gson/JsonObject;
.super Lcom/google/gson/JsonElement;
.source "JsonObject.java"


# instance fields
.field private final members:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/gson/JsonElement;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/google/gson/JsonElement;-><init>()V

    .line 45
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/google/gson/JsonObject;->members:Ljava/util/Map;

    .line 46
    return-void
.end method

.method private createJsonElement(Ljava/lang/Object;)Lcom/google/gson/JsonElement;
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 125
    if-nez p1, :cond_7

    invoke-static {}, Lcom/google/gson/JsonNull;->createJsonNull()Lcom/google/gson/JsonNull;

    move-result-object v0

    :goto_6
    return-object v0

    :cond_7
    new-instance v0, Lcom/google/gson/JsonPrimitive;

    invoke-direct {v0, p1}, Lcom/google/gson/JsonPrimitive;-><init>(Ljava/lang/Object;)V

    goto :goto_6
.end method


# virtual methods
.method public add(Ljava/lang/String;Lcom/google/gson/JsonElement;)V
    .registers 5
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # Lcom/google/gson/JsonElement;

    .prologue
    .line 57
    if-nez p2, :cond_6

    .line 58
    invoke-static {}, Lcom/google/gson/JsonNull;->createJsonNull()Lcom/google/gson/JsonNull;

    move-result-object p2

    .line 60
    :cond_6
    iget-object v0, p0, Lcom/google/gson/JsonObject;->members:Ljava/util/Map;

    invoke-static {p1}, Lcom/google/gson/internal/$Gson$Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    return-void
.end method

.method public addProperty(Ljava/lang/String;Ljava/lang/Boolean;)V
    .registers 4
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Boolean;

    .prologue
    .line 104
    invoke-direct {p0, p2}, Lcom/google/gson/JsonObject;->createJsonElement(Ljava/lang/Object;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/gson/JsonObject;->add(Ljava/lang/String;Lcom/google/gson/JsonElement;)V

    .line 105
    return-void
.end method

.method public addProperty(Ljava/lang/String;Ljava/lang/Character;)V
    .registers 4
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Character;

    .prologue
    .line 115
    invoke-direct {p0, p2}, Lcom/google/gson/JsonObject;->createJsonElement(Ljava/lang/Object;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/gson/JsonObject;->add(Ljava/lang/String;Lcom/google/gson/JsonElement;)V

    .line 116
    return-void
.end method

.method public addProperty(Ljava/lang/String;Ljava/lang/Number;)V
    .registers 4
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Number;

    .prologue
    .line 93
    invoke-direct {p0, p2}, Lcom/google/gson/JsonObject;->createJsonElement(Ljava/lang/Object;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/gson/JsonObject;->add(Ljava/lang/String;Lcom/google/gson/JsonElement;)V

    .line 94
    return-void
.end method

.method public addProperty(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 82
    invoke-direct {p0, p2}, Lcom/google/gson/JsonObject;->createJsonElement(Ljava/lang/Object;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/gson/JsonObject;->add(Ljava/lang/String;Lcom/google/gson/JsonElement;)V

    .line 83
    return-void
.end method

.method public entrySet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/gson/JsonElement;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 135
    iget-object v0, p0, Lcom/google/gson/JsonObject;->members:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 194
    if-eq p1, p0, :cond_12

    instance-of v0, p1, Lcom/google/gson/JsonObject;

    if-eqz v0, :cond_14

    check-cast p1, Lcom/google/gson/JsonObject;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v0, p1, Lcom/google/gson/JsonObject;->members:Ljava/util/Map;

    iget-object v1, p0, Lcom/google/gson/JsonObject;->members:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public get(Ljava/lang/String;)Lcom/google/gson/JsonElement;
    .registers 4
    .param p1, "memberName"    # Ljava/lang/String;

    .prologue
    .line 155
    iget-object v1, p0, Lcom/google/gson/JsonObject;->members:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 156
    iget-object v1, p0, Lcom/google/gson/JsonObject;->members:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/gson/JsonElement;

    .line 157
    .local v0, "member":Lcom/google/gson/JsonElement;
    if-nez v0, :cond_16

    invoke-static {}, Lcom/google/gson/JsonNull;->createJsonNull()Lcom/google/gson/JsonNull;

    move-result-object v0

    .line 159
    .end local v0    # "member":Lcom/google/gson/JsonElement;
    :cond_16
    :goto_16
    return-object v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method public getAsJsonArray(Ljava/lang/String;)Lcom/google/gson/JsonArray;
    .registers 3
    .param p1, "memberName"    # Ljava/lang/String;

    .prologue
    .line 179
    iget-object v0, p0, Lcom/google/gson/JsonObject;->members:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/gson/JsonArray;

    return-object v0
.end method

.method public getAsJsonObject(Ljava/lang/String;)Lcom/google/gson/JsonObject;
    .registers 3
    .param p1, "memberName"    # Ljava/lang/String;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/google/gson/JsonObject;->members:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/gson/JsonObject;

    return-object v0
.end method

.method public getAsJsonPrimitive(Ljava/lang/String;)Lcom/google/gson/JsonPrimitive;
    .registers 3
    .param p1, "memberName"    # Ljava/lang/String;

    .prologue
    .line 169
    iget-object v0, p0, Lcom/google/gson/JsonObject;->members:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/gson/JsonPrimitive;

    return-object v0
.end method

.method public has(Ljava/lang/String;)Z
    .registers 3
    .param p1, "memberName"    # Ljava/lang/String;

    .prologue
    .line 145
    iget-object v0, p0, Lcom/google/gson/JsonObject;->members:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 200
    iget-object v0, p0, Lcom/google/gson/JsonObject;->members:Ljava/util/Map;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public remove(Ljava/lang/String;)Lcom/google/gson/JsonElement;
    .registers 3
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/gson/JsonObject;->members:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/gson/JsonElement;

    return-object v0
.end method

.method protected toString(Ljava/lang/Appendable;Lcom/google/gson/Escaper;)V
    .registers 7
    .param p1, "sb"    # Ljava/lang/Appendable;
    .param p2, "escaper"    # Lcom/google/gson/Escaper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 205
    const/16 v3, 0x7b

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 206
    const/4 v1, 0x1

    .line 207
    .local v1, "first":Z
    iget-object v3, p0, Lcom/google/gson/JsonObject;->members:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_10
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_46

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 208
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/google/gson/JsonElement;>;"
    if-eqz v1, :cond_40

    .line 209
    const/4 v1, 0x0

    .line 213
    :goto_1f
    const/16 v3, 0x22

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 214
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    invoke-virtual {p2, v3}, Lcom/google/gson/Escaper;->escapeJsonString(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 215
    const-string v3, "\":"

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 216
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/gson/JsonElement;

    invoke-virtual {v3, p1, p2}, Lcom/google/gson/JsonElement;->toString(Ljava/lang/Appendable;Lcom/google/gson/Escaper;)V

    goto :goto_10

    .line 211
    :cond_40
    const/16 v3, 0x2c

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_1f

    .line 218
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/google/gson/JsonElement;>;"
    :cond_46
    const/16 v3, 0x7d

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 219
    return-void
.end method
