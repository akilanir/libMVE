.class public Ljavassist/bytecode/ExceptionTable;
.super Ljava/lang/Object;
.source "ExceptionTable.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field private constPool:Ljavassist/bytecode/ConstPool;

.field private entries:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Ljavassist/bytecode/ConstPool;)V
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Ljavassist/bytecode/ExceptionTable;->constPool:Ljavassist/bytecode/ConstPool;

    .line 53
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ljavassist/bytecode/ExceptionTable;->entries:Ljava/util/ArrayList;

    .line 54
    return-void
.end method

.method constructor <init>(Ljavassist/bytecode/ConstPool;Ljava/io/DataInputStream;)V
    .registers 11
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "in"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Ljavassist/bytecode/ExceptionTable;->constPool:Ljavassist/bytecode/ConstPool;

    .line 58
    invoke-virtual {p2}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v3

    .line 59
    .local v3, "length":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 60
    .local v4, "list":Ljava/util/ArrayList;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_f
    if-ge v2, v3, :cond_2c

    .line 61
    invoke-virtual {p2}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v5

    .line 62
    .local v5, "start":I
    invoke-virtual {p2}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    .line 63
    .local v0, "end":I
    invoke-virtual {p2}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v1

    .line 64
    .local v1, "handle":I
    invoke-virtual {p2}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v6

    .line 65
    .local v6, "type":I
    new-instance v7, Ljavassist/bytecode/ExceptionTableEntry;

    invoke-direct {v7, v5, v0, v1, v6}, Ljavassist/bytecode/ExceptionTableEntry;-><init>(IIII)V

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 60
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 68
    .end local v0    # "end":I
    .end local v1    # "handle":I
    .end local v5    # "start":I
    .end local v6    # "type":I
    :cond_2c
    iput-object v4, p0, Ljavassist/bytecode/ExceptionTable;->entries:Ljava/util/ArrayList;

    .line 69
    return-void
.end method

.method private static shiftPc(IIIZ)I
    .registers 4
    .param p0, "pc"    # I
    .param p1, "where"    # I
    .param p2, "gapLength"    # I
    .param p3, "exclusive"    # Z

    .prologue
    .line 264
    if-gt p0, p1, :cond_6

    if-eqz p3, :cond_7

    if-ne p0, p1, :cond_7

    .line 265
    :cond_6
    add-int/2addr p0, p2

    .line 267
    :cond_7
    return p0
.end method


# virtual methods
.method public add(IIII)V
    .registers 7
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "handler"    # I
    .param p4, "type"    # I

    .prologue
    .line 217
    if-ge p1, p2, :cond_c

    .line 218
    iget-object v0, p0, Ljavassist/bytecode/ExceptionTable;->entries:Ljava/util/ArrayList;

    new-instance v1, Ljavassist/bytecode/ExceptionTableEntry;

    invoke-direct {v1, p1, p2, p3, p4}, Ljavassist/bytecode/ExceptionTableEntry;-><init>(IIII)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 219
    :cond_c
    return-void
.end method

