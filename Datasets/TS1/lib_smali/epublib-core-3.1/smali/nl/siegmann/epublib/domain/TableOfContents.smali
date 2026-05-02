.class public Lnl/siegmann/epublib/domain/TableOfContents;
.super Ljava/lang/Object;
.source "TableOfContents.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final DEFAULT_PATH_SEPARATOR:Ljava/lang/String; = "/"

.field private static final serialVersionUID:J = -0x2badc7a83b5db650L


# instance fields
.field private tocReferences:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/TOCReference;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, v0}, Lnl/siegmann/epublib/domain/TableOfContents;-><init>(Ljava/util/List;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/TOCReference;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p1, "tocReferences":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/TOCReference;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lnl/siegmann/epublib/domain/TableOfContents;->tocReferences:Ljava/util/List;

    .line 41
    return-void
.end method

.method private calculateDepth(Ljava/util/List;I)I
    .registers 9
    .param p2, "currentDepth"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/TOCReference;",
            ">;I)I"
        }
    .end annotation

    .prologue
    .line 240
    .local p1, "tocReferences":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/TOCReference;>;"
    const/4 v2, 0x0

    .line 241
    .local v2, "maxChildDepth":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_5
    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnl/siegmann/epublib/domain/TOCReference;

    .line 242
    .local v3, "tocReference":Lnl/siegmann/epublib/domain/TOCReference;
    invoke-virtual {v3}, Lnl/siegmann/epublib/domain/TOCReference;->getChildren()Ljava/util/List;

    move-result-object v4

    const/4 v5, 0x1

    invoke-direct {p0, v4, v5}, Lnl/siegmann/epublib/domain/TableOfContents;->calculateDepth(Ljava/util/List;I)I

    move-result v0

    .line 243
    .local v0, "childDepth":I
    if-le v0, v2, :cond_5

    .line 244
    move v2, v0

    goto :goto_5

    .line 247
    .end local v0    # "childDepth":I
    .end local v3    # "tocReference":Lnl/siegmann/epublib/domain/TOCReference;
    :cond_1e
    add-int v4, p2, v2

    return v4
.end method

