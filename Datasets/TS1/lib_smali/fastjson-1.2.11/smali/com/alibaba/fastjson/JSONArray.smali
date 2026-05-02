.class public Lcom/alibaba/fastjson/JSONArray;
.super Lcom/alibaba/fastjson/JSON;
.source "JSONArray.java"

# interfaces
.implements Ljava/util/List;
.implements Ljava/lang/Cloneable;
.implements Ljava/util/RandomAccess;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/alibaba/fastjson/JSON;",
        "Ljava/util/List",
        "<",
        "Ljava/lang/Object;",
        ">;",
        "Ljava/lang/Cloneable;",
        "Ljava/util/RandomAccess;",
        "Ljava/io/Serializable;"
    }
.end annotation


# instance fields
.field protected transient componentType:Ljava/lang/reflect/Type;

.field private final list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected transient relatedArray:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/alibaba/fastjson/JSON;-><init>()V

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    .line 57
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "initialCapacity"    # I

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/alibaba/fastjson/JSON;-><init>()V

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    .line 65
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 59
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-direct {p0}, Lcom/alibaba/fastjson/JSON;-><init>()V

    .line 60
    iput-object p1, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    .line 61
    return-void
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .registers 4
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;

    .prologue
    .line 201
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 202
    return-void
.end method

.method public add(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "e"    # Ljava/lang/Object;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public addAll(ILjava/util/Collection;)Z
    .registers 4
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection",
            "<+",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 143
    .local p2, "c":Ljava/util/Collection;, "Ljava/util/Collection<+Ljava/lang/Object;>;"
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 134
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<+Ljava/lang/Object;>;"
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 170
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 171
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 421
    new-instance v0, Lcom/alibaba/fastjson/JSONArray;

    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONArray;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 130
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 425
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public fluentAdd(ILjava/lang/Object;)Lcom/alibaba/fastjson/JSONArray;
    .registers 4
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;

    .prologue
    .line 205
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 206
    return-object p0
.end method

.method public fluentAdd(Ljava/lang/Object;)Lcom/alibaba/fastjson/JSONArray;
    .registers 3
    .param p1, "e"    # Ljava/lang/Object;

    .prologue
    .line 116
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    return-object p0
.end method

.method public fluentAddAll(ILjava/util/Collection;)Lcom/alibaba/fastjson/JSONArray;
    .registers 4
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection",
            "<+",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/alibaba/fastjson/JSONArray;"
        }
    .end annotation

    .prologue
    .line 147
    .local p2, "c":Ljava/util/Collection;, "Ljava/util/Collection<+Ljava/lang/Object;>;"
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 148
    return-object p0
.end method

.method public fluentAddAll(Ljava/util/Collection;)Lcom/alibaba/fastjson/JSONArray;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/alibaba/fastjson/JSONArray;"
        }
    .end annotation

    .prologue
    .line 138
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<+Ljava/lang/Object;>;"
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 139
    return-object p0
.end method

.method public fluentClear()Lcom/alibaba/fastjson/JSONArray;
    .registers 2

    .prologue
    .line 174
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 175
    return-object p0
.end method

.method public fluentRemove(I)Lcom/alibaba/fastjson/JSONArray;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 214
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 215
    return-object p0
.end method

.method public fluentRemove(Ljava/lang/Object;)Lcom/alibaba/fastjson/JSONArray;
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 125
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 126
    return-object p0
.end method

.method public fluentRemoveAll(Ljava/util/Collection;)Lcom/alibaba/fastjson/JSONArray;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)",
            "Lcom/alibaba/fastjson/JSONArray;"
        }
    .end annotation

    .prologue
    .line 156
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 157
    return-object p0
.end method

.method public fluentRetainAll(Ljava/util/Collection;)Lcom/alibaba/fastjson/JSONArray;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)",
            "Lcom/alibaba/fastjson/JSONArray;"
        }
    .end annotation

    .prologue
    .line 165
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->retainAll(Ljava/util/Collection;)Z

    .line 166
    return-object p0
.end method

.method public fluentSet(ILjava/lang/Object;)Lcom/alibaba/fastjson/JSONArray;
    .registers 3
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;

    .prologue
    .line 196
    invoke-virtual {p0, p1, p2}, Lcom/alibaba/fastjson/JSONArray;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 197
    return-object p0
.end method

