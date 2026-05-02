.class public abstract Lorg/springframework/core/io/AbstractResource;
.super Ljava/lang/Object;
.source "AbstractResource.java"

# interfaces
.implements Lorg/springframework/core/io/Resource;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public contentLength()J
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 116
    invoke-virtual {p0}, Lorg/springframework/core/io/AbstractResource;->getFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public createRelative(Ljava/lang/String;)Lorg/springframework/core/io/Resource;
    .registers 5
    .param p1, "relativePath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    new-instance v0, Ljava/io/FileNotFoundException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot create a relative resource for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/springframework/core/io/AbstractResource;->getDescription()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 176
    if-eq p1, p0, :cond_16

    instance-of v0, p1, Lorg/springframework/core/io/Resource;

    if-eqz v0, :cond_18

    check-cast p1, Lorg/springframework/core/io/Resource;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/springframework/core/io/Resource;->getDescription()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lorg/springframework/core/io/AbstractResource;->getDescription()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    :cond_16
    const/4 v0, 0x1

    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method

.method public exists()Z
    .registers 5

    .prologue
    .line 51
    :try_start_0
    invoke-virtual {p0}, Lorg/springframework/core/io/AbstractResource;->getFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->exists()Z
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_7} :catch_9

    move-result v3

    .line 61
    :goto_8
    return v3

    .line 53
    :catch_9
    move-exception v0

    .line 56
    .local v0, "ex":Ljava/io/IOException;
    :try_start_a
    invoke-virtual {p0}, Lorg/springframework/core/io/AbstractResource;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 57
    .local v1, "is":Ljava/io/InputStream;
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_11
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_11} :catch_13

    .line 58
    const/4 v3, 0x1

    goto :goto_8

    .line 60
    .end local v1    # "is":Ljava/io/InputStream;
    :catch_13
    move-exception v2

    .line 61
    .local v2, "isEx":Ljava/lang/Throwable;
    const/4 v3, 0x0

    goto :goto_8
.end method

.method public getFile()Ljava/io/File;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    new-instance v0, Ljava/io/FileNotFoundException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/springframework/core/io/AbstractResource;->getDescription()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " cannot be resolved to absolute file path"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected getFileForLastModifiedCheck()Ljava/io/File;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 141
    invoke-virtual {p0}, Lorg/springframework/core/io/AbstractResource;->getFile()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getFilename()Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 157
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/springframework/core/io/AbstractResource;->getDescription()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " does not have a filename"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getURI()Ljava/net/URI;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    invoke-virtual {p0}, Lorg/springframework/core/io/AbstractResource;->getURL()Ljava/net/URL;

    move-result-object v1

    .line 95
    .local v1, "url":Ljava/net/URL;
    :try_start_4
    invoke-static {v1}, Lorg/springframework/util/ResourceUtils;->toURI(Ljava/net/URL;)Ljava/net/URI;
    :try_end_7
    .catch Ljava/net/URISyntaxException; {:try_start_4 .. :try_end_7} :catch_9

    move-result-object v2

    return-object v2

    .line 97
    :catch_9
    move-exception v0

    .line 98
    .local v0, "ex":Ljava/net/URISyntaxException;
    new-instance v2, Lorg/springframework/core/NestedIOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid URI ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lorg/springframework/core/NestedIOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public getURL()Ljava/net/URL;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    new-instance v0, Ljava/io/FileNotFoundException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/springframework/core/io/AbstractResource;->getDescription()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " cannot be resolved to URL"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 186
    invoke-virtual {p0}, Lorg/springframework/core/io/AbstractResource;->getDescription()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public isOpen()Z
    .registers 2

    .prologue
    .line 77
    const/4 v0, 0x0

    return v0
.end method

.method public isReadable()Z
    .registers 2

    .prologue
    .line 70
    const/4 v0, 0x1

    return v0
.end method

.method public lastModified()J
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    invoke-virtual {p0}, Lorg/springframework/core/io/AbstractResource;->getFileForLastModifiedCheck()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    .line 126
    .local v0, "lastModified":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_2b

    .line 127
    new-instance v2, Ljava/io/FileNotFoundException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/springframework/core/io/AbstractResource;->getDescription()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " cannot be resolved in the file system for resolving its last-modified timestamp"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 130
    :cond_2b
    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 167
    invoke-virtual {p0}, Lorg/springframework/core/io/AbstractResource;->getDescription()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
