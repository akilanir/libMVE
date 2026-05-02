.class public abstract Ljavassist/compiler/ast/ASTree;
.super Ljava/lang/Object;
.source "ASTree.java"

# interfaces
.implements Ljava/io/Serializable;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract accept(Ljavassist/compiler/ast/Visitor;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation
.end method

.method public getLeft()Ljavassist/compiler/ast/ASTree;
    .registers 2

    .prologue
    .line 28
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRight()Ljavassist/compiler/ast/ASTree;
    .registers 2

    .prologue
    .line 30
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getTag()Ljava/lang/String;
    .registers 3

    .prologue
    .line 56
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 57
    .local v0, "name":Ljava/lang/String;
    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public setLeft(Ljavassist/compiler/ast/ASTree;)V
    .registers 2
    .param p1, "_left"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 32
    return-void
.end method

.method public setRight(Ljavassist/compiler/ast/ASTree;)V
    .registers 2
    .param p1, "_right"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 34
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 44
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 45
    .local v0, "sbuf":Ljava/lang/StringBuffer;
    const/16 v1, 0x3c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 46
    invoke-virtual {p0}, Ljavassist/compiler/ast/ASTree;->getTag()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 47
    const/16 v1, 0x3e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
