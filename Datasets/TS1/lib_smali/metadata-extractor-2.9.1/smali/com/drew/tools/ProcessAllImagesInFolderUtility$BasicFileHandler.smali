.class Lcom/drew/tools/ProcessAllImagesInFolderUtility$BasicFileHandler;
.super Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandlerBase;
.source "ProcessAllImagesInFolderUtility.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/drew/tools/ProcessAllImagesInFolderUtility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "BasicFileHandler"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 621
    invoke-direct {p0}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandlerBase;-><init>()V

    return-void
.end method


# virtual methods
.method public onExtractionSuccess(Ljava/io/File;Lcom/drew/metadata/Metadata;Ljava/lang/String;Ljava/io/PrintStream;)V
    .registers 10
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
    .line 626
    invoke-super {p0, p1, p2, p3, p4}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandlerBase;->onExtractionSuccess(Ljava/io/File;Lcom/drew/metadata/Metadata;Ljava/lang/String;Ljava/io/PrintStream;)V

    .line 629
    invoke-virtual {p2}, Lcom/drew/metadata/Metadata;->getDirectories()Ljava/lang/Iterable;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_35

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/drew/metadata/Directory;

    .line 630
    .local v0, "directory":Lcom/drew/metadata/Directory;
    invoke-virtual {v0}, Lcom/drew/metadata/Directory;->getName()Ljava/lang/String;

    .line 631
    invoke-virtual {v0}, Lcom/drew/metadata/Directory;->getTags()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_22
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/drew/metadata/Tag;

    .line 632
    .local v3, "tag":Lcom/drew/metadata/Tag;
    invoke-virtual {v3}, Lcom/drew/metadata/Tag;->getTagName()Ljava/lang/String;

    .line 633
    invoke-virtual {v3}, Lcom/drew/metadata/Tag;->getDescription()Ljava/lang/String;

    goto :goto_22

    .line 636
    .end local v0    # "directory":Lcom/drew/metadata/Directory;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "tag":Lcom/drew/metadata/Tag;
    :cond_35
    return-void
.end method
