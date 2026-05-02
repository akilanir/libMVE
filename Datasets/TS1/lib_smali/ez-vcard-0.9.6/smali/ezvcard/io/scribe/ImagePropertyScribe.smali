.class public abstract Lezvcard/io/scribe/ImagePropertyScribe;
.super Lezvcard/io/scribe/BinaryPropertyScribe;
.source "ImagePropertyScribe.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lezvcard/property/ImageProperty;",
        ">",
        "Lezvcard/io/scribe/BinaryPropertyScribe",
        "<TT;",
        "Lezvcard/parameter/ImageType;",
        ">;"
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
    .line 43
    .local p0, "this":Lezvcard/io/scribe/ImagePropertyScribe;, "Lezvcard/io/scribe/ImagePropertyScribe<TT;>;"
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0, p1, p2}, Lezvcard/io/scribe/BinaryPropertyScribe;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 44
    return-void
.end method


# virtual methods
.method protected _buildMediaTypeObj(Ljava/lang/String;)Lezvcard/parameter/ImageType;
    .registers 3
    .param p1, "mediaType"    # Ljava/lang/String;

    .prologue
    .local p0, "this":Lezvcard/io/scribe/ImagePropertyScribe;, "Lezvcard/io/scribe/ImagePropertyScribe<TT;>;"
    const/4 v0, 0x0

    .line 53
    invoke-static {v0, p1, v0}, Lezvcard/parameter/ImageType;->get(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lezvcard/parameter/ImageType;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic _buildMediaTypeObj(Ljava/lang/String;)Lezvcard/parameter/MediaTypeParameter;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 41
    .local p0, "this":Lezvcard/io/scribe/ImagePropertyScribe;, "Lezvcard/io/scribe/ImagePropertyScribe<TT;>;"
    invoke-virtual {p0, p1}, Lezvcard/io/scribe/ImagePropertyScribe;->_buildMediaTypeObj(Ljava/lang/String;)Lezvcard/parameter/ImageType;

    move-result-object v0

    return-object v0
.end method

.method protected _buildTypeObj(Ljava/lang/String;)Lezvcard/parameter/ImageType;
    .registers 3
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .local p0, "this":Lezvcard/io/scribe/ImagePropertyScribe;, "Lezvcard/io/scribe/ImagePropertyScribe<TT;>;"
    const/4 v0, 0x0

    .line 48
    invoke-static {p1, v0, v0}, Lezvcard/parameter/ImageType;->get(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lezvcard/parameter/ImageType;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic _buildTypeObj(Ljava/lang/String;)Lezvcard/parameter/MediaTypeParameter;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 41
    .local p0, "this":Lezvcard/io/scribe/ImagePropertyScribe;, "Lezvcard/io/scribe/ImagePropertyScribe<TT;>;"
    invoke-virtual {p0, p1}, Lezvcard/io/scribe/ImagePropertyScribe;->_buildTypeObj(Ljava/lang/String;)Lezvcard/parameter/ImageType;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic _parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/BinaryProperty;
    .registers 4
    .param p1, "x0"    # Lezvcard/io/html/HCardElement;
    .param p2, "x1"    # Ljava/util/List;

    .prologue
    .line 41
    .local p0, "this":Lezvcard/io/scribe/ImagePropertyScribe;, "Lezvcard/io/scribe/ImagePropertyScribe<TT;>;"
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/ImagePropertyScribe;->_parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/ImageProperty;

    move-result-object v0

    return-object v0
.end method

.method protected _parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/ImageProperty;
    .registers 11
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
    .line 58
    .local p0, "this":Lezvcard/io/scribe/ImagePropertyScribe;, "Lezvcard/io/scribe/ImagePropertyScribe<TT;>;"
    .local p2, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p1}, Lezvcard/io/html/HCardElement;->tagName()Ljava/lang/String;

    move-result-object v1

    .line 59
    .local v1, "elementName":Ljava/lang/String;
    const-string v5, "img"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_13

    .line 60
    invoke-super {p0, p1, p2}, Lezvcard/io/scribe/BinaryPropertyScribe;->_parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/BinaryProperty;

    move-result-object v5

    check-cast v5, Lezvcard/property/ImageProperty;

    .line 75
    :goto_12
    return-object v5

    .line 63
    :cond_13
    const-string v5, "src"

    invoke-virtual {p1, v5}, Lezvcard/io/html/HCardElement;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 64
    .local v3, "src":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_2a

    .line 65
    new-instance v5, Lezvcard/io/CannotParseException;

    const/16 v6, 0xd

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    invoke-direct {v5, v6, v7}, Lezvcard/io/CannotParseException;-><init>(I[Ljava/lang/Object;)V

    throw v5

    .line 69
    :cond_2a
    :try_start_2a
    new-instance v4, Lezvcard/util/DataUri;

    invoke-direct {v4, v3}, Lezvcard/util/DataUri;-><init>(Ljava/lang/String;)V

    .line 70
    .local v4, "uri":Lezvcard/util/DataUri;
    invoke-virtual {v4}, Lezvcard/util/DataUri;->getContentType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lezvcard/io/scribe/ImagePropertyScribe;->_buildMediaTypeObj(Ljava/lang/String;)Lezvcard/parameter/ImageType;

    move-result-object v2

    .line 71
    .local v2, "mediaType":Lezvcard/parameter/ImageType;
    invoke-virtual {v4}, Lezvcard/util/DataUri;->getData()[B

    move-result-object v5

    invoke-virtual {p0, v5, v2}, Lezvcard/io/scribe/ImagePropertyScribe;->_newInstance([BLezvcard/parameter/MediaTypeParameter;)Lezvcard/property/BinaryProperty;

    move-result-object v5

    check-cast v5, Lezvcard/property/ImageProperty;
    :try_end_41
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2a .. :try_end_41} :catch_42

    goto :goto_12

    .line 72
    .end local v2    # "mediaType":Lezvcard/parameter/ImageType;
    .end local v4    # "uri":Lezvcard/util/DataUri;
    :catch_42
    move-exception v0

    .line 75
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const/4 v5, 0x0

    invoke-virtual {p0, v3, v5}, Lezvcard/io/scribe/ImagePropertyScribe;->_newInstance(Ljava/lang/String;Lezvcard/parameter/MediaTypeParameter;)Lezvcard/property/BinaryProperty;

    move-result-object v5

    check-cast v5, Lezvcard/property/ImageProperty;

    goto :goto_12
.end method

.method protected bridge synthetic _parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 4
    .param p1, "x0"    # Lezvcard/io/html/HCardElement;
    .param p2, "x1"    # Ljava/util/List;

    .prologue
    .line 41
    .local p0, "this":Lezvcard/io/scribe/ImagePropertyScribe;, "Lezvcard/io/scribe/ImagePropertyScribe<TT;>;"
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/ImagePropertyScribe;->_parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/ImageProperty;

    move-result-object v0

    return-object v0
.end method
