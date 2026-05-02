.class Ljavassist/CtField$ParamInitializer;
.super Ljavassist/CtField$Initializer;
.source "CtField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/CtField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ParamInitializer"
.end annotation


# instance fields
.field nthParam:I


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 952
    invoke-direct {p0}, Ljavassist/CtField$Initializer;-><init>()V

    return-void
.end method

.method static nthParamToLocal(I[Ljavassist/CtClass;Z)I
    .registers 8
    .param p0, "nth"    # I
    .param p1, "params"    # [Ljavassist/CtClass;
    .param p2, "isStatic"    # Z

    .prologue
    .line 979
    sget-object v3, Ljavassist/CtClass;->longType:Ljavassist/CtClass;

    .line 980
    .local v3, "longType":Ljavassist/CtClass;
    sget-object v0, Ljavassist/CtClass;->doubleType:Ljavassist/CtClass;

    .line 982
    .local v0, "doubleType":Ljavassist/CtClass;
    if-eqz p2, :cond_15

    .line 983
    const/4 v2, 0x0

    .line 987
    .local v2, "k":I
    :goto_7
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    if-ge v1, p0, :cond_1a

    .line 988
    aget-object v4, p1, v1

    .line 989
    .local v4, "type":Ljavassist/CtClass;
    if-eq v4, v3, :cond_10

    if-ne v4, v0, :cond_17

    .line 990
    :cond_10
    add-int/lit8 v2, v2, 0x2

    .line 987
    :goto_12
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 985
    .end local v1    # "i":I
    .end local v2    # "k":I
    .end local v4    # "type":Ljavassist/CtClass;
    :cond_15
    const/4 v2, 0x1

    .restart local v2    # "k":I
    goto :goto_7

    .line 992
    .restart local v1    # "i":I
    .restart local v4    # "type":Ljavassist/CtClass;
    :cond_17
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    .line 995
    .end local v4    # "type":Ljavassist/CtClass;
    :cond_1a
    return v2
.end method


# virtual methods
.method compile(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/bytecode/Bytecode;[Ljavassist/CtClass;Ljavassist/compiler/Javac;)I
    .registers 10
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
    const/4 v1, 0x0

    .line 958
    if-eqz p4, :cond_20

    iget v2, p0, Ljavassist/CtField$ParamInitializer;->nthParam:I

    array-length v3, p4

    if-ge v2, v3, :cond_20

    .line 959
    invoke-virtual {p3, v1}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 960
    iget v2, p0, Ljavassist/CtField$ParamInitializer;->nthParam:I

    invoke-static {v2, p4, v1}, Ljavassist/CtField$ParamInitializer;->nthParamToLocal(I[Ljavassist/CtClass;Z)I

    move-result v0

    .line 961
    .local v0, "nth":I
    invoke-virtual {p3, v0, p1}, Ljavassist/bytecode/Bytecode;->addLoad(ILjavassist/CtClass;)I

    move-result v2

    add-int/lit8 v1, v2, 0x1

    .line 962
    .local v1, "s":I
    sget-object v2, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v2, p2, v3}, Ljavassist/bytecode/Bytecode;->addPutfield(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 966
    .end local v0    # "nth":I
    .end local v1    # "s":I
    :cond_20
    return v1
.end method

.method compileIfStatic(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/bytecode/Bytecode;Ljavassist/compiler/Javac;)I
    .registers 6
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
    .line 1001
    const/4 v0, 0x0

    return v0
.end method
