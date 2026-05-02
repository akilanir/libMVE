.class public Lcom/koushikdutta/async/util/FileUtility;
.super Ljava/lang/Object;
.source "FileUtility.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static deleteDirectory(Ljava/io/File;)Z
    .registers 4
    .param p0, "path"    # Ljava/io/File;

    .prologue
    .line 10
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_26

    .line 11
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 12
    .local v0, "files":[Ljava/io/File;
    if-eqz v0, :cond_26

    .line 13
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_d
    array-length v2, v0

    if-ge v1, v2, :cond_26

    .line 14
    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_20

    .line 15
    aget-object v2, v0, v1

    invoke-static {v2}, Lcom/koushikdutta/async/util/FileUtility;->deleteDirectory(Ljava/io/File;)Z

    .line 13
    :goto_1d
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 18
    :cond_20
    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    goto :goto_1d

    .line 23
    .end local v0    # "files":[Ljava/io/File;
    .end local v1    # "i":I
    :cond_26
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v2

    return v2
.end method
