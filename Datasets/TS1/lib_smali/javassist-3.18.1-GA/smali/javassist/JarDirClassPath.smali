.class final Ljavassist/JarDirClassPath;
.super Ljava/lang/Object;
.source "ClassPoolTail.java"

# interfaces
.implements Ljavassist/ClassPath;


# instance fields
.field jars:[Ljavassist/JarClassPath;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 7
    .param p1, "dirName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljavassist/JarDirClassPath$1;

    invoke-direct {v3, p0}, Ljavassist/JarDirClassPath$1;-><init>(Ljavassist/JarDirClassPath;)V

    invoke-virtual {v2, v3}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v0

    .line 87
    .local v0, "files":[Ljava/io/File;
    if-eqz v0, :cond_2e

    .line 88
    array-length v2, v0

    new-array v2, v2, [Ljavassist/JarClassPath;

    iput-object v2, p0, Ljavassist/JarDirClassPath;->jars:[Ljavassist/JarClassPath;

    .line 89
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_19
    array-length v2, v0

    if-ge v1, v2, :cond_2e

    .line 90
    iget-object v2, p0, Ljavassist/JarDirClassPath;->jars:[Ljavassist/JarClassPath;

    new-instance v3, Ljavassist/JarClassPath;

    aget-object v4, v0, v1

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljavassist/JarClassPath;-><init>(Ljava/lang/String;)V

    aput-object v3, v2, v1

    .line 89
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .line 92
    .end local v1    # "i":I
    :cond_2e
    return-void
.end method


# virtual methods
.method public close()V
    .registers 3

    .prologue
    .line 117
    iget-object v1, p0, Ljavassist/JarDirClassPath;->jars:[Ljavassist/JarClassPath;

    if-eqz v1, :cond_14

    .line 118
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    iget-object v1, p0, Ljavassist/JarDirClassPath;->jars:[Ljavassist/JarClassPath;

    array-length v1, v1

    if-ge v0, v1, :cond_14

    .line 119
    iget-object v1, p0, Ljavassist/JarDirClassPath;->jars:[Ljavassist/JarClassPath;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Ljavassist/JarClassPath;->close()V

    .line 118
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 120
    .end local v0    # "i":I
    :cond_14
    return-void
.end method

.method public find(Ljava/lang/String;)Ljava/net/URL;
    .registers 5
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 106
    iget-object v2, p0, Ljavassist/JarDirClassPath;->jars:[Ljavassist/JarClassPath;

    if-eqz v2, :cond_18

    .line 107
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    iget-object v2, p0, Ljavassist/JarDirClassPath;->jars:[Ljavassist/JarClassPath;

    array-length v2, v2

    if-ge v0, v2, :cond_18

    .line 108
    iget-object v2, p0, Ljavassist/JarDirClassPath;->jars:[Ljavassist/JarClassPath;

    aget-object v2, v2, v0

    invoke-virtual {v2, p1}, Ljavassist/JarClassPath;->find(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v1

    .line 109
    .local v1, "url":Ljava/net/URL;
    if-eqz v1, :cond_15

    .line 113
    .end local v0    # "i":I
    .end local v1    # "url":Ljava/net/URL;
    :goto_14
    return-object v1

    .line 107
    .restart local v0    # "i":I
    .restart local v1    # "url":Ljava/net/URL;
    :cond_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 113
    .end local v0    # "i":I
    .end local v1    # "url":Ljava/net/URL;
    :cond_18
    const/4 v1, 0x0

    goto :goto_14
.end method

.method public openClassfile(Ljava/lang/String;)Ljava/io/InputStream;
    .registers 5
    .param p1, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 95
    iget-object v2, p0, Ljavassist/JarDirClassPath;->jars:[Ljavassist/JarClassPath;

    if-eqz v2, :cond_18

    .line 96
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    iget-object v2, p0, Ljavassist/JarDirClassPath;->jars:[Ljavassist/JarClassPath;

    array-length v2, v2

    if-ge v0, v2, :cond_18

    .line 97
    iget-object v2, p0, Ljavassist/JarDirClassPath;->jars:[Ljavassist/JarClassPath;

    aget-object v2, v2, v0

    invoke-virtual {v2, p1}, Ljavassist/JarClassPath;->openClassfile(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 98
    .local v1, "is":Ljava/io/InputStream;
    if-eqz v1, :cond_15

    .line 102
    .end local v0    # "i":I
    .end local v1    # "is":Ljava/io/InputStream;
    :goto_14
    return-object v1

    .line 96
    .restart local v0    # "i":I
    .restart local v1    # "is":Ljava/io/InputStream;
    :cond_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 102
    .end local v0    # "i":I
    .end local v1    # "is":Ljava/io/InputStream;
    :cond_18
    const/4 v1, 0x0

    goto :goto_14
.end method
