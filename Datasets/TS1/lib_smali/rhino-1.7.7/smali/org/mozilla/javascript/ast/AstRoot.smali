.class public Lorg/mozilla/javascript/ast/AstRoot;
.super Lorg/mozilla/javascript/ast/ScriptNode;
.source "AstRoot.java"


# instance fields
.field private comments:Ljava/util/SortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/SortedSet",
            "<",
            "Lorg/mozilla/javascript/ast/Comment;",
            ">;"
        }
    .end annotation
.end field

.field private inStrictMode:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/ScriptNode;-><init>()V

    .line 31
    const/16 v0, 0x88

    iput v0, p0, Lorg/mozilla/javascript/ast/AstRoot;->type:I

    .line 35
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "pos"    # I

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/ScriptNode;-><init>(I)V

    .line 31
    const/16 v0, 0x88

    iput v0, p0, Lorg/mozilla/javascript/ast/AstRoot;->type:I

    .line 39
    return-void
.end method


# virtual methods
.method public addComment(Lorg/mozilla/javascript/ast/Comment;)V
    .registers 4
    .param p1, "comment"    # Lorg/mozilla/javascript/ast/Comment;

    .prologue
    .line 71
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/AstRoot;->assertNotNull(Ljava/lang/Object;)V

    .line 72
    iget-object v0, p0, Lorg/mozilla/javascript/ast/AstRoot;->comments:Ljava/util/SortedSet;

    if-nez v0, :cond_13

    .line 73
    new-instance v0, Ljava/util/TreeSet;

    new-instance v1, Lorg/mozilla/javascript/ast/AstNode$PositionComparator;

    invoke-direct {v1}, Lorg/mozilla/javascript/ast/AstNode$PositionComparator;-><init>()V

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lorg/mozilla/javascript/ast/AstRoot;->comments:Ljava/util/SortedSet;

    .line 75
    :cond_13
    iget-object v0, p0, Lorg/mozilla/javascript/ast/AstRoot;->comments:Ljava/util/SortedSet;

    invoke-interface {v0, p1}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    .line 76
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/Comment;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 77
    return-void
.end method

.method public checkParentLinks()V
    .registers 2

    .prologue
    .line 139
    new-instance v0, Lorg/mozilla/javascript/ast/AstRoot$1;

    invoke-direct {v0, p0}, Lorg/mozilla/javascript/ast/AstRoot$1;-><init>(Lorg/mozilla/javascript/ast/AstRoot;)V

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/ast/AstRoot;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 151
    return-void
.end method

.method public debugPrint()Ljava/lang/String;
    .registers 4

    .prologue
    .line 128
    new-instance v0, Lorg/mozilla/javascript/ast/AstNode$DebugPrintVisitor;

    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x3e8

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/ast/AstNode$DebugPrintVisitor;-><init>(Ljava/lang/StringBuilder;)V

    .line 129
    .local v0, "dpv":Lorg/mozilla/javascript/ast/AstNode$DebugPrintVisitor;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/ast/AstRoot;->visitAll(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 130
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/AstNode$DebugPrintVisitor;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getComments()Ljava/util/SortedSet;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/SortedSet",
            "<",
            "Lorg/mozilla/javascript/ast/Comment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 46
    iget-object v0, p0, Lorg/mozilla/javascript/ast/AstRoot;->comments:Ljava/util/SortedSet;

    return-object v0
.end method

.method public isInStrictMode()Z
    .registers 2

    .prologue
    .line 84
    iget-boolean v0, p0, Lorg/mozilla/javascript/ast/AstRoot;->inStrictMode:Z

    return v0
.end method

.method public setComments(Ljava/util/SortedSet;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/SortedSet",
            "<",
            "Lorg/mozilla/javascript/ast/Comment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p1, "comments":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Lorg/mozilla/javascript/ast/Comment;>;"
    if-nez p1, :cond_6

    .line 56
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/mozilla/javascript/ast/AstRoot;->comments:Ljava/util/SortedSet;

    .line 63
    :cond_5
    return-void

    .line 58
    :cond_6
    iget-object v2, p0, Lorg/mozilla/javascript/ast/AstRoot;->comments:Ljava/util/SortedSet;

    if-eqz v2, :cond_f

    .line 59
    iget-object v2, p0, Lorg/mozilla/javascript/ast/AstRoot;->comments:Ljava/util/SortedSet;

    invoke-interface {v2}, Ljava/util/SortedSet;->clear()V

    .line 60
    :cond_f
    invoke-interface {p1}, Ljava/util/SortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/ast/Comment;

    .line 61
    .local v0, "c":Lorg/mozilla/javascript/ast/Comment;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/ast/AstRoot;->addComment(Lorg/mozilla/javascript/ast/Comment;)V

    goto :goto_13
.end method

.method public setInStrictMode(Z)V
    .registers 2
    .param p1, "inStrictMode"    # Z

    .prologue
    .line 80
    iput-boolean p1, p0, Lorg/mozilla/javascript/ast/AstRoot;->inStrictMode:Z

    .line 81
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .registers 6
    .param p1, "depth"    # I

    .prologue
    .line 116
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 117
    .local v2, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/AstRoot;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/Node;

    .line 118
    .local v1, "node":Lorg/mozilla/javascript/Node;
    check-cast v1, Lorg/mozilla/javascript/ast/AstNode;

    .end local v1    # "node":Lorg/mozilla/javascript/Node;
    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_9

    .line 120
    :cond_1f
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public visitAll(Lorg/mozilla/javascript/ast/NodeVisitor;)V
    .registers 2
    .param p1, "visitor"    # Lorg/mozilla/javascript/ast/NodeVisitor;

    .prologue
    .line 110
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/AstRoot;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 111
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/AstRoot;->visitComments(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 112
    return-void
.end method

.method public visitComments(Lorg/mozilla/javascript/ast/NodeVisitor;)V
    .registers 5
    .param p1, "visitor"    # Lorg/mozilla/javascript/ast/NodeVisitor;

    .prologue
    .line 95
    iget-object v2, p0, Lorg/mozilla/javascript/ast/AstRoot;->comments:Ljava/util/SortedSet;

    if-eqz v2, :cond_1a

    .line 96
    iget-object v2, p0, Lorg/mozilla/javascript/ast/AstRoot;->comments:Ljava/util/SortedSet;

    invoke-interface {v2}, Ljava/util/SortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/ast/Comment;

    .line 97
    .local v0, "c":Lorg/mozilla/javascript/ast/Comment;
    invoke-interface {p1, v0}, Lorg/mozilla/javascript/ast/NodeVisitor;->visit(Lorg/mozilla/javascript/ast/AstNode;)Z

    goto :goto_a

    .line 100
    .end local v0    # "c":Lorg/mozilla/javascript/ast/Comment;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_1a
    return-void
.end method
