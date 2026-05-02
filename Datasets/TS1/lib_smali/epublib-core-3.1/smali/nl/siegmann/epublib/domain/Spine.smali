.class public Lnl/siegmann/epublib/domain/Spine;
.super Ljava/lang/Object;
.source "Spine.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x35d3249c901ba23eL


# instance fields
.field private spineReferences:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/SpineReference;",
            ">;"
        }
    .end annotation
.end field

.field private tocResource:Lnl/siegmann/epublib/domain/Resource;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, v0}, Lnl/siegmann/epublib/domain/Spine;-><init>(Ljava/util/List;)V

    .line 31
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/SpineReference;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p1, "spineReferences":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/SpineReference;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Spine;->spineReferences:Ljava/util/List;

    .line 44
    return-void
.end method

.method public constructor <init>(Lnl/siegmann/epublib/domain/TableOfContents;)V
    .registers 3
    .param p1, "tableOfContents"    # Lnl/siegmann/epublib/domain/TableOfContents;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/TableOfContents;->getAllUniqueResources()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lnl/siegmann/epublib/domain/Spine;->createSpineReferences(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lnl/siegmann/epublib/domain/Spine;->spineReferences:Ljava/util/List;

    .line 40
    return-void
.end method

.method public static createSpineReferences(Ljava/util/Collection;)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lnl/siegmann/epublib/domain/Resource;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/SpineReference;",
            ">;"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "resources":Ljava/util/Collection;, "Ljava/util/Collection<Lnl/siegmann/epublib/domain/Resource;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 48
    .local v2, "result":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/SpineReference;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/siegmann/epublib/domain/Resource;

    .line 49
    .local v1, "resource":Lnl/siegmann/epublib/domain/Resource;
    new-instance v3, Lnl/siegmann/epublib/domain/SpineReference;

    invoke-direct {v3, v1}, Lnl/siegmann/epublib/domain/SpineReference;-><init>(Lnl/siegmann/epublib/domain/Resource;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 51
    .end local v1    # "resource":Lnl/siegmann/epublib/domain/Resource;
    :cond_22
    return-object v2
.end method


# virtual methods
.method public addResource(Lnl/siegmann/epublib/domain/Resource;)Lnl/siegmann/epublib/domain/SpineReference;
    .registers 3
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 118
    new-instance v0, Lnl/siegmann/epublib/domain/SpineReference;

    invoke-direct {v0, p1}, Lnl/siegmann/epublib/domain/SpineReference;-><init>(Lnl/siegmann/epublib/domain/Resource;)V

    invoke-virtual {p0, v0}, Lnl/siegmann/epublib/domain/Spine;->addSpineReference(Lnl/siegmann/epublib/domain/SpineReference;)Lnl/siegmann/epublib/domain/SpineReference;

    move-result-object v0

    return-object v0
.end method

.method public addSpineReference(Lnl/siegmann/epublib/domain/SpineReference;)Lnl/siegmann/epublib/domain/SpineReference;
    .registers 3
    .param p1, "spineReference"    # Lnl/siegmann/epublib/domain/SpineReference;

    .prologue
    .line 104
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Spine;->spineReferences:Ljava/util/List;

    if-nez v0, :cond_b

    .line 105
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lnl/siegmann/epublib/domain/Spine;->spineReferences:Ljava/util/List;

    .line 107
    :cond_b
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Spine;->spineReferences:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    return-object p1
.end method

.method public findFirstResourceById(Ljava/lang/String;)I
    .registers 6
    .param p1, "resourceId"    # Ljava/lang/String;

    .prologue
    const/4 v2, -0x1

    .line 84
    invoke-static {p1}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_9

    move v0, v2

    .line 94
    :cond_8
    :goto_8
    return v0

    .line 88
    :cond_9
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    iget-object v3, p0, Lnl/siegmann/epublib/domain/Spine;->spineReferences:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_27

    .line 89
    iget-object v3, p0, Lnl/siegmann/epublib/domain/Spine;->spineReferences:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/siegmann/epublib/domain/SpineReference;

    .line 90
    .local v1, "spineReference":Lnl/siegmann/epublib/domain/SpineReference;
    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/SpineReference;->getResourceId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    .line 88
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .end local v1    # "spineReference":Lnl/siegmann/epublib/domain/SpineReference;
    :cond_27
    move v0, v2

    .line 94
    goto :goto_8
.end method

.method public getResource(I)Lnl/siegmann/epublib/domain/Resource;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 69
    if-ltz p1, :cond_a

    iget-object v0, p0, Lnl/siegmann/epublib/domain/Spine;->spineReferences:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lt p1, v0, :cond_c

    .line 70
    :cond_a
    const/4 v0, 0x0

    .line 72
    :goto_b
    return-object v0

    :cond_c
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Spine;->spineReferences:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnl/siegmann/epublib/domain/SpineReference;

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/SpineReference;->getResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    goto :goto_b
.end method

.method public getResourceIndex(Ljava/lang/String;)I
    .registers 6
    .param p1, "resourceHref"    # Ljava/lang/String;

    .prologue
    .line 172
    const/4 v1, -0x1

    .line 173
    .local v1, "result":I
    invoke-static {p1}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_9

    move v2, v1

    .line 182
    .end local v1    # "result":I
    .local v2, "result":I
    :goto_8
    return v2

    .line 176
    .end local v2    # "result":I
    .restart local v1    # "result":I
    :cond_9
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    iget-object v3, p0, Lnl/siegmann/epublib/domain/Spine;->spineReferences:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_29

    .line 177
    iget-object v3, p0, Lnl/siegmann/epublib/domain/Spine;->spineReferences:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnl/siegmann/epublib/domain/SpineReference;

    invoke-virtual {v3}, Lnl/siegmann/epublib/domain/SpineReference;->getResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v3

    invoke-virtual {v3}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 178
    move v1, v0

    :cond_29
    move v2, v1

    .line 182
    .end local v1    # "result":I
    .restart local v2    # "result":I
    goto :goto_8

    .line 176
    .end local v2    # "result":I
    .restart local v1    # "result":I
    :cond_2b
    add-int/lit8 v0, v0, 0x1

    goto :goto_a
.end method

.method public getResourceIndex(Lnl/siegmann/epublib/domain/Resource;)I
    .registers 3
    .param p1, "currentResource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 159
    if-nez p1, :cond_4

    .line 160
    const/4 v0, -0x1

    .line 162
    :goto_3
    return v0

    :cond_4
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnl/siegmann/epublib/domain/Spine;->getResourceIndex(Ljava/lang/String;)I

    move-result v0

    goto :goto_3
.end method

.method public getSpineReferences()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/SpineReference;",
            ">;"
        }
    .end annotation

    .prologue
    .line 55
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Spine;->spineReferences:Ljava/util/List;

    return-object v0
.end method

.method public getTocResource()Lnl/siegmann/epublib/domain/Resource;
    .registers 2

    .prologue
    .line 148
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Spine;->tocResource:Lnl/siegmann/epublib/domain/Resource;

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 186
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Spine;->spineReferences:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public setSpineReferences(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/SpineReference;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 58
    .local p1, "spineReferences":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/SpineReference;>;"
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Spine;->spineReferences:Ljava/util/List;

    .line 59
    return-void
.end method

.method public setTocResource(Lnl/siegmann/epublib/domain/Resource;)V
    .registers 2
    .param p1, "tocResource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 138
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Spine;->tocResource:Lnl/siegmann/epublib/domain/Resource;

    .line 139
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Spine;->spineReferences:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
