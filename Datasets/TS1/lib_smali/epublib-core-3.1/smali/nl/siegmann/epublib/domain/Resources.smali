.class public Lnl/siegmann/epublib/domain/Resources;
.super Ljava/lang/Object;
.source "Resources.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final IMAGE_PREFIX:Ljava/lang/String; = "image_"

.field private static final ITEM_PREFIX:Ljava/lang/String; = "item_"

.field private static final serialVersionUID:J = 0x2203439a92a323dbL


# instance fields
.field private lastId:I

.field private resources:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lnl/siegmann/epublib/domain/Resource;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const/4 v0, 0x1

    iput v0, p0, Lnl/siegmann/epublib/domain/Resources;->lastId:I

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lnl/siegmann/epublib/domain/Resources;->resources:Ljava/util/Map;

    return-void
.end method

.method private createHref(Lnl/siegmann/epublib/domain/MediaType;I)Ljava/lang/String;
    .registers 5
    .param p1, "mediaType"    # Lnl/siegmann/epublib/domain/MediaType;
    .param p2, "counter"    # I

    .prologue
    .line 184
    invoke-static {p1}, Lnl/siegmann/epublib/service/MediatypeService;->isBitmapImage(Lnl/siegmann/epublib/domain/MediaType;)Z

    move-result v0

    if-eqz v0, :cond_22

    .line 185
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "image_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/MediaType;->getDefaultExtension()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 187
    :goto_21
    return-object v0

    :cond_22
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "item_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/MediaType;->getDefaultExtension()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_21
.end method

.method private createUniqueResourceId(Lnl/siegmann/epublib/domain/Resource;)Ljava/lang/String;
    .registers 7
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    const v4, 0x7fffffff

    .line 102
    iget v0, p0, Lnl/siegmann/epublib/domain/Resources;->lastId:I

    .line 103
    .local v0, "counter":I
    if-ne v0, v4, :cond_18

    .line 104
    iget-object v3, p0, Lnl/siegmann/epublib/domain/Resources;->resources:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v3

    if-ne v3, v4, :cond_17

    .line 105
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Resources contains 2147483647 elements: no new elements can be added"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 107
    :cond_17
    const/4 v0, 0x1

    .line 110
    :cond_18
    invoke-direct {p0, p1}, Lnl/siegmann/epublib/domain/Resources;->getResourceItemPrefix(Lnl/siegmann/epublib/domain/Resource;)Ljava/lang/String;

    move-result-object v1

    .line 111
    .local v1, "prefix":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 112
    .local v2, "result":Ljava/lang/String;
    :goto_2d
    invoke-virtual {p0, v2}, Lnl/siegmann/epublib/domain/Resources;->containsId(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_47

    .line 113
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_2d

    .line 115
    :cond_47
    iput v0, p0, Lnl/siegmann/epublib/domain/Resources;->lastId:I

    .line 116
    return-object v2
.end method

.method public static findFirstResourceByMediaType(Ljava/util/Collection;Lnl/siegmann/epublib/domain/MediaType;)Lnl/siegmann/epublib/domain/Resource;
    .registers 5
    .param p1, "mediaType"    # Lnl/siegmann/epublib/domain/MediaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lnl/siegmann/epublib/domain/Resource;",
            ">;",
            "Lnl/siegmann/epublib/domain/MediaType;",
            ")",
            "Lnl/siegmann/epublib/domain/Resource;"
        }
    .end annotation

    .prologue
    .line 316
    .local p0, "resources":Ljava/util/Collection;, "Ljava/util/Collection<Lnl/siegmann/epublib/domain/Resource;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_17

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/siegmann/epublib/domain/Resource;

    .line 317
    .local v1, "resource":Lnl/siegmann/epublib/domain/Resource;
    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Resource;->getMediaType()Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v2

    if-ne v2, p1, :cond_4

    .line 321
    .end local v1    # "resource":Lnl/siegmann/epublib/domain/Resource;
    :goto_16
    return-object v1

    :cond_17
    const/4 v1, 0x0

    goto :goto_16
.end method

