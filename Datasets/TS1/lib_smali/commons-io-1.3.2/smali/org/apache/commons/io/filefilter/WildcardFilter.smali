.class public Lorg/apache/commons/io/filefilter/WildcardFilter;
.super Lorg/apache/commons/io/filefilter/AbstractFileFilter;
.source "WildcardFilter.java"


# instance fields
.field private wildcards:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "wildcard"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-direct {p0}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;-><init>()V

    .line 64
    if-nez p1, :cond_d

    .line 65
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The wildcard must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 67
    :cond_d
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    iput-object v0, p0, Lorg/apache/commons/io/filefilter/WildcardFilter;->wildcards:[Ljava/lang/String;

    .line 68
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 4
    .param p1, "wildcards"    # Ljava/util/List;

    .prologue
    .line 90
    invoke-direct {p0}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;-><init>()V

    .line 91
    if-nez p1, :cond_d

    .line 92
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The wildcard list must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 94
    :cond_d
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/commons/io/filefilter/WildcardFilter;->wildcards:[Ljava/lang/String;

    .line 95
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .registers 4
    .param p1, "wildcards"    # [Ljava/lang/String;

    .prologue
    .line 76
    invoke-direct {p0}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;-><init>()V

    .line 77
    if-nez p1, :cond_d

    .line 78
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The wildcard array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 80
    :cond_d
    iput-object p1, p0, Lorg/apache/commons/io/filefilter/WildcardFilter;->wildcards:[Ljava/lang/String;

    .line 81
    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;)Z
    .registers 6
    .param p1, "file"    # Ljava/io/File;

    .prologue
    const/4 v1, 0x0

    .line 126
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 136
    :cond_7
    :goto_7
    return v1

    .line 130
    :cond_8
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    iget-object v2, p0, Lorg/apache/commons/io/filefilter/WildcardFilter;->wildcards:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_7

    .line 131
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/io/filefilter/WildcardFilter;->wildcards:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-static {v2, v3}, Lorg/apache/commons/io/FilenameUtils;->wildcardMatch(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 132
    const/4 v1, 0x1

    goto :goto_7

    .line 130
    :cond_1e
    add-int/lit8 v0, v0, 0x1

    goto :goto_9
.end method

.method public accept(Ljava/io/File;Ljava/lang/String;)Z
    .registers 6
    .param p1, "dir"    # Ljava/io/File;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 106
    if-eqz p1, :cond_f

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_f

    .line 116
    :cond_e
    :goto_e
    return v1

    .line 110
    :cond_f
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    iget-object v2, p0, Lorg/apache/commons/io/filefilter/WildcardFilter;->wildcards:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_e

    .line 111
    iget-object v2, p0, Lorg/apache/commons/io/filefilter/WildcardFilter;->wildcards:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-static {p2, v2}, Lorg/apache/commons/io/FilenameUtils;->wildcardMatch(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_21

    .line 112
    const/4 v1, 0x1

    goto :goto_e

    .line 110
    :cond_21
    add-int/lit8 v0, v0, 0x1

    goto :goto_10
.end method
