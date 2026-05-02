.class public Lorg/mozilla/javascript/ast/Name;
.super Lorg/mozilla/javascript/ast/AstNode;
.source "Name.java"


# instance fields
.field private identifier:Ljava/lang/String;

.field private scope:Lorg/mozilla/javascript/ast/Scope;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/AstNode;-><init>()V

    .line 26
    const/16 v0, 0x27

    iput v0, p0, Lorg/mozilla/javascript/ast/Name;->type:I

    .line 30
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "pos"    # I

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/AstNode;-><init>(I)V

    .line 26
    const/16 v0, 0x27

    iput v0, p0, Lorg/mozilla/javascript/ast/Name;->type:I

    .line 34
    return-void
.end method

.method public constructor <init>(II)V
    .registers 4
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 37
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/AstNode;-><init>(II)V

    .line 26
    const/16 v0, 0x27

    iput v0, p0, Lorg/mozilla/javascript/ast/Name;->type:I

    .line 38
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;)V
    .registers 5
    .param p1, "pos"    # I
    .param p2, "len"    # I
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/AstNode;-><init>(II)V

    .line 26
    const/16 v0, 0x27

    iput v0, p0, Lorg/mozilla/javascript/ast/Name;->type:I

    .line 48
    invoke-virtual {p0, p3}, Lorg/mozilla/javascript/ast/Name;->setIdentifier(Ljava/lang/String;)V

    .line 49
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .registers 4
    .param p1, "pos"    # I
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/AstNode;-><init>(I)V

    .line 26
    const/16 v0, 0x27

    iput v0, p0, Lorg/mozilla/javascript/ast/Name;->type:I

    .line 53
    invoke-virtual {p0, p2}, Lorg/mozilla/javascript/ast/Name;->setIdentifier(Ljava/lang/String;)V

    .line 54
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/ast/Name;->setLength(I)V

    .line 55
    return-void
.end method


# virtual methods
.method public getDefiningScope()Lorg/mozilla/javascript/ast/Scope;
    .registers 4

    .prologue
    .line 107
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/Name;->getEnclosingScope()Lorg/mozilla/javascript/ast/Scope;

    move-result-object v0

    .line 108
    .local v0, "enclosing":Lorg/mozilla/javascript/ast/Scope;
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    .line 109
    .local v1, "name":Ljava/lang/String;
    if-nez v0, :cond_c

    const/4 v2, 0x0

    :goto_b
    return-object v2

    :cond_c
    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ast/Scope;->getDefiningScope(Ljava/lang/String;)Lorg/mozilla/javascript/ast/Scope;

    move-result-object v2

    goto :goto_b
.end method

.method public getIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lorg/mozilla/javascript/ast/Name;->identifier:Ljava/lang/String;

    return-object v0
.end method

.method public getScope()Lorg/mozilla/javascript/ast/Scope;
    .registers 2

    .prologue
    .line 98
    iget-object v0, p0, Lorg/mozilla/javascript/ast/Name;->scope:Lorg/mozilla/javascript/ast/Scope;

    return-object v0
.end method

.method public isLocalName()Z
    .registers 3

    .prologue
    .line 126
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/Name;->getDefiningScope()Lorg/mozilla/javascript/ast/Scope;

    move-result-object v0

    .line 127
    .local v0, "scope":Lorg/mozilla/javascript/ast/Scope;
    if-eqz v0, :cond_e

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/Scope;->getParentScope()Lorg/mozilla/javascript/ast/Scope;

    move-result-object v1

    if-eqz v1, :cond_e

    const/4 v1, 0x1

    :goto_d
    return v1

    :cond_e
    const/4 v1, 0x0

    goto :goto_d
.end method

.method public length()I
    .registers 2

    .prologue
    .line 137
    iget-object v0, p0, Lorg/mozilla/javascript/ast/Name;->identifier:Ljava/lang/String;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lorg/mozilla/javascript/ast/Name;->identifier:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    goto :goto_5
.end method

.method public setIdentifier(Ljava/lang/String;)V
    .registers 3
    .param p1, "identifier"    # Ljava/lang/String;

    .prologue
    .line 69
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/Name;->assertNotNull(Ljava/lang/Object;)V

    .line 70
    iput-object p1, p0, Lorg/mozilla/javascript/ast/Name;->identifier:Ljava/lang/String;

    .line 71
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/ast/Name;->setLength(I)V

    .line 72
    return-void
.end method

.method public setScope(Lorg/mozilla/javascript/ast/Scope;)V
    .registers 2
    .param p1, "s"    # Lorg/mozilla/javascript/ast/Scope;

    .prologue
    .line 86
    iput-object p1, p0, Lorg/mozilla/javascript/ast/Name;->scope:Lorg/mozilla/javascript/ast/Scope;

    .line 87
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .registers 4
    .param p1, "depth"    # I

    .prologue
    .line 142
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/Name;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lorg/mozilla/javascript/ast/Name;->identifier:Ljava/lang/String;

    if-nez v0, :cond_1c

    const-string v0, "<null>"

    :goto_13
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1c
    iget-object v0, p0, Lorg/mozilla/javascript/ast/Name;->identifier:Ljava/lang/String;

    goto :goto_13
.end method

.method public visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V
    .registers 2
    .param p1, "v"    # Lorg/mozilla/javascript/ast/NodeVisitor;

    .prologue
    .line 150
    invoke-interface {p1, p0}, Lorg/mozilla/javascript/ast/NodeVisitor;->visit(Lorg/mozilla/javascript/ast/AstNode;)Z

    .line 151
    return-void
.end method
