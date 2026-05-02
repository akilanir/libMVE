.class public Lorg/apache/commons/io/monitor/FileAlterationObserver;
.super Ljava/lang/Object;
.source "FileAlterationObserver.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private final comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private final fileFilter:Ljava/io/FileFilter;

.field private final listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/commons/io/monitor/FileAlterationListener;",
            ">;"
        }
    .end annotation
.end field

.field private final rootEntry:Lorg/apache/commons/io/monitor/FileEntry;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "directory"    # Ljava/io/File;

    .prologue
    .line 166
    const/4 v0, 0x0

    check-cast v0, Ljava/io/FileFilter;

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/io/monitor/FileAlterationObserver;-><init>(Ljava/io/File;Ljava/io/FileFilter;)V

    .line 167
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/io/FileFilter;)V
    .registers 4
    .param p1, "directory"    # Ljava/io/File;
    .param p2, "fileFilter"    # Ljava/io/FileFilter;

    .prologue
    .line 176
    const/4 v0, 0x0

    check-cast v0, Lorg/apache/commons/io/IOCase;

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/io/monitor/FileAlterationObserver;-><init>(Ljava/io/File;Ljava/io/FileFilter;Lorg/apache/commons/io/IOCase;)V

    .line 177
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/io/FileFilter;Lorg/apache/commons/io/IOCase;)V
    .registers 5
    .param p1, "directory"    # Ljava/io/File;
    .param p2, "fileFilter"    # Ljava/io/FileFilter;
    .param p3, "caseSensitivity"    # Lorg/apache/commons/io/IOCase;

    .prologue
    .line 188
    new-instance v0, Lorg/apache/commons/io/monitor/FileEntry;

    invoke-direct {v0, p1}, Lorg/apache/commons/io/monitor/FileEntry;-><init>(Ljava/io/File;)V

    invoke-direct {p0, v0, p2, p3}, Lorg/apache/commons/io/monitor/FileAlterationObserver;-><init>(Lorg/apache/commons/io/monitor/FileEntry;Ljava/io/FileFilter;Lorg/apache/commons/io/IOCase;)V

    .line 189
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "directoryName"    # Ljava/lang/String;

    .prologue
    .line 135
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/apache/commons/io/monitor/FileAlterationObserver;-><init>(Ljava/io/File;)V

    .line 136
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/FileFilter;)V
    .registers 4
    .param p1, "directoryName"    # Ljava/lang/String;
    .param p2, "fileFilter"    # Ljava/io/FileFilter;

    .prologue
    .line 145
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Lorg/apache/commons/io/monitor/FileAlterationObserver;-><init>(Ljava/io/File;Ljava/io/FileFilter;)V

    .line 146
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/FileFilter;Lorg/apache/commons/io/IOCase;)V
    .registers 5
    .param p1, "directoryName"    # Ljava/lang/String;
    .param p2, "fileFilter"    # Ljava/io/FileFilter;
    .param p3, "caseSensitivity"    # Lorg/apache/commons/io/IOCase;

    .prologue
    .line 157
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2, p3}, Lorg/apache/commons/io/monitor/FileAlterationObserver;-><init>(Ljava/io/File;Ljava/io/FileFilter;Lorg/apache/commons/io/IOCase;)V

    .line 158
    return-void
.end method

