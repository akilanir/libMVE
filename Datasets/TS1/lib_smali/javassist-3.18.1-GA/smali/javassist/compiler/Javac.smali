.class public Ljavassist/compiler/Javac;
.super Ljava/lang/Object;
.source "Javac.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/compiler/Javac$CtFieldWithInit;
    }
.end annotation


# static fields
.field public static final param0Name:Ljava/lang/String; = "$0"

.field public static final proceedName:Ljava/lang/String; = "$proceed"

.field public static final resultVarName:Ljava/lang/String; = "$_"


# instance fields
.field private bytecode:Ljavassist/bytecode/Bytecode;

.field gen:Ljavassist/compiler/JvstCodeGen;

.field stable:Ljavassist/compiler/SymbolTable;


# direct methods
.method public constructor <init>(Ljavassist/CtClass;)V
    .registers 5
    .param p1, "thisClass"    # Ljavassist/CtClass;

    .prologue
    const/4 v2, 0x0

    .line 53
    new-instance v0, Ljavassist/bytecode/Bytecode;

    invoke-virtual {p1}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v1

    invoke-virtual {v1}, Ljavassist/bytecode/ClassFile;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v1

    invoke-direct {v0, v1, v2, v2}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;II)V

    invoke-direct {p0, v0, p1}, Ljavassist/compiler/Javac;-><init>(Ljavassist/bytecode/Bytecode;Ljavassist/CtClass;)V

    .line 55
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/Bytecode;Ljavassist/CtClass;)V
    .registers 5
    .param p1, "b"    # Ljavassist/bytecode/Bytecode;
    .param p2, "thisClass"    # Ljavassist/CtClass;

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    new-instance v0, Ljavassist/compiler/JvstCodeGen;

    invoke-virtual {p2}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v1

    invoke-direct {v0, p1, p2, v1}, Ljavassist/compiler/JvstCodeGen;-><init>(Ljavassist/bytecode/Bytecode;Ljavassist/CtClass;Ljavassist/ClassPool;)V

    iput-object v0, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    .line 67
    new-instance v0, Ljavassist/compiler/SymbolTable;

    invoke-direct {v0}, Ljavassist/compiler/SymbolTable;-><init>()V

    iput-object v0, p0, Ljavassist/compiler/Javac;->stable:Ljavassist/compiler/SymbolTable;

    .line 68
    iput-object p1, p0, Ljavassist/compiler/Javac;->bytecode:Ljavassist/bytecode/Bytecode;

    .line 69
    return-void
.end method

