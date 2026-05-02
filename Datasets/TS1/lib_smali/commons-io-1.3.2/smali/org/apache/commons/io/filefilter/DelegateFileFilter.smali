.class public Lorg/apache/commons/io/filefilter/DelegateFileFilter;
.super Lorg/apache/commons/io/filefilter/AbstractFileFilter;
.source "DelegateFileFilter.java"


# instance fields
.field private fileFilter:Ljava/io/FileFilter;

.field private filenameFilter:Ljava/io/FilenameFilter;


# direct methods
.method public constructor <init>(Ljava/io/FileFilter;)V
    .registers 4
    .param p1, "filter"    # Ljava/io/FileFilter;

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;-><init>()V

    .line 56
    if-nez p1, :cond_d

    .line 57
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The FileFilter must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 59
    :cond_d
    iput-object p1, p0, Lorg/apache/commons/io/filefilter/DelegateFileFilter;->fileFilter:Ljava/io/FileFilter;

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/io/FilenameFilter;)V
    .registers 4
    .param p1, "filter"    # Ljava/io/FilenameFilter;

    .prologue
    .line 43
    invoke-direct {p0}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;-><init>()V

    .line 44
    if-nez p1, :cond_d

    .line 45
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The FilenameFilter must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 47
    :cond_d
    iput-object p1, p0, Lorg/apache/commons/io/filefilter/DelegateFileFilter;->filenameFilter:Ljava/io/FilenameFilter;

    .line 48
    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;)Z
    .registers 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 69
    iget-object v0, p0, Lorg/apache/commons/io/filefilter/DelegateFileFilter;->fileFilter:Ljava/io/FileFilter;

    if-eqz v0, :cond_b

    .line 70
    iget-object v0, p0, Lorg/apache/commons/io/filefilter/DelegateFileFilter;->fileFilter:Ljava/io/FileFilter;

    invoke-interface {v0, p1}, Ljava/io/FileFilter;->accept(Ljava/io/File;)Z

    move-result v0

    .line 72
    :goto_a
    return v0

    :cond_b
    invoke-super {p0, p1}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;->accept(Ljava/io/File;)Z

    move-result v0

    goto :goto_a
.end method

.method public accept(Ljava/io/File;Ljava/lang/String;)Z
    .registers 4
    .param p1, "dir"    # Ljava/io/File;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 84
    iget-object v0, p0, Lorg/apache/commons/io/filefilter/DelegateFileFilter;->filenameFilter:Ljava/io/FilenameFilter;

    if-eqz v0, :cond_b

    .line 85
    iget-object v0, p0, Lorg/apache/commons/io/filefilter/DelegateFileFilter;->filenameFilter:Ljava/io/FilenameFilter;

    invoke-interface {v0, p1, p2}, Ljava/io/FilenameFilter;->accept(Ljava/io/File;Ljava/lang/String;)Z

    move-result v0

    .line 87
    :goto_a
    return v0

    :cond_b
    invoke-super {p0, p1, p2}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;->accept(Ljava/io/File;Ljava/lang/String;)Z

    move-result v0

    goto :goto_a
.end method
