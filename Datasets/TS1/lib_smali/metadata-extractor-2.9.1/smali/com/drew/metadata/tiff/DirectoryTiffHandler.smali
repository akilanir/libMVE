.class public abstract Lcom/drew/metadata/tiff/DirectoryTiffHandler;
.super Ljava/lang/Object;
.source "DirectoryTiffHandler.java"

# interfaces
.implements Lcom/drew/imaging/tiff/TiffHandler;


# instance fields
.field protected _currentDirectory:Lcom/drew/metadata/Directory;

.field private final _directoryStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Lcom/drew/metadata/Directory;",
            ">;"
        }
    .end annotation
.end field

.field protected final _metadata:Lcom/drew/metadata/Metadata;


# direct methods
.method protected constructor <init>(Lcom/drew/metadata/Metadata;Ljava/lang/Class;)V
    .registers 6
    .param p1, "metadata"    # Lcom/drew/metadata/Metadata;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/drew/metadata/Metadata;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/drew/metadata/Directory;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 44
    .local p2, "initialDirectoryClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/drew/metadata/Directory;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v1, Ljava/util/Stack;

    invoke-direct {v1}, Ljava/util/Stack;-><init>()V

    iput-object v1, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_directoryStack:Ljava/util/Stack;

    .line 45
    iput-object p1, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_metadata:Lcom/drew/metadata/Metadata;

    .line 47
    :try_start_c
    invoke-virtual {p2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/drew/metadata/Directory;

    iput-object v1, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;
    :try_end_14
    .catch Ljava/lang/InstantiationException; {:try_start_c .. :try_end_14} :catch_1c
    .catch Ljava/lang/IllegalAccessException; {:try_start_c .. :try_end_14} :catch_23

    .line 53
    iget-object v1, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_metadata:Lcom/drew/metadata/Metadata;

    iget-object v2, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    .line 54
    return-void

    .line 48
    :catch_1c
    move-exception v0

    .line 49
    .local v0, "e":Ljava/lang/InstantiationException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 50
    .end local v0    # "e":Ljava/lang/InstantiationException;
    :catch_23
    move-exception v0

    .line 51
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public endingIFD()V
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_directoryStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->empty()Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x0

    :goto_9
    iput-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    .line 59
    return-void

    .line 58
    :cond_c
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_directoryStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/drew/metadata/Directory;

    goto :goto_9
.end method

.method public error(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 83
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1}, Lcom/drew/metadata/Directory;->addError(Ljava/lang/String;)V

    .line 84
    return-void
.end method

.method protected pushDirectory(Ljava/lang/Class;)V
    .registers 6
    .param p1    # Ljava/lang/Class;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcom/drew/metadata/Directory;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p1, "directoryClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/drew/metadata/Directory;>;"
    iget-object v2, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_directoryStack:Ljava/util/Stack;

    iget-object v3, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v2, v3}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    :try_start_7
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/drew/metadata/Directory;

    .line 66
    .local v1, "newDirectory":Lcom/drew/metadata/Directory;
    iget-object v2, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->setParent(Lcom/drew/metadata/Directory;)V

    .line 67
    iput-object v1, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;
    :try_end_14
    .catch Ljava/lang/InstantiationException; {:try_start_7 .. :try_end_14} :catch_1c
    .catch Ljava/lang/IllegalAccessException; {:try_start_7 .. :try_end_14} :catch_23

    .line 73
    iget-object v2, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_metadata:Lcom/drew/metadata/Metadata;

    iget-object v3, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v2, v3}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    .line 74
    return-void

    .line 68
    .end local v1    # "newDirectory":Lcom/drew/metadata/Directory;
    :catch_1c
    move-exception v0

    .line 69
    .local v0, "e":Ljava/lang/InstantiationException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 70
    .end local v0    # "e":Ljava/lang/InstantiationException;
    :catch_23
    move-exception v0

    .line 71
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public setByteArray(I[B)V
    .registers 4
    .param p1, "tagId"    # I
    .param p2, "bytes"    # [B
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 88
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1, p2}, Lcom/drew/metadata/Directory;->setByteArray(I[B)V

    .line 89
    return-void
.end method

.method public setDouble(ID)V
    .registers 5
    .param p1, "tagId"    # I
    .param p2, "double64"    # D

    .prologue
    .line 118
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1, p2, p3}, Lcom/drew/metadata/Directory;->setDouble(ID)V

    .line 119
    return-void
.end method

.method public setDoubleArray(I[D)V
    .registers 4
    .param p1, "tagId"    # I
    .param p2, "array"    # [D
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 123
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1, p2}, Lcom/drew/metadata/Directory;->setDoubleArray(I[D)V

    .line 124
    return-void
.end method

.method public setFloat(IF)V
    .registers 4
    .param p1, "tagId"    # I
    .param p2, "float32"    # F

    .prologue
    .line 108
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1, p2}, Lcom/drew/metadata/Directory;->setFloat(IF)V

    .line 109
    return-void
