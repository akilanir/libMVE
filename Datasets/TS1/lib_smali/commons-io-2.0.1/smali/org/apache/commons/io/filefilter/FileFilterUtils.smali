.class public Lorg/apache/commons/io/filefilter/FileFilterUtils;
.super Ljava/lang/Object;
.source "FileFilterUtils.java"


# static fields
.field private static final cvsFilter:Lorg/apache/commons/io/filefilter/IOFileFilter;

.field private static final svnFilter:Lorg/apache/commons/io/filefilter/IOFileFilter;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 729
    new-array v0, v4, [Lorg/apache/commons/io/filefilter/IOFileFilter;

    invoke-static {}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->directoryFileFilter()Lorg/apache/commons/io/filefilter/IOFileFilter;

    move-result-object v1

    aput-object v1, v0, v2

    const-string v1, "CVS"

    invoke-static {v1}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->nameFileFilter(Ljava/lang/String;)Lorg/apache/commons/io/filefilter/IOFileFilter;

    move-result-object v1

    aput-object v1, v0, v3

    invoke-static {v0}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->and([Lorg/apache/commons/io/filefilter/IOFileFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->notFileFilter(Lorg/apache/commons/io/filefilter/IOFileFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/io/filefilter/FileFilterUtils;->cvsFilter:Lorg/apache/commons/io/filefilter/IOFileFilter;

    .line 733
    new-array v0, v4, [Lorg/apache/commons/io/filefilter/IOFileFilter;

    invoke-static {}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->directoryFileFilter()Lorg/apache/commons/io/filefilter/IOFileFilter;

    move-result-object v1

    aput-object v1, v0, v2

    const-string v1, ".svn"

    invoke-static {v1}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->nameFileFilter(Ljava/lang/String;)Lorg/apache/commons/io/filefilter/IOFileFilter;

    move-result-object v1

    aput-object v1, v0, v3

    invoke-static {v0}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->and([Lorg/apache/commons/io/filefilter/IOFileFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->notFileFilter(Lorg/apache/commons/io/filefilter/IOFileFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/io/filefilter/FileFilterUtils;->svnFilter:Lorg/apache/commons/io/filefilter/IOFileFilter;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    return-void
.end method

.method public static ageFileFilter(J)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 3
    .param p0, "cutoff"    # J

    .prologue
    .line 535
    new-instance v0, Lorg/apache/commons/io/filefilter/AgeFileFilter;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/io/filefilter/AgeFileFilter;-><init>(J)V

    return-object v0
.end method

.method public static ageFileFilter(JZ)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 4
    .param p0, "cutoff"    # J
    .param p2, "acceptOlder"    # Z

    .prologue
    .line 548
    new-instance v0, Lorg/apache/commons/io/filefilter/AgeFileFilter;

    invoke-direct {v0, p0, p1, p2}, Lorg/apache/commons/io/filefilter/AgeFileFilter;-><init>(JZ)V

    return-object v0
.end method

.method public static ageFileFilter(Ljava/io/File;)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 2
    .param p0, "cutoffReference"    # Ljava/io/File;

    .prologue
    .line 588
    new-instance v0, Lorg/apache/commons/io/filefilter/AgeFileFilter;

    invoke-direct {v0, p0}, Lorg/apache/commons/io/filefilter/AgeFileFilter;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public static ageFileFilter(Ljava/io/File;Z)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 3
    .param p0, "cutoffReference"    # Ljava/io/File;
    .param p1, "acceptOlder"    # Z

    .prologue
    .line 602
    new-instance v0, Lorg/apache/commons/io/filefilter/AgeFileFilter;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/io/filefilter/AgeFileFilter;-><init>(Ljava/io/File;Z)V

    return-object v0
.end method

.method public static ageFileFilter(Ljava/util/Date;)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 2
    .param p0, "cutoffDate"    # Ljava/util/Date;

    .prologue
    .line 561
    new-instance v0, Lorg/apache/commons/io/filefilter/AgeFileFilter;

    invoke-direct {v0, p0}, Lorg/apache/commons/io/filefilter/AgeFileFilter;-><init>(Ljava/util/Date;)V

    return-object v0
.end method

.method public static ageFileFilter(Ljava/util/Date;Z)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 3
    .param p0, "cutoffDate"    # Ljava/util/Date;
    .param p1, "acceptOlder"    # Z

    .prologue
    .line 574
    new-instance v0, Lorg/apache/commons/io/filefilter/AgeFileFilter;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/io/filefilter/AgeFileFilter;-><init>(Ljava/util/Date;Z)V

    return-object v0
.end method

.method public static varargs and([Lorg/apache/commons/io/filefilter/IOFileFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 3
    .param p0, "filters"    # [Lorg/apache/commons/io/filefilter/IOFileFilter;

    .prologue
    .line 426
    new-instance v0, Lorg/apache/commons/io/filefilter/AndFileFilter;

    invoke-static {p0}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->toList([Lorg/apache/commons/io/filefilter/IOFileFilter;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/io/filefilter/AndFileFilter;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method public static andFileFilter(Lorg/apache/commons/io/filefilter/IOFileFilter;Lorg/apache/commons/io/filefilter/IOFileFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 3
    .param p0, "filter1"    # Lorg/apache/commons/io/filefilter/IOFileFilter;
    .param p1, "filter2"    # Lorg/apache/commons/io/filefilter/IOFileFilter;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 396
    new-instance v0, Lorg/apache/commons/io/filefilter/AndFileFilter;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/io/filefilter/AndFileFilter;-><init>(Lorg/apache/commons/io/filefilter/IOFileFilter;Lorg/apache/commons/io/filefilter/IOFileFilter;)V

    return-object v0
.end method

.method public static asFileFilter(Ljava/io/FileFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 2
    .param p0, "filter"    # Ljava/io/FileFilter;

    .prologue
    .line 509
    new-instance v0, Lorg/apache/commons/io/filefilter/DelegateFileFilter;

    invoke-direct {v0, p0}, Lorg/apache/commons/io/filefilter/DelegateFileFilter;-><init>(Ljava/io/FileFilter;)V

    return-object v0
.end method

.method public static asFileFilter(Ljava/io/FilenameFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 2
    .param p0, "filter"    # Ljava/io/FilenameFilter;

    .prologue
    .line 521
    new-instance v0, Lorg/apache/commons/io/filefilter/DelegateFileFilter;

    invoke-direct {v0, p0}, Lorg/apache/commons/io/filefilter/DelegateFileFilter;-><init>(Ljava/io/FilenameFilter;)V

    return-object v0
.end method

.method public static directoryFileFilter()Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 1

    .prologue
    .line 370
    sget-object v0, Lorg/apache/commons/io/filefilter/DirectoryFileFilter;->DIRECTORY:Lorg/apache/commons/io/filefilter/IOFileFilter;

    return-object v0
.end method

.method public static falseFileFilter()Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 1

    .prologue
    .line 496
    sget-object v0, Lorg/apache/commons/io/filefilter/FalseFileFilter;->FALSE:Lorg/apache/commons/io/filefilter/IOFileFilter;

    return-object v0
.end method

.method public static fileFileFilter()Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 1

    .prologue
    .line 380
    sget-object v0, Lorg/apache/commons/io/filefilter/FileFileFilter;->FILE:Lorg/apache/commons/io/filefilter/IOFileFilter;

    return-object v0
.end method

.method private static filter(Lorg/apache/commons/io/filefilter/IOFileFilter;Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/Collection;
    .registers 7
    .param p0, "filter"    # Lorg/apache/commons/io/filefilter/IOFileFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/util/Collection",
            "<",
            "Ljava/io/File;",
            ">;>(",
            "Lorg/apache/commons/io/filefilter/IOFileFilter;",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/io/File;",
            ">;TT;)TT;"
        }
    .end annotation

    .prologue
    .line 275
    .local p1, "files":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/io/File;>;"
    .local p2, "acceptedFiles":Ljava/util/Collection;, "TT;"
    if-nez p0, :cond_a

    .line 276
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "file filter is null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 278
    :cond_a
    if-eqz p1, :cond_30

    .line 279
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_10
    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_30

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 280
    .local v0, "file":Ljava/io/File;
    if-nez v0, :cond_26

    .line 281
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "file collection contains null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 283
    :cond_26
    invoke-interface {p0, v0}, Lorg/apache/commons/io/filefilter/IOFileFilter;->accept(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 284
    invoke-interface {p2, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 288
    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_30
    return-object p2
.end method

.method public static filter(Lorg/apache/commons/io/filefilter/IOFileFilter;Ljava/lang/Iterable;)[Ljava/io/File;
    .registers 4
    .param p0, "filter"    # Lorg/apache/commons/io/filefilter/IOFileFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/io/filefilter/IOFileFilter;",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/io/File;",
            ">;)[",
            "Ljava/io/File;"
        }
    .end annotation

    .prologue
    .line 127
    .local p1, "files":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/io/File;>;"
    invoke-static {p0, p1}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->filterList(Lorg/apache/commons/io/filefilter/IOFileFilter;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    .line 128
    .local v0, "acceptedFiles":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/io/File;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/io/File;

    return-object v1
.end method

.method public static varargs filter(Lorg/apache/commons/io/filefilter/IOFileFilter;[Ljava/io/File;)[Ljava/io/File;
    .registers 9
    .param p0, "filter"    # Lorg/apache/commons/io/filefilter/IOFileFilter;
    .param p1, "files"    # [Ljava/io/File;

    .prologue
    .line 82
    if-nez p0, :cond_a

    .line 83
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "file filter is null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 85
    :cond_a
    if-nez p1, :cond_10

    .line 86
    const/4 v5, 0x0

    new-array v5, v5, [Ljava/io/File;

    .line 97
    :goto_f
    return-object v5

    .line 88
    :cond_10
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 89
    .local v0, "acceptedFiles":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    move-object v1, p1

    .local v1, "arr$":[Ljava/io/File;
    array-length v4, v1

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_18
    if-ge v3, v4, :cond_32

    aget-object v2, v1, v3

    .line 90
    .local v2, "file":Ljava/io/File;
    if-nez v2, :cond_26

    .line 91
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "file array contains null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 93
    :cond_26
    invoke-interface {p0, v2}, Lorg/apache/commons/io/filefilter/IOFileFilter;->accept(Ljava/io/File;)Z

    move-result v5

    if-eqz v5, :cond_2f

    .line 94
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    :cond_2f
    add-int/lit8 v3, v3, 0x1

    goto :goto_18

    .line 97
    .end local v2    # "file":Ljava/io/File;
    :cond_32
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Ljava/io/File;

    invoke-interface {v0, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/io/File;

    goto :goto_f
.end method

.method public static filterList(Lorg/apache/commons/io/filefilter/IOFileFilter;Ljava/lang/Iterable;)Ljava/util/List;
    .registers 3
    .param p0, "filter"    # Lorg/apache/commons/io/filefilter/IOFileFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/io/filefilter/IOFileFilter;",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/io/File;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 157
    .local p1, "files":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/io/File;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p0, p1, v0}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->filter(Lorg/apache/commons/io/filefilter/IOFileFilter;Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public static varargs filterList(Lorg/apache/commons/io/filefilter/IOFileFilter;[Ljava/io/File;)Ljava/util/List;
    .registers 4
    .param p0, "filter"    # Lorg/apache/commons/io/filefilter/IOFileFilter;
    .param p1, "files"    # [Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/io/filefilter/IOFileFilter;",
            "[",
            "Ljava/io/File;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 186
    invoke-static {p0, p1}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->filter(Lorg/apache/commons/io/filefilter/IOFileFilter;[Ljava/io/File;)[Ljava/io/File;

    move-result-object v0

    .line 187
    .local v0, "acceptedFiles":[Ljava/io/File;
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public static filterSet(Lorg/apache/commons/io/filefilter/IOFileFilter;Ljava/lang/Iterable;)Ljava/util/Set;
    .registers 3
    .param p0, "filter"    # Lorg/apache/commons/io/filefilter/IOFileFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/io/filefilter/IOFileFilter;",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/io/File;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 248
    .local p1, "files":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/io/File;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {p0, p1, v0}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->filter(Lorg/apache/commons/io/filefilter/IOFileFilter;Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    return-object v0
.end method

.method public static varargs filterSet(Lorg/apache/commons/io/filefilter/IOFileFilter;[Ljava/io/File;)Ljava/util/Set;
    .registers 5
    .param p0, "filter"    # Lorg/apache/commons/io/filefilter/IOFileFilter;
    .param p1, "files"    # [Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/io/filefilter/IOFileFilter;",
            "[",
            "Ljava/io/File;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 217
    invoke-static {p0, p1}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->filter(Lorg/apache/commons/io/filefilter/IOFileFilter;[Ljava/io/File;)[Ljava/io/File;

    move-result-object v0

    .line 218
    .local v0, "acceptedFiles":[Ljava/io/File;
    new-instance v1, Ljava/util/HashSet;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v1
.end method

.method public static magicNumberFileFilter(Ljava/lang/String;)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 2
    .param p0, "magicNumber"    # Ljava/lang/String;

    .prologue
    .line 663
    new-instance v0, Lorg/apache/commons/io/filefilter/MagicNumberFileFilter;

    invoke-direct {v0, p0}, Lorg/apache/commons/io/filefilter/MagicNumberFileFilter;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static magicNumberFileFilter(Ljava/lang/String;J)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 4
    .param p0, "magicNumber"    # Ljava/lang/String;
    .param p1, "offset"    # J

    .prologue
    .line 684
    new-instance v0, Lorg/apache/commons/io/filefilter/MagicNumberFileFilter;

    invoke-direct {v0, p0, p1, p2}, Lorg/apache/commons/io/filefilter/MagicNumberFileFilter;-><init>(Ljava/lang/String;J)V

    return-object v0
.end method

.method public static magicNumberFileFilter([B)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 2
    .param p0, "magicNumber"    # [B

    .prologue
    .line 703
    new-instance v0, Lorg/apache/commons/io/filefilter/MagicNumberFileFilter;

    invoke-direct {v0, p0}, Lorg/apache/commons/io/filefilter/MagicNumberFileFilter;-><init>([B)V

    return-object v0
.end method

.method public static magicNumberFileFilter([BJ)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 4
    .param p0, "magicNumber"    # [B
    .param p1, "offset"    # J

    .prologue
    .line 724
    new-instance v0, Lorg/apache/commons/io/filefilter/MagicNumberFileFilter;

    invoke-direct {v0, p0, p1, p2}, Lorg/apache/commons/io/filefilter/MagicNumberFileFilter;-><init>([BJ)V

    return-object v0
.end method

.method public static makeCVSAware(Lorg/apache/commons/io/filefilter/IOFileFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 4
    .param p0, "filter"    # Lorg/apache/commons/io/filefilter/IOFileFilter;

    .prologue
    .line 746
    if-nez p0, :cond_5

    .line 747
    sget-object v0, Lorg/apache/commons/io/filefilter/FileFilterUtils;->cvsFilter:Lorg/apache/commons/io/filefilter/IOFileFilter;

    .line 749
    :goto_4
    return-object v0

    :cond_5
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/apache/commons/io/filefilter/IOFileFilter;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lorg/apache/commons/io/filefilter/FileFilterUtils;->cvsFilter:Lorg/apache/commons/io/filefilter/IOFileFilter;

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->and([Lorg/apache/commons/io/filefilter/IOFileFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;

    move-result-object v0

    goto :goto_4
.end method

.method public static makeDirectoryOnly(Lorg/apache/commons/io/filefilter/IOFileFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 3
    .param p0, "filter"    # Lorg/apache/commons/io/filefilter/IOFileFilter;

    .prologue
    .line 780
    if-nez p0, :cond_5

    .line 781
    sget-object v0, Lorg/apache/commons/io/filefilter/DirectoryFileFilter;->DIRECTORY:Lorg/apache/commons/io/filefilter/IOFileFilter;

    .line 783
    :goto_4
    return-object v0

    :cond_5
    new-instance v0, Lorg/apache/commons/io/filefilter/AndFileFilter;

    sget-object v1, Lorg/apache/commons/io/filefilter/DirectoryFileFilter;->DIRECTORY:Lorg/apache/commons/io/filefilter/IOFileFilter;

    invoke-direct {v0, v1, p0}, Lorg/apache/commons/io/filefilter/AndFileFilter;-><init>(Lorg/apache/commons/io/filefilter/IOFileFilter;Lorg/apache/commons/io/filefilter/IOFileFilter;)V

    goto :goto_4
.end method

.method public static makeFileOnly(Lorg/apache/commons/io/filefilter/IOFileFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 3
    .param p0, "filter"    # Lorg/apache/commons/io/filefilter/IOFileFilter;

    .prologue
    .line 795
    if-nez p0, :cond_5

    .line 796
    sget-object v0, Lorg/apache/commons/io/filefilter/FileFileFilter;->FILE:Lorg/apache/commons/io/filefilter/IOFileFilter;

    .line 798
    :goto_4
    return-object v0

    :cond_5
    new-instance v0, Lorg/apache/commons/io/filefilter/AndFileFilter;

    sget-object v1, Lorg/apache/commons/io/filefilter/FileFileFilter;->FILE:Lorg/apache/commons/io/filefilter/IOFileFilter;

    invoke-direct {v0, v1, p0}, Lorg/apache/commons/io/filefilter/AndFileFilter;-><init>(Lorg/apache/commons/io/filefilter/IOFileFilter;Lorg/apache/commons/io/filefilter/IOFileFilter;)V

    goto :goto_4
.end method

.method public static makeSVNAware(Lorg/apache/commons/io/filefilter/IOFileFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 4
    .param p0, "filter"    # Lorg/apache/commons/io/filefilter/IOFileFilter;

    .prologue
    .line 763
    if-nez p0, :cond_5

    .line 764
    sget-object v0, Lorg/apache/commons/io/filefilter/FileFilterUtils;->svnFilter:Lorg/apache/commons/io/filefilter/IOFileFilter;

    .line 766
    :goto_4
    return-object v0

    :cond_5
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/apache/commons/io/filefilter/IOFileFilter;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lorg/apache/commons/io/filefilter/FileFilterUtils;->svnFilter:Lorg/apache/commons/io/filefilter/IOFileFilter;

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->and([Lorg/apache/commons/io/filefilter/IOFileFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;

    move-result-object v0

    goto :goto_4
.end method

.method public static nameFileFilter(Ljava/lang/String;)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 347
    new-instance v0, Lorg/apache/commons/io/filefilter/NameFileFilter;

    invoke-direct {v0, p0}, Lorg/apache/commons/io/filefilter/NameFileFilter;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static nameFileFilter(Ljava/lang/String;Lorg/apache/commons/io/IOCase;)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "caseSensitivity"    # Lorg/apache/commons/io/IOCase;

    .prologue
    .line 360
    new-instance v0, Lorg/apache/commons/io/filefilter/NameFileFilter;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/io/filefilter/NameFileFilter;-><init>(Ljava/lang/String;Lorg/apache/commons/io/IOCase;)V

    return-object v0
.end method

.method public static notFileFilter(Lorg/apache/commons/io/filefilter/IOFileFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 2
    .param p0, "filter"    # Lorg/apache/commons/io/filefilter/IOFileFilter;

    .prologue
    .line 475
    new-instance v0, Lorg/apache/commons/io/filefilter/NotFileFilter;

    invoke-direct {v0, p0}, Lorg/apache/commons/io/filefilter/NotFileFilter;-><init>(Lorg/apache/commons/io/filefilter/IOFileFilter;)V

    return-object v0
.end method

.method public static varargs or([Lorg/apache/commons/io/filefilter/IOFileFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 3
    .param p0, "filters"    # [Lorg/apache/commons/io/filefilter/IOFileFilter;

    .prologue
    .line 441
    new-instance v0, Lorg/apache/commons/io/filefilter/OrFileFilter;

    invoke-static {p0}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->toList([Lorg/apache/commons/io/filefilter/IOFileFilter;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/io/filefilter/OrFileFilter;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method public static orFileFilter(Lorg/apache/commons/io/filefilter/IOFileFilter;Lorg/apache/commons/io/filefilter/IOFileFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 3
    .param p0, "filter1"    # Lorg/apache/commons/io/filefilter/IOFileFilter;
    .param p1, "filter2"    # Lorg/apache/commons/io/filefilter/IOFileFilter;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 411
    new-instance v0, Lorg/apache/commons/io/filefilter/OrFileFilter;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/io/filefilter/OrFileFilter;-><init>(Lorg/apache/commons/io/filefilter/IOFileFilter;Lorg/apache/commons/io/filefilter/IOFileFilter;)V

    return-object v0
.end method

.method public static prefixFileFilter(Ljava/lang/String;)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 2
    .param p0, "prefix"    # Ljava/lang/String;

    .prologue
    .line 299
    new-instance v0, Lorg/apache/commons/io/filefilter/PrefixFileFilter;

    invoke-direct {v0, p0}, Lorg/apache/commons/io/filefilter/PrefixFileFilter;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static prefixFileFilter(Ljava/lang/String;Lorg/apache/commons/io/IOCase;)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 3
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "caseSensitivity"    # Lorg/apache/commons/io/IOCase;

    .prologue
    .line 312
    new-instance v0, Lorg/apache/commons/io/filefilter/PrefixFileFilter;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/io/filefilter/PrefixFileFilter;-><init>(Ljava/lang/String;Lorg/apache/commons/io/IOCase;)V

    return-object v0
.end method

.method public static sizeFileFilter(J)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 3
    .param p0, "threshold"    # J

    .prologue
    .line 615
    new-instance v0, Lorg/apache/commons/io/filefilter/SizeFileFilter;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/io/filefilter/SizeFileFilter;-><init>(J)V

    return-object v0
.end method

.method public static sizeFileFilter(JZ)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 4
    .param p0, "threshold"    # J
    .param p2, "acceptLarger"    # Z

    .prologue
    .line 628
    new-instance v0, Lorg/apache/commons/io/filefilter/SizeFileFilter;

    invoke-direct {v0, p0, p1, p2}, Lorg/apache/commons/io/filefilter/SizeFileFilter;-><init>(JZ)V

    return-object v0
.end method

.method public static sizeRangeFileFilter(JJ)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 9
    .param p0, "minSizeInclusive"    # J
    .param p2, "maxSizeInclusive"    # J

    .prologue
    .line 642
    new-instance v1, Lorg/apache/commons/io/filefilter/SizeFileFilter;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, v2}, Lorg/apache/commons/io/filefilter/SizeFileFilter;-><init>(JZ)V

    .line 643
    .local v1, "minimumFilter":Lorg/apache/commons/io/filefilter/IOFileFilter;
    new-instance v0, Lorg/apache/commons/io/filefilter/SizeFileFilter;

    const-wide/16 v2, 0x1

    add-long/2addr v2, p2

    const/4 v4, 0x0

    invoke-direct {v0, v2, v3, v4}, Lorg/apache/commons/io/filefilter/SizeFileFilter;-><init>(JZ)V

    .line 644
    .local v0, "maximumFilter":Lorg/apache/commons/io/filefilter/IOFileFilter;
    new-instance v2, Lorg/apache/commons/io/filefilter/AndFileFilter;

    invoke-direct {v2, v1, v0}, Lorg/apache/commons/io/filefilter/AndFileFilter;-><init>(Lorg/apache/commons/io/filefilter/IOFileFilter;Lorg/apache/commons/io/filefilter/IOFileFilter;)V

    return-object v2
.end method

.method public static suffixFileFilter(Ljava/lang/String;)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 2
    .param p0, "suffix"    # Ljava/lang/String;

    .prologue
    .line 323
    new-instance v0, Lorg/apache/commons/io/filefilter/SuffixFileFilter;

    invoke-direct {v0, p0}, Lorg/apache/commons/io/filefilter/SuffixFileFilter;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static suffixFileFilter(Ljava/lang/String;Lorg/apache/commons/io/IOCase;)Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 3
    .param p0, "suffix"    # Ljava/lang/String;
    .param p1, "caseSensitivity"    # Lorg/apache/commons/io/IOCase;

    .prologue
    .line 336
    new-instance v0, Lorg/apache/commons/io/filefilter/SuffixFileFilter;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/io/filefilter/SuffixFileFilter;-><init>(Ljava/lang/String;Lorg/apache/commons/io/IOCase;)V

    return-object v0
.end method

.method public static varargs toList([Lorg/apache/commons/io/filefilter/IOFileFilter;)Ljava/util/List;
    .registers 6
    .param p0, "filters"    # [Lorg/apache/commons/io/filefilter/IOFileFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/apache/commons/io/filefilter/IOFileFilter;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/apache/commons/io/filefilter/IOFileFilter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 454
    if-nez p0, :cond_a

    .line 455
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The filters must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 457
    :cond_a
    new-instance v1, Ljava/util/ArrayList;

    array-length v2, p0

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 458
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Lorg/apache/commons/io/filefilter/IOFileFilter;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_11
    array-length v2, p0

    if-ge v0, v2, :cond_3f

    .line 459
    aget-object v2, p0, v0

    if-nez v2, :cond_37

    .line 460
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "The filter["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] is null"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 462
    :cond_37
    aget-object v2, p0, v0

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 458
    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    .line 464
    :cond_3f
    return-object v1
.end method

.method public static trueFileFilter()Lorg/apache/commons/io/filefilter/IOFileFilter;
    .registers 1

    .prologue
    .line 486
    sget-object v0, Lorg/apache/commons/io/filefilter/TrueFileFilter;->TRUE:Lorg/apache/commons/io/filefilter/IOFileFilter;

    return-object v0
.end method
