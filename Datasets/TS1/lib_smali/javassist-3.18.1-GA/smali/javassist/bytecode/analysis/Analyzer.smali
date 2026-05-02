.class public Ljavassist/bytecode/analysis/Analyzer;
.super Ljava/lang/Object;
.source "Analyzer.java"

# interfaces
.implements Ljavassist/bytecode/Opcode;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/bytecode/analysis/Analyzer$1;,
        Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;
    }
.end annotation


# instance fields
.field private clazz:Ljavassist/CtClass;

.field private exceptions:[Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;

.field private frames:[Ljavassist/bytecode/analysis/Frame;

.field private final scanner:Ljavassist/bytecode/analysis/SubroutineScanner;

.field private subroutines:[Ljavassist/bytecode/analysis/Subroutine;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    new-instance v0, Ljavassist/bytecode/analysis/SubroutineScanner;

    invoke-direct {v0}, Ljavassist/bytecode/analysis/SubroutineScanner;-><init>()V

    iput-object v0, p0, Ljavassist/bytecode/analysis/Analyzer;->scanner:Ljavassist/bytecode/analysis/SubroutineScanner;

    .line 93
    return-void
.end method

.method private analyzeNextEntry(Ljavassist/bytecode/MethodInfo;Ljavassist/bytecode/CodeIterator;Ljavassist/bytecode/analysis/IntQueue;Ljavassist/bytecode/analysis/Executor;)V
    .registers 23
    .param p1, "method"    # Ljavassist/bytecode/MethodInfo;
    .param p2, "iter"    # Ljavassist/bytecode/CodeIterator;
    .param p3, "queue"    # Ljavassist/bytecode/analysis/IntQueue;
    .param p4, "executor"    # Ljavassist/bytecode/analysis/Executor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 170
    invoke-virtual/range {p3 .. p3}, Ljavassist/bytecode/analysis/IntQueue;->take()I

    move-result v5

    .line 171
    .local v5, "pos":I
    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Ljavassist/bytecode/CodeIterator;->move(I)V

    .line 172
    invoke-virtual/range {p2 .. p2}, Ljavassist/bytecode/CodeIterator;->next()I

    .line 174
    move-object/from16 v0, p0

    iget-object v3, v0, Ljavassist/bytecode/analysis/Analyzer;->frames:[Ljavassist/bytecode/analysis/Frame;

    aget-object v3, v3, v5

    invoke-virtual {v3}, Ljavassist/bytecode/analysis/Frame;->copy()Ljavassist/bytecode/analysis/Frame;

    move-result-object v7

    .line 175
    .local v7, "frame":Ljavassist/bytecode/analysis/Frame;
    move-object/from16 v0, p0

    iget-object v3, v0, Ljavassist/bytecode/analysis/Analyzer;->subroutines:[Ljavassist/bytecode/analysis/Subroutine;

    aget-object v8, v3, v5

    .local v8, "subroutine":Ljavassist/bytecode/analysis/Subroutine;
    move-object/from16 v3, p4

    move-object/from16 v4, p1

    move-object/from16 v6, p2

    .line 178
    :try_start_22
    invoke-virtual/range {v3 .. v8}, Ljavassist/bytecode/analysis/Executor;->execute(Ljavassist/bytecode/MethodInfo;ILjavassist/bytecode/CodeIterator;Ljavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V
    :try_end_25
    .catch Ljava/lang/RuntimeException; {:try_start_22 .. :try_end_25} :catch_44

    .line 183
    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v16

    .line 185
    .local v16, "opcode":I
    const/16 v3, 0xaa

    move/from16 v0, v16

    if-ne v0, v3, :cond_6c

    .line 186
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v5, v2, v7}, Ljavassist/bytecode/analysis/Analyzer;->mergeTableSwitch(Ljavassist/bytecode/analysis/IntQueue;ILjavassist/bytecode/CodeIterator;Ljavassist/bytecode/analysis/Frame;)V

    .line 210
    :cond_3a
    :goto_3a
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v5, v7}, Ljavassist/bytecode/analysis/Analyzer;->mergeExceptionHandlers(Ljavassist/bytecode/analysis/IntQueue;Ljavassist/bytecode/MethodInfo;ILjavassist/bytecode/analysis/Frame;)V

    .line 211
    return-void

    .line 179
    .end local v16    # "opcode":I
    :catch_44
    move-exception v15

    .line 180
    .local v15, "e":Ljava/lang/RuntimeException;
    new-instance v3, Ljavassist/bytecode/BadBytecode;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "[pos = "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "]"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v15}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 187
    .end local v15    # "e":Ljava/lang/RuntimeException;
    .restart local v16    # "opcode":I
    :cond_6c
    const/16 v3, 0xab

    move/from16 v0, v16

    if-ne v0, v3, :cond_7c

    .line 188
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v5, v2, v7}, Ljavassist/bytecode/analysis/Analyzer;->mergeLookupSwitch(Ljavassist/bytecode/analysis/IntQueue;ILjavassist/bytecode/CodeIterator;Ljavassist/bytecode/analysis/Frame;)V

    goto :goto_3a

    .line 189
    :cond_7c
    const/16 v3, 0xa9

    move/from16 v0, v16

    if-ne v0, v3, :cond_8f

    move-object/from16 v9, p0

    move-object/from16 v10, p3

    move-object/from16 v11, p2

    move v12, v5

    move-object v13, v7

    move-object v14, v8

    .line 190
    invoke-direct/range {v9 .. v14}, Ljavassist/bytecode/analysis/Analyzer;->mergeRet(Ljavassist/bytecode/analysis/IntQueue;Ljavassist/bytecode/CodeIterator;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto :goto_3a

    .line 191
    :cond_8f
    invoke-static/range {v16 .. v16}, Ljavassist/bytecode/analysis/Util;->isJumpInstruction(I)Z

    move-result v3

    if-eqz v3, :cond_de

    .line 192
    move-object/from16 v0, p2

    invoke-static {v5, v0}, Ljavassist/bytecode/analysis/Util;->getJumpTarget(ILjavassist/bytecode/CodeIterator;)I

    move-result v17

    .line 194
    .local v17, "target":I
    invoke-static/range {v16 .. v16}, Ljavassist/bytecode/analysis/Util;->isJsr(I)Z

    move-result v3

    if-eqz v3, :cond_c8

    .line 196
    move-object/from16 v0, p0

    iget-object v3, v0, Ljavassist/bytecode/analysis/Analyzer;->frames:[Ljavassist/bytecode/analysis/Frame;

    aget-object v11, v3, v5

    move-object/from16 v0, p0

    iget-object v3, v0, Ljavassist/bytecode/analysis/Analyzer;->subroutines:[Ljavassist/bytecode/analysis/Subroutine;

    aget-object v12, v3, v17

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v5}, Ljavassist/bytecode/analysis/Analyzer;->lookAhead(Ljavassist/bytecode/CodeIterator;I)I

    move-result v14

    move-object/from16 v9, p0

    move-object/from16 v10, p3

    move v13, v5

    invoke-direct/range {v9 .. v14}, Ljavassist/bytecode/analysis/Analyzer;->mergeJsr(Ljavassist/bytecode/analysis/IntQueue;Ljavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;II)V

    .line 201
    :cond_bd
    :goto_bd
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move/from16 v2, v17

    invoke-direct {v0, v1, v7, v2}, Ljavassist/bytecode/analysis/Analyzer;->merge(Ljavassist/bytecode/analysis/IntQueue;Ljavassist/bytecode/analysis/Frame;I)V

    goto/16 :goto_3a

    .line 197
    :cond_c8
    invoke-static/range {v16 .. v16}, Ljavassist/bytecode/analysis/Util;->isGoto(I)Z

    move-result v3

    if-nez v3, :cond_bd

    .line 198
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v5}, Ljavassist/bytecode/analysis/Analyzer;->lookAhead(Ljavassist/bytecode/CodeIterator;I)I

    move-result v3

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1, v7, v3}, Ljavassist/bytecode/analysis/Analyzer;->merge(Ljavassist/bytecode/analysis/IntQueue;Ljavassist/bytecode/analysis/Frame;I)V

    goto :goto_bd

    .line 202
    .end local v17    # "target":I
    :cond_de
    const/16 v3, 0xbf

    move/from16 v0, v16

    if-eq v0, v3, :cond_3a

    invoke-static/range {v16 .. v16}, Ljavassist/bytecode/analysis/Util;->isReturn(I)Z

    move-result v3

    if-nez v3, :cond_3a

    .line 204
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v5}, Ljavassist/bytecode/analysis/Analyzer;->lookAhead(Ljavassist/bytecode/CodeIterator;I)I

    move-result v3

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1, v7, v3}, Ljavassist/bytecode/analysis/Analyzer;->merge(Ljavassist/bytecode/analysis/IntQueue;Ljavassist/bytecode/analysis/Frame;I)V

    goto/16 :goto_3a
