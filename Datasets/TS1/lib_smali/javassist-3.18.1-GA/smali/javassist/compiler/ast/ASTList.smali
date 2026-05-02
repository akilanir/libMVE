.class public Ljavassist/compiler/ast/ASTList;
.super Ljavassist/compiler/ast/ASTree;
.source "ASTList.java"


# instance fields
.field private left:Ljavassist/compiler/ast/ASTree;

.field private right:Ljavassist/compiler/ast/ASTList;


# direct methods
.method public constructor <init>(Ljavassist/compiler/ast/ASTree;)V
    .registers 3
    .param p1, "_head"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 34
    invoke-direct {p0}, Ljavassist/compiler/ast/ASTree;-><init>()V

    .line 35
    iput-object p1, p0, Ljavassist/compiler/ast/ASTList;->left:Ljavassist/compiler/ast/ASTree;

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/compiler/ast/ASTList;->right:Ljavassist/compiler/ast/ASTList;

    .line 37
    return-void
.end method

.method public constructor <init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V
    .registers 3
    .param p1, "_head"    # Ljavassist/compiler/ast/ASTree;
    .param p2, "_tail"    # Ljavassist/compiler/ast/ASTList;

    .prologue
    .line 29
    invoke-direct {p0}, Ljavassist/compiler/ast/ASTree;-><init>()V

    .line 30
    iput-object p1, p0, Ljavassist/compiler/ast/ASTList;->left:Ljavassist/compiler/ast/ASTree;

    .line 31
    iput-object p2, p0, Ljavassist/compiler/ast/ASTList;->right:Ljavassist/compiler/ast/ASTList;

    .line 32
    return-void
.end method

.method public static append(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/ASTList;
    .registers 3
    .param p0, "a"    # Ljavassist/compiler/ast/ASTList;
    .param p1, "b"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 142
    new-instance v0, Ljavassist/compiler/ast/ASTList;

    invoke-direct {v0, p1}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;)V

    invoke-static {p0, v0}, Ljavassist/compiler/ast/ASTList;->concat(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTList;)Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    return-object v0
.end method

.method public static concat(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTList;)Ljavassist/compiler/ast/ASTList;
    .registers 4
    .param p0, "a"    # Ljavassist/compiler/ast/ASTList;
    .param p1, "b"    # Ljavassist/compiler/ast/ASTList;

    .prologue
    .line 149
    if-nez p0, :cond_3

    .line 157
    .end local p1    # "b":Ljavassist/compiler/ast/ASTList;
    :goto_2
    return-object p1

    .line 152
    .restart local p1    # "b":Ljavassist/compiler/ast/ASTList;
    :cond_3
    move-object v0, p0

    .line 153
    .local v0, "list":Ljavassist/compiler/ast/ASTList;
    :goto_4
    iget-object v1, v0, Ljavassist/compiler/ast/ASTList;->right:Ljavassist/compiler/ast/ASTList;

    if-eqz v1, :cond_b

    .line 154
    iget-object v0, v0, Ljavassist/compiler/ast/ASTList;->right:Ljavassist/compiler/ast/ASTList;

    goto :goto_4

    .line 156
    :cond_b
    iput-object p1, v0, Ljavassist/compiler/ast/ASTList;->right:Ljavassist/compiler/ast/ASTList;

    move-object p1, p0

    .line 157
    goto :goto_2
.end method

.method public static length(Ljavassist/compiler/ast/ASTList;)I
    .registers 2
    .param p0, "list"    # Ljavassist/compiler/ast/ASTList;

    .prologue
    .line 98
    if-nez p0, :cond_4

    .line 99
    const/4 v0, 0x0

    .line 107
    :cond_3
    return v0

    .line 101
    :cond_4
    const/4 v0, 0x0

    .line 102
    .local v0, "n":I
    :goto_5
    if-eqz p0, :cond_3

    .line 103
    iget-object p0, p0, Ljavassist/compiler/ast/ASTList;->right:Ljavassist/compiler/ast/ASTList;

    .line 104
    add-int/lit8 v0, v0, 0x1

    goto :goto_5
.end method

.method public static make(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/ASTList;
    .registers 6
    .param p0, "e1"    # Ljavassist/compiler/ast/ASTree;
    .param p1, "e2"    # Ljavassist/compiler/ast/ASTree;
    .param p2, "e3"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 40
    new-instance v0, Ljavassist/compiler/ast/ASTList;

    new-instance v1, Ljavassist/compiler/ast/ASTList;

    new-instance v2, Ljavassist/compiler/ast/ASTList;

    invoke-direct {v2, p2}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;)V

    invoke-direct {v1, p1, v2}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    invoke-direct {v0, p0, v1}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

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
    .line 71
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/Visitor;->atASTList(Ljavassist/compiler/ast/ASTList;)V

    return-void
.end method

.method public getLeft()Ljavassist/compiler/ast/ASTree;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Ljavassist/compiler/ast/ASTList;->left:Ljavassist/compiler/ast/ASTree;

    return-object v0
.end method

.method public getRight()Ljavassist/compiler/ast/ASTree;
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Ljavassist/compiler/ast/ASTList;->right:Ljavassist/compiler/ast/ASTList;

    return-object v0
.end method

