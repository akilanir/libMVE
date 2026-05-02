.class public Lkorex/activation/FileDataSource;
.super Ljava/lang/Object;
.source "FileDataSource.java"

# interfaces
.implements Lkorex/activation/DataSource;


# instance fields
.field private _file:Ljava/io/File;

.field private typeMap:Lkorex/activation/FileTypeMap;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    const/4 v0, 0x0

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object v0, p0, Lkorex/activation/FileDataSource;->_file:Ljava/io/File;

    .line 67
    iput-object v0, p0, Lkorex/activation/FileDataSource;->typeMap:Lkorex/activation/FileTypeMap;

    .line 77
    iput-object p1, p0, Lkorex/activation/FileDataSource;->_file:Ljava/io/File;

    .line 78
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 89
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lkorex/activation/FileDataSource;-><init>(Ljava/io/File;)V

    .line 90
    return-void
.end method


# virtual methods
.method public getContentType()Ljava/lang/String;
    .registers 3

    .prologue
    .line 129
    iget-object v0, p0, Lkorex/activation/FileDataSource;->typeMap:Lkorex/activation/FileTypeMap;

    if-nez v0, :cond_f

    .line 130
    invoke-static {}, Lkorex/activation/FileTypeMap;->getDefaultFileTypeMap()Lkorex/activation/FileTypeMap;

    move-result-object v0

    iget-object v1, p0, Lkorex/activation/FileDataSource;->_file:Ljava/io/File;

    invoke-virtual {v0, v1}, Lkorex/activation/FileTypeMap;->getContentType(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 132
    :goto_e
    return-object v0

    :cond_f
    iget-object v0, p0, Lkorex/activation/FileDataSource;->typeMap:Lkorex/activation/FileTypeMap;

    iget-object v1, p0, Lkorex/activation/FileDataSource;->_file:Ljava/io/File;

    invoke-virtual {v0, v1}, Lkorex/activation/FileTypeMap;->getContentType(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    goto :goto_e
.end method

.method public getFile()Ljava/io/File;
    .registers 2

    .prologue
    .line 151
    iget-object v0, p0, Lkorex/activation/FileDataSource;->_file:Ljava/io/File;

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lkorex/activation/FileDataSource;->_file:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 143
    iget-object v0, p0, Lkorex/activation/FileDataSource;->_file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p0, Lkorex/activation/FileDataSource;->_file:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public setFileTypeMap(Lkorex/activation/FileTypeMap;)V
    .registers 2
    .param p1, "map"    # Lkorex/activation/FileTypeMap;

    .prologue
    .line 160
    iput-object p1, p0, Lkorex/activation/FileDataSource;->typeMap:Lkorex/activation/FileTypeMap;

    .line 161
    return-void
.end method
