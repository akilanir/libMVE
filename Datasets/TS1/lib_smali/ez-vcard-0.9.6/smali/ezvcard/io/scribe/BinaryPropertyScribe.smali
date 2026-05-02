.class public abstract Lezvcard/io/scribe/BinaryPropertyScribe;
.super Lezvcard/io/scribe/VCardPropertyScribe;
.source "BinaryPropertyScribe.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lezvcard/io/scribe/BinaryPropertyScribe$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lezvcard/property/BinaryProperty",
        "<TU;>;U:",
        "Lezvcard/parameter/MediaTypeParameter;",
        ">",
        "Lezvcard/io/scribe/VCardPropertyScribe",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .registers 3
    .param p2, "propertyName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0, p1, p2}, Lezvcard/io/scribe/VCardPropertyScribe;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method private parse(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Lezvcard/VCardVersion;Ljava/util/List;)Lezvcard/property/BinaryProperty;
    .registers 11
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "dataType"    # Lezvcard/VCardDataType;
    .param p3, "parameters"    # Lezvcard/parameter/VCardParameters;
    .param p4, "version"    # Lezvcard/VCardVersion;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lezvcard/VCardDataType;",
            "Lezvcard/parameter/VCardParameters;",
            "Lezvcard/VCardVersion;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 267
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    .local p5, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p0, p3, p4}, Lezvcard/io/scribe/BinaryPropertyScribe;->parseContentType(Lezvcard/parameter/VCardParameters;Lezvcard/VCardVersion;)Lezvcard/parameter/MediaTypeParameter;

    move-result-object v0

    .line 269
    .local v0, "contentType":Lezvcard/parameter/MediaTypeParameter;, "TU;"
    sget-object v3, Lezvcard/io/scribe/BinaryPropertyScribe$1;->$SwitchMap$ezvcard$VCardVersion:[I

    invoke-virtual {p4}, Lezvcard/VCardVersion;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_4e

    .line 296
    :cond_f
    :goto_f
    invoke-virtual {p0, p1, p4, p5, v0}, Lezvcard/io/scribe/BinaryPropertyScribe;->cannotUnmarshalValue(Ljava/lang/String;Lezvcard/VCardVersion;Ljava/util/List;Lezvcard/parameter/MediaTypeParameter;)Lezvcard/property/BinaryProperty;

    move-result-object v3

    :goto_13
    return-object v3

    .line 273
    :pswitch_14
    sget-object v3, Lezvcard/VCardDataType;->URL:Lezvcard/VCardDataType;

    if-eq p2, v3, :cond_1c

    sget-object v3, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    if-ne p2, v3, :cond_21

    .line 274
    :cond_1c
    invoke-virtual {p0, p1, v0}, Lezvcard/io/scribe/BinaryPropertyScribe;->_newInstance(Ljava/lang/String;Lezvcard/parameter/MediaTypeParameter;)Lezvcard/property/BinaryProperty;

    move-result-object v3

    goto :goto_13

    .line 278
    :cond_21
    invoke-virtual {p3}, Lezvcard/parameter/VCardParameters;->getEncoding()Lezvcard/parameter/Encoding;

    move-result-object v1

    .line 279
    .local v1, "encodingSubType":Lezvcard/parameter/Encoding;
    sget-object v3, Lezvcard/parameter/Encoding;->BASE64:Lezvcard/parameter/Encoding;

    if-eq v1, v3, :cond_2d

    sget-object v3, Lezvcard/parameter/Encoding;->B:Lezvcard/parameter/Encoding;

    if-ne v1, v3, :cond_f

    .line 280
    :cond_2d
    invoke-static {p1}, Lezvcard/util/org/apache/commons/codec/binary/Base64;->decodeBase64(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {p0, v3, v0}, Lezvcard/io/scribe/BinaryPropertyScribe;->_newInstance([BLezvcard/parameter/MediaTypeParameter;)Lezvcard/property/BinaryProperty;

    move-result-object v3

    goto :goto_13

    .line 287
    .end local v1    # "encodingSubType":Lezvcard/parameter/Encoding;
    :pswitch_36
    :try_start_36
    new-instance v2, Lezvcard/util/DataUri;

    invoke-direct {v2, p1}, Lezvcard/util/DataUri;-><init>(Ljava/lang/String;)V

    .line 288
    .local v2, "uri":Lezvcard/util/DataUri;
    invoke-virtual {v2}, Lezvcard/util/DataUri;->getContentType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lezvcard/io/scribe/BinaryPropertyScribe;->_buildMediaTypeObj(Ljava/lang/String;)Lezvcard/parameter/MediaTypeParameter;

    move-result-object v0

    .line 289
    invoke-virtual {v2}, Lezvcard/util/DataUri;->getData()[B

    move-result-object v3

    invoke-virtual {p0, v3, v0}, Lezvcard/io/scribe/BinaryPropertyScribe;->_newInstance([BLezvcard/parameter/MediaTypeParameter;)Lezvcard/property/BinaryProperty;
    :try_end_4a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_36 .. :try_end_4a} :catch_4c

    move-result-object v3

    goto :goto_13

    .line 290
    .end local v2    # "uri":Lezvcard/util/DataUri;
    :catch_4c
    move-exception v3

    goto :goto_f

    .line 269
    :pswitch_data_4e
    .packed-switch 0x1
        :pswitch_14
        :pswitch_14
        :pswitch_36
    .end packed-switch
.end method

.method private write(Lezvcard/property/BinaryProperty;Lezvcard/VCardVersion;)Ljava/lang/String;
    .registers 9
    .param p2, "version"    # Lezvcard/VCardVersion;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lezvcard/VCardVersion;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 300
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    .local p1, "property":Lezvcard/property/BinaryProperty;, "TT;"
    invoke-virtual {p1}, Lezvcard/property/BinaryProperty;->getUrl()Ljava/lang/String;

    move-result-object v3

    .line 301
    .local v3, "url":Ljava/lang/String;
    if-eqz v3, :cond_7

    .line 318
    .end local v3    # "url":Ljava/lang/String;
    :goto_6
    return-object v3

    .line 305
    .restart local v3    # "url":Ljava/lang/String;
    :cond_7
    invoke-virtual {p1}, Lezvcard/property/BinaryProperty;->getData()[B

    move-result-object v1

    .line 306
    .local v1, "data":[B
    if-eqz v1, :cond_18

    .line 307
    sget-object v4, Lezvcard/io/scribe/BinaryPropertyScribe$1;->$SwitchMap$ezvcard$VCardVersion:[I

    invoke-virtual {p2}, Lezvcard/VCardVersion;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_42

    .line 318
    :cond_18
    const-string v3, ""

    goto :goto_6

    .line 310
    :pswitch_1b
    new-instance v3, Ljava/lang/String;

    .end local v3    # "url":Ljava/lang/String;
    invoke-static {v1}, Lezvcard/util/org/apache/commons/codec/binary/Base64;->encodeBase64([B)[B

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>([B)V

    goto :goto_6

    .line 312
    .restart local v3    # "url":Ljava/lang/String;
    :pswitch_25
    invoke-virtual {p1}, Lezvcard/property/BinaryProperty;->getContentType()Lezvcard/parameter/MediaTypeParameter;

    move-result-object v0

    .line 313
    .local v0, "contentType":Lezvcard/parameter/MediaTypeParameter;, "TU;"
    if-eqz v0, :cond_31

    invoke-virtual {v0}, Lezvcard/parameter/MediaTypeParameter;->getMediaType()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_3d

    :cond_31
    const-string v2, "application/octet-stream"

    .line 314
    .local v2, "mediaType":Ljava/lang/String;
    :goto_33
    new-instance v4, Lezvcard/util/DataUri;

    invoke-direct {v4, v2, v1}, Lezvcard/util/DataUri;-><init>(Ljava/lang/String;[B)V

    invoke-virtual {v4}, Lezvcard/util/DataUri;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_6

    .line 313
    .end local v2    # "mediaType":Ljava/lang/String;
    :cond_3d
    invoke-virtual {v0}, Lezvcard/parameter/MediaTypeParameter;->getMediaType()Ljava/lang/String;

    move-result-object v2

    goto :goto_33

    .line 307
    :pswitch_data_42
    .packed-switch 0x1
        :pswitch_1b
        :pswitch_1b
        :pswitch_25
    .end packed-switch
.end method


# virtual methods
.method protected abstract _buildMediaTypeObj(Ljava/lang/String;)Lezvcard/parameter/MediaTypeParameter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TU;"
        }
    .end annotation
.end method

.method protected abstract _buildTypeObj(Ljava/lang/String;)Lezvcard/parameter/MediaTypeParameter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TU;"
        }
    .end annotation
.end method

.method protected _dataType(Lezvcard/property/BinaryProperty;Lezvcard/VCardVersion;)Lezvcard/VCardDataType;
    .registers 5
    .param p2, "version"    # Lezvcard/VCardVersion;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lezvcard/VCardVersion;",
            ")",
            "Lezvcard/VCardDataType;"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    .local p1, "property":Lezvcard/property/BinaryProperty;, "TT;"
    invoke-virtual {p1}, Lezvcard/property/BinaryProperty;->getUrl()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 70
    sget-object v0, Lezvcard/io/scribe/BinaryPropertyScribe$1;->$SwitchMap$ezvcard$VCardVersion:[I

    invoke-virtual {p2}, Lezvcard/VCardVersion;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_32

    .line 79
    :cond_11
    invoke-virtual {p1}, Lezvcard/property/BinaryProperty;->getData()[B

    move-result-object v0

    if-eqz v0, :cond_22

    .line 80
    sget-object v0, Lezvcard/io/scribe/BinaryPropertyScribe$1;->$SwitchMap$ezvcard$VCardVersion:[I

    invoke-virtual {p2}, Lezvcard/VCardVersion;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_3c

    .line 89
    :cond_22
    invoke-virtual {p0, p2}, Lezvcard/io/scribe/BinaryPropertyScribe;->_defaultDataType(Lezvcard/VCardVersion;)Lezvcard/VCardDataType;

    move-result-object v0

    :goto_26
    return-object v0

    .line 72
    :pswitch_27
    sget-object v0, Lezvcard/VCardDataType;->URL:Lezvcard/VCardDataType;

    goto :goto_26

    .line 75
    :pswitch_2a
    sget-object v0, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    goto :goto_26

    .line 83
    :pswitch_2d
    const/4 v0, 0x0

    goto :goto_26

    .line 85
    :pswitch_2f
    sget-object v0, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    goto :goto_26

    .line 70
    :pswitch_data_32
    .packed-switch 0x1
        :pswitch_27
        :pswitch_2a
        :pswitch_2a
    .end packed-switch

    .line 80
    :pswitch_data_3c
    .packed-switch 0x1
        :pswitch_2d
        :pswitch_2d
        :pswitch_2f
    .end packed-switch
.end method

.method protected bridge synthetic _dataType(Lezvcard/property/VCardProperty;Lezvcard/VCardVersion;)Lezvcard/VCardDataType;
    .registers 4
    .param p1, "x0"    # Lezvcard/property/VCardProperty;
    .param p2, "x1"    # Lezvcard/VCardVersion;

    .prologue
    .line 50
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    check-cast p1, Lezvcard/property/BinaryProperty;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/BinaryPropertyScribe;->_dataType(Lezvcard/property/BinaryProperty;Lezvcard/VCardVersion;)Lezvcard/VCardDataType;

    move-result-object v0

    return-object v0
.end method

.method protected _defaultDataType(Lezvcard/VCardVersion;)Lezvcard/VCardDataType;
    .registers 5
    .param p1, "version"    # Lezvcard/VCardVersion;

    .prologue
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    const/4 v0, 0x0

    .line 57
    sget-object v1, Lezvcard/io/scribe/BinaryPropertyScribe$1;->$SwitchMap$ezvcard$VCardVersion:[I

    invoke-virtual {p1}, Lezvcard/VCardVersion;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_10

    .line 64
    :goto_c
    :pswitch_c
    return-object v0

    .line 62
    :pswitch_d
    sget-object v0, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    goto :goto_c

    .line 57
    :pswitch_data_10
    .packed-switch 0x1
        :pswitch_c
        :pswitch_c
        :pswitch_d
    .end packed-switch
.end method

.method protected abstract _newInstance(Ljava/lang/String;Lezvcard/parameter/MediaTypeParameter;)Lezvcard/property/BinaryProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TU;)TT;"
        }
    .end annotation
.end method

.method protected abstract _newInstance([BLezvcard/parameter/MediaTypeParameter;)Lezvcard/property/BinaryProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BTU;)TT;"
        }
    .end annotation
.end method

.method protected _parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/BinaryProperty;
    .registers 13
    .param p1, "element"    # Lezvcard/io/html/HCardElement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/io/html/HCardElement;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    .local p2, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 165
    invoke-virtual {p1}, Lezvcard/io/html/HCardElement;->tagName()Ljava/lang/String;

    move-result-object v2

    .line 166
    .local v2, "elementName":Ljava/lang/String;
    const-string v6, "object"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_18

    .line 167
    new-instance v6, Lezvcard/io/CannotParseException;

    new-array v7, v9, [Ljava/lang/Object;

    aput-object v2, v7, v8

    invoke-direct {v6, v9, v7}, Lezvcard/io/CannotParseException;-><init>(I[Ljava/lang/Object;)V

    throw v6

    .line 170
    :cond_18
    const-string v6, "data"

    invoke-virtual {p1, v6}, Lezvcard/io/html/HCardElement;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 171
    .local v0, "data":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_2d

    .line 172
    new-instance v6, Lezvcard/io/CannotParseException;

    const/4 v7, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    invoke-direct {v6, v7, v8}, Lezvcard/io/CannotParseException;-><init>(I[Ljava/lang/Object;)V

    throw v6

    .line 176
    :cond_2d
    :try_start_2d
    new-instance v5, Lezvcard/util/DataUri;

    invoke-direct {v5, v0}, Lezvcard/util/DataUri;-><init>(Ljava/lang/String;)V

    .line 177
    .local v5, "uri":Lezvcard/util/DataUri;
    invoke-virtual {v5}, Lezvcard/util/DataUri;->getContentType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lezvcard/io/scribe/BinaryPropertyScribe;->_buildMediaTypeObj(Ljava/lang/String;)Lezvcard/parameter/MediaTypeParameter;

    move-result-object v3

    .line 179
    .local v3, "mediaType":Lezvcard/parameter/MediaTypeParameter;, "TU;"
    invoke-virtual {v5}, Lezvcard/util/DataUri;->getData()[B

    move-result-object v6

    invoke-virtual {p0, v6, v3}, Lezvcard/io/scribe/BinaryPropertyScribe;->_newInstance([BLezvcard/parameter/MediaTypeParameter;)Lezvcard/property/BinaryProperty;
    :try_end_41
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2d .. :try_end_41} :catch_43

    move-result-object v6

    .line 188
    .end local v5    # "uri":Lezvcard/util/DataUri;
    :goto_42
    return-object v6

    .line 180
    .end local v3    # "mediaType":Lezvcard/parameter/MediaTypeParameter;, "TU;"
    :catch_43
    move-exception v1

    .line 182
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    const/4 v3, 0x0

    .line 183
    .restart local v3    # "mediaType":Lezvcard/parameter/MediaTypeParameter;, "TU;"
    const-string v6, "type"

    invoke-virtual {p1, v6}, Lezvcard/io/html/HCardElement;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 184
    .local v4, "type":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_55

    .line 185
    invoke-virtual {p0, v4}, Lezvcard/io/scribe/BinaryPropertyScribe;->_buildMediaTypeObj(Ljava/lang/String;)Lezvcard/parameter/MediaTypeParameter;

    move-result-object v3

    .line 188
    :cond_55
    invoke-virtual {p0, v0, v3}, Lezvcard/io/scribe/BinaryPropertyScribe;->_newInstance(Ljava/lang/String;Lezvcard/parameter/MediaTypeParameter;)Lezvcard/property/BinaryProperty;

    move-result-object v6

    goto :goto_42
.end method

.method protected bridge synthetic _parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 4
    .param p1, "x0"    # Lezvcard/io/html/HCardElement;
    .param p2, "x1"    # Ljava/util/List;

    .prologue
    .line 50
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/BinaryPropertyScribe;->_parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/BinaryProperty;

    move-result-object v0

    return-object v0
.end method

.method protected _parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/BinaryProperty;
    .registers 11
    .param p1, "value"    # Lezvcard/io/json/JCardValue;
    .param p2, "dataType"    # Lezvcard/VCardDataType;
    .param p3, "parameters"    # Lezvcard/parameter/VCardParameters;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/io/json/JCardValue;",
            "Lezvcard/VCardDataType;",
            "Lezvcard/parameter/VCardParameters;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 199
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    .local p4, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p1}, Lezvcard/io/json/JCardValue;->asSingle()Ljava/lang/String;

    move-result-object v1

    .line 200
    .local v1, "valueStr":Ljava/lang/String;
    sget-object v4, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    move-object v0, p0

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lezvcard/io/scribe/BinaryPropertyScribe;->parse(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Lezvcard/VCardVersion;Ljava/util/List;)Lezvcard/property/BinaryProperty;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic _parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 6
    .param p1, "x0"    # Lezvcard/io/json/JCardValue;
    .param p2, "x1"    # Lezvcard/VCardDataType;
    .param p3, "x2"    # Lezvcard/parameter/VCardParameters;
    .param p4, "x3"    # Ljava/util/List;

    .prologue
    .line 50
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    invoke-virtual {p0, p1, p2, p3, p4}, Lezvcard/io/scribe/BinaryPropertyScribe;->_parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/BinaryProperty;

    move-result-object v0

    return-object v0
.end method

.method protected _parseText(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/BinaryProperty;
    .registers 12
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "dataType"    # Lezvcard/VCardDataType;
    .param p3, "version"    # Lezvcard/VCardVersion;
    .param p4, "parameters"    # Lezvcard/parameter/VCardParameters;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lezvcard/VCardDataType;",
            "Lezvcard/VCardVersion;",
            "Lezvcard/parameter/VCardParameters;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 144
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    .local p5, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p1}, Lezvcard/io/scribe/BinaryPropertyScribe;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p4

    move-object v4, p3

    move-object v5, p5

    .line 145
    invoke-direct/range {v0 .. v5}, Lezvcard/io/scribe/BinaryPropertyScribe;->parse(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Lezvcard/VCardVersion;Ljava/util/List;)Lezvcard/property/BinaryProperty;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic _parseText(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 7
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lezvcard/VCardDataType;
    .param p3, "x2"    # Lezvcard/VCardVersion;
    .param p4, "x3"    # Lezvcard/parameter/VCardParameters;
    .param p5, "x4"    # Ljava/util/List;

    .prologue
    .line 50
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    invoke-virtual/range {p0 .. p5}, Lezvcard/io/scribe/BinaryPropertyScribe;->_parseText(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/BinaryProperty;

    move-result-object v0

    return-object v0
.end method

.method protected _parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/BinaryProperty;
    .registers 10
    .param p1, "element"    # Lezvcard/io/xml/XCardElement;
    .param p2, "parameters"    # Lezvcard/parameter/VCardParameters;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/io/xml/XCardElement;",
            "Lezvcard/parameter/VCardParameters;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    .local p3, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 155
    new-array v0, v4, [Lezvcard/VCardDataType;

    sget-object v2, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    aput-object v2, v0, v3

    invoke-virtual {p1, v0}, Lezvcard/io/xml/XCardElement;->first([Lezvcard/VCardDataType;)Ljava/lang/String;

    move-result-object v1

    .line 156
    .local v1, "value":Ljava/lang/String;
    if-eqz v1, :cond_1c

    .line 157
    sget-object v2, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    invoke-virtual {p1}, Lezvcard/io/xml/XCardElement;->version()Lezvcard/VCardVersion;

    move-result-object v4

    move-object v0, p0

    move-object v3, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lezvcard/io/scribe/BinaryPropertyScribe;->parse(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Lezvcard/VCardVersion;Ljava/util/List;)Lezvcard/property/BinaryProperty;

    move-result-object v0

    return-object v0

    .line 160
    :cond_1c
    new-array v0, v4, [Lezvcard/VCardDataType;

    sget-object v2, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    aput-object v2, v0, v3

    invoke-static {v0}, Lezvcard/io/scribe/BinaryPropertyScribe;->missingXmlElements([Lezvcard/VCardDataType;)Lezvcard/io/CannotParseException;

    move-result-object v0

    throw v0
.end method

.method protected bridge synthetic _parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 5
    .param p1, "x0"    # Lezvcard/io/xml/XCardElement;
    .param p2, "x1"    # Lezvcard/parameter/VCardParameters;
    .param p3, "x2"    # Ljava/util/List;

    .prologue
    .line 50
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    invoke-virtual {p0, p1, p2, p3}, Lezvcard/io/scribe/BinaryPropertyScribe;->_parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/BinaryProperty;

    move-result-object v0

    return-object v0
.end method

.method protected _prepareParameters(Lezvcard/property/BinaryProperty;Lezvcard/parameter/VCardParameters;Lezvcard/VCardVersion;Lezvcard/VCard;)V
    .registers 9
    .param p2, "copy"    # Lezvcard/parameter/VCardParameters;
    .param p3, "version"    # Lezvcard/VCardVersion;
    .param p4, "vcard"    # Lezvcard/VCard;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lezvcard/parameter/VCardParameters;",
            "Lezvcard/VCardVersion;",
            "Lezvcard/VCard;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    .local p1, "property":Lezvcard/property/BinaryProperty;, "TT;"
    const/4 v3, 0x0

    .line 94
    invoke-virtual {p1}, Lezvcard/property/BinaryProperty;->getContentType()Lezvcard/parameter/MediaTypeParameter;

    move-result-object v0

    .line 95
    .local v0, "contentType":Lezvcard/parameter/MediaTypeParameter;
    if-nez v0, :cond_c

    .line 96
    new-instance v0, Lezvcard/parameter/MediaTypeParameter;

    .end local v0    # "contentType":Lezvcard/parameter/MediaTypeParameter;
    invoke-direct {v0, v3, v3, v3}, Lezvcard/parameter/MediaTypeParameter;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .restart local v0    # "contentType":Lezvcard/parameter/MediaTypeParameter;
    :cond_c
    invoke-virtual {p1}, Lezvcard/property/BinaryProperty;->getUrl()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_20

    .line 100
    invoke-virtual {p2, v3}, Lezvcard/parameter/VCardParameters;->setEncoding(Lezvcard/parameter/Encoding;)V

    .line 102
    sget-object v1, Lezvcard/io/scribe/BinaryPropertyScribe$1;->$SwitchMap$ezvcard$VCardVersion:[I

    invoke-virtual {p3}, Lezvcard/VCardVersion;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_72

    .line 117
    :cond_20
    invoke-virtual {p1}, Lezvcard/property/BinaryProperty;->getData()[B

    move-result-object v1

    if-eqz v1, :cond_34

    .line 118
    invoke-virtual {p2, v3}, Lezvcard/parameter/VCardParameters;->setMediaType(Ljava/lang/String;)V

    .line 120
    sget-object v1, Lezvcard/io/scribe/BinaryPropertyScribe$1;->$SwitchMap$ezvcard$VCardVersion:[I

    invoke-virtual {p3}, Lezvcard/VCardVersion;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_7c

    .line 135
    :cond_34
    :goto_34
    return-void

    .line 104
    :pswitch_35
    invoke-virtual {v0}, Lezvcard/parameter/MediaTypeParameter;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Lezvcard/parameter/VCardParameters;->setType(Ljava/lang/String;)V

    .line 105
    invoke-virtual {p2, v3}, Lezvcard/parameter/VCardParameters;->setMediaType(Ljava/lang/String;)V

    goto :goto_34

    .line 108
    :pswitch_40
    invoke-virtual {v0}, Lezvcard/parameter/MediaTypeParameter;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Lezvcard/parameter/VCardParameters;->setType(Ljava/lang/String;)V

    .line 109
    invoke-virtual {p2, v3}, Lezvcard/parameter/VCardParameters;->setMediaType(Ljava/lang/String;)V

    goto :goto_34

    .line 112
    :pswitch_4b
    invoke-virtual {v0}, Lezvcard/parameter/MediaTypeParameter;->getMediaType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Lezvcard/parameter/VCardParameters;->setMediaType(Ljava/lang/String;)V

    goto :goto_34

    .line 122
    :pswitch_53
    sget-object v1, Lezvcard/parameter/Encoding;->BASE64:Lezvcard/parameter/Encoding;

    invoke-virtual {p2, v1}, Lezvcard/parameter/VCardParameters;->setEncoding(Lezvcard/parameter/Encoding;)V

    .line 123
    invoke-virtual {v0}, Lezvcard/parameter/MediaTypeParameter;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Lezvcard/parameter/VCardParameters;->setType(Ljava/lang/String;)V

    goto :goto_34

    .line 126
    :pswitch_60
    sget-object v1, Lezvcard/parameter/Encoding;->B:Lezvcard/parameter/Encoding;

    invoke-virtual {p2, v1}, Lezvcard/parameter/VCardParameters;->setEncoding(Lezvcard/parameter/Encoding;)V

    .line 127
    invoke-virtual {v0}, Lezvcard/parameter/MediaTypeParameter;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Lezvcard/parameter/VCardParameters;->setType(Ljava/lang/String;)V

    goto :goto_34

    .line 130
    :pswitch_6d
    invoke-virtual {p2, v3}, Lezvcard/parameter/VCardParameters;->setEncoding(Lezvcard/parameter/Encoding;)V

    goto :goto_34

    .line 102
    nop

    :pswitch_data_72
    .packed-switch 0x1
        :pswitch_35
        :pswitch_40
        :pswitch_4b
    .end packed-switch

    .line 120
    :pswitch_data_7c
    .packed-switch 0x1
        :pswitch_53
        :pswitch_60
        :pswitch_6d
    .end packed-switch
.end method

.method protected bridge synthetic _prepareParameters(Lezvcard/property/VCardProperty;Lezvcard/parameter/VCardParameters;Lezvcard/VCardVersion;Lezvcard/VCard;)V
    .registers 5
    .param p1, "x0"    # Lezvcard/property/VCardProperty;
    .param p2, "x1"    # Lezvcard/parameter/VCardParameters;
    .param p3, "x2"    # Lezvcard/VCardVersion;
    .param p4, "x3"    # Lezvcard/VCard;

    .prologue
    .line 50
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    check-cast p1, Lezvcard/property/BinaryProperty;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2, p3, p4}, Lezvcard/io/scribe/BinaryPropertyScribe;->_prepareParameters(Lezvcard/property/BinaryProperty;Lezvcard/parameter/VCardParameters;Lezvcard/VCardVersion;Lezvcard/VCard;)V

    return-void
.end method

.method protected _writeJson(Lezvcard/property/BinaryProperty;)Lezvcard/io/json/JCardValue;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lezvcard/io/json/JCardValue;"
        }
    .end annotation

    .prologue
    .line 194
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    .local p1, "property":Lezvcard/property/BinaryProperty;, "TT;"
    sget-object v0, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-direct {p0, p1, v0}, Lezvcard/io/scribe/BinaryPropertyScribe;->write(Lezvcard/property/BinaryProperty;Lezvcard/VCardVersion;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lezvcard/io/json/JCardValue;->single(Ljava/lang/Object;)Lezvcard/io/json/JCardValue;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic _writeJson(Lezvcard/property/VCardProperty;)Lezvcard/io/json/JCardValue;
    .registers 3
    .param p1, "x0"    # Lezvcard/property/VCardProperty;

    .prologue
    .line 50
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    check-cast p1, Lezvcard/property/BinaryProperty;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1}, Lezvcard/io/scribe/BinaryPropertyScribe;->_writeJson(Lezvcard/property/BinaryProperty;)Lezvcard/io/json/JCardValue;

    move-result-object v0

    return-object v0
.end method

.method protected _writeText(Lezvcard/property/BinaryProperty;Lezvcard/VCardVersion;)Ljava/lang/String;
    .registers 4
    .param p2, "version"    # Lezvcard/VCardVersion;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lezvcard/VCardVersion;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 139
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    .local p1, "property":Lezvcard/property/BinaryProperty;, "TT;"
    invoke-direct {p0, p1, p2}, Lezvcard/io/scribe/BinaryPropertyScribe;->write(Lezvcard/property/BinaryProperty;Lezvcard/VCardVersion;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic _writeText(Lezvcard/property/VCardProperty;Lezvcard/VCardVersion;)Ljava/lang/String;
    .registers 4
    .param p1, "x0"    # Lezvcard/property/VCardProperty;
    .param p2, "x1"    # Lezvcard/VCardVersion;

    .prologue
    .line 50
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    check-cast p1, Lezvcard/property/BinaryProperty;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/BinaryPropertyScribe;->_writeText(Lezvcard/property/BinaryProperty;Lezvcard/VCardVersion;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected _writeXml(Lezvcard/property/BinaryProperty;Lezvcard/io/xml/XCardElement;)V
    .registers 5
    .param p2, "parent"    # Lezvcard/io/xml/XCardElement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lezvcard/io/xml/XCardElement;",
            ")V"
        }
    .end annotation

    .prologue
    .line 150
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    .local p1, "property":Lezvcard/property/BinaryProperty;, "TT;"
    sget-object v0, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    invoke-virtual {p2}, Lezvcard/io/xml/XCardElement;->version()Lezvcard/VCardVersion;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lezvcard/io/scribe/BinaryPropertyScribe;->write(Lezvcard/property/BinaryProperty;Lezvcard/VCardVersion;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Lezvcard/io/xml/XCardElement;->append(Lezvcard/VCardDataType;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 151
    return-void
.end method

.method protected bridge synthetic _writeXml(Lezvcard/property/VCardProperty;Lezvcard/io/xml/XCardElement;)V
    .registers 3
    .param p1, "x0"    # Lezvcard/property/VCardProperty;
    .param p2, "x1"    # Lezvcard/io/xml/XCardElement;

    .prologue
    .line 50
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    check-cast p1, Lezvcard/property/BinaryProperty;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/BinaryPropertyScribe;->_writeXml(Lezvcard/property/BinaryProperty;Lezvcard/io/xml/XCardElement;)V

    return-void
.end method

.method protected cannotUnmarshalValue(Ljava/lang/String;Lezvcard/VCardVersion;Ljava/util/List;Lezvcard/parameter/MediaTypeParameter;)Lezvcard/property/BinaryProperty;
    .registers 7
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "version"    # Lezvcard/VCardVersion;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lezvcard/VCardVersion;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;TU;)TT;"
        }
    .end annotation

    .prologue
    .line 212
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    .local p3, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p4, "contentType":Lezvcard/parameter/MediaTypeParameter;, "TU;"
    sget-object v0, Lezvcard/io/scribe/BinaryPropertyScribe$1;->$SwitchMap$ezvcard$VCardVersion:[I

    invoke-virtual {p2}, Lezvcard/VCardVersion;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_28

    .line 222
    const/4 v0, 0x0

    :goto_c
    return-object v0

    .line 215
    :pswitch_d
    const-string v0, "http"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 216
    invoke-virtual {p0, p1, p4}, Lezvcard/io/scribe/BinaryPropertyScribe;->_newInstance(Ljava/lang/String;Lezvcard/parameter/MediaTypeParameter;)Lezvcard/property/BinaryProperty;

    move-result-object v0

    goto :goto_c

    .line 218
    :cond_1a
    invoke-static {p1}, Lezvcard/util/org/apache/commons/codec/binary/Base64;->decodeBase64(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p0, v0, p4}, Lezvcard/io/scribe/BinaryPropertyScribe;->_newInstance([BLezvcard/parameter/MediaTypeParameter;)Lezvcard/property/BinaryProperty;

    move-result-object v0

    goto :goto_c

    .line 220
    :pswitch_23
    invoke-virtual {p0, p1, p4}, Lezvcard/io/scribe/BinaryPropertyScribe;->_newInstance(Ljava/lang/String;Lezvcard/parameter/MediaTypeParameter;)Lezvcard/property/BinaryProperty;

    move-result-object v0

    goto :goto_c

    .line 212
    :pswitch_data_28
    .packed-switch 0x1
        :pswitch_d
        :pswitch_d
        :pswitch_23
    .end packed-switch
.end method

.method protected parseContentType(Lezvcard/parameter/VCardParameters;Lezvcard/VCardVersion;)Lezvcard/parameter/MediaTypeParameter;
    .registers 7
    .param p1, "parameters"    # Lezvcard/parameter/VCardParameters;
    .param p2, "version"    # Lezvcard/VCardVersion;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/parameter/VCardParameters;",
            "Lezvcard/VCardVersion;",
            ")TU;"
        }
    .end annotation

    .prologue
    .line 246
    .local p0, "this":Lezvcard/io/scribe/BinaryPropertyScribe;, "Lezvcard/io/scribe/BinaryPropertyScribe<TT;TU;>;"
    sget-object v2, Lezvcard/io/scribe/BinaryPropertyScribe$1;->$SwitchMap$ezvcard$VCardVersion:[I

    invoke-virtual {p2}, Lezvcard/VCardVersion;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_24

    .line 263
    :cond_b
    const/4 v2, 0x0

    :goto_c
    return-object v2

    .line 250
    :pswitch_d
    invoke-virtual {p1}, Lezvcard/parameter/VCardParameters;->getType()Ljava/lang/String;

    move-result-object v1

    .line 251
    .local v1, "type":Ljava/lang/String;
    if-eqz v1, :cond_b

    .line 252
    invoke-virtual {p0, v1}, Lezvcard/io/scribe/BinaryPropertyScribe;->_buildTypeObj(Ljava/lang/String;)Lezvcard/parameter/MediaTypeParameter;

    move-result-object v2

    goto :goto_c

    .line 257
    .end local v1    # "type":Ljava/lang/String;
    :pswitch_18
    invoke-virtual {p1}, Lezvcard/parameter/VCardParameters;->getMediaType()Ljava/lang/String;

    move-result-object v0

    .line 258
    .local v0, "mediaType":Ljava/lang/String;
    if-eqz v0, :cond_b

    .line 259
    invoke-virtual {p0, v0}, Lezvcard/io/scribe/BinaryPropertyScribe;->_buildMediaTypeObj(Ljava/lang/String;)Lezvcard/parameter/MediaTypeParameter;

    move-result-object v2

    goto :goto_c

    .line 246
    nop

    :pswitch_data_24
    .packed-switch 0x1
        :pswitch_d
        :pswitch_d
        :pswitch_18
    .end packed-switch
.end method
