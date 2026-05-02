.class Ljavassist/CtField$StringInitializer;
.super Ljavassist/CtField$Initializer;
.source "CtField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/CtField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "StringInitializer"
.end annotation


# instance fields
.field value:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "v"    # Ljava/lang/String;

    .prologue
    .line 1324
    invoke-direct {p0}, Ljavassist/CtField$Initializer;-><init>()V

    iput-object p1, p0, Ljavassist/CtField$StringInitializer;->value:Ljava/lang/String;

    return-void
.end method


# virtual methods
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
    .line 1330
    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1331
    iget-object v0, p0, Ljavassist/CtField$StringInitializer;->value:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljavassist/bytecode/Bytecode;->addLdc(Ljava/lang/String;)V

    .line 1332
    sget-object v0, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v0, p2, v1}, Ljavassist/bytecode/Bytecode;->addPutfield(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1333
    const/4 v0, 0x2

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
    .line 1339
    iget-object v0, p0, Ljavassist/CtField$StringInitializer;->value:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljavassist/bytecode/Bytecode;->addLdc(Ljava/lang/String;)V

    .line 1340
    sget-object v0, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v0, p2, v1}, Ljavassist/bytecode/Bytecode;->addPutstatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1341
    const/4 v0, 0x1

    return v0
.end method

.method getConstantValue(Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;)I
    .registers 5
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "type"    # Ljavassist/CtClass;

    .prologue
    .line 1345
    invoke-virtual {p2}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "java.lang.String"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 1346
    iget-object v0, p0, Ljavassist/CtField$StringInitializer;->value:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljavassist/bytecode/ConstPool;->addStringInfo(Ljava/lang/String;)I

    move-result v0

    .line 1348
    :goto_12
    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method
