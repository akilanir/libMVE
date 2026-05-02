.class public final Ljavassist/bytecode/ClassFileWriter$MethodWriter;
.super Ljava/lang/Object;
.source "ClassFileWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/ClassFileWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MethodWriter"
.end annotation


# instance fields
.field private catchCount:I

.field private catchPos:I

.field protected codeIndex:I

.field protected constPool:Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;

.field private isAbstract:Z

.field private methodCount:I

.field protected output:Ljavassist/bytecode/ByteStream;

.field protected stackIndex:I

.field private startPos:I

.field protected throwsIndex:I


# direct methods
.method constructor <init>(Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;)V
    .registers 5
    .param p1, "cp"    # Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;

    .prologue
    const/4 v2, 0x0

    .line 325
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 326
    new-instance v0, Ljavassist/bytecode/ByteStream;

    const/16 v1, 0x100

    invoke-direct {v0, v1}, Ljavassist/bytecode/ByteStream;-><init>(I)V

    iput-object v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    .line 327
    iput-object p1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->constPool:Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;

    .line 328
    iput v2, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->methodCount:I

    .line 329
    iput v2, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->codeIndex:I

    .line 330
    iput v2, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->throwsIndex:I

    .line 331
    iput v2, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->stackIndex:I

    .line 332
    return-void
.end method

.method private writeThrows([I)V
    .registers 5
    .param p1, "exceptions"    # [I

    .prologue
    .line 398
    iget v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->throwsIndex:I

    if-nez v1, :cond_e

    .line 399
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->constPool:Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;

    const-string v2, "Exceptions"

    invoke-virtual {v1, v2}, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->addUtf8Info(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->throwsIndex:I

    .line 401
    :cond_e
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    iget v2, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->throwsIndex:I

    invoke-virtual {v1, v2}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 402
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    array-length v2, p1

    mul-int/lit8 v2, v2, 0x2

    add-int/lit8 v2, v2, 0x2

    invoke-virtual {v1, v2}, Ljavassist/bytecode/ByteStream;->writeInt(I)V

    .line 403
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 404
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_26
    array-length v1, p1

    if-ge v0, v1, :cond_33

    .line 405
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    aget v2, p1, v0

    invoke-virtual {v1, v2}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 404
    add-int/lit8 v0, v0, 0x1

    goto :goto_26

    .line 406
    :cond_33
    return-void
.end method


# virtual methods
.method public add(I)V
    .registers 3
    .param p1, "b"    # I

    .prologue
    .line 414
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ByteStream;->write(I)V

    .line 415
    return-void
.end method

.method public add16(I)V
    .registers 3
    .param p1, "b"    # I

    .prologue
    .line 421
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 422
    return-void
.end method

.method public add32(I)V
    .registers 3
    .param p1, "b"    # I

    .prologue
    .line 428
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ByteStream;->writeInt(I)V

    .line 429
    return-void
.end method

.method public addCatch(IIII)V
    .registers 6
    .param p1, "startPc"    # I
    .param p2, "endPc"    # I
    .param p3, "handlerPc"    # I
    .param p4, "catchType"    # I

    .prologue
    .line 467
    iget v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->catchCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->catchCount:I

    .line 468
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 469
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p2}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 470
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p3}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 471
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p4}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 472
    return-void
.end method

