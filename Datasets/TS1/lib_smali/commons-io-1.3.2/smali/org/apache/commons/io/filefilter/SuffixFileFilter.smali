.class public Lorg/apache/commons/io/filefilter/SuffixFileFilter;
.super Lorg/apache/commons/io/filefilter/AbstractFileFilter;
.source "SuffixFileFilter.java"


# instance fields
.field private suffixes:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "suffix"    # Ljava/lang/String;

    .prologue
    .line 56
    invoke-direct {p0}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;-><init>()V

    .line 57
    if-nez p1, :cond_d

    .line 58
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The suffix must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 60
    :cond_d
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    iput-object v0, p0, Lorg/apache/commons/io/filefilter/SuffixFileFilter;->suffixes:[Ljava/lang/String;

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 4
    .param p1, "suffixes"    # Ljava/util/List;

    .prologue
    .line 86
    invoke-direct {p0}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;-><init>()V

    .line 87
    if-nez p1, :cond_d

    .line 88
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The list of suffixes must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 90
    :cond_d
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/commons/io/filefilter/SuffixFileFilter;->suffixes:[Ljava/lang/String;

    .line 91
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .registers 4
    .param p1, "suffixes"    # [Ljava/lang/String;

    .prologue
    .line 72
    invoke-direct {p0}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;-><init>()V

    .line 73
    if-nez p1, :cond_d

    .line 74
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The array of suffixes must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 76
    :cond_d
    iput-object p1, p0, Lorg/apache/commons/io/filefilter/SuffixFileFilter;->suffixes:[Ljava/lang/String;

    .line 77
    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;)Z
    .registers 5
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 100
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    .line 101
    .local v1, "name":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    iget-object v2, p0, Lorg/apache/commons/io/filefilter/SuffixFileFilter;->suffixes:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_19

    .line 102
    iget-object v2, p0, Lorg/apache/commons/io/filefilter/SuffixFileFilter;->suffixes:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_16

    .line 103
    const/4 v2, 0x1

    .line 106
    :goto_15
    return v2

    .line 101
    :cond_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 106
    :cond_19
    const/4 v2, 0x0

    goto :goto_15
.end method

.method public accept(Ljava/io/File;Ljava/lang/String;)Z
    .registers 5
    .param p1, "file"    # Ljava/io/File;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 117
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lorg/apache/commons/io/filefilter/SuffixFileFilter;->suffixes:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_15

    .line 118
    iget-object v1, p0, Lorg/apache/commons/io/filefilter/SuffixFileFilter;->suffixes:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 119
    const/4 v1, 0x1

    .line 122
    :goto_11
    return v1

    .line 117
    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 122
    :cond_15
    const/4 v1, 0x0

    goto :goto_11
.end method