.method protected constructor <init>(Lorg/apache/commons/io/monitor/FileEntry;Ljava/io/FileFilter;Lorg/apache/commons/io/IOCase;)V
    .registers 6
    .param p1, "rootEntry"    # Lorg/apache/commons/io/monitor/FileEntry;
    .param p2, "fileFilter"    # Ljava/io/FileFilter;
    .param p3, "caseSensitivity"    # Lorg/apache/commons/io/IOCase;

    .prologue
    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 124
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->listeners:Ljava/util/List;

    .line 200
    if-nez p1, :cond_14

    .line 201
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Root entry is missing"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 203
    :cond_14
    invoke-virtual {p1}, Lorg/apache/commons/io/monitor/FileEntry;->getFile()Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_22

    .line 204
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Root directory is missing"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 206
    :cond_22
    iput-object p1, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->rootEntry:Lorg/apache/commons/io/monitor/FileEntry;

    .line 207
    iput-object p2, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->fileFilter:Ljava/io/FileFilter;

    .line 208
    if-eqz p3, :cond_30

    sget-object v0, Lorg/apache/commons/io/IOCase;->SYSTEM:Lorg/apache/commons/io/IOCase;

    invoke-virtual {p3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_35

    .line 209
    :cond_30
    sget-object v0, Lorg/apache/commons/io/comparator/NameFileComparator;->NAME_SYSTEM_COMPARATOR:Ljava/util/Comparator;

    iput-object v0, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->comparator:Ljava/util/Comparator;

    .line 215
    :goto_34
    return-void

    .line 210
    :cond_35
    sget-object v0, Lorg/apache/commons/io/IOCase;->INSENSITIVE:Lorg/apache/commons/io/IOCase;

    invoke-virtual {p3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_42

    .line 211
    sget-object v0, Lorg/apache/commons/io/comparator/NameFileComparator;->NAME_INSENSITIVE_COMPARATOR:Ljava/util/Comparator;

    iput-object v0, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->comparator:Ljava/util/Comparator;

    goto :goto_34

    .line 213
    :cond_42
    sget-object v0, Lorg/apache/commons/io/comparator/NameFileComparator;->NAME_COMPARATOR:Ljava/util/Comparator;

    iput-object v0, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->comparator:Ljava/util/Comparator;

    goto :goto_34
.end method

.method private checkAndNotify(Lorg/apache/commons/io/monitor/FileEntry;[Lorg/apache/commons/io/monitor/FileEntry;[Ljava/io/File;)V
    .registers 13
    .param p1, "parent"    # Lorg/apache/commons/io/monitor/FileEntry;
    .param p2, "previous"    # [Lorg/apache/commons/io/monitor/FileEntry;
    .param p3, "files"    # [Ljava/io/File;

    .prologue
    .line 315
    const/4 v1, 0x0

    .line 316
    .local v1, "c":I
    array-length v6, p3

    if-lez v6, :cond_2f

    array-length v6, p3

    new-array v2, v6, [Lorg/apache/commons/io/monitor/FileEntry;

    .line 317
    .local v2, "current":[Lorg/apache/commons/io/monitor/FileEntry;
    :goto_7
    move-object v0, p2

    .local v0, "arr$":[Lorg/apache/commons/io/monitor/FileEntry;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_a
    if-ge v4, v5, :cond_69

    aget-object v3, v0, v4

    .line 318
    .local v3, "entry":Lorg/apache/commons/io/monitor/FileEntry;
    :goto_e
    array-length v6, p3

    if-ge v1, v6, :cond_32

    iget-object v6, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->comparator:Ljava/util/Comparator;

    invoke-virtual {v3}, Lorg/apache/commons/io/monitor/FileEntry;->getFile()Ljava/io/File;

    move-result-object v7

    aget-object v8, p3, v1

    invoke-interface {v6, v7, v8}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v6

    if-lez v6, :cond_32

    .line 319
    aget-object v6, p3, v1

    invoke-direct {p0, p1, v6}, Lorg/apache/commons/io/monitor/FileAlterationObserver;->createFileEntry(Lorg/apache/commons/io/monitor/FileEntry;Ljava/io/File;)Lorg/apache/commons/io/monitor/FileEntry;

    move-result-object v6

    aput-object v6, v2, v1

    .line 320
    aget-object v6, v2, v1

    invoke-direct {p0, v6}, Lorg/apache/commons/io/monitor/FileAlterationObserver;->doCreate(Lorg/apache/commons/io/monitor/FileEntry;)V

    .line 321
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 316
    .end local v0    # "arr$":[Lorg/apache/commons/io/monitor/FileEntry;
    .end local v2    # "current":[Lorg/apache/commons/io/monitor/FileEntry;
    .end local v3    # "entry":Lorg/apache/commons/io/monitor/FileEntry;
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    :cond_2f
    sget-object v2, Lorg/apache/commons/io/monitor/FileEntry;->EMPTY_ENTRIES:[Lorg/apache/commons/io/monitor/FileEntry;

    goto :goto_7

    .line 323
    .restart local v0    # "arr$":[Lorg/apache/commons/io/monitor/FileEntry;
    .restart local v2    # "current":[Lorg/apache/commons/io/monitor/FileEntry;
    .restart local v3    # "entry":Lorg/apache/commons/io/monitor/FileEntry;
    .restart local v4    # "i$":I
    .restart local v5    # "len$":I
    :cond_32
    array-length v6, p3

    if-ge v1, v6, :cond_5c

    iget-object v6, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->comparator:Ljava/util/Comparator;

    invoke-virtual {v3}, Lorg/apache/commons/io/monitor/FileEntry;->getFile()Ljava/io/File;

    move-result-object v7

    aget-object v8, p3, v1

    invoke-interface {v6, v7, v8}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v6

    if-nez v6, :cond_5c

    .line 324
    aget-object v6, p3, v1

    invoke-direct {p0, v3, v6}, Lorg/apache/commons/io/monitor/FileAlterationObserver;->doMatch(Lorg/apache/commons/io/monitor/FileEntry;Ljava/io/File;)V

    .line 325
    invoke-virtual {v3}, Lorg/apache/commons/io/monitor/FileEntry;->getChildren()[Lorg/apache/commons/io/monitor/FileEntry;

    move-result-object v6

    aget-object v7, p3, v1

    invoke-direct {p0, v7}, Lorg/apache/commons/io/monitor/FileAlterationObserver;->listFiles(Ljava/io/File;)[Ljava/io/File;

    move-result-object v7

    invoke-direct {p0, v3, v6, v7}, Lorg/apache/commons/io/monitor/FileAlterationObserver;->checkAndNotify(Lorg/apache/commons/io/monitor/FileEntry;[Lorg/apache/commons/io/monitor/FileEntry;[Ljava/io/File;)V

    .line 326
    aput-object v3, v2, v1

    .line 327
    add-int/lit8 v1, v1, 0x1

    .line 317
    :goto_59
    add-int/lit8 v4, v4, 0x1

    goto :goto_a

    .line 329
    :cond_5c
    invoke-virtual {v3}, Lorg/apache/commons/io/monitor/FileEntry;->getChildren()[Lorg/apache/commons/io/monitor/FileEntry;

    move-result-object v6

    sget-object v7, Lorg/apache/commons/io/FileUtils;->EMPTY_FILE_ARRAY:[Ljava/io/File;

    invoke-direct {p0, v3, v6, v7}, Lorg/apache/commons/io/monitor/FileAlterationObserver;->checkAndNotify(Lorg/apache/commons/io/monitor/FileEntry;[Lorg/apache/commons/io/monitor/FileEntry;[Ljava/io/File;)V

    .line 330
    invoke-direct {p0, v3}, Lorg/apache/commons/io/monitor/FileAlterationObserver;->doDelete(Lorg/apache/commons/io/monitor/FileEntry;)V

    goto :goto_59

    .line 333
    .end local v3    # "entry":Lorg/apache/commons/io/monitor/FileEntry;
    :cond_69
    :goto_69
    array-length v6, p3

    if-ge v1, v6, :cond_7c

    .line 334
    aget-object v6, p3, v1

    invoke-direct {p0, p1, v6}, Lorg/apache/commons/io/monitor/FileAlterationObserver;->createFileEntry(Lorg/apache/commons/io/monitor/FileEntry;Ljava/io/File;)Lorg/apache/commons/io/monitor/FileEntry;

    move-result-object v6

    aput-object v6, v2, v1

    .line 335
    aget-object v6, v2, v1

    invoke-direct {p0, v6}, Lorg/apache/commons/io/monitor/FileAlterationObserver;->doCreate(Lorg/apache/commons/io/monitor/FileEntry;)V

    .line 333
    add-int/lit8 v1, v1, 0x1

    goto :goto_69

    .line 337
    :cond_7c
    invoke-virtual {p1, v2}, Lorg/apache/commons/io/monitor/FileEntry;->setChildren([Lorg/apache/commons/io/monitor/FileEntry;)V

    .line 338
    return-void
.end method

.method private createFileEntry(Lorg/apache/commons/io/monitor/FileEntry;Ljava/io/File;)Lorg/apache/commons/io/monitor/FileEntry;
    .registers 8
    .param p1, "parent"    # Lorg/apache/commons/io/monitor/FileEntry;
    .param p2, "file"    # Ljava/io/File;

    .prologue
    .line 348
    invoke-virtual {p1, p2}, Lorg/apache/commons/io/monitor/FileEntry;->newChildInstance(Ljava/io/File;)Lorg/apache/commons/io/monitor/FileEntry;

    move-result-object v1

    .line 349
    .local v1, "entry":Lorg/apache/commons/io/monitor/FileEntry;
    invoke-virtual {v1, p2}, Lorg/apache/commons/io/monitor/FileEntry;->refresh(Ljava/io/File;)Z

    .line 350
    invoke-direct {p0, p2}, Lorg/apache/commons/io/monitor/FileAlterationObserver;->listFiles(Ljava/io/File;)[Ljava/io/File;

    move-result-object v2

    .line 351
    .local v2, "files":[Ljava/io/File;
    array-length v4, v2

    if-lez v4, :cond_20

    array-length v4, v2

    new-array v0, v4, [Lorg/apache/commons/io/monitor/FileEntry;

    .line 352
    .local v0, "children":[Lorg/apache/commons/io/monitor/FileEntry;
    :goto_11
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_12
    array-length v4, v2

    if-ge v3, v4, :cond_23

    .line 353
    aget-object v4, v2, v3

    invoke-direct {p0, v1, v4}, Lorg/apache/commons/io/monitor/FileAlterationObserver;->createFileEntry(Lorg/apache/commons/io/monitor/FileEntry;Ljava/io/File;)Lorg/apache/commons/io/monitor/FileEntry;

    move-result-object v4

    aput-object v4, v0, v3

    .line 352
    add-int/lit8 v3, v3, 0x1

    goto :goto_12

    .line 351
    .end local v0    # "children":[Lorg/apache/commons/io/monitor/FileEntry;
    .end local v3    # "i":I
    :cond_20
    sget-object v0, Lorg/apache/commons/io/monitor/FileEntry;->EMPTY_ENTRIES:[Lorg/apache/commons/io/monitor/FileEntry;

    goto :goto_11

    .line 355
    .restart local v0    # "children":[Lorg/apache/commons/io/monitor/FileEntry;
    .restart local v3    # "i":I
    :cond_23
    invoke-virtual {v1, v0}, Lorg/apache/commons/io/monitor/FileEntry;->setChildren([Lorg/apache/commons/io/monitor/FileEntry;)V

    .line 356
    return-object v1
.end method

.method private doCreate(Lorg/apache/commons/io/monitor/FileEntry;)V
    .registers 9
    .param p1, "entry"    # Lorg/apache/commons/io/monitor/FileEntry;

    .prologue
    .line 365
    iget-object v6, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->listeners:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_28

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/commons/io/monitor/FileAlterationListener;

    .line 366
    .local v5, "listener":Lorg/apache/commons/io/monitor/FileAlterationListener;
    invoke-virtual {p1}, Lorg/apache/commons/io/monitor/FileEntry;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_20

    .line 367
    invoke-virtual {p1}, Lorg/apache/commons/io/monitor/FileEntry;->getFile()Ljava/io/File;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/io/monitor/FileAlterationListener;->onDirectoryCreate(Ljava/io/File;)V

    goto :goto_6

    .line 369
    :cond_20
    invoke-virtual {p1}, Lorg/apache/commons/io/monitor/FileEntry;->getFile()Ljava/io/File;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/io/monitor/FileAlterationListener;->onFileCreate(Ljava/io/File;)V

    goto :goto_6

    .line 372
    .end local v5    # "listener":Lorg/apache/commons/io/monitor/FileAlterationListener;
    :cond_28
    invoke-virtual {p1}, Lorg/apache/commons/io/monitor/FileEntry;->getChildren()[Lorg/apache/commons/io/monitor/FileEntry;

    move-result-object v2

    .line 373
    .local v2, "children":[Lorg/apache/commons/io/monitor/FileEntry;
    move-object v1, v2

    .local v1, "arr$":[Lorg/apache/commons/io/monitor/FileEntry;
    array-length v4, v1

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_2f
    if-ge v3, v4, :cond_39

    aget-object v0, v1, v3

    .line 374
    .local v0, "aChildren":Lorg/apache/commons/io/monitor/FileEntry;
    invoke-direct {p0, v0}, Lorg/apache/commons/io/monitor/FileAlterationObserver;->doCreate(Lorg/apache/commons/io/monitor/FileEntry;)V

    .line 373
    add-int/lit8 v3, v3, 0x1

    goto :goto_2f

    .line 376
    .end local v0    # "aChildren":Lorg/apache/commons/io/monitor/FileEntry;
    :cond_39
    return-void
.end method

.method private doDelete(Lorg/apache/commons/io/monitor/FileEntry;)V
    .registers 5
    .param p1, "entry"    # Lorg/apache/commons/io/monitor/FileEntry;

    .prologue
    .line 402
    iget-object v2, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->listeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_28

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/io/monitor/FileAlterationListener;

    .line 403
    .local v1, "listener":Lorg/apache/commons/io/monitor/FileAlterationListener;
    invoke-virtual {p1}, Lorg/apache/commons/io/monitor/FileEntry;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_20

    .line 404
    invoke-virtual {p1}, Lorg/apache/commons/io/monitor/FileEntry;->getFile()Ljava/io/File;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/io/monitor/FileAlterationListener;->onDirectoryDelete(Ljava/io/File;)V

    goto :goto_6

    .line 406
    :cond_20
    invoke-virtual {p1}, Lorg/apache/commons/io/monitor/FileEntry;->getFile()Ljava/io/File;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/io/monitor/FileAlterationListener;->onFileDelete(Ljava/io/File;)V

    goto :goto_6

    .line 409
    .end local v1    # "listener":Lorg/apache/commons/io/monitor/FileAlterationListener;
    :cond_28
    return-void
.end method

.method private doMatch(Lorg/apache/commons/io/monitor/FileEntry;Ljava/io/File;)V
    .registers 6
    .param p1, "entry"    # Lorg/apache/commons/io/monitor/FileEntry;
    .param p2, "file"    # Ljava/io/File;

    .prologue
    .line 385
    invoke-virtual {p1, p2}, Lorg/apache/commons/io/monitor/FileEntry;->refresh(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 386
    iget-object v2, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->listeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_26

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/io/monitor/FileAlterationListener;

    .line 387
    .local v1, "listener":Lorg/apache/commons/io/monitor/FileAlterationListener;
    invoke-virtual {p1}, Lorg/apache/commons/io/monitor/FileEntry;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_22

    .line 388
    invoke-interface {v1, p2}, Lorg/apache/commons/io/monitor/FileAlterationListener;->onDirectoryChange(Ljava/io/File;)V

    goto :goto_c

    .line 390
    :cond_22
    invoke-interface {v1, p2}, Lorg/apache/commons/io/monitor/FileAlterationListener;->onFileChange(Ljava/io/File;)V

    goto :goto_c

    .line 394
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lorg/apache/commons/io/monitor/FileAlterationListener;
    :cond_26
    return-void
.end method

.method private listFiles(Ljava/io/File;)[Ljava/io/File;
    .registers 5
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 419
    const/4 v0, 0x0

    .line 420
    .local v0, "children":[Ljava/io/File;
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 421
    iget-object v1, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->fileFilter:Ljava/io/FileFilter;

    if-nez v1, :cond_21

    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 423
    :cond_f
    :goto_f
    if-nez v0, :cond_13

    .line 424
    sget-object v0, Lorg/apache/commons/io/FileUtils;->EMPTY_FILE_ARRAY:[Ljava/io/File;

    .line 426
    :cond_13
    iget-object v1, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->comparator:Ljava/util/Comparator;

    if-eqz v1, :cond_20

    array-length v1, v0

    const/4 v2, 0x1

    if-le v1, v2, :cond_20

    .line 427
    iget-object v1, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->comparator:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 429
    :cond_20
    return-object v0

    .line 421
    :cond_21
    iget-object v1, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->fileFilter:Ljava/io/FileFilter;

    invoke-virtual {p1, v1}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v0

    goto :goto_f
.end method


# virtual methods
.method public addListener(Lorg/apache/commons/io/monitor/FileAlterationListener;)V
    .registers 3
    .param p1, "listener"    # Lorg/apache/commons/io/monitor/FileAlterationListener;

    .prologue
    .line 232
    if-eqz p1, :cond_7

    .line 233
    iget-object v0, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 235
    :cond_7
    return-void
.end method

.method public checkAndNotify()V
    .registers 7

    .prologue
    .line 287
    iget-object v3, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->listeners:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/io/monitor/FileAlterationListener;

    .line 288
    .local v1, "listener":Lorg/apache/commons/io/monitor/FileAlterationListener;
    invoke-interface {v1, p0}, Lorg/apache/commons/io/monitor/FileAlterationListener;->onStart(Lorg/apache/commons/io/monitor/FileAlterationObserver;)V

    goto :goto_6

    .line 292
    .end local v1    # "listener":Lorg/apache/commons/io/monitor/FileAlterationListener;
    :cond_16
    iget-object v3, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->rootEntry:Lorg/apache/commons/io/monitor/FileEntry;

    invoke-virtual {v3}, Lorg/apache/commons/io/monitor/FileEntry;->getFile()Ljava/io/File;

    move-result-object v2

    .line 293
    .local v2, "rootFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_47

    .line 294
    iget-object v3, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->rootEntry:Lorg/apache/commons/io/monitor/FileEntry;

    iget-object v4, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->rootEntry:Lorg/apache/commons/io/monitor/FileEntry;

    invoke-virtual {v4}, Lorg/apache/commons/io/monitor/FileEntry;->getChildren()[Lorg/apache/commons/io/monitor/FileEntry;

    move-result-object v4

    invoke-direct {p0, v2}, Lorg/apache/commons/io/monitor/FileAlterationObserver;->listFiles(Ljava/io/File;)[Ljava/io/File;

    move-result-object v5

    invoke-direct {p0, v3, v4, v5}, Lorg/apache/commons/io/monitor/FileAlterationObserver;->checkAndNotify(Lorg/apache/commons/io/monitor/FileEntry;[Lorg/apache/commons/io/monitor/FileEntry;[Ljava/io/File;)V

    .line 302
    :cond_31
    :goto_31
    iget-object v3, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->listeners:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_37
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/io/monitor/FileAlterationListener;

    .line 303
    .restart local v1    # "listener":Lorg/apache/commons/io/monitor/FileAlterationListener;
    invoke-interface {v1, p0}, Lorg/apache/commons/io/monitor/FileAlterationListener;->onStop(Lorg/apache/commons/io/monitor/FileAlterationObserver;)V

    goto :goto_37

    .line 295
    .end local v1    # "listener":Lorg/apache/commons/io/monitor/FileAlterationListener;
    :cond_47
    iget-object v3, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->rootEntry:Lorg/apache/commons/io/monitor/FileEntry;

    invoke-virtual {v3}, Lorg/apache/commons/io/monitor/FileEntry;->isExists()Z

    move-result v3

    if-eqz v3, :cond_31

    .line 296
    iget-object v3, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->rootEntry:Lorg/apache/commons/io/monitor/FileEntry;

    iget-object v4, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->rootEntry:Lorg/apache/commons/io/monitor/FileEntry;

    invoke-virtual {v4}, Lorg/apache/commons/io/monitor/FileEntry;->getChildren()[Lorg/apache/commons/io/monitor/FileEntry;

    move-result-object v4

    sget-object v5, Lorg/apache/commons/io/FileUtils;->EMPTY_FILE_ARRAY:[Ljava/io/File;

    invoke-direct {p0, v3, v4, v5}, Lorg/apache/commons/io/monitor/FileAlterationObserver;->checkAndNotify(Lorg/apache/commons/io/monitor/FileEntry;[Lorg/apache/commons/io/monitor/FileEntry;[Ljava/io/File;)V

    goto :goto_31

    .line 305
    :cond_5d
    return-void
.end method

.method public destroy()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 279
    return-void
.end method

.method public getDirectory()Ljava/io/File;
    .registers 2

    .prologue
    .line 223
    iget-object v0, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->rootEntry:Lorg/apache/commons/io/monitor/FileEntry;

    invoke-virtual {v0}, Lorg/apache/commons/io/monitor/FileEntry;->getFile()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getListeners()Ljava/lang/Iterable;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/apache/commons/io/monitor/FileAlterationListener;",
            ">;"
        }
    .end annotation

    .prologue
    .line 255
    iget-object v0, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->listeners:Ljava/util/List;

    return-object v0
.end method

.method public initialize()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 264
    iget-object v3, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->rootEntry:Lorg/apache/commons/io/monitor/FileEntry;

    iget-object v4, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->rootEntry:Lorg/apache/commons/io/monitor/FileEntry;

    invoke-virtual {v4}, Lorg/apache/commons/io/monitor/FileEntry;->getFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/commons/io/monitor/FileEntry;->refresh(Ljava/io/File;)Z

    .line 265
    iget-object v3, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->rootEntry:Lorg/apache/commons/io/monitor/FileEntry;

    invoke-virtual {v3}, Lorg/apache/commons/io/monitor/FileEntry;->getFile()Ljava/io/File;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/apache/commons/io/monitor/FileAlterationObserver;->listFiles(Ljava/io/File;)[Ljava/io/File;

    move-result-object v1

    .line 266
    .local v1, "files":[Ljava/io/File;
    array-length v3, v1

    if-lez v3, :cond_2c

    array-length v3, v1

    new-array v0, v3, [Lorg/apache/commons/io/monitor/FileEntry;

    .line 267
    .local v0, "children":[Lorg/apache/commons/io/monitor/FileEntry;
    :goto_1b
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1c
    array-length v3, v1

    if-ge v2, v3, :cond_2f

    .line 268
    iget-object v3, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->rootEntry:Lorg/apache/commons/io/monitor/FileEntry;

    aget-object v4, v1, v2

    invoke-direct {p0, v3, v4}, Lorg/apache/commons/io/monitor/FileAlterationObserver;->createFileEntry(Lorg/apache/commons/io/monitor/FileEntry;Ljava/io/File;)Lorg/apache/commons/io/monitor/FileEntry;

    move-result-object v3

    aput-object v3, v0, v2

    .line 267
    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    .line 266
    .end local v0    # "children":[Lorg/apache/commons/io/monitor/FileEntry;
    .end local v2    # "i":I
    :cond_2c
    sget-object v0, Lorg/apache/commons/io/monitor/FileEntry;->EMPTY_ENTRIES:[Lorg/apache/commons/io/monitor/FileEntry;

    goto :goto_1b

    .line 270
    .restart local v0    # "children":[Lorg/apache/commons/io/monitor/FileEntry;
    .restart local v2    # "i":I
    :cond_2f
    iget-object v3, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->rootEntry:Lorg/apache/commons/io/monitor/FileEntry;

    invoke-virtual {v3, v0}, Lorg/apache/commons/io/monitor/FileEntry;->setChildren([Lorg/apache/commons/io/monitor/FileEntry;)V

    .line 271
    return-void
.end method

.method public removeListener(Lorg/apache/commons/io/monitor/FileAlterationListener;)V
    .registers 3
    .param p1, "listener"    # Lorg/apache/commons/io/monitor/FileAlterationListener;

    .prologue
    .line 243
    if-eqz p1, :cond_a

    .line 244
    :cond_2
    iget-object v0, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 247
    :cond_a
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 439
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 440
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 441
    const-string v1, "[file=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 442
    invoke-virtual {p0}, Lorg/apache/commons/io/monitor/FileAlterationObserver;->getDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 443
    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 444
    iget-object v1, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->fileFilter:Ljava/io/FileFilter;

    if-eqz v1, :cond_37

    .line 445
    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 446
    iget-object v1, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->fileFilter:Ljava/io/FileFilter;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 448
    :cond_37
    const-string v1, ", listeners="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 449
    iget-object v1, p0, Lorg/apache/commons/io/monitor/FileAlterationObserver;->listeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 450
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 451
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
