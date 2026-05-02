.class public Ljavassist/compiler/ast/Declarator;
.super Ljavassist/compiler/ast/ASTList;
.source "Declarator.java"

# interfaces
.implements Ljavassist/compiler/TokenId;


# instance fields
.field protected arrayDim:I

.field protected localVar:I

.field protected qualifiedClass:Ljava/lang/String;

.field protected varType:I


# direct methods
.method public constructor <init>(II)V
    .registers 5
    .param p1, "type"    # I
    .param p2, "dim"    # I

    .prologue
    const/4 v1, 0x0

    .line 32
    invoke-direct {p0, v1}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;)V

    .line 33
    iput p1, p0, Ljavassist/compiler/ast/Declarator;->varType:I

    .line 34
    iput p2, p0, Ljavassist/compiler/ast/Declarator;->arrayDim:I

    .line 35
    const/4 v0, -0x1

    iput v0, p0, Ljavassist/compiler/ast/Declarator;->localVar:I

    .line 36
    iput-object v1, p0, Ljavassist/compiler/ast/Declarator;->qualifiedClass:Ljava/lang/String;

    .line 37
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;IILjavassist/compiler/ast/Symbol;)V
    .registers 7
    .param p1, "type"    # I
    .param p2, "jvmClassName"    # Ljava/lang/String;
    .param p3, "dim"    # I
    .param p4, "var"    # I
    .param p5, "sym"    # Ljavassist/compiler/ast/Symbol;

    .prologue
    const/4 v0, 0x0

    .line 51
    invoke-direct {p0, v0}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;)V

    .line 52
    iput p1, p0, Ljavassist/compiler/ast/Declarator;->varType:I

    .line 53
    iput p3, p0, Ljavassist/compiler/ast/Declarator;->arrayDim:I

    .line 54
    iput p4, p0, Ljavassist/compiler/ast/Declarator;->localVar:I

    .line 55
    iput-object p2, p0, Ljavassist/compiler/ast/Declarator;->qualifiedClass:Ljava/lang/String;

    .line 56
    invoke-virtual {p0, p5}, Ljavassist/compiler/ast/Declarator;->setLeft(Ljavassist/compiler/ast/ASTree;)V

    .line 57
    invoke-static {p0, v0}, Ljavassist/compiler/ast/Declarator;->append(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/ASTList;

    .line 58
    return-void
.end method

.method public constructor <init>(Ljavassist/compiler/ast/ASTList;I)V
    .registers 4
    .param p1, "className"    # Ljavassist/compiler/ast/ASTList;
    .param p2, "dim"    # I

    .prologue
    .line 40
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;)V

    .line 41
    const/16 v0, 0x133

    iput v0, p0, Ljavassist/compiler/ast/Declarator;->varType:I

    .line 42
    iput p2, p0, Ljavassist/compiler/ast/Declarator;->arrayDim:I

    .line 43
    const/4 v0, -0x1

    iput v0, p0, Ljavassist/compiler/ast/Declarator;->localVar:I

    .line 44
    const/16 v0, 0x2f

    invoke-static {p1, v0}, Ljavassist/compiler/ast/Declarator;->astToClassName(Ljavassist/compiler/ast/ASTList;C)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/compiler/ast/Declarator;->qualifiedClass:Ljava/lang/String;

    .line 45
    return-void
.end method

.method public static astToClassName(Ljavassist/compiler/ast/ASTList;C)Ljava/lang/String;
    .registers 4
    .param p0, "name"    # Ljavassist/compiler/ast/ASTList;
    .param p1, "sep"    # C

    .prologue
    .line 104
    if-nez p0, :cond_4

    .line 105
    const/4 v1, 0x0

    .line 109
    :goto_3
    return-object v1

    .line 107
    :cond_4
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 108
    .local v0, "sbuf":Ljava/lang/StringBuffer;
    invoke-static {v0, p0, p1}, Ljavassist/compiler/ast/Declarator;->astToClassName(Ljava/lang/StringBuffer;Ljavassist/compiler/ast/ASTList;C)V

    .line 109
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_3
.end method

