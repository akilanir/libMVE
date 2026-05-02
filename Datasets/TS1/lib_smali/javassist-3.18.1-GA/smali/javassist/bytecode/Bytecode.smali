.class public Ljavassist/bytecode/Bytecode;
.super Ljavassist/bytecode/ByteVector;
.source "Bytecode.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljavassist/bytecode/Opcode;


# static fields
.field public static final THIS:Ljavassist/CtClass;


# instance fields
.field constPool:Ljavassist/bytecode/ConstPool;

.field maxLocals:I

.field maxStack:I

.field private stackDepth:I

.field tryblocks:Ljavassist/bytecode/ExceptionTable;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 119
    sget-object v0, Ljavassist/bytecode/ConstPool;->THIS:Ljavassist/CtClass;

    sput-object v0, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;)V
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    const/4 v0, 0x0

    .line 157
    invoke-direct {p0, p1, v0, v0}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;II)V

    .line 158
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;II)V
    .registers 5
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "stacksize"    # I
    .param p3, "localvars"    # I

    .prologue
    .line 139
    invoke-direct {p0}, Ljavassist/bytecode/ByteVector;-><init>()V

    .line 140
    iput-object p1, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    .line 141
    iput p2, p0, Ljavassist/bytecode/Bytecode;->maxStack:I

    .line 142
    iput p3, p0, Ljavassist/bytecode/Bytecode;->maxLocals:I

    .line 143
    new-instance v0, Ljavassist/bytecode/ExceptionTable;

    invoke-direct {v0, p1}, Ljavassist/bytecode/ExceptionTable;-><init>(Ljavassist/bytecode/ConstPool;)V

    iput-object v0, p0, Ljavassist/bytecode/Bytecode;->tryblocks:Ljavassist/bytecode/ExceptionTable;

    .line 144
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/bytecode/Bytecode;->stackDepth:I

    .line 145
    return-void
.end method

.method private addPutfield0(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "target"    # Ljavassist/CtClass;
    .param p2, "classname"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "desc"    # Ljava/lang/String;

    .prologue
    .line 1344
    const/16 v1, 0xb5

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 1346
    if-nez p2, :cond_20

    iget-object v1, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljavassist/CtClass;)I

    move-result v0

    .line 1348
    .local v0, "ci":I
    :goto_d
    iget-object v1, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, v0, p3, p4}, Ljavassist/bytecode/ConstPool;->addFieldrefInfo(ILjava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1349
    invoke-static {p4}, Ljavassist/bytecode/Descriptor;->dataSize(Ljava/lang/String;)I

    move-result v1

    rsub-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->growStack(I)V

    .line 1350
    return-void

    .line 1346
    .end local v0    # "ci":I
    :cond_20
    iget-object v1, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, p2}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    goto :goto_d
.end method

.method private addPutstatic0(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "target"    # Ljavassist/CtClass;
    .param p2, "classname"    # Ljava/lang/String;
    .param p3, "fieldName"    # Ljava/lang/String;
    .param p4, "desc"    # Ljava/lang/String;

    .prologue
    .line 1377
    const/16 v1, 0xb3

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 1379
    if-nez p2, :cond_1f

    iget-object v1, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljavassist/CtClass;)I

    move-result v0

    .line 1381
    .local v0, "ci":I
    :goto_d
    iget-object v1, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, v0, p3, p4}, Ljavassist/bytecode/ConstPool;->addFieldrefInfo(ILjava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1382
    invoke-static {p4}, Ljavassist/bytecode/Descriptor;->dataSize(Ljava/lang/String;)I

    move-result v1

    neg-int v1, v1

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->growStack(I)V

    .line 1383
    return-void

    .line 1379
    .end local v0    # "ci":I
    :cond_1f
    iget-object v1, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, p2}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    goto :goto_d
.end method


# virtual methods
.method public add(I)V
    .registers 2
    .param p1, "code"    # I

    .prologue
    .line 382
    invoke-super {p0, p1}, Ljavassist/bytecode/ByteVector;->add(I)V

    .line 383
    return-void
.end method

.method public bridge synthetic add(II)V
    .registers 3
    .param p1, "x0"    # I
    .param p2, "x1"    # I

    .prologue
    .line 114
    invoke-super {p0, p1, p2}, Ljavassist/bytecode/ByteVector;->add(II)V

    return-void
.end method

.method public bridge synthetic add(IIII)V
    .registers 5
    .param p1, "x0"    # I
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # I

    .prologue
    .line 114
    invoke-super {p0, p1, p2, p3, p4}, Ljavassist/bytecode/ByteVector;->add(IIII)V

    return-void
.end method

.method public add32bit(I)V
    .registers 5
    .param p1, "value"    # I

    .prologue
    .line 389
    shr-int/lit8 v0, p1, 0x18

    shr-int/lit8 v1, p1, 0x10

    shr-int/lit8 v2, p1, 0x8

    invoke-virtual {p0, v0, v1, v2, p1}, Ljavassist/bytecode/Bytecode;->add(IIII)V

    .line 390
    return-void
.end method

.method public addAload(I)V
    .registers 4
    .param p1, "n"    # I

    .prologue
    const/16 v1, 0x19

    .line 460
    const/4 v0, 0x4

    if-ge p1, v0, :cond_b

    .line 461
    add-int/lit8 v0, p1, 0x2a

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 471
    :goto_a
    return-void

    .line 462
    :cond_b
    const/16 v0, 0x100

    if-ge p1, v0, :cond_16

    .line 463
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 464
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->add(I)V

    goto :goto_a

    .line 467
    :cond_16
    const/16 v0, 0xc4

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 468
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 469
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    goto :goto_a
.end method

.method public addAnewarray(Ljava/lang/String;)V
    .registers 3
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 1244
    const/16 v0, 0xbd

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1245
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1246
    return-void
.end method

.method public addAnewarray(Ljavassist/CtClass;I)V
    .registers 4
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "length"    # I

    .prologue
    .line 1255
    invoke-virtual {p0, p2}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 1256
    const/16 v0, 0xbd

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1257
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljavassist/CtClass;)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1258
    return-void
.end method

