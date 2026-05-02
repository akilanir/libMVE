.class Lcom/github/zafarkhaja/semver/expr/Lexer;
.super Ljava/lang/Object;
.source "Lexer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/zafarkhaja/semver/expr/Lexer$Token;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 187
    return-void
.end method


# virtual methods
.method tokenize(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/util/Stream;
    .registers 11
    .param p1, "input"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/github/zafarkhaja/semver/util/Stream",
            "<",
            "Lcom/github/zafarkhaja/semver/expr/Lexer$Token;",
            ">;"
        }
    .end annotation

    .prologue
    .line 197
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 198
    .local v4, "tokens":Ljava/util/List;, "Ljava/util/List<Lcom/github/zafarkhaja/semver/expr/Lexer$Token;>;"
    const/4 v2, 0x0

    .line 199
    .local v2, "tokenPos":I
    :cond_6
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_4a

    .line 200
    const/4 v0, 0x0

    .line 201
    .local v0, "matched":Z
    invoke-static {}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->values()[Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    move-result-object v6

    array-length v7, v6

    const/4 v5, 0x0

    :goto_13
    if-ge v5, v7, :cond_3f

    aget-object v3, v6, v5

    .line 202
    .local v3, "tokenType":Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;
    iget-object v8, v3, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->pattern:Ljava/util/regex/Pattern;

    invoke-virtual {v8, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 203
    .local v1, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_47

    .line 204
    const/4 v0, 0x1

    .line 205
    const-string v5, ""

    invoke-virtual {v1, v5}, Ljava/util/regex/Matcher;->replaceFirst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 206
    sget-object v5, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->WHITESPACE:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    if-eq v3, v5, :cond_3a

    .line 207
    new-instance v5, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 209
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v3, v6, v2}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;-><init>(Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;Ljava/lang/String;I)V

    .line 207
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 213
    :cond_3a
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result v5

    add-int/2addr v2, v5

    .line 217
    .end local v1    # "matcher":Ljava/util/regex/Matcher;
    .end local v3    # "tokenType":Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;
    :cond_3f
    if-nez v0, :cond_6

    .line 218
    new-instance v5, Lcom/github/zafarkhaja/semver/expr/LexerException;

    invoke-direct {v5, p1}, Lcom/github/zafarkhaja/semver/expr/LexerException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 201
    .restart local v1    # "matcher":Ljava/util/regex/Matcher;
    .restart local v3    # "tokenType":Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;
    :cond_47
    add-int/lit8 v5, v5, 0x1

    goto :goto_13

    .line 221
    .end local v0    # "matched":Z
    .end local v1    # "matcher":Ljava/util/regex/Matcher;
    .end local v3    # "tokenType":Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;
    :cond_4a
    new-instance v5, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    sget-object v6, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->EOI:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const/4 v7, 0x0

    invoke-direct {v5, v6, v7, v2}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;-><init>(Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;Ljava/lang/String;I)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 222
    new-instance v5, Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    new-array v6, v6, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    invoke-interface {v4, v6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/github/zafarkhaja/semver/util/Stream;-><init>([Ljava/lang/Object;)V

    return-object v5
.end method
