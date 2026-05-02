.class public abstract Ljavassist/expr/Expr;
.super Ljava/lang/Object;
.source "Expr.java"

# interfaces
.implements Ljavassist/bytecode/Opcode;


# static fields
.field static final javaLangObject:Ljava/lang/String; = "java.lang.Object"


# instance fields
.field currentPos:I

.field edited:Z

.field iterator:Ljavassist/bytecode/CodeIterator;

.field maxLocals:I

.field maxStack:I

.field thisClass:Ljavassist/CtClass;

.field thisMethod:Ljavassist/bytecode/MethodInfo;


# direct methods
.method protected constructor <init>(ILjavassist/bytecode/CodeIterator;Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)V
    .registers 5
    .param p1, "pos"    # I
    .param p2, "i"    # Ljavassist/bytecode/CodeIterator;
    .param p3, "declaring"    # Ljavassist/CtClass;
    .param p4, "m"    # Ljavassist/bytecode/MethodInfo;

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput p1, p0, Ljavassist/expr/Expr;->currentPos:I

    .line 60
    iput-object p2, p0, Ljavassist/expr/Expr;->iterator:Ljavassist/bytecode/CodeIterator;

    .line 61
    iput-object p3, p0, Ljavassist/expr/Expr;->thisClass:Ljavassist/CtClass;

    .line 62
    iput-object p4, p0, Ljavassist/expr/Expr;->thisMethod:Ljavassist/bytecode/MethodInfo;

    .line 63
    return-void
.end method

