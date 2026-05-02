.class public Lezvcard/io/json/JCardValue;
.super Ljava/lang/Object;
.source "JCardValue.java"


# instance fields
.field private final values:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lezvcard/io/json/JsonValue;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lezvcard/io/json/JsonValue;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p1, "values":Ljava/util/List;, "Ljava/util/List<Lezvcard/io/json/JsonValue;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lezvcard/io/json/JCardValue;->values:Ljava/util/List;

    .line 54
    return-void
.end method

.method public varargs constructor <init>([Lezvcard/io/json/JsonValue;)V
    .registers 3
    .param p1, "values"    # [Lezvcard/io/json/JsonValue;

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lezvcard/io/json/JCardValue;->values:Ljava/util/List;

    .line 62
    return-void
.end method

.method public static multi(Ljava/util/List;)Lezvcard/io/json/JCardValue;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<*>;)",
            "Lezvcard/io/json/JCardValue;"
        }
    .end annotation

    .prologue
    .line 88
    .local p0, "values":Ljava/util/List;, "Ljava/util/List<*>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 89
    .local v1, "multiValues":Ljava/util/List;, "Ljava/util/List<Lezvcard/io/json/JsonValue;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_20

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 90
    .local v2, "value":Ljava/lang/Object;
    new-instance v3, Lezvcard/io/json/JsonValue;

    invoke-direct {v3, v2}, Lezvcard/io/json/JsonValue;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 92
    .end local v2    # "value":Ljava/lang/Object;
    :cond_20
    new-instance v3, Lezvcard/io/json/JCardValue;

    invoke-direct {v3, v1}, Lezvcard/io/json/JCardValue;-><init>(Ljava/util/List;)V

    return-object v3
.end method

