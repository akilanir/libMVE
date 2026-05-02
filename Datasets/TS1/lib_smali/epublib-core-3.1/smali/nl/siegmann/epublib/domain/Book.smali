.class public Lnl/siegmann/epublib/domain/Book;
.super Ljava/lang/Object;
.source "Book.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1cb44611be95b1f4L


# instance fields
.field private coverImage:Lnl/siegmann/epublib/domain/Resource;

.field private guide:Lnl/siegmann/epublib/domain/Guide;

.field private metadata:Lnl/siegmann/epublib/domain/Metadata;

.field private ncxResource:Lnl/siegmann/epublib/domain/Resource;

.field private opfResource:Lnl/siegmann/epublib/domain/Resource;

.field private resources:Lnl/siegmann/epublib/domain/Resources;

.field private spine:Lnl/siegmann/epublib/domain/Spine;

.field private tableOfContents:Lnl/siegmann/epublib/domain/TableOfContents;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 296
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 300
    new-instance v0, Lnl/siegmann/epublib/domain/Resources;

    invoke-direct {v0}, Lnl/siegmann/epublib/domain/Resources;-><init>()V

    iput-object v0, p0, Lnl/siegmann/epublib/domain/Book;->resources:Lnl/siegmann/epublib/domain/Resources;

    .line 301
    new-instance v0, Lnl/siegmann/epublib/domain/Metadata;

    invoke-direct {v0}, Lnl/siegmann/epublib/domain/Metadata;-><init>()V

    iput-object v0, p0, Lnl/siegmann/epublib/domain/Book;->metadata:Lnl/siegmann/epublib/domain/Metadata;

    .line 302
    new-instance v0, Lnl/siegmann/epublib/domain/Spine;

    invoke-direct {v0}, Lnl/siegmann/epublib/domain/Spine;-><init>()V

    iput-object v0, p0, Lnl/siegmann/epublib/domain/Book;->spine:Lnl/siegmann/epublib/domain/Spine;

    .line 303
    new-instance v0, Lnl/siegmann/epublib/domain/TableOfContents;

    invoke-direct {v0}, Lnl/siegmann/epublib/domain/TableOfContents;-><init>()V

    iput-object v0, p0, Lnl/siegmann/epublib/domain/Book;->tableOfContents:Lnl/siegmann/epublib/domain/TableOfContents;

    .line 304
    new-instance v0, Lnl/siegmann/epublib/domain/Guide;

    invoke-direct {v0}, Lnl/siegmann/epublib/domain/Guide;-><init>()V

    iput-object v0, p0, Lnl/siegmann/epublib/domain/Book;->guide:Lnl/siegmann/epublib/domain/Guide;

    return-void
.end method

.method private static addToContentsResult(Lnl/siegmann/epublib/domain/Resource;Ljava/util/Map;)V
    .registers 3
    .param p0, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnl/siegmann/epublib/domain/Resource;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lnl/siegmann/epublib/domain/Resource;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 510
    .local p1, "allReachableResources":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lnl/siegmann/epublib/domain/Resource;>;"
    if-eqz p0, :cond_13

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    .line 511
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 513
    :cond_13
    return-void
.end method


