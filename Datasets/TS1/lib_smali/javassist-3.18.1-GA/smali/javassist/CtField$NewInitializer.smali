.class Ljavassist/CtField$NewInitializer;
.super Ljavassist/CtField$Initializer;
.source "CtField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/CtField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NewInitializer"
.end annotation


# instance fields
.field objectType:Ljavassist/CtClass;

.field stringParams:[Ljava/lang/String;

.field withConstructorParams:Z


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 1013
    invoke-direct {p0}, Ljavassist/CtField$Initializer;-><init>()V

    return-void
.end method

.method private getDescriptor()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1045
    const-string v0, "(Ljava/lang/Object;[Ljava/lang/String;[Ljava/lang/Object;)V"

    .line 1048
    .local v0, "desc3":Ljava/lang/String;
    iget-object v1, p0, Ljavassist/CtField$NewInitializer;->stringParams:[Ljava/lang/String;

    if-nez v1, :cond_10

    .line 1049
    iget-boolean v1, p0, Ljavassist/CtField$NewInitializer;->withConstructorParams:Z

    if-eqz v1, :cond_d

    .line 1050
    const-string v1, "(Ljava/lang/Object;[Ljava/lang/Object;)V"

    .line 1057
    :goto_c
    return-object v1

    .line 1052
    :cond_d
    const-string v1, "(Ljava/lang/Object;)V"

    goto :goto_c

    .line 1054
    :cond_10
    iget-boolean v1, p0, Ljavassist/CtField$NewInitializer;->withConstructorParams:Z

    if-eqz v1, :cond_17

    .line 1055
    const-string v1, "(Ljava/lang/Object;[Ljava/lang/String;[Ljava/lang/Object;)V"

    goto :goto_c

    .line 1057
    :cond_17
    const-string v1, "(Ljava/lang/Object;[Ljava/lang/String;)V"

    goto :goto_c
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
    const/4 v2, 0x0

    .line 1025
    invoke-virtual {p3, v2}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1026
    iget-object v1, p0, Ljavassist/CtField$NewInitializer;->objectType:Ljavassist/CtClass;

    invoke-virtual {p3, v1}, Ljavassist/bytecode/Bytecode;->addNew(Ljavassist/CtClass;)V

    .line 1027
    const/16 v1, 0x59

    invoke-virtual {p3, v1}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 1028
    invoke-virtual {p3, v2}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1030
    iget-object v1, p0, Ljavassist/CtField$NewInitializer;->stringParams:[Ljava/lang/String;

    if-nez v1, :cond_35

    .line 1031
    const/4 v0, 0x4

    .line 1035
    .local v0, "stacksize":I
    :goto_16
    iget-boolean v1, p0, Ljavassist/CtField$NewInitializer;->withConstructorParams:Z

    if-eqz v1, :cond_20

    .line 1036
    const/4 v1, 0x1

    invoke-static {p3, p4, v1}, Ljavassist/CtNewWrappedMethod;->compileParameterList(Ljavassist/bytecode/Bytecode;[Ljavassist/CtClass;I)I

    move-result v1

    add-int/2addr v0, v1

    .line 1039
    :cond_20
    iget-object v1, p0, Ljavassist/CtField$NewInitializer;->objectType:Ljavassist/CtClass;

    const-string v2, "<init>"

    invoke-direct {p0}, Ljavassist/CtField$NewInitializer;->getDescriptor()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v1, v2, v3}, Ljavassist/bytecode/Bytecode;->addInvokespecial(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1040
    sget-object v1, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v1, p2, v2}, Ljavassist/bytecode/Bytecode;->addPutfield(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1041
    return v0

    .line 1033
    .end local v0    # "stacksize":I
    :cond_35
    invoke-virtual {p0, p3}, Ljavassist/CtField$NewInitializer;->compileStringParameter(Ljavassist/bytecode/Bytecode;)I

    move-result v1

    add-int/lit8 v0, v1, 0x4

    .restart local v0    # "stacksize":I
    goto :goto_16
.end method

.method compileIfStatic(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/bytecode/Bytecode;Ljavassist/compiler/Javac;)I
    .registers 9
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
    .line 1068
    iget-object v2, p0, Ljavassist/CtField$NewInitializer;->objectType:Ljavassist/CtClass;

    invoke-virtual {p3, v2}, Ljavassist/bytecode/Bytecode;->addNew(Ljavassist/CtClass;)V

    .line 1069
    const/16 v2, 0x59

    invoke-virtual {p3, v2}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 1071
    const/4 v1, 0x2

    .line 1072
    .local v1, "stacksize":I
    iget-object v2, p0, Ljavassist/CtField$NewInitializer;->stringParams:[Ljava/lang/String;

    if-nez v2, :cond_22

    .line 1073
    const-string v0, "()V"

    .line 1079
    .local v0, "desc":Ljava/lang/String;
    :goto_11
    iget-object v2, p0, Ljavassist/CtField$NewInitializer;->objectType:Ljavassist/CtClass;

    const-string v3, "<init>"

    invoke-virtual {p3, v2, v3, v0}, Ljavassist/bytecode/Bytecode;->addInvokespecial(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1080
    sget-object v2, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v2, p2, v3}, Ljavassist/bytecode/Bytecode;->addPutstatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1081
    return v1

    .line 1075
    .end local v0    # "desc":Ljava/lang/String;
    :cond_22
    const-string v0, "([Ljava/lang/String;)V"

    .line 1076
    .restart local v0    # "desc":Ljava/lang/String;
    invoke-virtual {p0, p3}, Ljavassist/CtField$NewInitializer;->compileStringParameter(Ljavassist/bytecode/Bytecode;)I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_11
.end method

.method protected final compileStringParameter(Ljavassist/bytecode/Bytecode;)I
    .registers 5
    .param p1, "code"    # Ljavassist/bytecode/Bytecode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1087
    iget-object v2, p0, Ljavassist/CtField$NewInitializer;->stringParams:[Ljava/lang/String;

    array-length v1, v2

    .line 1088
    .local v1, "nparam":I
    invoke-virtual {p1, v1}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 1089
    const-string v2, "java.lang.String"

    invoke-virtual {p1, v2}, Ljavassist/bytecode/Bytecode;->addAnewarray(Ljava/lang/String;)V

    .line 1090
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_c
    if-ge v0, v1, :cond_25

    .line 1091
    const/16 v2, 0x59

    invoke-virtual {p1, v2}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 1092
    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 1093
    iget-object v2, p0, Ljavassist/CtField$NewInitializer;->stringParams:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {p1, v2}, Ljavassist/bytecode/Bytecode;->addLdc(Ljava/lang/String;)V

    .line 1094
    const/16 v2, 0x53

    invoke-virtual {p1, v2}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 1090
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 1097
    :cond_25
    const/4 v2, 0x4

    return v2
.end method
