.class public Lorg/mozilla/javascript/ast/StringLiteral;
.super Lorg/mozilla/javascript/ast/AstNode;
.source "StringLiteral.java"


# instance fields
.field private quoteChar:C

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 25
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/AstNode;-><init>()V

    .line 22
    const/16 v0, 0x29

    iput v0, p0, Lorg/mozilla/javascript/ast/StringLiteral;->type:I

    .line 26
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "pos"    # I

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/AstNode;-><init>(I)V

    .line 22
    const/16 v0, 0x29

    iput v0, p0, Lorg/mozilla/javascript/ast/StringLiteral;->type:I

    .line 30
    return-void
.end method

.method public constructor <init>(II)V
    .registers 4
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 37
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/AstNode;-><init>(II)V

    .line 22
    const/16 v0, 0x29

    iput v0, p0, Lorg/mozilla/javascript/ast/StringLiteral;->type:I

    .line 38
    return-void
.end method


# virtual methods
.method public getQuoteCharacter()C
    .registers 2

    .prologue
    .line 72
    iget-char v0, p0, Lorg/mozilla/javascript/ast/StringLiteral;->quoteChar:C

    return v0
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 46
    iget-object v0, p0, Lorg/mozilla/javascript/ast/StringLiteral;->value:Ljava/lang/String;

    return-object v0
.end method

.method public getValue(Z)Ljava/lang/String;
    .registers 4
    .param p1, "includeQuotes"    # Z

    .prologue
    .line 53
    if-nez p1, :cond_5

    .line 54
    iget-object v0, p0, Lorg/mozilla/javascript/ast/StringLiteral;->value:Ljava/lang/String;

    .line 55
    :goto_4
    return-object v0

    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-char v1, p0, Lorg/mozilla/javascript/ast/StringLiteral;->quoteChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/mozilla/javascript/ast/StringLiteral;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-char v1, p0, Lorg/mozilla/javascript/ast/StringLiteral;->quoteChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4
.end method

.method public setQuoteCharacter(C)V
    .registers 2
    .param p1, "c"    # C

    .prologue
    .line 76
    iput-char p1, p0, Lorg/mozilla/javascript/ast/StringLiteral;->quoteChar:C

    .line 77
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .registers 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 64
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/StringLiteral;->assertNotNull(Ljava/lang/Object;)V

    .line 65
    iput-object p1, p0, Lorg/mozilla/javascript/ast/StringLiteral;->value:Ljava/lang/String;

    .line 66
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .registers 5
    .param p1, "depth"    # I

    .prologue
    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/StringLiteral;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-char v1, p0, Lorg/mozilla/javascript/ast/StringLiteral;->quoteChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/mozilla/javascript/ast/StringLiteral;->value:Ljava/lang/String;

    iget-char v2, p0, Lorg/mozilla/javascript/ast/StringLiteral;->quoteChar:C

    invoke-static {v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->escapeString(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-char v1, p0, Lorg/mozilla/javascript/ast/StringLiteral;->quoteChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V
    .registers 2
    .param p1, "v"    # Lorg/mozilla/javascript/ast/NodeVisitor;

    .prologue
    .line 93
    invoke-interface {p1, p0}, Lorg/mozilla/javascript/ast/NodeVisitor;->visit(Lorg/mozilla/javascript/ast/AstNode;)Z

    .line 94
    return-void
.end method