.method public head()Ljavassist/compiler/ast/ASTree;
    .registers 2

    .prologue
    .line 56
    iget-object v0, p0, Ljavassist/compiler/ast/ASTList;->left:Ljavassist/compiler/ast/ASTree;

    return-object v0
.end method

.method public length()I
    .registers 2

    .prologue
    .line 94
    invoke-static {p0}, Ljavassist/compiler/ast/ASTList;->length(Ljavassist/compiler/ast/ASTList;)I

    move-result v0

    return v0
.end method

.method public setHead(Ljavassist/compiler/ast/ASTree;)V
    .registers 2
    .param p1, "_head"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 59
    iput-object p1, p0, Ljavassist/compiler/ast/ASTList;->left:Ljavassist/compiler/ast/ASTree;

    .line 60
    return-void
.end method

.method public setLeft(Ljavassist/compiler/ast/ASTree;)V
    .registers 2
    .param p1, "_left"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 47
    iput-object p1, p0, Ljavassist/compiler/ast/ASTList;->left:Ljavassist/compiler/ast/ASTree;

    return-void
.end method

.method public setRight(Ljavassist/compiler/ast/ASTree;)V
    .registers 2
    .param p1, "_right"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 50
    check-cast p1, Ljavassist/compiler/ast/ASTList;

    .end local p1    # "_right":Ljavassist/compiler/ast/ASTree;
    iput-object p1, p0, Ljavassist/compiler/ast/ASTList;->right:Ljavassist/compiler/ast/ASTList;

    .line 51
    return-void
.end method

.method public setTail(Ljavassist/compiler/ast/ASTList;)V
    .registers 2
    .param p1, "_tail"    # Ljavassist/compiler/ast/ASTList;

    .prologue
    .line 68
    iput-object p1, p0, Ljavassist/compiler/ast/ASTList;->right:Ljavassist/compiler/ast/ASTList;

    .line 69
    return-void
.end method

.method public sublist(I)Ljavassist/compiler/ast/ASTList;
    .registers 4
    .param p1, "nth"    # I

    .prologue
    .line 117
    move-object v0, p0

    .local v0, "list":Ljavassist/compiler/ast/ASTList;
    move v1, p1

    .line 118
    .end local p1    # "nth":I
    .local v1, "nth":I
    :goto_2
    add-int/lit8 p1, v1, -0x1

    .end local v1    # "nth":I
    .restart local p1    # "nth":I
    if-lez v1, :cond_a

    .line 119
    iget-object v0, v0, Ljavassist/compiler/ast/ASTList;->right:Ljavassist/compiler/ast/ASTList;

    move v1, p1

    .end local p1    # "nth":I
    .restart local v1    # "nth":I
    goto :goto_2

    .line 121
    .end local v1    # "nth":I
    .restart local p1    # "nth":I
    :cond_a
    return-object v0
.end method

.method public subst(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Z
    .registers 5
    .param p1, "newObj"    # Ljavassist/compiler/ast/ASTree;
    .param p2, "oldObj"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 129
    move-object v0, p0

    .local v0, "list":Ljavassist/compiler/ast/ASTList;
    :goto_1
    if-eqz v0, :cond_e

    .line 130
    iget-object v1, v0, Ljavassist/compiler/ast/ASTList;->left:Ljavassist/compiler/ast/ASTree;

    if-ne v1, p2, :cond_b

    .line 131
    iput-object p1, v0, Ljavassist/compiler/ast/ASTList;->left:Ljavassist/compiler/ast/ASTree;

    .line 132
    const/4 v1, 0x1

    .line 135
    :goto_a
    return v1

    .line 129
    :cond_b
    iget-object v0, v0, Ljavassist/compiler/ast/ASTList;->right:Ljavassist/compiler/ast/ASTList;

    goto :goto_1

    .line 135
    :cond_e
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public tail()Ljavassist/compiler/ast/ASTList;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Ljavassist/compiler/ast/ASTList;->right:Ljavassist/compiler/ast/ASTList;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 74
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 75
    .local v2, "sbuf":Ljava/lang/StringBuffer;
    const-string v3, "(<"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 76
    invoke-virtual {p0}, Ljavassist/compiler/ast/ASTList;->getTag()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 77
    const/16 v3, 0x3e

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 78
    move-object v1, p0

    .line 79
    .local v1, "list":Ljavassist/compiler/ast/ASTList;
    :goto_17
    if-eqz v1, :cond_2f

    .line 80
    const/16 v3, 0x20

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 81
    iget-object v0, v1, Ljavassist/compiler/ast/ASTList;->left:Ljavassist/compiler/ast/ASTree;

    .line 82
    .local v0, "a":Ljavassist/compiler/ast/ASTree;
    if-nez v0, :cond_2a

    const-string v3, "<null>"

    :goto_24
    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 83
    iget-object v1, v1, Ljavassist/compiler/ast/ASTList;->right:Ljavassist/compiler/ast/ASTList;

    .line 84
    goto :goto_17

    .line 82
    :cond_2a
    invoke-virtual {v0}, Ljavassist/compiler/ast/ASTree;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_24

    .line 86
    .end local v0    # "a":Ljavassist/compiler/ast/ASTree;
    :cond_2f
    const/16 v3, 0x29

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 87
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
