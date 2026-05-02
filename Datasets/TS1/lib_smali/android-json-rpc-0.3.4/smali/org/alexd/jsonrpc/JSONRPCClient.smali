.class public abstract Lorg/alexd/jsonrpc/JSONRPCClient;
.super Ljava/lang/Object;
.source "JSONRPCClient.java"


# instance fields
.field protected _debug:Z

.field protected connectionTimeout:I

.field protected encoding:Ljava/lang/String;

.field protected soTimeout:I

.field protected version:Lorg/alexd/jsonrpc/JSONRPCParams$Versions;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const-string v0, "UTF-8"

    iput-object v0, p0, Lorg/alexd/jsonrpc/JSONRPCClient;->encoding:Ljava/lang/String;

    .line 31
    iput-boolean v1, p0, Lorg/alexd/jsonrpc/JSONRPCClient;->_debug:Z

    .line 111
    iput v1, p0, Lorg/alexd/jsonrpc/JSONRPCClient;->soTimeout:I

    iput v1, p0, Lorg/alexd/jsonrpc/JSONRPCClient;->connectionTimeout:I

    .line 13
    return-void
.end method

.method public static create(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCParams$Versions;)Lorg/alexd/jsonrpc/JSONRPCClient;
    .registers 3
    .param p0, "uri"    # Ljava/lang/String;
    .param p1, "version"    # Lorg/alexd/jsonrpc/JSONRPCParams$Versions;

    .prologue
    .line 26
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCHttpClient;

    invoke-direct {v0, p0}, Lorg/alexd/jsonrpc/JSONRPCHttpClient;-><init>(Ljava/lang/String;)V

    .line 27
    .local v0, "client":Lorg/alexd/jsonrpc/JSONRPCClient;
    iput-object p1, v0, Lorg/alexd/jsonrpc/JSONRPCClient;->version:Lorg/alexd/jsonrpc/JSONRPCParams$Versions;

    .line 28
    return-object v0
.end method