.method public addAstore(I)V
    .registers 4
    .param p1, "n"    # I

    .prologue
    const/16 v1, 0x3a

    .line 479
    const/4 v0, 0x4

    if-ge p1, v0, :cond_b

    .line 480
    add-int/lit8 v0, p1, 0x4b

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 490
    :goto_a
    return-void

    .line 481
    :cond_b
    const/16 v0, 0x100

    if-ge p1, v0, :cond_16

    .line 482
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 483
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->add(I)V

    goto :goto_a

    .line 486
    :cond_16
    const/16 v0, 0xc4

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 487
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 488
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    goto :goto_a
.end method

.method public addCheckcast(Ljava/lang/String;)V
    .registers 3
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 824
    const/16 v0, 0xc0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 825
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 826
    return-void
.end method

.method public addCheckcast(Ljavassist/CtClass;)V
    .registers 3
    .param p1, "c"    # Ljavassist/CtClass;

    .prologue
    .line 814
    const/16 v0, 0xc0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 815
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljavassist/CtClass;)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 816
    return-void
.end method

.method public addConstZero(Ljavassist/CtClass;)V
    .registers 4
    .param p1, "type"    # Ljavassist/CtClass;

    .prologue
    .line 520
    invoke-virtual {p1}, Ljavassist/CtClass;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_35

    .line 521
    sget-object v0, Ljavassist/CtClass;->longType:Ljavassist/CtClass;

    if-ne p1, v0, :cond_10

    .line 522
    const/16 v0, 0x9

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 534
    :goto_f
    return-void

    .line 523
    :cond_10
    sget-object v0, Ljavassist/CtClass;->floatType:Ljavassist/CtClass;

    if-ne p1, v0, :cond_1a

    .line 524
    const/16 v0, 0xb

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_f

    .line 525
    :cond_1a
    sget-object v0, Ljavassist/CtClass;->doubleType:Ljavassist/CtClass;

    if-ne p1, v0, :cond_24

    .line 526
    const/16 v0, 0xe

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_f

    .line 527
    :cond_24
    sget-object v0, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    if-ne p1, v0, :cond_30

    .line 528
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "void type?"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 530
    :cond_30
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_f

    .line 533
    :cond_35
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_f
.end method

.method public addDconst(D)V
    .registers 5
    .param p1, "d"    # D

    .prologue
    .line 630
    const-wide/16 v0, 0x0

    cmpl-double v0, p1, v0

    if-eqz v0, :cond_c

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    cmpl-double v0, p1, v0

    if-nez v0, :cond_13

    .line 631
    :cond_c
    double-to-int v0, p1

    add-int/lit8 v0, v0, 0xe

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 634
    :goto_12
    return-void

    .line 633
    :cond_13
    invoke-virtual {p0, p1, p2}, Ljavassist/bytecode/Bytecode;->addLdc2w(D)V

    goto :goto_12
.end method

.method public addDload(I)V
    .registers 4
    .param p1, "n"    # I

    .prologue
    const/16 v1, 0x18

    .line 642
    const/4 v0, 0x4

    if-ge p1, v0, :cond_b

    .line 643
    add-int/lit8 v0, p1, 0x26

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 653
    :goto_a
    return-void

    .line 644
    :cond_b
    const/16 v0, 0x100

    if-ge p1, v0, :cond_16

    .line 645
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 646
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->add(I)V

    goto :goto_a

    .line 649
    :cond_16
    const/16 v0, 0xc4

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 650
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 651
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    goto :goto_a
.end method

.method public addDstore(I)V
    .registers 4
    .param p1, "n"    # I

    .prologue
    const/16 v1, 0x39

    .line 661
    const/4 v0, 0x4

    if-ge p1, v0, :cond_b

    .line 662
    add-int/lit8 v0, p1, 0x47

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 672
    :goto_a
    return-void

    .line 663
    :cond_b
    const/16 v0, 0x100

    if-ge p1, v0, :cond_16

    .line 664
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 665
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->add(I)V

    goto :goto_a

    .line 668
    :cond_16
    const/16 v0, 0xc4

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 669
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 670
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    goto :goto_a
.end method

.method public addExceptionHandler(IIII)V
    .registers 6
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "handler"    # I
    .param p4, "type"    # I

    .prologue
    .line 309
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->tryblocks:Ljavassist/bytecode/ExceptionTable;

    invoke-virtual {v0, p1, p2, p3, p4}, Ljavassist/bytecode/ExceptionTable;->add(IIII)V

    .line 310
    return-void
.end method

.method public addExceptionHandler(IIILjava/lang/String;)V
    .registers 6
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "handler"    # I
    .param p4, "type"    # Ljava/lang/String;

    .prologue
    .line 300
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p4}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, p1, p2, p3, v0}, Ljavassist/bytecode/Bytecode;->addExceptionHandler(IIII)V

    .line 302
    return-void
.end method

.method public addExceptionHandler(IIILjavassist/CtClass;)V
    .registers 6
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "handler"    # I
    .param p4, "type"    # Ljavassist/CtClass;

    .prologue
    .line 289
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p4}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljavassist/CtClass;)I

    move-result v0

    invoke-virtual {p0, p1, p2, p3, v0}, Ljavassist/bytecode/Bytecode;->addExceptionHandler(IIII)V

    .line 291
    return-void
.end method

.method public addFconst(F)V
    .registers 3
    .param p1, "f"    # F

    .prologue
    .line 680
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_11

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_11

    const/high16 v0, 0x40000000    # 2.0f

    cmpl-float v0, p1, v0

    if-nez v0, :cond_18

    .line 681
    :cond_11
    float-to-int v0, p1

    add-int/lit8 v0, v0, 0xb

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 684
    :goto_17
    return-void

    .line 683
    :cond_18
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addFloatInfo(F)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addLdc(I)V

    goto :goto_17
.end method

.method public addFload(I)V
    .registers 4
    .param p1, "n"    # I

    .prologue
    const/16 v1, 0x17

    .line 692
    const/4 v0, 0x4

    if-ge p1, v0, :cond_b

    .line 693
    add-int/lit8 v0, p1, 0x22

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 703
    :goto_a
    return-void

    .line 694
    :cond_b
    const/16 v0, 0x100

    if-ge p1, v0, :cond_16

    .line 695
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 696
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->add(I)V

    goto :goto_a

    .line 699
    :cond_16
    const/16 v0, 0xc4

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 700
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 701
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    goto :goto_a
.end method