.end method

.method private buildExceptionInfo(Ljavassist/bytecode/MethodInfo;)[Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;
    .registers 15
    .param p1, "method"    # Ljavassist/bytecode/MethodInfo;

    .prologue
    .line 214
    invoke-virtual {p1}, Ljavassist/bytecode/MethodInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v7

    .line 215
    .local v7, "constPool":Ljavassist/bytecode/ConstPool;
    iget-object v0, p0, Ljavassist/bytecode/analysis/Analyzer;->clazz:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v6

    .line 217
    .local v6, "classes":Ljavassist/ClassPool;
    invoke-virtual {p1}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/bytecode/CodeAttribute;->getExceptionTable()Ljavassist/bytecode/ExceptionTable;

    move-result-object v12

    .line 218
    .local v12, "table":Ljavassist/bytecode/ExceptionTable;
    invoke-virtual {v12}, Ljavassist/bytecode/ExceptionTable;->size()I

    move-result v0

    new-array v9, v0, [Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;

    .line 219
    .local v9, "exceptions":[Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_19
    invoke-virtual {v12}, Ljavassist/bytecode/ExceptionTable;->size()I

    move-result v0

    if-ge v10, v0, :cond_56

    .line 220
    invoke-virtual {v12, v10}, Ljavassist/bytecode/ExceptionTable;->catchType(I)I

    move-result v11

    .line 223
    .local v11, "index":I
    if-nez v11, :cond_3e

    :try_start_25
    sget-object v4, Ljavassist/bytecode/analysis/Type;->THROWABLE:Ljavassist/bytecode/analysis/Type;
    :try_end_27
    .catch Ljavassist/NotFoundException; {:try_start_25 .. :try_end_27} :catch_4b

    .line 228
    .local v4, "type":Ljavassist/bytecode/analysis/Type;
    :goto_27
    new-instance v0, Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;

    invoke-virtual {v12, v10}, Ljavassist/bytecode/ExceptionTable;->startPc(I)I

    move-result v1

    invoke-virtual {v12, v10}, Ljavassist/bytecode/ExceptionTable;->endPc(I)I

    move-result v2

    invoke-virtual {v12, v10}, Ljavassist/bytecode/ExceptionTable;->handlerPc(I)I

    move-result v3

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;-><init>(IIILjavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Analyzer$1;)V

    aput-object v0, v9, v10

    .line 219
    add-int/lit8 v10, v10, 0x1

    goto :goto_19

    .line 223
    .end local v4    # "type":Ljavassist/bytecode/analysis/Type;
    :cond_3e
    :try_start_3e
    invoke-virtual {v7, v11}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    invoke-static {v0}, Ljavassist/bytecode/analysis/Type;->get(Ljavassist/CtClass;)Ljavassist/bytecode/analysis/Type;
    :try_end_49
    .catch Ljavassist/NotFoundException; {:try_start_3e .. :try_end_49} :catch_4b

    move-result-object v4

    goto :goto_27

    .line 224
    :catch_4b
    move-exception v8

    .line 225
    .local v8, "e":Ljavassist/NotFoundException;
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {v8}, Ljavassist/NotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 231
    .end local v8    # "e":Ljavassist/NotFoundException;
    .end local v11    # "index":I
    :cond_56
    return-object v9
.end method

.method private firstFrame(Ljavassist/bytecode/MethodInfo;II)Ljavassist/bytecode/analysis/Frame;
    .registers 13
    .param p1, "method"    # Ljavassist/bytecode/MethodInfo;
    .param p2, "maxLocals"    # I
    .param p3, "maxStack"    # I

    .prologue
    .line 235
    const/4 v4, 0x0

    .line 237
    .local v4, "pos":I
    new-instance v1, Ljavassist/bytecode/analysis/Frame;

    invoke-direct {v1, p2, p3}, Ljavassist/bytecode/analysis/Frame;-><init>(II)V

    .line 238
    .local v1, "first":Ljavassist/bytecode/analysis/Frame;
    invoke-virtual {p1}, Ljavassist/bytecode/MethodInfo;->getAccessFlags()I

    move-result v7

    and-int/lit8 v7, v7, 0x8

    if-nez v7, :cond_1a

    .line 239
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "pos":I
    .local v5, "pos":I
    iget-object v7, p0, Ljavassist/bytecode/analysis/Analyzer;->clazz:Ljavassist/CtClass;

    invoke-static {v7}, Ljavassist/bytecode/analysis/Type;->get(Ljavassist/CtClass;)Ljavassist/bytecode/analysis/Type;

    move-result-object v7

    invoke-virtual {v1, v4, v7}, Ljavassist/bytecode/analysis/Frame;->setLocal(ILjavassist/bytecode/analysis/Type;)V

    move v4, v5

    .line 244
    .end local v5    # "pos":I
    .restart local v4    # "pos":I
    :cond_1a
    :try_start_1a
    invoke-virtual {p1}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Ljavassist/bytecode/analysis/Analyzer;->clazz:Ljavassist/CtClass;

    invoke-virtual {v8}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v8

    invoke-static {v7, v8}, Ljavassist/bytecode/Descriptor;->getParameterTypes(Ljava/lang/String;Ljavassist/ClassPool;)[Ljavassist/CtClass;
    :try_end_27
    .catch Ljavassist/NotFoundException; {:try_start_1a .. :try_end_27} :catch_4c

    move-result-object v3

    .line 249
    .local v3, "parameters":[Ljavassist/CtClass;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_29
    array-length v7, v3

    if-ge v2, v7, :cond_53

    .line 250
    aget-object v7, v3, v2

    invoke-static {v7}, Ljavassist/bytecode/analysis/Type;->get(Ljavassist/CtClass;)Ljavassist/bytecode/analysis/Type;

    move-result-object v7

    invoke-direct {p0, v7}, Ljavassist/bytecode/analysis/Analyzer;->zeroExtend(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;

    move-result-object v6

    .line 251
    .local v6, "type":Ljavassist/bytecode/analysis/Type;
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "pos":I
    .restart local v5    # "pos":I
    invoke-virtual {v1, v4, v6}, Ljavassist/bytecode/analysis/Frame;->setLocal(ILjavassist/bytecode/analysis/Type;)V

    .line 252
    invoke-virtual {v6}, Ljavassist/bytecode/analysis/Type;->getSize()I

    move-result v7

    const/4 v8, 0x2

    if-ne v7, v8, :cond_54

    .line 253
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "pos":I
    .restart local v4    # "pos":I
    sget-object v7, Ljavassist/bytecode/analysis/Type;->TOP:Ljavassist/bytecode/analysis/Type;

    invoke-virtual {v1, v5, v7}, Ljavassist/bytecode/analysis/Frame;->setLocal(ILjavassist/bytecode/analysis/Type;)V

    .line 249
    :goto_49
    add-int/lit8 v2, v2, 0x1

    goto :goto_29

    .line 245
    .end local v2    # "i":I
    .end local v3    # "parameters":[Ljavassist/CtClass;
    .end local v6    # "type":Ljavassist/bytecode/analysis/Type;
    :catch_4c
    move-exception v0

    .line 246
    .local v0, "e":Ljavassist/NotFoundException;
    new-instance v7, Ljava/lang/RuntimeException;

    invoke-direct {v7, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 256
    .end local v0    # "e":Ljavassist/NotFoundException;
    .restart local v2    # "i":I
    .restart local v3    # "parameters":[Ljavassist/CtClass;
    :cond_53
    return-object v1

    .end local v4    # "pos":I
    .restart local v5    # "pos":I
    .restart local v6    # "type":Ljavassist/bytecode/analysis/Type;
    :cond_54
    move v4, v5

    .end local v5    # "pos":I
    .restart local v4    # "pos":I
    goto :goto_49
.end method

.method private getNext(Ljavassist/bytecode/CodeIterator;II)I
    .registers 5
    .param p1, "iter"    # Ljavassist/bytecode/CodeIterator;
    .param p2, "of"    # I
    .param p3, "restore"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 260
    invoke-virtual {p1, p2}, Ljavassist/bytecode/CodeIterator;->move(I)V

    .line 261
    invoke-virtual {p1}, Ljavassist/bytecode/CodeIterator;->next()I

    .line 262
    invoke-virtual {p1}, Ljavassist/bytecode/CodeIterator;->lookAhead()I

    move-result v0

    .line 263
    .local v0, "next":I
    invoke-virtual {p1, p3}, Ljavassist/bytecode/CodeIterator;->move(I)V

    .line 264
    invoke-virtual {p1}, Ljavassist/bytecode/CodeIterator;->next()I

    .line 266
    return v0
.end method

.method private lookAhead(Ljavassist/bytecode/CodeIterator;I)I
    .registers 6
    .param p1, "iter"    # Ljavassist/bytecode/CodeIterator;
    .param p2, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 270
    invoke-virtual {p1}, Ljavassist/bytecode/CodeIterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_25

    .line 271
    new-instance v0, Ljavassist/bytecode/BadBytecode;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Execution falls off end! [pos = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v0

    .line 273
    :cond_25
    invoke-virtual {p1}, Ljavassist/bytecode/CodeIterator;->lookAhead()I

    move-result v0

    return v0
.end method

.method private merge(Ljavassist/bytecode/analysis/IntQueue;Ljavassist/bytecode/analysis/Frame;I)V
    .registers 8
    .param p1, "queue"    # Ljavassist/bytecode/analysis/IntQueue;
    .param p2, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .param p3, "target"    # I

    .prologue
    .line 278
    iget-object v2, p0, Ljavassist/bytecode/analysis/Analyzer;->frames:[Ljavassist/bytecode/analysis/Frame;

    aget-object v1, v2, p3

    .line 281
    .local v1, "old":Ljavassist/bytecode/analysis/Frame;
    if-nez v1, :cond_15

    .line 282
    iget-object v2, p0, Ljavassist/bytecode/analysis/Analyzer;->frames:[Ljavassist/bytecode/analysis/Frame;

    invoke-virtual {p2}, Ljavassist/bytecode/analysis/Frame;->copy()Ljavassist/bytecode/analysis/Frame;

    move-result-object v3

    aput-object v3, v2, p3

    .line 283
    const/4 v0, 0x1

    .line 288
    .local v0, "changed":Z
    :goto_f
    if-eqz v0, :cond_14

    .line 289
    invoke-virtual {p1, p3}, Ljavassist/bytecode/analysis/IntQueue;->add(I)V

    .line 291
    :cond_14
    return-void

    .line 285
    .end local v0    # "changed":Z
    :cond_15
    invoke-virtual {v1, p2}, Ljavassist/bytecode/analysis/Frame;->merge(Ljavassist/bytecode/analysis/Frame;)Z

    move-result v0

    .restart local v0    # "changed":Z
    goto :goto_f
.end method

.method private mergeExceptionHandlers(Ljavassist/bytecode/analysis/IntQueue;Ljavassist/bytecode/MethodInfo;ILjavassist/bytecode/analysis/Frame;)V
    .registers 9
    .param p1, "queue"    # Ljavassist/bytecode/analysis/IntQueue;
    .param p2, "method"    # Ljavassist/bytecode/MethodInfo;
    .param p3, "pos"    # I
    .param p4, "frame"    # Ljavassist/bytecode/analysis/Frame;

    .prologue
    .line 294
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v3, p0, Ljavassist/bytecode/analysis/Analyzer;->exceptions:[Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;

    array-length v3, v3

    if-ge v1, v3, :cond_2e

    .line 295
    iget-object v3, p0, Ljavassist/bytecode/analysis/Analyzer;->exceptions:[Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;

    aget-object v0, v3, v1

    .line 298
    .local v0, "exception":Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;
    # getter for: Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;->start:I
    invoke-static {v0}, Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;->access$100(Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;)I

    move-result v3

    if-lt p3, v3, :cond_2b

    # getter for: Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;->end:I
    invoke-static {v0}, Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;->access$200(Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;)I

    move-result v3

    if-ge p3, v3, :cond_2b

    .line 299
    invoke-virtual {p4}, Ljavassist/bytecode/analysis/Frame;->copy()Ljavassist/bytecode/analysis/Frame;

    move-result-object v2

    .line 300
    .local v2, "newFrame":Ljavassist/bytecode/analysis/Frame;
    invoke-virtual {v2}, Ljavassist/bytecode/analysis/Frame;->clearStack()V

    .line 301
    # getter for: Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;->type:Ljavassist/bytecode/analysis/Type;
    invoke-static {v0}, Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;->access$300(Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;)Ljavassist/bytecode/analysis/Type;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    .line 302
    # getter for: Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;->handler:I
    invoke-static {v0}, Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;->access$400(Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;)I

    move-result v3

    invoke-direct {p0, p1, v2, v3}, Ljavassist/bytecode/analysis/Analyzer;->merge(Ljavassist/bytecode/analysis/IntQueue;Ljavassist/bytecode/analysis/Frame;I)V

    .line 294
    .end local v2    # "newFrame":Ljavassist/bytecode/analysis/Frame;
    :cond_2b
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 305
    .end local v0    # "exception":Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;
    :cond_2e
    return-void
.end method

.method private mergeJsr(Ljavassist/bytecode/analysis/IntQueue;Ljavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;II)V
    .registers 14
    .param p1, "queue"    # Ljavassist/bytecode/analysis/IntQueue;
    .param p2, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .param p3, "sub"    # Ljavassist/bytecode/analysis/Subroutine;
    .param p4, "pos"    # I
    .param p5, "next"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 308
    if-nez p3, :cond_21

    .line 309
    new-instance v5, Ljavassist/bytecode/BadBytecode;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "No subroutine at jsr target! [pos = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v5

    .line 311
    :cond_21
    iget-object v5, p0, Ljavassist/bytecode/analysis/Analyzer;->frames:[Ljavassist/bytecode/analysis/Frame;

    aget-object v3, v5, p5

    .line 312
    .local v3, "old":Ljavassist/bytecode/analysis/Frame;
    const/4 v0, 0x0

    .line 314
    .local v0, "changed":Z
    if-nez v3, :cond_48

    .line 315
    iget-object v5, p0, Ljavassist/bytecode/analysis/Analyzer;->frames:[Ljavassist/bytecode/analysis/Frame;

    invoke-virtual {p2}, Ljavassist/bytecode/analysis/Frame;->copy()Ljavassist/bytecode/analysis/Frame;

    move-result-object v3

    .end local v3    # "old":Ljavassist/bytecode/analysis/Frame;
    aput-object v3, v5, p5

    .line 316
    .restart local v3    # "old":Ljavassist/bytecode/analysis/Frame;
    const/4 v0, 0x1

    .line 338
    :cond_31
    invoke-virtual {v3}, Ljavassist/bytecode/analysis/Frame;->isJsrMerged()Z

    move-result v5

    if-nez v5, :cond_3c

    .line 339
    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Ljavassist/bytecode/analysis/Frame;->setJsrMerged(Z)V

    .line 340
    const/4 v0, 0x1

    .line 343
    :cond_3c
    if-eqz v0, :cond_47

    invoke-virtual {v3}, Ljavassist/bytecode/analysis/Frame;->isRetMerged()Z

    move-result v5

    if-eqz v5, :cond_47

    .line 344
    invoke-virtual {p1, p5}, Ljavassist/bytecode/analysis/IntQueue;->add(I)V

    .line 346
    :cond_47
    return-void

    .line 318
    :cond_48
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_49
    invoke-virtual {p2}, Ljavassist/bytecode/analysis/Frame;->localsLength()I

    move-result v5

    if-ge v1, v5, :cond_31

    .line 320
    invoke-virtual {p3, v1}, Ljavassist/bytecode/analysis/Subroutine;->isAccessed(I)Z

    move-result v5

    if-nez v5, :cond_63

    .line 321
    invoke-virtual {v3, v1}, Ljavassist/bytecode/analysis/Frame;->getLocal(I)Ljavassist/bytecode/analysis/Type;

    move-result-object v4

    .line 322
    .local v4, "oldType":Ljavassist/bytecode/analysis/Type;
    invoke-virtual {p2, v1}, Ljavassist/bytecode/analysis/Frame;->getLocal(I)Ljavassist/bytecode/analysis/Type;

    move-result-object v2

    .line 323
    .local v2, "newType":Ljavassist/bytecode/analysis/Type;
    if-nez v4, :cond_66

    .line 324
    invoke-virtual {v3, v1, v2}, Ljavassist/bytecode/analysis/Frame;->setLocal(ILjavassist/bytecode/analysis/Type;)V

    .line 325
    const/4 v0, 0x1

    .line 318
    .end local v2    # "newType":Ljavassist/bytecode/analysis/Type;
    .end local v4    # "oldType":Ljavassist/bytecode/analysis/Type;
    :cond_63
    :goto_63
    add-int/lit8 v1, v1, 0x1

    goto :goto_49

    .line 329
    .restart local v2    # "newType":Ljavassist/bytecode/analysis/Type;
    .restart local v4    # "oldType":Ljavassist/bytecode/analysis/Type;
    :cond_66
    invoke-virtual {v4, v2}, Ljavassist/bytecode/analysis/Type;->merge(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;

    move-result-object v2

    .line 331
    invoke-virtual {v3, v1, v2}, Ljavassist/bytecode/analysis/Frame;->setLocal(ILjavassist/bytecode/analysis/Type;)V

    .line 332
    invoke-virtual {v2, v4}, Ljavassist/bytecode/analysis/Type;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_79

    invoke-virtual {v2}, Ljavassist/bytecode/analysis/Type;->popChanged()Z

    move-result v5

    if-eqz v5, :cond_63

    .line 333
    :cond_79
    const/4 v0, 0x1

    goto :goto_63
.end method

.method private mergeLookupSwitch(Ljavassist/bytecode/analysis/IntQueue;ILjavassist/bytecode/CodeIterator;Ljavassist/bytecode/analysis/Frame;)V
    .registers 10
    .param p1, "queue"    # Ljavassist/bytecode/analysis/IntQueue;
    .param p2, "pos"    # I
    .param p3, "iter"    # Ljavassist/bytecode/CodeIterator;
    .param p4, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 349
    and-int/lit8 v4, p2, -0x4

    add-int/lit8 v1, v4, 0x4

    .line 351
    .local v1, "index":I
    invoke-virtual {p3, v1}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v4

    add-int/2addr v4, p2

    invoke-direct {p0, p1, p4, v4}, Ljavassist/bytecode/analysis/Analyzer;->merge(Ljavassist/bytecode/analysis/IntQueue;Ljavassist/bytecode/analysis/Frame;I)V

    .line 352
    add-int/lit8 v1, v1, 0x4

    invoke-virtual {p3, v1}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v2

    .line 353
    .local v2, "npairs":I
    mul-int/lit8 v4, v2, 0x8

    add-int/lit8 v1, v1, 0x4

    add-int v0, v4, v1

    .line 356
    .local v0, "end":I
    add-int/lit8 v1, v1, 0x4

    :goto_1a
    if-ge v1, v0, :cond_28

    .line 357
    invoke-virtual {p3, v1}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v4

    add-int v3, v4, p2

    .line 358
    .local v3, "target":I
    invoke-direct {p0, p1, p4, v3}, Ljavassist/bytecode/analysis/Analyzer;->merge(Ljavassist/bytecode/analysis/IntQueue;Ljavassist/bytecode/analysis/Frame;I)V

    .line 356
    add-int/lit8 v1, v1, 0x8

    goto :goto_1a

    .line 360
    .end local v3    # "target":I
    :cond_28
    return-void
.end method

.method private mergeRet(Ljavassist/bytecode/analysis/IntQueue;Ljavassist/bytecode/CodeIterator;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V
    .registers 19
    .param p1, "queue"    # Ljavassist/bytecode/analysis/IntQueue;
    .param p2, "iter"    # Ljavassist/bytecode/CodeIterator;
    .param p3, "pos"    # I
    .param p4, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .param p5, "subroutine"    # Ljavassist/bytecode/analysis/Subroutine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 363
    if-nez p5, :cond_23

    .line 364
    new-instance v10, Ljavassist/bytecode/BadBytecode;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Ret on no subroutine! [pos = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move/from16 v0, p3

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "]"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v10

    .line 366
    :cond_23
    invoke-virtual/range {p5 .. p5}, Ljavassist/bytecode/analysis/Subroutine;->callers()Ljava/util/Collection;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 367
    .local v2, "callerIter":Ljava/util/Iterator;
    :cond_2b
    :goto_2b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_98

    .line 368
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 369
    .local v1, "caller":I
    move/from16 v0, p3

    invoke-direct {p0, p2, v1, v0}, Ljavassist/bytecode/analysis/Analyzer;->getNext(Ljavassist/bytecode/CodeIterator;II)I

    move-result v9

    .line 370
    .local v9, "returnLoc":I
    const/4 v3, 0x0

    .line 372
    .local v3, "changed":Z
    iget-object v10, p0, Ljavassist/bytecode/analysis/Analyzer;->frames:[Ljavassist/bytecode/analysis/Frame;

    aget-object v7, v10, v9

    .line 373
    .local v7, "old":Ljavassist/bytecode/analysis/Frame;
    if-nez v7, :cond_7a

    .line 374
    iget-object v10, p0, Ljavassist/bytecode/analysis/Analyzer;->frames:[Ljavassist/bytecode/analysis/Frame;

    invoke-virtual/range {p4 .. p4}, Ljavassist/bytecode/analysis/Frame;->copyStack()Ljavassist/bytecode/analysis/Frame;

    move-result-object v7

    .end local v7    # "old":Ljavassist/bytecode/analysis/Frame;
    aput-object v7, v10, v9

    .line 375
    .restart local v7    # "old":Ljavassist/bytecode/analysis/Frame;
    const/4 v3, 0x1

    .line 380
    :goto_51
    invoke-virtual/range {p5 .. p5}, Ljavassist/bytecode/analysis/Subroutine;->accessed()Ljava/util/Collection;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i":Ljava/util/Iterator;
    :cond_59
    :goto_59
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_81

    .line 381
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 382
    .local v5, "index":I
    invoke-virtual {v7, v5}, Ljavassist/bytecode/analysis/Frame;->getLocal(I)Ljavassist/bytecode/analysis/Type;

    move-result-object v8

    .line 383
    .local v8, "oldType":Ljavassist/bytecode/analysis/Type;
    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Ljavassist/bytecode/analysis/Frame;->getLocal(I)Ljavassist/bytecode/analysis/Type;

    move-result-object v6

    .line 384
    .local v6, "newType":Ljavassist/bytecode/analysis/Type;
    if-eq v8, v6, :cond_59

    .line 385
    invoke-virtual {v7, v5, v6}, Ljavassist/bytecode/analysis/Frame;->setLocal(ILjavassist/bytecode/analysis/Type;)V

    .line 386
    const/4 v3, 0x1

    goto :goto_59

    .line 377
    .end local v4    # "i":Ljava/util/Iterator;
    .end local v5    # "index":I
    .end local v6    # "newType":Ljavassist/bytecode/analysis/Type;
    .end local v8    # "oldType":Ljavassist/bytecode/analysis/Type;
    :cond_7a
    move-object/from16 v0, p4

    invoke-virtual {v7, v0}, Ljavassist/bytecode/analysis/Frame;->mergeStack(Ljavassist/bytecode/analysis/Frame;)Z

    move-result v3

    goto :goto_51

    .line 390
    .restart local v4    # "i":Ljava/util/Iterator;
    :cond_81
    invoke-virtual {v7}, Ljavassist/bytecode/analysis/Frame;->isRetMerged()Z

    move-result v10

    if-nez v10, :cond_8c

    .line 391
    const/4 v10, 0x1

    invoke-virtual {v7, v10}, Ljavassist/bytecode/analysis/Frame;->setRetMerged(Z)V

    .line 392
    const/4 v3, 0x1

    .line 395
    :cond_8c
    if-eqz v3, :cond_2b

    invoke-virtual {v7}, Ljavassist/bytecode/analysis/Frame;->isJsrMerged()Z

    move-result v10

    if-eqz v10, :cond_2b

    .line 396
    invoke-virtual {p1, v9}, Ljavassist/bytecode/analysis/IntQueue;->add(I)V

    goto :goto_2b

    .line 398
    .end local v1    # "caller":I
    .end local v3    # "changed":Z
    .end local v4    # "i":Ljava/util/Iterator;
    .end local v7    # "old":Ljavassist/bytecode/analysis/Frame;
    .end local v9    # "returnLoc":I
    :cond_98
    return-void
.end method

.method private mergeTableSwitch(Ljavassist/bytecode/analysis/IntQueue;ILjavassist/bytecode/CodeIterator;Ljavassist/bytecode/analysis/Frame;)V
    .registers 11
    .param p1, "queue"    # Ljavassist/bytecode/analysis/IntQueue;
    .param p2, "pos"    # I
    .param p3, "iter"    # Ljavassist/bytecode/CodeIterator;
    .param p4, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 403
    and-int/lit8 v5, p2, -0x4

    add-int/lit8 v2, v5, 0x4

    .line 405
    .local v2, "index":I
    invoke-virtual {p3, v2}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v5

    add-int/2addr v5, p2

    invoke-direct {p0, p1, p4, v5}, Ljavassist/bytecode/analysis/Analyzer;->merge(Ljavassist/bytecode/analysis/IntQueue;Ljavassist/bytecode/analysis/Frame;I)V

    .line 406
    add-int/lit8 v2, v2, 0x4

    invoke-virtual {p3, v2}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v3

    .line 407
    .local v3, "low":I
    add-int/lit8 v2, v2, 0x4

    invoke-virtual {p3, v2}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v1

    .line 408
    .local v1, "high":I
    sub-int v5, v1, v3

    add-int/lit8 v5, v5, 0x1

    mul-int/lit8 v5, v5, 0x4

    add-int/lit8 v2, v2, 0x4

    add-int v0, v5, v2

    .line 411
    .local v0, "end":I
    :goto_22
    if-ge v2, v0, :cond_30

    .line 412
    invoke-virtual {p3, v2}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v5

    add-int v4, v5, p2

    .line 413
    .local v4, "target":I
    invoke-direct {p0, p1, p4, v4}, Ljavassist/bytecode/analysis/Analyzer;->merge(Ljavassist/bytecode/analysis/IntQueue;Ljavassist/bytecode/analysis/Frame;I)V

    .line 411
    add-int/lit8 v2, v2, 0x4

    goto :goto_22

    .line 415
    .end local v4    # "target":I
    :cond_30
    return-void
.end method

.method private zeroExtend(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;
    .registers 3
    .param p1, "type"    # Ljavassist/bytecode/analysis/Type;

    .prologue
    .line 418
    sget-object v0, Ljavassist/bytecode/analysis/Type;->SHORT:Ljavassist/bytecode/analysis/Type;

    if-eq p1, v0, :cond_10

    sget-object v0, Ljavassist/bytecode/analysis/Type;->BYTE:Ljavassist/bytecode/analysis/Type;

    if-eq p1, v0, :cond_10

    sget-object v0, Ljavassist/bytecode/analysis/Type;->CHAR:Ljavassist/bytecode/analysis/Type;

    if-eq p1, v0, :cond_10

    sget-object v0, Ljavassist/bytecode/analysis/Type;->BOOLEAN:Ljavassist/bytecode/analysis/Type;

    if-ne p1, v0, :cond_12

    .line 419
    :cond_10
    sget-object p1, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    .line 421
    .end local p1    # "type":Ljavassist/bytecode/analysis/Type;
    :cond_12
    return-object p1
.end method


# virtual methods
.method public analyze(Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)[Ljavassist/bytecode/analysis/Frame;
    .registers 13
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "method"    # Ljavassist/bytecode/MethodInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 123
    iput-object p1, p0, Ljavassist/bytecode/analysis/Analyzer;->clazz:Ljavassist/CtClass;

    .line 124
    invoke-virtual {p2}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v0

    .line 126
    .local v0, "codeAttribute":Ljavassist/bytecode/CodeAttribute;
    if-nez v0, :cond_a

    .line 127
    const/4 v7, 0x0

    .line 147
    :goto_9
    return-object v7

    .line 129
    :cond_a
    invoke-virtual {v0}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v4

    .line 130
    .local v4, "maxLocals":I
    invoke-virtual {v0}, Ljavassist/bytecode/CodeAttribute;->getMaxStack()I

    move-result v5

    .line 131
    .local v5, "maxStack":I
    invoke-virtual {v0}, Ljavassist/bytecode/CodeAttribute;->getCodeLength()I

    move-result v1

    .line 133
    .local v1, "codeLength":I
    invoke-virtual {v0}, Ljavassist/bytecode/CodeAttribute;->iterator()Ljavassist/bytecode/CodeIterator;

    move-result-object v3

    .line 134
    .local v3, "iter":Ljavassist/bytecode/CodeIterator;
    new-instance v6, Ljavassist/bytecode/analysis/IntQueue;

    invoke-direct {v6}, Ljavassist/bytecode/analysis/IntQueue;-><init>()V

    .line 136
    .local v6, "queue":Ljavassist/bytecode/analysis/IntQueue;
    invoke-direct {p0, p2}, Ljavassist/bytecode/analysis/Analyzer;->buildExceptionInfo(Ljavassist/bytecode/MethodInfo;)[Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;

    move-result-object v7

    iput-object v7, p0, Ljavassist/bytecode/analysis/Analyzer;->exceptions:[Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;

    .line 137
    iget-object v7, p0, Ljavassist/bytecode/analysis/Analyzer;->scanner:Ljavassist/bytecode/analysis/SubroutineScanner;

    invoke-virtual {v7, p2}, Ljavassist/bytecode/analysis/SubroutineScanner;->scan(Ljavassist/bytecode/MethodInfo;)[Ljavassist/bytecode/analysis/Subroutine;

    move-result-object v7

    iput-object v7, p0, Ljavassist/bytecode/analysis/Analyzer;->subroutines:[Ljavassist/bytecode/analysis/Subroutine;

    .line 139
    new-instance v2, Ljavassist/bytecode/analysis/Executor;

    invoke-virtual {p1}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v7

    invoke-virtual {p2}, Ljavassist/bytecode/MethodInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v8

    invoke-direct {v2, v7, v8}, Ljavassist/bytecode/analysis/Executor;-><init>(Ljavassist/ClassPool;Ljavassist/bytecode/ConstPool;)V

    .line 140
    .local v2, "executor":Ljavassist/bytecode/analysis/Executor;
    new-array v7, v1, [Ljavassist/bytecode/analysis/Frame;

    iput-object v7, p0, Ljavassist/bytecode/analysis/Analyzer;->frames:[Ljavassist/bytecode/analysis/Frame;

    .line 141
    iget-object v7, p0, Ljavassist/bytecode/analysis/Analyzer;->frames:[Ljavassist/bytecode/analysis/Frame;

    invoke-virtual {v3}, Ljavassist/bytecode/CodeIterator;->lookAhead()I

    move-result v8

    invoke-direct {p0, p2, v4, v5}, Ljavassist/bytecode/analysis/Analyzer;->firstFrame(Ljavassist/bytecode/MethodInfo;II)Ljavassist/bytecode/analysis/Frame;

    move-result-object v9

    aput-object v9, v7, v8

    .line 142
    invoke-virtual {v3}, Ljavassist/bytecode/CodeIterator;->next()I

    move-result v7

    invoke-virtual {v6, v7}, Ljavassist/bytecode/analysis/IntQueue;->add(I)V

    .line 143
    :goto_51
    invoke-virtual {v6}, Ljavassist/bytecode/analysis/IntQueue;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_5b

    .line 144
    invoke-direct {p0, p2, v3, v6, v2}, Ljavassist/bytecode/analysis/Analyzer;->analyzeNextEntry(Ljavassist/bytecode/MethodInfo;Ljavassist/bytecode/CodeIterator;Ljavassist/bytecode/analysis/IntQueue;Ljavassist/bytecode/analysis/Executor;)V

    goto :goto_51

    .line 147
    :cond_5b
    iget-object v7, p0, Ljavassist/bytecode/analysis/Analyzer;->frames:[Ljavassist/bytecode/analysis/Frame;

    goto :goto_9
.end method

.method public analyze(Ljavassist/CtMethod;)[Ljavassist/bytecode/analysis/Frame;
    .registers 4
    .param p1, "method"    # Ljavassist/CtMethod;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 165
    invoke-virtual {p1}, Ljavassist/CtMethod;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v0

    invoke-virtual {p1}, Ljavassist/CtMethod;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljavassist/bytecode/analysis/Analyzer;->analyze(Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)[Ljavassist/bytecode/analysis/Frame;

    move-result-object v0

    return-object v0
.end method
