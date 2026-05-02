.class Lcom/github/zafarkhaja/semver/expr/And;
.super Ljava/lang/Object;
.source "And.java"

# interfaces
.implements Lcom/github/zafarkhaja/semver/expr/Expression;


# instance fields
.field private final left:Lcom/github/zafarkhaja/semver/expr/Expression;

.field private final right:Lcom/github/zafarkhaja/semver/expr/Expression;


# direct methods
.method constructor <init>(Lcom/github/zafarkhaja/semver/expr/Expression;Lcom/github/zafarkhaja/semver/expr/Expression;)V
    .registers 3
    .param p1, "left"    # Lcom/github/zafarkhaja/semver/expr/Expression;
    .param p2, "right"    # Lcom/github/zafarkhaja/semver/expr/Expression;

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lcom/github/zafarkhaja/semver/expr/And;->left:Lcom/github/zafarkhaja/semver/expr/Expression;

    .line 55
    iput-object p2, p0, Lcom/github/zafarkhaja/semver/expr/And;->right:Lcom/github/zafarkhaja/semver/expr/Expression;

    .line 56
    return-void
.end method


# virtual methods
.method public interpret(Lcom/github/zafarkhaja/semver/Version;)Z
    .registers 3
    .param p1, "version"    # Lcom/github/zafarkhaja/semver/Version;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/expr/And;->left:Lcom/github/zafarkhaja/semver/expr/Expression;

    invoke-interface {v0, p1}, Lcom/github/zafarkhaja/semver/expr/Expression;->interpret(Lcom/github/zafarkhaja/semver/Version;)Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/github/zafarkhaja/semver/expr/And;->right:Lcom/github/zafarkhaja/semver/expr/Expression;

    invoke-interface {v0, p1}, Lcom/github/zafarkhaja/semver/expr/Expression;->interpret(Lcom/github/zafarkhaja/semver/Version;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method
