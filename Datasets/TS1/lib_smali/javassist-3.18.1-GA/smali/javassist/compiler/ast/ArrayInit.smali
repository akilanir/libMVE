.class public Ljavassist/compiler/ast/ArrayInit;
.super Ljavassist/compiler/ast/ASTList;
.source "ArrayInit.java"


# direct methods
.method public constructor <init>(Ljavassist/compiler/ast/ASTree;)V
    .registers 2
    .param p1, "firstElement"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;)V

    .line 27
    return-void
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
    .line 29
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/Visitor;->atArrayInit(Ljavassist/compiler/ast/ArrayInit;)V

    return-void
.end method

.method public getTag()Ljava/lang/String;
    .registers 2

    .prologue
    .line 31
    const-string v0, "array"

    return-object v0
.end method
