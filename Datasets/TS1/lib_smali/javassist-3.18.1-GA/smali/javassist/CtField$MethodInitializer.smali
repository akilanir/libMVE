.class Ljavassist/CtField$MethodInitializer;
.super Ljavassist/CtField$NewInitializer;
.source "CtField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/CtField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MethodInitializer"
.end annotation


# instance fields
.field methodName:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 1109
    invoke-direct {p0}, Ljavassist/CtField$NewInitializer;-><init>()V

    return-void
.end method

.method private getDescriptor()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1141
    const-string v0, "(Ljava/lang/Object;[Ljava/lang/String;[Ljava/lang/Object;)"

    .line 1144
    .local v0, "desc3":Ljava/lang/String;
    iget-object v1, p0, Ljavassist/CtField$MethodInitializer;->stringParams:[Ljava/lang/String;

    if-nez v1, :cond_10

    .line 1145
    iget-boolean v1, p0, Ljavassist/CtField$MethodInitializer;->withConstructorParams:Z

    if-eqz v1, :cond_d

    .line 1146
    const-string v1, "(Ljava/lang/Object;[Ljava/lang/Object;)"

    .line 1153
    :goto_c
    return-object v1

    .line 1148
    :cond_d
    const-string v1, "(Ljava/lang/Object;)"

    goto :goto_c

    .line 1150
    :cond_10
    iget-boolean v1, p0, Ljavassist/CtField$MethodInitializer;->withConstructorParams:Z

    if-eqz v1, :cond_17

    .line 1151
    const-string v1, "(Ljava/lang/Object;[Ljava/lang/String;[Ljava/lang/Object;)"

    goto :goto_c

    .line 1153
    :cond_17
    const-string v1, "(Ljava/lang/Object;[Ljava/lang/String;)"

    goto :goto_c
.end method


# virtual methods
.method compile(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/bytecode/Bytecode;[Ljavassist/CtClass;Ljavassist/compiler/Javac;)I
    .registers 11
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
    const/4 v3, 0x0

    .line 1121
    invoke-virtual {p3, v3}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1122
    invoke-virtual {p3, v3}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1124
    iget-object v3, p0, Ljavassist/CtField$MethodInitializer;->stringParams:[Ljava/lang/String;

    if-nez v3, :cond_3c

    .line 1125
    const/4 v1, 0x2

    .line 1129
    .local v1, "stacksize":I
    :goto_c
    iget-boolean v3, p0, Ljavassist/CtField$MethodInitializer;->withConstructorParams:Z

    if-eqz v3, :cond_16

    .line 1130
    const/4 v3, 0x1

    invoke-static {p3, p4, v3}, Ljavassist/CtNewWrappedMethod;->compileParameterList(Ljavassist/bytecode/Bytecode;[Ljavassist/CtClass;I)I

    move-result v3

    add-int/2addr v1, v3

    .line 1133
    :cond_16
    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v2

    .line 1134
    .local v2, "typeDesc":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Ljavassist/CtField$MethodInitializer;->getDescriptor()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1135
    .local v0, "mDesc":Ljava/lang/String;
    iget-object v3, p0, Ljavassist/CtField$MethodInitializer;->objectType:Ljavassist/CtClass;

    iget-object v4, p0, Ljavassist/CtField$MethodInitializer;->methodName:Ljava/lang/String;

    invoke-virtual {p3, v3, v4, v0}, Ljavassist/bytecode/Bytecode;->addInvokestatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1136
    sget-object v3, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-virtual {p3, v3, p2, v2}, Ljavassist/bytecode/Bytecode;->addPutfield(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1137
    return v1

    .line 1127
    .end local v0    # "mDesc":Ljava/lang/String;
    .end local v1    # "stacksize":I
    .end local v2    # "typeDesc":Ljava/lang/String;
    :cond_3c
    invoke-virtual {p0, p3}, Ljavassist/CtField$MethodInitializer;->compileStringParameter(Ljavassist/bytecode/Bytecode;)I

    move-result v3

    add-int/lit8 v1, v3, 0x2

    .restart local v1    # "stacksize":I
    goto :goto_c
.end method

.method compileIfStatic(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/bytecode/Bytecode;Ljavassist/compiler/Javac;)I
    .registers 11
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
    .line 1164
    const/4 v1, 0x1

    .line 1165
    .local v1, "stacksize":I
    iget-object v3, p0, Ljavassist/CtField$MethodInitializer;->stringParams:[Ljava/lang/String;

    if-nez v3, :cond_29

    .line 1166
    const-string v0, "()"

    .line 1172
    .local v0, "desc":Ljava/lang/String;
    :goto_7
    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v2

    .line 1173
    .local v2, "typeDesc":Ljava/lang/String;
    iget-object v3, p0, Ljavassist/CtField$MethodInitializer;->objectType:Ljavassist/CtClass;

    iget-object v4, p0, Ljavassist/CtField$MethodInitializer;->methodName:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p3, v3, v4, v5}, Ljavassist/bytecode/Bytecode;->addInvokestatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1174
    sget-object v3, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-virtual {p3, v3, p2, v2}, Ljavassist/bytecode/Bytecode;->addPutstatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 1175
    return v1

    .line 1168
    .end local v0    # "desc":Ljava/lang/String;
    .end local v2    # "typeDesc":Ljava/lang/String;
    :cond_29
    const-string v0, "([Ljava/lang/String;)"

    .line 1169
    .restart local v0    # "desc":Ljava/lang/String;
    invoke-virtual {p0, p3}, Ljavassist/CtField$MethodInitializer;->compileStringParameter(Ljavassist/bytecode/Bytecode;)I

    move-result v3

    add-int/2addr v1, v3

    goto :goto_7
.end method
