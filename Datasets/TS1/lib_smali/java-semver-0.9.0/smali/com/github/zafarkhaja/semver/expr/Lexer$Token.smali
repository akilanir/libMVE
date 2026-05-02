.class Lcom/github/zafarkhaja/semver/expr/Lexer$Token;
.super Ljava/lang/Object;
.source "Lexer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/zafarkhaja/semver/expr/Lexer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Token"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;
    }
.end annotation


# instance fields
.field final lexeme:Ljava/lang/String;

.field final position:I

.field final type:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;


# direct methods
.method constructor <init>(Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;Ljava/lang/String;I)V
    .registers 4
    .param p1, "type"    # Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;
    .param p2, "lexeme"    # Ljava/lang/String;
    .param p3, "position"    # I

    .prologue
    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 132
    iput-object p1, p0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->type:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 133
    if-nez p2, :cond_9

    const-string p2, ""

    .end local p2    # "lexeme":Ljava/lang/String;
    :cond_9
    iput-object p2, p0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->lexeme:Ljava/lang/String;

    .line 134
    iput p3, p0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->position:I

    .line 135
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 142
    if-ne p0, p1, :cond_5

    .line 151
    :cond_4
    :goto_4
    return v1

    .line 145
    :cond_5
    instance-of v3, p1, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    if-nez v3, :cond_b

    move v1, v2

    .line 146
    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 148
    check-cast v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 149
    .local v0, "token":Lcom/github/zafarkhaja/semver/expr/Lexer$Token;
    iget-object v3, p0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->type:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    iget-object v4, v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->type:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 150
    invoke-virtual {v3, v4}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_28

    iget-object v3, p0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->lexeme:Ljava/lang/String;

    iget-object v4, v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->lexeme:Ljava/lang/String;

    .line 151
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_28

    iget v3, p0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->position:I

    iget v4, v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->position:I

    if-eq v3, v4, :cond_4

    :cond_28
    move v1, v2

    goto :goto_4
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 160
    const/4 v0, 0x5

    .line 161
    .local v0, "hash":I
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->type:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    invoke-virtual {v1}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->hashCode()I

    move-result v1

    add-int/lit16 v0, v1, 0x163

    .line 162
    mul-int/lit8 v1, v0, 0x47

    iget-object v2, p0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->lexeme:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 163
    mul-int/lit8 v1, v0, 0x47

    iget v2, p0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->position:I

    add-int v0, v1, v2

    .line 164
    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 174
    const-string v0, "%s(%s) at position %d"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->type:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 176
    invoke-virtual {v3}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->name()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->lexeme:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget v3, p0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->position:I

    .line 177
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    .line 174
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
