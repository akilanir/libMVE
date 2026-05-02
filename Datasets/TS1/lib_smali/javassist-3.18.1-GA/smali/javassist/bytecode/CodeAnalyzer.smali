.class Ljavassist/bytecode/CodeAnalyzer;
.super Ljava/lang/Object;
.source "CodeAnalyzer.java"

# interfaces
.implements Ljavassist/bytecode/Opcode;


# instance fields
.field private codeAttr:Ljavassist/bytecode/CodeAttribute;

.field private constPool:Ljavassist/bytecode/ConstPool;


# direct methods
.method public constructor <init>(Ljavassist/bytecode/CodeAttribute;)V
    .registers 3
    .param p1, "ca"    # Ljavassist/bytecode/CodeAttribute;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Ljavassist/bytecode/CodeAnalyzer;->codeAttr:Ljavassist/bytecode/CodeAttribute;

    .line 28
    invoke-virtual {p1}, Ljavassist/bytecode/CodeAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    iput-object v0, p0, Ljavassist/bytecode/CodeAnalyzer;->constPool:Ljavassist/bytecode/ConstPool;

    .line 29
    return-void
.end method

.method private checkTarget(III[II)V
    .registers 10
    .param p1, "opIndex"    # I
    .param p2, "target"    # I
    .param p3, "codeLength"    # I
    .param p4, "stack"    # [I
    .param p5, "stackDepth"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 194
    if-ltz p2, :cond_4

    if-gt p3, p2, :cond_1d

    .line 195
    :cond_4
    new-instance v1, Ljavassist/bytecode/BadBytecode;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "bad branch offset at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v1

    .line 197
    :cond_1d
    aget v0, p4, p2

    .line 198
    .local v0, "d":I
    if-nez v0, :cond_25

    .line 199
    neg-int v1, p5

    aput v1, p4, p2

    .line 203
    :cond_24
    return-void

    .line 200
    :cond_25
    if-eq v0, p5, :cond_24

    neg-int v1, p5

    if-eq v0, v1, :cond_24

    .line 201
    new-instance v1, Ljavassist/bytecode/BadBytecode;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "verification error ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getFieldSize(Ljavassist/bytecode/CodeIterator;I)I
    .registers 6
    .param p1, "ci"    # Ljavassist/bytecode/CodeIterator;
    .param p2, "index"    # I

    .prologue
    .line 264
    iget-object v1, p0, Ljavassist/bytecode/CodeAnalyzer;->constPool:Ljavassist/bytecode/ConstPool;

    add-int/lit8 v2, p2, 0x1

    invoke-virtual {p1, v2}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v2

    invoke-virtual {v1, v2}, Ljavassist/bytecode/ConstPool;->getFieldrefType(I)Ljava/lang/String;

    move-result-object v0

    .line 265
    .local v0, "desc":Ljava/lang/String;
    invoke-static {v0}, Ljavassist/bytecode/Descriptor;->dataSize(Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method private initStack([ILjavassist/bytecode/CodeAttribute;)V
    .registers 8
    .param p1, "stack"    # [I
    .param p2, "ca"    # Ljavassist/bytecode/CodeAttribute;

    .prologue
    .line 63
    const/4 v3, 0x0

    const/4 v4, -0x1

    aput v4, p1, v3

    .line 64
    invoke-virtual {p2}, Ljavassist/bytecode/CodeAttribute;->getExceptionTable()Ljavassist/bytecode/ExceptionTable;

    move-result-object v0

    .line 65
    .local v0, "et":Ljavassist/bytecode/ExceptionTable;
    if-eqz v0, :cond_1b

    .line 66
    invoke-virtual {v0}, Ljavassist/bytecode/ExceptionTable;->size()I

    move-result v2

    .line 67
    .local v2, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    if-ge v1, v2, :cond_1b

    .line 68
    invoke-virtual {v0, v1}, Ljavassist/bytecode/ExceptionTable;->handlerPc(I)I

    move-result v3

    const/4 v4, -0x2

    aput v4, p1, v3

    .line 67
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 70
    .end local v1    # "i":I
    .end local v2    # "size":I
    :cond_1b
    return-void
.end method

.method private static isEnd(I)Z
    .registers 2
    .param p0, "opcode"    # I

    .prologue
    .line 206
    const/16 v0, 0xac

    if-gt v0, p0, :cond_8

    const/16 v0, 0xb1

    if-le p0, v0, :cond_c

    :cond_8
    const/16 v0, 0xbf

    if-ne p0, v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private processBranch(ILjavassist/bytecode/CodeIterator;II[II[I)Z
    .registers 21
    .param p1, "opcode"    # I
    .param p2, "ci"    # Ljavassist/bytecode/CodeIterator;
    .param p3, "index"    # I
    .param p4, "codeLength"    # I
    .param p5, "stack"    # [I
    .param p6, "stackDepth"    # I
    .param p7, "jsrDepth"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 103
    const/16 v1, 0x99

    if-gt v1, p1, :cond_8

    const/16 v1, 0xa6

    if-le p1, v1, :cond_10

    :cond_8
    const/16 v1, 0xc6

    if-eq p1, v1, :cond_10

    const/16 v1, 0xc7

    if-ne p1, v1, :cond_26

    .line 105
    :cond_10
    add-int/lit8 v1, p3, 0x1

    invoke-virtual {p2, v1}, Ljavassist/bytecode/CodeIterator;->s16bitAt(I)I

    move-result v1

    add-int v3, p3, v1

    .local v3, "target":I
    move-object v1, p0

    move/from16 v2, p3

    move/from16 v4, p4

    move-object/from16 v5, p5

    move/from16 v6, p6

    .line 106
    invoke-direct/range {v1 .. v6}, Ljavassist/bytecode/CodeAnalyzer;->checkTarget(III[II)V

    .line 187
    .end local v3    # "target":I
    :goto_24
    const/4 v1, 0x0

    :goto_25
    return v1

    .line 110
    :cond_26
    sparse-switch p1, :sswitch_data_15c

    goto :goto_24

    .line 112
    :sswitch_2a
    add-int/lit8 v1, p3, 0x1

    invoke-virtual {p2, v1}, Ljavassist/bytecode/CodeIterator;->s16bitAt(I)I

    move-result v1

    add-int v3, p3, v1

    .restart local v3    # "target":I
    move-object v1, p0

    move/from16 v2, p3

    move/from16 v4, p4

    move-object/from16 v5, p5

    move/from16 v6, p6

    .line 113
    invoke-direct/range {v1 .. v6}, Ljavassist/bytecode/CodeAnalyzer;->checkTarget(III[II)V

    .line 114
    const/4 v1, 0x1

    goto :goto_25

    .line 116
    .end local v3    # "target":I
    :sswitch_40
    add-int/lit8 v1, p3, 0x1

    invoke-virtual {p2, v1}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v1

    add-int v3, p3, v1

    .restart local v3    # "target":I
    move-object v1, p0

    move/from16 v2, p3

    move/from16 v4, p4

    move-object/from16 v5, p5

    move/from16 v6, p6

    .line 117
    invoke-direct/range {v1 .. v6}, Ljavassist/bytecode/CodeAnalyzer;->checkTarget(III[II)V

    .line 118
    const/4 v1, 0x1

    goto :goto_25

    .line 121
    .end local v3    # "target":I
    :sswitch_56
    const/16 v1, 0xa8

    if-ne p1, v1, :cond_78

    .line 122
    add-int/lit8 v1, p3, 0x1

    invoke-virtual {p2, v1}, Ljavassist/bytecode/CodeIterator;->s16bitAt(I)I

    move-result v1

    add-int v3, p3, v1

    .restart local v3    # "target":I
    :goto_62
    move-object v1, p0

    move/from16 v2, p3

    move/from16 v4, p4

    move-object/from16 v5, p5

    move/from16 v6, p6

    .line 126
    invoke-direct/range {v1 .. v6}, Ljavassist/bytecode/CodeAnalyzer;->checkTarget(III[II)V

    .line 134
    const/4 v1, 0x0

    aget v1, p7, v1

    if-gez v1, :cond_81

    .line 135
    const/4 v1, 0x0

    aput p6, p7, v1

    .line 136
    const/4 v1, 0x0

    goto :goto_25

    .line 124
    .end local v3    # "target":I
    :cond_78
    add-int/lit8 v1, p3, 0x1

    invoke-virtual {p2, v1}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v1

    add-int v3, p3, v1

    .restart local v3    # "target":I
    goto :goto_62

    .line 138
    :cond_81
    const/4 v1, 0x0

    aget v1, p7, v1

    move/from16 v0, p6

    if-ne v0, v1, :cond_8a

    .line 139
    const/4 v1, 0x0

    goto :goto_25

    .line 141
    :cond_8a
    new-instance v1, Ljavassist/bytecode/BadBytecode;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sorry, cannot compute this data flow due to JSR: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p6

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ","

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v4, 0x0

    aget v4, p7, v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v1

    .line 145
    .end local v3    # "target":I
    :sswitch_b2
    const/4 v1, 0x0

    aget v1, p7, v1

    if-gez v1, :cond_bf

    .line 146
    const/4 v1, 0x0

    add-int/lit8 v2, p6, 0x1

    aput v2, p7, v1

    .line 147
    const/4 v1, 0x0

    goto/16 :goto_25

    .line 149
    :cond_bf
    add-int/lit8 v1, p6, 0x1

    const/4 v2, 0x0

    aget v2, p7, v2

    if-ne v1, v2, :cond_c9

    .line 150
    const/4 v1, 0x1

    goto/16 :goto_25

    .line 152
    :cond_c9
    new-instance v1, Ljavassist/bytecode/BadBytecode;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sorry, cannot compute this data flow due to RET: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p6

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ","

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v4, 0x0

    aget v4, p7, v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v1

    .line 157
    :sswitch_f1
    and-int/lit8 v1, p3, -0x4

    add-int/lit8 v9, v1, 0x4

    .line 158
    .local v9, "index2":I
    invoke-virtual {p2, v9}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v1

    add-int v3, p3, v1

    .restart local v3    # "target":I
    move-object v1, p0

    move/from16 v2, p3

    move/from16 v4, p4

    move-object/from16 v5, p5

    move/from16 v6, p6

    .line 159
    invoke-direct/range {v1 .. v6}, Ljavassist/bytecode/CodeAnalyzer;->checkTarget(III[II)V

    .line 160
    const/16 v1, 0xab

    if-ne p1, v1, :cond_12d

    .line 161
    add-int/lit8 v1, v9, 0x4

    invoke-virtual {p2, v1}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v12

    .line 162
    .local v12, "npairs":I
    add-int/lit8 v9, v9, 0xc

    .line 163
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_114
    if-ge v8, v12, :cond_159

    .line 164
    invoke-virtual {p2, v9}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v1

    add-int v3, p3, v1

    move-object v1, p0

    move/from16 v2, p3

    move/from16 v4, p4

    move-object/from16 v5, p5

    move/from16 v6, p6

    .line 165
    invoke-direct/range {v1 .. v6}, Ljavassist/bytecode/CodeAnalyzer;->checkTarget(III[II)V

    .line 167
    add-int/lit8 v9, v9, 0x8

    .line 163
    add-int/lit8 v8, v8, 0x1

    goto :goto_114

    .line 171
    .end local v8    # "i":I
    .end local v12    # "npairs":I
    :cond_12d
    add-int/lit8 v1, v9, 0x4

    invoke-virtual {p2, v1}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v10

    .line 172
    .local v10, "low":I
    add-int/lit8 v1, v9, 0x8

    invoke-virtual {p2, v1}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v7

    .line 173
    .local v7, "high":I
    sub-int v1, v7, v10

    add-int/lit8 v11, v1, 0x1

    .line 174
    .local v11, "n":I
    add-int/lit8 v9, v9, 0xc

    .line 175
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_140
    if-ge v8, v11, :cond_159

    .line 176
    invoke-virtual {p2, v9}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v1

    add-int v3, p3, v1

    move-object v1, p0

    move/from16 v2, p3

    move/from16 v4, p4

    move-object/from16 v5, p5

    move/from16 v6, p6

    .line 177
    invoke-direct/range {v1 .. v6}, Ljavassist/bytecode/CodeAnalyzer;->checkTarget(III[II)V

    .line 179
    add-int/lit8 v9, v9, 0x4

    .line 175
    add-int/lit8 v8, v8, 0x1

    goto :goto_140

    .line 183
    .end local v7    # "high":I
    .end local v10    # "low":I
    .end local v11    # "n":I
    :cond_159
    const/4 v1, 0x1

    goto/16 :goto_25

    .line 110
    :sswitch_data_15c
    .sparse-switch
        0xa7 -> :sswitch_2a
        0xa8 -> :sswitch_56
        0xa9 -> :sswitch_b2
        0xaa -> :sswitch_f1
        0xab -> :sswitch_f1
        0xc8 -> :sswitch_40
        0xc9 -> :sswitch_56
    .end sparse-switch
.end method

.method private visitBytecode(Ljavassist/bytecode/CodeIterator;[II)V
    .registers 13
    .param p1, "ci"    # Ljavassist/bytecode/CodeIterator;
    .param p2, "stack"    # [I
    .param p3, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 75
    array-length v4, p2

    .line 76
    .local v4, "codeLength":I
    invoke-virtual {p1, p3}, Ljavassist/bytecode/CodeIterator;->move(I)V

    .line 77
    aget v0, p2, p3

    neg-int v6, v0

    .line 78
    .local v6, "stackDepth":I
    new-array v7, v8, [I

    .line 79
    .local v7, "jsrDepth":[I
    const/4 v0, 0x0

    const/4 v2, -0x1

    aput v2, v7, v0

    .line 80
    :cond_e
    :goto_e
    invoke-virtual {p1}, Ljavassist/bytecode/CodeIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_47

    .line 81
    invoke-virtual {p1}, Ljavassist/bytecode/CodeIterator;->next()I

    move-result p3

    .line 82
    aput v6, p2, p3

    .line 83
    invoke-virtual {p1, p3}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v1

    .line 84
    .local v1, "op":I
    invoke-direct {p0, v1, p1, p3, v6}, Ljavassist/bytecode/CodeAnalyzer;->visitInst(ILjavassist/bytecode/CodeIterator;II)I

    move-result v6

    .line 85
    if-ge v6, v8, :cond_3d

    .line 86
    new-instance v0, Ljavassist/bytecode/BadBytecode;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "stack underflow at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3d
    move-object v0, p0

    move-object v2, p1

    move v3, p3

    move-object v5, p2

    .line 88
    invoke-direct/range {v0 .. v7}, Ljavassist/bytecode/CodeAnalyzer;->processBranch(ILjavassist/bytecode/CodeIterator;II[II[I)Z

    move-result v0

    if-eqz v0, :cond_48

    .line 97
    .end local v1    # "op":I
    :cond_47
    return-void

    .line 91
    .restart local v1    # "op":I
    :cond_48
    invoke-static {v1}, Ljavassist/bytecode/CodeAnalyzer;->isEnd(I)Z

    move-result v0

    if-nez v0, :cond_47

    .line 94
    const/16 v0, 0xa8

    if-eq v1, v0, :cond_56

    const/16 v0, 0xc9

    if-ne v1, v0, :cond_e

    .line 95
    :cond_56
    add-int/lit8 v6, v6, -0x1

    goto :goto_e
.end method

.method private visitInst(ILjavassist/bytecode/CodeIterator;II)I
    .registers 8
    .param p1, "op"    # I
    .param p2, "ci"    # Ljavassist/bytecode/CodeIterator;
    .param p3, "index"    # I
    .param p4, "stack"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 216
    packed-switch p1, :pswitch_data_84

    .line 257
    :goto_3
    :pswitch_3
    sget-object v1, Ljavassist/bytecode/CodeAnalyzer;->STACK_GROW:[I

    aget v1, v1, p1

    add-int/2addr p4, v1

    .line 260
    :goto_8
    return p4

    .line 218
    :pswitch_9
    invoke-direct {p0, p2, p3}, Ljavassist/bytecode/CodeAnalyzer;->getFieldSize(Ljavassist/bytecode/CodeIterator;I)I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    add-int/2addr p4, v1

    .line 219
    goto :goto_8

    .line 221
    :pswitch_11
    invoke-direct {p0, p2, p3}, Ljavassist/bytecode/CodeAnalyzer;->getFieldSize(Ljavassist/bytecode/CodeIterator;I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    sub-int/2addr p4, v1

    .line 222
    goto :goto_8

    .line 224
    :pswitch_19
    invoke-direct {p0, p2, p3}, Ljavassist/bytecode/CodeAnalyzer;->getFieldSize(Ljavassist/bytecode/CodeIterator;I)I

    move-result v1

    add-int/2addr p4, v1

    .line 225
    goto :goto_8

    .line 227
    :pswitch_1f
    invoke-direct {p0, p2, p3}, Ljavassist/bytecode/CodeAnalyzer;->getFieldSize(Ljavassist/bytecode/CodeIterator;I)I

    move-result v1

    sub-int/2addr p4, v1

    .line 228
    goto :goto_8

    .line 231
    :pswitch_25
    iget-object v1, p0, Ljavassist/bytecode/CodeAnalyzer;->constPool:Ljavassist/bytecode/ConstPool;

    add-int/lit8 v2, p3, 0x1

    invoke-virtual {p2, v2}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v2

    invoke-virtual {v1, v2}, Ljavassist/bytecode/ConstPool;->getMethodrefType(I)Ljava/lang/String;

    move-result-object v0

    .line 232
    .local v0, "desc":Ljava/lang/String;
    invoke-static {v0}, Ljavassist/bytecode/Descriptor;->dataSize(Ljava/lang/String;)I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    add-int/2addr p4, v1

    .line 233
    goto :goto_8

    .line 235
    .end local v0    # "desc":Ljava/lang/String;
    :pswitch_39
    iget-object v1, p0, Ljavassist/bytecode/CodeAnalyzer;->constPool:Ljavassist/bytecode/ConstPool;

    add-int/lit8 v2, p3, 0x1

    invoke-virtual {p2, v2}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v2

    invoke-virtual {v1, v2}, Ljavassist/bytecode/ConstPool;->getMethodrefType(I)Ljava/lang/String;

    move-result-object v0

    .line 236
    .restart local v0    # "desc":Ljava/lang/String;
    invoke-static {v0}, Ljavassist/bytecode/Descriptor;->dataSize(Ljava/lang/String;)I

    move-result v1

    add-int/2addr p4, v1

    .line 237
    goto :goto_8

    .line 239
    .end local v0    # "desc":Ljava/lang/String;
    :pswitch_4b
    iget-object v1, p0, Ljavassist/bytecode/CodeAnalyzer;->constPool:Ljavassist/bytecode/ConstPool;

    add-int/lit8 v2, p3, 0x1

    invoke-virtual {p2, v2}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v2

    invoke-virtual {v1, v2}, Ljavassist/bytecode/ConstPool;->getInterfaceMethodrefType(I)Ljava/lang/String;

    move-result-object v0

    .line 241
    .restart local v0    # "desc":Ljava/lang/String;
    invoke-static {v0}, Ljavassist/bytecode/Descriptor;->dataSize(Ljava/lang/String;)I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    add-int/2addr p4, v1

    .line 242
    goto :goto_8

    .line 244
    .end local v0    # "desc":Ljava/lang/String;
    :pswitch_5f
    iget-object v1, p0, Ljavassist/bytecode/CodeAnalyzer;->constPool:Ljavassist/bytecode/ConstPool;

    add-int/lit8 v2, p3, 0x1

    invoke-virtual {p2, v2}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v2

    invoke-virtual {v1, v2}, Ljavassist/bytecode/ConstPool;->getInvokeDynamicType(I)Ljava/lang/String;

    move-result-object v0

    .line 245
    .restart local v0    # "desc":Ljava/lang/String;
    invoke-static {v0}, Ljavassist/bytecode/Descriptor;->dataSize(Ljava/lang/String;)I

    move-result v1

    add-int/2addr p4, v1

    .line 246
    goto :goto_8

    .line 248
    .end local v0    # "desc":Ljava/lang/String;
    :pswitch_71
    const/4 p4, 0x1

    .line 249
    goto :goto_8

    .line 251
    :pswitch_73
    add-int/lit8 v1, p3, 0x3

    invoke-virtual {p2, v1}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v1

    rsub-int/lit8 v1, v1, 0x1

    add-int/2addr p4, v1

    .line 252
    goto :goto_8

    .line 254
    :pswitch_7d
    add-int/lit8 v1, p3, 0x1

    invoke-virtual {p2, v1}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result p1

    goto :goto_3

    .line 216
    :pswitch_data_84
    .packed-switch 0xb2
        :pswitch_19
        :pswitch_1f
        :pswitch_9
        :pswitch_11
        :pswitch_25
        :pswitch_25
        :pswitch_39
        :pswitch_4b
        :pswitch_5f
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_71
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_7d
        :pswitch_73
    .end packed-switch
.end method


# virtual methods
.method public computeMaxStack()I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 39
    iget-object v6, p0, Ljavassist/bytecode/CodeAnalyzer;->codeAttr:Ljavassist/bytecode/CodeAttribute;

    invoke-virtual {v6}, Ljavassist/bytecode/CodeAttribute;->iterator()Ljavassist/bytecode/CodeIterator;

    move-result-object v0

    .line 40
    .local v0, "ci":Ljavassist/bytecode/CodeIterator;
    invoke-virtual {v0}, Ljavassist/bytecode/CodeIterator;->getCodeLength()I

    move-result v2

    .line 41
    .local v2, "length":I
    new-array v5, v2, [I

    .line 42
    .local v5, "stack":[I
    iget-object v6, p0, Ljavassist/bytecode/CodeAnalyzer;->codeAttr:Ljavassist/bytecode/CodeAttribute;

    invoke-virtual {v6}, Ljavassist/bytecode/CodeAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v6

    iput-object v6, p0, Ljavassist/bytecode/CodeAnalyzer;->constPool:Ljavassist/bytecode/ConstPool;

    .line 43
    iget-object v6, p0, Ljavassist/bytecode/CodeAnalyzer;->codeAttr:Ljavassist/bytecode/CodeAttribute;

    invoke-direct {p0, v5, v6}, Ljavassist/bytecode/CodeAnalyzer;->initStack([ILjavassist/bytecode/CodeAttribute;)V

    .line 46
    :cond_19
    const/4 v4, 0x0

    .line 47
    .local v4, "repeat":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1b
    if-ge v1, v2, :cond_28

    .line 48
    aget v6, v5, v1

    if-gez v6, :cond_25

    .line 49
    const/4 v4, 0x1

    .line 50
    invoke-direct {p0, v0, v5, v1}, Ljavassist/bytecode/CodeAnalyzer;->visitBytecode(Ljavassist/bytecode/CodeIterator;[II)V

    .line 47
    :cond_25
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 52
    :cond_28
    if-nez v4, :cond_19

    .line 54
    const/4 v3, 0x1

    .line 55
    .local v3, "maxStack":I
    const/4 v1, 0x0

    :goto_2c
    if-ge v1, v2, :cond_37

    .line 56
    aget v6, v5, v1

    if-le v6, v3, :cond_34

    .line 57
    aget v3, v5, v1

    .line 55
    :cond_34
    add-int/lit8 v1, v1, 0x1

    goto :goto_2c

    .line 59
    :cond_37
    add-int/lit8 v6, v3, -0x1

    return v6
.end method