.method private static astToClassName(Ljava/lang/StringBuffer;Ljavassist/compiler/ast/ASTList;C)V
    .registers 5
    .param p0, "sbuf"    # Ljava/lang/StringBuffer;
    .param p1, "name"    # Ljavassist/compiler/ast/ASTList;
    .param p2, "sep"    # C

    .prologue
    .line 115
    :goto_0
    invoke-virtual {p1}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 116
    .local v0, "h":Ljavassist/compiler/ast/ASTree;
    instance-of v1, v0, Ljavassist/compiler/ast/Symbol;

    if-eqz v1, :cond_18

    .line 117
    check-cast v0, Ljavassist/compiler/ast/Symbol;

    .end local v0    # "h":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {v0}, Ljavassist/compiler/ast/Symbol;->get()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 121
    :cond_11
    :goto_11
    invoke-virtual {p1}, Ljavassist/compiler/ast/ASTList;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object p1

    .line 122
    if-nez p1, :cond_22

    .line 127
    return-void

    .line 118
    .restart local v0    # "h":Ljavassist/compiler/ast/ASTree;
    :cond_18
    instance-of v1, v0, Ljavassist/compiler/ast/ASTList;

    if-eqz v1, :cond_11

    .line 119
    check-cast v0, Ljavassist/compiler/ast/ASTList;

    .end local v0    # "h":Ljavassist/compiler/ast/ASTree;
    invoke-static {p0, v0, p2}, Ljavassist/compiler/ast/Declarator;->astToClassName(Ljava/lang/StringBuffer;Ljavassist/compiler/ast/ASTList;C)V

    goto :goto_11

    .line 125
    :cond_22
    invoke-virtual {p0, p2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_0
.end method


# virtual methods
.method public accept(Ljavassist/compiler/ast/Visitor;)V
    .registers 2
    .param p1, "v"    # Ljavassist/compiler/ast/Visitor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 100
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/Visitor;->atDeclarator(Ljavassist/compiler/ast/Declarator;)V

    .line 101
    return-void
.end method

.method public addArrayDim(I)V
    .registers 3
    .param p1, "d"    # I

    .prologue
    .line 75
    iget v0, p0, Ljavassist/compiler/ast/Declarator;->arrayDim:I

    add-int/2addr v0, p1

    iput v0, p0, Ljavassist/compiler/ast/Declarator;->arrayDim:I

    return-void
.end method

.method public getArrayDim()I
    .registers 2

    .prologue
    .line 73
    iget v0, p0, Ljavassist/compiler/ast/Declarator;->arrayDim:I

    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Ljavassist/compiler/ast/Declarator;->qualifiedClass:Ljava/lang/String;

    return-object v0
.end method

.method public getInitializer()Ljavassist/compiler/ast/ASTree;
    .registers 3

    .prologue
    .line 86
    invoke-virtual {p0}, Ljavassist/compiler/ast/Declarator;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    .line 87
    .local v0, "t":Ljavassist/compiler/ast/ASTList;
    if-eqz v0, :cond_b

    .line 88
    invoke-virtual {v0}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    .line 90
    :goto_a
    return-object v1

    :cond_b
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public getLocalVar()I
    .registers 2

    .prologue
    .line 95
    iget v0, p0, Ljavassist/compiler/ast/Declarator;->localVar:I

    return v0
.end method

.method public getTag()Ljava/lang/String;
    .registers 2

    .prologue
    .line 97
    const-string v0, "decl"

    return-object v0
.end method

.method public getType()I
    .registers 2

    .prologue
    .line 71
    iget v0, p0, Ljavassist/compiler/ast/Declarator;->varType:I

    return v0
.end method

.method public getVariable()Ljavassist/compiler/ast/Symbol;
    .registers 2

    .prologue
    .line 81
    invoke-virtual {p0}, Ljavassist/compiler/ast/Declarator;->getLeft()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    check-cast v0, Ljavassist/compiler/ast/Symbol;

    return-object v0
.end method

.method public make(Ljavassist/compiler/ast/Symbol;ILjavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/Declarator;
    .registers 7
    .param p1, "sym"    # Ljavassist/compiler/ast/Symbol;
    .param p2, "dim"    # I
    .param p3, "init"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 61
    new-instance v0, Ljavassist/compiler/ast/Declarator;

    iget v1, p0, Ljavassist/compiler/ast/Declarator;->varType:I

    iget v2, p0, Ljavassist/compiler/ast/Declarator;->arrayDim:I

    add-int/2addr v2, p2

    invoke-direct {v0, v1, v2}, Ljavassist/compiler/ast/Declarator;-><init>(II)V

    .line 62
    .local v0, "d":Ljavassist/compiler/ast/Declarator;
    iget-object v1, p0, Ljavassist/compiler/ast/Declarator;->qualifiedClass:Ljava/lang/String;

    iput-object v1, v0, Ljavassist/compiler/ast/Declarator;->qualifiedClass:Ljava/lang/String;

    .line 63
    invoke-virtual {v0, p1}, Ljavassist/compiler/ast/Declarator;->setLeft(Ljavassist/compiler/ast/ASTree;)V

    .line 64
    invoke-static {v0, p3}, Ljavassist/compiler/ast/Declarator;->append(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/ASTList;

    .line 65
    return-object v0
.end method

.method public setClassName(Ljava/lang/String;)V
    .registers 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 79
    iput-object p1, p0, Ljavassist/compiler/ast/Declarator;->qualifiedClass:Ljava/lang/String;

    return-void
.end method

.method public setLocalVar(I)V
    .registers 2
    .param p1, "n"    # I

    .prologue
    .line 93
    iput p1, p0, Ljavassist/compiler/ast/Declarator;->localVar:I

    return-void
.end method

.method public setVariable(Ljavassist/compiler/ast/Symbol;)V
    .registers 2
    .param p1, "sym"    # Ljavassist/compiler/ast/Symbol;

    .prologue
    .line 83
    invoke-virtual {p0, p1}, Ljavassist/compiler/ast/Declarator;->setLeft(Ljavassist/compiler/ast/ASTree;)V

    return-void
.end method
