.class public final Lcom/drew/metadata/Metadata;
.super Ljava/lang/Object;
.source "Metadata.java"


# instance fields
.field private final _directories:Ljava/util/List;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/drew/metadata/Directory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/drew/metadata/Metadata;->_directories:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addDirectory(Lcom/drew/metadata/Directory;)V
    .registers 3
    .param p1    # Lcom/drew/metadata/Directory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/drew/metadata/Directory;",
            ">(TT;)V"
        }
    .end annotation

    .prologue
    .line 85
    .local p1, "directory":Lcom/drew/metadata/Directory;, "TT;"
    iget-object v0, p0, Lcom/drew/metadata/Metadata;->_directories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    return-void
.end method

.method public containsDirectoryOfType(Ljava/lang/Class;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcom/drew/metadata/Directory;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 115
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/drew/metadata/Directory;>;"
    iget-object v2, p0, Lcom/drew/metadata/Metadata;->_directories:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/drew/metadata/Directory;

    .line 116
    .local v0, "dir":Lcom/drew/metadata/Directory;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 117
    const/4 v2, 0x1

    .line 119
    .end local v0    # "dir":Lcom/drew/metadata/Directory;
    :goto_1d
    return v2

    :cond_1e
    const/4 v2, 0x0

    goto :goto_1d
.end method

.method public getDirectories()Ljava/lang/Iterable;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/drew/metadata/Directory;",
            ">;"
        }
    .end annotation

    .prologue
    .line 52
    iget-object v0, p0, Lcom/drew/metadata/Metadata;->_directories:Ljava/util/List;

    return-object v0
.end method

.method public getDirectoriesOfType(Ljava/lang/Class;)Ljava/util/Collection;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/drew/metadata/Directory;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/Collection",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 59
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .local v1, "directories":Ljava/util/List;, "Ljava/util/List<TT;>;"
    iget-object v3, p0, Lcom/drew/metadata/Metadata;->_directories:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_b
    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_25

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/drew/metadata/Directory;

    .line 61
    .local v0, "dir":Lcom/drew/metadata/Directory;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 62
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 65
    .end local v0    # "dir":Lcom/drew/metadata/Directory;
    :cond_25
    return-object v1
.end method

.method public getDirectoryCount()I
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lcom/drew/metadata/Metadata;->_directories:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getFirstDirectoryOfType(Ljava/lang/Class;)Lcom/drew/metadata/Directory;
    .registers 5
    .param p1    # Ljava/lang/Class;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/drew/metadata/Directory;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 100
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v2, p0, Lcom/drew/metadata/Metadata;->_directories:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/drew/metadata/Directory;

    .line 101
    .local v0, "dir":Lcom/drew/metadata/Directory;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 104
    .end local v0    # "dir":Lcom/drew/metadata/Directory;
    :goto_1c
    return-object v0

    :cond_1d
    const/4 v0, 0x0

    goto :goto_1c
.end method

.method public hasErrors()Z
    .registers 4

    .prologue
    .line 130
    invoke-virtual {p0}, Lcom/drew/metadata/Metadata;->getDirectories()Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/drew/metadata/Directory;

    .line 131
    .local v0, "directory":Lcom/drew/metadata/Directory;
    invoke-virtual {v0}, Lcom/drew/metadata/Directory;->hasErrors()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 132
    const/4 v2, 0x1

    .line 134
    .end local v0    # "directory":Lcom/drew/metadata/Directory;
    :goto_1b
    return v2

    :cond_1c
    const/4 v2, 0x0

    goto :goto_1b
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    const/4 v5, 0x1

    .line 140
    invoke-virtual {p0}, Lcom/drew/metadata/Metadata;->getDirectoryCount()I

    move-result v0

    .line 141
    .local v0, "count":I
    const-string v2, "Metadata (%d %s)"

    const/4 v1, 0x2

    new-array v3, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v1

    if-ne v0, v5, :cond_1c

    const-string v1, "directory"

    :goto_15
    aput-object v1, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    :cond_1c
    const-string v1, "directories"

    goto :goto_15
.end method
