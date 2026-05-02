.class Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;
.super Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandlerBase;
.source "ProcessAllImagesInFolderUtility.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/drew/tools/ProcessAllImagesInFolderUtility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MarkdownTableOutputHandler"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;
    }
.end annotation


# instance fields
.field private final _extensionEquivalence:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final _rowListByExtension:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    .line 460
    invoke-direct {p0}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandlerBase;-><init>()V

    .line 409
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;->_extensionEquivalence:Ljava/util/Map;

    .line 410
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;->_rowListByExtension:Ljava/util/Map;

    .line 461
    iget-object v0, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;->_extensionEquivalence:Ljava/util/Map;

    const-string v1, "jpeg"

    const-string v2, "jpg"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 462
    return-void
.end method

.method private writeOutput(Ljava/io/PrintStream;)V
    .registers 13
    .param p1, "stream"    # Ljava/io/PrintStream;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v10, 0xa

    .line 516
    new-instance v5, Ljava/io/OutputStreamWriter;

    invoke-direct {v5, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 517
    .local v5, "writer":Ljava/io/Writer;
    const-string v6, "# Image Database Summary\n\n"

    invoke-virtual {v5, v6}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 519
    iget-object v6, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;->_rowListByExtension:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_16
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_10f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 520
    .local v0, "extension":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "## "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " Files\n\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 522
    const-string v6, "File|Manufacturer|Model|Dir Count|Exif?|Makernote|Thumbnail|All Data\n"

    invoke-virtual {v5, v6}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 523
    const-string v6, "----|------------|-----|---------|-----|---------|---------|--------\n"

    invoke-virtual {v5, v6}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 524
    iget-object v6, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;->_rowListByExtension:Ljava/util/Map;

    invoke-interface {v6, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 527
    .local v4, "rows":Ljava/util/List;, "Ljava/util/List<Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;>;"
    new-instance v6, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$1;

    invoke-direct {v6, p0}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$1;-><init>(Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;)V

    invoke-static {v4, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 535
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_60
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_10a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;

    .line 536
    .local v3, "row":Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;
    const-string v7, "[%s](https://raw.githubusercontent.com/drewnoakes/metadata-extractor-images/master/%s/%s)|%s|%s|%d|%s|%s|%s|[metadata](https://raw.githubusercontent.com/drewnoakes/metadata-extractor-images/master/%s/metadata/%s.txt)\n"

    const/16 v6, 0xb

    new-array v8, v6, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v9, v3, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->file:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v6

    const/4 v6, 0x1

    iget-object v9, v3, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->relativePath:Ljava/lang/String;

    aput-object v9, v8, v6

    const/4 v6, 0x2

    iget-object v9, v3, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->file:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/drew/lang/StringUtil;->urlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v6

    const/4 v9, 0x3

    # getter for: Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->manufacturer:Ljava/lang/String;
    invoke-static {v3}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->access$000(Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_f1

    const-string v6, ""

    :goto_96
    aput-object v6, v8, v9

    const/4 v9, 0x4

    # getter for: Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->model:Ljava/lang/String;
    invoke-static {v3}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->access$100(Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_f6

    const-string v6, ""

    :goto_a1
    aput-object v6, v8, v9

    const/4 v6, 0x5

    iget-object v9, v3, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->metadata:Lcom/drew/metadata/Metadata;

    invoke-virtual {v9}, Lcom/drew/metadata/Metadata;->getDirectoryCount()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v6

    const/4 v9, 0x6

    # getter for: Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->exifVersion:Ljava/lang/String;
    invoke-static {v3}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->access$200(Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_fb

    const-string v6, ""

    :goto_b9
    aput-object v6, v8, v9

    const/4 v9, 0x7

    # getter for: Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->makernote:Ljava/lang/String;
    invoke-static {v3}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->access$300(Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_100

    const-string v6, ""

    :goto_c4
    aput-object v6, v8, v9

    const/16 v9, 0x8

    # getter for: Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->thumbnail:Ljava/lang/String;
    invoke-static {v3}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->access$400(Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_105

    const-string v6, ""

    :goto_d0
    aput-object v6, v8, v9

    const/16 v6, 0x9

    iget-object v9, v3, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->relativePath:Ljava/lang/String;

    aput-object v9, v8, v6

    iget-object v6, v3, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->file:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/drew/lang/StringUtil;->urlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v8, v10

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto/16 :goto_60

    :cond_f1
    # getter for: Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->manufacturer:Ljava/lang/String;
    invoke-static {v3}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->access$000(Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;)Ljava/lang/String;

    move-result-object v6

    goto :goto_96

    :cond_f6
    # getter for: Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->model:Ljava/lang/String;
    invoke-static {v3}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->access$100(Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;)Ljava/lang/String;

    move-result-object v6

    goto :goto_a1

    :cond_fb
    # getter for: Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->exifVersion:Ljava/lang/String;
    invoke-static {v3}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->access$200(Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;)Ljava/lang/String;

    move-result-object v6

    goto :goto_b9

    :cond_100
    # getter for: Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->makernote:Ljava/lang/String;
    invoke-static {v3}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->access$300(Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;)Ljava/lang/String;

    move-result-object v6

    goto :goto_c4

    :cond_105
    # getter for: Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->thumbnail:Ljava/lang/String;
    invoke-static {v3}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->access$400(Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;)Ljava/lang/String;

    move-result-object v6

    goto :goto_d0

    .line 551
    .end local v3    # "row":Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;
    :cond_10a
    invoke-virtual {v5, v10}, Ljava/io/Writer;->write(I)V

    goto/16 :goto_16

    .line 553
    .end local v0    # "extension":Ljava/lang/String;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v4    # "rows":Ljava/util/List;, "Ljava/util/List<Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;>;"
    :cond_10f
    invoke-virtual {v5}, Ljava/io/Writer;->flush()V

    .line 554
    return-void
.end method


# virtual methods
.method public onExtractionSuccess(Ljava/io/File;Lcom/drew/metadata/Metadata;Ljava/lang/String;Ljava/io/PrintStream;)V
    .registers 8
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
    .line 467
    invoke-super {p0, p1, p2, p3, p4}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandlerBase;->onExtractionSuccess(Ljava/io/File;Lcom/drew/metadata/Metadata;Ljava/lang/String;Ljava/io/PrintStream;)V

    .line 469
    invoke-virtual {p0, p1}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;->getExtension(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 471
    .local v0, "extension":Ljava/lang/String;
    if-nez v0, :cond_a

    .line 486
    :goto_9
    return-void

    .line 476
    :cond_a
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 477
    iget-object v2, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;->_extensionEquivalence:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 478
    iget-object v2, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;->_extensionEquivalence:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "extension":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 480
    .restart local v0    # "extension":Ljava/lang/String;
    :cond_1e
    iget-object v2, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;->_rowListByExtension:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 481
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;>;"
    if-nez v1, :cond_32

    .line 482
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 483
    .restart local v1    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;>;"
    iget-object v2, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;->_rowListByExtension:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 485
    :cond_32
    new-instance v2, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;

    invoke-direct {v2, p0, p1, p2, p3}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;-><init>(Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;Ljava/io/File;Lcom/drew/metadata/Metadata;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9
.end method

.method public onScanCompleted(Ljava/io/PrintStream;)V
    .registers 9
    .param p1, "log"    # Ljava/io/PrintStream;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 491
    invoke-super {p0, p1}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandlerBase;->onScanCompleted(Ljava/io/PrintStream;)V

    .line 493
    const/4 v1, 0x0

    .line 494
    .local v1, "outputStream":Ljava/io/OutputStream;
    const/4 v3, 0x0

    .line 496
    .local v3, "stream":Ljava/io/PrintStream;
    :try_start_5
    new-instance v2, Ljava/io/FileOutputStream;

    const-string v5, "../wiki/ImageDatabaseSummary.md"

    const/4 v6, 0x0

    invoke-direct {v2, v5, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_d} :catch_2d
    .catchall {:try_start_5 .. :try_end_d} :catchall_41

    .line 497
    .end local v1    # "outputStream":Ljava/io/OutputStream;
    .local v2, "outputStream":Ljava/io/OutputStream;
    :try_start_d
    new-instance v4, Ljava/io/PrintStream;

    const/4 v5, 0x0

    invoke-direct {v4, v2, v5}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;Z)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_13} :catch_59
    .catchall {:try_start_d .. :try_end_13} :catchall_52

    .line 498
    .end local v3    # "stream":Ljava/io/PrintStream;
    .local v4, "stream":Ljava/io/PrintStream;
    :try_start_13
    invoke-direct {p0, v4}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;->writeOutput(Ljava/io/PrintStream;)V

    .line 499
    invoke-virtual {v4}, Ljava/io/PrintStream;->flush()V
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_19} :catch_5c
    .catchall {:try_start_13 .. :try_end_19} :catchall_55

    .line 503
    if-eqz v4, :cond_1e

    .line 504
    invoke-virtual {v4}, Ljava/io/PrintStream;->close()V

    .line 505
    :cond_1e
    if-eqz v2, :cond_60

    .line 507
    :try_start_20
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_23} :catch_26

    move-object v3, v4

    .end local v4    # "stream":Ljava/io/PrintStream;
    .restart local v3    # "stream":Ljava/io/PrintStream;
    move-object v1, v2

    .line 512
    .end local v2    # "outputStream":Ljava/io/OutputStream;
    .restart local v1    # "outputStream":Ljava/io/OutputStream;
    :cond_25
    :goto_25
    return-void

    .line 508
    .end local v1    # "outputStream":Ljava/io/OutputStream;
    .end local v3    # "stream":Ljava/io/PrintStream;
    .restart local v2    # "outputStream":Ljava/io/OutputStream;
    .restart local v4    # "stream":Ljava/io/PrintStream;
    :catch_26
    move-exception v0

    .line 509
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    move-object v3, v4

    .end local v4    # "stream":Ljava/io/PrintStream;
    .restart local v3    # "stream":Ljava/io/PrintStream;
    move-object v1, v2

    .line 510
    .end local v2    # "outputStream":Ljava/io/OutputStream;
    .restart local v1    # "outputStream":Ljava/io/OutputStream;
    goto :goto_25

    .line 500
    .end local v0    # "e":Ljava/io/IOException;
    :catch_2d
    move-exception v0

    .line 501
    .restart local v0    # "e":Ljava/io/IOException;
    :goto_2e
    :try_start_2e
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_31
    .catchall {:try_start_2e .. :try_end_31} :catchall_41

    .line 503
    if-eqz v3, :cond_36

    .line 504
    invoke-virtual {v3}, Ljava/io/PrintStream;->close()V

    .line 505
    :cond_36
    if-eqz v1, :cond_25

    .line 507
    :try_start_38
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_3b
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_3b} :catch_3c

    goto :goto_25

    .line 508
    :catch_3c
    move-exception v0

    .line 509
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_25

    .line 503
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_41
    move-exception v5

    :goto_42
    if-eqz v3, :cond_47

    .line 504
    invoke-virtual {v3}, Ljava/io/PrintStream;->close()V

    .line 505
    :cond_47
    if-eqz v1, :cond_4c

    .line 507
    :try_start_49
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_4c
    .catch Ljava/io/IOException; {:try_start_49 .. :try_end_4c} :catch_4d

    .line 510
    :cond_4c
    :goto_4c
    throw v5

    .line 508
    :catch_4d
    move-exception v0

    .line 509
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4c

    .line 503
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "outputStream":Ljava/io/OutputStream;
    .restart local v2    # "outputStream":Ljava/io/OutputStream;
    :catchall_52
    move-exception v5

    move-object v1, v2

    .end local v2    # "outputStream":Ljava/io/OutputStream;
    .restart local v1    # "outputStream":Ljava/io/OutputStream;
    goto :goto_42

    .end local v1    # "outputStream":Ljava/io/OutputStream;
    .end local v3    # "stream":Ljava/io/PrintStream;
    .restart local v2    # "outputStream":Ljava/io/OutputStream;
    .restart local v4    # "stream":Ljava/io/PrintStream;
    :catchall_55
    move-exception v5

    move-object v3, v4

    .end local v4    # "stream":Ljava/io/PrintStream;
    .restart local v3    # "stream":Ljava/io/PrintStream;
    move-object v1, v2

    .end local v2    # "outputStream":Ljava/io/OutputStream;
    .restart local v1    # "outputStream":Ljava/io/OutputStream;
    goto :goto_42

    .line 500
    .end local v1    # "outputStream":Ljava/io/OutputStream;
    .restart local v2    # "outputStream":Ljava/io/OutputStream;
    :catch_59
    move-exception v0

    move-object v1, v2

    .end local v2    # "outputStream":Ljava/io/OutputStream;
    .restart local v1    # "outputStream":Ljava/io/OutputStream;
    goto :goto_2e

    .end local v1    # "outputStream":Ljava/io/OutputStream;
    .end local v3    # "stream":Ljava/io/PrintStream;
    .restart local v2    # "outputStream":Ljava/io/OutputStream;
    .restart local v4    # "stream":Ljava/io/PrintStream;
    :catch_5c
    move-exception v0

    move-object v3, v4

    .end local v4    # "stream":Ljava/io/PrintStream;
    .restart local v3    # "stream":Ljava/io/PrintStream;
    move-object v1, v2

    .end local v2    # "outputStream":Ljava/io/OutputStream;
    .restart local v1    # "outputStream":Ljava/io/OutputStream;
    goto :goto_2e

    .end local v1    # "outputStream":Ljava/io/OutputStream;
    .end local v3    # "stream":Ljava/io/PrintStream;
    .restart local v2    # "outputStream":Ljava/io/OutputStream;
    .restart local v4    # "stream":Ljava/io/PrintStream;
    :cond_60
    move-object v3, v4

    .end local v4    # "stream":Ljava/io/PrintStream;
    .restart local v3    # "stream":Ljava/io/PrintStream;
    move-object v1, v2

    .end local v2    # "outputStream":Ljava/io/OutputStream;
    .restart local v1    # "outputStream":Ljava/io/OutputStream;
    goto :goto_25
.end method
