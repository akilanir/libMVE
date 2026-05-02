.class public Lezvcard/io/scribe/SoundScribe;
.super Lezvcard/io/scribe/BinaryPropertyScribe;
.source "SoundScribe.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lezvcard/io/scribe/BinaryPropertyScribe",
        "<",
        "Lezvcard/property/Sound;",
        "Lezvcard/parameter/SoundType;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 42
    const-class v0, Lezvcard/property/Sound;

    const-string v1, "SOUND"

    invoke-direct {p0, v0, v1}, Lezvcard/io/scribe/BinaryPropertyScribe;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 43
    return-void
.end method


# virtual methods
.method protected bridge synthetic _buildMediaTypeObj(Ljava/lang/String;)Lezvcard/parameter/MediaTypeParameter;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 40
    invoke-virtual {p0, p1}, Lezvcard/io/scribe/SoundScribe;->_buildMediaTypeObj(Ljava/lang/String;)Lezvcard/parameter/SoundType;

    move-result-object v0

    return-object v0
.end method

.method protected _buildMediaTypeObj(Ljava/lang/String;)Lezvcard/parameter/SoundType;
    .registers 3
    .param p1, "mediaType"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 52
    invoke-static {v0, p1, v0}, Lezvcard/parameter/SoundType;->get(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lezvcard/parameter/SoundType;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic _buildTypeObj(Ljava/lang/String;)Lezvcard/parameter/MediaTypeParameter;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 40
    invoke-virtual {p0, p1}, Lezvcard/io/scribe/SoundScribe;->_buildTypeObj(Ljava/lang/String;)Lezvcard/parameter/SoundType;

    move-result-object v0

    return-object v0
.end method

.method protected _buildTypeObj(Ljava/lang/String;)Lezvcard/parameter/SoundType;
    .registers 3
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 47
    invoke-static {p1, v0, v0}, Lezvcard/parameter/SoundType;->get(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lezvcard/parameter/SoundType;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic _newInstance(Ljava/lang/String;Lezvcard/parameter/MediaTypeParameter;)Lezvcard/property/BinaryProperty;
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lezvcard/parameter/MediaTypeParameter;

    .prologue
    .line 40
    check-cast p2, Lezvcard/parameter/SoundType;

    .end local p2    # "x1":Lezvcard/parameter/MediaTypeParameter;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/SoundScribe;->_newInstance(Ljava/lang/String;Lezvcard/parameter/SoundType;)Lezvcard/property/Sound;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic _newInstance([BLezvcard/parameter/MediaTypeParameter;)Lezvcard/property/BinaryProperty;
    .registers 4
    .param p1, "x0"    # [B
    .param p2, "x1"    # Lezvcard/parameter/MediaTypeParameter;

    .prologue
    .line 40
    check-cast p2, Lezvcard/parameter/SoundType;

    .end local p2    # "x1":Lezvcard/parameter/MediaTypeParameter;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/SoundScribe;->_newInstance([BLezvcard/parameter/SoundType;)Lezvcard/property/Sound;

    move-result-object v0

    return-object v0
.end method

.method protected _newInstance(Ljava/lang/String;Lezvcard/parameter/SoundType;)Lezvcard/property/Sound;
    .registers 4
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "contentType"    # Lezvcard/parameter/SoundType;

    .prologue
    .line 57
    new-instance v0, Lezvcard/property/Sound;

    invoke-direct {v0, p1, p2}, Lezvcard/property/Sound;-><init>(Ljava/lang/String;Lezvcard/parameter/SoundType;)V

    return-object v0
.end method

.method protected _newInstance([BLezvcard/parameter/SoundType;)Lezvcard/property/Sound;
    .registers 4
    .param p1, "data"    # [B
    .param p2, "contentType"    # Lezvcard/parameter/SoundType;

    .prologue
    .line 62
    new-instance v0, Lezvcard/property/Sound;

    invoke-direct {v0, p1, p2}, Lezvcard/property/Sound;-><init>([BLezvcard/parameter/SoundType;)V

    return-object v0
.end method

.method protected bridge synthetic _parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/BinaryProperty;
    .registers 4
    .param p1, "x0"    # Lezvcard/io/html/HCardElement;
    .param p2, "x1"    # Ljava/util/List;

    .prologue
    .line 40
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/SoundScribe;->_parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/Sound;

    move-result-object v0

    return-object v0
.end method

.method protected _parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/Sound;
    .registers 14
    .param p1, "element"    # Lezvcard/io/html/HCardElement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/io/html/HCardElement;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lezvcard/property/Sound;"
        }
    .end annotation

    .prologue
    .local p2, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v7, 0x0

    const/4 v10, 0x0

    .line 67
    invoke-virtual {p1}, Lezvcard/io/html/HCardElement;->tagName()Ljava/lang/String;

    move-result-object v1

    .line 68
    .local v1, "elementName":Ljava/lang/String;
    const-string v8, "audio"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1d

    const-string v8, "source"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1d

    .line 69
    invoke-super {p0, p1, p2}, Lezvcard/io/scribe/BinaryPropertyScribe;->_parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/BinaryProperty;

    move-result-object v7

    check-cast v7, Lezvcard/property/Sound;

    .line 97
    :goto_1c
    return-object v7

    .line 72
    :cond_1d
    const-string v8, "audio"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_44

    .line 74
    invoke-virtual {p1}, Lezvcard/io/html/HCardElement;->getElement()Lorg/jsoup/nodes/Element;

    move-result-object v8

    const-string v9, "source"

    invoke-virtual {v8, v9}, Lorg/jsoup/nodes/Element;->getElementsByTag(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v8

    invoke-virtual {v8}, Lorg/jsoup/select/Elements;->first()Lorg/jsoup/nodes/Element;

    move-result-object v3

    .line 75
    .local v3, "source":Lorg/jsoup/nodes/Element;
    if-nez v3, :cond_3f

    .line 76
    new-instance v7, Lezvcard/io/CannotParseException;

    const/16 v8, 0x10

    new-array v9, v10, [Ljava/lang/Object;

    invoke-direct {v7, v8, v9}, Lezvcard/io/CannotParseException;-><init>(I[Ljava/lang/Object;)V

    throw v7

    .line 79
    :cond_3f
    new-instance p1, Lezvcard/io/html/HCardElement;

    .end local p1    # "element":Lezvcard/io/html/HCardElement;
    invoke-direct {p1, v3}, Lezvcard/io/html/HCardElement;-><init>(Lorg/jsoup/nodes/Element;)V

    .line 82
    .end local v3    # "source":Lorg/jsoup/nodes/Element;
    .restart local p1    # "element":Lezvcard/io/html/HCardElement;
    :cond_44
    const-string v8, "src"

    invoke-virtual {p1, v8}, Lezvcard/io/html/HCardElement;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 83
    .local v4, "src":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_5a

    .line 84
    new-instance v7, Lezvcard/io/CannotParseException;

    const/16 v8, 0x11

    new-array v9, v10, [Ljava/lang/Object;

    invoke-direct {v7, v8, v9}, Lezvcard/io/CannotParseException;-><init>(I[Ljava/lang/Object;)V

    throw v7

    .line 87
    :cond_5a
    const-string v8, "type"

    invoke-virtual {p1, v8}, Lezvcard/io/html/HCardElement;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 88
    .local v5, "type":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_7f

    move-object v2, v7

    .line 91
    .local v2, "mediaType":Lezvcard/parameter/SoundType;
    :goto_67
    :try_start_67
    new-instance v6, Lezvcard/util/DataUri;

    invoke-direct {v6, v4}, Lezvcard/util/DataUri;-><init>(Ljava/lang/String;)V

    .line 92
    .local v6, "uri":Lezvcard/util/DataUri;
    invoke-virtual {v6}, Lezvcard/util/DataUri;->getContentType()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lezvcard/io/scribe/SoundScribe;->_buildMediaTypeObj(Ljava/lang/String;)Lezvcard/parameter/SoundType;

    move-result-object v2

    .line 93
    new-instance v8, Lezvcard/property/Sound;

    invoke-virtual {v6}, Lezvcard/util/DataUri;->getData()[B

    move-result-object v9

    invoke-direct {v8, v9, v2}, Lezvcard/property/Sound;-><init>([BLezvcard/parameter/SoundType;)V
    :try_end_7d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_67 .. :try_end_7d} :catch_84

    move-object v7, v8

    goto :goto_1c

    .line 88
    .end local v2    # "mediaType":Lezvcard/parameter/SoundType;
    .end local v6    # "uri":Lezvcard/util/DataUri;
    :cond_7f
    invoke-virtual {p0, v5}, Lezvcard/io/scribe/SoundScribe;->_buildMediaTypeObj(Ljava/lang/String;)Lezvcard/parameter/SoundType;

    move-result-object v2

    goto :goto_67

    .line 94
    .restart local v2    # "mediaType":Lezvcard/parameter/SoundType;
    :catch_84
    move-exception v0

    .line 97
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v8, Lezvcard/property/Sound;

    invoke-direct {v8, v4, v7}, Lezvcard/property/Sound;-><init>(Ljava/lang/String;Lezvcard/parameter/SoundType;)V

    move-object v7, v8

    goto :goto_1c
.end method

.method protected bridge synthetic _parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 4
    .param p1, "x0"    # Lezvcard/io/html/HCardElement;
    .param p2, "x1"    # Ljava/util/List;

    .prologue
    .line 40
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/SoundScribe;->_parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/Sound;

    move-result-object v0

    return-object v0
.end method
