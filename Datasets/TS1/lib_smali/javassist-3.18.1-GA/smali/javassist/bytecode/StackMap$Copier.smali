.class Ljavassist/bytecode/StackMap$Copier;
.super Ljavassist/bytecode/StackMap$Walker;
.source "StackMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/StackMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Copier"
.end annotation


# instance fields
.field classnames:Ljava/util/Map;

.field dest:[B

.field destCp:Ljavassist/bytecode/ConstPool;

.field srcCp:Ljavassist/bytecode/ConstPool;


# direct methods
.method constructor <init>(Ljavassist/bytecode/StackMap;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)V
    .registers 5
    .param p1, "map"    # Ljavassist/bytecode/StackMap;
    .param p2, "newCp"    # Ljavassist/bytecode/ConstPool;
    .param p3, "classnames"    # Ljava/util/Map;

    .prologue
    .line 230
    invoke-direct {p0, p1}, Ljavassist/bytecode/StackMap$Walker;-><init>(Ljavassist/bytecode/StackMap;)V

    .line 231
    invoke-virtual {p1}, Ljavassist/bytecode/StackMap;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    iput-object v0, p0, Ljavassist/bytecode/StackMap$Copier;->srcCp:Ljavassist/bytecode/ConstPool;

    .line 232
    iget-object v0, p0, Ljavassist/bytecode/StackMap$Copier;->info:[B

    array-length v0, v0

    new-array v0, v0, [B

    iput-object v0, p0, Ljavassist/bytecode/StackMap$Copier;->dest:[B

    .line 233
    iput-object p2, p0, Ljavassist/bytecode/StackMap$Copier;->destCp:Ljavassist/bytecode/ConstPool;

    .line 234
    iput-object p3, p0, Ljavassist/bytecode/StackMap$Copier;->classnames:Ljava/util/Map;

    .line 235
    return-void
.end method


# virtual methods
.method public getStackMap()Ljavassist/bytecode/StackMap;
    .registers 4

    .prologue
    .line 269
    new-instance v0, Ljavassist/bytecode/StackMap;

    iget-object v1, p0, Ljavassist/bytecode/StackMap$Copier;->destCp:Ljavassist/bytecode/ConstPool;

    iget-object v2, p0, Ljavassist/bytecode/StackMap$Copier;->dest:[B

    invoke-direct {v0, v1, v2}, Ljavassist/bytecode/StackMap;-><init>(Ljavassist/bytecode/ConstPool;[B)V

    return-object v0
.end method

.method public locals(III)I
    .registers 6
    .param p1, "pos"    # I
    .param p2, "offset"    # I
    .param p3, "num"    # I

    .prologue
    .line 244
    iget-object v0, p0, Ljavassist/bytecode/StackMap$Copier;->dest:[B

    add-int/lit8 v1, p1, -0x4

    invoke-static {p2, v0, v1}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 245
    invoke-super {p0, p1, p2, p3}, Ljavassist/bytecode/StackMap$Walker;->locals(III)I

    move-result v0

    return v0
.end method

.method public objectVariable(II)V
    .registers 7
    .param p1, "pos"    # I
    .param p2, "clazz"    # I

    .prologue
    .line 258
    iget-object v1, p0, Ljavassist/bytecode/StackMap$Copier;->dest:[B

    const/4 v2, 0x7

    aput-byte v2, v1, p1

    .line 259
    iget-object v1, p0, Ljavassist/bytecode/StackMap$Copier;->srcCp:Ljavassist/bytecode/ConstPool;

    iget-object v2, p0, Ljavassist/bytecode/StackMap$Copier;->destCp:Ljavassist/bytecode/ConstPool;

    iget-object v3, p0, Ljavassist/bytecode/StackMap$Copier;->classnames:Ljava/util/Map;

    invoke-virtual {v1, p2, v2, v3}, Ljavassist/bytecode/ConstPool;->copy(ILjavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result v0

    .line 260
    .local v0, "newClazz":I
    iget-object v1, p0, Ljavassist/bytecode/StackMap$Copier;->dest:[B

    add-int/lit8 v2, p1, 0x1

    invoke-static {v0, v1, v2}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 261
    return-void
.end method

.method public typeInfo(IB)V
    .registers 4
    .param p1, "pos"    # I
    .param p2, "tag"    # B

    .prologue
    .line 254
    iget-object v0, p0, Ljavassist/bytecode/StackMap$Copier;->dest:[B

    aput-byte p2, v0, p1

    .line 255
    return-void
.end method

.method public typeInfoArray(IIIZ)I
    .registers 7
    .param p1, "pos"    # I
    .param p2, "offset"    # I
    .param p3, "num"    # I
    .param p4, "isLocals"    # Z

    .prologue
    .line 249
    iget-object v0, p0, Ljavassist/bytecode/StackMap$Copier;->dest:[B

    add-int/lit8 v1, p1, -0x2

    invoke-static {p3, v0, v1}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 250
    invoke-super {p0, p1, p2, p3, p4}, Ljavassist/bytecode/StackMap$Walker;->typeInfoArray(IIIZ)I

    move-result v0

    return v0
.end method

.method public uninitialized(II)V
    .registers 5
    .param p1, "pos"    # I
    .param p2, "offset"    # I

    .prologue
    .line 264
    iget-object v0, p0, Ljavassist/bytecode/StackMap$Copier;->dest:[B

    const/16 v1, 0x8

    aput-byte v1, v0, p1

    .line 265
    iget-object v0, p0, Ljavassist/bytecode/StackMap$Copier;->dest:[B

    add-int/lit8 v1, p1, 0x1

    invoke-static {p2, v0, v1}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 266
    return-void
.end method

.method public visit()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 238
    iget-object v1, p0, Ljavassist/bytecode/StackMap$Copier;->info:[B

    invoke-static {v1, v2}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    .line 239
    .local v0, "num":I
    iget-object v1, p0, Ljavassist/bytecode/StackMap$Copier;->dest:[B

    invoke-static {v0, v1, v2}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 240
    invoke-super {p0}, Ljavassist/bytecode/StackMap$Walker;->visit()V

    .line 241
    return-void
.end method
