.class public Lorg/apache/commons/io/filefilter/OrFileFilter;
.super Lorg/apache/commons/io/filefilter/AbstractFileFilter;
.source "OrFileFilter.java"

# interfaces
.implements Lorg/apache/commons/io/filefilter/ConditionalFileFilter;


# instance fields
.field private fileFilters:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;-><init>()V

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/io/filefilter/OrFileFilter;->fileFilters:Ljava/util/List;

    .line 51
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 3
    .param p1, "fileFilters"    # Ljava/util/List;

    .prologue
    .line 60
    invoke-direct {p0}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;-><init>()V

    .line 61
    if-nez p1, :cond_d

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/io/filefilter/OrFileFilter;->fileFilters:Ljava/util/List;

    .line 66
    :goto_c
    return-void

    .line 64
    :cond_d
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lorg/apache/commons/io/filefilter/OrFileFilter;->fileFilters:Ljava/util/List;

    goto :goto_c
.end method

.method public constructor <init>(Lorg/apache/commons/io/filefilter/IOFileFilter;Lorg/apache/commons/io/filefilter/IOFileFilter;)V
    .registers 5
    .param p1, "filter1"    # Lorg/apache/commons/io/filefilter/IOFileFilter;
    .param p2, "filter2"    # Lorg/apache/commons/io/filefilter/IOFileFilter;

    .prologue
    .line 75
    invoke-direct {p0}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;-><init>()V

    .line 76
    if-eqz p1, :cond_7

    if-nez p2, :cond_f

    .line 77
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The filters must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 79
    :cond_f
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/io/filefilter/OrFileFilter;->fileFilters:Ljava/util/List;

    .line 80
    invoke-virtual {p0, p1}, Lorg/apache/commons/io/filefilter/OrFileFilter;->addFileFilter(Lorg/apache/commons/io/filefilter/IOFileFilter;)V

    .line 81
    invoke-virtual {p0, p2}, Lorg/apache/commons/io/filefilter/OrFileFilter;->addFileFilter(Lorg/apache/commons/io/filefilter/IOFileFilter;)V

    .line 82
    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;)Z
    .registers 5
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 116
    iget-object v2, p0, Lorg/apache/commons/io/filefilter/OrFileFilter;->fileFilters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 117
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/io/filefilter/IOFileFilter;

    .line 118
    .local v0, "fileFilter":Lorg/apache/commons/io/filefilter/IOFileFilter;
    invoke-interface {v0, p1}, Lorg/apache/commons/io/filefilter/IOFileFilter;->accept(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 119
    const/4 v2, 0x1

    .line 122
    .end local v0    # "fileFilter":Lorg/apache/commons/io/filefilter/IOFileFilter;
    :goto_19
    return v2

    :cond_1a
    const/4 v2, 0x0

    goto :goto_19
.end method

.method public accept(Ljava/io/File;Ljava/lang/String;)Z
    .registers 6
    .param p1, "file"    # Ljava/io/File;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 129
    iget-object v2, p0, Lorg/apache/commons/io/filefilter/OrFileFilter;->fileFilters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 130
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/io/filefilter/IOFileFilter;

    .line 131
    .local v0, "fileFilter":Lorg/apache/commons/io/filefilter/IOFileFilter;
    invoke-interface {v0, p1, p2}, Lorg/apache/commons/io/filefilter/IOFileFilter;->accept(Ljava/io/File;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 132
    const/4 v2, 0x1

    .line 135
    .end local v0    # "fileFilter":Lorg/apache/commons/io/filefilter/IOFileFilter;
    :goto_19
    return v2

    :cond_1a
    const/4 v2, 0x0

    goto :goto_19
.end method

.method public addFileFilter(Lorg/apache/commons/io/filefilter/IOFileFilter;)V
    .registers 3
    .param p1, "ioFileFilter"    # Lorg/apache/commons/io/filefilter/IOFileFilter;

    .prologue
    .line 88
    iget-object v0, p0, Lorg/apache/commons/io/filefilter/OrFileFilter;->fileFilters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    return-void
.end method

.method public getFileFilters()Ljava/util/List;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lorg/apache/commons/io/filefilter/OrFileFilter;->fileFilters:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public removeFileFilter(Lorg/apache/commons/io/filefilter/IOFileFilter;)Z
    .registers 3
    .param p1, "ioFileFilter"    # Lorg/apache/commons/io/filefilter/IOFileFilter;

    .prologue
    .line 102
    iget-object v0, p0, Lorg/apache/commons/io/filefilter/OrFileFilter;->fileFilters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setFileFilters(Ljava/util/List;)V
    .registers 2
    .param p1, "fileFilters"    # Ljava/util/List;

    .prologue
    .line 109
    iput-object p1, p0, Lorg/apache/commons/io/filefilter/OrFileFilter;->fileFilters:Ljava/util/List;

    .line 110
    return-void
.end method