.method public addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "opcode"    # I
    .param p2, "targetClass"    # Ljava/lang/String;
    .param p3, "methodName"    # Ljava/lang/String;
    .param p4, "descriptor"    # Ljava/lang/String;

    .prologue
    .line 438
    iget-object v3, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->constPool:Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;

    invoke-virtual {v3, p2}, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->addClassInfo(Ljava/lang/String;)I

    move-result v2

    .line 439
    .local v2, "target":I
    iget-object v3, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->constPool:Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;

    invoke-virtual {v3, p3, p4}, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->addNameAndTypeInfo(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 440
    .local v1, "nt":I
    iget-object v3, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->constPool:Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;

    invoke-virtual {v3, v2, v1}, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->addMethodrefInfo(II)I

    move-result v0

    .line 441
    .local v0, "method":I
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->add(I)V

    .line 442
    invoke-virtual {p0, v0}, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->add16(I)V

    .line 443
    return-void
.end method

.method public begin(III[ILjavassist/bytecode/ClassFileWriter$AttributeWriter;)V
    .registers 10
    .param p1, "accessFlags"    # I
    .param p2, "name"    # I
    .param p3, "descriptor"    # I
    .param p4, "exceptions"    # [I
    .param p5, "aw"    # Ljavassist/bytecode/ClassFileWriter$AttributeWriter;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 369
    iget v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->methodCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->methodCount:I

    .line 370
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 371
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v1, p2}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 372
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v1, p3}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 373
    and-int/lit16 v1, p1, 0x400

    if-eqz v1, :cond_5f

    move v1, v2

    :goto_1c
    iput-boolean v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->isAbstract:Z

    .line 375
    iget-boolean v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->isAbstract:Z

    if-eqz v1, :cond_61

    move v0, v3

    .line 376
    .local v0, "attrCount":I
    :goto_23
    if-eqz p4, :cond_27

    .line 377
    add-int/lit8 v0, v0, 0x1

    .line 379
    :cond_27
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-static {v1, p5, v0}, Ljavassist/bytecode/ClassFileWriter;->writeAttribute(Ljavassist/bytecode/ByteStream;Ljavassist/bytecode/ClassFileWriter$AttributeWriter;I)V

    .line 381
    if-eqz p4, :cond_31

    .line 382
    invoke-direct {p0, p4}, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->writeThrows([I)V

    .line 384
    :cond_31
    iget-boolean v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->isAbstract:Z

    if-nez v1, :cond_59

    .line 385
    iget v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->codeIndex:I

    if-nez v1, :cond_43

    .line 386
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->constPool:Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;

    const-string v2, "Code"

    invoke-virtual {v1, v2}, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->addUtf8Info(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->codeIndex:I

    .line 388
    :cond_43
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v1}, Ljavassist/bytecode/ByteStream;->getPos()I

    move-result v1

    iput v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->startPos:I

    .line 389
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    iget v2, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->codeIndex:I

    invoke-virtual {v1, v2}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 390
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    const/16 v2, 0xc

    invoke-virtual {v1, v2}, Ljavassist/bytecode/ByteStream;->writeBlank(I)V

    .line 393
    :cond_59
    const/4 v1, -0x1

    iput v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->catchPos:I

    .line 394
    iput v3, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->catchCount:I

    .line 395
    return-void

    .end local v0    # "attrCount":I
    :cond_5f
    move v1, v3

    .line 373
    goto :goto_1c

    :cond_61
    move v0, v2

    .line 375
    goto :goto_23
.end method

.method public begin(ILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljavassist/bytecode/ClassFileWriter$AttributeWriter;)V
    .registers 12
    .param p1, "accessFlags"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "descriptor"    # Ljava/lang/String;
    .param p4, "exceptions"    # [Ljava/lang/String;
    .param p5, "aw"    # Ljavassist/bytecode/ClassFileWriter$AttributeWriter;

    .prologue
    .line 347
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->constPool:Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;

    invoke-virtual {v0, p2}, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->addUtf8Info(Ljava/lang/String;)I

    move-result v2

    .line 348
    .local v2, "nameIndex":I
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->constPool:Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;

    invoke-virtual {v0, p3}, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->addUtf8Info(Ljava/lang/String;)I

    move-result v3

    .line 350
    .local v3, "descIndex":I
    if-nez p4, :cond_16

    .line 351
    const/4 v4, 0x0

    .local v4, "intfs":[I
    :goto_f
    move-object v0, p0

    move v1, p1

    move-object v5, p5

    .line 355
    invoke-virtual/range {v0 .. v5}, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->begin(III[ILjavassist/bytecode/ClassFileWriter$AttributeWriter;)V

    .line 356
    return-void

    .line 353
    .end local v4    # "intfs":[I
    :cond_16
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->constPool:Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;

    invoke-virtual {v0, p4}, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->addClassInfo([Ljava/lang/String;)[I

    move-result-object v4

    .restart local v4    # "intfs":[I
    goto :goto_f
.end method

.method public codeEnd(II)V
    .registers 8
    .param p1, "maxStack"    # I
    .param p2, "maxLocals"    # I

    .prologue
    const/4 v4, 0x0

    .line 449
    iget-boolean v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->isAbstract:Z

    if-nez v0, :cond_3a

    .line 450
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    iget v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->startPos:I

    add-int/lit8 v1, v1, 0x6

    invoke-virtual {v0, v1, p1}, Ljavassist/bytecode/ByteStream;->writeShort(II)V

    .line 451
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    iget v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->startPos:I

    add-int/lit8 v1, v1, 0x8

    invoke-virtual {v0, v1, p2}, Ljavassist/bytecode/ByteStream;->writeShort(II)V

    .line 452
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    iget v1, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->startPos:I

    add-int/lit8 v1, v1, 0xa

    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v2}, Ljavassist/bytecode/ByteStream;->getPos()I

    move-result v2

    iget v3, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->startPos:I

    sub-int/2addr v2, v3

    add-int/lit8 v2, v2, -0xe

    invoke-virtual {v0, v1, v2}, Ljavassist/bytecode/ByteStream;->writeInt(II)V

    .line 453
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0}, Ljavassist/bytecode/ByteStream;->getPos()I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->catchPos:I

    .line 454
    iput v4, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->catchCount:I

    .line 455
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, v4}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 457
    :cond_3a
    return-void
.end method

.method dataSize()I
    .registers 2

    .prologue
    .line 508
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0}, Ljavassist/bytecode/ByteStream;->size()I

    move-result v0

    return v0
.end method

.method public end(Ljavassist/bytecode/StackMapTable$Writer;Ljavassist/bytecode/ClassFileWriter$AttributeWriter;)V
    .registers 9
    .param p1, "smap"    # Ljavassist/bytecode/StackMapTable$Writer;
    .param p2, "aw"    # Ljavassist/bytecode/ClassFileWriter$AttributeWriter;

    .prologue
    .line 483
    iget-boolean v2, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->isAbstract:Z

    if-eqz v2, :cond_5

    .line 504
    :goto_4
    return-void

    .line 487
    :cond_5
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    iget v3, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->catchPos:I

    iget v4, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->catchCount:I

    invoke-virtual {v2, v3, v4}, Ljavassist/bytecode/ByteStream;->writeShort(II)V

    .line 489
    if-nez p1, :cond_51

    const/4 v0, 0x0

    .line 490
    .local v0, "attrCount":I
    :goto_11
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-static {v2, p2, v0}, Ljavassist/bytecode/ClassFileWriter;->writeAttribute(Ljavassist/bytecode/ByteStream;Ljavassist/bytecode/ClassFileWriter$AttributeWriter;I)V

    .line 492
    if-eqz p1, :cond_3c

    .line 493
    iget v2, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->stackIndex:I

    if-nez v2, :cond_26

    .line 494
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->constPool:Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;

    const-string v3, "StackMapTable"

    invoke-virtual {v2, v3}, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->addUtf8Info(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->stackIndex:I

    .line 496
    :cond_26
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    iget v3, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->stackIndex:I

    invoke-virtual {v2, v3}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 497
    invoke-virtual {p1}, Ljavassist/bytecode/StackMapTable$Writer;->toByteArray()[B

    move-result-object v1

    .line 498
    .local v1, "data":[B
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    array-length v3, v1

    invoke-virtual {v2, v3}, Ljavassist/bytecode/ByteStream;->writeInt(I)V

    .line 499
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v2, v1}, Ljavassist/bytecode/ByteStream;->write([B)V

    .line 503
    .end local v1    # "data":[B
    :cond_3c
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    iget v3, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->startPos:I

    add-int/lit8 v3, v3, 0x2

    iget-object v4, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v4}, Ljavassist/bytecode/ByteStream;->getPos()I

    move-result v4

    iget v5, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->startPos:I

    sub-int/2addr v4, v5

    add-int/lit8 v4, v4, -0x6

    invoke-virtual {v2, v3, v4}, Ljavassist/bytecode/ByteStream;->writeInt(II)V

    goto :goto_4

    .line 489
    .end local v0    # "attrCount":I
    :cond_51
    const/4 v0, 0x1

    goto :goto_11
.end method

.method size()I
    .registers 2

    .prologue
    .line 506
    iget v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->methodCount:I

    return v0
.end method

.method write(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 514
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ByteStream;->writeTo(Ljava/io/OutputStream;)V

    .line 515
    return-void
.end method
