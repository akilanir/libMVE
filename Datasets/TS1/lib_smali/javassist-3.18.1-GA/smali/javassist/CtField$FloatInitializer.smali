.class Ljavassist/CtField$FloatInitializer;
.super Ljavassist/CtField$Initializer;
.source "CtField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/CtField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "FloatInitializer"
.end annotation


# instance fields
.field value:F


# direct methods
.method constructor <init>(F)V
    .registers 2
    .param p1, "v"    # F

    .prologue
    .line 1252
    invoke-direct {p0}, Ljavassist/CtField$Initializer;-><init>()V

    iput p1, p0, Ljavassist/CtField$FloatInitializer;->value:F

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
    .line 1255
    const-string v0, "F"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 1256
    new-instance v0, Ljavassist/CannotCompileException;

    const-string v1, "type mismatch"

    invoke-direct {v0, v1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1257
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
    .line 1263
    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1264
    iget v0, p0, Ljavassist/CtField$FloatInitializer;->value:F

    invoke-virtual {p3, v0}, Ljavassist/bytecode/Bytecode;->addFconst(F)V

    .line 1265
    sget-object v0, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v0, p2, v1}, Ljavassist/bytecode/Bytecode;->addPutfield(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1266
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
    .line 1272
    iget v0, p0, Ljavassist/CtField$FloatInitializer;->value:F

    invoke-virtual {p3, v0}, Ljavassist/bytecode/Bytecode;->addFconst(F)V

    .line 1273
    sget-object v0, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v0, p2, v1}, Ljavassist/bytecode/Bytecode;->addPutstatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1274
    const/4 v0, 0x2

    return v0
.end method

.method getConstantValue(Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;)I
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "type"    # Ljavassist/CtClass;

    .prologue
    .line 1278
    sget-object v0, Ljavassist/CtClass;->floatType:Ljavassist/CtClass;

    if-ne p2, v0, :cond_b

    .line 1279
    iget v0, p0, Ljavassist/CtField$FloatInitializer;->value:F

    invoke-virtual {p1, v0}, Ljavassist/bytecode/ConstPool;->addFloatInfo(F)I

    move-result v0

    .line 1281
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method
