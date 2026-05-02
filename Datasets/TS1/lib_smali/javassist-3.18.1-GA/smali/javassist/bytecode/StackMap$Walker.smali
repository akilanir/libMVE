.class public Ljavassist/bytecode/StackMap$Walker;
.super Ljava/lang/Object;
.source "StackMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/StackMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Walker"
.end annotation


# instance fields
.field info:[B


# direct methods
.method public constructor <init>(Ljavassist/bytecode/StackMap;)V
    .registers 3
    .param p1, "sm"    # Ljavassist/bytecode/StackMap;

    .prologue
    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 135
    invoke-virtual {p1}, Ljavassist/bytecode/StackMap;->get()[B

    move-result-object v0

    iput-object v0, p0, Ljavassist/bytecode/StackMap$Walker;->info:[B

    .line 136
    return-void
.end method


# virtual methods
.method public locals(III)I
    .registers 5
    .param p1, "pos"    # I
    .param p2, "offset"    # I
    .param p3, "num"    # I

    .prologue
    .line 158
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, p3, v0}, Ljavassist/bytecode/StackMap$Walker;->typeInfoArray(IIIZ)I

    move-result v0

    return v0
.end method

.method public objectVariable(II)V
    .registers 3
    .param p1, "pos"    # I
    .param p2, "clazz"    # I

    .prologue
    .line 215
    return-void
.end method

.method public stack(III)I
    .registers 5
    .param p1, "pos"    # I
    .param p2, "offset"    # I
    .param p3, "num"    # I

    .prologue
    .line 166
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Ljavassist/bytecode/StackMap$Walker;->typeInfoArray(IIIZ)I

    move-result v0

    return v0
.end method

.method public typeInfo(IB)V
    .registers 3
    .param p1, "pos"    # I
    .param p2, "tag"    # B

    .prologue
    .line 209
    return-void
.end method

.method public typeInfoArray(IIIZ)I
    .registers 6
    .param p1, "pos"    # I
    .param p2, "offset"    # I
    .param p3, "num"    # I
    .param p4, "isLocals"    # Z

    .prologue
    .line 178
    const/4 v0, 0x0

    .local v0, "k":I
    :goto_1
    if-ge v0, p3, :cond_a

    .line 179
    invoke-virtual {p0, v0, p1}, Ljavassist/bytecode/StackMap$Walker;->typeInfoArray2(II)I

    move-result p1

    .line 178
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 181
    :cond_a
    return p1
.end method

.method typeInfoArray2(II)I
    .registers 8
    .param p1, "k"    # I
    .param p2, "pos"    # I

    .prologue
    .line 185
    iget-object v3, p0, Ljavassist/bytecode/StackMap$Walker;->info:[B

    aget-byte v2, v3, p2

    .line 186
    .local v2, "tag":B
    const/4 v3, 0x7

    if-ne v2, v3, :cond_15

    .line 187
    iget-object v3, p0, Ljavassist/bytecode/StackMap$Walker;->info:[B

    add-int/lit8 v4, p2, 0x1

    invoke-static {v3, v4}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    .line 188
    .local v0, "clazz":I
    invoke-virtual {p0, p2, v0}, Ljavassist/bytecode/StackMap$Walker;->objectVariable(II)V

    .line 189
    add-int/lit8 p2, p2, 0x3

    .line 201
    .end local v0    # "clazz":I
    :goto_14
    return p2

    .line 191
    :cond_15
    const/16 v3, 0x8

    if-ne v2, v3, :cond_27

    .line 192
    iget-object v3, p0, Ljavassist/bytecode/StackMap$Walker;->info:[B

    add-int/lit8 v4, p2, 0x1

    invoke-static {v3, v4}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v1

    .line 193
    .local v1, "offsetOfNew":I
    invoke-virtual {p0, p2, v1}, Ljavassist/bytecode/StackMap$Walker;->uninitialized(II)V

    .line 194
    add-int/lit8 p2, p2, 0x3

    .line 195
    goto :goto_14

    .line 197
    .end local v1    # "offsetOfNew":I
    :cond_27
    invoke-virtual {p0, p2, v2}, Ljavassist/bytecode/StackMap$Walker;->typeInfo(IB)V

    .line 198
    add-int/lit8 p2, p2, 0x1

    goto :goto_14
.end method

.method public uninitialized(II)V
    .registers 3
    .param p1, "pos"    # I
    .param p2, "offset"    # I

    .prologue
    .line 221
    return-void
.end method

.method public visit()V
    .registers 9

    .prologue
    .line 142
    iget-object v6, p0, Ljavassist/bytecode/StackMap$Walker;->info:[B

    const/4 v7, 0x0

    invoke-static {v6, v7}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v1

    .line 143
    .local v1, "num":I
    const/4 v5, 0x2

    .line 144
    .local v5, "pos":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    if-ge v0, v1, :cond_2e

    .line 145
    iget-object v6, p0, Ljavassist/bytecode/StackMap$Walker;->info:[B

    invoke-static {v6, v5}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v4

    .line 146
    .local v4, "offset":I
    iget-object v6, p0, Ljavassist/bytecode/StackMap$Walker;->info:[B

    add-int/lit8 v7, v5, 0x2

    invoke-static {v6, v7}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v2

    .line 147
    .local v2, "numLoc":I
    add-int/lit8 v6, v5, 0x4

    invoke-virtual {p0, v6, v4, v2}, Ljavassist/bytecode/StackMap$Walker;->locals(III)I

    move-result v5

    .line 148
    iget-object v6, p0, Ljavassist/bytecode/StackMap$Walker;->info:[B

    invoke-static {v6, v5}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v3

    .line 149
    .local v3, "numStack":I
    add-int/lit8 v6, v5, 0x2

    invoke-virtual {p0, v6, v4, v3}, Ljavassist/bytecode/StackMap$Walker;->stack(III)I

    move-result v5

    .line 144
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 151
    .end local v2    # "numLoc":I
    .end local v3    # "numStack":I
    .end local v4    # "offset":I
    :cond_2e
    return-void
.end method
