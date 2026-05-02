.class public Ljavassist/compiler/ast/Stmnt;
.super Ljavassist/compiler/ast/ASTList;
.source "Stmnt.java"

# interfaces
.implements Ljavassist/compiler/TokenId;


# instance fields
.field protected operatorId:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "op"    # I

    .prologue
    .line 39
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Ljavassist/compiler/ast/Stmnt;-><init>(ILjavassist/compiler/ast/ASTree;)V

    .line 40
    return-void
.end method

.method public constructor <init>(ILjavassist/compiler/ast/ASTree;)V
    .registers 3
    .param p1, "op"    # I
    .param p2, "_head"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 34
    invoke-direct {p0, p2}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;)V

    .line 35
    iput p1, p0, Ljavassist/compiler/ast/Stmnt;->operatorId:I

    .line 36
    return-void
.end method

.method public constructor <init>(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V
    .registers 4
    .param p1, "op"    # I
    .param p2, "_head"    # Ljavassist/compiler/ast/ASTree;
    .param p3, "_tail"    # Ljavassist/compiler/ast/ASTList;

    .prologue
    .line 29
    invoke-direct {p0, p2, p3}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    .line 30
    iput p1, p0, Ljavassist/compiler/ast/Stmnt;->operatorId:I

    .line 31
    return-void
.end method

.method public static make(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/Stmnt;
    .registers 5
    .param p0, "op"    # I
    .param p1, "oprand1"    # Ljavassist/compiler/ast/ASTree;
    .param p2, "oprand2"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 43
    new-instance v0, Ljavassist/compiler/ast/Stmnt;

    new-instance v1, Ljavassist/compiler/ast/ASTList;

    invoke-direct {v1, p2}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;)V

    invoke-direct {v0, p0, p1, v1}, Ljavassist/compiler/ast/Stmnt;-><init>(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    return-object v0
.end method

.method public static make(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/Stmnt;
    .registers 7
    .param p0, "op"    # I
    .param p1, "op1"    # Ljavassist/compiler/ast/ASTree;
    .param p2, "op2"    # Ljavassist/compiler/ast/ASTree;
    .param p3, "op3"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 47
    new-instance v0, Ljavassist/compiler/ast/Stmnt;

    new-instance v1, Ljavassist/compiler/ast/ASTList;

    new-instance v2, Ljavassist/compiler/ast/ASTList;

    invoke-direct {v2, p3}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;)V

    invoke-direct {v1, p2, v2}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    invoke-direct {v0, p0, p1, v1}, Ljavassist/compiler/ast/Stmnt;-><init>(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    return-object v0
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
    .line 50
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/Visitor;->atStmnt(Ljavassist/compiler/ast/Stmnt;)V

    return-void
.end method

.method public getOperator()I
    .registers 2

    .prologue
    .line 52
    iget v0, p0, Ljavassist/compiler/ast/Stmnt;->operatorId:I

    return v0
.end method

.method protected getTag()Ljava/lang/String;
    .registers 3

    .prologue
    .line 55
    iget v0, p0, Ljavassist/compiler/ast/Stmnt;->operatorId:I

    const/16 v1, 0x80

    if-ge v0, v1, :cond_1d

    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "stmnt:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ljavassist/compiler/ast/Stmnt;->operatorId:I

    int-to-char v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 58
    :goto_1c
    return-object v0

    :cond_1d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "stmnt:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ljavassist/compiler/ast/Stmnt;->operatorId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1c
.end method