.method private static addClass(Ljava/util/LinkedList;Ljavassist/CtClass;)V
    .registers 4
    .param p0, "list"    # Ljava/util/LinkedList;
    .param p1, "c"    # Ljavassist/CtClass;

    .prologue
    .line 173
    invoke-virtual {p0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 174
    .local v0, "it":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 175
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p1, :cond_4

    .line 179
    :goto_10
    return-void

    .line 178
    :cond_11
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_10
.end method

.method static final checkResultValue(Ljavassist/CtClass;Ljava/lang/String;)Z
    .registers 5
    .param p0, "retType"    # Ljavassist/CtClass;
    .param p1, "prog"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 217
    const-string v1, "$_"

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-ltz v1, :cond_17

    const/4 v0, 0x1

    .line 218
    .local v0, "hasIt":Z
    :goto_9
    if-nez v0, :cond_19

    sget-object v1, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    if-eq p0, v1, :cond_19

    .line 219
    new-instance v1, Ljavassist/CannotCompileException;

    const-string v2, "the resulting value is not stored in $_"

    invoke-direct {v1, v2}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 217
    .end local v0    # "hasIt":Z
    :cond_17
    const/4 v0, 0x0

    goto :goto_9

    .line 223
    .restart local v0    # "hasIt":Z
    :cond_19
    return v0
.end method

.method static final storeStack([Ljavassist/CtClass;ZILjavassist/bytecode/Bytecode;)V
    .registers 7
    .param p0, "params"    # [Ljavassist/CtClass;
    .param p1, "isStaticCall"    # Z
    .param p2, "regno"    # I
    .param p3, "bytecode"    # Ljavassist/bytecode/Bytecode;

    .prologue
    .line 235
    const/4 v0, 0x0

    array-length v1, p0

    add-int/lit8 v2, p2, 0x1

    invoke-static {v0, v1, p0, v2, p3}, Ljavassist/expr/Expr;->storeStack0(II[Ljavassist/CtClass;ILjavassist/bytecode/Bytecode;)V

    .line 236
    if-eqz p1, :cond_d

    .line 237
    const/4 v0, 0x1

    invoke-virtual {p3, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 239
    :cond_d
    invoke-virtual {p3, p2}, Ljavassist/bytecode/Bytecode;->addAstore(I)V

    .line 240
    return-void
.end method

.method private static storeStack0(II[Ljavassist/CtClass;ILjavassist/bytecode/Bytecode;)V
    .registers 9
    .param p0, "i"    # I
    .param p1, "n"    # I
    .param p2, "params"    # [Ljavassist/CtClass;
    .param p3, "regno"    # I
    .param p4, "bytecode"    # Ljavassist/bytecode/Bytecode;

    .prologue
    .line 244
    if-lt p0, p1, :cond_3

    .line 257
    :goto_2
    return-void

    .line 247
    :cond_3
    aget-object v0, p2, p0

    .line 249
    .local v0, "c":Ljavassist/CtClass;
    instance-of v2, v0, Ljavassist/CtPrimitiveType;

    if-eqz v2, :cond_1b

    move-object v2, v0

    .line 250
    check-cast v2, Ljavassist/CtPrimitiveType;

    invoke-virtual {v2}, Ljavassist/CtPrimitiveType;->getDataSize()I

    move-result v1

    .line 254
    .local v1, "size":I
    :goto_10
    add-int/lit8 v2, p0, 0x1

    add-int v3, p3, v1

    invoke-static {v2, p1, p2, v3, p4}, Ljavassist/expr/Expr;->storeStack0(II[Ljavassist/CtClass;ILjavassist/bytecode/Bytecode;)V

    .line 255
    invoke-virtual {p4, p3, v0}, Ljavassist/bytecode/Bytecode;->addStore(ILjavassist/CtClass;)I

    goto :goto_2

    .line 252
    .end local v1    # "size":I
    :cond_1b
    const/4 v1, 0x1

    .restart local v1    # "size":I
    goto :goto_10
.end method


# virtual methods
.method protected final edited()Z
    .registers 2

    .prologue
    .line 78
    iget-boolean v0, p0, Ljavassist/expr/Expr;->edited:Z

    return v0
.end method

.method protected final getConstPool()Ljavassist/bytecode/ConstPool;
    .registers 2

    .prologue
    .line 74
    iget-object v0, p0, Ljavassist/expr/Expr;->thisMethod:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v0}, Ljavassist/bytecode/MethodInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    return-object v0
.end method

.method public getEnclosingClass()Ljavassist/CtClass;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Ljavassist/expr/Expr;->thisClass:Ljavassist/CtClass;

    return-object v0
.end method

.method public getFileName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 205
    iget-object v1, p0, Ljavassist/expr/Expr;->thisClass:Ljavassist/CtClass;

    invoke-virtual {v1}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v0

    .line 206
    .local v0, "cf":Ljavassist/bytecode/ClassFile;
    if-nez v0, :cond_a

    .line 207
    const/4 v1, 0x0

    .line 209
    :goto_9
    return-object v1

    :cond_a
    invoke-virtual {v0}, Ljavassist/bytecode/ClassFile;->getSourceFile()Ljava/lang/String;

    move-result-object v1

    goto :goto_9
.end method

.method public getLineNumber()I
    .registers 3

    .prologue
    .line 196
    iget-object v0, p0, Ljavassist/expr/Expr;->thisMethod:Ljavassist/bytecode/MethodInfo;

    iget v1, p0, Ljavassist/expr/Expr;->currentPos:I

    invoke-virtual {v0, v1}, Ljavassist/bytecode/MethodInfo;->getLineNumber(I)I

    move-result v0

    return v0
.end method

.method public indexOfBytecode()I
    .registers 2

    .prologue
    .line 187
    iget v0, p0, Ljavassist/expr/Expr;->currentPos:I

    return v0
.end method

.method protected final locals()I
    .registers 2

    .prologue
    .line 82
    iget v0, p0, Ljavassist/expr/Expr;->maxLocals:I

    return v0
.end method

.method public mayThrow()[Ljavassist/CtClass;
    .registers 13

    .prologue
    .line 133
    iget-object v11, p0, Ljavassist/expr/Expr;->thisClass:Ljavassist/CtClass;

    invoke-virtual {v11}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v8

    .line 134
    .local v8, "pool":Ljavassist/ClassPool;
    iget-object v11, p0, Ljavassist/expr/Expr;->thisMethod:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v11}, Ljavassist/bytecode/MethodInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v1

    .line 135
    .local v1, "cp":Ljavassist/bytecode/ConstPool;
    new-instance v6, Ljava/util/LinkedList;

    invoke-direct {v6}, Ljava/util/LinkedList;-><init>()V

    .line 137
    .local v6, "list":Ljava/util/LinkedList;
    :try_start_11
    iget-object v11, p0, Ljavassist/expr/Expr;->thisMethod:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v11}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v0

    .line 138
    .local v0, "ca":Ljavassist/bytecode/CodeAttribute;
    invoke-virtual {v0}, Ljavassist/bytecode/CodeAttribute;->getExceptionTable()Ljavassist/bytecode/ExceptionTable;

    move-result-object v3

    .line 139
    .local v3, "et":Ljavassist/bytecode/ExceptionTable;
    iget v9, p0, Ljavassist/expr/Expr;->currentPos:I

    .line 140
    .local v9, "pos":I
    invoke-virtual {v3}, Ljavassist/bytecode/ExceptionTable;->size()I

    move-result v7

    .line 141
    .local v7, "n":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_22
    if-ge v5, v7, :cond_45

    .line 142
    invoke-virtual {v3, v5}, Ljavassist/bytecode/ExceptionTable;->startPc(I)I

    move-result v11

    if-gt v11, v9, :cond_41

    invoke-virtual {v3, v5}, Ljavassist/bytecode/ExceptionTable;->endPc(I)I

    move-result v11

    if-ge v9, v11, :cond_41

    .line 143
    invoke-virtual {v3, v5}, Ljavassist/bytecode/ExceptionTable;->catchType(I)I
    :try_end_33
    .catch Ljava/lang/NullPointerException; {:try_start_11 .. :try_end_33} :catch_44

    move-result v10

    .line 144
    .local v10, "t":I
    if-lez v10, :cond_41

    .line 146
    :try_start_36
    invoke-virtual {v1, v10}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v11

    invoke-static {v6, v11}, Ljavassist/expr/Expr;->addClass(Ljava/util/LinkedList;Ljavassist/CtClass;)V
    :try_end_41
    .catch Ljavassist/NotFoundException; {:try_start_36 .. :try_end_41} :catch_74
    .catch Ljava/lang/NullPointerException; {:try_start_36 .. :try_end_41} :catch_44

    .line 141
    .end local v10    # "t":I
    :cond_41
    :goto_41
    add-int/lit8 v5, v5, 0x1

    goto :goto_22

    .line 152
    .end local v0    # "ca":Ljavassist/bytecode/CodeAttribute;
    .end local v3    # "et":Ljavassist/bytecode/ExceptionTable;
    .end local v5    # "i":I
    .end local v7    # "n":I
    .end local v9    # "pos":I
    :catch_44
    move-exception v11

    .line 155
    :cond_45
    iget-object v11, p0, Ljavassist/expr/Expr;->thisMethod:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v11}, Ljavassist/bytecode/MethodInfo;->getExceptionsAttribute()Ljavassist/bytecode/ExceptionsAttribute;

    move-result-object v2

    .line 156
    .local v2, "ea":Ljavassist/bytecode/ExceptionsAttribute;
    if-eqz v2, :cond_63

    .line 157
    invoke-virtual {v2}, Ljavassist/bytecode/ExceptionsAttribute;->getExceptions()[Ljava/lang/String;

    move-result-object v4

    .line 158
    .local v4, "exceptions":[Ljava/lang/String;
    if-eqz v4, :cond_63

    .line 159
    array-length v7, v4

    .line 160
    .restart local v7    # "n":I
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_55
    if-ge v5, v7, :cond_63

    .line 162
    :try_start_57
    aget-object v11, v4, v5

    invoke-virtual {v8, v11}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v11

    invoke-static {v6, v11}, Ljavassist/expr/Expr;->addClass(Ljava/util/LinkedList;Ljavassist/CtClass;)V
    :try_end_60
    .catch Ljavassist/NotFoundException; {:try_start_57 .. :try_end_60} :catch_72

    .line 160
    :goto_60
    add-int/lit8 v5, v5, 0x1

    goto :goto_55

    .line 169
    .end local v4    # "exceptions":[Ljava/lang/String;
    .end local v5    # "i":I
    .end local v7    # "n":I
    :cond_63
    invoke-virtual {v6}, Ljava/util/LinkedList;->size()I

    move-result v11

    new-array v11, v11, [Ljavassist/CtClass;

    invoke-virtual {v6, v11}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [Ljavassist/CtClass;

    check-cast v11, [Ljavassist/CtClass;

    return-object v11

    .line 164
    .restart local v4    # "exceptions":[Ljava/lang/String;
    .restart local v5    # "i":I
    .restart local v7    # "n":I
    :catch_72
    move-exception v11

    goto :goto_60

    .line 148
    .end local v2    # "ea":Ljavassist/bytecode/ExceptionsAttribute;
    .end local v4    # "exceptions":[Ljava/lang/String;
    .restart local v0    # "ca":Ljavassist/bytecode/CodeAttribute;
    .restart local v3    # "et":Ljavassist/bytecode/ExceptionTable;
    .restart local v9    # "pos":I
    .restart local v10    # "t":I
    :catch_74
    move-exception v11

    goto :goto_41
.end method

.method public abstract replace(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation
.end method

.method public replace(Ljava/lang/String;Ljavassist/expr/ExprEditor;)V
    .registers 4
    .param p1, "statement"    # Ljava/lang/String;
    .param p2, "recursive"    # Ljavassist/expr/ExprEditor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 285
    invoke-virtual {p0, p1}, Ljavassist/expr/Expr;->replace(Ljava/lang/String;)V

    .line 286
    if-eqz p2, :cond_a

    .line 287
    iget-object v0, p0, Ljavassist/expr/Expr;->iterator:Ljavassist/bytecode/CodeIterator;

    invoke-virtual {p0, p2, v0}, Ljavassist/expr/Expr;->runEditor(Ljavassist/expr/ExprEditor;Ljavassist/bytecode/CodeIterator;)V

    .line 288
    :cond_a
    return-void
.end method

.method protected replace0(ILjavassist/bytecode/Bytecode;I)V
    .registers 10
    .param p1, "pos"    # I
    .param p2, "bytecode"    # Ljavassist/bytecode/Bytecode;
    .param p3, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 292
    invoke-virtual {p2}, Ljavassist/bytecode/Bytecode;->get()[B

    move-result-object v0

    .line 293
    .local v0, "code":[B
    const/4 v3, 0x1

    iput-boolean v3, p0, Ljavassist/expr/Expr;->edited:Z

    .line 294
    array-length v3, v0

    sub-int v1, v3, p3

    .line 295
    .local v1, "gap":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_c
    if-ge v2, p3, :cond_18

    .line 296
    iget-object v3, p0, Ljavassist/expr/Expr;->iterator:Ljavassist/bytecode/CodeIterator;

    add-int v4, p1, v2

    invoke-virtual {v3, v5, v4}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 295
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 298
    :cond_18
    if-lez v1, :cond_22

    .line 299
    iget-object v3, p0, Ljavassist/expr/Expr;->iterator:Ljavassist/bytecode/CodeIterator;

    invoke-virtual {v3, p1, v1, v5}, Ljavassist/bytecode/CodeIterator;->insertGapAt(IIZ)Ljavassist/bytecode/CodeIterator$Gap;

    move-result-object v3

    iget p1, v3, Ljavassist/bytecode/CodeIterator$Gap;->position:I

    .line 301
    :cond_22
    iget-object v3, p0, Ljavassist/expr/Expr;->iterator:Ljavassist/bytecode/CodeIterator;

    invoke-virtual {v3, v0, p1}, Ljavassist/bytecode/CodeIterator;->write([BI)V

    .line 302
    iget-object v3, p0, Ljavassist/expr/Expr;->iterator:Ljavassist/bytecode/CodeIterator;

    invoke-virtual {p2}, Ljavassist/bytecode/Bytecode;->getExceptionTable()Ljavassist/bytecode/ExceptionTable;

    move-result-object v4

    invoke-virtual {v3, v4, p1}, Ljavassist/bytecode/CodeIterator;->insert(Ljavassist/bytecode/ExceptionTable;I)V

    .line 303
    invoke-virtual {p2}, Ljavassist/bytecode/Bytecode;->getMaxLocals()I

    move-result v3

    iput v3, p0, Ljavassist/expr/Expr;->maxLocals:I

    .line 304
    invoke-virtual {p2}, Ljavassist/bytecode/Bytecode;->getMaxStack()I

    move-result v3

    iput v3, p0, Ljavassist/expr/Expr;->maxStack:I

    .line 305
    return-void
.end method

.method protected runEditor(Ljavassist/expr/ExprEditor;Ljavassist/bytecode/CodeIterator;)V
    .registers 14
    .param p1, "ed"    # Ljavassist/expr/ExprEditor;
    .param p2, "oldIterator"    # Ljavassist/bytecode/CodeIterator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 310
    invoke-virtual {p2}, Ljavassist/bytecode/CodeIterator;->get()Ljavassist/bytecode/CodeAttribute;

    move-result-object v6

    .line 311
    .local v6, "codeAttr":Ljavassist/bytecode/CodeAttribute;
    invoke-virtual {v6}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v8

    .line 312
    .local v8, "orgLocals":I
    invoke-virtual {v6}, Ljavassist/bytecode/CodeAttribute;->getMaxStack()I

    move-result v9

    .line 313
    .local v9, "orgStack":I
    invoke-virtual {p0}, Ljavassist/expr/Expr;->locals()I

    move-result v7

    .line 314
    .local v7, "newLocals":I
    invoke-virtual {p0}, Ljavassist/expr/Expr;->stack()I

    move-result v0

    invoke-virtual {v6, v0}, Ljavassist/bytecode/CodeAttribute;->setMaxStack(I)V

    .line 315
    invoke-virtual {v6, v7}, Ljavassist/bytecode/CodeAttribute;->setMaxLocals(I)V

    .line 316
    new-instance v3, Ljavassist/expr/ExprEditor$LoopContext;

    invoke-direct {v3, v7}, Ljavassist/expr/ExprEditor$LoopContext;-><init>(I)V

    .line 318
    .local v3, "context":Ljavassist/expr/ExprEditor$LoopContext;
    invoke-virtual {p2}, Ljavassist/bytecode/CodeIterator;->getCodeLength()I

    move-result v10

    .line 319
    .local v10, "size":I
    invoke-virtual {p2}, Ljavassist/bytecode/CodeIterator;->lookAhead()I

    move-result v5

    .line 320
    .local v5, "endPos":I
    iget v0, p0, Ljavassist/expr/Expr;->currentPos:I

    invoke-virtual {p2, v0}, Ljavassist/bytecode/CodeIterator;->move(I)V

    .line 321
    iget-object v1, p0, Ljavassist/expr/Expr;->thisClass:Ljavassist/CtClass;

    iget-object v2, p0, Ljavassist/expr/Expr;->thisMethod:Ljavassist/bytecode/MethodInfo;

    move-object v0, p1

    move-object v4, p2

    invoke-virtual/range {v0 .. v5}, Ljavassist/expr/ExprEditor;->doit(Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;Ljavassist/expr/ExprEditor$LoopContext;Ljavassist/bytecode/CodeIterator;I)Z

    move-result v0

    if-eqz v0, :cond_3b

    .line 322
    const/4 v0, 0x1

    iput-boolean v0, p0, Ljavassist/expr/Expr;->edited:Z

    .line 324
    :cond_3b
    invoke-virtual {p2}, Ljavassist/bytecode/CodeIterator;->getCodeLength()I

    move-result v0

    add-int/2addr v0, v5

    sub-int/2addr v0, v10

    invoke-virtual {p2, v0}, Ljavassist/bytecode/CodeIterator;->move(I)V

    .line 325
    invoke-virtual {v6, v8}, Ljavassist/bytecode/CodeAttribute;->setMaxLocals(I)V

    .line 326
    invoke-virtual {v6, v9}, Ljavassist/bytecode/CodeAttribute;->setMaxStack(I)V

    .line 327
    iget v0, v3, Ljavassist/expr/ExprEditor$LoopContext;->maxLocals:I

    iput v0, p0, Ljavassist/expr/Expr;->maxLocals:I

    .line 328
    iget v0, p0, Ljavassist/expr/Expr;->maxStack:I

    iget v1, v3, Ljavassist/expr/ExprEditor$LoopContext;->maxStack:I

    add-int/2addr v0, v1

    iput v0, p0, Ljavassist/expr/Expr;->maxStack:I

    .line 329
    return-void
.end method

.method protected final stack()I
    .registers 2

    .prologue
    .line 86
    iget v0, p0, Ljavassist/expr/Expr;->maxStack:I

    return v0
.end method

.method public where()Ljavassist/CtBehavior;
    .registers 7

    .prologue
    .line 100
    iget-object v3, p0, Ljavassist/expr/Expr;->thisMethod:Ljavassist/bytecode/MethodInfo;

    .line 101
    .local v3, "mi":Ljavassist/bytecode/MethodInfo;
    iget-object v4, p0, Ljavassist/expr/Expr;->thisClass:Ljavassist/CtClass;

    invoke-virtual {v4}, Ljavassist/CtClass;->getDeclaredBehaviors()[Ljavassist/CtBehavior;

    move-result-object v0

    .line 102
    .local v0, "cb":[Ljavassist/CtBehavior;
    array-length v4, v0

    add-int/lit8 v1, v4, -0x1

    .local v1, "i":I
    :goto_b
    if-ltz v1, :cond_1b

    .line 103
    aget-object v4, v0, v1

    invoke-virtual {v4}, Ljavassist/CtBehavior;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v4

    if-ne v4, v3, :cond_18

    .line 104
    aget-object v2, v0, v1

    .line 119
    :cond_17
    :goto_17
    return-object v2

    .line 102
    :cond_18
    add-int/lit8 v1, v1, -0x1

    goto :goto_b

    .line 106
    :cond_1b
    iget-object v4, p0, Ljavassist/expr/Expr;->thisClass:Ljavassist/CtClass;

    invoke-virtual {v4}, Ljavassist/CtClass;->getClassInitializer()Ljavassist/CtConstructor;

    move-result-object v2

    .line 107
    .local v2, "init":Ljavassist/CtConstructor;
    if-eqz v2, :cond_29

    invoke-virtual {v2}, Ljavassist/CtConstructor;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v4

    if-eq v4, v3, :cond_17

    .line 115
    :cond_29
    array-length v4, v0

    add-int/lit8 v1, v4, -0x1

    :goto_2c
    if-ltz v1, :cond_60

    .line 116
    iget-object v4, p0, Ljavassist/expr/Expr;->thisMethod:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v4}, Ljavassist/bytecode/MethodInfo;->getName()Ljava/lang/String;

    move-result-object v4

    aget-object v5, v0, v1

    invoke-virtual {v5}, Ljavassist/CtBehavior;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v5

    invoke-virtual {v5}, Ljavassist/bytecode/MethodInfo;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5d

    iget-object v4, p0, Ljavassist/expr/Expr;->thisMethod:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v4}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v4

    aget-object v5, v0, v1

    invoke-virtual {v5}, Ljavassist/CtBehavior;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v5

    invoke-virtual {v5}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5d

    .line 119
    aget-object v2, v0, v1

    goto :goto_17

    .line 115
    :cond_5d
    add-int/lit8 v1, v1, -0x1

    goto :goto_2c

    .line 123
    :cond_60
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "fatal: not found"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method protected final withinStatic()Z
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Ljavassist/expr/Expr;->thisMethod:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v0}, Ljavassist/bytecode/MethodInfo;->getAccessFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method
