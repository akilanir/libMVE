.class public Lorg/junit/rules/TemporaryFolder;
.super Lorg/junit/rules/ExternalResource;
.source "TemporaryFolder.java"


# instance fields
.field private folder:Ljava/io/File;

.field private final parentFolder:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 36
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/junit/rules/TemporaryFolder;-><init>(Ljava/io/File;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .registers 2
    .param p1, "parentFolder"    # Ljava/io/File;

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/junit/rules/ExternalResource;-><init>()V

    .line 40
    iput-object p1, p0, Lorg/junit/rules/TemporaryFolder;->parentFolder:Ljava/io/File;

    .line 41
    return-void
.end method

.method private createTemporaryFolderIn(Ljava/io/File;)Ljava/io/File;
    .registers 5
    .param p1, "parentFolder"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 134
    const-string v1, "junit"

    const-string v2, ""

    invoke-static {v1, v2, p1}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    .line 135
    .local v0, "createdFolder":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 136
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    .line 137
    return-object v0
.end method

.method private isLastElementInArray(I[Ljava/lang/String;)Z
    .registers 4
    .param p1, "index"    # I
    .param p2, "array"    # [Ljava/lang/String;

    .prologue
    .line 123
    array-length v0, p2

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method private recursiveDelete(Ljava/io/File;)V
    .registers 7
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 162
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 163
    .local v2, "files":[Ljava/io/File;
    if-eqz v2, :cond_13

    .line 164
    move-object v0, v2

    .local v0, "arr$":[Ljava/io/File;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_9
    if-ge v3, v4, :cond_13

    aget-object v1, v0, v3

    .line 165
    .local v1, "each":Ljava/io/File;
    invoke-direct {p0, v1}, Lorg/junit/rules/TemporaryFolder;->recursiveDelete(Ljava/io/File;)V

    .line 164
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    .line 168
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v1    # "each":Ljava/io/File;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_13
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 169
    return-void
.end method

.method private validateFolderName(Ljava/lang/String;)V
    .registers 5
    .param p1, "folderName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 114
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 115
    .local v1, "tempFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_13

    .line 116
    const-string v0, "Folder name cannot consist of multiple path components separated by a file separator. Please use newFolder(\'MyParentFolder\',\'MyFolder\') to create hierarchies of folders"

    .line 118
    .local v0, "errorMsg":Ljava/lang/String;
    new-instance v2, Ljava/io/IOException;

    invoke-direct {v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 120
    .end local v0    # "errorMsg":Ljava/lang/String;
    :cond_13
    return-void
.end method


# virtual methods
.method protected after()V
    .registers 1

    .prologue
    .line 50
    invoke-virtual {p0}, Lorg/junit/rules/TemporaryFolder;->delete()V

    .line 51
    return-void
.end method

.method protected before()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 45
    invoke-virtual {p0}, Lorg/junit/rules/TemporaryFolder;->create()V

    .line 46
    return-void
.end method

.method public create()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    iget-object v0, p0, Lorg/junit/rules/TemporaryFolder;->parentFolder:Ljava/io/File;

    invoke-direct {p0, v0}, Lorg/junit/rules/TemporaryFolder;->createTemporaryFolderIn(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/rules/TemporaryFolder;->folder:Ljava/io/File;

    .line 60
    return-void
.end method

.method public delete()V
    .registers 2

    .prologue
    .line 156
    iget-object v0, p0, Lorg/junit/rules/TemporaryFolder;->folder:Ljava/io/File;

    if-eqz v0, :cond_9

    .line 157
    iget-object v0, p0, Lorg/junit/rules/TemporaryFolder;->folder:Ljava/io/File;

    invoke-direct {p0, v0}, Lorg/junit/rules/TemporaryFolder;->recursiveDelete(Ljava/io/File;)V

    .line 159
    :cond_9
    return-void
.end method

.method public getRoot()Ljava/io/File;
    .registers 3

    .prologue
    .line 144
    iget-object v0, p0, Lorg/junit/rules/TemporaryFolder;->folder:Ljava/io/File;

    if-nez v0, :cond_c

    .line 145
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "the temporary folder has not yet been created"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 148
    :cond_c
    iget-object v0, p0, Lorg/junit/rules/TemporaryFolder;->folder:Ljava/io/File;

    return-object v0
.end method

.method public newFile()Ljava/io/File;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    const-string v0, "junit"

    const/4 v1, 0x0

    invoke-virtual {p0}, Lorg/junit/rules/TemporaryFolder;->getRoot()Ljava/io/File;

    move-result-object v2

    invoke-static {v0, v1, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public newFile(Ljava/lang/String;)Ljava/io/File;
    .registers 6
    .param p1, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/junit/rules/TemporaryFolder;->getRoot()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 67
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z

    move-result v1

    if-nez v1, :cond_2e

    .line 68
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "a file with the name \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' already exists in the test folder"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 71
    :cond_2e
    return-object v0
.end method

.method public newFolder()Ljava/io/File;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    invoke-virtual {p0}, Lorg/junit/rules/TemporaryFolder;->getRoot()Ljava/io/File;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/junit/rules/TemporaryFolder;->createTemporaryFolderIn(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public newFolder(Ljava/lang/String;)Ljava/io/File;
    .registers 4
    .param p1, "folder"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0}, Lorg/junit/rules/TemporaryFolder;->newFolder([Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public varargs newFolder([Ljava/lang/String;)Ljava/io/File;
    .registers 9
    .param p1, "folderNames"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    invoke-virtual {p0}, Lorg/junit/rules/TemporaryFolder;->getRoot()Ljava/io/File;

    move-result-object v0

    .line 95
    .local v0, "file":Ljava/io/File;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_5
    array-length v4, p1

    if-ge v3, v4, :cond_41

    .line 96
    aget-object v2, p1, v3

    .line 97
    .local v2, "folderName":Ljava/lang/String;
    invoke-direct {p0, v2}, Lorg/junit/rules/TemporaryFolder;->validateFolderName(Ljava/lang/String;)V

    .line 98
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 99
    .end local v0    # "file":Ljava/io/File;
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z

    move-result v4

    if-nez v4, :cond_3d

    invoke-direct {p0, v3, p1}, Lorg/junit/rules/TemporaryFolder;->isLastElementInArray(I[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3d

    .line 100
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "a folder with the name \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\' already exists"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 95
    :cond_3d
    add-int/lit8 v3, v3, 0x1

    move-object v0, v1

    .end local v1    # "file":Ljava/io/File;
    .restart local v0    # "file":Ljava/io/File;
    goto :goto_5

    .line 104
    .end local v2    # "folderName":Ljava/lang/String;
    :cond_41
    return-object v0
.end method
