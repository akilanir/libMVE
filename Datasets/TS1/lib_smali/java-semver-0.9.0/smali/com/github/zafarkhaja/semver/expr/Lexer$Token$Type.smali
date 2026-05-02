.class final enum Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;
.super Ljava/lang/Enum;
.source "Lexer.java"

# interfaces
.implements Lcom/github/zafarkhaja/semver/util/Stream$ElementType;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/zafarkhaja/semver/expr/Lexer$Token;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;",
        ">;",
        "Lcom/github/zafarkhaja/semver/util/Stream$ElementType",
        "<",
        "Lcom/github/zafarkhaja/semver/expr/Lexer$Token;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

.field public static final enum AND:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

.field public static final enum CARET:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

.field public static final enum DOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

.field public static final enum EOI:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

.field public static final enum EQUAL:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

.field public static final enum GREATER:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

.field public static final enum GREATER_EQUAL:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

.field public static final enum HYPHEN:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

.field public static final enum LEFT_PAREN:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

.field public static final enum LESS:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

.field public static final enum LESS_EQUAL:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

.field public static final enum NOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

.field public static final enum NOT_EQUAL:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

.field public static final enum NUMERIC:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

.field public static final enum OR:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

.field public static final enum RIGHT_PAREN:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

.field public static final enum TILDE:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

.field public static final enum WHITESPACE:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

.field public static final enum WILDCARD:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;


# instance fields
.field final pattern:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 50
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const-string v1, "NUMERIC"

    const-string v2, "0|[1-9][0-9]*"

    invoke-direct {v0, v1, v4, v2}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NUMERIC:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 51
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const-string v1, "DOT"

    const-string v2, "\\."

    invoke-direct {v0, v1, v5, v2}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->DOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 52
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const-string v1, "HYPHEN"

    const-string v2, "-"

    invoke-direct {v0, v1, v6, v2}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->HYPHEN:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 53
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const-string v1, "EQUAL"

    const-string v2, "="

    invoke-direct {v0, v1, v7, v2}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->EQUAL:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 54
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const-string v1, "NOT_EQUAL"

    const-string v2, "!="

    invoke-direct {v0, v1, v8, v2}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NOT_EQUAL:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 55
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const-string v1, "GREATER"

    const/4 v2, 0x5

    const-string v3, ">(?!=)"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->GREATER:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 56
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const-string v1, "GREATER_EQUAL"

    const/4 v2, 0x6

    const-string v3, ">="

    invoke-direct {v0, v1, v2, v3}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->GREATER_EQUAL:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 57
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const-string v1, "LESS"

    const/4 v2, 0x7

    const-string v3, "<(?!=)"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->LESS:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 58
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const-string v1, "LESS_EQUAL"

    const/16 v2, 0x8

    const-string v3, "<="

    invoke-direct {v0, v1, v2, v3}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->LESS_EQUAL:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 59
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const-string v1, "TILDE"

    const/16 v2, 0x9

    const-string v3, "~"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->TILDE:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 60
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const-string v1, "WILDCARD"

    const/16 v2, 0xa

    const-string v3, "[\\*xX]"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->WILDCARD:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 61
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const-string v1, "CARET"

    const/16 v2, 0xb

    const-string v3, "\\^"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->CARET:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 62
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const-string v1, "AND"

    const/16 v2, 0xc

    const-string v3, "&"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->AND:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 63
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const-string v1, "OR"

    const/16 v2, 0xd

    const-string v3, "\\|"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->OR:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 64
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const-string v1, "NOT"

    const/16 v2, 0xe

    const-string v3, "!(?!=)"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 65
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const-string v1, "LEFT_PAREN"

    const/16 v2, 0xf

    const-string v3, "\\("

    invoke-direct {v0, v1, v2, v3}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->LEFT_PAREN:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 66
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const-string v1, "RIGHT_PAREN"

    const/16 v2, 0x10

    const-string v3, "\\)"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->RIGHT_PAREN:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 67
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const-string v1, "WHITESPACE"

    const/16 v2, 0x11

    const-string v3, "\\s+"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->WHITESPACE:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 68
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const-string v1, "EOI"

    const/16 v2, 0x12

    const-string v3, "?!"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->EOI:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .line 48
    const/16 v0, 0x13

    new-array v0, v0, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v1, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NUMERIC:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v1, v0, v4

    sget-object v1, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->DOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v1, v0, v5

    sget-object v1, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->HYPHEN:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v1, v0, v6

    sget-object v1, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->EQUAL:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v1, v0, v7

    sget-object v1, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NOT_EQUAL:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->GREATER:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->GREATER_EQUAL:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->LESS:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->LESS_EQUAL:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->TILDE:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->WILDCARD:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->CARET:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->AND:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->OR:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->LEFT_PAREN:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->RIGHT_PAREN:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->WHITESPACE:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->EOI:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v0, v1

    sput-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->$VALUES:[Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 6
    .param p3, "regexp"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 82
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "^("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    iput-object v0, p0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->pattern:Ljava/util/regex/Pattern;

    .line 84
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 48
    const-class v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    return-object v0
.end method

.method public static values()[Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;
    .registers 1

    .prologue
    .line 48
    sget-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->$VALUES:[Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    invoke-virtual {v0}, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    return-object v0
.end method


# virtual methods
.method public isMatchedBy(Lcom/github/zafarkhaja/semver/expr/Lexer$Token;)Z
    .registers 4
    .param p1, "token"    # Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .prologue
    const/4 v0, 0x0

    .line 101
    if-nez p1, :cond_4

    .line 104
    :cond_3
    :goto_3
    return v0

    :cond_4
    iget-object v1, p1, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->type:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    if-ne p0, v1, :cond_3

    const/4 v0, 0x1

    goto :goto_3
.end method

.method public bridge synthetic isMatchedBy(Ljava/lang/Object;)Z
    .registers 3

    .prologue
    .line 48
    check-cast p1, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    invoke-virtual {p0, p1}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->isMatchedBy(Lcom/github/zafarkhaja/semver/expr/Lexer$Token;)Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->pattern:Ljava/util/regex/Pattern;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