.method private fixResourceHref(Lnl/siegmann/epublib/domain/Resource;)V
    .registers 6
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 166
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lnl/siegmann/epublib/util/StringUtil;->isNotBlank(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_17

    iget-object v2, p0, Lnl/siegmann/epublib/domain/Resources;->resources:Ljava/util/Map;

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_17

    .line 181
    :cond_16
    :goto_16
    return-void

    .line 170
    :cond_17
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_16

    .line 171
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getMediaType()Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v2

    if-nez v2, :cond_2f

    .line 172
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Resource must have either a MediaType or a href"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 174
    :cond_2f
    const/4 v1, 0x1

    .line 175
    .local v1, "i":I
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getMediaType()Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v2

    invoke-direct {p0, v2, v1}, Lnl/siegmann/epublib/domain/Resources;->createHref(Lnl/siegmann/epublib/domain/MediaType;I)Ljava/lang/String;

    move-result-object v0

    .line 176
    .local v0, "href":Ljava/lang/String;
    :goto_38
    iget-object v2, p0, Lnl/siegmann/epublib/domain/Resources;->resources:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4b

    .line 177
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getMediaType()Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    invoke-direct {p0, v2, v1}, Lnl/siegmann/epublib/domain/Resources;->createHref(Lnl/siegmann/epublib/domain/MediaType;I)Ljava/lang/String;

    move-result-object v0

    goto :goto_38

    .line 179
    :cond_4b
    invoke-virtual {p1, v0}, Lnl/siegmann/epublib/domain/Resource;->setHref(Ljava/lang/String;)V

    goto :goto_16
.end method

.method private getResourceItemPrefix(Lnl/siegmann/epublib/domain/Resource;)Ljava/lang/String;
    .registers 4
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 87
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getMediaType()Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v1

    invoke-static {v1}, Lnl/siegmann/epublib/service/MediatypeService;->isBitmapImage(Lnl/siegmann/epublib/domain/MediaType;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 88
    const-string v0, "image_"

    .line 92
    .local v0, "result":Ljava/lang/String;
    :goto_c
    return-object v0

    .line 90
    .end local v0    # "result":Ljava/lang/String;
    :cond_d
    const-string v0, "item_"

    .restart local v0    # "result":Ljava/lang/String;
    goto :goto_c
.end method

.method private makeValidId(Ljava/lang/String;Lnl/siegmann/epublib/domain/Resource;)Ljava/lang/String;
    .registers 5
    .param p1, "resourceId"    # Ljava/lang/String;
    .param p2, "resource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 79
    invoke-static {p1}, Lnl/siegmann/epublib/util/StringUtil;->isNotBlank(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_26

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isJavaIdentifierStart(C)Z

    move-result v0

    if-nez v0, :cond_26

    .line 80
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lnl/siegmann/epublib/domain/Resources;->getResourceItemPrefix(Lnl/siegmann/epublib/domain/Resource;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 82
    :cond_26
    return-object p1
.end method


# virtual methods
.method public add(Lnl/siegmann/epublib/domain/Resource;)Lnl/siegmann/epublib/domain/Resource;
    .registers 4
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lnl/siegmann/epublib/domain/Resources;->fixResourceHref(Lnl/siegmann/epublib/domain/Resource;)V

    .line 44
    invoke-virtual {p0, p1}, Lnl/siegmann/epublib/domain/Resources;->fixResourceId(Lnl/siegmann/epublib/domain/Resource;)V

    .line 45
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resources;->resources:Ljava/util/Map;

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    return-object p1
.end method

.method public addAll(Ljava/util/Collection;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lnl/siegmann/epublib/domain/Resource;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 247
    .local p1, "resources":Ljava/util/Collection;, "Ljava/util/Collection<Lnl/siegmann/epublib/domain/Resource;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/siegmann/epublib/domain/Resource;

    .line 248
    .local v1, "resource":Lnl/siegmann/epublib/domain/Resource;
    invoke-direct {p0, v1}, Lnl/siegmann/epublib/domain/Resources;->fixResourceHref(Lnl/siegmann/epublib/domain/Resource;)V

    .line 249
    iget-object v2, p0, Lnl/siegmann/epublib/domain/Resources;->resources:Ljava/util/Map;

    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 251
    .end local v1    # "resource":Lnl/siegmann/epublib/domain/Resource;
    :cond_1d
    return-void
.end method

.method public containsByHref(Ljava/lang/String;)Z
    .registers 4
    .param p1, "href"    # Ljava/lang/String;

    .prologue
    .line 225
    invoke-static {p1}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 226
    const/4 v0, 0x0

    .line 228
    :goto_7
    return v0

    :cond_8
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resources;->resources:Ljava/util/Map;

    const/16 v1, 0x23

    invoke-static {p1, v1}, Lnl/siegmann/epublib/util/StringUtil;->substringBefore(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_7
.end method

.method public containsId(Ljava/lang/String;)Z
    .registers 6
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 126
    invoke-static {p1}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 134
    :cond_7
    :goto_7
    return v2

    .line 129
    :cond_8
    iget-object v3, p0, Lnl/siegmann/epublib/domain/Resources;->resources:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/siegmann/epublib/domain/Resource;

    .line 130
    .local v1, "resource":Lnl/siegmann/epublib/domain/Resource;
    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Resource;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 131
    const/4 v2, 0x1

    goto :goto_7
.end method

.method public findFirstResourceByMediaType(Lnl/siegmann/epublib/domain/MediaType;)Lnl/siegmann/epublib/domain/Resource;
    .registers 3
    .param p1, "mediaType"    # Lnl/siegmann/epublib/domain/MediaType;

    .prologue
    .line 304
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resources;->resources:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0, p1}, Lnl/siegmann/epublib/domain/Resources;->findFirstResourceByMediaType(Ljava/util/Collection;Lnl/siegmann/epublib/domain/MediaType;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    return-object v0
.end method

.method public fixResourceId(Lnl/siegmann/epublib/domain/Resource;)V
    .registers 5
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 55
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getId()Ljava/lang/String;

    move-result-object v0

    .line 58
    .local v0, "resourceId":Ljava/lang/String;
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 59
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2e

    invoke-static {v1, v2}, Lnl/siegmann/epublib/util/StringUtil;->substringBeforeLast(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v0

    .line 60
    const/16 v1, 0x2f

    invoke-static {v0, v1}, Lnl/siegmann/epublib/util/StringUtil;->substringAfterLast(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v0

    .line 63
    :cond_1e
    invoke-direct {p0, v0, p1}, Lnl/siegmann/epublib/domain/Resources;->makeValidId(Ljava/lang/String;Lnl/siegmann/epublib/domain/Resource;)Ljava/lang/String;

    move-result-object v0

    .line 66
    invoke-static {v0}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2e

    invoke-virtual {p0, v0}, Lnl/siegmann/epublib/domain/Resources;->containsId(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_32

    .line 67
    :cond_2e
    invoke-direct {p0, p1}, Lnl/siegmann/epublib/domain/Resources;->createUniqueResourceId(Lnl/siegmann/epublib/domain/Resource;)Ljava/lang/String;

    move-result-object v0

    .line 69
    :cond_32
    invoke-virtual {p1, v0}, Lnl/siegmann/epublib/domain/Resource;->setId(Ljava/lang/String;)V

    .line 70
    return-void
.end method

.method public getAll()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lnl/siegmann/epublib/domain/Resource;",
            ">;"
        }
    .end annotation

    .prologue
    .line 215
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resources;->resources:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getAllHrefs()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 368
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resources;->resources:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getByHref(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;
    .registers 4
    .param p1, "href"    # Ljava/lang/String;

    .prologue
    .line 287
    invoke-static {p1}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 288
    const/4 v0, 0x0

    .line 292
    :goto_7
    return-object v0

    .line 290
    :cond_8
    const/16 v1, 0x23

    invoke-static {p1, v1}, Lnl/siegmann/epublib/util/StringUtil;->substringBefore(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object p1

    .line 291
    iget-object v1, p0, Lnl/siegmann/epublib/domain/Resources;->resources:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnl/siegmann/epublib/domain/Resource;

    .line 292
    .local v0, "result":Lnl/siegmann/epublib/domain/Resource;
    goto :goto_7
.end method

.method public getById(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;
    .registers 6
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 144
    invoke-static {p1}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_9

    move-object v1, v2

    .line 152
    :goto_8
    return-object v1

    .line 147
    :cond_9
    iget-object v3, p0, Lnl/siegmann/epublib/domain/Resources;->resources:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/siegmann/epublib/domain/Resource;

    .line 148
    .local v1, "resource":Lnl/siegmann/epublib/domain/Resource;
    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Resource;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_13

    goto :goto_8

    .end local v1    # "resource":Lnl/siegmann/epublib/domain/Resource;
    :cond_2a
    move-object v1, v2

    .line 152
    goto :goto_8
.end method

.method public getByIdOrHref(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;
    .registers 3
    .param p1, "idOrHref"    # Ljava/lang/String;

    .prologue
    .line 271
    invoke-virtual {p0, p1}, Lnl/siegmann/epublib/domain/Resources;->getById(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    .line 272
    .local v0, "resource":Lnl/siegmann/epublib/domain/Resource;
    if-nez v0, :cond_a

    .line 273
    invoke-virtual {p0, p1}, Lnl/siegmann/epublib/domain/Resources;->getByHref(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    .line 275
    :cond_a
    return-object v0
.end method

.method public getResourceMap()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lnl/siegmann/epublib/domain/Resource;",
            ">;"
        }
    .end annotation

    .prologue
    .line 211
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resources;->resources:Ljava/util/Map;

    return-object v0
.end method

.method public getResourcesByMediaType(Lnl/siegmann/epublib/domain/MediaType;)Ljava/util/List;
    .registers 6
    .param p1, "mediaType"    # Lnl/siegmann/epublib/domain/MediaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnl/siegmann/epublib/domain/MediaType;",
            ")",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/Resource;",
            ">;"
        }
    .end annotation

    .prologue
    .line 331
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 332
    .local v2, "result":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/Resource;>;"
    if-nez p1, :cond_8

    .line 340
    :cond_7
    return-object v2

    .line 335
    :cond_8
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Resources;->getAll()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_10
    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/siegmann/epublib/domain/Resource;

    .line 336
    .local v1, "resource":Lnl/siegmann/epublib/domain/Resource;
    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Resource;->getMediaType()Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v3

    if-ne v3, p1, :cond_10

    .line 337
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10
.end method

.method public getResourcesByMediaTypes([Lnl/siegmann/epublib/domain/MediaType;)Ljava/util/List;
    .registers 7
    .param p1, "mediaTypes"    # [Lnl/siegmann/epublib/domain/MediaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lnl/siegmann/epublib/domain/MediaType;",
            ")",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/Resource;",
            ">;"
        }
    .end annotation

    .prologue
    .line 350
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 351
    .local v3, "result":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/Resource;>;"
    if-nez p1, :cond_8

    .line 363
    :cond_7
    return-object v3

    .line 357
    :cond_8
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 358
    .local v1, "mediaTypesList":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/MediaType;>;"
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Resources;->getAll()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_14
    :goto_14
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnl/siegmann/epublib/domain/Resource;

    .line 359
    .local v2, "resource":Lnl/siegmann/epublib/domain/Resource;
    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/Resource;->getMediaType()Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_14

    .line 360
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_14
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 193
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resources;->resources:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public remove(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;
    .registers 3
    .param p1, "href"    # Ljava/lang/String;

    .prologue
    .line 162
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resources;->resources:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnl/siegmann/epublib/domain/Resource;

    return-object v0
.end method

.method public set(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lnl/siegmann/epublib/domain/Resource;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 237
    .local p1, "resources":Ljava/util/Collection;, "Ljava/util/Collection<Lnl/siegmann/epublib/domain/Resource;>;"
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resources;->resources:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 238
    invoke-virtual {p0, p1}, Lnl/siegmann/epublib/domain/Resources;->addAll(Ljava/util/Collection;)V

    .line 239
    return-void
.end method

.method public set(Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lnl/siegmann/epublib/domain/Resource;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 259
    .local p1, "resources":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lnl/siegmann/epublib/domain/Resource;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lnl/siegmann/epublib/domain/Resources;->resources:Ljava/util/Map;

    .line 260
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 201
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resources;->resources:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method
