.class Lcom/drew/tools/ProcessAllImagesInFolderUtility$UnknownTagHandler;
.super Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandlerBase;
.source "ProcessAllImagesInFolderUtility.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/drew/tools/ProcessAllImagesInFolderUtility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "UnknownTagHandler"
.end annotation


# instance fields
.field private _occurrenceCountByTagByDirectory:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 560
    invoke-direct {p0}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandlerBase;-><init>()V

    .line 562
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$UnknownTagHandler;->_occurrenceCountByTagByDirectory:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public onExtractionSuccess(Ljava/io/File;Lcom/drew/metadata/Metadata;Ljava/lang/String;Ljava/io/PrintStream;)V
    .registers 14
    .param p1, "file"    # Ljava/io/File;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "relativePath"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p4, "log"    # Ljava/io/PrintStream;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    const/4 v8, 0x0

    .line 567
    invoke-super {p0, p1, p2, p3, p4}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandlerBase;->onExtractionSuccess(Ljava/io/File;Lcom/drew/metadata/Metadata;Ljava/lang/String;Ljava/io/PrintStream;)V

    .line 569
    invoke-virtual {p2}, Lcom/drew/metadata/Metadata;->getDirectories()Ljava/lang/Iterable;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_87

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/drew/metadata/Directory;

    .line 570
    .local v1, "directory":Lcom/drew/metadata/Directory;
    invoke-virtual {v1}, Lcom/drew/metadata/Directory;->getTags()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_20
    :goto_20
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/drew/metadata/Tag;

    .line 573
    .local v5, "tag":Lcom/drew/metadata/Tag;
    invoke-virtual {v5}, Lcom/drew/metadata/Tag;->hasTagName()Z

    move-result v6

    if-nez v6, :cond_20

    .line 576
    iget-object v6, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$UnknownTagHandler;->_occurrenceCountByTagByDirectory:Ljava/util/HashMap;

    invoke-virtual {v1}, Lcom/drew/metadata/Directory;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    .line 577
    .local v4, "occurrenceCountByTag":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    if-nez v4, :cond_4e

    .line 578
    new-instance v4, Ljava/util/HashMap;

    .end local v4    # "occurrenceCountByTag":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 579
    .restart local v4    # "occurrenceCountByTag":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    iget-object v6, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$UnknownTagHandler;->_occurrenceCountByTagByDirectory:Ljava/util/HashMap;

    invoke-virtual {v1}, Lcom/drew/metadata/Directory;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 582
    :cond_4e
    invoke-virtual {v5}, Lcom/drew/metadata/Tag;->getTagType()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 583
    .local v0, "count":Ljava/lang/Integer;
    if-nez v0, :cond_71

    .line 584
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 585
    invoke-virtual {v5}, Lcom/drew/metadata/Tag;->getTagType()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 588
    :cond_71
    invoke-virtual {v5}, Lcom/drew/metadata/Tag;->getTagType()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_20

    .line 591
    .end local v0    # "count":Ljava/lang/Integer;
    .end local v1    # "directory":Lcom/drew/metadata/Directory;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "occurrenceCountByTag":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local v5    # "tag":Lcom/drew/metadata/Tag;
    :cond_87
    return-void
.end method

.method public onScanCompleted(Ljava/io/PrintStream;)V
    .registers 13
    .param p1, "log"    # Ljava/io/PrintStream;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 596
    invoke-super {p0, p1}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandlerBase;->onScanCompleted(Ljava/io/PrintStream;)V

    .line 598
    iget-object v8, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$UnknownTagHandler;->_occurrenceCountByTagByDirectory:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_64

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 599
    .local v5, "pair1":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/Integer;>;>;"
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 600
    .local v2, "directoryName":Ljava/lang/String;
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-direct {v1, v8}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 601
    .local v1, "counts":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Integer;>;>;"
    new-instance v8, Lcom/drew/tools/ProcessAllImagesInFolderUtility$UnknownTagHandler$1;

    invoke-direct {v8, p0}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$UnknownTagHandler$1;-><init>(Lcom/drew/tools/ProcessAllImagesInFolderUtility$UnknownTagHandler;)V

    invoke-static {v1, v8}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 608
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_3a
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_d

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 609
    .local v6, "pair2":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    .line 610
    .local v7, "tagType":Ljava/lang/Integer;
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 611
    .local v0, "count":Ljava/lang/Integer;
    const-string v8, "%s, 0x%04X, %d\n"

    const/4 v9, 0x3

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v2, v9, v10

    const/4 v10, 0x1

    aput-object v7, v9, v10

    const/4 v10, 0x2

    aput-object v0, v9, v10

    invoke-virtual {p1, v8, v9}, Ljava/io/PrintStream;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    goto :goto_3a

    .line 614
    .end local v0    # "count":Ljava/lang/Integer;
    .end local v1    # "counts":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Integer;>;>;"
    .end local v2    # "directoryName":Ljava/lang/String;
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v5    # "pair1":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/Integer;>;>;"
    .end local v6    # "pair2":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local v7    # "tagType":Ljava/lang/Integer;
    :cond_64
    return-void
.end method
