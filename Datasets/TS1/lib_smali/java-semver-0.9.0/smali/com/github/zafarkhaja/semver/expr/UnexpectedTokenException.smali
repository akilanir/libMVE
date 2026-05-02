.class public Lcom/github/zafarkhaja/semver/expr/UnexpectedTokenException;
.super Lcom/github/zafarkhaja/semver/ParseException;
.source "UnexpectedTokenException.java"


# instance fields
.field private final expected:[Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

.field private final unexpected:Lcom/github/zafarkhaja/semver/expr/Lexer$Token;


# direct methods
.method varargs constructor <init>(Lcom/github/zafarkhaja/semver/expr/Lexer$Token;[Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)V
    .registers 3
    .param p1, "token"    # Lcom/github/zafarkhaja/semver/expr/Lexer$Token;
    .param p2, "expected"    # [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/ParseException;-><init>()V

    .line 68
    iput-object p1, p0, Lcom/github/zafarkhaja/semver/expr/UnexpectedTokenException;->unexpected:Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 69
    iput-object p2, p0, Lcom/github/zafarkhaja/semver/expr/UnexpectedTokenException;->expected:[Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 70
    return-void
.end method

.method constructor <init>(Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;)V
    .registers 3
    .param p1, "cause"    # Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/ParseException;-><init>()V

    .line 56
    invoke-virtual {p1}, Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;->getUnexpectedElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    iput-object v0, p0, Lcom/github/zafarkhaja/semver/expr/UnexpectedTokenException;->unexpected:Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 57
    invoke-virtual {p1}, Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;->getExpectedElementTypes()[Lcom/github/zafarkhaja/semver/util/Stream$ElementType;

    move-result-object v0

    check-cast v0, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    check-cast v0, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    iput-object v0, p0, Lcom/github/zafarkhaja/semver/expr/UnexpectedTokenException;->expected:[Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 58
    return-void
.end method


# virtual methods
.method getExpectedTokenTypes()[Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;
    .registers 2

    .prologue
    .line 87
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/expr/UnexpectedTokenException;->expected:[Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    return-object v0
.end method

.method getUnexpectedToken()Lcom/github/zafarkhaja/semver/expr/Lexer$Token;
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/expr/UnexpectedTokenException;->unexpected:Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 99
    const-string v1, "Unexpected token \'%s\'"

    new-array v2, v4, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/github/zafarkhaja/semver/expr/UnexpectedTokenException;->unexpected:Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 103
    .local v0, "message":Ljava/lang/String;
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/expr/UnexpectedTokenException;->expected:[Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    array-length v1, v1

    if-lez v1, :cond_34

    .line 104
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", expecting \'%s\'"

    new-array v3, v4, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/github/zafarkhaja/semver/expr/UnexpectedTokenException;->expected:[Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 106
    invoke-static {v4}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    .line 104
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 109
    :cond_34
    return-object v0
.end method