.method private createSectionTitle([IIILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p1, "pathElements"    # [I
    .param p2, "pathPos"    # I
    .param p3, "lastPos"    # I
    .param p4, "sectionPrefix"    # Ljava/lang/String;
    .param p5, "sectionNumberSeparator"    # Ljava/lang/String;

    .prologue
    .line 172
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 173
    .local v1, "title":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    if-ge v0, p2, :cond_17

    .line 174
    if-lez v0, :cond_d

    .line 175
    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    :cond_d
    aget v2, p1, v0

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 173
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 179
    :cond_17
    if-lez p2, :cond_1c

    .line 180
    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    :cond_1c
    add-int/lit8 v2, p3, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 183
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static findTocReferenceByTitle(Ljava/lang/String;Ljava/util/List;)Lnl/siegmann/epublib/domain/TOCReference;
    .registers 5
    .param p0, "title"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/TOCReference;",
            ">;)",
            "Lnl/siegmann/epublib/domain/TOCReference;"
        }
    .end annotation

    .prologue
    .line 79
    .local p1, "tocReferences":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/TOCReference;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/siegmann/epublib/domain/TOCReference;

    .line 80
    .local v1, "tocReference":Lnl/siegmann/epublib/domain/TOCReference;
    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/TOCReference;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 84
    .end local v1    # "tocReference":Lnl/siegmann/epublib/domain/TOCReference;
    :goto_1a
    return-object v1

    :cond_1b
    const/4 v1, 0x0

    goto :goto_1a
.end method

.method private static getAllUniqueResources(Ljava/util/Set;Ljava/util/List;Ljava/util/List;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/Resource;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/TOCReference;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 208
    .local p0, "uniqueHrefs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local p1, "result":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/Resource;>;"
    .local p2, "tocReferences":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/TOCReference;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_32

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnl/siegmann/epublib/domain/TOCReference;

    .line 209
    .local v2, "tocReference":Lnl/siegmann/epublib/domain/TOCReference;
    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/TOCReference;->getResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v1

    .line 210
    .local v1, "resource":Lnl/siegmann/epublib/domain/Resource;
    if-eqz v1, :cond_2a

    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2a

    .line 211
    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 212
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 214
    :cond_2a
    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/TOCReference;->getChildren()Ljava/util/List;

    move-result-object v3

    invoke-static {p0, p1, v3}, Lnl/siegmann/epublib/domain/TableOfContents;->getAllUniqueResources(Ljava/util/Set;Ljava/util/List;Ljava/util/List;)V

    goto :goto_4

    .line 216
    .end local v1    # "resource":Lnl/siegmann/epublib/domain/Resource;
    .end local v2    # "tocReference":Lnl/siegmann/epublib/domain/TOCReference;
    :cond_32
    return-void
.end method

.method private static getTotalSize(Ljava/util/Collection;)I
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lnl/siegmann/epublib/domain/TOCReference;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 228
    .local p0, "tocReferences":Ljava/util/Collection;, "Ljava/util/Collection<Lnl/siegmann/epublib/domain/TOCReference;>;"
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v1

    .line 229
    .local v1, "result":I
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnl/siegmann/epublib/domain/TOCReference;

    .line 230
    .local v2, "tocReference":Lnl/siegmann/epublib/domain/TOCReference;
    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/TOCReference;->getChildren()Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Lnl/siegmann/epublib/domain/TableOfContents;->getTotalSize(Ljava/util/Collection;)I

    move-result v3

    add-int/2addr v1, v3

    goto :goto_8

    .line 232
    .end local v2    # "tocReference":Lnl/siegmann/epublib/domain/TOCReference;
    :cond_1e
    return v1
.end method

.method private paddTOCReferences(Ljava/util/List;[IILjava/lang/String;Ljava/lang/String;)V
    .registers 13
    .param p2, "pathElements"    # [I
    .param p3, "pathPos"    # I
    .param p4, "sectionPrefix"    # Ljava/lang/String;
    .param p5, "sectionNumberSeparator"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/TOCReference;",
            ">;[II",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 163
    .local p1, "currentTocReferences":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/TOCReference;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    .local v3, "i":I
    :goto_4
    aget v0, p2, p3

    if-gt v3, v0, :cond_1d

    move-object v0, p0

    move-object v1, p2

    move v2, p3

    move-object v4, p4

    move-object v5, p5

    .line 164
    invoke-direct/range {v0 .. v5}, Lnl/siegmann/epublib/domain/TableOfContents;->createSectionTitle([IIILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 166
    .local v6, "sectionTitle":Ljava/lang/String;
    new-instance v0, Lnl/siegmann/epublib/domain/TOCReference;

    const/4 v1, 0x0

    invoke-direct {v0, v6, v1}, Lnl/siegmann/epublib/domain/TOCReference;-><init>(Ljava/lang/String;Lnl/siegmann/epublib/domain/Resource;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 168
    .end local v6    # "sectionTitle":Ljava/lang/String;
    :cond_1d
    return-void
.end method


# virtual methods
.method public addSection(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;)Lnl/siegmann/epublib/domain/TOCReference;
    .registers 4
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 55
    const-string v0, "/"

    invoke-virtual {p0, p1, p2, v0}, Lnl/siegmann/epublib/domain/TableOfContents;->addSection(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;Ljava/lang/String;)Lnl/siegmann/epublib/domain/TOCReference;

    move-result-object v0

    return-object v0
.end method

.method public addSection(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;Ljava/lang/String;)Lnl/siegmann/epublib/domain/TOCReference;
    .registers 6
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "pathSeparator"    # Ljava/lang/String;

    .prologue
    .line 67
    invoke-virtual {p2, p3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 68
    .local v0, "pathElements":[Ljava/lang/String;
    invoke-virtual {p0, p1, v0}, Lnl/siegmann/epublib/domain/TableOfContents;->addSection(Lnl/siegmann/epublib/domain/Resource;[Ljava/lang/String;)Lnl/siegmann/epublib/domain/TOCReference;

    move-result-object v1

    return-object v1
.end method

.method public addSection(Lnl/siegmann/epublib/domain/Resource;[ILjava/lang/String;Ljava/lang/String;)Lnl/siegmann/epublib/domain/TOCReference;
    .registers 13
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p2, "pathElements"    # [I
    .param p3, "sectionTitlePrefix"    # Ljava/lang/String;
    .param p4, "sectionNumberSeparator"    # Ljava/lang/String;

    .prologue
    .line 139
    if-eqz p2, :cond_5

    array-length v0, p2

    if-nez v0, :cond_7

    .line 140
    :cond_5
    const/4 v7, 0x0

    .line 158
    :goto_6
    return-object v7

    .line 142
    :cond_7
    const/4 v7, 0x0

    .line 143
    .local v7, "result":Lnl/siegmann/epublib/domain/TOCReference;
    iget-object v1, p0, Lnl/siegmann/epublib/domain/TableOfContents;->tocReferences:Ljava/util/List;

    .line 144
    .local v1, "currentTocReferences":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/TOCReference;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_b
    array-length v0, p2

    if-ge v3, v0, :cond_38

    .line 145
    aget v6, p2, v3

    .line 146
    .local v6, "currentIndex":I
    if-lez v6, :cond_36

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ge v6, v0, :cond_36

    .line 147
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    .end local v7    # "result":Lnl/siegmann/epublib/domain/TOCReference;
    check-cast v7, Lnl/siegmann/epublib/domain/TOCReference;

    .line 151
    .restart local v7    # "result":Lnl/siegmann/epublib/domain/TOCReference;
    :goto_20
    if-nez v7, :cond_2f

    move-object v0, p0

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    .line 152
    invoke-direct/range {v0 .. v5}, Lnl/siegmann/epublib/domain/TableOfContents;->paddTOCReferences(Ljava/util/List;[IILjava/lang/String;Ljava/lang/String;)V

    .line 153
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    .end local v7    # "result":Lnl/siegmann/epublib/domain/TOCReference;
    check-cast v7, Lnl/siegmann/epublib/domain/TOCReference;

    .line 155
    .restart local v7    # "result":Lnl/siegmann/epublib/domain/TOCReference;
    :cond_2f
    invoke-virtual {v7}, Lnl/siegmann/epublib/domain/TOCReference;->getChildren()Ljava/util/List;

    move-result-object v1

    .line 144
    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    .line 149
    :cond_36
    const/4 v7, 0x0

    goto :goto_20

    .line 157
    .end local v6    # "currentIndex":I
    :cond_38
    invoke-virtual {v7, p1}, Lnl/siegmann/epublib/domain/TOCReference;->setResource(Lnl/siegmann/epublib/domain/Resource;)V

    goto :goto_6
.end method

.method public addSection(Lnl/siegmann/epublib/domain/Resource;[Ljava/lang/String;)Lnl/siegmann/epublib/domain/TOCReference;
    .registers 9
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p2, "pathElements"    # [Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 104
    if-eqz p2, :cond_6

    array-length v5, p2

    if-nez v5, :cond_8

    :cond_6
    move-object v3, v4

    .line 119
    :goto_7
    return-object v3

    .line 107
    :cond_8
    const/4 v3, 0x0

    .line 108
    .local v3, "result":Lnl/siegmann/epublib/domain/TOCReference;
    iget-object v1, p0, Lnl/siegmann/epublib/domain/TableOfContents;->tocReferences:Ljava/util/List;

    .line 109
    .local v1, "currentTocReferences":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/TOCReference;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_c
    array-length v5, p2

    if-ge v2, v5, :cond_26

    .line 110
    aget-object v0, p2, v2

    .line 111
    .local v0, "currentTitle":Ljava/lang/String;
    invoke-static {v0, v1}, Lnl/siegmann/epublib/domain/TableOfContents;->findTocReferenceByTitle(Ljava/lang/String;Ljava/util/List;)Lnl/siegmann/epublib/domain/TOCReference;

    move-result-object v3

    .line 112
    if-nez v3, :cond_1f

    .line 113
    new-instance v3, Lnl/siegmann/epublib/domain/TOCReference;

    .end local v3    # "result":Lnl/siegmann/epublib/domain/TOCReference;
    invoke-direct {v3, v0, v4}, Lnl/siegmann/epublib/domain/TOCReference;-><init>(Ljava/lang/String;Lnl/siegmann/epublib/domain/Resource;)V

    .line 114
    .restart local v3    # "result":Lnl/siegmann/epublib/domain/TOCReference;
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    :cond_1f
    invoke-virtual {v3}, Lnl/siegmann/epublib/domain/TOCReference;->getChildren()Ljava/util/List;

    move-result-object v1

    .line 109
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 118
    .end local v0    # "currentTitle":Ljava/lang/String;
    :cond_26
    invoke-virtual {v3, p1}, Lnl/siegmann/epublib/domain/TOCReference;->setResource(Lnl/siegmann/epublib/domain/Resource;)V

    goto :goto_7
.end method

.method public addTOCReference(Lnl/siegmann/epublib/domain/TOCReference;)Lnl/siegmann/epublib/domain/TOCReference;
    .registers 3
    .param p1, "tocReference"    # Lnl/siegmann/epublib/domain/TOCReference;

    .prologue
    .line 187
    iget-object v0, p0, Lnl/siegmann/epublib/domain/TableOfContents;->tocReferences:Ljava/util/List;

    if-nez v0, :cond_b

    .line 188
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lnl/siegmann/epublib/domain/TableOfContents;->tocReferences:Ljava/util/List;

    .line 190
    :cond_b
    iget-object v0, p0, Lnl/siegmann/epublib/domain/TableOfContents;->tocReferences:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    return-object p1
.end method

.method public calculateDepth()I
    .registers 3

    .prologue
    .line 236
    iget-object v0, p0, Lnl/siegmann/epublib/domain/TableOfContents;->tocReferences:Ljava/util/List;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lnl/siegmann/epublib/domain/TableOfContents;->calculateDepth(Ljava/util/List;I)I

    move-result v0

    return v0
.end method

.method public getAllUniqueResources()Ljava/util/List;
    .registers 4
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
    .line 200
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 201
    .local v1, "uniqueHrefs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 202
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/Resource;>;"
    iget-object v2, p0, Lnl/siegmann/epublib/domain/TableOfContents;->tocReferences:Ljava/util/List;

    invoke-static {v1, v0, v2}, Lnl/siegmann/epublib/domain/TableOfContents;->getAllUniqueResources(Ljava/util/Set;Ljava/util/List;Ljava/util/List;)V

    .line 203
    return-object v0
.end method

.method public getTocReferences()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/TOCReference;",
            ">;"
        }
    .end annotation

    .prologue
    .line 44
    iget-object v0, p0, Lnl/siegmann/epublib/domain/TableOfContents;->tocReferences:Ljava/util/List;

    return-object v0
.end method

.method public setTocReferences(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/TOCReference;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p1, "tocReferences":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/TOCReference;>;"
    iput-object p1, p0, Lnl/siegmann/epublib/domain/TableOfContents;->tocReferences:Ljava/util/List;

    .line 49
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 224
    iget-object v0, p0, Lnl/siegmann/epublib/domain/TableOfContents;->tocReferences:Ljava/util/List;

    invoke-static {v0}, Lnl/siegmann/epublib/domain/TableOfContents;->getTotalSize(Ljava/util/Collection;)I

    move-result v0

    return v0
.end method