.end method

.method public setFloatArray(I[F)V
    .registers 4
    .param p1, "tagId"    # I
    .param p2, "array"    # [F
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 113
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1, p2}, Lcom/drew/metadata/Directory;->setFloatArray(I[F)V

    .line 114
    return-void
.end method

.method public setInt16s(II)V
    .registers 4
    .param p1, "tagId"    # I
    .param p2, "int16s"    # I

    .prologue
    .line 153
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1, p2}, Lcom/drew/metadata/Directory;->setInt(II)V

    .line 154
    return-void
.end method

.method public setInt16sArray(I[S)V
    .registers 4
    .param p1, "tagId"    # I
    .param p2, "array"    # [S
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 159
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1, p2}, Lcom/drew/metadata/Directory;->setObjectArray(ILjava/lang/Object;)V

    .line 160
    return-void
.end method

.method public setInt16u(II)V
    .registers 4
    .param p1, "tagId"    # I
    .param p2, "int16u"    # I

    .prologue
    .line 165
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1, p2}, Lcom/drew/metadata/Directory;->setInt(II)V

    .line 166
    return-void
.end method

.method public setInt16uArray(I[I)V
    .registers 4
    .param p1, "tagId"    # I
    .param p2, "array"    # [I
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 171
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1, p2}, Lcom/drew/metadata/Directory;->setObjectArray(ILjava/lang/Object;)V

    .line 172
    return-void
.end method

.method public setInt32s(II)V
    .registers 4
    .param p1, "tagId"    # I
    .param p2, "int32s"    # I

    .prologue
    .line 176
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1, p2}, Lcom/drew/metadata/Directory;->setInt(II)V

    .line 177
    return-void
.end method

.method public setInt32sArray(I[I)V
    .registers 4
    .param p1, "tagId"    # I
    .param p2, "array"    # [I
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 181
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1, p2}, Lcom/drew/metadata/Directory;->setIntArray(I[I)V

    .line 182
    return-void
.end method

.method public setInt32u(IJ)V
    .registers 5
    .param p1, "tagId"    # I
    .param p2, "int32u"    # J

    .prologue
    .line 186
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1, p2, p3}, Lcom/drew/metadata/Directory;->setLong(IJ)V

    .line 187
    return-void
.end method

.method public setInt32uArray(I[J)V
    .registers 4
    .param p1, "tagId"    # I
    .param p2, "array"    # [J
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 192
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1, p2}, Lcom/drew/metadata/Directory;->setObjectArray(ILjava/lang/Object;)V

    .line 193
    return-void
.end method

.method public setInt8s(IB)V
    .registers 4
    .param p1, "tagId"    # I
    .param p2, "int8s"    # B

    .prologue
    .line 129
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1, p2}, Lcom/drew/metadata/Directory;->setInt(II)V

    .line 130
    return-void
.end method

.method public setInt8sArray(I[B)V
    .registers 4
    .param p1, "tagId"    # I
    .param p2, "array"    # [B
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 135
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1, p2}, Lcom/drew/metadata/Directory;->setByteArray(I[B)V

    .line 136
    return-void
.end method

.method public setInt8u(IS)V
    .registers 4
    .param p1, "tagId"    # I
    .param p2, "int8u"    # S

    .prologue
    .line 141
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1, p2}, Lcom/drew/metadata/Directory;->setInt(II)V

    .line 142
    return-void
.end method

.method public setInt8uArray(I[S)V
    .registers 4
    .param p1, "tagId"    # I
    .param p2, "array"    # [S
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 147
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1, p2}, Lcom/drew/metadata/Directory;->setObjectArray(ILjava/lang/Object;)V

    .line 148
    return-void
.end method

.method public setRational(ILcom/drew/lang/Rational;)V
    .registers 4
    .param p1, "tagId"    # I
    .param p2, "rational"    # Lcom/drew/lang/Rational;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 98
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1, p2}, Lcom/drew/metadata/Directory;->setRational(ILcom/drew/lang/Rational;)V

    .line 99
    return-void
.end method

.method public setRationalArray(I[Lcom/drew/lang/Rational;)V
    .registers 4
    .param p1, "tagId"    # I
    .param p2, "array"    # [Lcom/drew/lang/Rational;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 103
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1, p2}, Lcom/drew/metadata/Directory;->setRationalArray(I[Lcom/drew/lang/Rational;)V

    .line 104
    return-void
.end method

.method public setString(ILjava/lang/String;)V
    .registers 4
    .param p1, "tagId"    # I
    .param p2, "string"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 93
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1, p2}, Lcom/drew/metadata/Directory;->setString(ILjava/lang/String;)V

    .line 94
    return-void
.end method

.method public warn(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 78
    iget-object v0, p0, Lcom/drew/metadata/tiff/DirectoryTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p1}, Lcom/drew/metadata/Directory;->addError(Ljava/lang/String;)V

    .line 79
    return-void
.end method
