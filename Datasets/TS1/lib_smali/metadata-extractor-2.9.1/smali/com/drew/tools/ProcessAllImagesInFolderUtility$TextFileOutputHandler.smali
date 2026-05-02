.class Lcom/drew/tools/ProcessAllImagesInFolderUtility$TextFileOutputHandler;
.super Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandlerBase;
.source "ProcessAllImagesInFolderUtility.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/drew/tools/ProcessAllImagesInFolderUtility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TextFileOutputHandler"
.end annotation


# static fields
.field private static final NEW_LINE:Ljava/lang/String; = "\n"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 240
    invoke-direct {p0}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandlerBase;-><init>()V

    return-void
.end method

.method private static closeWriter(Ljava/io/Writer;)V
    .registers 2
    .param p0, "writer"    # Ljava/io/Writer;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 395
    if-eqz p0, :cond_12

    .line 396
    const-string v0, "Generated using metadata-extractor\n"

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 397
    const-string v0, "https://drewnoakes.com/code/exif/\n"

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 398
    invoke-virtual {p0}, Ljava/io/Writer;->flush()V

    .line 399
    invoke-virtual {p0}, Ljava/io/Writer;->close()V

    .line 401
    :cond_12
    return-void
.end method

.method private static deleteRecursively(Ljava/io/File;)V
    .registers 8
    .param p0, "directory"    # Ljava/io/File;

    .prologue
    .line 258
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-nez v5, :cond_e

    .line 259
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Must be a directory."

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 261
    :cond_e
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_33

    .line 262
    invoke-virtual {p0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_1a
    if-ge v2, v4, :cond_33

    aget-object v3, v0, v2

    .line 263
    .local v3, "item":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 264
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_2f

    .line 265
    invoke-static {v1}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$TextFileOutputHandler;->deleteRecursively(Ljava/io/File;)V

    .line 262
    :goto_2c
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 267
    :cond_2f
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    goto :goto_2c

    .line 271
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "i$":I
    .end local v3    # "item":Ljava/lang/String;
    .end local v4    # "len$":I
    :cond_33
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 272
    return-void
.end method

.method private static openWriter(Ljava/io/File;)Ljava/io/PrintWriter;
    .registers 9
    .param p0, "file"    # Ljava/io/File;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 378
    new-instance v0, Ljava/io/File;

    const-string v3, "%s/metadata"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 379
    .local v0, "metadataDir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1e

    .line 380
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    .line 382
    :cond_1e
    const-string v3, "%s/metadata/%s.txt"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 383
    .local v1, "outputPath":Ljava/lang/String;
    new-instance v2, Ljava/io/OutputStreamWriter;

    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    const-string v4, "UTF-8"

    invoke-direct {v2, v3, v4}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 387
    .local v2, "writer":Ljava/io/Writer;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "FILE: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 388
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 390
    new-instance v3, Ljava/io/PrintWriter;

    invoke-direct {v3, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    return-object v3
.end method

.method private static writeHierarchyLevel(Lcom/drew/metadata/Metadata;Ljava/io/PrintWriter;Lcom/drew/metadata/Directory;I)V
    .registers 9
    .param p0, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p1, "writer"    # Ljava/io/PrintWriter;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "parent"    # Lcom/drew/metadata/Directory;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param
    .param p3, "level"    # I

    .prologue
    .line 335
    const/4 v3, 0x4

    .line 337
    .local v3, "indent":I
    invoke-virtual {p0}, Lcom/drew/metadata/Metadata;->getDirectories()Ljava/lang/Iterable;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_9
    :goto_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/drew/metadata/Directory;

    .line 338
    .local v0, "child":Lcom/drew/metadata/Directory;
    if-nez p2, :cond_2a

    .line 339
    invoke-virtual {v0}, Lcom/drew/metadata/Directory;->getParent()Lcom/drew/metadata/Directory;

    move-result-object v4

    if-nez v4, :cond_9

    .line 345
    :cond_1d
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1e
    mul-int/lit8 v4, p3, 0x4

    if-ge v1, v4, :cond_35

    .line 346
    const/16 v4, 0x20

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->write(I)V

    .line 345
    add-int/lit8 v1, v1, 0x1

    goto :goto_1e

    .line 341
    .end local v1    # "i":I
    :cond_2a
    invoke-virtual {v0}, Lcom/drew/metadata/Directory;->getParent()Lcom/drew/metadata/Directory;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1d

    goto :goto_9

    .line 348
    .restart local v1    # "i":I
    :cond_35
    const-string v4, "- "

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 349
    invoke-virtual {v0}, Lcom/drew/metadata/Directory;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 350
    const-string v4, "\n"

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 351
    add-int/lit8 v4, p3, 0x1

    invoke-static {p0, p1, v0, v4}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$TextFileOutputHandler;->writeHierarchyLevel(Lcom/drew/metadata/Metadata;Ljava/io/PrintWriter;Lcom/drew/metadata/Directory;I)V

    goto :goto_9

    .line 353
    .end local v0    # "child":Lcom/drew/metadata/Directory;
    .end local v1    # "i":I
    :cond_4c
    return-void
.end method


# virtual methods
.method public onBeforeExtraction(Ljava/io/File;Ljava/io/PrintStream;Ljava/lang/String;)V
    .registers 5
    .param p1, "file"    # Ljava/io/File;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "log"    # Ljava/io/PrintStream;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "relativePath"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 277
    invoke-super {p0, p1, p2, p3}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandlerBase;->onBeforeExtraction(Ljava/io/File;Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 278
    invoke-virtual {p1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintStream;->print(Ljava/lang/Object;)V

    .line 279
    const-string v0, "\n"

    invoke-virtual {p2, v0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 280
    return-void
.end method

.method public onExtractionError(Ljava/io/File;Ljava/lang/Throwable;Ljava/io/PrintStream;)V
    .registers 10
    .param p1, "file"    # Ljava/io/File;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "throwable"    # Ljava/lang/Throwable;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "log"    # Ljava/io/PrintStream;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 358
    invoke-super {p0, p1, p2, p3}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandlerBase;->onExtractionError(Ljava/io/File;Ljava/lang/Throwable;Ljava/io/PrintStream;)V

    .line 361
    const/4 v1, 0x0

    .line 363
    .local v1, "writer":Ljava/io/PrintWriter;
    :try_start_4
    invoke-static {p1}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$TextFileOutputHandler;->openWriter(Ljava/io/File;)Ljava/io/PrintWriter;

    move-result-object v1

    .line 364
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "EXCEPTION: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 365
    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V
    :try_end_2d
    .catchall {:try_start_4 .. :try_end_2d} :catchall_31

    .line 367
    :try_start_2d
    invoke-static {v1}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$TextFileOutputHandler;->closeWriter(Ljava/io/Writer;)V

    .line 372
    :goto_30
    return-void

    .line 367
    :catchall_31
    move-exception v2

    invoke-static {v1}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$TextFileOutputHandler;->closeWriter(Ljava/io/Writer;)V

    throw v2
    :try_end_36
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_36} :catch_36

    .line 369
    :catch_36
    move-exception v0

    .line 370
    .local v0, "e":Ljava/io/IOException;
    const-string v2, "IO exception writing metadata file: %s%s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, "\n"

    aput-object v5, v3, v4

    invoke-virtual {p3, v2, v3}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    goto :goto_30
.end method

.method public onExtractionSuccess(Ljava/io/File;Lcom/drew/metadata/Metadata;Ljava/lang/String;Ljava/io/PrintStream;)V
    .registers 20
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
    .line 285
    invoke-super/range {p0 .. p4}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandlerBase;->onExtractionSuccess(Ljava/io/File;Lcom/drew/metadata/Metadata;Ljava/lang/String;Ljava/io/PrintStream;)V

    .line 288
    const/4 v10, 0x0

    .line 291
    .local v10, "writer":Ljava/io/PrintWriter;
    :try_start_4
    invoke-static/range {p1 .. p1}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$TextFileOutputHandler;->openWriter(Ljava/io/File;)Ljava/io/PrintWriter;

    move-result-object v10

    .line 294
    invoke-virtual/range {p2 .. p2}, Lcom/drew/metadata/Metadata;->hasErrors()Z

    move-result v11

    if-eqz v11, :cond_63

    .line 295
    invoke-virtual/range {p2 .. p2}, Lcom/drew/metadata/Metadata;->getDirectories()Ljava/lang/Iterable;

    move-result-object v11

    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_16
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_5e

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/drew/metadata/Directory;

    .line 296
    .local v2, "directory":Lcom/drew/metadata/Directory;
    invoke-virtual {v2}, Lcom/drew/metadata/Directory;->hasErrors()Z

    move-result v11

    if-eqz v11, :cond_16

    .line 298
    invoke-virtual {v2}, Lcom/drew/metadata/Directory;->getErrors()Ljava/lang/Iterable;

    move-result-object v11

    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_30
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_16

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 299
    .local v5, "error":Ljava/lang/String;
    const-string v11, "[ERROR: %s] %s%s"

    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-virtual {v2}, Lcom/drew/metadata/Directory;->getName()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x1

    aput-object v5, v12, v13

    const/4 v13, 0x2

    const-string v14, "\n"

    aput-object v14, v12, v13

    invoke-virtual {v10, v11, v12}, Ljava/io/PrintWriter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;
    :try_end_53
    .catchall {:try_start_4 .. :try_end_53} :catchall_54

    goto :goto_30

    .line 326
    .end local v2    # "directory":Lcom/drew/metadata/Directory;
    .end local v5    # "error":Ljava/lang/String;
    .end local v7    # "i$":Ljava/util/Iterator;
    :catchall_54
    move-exception v11

    :try_start_55
    invoke-static {v10}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$TextFileOutputHandler;->closeWriter(Ljava/io/Writer;)V

    throw v11
    :try_end_59
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_59} :catch_59

    .line 328
    :catch_59
    move-exception v4

    .line 329
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    .line 331
    .end local v4    # "e":Ljava/io/IOException;
    :goto_5d
    return-void

    .line 301
    :cond_5e
    :try_start_5e
    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 305
    :cond_63
    invoke-virtual/range {p2 .. p2}, Lcom/drew/metadata/Metadata;->getDirectories()Ljava/lang/Iterable;

    move-result-object v11

    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_6b
    :goto_6b
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_d2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/drew/metadata/Directory;

    .line 306
    .restart local v2    # "directory":Lcom/drew/metadata/Directory;
    invoke-virtual {v2}, Lcom/drew/metadata/Directory;->getName()Ljava/lang/String;

    move-result-object v3

    .line 307
    .local v3, "directoryName":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/drew/metadata/Directory;->getTags()Ljava/util/Collection;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .restart local v7    # "i$":Ljava/util/Iterator;
    :goto_83
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_c6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/drew/metadata/Tag;

    .line 308
    .local v8, "tag":Lcom/drew/metadata/Tag;
    invoke-virtual {v8}, Lcom/drew/metadata/Tag;->getTagName()Ljava/lang/String;

    move-result-object v9

    .line 309
    .local v9, "tagName":Ljava/lang/String;
    invoke-virtual {v8}, Lcom/drew/metadata/Tag;->getDescription()Ljava/lang/String;

    move-result-object v1

    .line 310
    .local v1, "description":Ljava/lang/String;
    if-nez v1, :cond_9b

    .line 311
    const-string v1, ""

    .line 313
    :cond_9b
    instance-of v11, v2, Lcom/drew/metadata/file/FileMetadataDirectory;

    if-eqz v11, :cond_a8

    invoke-virtual {v8}, Lcom/drew/metadata/Tag;->getTagType()I

    move-result v11

    const/4 v12, 0x3

    if-ne v11, v12, :cond_a8

    .line 314
    const-string v1, "<omitted for regression testing as checkout dependent>"

    .line 315
    :cond_a8
    const-string v11, "[%s - %s] %s = %s%s"

    const/4 v12, 0x5

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v3, v12, v13

    const/4 v13, 0x1

    invoke-virtual {v8}, Lcom/drew/metadata/Tag;->getTagTypeHex()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x2

    aput-object v9, v12, v13

    const/4 v13, 0x3

    aput-object v1, v12, v13

    const/4 v13, 0x4

    const-string v14, "\n"

    aput-object v14, v12, v13

    invoke-virtual {v10, v11, v12}, Ljava/io/PrintWriter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    goto :goto_83

    .line 317
    .end local v1    # "description":Ljava/lang/String;
    .end local v8    # "tag":Lcom/drew/metadata/Tag;
    .end local v9    # "tagName":Ljava/lang/String;
    :cond_c6
    invoke-virtual {v2}, Lcom/drew/metadata/Directory;->getTagCount()I

    move-result v11

    if-eqz v11, :cond_6b

    .line 318
    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    goto :goto_6b

    .line 322
    .end local v2    # "directory":Lcom/drew/metadata/Directory;
    .end local v3    # "directoryName":Ljava/lang/String;
    .end local v7    # "i$":Ljava/util/Iterator;
    :cond_d2
    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-static {v0, v10, v11, v12}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$TextFileOutputHandler;->writeHierarchyLevel(Lcom/drew/metadata/Metadata;Ljava/io/PrintWriter;Lcom/drew/metadata/Directory;I)V

    .line 324
    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V
    :try_end_de
    .catchall {:try_start_5e .. :try_end_de} :catchall_54

    .line 326
    :try_start_de
    invoke-static {v10}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$TextFileOutputHandler;->closeWriter(Ljava/io/Writer;)V
    :try_end_e1
    .catch Ljava/io/IOException; {:try_start_de .. :try_end_e1} :catch_59

    goto/16 :goto_5d
.end method

.method public onStartingDirectory(Ljava/io/File;)V
    .registers 5
    .param p1, "directoryPath"    # Ljava/io/File;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 248
    invoke-super {p0, p1}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandlerBase;->onStartingDirectory(Ljava/io/File;)V

    .line 251
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/metadata"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 252
    .local v0, "metadataDirectory":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_24

    .line 253
    invoke-static {v0}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$TextFileOutputHandler;->deleteRecursively(Ljava/io/File;)V

    .line 254
    :cond_24
    return-void
.end method