.method protected static getJSONArray([Ljava/lang/Object;)Lorg/json/JSONArray;
    .registers 6
    .param p0, "array"    # [Ljava/lang/Object;

    .prologue
    .line 58
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 59
    .local v0, "arr":Lorg/json/JSONArray;
    array-length v3, p0

    const/4 v2, 0x0

    :goto_7
    if-lt v2, v3, :cond_a

    .line 67
    return-object v0

    .line 59
    :cond_a
    aget-object v1, p0, v2

    .line 60
    .local v1, "item":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->isArray()Z

    move-result v4

    if-eqz v4, :cond_22

    .line 61
    check-cast v1, [Ljava/lang/Object;

    .end local v1    # "item":Ljava/lang/Object;
    invoke-static {v1}, Lorg/alexd/jsonrpc/JSONRPCClient;->getJSONArray([Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 59
    :goto_1f
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 64
    .restart local v1    # "item":Ljava/lang/Object;
    :cond_22
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1f
.end method


# virtual methods
.method public call(Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/Object;
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 206
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/alexd/jsonrpc/JSONRPCClient;->doRequest(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "result"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;
    :try_end_9
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v1

    return-object v1

    .line 207
    :catch_b
    move-exception v0

    .line 208
    .local v0, "e":Lorg/json/JSONException;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v2, "Cannot convert result to String"

    invoke-direct {v1, v2, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public varargs call(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 190
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/alexd/jsonrpc/JSONRPCClient;->doRequest(Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "result"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;
    :try_end_9
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v1

    return-object v1

    .line 192
    :catch_b
    move-exception v0

    .line 194
    .local v0, "e":Lorg/json/JSONException;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v2, "Cannot convert result"

    invoke-direct {v1, v2, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public callBoolean(Ljava/lang/String;Lorg/json/JSONObject;)Z
    .registers 9
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 396
    const/4 v2, 0x0

    .line 399
    .local v2, "response":Lorg/json/JSONObject;
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lorg/alexd/jsonrpc/JSONRPCClient;->doRequest(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v2

    .line 400
    if-nez v2, :cond_28

    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Cannot call method: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/Object;)V

    throw v3
    :try_end_1c
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1c} :catch_1c

    .line 404
    :catch_1c
    move-exception v0

    .line 407
    .local v0, "e":Lorg/json/JSONException;
    :try_start_1d
    const-string v3, "result"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z
    :try_end_26
    .catch Ljava/lang/NumberFormatException; {:try_start_1d .. :try_end_26} :catch_2f
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_26} :catch_38

    move-result v3

    .end local v0    # "e":Lorg/json/JSONException;
    :goto_27
    return v3

    .line 402
    :cond_28
    :try_start_28
    const-string v3, "result"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z
    :try_end_2d
    .catch Lorg/json/JSONException; {:try_start_28 .. :try_end_2d} :catch_1c

    move-result v3

    goto :goto_27

    .line 408
    .restart local v0    # "e":Lorg/json/JSONException;
    :catch_2f
    move-exception v1

    .line 409
    .local v1, "e1":Ljava/lang/NumberFormatException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to boolean"

    invoke-direct {v3, v4, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 410
    .end local v1    # "e1":Ljava/lang/NumberFormatException;
    :catch_38
    move-exception v1

    .line 411
    .local v1, "e1":Lorg/json/JSONException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to boolean"

    invoke-direct {v3, v4, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public varargs callBoolean(Ljava/lang/String;[Ljava/lang/Object;)Z
    .registers 9
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 367
    const/4 v2, 0x0

    .line 370
    .local v2, "response":Lorg/json/JSONObject;
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lorg/alexd/jsonrpc/JSONRPCClient;->doRequest(Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    .line 371
    if-nez v2, :cond_28

    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Cannot call method: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/Object;)V

    throw v3
    :try_end_1c
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1c} :catch_1c

    .line 375
    :catch_1c
    move-exception v0

    .line 378
    .local v0, "e":Lorg/json/JSONException;
    :try_start_1d
    const-string v3, "result"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z
    :try_end_26
    .catch Ljava/lang/NumberFormatException; {:try_start_1d .. :try_end_26} :catch_2f
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_26} :catch_38

    move-result v3

    .end local v0    # "e":Lorg/json/JSONException;
    :goto_27
    return v3

    .line 373
    :cond_28
    :try_start_28
    const-string v3, "result"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z
    :try_end_2d
    .catch Lorg/json/JSONException; {:try_start_28 .. :try_end_2d} :catch_1c

    move-result v3

    goto :goto_27

    .line 379
    .restart local v0    # "e":Lorg/json/JSONException;
    :catch_2f
    move-exception v1

    .line 380
    .local v1, "e1":Ljava/lang/NumberFormatException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to boolean"

    invoke-direct {v3, v4, v1}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 381
    .end local v1    # "e1":Ljava/lang/NumberFormatException;
    :catch_38
    move-exception v1

    .line 382
    .local v1, "e1":Lorg/json/JSONException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to boolean"

    invoke-direct {v3, v4, v1}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public callDouble(Ljava/lang/String;Lorg/json/JSONObject;)D
    .registers 9
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 455
    const/4 v2, 0x0

    .line 458
    .local v2, "response":Lorg/json/JSONObject;
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lorg/alexd/jsonrpc/JSONRPCClient;->doRequest(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v2

    .line 459
    if-nez v2, :cond_28

    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Cannot call method: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/Object;)V

    throw v3
    :try_end_1c
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1c} :catch_1c

    .line 463
    :catch_1c
    move-exception v0

    .line 466
    .local v0, "e":Lorg/json/JSONException;
    :try_start_1d
    const-string v3, "result"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D
    :try_end_26
    .catch Ljava/lang/NumberFormatException; {:try_start_1d .. :try_end_26} :catch_2f
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_26} :catch_38

    move-result-wide v3

    .end local v0    # "e":Lorg/json/JSONException;
    :goto_27
    return-wide v3

    .line 461
    :cond_28
    :try_start_28
    const-string v3, "result"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D
    :try_end_2d
    .catch Lorg/json/JSONException; {:try_start_28 .. :try_end_2d} :catch_1c

    move-result-wide v3

    goto :goto_27

    .line 467
    .restart local v0    # "e":Lorg/json/JSONException;
    :catch_2f
    move-exception v1

    .line 468
    .local v1, "e1":Ljava/lang/NumberFormatException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to double"

    invoke-direct {v3, v4, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 469
    .end local v1    # "e1":Ljava/lang/NumberFormatException;
    :catch_38
    move-exception v1

    .line 470
    .local v1, "e1":Lorg/json/JSONException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to double"

    invoke-direct {v3, v4, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public varargs callDouble(Ljava/lang/String;[Ljava/lang/Object;)D
    .registers 9
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 426
    const/4 v2, 0x0

    .line 429
    .local v2, "response":Lorg/json/JSONObject;
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lorg/alexd/jsonrpc/JSONRPCClient;->doRequest(Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    .line 430
    if-nez v2, :cond_28

    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Cannot call method: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/Object;)V

    throw v3
    :try_end_1c
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1c} :catch_1c

    .line 434
    :catch_1c
    move-exception v0

    .line 437
    .local v0, "e":Lorg/json/JSONException;
    :try_start_1d
    const-string v3, "result"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D
    :try_end_26
    .catch Ljava/lang/NumberFormatException; {:try_start_1d .. :try_end_26} :catch_2f
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_26} :catch_38

    move-result-wide v3

    .end local v0    # "e":Lorg/json/JSONException;
    :goto_27
    return-wide v3

    .line 432
    :cond_28
    :try_start_28
    const-string v3, "result"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D
    :try_end_2d
    .catch Lorg/json/JSONException; {:try_start_28 .. :try_end_2d} :catch_1c

    move-result-wide v3

    goto :goto_27

    .line 438
    .restart local v0    # "e":Lorg/json/JSONException;
    :catch_2f
    move-exception v1

    .line 439
    .local v1, "e1":Ljava/lang/NumberFormatException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to double"

    invoke-direct {v3, v4, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 440
    .end local v1    # "e1":Ljava/lang/NumberFormatException;
    :catch_38
    move-exception v1

    .line 441
    .local v1, "e1":Lorg/json/JSONException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to double"

    invoke-direct {v3, v4, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public varargs callInt(Ljava/lang/String;[Ljava/lang/Object;)I
    .registers 9
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 260
    const/4 v2, 0x0

    .line 263
    .local v2, "response":Lorg/json/JSONObject;
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lorg/alexd/jsonrpc/JSONRPCClient;->doRequest(Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    .line 264
    if-nez v2, :cond_28

    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Cannot call method: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/Object;)V

    throw v3
    :try_end_1c
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1c} :catch_1c

    .line 266
    :catch_1c
    move-exception v0

    .line 268
    .local v0, "e":Lorg/json/JSONException;
    :try_start_1d
    const-string v3, "result"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_26
    .catch Ljava/lang/NumberFormatException; {:try_start_1d .. :try_end_26} :catch_2f
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_26} :catch_38

    move-result v3

    .end local v0    # "e":Lorg/json/JSONException;
    :goto_27
    return v3

    .line 265
    :cond_28
    :try_start_28
    const-string v3, "result"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_2d
    .catch Lorg/json/JSONException; {:try_start_28 .. :try_end_2d} :catch_1c

    move-result v3

    goto :goto_27

    .line 269
    .restart local v0    # "e":Lorg/json/JSONException;
    :catch_2f
    move-exception v1

    .line 270
    .local v1, "e1":Ljava/lang/NumberFormatException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to int"

    invoke-direct {v3, v4, v1}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 271
    .end local v1    # "e1":Ljava/lang/NumberFormatException;
    :catch_38
    move-exception v1

    .line 272
    .local v1, "e1":Lorg/json/JSONException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to int"

    invoke-direct {v3, v4, v1}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public callInt(Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/Object;
    .registers 9
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 285
    const/4 v2, 0x0

    .line 287
    .local v2, "response":Lorg/json/JSONObject;
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lorg/alexd/jsonrpc/JSONRPCClient;->doRequest(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v2

    .line 288
    if-nez v2, :cond_2c

    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Cannot call method: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/Object;)V

    throw v3
    :try_end_1c
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1c} :catch_1c

    .line 290
    :catch_1c
    move-exception v0

    .line 292
    .local v0, "e":Lorg/json/JSONException;
    :try_start_1d
    const-string v3, "result"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_2a
    .catch Ljava/lang/NumberFormatException; {:try_start_1d .. :try_end_2a} :catch_37
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_2a} :catch_40

    move-result-object v3

    .end local v0    # "e":Lorg/json/JSONException;
    :goto_2b
    return-object v3

    .line 289
    :cond_2c
    :try_start_2c
    const-string v3, "result"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_35
    .catch Lorg/json/JSONException; {:try_start_2c .. :try_end_35} :catch_1c

    move-result-object v3

    goto :goto_2b

    .line 293
    .restart local v0    # "e":Lorg/json/JSONException;
    :catch_37
    move-exception v1

    .line 294
    .local v1, "e1":Ljava/lang/NumberFormatException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to int"

    invoke-direct {v3, v4, v1}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 295
    .end local v1    # "e1":Ljava/lang/NumberFormatException;
    :catch_40
    move-exception v1

    .line 296
    .local v1, "e1":Lorg/json/JSONException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to int"

    invoke-direct {v3, v4, v1}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public callJSONArray(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONArray;
    .registers 9
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 570
    const/4 v2, 0x0

    .line 573
    .local v2, "response":Lorg/json/JSONObject;
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lorg/alexd/jsonrpc/JSONRPCClient;->doRequest(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v2

    .line 574
    if-nez v2, :cond_29

    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Cannot call method: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/Object;)V

    throw v3
    :try_end_1c
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1c} :catch_1c

    .line 578
    :catch_1c
    move-exception v0

    .line 581
    .local v0, "e":Lorg/json/JSONException;
    :try_start_1d
    new-instance v3, Lorg/json/JSONArray;

    const-string v4, "result"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_28
    .catch Ljava/lang/NumberFormatException; {:try_start_1d .. :try_end_28} :catch_30
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_28} :catch_39

    .end local v0    # "e":Lorg/json/JSONException;
    :goto_28
    return-object v3

    .line 576
    :cond_29
    :try_start_29
    const-string v3, "result"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_2e
    .catch Lorg/json/JSONException; {:try_start_29 .. :try_end_2e} :catch_1c

    move-result-object v3

    goto :goto_28

    .line 582
    .restart local v0    # "e":Lorg/json/JSONException;
    :catch_30
    move-exception v1

    .line 583
    .local v1, "e1":Ljava/lang/NumberFormatException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to JSONArray"

    invoke-direct {v3, v4, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 584
    .end local v1    # "e1":Ljava/lang/NumberFormatException;
    :catch_39
    move-exception v1

    .line 585
    .local v1, "e1":Lorg/json/JSONException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to JSONArray"

    invoke-direct {v3, v4, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public varargs callJSONArray(Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONArray;
    .registers 9
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 542
    const/4 v2, 0x0

    .line 545
    .local v2, "response":Lorg/json/JSONObject;
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lorg/alexd/jsonrpc/JSONRPCClient;->doRequest(Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    .line 546
    if-nez v2, :cond_29

    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Cannot call method: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/Object;)V

    throw v3
    :try_end_1c
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1c} :catch_1c

    .line 550
    :catch_1c
    move-exception v0

    .line 553
    .local v0, "e":Lorg/json/JSONException;
    :try_start_1d
    new-instance v3, Lorg/json/JSONArray;

    const-string v4, "result"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_28
    .catch Ljava/lang/NumberFormatException; {:try_start_1d .. :try_end_28} :catch_30
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_28} :catch_39

    .end local v0    # "e":Lorg/json/JSONException;
    :goto_28
    return-object v3

    .line 548
    :cond_29
    :try_start_29
    const-string v3, "result"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_2e
    .catch Lorg/json/JSONException; {:try_start_29 .. :try_end_2e} :catch_1c

    move-result-object v3

    goto :goto_28

    .line 554
    .restart local v0    # "e":Lorg/json/JSONException;
    :catch_30
    move-exception v1

    .line 555
    .local v1, "e1":Ljava/lang/NumberFormatException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to JSONArray"

    invoke-direct {v3, v4, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 556
    .end local v1    # "e1":Ljava/lang/NumberFormatException;
    :catch_39
    move-exception v1

    .line 557
    .local v1, "e1":Lorg/json/JSONException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to JSONArray"

    invoke-direct {v3, v4, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public callJSONObject(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 9
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 484
    const/4 v2, 0x0

    .line 487
    .local v2, "response":Lorg/json/JSONObject;
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lorg/alexd/jsonrpc/JSONRPCClient;->doRequest(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v2

    .line 488
    if-nez v2, :cond_29

    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Cannot call method: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/Object;)V

    throw v3
    :try_end_1c
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1c} :catch_1c

    .line 492
    :catch_1c
    move-exception v0

    .line 495
    .local v0, "e":Lorg/json/JSONException;
    :try_start_1d
    new-instance v3, Lorg/json/JSONObject;

    const-string v4, "result"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_28
    .catch Ljava/lang/NumberFormatException; {:try_start_1d .. :try_end_28} :catch_30
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_28} :catch_39

    .end local v0    # "e":Lorg/json/JSONException;
    :goto_28
    return-object v3

    .line 490
    :cond_29
    :try_start_29
    const-string v3, "result"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_2e
    .catch Lorg/json/JSONException; {:try_start_29 .. :try_end_2e} :catch_1c

    move-result-object v3

    goto :goto_28

    .line 496
    .restart local v0    # "e":Lorg/json/JSONException;
    :catch_30
    move-exception v1

    .line 497
    .local v1, "e1":Ljava/lang/NumberFormatException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to JSONObject"

    invoke-direct {v3, v4, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 498
    .end local v1    # "e1":Ljava/lang/NumberFormatException;
    :catch_39
    move-exception v1

    .line 499
    .local v1, "e1":Lorg/json/JSONException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to JSONObject"

    invoke-direct {v3, v4, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public varargs callJSONObject(Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;
    .registers 9
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 513
    const/4 v2, 0x0

    .line 516
    .local v2, "response":Lorg/json/JSONObject;
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lorg/alexd/jsonrpc/JSONRPCClient;->doRequest(Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    .line 517
    if-nez v2, :cond_29

    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Cannot call method: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/Object;)V

    throw v3
    :try_end_1c
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1c} :catch_1c

    .line 521
    :catch_1c
    move-exception v0

    .line 524
    .local v0, "e":Lorg/json/JSONException;
    :try_start_1d
    new-instance v3, Lorg/json/JSONObject;

    const-string v4, "result"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_28
    .catch Ljava/lang/NumberFormatException; {:try_start_1d .. :try_end_28} :catch_30
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_28} :catch_39

    .end local v0    # "e":Lorg/json/JSONException;
    :goto_28
    return-object v3

    .line 519
    :cond_29
    :try_start_29
    const-string v3, "result"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_2e
    .catch Lorg/json/JSONException; {:try_start_29 .. :try_end_2e} :catch_1c

    move-result-object v3

    goto :goto_28

    .line 525
    .restart local v0    # "e":Lorg/json/JSONException;
    :catch_30
    move-exception v1

    .line 526
    .local v1, "e1":Ljava/lang/NumberFormatException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to JSONObject"

    invoke-direct {v3, v4, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 527
    .end local v1    # "e1":Ljava/lang/NumberFormatException;
    :catch_39
    move-exception v1

    .line 528
    .local v1, "e1":Lorg/json/JSONException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to JSONObject"

    invoke-direct {v3, v4, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public callLong(Ljava/lang/String;Lorg/json/JSONObject;)J
    .registers 9
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 338
    const/4 v2, 0x0

    .line 341
    .local v2, "response":Lorg/json/JSONObject;
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lorg/alexd/jsonrpc/JSONRPCClient;->doRequest(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v2

    .line 342
    if-nez v2, :cond_28

    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Cannot call method: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/Object;)V

    throw v3
    :try_end_1c
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1c} :catch_1c

    .line 345
    :catch_1c
    move-exception v0

    .line 348
    .local v0, "e":Lorg/json/JSONException;
    :try_start_1d
    const-string v3, "result"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_26
    .catch Ljava/lang/NumberFormatException; {:try_start_1d .. :try_end_26} :catch_2f
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_26} :catch_38

    move-result-wide v3

    .end local v0    # "e":Lorg/json/JSONException;
    :goto_27
    return-wide v3

    .line 343
    :cond_28
    :try_start_28
    const-string v3, "result"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J
    :try_end_2d
    .catch Lorg/json/JSONException; {:try_start_28 .. :try_end_2d} :catch_1c

    move-result-wide v3

    goto :goto_27

    .line 349
    .restart local v0    # "e":Lorg/json/JSONException;
    :catch_2f
    move-exception v1

    .line 350
    .local v1, "e1":Ljava/lang/NumberFormatException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to long"

    invoke-direct {v3, v4, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 351
    .end local v1    # "e1":Ljava/lang/NumberFormatException;
    :catch_38
    move-exception v1

    .line 352
    .local v1, "e1":Lorg/json/JSONException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to long"

    invoke-direct {v3, v4, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public varargs callLong(Ljava/lang/String;[Ljava/lang/Object;)J
    .registers 9
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 310
    const/4 v2, 0x0

    .line 313
    .local v2, "response":Lorg/json/JSONObject;
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lorg/alexd/jsonrpc/JSONRPCClient;->doRequest(Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    .line 314
    if-nez v2, :cond_28

    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Cannot call method: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/Object;)V

    throw v3
    :try_end_1c
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1c} :catch_1c

    .line 317
    :catch_1c
    move-exception v0

    .line 320
    .local v0, "e":Lorg/json/JSONException;
    :try_start_1d
    const-string v3, "result"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_26
    .catch Ljava/lang/NumberFormatException; {:try_start_1d .. :try_end_26} :catch_2f
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_26} :catch_38

    move-result-wide v3

    .end local v0    # "e":Lorg/json/JSONException;
    :goto_27
    return-wide v3

    .line 315
    :cond_28
    :try_start_28
    const-string v3, "result"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J
    :try_end_2d
    .catch Lorg/json/JSONException; {:try_start_28 .. :try_end_2d} :catch_1c

    move-result-wide v3

    goto :goto_27

    .line 321
    .restart local v0    # "e":Lorg/json/JSONException;
    :catch_2f
    move-exception v1

    .line 322
    .local v1, "e1":Ljava/lang/NumberFormatException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to long"

    invoke-direct {v3, v4, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 323
    .end local v1    # "e1":Ljava/lang/NumberFormatException;
    :catch_38
    move-exception v1

    .line 324
    .local v1, "e1":Lorg/json/JSONException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v4, "Cannot convert result to long"

    invoke-direct {v3, v4, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public callString(Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 241
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/alexd/jsonrpc/JSONRPCClient;->doRequest(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "result"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_9
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_9} :catch_b
    .catch Lorg/alexd/jsonrpc/JSONRPCException; {:try_start_0 .. :try_end_9} :catch_14
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9} :catch_1d

    move-result-object v1

    return-object v1

    .line 242
    :catch_b
    move-exception v0

    .line 243
    .local v0, "e":Lorg/json/JSONException;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v2, "Cannot convert result to String"

    invoke-direct {v1, v2, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 244
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_14
    move-exception v0

    .line 245
    .local v0, "e":Lorg/alexd/jsonrpc/JSONRPCException;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v2, "Cannot convert result to String"

    invoke-direct {v1, v2, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 246
    .end local v0    # "e":Lorg/alexd/jsonrpc/JSONRPCException;
    :catch_1d
    move-exception v0

    .line 247
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v2, "Cannot convert result to String"

    invoke-direct {v1, v2, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public varargs callString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 223
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/alexd/jsonrpc/JSONRPCClient;->doRequest(Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "result"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_9
    .catch Lorg/alexd/jsonrpc/JSONRPCException; {:try_start_0 .. :try_end_9} :catch_b
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_9} :catch_14

    move-result-object v1

    return-object v1

    .line 224
    :catch_b
    move-exception v0

    .line 226
    .local v0, "e":Lorg/alexd/jsonrpc/JSONRPCException;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v2, "Cannot convert result to String"

    invoke-direct {v1, v2, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 227
    .end local v0    # "e":Lorg/alexd/jsonrpc/JSONRPCException;
    :catch_14
    move-exception v0

    .line 228
    .local v0, "e":Lorg/json/JSONException;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v2, "Cannot convert result to String"

    invoke-direct {v1, v2, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public delEncoding()V
    .registers 2

    .prologue
    .line 52
    const-string v0, ""

    iput-object v0, p0, Lorg/alexd/jsonrpc/JSONRPCClient;->encoding:Ljava/lang/String;

    .line 53
    return-void
.end method

.method protected abstract doJSONRequest(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation
.end method

.method protected doRequest(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 7
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 99
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 101
    .local v1, "jsonRequest":Lorg/json/JSONObject;
    :try_start_5
    const-string v2, "id"

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->hashCode()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 102
    const-string v2, "method"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 103
    const-string v2, "params"

    invoke-virtual {v1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 104
    const-string v2, "jsonrpc"

    const-string v3, "2.0"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_23
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_23} :catch_28

    .line 108
    invoke-virtual {p0, v1}, Lorg/alexd/jsonrpc/JSONRPCClient;->doJSONRequest(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v2

    return-object v2

    .line 105
    :catch_28
    move-exception v0

    .line 106
    .local v0, "e1":Lorg/json/JSONException;
    new-instance v2, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v3, "Invalid JSON request"

    invoke-direct {v2, v3, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected doRequest(Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;
    .registers 9
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 73
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 74
    .local v2, "jsonParams":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    array-length v4, p2

    if-lt v1, v4, :cond_2a

    .line 83
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 86
    .local v3, "jsonRequest":Lorg/json/JSONObject;
    :try_start_e
    const-string v4, "id"

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/UUID;->hashCode()I

    move-result v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 87
    const-string v4, "method"

    invoke-virtual {v3, v4, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 88
    const-string v4, "params"

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_25
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_25} :catch_49

    .line 94
    invoke-virtual {p0, v3}, Lorg/alexd/jsonrpc/JSONRPCClient;->doJSONRequest(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v4

    return-object v4

    .line 76
    .end local v3    # "jsonRequest":Lorg/json/JSONObject;
    :cond_2a
    aget-object v4, p2, v1

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->isArray()Z

    move-result v4

    if-eqz v4, :cond_41

    .line 77
    aget-object v4, p2, v1

    check-cast v4, [Ljava/lang/Object;

    invoke-static {v4}, Lorg/alexd/jsonrpc/JSONRPCClient;->getJSONArray([Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 79
    :cond_41
    aget-object v4, p2, v1

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 74
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 90
    .restart local v3    # "jsonRequest":Lorg/json/JSONObject;
    :catch_49
    move-exception v0

    .line 92
    .local v0, "e1":Lorg/json/JSONException;
    new-instance v4, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v5, "Invalid JSON request"

    invoke-direct {v4, v5, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method public getConnectionTimeout()I
    .registers 2

    .prologue
    .line 167
    iget v0, p0, Lorg/alexd/jsonrpc/JSONRPCClient;->connectionTimeout:I

    return v0
.end method

.method public getSoTimeout()I
    .registers 2

    .prologue
    .line 150
    iget v0, p0, Lorg/alexd/jsonrpc/JSONRPCClient;->soTimeout:I

    return v0
.end method

.method public isDebug()Z
    .registers 2

    .prologue
    .line 44
    iget-boolean v0, p0, Lorg/alexd/jsonrpc/JSONRPCClient;->_debug:Z

    return v0
.end method

.method public setConnectionTimeout(I)V
    .registers 2
    .param p1, "connectionTimeout"    # I

    .prologue
    .line 176
    iput p1, p0, Lorg/alexd/jsonrpc/JSONRPCClient;->connectionTimeout:I

    .line 177
    return-void
.end method

.method public setDebug(Z)V
    .registers 2
    .param p1, "_debug"    # Z

    .prologue
    .line 37
    iput-boolean p1, p0, Lorg/alexd/jsonrpc/JSONRPCClient;->_debug:Z

    .line 38
    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .registers 2
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 48
    iput-object p1, p0, Lorg/alexd/jsonrpc/JSONRPCClient;->encoding:Ljava/lang/String;

    .line 49
    return-void
.end method

.method public setSoTimeout(I)V
    .registers 2
    .param p1, "soTimeout"    # I

    .prologue
    .line 159
    iput p1, p0, Lorg/alexd/jsonrpc/JSONRPCClient;->soTimeout:I

    .line 160
    return-void
.end method
