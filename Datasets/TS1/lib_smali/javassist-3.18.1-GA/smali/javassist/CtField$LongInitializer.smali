.class Ljavassist/CtField$LongInitializer;
.super Ljavassist/CtField$Initializer;
.source "CtField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/CtField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "LongInitializer"
.end annotation


# instance fields
.field value:J


# direct methods
.method constructor <init>(J)V
    .registers 3
    .param p1, "v"    # J

    .prologue
    .line 1216
    invoke-direct {p0}, Ljavassist/CtField$Initializer;-><init>()V

    iput-wide p1, p0, Ljavassist/CtField$LongInitializer;->value:J

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
    .line 1219
    const-string v0, "J"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 1220
    new-instance v0, Ljavassist/CannotCompileException;

    const-string v1, "type mismatch"

    invoke-direct {v0, v1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1221
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
    .line 1227
    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1228
    iget-wide v0, p0, Ljavassist/CtField$LongInitializer;->value:J

    invoke-virtual {p3, v0, v1}, Ljavassist/bytecode/Bytecode;->addLdc2w(J)V

    .line 1229
    sget-object v0, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v0, p2, v1}, Ljavassist/bytecode/Bytecode;->addPutfield(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1230
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
    .line 1236
    iget-wide v0, p0, Ljavassist/CtField$LongInitializer;->value:J

    invoke-virtual {p3, v0, v1}, Ljavassist/bytecode/Bytecode;->addLdc2w(J)V

    .line 1237
    sget-object v0, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v0, p2, v1}, Ljavassist/bytecode/Bytecode;->addPutstatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1238
    const/4 v0, 0x2

    return v0
.end method

.method getConstantValue(Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;)I
    .registers 5
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "type"    # Ljavassist/CtClass;

    .prologue
    .line 1242
    sget-object v0, Ljavassist/CtClass;->longType:Ljavassist/CtClass;

    if-ne p2, v0, :cond_b

    .line 1243
    iget-wide v0, p0, Ljavassist/CtField$LongInitializer;->value:J

    invoke-virtual {p1, v0, v1}, Ljavassist/bytecode/ConstPool;->addLongInfo(J)I

    move-result v0

    .line 1245
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method