# virtual methods
.method public addResource(Lnl/siegmann/epublib/domain/Resource;)Lnl/siegmann/epublib/domain/Resource;
    .registers 3
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 371
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Book;->resources:Lnl/siegmann/epublib/domain/Resources;

    invoke-virtual {v0, p1}, Lnl/siegmann/epublib/domain/Resources;->add(Lnl/siegmann/epublib/domain/Resource;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    return-object v0
.end method

.method public addSection(Ljava/lang/String;Lnl/siegmann/epublib/domain/Resource;)Lnl/siegmann/epublib/domain/TOCReference;
    .registers 6
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "resource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 343
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getResources()Lnl/siegmann/epublib/domain/Resources;

    move-result-object v1

    invoke-virtual {v1, p2}, Lnl/siegmann/epublib/domain/Resources;->add(Lnl/siegmann/epublib/domain/Resource;)Lnl/siegmann/epublib/domain/Resource;

    .line 344
    iget-object v1, p0, Lnl/siegmann/epublib/domain/Book;->tableOfContents:Lnl/siegmann/epublib/domain/TableOfContents;

    new-instance v2, Lnl/siegmann/epublib/domain/TOCReference;

    invoke-direct {v2, p1, p2}, Lnl/siegmann/epublib/domain/TOCReference;-><init>(Ljava/lang/String;Lnl/siegmann/epublib/domain/Resource;)V

    invoke-virtual {v1, v2}, Lnl/siegmann/epublib/domain/TableOfContents;->addTOCReference(Lnl/siegmann/epublib/domain/TOCReference;)Lnl/siegmann/epublib/domain/TOCReference;

    move-result-object v0

    .line 345
    .local v0, "tocReference":Lnl/siegmann/epublib/domain/TOCReference;
    iget-object v1, p0, Lnl/siegmann/epublib/domain/Book;->spine:Lnl/siegmann/epublib/domain/Spine;

    invoke-virtual {p2}, Lnl/siegmann/epublib/domain/Resource;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lnl/siegmann/epublib/domain/Spine;->findFirstResourceById(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_28

    .line 346
    iget-object v1, p0, Lnl/siegmann/epublib/domain/Book;->spine:Lnl/siegmann/epublib/domain/Spine;

    new-instance v2, Lnl/siegmann/epublib/domain/SpineReference;

    invoke-direct {v2, p2}, Lnl/siegmann/epublib/domain/SpineReference;-><init>(Lnl/siegmann/epublib/domain/Resource;)V

    invoke-virtual {v1, v2}, Lnl/siegmann/epublib/domain/Spine;->addSpineReference(Lnl/siegmann/epublib/domain/SpineReference;)Lnl/siegmann/epublib/domain/SpineReference;

    .line 348
    :cond_28
    return-object v0
.end method

.method public addSection(Lnl/siegmann/epublib/domain/TOCReference;Ljava/lang/String;Lnl/siegmann/epublib/domain/Resource;)Lnl/siegmann/epublib/domain/TOCReference;
    .registers 6
    .param p1, "parentSection"    # Lnl/siegmann/epublib/domain/TOCReference;
    .param p2, "sectionTitle"    # Ljava/lang/String;
    .param p3, "resource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 319
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getResources()Lnl/siegmann/epublib/domain/Resources;

    move-result-object v0

    invoke-virtual {v0, p3}, Lnl/siegmann/epublib/domain/Resources;->add(Lnl/siegmann/epublib/domain/Resource;)Lnl/siegmann/epublib/domain/Resource;

    .line 320
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Book;->spine:Lnl/siegmann/epublib/domain/Spine;

    invoke-virtual {p3}, Lnl/siegmann/epublib/domain/Resource;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnl/siegmann/epublib/domain/Spine;->findFirstResourceById(Ljava/lang/String;)I

    move-result v0

    if-gez v0, :cond_1d

    .line 321
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Book;->spine:Lnl/siegmann/epublib/domain/Spine;

    new-instance v1, Lnl/siegmann/epublib/domain/SpineReference;

    invoke-direct {v1, p3}, Lnl/siegmann/epublib/domain/SpineReference;-><init>(Lnl/siegmann/epublib/domain/Resource;)V

    invoke-virtual {v0, v1}, Lnl/siegmann/epublib/domain/Spine;->addSpineReference(Lnl/siegmann/epublib/domain/SpineReference;)Lnl/siegmann/epublib/domain/SpineReference;

    .line 323
    :cond_1d
    new-instance v0, Lnl/siegmann/epublib/domain/TOCReference;

    invoke-direct {v0, p2, p3}, Lnl/siegmann/epublib/domain/TOCReference;-><init>(Ljava/lang/String;Lnl/siegmann/epublib/domain/Resource;)V

    invoke-virtual {p1, v0}, Lnl/siegmann/epublib/domain/TOCReference;->addChildSection(Lnl/siegmann/epublib/domain/TOCReference;)Lnl/siegmann/epublib/domain/TOCReference;

    move-result-object v0

    return-object v0
.end method

.method public generateSpineFromTableOfContents()V
    .registers 3

    .prologue
    .line 327
    new-instance v0, Lnl/siegmann/epublib/domain/Spine;

    iget-object v1, p0, Lnl/siegmann/epublib/domain/Book;->tableOfContents:Lnl/siegmann/epublib/domain/TableOfContents;

    invoke-direct {v0, v1}, Lnl/siegmann/epublib/domain/Spine;-><init>(Lnl/siegmann/epublib/domain/TableOfContents;)V

    .line 330
    .local v0, "spine":Lnl/siegmann/epublib/domain/Spine;
    iget-object v1, p0, Lnl/siegmann/epublib/domain/Book;->spine:Lnl/siegmann/epublib/domain/Spine;

    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Spine;->getTocResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnl/siegmann/epublib/domain/Spine;->setTocResource(Lnl/siegmann/epublib/domain/Resource;)V

    .line 332
    iput-object v0, p0, Lnl/siegmann/epublib/domain/Book;->spine:Lnl/siegmann/epublib/domain/Spine;

    .line 333
    return-void
.end method

.method public getContents()Ljava/util/List;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/Resource;",
            ">;"
        }
    .end annotation

    .prologue
    .line 491
    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    .line 492
    .local v3, "result":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lnl/siegmann/epublib/domain/Resource;>;"
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getCoverPage()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v5

    invoke-static {v5, v3}, Lnl/siegmann/epublib/domain/Book;->addToContentsResult(Lnl/siegmann/epublib/domain/Resource;Ljava/util/Map;)V

    .line 494
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v5

    invoke-virtual {v5}, Lnl/siegmann/epublib/domain/Spine;->getSpineReferences()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_18
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnl/siegmann/epublib/domain/SpineReference;

    .line 495
    .local v4, "spineReference":Lnl/siegmann/epublib/domain/SpineReference;
    invoke-virtual {v4}, Lnl/siegmann/epublib/domain/SpineReference;->getResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v5

    invoke-static {v5, v3}, Lnl/siegmann/epublib/domain/Book;->addToContentsResult(Lnl/siegmann/epublib/domain/Resource;Ljava/util/Map;)V

    goto :goto_18

    .line 498
    .end local v4    # "spineReference":Lnl/siegmann/epublib/domain/SpineReference;
    :cond_2c
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getTableOfContents()Lnl/siegmann/epublib/domain/TableOfContents;

    move-result-object v5

    invoke-virtual {v5}, Lnl/siegmann/epublib/domain/TableOfContents;->getAllUniqueResources()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_38
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_48

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnl/siegmann/epublib/domain/Resource;

    .line 499
    .local v2, "resource":Lnl/siegmann/epublib/domain/Resource;
    invoke-static {v2, v3}, Lnl/siegmann/epublib/domain/Book;->addToContentsResult(Lnl/siegmann/epublib/domain/Resource;Ljava/util/Map;)V

    goto :goto_38

    .line 502
    .end local v2    # "resource":Lnl/siegmann/epublib/domain/Resource;
    :cond_48
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getGuide()Lnl/siegmann/epublib/domain/Guide;

    move-result-object v5

    invoke-virtual {v5}, Lnl/siegmann/epublib/domain/Guide;->getReferences()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_54
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_68

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnl/siegmann/epublib/domain/GuideReference;

    .line 503
    .local v0, "guideReference":Lnl/siegmann/epublib/domain/GuideReference;
    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/GuideReference;->getResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v5

    invoke-static {v5, v3}, Lnl/siegmann/epublib/domain/Book;->addToContentsResult(Lnl/siegmann/epublib/domain/Resource;Ljava/util/Map;)V

    goto :goto_54

    .line 506
    .end local v0    # "guideReference":Lnl/siegmann/epublib/domain/GuideReference;
    :cond_68
    new-instance v5, Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v5
.end method

.method public getCoverImage()Lnl/siegmann/epublib/domain/Resource;
    .registers 2

    .prologue
    .line 454
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Book;->coverImage:Lnl/siegmann/epublib/domain/Resource;

    return-object v0
.end method

.method public getCoverPage()Lnl/siegmann/epublib/domain/Resource;
    .registers 4

    .prologue
    .line 420
    iget-object v1, p0, Lnl/siegmann/epublib/domain/Book;->guide:Lnl/siegmann/epublib/domain/Guide;

    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Guide;->getCoverPage()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    .line 421
    .local v0, "coverPage":Lnl/siegmann/epublib/domain/Resource;
    if-nez v0, :cond_f

    .line 422
    iget-object v1, p0, Lnl/siegmann/epublib/domain/Book;->spine:Lnl/siegmann/epublib/domain/Spine;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lnl/siegmann/epublib/domain/Spine;->getResource(I)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    .line 424
    :cond_f
    return-object v0
.end method

.method public getGuide()Lnl/siegmann/epublib/domain/Guide;
    .registers 2

    .prologue
    .line 473
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Book;->guide:Lnl/siegmann/epublib/domain/Guide;

    return-object v0
.end method

.method public getMetadata()Lnl/siegmann/epublib/domain/Metadata;
    .registers 2

    .prologue
    .line 358
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Book;->metadata:Lnl/siegmann/epublib/domain/Metadata;

    return-object v0
.end method

.method public getNcxResource()Lnl/siegmann/epublib/domain/Resource;
    .registers 2

    .prologue
    .line 528
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Book;->ncxResource:Lnl/siegmann/epublib/domain/Resource;

    return-object v0
.end method

.method public getOpfResource()Lnl/siegmann/epublib/domain/Resource;
    .registers 2

    .prologue
    .line 516
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Book;->opfResource:Lnl/siegmann/epublib/domain/Resource;

    return-object v0
.end method

.method public getResources()Lnl/siegmann/epublib/domain/Resources;
    .registers 2

    .prologue
    .line 380
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Book;->resources:Lnl/siegmann/epublib/domain/Resources;

    return-object v0
.end method

.method public getSpine()Lnl/siegmann/epublib/domain/Spine;
    .registers 2

    .prologue
    .line 390
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Book;->spine:Lnl/siegmann/epublib/domain/Spine;

    return-object v0
.end method

.method public getTableOfContents()Lnl/siegmann/epublib/domain/TableOfContents;
    .registers 2

    .prologue
    .line 405
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Book;->tableOfContents:Lnl/siegmann/epublib/domain/TableOfContents;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 444
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getMetadata()Lnl/siegmann/epublib/domain/Metadata;

    move-result-object v0

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Metadata;->getFirstTitle()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setCoverImage(Lnl/siegmann/epublib/domain/Resource;)V
    .registers 4
    .param p1, "coverImage"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 458
    if-nez p1, :cond_3

    .line 465
    :goto_2
    return-void

    .line 461
    :cond_3
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Book;->resources:Lnl/siegmann/epublib/domain/Resources;

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnl/siegmann/epublib/domain/Resources;->containsByHref(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_14

    .line 462
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Book;->resources:Lnl/siegmann/epublib/domain/Resources;

    invoke-virtual {v0, p1}, Lnl/siegmann/epublib/domain/Resources;->add(Lnl/siegmann/epublib/domain/Resource;)Lnl/siegmann/epublib/domain/Resource;

    .line 464
    :cond_14
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Book;->coverImage:Lnl/siegmann/epublib/domain/Resource;

    goto :goto_2
.end method

.method public setCoverPage(Lnl/siegmann/epublib/domain/Resource;)V
    .registers 4
    .param p1, "coverPage"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 429
    if-nez p1, :cond_3

    .line 436
    :goto_2
    return-void

    .line 432
    :cond_3
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Book;->resources:Lnl/siegmann/epublib/domain/Resources;

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnl/siegmann/epublib/domain/Resources;->containsByHref(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_14

    .line 433
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Book;->resources:Lnl/siegmann/epublib/domain/Resources;

    invoke-virtual {v0, p1}, Lnl/siegmann/epublib/domain/Resources;->add(Lnl/siegmann/epublib/domain/Resource;)Lnl/siegmann/epublib/domain/Resource;

    .line 435
    :cond_14
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Book;->guide:Lnl/siegmann/epublib/domain/Guide;

    invoke-virtual {v0, p1}, Lnl/siegmann/epublib/domain/Guide;->setCoverPage(Lnl/siegmann/epublib/domain/Resource;)V

    goto :goto_2
.end method

.method public setMetadata(Lnl/siegmann/epublib/domain/Metadata;)V
    .registers 2
    .param p1, "metadata"    # Lnl/siegmann/epublib/domain/Metadata;

    .prologue
    .line 361
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Book;->metadata:Lnl/siegmann/epublib/domain/Metadata;

    .line 362
    return-void
.end method

.method public setNcxResource(Lnl/siegmann/epublib/domain/Resource;)V
    .registers 2
    .param p1, "ncxResource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 524
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Book;->ncxResource:Lnl/siegmann/epublib/domain/Resource;

    .line 525
    return-void
.end method

.method public setOpfResource(Lnl/siegmann/epublib/domain/Resource;)V
    .registers 2
    .param p1, "opfResource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 520
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Book;->opfResource:Lnl/siegmann/epublib/domain/Resource;

    .line 521
    return-void
.end method

.method public setResources(Lnl/siegmann/epublib/domain/Resources;)V
    .registers 2
    .param p1, "resources"    # Lnl/siegmann/epublib/domain/Resources;

    .prologue
    .line 366
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Book;->resources:Lnl/siegmann/epublib/domain/Resources;

    .line 367
    return-void
.end method

.method public setSpine(Lnl/siegmann/epublib/domain/Spine;)V
    .registers 2
    .param p1, "spine"    # Lnl/siegmann/epublib/domain/Spine;

    .prologue
    .line 395
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Book;->spine:Lnl/siegmann/epublib/domain/Spine;

    .line 396
    return-void
.end method

.method public setTableOfContents(Lnl/siegmann/epublib/domain/TableOfContents;)V
    .registers 2
    .param p1, "tableOfContents"    # Lnl/siegmann/epublib/domain/TableOfContents;

    .prologue
    .line 410
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Book;->tableOfContents:Lnl/siegmann/epublib/domain/TableOfContents;

    .line 411
    return-void
.end method
