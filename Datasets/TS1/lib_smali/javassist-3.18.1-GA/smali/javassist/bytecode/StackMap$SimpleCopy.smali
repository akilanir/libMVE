.class Ljavassist/bytecode/StackMap$SimpleCopy;
.super Ljavassist/bytecode/StackMap$Walker;
.source "StackMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/StackMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SimpleCopy"
.end annotation


# instance fields
.field writer:Ljavassist/bytecode/StackMap$Writer;


# direct methods
.method constructor <init>(Ljavassist/bytecode/StackMap;)V
    .registers 3
    .param p1, "map"    # Ljavassist/bytecode/StackMap;

    .prologue
    .line 299
    invoke-direct {p0, p1}, Ljavassist/bytecode/StackMap$Walker;-><init>(Ljavassist/bytecode/StackMap;)V

    .line 300
    new-instance v0, Ljavassist/bytecode/StackMap$Writer;

    invoke-direct {v0}, Ljavassist/bytecode/StackMap$Writer;-><init>()V

    iput-object v0, p0, Ljavassist/bytecode/StackMap$SimpleCopy;->writer:Ljavassist/bytecode/StackMap$Writer;

    .line 301
    return-void
.end method


# virtual methods
.method doit()[B
    .registers 2

    .prologue
    .line 304
    invoke-virtual {p0}, Ljavassist/bytecode/StackMap$SimpleCopy;->visit()V

    .line 305
    iget-object v0, p0, Ljavassist/bytecode/StackMap$SimpleCopy;->writer:Ljavassist/bytecode/StackMap$Writer;

    invoke-virtual {v0}, Ljavassist/bytecode/StackMap$Writer;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method public locals(III)I
    .registers 5
    .param p1, "pos"    # I
    .param p2, "offset"    # I
    .param p3, "num"    # I

    .prologue
    .line 315
    iget-object v0, p0, Ljavassist/bytecode/StackMap$SimpleCopy;->writer:Ljavassist/bytecode/StackMap$Writer;

    invoke-virtual {v0, p2}, Ljavassist/bytecode/StackMap$Writer;->write16bit(I)V

    .line 316
    invoke-super {p0, p1, p2, p3}, Ljavassist/bytecode/StackMap$Walker;->locals(III)I

    move-result v0

    return v0
.end method

.method public objectVariable(II)V
    .registers 5
    .param p1, "pos"    # I
    .param p2, "clazz"    # I

    .prologue
    .line 329
    iget-object v0, p0, Ljavassist/bytecode/StackMap$SimpleCopy;->writer:Ljavassist/bytecode/StackMap$Writer;

    const/4 v1, 0x7

    invoke-virtual {v0, v1, p2}, Ljavassist/bytecode/StackMap$Writer;->writeVerifyTypeInfo(II)V

    .line 330
    return-void
.end method

.method public typeInfo(IB)V
    .registers 5
    .param p1, "pos"    # I
    .param p2, "tag"    # B

    .prologue
    .line 325
    iget-object v0, p0, Ljavassist/bytecode/StackMap$SimpleCopy;->writer:Ljavassist/bytecode/StackMap$Writer;

    const/4 v1, 0x0

    invoke-virtual {v0, p2, v1}, Ljavassist/bytecode/StackMap$Writer;->writeVerifyTypeInfo(II)V

    .line 326
    return-void
.end method

.method public typeInfoArray(IIIZ)I
    .registers 6
    .param p1, "pos"    # I
    .param p2, "offset"    # I
    .param p3, "num"    # I
    .param p4, "isLocals"    # Z

    .prologue
    .line 320
    iget-object v0, p0, Ljavassist/bytecode/StackMap$SimpleCopy;->writer:Ljavassist/bytecode/StackMap$Writer;

    invoke-virtual {v0, p3}, Ljavassist/bytecode/StackMap$Writer;->write16bit(I)V

    .line 321
    invoke-super {p0, p1, p2, p3, p4}, Ljavassist/bytecode/StackMap$Walker;->typeInfoArray(IIIZ)I

    move-result v0

    return v0
.end method

.method public uninitialized(II)V
    .registers 5
    .param p1, "pos"    # I
    .param p2, "offset"    # I

    .prologue
    .line 333
    iget-object v0, p0, Ljavassist/bytecode/StackMap$SimpleCopy;->writer:Ljavassist/bytecode/StackMap$Writer;

    const/16 v1, 0x8

    invoke-virtual {v0, v1, p2}, Ljavassist/bytecode/StackMap$Writer;->writeVerifyTypeInfo(II)V

    .line 334
    return-void
.end method

.method public visit()V
    .registers 4

    .prologue
    .line 309
    iget-object v1, p0, Ljavassist/bytecode/StackMap$SimpleCopy;->info:[B

    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    .line 310
    .local v0, "num":I
    iget-object v1, p0, Ljavassist/bytecode/StackMap$SimpleCopy;->writer:Ljavassist/bytecode/StackMap$Writer;

    invoke-virtual {v1, v0}, Ljavassist/bytecode/StackMap$Writer;->write16bit(I)V

    .line 311
    invoke-super {p0}, Ljavassist/bytecode/StackMap$Walker;->visit()V

    .line 312
    return-void
.end method
