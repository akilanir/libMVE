.class public Ljavassist/compiler/ast/Pair;
.super Ljavassist/compiler/ast/ASTree;
.source "Pair.java"


# instance fields
.field protected left:Ljavassist/compiler/ast/ASTree;

.field protected right:Ljavassist/compiler/ast/ASTree;


# direct methods
.method public constructor <init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)V
    .registers 3
    .param p1, "_left"    # Ljavassist/compiler/ast/ASTree;
    .param p2, "_right"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 28
    invoke-direct {p0}, Ljavassist/compiler/ast/ASTree;-><init>()V

    .line 29
    iput-object p1, p0, Ljavassist/compiler/ast/Pair;->left:Ljavassist/compiler/ast/ASTree;

    .line 30
    iput-object p2, p0, Ljavassist/compiler/ast/Pair;->right:Ljavassist/compiler/ast/ASTree;

    .line 31
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
    .line 33
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/Visitor;->atPair(Ljavassist/compiler/ast/Pair;)V

    return-void
.end method

.method public getLeft()Ljavassist/compiler/ast/ASTree;
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Ljavassist/compiler/ast/Pair;->left:Ljavassist/compiler/ast/ASTree;

    return-object v0
.end method

.method public getRight()Ljavassist/compiler/ast/ASTree;
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Ljavassist/compiler/ast/Pair;->right:Ljavassist/compiler/ast/ASTree;

    return-object v0
.end method

.method public setLeft(Ljavassist/compiler/ast/ASTree;)V
    .registers 2
    .param p1, "_left"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 49
    iput-object p1, p0, Ljavassist/compiler/ast/Pair;->left:Ljavassist/compiler/ast/ASTree;

    return-void
.end method

.method public setRight(Ljavassist/compiler/ast/ASTree;)V
    .registers 2
    .param p1, "_right"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 51
    iput-object p1, p0, Ljavassist/compiler/ast/Pair;->right:Ljavassist/compiler/ast/ASTree;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 36
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 37
    .local v0, "sbuf":Ljava/lang/StringBuffer;
    const-string v1, "(<Pair> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 38
    iget-object v1, p0, Ljavassist/compiler/ast/Pair;->left:Ljavassist/compiler/ast/ASTree;

    if-nez v1, :cond_2b

    const-string v1, "<null>"

    :goto_10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 39
    const-string v1, " . "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 40
    iget-object v1, p0, Ljavassist/compiler/ast/Pair;->right:Ljavassist/compiler/ast/ASTree;

    if-nez v1, :cond_32

    const-string v1, "<null>"

    :goto_1e
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 41
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 38
    :cond_2b
    iget-object v1, p0, Ljavassist/compiler/ast/Pair;->left:Ljavassist/compiler/ast/ASTree;

    invoke-virtual {v1}, Ljavassist/compiler/ast/ASTree;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_10

    .line 40
    :cond_32
    iget-object v1, p0, Ljavassist/compiler/ast/Pair;->right:Ljavassist/compiler/ast/ASTree;

    invoke-virtual {v1}, Ljavassist/compiler/ast/ASTree;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1e
.end method
