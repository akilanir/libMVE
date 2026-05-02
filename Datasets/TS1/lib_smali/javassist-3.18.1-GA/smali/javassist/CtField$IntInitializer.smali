.class Ljavassist/CtField$IntInitializer;
.super Ljavassist/CtField$Initializer;
.source "CtField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/CtField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "IntInitializer"
.end annotation


# instance fields
.field value:I


# direct methods
.method constructor <init>(I)V
    .registers 2
    .param p1, "v"    # I

    .prologue
    .line 1182
    invoke-direct {p0}, Ljavassist/CtField$Initializer;-><init>()V

    iput p1, p0, Ljavassist/CtField$IntInitializer;->value:I

    return-void
.end method


# virtual methods
.method check(Ljava/lang/String;)V
    .registers 5
    .param p1, "desc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1185
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1186
    .local v0, "c":C
    const/16 v1, 0x49

    if-eq v0, v1, :cond_21

    const/16 v1, 0x53

    if-eq v0, v1, :cond_21

    const/16 v1, 0x42

    if-eq v0, v1, :cond_21

    const/16 v1, 0x43

    if-eq v0, v1, :cond_21

    const/16 v1, 0x5a

    if-eq v0, v1, :cond_21

    .line 1187
    new-instance v1, Ljavassist/CannotCompileException;

    const-string v2, "type mismatch"

    invoke-direct {v1, v2}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1188
    :cond_21
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
    .line 1194
    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1195
    iget v0, p0, Ljavassist/CtField$IntInitializer;->value:I

    invoke-virtual {p3, v0}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 1196
    sget-object v0, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v0, p2, v1}, Ljavassist/bytecode/Bytecode;->addPutfield(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1197
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
    .line 1203
    iget v0, p0, Ljavassist/CtField$IntInitializer;->value:I

    invoke-virtual {p3, v0}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 1204
    sget-object v0, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v0, p2, v1}, Ljavassist/bytecode/Bytecode;->addPutstatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1205
    const/4 v0, 0x1

    return v0
.end method

.method getConstantValue(Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;)I
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "type"    # Ljavassist/CtClass;

    .prologue
    .line 1209
    iget v0, p0, Ljavassist/CtField$IntInitializer;->value:I

    invoke-virtual {p1, v0}, Ljavassist/bytecode/ConstPool;->addIntegerInfo(I)I

    move-result v0

    return v0
.end method