.method public get(I)Ljava/lang/Object;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 239
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getBigDecimal(I)Ljava/math/BigDecimal;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 384
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 386
    .local v0, "value":Ljava/lang/Object;
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToBigDecimal(Ljava/lang/Object;)Ljava/math/BigDecimal;

    move-result-object v1

    return-object v1
.end method

.method public getBigInteger(I)Ljava/math/BigInteger;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 390
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 392
    .local v0, "value":Ljava/lang/Object;
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToBigInteger(Ljava/lang/Object;)Ljava/math/BigInteger;

    move-result-object v1

    return-object v1
.end method

.method public getBoolean(I)Ljava/lang/Boolean;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 268
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 270
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_8

    .line 271
    const/4 v1, 0x0

    .line 274
    :goto_7
    return-object v1

    :cond_8
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToBoolean(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_7
.end method

.method public getBooleanValue(I)Z
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 278
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 280
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_8

    .line 281
    const/4 v1, 0x0

    .line 284
    :goto_7
    return v1

    :cond_8
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToBoolean(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto :goto_7
.end method

.method public getByte(I)Ljava/lang/Byte;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 288
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 290
    .local v0, "value":Ljava/lang/Object;
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToByte(Ljava/lang/Object;)Ljava/lang/Byte;

    move-result-object v1

    return-object v1
.end method

.method public getByteValue(I)B
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 294
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 296
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_8

    .line 297
    const/4 v1, 0x0

    .line 300
    :goto_7
    return v1

    :cond_8
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToByte(Ljava/lang/Object;)Ljava/lang/Byte;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Byte;->byteValue()B

    move-result v1

    goto :goto_7
.end method

.method public getComponentType()Ljava/lang/reflect/Type;
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->componentType:Ljava/lang/reflect/Type;

    return-object v0
.end method

.method public getDate(I)Ljava/util/Date;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 402
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 404
    .local v0, "value":Ljava/lang/Object;
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToDate(Ljava/lang/Object;)Ljava/util/Date;

    move-result-object v1

    return-object v1
.end method

.method public getDouble(I)Ljava/lang/Double;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 368
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 370
    .local v0, "value":Ljava/lang/Object;
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToDouble(Ljava/lang/Object;)Ljava/lang/Double;

    move-result-object v1

    return-object v1
.end method

.method public getDoubleValue(I)D
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 374
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 376
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_9

    .line 377
    const-wide/16 v1, 0x0

    .line 380
    :goto_8
    return-wide v1

    :cond_9
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToDouble(Ljava/lang/Object;)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    goto :goto_8
.end method

.method public getFloat(I)Ljava/lang/Float;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 352
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 354
    .local v0, "value":Ljava/lang/Object;
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToFloat(Ljava/lang/Object;)Ljava/lang/Float;

    move-result-object v1

    return-object v1
.end method

.method public getFloatValue(I)F
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 358
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 360
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_8

    .line 361
    const/4 v1, 0x0

    .line 364
    :goto_7
    return v1

    :cond_8
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToFloat(Ljava/lang/Object;)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    goto :goto_7
.end method

.method public getIntValue(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 326
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 328
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_8

    .line 329
    const/4 v1, 0x0

    .line 332
    :goto_7
    return v1

    :cond_8
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToInt(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_7
.end method

.method public getInteger(I)Ljava/lang/Integer;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 320
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 322
    .local v0, "value":Ljava/lang/Object;
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToInt(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v1

    return-object v1
.end method

.method public getJSONArray(I)Lcom/alibaba/fastjson/JSONArray;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 253
    iget-object v1, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 255
    .local v0, "value":Ljava/lang/Object;
    instance-of v1, v0, Lcom/alibaba/fastjson/JSONArray;

    if-eqz v1, :cond_d

    .line 256
    check-cast v0, Lcom/alibaba/fastjson/JSONArray;

    .line 259
    .end local v0    # "value":Ljava/lang/Object;
    :goto_c
    return-object v0

    .restart local v0    # "value":Ljava/lang/Object;
    :cond_d
    invoke-static {v0}, Lcom/alibaba/fastjson/JSONArray;->toJSON(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/alibaba/fastjson/JSONArray;

    move-object v0, v1

    goto :goto_c
.end method

.method public getJSONObject(I)Lcom/alibaba/fastjson/JSONObject;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 243
    iget-object v1, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 245
    .local v0, "value":Ljava/lang/Object;
    instance-of v1, v0, Lcom/alibaba/fastjson/JSONObject;

    if-eqz v1, :cond_d

    .line 246
    check-cast v0, Lcom/alibaba/fastjson/JSONObject;

    .line 249
    .end local v0    # "value":Ljava/lang/Object;
    :goto_c
    return-object v0

    .restart local v0    # "value":Ljava/lang/Object;
    :cond_d
    invoke-static {v0}, Lcom/alibaba/fastjson/JSONArray;->toJSON(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/alibaba/fastjson/JSONObject;

    move-object v0, v1

    goto :goto_c
.end method

.method public getLong(I)Ljava/lang/Long;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 336
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 338
    .local v0, "value":Ljava/lang/Object;
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v1

    return-object v1
.end method

.method public getLongValue(I)J
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 342
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 344
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_9

    .line 345
    const-wide/16 v1, 0x0

    .line 348
    :goto_8
    return-wide v1

    :cond_9
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    goto :goto_8
.end method

.method public getObject(ILjava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 263
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v1, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 264
    .local v0, "obj":Ljava/lang/Object;
    invoke-static {v0, p2}, Lcom/alibaba/fastjson/util/TypeUtils;->castToJavaBean(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public getRelatedArray()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->relatedArray:Ljava/lang/Object;

    return-object v0
.end method

.method public getShort(I)Ljava/lang/Short;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 304
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 306
    .local v0, "value":Ljava/lang/Object;
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToShort(Ljava/lang/Object;)Ljava/lang/Short;

    move-result-object v1

    return-object v1
.end method

.method public getShortValue(I)S
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 310
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 312
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_8

    .line 313
    const/4 v1, 0x0

    .line 316
    :goto_7
    return v1

    :cond_8
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToShort(Ljava/lang/Object;)Ljava/lang/Short;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Short;->shortValue()S

    move-result v1

    goto :goto_7
.end method

.method public getSqlDate(I)Ljava/sql/Date;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 408
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 410
    .local v0, "value":Ljava/lang/Object;
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToSqlDate(Ljava/lang/Object;)Ljava/sql/Date;

    move-result-object v1

    return-object v1
.end method

.method public getString(I)Ljava/lang/String;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 396
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 398
    .local v0, "value":Ljava/lang/Object;
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getTimestamp(I)Ljava/sql/Timestamp;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 414
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 416
    .local v0, "value":Ljava/lang/Object;
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToTimestamp(Ljava/lang/Object;)Ljava/sql/Timestamp;

    move-result-object v1

    return-object v1
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 429
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->hashCode()I

    move-result v0

    return v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 219
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 100
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 223
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->lastIndexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public listIterator()Ljava/util/ListIterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ListIterator",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 227
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public listIterator(I)Ljava/util/ListIterator;
    .registers 3
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ListIterator",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 231
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public remove(I)Ljava/lang/Object;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 210
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 152
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 161
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->retainAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 179
    const/4 v2, -0x1

    if-ne p1, v2, :cond_a

    .line 180
    iget-object v2, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v2, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    :goto_9
    return-object v1

    .line 184
    :cond_a
    iget-object v2, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-gt v2, p1, :cond_28

    .line 185
    iget-object v2, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    .local v0, "i":I
    :goto_18
    if-ge v0, p1, :cond_22

    .line 186
    iget-object v2, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 185
    add-int/lit8 v0, v0, 0x1

    goto :goto_18

    .line 188
    :cond_22
    iget-object v2, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v2, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 192
    .end local v0    # "i":I
    :cond_28
    iget-object v1, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v1, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_9
.end method

.method public setComponentType(Ljava/lang/reflect/Type;)V
    .registers 2
    .param p1, "componentType"    # Ljava/lang/reflect/Type;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/alibaba/fastjson/JSONArray;->componentType:Ljava/lang/reflect/Type;

    .line 85
    return-void
.end method

.method public setRelatedArray(Ljava/lang/Object;)V
    .registers 2
    .param p1, "relatedArray"    # Ljava/lang/Object;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/alibaba/fastjson/JSONArray;->relatedArray:Ljava/lang/Object;

    .line 77
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public subList(II)Ljava/util/List;
    .registers 4
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 235
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 108
    .local p1, "a":[Ljava/lang/Object;, "[TT;"
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONArray;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
