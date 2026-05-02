.class public Lcom/facebook/stetho/json/ObjectMapper;
.super Ljava/lang/Object;
.source "ObjectMapper.java"


# instance fields
.field private final mJsonValueMethodCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "mJsonValueMethodCache"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/json/ObjectMapper;->mJsonValueMethodCache:Ljava/util/Map;

    return-void
.end method

.method private _convertFromJSONObject(Lorg/json/JSONObject;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 14
    .param p1, "jsonObject"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/json/JSONObject;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/InstantiationException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 101
    .local p2, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v8, 0x0

    check-cast v8, [Ljava/lang/Class;

    invoke-virtual {p2, v8}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 102
    .local v0, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<TT;>;"
    const/4 v8, 0x1

    invoke-virtual {v0, v8}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 103
    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Object;

    invoke-virtual {v0, v8}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 104
    .local v5, "instance":Ljava/lang/Object;, "TT;"
    invoke-virtual {p2}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v3

    .line 105
    .local v3, "fields":[Ljava/lang/reflect/Field;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_17
    array-length v8, v3

    if-ge v4, v8, :cond_72

    .line 106
    aget-object v2, v3, v4

    .line 107
    .local v2, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 108
    .local v7, "value":Ljava/lang/Object;
    invoke-direct {p0, v2, v7}, Lcom/facebook/stetho/json/ObjectMapper;->getValueForField(Ljava/lang/reflect/Field;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 110
    .local v6, "setValue":Ljava/lang/Object;
    :try_start_28
    invoke-virtual {v2, v5, v6}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_2b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_28 .. :try_end_2b} :catch_2e

    .line 105
    add-int/lit8 v4, v4, 0x1

    goto :goto_17

    .line 111
    :catch_2e
    move-exception v1

    .line 112
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    new-instance v8, Ljava/lang/IllegalArgumentException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Class: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 113
    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "Field: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 114
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " type "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 118
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    .end local v2    # "field":Ljava/lang/reflect/Field;
    .end local v6    # "setValue":Ljava/lang/Object;
    .end local v7    # "value":Ljava/lang/Object;
    :cond_72
    return-object v5
.end method

.method private _convertToJSONObject(Ljava/lang/Object;)Lorg/json/JSONObject;
    .registers 11
    .param p1, "fromValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 238
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 239
    .local v3, "jsonObject":Lorg/json/JSONObject;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    .line 240
    .local v1, "fields":[Ljava/lang/reflect/Field;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_e
    array-length v7, v1

    if-ge v2, v7, :cond_50

    .line 241
    aget-object v7, v1, v2

    const-class v8, Lcom/facebook/stetho/json/annotation/JsonProperty;

    invoke-virtual {v7, v8}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    check-cast v5, Lcom/facebook/stetho/json/annotation/JsonProperty;

    .line 242
    .local v5, "property":Lcom/facebook/stetho/json/annotation/JsonProperty;
    if-eqz v5, :cond_42

    .line 244
    aget-object v7, v1, v2

    invoke-virtual {v7, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 245
    .local v6, "value":Ljava/lang/Object;
    aget-object v7, v1, v2

    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    .line 246
    .local v0, "clazz":Ljava/lang/Class;
    if-eqz v6, :cond_2f

    .line 247
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 249
    :cond_2f
    aget-object v7, v1, v2

    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    .line 250
    .local v4, "name":Ljava/lang/String;
    invoke-interface {v5}, Lcom/facebook/stetho/json/annotation/JsonProperty;->required()Z

    move-result v7

    if-eqz v7, :cond_45

    if-nez v6, :cond_45

    .line 251
    sget-object v6, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    .line 257
    :cond_3f
    :goto_3f
    invoke-virtual {v3, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 240
    .end local v0    # "clazz":Ljava/lang/Class;
    .end local v4    # "name":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/Object;
    :cond_42
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 252
    .restart local v0    # "clazz":Ljava/lang/Class;
    .restart local v4    # "name":Ljava/lang/String;
    .restart local v6    # "value":Ljava/lang/Object;
    :cond_45
    sget-object v7, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq v6, v7, :cond_3f

    .line 255
    aget-object v7, v1, v2

    invoke-direct {p0, v6, v0, v7}, Lcom/facebook/stetho/json/ObjectMapper;->getJsonValue(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/reflect/Field;)Ljava/lang/Object;

    move-result-object v6

    goto :goto_3f

    .line 260
    .end local v0    # "clazz":Ljava/lang/Class;
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "property":Lcom/facebook/stetho/json/annotation/JsonProperty;
    .end local v6    # "value":Ljava/lang/Object;
    :cond_50
    return-object v3
.end method

.method private static canDirectlySerializeClass(Ljava/lang/Class;)Z
    .registers 2
    .param p0, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 338
    invoke-static {p0}, Lcom/facebook/stetho/json/ObjectMapper;->isWrapperOrPrimitiveType(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_e

    const-class v0, Ljava/lang/String;

    .line 339
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method private convertArrayToList(Ljava/lang/reflect/Field;Lorg/json/JSONArray;)Ljava/util/List;
    .registers 12
    .param p1, "field"    # Ljava/lang/reflect/Field;
    .param p2, "array"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Field;",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 206
    const-class v6, Ljava/util/List;

    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_7d

    .line 207
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v4

    check-cast v4, Ljava/lang/reflect/ParameterizedType;

    .line 208
    .local v4, "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v4}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v5

    .line 209
    .local v5, "types":[Ljava/lang/reflect/Type;
    array-length v6, v5

    const/4 v7, 0x1

    if-eq v6, v7, :cond_37

    .line 210
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Only able to handle a single type in a list "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 211
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 213
    :cond_37
    const/4 v6, 0x0

    aget-object v0, v5, v6

    check-cast v0, Ljava/lang/Class;

    .line 214
    .local v0, "arrayClass":Ljava/lang/Class;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 215
    .local v3, "objectList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_42
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v1, v6, :cond_9a

    .line 216
    invoke-virtual {v0}, Ljava/lang/Class;->isEnum()Z

    move-result v6

    if-eqz v6, :cond_5c

    .line 217
    invoke-virtual {p2, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6, v0}, Lcom/facebook/stetho/json/ObjectMapper;->getEnumValue(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Enum;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 215
    :goto_59
    add-int/lit8 v1, v1, 0x1

    goto :goto_42

    .line 218
    :cond_5c
    invoke-static {v0}, Lcom/facebook/stetho/json/ObjectMapper;->canDirectlySerializeClass(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_6a

    .line 219
    invoke-virtual {p2, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_59

    .line 221
    :cond_6a
    invoke-virtual {p2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 222
    .local v2, "jsonObject":Lorg/json/JSONObject;
    if-nez v2, :cond_75

    .line 223
    const/4 v6, 0x0

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_59

    .line 225
    :cond_75
    invoke-virtual {p0, v2, v0}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_59

    .line 231
    .end local v0    # "arrayClass":Ljava/lang/Class;
    .end local v1    # "i":I
    .end local v2    # "jsonObject":Lorg/json/JSONObject;
    .end local v3    # "objectList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .end local v4    # "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    .end local v5    # "types":[Ljava/lang/reflect/Type;
    :cond_7d
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "only know how to deserialize List<?> on field "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 232
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 229
    .restart local v0    # "arrayClass":Ljava/lang/Class;
    .restart local v1    # "i":I
    .restart local v3    # "objectList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .restart local v4    # "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    .restart local v5    # "types":[Ljava/lang/reflect/Type;
    :cond_9a
    return-object v3
.end method

.method private convertListToJsonArray(Ljava/lang/Object;)Lorg/json/JSONArray;
    .registers 8
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 299
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .local v0, "array":Lorg/json/JSONArray;
    move-object v1, p1

    .line 300
    check-cast v1, Ljava/util/List;

    .line 301
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_d
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 303
    .local v2, "obj":Ljava/lang/Object;
    if-eqz v2, :cond_25

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-direct {p0, v2, v3, v4}, Lcom/facebook/stetho/json/ObjectMapper;->getJsonValue(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/reflect/Field;)Ljava/lang/Object;

    move-result-object v3

    :goto_21
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_d

    :cond_25
    move-object v3, v4

    goto :goto_21

    .line 305
    .end local v2    # "obj":Ljava/lang/Object;
    :cond_27
    return-object v0
.end method

.method private getEnumByMethod(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/reflect/Method;)Ljava/lang/Enum;
    .registers 12
    .param p1, "value"    # Ljava/lang/String;
    .param p3, "method"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/Enum;",
            ">;",
            "Ljava/lang/reflect/Method;",
            ")",
            "Ljava/lang/Enum;"
        }
    .end annotation

    .prologue
    .line 186
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Enum;>;"
    invoke-virtual {p2}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Enum;

    .line 188
    .local v1, "enumValues":[Ljava/lang/Enum;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_7
    array-length v5, v1

    if-ge v3, v5, :cond_2a

    .line 189
    aget-object v0, v1, v3

    .line 191
    .local v0, "enumValue":Ljava/lang/Enum;
    const/4 v5, 0x0

    :try_start_d
    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p3, v0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 192
    .local v4, "o":Ljava/lang/Object;
    if-eqz v4, :cond_27

    .line 193
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_1c} :catch_20

    move-result v5

    if-eqz v5, :cond_27

    .line 194
    return-object v0

    .line 197
    .end local v4    # "o":Ljava/lang/Object;
    :catch_20
    move-exception v2

    .line 198
    .local v2, "ex":Ljava/lang/Exception;
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-direct {v5, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 188
    .end local v2    # "ex":Ljava/lang/Exception;
    .restart local v4    # "o":Ljava/lang/Object;
    :cond_27
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 201
    .end local v0    # "enumValue":Ljava/lang/Enum;
    .end local v4    # "o":Ljava/lang/Object;
    :cond_2a
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "No enum constant "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method private getEnumValue(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Enum;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/Enum;",
            ">;)",
            "Ljava/lang/Enum;"
        }
    .end annotation

    .prologue
    .line 168
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Enum;>;"
    invoke-direct {p0, p2}, Lcom/facebook/stetho/json/ObjectMapper;->getJsonValueMethod(Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 169
    .local v0, "method":Ljava/lang/reflect/Method;
    if-eqz v0, :cond_b

    .line 170
    invoke-direct {p0, p1, p2, v0}, Lcom/facebook/stetho/json/ObjectMapper;->getEnumByMethod(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/reflect/Method;)Ljava/lang/Enum;

    move-result-object v1

    .line 172
    :goto_a
    return-object v1

    :cond_b
    invoke-static {p2, p1}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v1

    goto :goto_a
.end method

.method private getJsonValue(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/reflect/Field;)Ljava/lang/Object;
    .registers 9
    .param p1, "value"    # Ljava/lang/Object;
    .param p3, "field"    # Ljava/lang/reflect/Field;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Field;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 265
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_4

    .line 268
    const/4 p1, 0x0

    .line 294
    .end local p1    # "value":Ljava/lang/Object;
    :cond_3
    :goto_3
    return-object p1

    .line 270
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_4
    const-class v3, Ljava/util/List;

    invoke-virtual {v3, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 271
    invoke-direct {p0, p1}, Lcom/facebook/stetho/json/ObjectMapper;->convertListToJsonArray(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object p1

    goto :goto_3

    .line 274
    :cond_11
    invoke-direct {p0, p2}, Lcom/facebook/stetho/json/ObjectMapper;->getJsonValueMethod(Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 275
    .local v2, "m":Ljava/lang/reflect/Method;
    if-eqz v2, :cond_1f

    .line 276
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    goto :goto_3

    .line 278
    :cond_1f
    invoke-static {p2}, Lcom/facebook/stetho/json/ObjectMapper;->canDirectlySerializeClass(Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_2c

    .line 279
    const-class v3, Lorg/json/JSONObject;

    invoke-virtual {p0, p1, v3}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    goto :goto_3

    .line 283
    :cond_2c
    const-class v3, Ljava/lang/Double;

    invoke-virtual {p2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3c

    const-class v3, Ljava/lang/Float;

    invoke-virtual {p2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    :cond_3c
    move-object v3, p1

    .line 284
    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 285
    .local v0, "doubleValue":D
    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-eqz v3, :cond_4c

    .line 286
    const-string p1, "NaN"

    goto :goto_3

    .line 287
    :cond_4c
    const-wide/high16 v3, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v3, v0, v3

    if-nez v3, :cond_55

    .line 288
    const-string p1, "Infinity"

    goto :goto_3

    .line 289
    :cond_55
    const-wide/high16 v3, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v3, v0, v3

    if-nez v3, :cond_3

    .line 290
    const-string p1, "-Infinity"

    goto :goto_3
.end method

.method private getJsonValueMethod(Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 315
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v2, p0, Lcom/facebook/stetho/json/ObjectMapper;->mJsonValueMethodCache:Ljava/util/Map;

    monitor-enter v2

    .line 316
    :try_start_3
    iget-object v1, p0, Lcom/facebook/stetho/json/ObjectMapper;->mJsonValueMethodCache:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Method;

    .line 317
    .local v0, "method":Ljava/lang/reflect/Method;
    if-nez v0, :cond_1e

    iget-object v1, p0, Lcom/facebook/stetho/json/ObjectMapper;->mJsonValueMethodCache:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    .line 318
    invoke-static {p1}, Lcom/facebook/stetho/json/ObjectMapper;->getJsonValueMethodImpl(Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 319
    iget-object v1, p0, Lcom/facebook/stetho/json/ObjectMapper;->mJsonValueMethodCache:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 321
    :cond_1e
    monitor-exit v2

    return-object v0

    .line 322
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :catchall_20
    move-exception v1

    monitor-exit v2
    :try_end_22
    .catchall {:try_start_3 .. :try_end_22} :catchall_20

    throw v1
.end method

.method private static getJsonValueMethodImpl(Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 327
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v2

    .line 328
    .local v2, "methods":[Ljava/lang/reflect/Method;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    array-length v3, v2

    if-ge v0, v3, :cond_18

    .line 329
    aget-object v3, v2, v0

    const-class v4, Lcom/facebook/stetho/json/annotation/JsonValue;

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    .line 330
    .local v1, "jsonValue":Ljava/lang/annotation/Annotation;
    if-eqz v1, :cond_15

    .line 331
    aget-object v3, v2, v0

    .line 334
    .end local v1    # "jsonValue":Ljava/lang/annotation/Annotation;
    :goto_14
    return-object v3

    .line 328
    .restart local v1    # "jsonValue":Ljava/lang/annotation/Annotation;
    :cond_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 334
    .end local v1    # "jsonValue":Ljava/lang/annotation/Annotation;
    :cond_18
    const/4 v3, 0x0

    goto :goto_14
.end method

.method private getValueForField(Ljava/lang/reflect/Field;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10
    .param p1, "field"    # Ljava/lang/reflect/Field;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 124
    if-eqz p2, :cond_7

    .line 125
    :try_start_2
    sget-object v4, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-ne p2, v4, :cond_8

    .line 126
    const/4 p2, 0x0

    .line 164
    .end local p2    # "value":Ljava/lang/Object;
    :cond_7
    :goto_7
    return-object p2

    .line 128
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_8
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v5

    if-eq v4, v5, :cond_7

    .line 131
    instance-of v4, p2, Lorg/json/JSONObject;

    if-eqz v4, :cond_1f

    .line 132
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {p0, p2, v4}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    goto :goto_7

    .line 134
    :cond_1f
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->isEnum()Z

    move-result v4

    if-eqz v4, :cond_3a

    .line 135
    check-cast p2, Ljava/lang/String;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v4

    const-class v5, Ljava/lang/Enum;

    invoke-virtual {v4, v5}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v4

    invoke-direct {p0, p2, v4}, Lcom/facebook/stetho/json/ObjectMapper;->getEnumValue(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Enum;

    move-result-object p2

    goto :goto_7

    .line 136
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_3a
    instance-of v4, p2, Lorg/json/JSONArray;

    if-eqz v4, :cond_45

    .line 137
    check-cast p2, Lorg/json/JSONArray;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-direct {p0, p1, p2}, Lcom/facebook/stetho/json/ObjectMapper;->convertArrayToList(Ljava/lang/reflect/Field;Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object p2

    goto :goto_7

    .line 138
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_45
    instance-of v4, p2, Ljava/lang/Number;

    if-eqz v4, :cond_7

    .line 141
    move-object v0, p2

    check-cast v0, Ljava/lang/Number;

    move-object v3, v0

    .line 142
    .local v3, "numberValue":Ljava/lang/Number;
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    .line 143
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v4, Ljava/lang/Integer;

    if-eq v1, v4, :cond_59

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne v1, v4, :cond_62

    .line 144
    :cond_59
    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    goto :goto_7

    .line 145
    :cond_62
    const-class v4, Ljava/lang/Long;

    if-eq v1, v4, :cond_6a

    sget-object v4, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne v1, v4, :cond_73

    .line 146
    :cond_6a
    invoke-virtual {v3}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    goto :goto_7

    .line 147
    :cond_73
    const-class v4, Ljava/lang/Double;

    if-eq v1, v4, :cond_7b

    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne v1, v4, :cond_84

    .line 148
    :cond_7b
    invoke-virtual {v3}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p2

    goto :goto_7

    .line 149
    :cond_84
    const-class v4, Ljava/lang/Float;

    if-eq v1, v4, :cond_8c

    sget-object v4, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne v1, v4, :cond_96

    .line 150
    :cond_8c
    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    move-result v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    goto/16 :goto_7

    .line 151
    :cond_96
    const-class v4, Ljava/lang/Byte;

    if-eq v1, v4, :cond_9e

    sget-object v4, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne v1, v4, :cond_a8

    .line 152
    :cond_9e
    invoke-virtual {v3}, Ljava/lang/Number;->byteValue()B

    move-result v4

    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p2

    goto/16 :goto_7

    .line 153
    :cond_a8
    const-class v4, Ljava/lang/Short;

    if-eq v1, v4, :cond_b0

    sget-object v4, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne v1, v4, :cond_ba

    .line 154
    :cond_b0
    invoke-virtual {v3}, Ljava/lang/Number;->shortValue()S

    move-result v4

    invoke-static {v4}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object p2

    goto/16 :goto_7

    .line 156
    :cond_ba
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Not setup to handle class "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_d7
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_d7} :catch_d7

    .line 161
    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "numberValue":Ljava/lang/Number;
    .end local p2    # "value":Ljava/lang/Object;
    :catch_d7
    move-exception v2

    .line 162
    .local v2, "e":Ljava/lang/IllegalAccessException;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to set value for field "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method private static isWrapperOrPrimitiveType(Ljava/lang/Class;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 343
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-nez v0, :cond_46

    const-class v0, Ljava/lang/Boolean;

    .line 344
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_46

    const-class v0, Ljava/lang/Integer;

    .line 345
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_46

    const-class v0, Ljava/lang/Character;

    .line 346
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_46

    const-class v0, Ljava/lang/Byte;

    .line 347
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_46

    const-class v0, Ljava/lang/Short;

    .line 348
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_46

    const-class v0, Ljava/lang/Double;

    .line 349
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_46

    const-class v0, Ljava/lang/Long;

    .line 350
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_46

    const-class v0, Ljava/lang/Float;

    .line 351
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_48

    :cond_46
    const/4 v0, 0x1

    :goto_47
    return v0

    :cond_48
    const/4 v0, 0x0

    goto :goto_47
.end method


# virtual methods
.method public convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 6
    .param p1, "fromValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 67
    .local p2, "toValueType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    if-nez p1, :cond_4

    .line 68
    const/4 p1, 0x0

    .line 80
    .end local p1    # "fromValue":Ljava/lang/Object;
    :cond_3
    :goto_3
    return-object p1

    .line 71
    .restart local p1    # "fromValue":Ljava/lang/Object;
    :cond_4
    const-class v1, Ljava/lang/Object;

    if-eq p2, v1, :cond_12

    .line 72
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 77
    :cond_12
    :try_start_12
    instance-of v1, p1, Lorg/json/JSONObject;

    if-eqz v1, :cond_1d

    .line 78
    check-cast p1, Lorg/json/JSONObject;

    .end local p1    # "fromValue":Ljava/lang/Object;
    invoke-direct {p0, p1, p2}, Lcom/facebook/stetho/json/ObjectMapper;->_convertFromJSONObject(Lorg/json/JSONObject;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    goto :goto_3

    .line 79
    .restart local p1    # "fromValue":Ljava/lang/Object;
    :cond_1d
    const-class v1, Lorg/json/JSONObject;

    if-ne p2, v1, :cond_26

    .line 80
    invoke-direct {p0, p1}, Lcom/facebook/stetho/json/ObjectMapper;->_convertToJSONObject(Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    goto :goto_3

    .line 82
    :cond_26
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Expecting either fromValue or toValueType to be a JSONObject"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2e
    .catch Ljava/lang/NoSuchMethodException; {:try_start_12 .. :try_end_2e} :catch_2e
    .catch Ljava/lang/IllegalAccessException; {:try_start_12 .. :try_end_2e} :catch_35
    .catch Ljava/lang/InstantiationException; {:try_start_12 .. :try_end_2e} :catch_3c
    .catch Lorg/json/JSONException; {:try_start_12 .. :try_end_2e} :catch_43
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_12 .. :try_end_2e} :catch_4a

    .line 85
    .end local p1    # "fromValue":Ljava/lang/Object;
    :catch_2e
    move-exception v0

    .line 86
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 87
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :catch_35
    move-exception v0

    .line 88
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 89
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_3c
    move-exception v0

    .line 90
    .local v0, "e":Ljava/lang/InstantiationException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 91
    .end local v0    # "e":Ljava/lang/InstantiationException;
    :catch_43
    move-exception v0

    .line 92
    .local v0, "e":Lorg/json/JSONException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 93
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_4a
    move-exception v0

    .line 94
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/stetho/common/ExceptionUtil;->propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method