.method public addFstore(I)V
    .registers 4
    .param p1, "n"    # I

    .prologue
    const/16 v1, 0x38

    .line 711
    const/4 v0, 0x4

    if-ge p1, v0, :cond_b

    .line 712
    add-int/lit8 v0, p1, 0x43

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 722
    :goto_a
    return-void

    .line 713
    :cond_b
    const/16 v0, 0x100

    if-ge p1, v0, :cond_16

    .line 714
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 715
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->add(I)V

    goto :goto_a

    .line 718
    :cond_16
    const/16 v0, 0xc4

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 719
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 720
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    goto :goto_a
.end method

.method public addGap(I)V
    .registers 2
    .param p1, "length"    # I

    .prologue
    .line 398
    invoke-super {p0, p1}, Ljavassist/bytecode/ByteVector;->addGap(I)V

    .line 399
    return-void
.end method

.method public addGetfield(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "c"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "type"    # Ljava/lang/String;

    .prologue
    .line 864
    const/16 v1, 0xb4

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 865
    iget-object v1, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    .line 866
    .local v0, "ci":I
    iget-object v1, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, v0, p2, p3}, Ljavassist/bytecode/ConstPool;->addFieldrefInfo(ILjava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 867
    invoke-static {p3}, Ljavassist/bytecode/Descriptor;->dataSize(Ljava/lang/String;)I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->growStack(I)V

    .line 868
    return-void
.end method

.method public addGetfield(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "c"    # Ljavassist/CtClass;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "type"    # Ljava/lang/String;

    .prologue
    .line 848
    const/16 v1, 0xb4

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 849
    iget-object v1, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljavassist/CtClass;)I

    move-result v0

    .line 850
    .local v0, "ci":I
    iget-object v1, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, v0, p2, p3}, Ljavassist/bytecode/ConstPool;->addFieldrefInfo(ILjava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 851
    invoke-static {p3}, Ljavassist/bytecode/Descriptor;->dataSize(Ljava/lang/String;)I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->growStack(I)V

    .line 852
    return-void
.end method

.method public addGetstatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "c"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "type"    # Ljava/lang/String;

    .prologue
    .line 896
    const/16 v1, 0xb2

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 897
    iget-object v1, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    .line 898
    .local v0, "ci":I
    iget-object v1, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, v0, p2, p3}, Ljavassist/bytecode/ConstPool;->addFieldrefInfo(ILjava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 899
    invoke-static {p3}, Ljavassist/bytecode/Descriptor;->dataSize(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->growStack(I)V

    .line 900
    return-void
.end method

.method public addGetstatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "c"    # Ljavassist/CtClass;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "type"    # Ljava/lang/String;

    .prologue
    .line 880
    const/16 v1, 0xb2

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 881
    iget-object v1, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljavassist/CtClass;)I

    move-result v0

    .line 882
    .local v0, "ci":I
    iget-object v1, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, v0, p2, p3}, Ljavassist/bytecode/ConstPool;->addFieldrefInfo(ILjava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 883
    invoke-static {p3}, Ljavassist/bytecode/Descriptor;->dataSize(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->growStack(I)V

    .line 884
    return-void
.end method

.method public addIconst(I)V
    .registers 3
    .param p1, "n"    # I

    .prologue
    .line 498
    const/4 v0, 0x6

    if-ge p1, v0, :cond_c

    const/4 v0, -0x2

    if-ge v0, p1, :cond_c

    .line 499
    add-int/lit8 v0, p1, 0x3

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 511
    :goto_b
    return-void

    .line 500
    :cond_c
    const/16 v0, 0x7f

    if-gt p1, v0, :cond_1d

    const/16 v0, -0x80

    if-gt v0, p1, :cond_1d

    .line 501
    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 502
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->add(I)V

    goto :goto_b

    .line 504
    :cond_1d
    const/16 v0, 0x7fff

    if-gt p1, v0, :cond_33

    const/16 v0, -0x8000

    if-gt v0, p1, :cond_33

    .line 505
    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 506
    shr-int/lit8 v0, p1, 0x8

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 507
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->add(I)V

    goto :goto_b

    .line 510
    :cond_33
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addIntegerInfo(I)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addLdc(I)V

    goto :goto_b
.end method

.method public addIload(I)V
    .registers 4
    .param p1, "n"    # I

    .prologue
    const/16 v1, 0x15

    .line 542
    const/4 v0, 0x4

    if-ge p1, v0, :cond_b

    .line 543
    add-int/lit8 v0, p1, 0x1a

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 553
    :goto_a
    return-void

    .line 544
    :cond_b
    const/16 v0, 0x100

    if-ge p1, v0, :cond_16

    .line 545
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 546
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->add(I)V

    goto :goto_a

    .line 549
    :cond_16
    const/16 v0, 0xc4

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 550
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 551
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    goto :goto_a
.end method

.method public addIndex(I)V
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 451
    shr-int/lit8 v0, p1, 0x8

    invoke-virtual {p0, v0, p1}, Ljavassist/bytecode/Bytecode;->add(II)V

    .line 452
    return-void
.end method

.method public addInstanceof(Ljava/lang/String;)V
    .registers 3
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 834
    const/16 v0, 0xc1

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 835
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 836
    return-void
.end method

.method public addInvokedynamic(ILjava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "bootstrap"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "desc"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 1168
    iget-object v2, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v2, p2, p3}, Ljavassist/bytecode/ConstPool;->addNameAndTypeInfo(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 1169
    .local v1, "nt":I
    iget-object v2, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v2, p1, v1}, Ljavassist/bytecode/ConstPool;->addInvokeDynamicInfo(II)I

    move-result v0

    .line 1170
    .local v0, "dyn":I
    const/16 v2, 0xba

    invoke-virtual {p0, v2}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 1171
    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1172
    invoke-virtual {p0, v3, v3}, Ljavassist/bytecode/Bytecode;->add(II)V

    .line 1173
    invoke-static {p3}, Ljavassist/bytecode/Descriptor;->dataSize(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p0, v2}, Ljavassist/bytecode/Bytecode;->growStack(I)V

    .line 1174
    return-void
.end method

.method public addInvokeinterface(ILjava/lang/String;Ljava/lang/String;I)V
    .registers 6
    .param p1, "clazz"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "desc"    # Ljava/lang/String;
    .param p4, "count"    # I

    .prologue
    .line 1150
    const/16 v0, 0xb9

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 1151
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1, p2, p3}, Ljavassist/bytecode/ConstPool;->addInterfaceMethodrefInfo(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1152
    invoke-virtual {p0, p4}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 1153
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 1154
    invoke-static {p3}, Ljavassist/bytecode/Descriptor;->dataSize(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->growStack(I)V

    .line 1155
    return-void
.end method

.method public addInvokeinterface(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 6
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "desc"    # Ljava/lang/String;
    .param p4, "count"    # I

    .prologue
    .line 1133
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0, p2, p3, p4}, Ljavassist/bytecode/Bytecode;->addInvokeinterface(ILjava/lang/String;Ljava/lang/String;I)V

    .line 1135
    return-void
.end method

.method public addInvokeinterface(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 6
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "desc"    # Ljava/lang/String;
    .param p4, "count"    # I

    .prologue
    .line 1117
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljavassist/CtClass;)I

    move-result v0

    invoke-virtual {p0, v0, p2, p3, p4}, Ljavassist/bytecode/Bytecode;->addInvokeinterface(ILjava/lang/String;Ljava/lang/String;I)V

    .line 1119
    return-void
.end method

.method public addInvokeinterface(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/CtClass;[Ljavassist/CtClass;I)V
    .registers 7
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "returnType"    # Ljavassist/CtClass;
    .param p4, "paramTypes"    # [Ljavassist/CtClass;
    .param p5, "count"    # I

    .prologue
    .line 1101
    invoke-static {p3, p4}, Ljavassist/bytecode/Descriptor;->ofMethod(Ljavassist/CtClass;[Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v0

    .line 1102
    .local v0, "desc":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, v0, p5}, Ljavassist/bytecode/Bytecode;->addInvokeinterface(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;I)V

    .line 1103
    return-void
.end method

.method public addInvokespecial(ILjava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "clazz"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "desc"    # Ljava/lang/String;

    .prologue
    .line 956
    const/16 v0, 0xb7

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 957
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1, p2, p3}, Ljavassist/bytecode/ConstPool;->addMethodrefInfo(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 958
    invoke-static {p3}, Ljavassist/bytecode/Descriptor;->dataSize(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->growStack(I)V

    .line 959
    return-void
.end method

.method public addInvokespecial(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "clazz"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "desc"    # Ljava/lang/String;

    .prologue
    .line 941
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0, p2, p3}, Ljavassist/bytecode/Bytecode;->addInvokespecial(ILjava/lang/String;Ljava/lang/String;)V

    .line 942
    return-void
.end method

.method public addInvokespecial(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "desc"    # Ljava/lang/String;

    .prologue
    .line 927
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljavassist/CtClass;)I

    move-result v0

    invoke-virtual {p0, v0, p2, p3}, Ljavassist/bytecode/Bytecode;->addInvokespecial(ILjava/lang/String;Ljava/lang/String;)V

    .line 928
    return-void
.end method

.method public addInvokespecial(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/CtClass;[Ljavassist/CtClass;)V
    .registers 6
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "returnType"    # Ljavassist/CtClass;
    .param p4, "paramTypes"    # [Ljavassist/CtClass;

    .prologue
    .line 912
    invoke-static {p3, p4}, Ljavassist/bytecode/Descriptor;->ofMethod(Ljavassist/CtClass;[Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v0

    .line 913
    .local v0, "desc":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, v0}, Ljavassist/bytecode/Bytecode;->addInvokespecial(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 914
    return-void
.end method

.method public addInvokestatic(ILjava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "clazz"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "desc"    # Ljava/lang/String;

    .prologue
    .line 1012
    const/16 v0, 0xb8

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 1013
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1, p2, p3}, Ljavassist/bytecode/ConstPool;->addMethodrefInfo(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1014
    invoke-static {p3}, Ljavassist/bytecode/Descriptor;->dataSize(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->growStack(I)V

    .line 1015
    return-void
.end method

.method public addInvokestatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "desc"    # Ljava/lang/String;

    .prologue
    .line 998
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0, p2, p3}, Ljavassist/bytecode/Bytecode;->addInvokestatic(ILjava/lang/String;Ljava/lang/String;)V

    .line 999
    return-void
.end method

.method public addInvokestatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "desc"    # Ljava/lang/String;

    .prologue
    .line 985
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljavassist/CtClass;)I

    move-result v0

    invoke-virtual {p0, v0, p2, p3}, Ljavassist/bytecode/Bytecode;->addInvokestatic(ILjava/lang/String;Ljava/lang/String;)V

    .line 986
    return-void
.end method

.method public addInvokestatic(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/CtClass;[Ljavassist/CtClass;)V
    .registers 6
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "returnType"    # Ljavassist/CtClass;
    .param p4, "paramTypes"    # [Ljavassist/CtClass;

    .prologue
    .line 971
    invoke-static {p3, p4}, Ljavassist/bytecode/Descriptor;->ofMethod(Ljavassist/CtClass;[Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v0

    .line 972
    .local v0, "desc":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, v0}, Ljavassist/bytecode/Bytecode;->addInvokestatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 973
    return-void
.end method

.method public addInvokevirtual(ILjava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "clazz"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "desc"    # Ljava/lang/String;

    .prologue
    .line 1084
    const/16 v0, 0xb6

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 1085
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1, p2, p3}, Ljavassist/bytecode/ConstPool;->addMethodrefInfo(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1086
    invoke-static {p3}, Ljavassist/bytecode/Descriptor;->dataSize(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->growStack(I)V

    .line 1087
    return-void
.end method

.method public addInvokevirtual(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "desc"    # Ljava/lang/String;

    .prologue
    .line 1066
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0, p2, p3}, Ljavassist/bytecode/Bytecode;->addInvokevirtual(ILjava/lang/String;Ljava/lang/String;)V

    .line 1067
    return-void
.end method

.method public addInvokevirtual(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "desc"    # Ljava/lang/String;

    .prologue
    .line 1049
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljavassist/CtClass;)I

    move-result v0

    invoke-virtual {p0, v0, p2, p3}, Ljavassist/bytecode/Bytecode;->addInvokevirtual(ILjava/lang/String;Ljava/lang/String;)V

    .line 1050
    return-void
.end method

.method public addInvokevirtual(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/CtClass;[Ljavassist/CtClass;)V
    .registers 6
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "returnType"    # Ljavassist/CtClass;
    .param p4, "paramTypes"    # [Ljavassist/CtClass;

    .prologue
    .line 1031
    invoke-static {p3, p4}, Ljavassist/bytecode/Descriptor;->ofMethod(Ljavassist/CtClass;[Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v0

    .line 1032
    .local v0, "desc":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, v0}, Ljavassist/bytecode/Bytecode;->addInvokevirtual(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1033
    return-void
.end method

.method public addIstore(I)V
    .registers 4
    .param p1, "n"    # I

    .prologue
    const/16 v1, 0x36

    .line 561
    const/4 v0, 0x4

    if-ge p1, v0, :cond_b

    .line 562
    add-int/lit8 v0, p1, 0x3b

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 572
    :goto_a
    return-void

    .line 563
    :cond_b
    const/16 v0, 0x100

    if-ge p1, v0, :cond_16

    .line 564
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 565
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->add(I)V

    goto :goto_a

    .line 568
    :cond_16
    const/16 v0, 0xc4

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 569
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 570
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    goto :goto_a
.end method

.method public addLconst(J)V
    .registers 5
    .param p1, "n"    # J

    .prologue
    .line 580
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-eqz v0, :cond_c

    const-wide/16 v0, 0x1

    cmp-long v0, p1, v0

    if-nez v0, :cond_13

    .line 581
    :cond_c
    long-to-int v0, p1

    add-int/lit8 v0, v0, 0x9

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 584
    :goto_12
    return-void

    .line 583
    :cond_13
    invoke-virtual {p0, p1, p2}, Ljavassist/bytecode/Bytecode;->addLdc2w(J)V

    goto :goto_12
.end method

.method public addLdc(I)V
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 1192
    const/16 v0, 0xff

    if-le p1, v0, :cond_d

    .line 1193
    const/16 v0, 0x13

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1194
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1200
    :goto_c
    return-void

    .line 1197
    :cond_d
    const/16 v0, 0x12

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1198
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->add(I)V

    goto :goto_c
.end method

.method public addLdc(Ljava/lang/String;)V
    .registers 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 1183
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addStringInfo(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addLdc(I)V

    .line 1184
    return-void
.end method

.method public addLdc2w(D)V
    .registers 4
    .param p1, "d"    # D

    .prologue
    .line 1214
    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1215
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1, p2}, Ljavassist/bytecode/ConstPool;->addDoubleInfo(D)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1216
    return-void
.end method

.method public addLdc2w(J)V
    .registers 4
    .param p1, "l"    # J

    .prologue
    .line 1206
    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1207
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1, p2}, Ljavassist/bytecode/ConstPool;->addLongInfo(J)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1208
    return-void
.end method

.method public addLload(I)V
    .registers 4
    .param p1, "n"    # I

    .prologue
    const/16 v1, 0x16

    .line 592
    const/4 v0, 0x4

    if-ge p1, v0, :cond_b

    .line 593
    add-int/lit8 v0, p1, 0x1e

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 603
    :goto_a
    return-void

    .line 594
    :cond_b
    const/16 v0, 0x100

    if-ge p1, v0, :cond_16

    .line 595
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 596
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->add(I)V

    goto :goto_a

    .line 599
    :cond_16
    const/16 v0, 0xc4

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 600
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 601
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    goto :goto_a
.end method

.method public addLoad(ILjavassist/CtClass;)I
    .registers 5
    .param p1, "n"    # I
    .param p2, "type"    # Ljavassist/CtClass;

    .prologue
    const/4 v0, 0x2

    .line 733
    invoke-virtual {p2}, Ljavassist/CtClass;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_40

    .line 734
    sget-object v1, Ljavassist/CtClass;->booleanType:Ljavassist/CtClass;

    if-eq p2, v1, :cond_1b

    sget-object v1, Ljavassist/CtClass;->charType:Ljavassist/CtClass;

    if-eq p2, v1, :cond_1b

    sget-object v1, Ljavassist/CtClass;->byteType:Ljavassist/CtClass;

    if-eq p2, v1, :cond_1b

    sget-object v1, Ljavassist/CtClass;->shortType:Ljavassist/CtClass;

    if-eq p2, v1, :cond_1b

    sget-object v1, Ljavassist/CtClass;->intType:Ljavassist/CtClass;

    if-ne p2, v1, :cond_20

    .line 737
    :cond_1b
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addIload(I)V

    .line 754
    :goto_1e
    const/4 v0, 0x1

    :goto_1f
    return v0

    .line 738
    :cond_20
    sget-object v1, Ljavassist/CtClass;->longType:Ljavassist/CtClass;

    if-ne p2, v1, :cond_28

    .line 739
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addLload(I)V

    goto :goto_1f

    .line 742
    :cond_28
    sget-object v1, Ljavassist/CtClass;->floatType:Ljavassist/CtClass;

    if-ne p2, v1, :cond_30

    .line 743
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addFload(I)V

    goto :goto_1e

    .line 744
    :cond_30
    sget-object v1, Ljavassist/CtClass;->doubleType:Ljavassist/CtClass;

    if-ne p2, v1, :cond_38

    .line 745
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addDload(I)V

    goto :goto_1f

    .line 749
    :cond_38
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "void type?"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 752
    :cond_40
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    goto :goto_1e
.end method

.method public addLoadParameters([Ljavassist/CtClass;I)I
    .registers 8
    .param p1, "params"    # [Ljavassist/CtClass;
    .param p2, "offset"    # I

    .prologue
    .line 798
    const/4 v2, 0x0

    .line 799
    .local v2, "stacksize":I
    if-eqz p1, :cond_13

    .line 800
    array-length v1, p1

    .line 801
    .local v1, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    if-ge v0, v1, :cond_13

    .line 802
    add-int v3, v2, p2

    aget-object v4, p1, v0

    invoke-virtual {p0, v3, v4}, Ljavassist/bytecode/Bytecode;->addLoad(ILjavassist/CtClass;)I

    move-result v3

    add-int/2addr v2, v3

    .line 801
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 805
    .end local v0    # "i":I
    .end local v1    # "n":I
    :cond_13
    return v2
.end method

.method public addLstore(I)V
    .registers 4
    .param p1, "n"    # I

    .prologue
    const/16 v1, 0x37

    .line 611
    const/4 v0, 0x4

    if-ge p1, v0, :cond_b

    .line 612
    add-int/lit8 v0, p1, 0x3f

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 622
    :goto_a
    return-void

    .line 613
    :cond_b
    const/16 v0, 0x100

    if-ge p1, v0, :cond_16

    .line 614
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 615
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->add(I)V

    goto :goto_a

    .line 618
    :cond_16
    const/16 v0, 0xc4

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 619
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 620
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    goto :goto_a
.end method

.method public addMultiNewarray(Ljava/lang/String;I)I
    .registers 4
    .param p1, "desc"    # Ljava/lang/String;
    .param p2, "dim"    # I

    .prologue
    .line 1312
    const/16 v0, 0xc5

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 1313
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1314
    invoke-virtual {p0, p2}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 1315
    rsub-int/lit8 v0, p2, 0x1

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->growStack(I)V

    .line 1316
    return p2
.end method

.method public addMultiNewarray(Ljavassist/CtClass;I)I
    .registers 4
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "dim"    # I

    .prologue
    .line 1297
    const/16 v0, 0xc5

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 1298
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljavassist/CtClass;)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1299
    invoke-virtual {p0, p2}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 1300
    rsub-int/lit8 v0, p2, 0x1

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->growStack(I)V

    .line 1301
    return p2
.end method

.method public addMultiNewarray(Ljavassist/CtClass;[I)I
    .registers 6
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "dimensions"    # [I

    .prologue
    .line 1280
    array-length v1, p2

    .line 1281
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    if-ge v0, v1, :cond_c

    .line 1282
    aget v2, p2, v0

    invoke-virtual {p0, v2}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 1281
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1284
    :cond_c
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->growStack(I)V

    .line 1285
    invoke-virtual {p0, p1, v1}, Ljavassist/bytecode/Bytecode;->addMultiNewarray(Ljavassist/CtClass;I)I

    move-result v2

    return v2
.end method

.method public addNew(Ljava/lang/String;)V
    .registers 3
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 1234
    const/16 v0, 0xbb

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1235
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1236
    return-void
.end method

.method public addNew(Ljavassist/CtClass;)V
    .registers 3
    .param p1, "clazz"    # Ljavassist/CtClass;

    .prologue
    .line 1224
    const/16 v0, 0xbb

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1225
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljavassist/CtClass;)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1226
    return-void
.end method

.method public addNewarray(II)V
    .registers 4
    .param p1, "atype"    # I
    .param p2, "length"    # I

    .prologue
    .line 1267
    invoke-virtual {p0, p2}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 1268
    const/16 v0, 0xbc

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1269
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 1270
    return-void
.end method

.method public addOpcode(I)V
    .registers 3
    .param p1, "code"    # I

    .prologue
    .line 413
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 414
    sget-object v0, Ljavassist/bytecode/Bytecode;->STACK_GROW:[I

    aget v0, v0, p1

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->growStack(I)V

    .line 415
    return-void
.end method

.method public addPrintln(Ljava/lang/String;)V
    .registers 5
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 1425
    const-string v0, "java.lang.System"

    const-string v1, "err"

    const-string v2, "Ljava/io/PrintStream;"

    invoke-virtual {p0, v0, v1, v2}, Ljavassist/bytecode/Bytecode;->addGetstatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1426
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addLdc(Ljava/lang/String;)V

    .line 1427
    const-string v0, "java.io.PrintStream"

    const-string v1, "println"

    const-string v2, "(Ljava/lang/String;)V"

    invoke-virtual {p0, v0, v1, v2}, Ljavassist/bytecode/Bytecode;->addInvokevirtual(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1429
    return-void
.end method

.method public addPutfield(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "desc"    # Ljava/lang/String;

    .prologue
    .line 1339
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2, p3}, Ljavassist/bytecode/Bytecode;->addPutfield0(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1340
    return-void
.end method

.method public addPutfield(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "c"    # Ljavassist/CtClass;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "desc"    # Ljava/lang/String;

    .prologue
    .line 1327
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Ljavassist/bytecode/Bytecode;->addPutfield0(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1328
    return-void
.end method

.method public addPutstatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "fieldName"    # Ljava/lang/String;
    .param p3, "desc"    # Ljava/lang/String;

    .prologue
    .line 1372
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2, p3}, Ljavassist/bytecode/Bytecode;->addPutstatic0(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1373
    return-void
.end method

.method public addPutstatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "c"    # Ljavassist/CtClass;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "desc"    # Ljava/lang/String;

    .prologue
    .line 1360
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Ljavassist/bytecode/Bytecode;->addPutstatic0(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1361
    return-void
.end method

.method public addRet(I)V
    .registers 4
    .param p1, "var"    # I

    .prologue
    const/16 v1, 0xa9

    .line 1407
    const/16 v0, 0x100

    if-ge p1, v0, :cond_d

    .line 1408
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1409
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 1416
    :goto_c
    return-void

    .line 1412
    :cond_d
    const/16 v0, 0xc4

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1413
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1414
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    goto :goto_c
.end method

.method public addReturn(Ljavassist/CtClass;)V
    .registers 4
    .param p1, "type"    # Ljavassist/CtClass;

    .prologue
    .line 1391
    if-nez p1, :cond_8

    .line 1392
    const/16 v1, 0xb1

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1399
    :goto_7
    return-void

    .line 1393
    :cond_8
    invoke-virtual {p1}, Ljavassist/CtClass;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_19

    move-object v0, p1

    .line 1394
    check-cast v0, Ljavassist/CtPrimitiveType;

    .line 1395
    .local v0, "ptype":Ljavassist/CtPrimitiveType;
    invoke-virtual {v0}, Ljavassist/CtPrimitiveType;->getReturnOp()I

    move-result v1

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_7

    .line 1398
    .end local v0    # "ptype":Ljavassist/CtPrimitiveType;
    :cond_19
    const/16 v1, 0xb0

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_7
.end method

.method public addStore(ILjavassist/CtClass;)I
    .registers 5
    .param p1, "n"    # I
    .param p2, "type"    # Ljavassist/CtClass;

    .prologue
    const/4 v0, 0x2

    .line 766
    invoke-virtual {p2}, Ljavassist/CtClass;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_40

    .line 767
    sget-object v1, Ljavassist/CtClass;->booleanType:Ljavassist/CtClass;

    if-eq p2, v1, :cond_1b

    sget-object v1, Ljavassist/CtClass;->charType:Ljavassist/CtClass;

    if-eq p2, v1, :cond_1b

    sget-object v1, Ljavassist/CtClass;->byteType:Ljavassist/CtClass;

    if-eq p2, v1, :cond_1b

    sget-object v1, Ljavassist/CtClass;->shortType:Ljavassist/CtClass;

    if-eq p2, v1, :cond_1b

    sget-object v1, Ljavassist/CtClass;->intType:Ljavassist/CtClass;

    if-ne p2, v1, :cond_20

    .line 770
    :cond_1b
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addIstore(I)V

    .line 787
    :goto_1e
    const/4 v0, 0x1

    :goto_1f
    return v0

    .line 771
    :cond_20
    sget-object v1, Ljavassist/CtClass;->longType:Ljavassist/CtClass;

    if-ne p2, v1, :cond_28

    .line 772
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addLstore(I)V

    goto :goto_1f

    .line 775
    :cond_28
    sget-object v1, Ljavassist/CtClass;->floatType:Ljavassist/CtClass;

    if-ne p2, v1, :cond_30

    .line 776
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addFstore(I)V

    goto :goto_1e

    .line 777
    :cond_30
    sget-object v1, Ljavassist/CtClass;->doubleType:Ljavassist/CtClass;

    if-ne p2, v1, :cond_38

    .line 778
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addDstore(I)V

    goto :goto_1f

    .line 782
    :cond_38
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "void type?"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 785
    :cond_40
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addAstore(I)V

    goto :goto_1e
.end method

.method public clone()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 167
    :try_start_0
    invoke-super {p0}, Ljavassist/bytecode/ByteVector;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/Bytecode;

    .line 168
    .local v0, "bc":Ljavassist/bytecode/Bytecode;
    iget-object v2, p0, Ljavassist/bytecode/Bytecode;->tryblocks:Ljavassist/bytecode/ExceptionTable;

    invoke-virtual {v2}, Ljavassist/bytecode/ExceptionTable;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavassist/bytecode/ExceptionTable;

    iput-object v2, v0, Ljavassist/bytecode/Bytecode;->tryblocks:Ljavassist/bytecode/ExceptionTable;
    :try_end_10
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_10} :catch_11

    .line 169
    return-object v0

    .line 171
    .end local v0    # "bc":Ljavassist/bytecode/Bytecode;
    :catch_11
    move-exception v1

    .line 172
    .local v1, "cnse":Ljava/lang/CloneNotSupportedException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public currentPc()I
    .registers 2

    .prologue
    .line 317
    invoke-virtual {p0}, Ljavassist/bytecode/Bytecode;->getSize()I

    move-result v0

    return v0
.end method

.method public get()[B
    .registers 2

    .prologue
    .line 205
    invoke-virtual {p0}, Ljavassist/bytecode/Bytecode;->copy()[B

    move-result-object v0

    return-object v0
.end method

.method public getConstPool()Ljavassist/bytecode/ConstPool;
    .registers 2

    .prologue
    .line 179
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    return-object v0
.end method

.method public getExceptionTable()Ljavassist/bytecode/ExceptionTable;
    .registers 2

    .prologue
    .line 184
    iget-object v0, p0, Ljavassist/bytecode/Bytecode;->tryblocks:Ljavassist/bytecode/ExceptionTable;

    return-object v0
.end method

.method public getMaxLocals()I
    .registers 2

    .prologue
    .line 234
    iget v0, p0, Ljavassist/bytecode/Bytecode;->maxLocals:I

    return v0
.end method

.method public getMaxStack()I
    .registers 2

    .prologue
    .line 211
    iget v0, p0, Ljavassist/bytecode/Bytecode;->maxStack:I

    return v0
.end method

.method public getStackDepth()I
    .registers 2

    .prologue
    .line 431
    iget v0, p0, Ljavassist/bytecode/Bytecode;->stackDepth:I

    return v0
.end method

.method public growStack(I)V
    .registers 3
    .param p1, "diff"    # I

    .prologue
    .line 425
    iget v0, p0, Ljavassist/bytecode/Bytecode;->stackDepth:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->setStackDepth(I)V

    .line 426
    return-void
.end method

.method public incMaxLocals(I)V
    .registers 3
    .param p1, "diff"    # I

    .prologue
    .line 281
    iget v0, p0, Ljavassist/bytecode/Bytecode;->maxLocals:I

    add-int/2addr v0, p1

    iput v0, p0, Ljavassist/bytecode/Bytecode;->maxLocals:I

    .line 282
    return-void
.end method

.method public length()I
    .registers 2

    .prologue
    .line 198
    invoke-virtual {p0}, Ljavassist/bytecode/Bytecode;->getSize()I

    move-result v0

    return v0
.end method

.method public read(I)I
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 327
    invoke-super {p0, p1}, Ljavassist/bytecode/ByteVector;->read(I)I

    move-result v0

    return v0
.end method

.method public read16bit(I)I
    .registers 6
    .param p1, "offset"    # I

    .prologue
    .line 335
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->read(I)I

    move-result v0

    .line 336
    .local v0, "v1":I
    add-int/lit8 v2, p1, 0x1

    invoke-virtual {p0, v2}, Ljavassist/bytecode/Bytecode;->read(I)I

    move-result v1

    .line 337
    .local v1, "v2":I
    shl-int/lit8 v2, v0, 0x8

    and-int/lit16 v3, v1, 0xff

    add-int/2addr v2, v3

    return v2
.end method

.method public read32bit(I)I
    .registers 6
    .param p1, "offset"    # I

    .prologue
    .line 345
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->read16bit(I)I

    move-result v0

    .line 346
    .local v0, "v1":I
    add-int/lit8 v2, p1, 0x2

    invoke-virtual {p0, v2}, Ljavassist/bytecode/Bytecode;->read16bit(I)I

    move-result v1

    .line 347
    .local v1, "v2":I
    shl-int/lit8 v2, v0, 0x10

    const v3, 0xffff

    and-int/2addr v3, v1

    add-int/2addr v2, v3

    return v2
.end method

.method public setMaxLocals(I)V
    .registers 2
    .param p1, "size"    # I

    .prologue
    .line 240
    iput p1, p0, Ljavassist/bytecode/Bytecode;->maxLocals:I

    .line 241
    return-void
.end method

.method public setMaxLocals(Z[Ljavassist/CtClass;I)V
    .registers 9
    .param p1, "isStatic"    # Z
    .param p2, "params"    # [Ljavassist/CtClass;
    .param p3, "locals"    # I

    .prologue
    .line 258
    if-nez p1, :cond_4

    .line 259
    add-int/lit8 p3, p3, 0x1

    .line 261
    :cond_4
    if-eqz p2, :cond_1c

    .line 262
    sget-object v0, Ljavassist/CtClass;->doubleType:Ljavassist/CtClass;

    .line 263
    .local v0, "doubleType":Ljavassist/CtClass;
    sget-object v2, Ljavassist/CtClass;->longType:Ljavassist/CtClass;

    .line 264
    .local v2, "longType":Ljavassist/CtClass;
    array-length v3, p2

    .line 265
    .local v3, "n":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    if-ge v1, v3, :cond_1c

    .line 266
    aget-object v4, p2, v1

    .line 267
    .local v4, "type":Ljavassist/CtClass;
    if-eq v4, v0, :cond_14

    if-ne v4, v2, :cond_19

    .line 268
    :cond_14
    add-int/lit8 p3, p3, 0x2

    .line 265
    :goto_16
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 270
    :cond_19
    add-int/lit8 p3, p3, 0x1

    goto :goto_16

    .line 274
    .end local v0    # "doubleType":Ljavassist/CtClass;
    .end local v1    # "i":I
    .end local v2    # "longType":Ljavassist/CtClass;
    .end local v3    # "n":I
    .end local v4    # "type":Ljavassist/CtClass;
    :cond_1c
    iput p3, p0, Ljavassist/bytecode/Bytecode;->maxLocals:I

    .line 275
    return-void
.end method

.method public setMaxStack(I)V
    .registers 2
    .param p1, "size"    # I

    .prologue
    .line 228
    iput p1, p0, Ljavassist/bytecode/Bytecode;->maxStack:I

    .line 229
    return-void
.end method

.method public setStackDepth(I)V
    .registers 4
    .param p1, "depth"    # I

    .prologue
    .line 441
    iput p1, p0, Ljavassist/bytecode/Bytecode;->stackDepth:I

    .line 442
    iget v0, p0, Ljavassist/bytecode/Bytecode;->stackDepth:I

    iget v1, p0, Ljavassist/bytecode/Bytecode;->maxStack:I

    if-le v0, v1, :cond_c

    .line 443
    iget v0, p0, Ljavassist/bytecode/Bytecode;->stackDepth:I

    iput v0, p0, Ljavassist/bytecode/Bytecode;->maxStack:I

    .line 444
    :cond_c
    return-void
.end method

.method public toCodeAttribute()Ljavassist/bytecode/CodeAttribute;
    .registers 7

    .prologue
    .line 190
    new-instance v0, Ljavassist/bytecode/CodeAttribute;

    iget-object v1, p0, Ljavassist/bytecode/Bytecode;->constPool:Ljavassist/bytecode/ConstPool;

    iget v2, p0, Ljavassist/bytecode/Bytecode;->maxStack:I

    iget v3, p0, Ljavassist/bytecode/Bytecode;->maxLocals:I

    invoke-virtual {p0}, Ljavassist/bytecode/Bytecode;->get()[B

    move-result-object v4

    iget-object v5, p0, Ljavassist/bytecode/Bytecode;->tryblocks:Ljavassist/bytecode/ExceptionTable;

    invoke-direct/range {v0 .. v5}, Ljavassist/bytecode/CodeAttribute;-><init>(Ljavassist/bytecode/ConstPool;II[BLjavassist/bytecode/ExceptionTable;)V

    return-object v0
.end method

.method public write(II)V
    .registers 3
    .param p1, "offset"    # I
    .param p2, "value"    # I

    .prologue
    .line 357
    invoke-super {p0, p1, p2}, Ljavassist/bytecode/ByteVector;->write(II)V

    .line 358
    return-void
.end method

.method public write16bit(II)V
    .registers 4
    .param p1, "offset"    # I
    .param p2, "value"    # I

    .prologue
    .line 365
    shr-int/lit8 v0, p2, 0x8

    invoke-virtual {p0, p1, v0}, Ljavassist/bytecode/Bytecode;->write(II)V

    .line 366
    add-int/lit8 v0, p1, 0x1

    invoke-virtual {p0, v0, p2}, Ljavassist/bytecode/Bytecode;->write(II)V

    .line 367
    return-void
.end method

.method public write32bit(II)V
    .registers 4
    .param p1, "offset"    # I
    .param p2, "value"    # I

    .prologue
    .line 374
    shr-int/lit8 v0, p2, 0x10

    invoke-virtual {p0, p1, v0}, Ljavassist/bytecode/Bytecode;->write16bit(II)V

    .line 375
    add-int/lit8 v0, p1, 0x2

    invoke-virtual {p0, v0, p2}, Ljavassist/bytecode/Bytecode;->write16bit(II)V

    .line 376
    return-void
.end method
