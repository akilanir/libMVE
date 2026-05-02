.class public Ljavassist/compiler/ast/Keyword;
.super Ljavassist/compiler/ast/ASTree;
.source "Keyword.java"


# instance fields
.field protected tokenId:I


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "token"    # I

    .prologue
    .line 27
    invoke-direct {p0}, Ljavassist/compiler/ast/ASTree;-><init>()V

    .line 28
    iput p1, p0, Ljavassist/compiler/ast/Keyword;->tokenId:I

    .line 29
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
    .line 35
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/Visitor;->atKeyword(Ljavassist/compiler/ast/Keyword;)V

    return-void
.end method

.method public get()I
    .registers 2

    .prologue
    .line 31
    iget v0, p0, Ljavassist/compiler/ast/Keyword;->tokenId:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "id:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ljavassist/compiler/ast/Keyword;->tokenId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
