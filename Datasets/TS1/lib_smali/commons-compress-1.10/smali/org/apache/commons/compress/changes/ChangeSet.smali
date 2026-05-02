.class public final Lorg/apache/commons/compress/changes/ChangeSet;
.super Ljava/lang/Object;
.source "ChangeSet.java"


# instance fields
.field private final changes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/apache/commons/compress/changes/Change;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/changes/ChangeSet;->changes:Ljava/util/Set;

    return-void
.end method

.method private addAddition(Lorg/apache/commons/compress/changes/Change;)V
    .registers 7
    .param p1, "pChange"    # Lorg/apache/commons/compress/changes/Change;

    .prologue
    const/4 v4, 0x2

    .line 94
    invoke-virtual {p1}, Lorg/apache/commons/compress/changes/Change;->type()I

    move-result v3

    if-ne v4, v3, :cond_d

    invoke-virtual {p1}, Lorg/apache/commons/compress/changes/Change;->getInput()Ljava/io/InputStream;

    move-result-object v3

    if-nez v3, :cond_e

    .line 120
    :cond_d
    :goto_d
    return-void

    .line 99
    :cond_e
    iget-object v3, p0, Lorg/apache/commons/compress/changes/ChangeSet;->changes:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_51

    .line 100
    iget-object v3, p0, Lorg/apache/commons/compress/changes/ChangeSet;->changes:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/apache/commons/compress/changes/Change;>;"
    :cond_1c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_51

    .line 101
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/changes/Change;

    .line 102
    .local v0, "change":Lorg/apache/commons/compress/changes/Change;
    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->type()I

    move-result v3

    if-ne v3, v4, :cond_1c

    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->getEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;

    move-result-object v3

    if-eqz v3, :cond_1c

    .line 104
    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->getEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;

    move-result-object v1

    .line 106
    .local v1, "entry":Lorg/apache/commons/compress/archivers/ArchiveEntry;
    invoke-virtual {p1}, Lorg/apache/commons/compress/changes/Change;->getEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1c

    .line 107
    invoke-virtual {p1}, Lorg/apache/commons/compress/changes/Change;->isReplaceMode()Z

    move-result v3

    if-eqz v3, :cond_d

    .line 108
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 109
    iget-object v3, p0, Lorg/apache/commons/compress/changes/ChangeSet;->changes:Ljava/util/Set;

    invoke-interface {v3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 119
    .end local v0    # "change":Lorg/apache/commons/compress/changes/Change;
    .end local v1    # "entry":Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .end local v2    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/apache/commons/compress/changes/Change;>;"
    :cond_51
    iget-object v3, p0, Lorg/apache/commons/compress/changes/ChangeSet;->changes:Ljava/util/Set;

    invoke-interface {v3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_d
.end method

.method private addDeletion(Lorg/apache/commons/compress/changes/Change;)V
    .registers 10
    .param p1, "pChange"    # Lorg/apache/commons/compress/changes/Change;

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x1

    .line 129
    invoke-virtual {p1}, Lorg/apache/commons/compress/changes/Change;->type()I

    move-result v4

    if-eq v6, v4, :cond_e

    invoke-virtual {p1}, Lorg/apache/commons/compress/changes/Change;->type()I

    move-result v4

    if-ne v7, v4, :cond_14

    :cond_e
    invoke-virtual {p1}, Lorg/apache/commons/compress/changes/Change;->targetFile()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_15

    .line 157
    :cond_14
    :goto_14
    return-void

    .line 134
    :cond_15
    invoke-virtual {p1}, Lorg/apache/commons/compress/changes/Change;->targetFile()Ljava/lang/String;

    move-result-object v2

    .line 136
    .local v2, "source":Ljava/lang/String;
    if-eqz v2, :cond_7f

    iget-object v4, p0, Lorg/apache/commons/compress/changes/ChangeSet;->changes:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_7f

    .line 137
    iget-object v4, p0, Lorg/apache/commons/compress/changes/ChangeSet;->changes:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/apache/commons/compress/changes/Change;>;"
    :cond_29
    :goto_29
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7f

    .line 138
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/changes/Change;

    .line 139
    .local v0, "change":Lorg/apache/commons/compress/changes/Change;
    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->type()I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_29

    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->getEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;

    move-result-object v4

    if-eqz v4, :cond_29

    .line 141
    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->getEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/commons/compress/archivers/ArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v3

    .line 143
    .local v3, "target":Ljava/lang/String;
    if-eqz v3, :cond_29

    .line 147
    invoke-virtual {p1}, Lorg/apache/commons/compress/changes/Change;->type()I

    move-result v4

    if-ne v6, v4, :cond_5c

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5c

    .line 148
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_29

    .line 149
    :cond_5c
    invoke-virtual {p1}, Lorg/apache/commons/compress/changes/Change;->type()I

    move-result v4

    if-ne v7, v4, :cond_29

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/.*"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 151
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_29

    .line 156
    .end local v0    # "change":Lorg/apache/commons/compress/changes/Change;
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/apache/commons/compress/changes/Change;>;"
    .end local v3    # "target":Ljava/lang/String;
    :cond_7f
    iget-object v4, p0, Lorg/apache/commons/compress/changes/ChangeSet;->changes:Ljava/util/Set;

    invoke-interface {v4, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_14
.end method


# virtual methods
.method public add(Lorg/apache/commons/compress/archivers/ArchiveEntry;Ljava/io/InputStream;)V
    .registers 4
    .param p1, "pEntry"    # Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .param p2, "pInput"    # Ljava/io/InputStream;

    .prologue
    .line 68
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/compress/changes/ChangeSet;->add(Lorg/apache/commons/compress/archivers/ArchiveEntry;Ljava/io/InputStream;Z)V

    .line 69
    return-void
.end method

.method public add(Lorg/apache/commons/compress/archivers/ArchiveEntry;Ljava/io/InputStream;Z)V
    .registers 5
    .param p1, "pEntry"    # Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .param p2, "pInput"    # Ljava/io/InputStream;
    .param p3, "replace"    # Z

    .prologue
    .line 84
    new-instance v0, Lorg/apache/commons/compress/changes/Change;

    invoke-direct {v0, p1, p2, p3}, Lorg/apache/commons/compress/changes/Change;-><init>(Lorg/apache/commons/compress/archivers/ArchiveEntry;Ljava/io/InputStream;Z)V

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/changes/ChangeSet;->addAddition(Lorg/apache/commons/compress/changes/Change;)V

    .line 85
    return-void
.end method

.method public delete(Ljava/lang/String;)V
    .registers 4
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 46
    new-instance v0, Lorg/apache/commons/compress/changes/Change;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lorg/apache/commons/compress/changes/Change;-><init>(Ljava/lang/String;I)V

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/changes/ChangeSet;->addDeletion(Lorg/apache/commons/compress/changes/Change;)V

    .line 47
    return-void
.end method

.method public deleteDir(Ljava/lang/String;)V
    .registers 4
    .param p1, "dirName"    # Ljava/lang/String;

    .prologue
    .line 56
    new-instance v0, Lorg/apache/commons/compress/changes/Change;

    const/4 v1, 0x4

    invoke-direct {v0, p1, v1}, Lorg/apache/commons/compress/changes/Change;-><init>(Ljava/lang/String;I)V

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/changes/ChangeSet;->addDeletion(Lorg/apache/commons/compress/changes/Change;)V

    .line 57
    return-void
.end method

.method getChanges()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/apache/commons/compress/changes/Change;",
            ">;"
        }
    .end annotation

    .prologue
    .line 165
    new-instance v0, Ljava/util/LinkedHashSet;

    iget-object v1, p0, Lorg/apache/commons/compress/changes/ChangeSet;->changes:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method