.method public static varargs multi([Ljava/lang/Object;)Lezvcard/io/json/JCardValue;
    .registers 2
    .param p0, "values"    # [Ljava/lang/Object;

    .prologue
    .line 79
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lezvcard/io/json/JCardValue;->multi(Ljava/util/List;)Lezvcard/io/json/JCardValue;

    move-result-object v0

    return-object v0
.end method

.method public static single(Ljava/lang/Object;)Lezvcard/io/json/JCardValue;
    .registers 5
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 70
    new-instance v0, Lezvcard/io/json/JCardValue;

    const/4 v1, 0x1

    new-array v1, v1, [Lezvcard/io/json/JsonValue;

    const/4 v2, 0x0

    new-instance v3, Lezvcard/io/json/JsonValue;

    invoke-direct {v3, p0}, Lezvcard/io/json/JsonValue;-><init>(Ljava/lang/Object;)V

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lezvcard/io/json/JCardValue;-><init>([Lezvcard/io/json/JsonValue;)V

    return-object v0
.end method

.method public static structured(Ljava/util/List;)Lezvcard/io/json/JCardValue;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/List",
            "<*>;>;)",
            "Lezvcard/io/json/JCardValue;"
        }
    .end annotation

    .prologue
    .local p0, "values":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<*>;>;"
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 122
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v6

    invoke-direct {v0, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 124
    .local v0, "array":Ljava/util/List;, "Ljava/util/List<Lezvcard/io/json/JsonValue;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_70

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 125
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<*>;"
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_2c

    .line 126
    new-instance v6, Lezvcard/io/json/JsonValue;

    const-string v7, ""

    invoke-direct {v6, v7}, Lezvcard/io/json/JsonValue;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_f

    .line 130
    :cond_2c
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    if-ne v6, v8, :cond_43

    .line 131
    invoke-interface {v3, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    .line 132
    .local v5, "value":Ljava/lang/Object;
    if-nez v5, :cond_3a

    .line 133
    const-string v5, ""

    .line 135
    .end local v5    # "value":Ljava/lang/Object;
    :cond_3a
    new-instance v6, Lezvcard/io/json/JsonValue;

    invoke-direct {v6, v5}, Lezvcard/io/json/JsonValue;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_f

    .line 139
    :cond_43
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 140
    .local v4, "subArray":Ljava/util/List;, "Ljava/util/List<Lezvcard/io/json/JsonValue;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_50
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_67

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 141
    .restart local v5    # "value":Ljava/lang/Object;
    if-nez v5, :cond_5e

    .line 142
    const-string v5, ""

    .line 144
    .end local v5    # "value":Ljava/lang/Object;
    :cond_5e
    new-instance v6, Lezvcard/io/json/JsonValue;

    invoke-direct {v6, v5}, Lezvcard/io/json/JsonValue;-><init>(Ljava/lang/Object;)V

    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_50

    .line 146
    :cond_67
    new-instance v6, Lezvcard/io/json/JsonValue;

    invoke-direct {v6, v4}, Lezvcard/io/json/JsonValue;-><init>(Ljava/util/List;)V

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_f

    .line 149
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "list":Ljava/util/List;, "Ljava/util/List<*>;"
    .end local v4    # "subArray":Ljava/util/List;, "Ljava/util/List<Lezvcard/io/json/JsonValue;>;"
    :cond_70
    new-instance v6, Lezvcard/io/json/JCardValue;

    new-array v7, v8, [Lezvcard/io/json/JsonValue;

    new-instance v8, Lezvcard/io/json/JsonValue;

    invoke-direct {v8, v0}, Lezvcard/io/json/JsonValue;-><init>(Ljava/util/List;)V

    aput-object v8, v7, v9

    invoke-direct {v6, v7}, Lezvcard/io/json/JCardValue;-><init>([Lezvcard/io/json/JsonValue;)V

    return-object v6
.end method

.method public static varargs structured([Ljava/lang/Object;)Lezvcard/io/json/JCardValue;
    .registers 9
    .param p0, "values"    # [Ljava/lang/Object;

    .prologue
    .line 108
    new-instance v5, Ljava/util/ArrayList;

    array-length v6, p0

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 109
    .local v5, "valuesList":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<*>;>;"
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_9
    if-ge v1, v2, :cond_25

    aget-object v4, v0, v1

    .line 110
    .local v4, "value":Ljava/lang/Object;
    instance-of v6, v4, Ljava/util/List;

    if-eqz v6, :cond_1a

    check-cast v4, Ljava/util/List;

    .end local v4    # "value":Ljava/lang/Object;
    move-object v3, v4

    .line 111
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<*>;"
    :goto_14
    invoke-interface {v5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 110
    .end local v3    # "list":Ljava/util/List;, "Ljava/util/List<*>;"
    .restart local v4    # "value":Ljava/lang/Object;
    :cond_1a
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v4, v6, v7

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    goto :goto_14

    .line 113
    .end local v4    # "value":Ljava/lang/Object;
    :cond_25
    invoke-static {v5}, Lezvcard/io/json/JCardValue;->structured(Ljava/util/List;)Lezvcard/io/json/JCardValue;

    move-result-object v6

    return-object v6
.end method


# virtual methods
.method public asMulti()Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 265
    iget-object v4, p0, Lezvcard/io/json/JCardValue;->values:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_d

    .line 266
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    .line 282
    :cond_c
    return-object v1

    .line 269
    :cond_d
    new-instance v1, Ljava/util/ArrayList;

    iget-object v4, p0, Lezvcard/io/json/JCardValue;->values:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 270
    .local v1, "multi":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v4, p0, Lezvcard/io/json/JCardValue;->values:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1e
    :goto_1e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lezvcard/io/json/JsonValue;

    .line 271
    .local v3, "value":Lezvcard/io/json/JsonValue;
    invoke-virtual {v3}, Lezvcard/io/json/JsonValue;->isNull()Z

    move-result v4

    if-eqz v4, :cond_36

    .line 272
    const-string v4, ""

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    .line 276
    :cond_36
    invoke-virtual {v3}, Lezvcard/io/json/JsonValue;->getValue()Ljava/lang/Object;

    move-result-object v2

    .line 277
    .local v2, "obj":Ljava/lang/Object;
    if-eqz v2, :cond_1e

    .line 278
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1e
.end method

.method public asSingle()Ljava/lang/String;
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 165
    iget-object v3, p0, Lezvcard/io/json/JCardValue;->values:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_c

    .line 166
    const-string v3, ""

    .line 188
    :goto_b
    return-object v3

    .line 169
    :cond_c
    iget-object v3, p0, Lezvcard/io/json/JCardValue;->values:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lezvcard/io/json/JsonValue;

    .line 170
    .local v1, "first":Lezvcard/io/json/JsonValue;
    invoke-virtual {v1}, Lezvcard/io/json/JsonValue;->isNull()Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 171
    const-string v3, ""

    goto :goto_b

    .line 174
    :cond_1d
    invoke-virtual {v1}, Lezvcard/io/json/JsonValue;->getValue()Ljava/lang/Object;

    move-result-object v2

    .line 175
    .local v2, "obj":Ljava/lang/Object;
    if-eqz v2, :cond_28

    .line 176
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_b

    .line 180
    :cond_28
    invoke-virtual {v1}, Lezvcard/io/json/JsonValue;->getArray()Ljava/util/List;

    move-result-object v0

    .line 181
    .local v0, "array":Ljava/util/List;, "Ljava/util/List<Lezvcard/io/json/JsonValue;>;"
    if-eqz v0, :cond_45

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_45

    .line 182
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lezvcard/io/json/JsonValue;

    invoke-virtual {v3}, Lezvcard/io/json/JsonValue;->getValue()Ljava/lang/Object;

    move-result-object v2

    .line 183
    if-eqz v2, :cond_45

    .line 184
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_b

    .line 188
    :cond_45
    const-string v3, ""

    goto :goto_b
.end method

.method public asStructured()Ljava/util/List;
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    const/4 v14, 0x0

    const/4 v13, 0x1

    .line 197
    iget-object v11, p0, Lezvcard/io/json/JCardValue;->values:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_f

    .line 198
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v9

    .line 256
    :goto_e
    return-object v9

    .line 201
    :cond_f
    iget-object v11, p0, Lezvcard/io/json/JCardValue;->values:Ljava/util/List;

    invoke-interface {v11, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lezvcard/io/json/JsonValue;

    .line 204
    .local v1, "first":Lezvcard/io/json/JsonValue;
    invoke-virtual {v1}, Lezvcard/io/json/JsonValue;->getArray()Ljava/util/List;

    move-result-object v0

    .line 205
    .local v0, "array":Ljava/util/List;, "Ljava/util/List<Lezvcard/io/json/JsonValue;>;"
    if-eqz v0, :cond_a0

    .line 206
    new-instance v10, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v11

    invoke-direct {v10, v11}, Ljava/util/ArrayList;-><init>(I)V

    .line 207
    .local v10, "valuesStr":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2a
    :goto_2a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_9d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lezvcard/io/json/JsonValue;

    .line 208
    .local v8, "value":Lezvcard/io/json/JsonValue;
    invoke-virtual {v8}, Lezvcard/io/json/JsonValue;->isNull()Z

    move-result v11

    if-eqz v11, :cond_4a

    .line 209
    new-array v11, v13, [Ljava/lang/String;

    const-string v12, ""

    aput-object v12, v11, v14

    invoke-static {v11}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2a

    .line 213
    :cond_4a
    invoke-virtual {v8}, Lezvcard/io/json/JsonValue;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 214
    .local v4, "obj":Ljava/lang/Object;
    if-eqz v4, :cond_60

    .line 215
    new-array v11, v13, [Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v11, v14

    invoke-static {v11}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2a

    .line 219
    :cond_60
    invoke-virtual {v8}, Lezvcard/io/json/JsonValue;->getArray()Ljava/util/List;

    move-result-object v5

    .line 220
    .local v5, "subArray":Ljava/util/List;, "Ljava/util/List<Lezvcard/io/json/JsonValue;>;"
    if-eqz v5, :cond_2a

    .line 221
    new-instance v7, Ljava/util/ArrayList;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v11

    invoke-direct {v7, v11}, Ljava/util/ArrayList;-><init>(I)V

    .line 222
    .local v7, "subValuesStr":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_73
    :goto_73
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_99

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lezvcard/io/json/JsonValue;

    .line 223
    .local v6, "subArrayValue":Lezvcard/io/json/JsonValue;
    invoke-virtual {v6}, Lezvcard/io/json/JsonValue;->isNull()Z

    move-result v11

    if-eqz v11, :cond_8b

    .line 224
    const-string v11, ""

    invoke-interface {v7, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_73

    .line 228
    :cond_8b
    invoke-virtual {v6}, Lezvcard/io/json/JsonValue;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 229
    if-eqz v4, :cond_73

    .line 230
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v7, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_73

    .line 234
    .end local v6    # "subArrayValue":Lezvcard/io/json/JsonValue;
    :cond_99
    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2a

    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "obj":Ljava/lang/Object;
    .end local v5    # "subArray":Ljava/util/List;, "Ljava/util/List<Lezvcard/io/json/JsonValue;>;"
    .end local v7    # "subValuesStr":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v8    # "value":Lezvcard/io/json/JsonValue;
    :cond_9d
    move-object v9, v10

    .line 237
    goto/16 :goto_e

    .line 242
    .end local v10    # "valuesStr":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    :cond_a0
    invoke-virtual {v1}, Lezvcard/io/json/JsonValue;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 243
    .restart local v4    # "obj":Ljava/lang/Object;
    if-eqz v4, :cond_bc

    .line 244
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9, v13}, Ljava/util/ArrayList;-><init>(I)V

    .line 245
    .local v9, "values":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    new-array v11, v13, [Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v11, v14

    invoke-static {v11}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    invoke-interface {v9, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_e

    .line 250
    .end local v9    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    :cond_bc
    invoke-virtual {v1}, Lezvcard/io/json/JsonValue;->isNull()Z

    move-result v11

    if-eqz v11, :cond_d6

    .line 251
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9, v13}, Ljava/util/ArrayList;-><init>(I)V

    .line 252
    .restart local v9    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    new-array v11, v13, [Ljava/lang/String;

    const-string v12, ""

    aput-object v12, v11, v14

    invoke-static {v11}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    invoke-interface {v9, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_e

    .line 256
    .end local v9    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    :cond_d6
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v9

    goto/16 :goto_e
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 287
    if-ne p0, p1, :cond_5

    .line 300
    :cond_4
    :goto_4
    return v1

    .line 290
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    .line 291
    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 294
    check-cast v0, Lezvcard/io/json/JCardValue;

    .line 296
    .local v0, "that":Lezvcard/io/json/JCardValue;
    iget-object v3, p0, Lezvcard/io/json/JCardValue;->values:Ljava/util/List;

    if-eqz v3, :cond_26

    iget-object v3, p0, Lezvcard/io/json/JCardValue;->values:Ljava/util/List;

    iget-object v4, v0, Lezvcard/io/json/JCardValue;->values:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :goto_24
    move v1, v2

    .line 297
    goto :goto_4

    .line 296
    :cond_26
    iget-object v3, v0, Lezvcard/io/json/JCardValue;->values:Ljava/util/List;

    if-eqz v3, :cond_4

    goto :goto_24
.end method

.method public getValues()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/io/json/JsonValue;",
            ">;"
        }
    .end annotation

    .prologue
    .line 157
    iget-object v0, p0, Lezvcard/io/json/JCardValue;->values:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 305
    iget-object v0, p0, Lezvcard/io/json/JCardValue;->values:Ljava/util/List;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lezvcard/io/json/JCardValue;->values:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->hashCode()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method