.method public add(IIIII)V
    .registers 8
    .param p1, "index"    # I
    .param p2, "start"    # I
    .param p3, "end"    # I
    .param p4, "handler"    # I
    .param p5, "type"    # I

    .prologue
    .line 203
    if-ge p2, p3, :cond_c

    .line 204
    iget-object v0, p0, Ljavassist/bytecode/ExceptionTable;->entries:Ljava/util/ArrayList;

    new-instance v1, Ljavassist/bytecode/ExceptionTableEntry;

    invoke-direct {v1, p2, p3, p4, p5}, Ljavassist/bytecode/ExceptionTableEntry;-><init>(IIII)V

    invoke-virtual {v0, p1, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 206
    :cond_c
    return-void
.end method

.method public add(ILjavassist/bytecode/ExceptionTable;I)V
    .registers 12
    .param p1, "index"    # I
    .param p2, "table"    # Ljavassist/bytecode/ExceptionTable;
    .param p3, "offset"    # I

    .prologue
    .line 184
    invoke-virtual {p2}, Ljavassist/bytecode/ExceptionTable;->size()I

    move-result v7

    .line 185
    .local v7, "len":I
    :goto_4
    add-int/lit8 v7, v7, -0x1

    if-ltz v7, :cond_24

    .line 186
    iget-object v0, p2, Ljavassist/bytecode/ExceptionTable;->entries:Ljava/util/ArrayList;

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljavassist/bytecode/ExceptionTableEntry;

    .line 188
    .local v6, "e":Ljavassist/bytecode/ExceptionTableEntry;
    iget v0, v6, Ljavassist/bytecode/ExceptionTableEntry;->startPc:I

    add-int v2, v0, p3

    iget v0, v6, Ljavassist/bytecode/ExceptionTableEntry;->endPc:I

    add-int v3, v0, p3

    iget v0, v6, Ljavassist/bytecode/ExceptionTableEntry;->handlerPc:I

    add-int v4, v0, p3

    iget v5, v6, Ljavassist/bytecode/ExceptionTableEntry;->catchType:I

    move-object v0, p0

    move v1, p1

    invoke-virtual/range {v0 .. v5}, Ljavassist/bytecode/ExceptionTable;->add(IIIII)V

    goto :goto_4

    .line 191
    .end local v6    # "e":Ljavassist/bytecode/ExceptionTableEntry;
    :cond_24
    return-void
.end method

.method public catchType(I)I
    .registers 4
    .param p1, "nth"    # I

    .prologue
    .line 161
    iget-object v1, p0, Ljavassist/bytecode/ExceptionTable;->entries:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/ExceptionTableEntry;

    .line 162
    .local v0, "e":Ljavassist/bytecode/ExceptionTableEntry;
    iget v1, v0, Ljavassist/bytecode/ExceptionTableEntry;->catchType:I

    return v1
.end method

.method public clone()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 77
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/ExceptionTable;

    .line 78
    .local v0, "r":Ljavassist/bytecode/ExceptionTable;
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Ljavassist/bytecode/ExceptionTable;->entries:Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, v0, Ljavassist/bytecode/ExceptionTable;->entries:Ljava/util/ArrayList;

    .line 79
    return-object v0
.end method

.method public copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/ExceptionTable;
    .registers 12
    .param p1, "newCp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "classnames"    # Ljava/util/Map;

    .prologue
    .line 240
    new-instance v1, Ljavassist/bytecode/ExceptionTable;

    invoke-direct {v1, p1}, Ljavassist/bytecode/ExceptionTable;-><init>(Ljavassist/bytecode/ConstPool;)V

    .line 241
    .local v1, "et":Ljavassist/bytecode/ExceptionTable;
    iget-object v4, p0, Ljavassist/bytecode/ExceptionTable;->constPool:Ljavassist/bytecode/ConstPool;

    .line 242
    .local v4, "srcCp":Ljavassist/bytecode/ConstPool;
    invoke-virtual {p0}, Ljavassist/bytecode/ExceptionTable;->size()I

    move-result v3

    .line 243
    .local v3, "len":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_c
    if-ge v2, v3, :cond_28

    .line 244
    iget-object v6, p0, Ljavassist/bytecode/ExceptionTable;->entries:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/ExceptionTableEntry;

    .line 245
    .local v0, "e":Ljavassist/bytecode/ExceptionTableEntry;
    iget v6, v0, Ljavassist/bytecode/ExceptionTableEntry;->catchType:I

    invoke-virtual {v4, v6, p1, p2}, Ljavassist/bytecode/ConstPool;->copy(ILjavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result v5

    .line 246
    .local v5, "type":I
    iget v6, v0, Ljavassist/bytecode/ExceptionTableEntry;->startPc:I

    iget v7, v0, Ljavassist/bytecode/ExceptionTableEntry;->endPc:I

    iget v8, v0, Ljavassist/bytecode/ExceptionTableEntry;->handlerPc:I

    invoke-virtual {v1, v6, v7, v8, v5}, Ljavassist/bytecode/ExceptionTable;->add(IIII)V

    .line 243
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 249
    .end local v0    # "e":Ljavassist/bytecode/ExceptionTableEntry;
    .end local v5    # "type":I
    :cond_28
    return-object v1
.end method

.method public endPc(I)I
    .registers 4
    .param p1, "nth"    # I

    .prologue
    .line 117
    iget-object v1, p0, Ljavassist/bytecode/ExceptionTable;->entries:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/ExceptionTableEntry;

    .line 118
    .local v0, "e":Ljavassist/bytecode/ExceptionTableEntry;
    iget v1, v0, Ljavassist/bytecode/ExceptionTableEntry;->endPc:I

    return v1
.end method

.method public handlerPc(I)I
    .registers 4
    .param p1, "nth"    # I

    .prologue
    .line 138
    iget-object v1, p0, Ljavassist/bytecode/ExceptionTable;->entries:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/ExceptionTableEntry;

    .line 139
    .local v0, "e":Ljavassist/bytecode/ExceptionTableEntry;
    iget v1, v0, Ljavassist/bytecode/ExceptionTableEntry;->handlerPc:I

    return v1
.end method

.method public remove(I)V
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 227
    iget-object v0, p0, Ljavassist/bytecode/ExceptionTable;->entries:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 228
    return-void
.end method

.method public setCatchType(II)V
    .registers 5
    .param p1, "nth"    # I
    .param p2, "value"    # I

    .prologue
    .line 172
    iget-object v1, p0, Ljavassist/bytecode/ExceptionTable;->entries:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/ExceptionTableEntry;

    .line 173
    .local v0, "e":Ljavassist/bytecode/ExceptionTableEntry;
    iput p2, v0, Ljavassist/bytecode/ExceptionTableEntry;->catchType:I

    .line 174
    return-void
.end method

.method public setEndPc(II)V
    .registers 5
    .param p1, "nth"    # I
    .param p2, "value"    # I

    .prologue
    .line 128
    iget-object v1, p0, Ljavassist/bytecode/ExceptionTable;->entries:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/ExceptionTableEntry;

    .line 129
    .local v0, "e":Ljavassist/bytecode/ExceptionTableEntry;
    iput p2, v0, Ljavassist/bytecode/ExceptionTableEntry;->endPc:I

    .line 130
    return-void
.end method

.method public setHandlerPc(II)V
    .registers 5
    .param p1, "nth"    # I
    .param p2, "value"    # I

    .prologue
    .line 149
    iget-object v1, p0, Ljavassist/bytecode/ExceptionTable;->entries:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/ExceptionTableEntry;

    .line 150
    .local v0, "e":Ljavassist/bytecode/ExceptionTableEntry;
    iput p2, v0, Ljavassist/bytecode/ExceptionTableEntry;->handlerPc:I

    .line 151
    return-void
.end method

.method public setStartPc(II)V
    .registers 5
    .param p1, "nth"    # I
    .param p2, "value"    # I

    .prologue
    .line 107
    iget-object v1, p0, Ljavassist/bytecode/ExceptionTable;->entries:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/ExceptionTableEntry;

    .line 108
    .local v0, "e":Ljavassist/bytecode/ExceptionTableEntry;
    iput p2, v0, Ljavassist/bytecode/ExceptionTableEntry;->startPc:I

    .line 109
    return-void
.end method

.method shiftPc(IIZ)V
    .registers 8
    .param p1, "where"    # I
    .param p2, "gapLength"    # I
    .param p3, "exclusive"    # Z

    .prologue
    .line 253
    invoke-virtual {p0}, Ljavassist/bytecode/ExceptionTable;->size()I

    move-result v2

    .line 254
    .local v2, "len":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    if-ge v1, v2, :cond_2a

    .line 255
    iget-object v3, p0, Ljavassist/bytecode/ExceptionTable;->entries:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/ExceptionTableEntry;

    .line 256
    .local v0, "e":Ljavassist/bytecode/ExceptionTableEntry;
    iget v3, v0, Ljavassist/bytecode/ExceptionTableEntry;->startPc:I

    invoke-static {v3, p1, p2, p3}, Ljavassist/bytecode/ExceptionTable;->shiftPc(IIIZ)I

    move-result v3

    iput v3, v0, Ljavassist/bytecode/ExceptionTableEntry;->startPc:I

    .line 257
    iget v3, v0, Ljavassist/bytecode/ExceptionTableEntry;->endPc:I

    invoke-static {v3, p1, p2, p3}, Ljavassist/bytecode/ExceptionTable;->shiftPc(IIIZ)I

    move-result v3

    iput v3, v0, Ljavassist/bytecode/ExceptionTableEntry;->endPc:I

    .line 258
    iget v3, v0, Ljavassist/bytecode/ExceptionTableEntry;->handlerPc:I

    invoke-static {v3, p1, p2, p3}, Ljavassist/bytecode/ExceptionTable;->shiftPc(IIIZ)I

    move-result v3

    iput v3, v0, Ljavassist/bytecode/ExceptionTableEntry;->handlerPc:I

    .line 254
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 260
    .end local v0    # "e":Ljavassist/bytecode/ExceptionTableEntry;
    :cond_2a
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 87
    iget-object v0, p0, Ljavassist/bytecode/ExceptionTable;->entries:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public startPc(I)I
    .registers 4
    .param p1, "nth"    # I

    .prologue
    .line 96
    iget-object v1, p0, Ljavassist/bytecode/ExceptionTable;->entries:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/ExceptionTableEntry;

    .line 97
    .local v0, "e":Ljavassist/bytecode/ExceptionTableEntry;
    iget v1, v0, Ljavassist/bytecode/ExceptionTableEntry;->startPc:I

    return v1
.end method

.method write(Ljava/io/DataOutputStream;)V
    .registers 6
    .param p1, "out"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 271
    invoke-virtual {p0}, Ljavassist/bytecode/ExceptionTable;->size()I

    move-result v2

    .line 272
    .local v2, "len":I
    invoke-virtual {p1, v2}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 273
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    if-ge v1, v2, :cond_29

    .line 274
    iget-object v3, p0, Ljavassist/bytecode/ExceptionTable;->entries:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/ExceptionTableEntry;

    .line 275
    .local v0, "e":Ljavassist/bytecode/ExceptionTableEntry;
    iget v3, v0, Ljavassist/bytecode/ExceptionTableEntry;->startPc:I

    invoke-virtual {p1, v3}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 276
    iget v3, v0, Ljavassist/bytecode/ExceptionTableEntry;->endPc:I

    invoke-virtual {p1, v3}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 277
    iget v3, v0, Ljavassist/bytecode/ExceptionTableEntry;->handlerPc:I

    invoke-virtual {p1, v3}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 278
    iget v3, v0, Ljavassist/bytecode/ExceptionTableEntry;->catchType:I

    invoke-virtual {p1, v3}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 273
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 280
    .end local v0    # "e":Ljavassist/bytecode/ExceptionTableEntry;
    :cond_29
    return-void
.end method
