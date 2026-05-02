.class public Lcom/adobe/xmp/XMPUtils;
.super Ljava/lang/Object;
.source "XMPUtils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method public static appendProperties(Lcom/adobe/xmp/XMPMeta;Lcom/adobe/xmp/XMPMeta;ZZ)V
    .registers 5
    .param p0, "source"    # Lcom/adobe/xmp/XMPMeta;
    .param p1, "dest"    # Lcom/adobe/xmp/XMPMeta;
    .param p2, "doAllProperties"    # Z
    .param p3, "replaceOldValues"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 157
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lcom/adobe/xmp/XMPUtils;->appendProperties(Lcom/adobe/xmp/XMPMeta;Lcom/adobe/xmp/XMPMeta;ZZZ)V

    .line 158
    return-void
.end method

.method public static appendProperties(Lcom/adobe/xmp/XMPMeta;Lcom/adobe/xmp/XMPMeta;ZZZ)V
    .registers 5
    .param p0, "source"    # Lcom/adobe/xmp/XMPMeta;
    .param p1, "dest"    # Lcom/adobe/xmp/XMPMeta;
    .param p2, "doAllProperties"    # Z
    .param p3, "replaceOldValues"    # Z
    .param p4, "deleteEmptyValues"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 241
    invoke-static {p0, p1, p2, p3, p4}, Lcom/adobe/xmp/impl/XMPUtilsImpl;->appendProperties(Lcom/adobe/xmp/XMPMeta;Lcom/adobe/xmp/XMPMeta;ZZZ)V

    .line 243
    return-void
.end method

.method public static catenateArrayItems(Lcom/adobe/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 7
    .param p0, "xmp"    # Lcom/adobe/xmp/XMPMeta;
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "arrayName"    # Ljava/lang/String;
    .param p3, "separator"    # Ljava/lang/String;
    .param p4, "quotes"    # Ljava/lang/String;
    .param p5, "allowCommas"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 60
    invoke-static/range {p0 .. p5}, Lcom/adobe/xmp/impl/XMPUtilsImpl;->catenateArrayItems(Lcom/adobe/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static convertFromBoolean(Z)Ljava/lang/String;
    .registers 2
    .param p0, "value"    # Z

    .prologue
    .line 297
    if-eqz p0, :cond_5

    const-string v0, "True"

    :goto_4
    return-object v0

    :cond_5
    const-string v0, "False"

    goto :goto_4
.end method

.method public static convertFromDate(Lcom/adobe/xmp/XMPDateTime;)Ljava/lang/String;
    .registers 2
    .param p0, "value"    # Lcom/adobe/xmp/XMPDateTime;

    .prologue
    .line 470
    invoke-static {p0}, Lcom/adobe/xmp/impl/ISO8601Converter;->render(Lcom/adobe/xmp/XMPDateTime;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static convertFromDouble(D)Ljava/lang/String;
    .registers 3
    .param p0, "value"    # D

    .prologue
    .line 434
    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static convertFromInteger(I)Ljava/lang/String;
    .registers 2
    .param p0, "value"    # I

    .prologue
    .line 344
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static convertFromLong(J)Ljava/lang/String;
    .registers 3
    .param p0, "value"    # J

    .prologue
    .line 391
    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static convertToBoolean(Ljava/lang/String;)Z
    .registers 5
    .param p0, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 264
    if-eqz p0, :cond_a

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_13

    .line 266
    :cond_a
    new-instance v1, Lcom/adobe/xmp/XMPException;

    const-string v2, "Empty convert-string"

    const/4 v3, 0x5

    invoke-direct {v1, v2, v3}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 268
    :cond_13
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 273
    :try_start_17
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1a
    .catch Ljava/lang/NumberFormatException; {:try_start_17 .. :try_end_1a} :catch_20

    move-result v3

    if-eqz v3, :cond_1e

    .line 277
    :goto_1d
    return v1

    :cond_1e
    move v1, v2

    .line 273
    goto :goto_1d

    .line 275
    :catch_20
    move-exception v0

    .line 277
    .local v0, "e":Ljava/lang/NumberFormatException;
    const-string v3, "true"

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_41

    const-string v3, "t"

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_41

    const-string v3, "on"

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_41

    const-string v3, "yes"

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_42

    :cond_41
    move v2, v1

    :cond_42
    move v1, v2

    goto :goto_1d
.end method

.method public static convertToDate(Ljava/lang/String;)Lcom/adobe/xmp/XMPDateTime;
    .registers 4
    .param p0, "rawValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 450
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_11

    .line 452
    :cond_8
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Empty convert-string"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 456
    :cond_11
    invoke-static {p0}, Lcom/adobe/xmp/impl/ISO8601Converter;->parse(Ljava/lang/String;)Lcom/adobe/xmp/XMPDateTime;

    move-result-object v0

    return-object v0
.end method

.method public static convertToDouble(Ljava/lang/String;)D
    .registers 6
    .param p0, "rawValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x5

    .line 409
    if-eqz p0, :cond_9

    :try_start_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1b

    .line 411
    :cond_9
    new-instance v1, Lcom/adobe/xmp/XMPException;

    const-string v2, "Empty convert-string"

    const/4 v3, 0x5

    invoke-direct {v1, v2, v3}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1
    :try_end_12
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_12} :catch_12

    .line 418
    :catch_12
    move-exception v0

    .line 420
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v1, Lcom/adobe/xmp/XMPException;

    const-string v2, "Invalid double string"

    invoke-direct {v1, v2, v4}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 415
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_1b
    :try_start_1b
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D
    :try_end_1e
    .catch Ljava/lang/NumberFormatException; {:try_start_1b .. :try_end_1e} :catch_12

    move-result-wide v1

    return-wide v1
.end method

.method public static convertToInteger(Ljava/lang/String;)I
    .registers 6
    .param p0, "rawValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x5

    .line 315
    if-eqz p0, :cond_9

    :try_start_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1b

    .line 317
    :cond_9
    new-instance v1, Lcom/adobe/xmp/XMPException;

    const-string v2, "Empty convert-string"

    const/4 v3, 0x5

    invoke-direct {v1, v2, v3}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1
    :try_end_12
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_12} :catch_12

    .line 328
    :catch_12
    move-exception v0

    .line 330
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v1, Lcom/adobe/xmp/XMPException;

    const-string v2, "Invalid integer string"

    invoke-direct {v1, v2, v4}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 319
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_1b
    :try_start_1b
    const-string v1, "0x"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2f

    .line 321
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v1

    .line 325
    :goto_2e
    return v1

    :cond_2f
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_32
    .catch Ljava/lang/NumberFormatException; {:try_start_1b .. :try_end_32} :catch_12

    move-result v1

    goto :goto_2e
.end method

.method public static convertToLong(Ljava/lang/String;)J
    .registers 6
    .param p0, "rawValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x5

    .line 362
    if-eqz p0, :cond_9

    :try_start_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1b

    .line 364
    :cond_9
    new-instance v1, Lcom/adobe/xmp/XMPException;

    const-string v2, "Empty convert-string"

    const/4 v3, 0x5

    invoke-direct {v1, v2, v3}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1
    :try_end_12
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_12} :catch_12

    .line 375
    :catch_12
    move-exception v0

    .line 377
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v1, Lcom/adobe/xmp/XMPException;

    const-string v2, "Invalid long string"

    invoke-direct {v1, v2, v4}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 366
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_1b
    :try_start_1b
    const-string v1, "0x"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2f

    .line 368
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v1

    .line 372
    :goto_2e
    return-wide v1

    :cond_2f
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_32
    .catch Ljava/lang/NumberFormatException; {:try_start_1b .. :try_end_32} :catch_12

    move-result-wide v1

    goto :goto_2e