.method private compileField(Ljavassist/compiler/ast/FieldDecl;)Ljavassist/CtField;
    .registers 7
    .param p1, "fd"    # Ljavassist/compiler/ast/FieldDecl;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;,
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 132
    invoke-virtual {p1}, Ljavassist/compiler/ast/FieldDecl;->getDeclarator()Ljavassist/compiler/ast/Declarator;

    move-result-object v0

    .line 133
    .local v0, "d":Ljavassist/compiler/ast/Declarator;
    new-instance v1, Ljavassist/compiler/Javac$CtFieldWithInit;

    iget-object v2, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    iget-object v2, v2, Ljavassist/compiler/JvstCodeGen;->resolver:Ljavassist/compiler/MemberResolver;

    invoke-virtual {v2, v0}, Ljavassist/compiler/MemberResolver;->lookupClass(Ljavassist/compiler/ast/Declarator;)Ljavassist/CtClass;

    move-result-object v2

    invoke-virtual {v0}, Ljavassist/compiler/ast/Declarator;->getVariable()Ljavassist/compiler/ast/Symbol;

    move-result-object v3

    invoke-virtual {v3}, Ljavassist/compiler/ast/Symbol;->get()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    invoke-virtual {v4}, Ljavassist/compiler/JvstCodeGen;->getThisClass()Ljavassist/CtClass;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Ljavassist/compiler/Javac$CtFieldWithInit;-><init>(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/CtClass;)V

    .line 135
    .local v1, "f":Ljavassist/compiler/Javac$CtFieldWithInit;
    invoke-virtual {p1}, Ljavassist/compiler/ast/FieldDecl;->getModifiers()Ljavassist/compiler/ast/ASTList;

    move-result-object v2

    invoke-static {v2}, Ljavassist/compiler/MemberResolver;->getModifiers(Ljavassist/compiler/ast/ASTList;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljavassist/compiler/Javac$CtFieldWithInit;->setModifiers(I)V

    .line 136
    invoke-virtual {p1}, Ljavassist/compiler/ast/FieldDecl;->getInit()Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    if-eqz v2, :cond_37

    .line 137
    invoke-virtual {p1}, Ljavassist/compiler/ast/FieldDecl;->getInit()Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljavassist/compiler/Javac$CtFieldWithInit;->setInit(Ljavassist/compiler/ast/ASTree;)V

    .line 139
    :cond_37
    return-object v1
.end method

.method private compileMethod(Ljavassist/compiler/Parser;Ljavassist/compiler/ast/MethodDecl;)Ljavassist/CtBehavior;
    .registers 13
    .param p1, "p"    # Ljavassist/compiler/Parser;
    .param p2, "md"    # Ljavassist/compiler/ast/MethodDecl;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 145
    invoke-virtual {p2}, Ljavassist/compiler/ast/MethodDecl;->getModifiers()Ljavassist/compiler/ast/ASTList;

    move-result-object v8

    invoke-static {v8}, Ljavassist/compiler/MemberResolver;->getModifiers(Ljavassist/compiler/ast/ASTList;)I

    move-result v3

    .line 146
    .local v3, "mod":I
    iget-object v8, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    invoke-virtual {v8, p2}, Ljavassist/compiler/JvstCodeGen;->makeParamList(Ljavassist/compiler/ast/MethodDecl;)[Ljavassist/CtClass;

    move-result-object v4

    .line 147
    .local v4, "plist":[Ljavassist/CtClass;
    iget-object v8, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    invoke-virtual {v8, p2}, Ljavassist/compiler/JvstCodeGen;->makeThrowsList(Ljavassist/compiler/ast/MethodDecl;)[Ljavassist/CtClass;

    move-result-object v7

    .line 148
    .local v7, "tlist":[Ljavassist/CtClass;
    invoke-static {v3}, Ljavassist/Modifier;->isStatic(I)Z

    move-result v8

    invoke-virtual {p0, v4, v8}, Ljavassist/compiler/Javac;->recordParams([Ljavassist/CtClass;Z)I

    .line 149
    iget-object v8, p0, Ljavassist/compiler/Javac;->stable:Ljavassist/compiler/SymbolTable;

    invoke-virtual {p1, v8, p2}, Ljavassist/compiler/Parser;->parseMethod2(Ljavassist/compiler/SymbolTable;Ljavassist/compiler/ast/MethodDecl;)Ljavassist/compiler/ast/MethodDecl;

    move-result-object p2

    .line 151
    :try_start_21
    invoke-virtual {p2}, Ljavassist/compiler/ast/MethodDecl;->isConstructor()Z

    move-result v8

    if-eqz v8, :cond_4b

    .line 152
    new-instance v0, Ljavassist/CtConstructor;

    iget-object v8, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    invoke-virtual {v8}, Ljavassist/compiler/JvstCodeGen;->getThisClass()Ljavassist/CtClass;

    move-result-object v8

    invoke-direct {v0, v4, v8}, Ljavassist/CtConstructor;-><init>([Ljavassist/CtClass;Ljavassist/CtClass;)V

    .line 154
    .local v0, "cons":Ljavassist/CtConstructor;
    invoke-virtual {v0, v3}, Ljavassist/CtConstructor;->setModifiers(I)V

    .line 155
    iget-object v8, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    invoke-virtual {p2, v8}, Ljavassist/compiler/ast/MethodDecl;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 156
    invoke-virtual {v0}, Ljavassist/CtConstructor;->getMethodInfo()Ljavassist/bytecode/MethodInfo;

    move-result-object v8

    iget-object v9, p0, Ljavassist/compiler/Javac;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v9}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V

    .line 158
    invoke-virtual {v0, v7}, Ljavassist/CtConstructor;->setExceptionTypes([Ljavassist/CtClass;)V

    .line 177
    .end local v0    # "cons":Ljavassist/CtConstructor;
    :goto_4a
    return-object v0

    .line 162
    :cond_4b
    invoke-virtual {p2}, Ljavassist/compiler/ast/MethodDecl;->getReturn()Ljavassist/compiler/ast/Declarator;

    move-result-object v5

    .line 163
    .local v5, "r":Ljavassist/compiler/ast/Declarator;
    iget-object v8, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    iget-object v8, v8, Ljavassist/compiler/JvstCodeGen;->resolver:Ljavassist/compiler/MemberResolver;

    invoke-virtual {v8, v5}, Ljavassist/compiler/MemberResolver;->lookupClass(Ljavassist/compiler/ast/Declarator;)Ljavassist/CtClass;

    move-result-object v6

    .line 164
    .local v6, "rtype":Ljavassist/CtClass;
    const/4 v8, 0x0

    invoke-virtual {p0, v6, v8}, Ljavassist/compiler/Javac;->recordReturnType(Ljavassist/CtClass;Z)I

    .line 165
    new-instance v2, Ljavassist/CtMethod;

    invoke-virtual {v5}, Ljavassist/compiler/ast/Declarator;->getVariable()Ljavassist/compiler/ast/Symbol;

    move-result-object v8

    invoke-virtual {v8}, Ljavassist/compiler/ast/Symbol;->get()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    invoke-virtual {v9}, Ljavassist/compiler/JvstCodeGen;->getThisClass()Ljavassist/CtClass;

    move-result-object v9

    invoke-direct {v2, v6, v8, v4, v9}, Ljavassist/CtMethod;-><init>(Ljavassist/CtClass;Ljava/lang/String;[Ljavassist/CtClass;Ljavassist/CtClass;)V

    .line 167
    .local v2, "method":Ljavassist/CtMethod;
    invoke-virtual {v2, v3}, Ljavassist/CtMethod;->setModifiers(I)V

    .line 168
    iget-object v8, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    invoke-virtual {v8, v2}, Ljavassist/compiler/JvstCodeGen;->setThisMethod(Ljavassist/CtMethod;)V

    .line 169
    iget-object v8, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    invoke-virtual {p2, v8}, Ljavassist/compiler/ast/MethodDecl;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 170
    invoke-virtual {p2}, Ljavassist/compiler/ast/MethodDecl;->getBody()Ljavassist/compiler/ast/Stmnt;

    move-result-object v8

    if-eqz v8, :cond_93

    .line 171
    invoke-virtual {v2}, Ljavassist/CtMethod;->getMethodInfo()Ljavassist/bytecode/MethodInfo;

    move-result-object v8

    iget-object v9, p0, Ljavassist/compiler/Javac;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v9}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V

    .line 176
    :goto_8e
    invoke-virtual {v2, v7}, Ljavassist/CtMethod;->setExceptionTypes([Ljavassist/CtClass;)V

    move-object v0, v2

    .line 177
    goto :goto_4a

    .line 174
    :cond_93
    or-int/lit16 v8, v3, 0x400

    invoke-virtual {v2, v8}, Ljavassist/CtMethod;->setModifiers(I)V
    :try_end_98
    .catch Ljavassist/NotFoundException; {:try_start_21 .. :try_end_98} :catch_99

    goto :goto_8e

    .line 180
    .end local v2    # "method":Ljavassist/CtMethod;
    .end local v5    # "r":Ljavassist/compiler/ast/Declarator;
    .end local v6    # "rtype":Ljavassist/CtClass;
    :catch_99
    move-exception v1

    .line 181
    .local v1, "e":Ljavassist/NotFoundException;
    new-instance v8, Ljavassist/compiler/CompileError;

    invoke-virtual {v1}, Ljavassist/NotFoundException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v8
.end method

.method private static makeDefaultBody(Ljavassist/bytecode/Bytecode;Ljavassist/CtClass;)V
    .registers 6
    .param p0, "b"    # Ljavassist/bytecode/Bytecode;
    .param p1, "type"    # Ljavassist/CtClass;

    .prologue
    .line 236
    instance-of v3, p1, Ljavassist/CtPrimitiveType;

    if-eqz v3, :cond_30

    move-object v1, p1

    .line 237
    check-cast v1, Ljavassist/CtPrimitiveType;

    .line 238
    .local v1, "pt":Ljavassist/CtPrimitiveType;
    invoke-virtual {v1}, Ljavassist/CtPrimitiveType;->getReturnOp()I

    move-result v0

    .line 239
    .local v0, "op":I
    const/16 v3, 0xaf

    if-ne v0, v3, :cond_1a

    .line 240
    const/16 v2, 0xe

    .line 255
    .end local v1    # "pt":Ljavassist/CtPrimitiveType;
    .local v2, "value":I
    :goto_11
    if-eqz v2, :cond_16

    .line 256
    invoke-virtual {p0, v2}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 258
    :cond_16
    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 259
    return-void

    .line 241
    .end local v2    # "value":I
    .restart local v1    # "pt":Ljavassist/CtPrimitiveType;
    :cond_1a
    const/16 v3, 0xae

    if-ne v0, v3, :cond_21

    .line 242
    const/16 v2, 0xb

    .restart local v2    # "value":I
    goto :goto_11

    .line 243
    .end local v2    # "value":I
    :cond_21
    const/16 v3, 0xad

    if-ne v0, v3, :cond_28

    .line 244
    const/16 v2, 0x9

    .restart local v2    # "value":I
    goto :goto_11

    .line 245
    .end local v2    # "value":I
    :cond_28
    const/16 v3, 0xb1

    if-ne v0, v3, :cond_2e

    .line 246
    const/4 v2, 0x0

    .restart local v2    # "value":I
    goto :goto_11

    .line 248
    .end local v2    # "value":I
    :cond_2e
    const/4 v2, 0x3

    .restart local v2    # "value":I
    goto :goto_11

    .line 251
    .end local v0    # "op":I
    .end local v1    # "pt":Ljavassist/CtPrimitiveType;
    .end local v2    # "value":I
    :cond_30
    const/16 v0, 0xb0

    .line 252
    .restart local v0    # "op":I
    const/4 v2, 0x1

    .restart local v2    # "value":I
    goto :goto_11
.end method

.method public static parseExpr(Ljava/lang/String;Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;
    .registers 4
    .param p0, "src"    # Ljava/lang/String;
    .param p1, "st"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 593
    new-instance v0, Ljavassist/compiler/Parser;

    new-instance v1, Ljavassist/compiler/Lex;

    invoke-direct {v1, p0}, Ljavassist/compiler/Lex;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljavassist/compiler/Parser;-><init>(Ljavassist/compiler/Lex;)V

    .line 594
    .local v0, "p":Ljavassist/compiler/Parser;
    invoke-virtual {v0, p1}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public compile(Ljava/lang/String;)Ljavassist/CtMember;
    .registers 11
    .param p1, "src"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 89
    new-instance v5, Ljavassist/compiler/Parser;

    new-instance v6, Ljavassist/compiler/Lex;

    invoke-direct {v6, p1}, Ljavassist/compiler/Lex;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v6}, Ljavassist/compiler/Parser;-><init>(Ljavassist/compiler/Lex;)V

    .line 90
    .local v5, "p":Ljavassist/compiler/Parser;
    iget-object v6, p0, Ljavassist/compiler/Javac;->stable:Ljavassist/compiler/SymbolTable;

    invoke-virtual {v5, v6}, Ljavassist/compiler/Parser;->parseMember1(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTList;

    move-result-object v4

    .line 92
    .local v4, "mem":Ljavassist/compiler/ast/ASTList;
    :try_start_10
    instance-of v6, v4, Ljavassist/compiler/ast/FieldDecl;

    if-eqz v6, :cond_1b

    .line 93
    check-cast v4, Ljavassist/compiler/ast/FieldDecl;

    .end local v4    # "mem":Ljavassist/compiler/ast/ASTList;
    invoke-direct {p0, v4}, Ljavassist/compiler/Javac;->compileField(Ljavassist/compiler/ast/FieldDecl;)Ljavassist/CtField;

    move-result-object v1

    .line 100
    :goto_1a
    return-object v1

    .line 95
    .restart local v4    # "mem":Ljavassist/compiler/ast/ASTList;
    :cond_1b
    check-cast v4, Ljavassist/compiler/ast/MethodDecl;

    .end local v4    # "mem":Ljavassist/compiler/ast/ASTList;
    invoke-direct {p0, v5, v4}, Ljavassist/compiler/Javac;->compileMethod(Ljavassist/compiler/Parser;Ljavassist/compiler/ast/MethodDecl;)Ljavassist/CtBehavior;

    move-result-object v1

    .line 96
    .local v1, "cb":Ljavassist/CtBehavior;
    invoke-virtual {v1}, Ljavassist/CtBehavior;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v2

    .line 97
    .local v2, "decl":Ljavassist/CtClass;
    invoke-virtual {v1}, Ljavassist/CtBehavior;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v6

    invoke-virtual {v2}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v7

    invoke-virtual {v2}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljavassist/bytecode/MethodInfo;->rebuildStackMapIf6(Ljavassist/ClassPool;Ljavassist/bytecode/ClassFile;)V
    :try_end_34
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_10 .. :try_end_34} :catch_35
    .catch Ljavassist/CannotCompileException; {:try_start_10 .. :try_end_34} :catch_40

    goto :goto_1a

    .line 103
    .end local v1    # "cb":Ljavassist/CtBehavior;
    .end local v2    # "decl":Ljavassist/CtClass;
    :catch_35
    move-exception v0

    .line 104
    .local v0, "bb":Ljavassist/bytecode/BadBytecode;
    new-instance v6, Ljavassist/compiler/CompileError;

    invoke-virtual {v0}, Ljavassist/bytecode/BadBytecode;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v6

    .line 106
    .end local v0    # "bb":Ljavassist/bytecode/BadBytecode;
    :catch_40
    move-exception v3

    .line 107
    .local v3, "e":Ljavassist/CannotCompileException;
    new-instance v6, Ljavassist/compiler/CompileError;

    invoke-virtual {v3}, Ljavassist/CannotCompileException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method public compileBody(Ljavassist/CtBehavior;Ljava/lang/String;)Ljavassist/bytecode/Bytecode;
    .registers 16
    .param p1, "method"    # Ljavassist/CtBehavior;
    .param p2, "src"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    const/4 v11, 0x0

    .line 195
    :try_start_2
    invoke-virtual {p1}, Ljavassist/CtBehavior;->getModifiers()I

    move-result v4

    .line 196
    .local v4, "mod":I
    invoke-virtual {p1}, Ljavassist/CtBehavior;->getParameterTypes()[Ljavassist/CtClass;

    move-result-object v9

    invoke-static {v4}, Ljavassist/Modifier;->isStatic(I)Z

    move-result v12

    invoke-virtual {p0, v9, v12}, Ljavassist/compiler/Javac;->recordParams([Ljavassist/CtClass;Z)I

    .line 199
    instance-of v9, p1, Ljavassist/CtMethod;

    if-eqz v9, :cond_39

    .line 200
    iget-object v12, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    move-object v0, p1

    check-cast v0, Ljavassist/CtMethod;

    move-object v9, v0

    invoke-virtual {v12, v9}, Ljavassist/compiler/JvstCodeGen;->setThisMethod(Ljavassist/CtMethod;)V

    .line 201
    move-object v0, p1

    check-cast v0, Ljavassist/CtMethod;

    move-object v9, v0

    invoke-virtual {v9}, Ljavassist/CtMethod;->getReturnType()Ljavassist/CtClass;

    move-result-object v6

    .line 206
    .local v6, "rtype":Ljavassist/CtClass;
    :goto_26
    const/4 v9, 0x0

    invoke-virtual {p0, v6, v9}, Ljavassist/compiler/Javac;->recordReturnType(Ljavassist/CtClass;Z)I

    .line 207
    sget-object v9, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    if-ne v6, v9, :cond_3c

    move v3, v10

    .line 209
    .local v3, "isVoid":Z
    :goto_2f
    if-nez p2, :cond_3e

    .line 210
    iget-object v9, p0, Ljavassist/compiler/Javac;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-static {v9, v6}, Ljavassist/compiler/Javac;->makeDefaultBody(Ljavassist/bytecode/Bytecode;Ljavassist/CtClass;)V

    .line 226
    .end local p1    # "method":Ljavassist/CtBehavior;
    :goto_36
    iget-object v9, p0, Ljavassist/compiler/Javac;->bytecode:Ljavassist/bytecode/Bytecode;

    return-object v9

    .line 204
    .end local v3    # "isVoid":Z
    .end local v6    # "rtype":Ljavassist/CtClass;
    .restart local p1    # "method":Ljavassist/CtBehavior;
    :cond_39
    sget-object v6, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    .restart local v6    # "rtype":Ljavassist/CtClass;
    goto :goto_26

    :cond_3c
    move v3, v11

    .line 207
    goto :goto_2f

    .line 212
    .restart local v3    # "isVoid":Z
    :cond_3e
    new-instance v5, Ljavassist/compiler/Parser;

    new-instance v9, Ljavassist/compiler/Lex;

    invoke-direct {v9, p2}, Ljavassist/compiler/Lex;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v9}, Ljavassist/compiler/Parser;-><init>(Ljavassist/compiler/Lex;)V

    .line 213
    .local v5, "p":Ljavassist/compiler/Parser;
    new-instance v8, Ljavassist/compiler/SymbolTable;

    iget-object v9, p0, Ljavassist/compiler/Javac;->stable:Ljavassist/compiler/SymbolTable;

    invoke-direct {v8, v9}, Ljavassist/compiler/SymbolTable;-><init>(Ljavassist/compiler/SymbolTable;)V

    .line 214
    .local v8, "stb":Ljavassist/compiler/SymbolTable;
    invoke-virtual {v5, v8}, Ljavassist/compiler/Parser;->parseStatement(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v7

    .line 215
    .local v7, "s":Ljavassist/compiler/ast/Stmnt;
    invoke-virtual {v5}, Ljavassist/compiler/Parser;->hasMore()Z

    move-result v9

    if-eqz v9, :cond_6c

    .line 216
    new-instance v9, Ljavassist/compiler/CompileError;

    const-string v10, "the method/constructor body must be surrounded by {}"

    invoke-direct {v9, v10}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_61
    .catch Ljavassist/NotFoundException; {:try_start_2 .. :try_end_61} :catch_61

    .line 228
    .end local v3    # "isVoid":Z
    .end local v4    # "mod":I
    .end local v5    # "p":Ljavassist/compiler/Parser;
    .end local v6    # "rtype":Ljavassist/CtClass;
    .end local v7    # "s":Ljavassist/compiler/ast/Stmnt;
    .end local v8    # "stb":Ljavassist/compiler/SymbolTable;
    .end local p1    # "method":Ljavassist/CtBehavior;
    :catch_61
    move-exception v2

    .line 229
    .local v2, "e":Ljavassist/NotFoundException;
    new-instance v9, Ljavassist/compiler/CompileError;

    invoke-virtual {v2}, Ljavassist/NotFoundException;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v9

    .line 219
    .end local v2    # "e":Ljavassist/NotFoundException;
    .restart local v3    # "isVoid":Z
    .restart local v4    # "mod":I
    .restart local v5    # "p":Ljavassist/compiler/Parser;
    .restart local v6    # "rtype":Ljavassist/CtClass;
    .restart local v7    # "s":Ljavassist/compiler/ast/Stmnt;
    .restart local v8    # "stb":Ljavassist/compiler/SymbolTable;
    .restart local p1    # "method":Ljavassist/CtBehavior;
    :cond_6c
    const/4 v1, 0x0

    .line 220
    .local v1, "callSuper":Z
    :try_start_6d
    instance-of v9, p1, Ljavassist/CtConstructor;

    if-eqz v9, :cond_7a

    .line 221
    check-cast p1, Ljavassist/CtConstructor;

    .end local p1    # "method":Ljavassist/CtBehavior;
    invoke-virtual {p1}, Ljavassist/CtConstructor;->isClassInitializer()Z

    move-result v9

    if-nez v9, :cond_80

    move v1, v10

    .line 223
    :cond_7a
    :goto_7a
    iget-object v9, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    invoke-virtual {v9, v7, v1, v3}, Ljavassist/compiler/JvstCodeGen;->atMethodBody(Ljavassist/compiler/ast/Stmnt;ZZ)V
    :try_end_7f
    .catch Ljavassist/NotFoundException; {:try_start_6d .. :try_end_7f} :catch_61

    goto :goto_36

    :cond_80
    move v1, v11

    .line 221
    goto :goto_7a
.end method

.method public compileExpr(Ljava/lang/String;)V
    .registers 4
    .param p1, "src"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 583
    iget-object v1, p0, Ljavassist/compiler/Javac;->stable:Ljavassist/compiler/SymbolTable;

    invoke-static {p1, v1}, Ljavassist/compiler/Javac;->parseExpr(Ljava/lang/String;Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 584
    .local v0, "e":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p0, v0}, Ljavassist/compiler/Javac;->compileExpr(Ljavassist/compiler/ast/ASTree;)V

    .line 585
    return-void
.end method

.method public compileExpr(Ljavassist/compiler/ast/ASTree;)V
    .registers 3
    .param p1, "e"    # Ljavassist/compiler/ast/ASTree;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 607
    if-eqz p1, :cond_7

    .line 608
    iget-object v0, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    invoke-virtual {v0, p1}, Ljavassist/compiler/JvstCodeGen;->compileExpr(Ljavassist/compiler/ast/ASTree;)V

    .line 609
    :cond_7
    return-void
.end method

.method public compileStmnt(Ljava/lang/String;)V
    .registers 6
    .param p1, "src"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 564
    new-instance v0, Ljavassist/compiler/Parser;

    new-instance v3, Ljavassist/compiler/Lex;

    invoke-direct {v3, p1}, Ljavassist/compiler/Lex;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v3}, Ljavassist/compiler/Parser;-><init>(Ljavassist/compiler/Lex;)V

    .line 565
    .local v0, "p":Ljavassist/compiler/Parser;
    new-instance v2, Ljavassist/compiler/SymbolTable;

    iget-object v3, p0, Ljavassist/compiler/Javac;->stable:Ljavassist/compiler/SymbolTable;

    invoke-direct {v2, v3}, Ljavassist/compiler/SymbolTable;-><init>(Ljavassist/compiler/SymbolTable;)V

    .line 566
    .local v2, "stb":Ljavassist/compiler/SymbolTable;
    :cond_11
    :goto_11
    invoke-virtual {v0}, Ljavassist/compiler/Parser;->hasMore()Z

    move-result v3

    if-eqz v3, :cond_23

    .line 567
    invoke-virtual {v0, v2}, Ljavassist/compiler/Parser;->parseStatement(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v1

    .line 568
    .local v1, "s":Ljavassist/compiler/ast/Stmnt;
    if-eqz v1, :cond_11

    .line 569
    iget-object v3, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    invoke-virtual {v1, v3}, Ljavassist/compiler/ast/Stmnt;->accept(Ljavassist/compiler/ast/Visitor;)V

    goto :goto_11

    .line 571
    .end local v1    # "s":Ljavassist/compiler/ast/Stmnt;
    :cond_23
    return-void
.end method

.method public getBytecode()Ljavassist/bytecode/Bytecode;
    .registers 2

    .prologue
    .line 74
    iget-object v0, p0, Ljavassist/compiler/Javac;->bytecode:Ljavassist/bytecode/Bytecode;

    return-object v0
.end method

.method public recordLocalVariables(Ljavassist/bytecode/CodeAttribute;I)Z
    .registers 13
    .param p1, "ca"    # Ljavassist/bytecode/CodeAttribute;
    .param p2, "pc"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 273
    const-string v5, "LocalVariableTable"

    invoke-virtual {p1, v5}, Ljavassist/bytecode/CodeAttribute;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v4

    check-cast v4, Ljavassist/bytecode/LocalVariableAttribute;

    .line 276
    .local v4, "va":Ljavassist/bytecode/LocalVariableAttribute;
    if-nez v4, :cond_c

    .line 277
    const/4 v5, 0x0

    .line 288
    :goto_b
    return v5

    .line 279
    :cond_c
    invoke-virtual {v4}, Ljavassist/bytecode/LocalVariableAttribute;->tableLength()I

    move-result v2

    .line 280
    .local v2, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_11
    if-ge v0, v2, :cond_37

    .line 281
    invoke-virtual {v4, v0}, Ljavassist/bytecode/LocalVariableAttribute;->startPc(I)I

    move-result v3

    .line 282
    .local v3, "start":I
    invoke-virtual {v4, v0}, Ljavassist/bytecode/LocalVariableAttribute;->codeLength(I)I

    move-result v1

    .line 283
    .local v1, "len":I
    if-gt v3, p2, :cond_34

    add-int v5, v3, v1

    if-ge p2, v5, :cond_34

    .line 284
    iget-object v5, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    invoke-virtual {v4, v0}, Ljavassist/bytecode/LocalVariableAttribute;->descriptor(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v0}, Ljavassist/bytecode/LocalVariableAttribute;->variableName(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v0}, Ljavassist/bytecode/LocalVariableAttribute;->index(I)I

    move-result v8

    iget-object v9, p0, Ljavassist/compiler/Javac;->stable:Ljavassist/compiler/SymbolTable;

    invoke-virtual {v5, v6, v7, v8, v9}, Ljavassist/compiler/JvstCodeGen;->recordVariable(Ljava/lang/String;Ljava/lang/String;ILjavassist/compiler/SymbolTable;)V

    .line 280
    :cond_34
    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    .line 288
    .end local v1    # "len":I
    .end local v3    # "start":I
    :cond_37
    const/4 v5, 0x1

    goto :goto_b
.end method

.method public recordParamNames(Ljavassist/bytecode/CodeAttribute;I)Z
    .registers 11
    .param p1, "ca"    # Ljavassist/bytecode/CodeAttribute;
    .param p2, "numOfLocalVars"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 303
    const-string v4, "LocalVariableTable"

    invoke-virtual {p1, v4}, Ljavassist/bytecode/CodeAttribute;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v3

    check-cast v3, Ljavassist/bytecode/LocalVariableAttribute;

    .line 306
    .local v3, "va":Ljavassist/bytecode/LocalVariableAttribute;
    if-nez v3, :cond_c

    .line 307
    const/4 v4, 0x0

    .line 317
    :goto_b
    return v4

    .line 309
    :cond_c
    invoke-virtual {v3}, Ljavassist/bytecode/LocalVariableAttribute;->tableLength()I

    move-result v2

    .line 310
    .local v2, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_11
    if-ge v0, v2, :cond_2b

    .line 311
    invoke-virtual {v3, v0}, Ljavassist/bytecode/LocalVariableAttribute;->index(I)I

    move-result v1

    .line 312
    .local v1, "index":I
    if-ge v1, p2, :cond_28

    .line 313
    iget-object v4, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    invoke-virtual {v3, v0}, Ljavassist/bytecode/LocalVariableAttribute;->descriptor(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v0}, Ljavassist/bytecode/LocalVariableAttribute;->variableName(I)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Ljavassist/compiler/Javac;->stable:Ljavassist/compiler/SymbolTable;

    invoke-virtual {v4, v5, v6, v1, v7}, Ljavassist/compiler/JvstCodeGen;->recordVariable(Ljava/lang/String;Ljava/lang/String;ILjavassist/compiler/SymbolTable;)V

    .line 310
    :cond_28
    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    .line 317
    .end local v1    # "index":I
    :cond_2b
    const/4 v4, 0x1

    goto :goto_b
.end method

.method public recordParams(Ljava/lang/String;[Ljavassist/CtClass;ZIZ)I
    .registers 16
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "params"    # [Ljavassist/CtClass;
    .param p3, "use0"    # Z
    .param p4, "varNo"    # I
    .param p5, "isStatic"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 362
    iget-object v0, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    const-string v3, "$"

    const-string v4, "$args"

    const-string v5, "$$"

    iget-object v9, p0, Ljavassist/compiler/Javac;->stable:Ljavassist/compiler/SymbolTable;

    move-object v1, p2

    move v2, p5

    move v6, p3

    move v7, p4

    move-object v8, p1

    invoke-virtual/range {v0 .. v9}, Ljavassist/compiler/JvstCodeGen;->recordParams([Ljavassist/CtClass;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;Ljavassist/compiler/SymbolTable;)I

    move-result v0

    return v0
.end method

.method public recordParams([Ljavassist/CtClass;Z)I
    .registers 10
    .param p1, "params"    # [Ljavassist/CtClass;
    .param p2, "isStatic"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 334
    iget-object v0, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    const-string v3, "$"

    const-string v4, "$args"

    const-string v5, "$$"

    iget-object v6, p0, Ljavassist/compiler/Javac;->stable:Ljavassist/compiler/SymbolTable;

    move-object v1, p1

    move v2, p2

    invoke-virtual/range {v0 .. v6}, Ljavassist/compiler/JvstCodeGen;->recordParams([Ljavassist/CtClass;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljavassist/compiler/SymbolTable;)I

    move-result v0

    return v0
.end method

.method public recordProceed(Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 435
    new-instance v2, Ljavassist/compiler/Parser;

    new-instance v4, Ljavassist/compiler/Lex;

    invoke-direct {v4, p1}, Ljavassist/compiler/Lex;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v4}, Ljavassist/compiler/Parser;-><init>(Ljavassist/compiler/Lex;)V

    .line 436
    .local v2, "p":Ljavassist/compiler/Parser;
    iget-object v4, p0, Ljavassist/compiler/Javac;->stable:Ljavassist/compiler/SymbolTable;

    invoke-virtual {v2, v4}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v3

    .line 437
    .local v3, "texpr":Ljavassist/compiler/ast/ASTree;
    move-object v1, p2

    .line 439
    .local v1, "m":Ljava/lang/String;
    new-instance v0, Ljavassist/compiler/Javac$1;

    invoke-direct {v0, p0, v1, v3}, Ljavassist/compiler/Javac$1;-><init>(Ljavassist/compiler/Javac;Ljava/lang/String;Ljavassist/compiler/ast/ASTree;)V

    .line 465
    .local v0, "h":Ljavassist/compiler/ProceedHandler;
    iget-object v4, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    const-string v5, "$proceed"

    invoke-virtual {v4, v0, v5}, Ljavassist/compiler/JvstCodeGen;->setProceedHandler(Ljavassist/compiler/ProceedHandler;Ljava/lang/String;)V

    .line 466
    return-void
.end method

.method public recordProceed(Ljavassist/compiler/ProceedHandler;)V
    .registers 4
    .param p1, "h"    # Ljavassist/compiler/ProceedHandler;

    .prologue
    .line 551
    iget-object v0, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    const-string v1, "$proceed"

    invoke-virtual {v0, p1, v1}, Ljavassist/compiler/JvstCodeGen;->setProceedHandler(Ljavassist/compiler/ProceedHandler;Ljava/lang/String;)V

    .line 552
    return-void
.end method

.method public recordReturnType(Ljavassist/CtClass;Z)I
    .registers 7
    .param p1, "type"    # Ljavassist/CtClass;
    .param p2, "useResultVar"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 396
    iget-object v0, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    invoke-virtual {v0, p1}, Ljavassist/compiler/JvstCodeGen;->recordType(Ljavassist/CtClass;)V

    .line 397
    iget-object v1, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    const-string v2, "$r"

    if-eqz p2, :cond_14

    const-string v0, "$_"

    :goto_d
    iget-object v3, p0, Ljavassist/compiler/Javac;->stable:Ljavassist/compiler/SymbolTable;

    invoke-virtual {v1, p1, v2, v0, v3}, Ljavassist/compiler/JvstCodeGen;->recordReturnType(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;Ljavassist/compiler/SymbolTable;)I

    move-result v0

    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public recordSpecialProceed(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 13
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "classname"    # Ljava/lang/String;
    .param p3, "methodname"    # Ljava/lang/String;
    .param p4, "descriptor"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 523
    new-instance v6, Ljavassist/compiler/Parser;

    new-instance v1, Ljavassist/compiler/Lex;

    invoke-direct {v1, p1}, Ljavassist/compiler/Lex;-><init>(Ljava/lang/String;)V

    invoke-direct {v6, v1}, Ljavassist/compiler/Parser;-><init>(Ljavassist/compiler/Lex;)V

    .line 524
    .local v6, "p":Ljavassist/compiler/Parser;
    iget-object v1, p0, Ljavassist/compiler/Javac;->stable:Ljavassist/compiler/SymbolTable;

    invoke-virtual {v6, v1}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    .line 525
    .local v2, "texpr":Ljavassist/compiler/ast/ASTree;
    move-object v3, p2

    .line 526
    .local v3, "cname":Ljava/lang/String;
    move-object v4, p3

    .line 527
    .local v4, "method":Ljava/lang/String;
    move-object v5, p4

    .line 529
    .local v5, "desc":Ljava/lang/String;
    new-instance v0, Ljavassist/compiler/Javac$3;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Ljavassist/compiler/Javac$3;-><init>(Ljavassist/compiler/Javac;Ljavassist/compiler/ast/ASTree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 544
    .local v0, "h":Ljavassist/compiler/ProceedHandler;
    iget-object v1, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    const-string v7, "$proceed"

    invoke-virtual {v1, v0, v7}, Ljavassist/compiler/JvstCodeGen;->setProceedHandler(Ljavassist/compiler/ProceedHandler;Ljava/lang/String;)V

    .line 545
    return-void
.end method

.method public recordStaticProceed(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "targetClass"    # Ljava/lang/String;
    .param p2, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 480
    move-object v0, p1

    .line 481
    .local v0, "c":Ljava/lang/String;
    move-object v2, p2

    .line 483
    .local v2, "m":Ljava/lang/String;
    new-instance v1, Ljavassist/compiler/Javac$2;

    invoke-direct {v1, p0, v0, v2}, Ljavassist/compiler/Javac$2;-><init>(Ljavassist/compiler/Javac;Ljava/lang/String;Ljava/lang/String;)V

    .line 505
    .local v1, "h":Ljavassist/compiler/ProceedHandler;
    iget-object v3, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    const-string v4, "$proceed"

    invoke-virtual {v3, v1, v4}, Ljavassist/compiler/JvstCodeGen;->setProceedHandler(Ljavassist/compiler/ProceedHandler;Ljava/lang/String;)V

    .line 506
    return-void
.end method

.method public recordType(Ljavassist/CtClass;)V
    .registers 3
    .param p1, "t"    # Ljavassist/CtClass;

    .prologue
    .line 408
    iget-object v0, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    invoke-virtual {v0, p1}, Ljavassist/compiler/JvstCodeGen;->recordType(Ljavassist/CtClass;)V

    .line 409
    return-void
.end method

.method public recordVariable(Ljavassist/CtClass;Ljava/lang/String;)I
    .registers 5
    .param p1, "type"    # Ljavassist/CtClass;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 420
    iget-object v0, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    iget-object v1, p0, Ljavassist/compiler/Javac;->stable:Ljavassist/compiler/SymbolTable;

    invoke-virtual {v0, p1, p2, v1}, Ljavassist/compiler/JvstCodeGen;->recordVariable(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/compiler/SymbolTable;)I

    move-result v0

    return v0
.end method

.method public setMaxLocals(I)V
    .registers 3
    .param p1, "max"    # I

    .prologue
    .line 376
    iget-object v0, p0, Ljavassist/compiler/Javac;->gen:Ljavassist/compiler/JvstCodeGen;

    invoke-virtual {v0, p1}, Ljavassist/compiler/JvstCodeGen;->setMaxLocals(I)V

    .line 377
    return-void
.end method
