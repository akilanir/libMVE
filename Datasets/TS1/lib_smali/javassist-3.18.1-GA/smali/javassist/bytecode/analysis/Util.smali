.class public Ljavassist/bytecode/analysis/Util;
.super Ljava/lang/Object;
.source "Util.java"

# interfaces
.implements Ljavassist/bytecode/Opcode;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getJumpTarget(ILjavassist/bytecode/CodeIterator;)I
    .registers 4
    .param p0, "pos"    # I
    .param p1, "iter"    # Ljavassist/bytecode/CodeIterator;

    .prologue
    .line 28
    invoke-virtual {p1, p0}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v0

    .line 29
    .local v0, "opcode":I
    const/16 v1, 0xc9

    if-eq v0, v1, :cond_c

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_14

    :cond_c
    add-int/lit8 v1, p0, 0x1

    invoke-virtual {p1, v1}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v1

    :goto_12
    add-int/2addr p0, v1

    .line 30
    return p0

    .line 29
    :cond_14
    add-int/lit8 v1, p0, 0x1

    invoke-virtual {p1, v1}, Ljavassist/bytecode/CodeIterator;->s16bitAt(I)I

    move-result v1

    goto :goto_12
.end method

.method public static isGoto(I)Z
    .registers 2
    .param p0, "opcode"    # I

    .prologue
    .line 38
    const/16 v0, 0xa7

    if-eq p0, v0, :cond_8

    const/16 v0, 0xc8

    if-ne p0, v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static isJsr(I)Z
    .registers 2
    .param p0, "opcode"    # I

    .prologue
    .line 42
    const/16 v0, 0xa8

    if-eq p0, v0, :cond_8

    const/16 v0, 0xc9

    if-ne p0, v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static isJumpInstruction(I)Z
    .registers 2
    .param p0, "opcode"    # I

    .prologue
    .line 34
    const/16 v0, 0x99

    if-lt p0, v0, :cond_8

    const/16 v0, 0xa8

    if-le p0, v0, :cond_18

    :cond_8
    const/16 v0, 0xc6

    if-eq p0, v0, :cond_18

    const/16 v0, 0xc7

    if-eq p0, v0, :cond_18

    const/16 v0, 0xc9

    if-eq p0, v0, :cond_18

    const/16 v0, 0xc8

    if-ne p0, v0, :cond_1a

    :cond_18
    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method public static isReturn(I)Z
    .registers 2
    .param p0, "opcode"    # I

    .prologue
    .line 46
    const/16 v0, 0xac

    if-lt p0, v0, :cond_a

    const/16 v0, 0xb1

    if-gt p0, v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method