.end method

.method public static decodeBase64(Ljava/lang/String;)[B
    .registers 5
    .param p0, "base64String"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 499
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/xmp/impl/Base64;->decode([B)[B
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    return-object v1

    .line 501
    :catch_9
    move-exception v0

    .line 503
    .local v0, "e":Ljava/lang/Throwable;
    new-instance v1, Lcom/adobe/xmp/XMPException;

    const-string v2, "Invalid base64 string"

    const/4 v3, 0x5

    invoke-direct {v1, v2, v3, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;ILjava/lang/Throwable;)V

    throw v1
.end method

.method public static encodeBase64([B)Ljava/lang/String;
    .registers 3
    .param p0, "buffer"    # [B

    .prologue
    .line 483
    new-instance v0, Ljava/lang/String;

    invoke-static {p0}, Lcom/adobe/xmp/impl/Base64;->encode([B)[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    return-object v0
.end method

.method public static removeProperties(Lcom/adobe/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .registers 5
    .param p0, "xmp"    # Lcom/adobe/xmp/XMPMeta;
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "doAllProperties"    # Z
    .param p4, "includeAliases"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 141
    invoke-static {p0, p1, p2, p3, p4}, Lcom/adobe/xmp/impl/XMPUtilsImpl;->removeProperties(Lcom/adobe/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 142
    return-void
.end method

.method public static separateArrayItems(Lcom/adobe/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;Z)V
    .registers 6
    .param p0, "xmp"    # Lcom/adobe/xmp/XMPMeta;
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "arrayName"    # Ljava/lang/String;
    .param p3, "catedStr"    # Ljava/lang/String;
    .param p4, "arrayOptions"    # Lcom/adobe/xmp/options/PropertyOptions;
    .param p5, "preserveCommas"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 87
    invoke-static/range {p0 .. p5}, Lcom/adobe/xmp/impl/XMPUtilsImpl;->separateArrayItems(Lcom/adobe/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;Z)V

    .line 89
    return-void
.end method
