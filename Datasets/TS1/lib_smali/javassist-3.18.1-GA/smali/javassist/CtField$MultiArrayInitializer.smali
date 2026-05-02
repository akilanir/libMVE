.class Ljavassist/CtField$MultiArrayInitializer;
.super Ljavassist/CtField$Initializer;
.source "CtField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/CtField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MultiArrayInitializer"
.end annotation


# instance fields
.field dim:[I

.field type:Ljavassist/CtClass;


# direct methods
.method constructor <init>(Ljavassist/CtClass;[I)V
    .registers 3
    .param p1, "t"    # Ljavassist/CtClass;
    .param p2, "d"    # [I

    .prologue
    .line 1389
    invoke-direct {p0}, Ljavassist/CtField$Initializer;-><init>()V

    iput-object p1, p0, Ljavassist/CtField$MultiArrayInitializer;->type:Ljavassist/CtClass;

    iput-object p2, p0, Ljavassist/CtField$MultiArrayInitializer;->dim:[I

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
    .line 1392
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x5b

    if-eq v0, v1, :cond_11

    .line 1393
    new-instance v0, Ljavassist/CannotCompileException;

    const-string v1, "type mismatch"

    invoke-direct {v0, v1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1394
    :cond_11
    return-void
.end method

.method compile(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/bytecode/Bytecode;[Ljavassist/CtClass;Ljavassist/compiler/Javac;)I
    .registers 9
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
    .line 1400
    const/4 v1, 0x0

    invoke-virtual {p3, v1}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1401
    iget-object v1, p0, Ljavassist/CtField$MultiArrayInitializer;->dim:[I

    invoke-virtual {p3, p1, v1}, Ljavassist/bytecode/Bytecode;->addMultiNewarray(Ljavassist/CtClass;[I)I

    move-result v0

    .line 1402
    .local v0, "s":I
    sget-object v1, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v1, p2, v2}, Ljavassist/bytecode/Bytecode;->addPutfield(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1403
    add-int/lit8 v1, v0, 0x1

    return v1
.end method

.method compileIfStatic(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/bytecode/Bytecode;Ljavassist/compiler/Javac;)I
    .registers 8
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
    .line 1409
    iget-object v1, p0, Ljavassist/CtField$MultiArrayInitializer;->dim:[I

    invoke-virtual {p3, p1, v1}, Ljavassist/bytecode/Bytecode;->addMultiNewarray(Ljavassist/CtClass;[I)I

    move-result v0

    .line 1410
    .local v0, "s":I
    sget-object v1, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v1, p2, v2}, Ljavassist/bytecode/Bytecode;->addPutstatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1411
    return v0
.end method
