.class Ljavassist/CtField$DoubleInitializer;
.super Ljavassist/CtField$Initializer;
.source "CtField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/CtField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DoubleInitializer"
.end annotation


# instance fields
.field value:D


# direct methods
.method constructor <init>(D)V
    .registers 3
    .param p1, "v"    # D

    .prologue
    .line 1288
    invoke-direct {p0}, Ljavassist/CtField$Initializer;-><init>()V

    iput-wide p1, p0, Ljavassist/CtField$DoubleInitializer;->value:D

    return-void
.end method


# virtual methods
.method check(Ljava/lang/String;)V
    .registers 4
    .param p1, "desc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1291
    const-string v0, "D"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 1292
    new-instance v0, Ljavassist/CannotCompileException;

    const-string v1, "type mismatch"

    invoke-direct {v0, v1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1293
    :cond_10
    return-void
.end method

.method compile(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/bytecode/Bytecode;[Ljavassist/CtClass;Ljavassist/compiler/Javac;)I
    .registers 8
    .param p1, "type"    # Ljavassist/CtClass;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "code"    # Ljavassist/bytecode/Bytecode;
    .param p4, "parameters"    # [Ljavassist/CtClass;
    .param p5, "drv"    # Ljavassist/compiler/Javac;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1299
    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1300
    iget-wide v0, p0, Ljavassist/CtField$DoubleInitializer;->value:D

    invoke-virtual {p3, v0, v1}, Ljavassist/bytecode/Bytecode;->addLdc2w(D)V

    .line 1301
    sget-object v0, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v0, p2, v1}, Ljavassist/bytecode/Bytecode;->addPutfield(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1302
    const/4 v0, 0x3

    return v0
.end method

.method compileIfStatic(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/bytecode/Bytecode;Ljavassist/compiler/Javac;)I
    .registers 7
    .param p1, "type"    # Ljavassist/CtClass;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "code"    # Ljavassist/bytecode/Bytecode;
    .param p4, "drv"    # Ljavassist/compiler/Javac;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1308
    iget-wide v0, p0, Ljavassist/CtField$DoubleInitializer;->value:D

    invoke-virtual {p3, v0, v1}, Ljavassist/bytecode/Bytecode;->addLdc2w(D)V

    .line 1309
    sget-object v0, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v0, p2, v1}, Ljavassist/bytecode/Bytecode;->addPutstatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1310
    const/4 v0, 0x2

    return v0
.end method

.method getConstantValue(Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;)I
    .registers 5
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "type"    # Ljavassist/CtClass;

    .prologue
    .line 1314
    sget-object v0, Ljavassist/CtClass;->doubleType:Ljavassist/CtClass;

    if-ne p2, v0, :cond_b

    .line 1315
    iget-wide v0, p0, Ljavassist/CtField$DoubleInitializer;->value:D

    invoke-virtual {p1, v0, v1}, Ljavassist/bytecode/ConstPool;->addDoubleInfo(D)I

    move-result v0

    .line 1317
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method
