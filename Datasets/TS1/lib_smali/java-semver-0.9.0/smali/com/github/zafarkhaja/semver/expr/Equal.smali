.class Lcom/github/zafarkhaja/semver/expr/Equal;
.super Ljava/lang/Object;
.source "Equal.java"

# interfaces
.implements Lcom/github/zafarkhaja/semver/expr/Expression;


# instance fields
.field private final parsedVersion:Lcom/github/zafarkhaja/semver/Version;


# direct methods
.method constructor <init>(Lcom/github/zafarkhaja/semver/Version;)V
    .registers 2
    .param p1, "parsedVersion"    # Lcom/github/zafarkhaja/semver/Version;

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/github/zafarkhaja/semver/expr/Equal;->parsedVersion:Lcom/github/zafarkhaja/semver/Version;

    .line 48
    return-void
.end method


# virtual methods
.method public interpret(Lcom/github/zafarkhaja/semver/Version;)Z
    .registers 3
    .param p1, "version"    # Lcom/github/zafarkhaja/semver/Version;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/expr/Equal;->parsedVersion:Lcom/github/zafarkhaja/semver/Version;

    invoke-virtual {p1, v0}, Lcom/github/zafarkhaja/semver/Version;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
