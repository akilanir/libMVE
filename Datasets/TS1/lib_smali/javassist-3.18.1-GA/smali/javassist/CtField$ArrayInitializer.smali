.class Ljavassist/CtField$ArrayInitializer;
.super Ljavassist/CtField$Initializer;
.source "CtField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/CtField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ArrayInitializer"
.end annotation


# instance fields
.field size:I

.field type:Ljavassist/CtClass;


# direct methods
.method constructor <init>(Ljavassist/CtClass;I)V
    .registers 3
    .param p1, "t"    # Ljavassist/CtClass;
    .param p2, "s"    # I

    .prologue
    .line 1356
    invoke-direct {p0}, Ljavassist/CtField$Initializer;-><init>()V

    iput-object p1, p0, Ljavassist/CtField$ArrayInitializer;->type:Ljavassist/CtClass;

    iput p2, p0, Ljavassist/CtField$ArrayInitializer;->size:I

    return-void
.end method

.method private addNewarray(Ljavassist/bytecode/Bytecode;)V
    .registers 4
    .param p1, "code"    # Ljavassist/bytecode/Bytecode;

    .prologue
    .line 1359
    iget-object v0, p0, Ljavassist/CtField$ArrayInitializer;->type:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 1360
    iget-object v0, p0, Ljavassist/CtField$ArrayInitializer;->type:Ljavassist/CtClass;

    check-cast v0, Ljavassist/CtPrimitiveType;

    invoke-virtual {v0}, Ljavassist/CtPrimitiveType;->getArrayType()I

    move-result v0

    iget v1, p0, Ljavassist/CtField$ArrayInitializer;->size:I

    invoke-virtual {p1, v0, v1}, Ljavassist/bytecode/Bytecode;->addNewarray(II)V

    .line 1364
    :goto_15
    return-void

    .line 1363
    :cond_16
    iget-object v0, p0, Ljavassist/CtField$ArrayInitializer;->type:Ljavassist/CtClass;

    iget v1, p0, Ljavassist/CtField$ArrayInitializer;->size:I

    invoke-virtual {p1, v0, v1}, Ljavassist/bytecode/Bytecode;->addAnewarray(Ljavassist/CtClass;I)V

    goto :goto_15
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
    .line 1370
    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1371
    invoke-direct {p0, p3}, Ljavassist/CtField$ArrayInitializer;->addNewarray(Ljavassist/bytecode/Bytecode;)V

    .line 1372
    sget-object v0, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v0, p2, v1}, Ljavassist/bytecode/Bytecode;->addPutfield(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1373
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
    .line 1379
    invoke-direct {p0, p3}, Ljavassist/CtField$ArrayInitializer;->addNewarray(Ljavassist/bytecode/Bytecode;)V

    .line 1380
    sget-object v0, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v0, p2, v1}, Ljavassist/bytecode/Bytecode;->addPutstatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1381
    const/4 v0, 0x1

    return v0
.end method
